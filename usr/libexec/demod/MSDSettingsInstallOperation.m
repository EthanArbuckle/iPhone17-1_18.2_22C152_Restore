@interface MSDSettingsInstallOperation
- (BOOL)_applySettingToDevice;
- (BOOL)_saveDisplaySettings;
- (BOOL)_updateLocale;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDSettingsInstallOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly])
  {
    v2 = +[NSArray array];
  }
  else
  {
    v3 = +[NSValue valueWithPointer:"_applySettingToDevice"];
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, 0);
  }

  return v2;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_applySettingToDevice
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSDOperation *)self context];
    v5 = [v4 identifier];
    int v14 = 136315394;
    v15 = "-[MSDSettingsInstallOperation _applySettingToDevice]";
    __int16 v16 = 2114;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - identifier %{public}@", (uint8_t *)&v14, 0x16u);
  }
  v6 = [(MSDOperation *)self context];
  v7 = [v6 identifier];
  unsigned int v8 = [v7 isEqual:@"locale"];

  if (v8) {
    return [(MSDSettingsInstallOperation *)self _updateLocale];
  }
  v10 = [(MSDOperation *)self context];
  v11 = [v10 identifier];
  unsigned int v12 = [v11 isEqualToString:@"display"];

  if (v12) {
    return [(MSDSettingsInstallOperation *)self _saveDisplaySettings];
  }
  v13 = sub_100068600();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000DC8F4(self, v13);
  }

  return 0;
}

- (BOOL)_updateLocale
{
  v3 = [(MSDOperation *)self context];
  v4 = [v3 dataDict];
  v5 = [v4 objectForKey:@"language"];

  v6 = [(MSDOperation *)self context];
  v7 = [v6 dataDict];
  unsigned int v8 = [v7 objectForKey:@"region"];

  if (v5 && v8)
  {
    v27[0] = @"language";
    v27[1] = @"region";
    v28[0] = v5;
    v28[1] = v8;
    v9 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[MSDSettingsInstallOperation _updateLocale]";
      __int16 v23 = 2114;
      v24 = v5;
      __int16 v25 = 2114;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s language: %{public}@ region: %{public}@", (uint8_t *)&v21, 0x20u);
    }

    v11 = +[MSDPreferencesFile sharedInstance];
    unsigned __int8 v12 = [v11 setObject:v9 forKey:@"locale"];
  }
  else
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DCA30(v9, v13, v14, v15, v16, v17, v18, v19);
    }
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)_saveDisplaySettings
{
  v2 = [(MSDOperation *)self context];
  v3 = [v2 dataDict];
  v4 = [v3 objectForKey:@"HDR"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[MSDSettingsInstallOperation _saveDisplaySettings]";
      __int16 v19 = 1024;
      unsigned int v20 = [v4 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - HDR setting:  %{BOOL}d", (uint8_t *)&v17, 0x12u);
    }

    v6 = +[MSDPreferencesFile sharedInstance];
    [v6 setObject:v4 forKey:@"HDR"];

    BOOL v7 = 1;
  }
  else
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DCAA8(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v7 = 0;
  }

  return v7;
}

@end