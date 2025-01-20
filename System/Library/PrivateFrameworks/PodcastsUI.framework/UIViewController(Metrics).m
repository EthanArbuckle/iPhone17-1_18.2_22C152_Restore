@interface UIViewController(Metrics)
+ (uint64_t)_rewriteOnce;
+ (void)swizzleMethodsForMetrics;
- (id)metricDataSource;
- (id)metricsName;
- (uint64_t)isUIKitClass;
- (uint64_t)metricsAdditionalData;
- (uint64_t)metricsContentIdentifier;
- (uint64_t)metricsEnabled;
- (uint64_t)setMetricsAdditionalData:()Metrics;
- (uint64_t)setMetricsContentIdentifier:()Metrics;
- (uint64_t)setMetricsEnabled:()Metrics;
- (uint64_t)setMetricsName:()Metrics;
- (uint64_t)setViewWillAppearTime:()Metrics;
- (uint64_t)viewWillAppearTime;
- (void)recordViewDidAppearEvent;
- (void)setMetricDataSource:()Metrics;
@end

@implementation UIViewController(Metrics)

- (uint64_t)metricsContentIdentifier
{
  return [MEMORY[0x1E4F91F40] associatedValueForKey:@"UIViewController+Metrics-metricsContentIdentifier" onObject:a1];
}

- (uint64_t)metricsAdditionalData
{
  return [MEMORY[0x1E4F91F40] associatedValueForKey:@"UIViewController+Metrics-metricsAdditionalData" onObject:a1];
}

- (void)recordViewDidAppearEvent
{
  if ([a1 metricsEnabled])
  {
    id v5 = (id)objc_opt_new();
    v2 = [a1 metricsName];
    [v5 setPageType:v2];

    v3 = (void *)MEMORY[0x1E4F91F30];
    v4 = [a1 metricDataSource];
    [v3 configureEvent:v5 withDataSource:v4];

    [MEMORY[0x1E4F91F18] recordEvent:v5];
  }
}

- (id)metricsName
{
  v2 = (void *)MEMORY[0x1E4F91F40];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [v2 associatedValueForKey:@"UIViewController+Metrics-metricsName" onObject:a1 withDefault:v4];

  return v5;
}

- (uint64_t)metricsEnabled
{
  v2 = (void *)MEMORY[0x1E4F91F40];
  uint64_t v3 = [a1 isUIKitClass] ^ 1;

  return [v2 associatedBoolValueForKey:@"UIViewController+Metrics-metricsEnabled" onObject:a1 withDefault:v3];
}

- (id)metricDataSource
{
  v1 = [MEMORY[0x1E4F91F40] associatedValueForKey:@"UIViewController+Metrics-metricsDataSource" onObject:a1 withDefault:a1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 object];
  }
  else
  {
    id v2 = v1;
  }
  uint64_t v3 = v2;

  return v3;
}

- (uint64_t)isUIKitClass
{
  id v2 = [MEMORY[0x1E4F91F40] associatedValueForKey:@"UIViewController+Metrics-isUIKitClass" onObject:a1];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v4 = ([v6 hasPrefix:@"UI"] & 1) != 0
      || ([v6 hasPrefix:@"_UI"] & 1) != 0
      || [v6 hasPrefix:@"_NC"];
    [MEMORY[0x1E4F91F40] associateBoolValue:v4 forKey:@"UIViewController+Metrics-isUIKitClass" onObject:a1];
  }
  return v4;
}

- (uint64_t)setViewWillAppearTime:()Metrics
{
  return objc_msgSend(MEMORY[0x1E4F91F40], "associateDoubleValue:forKey:onObject:", @"UIViewController+Metrics-viewWillAppearTime", a1);
}

+ (uint64_t)_rewriteOnce
{
  v0 = (void *)MEMORY[0x1E4F91F40];
  uint64_t v1 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__UIViewController_Metrics___rewriteOnce__block_invoke;
  v6[3] = &__block_descriptor_40_e10___16__0__8l;
  v6[4] = sel_viewWillAppear_;
  [v0 swizzleMethod:sel_viewWillAppear_ onClass:v1 withReplacementBlock:v6];
  id v2 = (void *)MEMORY[0x1E4F91F40];
  uint64_t v3 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__UIViewController_Metrics___rewriteOnce__block_invoke_3;
  v5[3] = &__block_descriptor_40_e10___16__0__8l;
  v5[4] = sel_viewDidAppear_;
  return [v2 swizzleMethod:sel_viewDidAppear_ onClass:v3 withReplacementBlock:v5];
}

+ (void)swizzleMethodsForMetrics
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIViewController_Metrics__swizzleMethodsForMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (swizzleMethodsForMetrics_onceToken[0] != -1) {
    dispatch_once(swizzleMethodsForMetrics_onceToken, block);
  }
}

- (uint64_t)viewWillAppearTime
{
  return [MEMORY[0x1E4F91F40] associatedDoubleValueForKey:@"UIViewController+Metrics-viewWillAppearTime" onObject:a1 withDefault:0.0];
}

- (uint64_t)setMetricsEnabled:()Metrics
{
  return [MEMORY[0x1E4F91F40] associateBoolValue:a3 forKey:@"UIViewController+Metrics-metricsEnabled" onObject:a1];
}

- (uint64_t)setMetricsName:()Metrics
{
  return [MEMORY[0x1E4F91F40] associateValue:a3 forKey:@"UIViewController+Metrics-metricsName" onObject:a1];
}

- (uint64_t)setMetricsContentIdentifier:()Metrics
{
  return [MEMORY[0x1E4F91F40] associateValue:a3 forKey:@"UIViewController+Metrics-metricsContentIdentifier" onObject:a1];
}

- (uint64_t)setMetricsAdditionalData:()Metrics
{
  return [MEMORY[0x1E4F91F40] associateValue:a3 forKey:@"UIViewController+Metrics-metricsAdditionalData" onObject:a1];
}

- (void)setMetricDataSource:()Metrics
{
  id v4 = a3;
  id v5 = [[MTWeakReference alloc] initWithObject:v4];

  [MEMORY[0x1E4F91F40] associateValue:v5 forKey:@"UIViewController+Metrics-metricsDataSource" onObject:a1 withPolicy:1];
}

@end