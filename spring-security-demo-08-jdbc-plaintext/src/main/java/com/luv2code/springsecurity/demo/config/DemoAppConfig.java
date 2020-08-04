package com.luv2code.springsecurity.demo.config;

import java.beans.PropertyVetoException;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.luv2code.springsecurity.demo")
@PropertySource("classpath:persistence-mysql.properties")
public class DemoAppConfig {

	// set up variable to hold the properties
	@Autowired
	private Environment env;

	// setup logger for diagnostics

	private Logger logger = Logger.getLogger(getClass().getName());

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	@Bean
	public DataSource securityDataSource() {

		// create connection pool
		ComboPooledDataSource securityComboPooledDataSource = new ComboPooledDataSource();

		// set jdbc driver class
		try {
			securityComboPooledDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}
		// log the connection props
		logger.info(">>>jdbc.url" + env.getProperty("jdbc.url"));
		logger.info(">>>jdbc.user" + env.getProperty("jdbc.user"));

		// set database connection props
		securityComboPooledDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		securityComboPooledDataSource.setUser(env.getProperty("jdbc.user"));
		securityComboPooledDataSource.setPassword(env.getProperty("jdbc.password"));

		securityComboPooledDataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
		securityComboPooledDataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
		securityComboPooledDataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));

		return securityComboPooledDataSource;
	}

	// read environment property and convert to int

	private int getIntProperty(String propName) {
		String propValString = env.getProperty(propName);

		int intPropVal = Integer.parseInt(propValString);

		return intPropVal;

	}

}
