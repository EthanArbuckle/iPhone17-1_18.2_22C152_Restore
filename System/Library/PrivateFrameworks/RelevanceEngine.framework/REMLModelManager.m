@interface REMLModelManager
- (BOOL)_loadModelAtPath:(id)a3 mlFeatures:(id)a4 checkModelVersion:(BOOL)a5;
- (BOOL)_saveModelToDisk:(id *)a3;
- (BOOL)supportsContentRanking;
- (NSArray)orderedFeatures;
- (REContentRanker)contentRanker;
- (REMLModel)model;
- (REMLModelManager)initWithRelevanceEngine:(id)a3;
- (id)_createOrderFeatureListFromModelFileURL:(id)a3 mlFeatures:(id)a4;
- (id)_orderedModelFeatures;
- (id)comparatorWithRules:(id)a3;
- (id)createOutputFeatureFromDouble:(double)a3 error:(id *)a4;
- (id)predicitionForLogicalElement:(id)a3;
- (id)sentimentAnalyzer;
- (unint64_t)modelVersionNumber;
- (void)_logMetrics;
- (void)_notifyObserversThatModelUpdated;
- (void)_saveDataStoresToURL:(id)a3;
- (void)addDataStore:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)flushTraining;
- (void)manuallySaveModel;
- (void)performModelClearWithCompletion:(id)a3;
- (void)performTrainingWithFeatureMaps:(id)a3 content:(id)a4 events:(id)a5 interactions:(id)a6 purgeCaches:(BOOL)a7 completion:(id)a8;
- (void)removeDataStore:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation REMLModelManager

- (id)_createOrderFeatureListFromModelFileURL:(id)a3 mlFeatures:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v71 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v14 = [v13 name];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v8 mutableCopy];
  v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v17 = [v5 URLByAppendingPathComponent:@"features.dat"];
  v18 = [MEMORY[0x263F08850] defaultManager];
  v19 = [v17 path];
  int v20 = [v18 fileExistsAtPath:v19];

  v54 = v15;
  if (v20)
  {
    id v69 = 0;
    v21 = [NSString stringWithContentsOfURL:v17 encoding:4 error:&v69];
    id v52 = v69;
    if (v21)
    {
      v49 = v17;
      id v50 = v8;
      id v51 = v5;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      unint64_t v22 = 0x263F08000uLL;
      v23 = [MEMORY[0x263F08708] newlineCharacterSet];
      v48 = v21;
      v24 = [v21 componentsSeparatedByCharactersInSet:v23];

      obuint64_t j = v24;
      uint64_t v57 = [v24 countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (!v57) {
        goto LABEL_34;
      }
      uint64_t v56 = *(void *)v66;
      v53 = v16;
      while (1)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v66 != v56) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v65 + 1) + 8 * v25);
          v27 = [*(id *)(v22 + 1800) whitespaceCharacterSet];
          v28 = [v26 stringByTrimmingCharactersInSet:v27];

          if ([v28 length])
          {
            v29 = [v7 objectForKeyedSubscript:v28];
            if (v29)
            {
              v30 = v29;
              if ([v29 featureType] == 2)
              {
                v31 = RELogForDomain(0);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v76 = v30;
                  _os_log_impl(&dword_21E6E6000, v31, OS_LOG_TYPE_DEFAULT, "Skipping loading exisiting feature %@ since it isn't a categorcial feature", buf, 0xCu);
                }

                goto LABEL_31;
              }
            }
            else if ([v26 hasPrefix:@"<Removed Feature>"])
            {
              v30 = +[REFeature featureWithName:v26 featureType:1];
            }
            else
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke;
              block[3] = &unk_2644BC660;
              block[4] = v26;
              if (_createOrderFeatureListFromModelFileURL_mlFeatures__onceToken != -1) {
                dispatch_once(&_createOrderFeatureListFromModelFileURL_mlFeatures__onceToken, block);
              }
              v62[0] = MEMORY[0x263EF8330];
              v62[1] = 3221225472;
              v62[2] = __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_53;
              v62[3] = &unk_2644BE030;
              id v63 = v16;
              v32 = (uint64_t (**)(void, void))MEMORY[0x223C31700](v62);
              uint64_t v33 = 1;
              v34 = &stru_26CFA57D0;
              do
              {
                v35 = v34;
                v34 = [@"<Removed Feature>" stringByAppendingString:v26];

                if (v33 >= 2)
                {
                  uint64_t v36 = [(__CFString *)v34 stringByAppendingFormat:@"%d", v33];

                  v34 = (__CFString *)v36;
                }
                uint64_t v33 = (v33 + 1);
              }
              while ((((uint64_t (**)(void, __CFString *))v32)[2](v32, v34) & 1) != 0);
              v30 = +[REFeature featureWithName:v34 featureType:1];

              v16 = v53;
              v15 = v54;
              unint64_t v22 = 0x263F08000;
            }
            [v16 addObject:v30];
            [v15 removeFeature:v30];
LABEL_31:
          }
          ++v25;
        }
        while (v25 != v57);
        uint64_t v57 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (!v57)
        {
LABEL_34:
          v37 = v16;

          goto LABEL_36;
        }
      }
    }
    v47 = RELogForDomain(4);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[REMLModelManager _createOrderFeatureListFromModelFileURL:mlFeatures:]();
    }

    v45 = 0;
  }
  else
  {
    v49 = v17;
    id v50 = v8;
    v37 = v16;
    id v51 = v5;
    id v52 = 0;
LABEL_36:
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v38 = v15;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v74 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v59 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          if ([v43 featureType] == 2)
          {
            v44 = RELogForDomain(0);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v76 = v43;
              _os_log_impl(&dword_21E6E6000, v44, OS_LOG_TYPE_DEFAULT, "Skipping creating remaining feature %@ since it isn't a categorcial feature", buf, 0xCu);
            }
          }
          else
          {
            [v37 addObject:v43];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v58 objects:v74 count:16];
      }
      while (v40);
    }

    v16 = v37;
    v45 = (void *)[v37 copy];
    id v8 = v50;
    id v5 = v51;
    v17 = v49;
    v15 = v54;
  }

  return v45;
}

- (BOOL)_loadModelAtPath:(id)a3 mlFeatures:(id)a4 checkModelVersion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a3)
  {
    id v84 = v8;
    uint64_t v9 = [NSURL fileURLWithPath:a3];
    uint64_t v10 = [v9 URLByAppendingPathComponent:@"model"];

    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [v10 path];
    int v13 = [v11 fileExistsAtPath:v12];

    v14 = [v10 URLByAppendingPathComponent:@"version"];
    id v91 = 0;
    v15 = [NSString stringWithContentsOfURL:v14 encoding:4 error:&v91];
    id v82 = v91;
    if (v13) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v17 = v16 || !v5;
    v80 = v14;
    if (v17)
    {
      if (!v15 && v5)
      {
        v18 = [v14 absoluteString];
        unsigned __int8 v92 = 0;
        v19 = [MEMORY[0x263F08850] defaultManager];
        int v20 = [v19 fileExistsAtPath:v18 isDirectory:&v92];

        int v21 = v92;
        BOOL v22 = 0;
        v15 = 0;
        if (!v20 || v21) {
          goto LABEL_26;
        }
        v23 = RELogForDomain(4);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:].cold.4();
        }

        v15 = 0;
LABEL_22:
        BOOL v22 = 0;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v25 = v10;
      v26 = [MEMORY[0x263F08708] newlineCharacterSet];
      v27 = [v15 componentsSeparatedByCharactersInSet:v26];
      v28 = [v27 firstObject];

      v15 = [v28 stringByReplacingOccurrencesOfString:@"Version: " withString:&stru_26CFA57D0];

      uint64_t v29 = [v15 longLongValue];
      if (v29 != self->_modelVersionNumber)
      {
        uint64_t v32 = v29;
        uint64_t v33 = RELogForDomain(4);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:]((uint64_t *)&self->_modelVersionNumber, v32, v33);
        }

        BOOL v22 = 0;
        uint64_t v10 = v25;
LABEL_26:
        v81 = v10;
        v34 = [v10 URLByAppendingPathComponent:@"model"];
        v35 = [REMLLinearModel alloc];
        if (self->_orderedFeatures) {
          orderedFeatures = self->_orderedFeatures;
        }
        else {
          orderedFeatures = (NSArray *)MEMORY[0x263EFFA68];
        }
        v37 = +[REFeatureSet featureSetWithFeatures:orderedFeatures];
        id v38 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
        uint64_t v39 = [v38 configuration];
        uint64_t v40 = [v39 interactionDescriptors];
        uint64_t v41 = [(REMLLinearModel *)v35 initWithFeatureSet:v37 interactionDescriptors:v40];
        model = self->_model;
        self->_model = v41;

        uint64_t v79 = v15;
        v83 = v34;
        if (v22)
        {
          v43 = [v34 path];
          int v44 = [(REMLLinearModel *)self->_model requiresDirectory];
          unsigned __int8 v92 = 0;
          v45 = (void *)MEMORY[0x263F08850];
          id v46 = v43;
          v47 = [v45 defaultManager];
          int v48 = [v47 fileExistsAtPath:v46 isDirectory:&v92];

          int v49 = v92;
          BOOL v24 = 1;
          if (v48 && v49 == v44)
          {
            id v50 = self->_model;
            id v90 = v82;
            BOOL v51 = [(REMLModel *)v50 loadModelFromURL:v34 error:&v90];
            id v52 = v90;

            id v77 = v52;
            if (!v51)
            {
              v53 = RELogForDomain(4);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:]();
              }

              BOOL v24 = 0;
            }
LABEL_38:
            self->_supportsContentRanking = 0;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            v54 = +[REContentRelevanceProviderManager _features];
            uint64_t v55 = [v54 countByEnumeratingWithState:&v86 objects:v93 count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              uint64_t v57 = *(void *)v87;
              while (2)
              {
                for (uint64_t i = 0; i != v56; ++i)
                {
                  if (*(void *)v87 != v57) {
                    objc_enumerationMutation(v54);
                  }
                  uint64_t v59 = *(void *)(*((void *)&v86 + 1) + 8 * i);
                  long long v60 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
                  long long v61 = [v60 rootFeatures];
                  LODWORD(v59) = [v61 containsFeature:v59];

                  if (v59)
                  {
                    self->_supportsContentRanking = 1;
                    goto LABEL_48;
                  }
                }
                uint64_t v56 = [v54 countByEnumeratingWithState:&v86 objects:v93 count:16];
                if (v56) {
                  continue;
                }
                break;
              }
            }
LABEL_48:

            if (self->_supportsContentRanking)
            {
              v62 = objc_alloc_init(REContentRanker);
              contentRanker = self->_contentRanker;
              self->_contentRanker = v62;

              v64 = v81;
              long long v65 = v78;
              if (v24)
              {
                long long v66 = [v81 path];
                long long v67 = [v66 stringByAppendingPathComponent:@"content.ctx"];

                long long v68 = [MEMORY[0x263F08850] defaultManager];
                int v69 = [v68 fileExistsAtPath:v67];

                if (v69)
                {
                  long long v70 = self->_contentRanker;
                  id v85 = v78;
                  BOOL v71 = [(REContentRanker *)v70 load:v67 error:&v85];
                  id v72 = v85;

                  if (!v71)
                  {
                    long long v73 = RELogForDomain(4);
                    v74 = v80;
                    v75 = v83;
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                      -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:]();
                    }

                    goto LABEL_59;
                  }
                }
                else
                {
                  id v72 = v78;
                }
                v74 = v80;
                v75 = v83;
LABEL_59:

                long long v65 = v72;
                goto LABEL_60;
              }
              v74 = v80;
              v75 = v83;
            }
            else
            {
              v74 = v80;
              v64 = v81;
              v75 = v83;
              long long v65 = v78;
            }
LABEL_60:

            id v8 = v84;
            goto LABEL_61;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
        id v77 = v82;
        goto LABEL_38;
      }
      uint64_t v10 = v25;
    }
    if (v13)
    {
      v30 = [(REMLModelManager *)self _createOrderFeatureListFromModelFileURL:v10 mlFeatures:v84];
      v31 = self->_orderedFeatures;
      self->_orderedFeatures = v30;

      BOOL v22 = self->_orderedFeatures != 0;
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  LOBYTE(v24) = 0;
LABEL_61:

  return v24;
}

- (REMLModelManager)initWithRelevanceEngine:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)REMLModelManager;
  BOOL v5 = [(RERelevanceEngineSubsystem *)&v83 initWithRelevanceEngine:v4];
  if (v5)
  {
    id v6 = [v4 configuration];
    v7 = [v6 modelFileURL];
    uint64_t v8 = [v7 path];
    modelFileLocation = v5->_modelFileLocation;
    v5->_modelFileLocation = (NSString *)v8;

    uint64_t v10 = [v4 configuration];
    v5->_modelStorageBehavior = [v10 modelStorageBehavior];

    uint64_t v11 = [v4 configuration];
    uint64_t v12 = [v11 metricsRecorder];
    metricsRecoder = v5->_metricsRecoder;
    v5->_metricsRecoder = (RERelevanceEngineMetricsRecorder *)v12;

    v14 = objc_alloc_init(REObserverStore);
    observers = v5->_observers;
    v5->_observers = v14;

    BOOL v16 = [v4 configuration];
    v5->_modelVersionNumber = ([v16 modelVersion] << 8) + 195936478;

    BOOL v17 = objc_alloc_init(REObserverStore);
    dataStores = v5->_dataStores;
    v5->_dataStores = v17;

    v74 = [v4 mlFeatures];
    uint64_t v19 = [MEMORY[0x263EFF910] date];
    lastCacheResetDate = v5->_lastCacheResetDate;
    v5->_lastCacheResetDate = (NSDate *)v19;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    int v21 = [v4 configuration];
    BOOL v22 = [v21 interactionDescriptors];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v80;
      float v26 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v80 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * i) weight];
          float v26 = v26 + v28;
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v24);
    }
    else
    {
      float v26 = 0.0;
    }

    if (fabsf(v26) < 0.00000011921) {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Interaction descriptors must have weights which sum to a non-zero value or you're going to have a bad time.", v29, v30, v31, v32, v33, v34, v72);
    }
    v35 = v74;
    unint64_t v36 = 0x267D40000;
    unint64_t v37 = 0x267D40000;
    if ([(REMLModelManager *)v5 _loadModelAtPath:v5->_modelFileLocation mlFeatures:v74 checkModelVersion:1])
    {
      v5->_validModel = 1;
    }
    else
    {
      id v38 = RELogForDomain(4);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E6E6000, v38, OS_LOG_TYPE_DEFAULT, "Falling back to base model", buf, 2u);
      }

      uint64_t v39 = [v4 configuration];
      uint64_t v40 = [v39 baseModelFileURL];
      uint64_t v41 = [v40 path];
      BOOL v42 = [(REMLModelManager *)v5 _loadModelAtPath:v41 mlFeatures:v74 checkModelVersion:0];

      unint64_t v37 = 0x267D40000;
      unint64_t v36 = 0x267D40000;
      if (!v42)
      {
        id v73 = v4;
        v43 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v74, "count"));
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v44 = v74;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v76 != v47) {
                objc_enumerationMutation(v44);
              }
              int v49 = *(void **)(*((void *)&v75 + 1) + 8 * j);
              if ([v49 featureType] == 2)
              {
                id v50 = RELogForDomain(0);
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v85 = v49;
                  _os_log_impl(&dword_21E6E6000, v50, OS_LOG_TYPE_DEFAULT, "Skipping loading ml feature %@ from provided configuration since it isn't a categorcial feature", buf, 0xCu);
                }
              }
              else
              {
                [v43 addObject:v49];
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v75 objects:v86 count:16];
          }
          while (v46);
        }

        uint64_t v51 = [v43 copy];
        orderedFeatures = v5->_orderedFeatures;
        v5->_orderedFeatures = (NSArray *)v51;

        v53 = [REMLLinearModel alloc];
        v54 = +[REFeatureSet featureSetWithFeatures:v5->_orderedFeatures];
        uint64_t v55 = [(RERelevanceEngineSubsystem *)v5 relevanceEngine];
        uint64_t v56 = [v55 configuration];
        uint64_t v57 = [v56 interactionDescriptors];
        uint64_t v58 = [(REMLLinearModel *)v53 initWithFeatureSet:v54 interactionDescriptors:v57];
        unint64_t v36 = 0x267D40000uLL;
        model = v5->_model;
        v5->_model = (REMLLinearModel *)v58;

        unint64_t v37 = 0x267D40000uLL;
        id v4 = v73;
        v35 = v74;
      }
    }
    [*(id *)((char *)&v5->super.super.isa + *(int *)(v36 + 3772)) setMetricsRecorder:v5->_metricsRecoder];
    long long v60 = objc_alloc_init(REMLMetricsSet);
    metrics = v5->_metrics;
    v5->_metrics = v60;

    v62 = v5->_metrics;
    id v63 = [[REMLEntropyMetric alloc] initWithName:@"entropy" featureName:@"ModelPrediction"];
    [(REMLMetricsSet *)v62 addMetrics:v63];

    uint64_t v64 = *(int *)(v37 + 3768);
    if (!*(Class *)((char *)&v5->super.super.isa + v64))
    {
      *(Class *)((char *)&v5->super.super.isa + v64) = (Class)MEMORY[0x263EFFA68];
    }
    long long v65 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v66 = dispatch_queue_attr_make_with_qos_class(v65, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v67 = dispatch_queue_create("com.apple.RelevanceEngine.REMLModelManager", v66);
    trainingQueue = v5->_trainingQueue;
    v5->_trainingQueue = (OS_dispatch_queue *)v67;

    int v69 = [v4 logger];
    [v69 addLoggable:v5];

    long long v70 = [MEMORY[0x263F08A00] defaultCenter];
    [v70 addObserver:v5 selector:sel__logMetrics name:@"REDidCollectMetrics" object:0];
  }
  return v5;
}

- (id)comparatorWithRules:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 array];
  v7 = [MEMORY[0x263EFF980] array];
  REExtractRules(v5, v6, v7);

  uint64_t v8 = +[REMLElementComparator comparatorWithFilteringRules:v6 rankingRules:v7 model:self->_model];

  return v8;
}

- (void)addDataStore:(id)a3
{
  id v4 = a3;
  [(REObserverStore *)self->_dataStores addObserver:v4];
  if (self->_validModel)
  {
    id v5 = [v4 dataStoreKey];
    id v6 = [(NSString *)self->_modelFileLocation stringByAppendingPathComponent:@"DataStores"];
    v7 = [v6 stringByAppendingPathComponent:v5];

    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    int v9 = [v8 fileExistsAtPath:v7];

    if (v9)
    {
      uint64_t v10 = [NSURL fileURLWithPath:v7];
      uint64_t v11 = 0;
      [v4 modelManager:self loadDataStoreFromURL:v10 error:&v11];
    }
  }
}

- (id)_orderedModelFeatures
{
  return self->_orderedFeatures;
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  id v4 = [v3 logger];
  [v4 removeLoggable:self];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)REMLModelManager;
  [(RERelevanceEngineSubsystem *)&v6 dealloc];
}

- (void)_logMetrics
{
  trainingQueue = self->_trainingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__REMLModelManager__logMetrics__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(trainingQueue, block);
}

uint64_t __31__REMLModelManager__logMetrics__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) logCoreAnalyticsMetrics];
}

- (void)removeDataStore:(id)a3
{
}

- (void)_saveDataStoresToURL:(id)a3
{
  id v4 = [NSURL fileURLWithPath:self->_modelFileLocation];
  id v5 = [v4 URLByAppendingPathComponent:@"DataStores"];

  dataStores = self->_dataStores;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__REMLModelManager__saveDataStoresToURL___block_invoke;
  v8[3] = &unk_2644BE008;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  [(REObserverStore *)dataStores enumerateObserversWithBlock:v8];
}

void __41__REMLModelManager__saveDataStoresToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dataStoreKey];
  id v5 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v4];
  objc_super v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 path];
  [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = 0;
  [v3 modelManager:v8 saveDataStoreToURL:v5 error:&v9];
}

void __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke(uint64_t a1)
{
  v2 = RELogForDomain(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        char v9 = [v8 isEqualToString:v3];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)removeObserver:(id)a3
{
}

- (id)createOutputFeatureFromDouble:(double)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = objc_alloc(MEMORY[0x263F00D38]);
  long long v11 = @"ModelPrediction";
  uint64_t v7 = [MEMORY[0x263F00D50] featureValueWithDouble:a3];
  v12[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v9 = (void *)[v6 initWithDictionary:v8 error:a4];

  return v9;
}

- (BOOL)_saveModelToDisk:(id *)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  modelFileLocation = self->_modelFileLocation;
  if (modelFileLocation)
  {
    id v6 = [(NSString *)modelFileLocation stringByAppendingPathComponent:@"model"];
    uint64_t v7 = [v6 lastPathComponent];
    uint64_t v8 = [@"." stringByAppendingString:v7];

    char v9 = v6;
    uint64_t v10 = [v6 stringByDeletingLastPathComponent];
    uint64_t v11 = [v10 stringByAppendingPathComponent:v8];

    id v91 = (void *)v11;
    long long v12 = [NSURL fileURLWithPath:v11];
    long long v13 = self->_modelFileLocation;
    char v106 = 0;
    long long v14 = (void *)MEMORY[0x263F08850];
    v15 = v13;
    uint64_t v16 = [v14 defaultManager];
    int v17 = [v16 fileExistsAtPath:v15 isDirectory:&v106];

    if (v17) {
      BOOL v18 = v106 == 0;
    }
    else {
      BOOL v18 = 0;
    }
    if (v18)
    {
      int v21 = [MEMORY[0x263F08850] defaultManager];
      BOOL v22 = self->_modelFileLocation;
      id v105 = 0;
      char v23 = [v21 removeItemAtPath:v22 error:&v105];
      id v24 = v105;

      if ((v23 & 1) == 0)
      {
        uint64_t v64 = RELogForDomain(4);
        uint64_t v25 = v12;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _saveModelToDisk:].cold.9();
        }

        uint64_t v29 = v9;
        goto LABEL_35;
      }
      uint64_t v19 = v24;
    }
    else
    {
      uint64_t v19 = 0;
    }
    uint64_t v25 = v12;
    unint64_t v26 = 0x263F08000uLL;
    v27 = [MEMORY[0x263F08850] defaultManager];
    float v28 = [v12 path];
    uint64_t v29 = v9;
    if ([v27 fileExistsAtPath:v28])
    {
      long long v89 = v8;
      uint64_t v30 = a3;
      uint64_t v31 = [MEMORY[0x263F08850] defaultManager];
      id v104 = v19;
      char v32 = [v31 removeItemAtURL:v25 error:&v104];
      id v24 = v104;

      if ((v32 & 1) == 0)
      {
        long long v66 = RELogForDomain(4);
        long long v65 = v91;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _saveModelToDisk:].cold.8();
        }

        uint64_t v8 = v89;
        if (v30)
        {
          id v24 = v24;
          BOOL v20 = 0;
          id *v30 = v24;
        }
        else
        {
          BOOL v20 = 0;
        }
        uint64_t v29 = v9;
        goto LABEL_80;
      }
      uint64_t v19 = v24;
      a3 = v30;
      uint64_t v29 = v9;
      uint64_t v8 = v89;
      unint64_t v26 = 0x263F08000;
    }
    else
    {
    }
    uint64_t v33 = [*(id *)(v26 + 2128) defaultManager];
    id v103 = v19;
    char v34 = [v33 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&v103];
    id v24 = v103;

    if (v34)
    {
      v35 = v29;
      id v90 = v8;
      unint64_t v36 = NSString;
      unint64_t modelVersionNumber = self->_modelVersionNumber;
      uint64_t v38 = REBuildVersion();
      uint64_t v39 = [v36 stringWithFormat:@"Version: %llu\nSystem: %@\n", modelVersionNumber, v38];

      uint64_t v40 = [v25 URLByAppendingPathComponent:@"version"];
      id v102 = v24;
      long long v87 = v39;
      LOBYTE(v38) = [v39 writeToURL:v40 atomically:1 encoding:4 error:&v102];
      id v41 = v102;

      if ((v38 & 1) == 0)
      {
        dispatch_queue_t v67 = RELogForDomain(4);
        uint64_t v55 = v90;
        uint64_t v29 = v35;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _saveModelToDisk:].cold.6();
        }

        long long v65 = v91;
        if (a3)
        {
          id v41 = v41;
          BOOL v20 = 0;
          *a3 = v41;
        }
        else
        {
          BOOL v20 = 0;
        }
        goto LABEL_79;
      }
      long long v86 = a3;
      uint64_t v88 = v35;
      BOOL v42 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 15 * -[NSArray count](self->_orderedFeatures, "count"));
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      v43 = self->_orderedFeatures;
      uint64_t v44 = [(NSArray *)v43 countByEnumeratingWithState:&v98 objects:v107 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v99;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v99 != v46) {
              objc_enumerationMutation(v43);
            }
            int v48 = [*(id *)(*((void *)&v98 + 1) + 8 * i) name];
            [v42 appendString:v48];

            [v42 appendString:@"\n"];
          }
          uint64_t v45 = [(NSArray *)v43 countByEnumeratingWithState:&v98 objects:v107 count:16];
        }
        while (v45);
      }

      int v49 = [v25 URLByAppendingPathComponent:@"features.dat"];
      id v97 = v41;
      char v50 = [v42 writeToURL:v49 atomically:1 encoding:4 error:&v97];
      id v51 = v97;

      if ((v50 & 1) == 0)
      {
        long long v68 = RELogForDomain(4);
        uint64_t v55 = v90;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _saveModelToDisk:].cold.5();
        }

        if (v86)
        {
          id v51 = v51;
          BOOL v20 = 0;
          *long long v86 = v51;
        }
        else
        {
          BOOL v20 = 0;
        }
        uint64_t v29 = v88;
        goto LABEL_78;
      }
      model = self->_model;
      v53 = [v25 URLByAppendingPathComponent:@"model"];
      id v96 = v51;
      LOBYTE(model) = [(REMLModel *)model saveModelToURL:v53 error:&v96];
      id v54 = v96;

      uint64_t v29 = v88;
      uint64_t v55 = v90;
      if ((model & 1) == 0)
      {
        int v69 = RELogForDomain(4);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          -[REMLModelManager _saveModelToDisk:].cold.4();
        }

        if (v86)
        {
          id v51 = v54;
          BOOL v20 = 0;
          *long long v86 = v51;
        }
        else
        {
          BOOL v20 = 0;
          id v51 = v54;
        }
        goto LABEL_78;
      }
      [(REMLModelManager *)self _saveDataStoresToURL:v25];
      if (self->_supportsContentRanking)
      {
        uint64_t v56 = [v25 path];
        uint64_t v57 = [v56 stringByAppendingPathComponent:@"content.ctx"];

        uint64_t v58 = [MEMORY[0x263F08850] defaultManager];
        id v95 = v54;
        int v59 = [v58 createDirectoryAtPath:v57 withIntermediateDirectories:1 attributes:0 error:&v95];
        id v60 = v95;

        if (v59)
        {
          contentRanker = self->_contentRanker;
          id v94 = v60;
          BOOL v62 = [(REContentRanker *)contentRanker save:v57 error:&v94];
          id v51 = v94;

          if (v62)
          {

LABEL_60:
            long long v70 = v51;
            BOOL v71 = [MEMORY[0x263F08850] defaultManager];
            uint64_t v72 = [NSURL fileURLWithPath:v88];
            id v93 = v51;
            char v73 = [v71 replaceItemAtURL:v72 withItemAtURL:v25 backupItemName:0 options:0 resultingItemURL:0 error:&v93];
            id v51 = v93;

            if (v73)
            {
              v74 = [MEMORY[0x263F08850] defaultManager];
              long long v75 = [v25 path];
              uint64_t v55 = v90;
              if (([v74 fileExistsAtPath:v75] & 1) == 0)
              {

                BOOL v20 = 1;
                uint64_t v29 = v88;
                goto LABEL_78;
              }
              long long v76 = [MEMORY[0x263F08850] defaultManager];
              id v92 = v51;
              char v77 = [v76 removeItemAtURL:v25 error:&v92];
              id v78 = v92;

              uint64_t v29 = v88;
              if (v77)
              {
                BOOL v20 = 1;
LABEL_88:
                id v51 = v78;
                goto LABEL_78;
              }
              id v85 = RELogForDomain(4);
              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                -[REMLModelManager _saveModelToDisk:]();
              }

              long long v81 = v86;
              if (!v86)
              {
                BOOL v20 = 0;
                goto LABEL_88;
              }
              long long v82 = v78;
              goto LABEL_70;
            }
            long long v80 = RELogForDomain(4);
            uint64_t v55 = v90;
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
              -[REMLModelManager _saveModelToDisk:]();
            }

            uint64_t v29 = v88;
            long long v81 = v86;
            if (v86)
            {
              long long v82 = v51;
LABEL_70:
              id v51 = v82;
              BOOL v20 = 0;
              id *v81 = v51;
LABEL_78:

              id v41 = v51;
              long long v65 = v91;
LABEL_79:

              id v24 = v41;
              uint64_t v8 = v55;
LABEL_80:

              return v20;
            }
LABEL_77:
            BOOL v20 = 0;
            goto LABEL_78;
          }
          objc_super v83 = RELogForDomain(4);
          long long v79 = v86;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
            -[REMLModelManager _saveModelToDisk:]();
          }
        }
        else
        {
          id v51 = v60;
          long long v79 = v86;
        }
        if (v79) {
          *long long v79 = v51;
        }

        goto LABEL_77;
      }
      id v51 = v54;
      goto LABEL_60;
    }
    id v63 = RELogForDomain(4);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      -[REMLModelManager _saveModelToDisk:].cold.7();
    }

LABEL_35:
    long long v65 = v91;
    if (a3)
    {
      id v24 = v24;
      BOOL v20 = 0;
      *a3 = v24;
    }
    else
    {
      BOOL v20 = 0;
    }
    goto LABEL_80;
  }
  return 1;
}

- (void)flushTraining
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_trainingQueue);
  trainingQueue = self->_trainingQueue;
  dispatch_sync(trainingQueue, &__block_literal_global_73_0);
}

- (void)performTrainingWithFeatureMaps:(id)a3 content:(id)a4 events:(id)a5 interactions:(id)a6 purgeCaches:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 count])
  {
    trainingQueue = self->_trainingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke;
    block[3] = &unk_2644BE058;
    BOOL v27 = a7;
    id v21 = v14;
    id v22 = v16;
    char v23 = self;
    id v24 = v17;
    id v25 = v15;
    id v26 = v18;
    dispatch_async(trainingQueue, block);
  }
}

void __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke(uint64_t a1)
{
  *(void *)&v35[5] = *MEMORY[0x263EF8340];
  int v28 = *(unsigned __int8 *)(a1 + 80);
  id v2 = 0;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndex:v3];
      uint64_t v5 = [*(id *)(a1 + 40) objectAtIndex:v3];
      id v6 = [*(id *)(*(void *)(a1 + 48) + 40) predictWithFeatures:v4];
      [v6 probability];
      float v8 = v7;

      char v9 = *(void **)(a1 + 48);
      id v31 = v2;
      uint64_t v10 = [v9 createOutputFeatureFromDouble:&v31 error:v8];
      id v11 = v31;

      long long v12 = *(void **)(a1 + 48);
      [v5 doubleValue];
      id v30 = v11;
      long long v13 = objc_msgSend(v12, "createOutputFeatureFromDouble:error:", &v30);
      id v2 = v30;

      [*(id *)(*(void *)(a1 + 48) + 56) updateMetricsFromFeatures:v4 prediction:v10 truth:v13];
      id v14 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v3];
      [*(id *)(*(void *)(a1 + 48) + 40) trainWithFeatures:v4 positiveEvent:v5 interaction:v14];
      id v15 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v3];
      id v16 = v15;
      if (*(unsigned char *)(*(void *)(a1 + 48) + 88) && [v15 count]) {
        objc_msgSend(*(id *)(*(void *)(a1 + 48) + 48), "train:isPositive:", v16, objc_msgSend(v5, "BOOLValue"));
      }
      id v17 = RELogForDomain(4);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_2(v34, v5, (__CFString **)v35, v17);
      }

      ++v3;
    }
    while (v3 < [*(id *)(a1 + 32) count]);
  }
  id v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 48) + 128)];
  if (v19 > 1200.0 || (BOOL v20 = v28 != 0, v28))
  {
    [*(id *)(*(void *)(a1 + 48) + 40) _clearCache];
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 128), v18);
    BOOL v20 = 1;
  }
  id v21 = *(void **)(a1 + 48);
  if (v21[13])
  {
    id v22 = v2;
  }
  else
  {
    id v29 = v2;
    int v23 = [v21 _saveModelToDisk:&v29];
    id v22 = v29;

    if (v23)
    {
      id v24 = RELogForDomain(4);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_1(v24);
      }
    }
  }
  id v25 = RELogForDomain(4);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = v26;
    _os_log_impl(&dword_21E6E6000, v25, OS_LOG_TYPE_DEFAULT, "Finished training model with events count %lu", buf, 0xCu);
  }

  if (v20) {
    [*(id *)(a1 + 48) _notifyObserversThatModelUpdated];
  }
  uint64_t v27 = *(void *)(a1 + 72);
  if (v27) {
    (*(void (**)(void))(v27 + 16))();
  }
}

- (void)_notifyObserversThatModelUpdated
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 72);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke_2;
  v4[3] = &unk_2644BE080;
  v4[4] = v1;
  return [v2 enumerateObserversWithBlock:v4];
}

uint64_t __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 modelManagerDidUpdateModel:*(void *)(a1 + 32)];
}

- (void)manuallySaveModel
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_trainingQueue);
  trainingQueue = self->_trainingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__REMLModelManager_manuallySaveModel__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_sync(trainingQueue, block);
}

void __37__REMLModelManager_manuallySaveModel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v6 = 0;
  int v2 = [v1 _saveModelToDisk:&v6];
  id v3 = v6;
  id v4 = RELogForDomain(4);
  uint64_t v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[REMLModelManager _saveModelToDisk:].cold.4();
  }
}

- (void)performModelClearWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RERelevanceEngineSubsystem *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__REMLModelManager_performModelClearWithCompletion___block_invoke;
  v7[3] = &unk_2644BC5E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__REMLModelManager_performModelClearWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(NSObject **)(v1 + 64);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__REMLModelManager_performModelClearWithCompletion___block_invoke_2;
  v3[3] = &unk_2644BC5E8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __52__REMLModelManager_performModelClearWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) clearModel];
  int v2 = objc_alloc_init(REContentRanker);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  id v8 = 0;
  [v5 _saveModelToDisk:&v8];
  id v6 = v8;
  [*(id *)(a1 + 32) _notifyObserversThatModelUpdated];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (id)sentimentAnalyzer
{
  if (self->_supportsContentRanking) {
    int v2 = [[REMLSentimentAnalyzer alloc] initWithContentRanker:self->_contentRanker];
  }
  else {
    int v2 = 0;
  }
  return v2;
}

- (id)predicitionForLogicalElement:(id)a3
{
  model = self->_model;
  id v4 = [a3 featureMap];
  uint64_t v5 = [(REMLModel *)model predictWithFeatures:v4];

  return v5;
}

- (unint64_t)modelVersionNumber
{
  return self->_modelVersionNumber;
}

- (REMLModel)model
{
  return (REMLModel *)self->_model;
}

- (REContentRanker)contentRanker
{
  return self->_contentRanker;
}

- (BOOL)supportsContentRanking
{
  return self->_supportsContentRanking;
}

- (NSArray)orderedFeatures
{
  return self->_orderedFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheResetDate, 0);
  objc_storeStrong((id *)&self->_metricsRecoder, 0);
  objc_storeStrong((id *)&self->_dataStores, 0);
  objc_storeStrong((id *)&self->_orderedFeatures, 0);
  objc_storeStrong((id *)&self->_modelFileLocation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_trainingQueue, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_contentRanker, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)_loadModelAtPath:mlFeatures:checkModelVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to read content model: %@", v2, v3, v4, v5, v6);
}

- (void)_loadModelAtPath:mlFeatures:checkModelVersion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to read model: %@", v2, v3, v4, v5, v6);
}

- (void)_loadModelAtPath:(uint64_t *)a1 mlFeatures:(uint64_t)a2 checkModelVersion:(os_log_t)log .cold.3(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Incompatible model version: %llu. Expecting %llu", (uint8_t *)&v4, 0x16u);
}

- (void)_loadModelAtPath:mlFeatures:checkModelVersion:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to read version: %@", v2, v3, v4, v5, v6);
}

- (void)_createOrderFeatureListFromModelFileURL:mlFeatures:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to read features file: %@", v2, v3, v4, v5, v6);
}

void __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_saveModelToDisk:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to remove temp file after completion: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to replace file: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to save content model: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to save model: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to save features: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to store version: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to create temp directory: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.8()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to remove temp file: %@", v2, v3, v4, v5, v6);
}

- (void)_saveModelToDisk:.cold.9()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to old file model: %@", v2, v3, v4, v5, v6);
}

void __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21E6E6000, log, OS_LOG_TYPE_DEBUG, "Finished training model", v1, 2u);
}

void __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_2(uint8_t *a1, void *a2, __CFString **a3, NSObject *a4)
{
  int v7 = [a2 BOOLValue];
  uint64_t v8 = @"negative";
  if (v7) {
    uint64_t v8 = @"positive";
  }
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_21E6E6000, a4, OS_LOG_TYPE_DEBUG, "Training with event: %@", a1, 0xCu);
}

@end