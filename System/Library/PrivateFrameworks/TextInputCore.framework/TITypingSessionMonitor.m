@interface TITypingSessionMonitor
+ (BOOL)shouldRecordSession:(id)a3;
- (NSArray)interactionObservers;
- (NSLocale)locale;
- (NSMutableArray)aggregatedEventObservers;
- (TIBiomeObserver)biomeObserver;
- (TICoreAnalyticsEventDispatcher)coreAnalyticsEventDispatcher;
- (TIDPEventDispatcher)differentialPrivacyEventDispatcher;
- (TIFeatureUsageMetricsCache)featureUsageMetricsCache;
- (TIKBUserModel)userModel;
- (TIKeyboardInputManagerConfig)config;
- (TIMetricDescriptorRegistry)metricDescriptorRegistry;
- (TISKMetricCollector)sensorKitMetricCollector;
- (TITypingDESRecordWriter)desRecordWriter;
- (TITypingSession)currentTypingSession;
- (TITypingSessionMonitor)initWithConfig:(id)a3 metricDescriptorRegistry:(id)a4;
- (id)_typingSessionFromInteractionObservers:(id)a3;
- (id)currentInteractionObservers;
- (id)observeSession:(id)a3 sessionParams:(id)a4;
- (id)resetInteractionObserversForNextSession;
- (void)_lazyLoadAggregatedEventObservers;
- (void)_loadAggregatedEventObservers;
- (void)_loadInteractionObservers;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4;
- (void)addKeyInput:(id)a3 keyboardState:(id)a4;
- (void)addTouchEvent:(id)a3;
- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11;
- (void)candidatesOffered:(id)a3 keyboardState:(id)a4;
- (void)changingContextWithTrigger:(id)a3;
- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10;
- (void)endSessionWithInteractionObservers:(id)a3 sessionParams:(id)a4 timestamp:(id)a5;
- (void)layoutDidChange:(id)a3 keyboardState:(id)a4;
- (void)setAggregatedEventObservers:(id)a3;
- (void)setClientID:(id)a3 keyboardState:(id)a4;
- (void)setConfig:(id)a3;
- (void)setDesRecordWriter:(id)a3;
- (void)setInteractionObservers:(id)a3;
- (void)setMetricDescriptorRegistry:(id)a3;
- (void)tearDown;
@end

@implementation TITypingSessionMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_aggregatedEventObservers, 0);
  objc_storeStrong((id *)&self->_interactionObservers, 0);
  objc_storeStrong((id *)&self->_desRecordWriter, 0);
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_featureUsageMetricsCache, 0);
  objc_storeStrong((id *)&self->_biomeObserver, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyEventDispatcher, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEventDispatcher, 0);
  objc_storeStrong((id *)&self->_sensorKitMetricCollector, 0);
  objc_storeStrong((id *)&self->_userModel, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setAggregatedEventObservers:(id)a3
{
}

- (NSMutableArray)aggregatedEventObservers
{
  return self->_aggregatedEventObservers;
}

- (void)setInteractionObservers:(id)a3
{
}

- (NSArray)interactionObservers
{
  return self->_interactionObservers;
}

- (void)setDesRecordWriter:(id)a3
{
}

- (void)setMetricDescriptorRegistry:(id)a3
{
}

- (TIMetricDescriptorRegistry)metricDescriptorRegistry
{
  return self->_metricDescriptorRegistry;
}

- (void)setConfig:(id)a3
{
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (TIFeatureUsageMetricsCache)featureUsageMetricsCache
{
  return self->_featureUsageMetricsCache;
}

- (TITypingDESRecordWriter)desRecordWriter
{
  desRecordWriter = self->_desRecordWriter;
  if (!desRecordWriter)
  {
    v4 = objc_alloc_init(TITypingDESRecordWriter);
    v5 = self->_desRecordWriter;
    self->_desRecordWriter = v4;

    desRecordWriter = self->_desRecordWriter;
  }

  return desRecordWriter;
}

- (id)observeSession:(id)a3 sessionParams:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 setSessionParams:a4];
  v7 = [(TITypingSessionMonitor *)self featureUsageMetricsCache];
  [v6 setFeatureUsageMetricsCache:v7];

  [(TITypingSessionMonitor *)self _lazyLoadAggregatedEventObservers];
  if (([v6 didReceiveSecureFieldEvent] & 1) != 0
    || ![(NSMutableArray *)self->_aggregatedEventObservers count]
    && ([(TITypingSessionMonitor *)self config],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 usesDODMLLogging],
        v9,
        !v10))
  {
    v8 = 0;
    goto LABEL_21;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2023;
  v38 = __Block_byref_object_dispose__2024;
  id v39 = (id)os_transaction_create();
  v8 = [[TITypingSessionAligned alloc] initWithSession:v6];
  v11 = [(TITypingSessionAligned *)v8 alignedEntries];
  if (![v11 count]) {
    goto LABEL_11;
  }
  v12 = [(TITypingSessionAligned *)v8 layouts];
  if (![v12 count]
    || !+[TITypingSessionMonitor shouldRecordSession:v6])
  {

LABEL_11:
    goto LABEL_12;
  }
  v13 = [(TITypingSessionMonitor *)self config];
  int v14 = [v13 usesDODMLLogging];

  if (!v14)
  {
LABEL_12:
    v15 = (void *)v35[5];
    v35[5] = 0;
    goto LABEL_13;
  }
  v15 = [(TITypingSessionMonitor *)self desRecordWriter];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __55__TITypingSessionMonitor_observeSession_sessionParams___block_invoke;
  v33[3] = &unk_1E6E29BD8;
  v33[4] = &v34;
  [v15 storeAlignedSession:v8 completion:v33];
LABEL_13:

  v16 = (void *)os_transaction_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v17 = self->_aggregatedEventObservers;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "sessionDidEnd:aligned:", v6, v8, (void)v29);
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v19);
  }

  v22 = [(TITypingSessionMonitor *)self userModel];
  v23 = [(TITypingSessionMonitor *)self coreAnalyticsEventDispatcher];
  v24 = [v23 revisionRateAnalyzer];
  v25 = [v24 revisionRateAnalysisSummary];
  [v22 dispatchFeedbackAnalyzers:v6 aligned:v8 revisionRateAnalysisSummary:v25];

  v26 = [(TITypingSessionMonitor *)self userModel];
  v27 = [MEMORY[0x1E4F1C9C8] date];
  [v26 persistForDate:v27];

  _Block_object_dispose(&v34, 8);
LABEL_21:

  return v8;
}

void __55__TITypingSessionMonitor_observeSession_sessionParams___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((a3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[TITypingSessionMonitor observeSession:sessionParams:]_block_invoke";
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  failed to write DESRecord", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)_loadAggregatedEventObservers
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(TITypingSessionMonitor *)self config];
  int v5 = [v4 usesUserModelLogging];

  if (v5)
  {
    uint64_t v6 = [(TITypingSessionMonitor *)self config];
    v7 = [v6 inputMode];
    int v8 = [v7 normalizedIdentifier];
    v9 = [MEMORY[0x1E4FAE4F0] sharedUserModelDataStore];
    uint64_t v10 = [(TITypingSessionMonitor *)self metricDescriptorRegistry];
    v11 = +[TIKBUserModel userModelWithInputMode:v8 userModelDataStore:v9 metricDescriptorRegistry:v10 fromDate:0];
    userModel = self->_userModel;
    self->_userModel = v11;

    [(NSMutableArray *)v3 addObject:self->_userModel];
  }
  v13 = [(TITypingSessionMonitor *)self config];
  int v14 = [v13 sensorKitEnabled];

  if (v14)
  {
    v15 = [(TITypingSessionMonitor *)self config];
    v16 = [v15 inputMode];
    v17 = [(TITypingSessionMonitor *)self config];
    uint64_t v18 = [v17 sensorKitWordsThreshold];
    uint64_t v19 = [(TITypingSessionMonitor *)self config];
    +[TISKMetricCollector makeMetricCollector:wordsThreshold:isTesting:](TISKMetricCollector, "makeMetricCollector:wordsThreshold:isTesting:", v16, v18, [v19 isTesting]);
    uint64_t v20 = (TISKMetricCollector *)objc_claimAutoreleasedReturnValue();
    sensorKitMetricCollector = self->_sensorKitMetricCollector;
    self->_sensorKitMetricCollector = v20;

    if (self->_sensorKitMetricCollector) {
      -[NSMutableArray addObject:](v3, "addObject:");
    }
  }
  v22 = objc_alloc_init(TICoreAnalyticsEventDispatcher);
  coreAnalyticsEventDispatcher = self->_coreAnalyticsEventDispatcher;
  self->_coreAnalyticsEventDispatcher = v22;

  [(NSMutableArray *)v3 addObject:self->_coreAnalyticsEventDispatcher];
  v24 = objc_alloc_init(TIDPEventDispatcher);
  differentialPrivacyEventDispatcher = self->_differentialPrivacyEventDispatcher;
  self->_differentialPrivacyEventDispatcher = v24;

  [(NSMutableArray *)v3 addObject:self->_differentialPrivacyEventDispatcher];
  v26 = objc_alloc_init(TIBiomeObserver);
  biomeObserver = self->_biomeObserver;
  self->_biomeObserver = v26;

  [(NSMutableArray *)v3 addObject:self->_biomeObserver];
  aggregatedEventObservers = self->_aggregatedEventObservers;
  self->_aggregatedEventObservers = v3;
}

- (void)_lazyLoadAggregatedEventObservers
{
  if (!self->_aggregatedEventObservers) {
    [(TITypingSessionMonitor *)self _loadAggregatedEventObservers];
  }
}

- (TIBiomeObserver)biomeObserver
{
  [(TITypingSessionMonitor *)self _lazyLoadAggregatedEventObservers];
  biomeObserver = self->_biomeObserver;

  return biomeObserver;
}

- (TIDPEventDispatcher)differentialPrivacyEventDispatcher
{
  [(TITypingSessionMonitor *)self _lazyLoadAggregatedEventObservers];
  differentialPrivacyEventDispatcher = self->_differentialPrivacyEventDispatcher;

  return differentialPrivacyEventDispatcher;
}

- (TICoreAnalyticsEventDispatcher)coreAnalyticsEventDispatcher
{
  [(TITypingSessionMonitor *)self _lazyLoadAggregatedEventObservers];
  coreAnalyticsEventDispatcher = self->_coreAnalyticsEventDispatcher;

  return coreAnalyticsEventDispatcher;
}

- (TISKMetricCollector)sensorKitMetricCollector
{
  [(TITypingSessionMonitor *)self _lazyLoadAggregatedEventObservers];
  sensorKitMetricCollector = self->_sensorKitMetricCollector;

  return sensorKitMetricCollector;
}

- (TIKBUserModel)userModel
{
  [(TITypingSessionMonitor *)self _lazyLoadAggregatedEventObservers];
  userModel = self->_userModel;

  return userModel;
}

- (void)_loadInteractionObservers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [TITypingSession alloc];
  int v5 = [(TITypingSessionMonitor *)self locale];
  uint64_t v6 = [(TITypingSession *)v4 initWithLocale:v5 keyboardLayout:0];

  [v3 addObject:v6];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "startSessionWithTimestamp:", v7, (void)v15);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = (NSArray *)[v8 copy];
  interactionObservers = self->_interactionObservers;
  self->_interactionObservers = v13;
}

- (id)_typingSessionFromInteractionObservers:(id)a3
{
  return (id)[a3 firstObject];
}

- (id)currentInteractionObservers
{
  interactionObservers = self->_interactionObservers;
  if (!interactionObservers)
  {
    [(TITypingSessionMonitor *)self _loadInteractionObservers];
    interactionObservers = self->_interactionObservers;
  }

  return interactionObservers;
}

- (void)tearDown
{
  if (self->_aggregatedEventObservers) {
    TIDispatchAsync();
  }
}

void __34__TITypingSessionMonitor_tearDown__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "tearDown", (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)endSessionWithInteractionObservers:(id)a3 sessionParams:(id)a4 timestamp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  objc_copyWeak(&v17, &location);
  int v14 = v8;
  long long v15 = v10;
  long long v16 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  TIDispatchAsync();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __85__TITypingSessionMonitor_endSessionWithInteractionObservers_sessionParams_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) endSessionWithTimestamp:*(void *)(a1 + 40)];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v5);
    }

    if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
    }
    if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
      int v8 = [v22 BOOLForKey:@"typingSessionNotificationsEnabled"];
      char v23 = v8 ^ 1;
      if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
        dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
      }
      if (TI_IS_INTERNAL_INSTALL::is_internal_install) {
        int v9 = v8;
      }
      else {
        int v9 = 0;
      }
      if (v9 == 1)
      {
        id v10 = [MEMORY[0x1E4F28C40] defaultCenter];
        [v10 postNotificationName:@"com.apple.keyboard.inputAnalytics.keyboardDidSuspend" object:0 userInfo:0 deliverImmediately:1];
      }
    }
    else
    {
      v22 = 0;
      char v23 = 1;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v16 analyzeSessionWithSessionParams:*(void *)(a1 + 48)];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v13);
    }

    id v17 = [*(id *)(a1 + 56) _typingSessionFromInteractionObservers:*(void *)(a1 + 32)];
    long long v18 = v17;
    if (v17)
    {
      [v17 setSessionParams:*(void *)(a1 + 48)];
      [v18 setFeatureUsageMetricsCache:*(void *)(*(void *)(a1 + 56) + 56)];
      id v19 = (id)[WeakRetained observeSession:v18 sessionParams:*(void *)(a1 + 48)];
    }
    if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
    }
    char v20 = v23;
    if (!TI_IS_INTERNAL_INSTALL::is_internal_install) {
      char v20 = 1;
    }
    if ((v20 & 1) == 0)
    {
      v21 = [MEMORY[0x1E4FAE260] sharedInstance];
      [v21 queueCompletionHandler:&__block_literal_global_2042];
    }
  }
}

void __85__TITypingSessionMonitor_endSessionWithInteractionObservers_sessionParams_timestamp___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v0 postNotificationName:@"com.apple.keyboard.inputAnalytics.sessionObserversDidComplete" object:0 userInfo:0 deliverImmediately:1];
}

- (id)resetInteractionObserversForNextSession
{
  id v3 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  interactionObservers = self->_interactionObservers;
  self->_interactionObservers = 0;

  return v3;
}

- (TITypingSession)currentTypingSession
{
  id v3 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v4 = [(TITypingSessionMonitor *)self _typingSessionFromInteractionObservers:v3];

  return (TITypingSession *)v4;
}

- (void)setClientID:(id)a3 keyboardState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setClientID:v6 keyboardState:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  BOOL v21 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v14 = a7;
  id v15 = a10;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", v22, v12, v11, v21, v14, a8.location, a8.length, a9, v15);
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }
}

- (void)changingContextWithTrigger:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) changingContextWithTrigger:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  BOOL v11 = a8;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v21 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        LOBYTE(v25) = a9;
        [*(id *)(*((void *)&v29 + 1) + 8 * i) candidateAccepted:v28 withInput:v27 documentState:v17 inputContext:v18 inputStem:v19 predictionBarHit:v11 useCandidateSelection:v25 candidateIndex:a10 keyboardState:v20];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) acceptingCandidateWithTrigger:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)candidatesOffered:(id)a3 keyboardState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) candidatesOffered:v6 keyboardState:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)layoutDidChange:(id)a3 keyboardState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) layoutDidChange:v6 keyboardState:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)addTouchEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addTouchEvent:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) addDrawInputWithSyllableCount:a3 keyboardState:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)addKeyInput:(id)a3 keyboardState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(TITypingSessionMonitor *)self currentInteractionObservers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) addKeyInput:v6 keyboardState:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (TITypingSessionMonitor)initWithConfig:(id)a3 metricDescriptorRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TITypingSessionMonitor;
  uint64_t v9 = [(TITypingSessionMonitor *)&v24 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    uint64_t v11 = [v7 inputMode];
    uint64_t v12 = [v11 locale];
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v12;

    objc_storeStrong((id *)&v10->_metricDescriptorRegistry, a4);
    long long v14 = [TIFeatureUsageMetricsCache alloc];
    long long v15 = [v7 inputMode];
    long long v16 = [v15 normalizedIdentifier];
    uint64_t v17 = [(TIFeatureUsageMetricsCache *)v14 initWithInputMode:v16 metricDescriptorRegistry:v8];
    featureUsageMetricsCache = v10->_featureUsageMetricsCache;
    v10->_featureUsageMetricsCache = (TIFeatureUsageMetricsCache *)v17;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.textInput.TypingSessionMonitor", v20);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v21;
  }
  return v10;
}

+ (BOOL)shouldRecordSession:(id)a3
{
  uint64_t v3 = shouldRecordSession__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldRecordSession__onceToken, &__block_literal_global_38);
  }
  uint64_t v5 = (void *)shouldRecordSession__allowlistedAppIDs;
  id v6 = [v4 applicationID];

  char v7 = [v5 containsObject:v6];
  return v7;
}

uint64_t __46__TITypingSessionMonitor_shouldRecordSession___block_invoke()
{
  shouldRecordSession__allowlistedAppIDs = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.MobileSMS", @"com.apple.MobileMail", @"com.apple.mobilesafari", @"com.apple.mobilenotes", @"com.apple.Spotlight", @"com.apple.mobilecal", @"com.apple.Maps", 0);

  return MEMORY[0x1F41817F8]();
}

@end