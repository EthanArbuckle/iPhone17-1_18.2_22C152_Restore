@interface BKHIDUISensorConfiguratorFactory
+ (id)_digitizerServiceWrapper;
+ (id)_proximityServiceWrapper;
+ (id)sensorConfiguratorForCurrentPlatform;
@end

@implementation BKHIDUISensorConfiguratorFactory

+ (id)_digitizerServiceWrapper
{
  v5[0] = @"DeviceUsagePage";
  v5[1] = @"Built-In";
  v6[0] = &off_1001035F8;
  v6[1] = &__kCFBooleanTrue;
  v5[2] = @"DisplayIntegrated";
  v6[2] = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  v3 = [[BKHIDUISensorServiceMatchingWrapper alloc] initWithMatchingDictionary:v2 instantiateWrapperUsingBlock:&stru_1000F77F8];

  return v3;
}

+ (id)_proximityServiceWrapper
{
  v5[0] = @"DeviceUsagePage";
  v5[1] = @"DeviceUsage";
  v6[0] = &off_1001035C8;
  v6[1] = &off_1001035E0;
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v3 = [[BKHIDUISensorServiceMatchingWrapper alloc] initWithMatchingDictionary:v2 instantiateWrapperUsingBlock:&stru_1000F77D8];

  return v3;
}

+ (id)sensorConfiguratorForCurrentPlatform
{
  v3 = +[BSPlatform sharedInstance];
  unsigned int v4 = [v3 deviceClass];

  if (v4)
  {
    v5 = [a1 _digitizerServiceWrapper];
  }
  else
  {
    v6 = [a1 _proximityServiceWrapper];
    v7 = [a1 _digitizerServiceWrapper];
    v5 = objc_alloc_init(BKHIDUIServiceConfiguringAggregator);
    v13[0] = v7;
    v13[1] = v6;
    v8 = +[NSArray arrayWithObjects:v13 count:2];
    [(BKHIDUIServiceConfiguringAggregator *)v5 setServiceConfigurings:v8];
  }
  v9 = BKLogUISensor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UI sensor configuration: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  return v5;
}

@end