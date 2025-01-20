@interface MOConfigurationManagerBase
- (BOOL)getBoolDefaultsForKey:(id)a3 withFallback:(BOOL)a4;
- (BOOL)getBoolSettingForKey:(id)a3 withFallback:(BOOL)a4;
- (BOOL)getBoolTrialLevelForKey:(id)a3 withFallback:(BOOL)a4;
- (MOConfigurationManagerBase)init;
- (MOConfigurationManagerBase)initWithDefaultsManager:(id)a3 enableTrialClient:(BOOL)a4;
- (MODefaultsManager)fDefaultsManager;
- (double)getDoubleDefaultsForKey:(id)a3 withFallback:(double)a4;
- (double)getDoubleSettingForKey:(id)a3 withFallback:(double)a4;
- (double)getDoubleTrialLevelForKey:(id)a3 withFallback:(double)a4;
- (float)getFloatDefaultsForKey:(id)a3 withFallback:(float)a4;
- (float)getFloatSettingForKey:(id)a3 withFallback:(float)a4;
- (float)getFloatTrialLevelForKey:(id)a3 withFallback:(float)a4;
- (id)getStringDefaultsForKey:(id)a3 withFallback:(id)a4;
- (id)getStringSettingForKey:(id)a3 withFallback:(id)a4;
- (id)getStringTrialLevelForKey:(id)a3 withFallback:(id)a4;
- (id)getTrialExperimentIdentifiers;
- (int)getIntegerDefaultsForKey:(id)a3 withFallback:(int)a4;
- (int)getIntegerSettingForKey:(id)a3 withFallback:(int)a4;
- (int)getIntegerTrialLevelForKey:(id)a3 withFallback:(int)a4;
- (void)doTrialSetup;
- (void)setFDefaultsManager:(id)a3;
@end

@implementation MOConfigurationManagerBase

- (MOConfigurationManagerBase)init
{
  v3 = [[MODefaultsManager alloc] initWithSuiteName:@"com.apple.momentsd"];
  v4 = [(MOConfigurationManagerBase *)self initWithDefaultsManager:v3 enableTrialClient:1];

  return v4;
}

- (MOConfigurationManagerBase)initWithDefaultsManager:(id)a3 enableTrialClient:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOConfigurationManagerBase;
  v7 = [(MOConfigurationManagerBase *)&v12 init];
  v8 = v7;
  if (v7)
  {
    [(MOConfigurationManagerBase *)v7 setFDefaultsManager:v6];
    if (v4)
    {
      trialClient = v8->_trialClient;
      v8->_trialClient = 0;

      trialFactorNames = v8->_trialFactorNames;
      v8->_trialFactorNames = 0;

      [(MOConfigurationManagerBase *)v8 doTrialSetup];
    }
  }

  return v8;
}

- (id)getStringDefaultsForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 copy];
  fDefaultsManager = self->_fDefaultsManager;
  id v10 = [v6 copy];
  v11 = [(MODefaultsManager *)fDefaultsManager objectForKey:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 copy];

      id v8 = v12;
    }
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

- (int)getIntegerDefaultsForKey:(id)a3 withFallback:(int)a4
{
  id v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  id v8 = [v6 copy];
  v9 = [(MODefaultsManager *)fDefaultsManager objectForKey:v8];

  unsigned int v10 = a4;
  if (v9)
  {
    objc_opt_class();
    unsigned int v10 = a4;
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = [v9 integerValue];
    }
  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v10;
    __int16 v17 = 1024;
    int v18 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [i:%i] and fallback [i:%i]", (uint8_t *)&v13, 0x18u);
  }

  return v10;
}

- (BOOL)getBoolDefaultsForKey:(id)a3 withFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  id v8 = [v6 copy];
  v9 = [(MODefaultsManager *)fDefaultsManager objectForKey:v8];

  unsigned int v10 = v4;
  if (v9)
  {
    objc_opt_class();
    unsigned int v10 = v4;
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = [v9 BOOLValue];
    }
  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v10;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [b:%i] and fallback [b:%i]", (uint8_t *)&v13, 0x18u);
  }

  return v10;
}

- (float)getFloatDefaultsForKey:(id)a3 withFallback:(float)a4
{
  id v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  id v8 = [v6 copy];
  v9 = [(MODefaultsManager *)fDefaultsManager objectForKey:v8];

  float v10 = a4;
  if (v9)
  {
    objc_opt_class();
    float v10 = a4;
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      float v10 = v11;
    }
  }
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2048;
    double v17 = v10;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [f:%f] and fallback [f:%f]", (uint8_t *)&v14, 0x20u);
  }

  return v10;
}

- (double)getDoubleDefaultsForKey:(id)a3 withFallback:(double)a4
{
  id v6 = a3;
  fDefaultsManager = self->_fDefaultsManager;
  id v8 = [v6 copy];
  v9 = [(MODefaultsManager *)fDefaultsManager objectForKey:v8];

  double v10 = a4;
  if (v9)
  {
    objc_opt_class();
    double v10 = a4;
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      double v10 = v11;
    }
  }
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2048;
    double v17 = v10;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [d:%f] and fallback [d:%f]", (uint8_t *)&v14, 0x20u);
  }

  return v10;
}

- (void)doTrialSetup
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cached factor names: %@", (uint8_t *)&v3, 0xCu);
}

- (id)getStringTrialLevelForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 copy];
  if ([(NSArray *)self->_trialFactorNames containsObject:v6])
  {
    trialClient = self->_trialClient;
    id v10 = [v6 copy];
    double v11 = [(TRIClient *)trialClient levelForFactor:v10 withNamespaceName:@"MOMENTS_TRIAL"];

    if (v11)
    {
      uint64_t v12 = [v11 stringValue];

      id v8 = (id)v12;
    }
  }
  int v13 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

- (int)getIntegerTrialLevelForKey:(id)a3 withFallback:(int)a4
{
  id v6 = a3;
  unsigned int v7 = a4;
  if ([(NSArray *)self->_trialFactorNames containsObject:v6])
  {
    trialClient = self->_trialClient;
    id v9 = [v6 copy];
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"MOMENTS_TRIAL"];

    unsigned int v7 = a4;
    if (v10)
    {
      unsigned int v7 = a4;
      if ([v10 levelOneOfCase] == 13) {
        unsigned int v7 = [v10 longValue];
      }
    }
  }
  double v11 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    __int16 v17 = 1024;
    int v18 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [i:%i] and fallback [i:%i]", (uint8_t *)&v13, 0x18u);
  }

  return v7;
}

- (BOOL)getBoolTrialLevelForKey:(id)a3 withFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = v4;
  if ([(NSArray *)self->_trialFactorNames containsObject:v6])
  {
    trialClient = self->_trialClient;
    id v9 = [v6 copy];
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"MOMENTS_TRIAL"];

    unsigned int v7 = v4;
    if (v10)
    {
      unsigned int v11 = [v10 levelOneOfCase];
      if (v11 == 13)
      {
        unsigned int v7 = [v10 longValue] != 0;
      }
      else
      {
        unsigned int v7 = v4;
        if (v11 == 10) {
          unsigned int v7 = [v10 BOOLeanValue];
        }
      }
    }
  }
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [b:%i] and fallback [b:%i]", (uint8_t *)&v14, 0x18u);
  }

  return v7;
}

- (float)getFloatTrialLevelForKey:(id)a3 withFallback:(float)a4
{
  id v6 = a3;
  float v7 = a4;
  if ([(NSArray *)self->_trialFactorNames containsObject:v6])
  {
    trialClient = self->_trialClient;
    id v9 = [v6 copy];
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"MOMENTS_TRIAL"];

    float v7 = a4;
    if (v10)
    {
      float v7 = a4;
      if ([v10 levelOneOfCase] == 15)
      {
        [v10 doubleValue];
        float v7 = v11;
      }
    }
  }
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2048;
    double v17 = v7;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [f:%f] and fallback [f:%f]", (uint8_t *)&v14, 0x20u);
  }

  return v7;
}

- (double)getDoubleTrialLevelForKey:(id)a3 withFallback:(double)a4
{
  id v6 = a3;
  double v7 = a4;
  if ([(NSArray *)self->_trialFactorNames containsObject:v6])
  {
    trialClient = self->_trialClient;
    id v9 = [v6 copy];
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"MOMENTS_TRIAL"];

    double v7 = a4;
    if (v10)
    {
      double v7 = a4;
      if ([v10 levelOneOfCase] == 15)
      {
        [v10 doubleValue];
        double v7 = v11;
      }
    }
  }
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2048;
    double v17 = v7;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [d:%f] and fallback [d:%f]", (uint8_t *)&v14, 0x20u);
  }

  return v7;
}

- (id)getTrialExperimentIdentifiers
{
  return [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:@"MOMENTS_TRIAL"];
}

- (id)getStringSettingForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOConfigurationManagerBase *)self getStringTrialLevelForKey:v6 withFallback:v7];
  id v9 = [(MOConfigurationManagerBase *)self getStringDefaultsForKey:v6 withFallback:v8];

  id v10 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (int)getIntegerSettingForKey:(id)a3 withFallback:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = [(MOConfigurationManagerBase *)self getIntegerDefaultsForKey:v6 withFallback:[(MOConfigurationManagerBase *)self getIntegerTrialLevelForKey:v6 withFallback:v4]];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [i:%i] and fallback [i:%i]", (uint8_t *)&v10, 0x18u);
  }

  return v7;
}

- (BOOL)getBoolSettingForKey:(id)a3 withFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(MOConfigurationManagerBase *)self getBoolDefaultsForKey:v6 withFallback:[(MOConfigurationManagerBase *)self getBoolTrialLevelForKey:v6 withFallback:v4]];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v7;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [b:%i] and fallback [b:%i]", (uint8_t *)&v10, 0x18u);
  }

  return v7;
}

- (float)getFloatSettingForKey:(id)a3 withFallback:(float)a4
{
  id v6 = a3;
  *(float *)&double v7 = a4;
  [(MOConfigurationManagerBase *)self getFloatTrialLevelForKey:v6 withFallback:v7];
  -[MOConfigurationManagerBase getFloatDefaultsForKey:withFallback:](self, "getFloatDefaultsForKey:withFallback:", v6);
  float v9 = v8;
  int v10 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2048;
    double v15 = v9;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [f:%f] and fallback [f:%f]", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (double)getDoubleSettingForKey:(id)a3 withFallback:(double)a4
{
  id v6 = a3;
  [(MOConfigurationManagerBase *)self getDoubleTrialLevelForKey:v6 withFallback:a4];
  -[MOConfigurationManagerBase getDoubleDefaultsForKey:withFallback:](self, "getDoubleDefaultsForKey:withFallback:", v6);
  double v8 = v7;
  float v9 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    double v14 = v8;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [d:%lf] and fallback [d:%lf]", (uint8_t *)&v11, 0x20u);
  }

  return v8;
}

- (MODefaultsManager)fDefaultsManager
{
  return (MODefaultsManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFDefaultsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fDefaultsManager, 0);
  objc_storeStrong((id *)&self->_trialFactorNames, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end