@interface BYAnalyticsManager
- (BMSystemSettingsAppearanceSetup)appearanceSetupEvent;
- (BMSystemSettingsChildMultitaskingSetup)childMultitaskingSetupEvent;
- (BOOL)sendStashedEventWithName:(id)a3 payload:(id)a4;
- (BYAnalyticsManager)init;
- (BYPowerLogAnalyticsManager)buddyPowerLogManager;
- (NSMutableArray)didProduceLazyEventsBlocks;
- (NSMutableArray)events;
- (NSMutableDictionary)lazyEvents;
- (NSNumber)combinedAnalyticsRepromptChoiceNumber;
- (RTCReporting)rtcReporting;
- (id)_stashablePayloadForBiomeEvent:(id)a3;
- (id)appearanceSetupEventBlock;
- (id)childMultitaskingSetupEventBlock;
- (void)_gatherDataFromProducers;
- (void)_sendAppearanceSetupEventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (void)_sendChildMultitaskingSetupEventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (void)_sendCombinedAnalyticsRepromptCompletedEventIfNecessary;
- (void)_sendCombinedAnalyticsRepromptNecessaryEventWithRTCReporting:(id)a3;
- (void)_sendEvent:(id)a3 payload:(id)a4;
- (void)addDidProduceLazyEventsBlock:(id)a3;
- (void)addEvent:(id)a3;
- (void)addEvent:(id)a3 withPayload:(id)a4 persist:(BOOL)a5;
- (void)addEvent:(id)a3 withPayloadBlock:(id)a4 persist:(BOOL)a5;
- (void)addPowerLogEvent:(unint64_t)a3 withPayload:(id)a4;
- (void)commit;
- (void)commitThenUpload;
- (void)prepareForCombinedAnalyticsRepromptWithCompletion:(id)a3;
- (void)removeEventsUsingBlock:(id)a3;
- (void)removeNonPersistentEvents;
- (void)reset;
- (void)setAppearanceSetupEvent:(id)a3;
- (void)setAppearanceSetupEventBlock:(id)a3;
- (void)setBuddyPowerLogManager:(id)a3;
- (void)setChildMultitaskingSetupEvent:(id)a3;
- (void)setChildMultitaskingSetupEventBlock:(id)a3;
- (void)setCombinedAnalyticsRepromptChoice:(BOOL)a3;
- (void)setCombinedAnalyticsRepromptChoiceNumber:(id)a3;
- (void)setDidProduceLazyEventsBlocks:(id)a3;
- (void)setEvents:(id)a3;
- (void)setLazyEvents:(id)a3;
- (void)setRtcReporting:(id)a3;
- (void)stash:(id)a3;
@end

@implementation BYAnalyticsManager

- (BYAnalyticsManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)BYAnalyticsManager;
  v2 = [(BYAnalyticsManager *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    events = v2->_events;
    v2->_events = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lazyEvents = v2->_lazyEvents;
    v2->_lazyEvents = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    didProduceLazyEventsBlocks = v2->_didProduceLazyEventsBlocks;
    v2->_didProduceLazyEventsBlocks = v7;

    v9 = [BYPowerLogAnalyticsManager alloc];
    v10 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
    uint64_t v11 = [(BYPowerLogAnalyticsManager *)v9 initWithPreferences:v10];
    buddyPowerLogManager = v2->_buddyPowerLogManager;
    v2->_buddyPowerLogManager = (BYPowerLogAnalyticsManager *)v11;
  }
  return v2;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(BYAnalyticsManager *)self events];
  [v5 addObject:v4];
}

- (void)addPowerLogEvent:(unint64_t)a3 withPayload:(id)a4
{
  id v6 = a4;
  v8 = [[BYPowerLogEvent alloc] initWithType:a3 andPayload:v6];

  if (v8)
  {
    v7 = [(BYAnalyticsManager *)self buddyPowerLogManager];
    [v7 addEvent:v8];
  }
}

- (void)addEvent:(id)a3 withPayload:(id)a4 persist:(BOOL)a5
{
  id v6 = +[BYAnalyticsEvent eventWithName:a3 withPayload:a4 persist:a5];
  [(BYAnalyticsManager *)self addEvent:v6];
}

- (void)addEvent:(id)a3 withPayloadBlock:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v10 = +[BYAnalyticsLazyEvent eventWithName:v8 withPayloadBlock:a4 persist:v5];
  v9 = [(BYAnalyticsManager *)self lazyEvents];
  [v9 setObject:v10 forKeyedSubscript:v8];
}

- (void)removeEventsUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *, void *))a3;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = [(BYAnalyticsManager *)self events];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 name];
        v12 = [v10 payload];
        int v13 = v4[2](v4, v11, v12);

        if (v13) {
          [v15 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  objc_super v14 = [(BYAnalyticsManager *)self events];
  [v14 removeObjectsInArray:v15];
}

- (void)addDidProduceLazyEventsBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(BYAnalyticsManager *)self didProduceLazyEventsBlocks];
  BOOL v5 = (void *)MEMORY[0x1AD0DBFE0](v4);

  [v6 addObject:v5];
}

- (void)prepareForCombinedAnalyticsRepromptWithCompletion:(id)a3
{
  v24[6] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  id v6 = [(BYAnalyticsManager *)v5 rtcReporting];

  if (v6)
  {
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Analytics reporting configuration already started", buf, 2u);
    }

    v4[2](v4);
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    uint64_t v8 = arc4random();
    uint64_t v9 = *MEMORY[0x1E4F94660];
    v23[0] = *MEMORY[0x1E4F94658];
    v23[1] = v9;
    v24[0] = &unk_1EFE4E490;
    v24[1] = &unk_1EFE4E4A8;
    v23[2] = *MEMORY[0x1E4F94680];
    id v10 = [NSNumber numberWithUnsignedInt:v8];
    v24[2] = v10;
    uint64_t v11 = *MEMORY[0x1E4F94668];
    v23[3] = *MEMORY[0x1E4F94648];
    v23[4] = v11;
    v24[3] = MEMORY[0x1E4F1CC28];
    v24[4] = MEMORY[0x1E4F1CC38];
    v23[5] = *MEMORY[0x1E4F94650];
    v24[5] = @"com.apple.purplebuddy";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

    uint64_t v13 = *MEMORY[0x1E4F94690];
    v21[0] = *MEMORY[0x1E4F94688];
    v21[1] = v13;
    v22[0] = @"Setup";
    v22[1] = @"com.apple.purplebuddy";
    objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F94620]) initWithSessionInfo:v12 userInfo:v14 frameworksToCheck:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__BYAnalyticsManager_prepareForCombinedAnalyticsRepromptWithCompletion___block_invoke;
    v17[3] = &unk_1E5D2CF30;
    v17[4] = v5;
    id v18 = v15;
    long long v19 = v4;
    id v16 = v15;
    [v16 startConfigurationWithCompletionHandler:v17];

    BOOL v5 = (BYAnalyticsManager *)v12;
  }
}

void __72__BYAnalyticsManager_prepareForCombinedAnalyticsRepromptWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3 != 0;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Analytics reporting configuration started with success %d", (uint8_t *)v9, 8u);
  }

  if (CFPreferencesGetAppBooleanValue(@"ForceRTCStartConfigurationSuccess", @"com.apple.purplebuddy", 0))
  {
    BOOL v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Analytics reporting configuration forcing success", (uint8_t *)v9, 2u);
    }
  }
  else if (!v3)
  {
    goto LABEL_11;
  }
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = [*(id *)(a1 + 32) rtcReporting];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    [*(id *)(a1 + 32) setRtcReporting:*(void *)(a1 + 40)];
    objc_sync_exit(v6);

    [*(id *)(a1 + 32) _sendCombinedAnalyticsRepromptNecessaryEventWithRTCReporting:*(void *)(a1 + 40)];
  }
  else
  {
    objc_sync_exit(v6);
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setCombinedAnalyticsRepromptChoice:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = [NSNumber numberWithBool:v3];
  [(BYAnalyticsManager *)obj setCombinedAnalyticsRepromptChoiceNumber:v4];

  objc_sync_exit(obj);
}

- (void)stash:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BYAnalyticsManager *)self _gatherDataFromProducers];
  BOOL v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Stashing analytics...", buf, 2u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(BYAnalyticsManager *)self events];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [v11 name];
        uint64_t v13 = [v11 payload];
        [v4 stashAnalyticEvent:v12 payload:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  objc_super v14 = [(BYAnalyticsManager *)self appearanceSetupEvent];

  if (v14)
  {
    id v15 = [(BYAnalyticsManager *)self appearanceSetupEvent];
    id v16 = [(BYAnalyticsManager *)self _stashablePayloadForBiomeEvent:v15];

    if (v16)
    {
      [v4 stashAnalyticEvent:@"biome.appearanceSetup" payload:v16];
    }
    else
    {
      long long v17 = _BYLoggingFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[BYAnalyticsManager stash:]();
      }
    }
  }
  id v18 = [(BYAnalyticsManager *)self childMultitaskingSetupEvent];

  if (v18)
  {
    long long v19 = [(BYAnalyticsManager *)self childMultitaskingSetupEvent];
    v20 = [(BYAnalyticsManager *)self _stashablePayloadForBiomeEvent:v19];

    if (v20)
    {
      [v4 stashAnalyticEvent:@"biome.childMultitaskingSetup" payload:v20];
    }
    else
    {
      uint64_t v21 = _BYLoggingFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[BYAnalyticsManager stash:]();
      }
    }
  }
}

- (void)commit
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A7DED000, v0, v1, "Sending appearance setup event", v2, v3, v4, v5, v6);
}

- (void)commitThenUpload
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A7DED000, v0, v1, "Failed to rollover events!", v2, v3, v4, v5, v6);
}

void __38__BYAnalyticsManager_commitThenUpload__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__BYAnalyticsManager_commitThenUpload__block_invoke_cold_1();
  }
}

- (void)removeNonPersistentEvents
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Removing non-persistent events...", buf, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [(BYAnalyticsManager *)self events];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v10 persist] & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [(BYAnalyticsManager *)self events];
  [v11 removeObjectsInArray:v4];

  uint64_t v12 = [(BYAnalyticsManager *)self lazyEvents];
  uint64_t v13 = (void *)[v12 copy];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        v20 = [(BYAnalyticsManager *)self lazyEvents];
        uint64_t v21 = [v20 objectForKeyedSubscript:v19];

        if (([v21 persist] & 1) == 0)
        {
          long long v22 = [(BYAnalyticsManager *)self lazyEvents];
          long long v23 = [v21 name];
          [v22 removeObjectForKey:v23];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v16);
  }

  [(BYAnalyticsManager *)self setAppearanceSetupEvent:0];
  [(BYAnalyticsManager *)self setAppearanceSetupEventBlock:0];
  [(BYAnalyticsManager *)self setChildMultitaskingSetupEvent:0];
  [(BYAnalyticsManager *)self setChildMultitaskingSetupEventBlock:0];
}

- (void)reset
{
  uint64_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Resetting all analytics...", v6, 2u);
  }

  id v4 = [(BYAnalyticsManager *)self events];
  [v4 removeAllObjects];

  uint64_t v5 = [(BYAnalyticsManager *)self lazyEvents];
  [v5 removeAllObjects];

  [(BYAnalyticsManager *)self setAppearanceSetupEvent:0];
  [(BYAnalyticsManager *)self setAppearanceSetupEventBlock:0];
  [(BYAnalyticsManager *)self setChildMultitaskingSetupEvent:0];
  [(BYAnalyticsManager *)self setChildMultitaskingSetupEventBlock:0];
}

- (BOOL)sendStashedEventWithName:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 hasPrefix:@"biome."];
  if (v8)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v9)
      {
        int v10 = 1;
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v11 = _BYLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BYAnalyticsManager sendStashedEventWithName:payload:]();
    }

    int v10 = 0;
    uint64_t v9 = 0;
LABEL_9:
    uint64_t v12 = [v7 objectForKeyedSubscript:@"dataVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v12)
      {
        if (v10)
        {
          if ([v6 isEqualToString:@"biome.appearanceSetup"])
          {
            -[BYAnalyticsManager _sendAppearanceSetupEventWithData:dataVersion:](self, "_sendAppearanceSetupEventWithData:dataVersion:", v9, [v12 unsignedIntValue]);
          }
          else if ([v6 isEqualToString:@"biome.childMultitaskingSetup"])
          {
            -[BYAnalyticsManager _sendChildMultitaskingSetupEventWithData:dataVersion:](self, "_sendChildMultitaskingSetupEventWithData:dataVersion:", v9, [v12 unsignedIntValue]);
          }
          else
          {
            uint64_t v15 = _BYLoggingFacility();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[BYAnalyticsManager sendStashedEventWithName:payload:]();
            }
          }
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v13 = _BYLoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BYAnalyticsManager sendStashedEventWithName:payload:]();
    }

    uint64_t v12 = 0;
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (void)_gatherDataFromProducers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Gathering data from event producers...", buf, 2u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(BYAnalyticsManager *)self lazyEvents];
  uint64_t v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 138412290;
    long long v23 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        uint64_t v12 = [(BYAnalyticsManager *)self lazyEvents];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        id v14 = [v13 payloadBlock];
        uint64_t v15 = v14[2]();

        if (v15)
        {
          uint64_t v16 = +[BYAnalyticsEvent eventWithName:v11 withPayload:v15 persist:0];
          [(BYAnalyticsManager *)self addEvent:v16];
        }
        else
        {
          uint64_t v16 = _BYLoggingFacility();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            uint64_t v29 = v11;
            _os_log_debug_impl(&dword_1A7DED000, v16, OS_LOG_TYPE_DEBUG, "No payload returned for %@; skipping...",
              buf,
              0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v17 = [(BYAnalyticsManager *)self appearanceSetupEventBlock];

  if (v17)
  {
    id v18 = [(BYAnalyticsManager *)self appearanceSetupEventBlock];
    uint64_t v19 = v18[2]();
    [(BYAnalyticsManager *)self setAppearanceSetupEvent:v19];
  }
  v20 = [(BYAnalyticsManager *)self childMultitaskingSetupEventBlock];

  if (v20)
  {
    uint64_t v21 = [(BYAnalyticsManager *)self childMultitaskingSetupEventBlock];
    long long v22 = v21[2]();
    [(BYAnalyticsManager *)self setChildMultitaskingSetupEvent:v22];
  }
}

- (void)_sendEvent:(id)a3 payload:(id)a4
{
}

- (id)_stashablePayloadForBiomeEvent:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 serialize];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v9[0] = @"data";
    v9[1] = @"dataVersion";
    v10[0] = v4;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "dataVersion"));
    v10[1] = v6;
    long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (void)_sendAppearanceSetupEventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4 = [MEMORY[0x1E4F50160] eventWithData:a3 dataVersion:*(void *)&a4];
  if (!v4)
  {
    uint64_t v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BYAnalyticsManager _sendAppearanceSetupEventWithData:dataVersion:]();
    }
  }
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BYAnalyticsManager commit]();
  }

  long long v7 = BiomeLibrary();
  uint64_t v8 = [v7 SystemSettings];
  uint64_t v9 = [v8 AppearanceSetup];
  uint64_t v10 = [v9 source];
  [v10 sendEvent:v4];
}

- (void)_sendChildMultitaskingSetupEventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4 = [MEMORY[0x1E4F50168] eventWithData:a3 dataVersion:*(void *)&a4];
  if (!v4)
  {
    uint64_t v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BYAnalyticsManager _sendChildMultitaskingSetupEventWithData:dataVersion:]();
    }
  }
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BYAnalyticsManager commit]();
  }

  long long v7 = BiomeLibrary();
  uint64_t v8 = [v7 SystemSettings];
  uint64_t v9 = [v8 ChildMultitaskingSetup];
  uint64_t v10 = [v9 source];
  [v10 sendEvent:v4];
}

- (void)_sendCombinedAnalyticsRepromptNecessaryEventWithRTCReporting:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  int v3 = [a3 sendMessageWithCategory:1 type:1 payload:0 error:&v6];
  id v4 = v6;
  uint64_t v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Analytics did send combined analytics reprompt necessary event with success %d error %@", buf, 0x12u);
  }
}

- (void)_sendCombinedAnalyticsRepromptCompletedEventIfNecessary
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  int v3 = [(BYAnalyticsManager *)v2 rtcReporting];
  id v4 = [(BYAnalyticsManager *)v2 combinedAnalyticsRepromptChoiceNumber];
  objc_sync_exit(v2);

  if (v3 && v4)
  {
    uint64_t v16 = @"enabled";
    v17[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v9 = 0;
    int v6 = [v3 sendMessageWithCategory:1 type:2 payload:v5 error:&v9];
    id v7 = v9;
    int v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v4;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Analytics did send combined analytics reprompt completed event (choice %@) with success %d error %@", buf, 0x1Cu);
    }
  }
}

- (id)appearanceSetupEventBlock
{
  return self->_appearanceSetupEventBlock;
}

- (void)setAppearanceSetupEventBlock:(id)a3
{
}

- (id)childMultitaskingSetupEventBlock
{
  return self->_childMultitaskingSetupEventBlock;
}

- (void)setChildMultitaskingSetupEventBlock:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (NSMutableDictionary)lazyEvents
{
  return self->_lazyEvents;
}

- (void)setLazyEvents:(id)a3
{
}

- (NSMutableArray)didProduceLazyEventsBlocks
{
  return self->_didProduceLazyEventsBlocks;
}

- (void)setDidProduceLazyEventsBlocks:(id)a3
{
}

- (BYPowerLogAnalyticsManager)buddyPowerLogManager
{
  return self->_buddyPowerLogManager;
}

- (void)setBuddyPowerLogManager:(id)a3
{
}

- (BMSystemSettingsAppearanceSetup)appearanceSetupEvent
{
  return self->_appearanceSetupEvent;
}

- (void)setAppearanceSetupEvent:(id)a3
{
}

- (BMSystemSettingsChildMultitaskingSetup)childMultitaskingSetupEvent
{
  return self->_childMultitaskingSetupEvent;
}

- (void)setChildMultitaskingSetupEvent:(id)a3
{
}

- (RTCReporting)rtcReporting
{
  return self->_rtcReporting;
}

- (void)setRtcReporting:(id)a3
{
}

- (NSNumber)combinedAnalyticsRepromptChoiceNumber
{
  return self->_combinedAnalyticsRepromptChoiceNumber;
}

- (void)setCombinedAnalyticsRepromptChoiceNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedAnalyticsRepromptChoiceNumber, 0);
  objc_storeStrong((id *)&self->_rtcReporting, 0);
  objc_storeStrong((id *)&self->_childMultitaskingSetupEvent, 0);
  objc_storeStrong((id *)&self->_appearanceSetupEvent, 0);
  objc_storeStrong((id *)&self->_buddyPowerLogManager, 0);
  objc_storeStrong((id *)&self->_didProduceLazyEventsBlocks, 0);
  objc_storeStrong((id *)&self->_lazyEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong(&self->_childMultitaskingSetupEventBlock, 0);
  objc_storeStrong(&self->_appearanceSetupEventBlock, 0);
}

- (void)stash:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A7DED000, v0, v1, "Failed to create payload for child multitasking setup event", v2, v3, v4, v5, v6);
}

- (void)stash:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A7DED000, v0, v1, "Failed to create payload for appearance setup event", v2, v3, v4, v5, v6);
}

void __38__BYAnalyticsManager_commitThenUpload__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A7DED000, v0, v1, "Analytics submission error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendStashedEventWithName:payload:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A7DED000, v0, v1, "Missing data version for event name %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendStashedEventWithName:payload:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A7DED000, v0, v1, "Unknown event name %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendStashedEventWithName:payload:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A7DED000, v0, v1, "Missing data for event name %{public}@", v2, v3, v4, v5, v6);
}

- (void)_sendAppearanceSetupEventWithData:dataVersion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A7DED000, v0, v1, "Failed to create appearance setup event", v2, v3, v4, v5, v6);
}

- (void)_sendChildMultitaskingSetupEventWithData:dataVersion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A7DED000, v0, v1, "Failed to create child multitasking setup event", v2, v3, v4, v5, v6);
}

@end