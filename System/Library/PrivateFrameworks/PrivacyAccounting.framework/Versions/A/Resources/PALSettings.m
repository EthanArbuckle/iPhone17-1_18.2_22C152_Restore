@interface PALSettings
+ (id)sharedSettings;
- (BOOL)assetIdentifiersPersistenceEnabled;
- (BOOL)loggingEnabled;
- (BOOL)persistenceEnabledForCategory:(id)a3;
- (NSData)saltForMetricsReduction;
- (PALSettings)init;
- (PALSettings)initWithSuiteName:(id)a3;
- (double)lastPreflightCheck;
- (double)saltForMetricsReductionMaxAge;
- (int64_t)accessFilteringPolicy;
- (unint64_t)intervalMetricDifficulty;
- (unint64_t)loggingOptions;
- (void)migrateSettingsFromFile:(id)a3;
- (void)setAccessFilteringPolicy:(int64_t)a3;
- (void)setAssetIdentifiersPersistenceEnabled:(BOOL)a3;
- (void)setIntervalMetricDifficulty:(unint64_t)a3;
- (void)setLastPreflightCheck:(double)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setLoggingOptions:(unint64_t)a3;
- (void)setPersistenceEnabled:(BOOL)a3 forCategory:(id)a4;
- (void)setSaltForMetricsReduction:(id)a3;
- (void)setSaltForMetricsReductionMaxAge:(double)a3;
@end

@implementation PALSettings

+ (id)sharedSettings
{
  if (qword_10001F250 != -1) {
    dispatch_once(&qword_10001F250, &stru_1000187D8);
  }
  v2 = (void *)qword_10001F248;

  return v2;
}

- (PALSettings)init
{
  return [(PALSettings *)self initWithSuiteName:@"com.apple.privacyaccountingd"];
}

- (PALSettings)initWithSuiteName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PALSettings;
  v5 = [(PALSettings *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSUserDefaults);
    v7 = [v4 stringByAppendingString:@".backup-enabled"];
    v8 = (NSUserDefaults *)[v6 initWithSuiteName:v7];
    settingsBackupEnabled = v5->_settingsBackupEnabled;
    v5->_settingsBackupEnabled = v8;

    v10 = [v4 stringByAppendingString:@".backup-disabled"];
    v11 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:v10];
    settingsBackupDisabled = v5->_settingsBackupDisabled;
    v5->_settingsBackupDisabled = v11;

    _CFPreferencesSetBackupDisabled();
    v5->_assetIdentifiersPersistenceEnabled = _os_feature_enabled_impl();
    v5->_saltForMetricsReductionMaxAge = 86400.0;
    v5->_intervalMetricDifficulty = 2;
    v5->_loggingOptions = (unint64_t)+[PALoggingOptionsFactory defaultLoggingOptions];
  }
  return v5;
}

- (void)migrateSettingsFromFile:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    id v13 = 0;
    id v6 = +[PALSettingsPlist settingsFromFile:v4 withError:&v13];
    v7 = v13;
    if (v6)
    {
      -[PALSettings setLoggingEnabled:](self, "setLoggingEnabled:", [v6 loggingEnabled]);
      [v6 lastPreflightCheck];
      -[PALSettings setLastPreflightCheck:](self, "setLastPreflightCheck:");
      v8 = sub_100004A90();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Migrated settings plist: %{public}@", buf, 0xCu);
      }

      v12 = v7;
      unsigned __int8 v9 = [v5 removeItemAtPath:v4 error:&v12];
      v10 = v12;

      if (v9) {
        goto LABEL_14;
      }
      v11 = sub_100004A90();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000050F0();
      }
      v7 = v10;
    }
    else
    {
      v11 = sub_100004A90();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100005088();
      }
    }

    v10 = v7;
LABEL_14:

    goto LABEL_15;
  }
  v10 = sub_100004A90();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100005158((uint64_t)v4, v10);
  }
LABEL_15:
}

- (BOOL)loggingEnabled
{
  return [(NSUserDefaults *)self->_settingsBackupEnabled BOOLForKey:@"PASettingsLoggingEnabled"];
}

- (void)setLoggingEnabled:(BOOL)a3
{
}

- (double)lastPreflightCheck
{
  [(NSUserDefaults *)self->_settingsBackupDisabled doubleForKey:@"PASettingsLastPreflightCheck"];
  return result;
}

- (void)setLastPreflightCheck:(double)a3
{
}

- (int64_t)accessFilteringPolicy
{
  v2 = [(NSUserDefaults *)self->_settingsBackupDisabled objectForKey:@"PASettingsAccessFilteringPolicy"];
  if (_NSIsNSNumber()) {
    int64_t v3 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)setAccessFilteringPolicy:(int64_t)a3
{
}

- (BOOL)persistenceEnabledForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(NSUserDefaults *)self->_settingsBackupDisabled dictionaryForKey:@"PASettingsCategoryPersistenceOverrides"];
  id v6 = [v5 objectForKeyedSubscript:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v7) = [v6 BOOLValue];
  }
  else
  {
    if (qword_10001F270 != -1) {
      dispatch_once(&qword_10001F270, &stru_100018818);
    }
    unsigned int v7 = [(id)qword_10001F268 containsObject:v4] ^ 1;
  }

  return v7;
}

- (void)setPersistenceEnabled:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  settingsBackupDisabled = self->_settingsBackupDisabled;
  id v7 = a4;
  v8 = [(NSUserDefaults *)settingsBackupDisabled dictionaryForKey:@"PASettingsCategoryPersistenceOverrides"];
  id v10 = [v8 mutableCopy];

  unsigned __int8 v9 = +[NSNumber numberWithBool:v4];
  [v10 setObject:v9 forKeyedSubscript:v7];

  [(NSUserDefaults *)self->_settingsBackupDisabled setObject:v10 forKey:@"PASettingsCategoryPersistenceOverrides"];
}

- (void)setSaltForMetricsReduction:(id)a3
{
  self->_saltForMetricsReductionGenerationTimestamp = CFAbsoluteTimeGetCurrent();
}

- (NSData)saltForMetricsReduction
{
  if (!self->_saltForMetricsReduction)
  {
    int64_t v3 = [(NSUserDefaults *)self->_settingsBackupDisabled dataForKey:@"PASettingsSaltForMetricsReduction"];
    saltForMetricsReduction = self->_saltForMetricsReduction;
    self->_saltForMetricsReduction = v3;

    [(NSUserDefaults *)self->_settingsBackupDisabled doubleForKey:@"PASettingsSaltForMetricsReductionGenerationTimestamp"];
    self->_saltForMetricsReductionGenerationTimestamp = v5;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v7 = self->_saltForMetricsReduction;
  if (v7
    && (double Current = vabdd_f64(Current, self->_saltForMetricsReductionGenerationTimestamp),
        Current < self->_saltForMetricsReductionMaxAge))
  {
    v8 = v7;
  }
  else
  {
    +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32, Current);
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, [v9 mutableBytes]);
    if (v10)
    {
      int v11 = v10;
      v12 = sub_100004A90();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_1000051D0(v11, v12);
      }

      id v13 = +[NSData data];
    }
    else
    {
      objc_super v14 = (NSData *)[v9 copy];
      id v15 = self->_saltForMetricsReduction;
      self->_saltForMetricsReduction = v14;

      self->_saltForMetricsReductionGenerationTimestamp = CFAbsoluteTimeGetCurrent();
      [(NSUserDefaults *)self->_settingsBackupDisabled setObject:v9 forKey:@"PASettingsSaltForMetricsReduction"];
      [(NSUserDefaults *)self->_settingsBackupDisabled setDouble:@"PASettingsSaltForMetricsReductionGenerationTimestamp" forKey:self->_saltForMetricsReductionGenerationTimestamp];
      id v13 = self->_saltForMetricsReduction;
    }
    v8 = v13;
  }

  return v8;
}

- (BOOL)assetIdentifiersPersistenceEnabled
{
  return self->_assetIdentifiersPersistenceEnabled;
}

- (void)setAssetIdentifiersPersistenceEnabled:(BOOL)a3
{
  self->_assetIdentifiersPersistenceEnabled = a3;
}

- (double)saltForMetricsReductionMaxAge
{
  return self->_saltForMetricsReductionMaxAge;
}

- (void)setSaltForMetricsReductionMaxAge:(double)a3
{
  self->_saltForMetricsReductionMaxAge = a3;
}

- (unint64_t)intervalMetricDifficulty
{
  return self->_intervalMetricDifficulty;
}

- (void)setIntervalMetricDifficulty:(unint64_t)a3
{
  self->_intervalMetricDifficulty = a3;
}

- (unint64_t)loggingOptions
{
  return self->_loggingOptions;
}

- (void)setLoggingOptions:(unint64_t)a3
{
  self->_loggingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saltForMetricsReduction, 0);
  objc_storeStrong((id *)&self->_settingsBackupDisabled, 0);

  objc_storeStrong((id *)&self->_settingsBackupEnabled, 0);
}

@end