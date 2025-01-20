@interface MODefaultsManager
- (MODefaultsManager)init;
- (MODefaultsManager)initWithSuiteName:(id)a3;
- (MODefaultsManager)initWithUniverse:(id)a3;
- (NSUserDefaults)userDefaults;
- (id)objectForKey:(id)a3;
- (id)objectForKeyWithoutLog:(id)a3;
- (void)deleteObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4;
@end

@implementation MODefaultsManager

- (MODefaultsManager)init
{
  return [(MODefaultsManager *)self initWithUniverse:0];
}

- (MODefaultsManager)initWithUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MODefaultsManager;
  v3 = [(MODefaultsManager *)&v7 init];
  if (v3)
  {
    uint64_t v4 = +[NSUserDefaults standardUserDefaults];
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;
  }
  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSUserDefaults *)self->_userDefaults objectForKey:v4];
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(MODefaultsManager *)(uint64_t)v4 objectForKey:v6];
    }
  }
  else
  {
    objc_super v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKey:]();
    }

    v6 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKey:](v6);
    }
    v5 = 0;
  }

  return v5;
}

- (id)objectForKeyWithoutLog:(id)a3
{
  if (a3)
  {
    v3 = -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
  }
  else
  {
    id v4 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKeyWithoutLog:]();
    }

    v5 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKeyWithoutLog:](v5);
    }

    v3 = 0;
  }
  return v3;
}

- (void)deleteObjectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      v8 = "-[MODefaultsManager deleteObjectForKey:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s, deleting key, %@", (uint8_t *)&v7, 0x16u);
    }

    [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v4];
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager deleteObjectForKey:]();
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      v11 = "-[MODefaultsManager setObject:forKey:]";
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s, key, %@, value, %@", (uint8_t *)&v10, 0x20u);
    }

    [(NSUserDefaults *)self->_userDefaults setObject:v6 forKey:v7];
  }
  else
  {
    __int16 v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager setObject:forKey:]();
    }
  }
}

- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    userDefaults = self->_userDefaults;
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", a3);
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager setObjectWithoutLog:forKey:]();
    }
  }
}

- (MODefaultsManager)initWithSuiteName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODefaultsManager;
  v5 = [(MODefaultsManager *)&v9 init];
  if (v5)
  {
    id v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:v4];
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v6;
  }
  return v5;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

- (void)objectForKey:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[MODefaultsManager objectForKey:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s, key cannot be nil!", (uint8_t *)&v1, 0xCu);
}

- (void)objectForKey:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)objectForKey:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[MODefaultsManager objectForKey:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s, key, %@, value, %@", (uint8_t *)&v3, 0x20u);
}

- (void)objectForKeyWithoutLog:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MODefaultsManager objectForKeyWithoutLog:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s, key cannot be nil!", (uint8_t *)&v1, 0xCu);
}

- (void)objectForKeyWithoutLog:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)deleteObjectForKey:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)setObject:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)setObjectWithoutLog:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

@end