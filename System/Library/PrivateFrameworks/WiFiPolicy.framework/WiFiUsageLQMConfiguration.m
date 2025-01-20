@interface WiFiUsageLQMConfiguration
+ (id)getConfigForKey:(id)a3;
+ (void)getConfigForPlatform;
+ (void)initialize;
+ (void)setConfig:(id)a3;
@end

@implementation WiFiUsageLQMConfiguration

+ (void)initialize
{
  v2 = (void *)_dataPathTelemetryConfig;
  _dataPathTelemetryConfig = 0;
}

+ (void)setConfig:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToDictionary:_dataPathTelemetryConfig] & 1) == 0)
  {
    objc_storeStrong((id *)&_dataPathTelemetryConfig, a3);
    [a1 getConfigForPlatform];
    NSLog(&cfstr_SUpdatedDatapa.isa, "+[WiFiUsageLQMConfiguration setConfig:]");
    +[WiFiUsageLQMRollingWindow updateConfig];
    v5 = +[WiFiUsageMonitor sharedInstance];
    [v5 updateLQMWindowCriteria];

    +[WiFiUsageLQMTransformations updateConfig];
    +[WiFiUsageLQMWindowAnalysis updateConfig];
  }
}

+ (id)getConfigForKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)_dataPathTelemetryConfig objectForKey:v3];
  if (!v4) {
    NSLog(&cfstr_SDatapathtelem.isa, "+[WiFiUsageLQMConfiguration getConfigForKey:]", v3);
  }

  return v4;
}

+ (void)getConfigForPlatform
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
  id v3 = [(id)_dataPathTelemetryConfig objectForKey:@"platformDependent"];

  if (!v3)
  {
    v33 = (__objc2_class *)(id)_dataPathTelemetryConfig;
    goto LABEL_38;
  }
  v4 = [(id)_dataPathTelemetryConfig objectForKeyedSubscript:@"platformDependent"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v34 = NSString;
    v35 = [(id)_dataPathTelemetryConfig objectForKeyedSubscript:@"platformDependent"];
    v36 = [v34 stringWithFormat:@"%s: Cannot parse DataPathTelemetry.platformDependent: %@", "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v35];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v36, "UTF8String"));
      id v37 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      uint64_t v48 = [v37 UTF8String];
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v33 = 0;
    goto LABEL_38;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(id)_dataPathTelemetryConfig objectForKeyedSubscript:@"platformDependent"];
  uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v6)
  {
    v21 = 0;
    v33 = 0;
    goto LABEL_36;
  }
  uint64_t v7 = v6;
  v39 = 0;
  uint64_t v8 = *(void *)v43;
  uint64_t v40 = *(void *)v43;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v42 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      uint64_t v11 = [v10 objectForKeyedSubscript:@"validOnPlatforms"];
      if (!v11) {
        goto LABEL_17;
      }
      v12 = (void *)v11;
      v13 = v2;
      v14 = [v10 objectForKeyedSubscript:@"validOnPlatforms"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v10 objectForKeyedSubscript:@"DataPathTelemetry"],
            (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        v2 = v13;
LABEL_17:
        v22 = NSString;
        v23 = [(__objc2_class *)v2[32].isa objectForKeyedSubscript:@"platformDependent"];
        v24 = [v22 stringWithFormat:@"%s: Cannot parse DataPathTelemetry.platformDependent: %@", "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v23];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
          id v25 = objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v25 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v48 = v26;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        goto LABEL_20;
      }
      v16 = (void *)v15;
      v17 = [v10 objectForKeyedSubscript:@"DataPathTelemetry"];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      v2 = v13;
      uint64_t v8 = v40;
      if ((v18 & 1) == 0) {
        goto LABEL_17;
      }
      switch(MGGetSInt32Answer())
      {
        case 1u:
        case 2u:
        case 3u:
          v19 = [v10 objectForKeyedSubscript:@"validOnPlatforms"];
          int v20 = [v19 containsObject:@"phone"];

          v21 = @"phone";
          if (!v20) {
            break;
          }
          goto LABEL_26;
        case 4u:
          v27 = [v10 objectForKeyedSubscript:@"validOnPlatforms"];
          v28 = v27;
          v29 = @"tv";
          goto LABEL_25;
        case 6u:
          v27 = [v10 objectForKeyedSubscript:@"validOnPlatforms"];
          v28 = v27;
          v29 = @"watch";
          goto LABEL_25;
        case 9u:
          v27 = [v10 objectForKeyedSubscript:@"validOnPlatforms"];
          v28 = v27;
          v29 = @"mac";
LABEL_25:
          char v30 = [v27 containsObject:v29];

          v21 = v29;
          if ((v30 & 1) == 0) {
            break;
          }
LABEL_26:
          uint64_t v31 = [v10 objectForKeyedSubscript:@"DataPathTelemetry"];
          if (v31)
          {
            v33 = (__objc2_class *)v31;
            goto LABEL_36;
          }
          v39 = v21;
          break;
        default:
          break;
      }
LABEL_20:
      ++v9;
    }
    while (v7 != v9);
    uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    uint64_t v7 = v32;
  }
  while (v32);
  v33 = 0;
  v21 = v39;
LABEL_36:

  NSLog(&cfstr_SReceivedConfi.isa, "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v21);
  if (!v33) {
    NSLog(&cfstr_SUnableToFindD.isa, "+[WiFiUsageLQMConfiguration getConfigForPlatform]");
  }
LABEL_38:
  isa = v2[32].isa;
  v2[32].isa = v33;
}

@end