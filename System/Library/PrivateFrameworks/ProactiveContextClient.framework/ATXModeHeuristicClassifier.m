@interface ATXModeHeuristicClassifier
- (ATXModeClassifierClientModelDelegate)delegate;
- (ATXModeHeuristicClassifier)initWithConfiguredModeService:(id)a3 locationManager:(id)a4;
- (ATXModeHeuristicClassifier)initWithFeaturizers:(id)a3 minUpdateInterval:(double)a4 configuredModeService:(id)a5;
- (BOOL)_isUserWorkingFromHomeWithAggregateFeatures:(id)a3;
- (double)_confidenceScoreForMode:(int)a3 fromAggregateFeatures:(id)a4;
- (id)_serializedTriggersForMode:(int)a3 fromAggregateFeatures:(id)a4;
- (id)_triggersForMode:(int)a3 fromAggregateFeatures:(id)a4;
- (id)currentFeaturesInDictionary;
- (int)_originForMode:(int)a3 fromAggregateFeatures:(id)a4;
- (int)_predictModeWithFeature:(id)a3;
- (int)currentMode;
- (void)_currentModeUUID:(id *)a3 userModeName:(id *)a4 modeType:(int *)a5 confidenceScore:(double *)a6 origin:(int *)a7 originBundleId:(id *)a8 serializedTrigger:(id *)a9 allowsSmartEntry:(BOOL *)a10 guardedData:(id)a11;
- (void)_requestFeaturesFromAllFeaturizersAndUpdate;
- (void)_updateIfNeededWithGuardedData:(id)a3;
- (void)_updateWithGuardedData:(id)a3;
- (void)currentModeUUID:(id *)a3 userModeName:(id *)a4 modeType:(int *)a5 confidenceScore:(double *)a6 origin:(int *)a7 originBundleId:(id *)a8 serializedTrigger:(id *)a9 allowsSmartEntry:(BOOL *)a10;
- (void)dealloc;
- (void)featurizer:(id)a3 didUpdateFeatures:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)updateWithFeatureSet:(id)a3;
- (void)updateWithFeatureSet:(id)a3 immediately:(BOOL)a4 reply:(id)a5;
@end

@implementation ATXModeHeuristicClassifier

- (ATXModeHeuristicClassifier)initWithConfiguredModeService:(id)a3 locationManager:(id)a4
{
  v23[12] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v22 = objc_opt_new();
  v23[0] = v22;
  v21 = objc_opt_new();
  v23[1] = v21;
  v20 = objc_opt_new();
  v23[2] = v20;
  v19 = objc_opt_new();
  v23[3] = v19;
  v17 = objc_opt_new();
  v23[4] = v17;
  v7 = [[ATXModeCalendarFeaturizer alloc] initWithLocationManager:v5];

  v23[5] = v7;
  v8 = objc_opt_new();
  v23[6] = v8;
  v9 = objc_opt_new();
  v23[7] = v9;
  v10 = objc_opt_new();
  v23[8] = v10;
  v11 = objc_opt_new();
  v23[9] = v11;
  v12 = objc_opt_new();
  v23[10] = v12;
  v13 = objc_opt_new();
  v23[11] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:12];
  v15 = [(ATXModeHeuristicClassifier *)self initWithFeaturizers:v14 minUpdateInterval:v6 configuredModeService:15.0];

  return v15;
}

- (ATXModeHeuristicClassifier)initWithFeaturizers:(id)a3 minUpdateInterval:(double)a4 configuredModeService:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)ATXModeHeuristicClassifier;
  v11 = [(ATXModeHeuristicClassifier *)&v46 init];
  if (v11)
  {
    if ([MEMORY[0x1E4F93B10] isClassCLocked])
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2 object:v11 file:@"ATXModeHeuristicClassifier.m" lineNumber:113 description:@"ATXModeHeuristicClassifier must not be initialized when the device is Class C locked"];
    }
    uint64_t v12 = [v9 copy];
    featurizers = v11->_featurizers;
    v11->_featurizers = (NSArray *)v12;

    v11->_minUpdateInterval = a4;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    v16 = (const char *)[v15 UTF8String];
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v11->_modeService, a5);
    uint64_t v20 = objc_opt_new();
    *(_DWORD *)(v20 + 32) = -1;
    uint64_t v21 = objc_opt_new();
    v22 = *(void **)(v20 + 8);
    *(void *)(v20 + 8) = v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
    v24 = *(void **)(v20 + 24);
    *(void *)(v20 + 24) = v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F93B80]) initWithGuardedData:v20 serialQueue:v11->_queue];
    lock = v11->_lock;
    v11->_lock = (_PASQueueLock *)v25;

    objc_initWeak(&location, v11);
    v27 = [ATXModeScheduler alloc];
    v28 = v11->_queue;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke;
    v43[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v44, &location);
    uint64_t v29 = [(ATXModeScheduler *)v27 initWithQueue:v28 operationBlock:v43 andLeeway:5.0];
    scheduler = v11->_scheduler;
    v11->_scheduler = (ATXModeScheduler *)v29;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v31 = v11->_featurizers;
    uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          objc_msgSend(v35, "setDelegate:", v11, (void)v39);
          [v35 beginListening];
        }
        uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v32);
    }

    [(ATXModeHeuristicClassifier *)v11 _requestFeaturesFromAllFeaturizersAndUpdate];
    v36 = __atxlog_handle_modes();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[ATXModeHeuristicClassifier initWithFeaturizers:minUpdateInterval:configuredModeService:](v36);
    }

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke_2;
    v4[3] = &unk_1E6BE7858;
    id v5 = WeakRetained;
    [v3 runAsyncWithLockAcquired:v4];
  }
}

uint64_t __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateIfNeededWithGuardedData:a2];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_featurizers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) stopListening];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ATXModeHeuristicClassifier;
  [(ATXModeHeuristicClassifier *)&v8 dealloc];
}

- (void)_requestFeaturesFromAllFeaturizersAndUpdate
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__ATXModeHeuristicClassifier__requestFeaturesFromAllFeaturizersAndUpdate__block_invoke;
  v3[3] = &unk_1E6BE7858;
  v3[4] = self;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v3];
}

void __73__ATXModeHeuristicClassifier__requestFeaturesFromAllFeaturizersAndUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v4;

  [*((id *)v3 + 3) removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "provideFeatures", (void)v13);
        if (v11) {
          [*((id *)v3 + 3) addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 32) _updateIfNeededWithGuardedData:v3];
  long long v12 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = 0;
}

- (void)_updateIfNeededWithGuardedData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)a3;
  id v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5[3] count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v7;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeHeuristicClassifier update with %d feature sets in buffer", buf, 8u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5[3];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v5[1], "mergeWithFeatures:", *(void *)(*((void *)&v22 + 1) + 8 * v12++), (void)v22);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v10);
  }

  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  int v14 = [(ATXModeHeuristicClassifier *)self _predictModeWithFeature:v5[1]];
  long long v15 = __atxlog_handle_modes();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = objc_opt_class();
    id v17 = v16;
    uint64_t v18 = NSStringFromSelector(a2);
    v19 = BMUserFocusInferredModeTypeAsString();
    *(_DWORD *)buf = 138412802;
    v27 = v16;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_1DAFF9000, v15, OS_LOG_TYPE_DEFAULT, "[%@][%@] Predicted mode: %@", buf, 0x20u);
  }
  if (v14 != *((_DWORD *)v5 + 8))
  {
    *((_DWORD *)v5 + 8) = v14;
    [(ATXModeHeuristicClassifier *)self _updateWithGuardedData:v5];
  }
  id v20 = v5[2];
  v5[2] = v13;
  id v21 = v13;

  [v5[3] removeAllObjects];
  [(ATXModeScheduler *)self->_scheduler cancelPendingOperation];
}

- (id)_serializedTriggersForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  uint64_t v4 = [(ATXModeHeuristicClassifier *)self _triggersForMode:*(void *)&a3 fromAggregateFeatures:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = ATXSerializeTriggers(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_triggersForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = v6;
  int v8 = a3 - 1;
  uint64_t v9 = 0;
  switch(v8)
  {
    case 0:
    case 1:
    case 9:
    case 10:
    case 11:
    case 13:
    case 16:
      goto LABEL_24;
    case 2:
      uint64_t v10 = [[ATXLocationEnteredTrigger alloc] initWithLocationIdentifier:0 namedLOI:2];
      uint64_t v18 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v18;
      goto LABEL_22;
    case 3:
      if ([v6 BOOLValueForFeatureType:2])
      {
        uint64_t v10 = [[ATXLocationEnteredTrigger alloc] initWithLocationIdentifier:0 namedLOI:1];
        id v17 = v10;
        uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v12 = &v17;
      }
      else
      {
        if (([v7 BOOLValueForFeatureType:26] & 1) == 0
          && ![(ATXModeHeuristicClassifier *)self _isUserWorkingFromHomeWithAggregateFeatures:v7])
        {
LABEL_20:
          uint64_t v9 = 0;
          goto LABEL_24;
        }
        uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
        long long v16 = v10;
        uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v12 = &v16;
      }
LABEL_22:
      uint64_t v9 = objc_msgSend(v11, "arrayWithObjects:count:", v12, 1, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
LABEL_23:

LABEL_24:
      return v9;
    case 4:
      uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      long long v23 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v23;
      goto LABEL_22;
    case 5:
      if (![v6 BOOLValueForFeatureType:4]) {
        goto LABEL_20;
      }
      uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      long long v24 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v24;
      goto LABEL_22;
    case 6:
      uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      v19 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v19;
      goto LABEL_22;
    case 7:
      if ([v6 BOOLValueForFeatureType:19])
      {
        uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
        long long v22 = v10;
        uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v12 = &v22;
      }
      else
      {
        uint64_t v10 = [[ATXAppCategoryTrigger alloc] initWithiTunesCategoryId:6014];
        id v21 = v10;
        uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v12 = &v21;
      }
      goto LABEL_22;
    case 8:
      uint64_t v10 = [[ATXAppCategoryTrigger alloc] initWithiTunesCategoryId:6018];
      id v20 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v20;
      goto LABEL_22;
    case 12:
    case 15:
      uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      long long v15 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v15;
      goto LABEL_22;
    case 14:
      uint64_t v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      int v14 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v12 = &v14;
      goto LABEL_22;
    default:
      __atxlog_handle_modes();
      uint64_t v10 = (ATXLocationEnteredTrigger *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_FAULT)) {
        -[ATXModeHeuristicClassifier _triggersForMode:fromAggregateFeatures:](0, &v10->super);
      }
      uint64_t v9 = 0;
      goto LABEL_23;
  }
}

- (BOOL)_isUserWorkingFromHomeWithAggregateFeatures:(id)a3
{
  id v3 = a3;
  if ([v3 BOOLValueForFeatureType:1]
    && [v3 BOOLValueForFeatureType:14])
  {
    char v4 = [v3 BOOLValueForFeatureType:25];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_updateWithGuardedData:(id)a3
{
  unsigned int v15 = 0;
  double v14 = 0.0;
  unsigned int v13 = 0;
  id v11 = 0;
  id v12 = 0;
  id v9 = 0;
  id v10 = 0;
  [(ATXModeHeuristicClassifier *)self _currentModeUUID:&v12 userModeName:&v11 modeType:&v15 confidenceScore:&v14 origin:&v13 originBundleId:&v10 serializedTrigger:&v9 allowsSmartEntry:0 guardedData:a3];
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;
  id v7 = v9;
  int v8 = [(ATXModeHeuristicClassifier *)self delegate];
  [v8 clientModel:self didUpdatePredictionWithUUID:v4 userModeName:v5 modeType:v15 confidenceScore:v13 modeOrigin:v6 originBundleId:v14 originAnchorType:0 serializedTriggers:v7];
}

- (void)currentModeUUID:(id *)a3 userModeName:(id *)a4 modeType:(int *)a5 confidenceScore:(double *)a6 origin:(int *)a7 originBundleId:(id *)a8 serializedTrigger:(id *)a9 allowsSmartEntry:(BOOL *)a10
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__15;
  v37 = __Block_byref_object_dispose__15;
  id v38 = 0;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = __Block_byref_object_copy__15;
  v31 = __Block_byref_object_dispose__15;
  id v32 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__15;
  uint64_t v25 = __Block_byref_object_dispose__15;
  id v26 = 0;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  id v20 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __141__ATXModeHeuristicClassifier_currentModeUUID_userModeName_modeType_confidenceScore_origin_originBundleId_serializedTrigger_allowsSmartEntry___block_invoke;
  v14[3] = &unk_1E6BE7880;
  v14[4] = self;
  v14[5] = &v33;
  v14[10] = a6;
  v14[11] = a7;
  v14[6] = &v21;
  v14[7] = &v27;
  v14[8] = &v15;
  v14[9] = a5;
  v14[12] = a10;
  [(_PASQueueLock *)lock runWithLockAcquired:v14];
  if (a3) {
    *a3 = (id) v34[5];
  }
  if (a4) {
    *a4 = (id) v22[5];
  }
  if (a8) {
    *a8 = (id) v28[5];
  }
  if (a9) {
    *a9 = (id) v16[5];
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

void __141__ATXModeHeuristicClassifier_currentModeUUID_userModeName_modeType_confidenceScore_origin_originBundleId_serializedTrigger_allowsSmartEntry___block_invoke(void *a1, uint64_t a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v14 = *(id *)(v3 + 40);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  uint64_t v6 = a1[10];
  uint64_t v7 = a1[11];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v12 = *(id *)(v8 + 40);
  id obj = v5;
  uint64_t v9 = a1[9];
  uint64_t v10 = *(void *)(a1[8] + 8);
  id v11 = *(id *)(v10 + 40);
  [v2 _currentModeUUID:&v14 userModeName:&obj modeType:v9 confidenceScore:v6 origin:v7 originBundleId:&v12 serializedTrigger:&v11 allowsSmartEntry:a1[12] guardedData:a2];
  objc_storeStrong((id *)(v3 + 40), v14);
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v12);
  objc_storeStrong((id *)(v10 + 40), v11);
}

- (void)_currentModeUUID:(id *)a3 userModeName:(id *)a4 modeType:(int *)a5 confidenceScore:(double *)a6 origin:(int *)a7 originBundleId:(id *)a8 serializedTrigger:(id *)a9 allowsSmartEntry:(BOOL *)a10 guardedData:(id)a11
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = (unsigned int *)a11;
  uint64_t v18 = v17[8];
  BOOL v36 = 0;
  if (v18 != 2)
  {
    v31 = a7;
    id v32 = a8;
    uint64_t v21 = BMUserFocusInferredModeTypeToActivity(v18);
    modeService = self->_modeService;
    id v34 = 0;
    id v35 = 0;
    BOOL v23 = [(ATXConfiguredModeService *)modeService isActivityTypeConfigured:v21 uuid:&v35 allowsSmartEntry:&v36 userModeName:&v34];
    id v20 = v35;
    id v30 = v34;
    long long v24 = __atxlog_handle_modes();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v25) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v38 = v21;
      __int16 v39 = 2114;
      id v40 = v20;
      id v26 = "Found configured activity for type: %ld uuid: %{public}@";
      uint64_t v27 = v24;
      uint32_t v28 = 22;
    }
    else
    {
      if (!v25) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = v21;
      id v26 = "No configured activity for type: %ld, making generic suggestion";
      uint64_t v27 = v24;
      uint32_t v28 = 12;
    }
    _os_log_impl(&dword_1DAFF9000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
LABEL_10:

    a7 = v31;
    a8 = v32;
    v19 = v30;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v19 = 0;
  id v20 = 0;
  if (a3) {
LABEL_11:
  }
    *a3 = v20;
LABEL_12:
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v18;
  }
  if (a6)
  {
    [(ATXModeHeuristicClassifier *)self _confidenceScoreForMode:v18 fromAggregateFeatures:*((void *)v17 + 1)];
    *(void *)a6 = v29;
  }
  if (a7) {
    *a7 = [(ATXModeHeuristicClassifier *)self _originForMode:v18 fromAggregateFeatures:*((void *)v17 + 1)];
  }
  if (a8)
  {
    *a8 = [*((id *)v17 + 1) stringForFeatureType:16];
  }
  if (a9)
  {
    *a9 = [(ATXModeHeuristicClassifier *)self _serializedTriggersForMode:v18 fromAggregateFeatures:*((void *)v17 + 1)];
  }
  if (a10) {
    *a10 = v36;
  }
}

- (int)_originForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  int v8 = a3 - 1;
  int v9 = 0;
  switch(v8)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 13:
    case 16:
      goto LABEL_32;
    case 1:
      int v9 = 1;
      goto LABEL_32;
    case 2:
      BOOL v11 = [v6 BOOLValueForFeatureType:1] == 0;
      int v12 = 5;
      goto LABEL_29;
    case 3:
      if (([v6 BOOLValueForFeatureType:2] & 1) != 0
        || ([v7 BOOLValueForFeatureType:23] & 1) != 0)
      {
        goto LABEL_26;
      }
      if (([v7 BOOLValueForFeatureType:26] & 1) != 0
        || ([v7 BOOLValueForFeatureType:27] & 1) != 0)
      {
        int v9 = 10;
        goto LABEL_32;
      }
      BOOL v11 = ![(ATXModeHeuristicClassifier *)self _isUserWorkingFromHomeWithAggregateFeatures:v7];
      int v12 = 9;
      goto LABEL_29;
    case 4:
      if ([v6 BOOLValueForFeatureType:3])
      {
        int v9 = 8;
        goto LABEL_32;
      }
      if ([v7 BOOLValueForFeatureType:22])
      {
LABEL_26:
        int v9 = 5;
        goto LABEL_32;
      }
      BOOL v11 = [v7 BOOLValueForFeatureType:24] == 0;
      int v12 = 16;
      goto LABEL_29;
    case 5:
      if ([v6 BOOLValueForFeatureType:4]) {
        int v9 = 4;
      }
      else {
        int v9 = 0;
      }
      goto LABEL_32;
    case 6:
      BOOL v11 = [v6 BOOLValueForFeatureType:7] == 0;
      int v12 = 6;
      goto LABEL_29;
    case 7:
      if ([v6 BOOLValueForFeatureType:19])
      {
        int v9 = 15;
      }
      else
      {
        id v6 = v7;
        uint64_t v13 = 8;
LABEL_28:
        BOOL v11 = [v6 BOOLValueForFeatureType:v13] == 0;
        int v12 = 7;
LABEL_29:
        if (v11) {
          int v9 = 0;
        }
        else {
          int v9 = v12;
        }
      }
LABEL_32:

      return v9;
    case 8:
      uint64_t v13 = 15;
      goto LABEL_28;
    case 12:
      uint64_t v14 = 17;
      goto LABEL_24;
    case 14:
      BOOL v11 = [v6 BOOLValueForFeatureType:18] == 0;
      int v12 = 14;
      goto LABEL_29;
    case 15:
      uint64_t v14 = 20;
LABEL_24:
      BOOL v11 = [v6 BOOLValueForFeatureType:v14] == 0;
      int v12 = 13;
      goto LABEL_29;
    default:
      uint64_t v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXModeHeuristicClassifier _triggersForMode:fromAggregateFeatures:](0, v10);
      }

      int v9 = 0;
      goto LABEL_32;
  }
}

- (double)_confidenceScoreForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  return 0.8;
}

- (int)_predictModeWithFeature:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeHeuristicClassifier predict mode with features: %@", (uint8_t *)&v8, 0xCu);
  }

  int v6 = 8;
  if (([v4 BOOLValueForFeatureType:8] & 1) == 0
    && ([v4 BOOLValueForFeatureType:19] & 1) == 0)
  {
    if ([v4 BOOLValueForFeatureType:15])
    {
      int v6 = 9;
    }
    else if ([v4 BOOLValueForFeatureType:3])
    {
      int v6 = 5;
    }
    else if ([v4 BOOLValueForFeatureType:4])
    {
      int v6 = 6;
    }
    else if ([v4 BOOLValueForFeatureType:17])
    {
      if ([v4 BOOLValueForFeatureType:20]) {
        int v6 = 16;
      }
      else {
        int v6 = 13;
      }
    }
    else if ([v4 BOOLValueForFeatureType:18])
    {
      int v6 = 15;
    }
    else if (([v4 BOOLValueForFeatureType:2] & 1) != 0 {
           || ([v4 BOOLValueForFeatureType:23] & 1) != 0
    }
           || ([v4 BOOLValueForFeatureType:26] & 1) != 0
           || ([v4 BOOLValueForFeatureType:27] & 1) != 0
           || ([v4 BOOLValueForFeatureType:28] & 1) != 0
           || [(ATXModeHeuristicClassifier *)self _isUserWorkingFromHomeWithAggregateFeatures:v4])
    {
      int v6 = 4;
    }
    else
    {
      int v6 = 7;
      if (([v4 BOOLValueForFeatureType:7] & 1) == 0)
      {
        if ([v4 BOOLValueForFeatureType:1])
        {
          int v6 = 3;
        }
        else
        {
          int v6 = 5;
          if (([v4 BOOLValueForFeatureType:22] & 1) == 0)
          {
            if ([v4 BOOLValueForFeatureType:24]) {
              int v6 = 5;
            }
            else {
              int v6 = 2;
            }
          }
        }
      }
    }
  }

  return v6;
}

- (int)currentMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ATXModeHeuristicClassifier_currentMode__block_invoke;
  v5[3] = &unk_1E6BE78A8;
  v5[4] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__ATXModeHeuristicClassifier_currentMode__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 32);
  return result;
}

- (id)currentFeaturesInDictionary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ATXModeHeuristicClassifier_currentFeaturesInDictionary__block_invoke;
  v5[3] = &unk_1E6BE78A8;
  v5[4] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __57__ATXModeHeuristicClassifier_currentFeaturesInDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) dictionaryRepresentation];

  return MEMORY[0x1F41817F8]();
}

- (void)updateWithFeatureSet:(id)a3
{
}

- (void)updateWithFeatureSet:(id)a3 immediately:(BOOL)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    lock = self->_lock;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__ATXModeHeuristicClassifier_updateWithFeatureSet_immediately_reply___block_invoke;
    v12[3] = &unk_1E6BE78D0;
    BOOL v16 = a4;
    id v13 = v8;
    uint64_t v14 = self;
    id v15 = v10;
    [(_PASQueueLock *)lock runAsyncWithLockAcquired:v12];
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __69__ATXModeHeuristicClassifier_updateWithFeatureSet_immediately_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = a2;
  [v10[3] addObject:*(void *)(a1 + 32)];
  id v3 = v10;
  if (*(unsigned char *)(a1 + 56) || !v10[2] || (unint64_t v7 = [v10[3] count], v3 = v10, v7 >= 0x64))
  {
    id v4 = *(id **)(a1 + 40);
LABEL_3:
    [v4 _updateIfNeededWithGuardedData:v3];
    id v5 = 0;
    goto LABEL_4;
  }
  double v8 = *(double *)(*(void *)(a1 + 40) + 16);
  [v10[2] timeIntervalSinceNow];
  id v4 = *(id **)(a1 + 40);
  if (v8 + v9 <= 0.0)
  {
    id v3 = v10;
    goto LABEL_3;
  }
  id v5 = objc_msgSend(v4[4], "runAfterDelaySecondsIfNotYetScheduled:");
LABEL_4:
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

- (void)reset
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__ATXModeHeuristicClassifier_reset__block_invoke;
  v3[3] = &unk_1E6BE7858;
  v3[4] = self;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v3];
}

void __35__ATXModeHeuristicClassifier_reset__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v4;

  [*((id *)v3 + 3) removeAllObjects];
  [*(id *)(a1 + 32) _updateIfNeededWithGuardedData:v3];
  id v6 = (id)*((void *)v3 + 2);
  *((void *)v3 + 2) = 0;
}

- (void)featurizer:(id)a3 didUpdateFeatures:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl(&dword_1DAFF9000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeHeuristicClassifier: %@ updated its features", (uint8_t *)&v11, 0xCu);
  }
  [(ATXModeHeuristicClassifier *)self updateWithFeatureSet:v7];
}

- (ATXModeClassifierClientModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeClassifierClientModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_featurizers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithFeaturizers:(os_log_t)log minUpdateInterval:configuredModeService:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_DEBUG, "ATXModeHeuristicClassifier finished initialization", v1, 2u);
}

- (void)_triggersForMode:(int)a1 fromAggregateFeatures:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_FAULT, "BMUserFocusInferredMode: %lu not handled in switch statement", (uint8_t *)&v2, 0xCu);
}

@end