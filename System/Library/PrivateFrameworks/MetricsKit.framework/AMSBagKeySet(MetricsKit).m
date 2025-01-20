@interface AMSBagKeySet(MetricsKit)
+ (void)registerBagKeySetForMetricsConfiguration:()MetricsKit;
+ (void)registerBagKeySetForMetricsRecorder:()MetricsKit;
@end

@implementation AMSBagKeySet(MetricsKit)

+ (void)registerBagKeySetForMetricsRecorder:()MetricsKit
{
  v3 = (void *)MEMORY[0x263F27D38];
  id v4 = a3;
  id v8 = [v3 bagKeySet];
  v5 = (void *)MEMORY[0x263F27B38];
  v6 = [v4 profile];
  v7 = [v4 profileVersion];

  [v5 registerBagKeySet:v8 forProfile:v6 profileVersion:v7];
}

+ (void)registerBagKeySetForMetricsConfiguration:()MetricsKit
{
  id v3 = a3;
  id v7 = (id)objc_opt_new();
  [v7 addBagKey:@"metrics" valueType:6];
  id v4 = (void *)MEMORY[0x263F27B38];
  v5 = [v3 profile];
  v6 = [v3 profileVersion];

  [v4 registerBagKeySet:v7 forProfile:v5 profileVersion:v6];
}

@end