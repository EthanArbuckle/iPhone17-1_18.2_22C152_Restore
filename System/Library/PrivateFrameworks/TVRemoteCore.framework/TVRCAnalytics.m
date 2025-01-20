@interface TVRCAnalytics
+ (id)sharedInstance;
- (id)_connectionDictionaryForType:(id)a3 status:(id)a4 reason:(id)a5;
- (id)_presentationSourceEventDictionaryFor:(id)a3;
- (id)_spinnerShownDictionaryFor:(id)a3;
- (void)logConnectingSpinnerShown:(id)a3;
- (void)logConnectionStatus:(int64_t)a3 type:(int64_t)a4 reason:(int64_t)a5;
- (void)logDeviceQueryCount:(unint64_t)a3;
- (void)logFindingSessionStatistics:(id)a3;
- (void)logPresentationFrom:(id)a3;
- (void)logSearchingSpinnerShown;
- (void)logSessionStatistics:(id)a3;
- (void)logShortcutActionRunWithType:(id)a3;
@end

@implementation TVRCAnalytics

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __31__TVRCAnalytics_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)logPresentationFrom:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

uint64_t __37__TVRCAnalytics_logPresentationFrom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentationSourceEventDictionaryFor:*(void *)(a1 + 40)];
}

- (id)_presentationSourceEventDictionaryFor:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v7 = @"source";
  v8[0] = a3;
  id v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)logConnectingSpinnerShown:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __43__TVRCAnalytics_logConnectingSpinnerShown___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
    id v3 = [*(id *)(a1 + 40) _spinnerShownDictionaryFor:@"connecting"];
    [v2 addEntriesFromDictionary:v3];
  }
  else
  {
    v2 = [*(id *)(a1 + 40) _spinnerShownDictionaryFor:@"connecting"];
  }

  return v2;
}

- (void)logSearchingSpinnerShown
{
}

uint64_t __41__TVRCAnalytics_logSearchingSpinnerShown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _spinnerShownDictionaryFor:@"searching"];
}

- (id)_spinnerShownDictionaryFor:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v7 = @"type";
  v8[0] = a3;
  id v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)logDeviceQueryCount:(unint64_t)a3
{
}

id __37__TVRCAnalytics_logDeviceQueryCount___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"deviceQueryCount";
  v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)logConnectionStatus:(int64_t)a3 type:(int64_t)a4 reason:(int64_t)a5
{
  if ((unint64_t)(a3 - 1) > 2) {
    v7 = &stru_26DA49BC8;
  }
  else {
    v7 = off_2647AF628[a3 - 1];
  }
  v8 = TVRCDeviceConnectionTypeDescription(a4);
  if (a3 == 1)
  {
    if ((unint64_t)(a5 - 1) > 3) {
      v9 = @"undefinedReason";
    }
    else {
      v9 = off_2647AF640[a5 - 1];
    }
  }
  else
  {
    v9 = &stru_26DA49BC8;
  }
  v11 = v8;
  v12 = v9;
  id v10 = v8;
  AnalyticsSendEventLazy();
}

uint64_t __49__TVRCAnalytics_logConnectionStatus_type_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionDictionaryForType:*(void *)(a1 + 40) status:*(void *)(a1 + 48) reason:*(void *)(a1 + 56)];
}

- (id)_connectionDictionaryForType:(id)a3 status:(id)a4 reason:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:@"type"];
  }
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:@"status"];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:@"reason"];
  }

  return v11;
}

- (void)logShortcutActionRunWithType:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __46__TVRCAnalytics_logShortcutActionRunWithType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"type";
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)logSessionStatistics:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  v5 = [v3 sessionStartTime];

  if (v5)
  {
    v6 = [v3 sessionStartTime];
    [v6 timeIntervalSinceNow];
    double v8 = fabs(v7);

    id v9 = [NSNumber numberWithDouble:v8];
    [v4 setObject:v9 forKeyedSubscript:@"duration"];
  }
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "usedRTI"));
  [v4 setObject:v10 forKeyedSubscript:@"usedRTI"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "usedSiri"));
  [v4 setObject:v11 forKeyedSubscript:@"usedSiri"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requiredPairing"));
  [v4 setObject:v12 forKeyedSubscript:@"requiredPairing"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "directionalControlsEnabled"));
  [v4 setObject:v13 forKeyedSubscript:@"dcontrolsEnabled"];

  v14 = [v3 launchContextDesc];

  if (v14)
  {
    v15 = [v3 launchContextDesc];
    [v4 setObject:v15 forKeyedSubscript:@"launchContext"];
  }
  v17 = v4;
  id v16 = v4;
  AnalyticsSendEventLazy();
}

id __38__TVRCAnalytics_logSessionStatistics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logFindingSessionStatistics:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionaryWithCapacity:10];
  v6 = NSNumber;
  double v7 = [v4 sessionEndTime];
  double v8 = [v4 sessionStartTime];
  [v7 timeIntervalSinceDate:v8];
  id v9 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v9 forKeyedSubscript:@"sessionDuration"];

  id v10 = NSNumber;
  v11 = [v4 firstMeasurementTime];
  v12 = [v4 sessionStartTime];
  [v11 timeIntervalSinceDate:v12];
  v13 = objc_msgSend(v10, "numberWithDouble:");
  [v5 setObject:v13 forKeyedSubscript:@"timeToFirstMeasurement"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "remoteIsConnectedToATV"));
  [v5 setObject:v14 forKeyedSubscript:@"remoteIsConnectedToATV"];

  v15 = NSNumber;
  [v4 startingProximityMeasurement];
  id v16 = objc_msgSend(v15, "numberWithDouble:");
  [v5 setObject:v16 forKeyedSubscript:@"startingProximityMeasurement"];

  v17 = NSNumber;
  [v4 endingProximityMeasurement];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v5 setObject:v18 forKeyedSubscript:@"endingProximityMeasurement"];

  v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "numberOfGotCloserRegionTransitions"));
  [v5 setObject:v19 forKeyedSubscript:@"numberOfGotCloserRegionTransitions"];

  v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "numberOfGotFartherRegionTransitions"));
  [v5 setObject:v20 forKeyedSubscript:@"numberOfGotFartherRegionTransitions"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "gotToHere"));
  [v5 setObject:v21 forKeyedSubscript:@"gotToHere"];

  v22 = NSNumber;
  [v4 timeToHere];
  double v24 = v23;

  v25 = [v22 numberWithDouble:v24];
  [v5 setObject:v25 forKeyedSubscript:@"timeToHere"];

  v27 = v5;
  id v26 = v5;
  AnalyticsSendEventLazy();
}

id __45__TVRCAnalytics_logFindingSessionStatistics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end