@interface MOContextDefaultsManager
- (id)objectForKey:(id)a3;
- (void)deleteObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MOContextDefaultsManager

- (id)objectForKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    v5 = [v4 objectForKey:v3];
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityContextDefaults);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(MOContextDefaultsManager *)(uint64_t)v3 objectForKey:v6];
    }
  }
  else
  {
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityContextDefaults);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOContextDefaultsManager objectForKey:](v4, v7, v8, v9, v10, v11, v12, v13);
    }
    v5 = 0;
  }

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityContextDefaults);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315650;
      v17 = "-[MOContextDefaultsManager setObject:forKey:]";
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s, key, %@, value, %@", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:v5 forKey:v6];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[MOContextDefaultsManager setObject:forKey:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

- (void)deleteObjectForKey:(id)a3
{
  id v3 = a3;
  v4 = _mo_log_facility_get_os_log(&MOLogFacilityContextDefaults);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[MOContextDefaultsManager deleteObjectForKey:]";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s, deleting key, %@", (uint8_t *)&v13, 0x16u);
    }

    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 removeObjectForKey:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[MOContextDefaultsManager deleteObjectForKey:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)objectForKey:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  v4 = "-[MOContextDefaultsManager objectForKey:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s, key, %@, value, %@", (uint8_t *)&v3, 0x20u);
}

- (void)setObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteObjectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end