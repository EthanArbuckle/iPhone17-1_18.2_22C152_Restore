@interface PMMPredictor
+ (BOOL)_predictionIsAudio:(id)a3;
+ (BOOL)_predictionPopulatesContinuity:(id)a3;
+ (BOOL)_predictionPopulatesNowPlaying:(id)a3 fromUnitTest:(BOOL)a4;
+ (BOOL)_predictionPopulatesSpringboard:(id)a3;
+ (BOOL)_predictionPopulatesStark:(id)a3;
+ (BOOL)bundleSupportsINPlayMediaIntentForBundleId:(id)a3 fromUnitTest:(BOOL)a4;
+ (id)getHighestConfidencePredictionForNowPlayingConsumerFromPredictions:(id)a3 fromUnitTest:(BOOL)a4;
+ (id)sharedInstance;
+ (int64_t)pmmReasonToDECReason:(int64_t)a3;
- (BOOL)_recommendingAudioWhileAlreadyPlaying:(id)a3;
- (BOOL)unlockedSinceBoot;
- (NSDate)dateOfLastNowPlayingEvent;
- (NSString)mostRecentNowPlayingApp;
- (OS_dispatch_queue)nowPlayingStatusQueue;
- (OS_dispatch_queue)queue;
- (PETScalarEventTracker)heroAppSuggestion;
- (PETScalarEventTracker)mmAppSuggestion;
- (PMMAudioDisconnectListener)disconnectListener;
- (PMMDataProtectionMonitor)dataProtectionMonitor;
- (PMMMusicStateProcessor)musicStateProcessor;
- (PMMPredictionItem)mostRecentNowPlayingPrediction;
- (PMMPredictionItem)mostRecentPrediction;
- (PMMPredictor)init;
- (PMMTelephonyConnection)ctConnection;
- (id)_publishPredictionWithPredictedApplication:(id)a3 fromUnitTest:(BOOL)a4;
- (id)expirationForReason:(int64_t)a3;
- (id)notifyNonNowPlayingConsumersOfPredictionItem:(id)a3;
- (id)preprocessPrediction:(id)a3 predictionSource:(unint64_t)a4 mmReason:(int64_t)a5 decReason:(int64_t)a6 reasonSingle:(int64_t)a7 reasonMetadata:(id)a8;
- (int64_t)dataProtectionStatus;
- (int64_t)encryptedDataAvailability;
- (void)_clearAllRecommendations;
- (void)_clearAllRecommendationsExceptAppPredictions;
- (void)_handleNowPlayingInfoDidChange;
- (void)_notifyAppPredictionAboutMMUpdate:(id)a3;
- (void)_updatePredictionBasedOnPreviousDataProtectionStatus:(int64_t)a3 previousEncryptedDataAvailability:(int64_t)a4;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)dataProtectionMonitor:(id)a3 dataProtectionStatusDidChange:(int64_t)a4;
- (void)dataProtectionMonitor:(id)a3 encryptedDataAvailbilityDidChange:(int64_t)a4;
- (void)dataProtectionMonitor:(id)a3 unlockedSinceBoot:(BOOL)a4;
- (void)fetchMediaRemoteNowPlayingApplicationBundleId:(id)a3;
- (void)fetchMediaRemoteNowPlayingApplicationPlaybackState:(id)a3;
- (void)handleNowPlayingInfoDidChange;
- (void)handlePredictedApplications:(id)a3;
- (void)logPrediction:(id)a3 predictionSource:(unint64_t)a4 mmReason:(int64_t)a5 decReason:(int64_t)a6 reasonSingle:(int64_t)a7 reasonMetadata:(id)a8;
- (void)notifyNowPlayingConsumerOfPredictionItem:(id)a3;
- (void)setCtConnection:(id)a3;
- (void)setDataProtectionMonitor:(id)a3;
- (void)setDataProtectionStatus:(int64_t)a3;
- (void)setDateOfLastNowPlayingEvent:(id)a3;
- (void)setDisconnectListener:(id)a3;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setHeroAppSuggestion:(id)a3;
- (void)setMmAppSuggestion:(id)a3;
- (void)setMostRecentNowPlayingApp:(id)a3;
- (void)setMostRecentNowPlayingPrediction:(id)a3;
- (void)setMostRecentPrediction:(id)a3;
- (void)setMusicStateProcessor:(id)a3;
- (void)setNowPlayingStatusQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUnlockedSinceBoot:(BOOL)a3;
@end

@implementation PMMPredictor

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PMMPredictionItem)mostRecentPrediction
{
  return self->_mostRecentPrediction;
}

void __20__PMMPredictor_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__PMMPredictor_init__block_invoke_2;
  block[3] = &unk_2646DF9F0;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

void __20__PMMPredictor_init__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) mostRecentPrediction];

  if (!v2) {
    return;
  }
  v3 = NSNumber;
  id v4 = [*(id *)(a1 + 32) mostRecentPrediction];
  v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "reason"));
  if ([&unk_26D7A66A8 containsObject:v5])
  {

LABEL_6:
    v12 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 32) mostRecentPrediction];
      v14 = [*(id *)(a1 + 32) mostRecentNowPlayingPrediction];
      int v20 = 138412546;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2247FC000, v12, OS_LOG_TYPE_DEFAULT, "Got headphone/BT disconnect from Duet. Clearing all recommendations. Most recent prediction: %@. Most recent NowPlaying prediction: %@", (uint8_t *)&v20, 0x16u);
    }
    [*(id *)(a1 + 32) _clearAllRecommendations];
    return;
  }
  uint64_t v6 = [*(id *)(a1 + 32) mostRecentNowPlayingPrediction];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = NSNumber;
    v9 = [*(id *)(a1 + 32) mostRecentNowPlayingPrediction];
    v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "reason"));
    int v11 = [&unk_26D7A66A8 containsObject:v10];

    if (v11) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v15 = [*(id *)(a1 + 32) mostRecentPrediction];
  uint64_t v16 = [v15 reason];

  if (v16 == 512)
  {
    v17 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [*(id *)(a1 + 32) mostRecentPrediction];
      v19 = [*(id *)(a1 + 32) mostRecentNowPlayingPrediction];
      int v20 = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_2247FC000, v17, OS_LOG_TYPE_DEFAULT, "Got headphone/BT disconnect from Duet and reason of new prediction was 'other'. Clearing all recommendations except those for app predictions. Most recent prediction: %@. Most recent NowPlaying prediction: %@", (uint8_t *)&v20, 0x16u);
    }
    [*(id *)(a1 + 32) _clearAllRecommendationsExceptAppPredictions];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  return v2;
}

void __30__PMMPredictor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A618A50]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;
}

- (PMMPredictor)init
{
  v52[3] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)PMMPredictor;
  v2 = [(PMMPredictor *)&v50 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataProtectionMonitor = v2->_dataProtectionMonitor;
    v2->_dataProtectionMonitor = (PMMDataProtectionMonitor *)v3;

    [(PMMDataProtectionMonitor *)v2->_dataProtectionMonitor setDelegate:v2];
    v2->_encryptedDataAvailability = [(PMMDataProtectionMonitor *)v2->_dataProtectionMonitor encryptedDataAvailability];
    v2->_unlockedSinceBoot = [(PMMDataProtectionMonitor *)v2->_dataProtectionMonitor unlockedSinceBoot];
    v2->_dataProtectionStatus = [(PMMDataProtectionMonitor *)v2->_dataProtectionMonitor dataProtectionStatus];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [v10 stringByAppendingString:@"NowPlayingStatus"];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    nowPlayingStatusQueue = v2->_nowPlayingStatusQueue;
    v2->_nowPlayingStatusQueue = (OS_dispatch_queue *)v12;

    v2->_callInProgress = 0;
    uint64_t v14 = objc_opt_new();
    callObserver = v2->_callObserver;
    v2->_callObserver = (CXCallObserver *)v14;

    [(CXCallObserver *)v2->_callObserver setDelegate:v2 queue:v2->_queue];
    uint64_t v16 = [(PMMPredictor *)v2 nowPlayingStatusQueue];
    MRMediaRemoteRegisterForNowPlayingNotifications();

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)onNowPlayingInfoChange, (CFStringRef)*MEMORY[0x263F54B28], 0, CFNotificationSuspensionBehaviorDrop);
    uint64_t v18 = +[PMMMusicStateProcessor shared];
    musicStateProcessor = v2->_musicStateProcessor;
    v2->_musicStateProcessor = (PMMMusicStateProcessor *)v18;

    int v20 = [PMMAudioDisconnectListener alloc];
    uint64_t v45 = MEMORY[0x263EF8330];
    uint64_t v46 = 3221225472;
    v47 = __20__PMMPredictor_init__block_invoke;
    v48 = &unk_2646DF9F0;
    v21 = v2;
    v49 = v21;
    uint64_t v22 = [(PMMAudioDisconnectListener *)v20 initWithHandler:&v45];
    disconnectListener = v21->_disconnectListener;
    v21->_disconnectListener = (PMMAudioDisconnectListener *)v22;

    uint64_t v24 = objc_opt_new();
    ctConnection = v21->_ctConnection;
    v21->_ctConnection = (PMMTelephonyConnection *)v24;

    v26 = (void *)MEMORY[0x263F61888];
    v27 = objc_msgSend(MEMORY[0x263F25078], "mmConsumerMapping", v45, v46, v47, v48);
    v28 = [v26 propertyWithName:@"consumer" enumMapping:v27 autoSanitizeValues:1];

    v29 = (void *)MEMORY[0x263F61888];
    v30 = [MEMORY[0x263F25078] mmEventTypeMapping];
    v31 = [v29 propertyWithName:@"event" enumMapping:v30 autoSanitizeValues:1];

    v32 = (void *)MEMORY[0x263F61888];
    v33 = [MEMORY[0x263F25078] predictionReasonMapping];
    v34 = [v32 propertyWithName:@"reason" enumMapping:v33 autoSanitizeValues:1];

    v35 = [MEMORY[0x263F61888] propertyWithName:@"category" possibleValues:&unk_26D7A66C0 autoSanitizeValues:1];
    id v36 = objc_alloc(MEMORY[0x263F61898]);
    v52[0] = v28;
    v52[1] = v34;
    v52[2] = v31;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:3];
    uint64_t v38 = [v36 initWithFeatureId:@"MM" event:@"MMAppSuggestion" registerProperties:v37];
    mmAppSuggestion = v21->_mmAppSuggestion;
    v21->_mmAppSuggestion = (PETScalarEventTracker *)v38;

    id v40 = objc_alloc(MEMORY[0x263F61898]);
    v51[0] = v35;
    v51[1] = v28;
    v51[2] = v31;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
    uint64_t v42 = [v40 initWithFeatureId:@"MM" event:@"HeroAppSuggestion" registerProperties:v41];
    heroAppSuggestion = v21->_heroAppSuggestion;
    v21->_heroAppSuggestion = (PETScalarEventTracker *)v42;
  }
  return v2;
}

- (void)handlePredictedApplications:(id)a3
{
  id v4 = a3;
  v5 = [(PMMPredictor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__PMMPredictor_handlePredictedApplications___block_invoke;
  v7[3] = &unk_2646DFA18;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__PMMPredictor_handlePredictedApplications___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 count])
  {
    uint64_t v3 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__PMMPredictor_handlePredictedApplications___block_invoke_61;
    block[3] = &unk_2646DFA18;
    int8x16_t v6 = *(int8x16_t *)(a1 + 32);
    id v4 = (id)v6.i64[0];
    int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
    dispatch_async(v3, block);
  }
  else
  {
    v5 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v5, OS_LOG_TYPE_DEFAULT, "nil predictions or zero count applications. Clearing all recommendations (just in case) and exiting.", buf, 2u);
    }

    [*(id *)(a1 + 40) _clearAllRecommendations];
  }
}

void __44__PMMPredictor_handlePredictedApplications___block_invoke_61(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    uint64_t v3 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "A user is busy now. Keep it in silence.", v5, 2u);
    }
  }
  else
  {
    id v4 = (id)[v2 _publishPredictionWithPredictedApplication:*(void *)(a1 + 40) fromUnitTest:0];
  }
}

- (void)_notifyAppPredictionAboutMMUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PMMPredictor *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    int8x16_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:300.0];
    dispatch_queue_t v7 = [[PMMPrediction alloc] initWithPredictedItems:v4 expirationDate:v6];
    int8x16_t v8 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2247FC000, v8, OS_LOG_TYPE_DEFAULT, "populating app prediction expert with MM prediction, %@", (uint8_t *)&v9, 0xCu);
    }

    +[PMMPredictionNotification postPredictionUpdate:v7 consumer:1];
  }
}

+ (id)getHighestConfidencePredictionForNowPlayingConsumerFromPredictions:(id)a3 fromUnitTest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (+[PMMPredictor _predictionPopulatesNowPlaying:fromUnitTest:](PMMPredictor, "_predictionPopulatesNowPlaying:fromUnitTest:", v10, v4, (void)v13))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)logPrediction:(id)a3 predictionSource:(unint64_t)a4 mmReason:(int64_t)a5 decReason:(int64_t)a6 reasonSingle:(int64_t)a7 reasonMetadata:(id)a8
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2247FC000, v11, OS_LOG_TYPE_DEFAULT, "prediction type was magical moments", buf, 2u);
  }

  dispatch_queue_t v12 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [MEMORY[0x263F25078] stringForMMConsumerType:0];
    long long v14 = [MEMORY[0x263F25078] stringForPredictionReason:a7];
    *(_DWORD *)buf = 138412802;
    int v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2048;
    int64_t v24 = a6;
    _os_log_impl(&dword_2247FC000, v12, OS_LOG_TYPE_DEFAULT, "com.apple.MagicalMoments metrics: MM, consumer %@, reasonSingle %@, reason %ld, suggested", buf, 0x20u);
  }
  long long v15 = [(PMMPredictor *)self mmAppSuggestion];
  v18[0] = &unk_26D7A6630;
  long long v16 = [NSNumber numberWithInteger:a7];
  v18[1] = v16;
  v18[2] = &unk_26D7A6630;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  [v15 trackEventWithPropertyValues:v17];
}

- (id)preprocessPrediction:(id)a3 predictionSource:(unint64_t)a4 mmReason:(int64_t)a5 decReason:(int64_t)a6 reasonSingle:(int64_t)a7 reasonMetadata:(id)a8
{
  void v18[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  if ([(PMMPredictor *)self _recommendingAudioWhileAlreadyPlaying:v10])
  {
    id v11 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2247FC000, v11, OS_LOG_TYPE_DEFAULT, "suppressing suggestion since audio is already playing", v17, 2u);
    }

    dispatch_queue_t v12 = [(PMMPredictor *)self mmAppSuggestion];
    v18[0] = &unk_26D7A6630;
    long long v13 = [NSNumber numberWithInteger:a7];
    v18[1] = v13;
    v18[2] = &unk_26D7A6648;
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
    [v12 trackEventWithPropertyValues:v14];

    id v15 = 0;
  }
  else
  {
    id v15 = v10;
  }

  return v15;
}

- (id)notifyNonNowPlayingConsumersOfPredictionItem:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  if (+[PMMPredictor _predictionPopulatesContinuity:v4])
  {
    uint64_t v6 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v6, OS_LOG_TYPE_DEFAULT, "prediction populates continuity", buf, 2u);
    }

    uint64_t v7 = -[PMMPredictor expirationForReason:](self, "expirationForReason:", [v4 reason]);
    uint64_t v8 = [PMMPrediction alloc];
    v23[0] = v4;
    int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v10 = [(PMMPrediction *)v8 initWithPredictedItems:v9 expirationDate:v7];

    if (+[PMMPredictor _predictionPopulatesSpringboard:v4])
    {
      id v11 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v10;
        _os_log_impl(&dword_2247FC000, v11, OS_LOG_TYPE_DEFAULT, "prediction populates springboard, %@", buf, 0xCu);
      }

      +[PMMPredictionNotification postPredictionUpdate:v10 consumer:5];
      dispatch_queue_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F25078], "mmConsumerTypeOfConsumerType:consumerSubType:", 1, 1));
      [v5 addObject:v12];

      long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F25078], "mmConsumerTypeOfConsumerType:consumerSubType:", 1, 2));
      [v5 addObject:v13];
    }
  }
  if (+[PMMPredictor _predictionPopulatesStark:v4])
  {
    long long v14 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v14, OS_LOG_TYPE_DEFAULT, "Prediction populates carplay", buf, 2u);
    }

    id v15 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:30.0];
    long long v16 = [PMMPrediction alloc];
    id v20 = v4;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    uint64_t v18 = [(PMMPrediction *)v16 initWithPredictedItems:v17 expirationDate:v15];

    +[PMMPredictionNotification postPredictionUpdate:v18 consumer:3];
    [v5 addObject:&unk_26D7A6660];
  }
  return v5;
}

- (void)notifyNowPlayingConsumerOfPredictionItem:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PMMPredictor *)self setMostRecentNowPlayingPrediction:v4];
  id v5 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2247FC000, v5, OS_LOG_TYPE_DEFAULT, "Prediction populates now playing.", v10, 2u);
  }

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:30.0];
  uint64_t v7 = [PMMPrediction alloc];
  v11[0] = v4;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  int v9 = [(PMMPrediction *)v7 initWithPredictedItems:v8 expirationDate:v6];

  +[PMMPredictionNotification postPredictionUpdate:v9 consumer:2];
}

- (id)_publishPredictionWithPredictedApplication:(id)a3 fromUnitTest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [(PMMPredictor *)self queue];
  dispatch_assert_queue_V2(v8);

  if (!v7)
  {
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"PMMPredictor.m", 253, @"Invalid parameter not satisfying: %@", @"predictedApplications" object file lineNumber description];
  }
  [(PMMPredictor *)self _notifyAppPredictionAboutMMUpdate:v7];
  int v9 = objc_opt_new();
  [v9 addObject:&unk_26D7A6678];
  [v9 addObject:&unk_26D7A6690];
  id v10 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v58 = [v7 count];
    _os_log_impl(&dword_2247FC000, v10, OS_LOG_TYPE_DEFAULT, "Got %lu Magical Moments predictions.", buf, 0xCu);
  }

  if (![v7 count])
  {
    v26 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v26, OS_LOG_TYPE_DEFAULT, "Got empty Magical Moments prediction.", buf, 2u);
    }
    goto LABEL_31;
  }
  id v11 = [v7 firstObject];
  uint64_t v12 = [v11 reason];
  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "pmmReasonToDECReason:", -[NSObject reason](v11, "reason"));
  uint64_t v14 = [MEMORY[0x263F25078] selectSingleReason:v13];
  id v15 = [v11 reasonMetadata];
  [(PMMPredictor *)self logPrediction:v11 predictionSource:2 mmReason:v12 decReason:v13 reasonSingle:v14 reasonMetadata:v15];
  [(PMMPredictor *)self setMostRecentPrediction:v11];
  uint64_t v50 = v14;
  long long v16 = [(PMMPredictor *)self preprocessPrediction:v11 predictionSource:2 mmReason:v12 decReason:v13 reasonSingle:v14 reasonMetadata:v15];
  v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 bundleId];
    if (v18)
    {
      v19 = (void *)v18;
      [v17 bundleId];
      v21 = BOOL v20 = v4;
      uint64_t v22 = [v21 length];

      if (v22)
      {
        v49 = v9;
        __int16 v23 = [(PMMPredictor *)self notifyNonNowPlayingConsumersOfPredictionItem:v17];
        v47 = v15;
        v48 = v23;
        if (+[PMMPredictor _predictionPopulatesNowPlaying:v17 fromUnitTest:v20])
        {
          if (([v23 containsObject:&unk_26D7A6660] & 1) == 0)
          {
            [(PMMPredictor *)self notifyNowPlayingConsumerOfPredictionItem:v17];
            [v23 addObject:&unk_26D7A6630];
          }
        }
        else
        {
          v27 = +[PMMPredictor getHighestConfidencePredictionForNowPlayingConsumerFromPredictions:v7 fromUnitTest:v20];
          v28 = v27;
          if (v27)
          {
            uint64_t v45 = [v27 reason];
            uint64_t v29 = objc_msgSend((id)objc_opt_class(), "pmmReasonToDECReason:", objc_msgSend(v28, "reason"));
            uint64_t v30 = [MEMORY[0x263F25078] selectSingleReason:v29];
            v31 = [v28 reasonMetadata];
            [(PMMPredictor *)self logPrediction:v28 predictionSource:2 mmReason:v45 decReason:v29 reasonSingle:v30 reasonMetadata:v31];
            v32 = [(PMMPredictor *)self preprocessPrediction:v28 predictionSource:2 mmReason:v45 decReason:v29 reasonSingle:v30 reasonMetadata:v31];
            if (v32 && ([v23 containsObject:&unk_26D7A6660] & 1) == 0)
            {
              [(PMMPredictor *)self notifyNowPlayingConsumerOfPredictionItem:v32];
              [v23 addObject:&unk_26D7A6630];
            }

            int v9 = v49;
          }
        }
        uint64_t v46 = v17;
        v33 = self;
        [v9 addObjectsFromArray:v23];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v34 = v9;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v52 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              id v40 = [(PMMPredictor *)v33 mmAppSuggestion];
              v55[0] = v39;
              v41 = [NSNumber numberWithInteger:v50];
              v55[1] = v41;
              v55[2] = &unk_26D7A6678;
              uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:3];
              [v40 trackEventWithPropertyValues:v42];
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v56 count:16];
          }
          while (v36);
        }

        v26 = v11;
        int v9 = v49;
LABEL_31:

        id v25 = v9;
        goto LABEL_32;
      }
    }
  }
  int64_t v24 = __atxlog_handle_default();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[PMMPredictor _publishPredictionWithPredictedApplication:fromUnitTest:](v24);
  }

  id v25 = (id)MEMORY[0x263EFFA68];
LABEL_32:

  return v25;
}

- (void)_clearAllRecommendationsExceptAppPredictions
{
  uint64_t v3 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all recommendations, except App Predictions.", v4, 2u);
  }

  +[PMMPredictionNotification postPredictionUpdate:0 consumer:5];
  +[PMMPredictionNotification postPredictionUpdate:0 consumer:3];
  +[PMMPredictionNotification postPredictionUpdate:0 consumer:2];
  [(PMMPredictor *)self setMostRecentNowPlayingPrediction:0];
}

- (void)_clearAllRecommendations
{
  uint64_t v3 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all recommendations. (1) Clear recommendations for SpringBoard, Stark, and NowPlaying. (2) Clear recommendations for App Predictions.", buf, 2u);
  }

  [(PMMPredictor *)self _clearAllRecommendationsExceptAppPredictions];
  BOOL v4 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_DEFAULT, "Clearing recommendations for App Predictions.", v5, 2u);
  }

  +[PMMPredictionNotification postPredictionUpdate:0 consumer:1];
  [(PMMPredictor *)self setMostRecentPrediction:0];
}

- (id)expirationForReason:(int64_t)a3
{
  char v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = [(PMMPredictor *)self queue];
  dispatch_assert_queue_V2(v4);

  if ((v3 & 0x10) == 0 && (v3 & 8) != 0)
  {
    id v5 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = 300;
      _os_log_impl(&dword_2247FC000, v5, OS_LOG_TYPE_DEFAULT, "Received a prediction for FirstWakeupOfDay. Setting the expiration date to %lu seconds from now.", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:300.0];
  return v6;
}

+ (BOOL)_predictionPopulatesSpringboard:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F351D0] keyPathForAppDataDictionary];
  id v5 = +[PMMContextHelper sharedInstance];
  uint64_t v6 = [v5 fetchDataDictionaryForKeyPath:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F351D0] appBundleIdKey];
    int v8 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v9 = [v3 bundleId];
  char v10 = [v8 isEqualToString:v9] ^ 1;

  return v10;
}

+ (BOOL)_predictionPopulatesContinuity:(id)a3
{
  id v3 = a3;
  if ([v3 reason] == 8 || !objc_msgSend(v3, "reason") || objc_msgSend(v3, "reason") == 512) {
    goto LABEL_4;
  }
  [v3 confidence];
  if (v6 >= 0.25)
  {
    char v4 = 1;
    goto LABEL_5;
  }
  if (([v3 reason] & 0x86) == 0)
  {
LABEL_4:
    char v4 = 0;
  }
  else
  {
    id v7 = objc_opt_class();
    int v8 = [v3 bundleId];
    char v4 = [v7 bundleSupportsINPlayMediaIntentForBundleId:v8 fromUnitTest:0];
  }
LABEL_5:

  return v4;
}

+ (BOOL)_predictionIsAudio:(id)a3
{
  return ([a3 reason] & 0x86) != 0;
}

+ (BOOL)bundleSupportsINPlayMediaIntentForBundleId:(id)a3 fromUnitTest:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F24FF8] appInfoForBundle:a3];
  double v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = [v5 supportedActions];
  char v9 = [v8 containsObject:v7];

  if (v9)
  {
    if (a4
      || ([v5 actionsRestrictedWhileLocked],
          char v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 containsObject:v7],
          v10,
          !v11))
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
    uint64_t v12 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v7;
      uint64_t v13 = "Prediction does not support %@ handling while device is locked.";
LABEL_8:
      _os_log_impl(&dword_2247FC000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v7;
      uint64_t v13 = "Prediction does not support %@.";
      goto LABEL_8;
    }
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

+ (BOOL)_predictionPopulatesNowPlaying:(id)a3 fromUnitTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!+[PMMPredictor _predictionIsAudio:v5])
  {
    int v8 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      int v11 = "Prediction does not populate now playing because it is not an audio prediction.";
      uint64_t v12 = (uint8_t *)&v16;
LABEL_10:
      _os_log_impl(&dword_2247FC000, v8, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
LABEL_11:
    BOOL v10 = 0;
    goto LABEL_12;
  }
  double v6 = [v5 bundleId];
  BOOL v7 = +[PMMPredictor bundleSupportsINPlayMediaIntentForBundleId:v6 fromUnitTest:v4];

  int v8 = __atxlog_handle_pmm();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      int v11 = "Prediction does not support the INPlayMediaIntent, and, thus, cannot populate NowPlaying.";
      uint64_t v12 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)BOOL v14 = 0;
    _os_log_impl(&dword_2247FC000, v8, OS_LOG_TYPE_DEFAULT, "prediction does populate now playing", v14, 2u);
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_recommendingAudioWhileAlreadyPlaying:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 reason] & 0x86) != 0)
  {
    *(void *)buf = 0;
    __int16 v16 = buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    double v6 = [(PMMPredictor *)self nowPlayingStatusQueue];
    uint64_t v14 = MEMORY[0x263EF8330];
    BOOL v7 = v5;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();

    if (objc_msgSend(MEMORY[0x263F61E38], "waitForSemaphore:timeoutSeconds:", v7, 5.0, v14, 3221225472, __54__PMMPredictor__recommendingAudioWhileAlreadyPlaying___block_invoke, &unk_2646DFA40) == 1)
    {
      int v8 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PMMPredictor _recommendingAudioWhileAlreadyPlaying:](v8);
      }

      BOOL v9 = 0;
    }
    else
    {
      int v11 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v16[24];
        *(_DWORD *)v19 = 67109120;
        int v20 = v12;
        _os_log_impl(&dword_2247FC000, v11, OS_LOG_TYPE_DEFAULT, "recommending while audio playing, %d", v19, 8u);
      }

      BOOL v9 = v16[24] != 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v10 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v10, OS_LOG_TYPE_DEFAULT, "prediction is not audio, BT or stark but it wants to populate NP", buf, 2u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

intptr_t __54__PMMPredictor__recommendingAudioWhileAlreadyPlaying___block_invoke(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)_predictionPopulatesStark:(id)a3
{
  unint64_t v3 = [a3 reason];
  id v4 = __atxlog_handle_pmm();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 0x80) != 0)
  {
    if (v5)
    {
      __int16 v10 = 0;
      double v6 = "prediction does populate stark";
      BOOL v7 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    double v6 = "prediction does not populate stark because reason is not stark";
    BOOL v7 = buf;
    goto LABEL_6;
  }

  return (v3 >> 7) & 1;
}

+ (int64_t)pmmReasonToDECReason:(int64_t)a3
{
  return a3 & 0x210 | ((unint64_t)a3 >> 1) & 3 | ((a3 & 1u) << 6) | (32
                                                                                           * (((unint64_t)a3 >> 3) & 1)) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)a3 >> 3) & 8 | ((unint64_t)a3 >> 5) & 4 | ((((unint64_t)a3 >> 5) & 1) << 10) | (8 * (int)a3) & 0x800;
}

- (void)_updatePredictionBasedOnPreviousDataProtectionStatus:(int64_t)a3 previousEncryptedDataAvailability:(int64_t)a4
{
  BOOL v5 = [(PMMPredictor *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(PMMPredictor *)self mostRecentPrediction];
  char v7 = [v6 reason];

  if ((v7 & 8) != 0)
  {
    int v8 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v8, OS_LOG_TYPE_DEFAULT, "prediction is first wake up", buf, 2u);
    }

    if ([(PMMPredictor *)self encryptedDataAvailability] == 3)
    {
      BOOL v9 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl(&dword_2247FC000, v9, OS_LOG_TYPE_DEFAULT, "clearing recommendation based on lock status", v12, 2u);
      }

      [(PMMPredictor *)self _clearAllRecommendations];
    }
  }
  if ([(PMMPredictor *)self encryptedDataAvailability] == 3)
  {
    __int16 v10 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_2247FC000, v10, OS_LOG_TYPE_DEFAULT, "locking, clearing any now playing recommendations", v11, 2u);
    }

    +[PMMPredictionNotification postPredictionUpdate:0 consumer:2];
  }
}

- (void)dataProtectionMonitor:(id)a3 encryptedDataAvailbilityDidChange:(int64_t)a4
{
  double v6 = [(PMMPredictor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__PMMPredictor_dataProtectionMonitor_encryptedDataAvailbilityDidChange___block_invoke;
  v7[3] = &unk_2646DFA68;
  void v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);
}

uint64_t __72__PMMPredictor_dataProtectionMonitor_encryptedDataAvailbilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) encryptedDataAvailability];
  [*(id *)(a1 + 32) setEncryptedDataAvailability:*(void *)(a1 + 40)];
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 dataProtectionStatus];
  return [v3 _updatePredictionBasedOnPreviousDataProtectionStatus:v4 previousEncryptedDataAvailability:v2];
}

- (void)dataProtectionMonitor:(id)a3 unlockedSinceBoot:(BOOL)a4
{
  double v6 = [(PMMPredictor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__PMMPredictor_dataProtectionMonitor_unlockedSinceBoot___block_invoke;
  v7[3] = &unk_2646DFA90;
  void v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

uint64_t __56__PMMPredictor_dataProtectionMonitor_unlockedSinceBoot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUnlockedSinceBoot:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dataProtectionMonitor:(id)a3 dataProtectionStatusDidChange:(int64_t)a4
{
  double v6 = [(PMMPredictor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__PMMPredictor_dataProtectionMonitor_dataProtectionStatusDidChange___block_invoke;
  v7[3] = &unk_2646DFA68;
  void v7[4] = self;
  void v7[5] = a4;
  dispatch_async(v6, v7);
}

uint64_t __68__PMMPredictor_dataProtectionMonitor_dataProtectionStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) dataProtectionStatus];
  unint64_t v3 = __atxlog_handle_pmm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v2;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "data protection status did change from %ld to %ld", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) setDataProtectionStatus:*(void *)(a1 + 40)];
  return objc_msgSend(*(id *)(a1 + 32), "_updatePredictionBasedOnPreviousDataProtectionStatus:previousEncryptedDataAvailability:", v2, objc_msgSend(*(id *)(a1 + 32), "encryptedDataAvailability"));
}

- (void)handleNowPlayingInfoDidChange
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(PMMPredictor *)self nowPlayingStatusQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__PMMPredictor_handleNowPlayingInfoDidChange__block_invoke;
  v4[3] = &unk_2646DFAB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__PMMPredictor_handleNowPlayingInfoDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNowPlayingInfoDidChange];
}

- (void)_handleNowPlayingInfoDidChange
{
  unint64_t v3 = [(PMMPredictor *)self nowPlayingStatusQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = dispatch_group_create();
  v11[0] = 0;
  v11[1] = v11;
  void v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  id v12 = 0;
  dispatch_group_enter(v4);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke;
  v8[3] = &unk_2646DFAE0;
  uint64_t v10 = v11;
  id v5 = v4;
  uint64_t v9 = v5;
  [(PMMPredictor *)self fetchMediaRemoteNowPlayingApplicationBundleId:v8];
  int v6 = [(PMMPredictor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke_2;
  v7[3] = &unk_2646DFB08;
  void v7[4] = self;
  void v7[5] = v11;
  dispatch_group_notify(v5, v6, v7);

  _Block_object_dispose(v11, 8);
}

void __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"duetexpertd"] & 1) == 0)
  {
    [*(id *)(a1 + 32) setMostRecentNowPlayingApp:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v2 = [MEMORY[0x263EFF910] date];
    [*(id *)(a1 + 32) setDateOfLastNowPlayingEvent:v2];

    unint64_t v3 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) mostRecentNowPlayingApp];
      id v5 = [*(id *)(a1 + 32) dateOfLastNowPlayingEvent];
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "now playing info did change: %@, %@, ", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)fetchMediaRemoteNowPlayingApplicationPlaybackState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PMMPredictor *)self nowPlayingStatusQueue];
    id v6 = v4;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  }
}

uint64_t __67__PMMPredictor_fetchMediaRemoteNowPlayingApplicationPlaybackState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMediaRemoteNowPlayingApplicationBundleId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PMMPredictor *)self nowPlayingStatusQueue];
    id v6 = v4;
    MRMediaRemoteGetClientProperties();
  }
}

uint64_t __62__PMMPredictor_fetchMediaRemoteNowPlayingApplicationBundleId___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t BundleIdentifier = MRNowPlayingClientGetBundleIdentifier();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, BundleIdentifier);
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5 = a3;
  id v6 = [(PMMPredictor *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__PMMPredictor_callObserver_callChanged___block_invoke;
  v8[3] = &unk_2646DFA18;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __41__PMMPredictor_callObserver_callChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) calls];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v2 count] != 0;
}

- (PMMAudioDisconnectListener)disconnectListener
{
  return self->_disconnectListener;
}

- (void)setDisconnectListener:(id)a3
{
}

- (PMMMusicStateProcessor)musicStateProcessor
{
  return self->_musicStateProcessor;
}

- (void)setMusicStateProcessor:(id)a3
{
}

- (OS_dispatch_queue)nowPlayingStatusQueue
{
  return self->_nowPlayingStatusQueue;
}

- (void)setNowPlayingStatusQueue:(id)a3
{
}

- (PMMTelephonyConnection)ctConnection
{
  return self->_ctConnection;
}

- (void)setCtConnection:(id)a3
{
}

- (PMMDataProtectionMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void)setDataProtectionMonitor:(id)a3
{
}

- (void)setMostRecentPrediction:(id)a3
{
}

- (PMMPredictionItem)mostRecentNowPlayingPrediction
{
  return self->_mostRecentNowPlayingPrediction;
}

- (void)setMostRecentNowPlayingPrediction:(id)a3
{
}

- (NSString)mostRecentNowPlayingApp
{
  return self->_mostRecentNowPlayingApp;
}

- (void)setMostRecentNowPlayingApp:(id)a3
{
}

- (NSDate)dateOfLastNowPlayingEvent
{
  return self->_dateOfLastNowPlayingEvent;
}

- (void)setDateOfLastNowPlayingEvent:(id)a3
{
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (BOOL)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  self->_unlockedSinceBoot = a3;
}

- (int64_t)dataProtectionStatus
{
  return self->_dataProtectionStatus;
}

- (void)setDataProtectionStatus:(int64_t)a3
{
  self->_dataProtectionStatus = a3;
}

- (PETScalarEventTracker)mmAppSuggestion
{
  return self->_mmAppSuggestion;
}

- (void)setMmAppSuggestion:(id)a3
{
}

- (PETScalarEventTracker)heroAppSuggestion
{
  return self->_heroAppSuggestion;
}

- (void)setHeroAppSuggestion:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heroAppSuggestion, 0);
  objc_storeStrong((id *)&self->_mmAppSuggestion, 0);
  objc_storeStrong((id *)&self->_dateOfLastNowPlayingEvent, 0);
  objc_storeStrong((id *)&self->_mostRecentNowPlayingApp, 0);
  objc_storeStrong((id *)&self->_mostRecentNowPlayingPrediction, 0);
  objc_storeStrong((id *)&self->_mostRecentPrediction, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_ctConnection, 0);
  objc_storeStrong((id *)&self->_nowPlayingStatusQueue, 0);
  objc_storeStrong((id *)&self->_musicStateProcessor, 0);
  objc_storeStrong((id *)&self->_disconnectListener, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

- (void)_publishPredictionWithPredictedApplication:(os_log_t)log fromUnitTest:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2247FC000, log, OS_LOG_TYPE_ERROR, "Magical Moments prediction returned a nil or empty applicationBundleIdentifier", v1, 2u);
}

- (void)_recommendingAudioWhileAlreadyPlaying:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2247FC000, log, OS_LOG_TYPE_ERROR, "Could not read now playing state within 5s.", v1, 2u);
}

@end