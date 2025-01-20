@interface PPSCoreUtilities
+ (BOOL)hasCapability:(int)a3;
+ (BOOL)isAllowedMetric:(id)a3;
+ (BOOL)isAllowedPopulation:(int)a3;
+ (BOOL)isAllowedSubsystem:(id)a3;
+ (BOOL)isAllowedSubsystem:(id)a3 category:(id)a4;
+ (BOOL)isPrivacySensitive:(id)a3;
+ (BOOL)isSetupAllowedForMetric:(id)a3;
+ (BOOL)isValidModeForMetric:(id)a3;
+ (BOOL)shouldLogMetric:(id)a3;
+ (BOOL)shouldOverrideAllowlist:(id)a3;
+ (BOOL)shouldSetupMetric:(id)a3;
+ (id)deviceCapabilityMapping;
+ (id)getAllowlist;
+ (id)getTestAllowlist;
+ (id)md5Hash:(id)a3;
+ (id)mergeNestedDictionary:(id)a3 withDict:(id)a4;
+ (void)getTestAllowlist;
@end

@implementation PPSCoreUtilities

+ (BOOL)shouldLogMetric:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a1 isValidModeForMetric:v4] & 1) == 0)
  {
    v6 = PPSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[PPSCoreUtilities shouldLogMetric:].cold.4(v4);
    }
    goto LABEL_6;
  }
  if (([a1 isAllowedMetric:v4] & 1) == 0)
  {
    if ([a1 shouldOverrideAllowlist:v4])
    {
      v8 = [v4 subsystem];
      int v9 = [a1 isAllowedSubsystem:v8];

      if (v9)
      {
        if (![a1 isPrivacySensitive:v4])
        {
          v6 = PLLogCommon();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
            +[PPSCoreUtilities shouldLogMetric:](v4, v6);
          }
          BOOL v5 = 1;
          goto LABEL_7;
        }
        v6 = PPSLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v10 = [v4 name];
          int v11 = 138412546;
          v12 = v10;
          __int16 v13 = 1024;
          int v14 = [v4 privacyClassification];
          _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_INFO, "Metric %@ is not a metric in allowlist and its privacy classification is %d", (uint8_t *)&v11, 0x12u);
        }
      }
      else
      {
        v6 = PPSLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          +[PPSCoreUtilities shouldLogMetric:](v4);
        }
      }
    }
    else
    {
      v6 = PPSLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        +[PPSCoreUtilities shouldLogMetric:](v4);
      }
    }
LABEL_6:
    BOOL v5 = 0;
LABEL_7:

    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

+ (BOOL)isValidModeForMetric:(id)a3
{
  id v3 = a3;
  switch([v3 mode])
  {
    case 0u:
      id v4 = PPSLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[PPSCoreUtilities isValidModeForMetric:](v3);
      }
      goto LABEL_6;
    case 1u:
      if (+[PLDefaults liteMode]) {
        goto LABEL_16;
      }
      goto LABEL_15;
    case 2u:
      BOOL v6 = +[PLDefaults liteMode];
      goto LABEL_14;
    case 3u:
      goto LABEL_11;
    case 4u:
      goto LABEL_13;
    case 5u:
      if (+[PLDefaults liteMode]) {
        goto LABEL_16;
      }
LABEL_11:
      BOOL v6 = +[PLDefaults taskMode];
      goto LABEL_14;
    case 6u:
      if (!+[PLDefaults liteMode]) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 7u:
LABEL_15:
      if (+[PLDefaults taskMode])
      {
LABEL_16:
        BOOL v5 = 1;
      }
      else
      {
LABEL_13:
        BOOL v6 = +[PLDefaults fullMode];
LABEL_14:
        BOOL v5 = v6;
      }
LABEL_17:

      return v5;
    default:
      id v4 = PPSLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[PPSCoreUtilities isValidModeForMetric:](v3);
      }
LABEL_6:

      BOOL v5 = 0;
      goto LABEL_17;
  }
}

+ (BOOL)isAllowedMetric:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults fullMode])
  {
    if (![a1 isPrivacySensitive:v4])
    {
      BOOL v6 = 1;
      goto LABEL_13;
    }
    BOOL v5 = PPSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSCoreUtilities isAllowedMetric:](v4);
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v5 = +[PPSCoreUtilities getAllowlist];
    v7 = [v4 subsystem];
    v8 = [v5 objectForKeyedSubscript:v7];
    int v9 = [v4 category];
    v10 = [v8 objectForKeyedSubscript:v9];
    int v11 = [v4 name];
    v12 = [v10 objectForKeyedSubscript:v11];

    [v12 doubleValue];
    double v14 = v13;
    [v4 version];
    double v16 = vabdd_f64(v14, v15);
    BOOL v6 = v16 < 0.001;
    if (v16 >= 0.001)
    {
      v17 = PPSLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        +[PPSCoreUtilities isAllowedMetric:](v4);
      }
    }
  }

LABEL_13:
  return v6;
}

+ (id)getAllowlist
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PPSCoreUtilities_getAllowlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getAllowlist_once_token != -1) {
    dispatch_once(&getAllowlist_once_token, block);
  }
  v2 = (void *)getAllowlist_allowlist;
  return v2;
}

+ (BOOL)shouldOverrideAllowlist:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PLPlatform internalBuild])
  {
    BOOL v4 = +[PLDefaults BOOLForKey:@"overrideAllowlist" ifNotSet:1];
  }
  else
  {
    BOOL v5 = PPSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = [v3 subsystem];
      v7 = [v3 category];
      int v9 = 138412546;
      v10 = v6;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_INFO, "Cannot override allowlist for %@ /%@ on customer OS", (uint8_t *)&v9, 0x16u);
    }
    BOOL v4 = 0;
  }

  return v4;
}

void __32__PPSCoreUtilities_getAllowlist__block_invoke(uint64_t a1)
{
  BOOL v2 = +[PLPlatform internalBuild];
  uint64_t v3 = [*(id *)(a1 + 32) getPrivacyAllowlist];
  BOOL v4 = (void *)getAllowlist_allowlist;
  getAllowlist_allowlist = v3;

  if (v2)
  {
    uint64_t v5 = getAllowlist_allowlist;
    id v8 = [*(id *)(a1 + 32) getTestAllowlist];
    uint64_t v6 = +[PPSCoreUtilities mergeNestedDictionary:v5 withDict:v8];
    v7 = (void *)getAllowlist_allowlist;
    getAllowlist_allowlist = v6;
  }
}

+ (id)getTestAllowlist
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [MEMORY[0x1E4F89D10] containerPath];
  BOOL v4 = [v3 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  uint64_t v5 = [v4 stringByAppendingString:@"Test/"];
  uint64_t v6 = [v5 stringByAppendingString:@"testAllowlist.plist"];
  v7 = [v2 fileURLWithPath:v6 isDirectory:0];

  id v12 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v7 error:&v12];
  id v9 = v12;
  if (v9)
  {
    v10 = PPSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[PPSCoreUtilities getTestAllowlist]();
    }
  }
  return v8;
}

+ (BOOL)isSetupAllowedForMetric:(id)a3
{
  id v4 = a3;
  char v5 = [a1 isValidModeForMetric:v4];
  unsigned int v6 = [v4 mode];
  BOOL v7 = v6 > 7 || ((1 << v6) & 0xA8) == 0;
  if (!v7 && +[PLDefaults taskMode])
  {
    id v8 = +[PPSSubmissionUtilities taskingTables];

    id v9 = +[PPSSubmissionUtilities taskingTables];
    v10 = [v4 subsystem];
    __int16 v11 = [v9 objectForKeyedSubscript:v10];

    id v12 = +[PPSSubmissionUtilities taskingTables];
    uint64_t v13 = [v4 subsystem];
    double v14 = [v12 objectForKeyedSubscript:v13];
    double v15 = [v4 category];
    char v16 = [v14 containsObject:v15];

    if (v11) {
      char v17 = v16;
    }
    else {
      char v17 = 0;
    }
    if (!v8) {
      char v17 = 0;
    }
    v5 &= v17;
  }

  return v5;
}

+ (id)deviceCapabilityMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PPSCoreUtilities_deviceCapabilityMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceCapabilityMapping_onceToken != -1) {
    dispatch_once(&deviceCapabilityMapping_onceToken, block);
  }
  BOOL v2 = (void *)deviceCapabilityMapping_deviceCapabilityMap;
  return v2;
}

void __43__PPSCoreUtilities_deviceCapabilityMapping__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)deviceCapabilityMapping_deviceCapabilityMap;
  deviceCapabilityMapping_deviceCapabilityMap = v2;

  for (uint64_t i = 0; i != 22; ++i)
  {
    char v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasCapability:", i));
    [(id)deviceCapabilityMapping_deviceCapabilityMap setObject:v5 atIndexedSubscript:i];
  }
}

+ (BOOL)hasCapability:(int)a3
{
  BOOL result = 0;
  switch(a3)
  {
    case 1:
    case 16:
      BOOL result = 1;
      break;
    case 2:
      BOOL result = +[PLPlatform hasANE];
      break;
    case 4:
      BOOL result = +[PLPlatform hasAOT];
      break;
    case 5:
      BOOL result = +[PLPlatform hasBaseband];
      break;
    case 6:
      BOOL result = +[PLUtilities hasBattery];
      break;
    case 8:
      BOOL result = !+[PLPlatform isDisplayClass:0xFFFFFFFFLL];
      break;
    case 9:
      BOOL result = +[PLPlatform hasDCP];
      break;
    case 10:
      BOOL result = +[PLPlatform hasLPEM];
      break;
    case 12:
      BOOL result = +[PLPlatform hasNFC];
      break;
    case 18:
      BOOL result = +[PLPlatform isBasebandIce];
      break;
    case 19:
      BOOL result = +[PLPlatform isBasebandMav];
      break;
    case 20:
      BOOL result = +[PLPlatform isBasebandProto];
      break;
    case 21:
      BOOL result = +[PLPlatform hasGenerativeModelSystems];
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)shouldSetupMetric:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unsigned int v6 = PPSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSCoreUtilities shouldSetupMetric:](v6);
    }
    goto LABEL_14;
  }
  if (([a1 isSetupAllowedForMetric:v4] & 1) == 0)
  {
    unsigned int v6 = PPSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSCoreUtilities shouldSetupMetric:].cold.4(v4);
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "isAllowedPopulation:", objc_msgSend(v4, "enabledPopulation")) & 1) == 0)
  {
    unsigned int v6 = PPSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSCoreUtilities shouldSetupMetric:](v4);
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "hasCapability:", objc_msgSend(v4, "deviceCapability")) & 1) == 0)
  {
    unsigned int v6 = PPSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSCoreUtilities shouldSetupMetric:](v4);
    }
LABEL_14:

    BOOL v5 = 0;
    goto LABEL_15;
  }
  BOOL v5 = 1;
LABEL_15:

  return v5;
}

+ (BOOL)isAllowedPopulation:(int)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 0:
    case 4:
      BOOL result = 0;
      break;
    case 1:
      goto LABEL_6;
    case 2:
      if (+[PLPlatform seedBuild])
      {
        BOOL result = 1;
      }
      else
      {
LABEL_6:
        BOOL result = +[PLPlatform internalBuild];
      }
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)isPrivacySensitive:(id)a3
{
  return [a3 privacyClassification] != 1;
}

+ (BOOL)isAllowedSubsystem:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PPSCoreUtilities getAllowlist];
    BOOL v5 = [v4 objectForKeyedSubscript:v3];

    BOOL v6 = v5 != 0;
    if (!v5)
    {
      BOOL v7 = PPSLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[PPSCoreUtilities isAllowedSubsystem:]();
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isAllowedSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if (+[PLDefaults fullMode])
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = +[PPSCoreUtilities getAllowlist];
      v10 = [v9 objectForKeyedSubscript:v5];
      __int16 v11 = [v10 objectForKeyedSubscript:v7];

      BOOL v8 = v11 != 0;
      if (!v11)
      {
        id v12 = PPSLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          +[PPSCoreUtilities isAllowedSubsystem:category:]();
        }
      }
    }
  }

  return v8;
}

+ (id)md5Hash:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (const char *)[a3 UTF8String];
  *(void *)md = 0;
  uint64_t v8 = 0;
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v8, BYTE1(v8), BYTE2(v8), BYTE3(v8), BYTE4(v8), BYTE5(v8), BYTE6(v8), HIBYTE(v8));
  return v5;
}

+ (id)mergeNestedDictionary:(id)a3 withDict:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithDictionary:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__PPSCoreUtilities_mergeNestedDictionary_withDict___block_invoke;
  v14[3] = &unk_1E6254330;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];

  __int16 v11 = v16;
  id v12 = v9;

  return v12;
}

void __51__PPSCoreUtilities_mergeNestedDictionary_withDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v9];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [*(id *)(a1 + 32) objectForKey:v9];
    uint64_t v8 = +[PPSCoreUtilities mergeNestedDictionary:v7 withDict:v5];

    [*(id *)(a1 + 40) setObject:v8 forKey:v9];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v5 forKey:v9];
  }
}

+ (void)getTestAllowlist
{
  v0 = [MEMORY[0x1E4F89D10] containerPath];
  v1 = [v0 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  uint64_t v2 = [v1 stringByAppendingString:@"Test/"];
  id v3 = [v2 stringByAppendingString:@"testAllowlist.plist"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v4, v5, "Could not read test allowlist at path: %@", v6, v7, v8, v9, v10);
}

+ (void)isValidModeForMetric:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Invalid mode for metric: %@", v4, v5, v6, v7, v8);
}

+ (void)isValidModeForMetric:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Unknown mode for metric: %@", v4, v5, v6, v7, v8);
}

+ (void)shouldSetupMetric:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Nil metric sent for setup", v1, 2u);
}

+ (void)shouldSetupMetric:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Metric %@ could not be setup - does not meet device capability", v4, v5, v6, v7, v8);
}

+ (void)shouldSetupMetric:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Metric %@ could not be setup - does not meet population criteria", v4, v5, v6, v7, v8);
}

+ (void)shouldSetupMetric:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Metric %@ could not be setup - does not meet setup criteria", v4, v5, v6, v7, v8);
}

+ (void)shouldLogMetric:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 subsystem];
  uint64_t v5 = [a1 category];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "Subsystem/Category %@ / %@ will override Allowlist internally but not log externally", (uint8_t *)&v6, 0x16u);
}

+ (void)shouldLogMetric:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 subsystem];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v2, v3, "Subsystem %@ is not in allowlist", v4, v5, v6, v7, v8);
}

+ (void)shouldLogMetric:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v2, v3, "Metric %@ is not a metric in allowlist", v4, v5, v6, v7, v8);
}

+ (void)shouldLogMetric:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v2, v3, "Invalid mode for metric %@", v4, v5, v6, v7, v8);
}

+ (void)isAllowedMetric:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1BBD2F000, v2, v3, "Device is in full mode. Flagging privacy sensitive metric %@", v4, v5, v6, v7, v8);
}

+ (void)isAllowedMetric:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1BBD2F000, v2, v3, "Logging not allowed for metric: %@", v4, v5, v6, v7, v8);
}

+ (void)isAllowedSubsystem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "Subsystem %@ not in allowlist", v1, 0xCu);
}

+ (void)isAllowedSubsystem:category:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1BBD2F000, v1, OS_LOG_TYPE_DEBUG, "EntryKey setup not allowed for %@/%@", v2, 0x16u);
}

@end