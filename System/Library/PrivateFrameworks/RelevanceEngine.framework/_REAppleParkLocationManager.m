@interface _REAppleParkLocationManager
- (id)currentLocation;
- (void)startLocationUpdatesWithHandler:(id)a3;
@end

@implementation _REAppleParkLocationManager

- (id)currentLocation
{
  if (currentLocation_onceToken != -1) {
    dispatch_once(&currentLocation_onceToken, &__block_literal_global_14_0);
  }
  v2 = (void *)CFPreferencesCopyAppValue(@"RESimulatedLocationKey", @"com.apple.RelevanceEngine");
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F00A50]);
    v4 = [v2 objectForKeyedSubscript:@"lat"];
    [v4 doubleValue];
    double v6 = v5;
    v7 = [v2 objectForKeyedSubscript:@"long"];
    [v7 doubleValue];
    uint64_t v9 = [v3 initWithLatitude:v6 longitude:v8];
    v10 = (void *)currentLocation_AppleParkLocation;
    currentLocation_AppleParkLocation = v9;
  }
  id v11 = (id)currentLocation_AppleParkLocation;

  return v11;
}

- (void)startLocationUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63___REAppleParkLocationManager_startLocationUpdatesWithHandler___block_invoke;
  v6[3] = &unk_2644BCCD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

@end