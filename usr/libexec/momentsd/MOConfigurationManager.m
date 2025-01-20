@interface MOConfigurationManager
+ (BOOL)getFallbackPermission:(id)a3;
+ (id)getSensedEventGroupSettingNameFromCategory:(unint64_t)a3;
+ (id)getSensedEventGroupSettingNameFromResourceType:(unint64_t)a3;
+ (id)getSensedEventSettingNameFromCategory:(unint64_t)a3;
+ (id)getSensedEventSettingNameFromResourceType:(unint64_t)a3;
- (BOOL)_isAllowedToPromptEventCategory_postlaunch:(unint64_t)a3;
- (BOOL)_isAllowedToPromptEventCategory_prelaunch:(unint64_t)a3;
- (BOOL)_isAllowedToPromptResourceType_postlaunch:(unint64_t)a3;
- (BOOL)_isAllowedToPromptResourceType_prelaunch:(unint64_t)a3;
- (BOOL)_shouldConsiderEventCategory_postlaunch:(unint64_t)a3;
- (BOOL)_shouldConsiderResourceType_postlaunch:(unint64_t)a3;
- (BOOL)isAllowedToProcessEventCategory:(unint64_t)a3;
- (MOConfigurationManager)init;
- (MOConfigurationManager)initWithUniverse:(id)a3;
- (MODaemonUniverse)fUniverse;
- (void)setFUniverse:(id)a3;
@end

@implementation MOConfigurationManager

- (MOConfigurationManager)init
{
  return [(MOConfigurationManagerBase *)self initWithDefaultsManager:0 enableTrialClient:0];
}

- (MOConfigurationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  v12.receiver = self;
  v12.super_class = (Class)MOConfigurationManager;
  v9 = [(MOConfigurationManagerBase *)&v12 initWithDefaultsManager:v8 enableTrialClient:1];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->fUniverse, a3);
  }

  return v10;
}

+ (BOOL)getFallbackPermission:(id)a3
{
  return [a3 isEqualToString:@"MOSensedEventCombinedSwitchEvergreen"];
}

+ (id)getSensedEventSettingNameFromResourceType:(unint64_t)a3
{
  if (a3 < 0x11) {
    return off_1002C9610[a3];
  }
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[MOConfigurationManager getSensedEventSettingNameFromResourceType:]();
  }

  return 0;
}

+ (id)getSensedEventGroupSettingNameFromResourceType:(unint64_t)a3
{
  if (a3 < 0x11) {
    return (id)qword_1002C9698[a3];
  }
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[MOConfigurationManager getSensedEventGroupSettingNameFromResourceType:]();
  }

  return 0;
}

+ (id)getSensedEventSettingNameFromCategory:(unint64_t)a3
{
  if (a3 < 0x19) {
    return off_1002C9720[a3];
  }
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[MOConfigurationManager getSensedEventSettingNameFromCategory:]();
  }

  return 0;
}

+ (id)getSensedEventGroupSettingNameFromCategory:(unint64_t)a3
{
  if (a3 < 0x19) {
    return (id)qword_1002C97E8[a3];
  }
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[MOConfigurationManager getSensedEventGroupSettingNameFromResourceType:]();
  }

  return 0;
}

- (BOOL)_isAllowedToPromptEventCategory_prelaunch:(unint64_t)a3
{
  unsigned int v3 = (a3 < 0x18) & (0xEFE47Eu >> a3);
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MOConfigurationManager _isAllowedToPromptEventCategory_prelaunch:]();
  }

  return v3;
}

- (BOOL)_isAllowedToPromptResourceType_prelaunch:(unint64_t)a3
{
  unsigned int v3 = (a3 < 0x11) & (0x1FEDCu >> a3);
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MOConfigurationManager _isAllowedToPromptResourceType_prelaunch:]();
  }

  return v3;
}

- (BOOL)_shouldConsiderEventCategory_postlaunch:(unint64_t)a3
{
  fUniverse = self->fUniverse;
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(MODaemonUniverse *)fUniverse getService:v6];

  id v8 = [v7 getCollectAndComputeAuthorization];
  BOOL v9 = 0;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xAuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      BOOL v9 = v8 == (id)2;
      break;
    default:
      break;
  }
  v10 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MOConfigurationManager _shouldConsiderEventCategory_postlaunch:]();
  }

  return v9;
}

- (BOOL)_isAllowedToPromptEventCategory_postlaunch:(unint64_t)a3
{
  if (!-[MOConfigurationManager _shouldConsiderEventCategory_postlaunch:](self, "_shouldConsiderEventCategory_postlaunch:"))
  {
    LOBYTE(v9) = 0;
    return v9;
  }
  id v5 = +[MOConfigurationManager getSensedEventGroupSettingNameFromCategory:a3];
  uint64_t v6 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:a3];
  v7 = (void *)v6;
  if (!v5)
  {
    BOOL v8 = 0;
    if (v6) {
      goto LABEL_4;
    }
LABEL_7:
    unsigned int v9 = 0;
    goto LABEL_8;
  }
  BOOL v8 = [(MOConfigurationManagerBase *)self getBoolSettingForKey:v5 withFallback:+[MOConfigurationManager getFallbackPermission:v5]];
  if (!v7) {
    goto LABEL_7;
  }
LABEL_4:
  unsigned int v9 = [(MOConfigurationManagerBase *)self getBoolSettingForKey:v7 withFallback:v8];
LABEL_8:
  if (a3 == 1)
  {
    fUniverse = self->fUniverse;
    v11 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v11);
    v13 = [(MODaemonUniverse *)fUniverse getService:v12];

    v9 &= [v13 fetchSignificantLocationEnablementStatus];
  }

  return v9;
}

- (BOOL)_shouldConsiderResourceType_postlaunch:(unint64_t)a3
{
  fUniverse = self->fUniverse;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = [(MODaemonUniverse *)fUniverse getService:v6];

  BOOL v8 = (char *)[v7 getCollectAndComputeAuthorization];
  BOOL v9 = 0;
  switch(a3)
  {
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      BOOL v9 = v8 == (char *)2;
      break;
    case 9uLL:
      BOOL v9 = (unint64_t)(v8 - 1) < 2;
      break;
    default:
      break;
  }
  v10 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MOConfigurationManager _shouldConsiderResourceType_postlaunch:]();
  }

  return v9;
}

- (BOOL)_isAllowedToPromptResourceType_postlaunch:(unint64_t)a3
{
  if (!-[MOConfigurationManager _shouldConsiderResourceType_postlaunch:](self, "_shouldConsiderResourceType_postlaunch:"))
  {
    LOBYTE(v9) = 0;
    return v9;
  }
  id v5 = +[MOConfigurationManager getSensedEventGroupSettingNameFromResourceType:a3];
  uint64_t v6 = +[MOConfigurationManager getSensedEventSettingNameFromResourceType:a3];
  v7 = (void *)v6;
  if (v5)
  {
    BOOL v8 = [(MOConfigurationManagerBase *)self getBoolSettingForKey:v5 withFallback:+[MOConfigurationManager getFallbackPermission:v5]];
    if (v7)
    {
LABEL_4:
      unsigned int v9 = [(MOConfigurationManagerBase *)self getBoolSettingForKey:v7 withFallback:v8];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (v6) {
      goto LABEL_4;
    }
  }
  unsigned int v9 = 0;
LABEL_8:
  if (a3 <= 0xE && ((1 << a3) & 0x5040) != 0)
  {
    fUniverse = self->fUniverse;
    v11 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v11);
    v13 = [(MODaemonUniverse *)fUniverse getService:v12];

    v9 &= [v13 fetchSignificantLocationEnablementStatus];
  }

  return v9;
}

- (BOOL)isAllowedToProcessEventCategory:(unint64_t)a3
{
  fUniverse = self->fUniverse;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = [(MODaemonUniverse *)fUniverse getService:v6];

  unsigned __int8 v8 = 0;
  switch(a3)
  {
    case 1uLL:
      unsigned __int8 v8 = [v7 fetchSignificantLocationEnablementStatus];
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xAuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      unsigned __int8 v8 = 1;
      break;
    default:
      break;
  }
  unsigned int v9 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MOConfigurationManager isAllowedToProcessEventCategory:]();
  }

  return v8;
}

- (MODaemonUniverse)fUniverse
{
  return (MODaemonUniverse *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFUniverse:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)getSensedEventSettingNameFromResourceType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "Resource type %@ is not implemented", v3, v4, v5, v6, v7);
}

+ (void)getSensedEventGroupSettingNameFromResourceType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "Category %@ is not implemented", v3, v4, v5, v6, v7);
}

+ (void)getSensedEventSettingNameFromCategory:.cold.1()
{
  OUTLINED_FUNCTION_5();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "Event category %@ is not implemented", v3, v4, v5, v6, v7);
}

- (void)_isAllowedToPromptEventCategory_prelaunch:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "isAllowedToPromptEventCategory %@ is %@", v3, v4, v5, v6, v7);
}

- (void)_isAllowedToPromptResourceType_prelaunch:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "isAllowedToPromptResourceType %@ is %@", v3, v4, v5, v6, v7);
}

- (void)_shouldConsiderEventCategory_postlaunch:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "shouldConsiderEventCategory %@ is %@", v3, v4, v5, v6, v7);
}

- (void)_shouldConsiderResourceType_postlaunch:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "shouldConsiderResourceType %@ is %@", v3, v4, v5, v6, v7);
}

- (void)isAllowedToProcessEventCategory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v0 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "isAllowedToProcessEventCategory %@ is %@", v3, v4, v5, v6, v7);
}

@end