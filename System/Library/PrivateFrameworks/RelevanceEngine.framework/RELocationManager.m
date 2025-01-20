@interface RELocationManager
+ (RELocationManager)locationManager;
+ (RELocationManager)locationManagerWithAuthorizationBundlePath:(id)a3;
+ (RELocationManager)simulatedLocationManager;
- (id)currentLocation;
@end

@implementation RELocationManager

uint64_t __45__RELocationManager_simulatedLocationManager__block_invoke()
{
  simulatedLocationManager_SimulatedManager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (RELocationManager)simulatedLocationManager
{
  if (simulatedLocationManager_onceToken != -1) {
    dispatch_once(&simulatedLocationManager_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)simulatedLocationManager_SimulatedManager;
  return (RELocationManager *)v2;
}

+ (RELocationManager)locationManager
{
  v2 = objc_opt_new();
  return (RELocationManager *)v2;
}

+ (RELocationManager)locationManagerWithAuthorizationBundlePath:(id)a3
{
  id v3 = a3;
  v4 = [[_RECoreLocationLocationManager alloc] initWithEffectiveBundlePath:v3];

  return (RELocationManager *)v4;
}

- (id)currentLocation
{
  return 0;
}

@end