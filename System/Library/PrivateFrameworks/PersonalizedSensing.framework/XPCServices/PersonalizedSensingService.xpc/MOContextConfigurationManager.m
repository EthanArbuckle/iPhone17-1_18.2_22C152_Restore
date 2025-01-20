@interface MOContextConfigurationManager
- (BOOL)getBoolDefaultsForKey:(id)a3 withFallback:(BOOL)a4;
- (BOOL)getBoolSettingForKey:(id)a3 withFallback:(BOOL)a4;
- (BOOL)getBoolTrialLevelForKey:(id)a3 withFallback:(BOOL)a4;
- (MOContextConfigurationManager)init;
- (MOContextDefaultsManager)defaultsManager;
- (double)getDoubleDefaultsForKey:(id)a3 withFallback:(double)a4;
- (double)getDoubleSettingForKey:(id)a3 withFallback:(double)a4;
- (double)getDoubleTrialLevelForKey:(id)a3 withFallback:(double)a4;
- (float)getFloatDefaultsForKey:(id)a3 withFallback:(float)a4;
- (float)getFloatSettingForKey:(id)a3 withFallback:(float)a4;
- (float)getFloatTrialLevelForKey:(id)a3 withFallback:(float)a4;
- (id)getFilePathDefaultsForKey:(id)a3 withFallback:(id)a4;
- (id)getFilePathSettingForKey:(id)a3 withFallback:(id)a4;
- (id)getFilePathTrialLevelForKey:(id)a3 withFallback:(id)a4;
- (id)getStringDefaultsForKey:(id)a3 withFallback:(id)a4;
- (id)getStringSettingForKey:(id)a3 withFallback:(id)a4;
- (id)getStringTrialLevelForKey:(id)a3 withFallback:(id)a4;
- (id)getTrialExperimentIdentifiers;
- (int)getIntegerDefaultsForKey:(id)a3 withFallback:(int)a4;
- (int)getIntegerSettingForKey:(id)a3 withFallback:(int)a4;
- (int)getIntegerTrialLevelForKey:(id)a3 withFallback:(int)a4;
- (void)doTrialSetup;
- (void)setDefaultsManager:(id)a3;
@end

@implementation MOContextConfigurationManager

- (MOContextConfigurationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOContextConfigurationManager;
  v2 = [(MOContextConfigurationManager *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(MOContextDefaultsManager);
    [(MOContextConfigurationManager *)v2 setDefaultsManager:v3];

    trialClient = v2->_trialClient;
    v2->_trialClient = 0;

    trialFactorNames = v2->_trialFactorNames;
    v2->_trialFactorNames = 0;

    [(MOContextConfigurationManager *)v2 doTrialSetup];
  }
  return v2;
}

- (id)getStringDefaultsForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 copy];
  defaultsManager = self->_defaultsManager;
  id v10 = [v6 copy];
  v11 = [(MOContextDefaultsManager *)defaultsManager objectForKey:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 copy];

      id v8 = v12;
    }
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  defaultsManager = self->_defaultsManager;
  id v8 = [v6 copy];
  v9 = [(MOContextDefaultsManager *)defaultsManager objectForKey:v8];

  unsigned int v10 = a4;
  if (v9)
  {
    objc_opt_class();
    unsigned int v10 = a4;
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = [v9 integerValue];
    }
  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  defaultsManager = self->_defaultsManager;
  id v8 = [v6 copy];
  v9 = [(MOContextDefaultsManager *)defaultsManager objectForKey:v8];

  unsigned int v10 = v4;
  if (v9)
  {
    objc_opt_class();
    unsigned int v10 = v4;
    if (objc_opt_isKindOfClass()) {
      unsigned int v10 = [v9 BOOLValue];
    }
  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  defaultsManager = self->_defaultsManager;
  id v8 = [v6 copy];
  v9 = [(MOContextDefaultsManager *)defaultsManager objectForKey:v8];

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
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  defaultsManager = self->_defaultsManager;
  id v8 = [v6 copy];
  v9 = [(MOContextDefaultsManager *)defaultsManager objectForKey:v8];

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
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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

- (id)getFilePathDefaultsForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 copy];
  defaultsManager = self->_defaultsManager;
  id v10 = [v6 copy];
  double v11 = [(MOContextDefaultsManager *)defaultsManager objectForKey:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 copy];

      id v8 = v12;
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
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Default setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

- (void)doTrialSetup
{
  v3 = +[TRIClient clientWithIdentifier:308];
  trialClient = self->_trialClient;
  self->_trialClient = v3;

  v5 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = self->_trialClient;
    *(_DWORD *)buf = 134217984;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setup trial client: %p", buf, 0xCu);
  }

  [(TRIClient *)self->_trialClient refresh];
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Refreshed trial client", buf, 2u);
  }

  id v8 = [(MOContextConfigurationManager *)self getTrialExperimentIdentifiers];
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial experiment IDs: %@", buf, 0xCu);
  }

  id v10 = objc_opt_new();
  double v11 = [(TRIClient *)self->_trialClient factorLevelsWithNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      int v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) factor];
        __int16 v17 = [v16 name];

        if (v17) {
          [v10 addObject:v17];
        }

        int v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
  p_trialFactorNames = &self->_trialFactorNames;
  objc_storeStrong((id *)p_trialFactorNames, v10);
  __int16 v19 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    [(MOConfigurationManagerBase *)(uint64_t *)p_trialFactorNames doTrialSetup];
  }
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
    double v11 = [(TRIClient *)trialClient levelForFactor:v10 withNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];

    if (v11)
    {
      uint64_t v12 = [v11 stringValue];

      id v8 = (id)v12;
    }
  }
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];

    unsigned int v7 = a4;
    if (v10)
    {
      unsigned int v7 = a4;
      if ([v10 levelOneOfCase] == 13) {
        unsigned int v7 = [v10 longValue];
      }
    }
  }
  double v11 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];

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
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];

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
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
    id v10 = [(TRIClient *)trialClient levelForFactor:v9 withNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];

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
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  return [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];
}

- (id)getFilePathTrialLevelForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 copy];
  if ([(NSArray *)self->_trialFactorNames containsObject:v6])
  {
    trialClient = self->_trialClient;
    id v10 = [v6 copy];
    double v11 = [(TRIClient *)trialClient levelForFactor:v10 withNamespaceName:@"PERSONALIZED_SENSING_PHOTO"];

    if (v11)
    {
      uint64_t v12 = [v11 directoryValue];
      uint64_t v13 = [v12 path];

      id v8 = (id)v13;
    }
  }
  int v14 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Trial setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v16, 0x20u);
  }

  return v8;
}

- (id)getStringSettingForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOContextConfigurationManager *)self getStringTrialLevelForKey:v6 withFallback:v7];
  id v9 = [(MOContextConfigurationManager *)self getStringDefaultsForKey:v6 withFallback:v8];

  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  int v7 = [(MOContextConfigurationManager *)self getIntegerDefaultsForKey:v6 withFallback:[(MOContextConfigurationManager *)self getIntegerTrialLevelForKey:v6 withFallback:v4]];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  BOOL v7 = [(MOContextConfigurationManager *)self getBoolDefaultsForKey:v6 withFallback:[(MOContextConfigurationManager *)self getBoolTrialLevelForKey:v6 withFallback:v4]];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  [(MOContextConfigurationManager *)self getFloatTrialLevelForKey:v6 withFallback:v7];
  -[MOContextConfigurationManager getFloatDefaultsForKey:withFallback:](self, "getFloatDefaultsForKey:withFallback:", v6);
  float v9 = v8;
  int v10 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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
  [(MOContextConfigurationManager *)self getDoubleTrialLevelForKey:v6 withFallback:a4];
  -[MOContextConfigurationManager getDoubleDefaultsForKey:withFallback:](self, "getDoubleDefaultsForKey:withFallback:", v6);
  double v8 = v7;
  float v9 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
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

- (id)getFilePathSettingForKey:(id)a3 withFallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MOContextConfigurationManager *)self getFilePathTrialLevelForKey:v6 withFallback:v7];
  float v9 = [(MOContextConfigurationManager *)self getFilePathDefaultsForKey:v6 withFallback:v8];

  int v10 = _mo_log_facility_get_os_log(&MOLogFacilityContextConfiguration);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Retrieved setting [%@] with value [s:%@] and fallback [s:%@]", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (MOContextDefaultsManager)defaultsManager
{
  return (MOContextDefaultsManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_trialFactorNames, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end