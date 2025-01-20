@interface PPSpotlightScoring
+ (id)defaultInstance;
- (BOOL)refreshSpotlightScoringCacheWithError:(id *)a3;
- (PPSpotlightScoring)initWithTopicStore:(id)a3;
- (id)spotlightQueryScore:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation PPSpotlightScoring

- (void).cxx_destruct
{
}

- (BOOL)refreshSpotlightScoringCacheWithError:(id *)a3
{
  return [(PPTopicStore *)self->_topicStore computeAndCacheTopicScores:a3];
}

- (id)spotlightQueryScore:(id)a3 error:(id *)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PPTopicStore *)self->_topicStore cachedTopicScores];
  if (!v7)
  {
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42[0] = @"Topic stored did not return scores";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      *a4 = [v17 errorWithDomain:@"PPErrorDomain" code:1 userInfo:v18];
    }
    v13 = pp_universal_search_log_handle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)v35 = 0;
    v19 = "Topic stored did not return scores while computing score for spotlight";
    goto LABEL_21;
  }
  if (!v6)
  {
    v13 = pp_universal_search_log_handle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v16 = 0;
      goto LABEL_17;
    }
    *(_WORD *)v35 = 0;
    v19 = "PPSpotlightScoring: nil spotlightQueryScore for item with nil attributes";
LABEL_21:
    _os_log_error_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_ERROR, v19, v35, 2u);
    goto LABEL_12;
  }
  v8 = [v6 portraitFeatureVector];
  v9 = [v6 portraitFeatureVectorVersion];
  v10 = +[PPSpotlightScoringFeatureVector decodeFeatureVectorFromData:v8 version:v9];

  v11 = [v10 qidStrings];
  unint64_t v12 = [v11 count];

  *(void *)v35 = 0;
  v36 = v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __48__PPSpotlightScoring_spotlightQueryScore_error___block_invoke;
  v26 = &unk_1E550F5C0;
  v29 = &v31;
  v13 = v10;
  v27 = v13;
  v30 = v35;
  id v28 = v7;
  [v28 enumerateKeysAndObjectsUsingBlock:&v23];
  double v14 = sqrt((double)v12) * sqrt(v32[3]);
  if (v14 == 0.0)
  {
    v15 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "PPSpotlightScoring: spotlightQueryScore of 0 due to empty portrait", buf, 2u);
    }

    v16 = &unk_1EDA6ACE0;
  }
  else
  {
    double v20 = *((double *)v36 + 3) / v14;
    v21 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v40 = v20;
      _os_log_debug_impl(&dword_18CAA6000, v21, OS_LOG_TYPE_DEBUG, "PPSpotlightScoring: spotlightQueryScore of %f", buf, 0xCu);
    }

    v16 = objc_msgSend(NSNumber, "numberWithDouble:", v20, v23, v24, v25, v26, v27);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);
LABEL_17:

  return v16;
}

void __48__PPSpotlightScoring_spotlightQueryScore_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  [v5 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  double v9 = v8;

  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v7 * v9;
  v10 = [*(id *)(a1 + 32) qidStrings];
  int v11 = [v10 containsObject:v14];

  if (v11)
  {
    unint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
    [v12 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
  }
}

- (void)dealloc
{
  if (sandbox_extension_release() == -1)
  {
    v3 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18CAA6000, v3, OS_LOG_TYPE_ERROR, "PPSpotlightScoring was unable to release the sandbox extension", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)PPSpotlightScoring;
  [(PPSpotlightScoring *)&v4 dealloc];
}

- (PPSpotlightScoring)initWithTopicStore:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPSpotlightScoring;
  double v6 = [(PPSpotlightScoring *)&v20 init];
  double v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_topicStore, a3);
  topicStore = v7->_topicStore;
  id v19 = 0;
  double v9 = [(PPTopicStore *)topicStore topicCacheSandboxExtensionToken:&v19];
  id v10 = v19;
  if (!v9)
  {
    id v14 = pp_universal_search_log_handle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      double v13 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    id v22 = v10;
    v15 = "PPSpotlightScoring was unable to get the sandbox extension: %@";
    v16 = v14;
    uint32_t v17 = 12;
LABEL_12:
    _os_log_error_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_9;
  }
  id v11 = v9;
  [v11 cStringUsingEncoding:4];
  uint64_t v12 = sandbox_extension_consume();
  if (v12 == -1)
  {
    id v14 = pp_universal_search_log_handle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v15 = "PPSpotlightScoring was unable to consume the sandbox extension";
    v16 = v14;
    uint32_t v17 = 2;
    goto LABEL_12;
  }
  v7->_sandboxExtensionHandle = v12;

LABEL_5:
  double v13 = v7;
LABEL_10:

  return v13;
}

+ (id)defaultInstance
{
  pthread_mutex_lock(&defaultInstance_lock);
  if (!defaultInstance_instance)
  {
    v2 = objc_opt_new();
    if (v2)
    {
      v3 = [[PPSpotlightScoring alloc] initWithTopicStore:v2];
      objc_super v4 = (void *)defaultInstance_instance;
      defaultInstance_instance = (uint64_t)v3;

      if (defaultInstance_instance)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v5 = pp_universal_search_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = 0;
        double v6 = "PPSpotlightScoring defaultInstance did not initialize.";
        double v7 = (uint8_t *)&v10;
LABEL_13:
        _os_log_error_impl(&dword_18CAA6000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      }
    }
    else
    {
      id v5 = pp_universal_search_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        double v6 = "PPTopicStore gave nil, bailing on PPSpotlightScoring initialization.";
        double v7 = buf;
        goto LABEL_13;
      }
    }

    goto LABEL_8;
  }
LABEL_9:
  id v8 = (id)defaultInstance_instance;
  pthread_mutex_unlock(&defaultInstance_lock);
  return v8;
}

@end