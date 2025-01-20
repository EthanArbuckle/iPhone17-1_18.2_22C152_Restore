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
  if (qword_10002F9D8 != -1) {
    dispatch_once(&qword_10002F9D8, &stru_1000252E0);
  }
  return (id)qword_10002F9D0;
}

- (AUDeveloperSettingsDatabase)init
{
  v4.receiver = self;
  v4.super_class = (Class)AUDeveloperSettingsDatabase;
  v2 = [(AUDeveloperSettingsDatabase *)&v4 init];
  if (v2)
  {
    v2->_log = (OS_os_log *)os_log_create((const char *)[@"com.apple.AUDeveloperSettings" UTF8String], "default");
    [(AUDeveloperSettingsDatabase *)v2 migrateExistingDefaults];
  }
  return v2;
}

- (void)setAccessoriesDictionary:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_100014024((uint64_t)a3, log);
  }
  +[NSUserDefaults AUDeveloperSettingsSetObject:a3 withKey:@"accessories"];
}

- (NSDictionary)accessoriesDictionary
{
  v3 = +[NSUserDefaults AUDeveloperSettingsObjectWithKey:@"accessories"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3) {
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100014140();
  }
  v3 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
LABEL_7:
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000140C0();
  }
  return v3;
}

- (BOOL)isSeedParticipationEnabled:(id)a3
{
  return (id)[(AUDeveloperSettingsDatabase *)self urlLocationTypeForAccessory:a3] == (id)3;
}

- (unint64_t)urlLocationTypeForAccessory:(id)a3
{
  id v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", @"assetLocation");
  return AUDeveloperSettingsURLStringToType(v3);
}

- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4
{
  if ([(AUDeveloperSettingsDatabase *)self isValidLocationType:a4])
  {
    id v7 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"), "objectForKeyedSubscript:", a3), "mutableCopy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(a4)), @"assetLocation");
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      v10 = "-[AUDeveloperSettingsDatabase updateAccessory:locationType:]";
      __int16 v11 = 2080;
      v12 = AUDeveloperSettingsURLTypeToString(a4);
      __int16 v13 = 2112;
      id v14 = [v7 objectForKeyedSubscript:@"name"];
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Updating location = %s for accessoryName = %@", (uint8_t *)&v9, 0x20u);
    }
    [(AUDeveloperSettingsDatabase *)self addAccessoryWithSerialNumber:a3 info:+[NSDictionary dictionaryWithDictionary:v7]];
  }
}

- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4
{
  if ([a3 length])
  {
    id v7 = [(NSDictionary *)[(AUDeveloperSettingsDatabase *)self accessoriesDictionary] mutableCopy];
    [v7 setObject:a4 forKeyedSubscript:a3];
    [(AUDeveloperSettingsDatabase *)self setAccessoriesDictionary:v7];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]";
      __int16 v11 = 2112;
      id v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Not adding empty serial number with info = %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)removeAccessoryWithSerialNumber:(id)a3
{
  id v5 = [(NSDictionary *)[(AUDeveloperSettingsDatabase *)self accessoriesDictionary] mutableCopy];
  [v5 removeObjectForKey:a3];
  [(AUDeveloperSettingsDatabase *)self setAccessoriesDictionary:v5];
}

- (BOOL)isValidLocationType:(unint64_t)a3
{
  return a3 < 7;
}

- (void)migrateExistingDefaults
{
  id v3 = objc_msgSend(-[AUDeveloperSettingsDatabase seedParticipationDictionary](self, "seedParticipationDictionary"), "mutableCopy");
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          [v3 objectForKeyedSubscript:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = 0;
            uint64_t v13 = 0;
            unint64_t v11 = 4;
            [(AUDeveloperSettingsDatabase *)self accessoryNameForIdentifier:v8 name:&v13 serialNumber:&v12 fusingType:&v11];
            if (v12)
            {
              int v9 = [(NSDictionary *)[(AUDeveloperSettingsDatabase *)self accessoriesDictionary] allKeys];
              if (![(NSArray *)v9 containsObject:v12])
              {
                id v10 = +[NSMutableDictionary dictionary];
                objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v8), @"assetLocation");
                if (v13) {
                  [v10 setObject:v13 forKeyedSubscript:@"name"];
                }
                if (v11 <= 2) {
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", AUDeveloperSettingsAccessoryFusingTypeToString(v11)), @"fusing");
                }
                [(AUDeveloperSettingsDatabase *)self addAccessoryWithSerialNumber:v12 info:+[NSDictionary dictionaryWithDictionary:v10]];
              }
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
  }
}

- (id)seedParticipationDictionary
{
  id v3 = +[NSUserDefaults AUDeveloperSettingsObjectWithKey:@"seedParticipation"];
  if (!v3) {
    id v3 = objc_alloc_init((Class)NSDictionary);
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000141C0();
  }
  return v3;
}

- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6
{
  id v9 = [a3 componentsSeparatedByString:@"+"];
  if ([v9 count] == (id)3)
  {
    if (a6) {
      *a6 = AUDeveloperSettingsAccessoryFusingStringToType([v9 objectAtIndexedSubscript:0]);
    }
    if (a5) {
      *a5 = objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", 1), "copy");
    }
    if (a4) {
      *a4 = objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", 2), "copy");
    }
  }
}

@end