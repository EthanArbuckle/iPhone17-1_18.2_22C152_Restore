@interface AUDeveloperSettingsDatabase
+ (id)sharedDatabase;
- (AUDeveloperSettingsDatabase)init;
- (BOOL)isSeedParticipationEnabled:(id)a3;
- (BOOL)isValidLocationType:(unint64_t)a3;
- (NSDictionary)accessoriesDictionary;
- (id)seedParticipationDictionary;
- (unint64_t)urlLocationTypeForAccessory:(id)a3;
- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6;
- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4;
- (void)migrateExistingDefaults;
- (void)removeAccessoryWithSerialNumber:(id)a3;
- (void)setAccessoriesDictionary:(id)a3;
- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4;
@end

@implementation AUDeveloperSettingsDatabase

+ (id)sharedDatabase
{
  if (qword_100096338 != -1) {
    dispatch_once(&qword_100096338, &stru_10007D0C0);
  }
  v2 = (void *)qword_100096330;
  return v2;
}

- (AUDeveloperSettingsDatabase)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUDeveloperSettingsDatabase;
  v2 = [(AUDeveloperSettingsDatabase *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create((const char *)[@"com.apple.AUDeveloperSettings" UTF8String], "default");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    [(AUDeveloperSettingsDatabase *)v2 migrateExistingDefaults];
  }
  return v2;
}

- (void)setAccessoriesDictionary:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_10004F2BC((uint64_t)v4, log);
  }
  +[NSUserDefaults AUDeveloperSettingsSetObject:v4 withKey:@"accessories"];
}

- (NSDictionary)accessoriesDictionary
{
  id v3 = +[NSUserDefaults AUDeveloperSettingsObjectWithKey:@"accessories"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3) {
      goto LABEL_8;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10004F3D8();
    }
  }
  id v3 = objc_alloc_init((Class)NSDictionary);
LABEL_8:
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10004F358();
  }
  return (NSDictionary *)v3;
}

- (BOOL)isSeedParticipationEnabled:(id)a3
{
  return (id)[(AUDeveloperSettingsDatabase *)self urlLocationTypeForAccessory:a3] == (id)3;
}

- (unint64_t)urlLocationTypeForAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 objectForKeyedSubscript:@"assetLocation"];
  unint64_t v8 = sub_10000624C(v7);

  return v8;
}

- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4
{
  id v6 = a3;
  if ([(AUDeveloperSettingsDatabase *)self isValidLocationType:a4])
  {
    v7 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
    unint64_t v8 = [v7 objectForKeyedSubscript:v6];
    id v9 = [v8 mutableCopy];

    v10 = +[NSString stringWithUTF8String:sub_100006228(a4)];
    [v9 setObject:v10 forKeyedSubscript:@"assetLocation"];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = log;
      v13 = sub_100006228(a4);
      v14 = [v9 objectForKeyedSubscript:@"name"];
      int v16 = 136315650;
      v17 = "-[AUDeveloperSettingsDatabase updateAccessory:locationType:]";
      __int16 v18 = 2080;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Updating location = %s for accessoryName = %@", (uint8_t *)&v16, 0x20u);
    }
    v15 = +[NSDictionary dictionaryWithDictionary:v9];
    [(AUDeveloperSettingsDatabase *)self addAccessoryWithSerialNumber:v6 info:v15];
  }
}

- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    unint64_t v8 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
    id v9 = [v8 mutableCopy];

    [v9 setObject:v7 forKeyedSubscript:v6];
    [(AUDeveloperSettingsDatabase *)self setAccessoriesDictionary:v9];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Not adding empty serial number with info = %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)removeAccessoryWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  [(AUDeveloperSettingsDatabase *)self setAccessoriesDictionary:v6];
}

- (BOOL)isValidLocationType:(unint64_t)a3
{
  return a3 < 7;
}

- (void)migrateExistingDefaults
{
  v2 = [(AUDeveloperSettingsDatabase *)self seedParticipationDictionary];
  id v3 = [v2 mutableCopy];

  if ([v3 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v3;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v10 = [v4 objectForKeyedSubscript:v9];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v24 = 0;
            unint64_t v25 = 4;
            id v23 = 0;
            [(AUDeveloperSettingsDatabase *)self accessoryNameForIdentifier:v9 name:&v24 serialNumber:&v23 fusingType:&v25];
            id v12 = v24;
            id v13 = v23;
            if (v13)
            {
              id v14 = [(AUDeveloperSettingsDatabase *)self accessoriesDictionary];
              v15 = [v14 allKeys];
              unsigned __int8 v16 = [v15 containsObject:v13];

              if ((v16 & 1) == 0)
              {
                v17 = +[NSMutableDictionary dictionary];
                __int16 v18 = [v4 objectForKeyedSubscript:v9];
                [v17 setObject:v18 forKeyedSubscript:@"assetLocation"];

                if (v12) {
                  [v17 setObject:v12 forKeyedSubscript:@"name"];
                }
                if (v25 <= 2)
                {
                  v19 = +[NSString stringWithUTF8String:sub_1000060EC(v25)];
                  [v17 setObject:v19 forKeyedSubscript:@"fusing"];
                }
                __int16 v20 = +[NSDictionary dictionaryWithDictionary:v17];
                [(AUDeveloperSettingsDatabase *)self addAccessoryWithSerialNumber:v13 info:v20];
              }
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }

    id v3 = v21;
  }
}

- (id)seedParticipationDictionary
{
  id v3 = +[NSUserDefaults AUDeveloperSettingsObjectWithKey:@"seedParticipation"];
  if (!v3) {
    id v3 = objc_alloc_init((Class)NSDictionary);
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10004F458();
  }
  return v3;
}

- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6
{
  id v14 = [a3 componentsSeparatedByString:@"+"];
  BOOL v9 = [v14 count] == (id)3;
  v10 = v14;
  if (v9)
  {
    if (a6)
    {
      int v11 = [v14 objectAtIndexedSubscript:0];
      *a6 = sub_100006110(v11);
    }
    if (a5)
    {
      id v12 = [v14 objectAtIndexedSubscript:1];
      *a5 = [v12 copy];
    }
    v10 = v14;
    if (a4)
    {
      id v13 = [v14 objectAtIndexedSubscript:2];
      *a4 = [v13 copy];

      v10 = v14;
    }
  }
}

- (void).cxx_destruct
{
}

@end