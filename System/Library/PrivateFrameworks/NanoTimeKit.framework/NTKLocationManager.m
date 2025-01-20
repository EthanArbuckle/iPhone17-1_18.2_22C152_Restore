@interface NTKLocationManager
+ (id)fallbackLocation;
+ (id)sharedLocationManager;
- (id)anyLocation;
- (id)currentLocation;
- (id)previousLocation;
- (id)startLocationUpdatesWithIdentifier:(id)a3 handler:(id)a4;
- (id)startLocationUpdatesWithIdentifier:(id)a3 wantsGroundElevation:(BOOL)a4 handler:(id)a5;
- (void)stopLocationUpdatesForToken:(id)a3;
@end

@implementation NTKLocationManager

+ (id)sharedLocationManager
{
  if (sharedLocationManager_onceToken != -1) {
    dispatch_once(&sharedLocationManager_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)sharedLocationManager_locationManager;

  return v2;
}

void __43__NTKLocationManager_sharedLocationManager__block_invoke()
{
  v0 = objc_alloc_init(NTKSimulatedLocationManager);
  v1 = (void *)sharedLocationManager_locationManager;
  sharedLocationManager_locationManager = (uint64_t)v0;
}

+ (id)fallbackLocation
{
  CLLocationCoordinate2D v2 = CLLocationCoordinate2DMake(37.3353672, -122.011737);
  id v3 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  double v4 = *MEMORY[0x1E4F1E6D8];
  double v5 = *MEMORY[0x1E4F1E718];
  v6 = +[CLKDate unmodifiedDate];
  v7 = objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v6, v2.latitude, v2.longitude, 48.768, v4, v5);

  return v7;
}

- (id)anyLocation
{
  CLLocationCoordinate2D v2 = objc_opt_class();

  return (id)[v2 fallbackLocation];
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  return &stru_1F1635E90;
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 wantsGroundElevation:(BOOL)a4 handler:(id)a5
{
  return &stru_1F1635E90;
}

- (void)stopLocationUpdatesForToken:(id)a3
{
  OUTLINED_FUNCTION_1_6();

  NSRequestConcreteImplementation();
}

- (id)currentLocation
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1();
  CLLocationCoordinate2D v2 = objc_opt_class();

  return (id)[v2 fallbackLocation];
}

- (id)previousLocation
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1();
  CLLocationCoordinate2D v2 = objc_opt_class();

  return (id)[v2 fallbackLocation];
}

@end