package com.purchase.config;


import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.github.pagehelper.PageInterceptor;
import com.mybaits.jpa.util.MyBaitsJpaContext;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

/**
 * Created by Miracle on 2020/8/12.
 */

@Configuration
@MapperScan("com.purchase.dao")
@EnableTransactionManagement
public class MybatisPlusConfig {

    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor=new PaginationInterceptor();
        paginationInterceptor.plugin(new PageInterceptor());
        return paginationInterceptor;
    }

    /**
     * 配置分页插件
     * @return
     */
    @Bean
    public PageInterceptor pageInterceptor(){
        PageInterceptor  pageInterceptor = new PageInterceptor();
        Properties properties = new Properties();
        properties.setProperty("reasonable","true");
        pageInterceptor.setProperties(properties);
        return pageInterceptor;
    }

    /**
     * 配置sql性能监控插件
     * @return
     */
    @Bean
    public MyBatisPlusSqlRunTimeIntercept plusSqlRunTimeIntercept(){
        MyBatisPlusSqlRunTimeIntercept  plusSqlRunTimeIntercept = new MyBatisPlusSqlRunTimeIntercept();
        Properties properties = new Properties();
        properties.setProperty("reasonable","true");
        plusSqlRunTimeIntercept.setProperties(properties);
        return plusSqlRunTimeIntercept;
    }


    @Bean
    public MyBaitsJpaContext myBaitsJpaContext(){
        MyBaitsJpaContext  myBaitsJpaContext = new MyBaitsJpaContext();
        return myBaitsJpaContext;
    }

}
