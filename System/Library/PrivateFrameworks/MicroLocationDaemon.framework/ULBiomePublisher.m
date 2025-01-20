@interface ULBiomePublisher
+ (void)_saveEventsWithSource:(id)a3 events:(id)a4;
+ (void)saveEventForDebugInitialBringUp;
+ (void)saveMicroLocationLocalizationEvents:(id)a3;
+ (void)saveMicroLocationVisitEvents:(id)a3;
@end

@implementation ULBiomePublisher

+ (void)saveMicroLocationLocalizationEvents:(id)a3
{
  id v4 = a3;
  BiomeLibrary();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v9 Location];
  v6 = [v5 MicroLocation];
  v7 = [v6 Localization];
  v8 = [v7 source];
  [a1 _saveEventsWithSource:v8 events:v4];
}

+ (void)saveMicroLocationVisitEvents:(id)a3
{
  id v4 = a3;
  BiomeLibrary();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v8 Location];
  v6 = [v5 MicroLocationVisit];
  v7 = [v6 source];
  [a1 _saveEventsWithSource:v7 events:v4];
}

+ (void)saveEventForDebugInitialBringUp
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F2A2E0]);
  id v4 = [MEMORY[0x263EFF910] now];
  v5 = [MEMORY[0x263EFF8C0] array];
  v6 = [MEMORY[0x263EFF8C0] array];
  v7 = (void *)[v3 initWithAbsoluteTimeStamp:v4 clientBundleID:@"com.apple.milod" maxProbabilityLabel:0 maxProbability:0 probabilityVector:v5 numDevicesVector:v6];

  v15[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [a1 saveMicroLocationLocalizationEvents:v8];

  id v9 = objc_alloc(MEMORY[0x263F2A1B0]);
  v10 = [MEMORY[0x263EFF8C0] array];
  v11 = [MEMORY[0x263EFF8C0] array];
  v12 = (void *)[v9 initWithDomain:0 maxProbabilityMicroLocationIdentifier:@"com.apple.milod" maxProbability:0 probabilityVector:v10 isStable:0 numDevicesVector:v11];

  v14 = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  [a1 saveMicroLocationVisitEvents:v13];
}

+ (void)_saveEventsWithSource:(id)a3 events:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__ULBiomePublisher__saveEventsWithSource_events___block_invoke;
    v14[3] = &unk_2653F9AA0;
    id v15 = v5;
    [v6 enumerateObjectsUsingBlock:v14];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_52);
    }
    v7 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSNumber;
      id v9 = v7;
      v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v11 = [v6 firstObject];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "Send %@ events of type %@", buf, 0x16u);
    }
  }
}

uint64_t __49__ULBiomePublisher__saveEventsWithSource_events___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendEvent:a2];
}

@end