@interface MOEventRefreshHelper
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)universe;
- (MODefaultsManager)defaultsManager;
- (MOEventRefreshHelper)initWithUniverse:(id)a3;
- (void)getBundlingDatesForVariant:(unint64_t)a3 withHandler:(id)a4;
- (void)getCollectDatesForVariant:(unint64_t)a3 withHandler:(id)a4;
- (void)getPatternDetectorDatesForVariant:(unint64_t)a3 withHandler:(id)a4;
@end

@implementation MOEventRefreshHelper

- (MOEventRefreshHelper)initWithUniverse:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MOEventRefreshHelper;
  v6 = [(MOEventRefreshHelper *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_universe, a3);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 getService:v9];
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v10;

    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v5 getService:v13];
    defaultsManager = v7->_defaultsManager;
    v7->_defaultsManager = (MODefaultsManager *)v14;

    v16 = v7;
  }

  return v7;
}

- (void)getCollectDatesForVariant:(unint64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  v7 = [(MOEventRefreshHelper *)self defaultsManager];
  v8 = [v7 objectForKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

  if (!v8)
  {
    v8 = +[NSDate date];
  }
  uint64_t v10 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 != 256)
    {
      v11 = 0;
      if (a3 != 336) {
        goto LABEL_18;
      }
    }
    goto LABEL_10;
  }
  if (a3 == 1280)
  {
    configurationManager = self->_configurationManager;
    CFStringRef v13 = @"EventManagerOverrideRefreshMinimumLookBackWindowFull";
    goto LABEL_12;
  }
  if (a3 == 768)
  {
LABEL_10:
    configurationManager = self->_configurationManager;
    CFStringRef v13 = @"EventManagerOverrideRefreshMinimumLookBackWindowDefault";
LABEL_12:
    LODWORD(v9) = 1242802176;
    goto LABEL_13;
  }
  v11 = 0;
  if (a3 != 512) {
    goto LABEL_18;
  }
  configurationManager = self->_configurationManager;
  CFStringRef v13 = @"EventManagerOverrideRefreshMinimumLookBackWindowLight";
  LODWORD(v9) = 1216159744;
LABEL_13:
  [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v13 withFallback:v9];
  uint64_t v10 = +[NSDate dateWithTimeInterval:v8 sinceDate:(float)-v14];
  v15 = +[NSDate date];
  v11 = +[NSDate dateWithTimeInterval:v15 sinceDate:0.0];

  if (v10) {
    BOOL v16 = v11 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    objc_super v18 = +[NSCalendar currentCalendar];
    v19 = [v18 startOfDayForDate:v10];

    v20 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = +[NSNumber numberWithUnsignedInteger:a3];
      int v24 = 138412802;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "inferred collect adjusted start date (%@) and end date (%@) with variant (%@)", (uint8_t *)&v24, 0x20u);
    }
    if ([v19 isAfterDate:v11])
    {
      v23 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[MOEventRefreshHelper getCollectDatesForVariant:withHandler:]();
      }

      (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, void *, void *))v6 + 2))(v6, 1, v19, v11);
    }

    goto LABEL_29;
  }
LABEL_18:
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[MOEventRefreshHelper getCollectDatesForVariant:withHandler:](a3);
  }

  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
LABEL_29:
}

- (void)getBundlingDatesForVariant:(unint64_t)a3 withHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void *, void *))a4;
  v7 = [(MOEventRefreshHelper *)self defaultsManager];
  v8 = [v7 objectForKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

  if (!v8)
  {
    v8 = +[NSDate date];
  }
  uint64_t v10 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 != 256)
    {
      v11 = 0;
      if (a3 != 336) {
        goto LABEL_17;
      }
    }
LABEL_10:
    configurationManager = self->_configurationManager;
    CFStringRef v13 = @"EventBundleManagerOverrideRefreshMinimumLookBackWindowDefault";
    LODWORD(v9) = *(_DWORD *)"";
    goto LABEL_12;
  }
  if (a3 != 1280)
  {
    if (a3 != 768)
    {
      v11 = 0;
      if (a3 == 512)
      {
        configurationManager = self->_configurationManager;
        CFStringRef v13 = @"EventBundleManagerOverrideRefreshMinimumLookBackWindowLight";
        LODWORD(v9) = 1216159744;
        goto LABEL_12;
      }
LABEL_17:
      v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[MOEventRefreshHelper getBundlingDatesForVariant:withHandler:](a3);
      }

      goto LABEL_26;
    }
    goto LABEL_10;
  }
  configurationManager = self->_configurationManager;
  CFStringRef v13 = @"EventBundleManagerOverrideRefreshMinimumLookBackWindowFull";
  LODWORD(v9) = 1242802176;
LABEL_12:
  [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v13 withFallback:v9];
  uint64_t v10 = +[NSDate dateWithTimeInterval:v8 sinceDate:(float)-v14];
  v15 = +[NSDate date];
  v11 = +[NSDate dateWithTimeInterval:v15 sinceDate:0.0];

  if (v10) {
    BOOL v16 = v11 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    goto LABEL_17;
  }
  objc_super v18 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = +[NSNumber numberWithUnsignedInteger:a3];
    int v22 = 138412802;
    v23 = v10;
    __int16 v24 = 2112;
    v25 = v11;
    __int16 v26 = 2112;
    v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "inferred bundling start date (%@) and end date (%@) with variant (%@)", (uint8_t *)&v22, 0x20u);
  }
  if (![v10 isAfterDate:v11])
  {
    v6[2](v6, 1, v10, v11);
    goto LABEL_28;
  }
  v21 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    -[MOEventRefreshHelper getBundlingDatesForVariant:withHandler:]();
  }

LABEL_26:
  v6[2](v6, 0, 0, 0);
LABEL_28:
}

- (void)getPatternDetectorDatesForVariant:(unint64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  v7 = [(MOEventRefreshHelper *)self defaultsManager];
  v8 = [v7 objectForKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

  if (!v8)
  {
    v8 = +[NSDate date];
  }
  uint64_t v10 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 != 256)
    {
      v11 = 0;
      if (a3 != 336) {
        goto LABEL_18;
      }
    }
    goto LABEL_10;
  }
  if (a3 == 1280)
  {
    configurationManager = self->_configurationManager;
    CFStringRef v13 = @"PatternDetectorRefreshMinimumLookBackWindowFull";
    goto LABEL_12;
  }
  if (a3 == 768)
  {
LABEL_10:
    configurationManager = self->_configurationManager;
    CFStringRef v13 = @"PatternDetectorRefreshMinimumLookBackWindowDefault";
LABEL_12:
    LODWORD(v9) = 1242802176;
    goto LABEL_13;
  }
  v11 = 0;
  if (a3 != 512) {
    goto LABEL_18;
  }
  configurationManager = self->_configurationManager;
  CFStringRef v13 = @"PatternDetectorRefreshMinimumLookBackWindowLight";
  LODWORD(v9) = 1216159744;
LABEL_13:
  [(MOConfigurationManagerBase *)configurationManager getFloatSettingForKey:v13 withFallback:v9];
  uint64_t v10 = +[NSDate dateWithTimeInterval:v8 sinceDate:(float)-v14];
  v15 = +[NSDate date];
  v11 = +[NSDate dateWithTimeInterval:v15 sinceDate:0.0];

  if (v10) {
    BOOL v16 = v11 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    objc_super v18 = +[NSCalendar currentCalendar];
    v19 = [v18 startOfDayForDate:v10];

    v20 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = +[NSNumber numberWithUnsignedInteger:a3];
      int v24 = 138412802;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "inferred pattern detection adjusted date (%@) and end date (%@) with variant (%@)", (uint8_t *)&v24, 0x20u);
    }
    if ([v19 isAfterDate:v11])
    {
      v23 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[MOEventRefreshHelper getPatternDetectorDatesForVariant:withHandler:]();
      }

      (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t, void *, void *))v6 + 2))(v6, 1, v19, v11);
    }

    goto LABEL_29;
  }
LABEL_18:
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[MOEventRefreshHelper getPatternDetectorDatesForVariant:withHandler:](a3);
  }

  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
LABEL_29:
}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_universe, 0);
}

- (void)getCollectDatesForVariant:(uint64_t)a1 withHandler:.cold.1(uint64_t a1)
{
  v1 = +[NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "unable to determine start and end date for collect (with variant %@)", v4, v5, v6, v7, 2u);
}

- (void)getCollectDatesForVariant:withHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v0, v1, "incorrect collect state: adjusted start date (%@) is after end date (%@)");
}

- (void)getBundlingDatesForVariant:(uint64_t)a1 withHandler:.cold.1(uint64_t a1)
{
  os_log_t v1 = +[NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "unable to determine start and end date for bundling (with variant %@)", v4, v5, v6, v7, 2u);
}

- (void)getBundlingDatesForVariant:withHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v0, v1, "incorrect bundling state: start date (%@) is after end date (%@)");
}

- (void)getPatternDetectorDatesForVariant:(uint64_t)a1 withHandler:.cold.1(uint64_t a1)
{
  os_log_t v1 = +[NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "unable to determine start and end date for pattern detection (with variant %@)", v4, v5, v6, v7, 2u);
}

- (void)getPatternDetectorDatesForVariant:withHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v0, v1, "incorrect pattern detection state: adjusted start date (%@) is after end date (%@)");
}

@end