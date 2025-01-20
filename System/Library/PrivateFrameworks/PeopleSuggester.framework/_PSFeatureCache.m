@interface _PSFeatureCache
- (BOOL)isCacheEmpty;
- (BOOL)isDurableFeaturesSetAdmissible;
- (_PSFeatureCache)initWithPredictionContext:(id)a3 candidates:(id)a4 caches:(id)a5 store:(id)a6;
- (_PSShareSheetEphemeralFeatureManager)ephemeralFeatureManager;
- (id)addSelfToCandidates:(id)a3;
- (id)computeEphemeralFeaturesWithCandidates:(id)a3 context:(id)a4;
- (id)deviceIdentifier;
- (id)fetchFeaturesWithCandidates:(id)a3 context:(id)a4;
- (id)getFeatureValueForLabeledDataStore:(id)a3;
- (id)getHistogramFeatureData;
- (id)privacyMitigateFeatures:(id)a3;
- (void)dealloc;
- (void)invalidateAndRefreshCache;
- (void)refreshDurableCachesWithCandidates:(id)a3;
- (void)replaceEphemeralFeaturesWithCache:(id)a3;
- (void)saveToVirtualStore;
- (void)setEphemeralFeatureManager:(id)a3;
- (void)setFeatureValueForFeatureName:(int)a3 featureValue:(id)a4 candidate:(id)a5 bundleID:(id)a6;
- (void)setPredictionContextWithContext:(id)a3;
@end

@implementation _PSFeatureCache

- (_PSFeatureCache)initWithPredictionContext:(id)a3 candidates:(id)a4 caches:(id)a5 store:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v45.receiver = self;
  v45.super_class = (Class)_PSFeatureCache;
  v15 = [(_PSFeatureCache *)&v45 init];
  if (v15)
  {
    v50.__sig = 0;
    *(void *)v50.__opaque = 0;
    pthread_mutexattr_init(&v50);
    pthread_mutexattr_settype(&v50, 2);
    pthread_mutex_init((pthread_mutex_t *)(v15 + 56), &v50);
    pthread_mutexattr_destroy(&v50);
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    v16 = (void *)getLCFFeatureStoreClass_softClass;
    uint64_t v49 = getLCFFeatureStoreClass_softClass;
    if (!getLCFFeatureStoreClass_softClass)
    {
      v50.__sig = MEMORY[0x1E4F143A8];
      *(void *)v50.__opaque = 3221225472;
      v51 = __getLCFFeatureStoreClass_block_invoke;
      v52 = &unk_1E5ADE858;
      v53 = &v46;
      __getLCFFeatureStoreClass_block_invoke((uint64_t)&v50);
      v16 = (void *)v47[3];
    }
    v17 = v16;
    _Block_object_dispose(&v46, 8);
    id v18 = [v17 alloc];
    uint64_t v19 = [v18 init:lcfKey url:0 useSqlite:0];
    v20 = (void *)*((void *)v15 + 20);
    *((void *)v15 + 20) = v19;

    v21 = [[_PSShareSheetEphemeralFeatureManager alloc] initWithContext:v11 candidates:v12 caches:v13 store:v14];
    v22 = (void *)*((void *)v15 + 22);
    *((void *)v15 + 22) = v21;

    uint64_t v23 = [v15 addSelfToCandidates:v12];
    v24 = (void *)*((void *)v15 + 2);
    *((void *)v15 + 2) = v23;

    objc_storeStrong((id *)v15 + 5, a5);
    objc_storeStrong((id *)v15 + 1, a3);
    uint64_t v25 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.coreduetd.psfeaturecache.queue" qosClass:17];
    v26 = (void *)*((void *)v15 + 15);
    *((void *)v15 + 15) = v25;

    id v27 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v28 = +[_PSConstants psDefaultsDomain];
    uint64_t v29 = [v27 initWithSuiteName:v28];
    v30 = (void *)*((void *)v15 + 17);
    *((void *)v15 + 17) = v29;

    v31 = BiomeLibrary();
    v32 = [v31 MLSE];
    v33 = [v32 ShareSheet];
    v34 = [v33 VirtualFeatureStore];
    uint64_t v35 = [v34 source];
    v36 = (void *)*((void *)v15 + 21);
    *((void *)v15 + 21) = v35;

    *((void *)v15 + 18) = 3600000000000;
    dispatch_source_t v37 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v15 + 15));
    v38 = (void *)*((void *)v15 + 16);
    *((void *)v15 + 16) = v37;

    *((void *)v15 + 19) = 60000000000;
    v39 = *((void *)v15 + 16);
    dispatch_time_t v40 = dispatch_time(0, 0);
    dispatch_source_set_timer(v39, v40, *((void *)v15 + 18), *((void *)v15 + 19));
    objc_initWeak((id *)&v50, v15);
    v41 = *((void *)v15 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69___PSFeatureCache_initWithPredictionContext_candidates_caches_store___block_invoke;
    handler[3] = &unk_1E5ADFE98;
    objc_copyWeak(&v44, (id *)&v50);
    dispatch_source_set_event_handler(v41, handler);
    dispatch_resume(*((dispatch_object_t *)v15 + 16));
    [v15 invalidateAndRefreshCache];
    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)&v50);
  }

  return (_PSFeatureCache *)v15;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PSFeatureCache;
  [(_PSFeatureCache *)&v3 dealloc];
}

- (id)addSelfToCandidates:(id)a3
{
  objc_super v3 = (void *)[a3 mutableCopy];
  v4 = +[_PSCandidate selfCandidate];
  [v3 addObject:v4];

  return v3;
}

- (void)setPredictionContextWithContext:(id)a3
{
  v4 = (_PSPredictionContext *)a3;
  pthread_mutex_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  pthread_mutex_unlock(&self->_lock);
}

- (id)computeEphemeralFeaturesWithCandidates:(id)a3 context:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(_PSShareSheetEphemeralFeatureManager *)self->_ephemeralFeatureManager setCandidates:v8];
  [(_PSShareSheetEphemeralFeatureManager *)self->_ephemeralFeatureManager setContext:v7];

  cache = self->_cache;
  self->_cache = 0;

  histogramFeatureData = self->_histogramFeatureData;
  self->_histogramFeatureData = 0;

  [(_PSFeatureCache *)self refreshDurableCachesWithCandidates:v8];
  id v11 = [(_PSShareSheetEphemeralFeatureManager *)self->_ephemeralFeatureManager computeFeaturesWithHistogramFeatures:self->_histogramFeatureData];
  pthread_mutex_unlock(p_lock);

  return v11;
}

- (BOOL)isDurableFeaturesSetAdmissible
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CB18]);
  objc_super v3 = [v2 objectForKey:@"beginDurableFeatureComputation"];
  uint64_t v4 = [v2 objectForKey:@"computeDurableFeatures"];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || ([v3 timeIntervalSince1970], double v8 = v7, objc_msgSend(v5, "timeIntervalSince1970"), v8 >= v9))
  {
    BOOL v14 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSince1970];
    double v12 = v11;
    [v3 timeIntervalSince1970];
    BOOL v14 = vabdd_f64(v12, v13) < 432000.0;
  }
  return v14;
}

- (BOOL)isCacheEmpty
{
  id v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LOBYTE(v2) = v2->_cache == 0;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)refreshDurableCachesWithCandidates:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  BOOL v6 = objc_opt_new();
  double v7 = objc_opt_new();
  uint64_t v54 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  v10 = [(_PSFeatureCache *)self addSelfToCandidates:v4];
  objc_storeStrong((id *)&self->_candidates, v10);
  uint64_t v49 = v10;
  double v11 = [v10 allObjects];
  double v12 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_29);

  id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  BOOL v14 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_152);
  v52 = (void *)[v13 initWithObjects:v12 forKeys:v14];

  v15 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Refreshing durable features", buf, 2u);
  }

  v16 = self->_cache;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_153;
  v68[3] = &unk_1E5AE0C30;
  v17 = v16;
  v69 = v17;
  v70 = self;
  v55 = objc_msgSend(v4, "_pas_mappedSetWithTransform:", v68);
  id v18 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFeatureCacheDurableCachesWithCandidates", " enableTelemetry=YES ", buf, 2u);
  }

  id v48 = objc_alloc_init(MEMORY[0x1E4F1CB18]);
  uint64_t v19 = [v48 objectForKey:@"pruneDurableFeatureStoreBeforeDate"];
  v20 = v19;
  v53 = (void *)v9;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  pthread_mutexattr_t v50 = v21;
  v22 = (void *)v8;

  uint64_t v23 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v72 = v55;
    _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: candidates to fetch %{private}@", buf, 0xCu);
  }

  v51 = v17;
  if ([v55 count])
  {
    BiomeLibrary();
    v24 = id v47 = v4;
    uint64_t v25 = [v24 MLSE];
    [v25 ShareSheet];
    v26 = v6;
    v28 = id v27 = v5;
    uint64_t v29 = [v28 DurableFeatureStore];

    v5 = v27;
    BOOL v6 = v26;
    v17 = v51;

    v30 = [v29 publisher];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_157;
    v65[3] = &unk_1E5AE0C58;
    id v66 = v50;
    id v67 = v55;
    v31 = [v30 filterWithIsIncluded:v65];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_3;
    v56[3] = &unk_1E5AE0C80;
    id v57 = v52;
    id v58 = v5;
    v59 = v51;
    id v60 = v6;
    id v61 = v7;
    id v62 = v54;
    id v63 = v22;
    id v64 = v53;
    id v32 = (id)[v31 sinkWithCompletion:&__block_literal_global_162 receiveInput:v56];

    id v4 = v47;
  }
  v33 = [(_PSHistogramFeatureData *)self->_histogramFeatureData cache];

  if (v33)
  {
    v34 = [(_PSHistogramFeatureData *)self->_histogramFeatureData cache];
    [v6 addEntriesFromDictionary:v34];
  }
  uint64_t v35 = [(_PSHistogramFeatureData *)self->_histogramFeatureData bucketSums];

  if (v35)
  {
    v36 = [(_PSHistogramFeatureData *)self->_histogramFeatureData bucketSums];
    [v7 addEntriesFromDictionary:v36];
  }
  dispatch_source_t v37 = [(_PSHistogramFeatureData *)self->_histogramFeatureData bucketHasEver];

  if (v37)
  {
    v38 = [(_PSHistogramFeatureData *)self->_histogramFeatureData bucketHasEver];
    [v54 addEntriesFromDictionary:v38];
  }
  v39 = [(_PSHistogramFeatureData *)self->_histogramFeatureData factorToUniqueBucketNames];

  if (v39)
  {
    dispatch_time_t v40 = [(_PSHistogramFeatureData *)self->_histogramFeatureData factorToUniqueBucketNames];
    [v22 addEntriesFromDictionary:v40];
  }
  v41 = [(_PSHistogramFeatureData *)self->_histogramFeatureData candidateTimeIntervalSums];

  if (v41)
  {
    v42 = [(_PSHistogramFeatureData *)self->_histogramFeatureData candidateTimeIntervalSums];
    [v53 addEntriesFromDictionary:v42];
  }
  v43 = (_PSHistogramFeatureData *)objc_opt_new();
  histogramFeatureData = self->_histogramFeatureData;
  self->_histogramFeatureData = v43;

  [(_PSHistogramFeatureData *)self->_histogramFeatureData setCache:v6];
  [(_PSHistogramFeatureData *)self->_histogramFeatureData setBucketSums:v7];
  [(_PSHistogramFeatureData *)self->_histogramFeatureData setBucketHasEver:v54];
  [(_PSHistogramFeatureData *)self->_histogramFeatureData setFactorToUniqueBucketNames:v22];
  [(_PSHistogramFeatureData *)self->_histogramFeatureData setCandidateTimeIntervalSums:v53];
  if (v17) {
    [(NSMutableDictionary *)v17 addEntriesFromDictionary:v5];
  }
  else {
    objc_storeStrong((id *)&self->_cache, v5);
  }
  objc_super v45 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFeatureCacheDurableCachesWithCandidates", (const char *)&unk_1A3274816, buf, 2u);
  }

  uint64_t v46 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v46, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: finished refreshing durable feature cache", buf, 2u);
  }
}

- (void)invalidateAndRefreshCache
{
  objc_super v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Invalidating and refreshing cache", buf, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  dispatch_suspend((dispatch_object_t)self->_timer);
  cache = self->_cache;
  self->_cache = 0;

  histogramFeatureData = self->_histogramFeatureData;
  self->_histogramFeatureData = 0;

  dispatch_time_t v6 = dispatch_time(0, self->_timeDelay);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v6, 0xFFFFFFFFFFFFFFFFLL, self->_leeway);
  [(_PSFeatureCache *)self refreshDurableCachesWithCandidates:self->_candidates];
  dispatch_resume((dispatch_object_t)self->_timer);
  pthread_mutex_unlock(&self->_lock);
  double v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Finished invalidating and refreshing cache", v8, 2u);
  }
}

- (id)fetchFeaturesWithCandidates:(id)a3 context:(id)a4
{
  id v7 = a4;
  p_lock = &self->_lock;
  id v9 = a3;
  pthread_mutex_lock(&self->_lock);
  objc_storeStrong((id *)&self->_context, a4);
  v10 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetRefreshDurableCachesWithCandidates", " enableTelemetry=YES ", buf, 2u);
  }

  [(_PSFeatureCache *)self refreshDurableCachesWithCandidates:v9];
  double v11 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetRefreshDurableCachesWithCandidates", (const char *)&unk_1A3274816, v18, 2u);
  }

  double v12 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReplaceEphemeralFeaturesWithCache", (const char *)&unk_1A3274816, v17, 2u);
  }

  [(_PSFeatureCache *)self replaceEphemeralFeaturesWithCache:self->_cache];
  id v13 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReplaceEphemeralFeaturesWithCache", (const char *)&unk_1A3274816, v16, 2u);
  }

  BOOL v14 = (void *)[(NSMutableDictionary *)self->_cache copy];
  pthread_mutex_unlock(p_lock);

  return v14;
}

- (void)replaceEphemeralFeaturesWithCache:(id)a3
{
  id v4 = a3;
  v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: replacing ephemeral features", buf, 2u);
  }

  [(_PSShareSheetEphemeralFeatureManager *)self->_ephemeralFeatureManager setCandidates:self->_candidates];
  [(_PSShareSheetEphemeralFeatureManager *)self->_ephemeralFeatureManager setContext:self->_context];
  dispatch_time_t v6 = [(_PSShareSheetEphemeralFeatureManager *)self->_ephemeralFeatureManager computeFeaturesWithHistogramFeatures:self->_histogramFeatureData];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53___PSFeatureCache_replaceEphemeralFeaturesWithCache___block_invoke;
  v9[3] = &unk_1E5AE0708;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v8 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: finished replacing ephemeral features", buf, 2u);
  }
}

- (id)getFeatureValueForLabeledDataStore:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = objc_alloc(MEMORY[0x1E4F4FEC8]);
  dispatch_time_t v6 = v5;
  if (isKindOfClass)
  {
    id v7 = (void *)[v5 initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:0 timeBucketValue:0 doubleValuedVectorValue:v3];
  }
  else
  {
    int v8 = [v3 hasIntValue];
    if (v8)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "intValue"));
    }
    else
    {
      id v9 = 0;
    }
    int v10 = [v3 hasDoubleValue];
    if (v10)
    {
      double v11 = NSNumber;
      [v3 doubleValue];
      double v12 = objc_msgSend(v11, "numberWithDouble:");
    }
    else
    {
      double v12 = 0;
    }
    id v13 = [v3 stringValue];
    int v14 = [v3 hasBoolValue];
    if (v14)
    {
      v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    }
    else
    {
      v15 = 0;
    }
    id v7 = objc_msgSend(v6, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", v9, v12, v13, v15, objc_msgSend(v3, "timeBucketValue"), 0);
    if (v14) {

    }
    if (v10) {
    if (v8)
    }
  }

  return v7;
}

- (void)setFeatureValueForFeatureName:(int)a3 featureValue:(id)a4 candidate:(id)a5 bundleID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    if (!self->_cache)
    {
      int v14 = (NSMutableDictionary *)objc_opt_new();
      cache = self->_cache;
      self->_cache = v14;
    }
    v16 = [[_PSCandidate alloc] initWithDomainId:v11 derivedIntentId:v11 bundleId:v12 recipientsId:0];
    v17 = [(_PSCandidate *)v16 candidateForDeduping];

    id v18 = BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
    if (v18)
    {
      uint64_t v19 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v17];
      v20 = v19;
      if (!v19) {
        uint64_t v19 = (_PSFeatureDictionary *)MEMORY[0x1E4F1CC08];
      }
      id v21 = -[NSDictionary _ps_dictionaryByAddingEntryForObject:withKey:](v19, v10, v18);
      [(NSMutableDictionary *)self->_cache setObject:v21 forKeyedSubscript:v17];
    }
    else
    {
      v22 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[_PSFeatureCache setFeatureValueForFeatureName:featureValue:candidate:bundleID:](a3, v22);
      }
    }
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[_PSFeatureCache setFeatureValueForFeatureName:featureValue:candidate:bundleID:](a3, v17);
    }
  }
}

- (id)deviceIdentifier
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(NSUserDefaults *)self->_psDefaults objectForKey:@"DeviceId"];
  if (v4)
  {
    id v5 = (void *)v4;
    dispatch_time_t v6 = [(NSUserDefaults *)self->_psDefaults objectForKey:@"DeviceIdDate"];
    id v7 = [v3 dateByAddingTimeInterval:-7776000.0];
    if ([v6 compare:v7] == -1)
    {
      int v8 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v9 = [v8 UUIDString];

      [(NSUserDefaults *)self->_psDefaults setObject:v9 forKey:@"DeviceId"];
      [(NSUserDefaults *)self->_psDefaults setObject:v3 forKey:@"DeviceIdDate"];
      id v5 = (void *)v9;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v10 UUIDString];

    [(NSUserDefaults *)self->_psDefaults setObject:v5 forKey:@"DeviceId"];
    [(NSUserDefaults *)self->_psDefaults setObject:v3 forKey:@"DeviceIdDate"];
  }

  return v5;
}

- (id)privacyMitigateFeatures:(id)a3
{
  id v3 = a3;
  if ((os_variant_has_internal_content() & 1) != 0
    || ![v3 timeBucketValue]
    || (objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "timeBucketValue")),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqual:&unk_1EF6757E0],
        v4,
        (v5 & 1) != 0))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F4FEE8]), "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, 0, objc_msgSend(v3, "timeBucketValue"));
  }
  id v7 = v6;

  return v7;
}

- (void)saveToVirtualStore
{
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___PSFeatureCache_saveToVirtualStore__block_invoke;
  v7[3] = &unk_1E5ADE940;
  v7[4] = self;
  id v3 = v7;
  uint64_t v4 = queue;
  char v5 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_1E5AE0D10;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  dispatch_async(v4, block);
}

- (id)getHistogramFeatureData
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v4 = self->_histogramFeatureData;
  pthread_mutex_unlock(p_lock);

  return v4;
}

- (_PSShareSheetEphemeralFeatureManager)ephemeralFeatureManager
{
  return self->_ephemeralFeatureManager;
}

- (void)setEphemeralFeatureManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralFeatureManager, 0);
  objc_storeStrong((id *)&self->_virtualFeatureStreamSource, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
  objc_storeStrong((id *)&self->_psDefaults, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_caches, 0);
  objc_storeStrong((id *)&self->_histogramFeatureData, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_candidates, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setFeatureValueForFeatureName:(int)a1 featureValue:(NSObject *)a2 candidate:bundleID:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "candidate was nil for featureName: %i", (uint8_t *)v2, 8u);
}

- (void)setFeatureValueForFeatureName:(int)a1 featureValue:(NSObject *)a2 candidate:bundleID:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "featureNameAsString was nil for featureName: %i", (uint8_t *)v2, 8u);
}

@end