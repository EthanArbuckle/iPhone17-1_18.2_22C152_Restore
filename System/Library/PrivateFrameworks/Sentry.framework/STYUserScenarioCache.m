@interface STYUserScenarioCache
+ (id)internalResourceBundle;
+ (id)sharedCache;
- (BOOL)isAnimationScenarioWhitelisted:(id)a3 error:(id *)a4;
- (BOOL)isResponsivenessScenarioWhitelisted:(id)a3 error:(id *)a4;
- (BOOL)kpiIsLatency:(id)a3;
- (BOOL)processWhitelisted:(id)a3 error:(id *)a4;
- (BOOL)scenarioWhitelisted:(id)a3 error:(id *)a4;
- (BOOL)setupWhitelistedAnimationScenarios:(id)a3 bundles:(id)a4;
- (BOOL)setupWhitelistedResponsivenessScenarios:(id)a3 bundles:(id)a4;
- (BOOL)setupWhitelistedScenarios:(id)a3 bundles:(id)a4;
- (NSDictionary)animationConfigForWhitelistedCategories;
- (NSDictionary)animationConfigForWhitelistedNames;
- (NSDictionary)animationConfigForWhitelistedSubsystems;
- (NSDictionary)bundleIdForAppName;
- (NSDictionary)responsivenessConfigForWhitelistedCategories;
- (NSDictionary)responsivenessConfigForWhitelistedNames;
- (NSDictionary)responsivenessConfigForWhitelistedSubsystems;
- (NSError)badConfigError;
- (NSError)bundledIdLookupFailedrror;
- (NSMutableDictionary)lifecycleScenarios;
- (NSMutableDictionary)scenarioObjects;
- (NSString)hwModel;
- (STYUserScenarioCache)initWithPlatform:(id)a3;
- (float)framerateGoalsForSignpostInterval:(id)a3;
- (float)latencyGoalsForSignpostInterval:(id)a3;
- (id)appNameFromBundleId:(id)a3;
- (id)bundleIdForProcessName:(id)a3;
- (id)issueCategoryForSignpostInterval:(id)a3;
- (id)loadWhitelist:(id)a3 platform:(id)a4 bundles:(id)a5;
- (id)processBundleIdForSignpostInterval:(id)a3;
- (id)scenarioForFrontboardLaunchWatchdog:(id)a3;
- (id)scenarioFromSignpostEvent:(id)a3 error:(id *)a4;
- (id)scenarioFromSignpostInterval:(id)a3 error:(id *)a4;
- (id)scenarioGroupForSignpostInterval:(id)a3;
- (id)scenarioIdForSignpostEmittedEvent:(id)a3;
- (id)scenarioIdForSignpostInterval:(id)a3;
- (int)processIdForSignpostEvent:(id)a3;
- (void)setAnimationConfigForWhitelistedCategories:(id)a3;
- (void)setAnimationConfigForWhitelistedNames:(id)a3;
- (void)setAnimationConfigForWhitelistedSubsystems:(id)a3;
- (void)setBadConfigError:(id)a3;
- (void)setBundleIdForAppName:(id)a3;
- (void)setBundledIdLookupFailedrror:(id)a3;
- (void)setHwModel:(id)a3;
- (void)setLifecycleScenarios:(id)a3;
- (void)setResponsivenessConfigForWhitelistedCategories:(id)a3;
- (void)setResponsivenessConfigForWhitelistedNames:(id)a3;
- (void)setResponsivenessConfigForWhitelistedSubsystems:(id)a3;
- (void)setScenarioObjects:(id)a3;
- (void)setupBundleIdWhitelists:(id)a3 bundles:(id)a4;
@end

@implementation STYUserScenarioCache

- (id)bundleIdForProcessName:(id)a3
{
  bundleIdForAppName = self->_bundleIdForAppName;
  id v5 = a3;
  v6 = [(NSDictionary *)bundleIdForAppName objectForKeyedSubscript:v5];

  if (v6) {
    [(NSDictionary *)self->_bundleIdForAppName objectForKeyedSubscript:v5];
  }
  else {
  v7 = [NSString stringWithFormat:@"bundleId For %@ not available", v5];
  }

  return v7;
}

- (id)scenarioIdForSignpostInterval:(id)a3
{
  bundleIdForAppName = self->_bundleIdForAppName;
  id v4 = a3;
  id v5 = [v4 endEvent];
  v6 = [v5 processName];
  v7 = [(NSDictionary *)bundleIdForAppName objectForKeyedSubscript:v6];

  v8 = NSString;
  if (v7)
  {
    v9 = [v4 subsystem];
    v10 = [v4 category];
    v11 = [v4 name];

    v12 = [v8 stringWithFormat:@"%@-%@-%@-%@", v7, v9, v10, v11];
  }
  else
  {
    v9 = [v4 endEvent];
    v10 = [v9 processName];
    v11 = [v4 subsystem];
    v13 = [v4 category];
    v14 = [v4 name];

    v12 = [v8 stringWithFormat:@"%@-%@-%@-%@", v10, v11, v13, v14];
  }
  return v12;
}

- (id)scenarioIdForSignpostEmittedEvent:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = [v4 processName];
  v6 = [v4 subsystem];
  v7 = [v4 category];
  v8 = [v4 name];

  v9 = [v3 stringWithFormat:@"%@-%@-%@-%@", v5, v6, v7, v8];

  return v9;
}

- (STYUserScenarioCache)initWithPlatform:(id)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)STYUserScenarioCache;
  id v5 = [(STYUserScenarioCache *)&v41 init];
  if (v5)
  {
    uint64_t v6 = +[STYDeviceInfo hardwareModel];
    hwModel = v5->_hwModel;
    v5->_hwModel = (NSString *)v6;

    uint64_t v8 = [(NSString *)v5->_hwModel stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    v9 = v5->_hwModel;
    v5->_hwModel = (NSString *)v8;

    uint64_t v10 = [(NSString *)v5->_hwModel stringByReplacingOccurrencesOfString:@"," withString:@"_"];
    v11 = v5->_hwModel;
    v5->_hwModel = (NSString *)v10;

    unint64_t v12 = 0x1E4F28000uLL;
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = +[STYUserScenarioCache internalResourceBundle];
    v15 = (void *)v14;
    if (v14)
    {
      v47[0] = v14;
      v47[1] = v13;
      v16 = (void *)MEMORY[0x1E4F1C978];
      v17 = v47;
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v46 = v13;
      v16 = (void *)MEMORY[0x1E4F1C978];
      v17 = &v46;
      uint64_t v18 = 1;
    }
    v19 = [v16 arrayWithObjects:v17 count:v18];
    v40 = (void *)v13;
    unint64_t v20 = 0x1E4F28000uLL;
    unint64_t v21 = 0x1E4F1C000uLL;
    if ([(STYUserScenarioCache *)v5 setupWhitelistedScenarios:v4 bundles:v19])
    {
      [(STYUserScenarioCache *)v5 setupBundleIdWhitelists:v4 bundles:v19];
      v22 = (void *)MEMORY[0x1E4F28C58];
      v23 = STYUserScenarioErrorDomain;
      uint64_t v24 = *MEMORY[0x1E4F28568];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v25 = [MEMORY[0x1E4F28B50] mainBundle];
      v26 = [v25 localizedStringForKey:@"Failed to retrieve bundle id for signpost event" value:&stru_1F2A289A0 table:0];
      v45 = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v28 = v22;
      unint64_t v20 = 0x1E4F28000;
      uint64_t v29 = [v28 errorWithDomain:v23 code:-2008 userInfo:v27];
      bundledIdLookupFailedrror = v5->_bundledIdLookupFailedrror;
      v5->_bundledIdLookupFailedrror = (NSError *)v29;

      unint64_t v21 = 0x1E4F1C000;
      unint64_t v12 = 0x1E4F28000;
    }
    else
    {
      uint64_t v24 = *MEMORY[0x1E4F28568];
    }
    v31 = *(void **)(v20 + 3160);
    v32 = STYUserScenarioErrorDomain;
    uint64_t v42 = v24;
    v33 = [*(id *)(v12 + 2896) mainBundle];
    v34 = [v33 localizedStringForKey:@"Framework is not Configured properly. Please file a bug against Sentry | Framework" value:&stru_1F2A289A0 table:0];
    v43 = v34;
    v35 = [*(id *)(v21 + 2536) dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v36 = [v31 errorWithDomain:v32 code:-2007 userInfo:v35];
    badConfigError = v5->_badConfigError;
    v5->_badConfigError = (NSError *)v36;

    v38 = v5;
  }

  return v5;
}

+ (id)internalResourceBundle
{
  return 0;
}

- (BOOL)setupWhitelistedScenarios:(id)a3 bundles:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(STYUserScenarioCache *)self setupWhitelistedResponsivenessScenarios:v7 bundles:v6];
  LOBYTE(self) = [(STYUserScenarioCache *)self setupWhitelistedAnimationScenarios:v7 bundles:v6];

  return v8 | self;
}

- (id)loadWhitelist:(id)a3 platform:(id)a4 bundles:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  BOOL v8 = [NSString stringWithFormat:@"%@-%@", a3, a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) pathForResource:v8 ofType:@"plist"];
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v14];

        if (v15)
        {
          v17 = v9;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v16 = +[STYFrameworkHelper sharedHelper];
  v17 = [v16 logHandle];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[STYUserScenarioCache loadWhitelist:platform:bundles:]();
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)setupWhitelistedResponsivenessScenarios:(id)a3 bundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedSubsystems-Responsiveness" platform:v6 bundles:v7];
  responsivenessConfigForWhitelistedSubsystems = self->_responsivenessConfigForWhitelistedSubsystems;
  self->_responsivenessConfigForWhitelistedSubsystems = v8;

  if (self->_responsivenessConfigForWhitelistedSubsystems
    && ([(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedCategories-Responsiveness" platform:v6 bundles:v7], uint64_t v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), responsivenessConfigForWhitelistedCategories = self->_responsivenessConfigForWhitelistedCategories, self->_responsivenessConfigForWhitelistedCategories = v10, responsivenessConfigForWhitelistedCategories, self->_responsivenessConfigForWhitelistedCategories))
  {
    uint64_t v12 = [(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedNames-Responsiveness" platform:v6 bundles:v7];
    responsivenessConfigForWhitelistedNames = self->_responsivenessConfigForWhitelistedNames;
    self->_responsivenessConfigForWhitelistedNames = v12;

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)setupWhitelistedAnimationScenarios:(id)a3 bundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedSubsystems-Animation" platform:v6 bundles:v7];
  animationConfigForWhitelistedSubsystems = self->_animationConfigForWhitelistedSubsystems;
  self->_animationConfigForWhitelistedSubsystems = v8;

  if (self->_animationConfigForWhitelistedSubsystems
    && ([(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedCategories-Animation" platform:v6 bundles:v7], uint64_t v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), animationConfigForWhitelistedCategories = self->_animationConfigForWhitelistedCategories, self->_animationConfigForWhitelistedCategories = v10, animationConfigForWhitelistedCategories, self->_animationConfigForWhitelistedCategories))
  {
    uint64_t v12 = [(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedNames-Animation" platform:v6 bundles:v7];
    animationConfigForWhitelistedNames = self->_animationConfigForWhitelistedNames;
    self->_animationConfigForWhitelistedNames = v12;

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setupBundleIdWhitelists:(id)a3 bundles:(id)a4
{
  id v5 = [(STYUserScenarioCache *)self loadWhitelist:@"STYWhitelistedBundleIds" platform:a3 bundles:a4];
  if (v5) {
    objc_storeStrong((id *)&self->_bundleIdForAppName, v5);
  }
  MEMORY[0x1F41817F8]();
}

- (float)latencyGoalsForSignpostInterval:(id)a3
{
  id v4 = a3;
  id v5 = [v4 category];
  id v6 = [v4 name];
  responsivenessConfigForWhitelistedSubsystems = self->_responsivenessConfigForWhitelistedSubsystems;
  BOOL v8 = [v4 subsystem];

  v9 = [(NSDictionary *)responsivenessConfigForWhitelistedSubsystems objectForKeyedSubscript:v8];

  uint64_t v10 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedCategories objectForKeyedSubscript:v5];
  uint64_t v11 = [v10 objectForKey:@"kSTYLatencyThresholdInMs"];

  if (v11)
  {
    uint64_t v12 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedCategories objectForKeyedSubscript:v5];

    v9 = (void *)v12;
  }
  uint64_t v13 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedNames objectForKeyedSubscript:v6];
  BOOL v14 = [v13 objectForKey:@"kSTYLatencyThresholdInMs"];

  if (v14)
  {
    uint64_t v15 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedNames objectForKeyedSubscript:v6];

    v9 = (void *)v15;
  }
  v16 = [v9 objectForKeyedSubscript:@"kSTYLatencyThresholdInMs"];
  [v16 floatValue];
  float v18 = v17;

  return v18;
}

- (id)issueCategoryForSignpostInterval:(id)a3
{
  id v4 = [a3 name];
  id v5 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedNames objectForKeyedSubscript:v4];
  id v6 = [v5 objectForKeyedSubscript:@"issueCategory"];

  return v6;
}

- (float)framerateGoalsForSignpostInterval:(id)a3
{
  id v4 = a3;
  id v5 = [v4 category];
  id v6 = [v4 name];
  animationConfigForWhitelistedSubsystems = self->_animationConfigForWhitelistedSubsystems;
  BOOL v8 = [v4 subsystem];

  v9 = [(NSDictionary *)animationConfigForWhitelistedSubsystems objectForKeyedSubscript:v8];

  uint64_t v10 = [(NSDictionary *)self->_animationConfigForWhitelistedCategories objectForKeyedSubscript:v5];
  uint64_t v11 = [v10 objectForKey:@"kSTYFrameRateThreshold"];

  if (v11)
  {
    uint64_t v12 = [(NSDictionary *)self->_animationConfigForWhitelistedCategories objectForKeyedSubscript:v5];

    v9 = (void *)v12;
  }
  uint64_t v13 = [(NSDictionary *)self->_animationConfigForWhitelistedCategories objectForKeyedSubscript:v6];
  BOOL v14 = [v13 objectForKey:@"kSTYFrameRateThreshold"];

  if (v14)
  {
    uint64_t v15 = [(NSDictionary *)self->_animationConfigForWhitelistedNames objectForKeyedSubscript:v6];

    v9 = (void *)v15;
  }
  v16 = [v9 objectForKeyedSubscript:@"kSTYFrameRateThreshold"];
  [v16 floatValue];
  float v18 = v17;

  return v18;
}

- (BOOL)isResponsivenessScenarioWhitelisted:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedSubsystems allKeys];
  BOOL v8 = [v6 subsystem];
  int v9 = [v7 containsObject:v8];

  if (!v9)
  {
    v23 = +[STYFrameworkHelper sharedHelper];
    long long v20 = [v23 logHandle];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:](v6);
    }
    goto LABEL_16;
  }
  uint64_t v10 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedCategories allKeys];
  uint64_t v11 = [v6 category];
  int v12 = [v10 containsObject:v11];

  if (!v12)
  {
    uint64_t v24 = +[STYFrameworkHelper sharedHelper];
    long long v20 = [v24 logHandle];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:](v6);
    }
    goto LABEL_16;
  }
  uint64_t v13 = [(NSDictionary *)self->_responsivenessConfigForWhitelistedNames allKeys];
  BOOL v14 = [v6 name];
  char v15 = [v13 containsObject:v14];

  if ((v15 & 1) == 0)
  {
    v25 = +[STYFrameworkHelper sharedHelper];
    long long v20 = [v25 logHandle];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:](v6);
    }
    goto LABEL_16;
  }
  v16 = [v6 subsystem];
  if (([v16 isEqualToString:@"com.apple.app_launch_measurement"] & 1) == 0) {
    goto LABEL_22;
  }
  float v17 = [v6 category];
  if (([v17 isEqualToString:@"ApplicationLaunch"] & 1) == 0)
  {

LABEL_22:
    goto LABEL_23;
  }
  float v18 = [v6 name];
  int v19 = [v18 isEqualToString:@"ApplicationLaunchExtendedResponsive"];

  if (!v19)
  {
LABEL_23:
    BOOL v34 = 1;
    goto LABEL_20;
  }
  long long v20 = [v6 number1Name];
  if (([v20 isEqualToString:@"IsForeground"] & 1) == 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  long long v21 = [v6 number1Value];
  char v22 = [v21 isEqual:MEMORY[0x1E4F1CC38]];

  if (v22) {
    goto LABEL_23;
  }
LABEL_17:
  v26 = NSString;
  v27 = [v6 subsystem];
  v28 = [v6 category];
  uint64_t v29 = [v6 name];
  v30 = [v26 stringWithFormat:@"scenario %@.%@.%@ is not whitelisted", v27, v28, v29];

  uint64_t v36 = *MEMORY[0x1E4F28568];
  v31 = [MEMORY[0x1E4F28B50] mainBundle];
  v32 = [v31 localizedStringForKey:v30 value:&stru_1F2A289A0 table:0];
  v37[0] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:STYUserScenarioErrorDomain code:-2000 userInfo:v33];
  }

  BOOL v34 = 0;
LABEL_20:

  return v34;
}

- (BOOL)isAnimationScenarioWhitelisted:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_animationConfigForWhitelistedSubsystems allKeys];
  BOOL v8 = [v6 subsystem];
  int v9 = [v7 containsObject:v8];

  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [(NSDictionary *)self->_animationConfigForWhitelistedCategories allKeys];
  uint64_t v11 = [v6 category];
  int v12 = [v10 containsObject:v11];

  if (!v12) {
    goto LABEL_5;
  }
  uint64_t v13 = [(NSDictionary *)self->_animationConfigForWhitelistedNames allKeys];
  BOOL v14 = [v6 name];
  char v15 = [v13 containsObject:v14];

  if (v15)
  {
    BOOL v16 = 1;
  }
  else
  {
LABEL_5:
    float v17 = NSString;
    float v18 = [v6 subsystem];
    int v19 = [v6 category];
    long long v20 = [v6 name];
    long long v21 = [v17 stringWithFormat:@"scenario %@.%@.%@ is not whitelisted", v18, v19, v20];

    uint64_t v26 = *MEMORY[0x1E4F28568];
    char v22 = [MEMORY[0x1E4F28B50] mainBundle];
    v23 = [v22 localizedStringForKey:v21 value:&stru_1F2A289A0 table:0];
    v27[0] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:STYUserScenarioErrorDomain code:-2000 userInfo:v24];
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)scenarioWhitelisted:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 subsystem],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:@"com.apple.SpringBoard"],
        v7,
        (v8 & 1) == 0))
  {
    BOOL v9 = [(STYUserScenarioCache *)self isAnimationScenarioWhitelisted:v6 error:a4];
  }
  else
  {
    BOOL v9 = [(STYUserScenarioCache *)self isResponsivenessScenarioWhitelisted:v6 error:a4];
  }
  BOOL v10 = v9;

  return v10;
}

- (id)appNameFromBundleId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_bundleIdForAppName;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](self->_bundleIdForAppName, "objectForKeyedSubscript:", v10, (void)v15);
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)processWhitelisted:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)processBundleIdForSignpostInterval:(id)a3
{
  id v4 = a3;
  if ([v4 scope]
    && ([v4 subsystem],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"com.apple.hangtracer.signposts"],
        v5,
        !v6))
  {
    uint64_t v8 = NSString;
    bundleIdForAppName = self->_bundleIdForAppName;
    BOOL v10 = [v4 endEvent];
    uint64_t v11 = [v10 processName];
    char v12 = [(NSDictionary *)bundleIdForAppName objectForKeyedSubscript:v11];
    uint64_t v7 = [v8 stringWithFormat:@"%@", v12];
  }
  else
  {
    uint64_t v7 = [v4 string1Value];
  }

  return v7;
}

- (int)processIdForSignpostEvent:(id)a3
{
  return [a3 processID];
}

- (id)scenarioGroupForSignpostInterval:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = [v4 subsystem];
  int v6 = [v4 category];
  uint64_t v7 = [v4 name];

  uint64_t v8 = [v3 stringWithFormat:@"%@.%@.%@", v5, v6, v7];

  return v8;
}

- (BOOL)kpiIsLatency:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 subsystem];
    char v5 = [v4 isEqualToString:@"com.apple.SpringBoard"];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (id)scenarioFromSignpostInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(STYUserScenarioCache *)self processWhitelisted:v6 error:a4]
    && [(STYUserScenarioCache *)self scenarioWhitelisted:v6 error:a4])
  {
    uint64_t v7 = [(STYUserScenarioCache *)self scenarioIdForSignpostInterval:v6];
    uint64_t v8 = [(STYUserScenarioCache *)self scenarioGroupForSignpostInterval:v6];
    BOOL v9 = [(STYUserScenarioCache *)self processBundleIdForSignpostInterval:v6];
    BOOL v10 = [v6 endEvent];
    int v11 = [(STYUserScenarioCache *)self processIdForSignpostEvent:v10];

    objc_opt_class();
    uint64_t v12 = -1000;
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v6 subsystem];
      int v14 = [v13 isEqualToString:@"com.apple.SpringBoard"];

      if (v14) {
        uint64_t v12 = -1000;
      }
      else {
        uint64_t v12 = -1001;
      }
    }
    if ([(STYUserScenarioCache *)self kpiIsLatency:v6]) {
      uint64_t v15 = -1000;
    }
    else {
      uint64_t v15 = v12;
    }
    long long v16 = [STYUserScenario alloc];
    long long v17 = [v6 beginEvent];
    long long v18 = [v17 processName];
    LODWORD(v21) = v11;
    int v19 = [(STYUserScenario *)v16 initWithConfiguration:v7 scenarioGroup:v8 kpi:v15 processBundleID:v9 titleText:0 processName:v18 processID:v21];
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (id)scenarioForFrontboardLaunchWatchdog:(id)a3
{
  id v4 = a3;
  char v5 = [v4 processName];
  id v6 = [v4 attributes];
  uint64_t v7 = [v6 valueForKey:@"BundleIdOverride"];

  if (v7)
  {
    id v8 = v7;

    char v5 = v8;
  }
  BOOL v9 = NSString;
  BOOL v10 = [v4 subsystem];
  int v11 = [v4 category];
  uint64_t v12 = [v4 name];
  id v13 = [v9 stringWithFormat:@"%@.%@.%@.%@", v10, v11, v12, v5];

  int v14 = NSString;
  uint64_t v15 = [v4 subsystem];
  long long v16 = [v4 category];
  long long v17 = [v4 name];
  long long v18 = [v14 stringWithFormat:@"%@.%@.%@", v15, v16, v17];

  LODWORD(v21) = [(STYUserScenarioCache *)self processIdForSignpostEvent:v4];
  int v19 = [[STYUserScenario alloc] initWithConfiguration:v13 scenarioGroup:v18 kpi:-1000 processBundleID:v7 titleText:0 processName:v5 processID:v21];

  return v19;
}

- (id)scenarioFromSignpostEvent:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 subsystem];
  if (![v7 isEqualToString:@"com.apple.FrontBoard"]) {
    goto LABEL_6;
  }
  id v8 = [v6 category];
  if (([v8 isEqualToString:@"Watchdog"] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v9 = [v6 name];
  int v10 = [v9 isEqualToString:@"WatchdogKill"];

  if (v10)
  {
    int v11 = [(STYUserScenarioCache *)self scenarioForFrontboardLaunchWatchdog:v6];
    goto LABEL_10;
  }
LABEL_7:
  if (*a4)
  {
    uint64_t v16 = *MEMORY[0x1E4F28568];
    uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
    id v13 = [v12 localizedStringForKey:@"Signpost is not whitelisted." value:&stru_1F2A289A0 table:0];
    v17[0] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:STYUserScenarioErrorDomain code:-2000 userInfo:v14];
  }
  int v11 = 0;
LABEL_10:

  return v11;
}

+ (id)sharedCache
{
  if (sharedCache_setup != -1) {
    dispatch_once(&sharedCache_setup, &__block_literal_global_6);
  }
  v2 = (void *)sharedCache_sharedInstance;
  return v2;
}

uint64_t __35__STYUserScenarioCache_sharedCache__block_invoke()
{
  sharedCache_sharedInstance = [[STYUserScenarioCache alloc] initWithPlatform:@"iOS"];
  return MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)scenarioObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScenarioObjects:(id)a3
{
}

- (NSDictionary)bundleIdForAppName
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdForAppName:(id)a3
{
}

- (NSString)hwModel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHwModel:(id)a3
{
}

- (NSError)badConfigError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBadConfigError:(id)a3
{
}

- (NSError)bundledIdLookupFailedrror
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundledIdLookupFailedrror:(id)a3
{
}

- (NSDictionary)responsivenessConfigForWhitelistedSubsystems
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResponsivenessConfigForWhitelistedSubsystems:(id)a3
{
}

- (NSDictionary)responsivenessConfigForWhitelistedCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponsivenessConfigForWhitelistedCategories:(id)a3
{
}

- (NSDictionary)responsivenessConfigForWhitelistedNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponsivenessConfigForWhitelistedNames:(id)a3
{
}

- (NSDictionary)animationConfigForWhitelistedSubsystems
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAnimationConfigForWhitelistedSubsystems:(id)a3
{
}

- (NSDictionary)animationConfigForWhitelistedCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAnimationConfigForWhitelistedCategories:(id)a3
{
}

- (NSDictionary)animationConfigForWhitelistedNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAnimationConfigForWhitelistedNames:(id)a3
{
}

- (NSMutableDictionary)lifecycleScenarios
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLifecycleScenarios:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleScenarios, 0);
  objc_storeStrong((id *)&self->_animationConfigForWhitelistedNames, 0);
  objc_storeStrong((id *)&self->_animationConfigForWhitelistedCategories, 0);
  objc_storeStrong((id *)&self->_animationConfigForWhitelistedSubsystems, 0);
  objc_storeStrong((id *)&self->_responsivenessConfigForWhitelistedNames, 0);
  objc_storeStrong((id *)&self->_responsivenessConfigForWhitelistedCategories, 0);
  objc_storeStrong((id *)&self->_responsivenessConfigForWhitelistedSubsystems, 0);
  objc_storeStrong((id *)&self->_bundledIdLookupFailedrror, 0);
  objc_storeStrong((id *)&self->_badConfigError, 0);
  objc_storeStrong((id *)&self->_hwModel, 0);
  objc_storeStrong((id *)&self->_bundleIdForAppName, 0);
  objc_storeStrong((id *)&self->_scenarioObjects, 0);
}

- (void)loadWhitelist:platform:bundles:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D3037000, v0, OS_LOG_TYPE_ERROR, "Unable to load plist: %@", v1, 0xCu);
}

- (void)isResponsivenessScenarioWhitelisted:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v2, v3, "Name %@ is not whitelisted", v4, v5, v6, v7, v8);
}

- (void)isResponsivenessScenarioWhitelisted:(void *)a1 error:.cold.2(void *a1)
{
  v1 = [a1 category];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v2, v3, "Category %@ is not whitelisted", v4, v5, v6, v7, v8);
}

- (void)isResponsivenessScenarioWhitelisted:(void *)a1 error:.cold.3(void *a1)
{
  v1 = [a1 subsystem];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3037000, v2, v3, "Subsystem %@ is not whitelisted", v4, v5, v6, v7, v8);
}

@end