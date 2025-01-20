@interface HVUserDefaults
+ (BOOL)harvestBudgetDisabled;
+ (BOOL)harvestBudgetRefillDisabled;
+ (BOOL)harvestBudgetThrottleBudgetDisabled;
+ (double)harvestBudgetCPUTimeSeconds;
+ (double)harvestBudgetReserve;
+ (id)defaults;
+ (id)sharedInstance;
+ (int64_t)harvestBudgetNumberOfOperations;
+ (void)resetHarvestBudgetCPUTimeSeconds;
+ (void)resetHarvestBudgetDisabled;
+ (void)resetHarvestBudgetNumberOfOperations;
+ (void)resetHarvestBudgetRefillDisabled;
+ (void)resetHarvestBudgetReserve;
+ (void)resetHarvestBudgetThrottleBudgetDisabled;
+ (void)setHarvestBudgetCPUTimeSeconds:(double)a3;
+ (void)setHarvestBudgetDisabled:(BOOL)a3;
+ (void)setHarvestBudgetNumberOfOperations:(int64_t)a3;
+ (void)setHarvestBudgetRefillDisabled:(BOOL)a3;
+ (void)setHarvestBudgetReserve:(double)a3;
+ (void)setHarvestBudgetThrottleBudgetDisabled:(BOOL)a3;
- (HVUserDefaults)init;
- (id)defaults;
@end

@implementation HVUserDefaults

- (void).cxx_destruct
{
}

- (id)defaults
{
  return self->_defaults;
}

- (HVUserDefaults)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)HVUserDefaults;
  v2 = [(HVUserDefaults *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ProactiveHarvesting"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    if (!v2->_defaults)
    {
      v5 = hv_default_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = @"com.apple.ProactiveHarvesting";
        _os_log_error_impl(&dword_226C41000, v5, OS_LOG_TYPE_ERROR, "HVContentAdmission failed to get NSUserDefaults for suite %@.", buf, 0xCu);
      }
    }
  }
  return v2;
}

+ (void)resetHarvestBudgetRefillDisabled
{
  id v2 = [a1 defaults];
  [v2 removeObjectForKey:@"HVHarvestBudgetRefillDisabled"];
}

+ (void)setHarvestBudgetRefillDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 defaults];
  [v4 setBool:v3 forKey:@"HVHarvestBudgetRefillDisabled"];
}

+ (BOOL)harvestBudgetRefillDisabled
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"HVHarvestBudgetRefillDisabled"];

  return v3;
}

+ (void)resetHarvestBudgetThrottleBudgetDisabled
{
  id v2 = [a1 defaults];
  [v2 removeObjectForKey:@"HVHarvestBudgetThrottleBudgetDisabled"];
}

+ (void)setHarvestBudgetThrottleBudgetDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 defaults];
  [v4 setBool:v3 forKey:@"HVHarvestBudgetThrottleBudgetDisabled"];
}

+ (BOOL)harvestBudgetThrottleBudgetDisabled
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"HVHarvestBudgetThrottleBudgetDisabled"];

  return v3;
}

+ (void)resetHarvestBudgetDisabled
{
  id v2 = [a1 defaults];
  [v2 removeObjectForKey:@"HVHarvestBudgetDisabled"];
}

+ (void)setHarvestBudgetDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 defaults];
  [v4 setBool:v3 forKey:@"HVHarvestBudgetDisabled"];
}

+ (BOOL)harvestBudgetDisabled
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"HVHarvestBudgetDisabled"];

  return v3;
}

+ (void)resetHarvestBudgetReserve
{
  id v2 = [a1 defaults];
  [v2 removeObjectForKey:@"HVHarvestBudgetReserve"];
}

+ (void)setHarvestBudgetReserve:(double)a3
{
  id v4 = [a1 defaults];
  [v4 setDouble:@"HVHarvestBudgetReserve" forKey:a3];
}

+ (double)harvestBudgetReserve
{
  id v2 = [a1 defaults];
  char v3 = [v2 objectForKey:@"HVHarvestBudgetReserve"];

  double v4 = 0.95;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }

  return v4;
}

+ (void)resetHarvestBudgetCPUTimeSeconds
{
  id v2 = [a1 defaults];
  [v2 removeObjectForKey:@"HVHarvestBudgetCPUTimeSeconds"];
}

+ (void)setHarvestBudgetCPUTimeSeconds:(double)a3
{
  id v4 = [a1 defaults];
  [v4 setDouble:@"HVHarvestBudgetCPUTimeSeconds" forKey:a3];
}

+ (double)harvestBudgetCPUTimeSeconds
{
  id v2 = [a1 defaults];
  char v3 = [v2 objectForKey:@"HVHarvestBudgetCPUTimeSeconds"];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    char v3 = &unk_26DACF3A8;
  }
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (void)resetHarvestBudgetNumberOfOperations
{
  id v2 = [a1 defaults];
  [v2 removeObjectForKey:@"HVHarvestBudgetNumberOfOperations"];
}

+ (void)setHarvestBudgetNumberOfOperations:(int64_t)a3
{
  id v4 = [a1 defaults];
  [v4 setInteger:a3 forKey:@"HVHarvestBudgetNumberOfOperations"];
}

+ (int64_t)harvestBudgetNumberOfOperations
{
  id v2 = [a1 defaults];
  char v3 = [v2 objectForKey:@"HVHarvestBudgetNumberOfOperations"];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    char v3 = &unk_26DACF380;
  }
  int64_t v4 = [v3 integerValue];

  return v4;
}

+ (id)defaults
{
  id v2 = +[HVUserDefaults sharedInstance];
  char v3 = [v2 defaults];

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HVUserDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken3_905 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3_905, block);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_906;

  return v2;
}

void __32__HVUserDefaults_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance__pasExprOnceResult_906;
  sharedInstance__pasExprOnceResult_906 = v1;
}

@end