@interface PowerUIMLRelevantDrainPredictor
- (BOOL)isStartSecondsValue:(double)a3 withinDynamicBinWindowOfLength:(int)a4 aroundCurrentStartSecondValue:(double)a5;
- (BOOL)isStartSoCValue:(double)a3 withinDynamicBinWindowOfLength:(int)a4 aroundCurrentStartSoCValue:(double)a5;
- (MLModel)relevantDrainPredictorModel;
- (NSMutableDictionary)modelCache;
- (NSString)defaultsDomain;
- (OS_os_log)log;
- (PowerUIMLRelevantDrainPredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5;
- (PowerUITrialManager)trialManager;
- (_CDLocalContext)context;
- (double)threshold;
- (id)analyticsEventFromFeatures:(id)a3;
- (id)featuresForChargeSessionAtDate:(id)a3 withChargeStartSoC:(id)a4 withChargeAndDrainSessionHistory:(id)a5;
- (id)loadModelFromBundle:(id)a3;
- (id)predictedRelevantDrainAfterChargeSessionAtDate:(id)a3 withChargeStartSoC:(id)a4;
- (id)predictedRelevantDrainWithFeatures:(id)a3 forSchemes:(id)a4;
- (id)predictedRelevantDrainwithFeatures:(id)a3;
- (id)predictedRelevantDrainwithFeatures:(id)a3 forModel:(id)a4 withThreshold:(id)a5;
- (id)relevantDrainPredictorModelForPhoneFirstStage80Limit;
- (id)relevantDrainPredictorModelForPhoneFirstStage95Limit;
- (id)relevantDrainPredictorModelForPhoneSecondStage80Limit;
- (id)relevantDrainPredictorModelForPhoneSecondStage95Limit;
- (os_unfair_lock_s)loadModelLock;
- (void)addStatisticalSummaryFeaturesintoFeatureDictionary:(id)a3 forDataFrame:(id)a4 withFeatureNameSuffix:(id)a5 whereDimension:(id)a6 isFilteredWithHandler:(id)a7;
- (void)relevantDrainPredictorModel;
- (void)setContext:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setLoadModelLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setModelCache:(id)a3;
- (void)setThreshold:(double)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation PowerUIMLRelevantDrainPredictor

- (PowerUIMLRelevantDrainPredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PowerUIMLRelevantDrainPredictor;
  v10 = [(PowerUIMLRelevantDrainPredictor *)&v20 init];
  if (v10)
  {
    os_log_t v11 = os_log_create("com.apple.powerui.smartcharging", "mlrelevantdrainpredictor");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    objc_storeStrong((id *)&v10->_defaultsDomain, a3);
    objc_storeStrong((id *)&v10->_trialManager, a5);
    uint64_t v13 = [&unk_26D385EB0 allKeys];
    v14 = (void *)kDimensions;
    kDimensions = v13;

    uint64_t v15 = [&unk_26D385ED8 allKeys];
    v16 = (void *)kMeasures;
    kMeasures = v15;

    v10->_loadModelLock._os_unfair_lock_opaque = 0;
    v10->_threshold = 0.192;
    uint64_t v17 = objc_opt_new();
    modelCache = v10->_modelCache;
    v10->_modelCache = (NSMutableDictionary *)v17;
  }
  return v10;
}

- (id)loadModelFromBundle:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_modelCache objectForKey:v4];
  if (!v5)
  {
    v6 = NSURL;
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 pathForResource:v4 ofType:@"mlmodelc"];
    id v9 = [v6 fileURLWithPath:v8];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Loading model from %@", buf, 0xCu);
    }
    id v20 = 0;
    v5 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v9 error:&v20];
    id v11 = v20;
    v12 = self->_log;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUIMLRelevantDrainPredictor loadModelFromBundle:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "model successfully loaded", buf, 2u);
    }
    [(NSMutableDictionary *)self->_modelCache setObject:v5 forKeyedSubscript:v4];
  }
  return v5;
}

- (id)relevantDrainPredictorModelForPhoneFirstStage80Limit
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [(PowerUIMLRelevantDrainPredictor *)self loadModelFromBundle:@"deoc_iphone_80"];
  v5[0] = @"model";
  v5[1] = @"threshold";
  v6[0] = v2;
  v6[1] = &unk_26D385E60;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (id)relevantDrainPredictorModelForPhoneFirstStage95Limit
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [(PowerUIMLRelevantDrainPredictor *)self loadModelFromBundle:@"deoc_iphone_95"];
  v5[0] = @"model";
  v5[1] = @"threshold";
  v6[0] = v2;
  v6[1] = &unk_26D385E70;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (id)relevantDrainPredictorModelForPhoneSecondStage80Limit
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [(PowerUIMLRelevantDrainPredictor *)self loadModelFromBundle:@"deoc_two_stage_sequential_low_second"];
  v5[0] = @"model";
  v5[1] = @"threshold";
  v6[0] = v2;
  v6[1] = &unk_26D385E80;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (id)relevantDrainPredictorModelForPhoneSecondStage95Limit
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [(PowerUIMLRelevantDrainPredictor *)self loadModelFromBundle:@"deoc_two_stage_sequential_high_second"];
  v5[0] = @"model";
  v5[1] = @"threshold";
  v6[0] = v2;
  v6[1] = &unk_26D385E90;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (MLModel)relevantDrainPredictorModel
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_relevantDrainPredictorModel)
  {
    id v4 = [(PowerUITrialManager *)self->_trialManager factorForName:@"phoneDEoCModel"];
    v5 = [(PowerUITrialManager *)self->_trialManager factorForName:@"thresholdForPhoneDEoCModel"];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v4;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Attempting to load model from Trial at path %@", buf, 0xCu);
    }
    trialManager = self->_trialManager;
    id v8 = [v4 fileValue];
    id v9 = [v8 path];
    v10 = [(PowerUITrialManager *)trialManager loadModelFromPath:v9 deleteExistingFiles:1];

    id v11 = self->_log;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Trial DEoC model loading successful", buf, 2u);
      }
      v12 = v10;
      relevantDrainPredictorModel = self->_relevantDrainPredictorModel;
      self->_relevantDrainPredictorModel = v12;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(PowerUIMLRelevantDrainPredictor *)v11 relevantDrainPredictorModel];
      }
      v21 = NSURL;
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v23 = [v22 pathForResource:@"deoc_model_iphone" ofType:@"mlmodelc"];
      v24 = [v21 fileURLWithPath:v23];

      id v48 = 0;
      v25 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v24 error:&v48];
      relevantDrainPredictorModel = (MLModel *)v48;
      v26 = self->_relevantDrainPredictorModel;
      self->_relevantDrainPredictorModel = v25;

      v27 = self->_log;
      if (relevantDrainPredictorModel)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          [(PowerUIMLRelevantDrainPredictor *)(uint64_t)relevantDrainPredictorModel relevantDrainPredictorModel];
        }
      }
      else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v27, OS_LOG_TYPE_DEFAULT, "DEoC model loaded from local file path", buf, 2u);
      }
    }
    [v5 doubleValue];
    if (v34 != 0.0)
    {
      double v35 = v34;
      v36 = self->_log;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = NSNumber;
        v38 = v36;
        v39 = [v37 numberWithDouble:v35];
        *(_DWORD *)buf = 138412290;
        v50 = v39;
        _os_log_impl(&dword_22135E000, v38, OS_LOG_TYPE_DEFAULT, "Loaded threshold from Trial: %@", buf, 0xCu);
      }
      self->_double threshold = v35;
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = self->_relevantDrainPredictorModel;
    v42 = v40;
    v43 = [(MLModel *)v41 modelDescription];
    v44 = [v43 metadata];
    double threshold = self->_threshold;
    *(_DWORD *)buf = 138412546;
    v50 = v44;
    __int16 v51 = 2048;
    double v52 = threshold;
    _os_log_impl(&dword_22135E000, v42, OS_LOG_TYPE_DEFAULT, "Model loaded with metadata %@ \n and threshold %f", buf, 0x16u);
  }
  v46 = self->_relevantDrainPredictorModel;
  return v46;
}

- (id)featuresForChargeSessionAtDate:(id)a3 withChargeStartSoC:(id)a4 withChargeAndDrainSessionHistory:(id)a5
{
  uint64_t v162 = *MEMORY[0x263EF8340];
  id v86 = a3;
  id v83 = a4;
  id v8 = a5;
  v90 = objc_opt_new();
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v150 objects:v161 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v151;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v151 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = (void *)[*(id *)(*((void *)&v150 + 1) + 8 * i) mutableCopy];
        [v90 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v150 objects:v161 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v90 count] >= 3)
  {
    long long v149 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v146 = 0u;
    id v92 = v90;
    uint64_t v13 = [v92 countByEnumeratingWithState:&v146 objects:v160 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v147;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v147 != v14) {
            objc_enumerationMutation(v92);
          }
          uint64_t v16 = *(void **)(*((void *)&v146 + 1) + 8 * j);
          uint64_t v17 = [v16 objectForKeyedSubscript:@"start"];
          uint64_t v18 = +[PowerUIPredictorHelper convertDateToSeconds:v17];
          [v16 setObject:v18 forKeyedSubscript:@"charge_start_secs"];
        }
        uint64_t v13 = [v92 countByEnumeratingWithState:&v146 objects:v160 count:16];
      }
      while (v13);
    }

    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v19 = (id)kMeasures;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v142 objects:v159 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v143;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v143 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v142 + 1) + 8 * k);
          v24 = [&unk_26D385F00 objectForKeyedSubscript:v23];
          +[PowerUIPredictorHelper quantizeValuesInDataFrame:v92 forColumn:v23 withBinWidth:v24];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v142 objects:v159 count:16];
      }
      while (v20);
    }

    id v94 = (id)objc_opt_new();
    v25 = +[PowerUIPredictorHelper convertDateToSeconds:v86];
    [v25 doubleValue];
    double v27 = v26;

    uint64_t v28 = [&unk_26D385F28 objectForKeyedSubscript:@"charge_start_secs"];
    uint64_t v29 = [v28 integerValue];

    int v93 = (int)v27;
    uint64_t v30 = (int)v27 / v29;
    uint64_t v31 = [NSNumber numberWithInt:v30];
    [v94 setObject:v31 forKeyedSubscript:@"curr_charge_start_secs_bin"];

    [v83 doubleValue];
    double v33 = v32;
    double v34 = [&unk_26D385F50 objectForKeyedSubscript:@"charge_start_soc"];
    uint64_t v35 = [v34 integerValue];

    uint64_t v87 = (int)v33 / v35;
    v36 = objc_msgSend(NSNumber, "numberWithInt:");
    [v94 setObject:v36 forKeyedSubscript:@"curr_charge_start_soc_bin"];

    uint64_t v138 = 0;
    v139 = &v138;
    uint64_t v140 = 0x2020000000;
    uint64_t v141 = 0;
    uint64_t v134 = 0;
    v135 = &v134;
    uint64_t v136 = 0x2020000000;
    uint64_t v137 = 0;
    v37 = [&unk_26D385F78 objectForKeyedSubscript:@"charge_start_secs"];
    uint64_t v38 = [v37 integerValue];
    uint64_t v39 = (int)v30;
    v139[3] = v38 * (int)v30;

    v40 = [&unk_26D385FA0 objectForKeyedSubscript:@"charge_start_secs"];
    uint64_t v41 = [v40 integerValue];
    v135[3] = v39 + v39 * v41;

    v133[0] = MEMORY[0x263EF8330];
    v133[1] = 3221225472;
    v133[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke;
    v133[3] = &unk_2645A66C0;
    v133[4] = &v138;
    v133[5] = &v134;
    [(PowerUIMLRelevantDrainPredictor *)self addStatisticalSummaryFeaturesintoFeatureDictionary:v94 forDataFrame:v92 withFeatureNameSuffix:@"static_bin" whereDimension:@"charge_start_secs" isFilteredWithHandler:v133];
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    uint64_t v42 = 0;
    uint64_t v43 = [&unk_26D385AB0 countByEnumeratingWithState:&v129 objects:v158 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v130;
      do
      {
        uint64_t v45 = 0;
        v46 = (void *)v42;
        do
        {
          if (*(void *)v130 != v44) {
            objc_enumerationMutation(&unk_26D385AB0);
          }
          uint64_t v47 = *(void *)(*((void *)&v129 + 1) + 8 * v45);
          v127[0] = MEMORY[0x263EF8330];
          v127[1] = 3221225472;
          v127[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_2;
          v127[3] = &unk_2645A66E8;
          v127[4] = self;
          v127[5] = v47;
          int v128 = v93;
          uint64_t v42 = MEMORY[0x223C80C20](v127);

          id v48 = [NSString stringWithFormat:@"dynamic_bin_%@", v47];
          [(PowerUIMLRelevantDrainPredictor *)self addStatisticalSummaryFeaturesintoFeatureDictionary:v94 forDataFrame:v92 withFeatureNameSuffix:v48 whereDimension:@"charge_start_secs" isFilteredWithHandler:v42];

          ++v45;
          v46 = (void *)v42;
        }
        while (v43 != v45);
        uint64_t v43 = [&unk_26D385AB0 countByEnumeratingWithState:&v129 objects:v158 count:16];
      }
      while (v43);
    }
    v91 = (void *)v42;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    uint64_t v126 = 0;
    uint64_t v119 = 0;
    v120 = &v119;
    uint64_t v121 = 0x2020000000;
    uint64_t v122 = 0;
    v49 = [&unk_26D385FC8 objectForKeyedSubscript:@"charge_start_soc"];
    uint64_t v50 = [v49 integerValue];
    v124[3] = v50 * (int)v87;

    __int16 v51 = [&unk_26D385FF0 objectForKeyedSubscript:@"charge_start_soc"];
    uint64_t v52 = [v51 integerValue];
    v120[3] = (int)v87 + (int)v87 * v52;

    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_3;
    v118[3] = &unk_2645A66C0;
    v118[4] = &v123;
    v118[5] = &v119;
    [(PowerUIMLRelevantDrainPredictor *)self addStatisticalSummaryFeaturesintoFeatureDictionary:v94 forDataFrame:v92 withFeatureNameSuffix:@"static_bin" whereDimension:@"charge_start_soc" isFilteredWithHandler:v118];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    uint64_t v53 = [&unk_26D385AB0 countByEnumeratingWithState:&v114 objects:v157 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v115;
      do
      {
        uint64_t v55 = 0;
        v56 = v91;
        do
        {
          if (*(void *)v115 != v54) {
            objc_enumerationMutation(&unk_26D385AB0);
          }
          uint64_t v57 = *(void *)(*((void *)&v114 + 1) + 8 * v55);
          v112[0] = MEMORY[0x263EF8330];
          v112[1] = 3221225472;
          v112[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_4;
          v112[3] = &unk_2645A66E8;
          v112[4] = self;
          v112[5] = v57;
          int v113 = (int)v33;
          v91 = (void *)MEMORY[0x223C80C20](v112);

          v58 = [NSString stringWithFormat:@"dynamic_bin_%@", v57];
          [(PowerUIMLRelevantDrainPredictor *)self addStatisticalSummaryFeaturesintoFeatureDictionary:v94 forDataFrame:v92 withFeatureNameSuffix:v58 whereDimension:@"charge_start_soc" isFilteredWithHandler:v91];

          ++v55;
          v56 = v91;
        }
        while (v53 != v55);
        uint64_t v53 = [&unk_26D385AB0 countByEnumeratingWithState:&v114 objects:v157 count:16];
      }
      while (v53);
    }
    for (uint64_t m = 1; m != 4; ++m)
    {
      v60 = objc_msgSend(v92, "objectAtIndex:", objc_msgSend(v92, "count") - m);
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v61 = (id)kMeasures;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v108 objects:v156 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v109;
        do
        {
          for (uint64_t n = 0; n != v62; ++n)
          {
            if (*(void *)v109 != v63) {
              objc_enumerationMutation(v61);
            }
            uint64_t v65 = *(void *)(*((void *)&v108 + 1) + 8 * n);
            v66 = [NSString stringWithFormat:@"prev_%d_%@", m, v65];
            v67 = [v60 objectForKeyedSubscript:v65];
            [v94 setObject:v67 forKeyedSubscript:v66];
          }
          uint64_t v62 = [v61 countByEnumeratingWithState:&v108 objects:v156 count:16];
        }
        while (v62);
      }
    }
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v68 = [&unk_26D385AC8 countByEnumeratingWithState:&v104 objects:v155 count:16];
    id v69 = v92;
    if (v68)
    {
      v70 = 0;
      uint64_t v84 = *(void *)v105;
      uint64_t v85 = v68;
      do
      {
        for (iuint64_t i = 0; ii != v85; ++ii)
        {
          if (*(void *)v105 != v84) {
            objc_enumerationMutation(&unk_26D385AC8);
          }
          uint64_t v71 = [*(id *)(*((void *)&v104 + 1) + 8 * ii) integerValue];
          v101[0] = MEMORY[0x263EF8330];
          v101[1] = 3221225472;
          v101[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_5;
          v101[3] = &unk_2645A6710;
          id v102 = v86;
          uint64_t v103 = v71;
          v72 = +[PowerUIPredictorHelper filterDataFrame:v69 forColumn:@"start" withFilterHandler:v101];
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          uint64_t v73 = [&unk_26D385AE0 countByEnumeratingWithState:&v97 objects:v154 count:16];
          if (v73)
          {
            uint64_t v74 = *(void *)v98;
            do
            {
              for (juint64_t j = 0; jj != v73; ++jj)
              {
                if (*(void *)v98 != v74) {
                  objc_enumerationMutation(&unk_26D385AE0);
                }
                uint64_t v76 = [*(id *)(*((void *)&v97 + 1) + 8 * jj) integerValue];
                v96[0] = MEMORY[0x263EF8330];
                v96[1] = 3221225472;
                v96[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_6;
                v96[3] = &__block_descriptor_40_e8_B16__0_8l;
                v96[4] = v76;
                v77 = +[PowerUIPredictorHelper filterDataFrame:v72 forColumn:@"drain_depth" withFilterHandler:v96];
                v78 = objc_msgSend(NSString, "stringWithFormat:", @"n_drain_below_%lu_%lddays", v76, v71);

                v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "count"));
                [v94 setObject:v79 forKeyedSubscript:v78];

                v95[0] = MEMORY[0x263EF8330];
                v95[1] = 3221225472;
                v95[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_7;
                v95[3] = &__block_descriptor_40_e8_B16__0_8l;
                v95[4] = v76;
                v80 = +[PowerUIPredictorHelper filterDataFrame:v72 forColumn:@"drain_depth" withFilterHandler:v95];
                v70 = objc_msgSend(NSString, "stringWithFormat:", @"n_drain_above_%lu_%lddays", v76, v71);

                v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v80, "count"));
                [v94 setObject:v81 forKeyedSubscript:v70];
              }
              uint64_t v73 = [&unk_26D385AE0 countByEnumeratingWithState:&v97 objects:v154 count:16];
            }
            while (v73);
          }

          id v69 = v92;
        }
        uint64_t v85 = [&unk_26D385AC8 countByEnumeratingWithState:&v104 objects:v155 count:16];
      }
      while (v85);
    }
    else
    {
      v70 = 0;
    }

    _Block_object_dispose(&v119, 8);
    _Block_object_dispose(&v123, 8);

    _Block_object_dispose(&v134, 8);
    _Block_object_dispose(&v138, 8);
  }
  else
  {
    id v94 = (id)MEMORY[0x263EFFA78];
  }

  return v94;
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (double)(int)[a2 intValue];
  return v3 >= (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
      && v3 < (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  [a2 doubleValue];
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) integerValue];
  double v7 = (double)*(int *)(a1 + 48);
  return [v3 isStartSecondsValue:v6 withinDynamicBinWindowOfLength:v5 aroundCurrentStartSecondValue:v7];
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return v3 >= (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
      && v3 < (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_4(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  [a2 doubleValue];
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) integerValue];
  double v7 = (double)*(int *)(a1 + 48);
  return [v3 isStartSoCValue:v6 withinDynamicBinWindowOfLength:v5 aroundCurrentStartSoCValue:v7];
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_5(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  return -v3 <= (double)(86400 * *(void *)(a1 + 40));
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 integerValue] < *(void *)(a1 + 32);
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 integerValue] >= *(void *)(a1 + 32);
}

- (BOOL)isStartSecondsValue:(double)a3 withinDynamicBinWindowOfLength:(int)a4 aroundCurrentStartSecondValue:(double)a5
{
  uint64_t v7 = a4;
  id v8 = [&unk_26D386018 objectForKeyedSubscript:@"charge_start_secs"];
  int v9 = (int)(a5 - (double)([v8 integerValue] * v7));

  uint64_t v10 = [&unk_26D386040 objectForKeyedSubscript:@"charge_start_secs"];
  int v11 = (int)((double)([v10 integerValue] * v7) + a5);

  if (v9 < 0)
  {
    BOOL v15 = a3 >= 0.0;
    if ((double)v11 <= a3) {
      BOOL v15 = 0;
    }
    return (double)(int)(v9 + 86400 * (-v9 / 0x15180u)) <= a3 || v15;
  }
  else
  {
    double v12 = (double)v9;
    if (v11 <= 86400)
    {
      return (double)v11 > a3 && v12 <= a3;
    }
    else
    {
      BOOL v13 = a3 < 86400.0;
      if (v12 > a3) {
        BOOL v13 = 0;
      }
      return (double)(v11 % 0x15180u) > a3 || v13;
    }
  }
}

- (BOOL)isStartSoCValue:(double)a3 withinDynamicBinWindowOfLength:(int)a4 aroundCurrentStartSoCValue:(double)a5
{
  uint64_t v7 = a4;
  id v8 = [&unk_26D386068 objectForKeyedSubscript:@"charge_start_soc"];
  int v9 = (int)(a5 - (double)([v8 integerValue] * v7));

  uint64_t v10 = [&unk_26D386090 objectForKeyedSubscript:@"charge_start_soc"];
  int v11 = (int)((double)([v10 integerValue] * v7) + a5);

  if (v11 >= 100) {
    int v12 = 100;
  }
  else {
    int v12 = v11;
  }
  return (double)v12 > a3 && (double)(v9 & ~(v9 >> 31)) <= a3;
}

- (void)addStatisticalSummaryFeaturesintoFeatureDictionary:(id)a3 forDataFrame:(id)a4 withFeatureNameSuffix:(id)a5 whereDimension:(id)a6 isFilteredWithHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v33 = a5;
  id v11 = a6;
  int v12 = +[PowerUIPredictorHelper filterDataFrame:a4 forColumn:v11 withFilterHandler:a7];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)kMeasures;
  uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v31)
  {
    BOOL v13 = 0;
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * v14);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v16 = [&unk_26D385A98 countByEnumeratingWithState:&v35 objects:v43 count:16];
        uint64_t v32 = v14;
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v36;
          do
          {
            uint64_t v19 = 0;
            uint64_t v20 = v13;
            do
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(&unk_26D385A98);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * v19) doubleValue];
              double v22 = v21;
              BOOL v13 = [NSString stringWithFormat:@"%@_p_%d_%d%d_at_%@_curr_%@", v15, (int)v21, ((int)(v21 * 10.0) % 10), ((int)(v21 * 100.0) % 10), v11, v33];

              uint64_t v23 = +[PowerUIPredictorHelper percentile:v15 forColumn:v12 inDataFrame:v22];
              [v34 setObject:v23 forKeyedSubscript:v13];

              ++v19;
              uint64_t v20 = v13;
            }
            while (v17 != v19);
            uint64_t v17 = [&unk_26D385A98 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v17);
        }
        v24 = [NSString stringWithFormat:@"%@_count_at_%@_curr_%@", v15, v11, v33];

        v25 = +[PowerUIPredictorHelper countForColumn:v15 inDataFrame:v12];
        [v34 setObject:v25 forKeyedSubscript:v24];

        double v26 = [NSString stringWithFormat:@"%@_mean_at_%@_curr_%@", v15, v11, v33];

        double v27 = +[PowerUIPredictorHelper meanForColumn:v15 inDataFrame:v12];
        [v34 setObject:v27 forKeyedSubscript:v26];

        BOOL v13 = [NSString stringWithFormat:@"%@_var_at_%@_curr_%@", v15, v11, v33];

        uint64_t v28 = +[PowerUIPredictorHelper varianceForColumn:v15 inDataFrame:v12];
        [v34 setObject:v28 forKeyedSubscript:v13];

        uint64_t v14 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v31);
  }
}

- (id)predictedRelevantDrainAfterChargeSessionAtDate:(id)a3 withChargeStartSoC:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:v7 withMinimumDuration:0.0];
  int v9 = [(PowerUIMLRelevantDrainPredictor *)self featuresForChargeSessionAtDate:v7 withChargeStartSoC:v6 withChargeAndDrainSessionHistory:v8];

  uint64_t v10 = [(PowerUIMLRelevantDrainPredictor *)self predictedRelevantDrainwithFeatures:v9];

  return v10;
}

- (id)predictedRelevantDrainWithFeatures:(id)a3 forSchemes:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v52 = [MEMORY[0x263EFF9A0] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v7;
  uint64_t v53 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v53)
  {
    uint64_t v51 = *(void *)v55;
    id v47 = v6;
    v49 = self;
LABEL_3:
    uint64_t v8 = 0;
    while (2)
    {
      if (*(void *)v55 != v51) {
        objc_enumerationMutation(obj);
      }
      int v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
      uint64_t v10 = objc_opt_new();
      switch([v9 integerValue])
      {
        case 1:
          id v11 = [(PowerUIMLRelevantDrainPredictor *)self relevantDrainPredictorModelForPhoneFirstStage80Limit];
          int v12 = [v11 objectForKeyedSubscript:@"model"];
          [v11 objectForKeyedSubscript:@"threshold"];
          v14 = BOOL v13 = self;
          id v15 = [(PowerUIMLRelevantDrainPredictor *)v13 predictedRelevantDrainwithFeatures:v6 forModel:v12 withThreshold:v14];

          uint64_t v16 = v15;
          uint64_t v17 = 80;
          goto LABEL_9;
        case 2:
          id v11 = [(PowerUIMLRelevantDrainPredictor *)self relevantDrainPredictorModelForPhoneFirstStage95Limit];
          uint64_t v18 = [v11 objectForKeyedSubscript:@"model"];
          [v11 objectForKeyedSubscript:@"threshold"];
          v19 = BOOL v13 = self;
          id v15 = [(PowerUIMLRelevantDrainPredictor *)v13 predictedRelevantDrainwithFeatures:v6 forModel:v18 withThreshold:v19];

          uint64_t v16 = v15;
          uint64_t v17 = 95;
LABEL_9:
          objc_msgSend(v16, "setSuggestedLimitForSignificantDrain:", v17, v47);
          goto LABEL_20;
        case 3:
          uint64_t v20 = [(PowerUIMLRelevantDrainPredictor *)self relevantDrainPredictorModelForPhoneFirstStage80Limit];
          double v21 = [v20 objectForKeyedSubscript:@"model"];
          id v11 = v20;
          double v22 = [v20 objectForKeyedSubscript:@"threshold"];
          [(PowerUIMLRelevantDrainPredictor *)self predictedRelevantDrainwithFeatures:v6 forModel:v21 withThreshold:v22];
          v24 = uint64_t v23 = self;

          [v24 setSuggestedLimitForSignificantDrain:80];
          if ([v24 significantDrainAhead])
          {
            v25 = [(PowerUIMLRelevantDrainPredictor *)v23 relevantDrainPredictorModelForPhoneSecondStage95Limit];
            double v26 = [v25 objectForKeyedSubscript:@"model"];
            double v27 = [v25 objectForKeyedSubscript:@"threshold"];
            id v15 = [(PowerUIMLRelevantDrainPredictor *)v23 predictedRelevantDrainwithFeatures:v47 forModel:v26 withThreshold:v27];

            id v6 = v47;
            [v15 setSuggestedLimitForSignificantDrain:95];
            [v15 setPrevStageResult:v24];

            uint64_t v10 = v25;
          }
          else
          {
            id v15 = v24;
          }

          BOOL v13 = v49;
          goto LABEL_20;
        case 4:
          uint64_t v28 = [(PowerUIMLRelevantDrainPredictor *)self relevantDrainPredictorModelForPhoneFirstStage95Limit];
          uint64_t v29 = [v28 objectForKeyedSubscript:@"model"];
          id v48 = v28;
          uint64_t v30 = [v28 objectForKeyedSubscript:@"threshold"];
          id v31 = v6;
          [(PowerUIMLRelevantDrainPredictor *)self predictedRelevantDrainwithFeatures:v6 forModel:v29 withThreshold:v30];
          v33 = uint64_t v32 = self;

          [v33 setSuggestedLimitForSignificantDrain:95];
          if ([v33 significantDrainAhead])
          {
            id v15 = v33;
            id v6 = v31;
          }
          else
          {
            [(PowerUIMLRelevantDrainPredictor *)v32 relevantDrainPredictorModelForPhoneSecondStage80Limit];
            v35 = id v34 = v31;
            long long v36 = [v35 objectForKeyedSubscript:@"model"];
            long long v37 = [v35 objectForKeyedSubscript:@"threshold"];
            long long v38 = [(PowerUIMLRelevantDrainPredictor *)v32 predictedRelevantDrainwithFeatures:v34 forModel:v36 withThreshold:v37];

            [v38 setSuggestedLimitForSignificantDrain:80];
            char v39 = [v38 significantDrainAhead];
            long long v40 = v33;
            if ((v39 & 1) == 0)
            {
              [v38 setPrevStageResult:v33];
              long long v40 = v38;
            }
            id v15 = v40;

            uint64_t v10 = v35;
            id v6 = v47;
          }

          BOOL v13 = v49;
          id v11 = v48;
LABEL_20:

          objc_msgSend(v15, "setScheme:", objc_msgSend(v9, "integerValue"));
          log = v13->_log;
          self = v13;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            long long v42 = log;
            uint64_t v43 = [v15 predictionSchemeString];
            *(_DWORD *)buf = 138412290;
            v59 = v43;
            _os_log_impl(&dword_22135E000, v42, OS_LOG_TYPE_DEFAULT, "Predicted for scheme: %@", buf, 0xCu);
          }
          uint64_t v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue", v47));
          [v52 setObject:v15 forKeyedSubscript:v44];

          if (v53 != ++v8) {
            continue;
          }
          uint64_t v53 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
          if (!v53) {
            goto LABEL_28;
          }
          goto LABEL_3;
        default:
          uint64_t v45 = self->_log;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainWithFeatures:forSchemes:](v45);
          }

          goto LABEL_28;
      }
    }
  }
LABEL_28:

  return v52;
}

- (id)predictedRelevantDrainwithFeatures:(id)a3
{
  double v3 = [(PowerUIMLRelevantDrainPredictor *)self predictedRelevantDrainWithFeatures:a3 forSchemes:&unk_26D385AF8];
  double v4 = [v3 allValues];
  double v5 = [v4 firstObject];

  return v5;
}

- (id)predictedRelevantDrainwithFeatures:(id)a3 forModel:(id)a4 withThreshold:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  [v10 doubleValue];
  objc_msgSend(v11, "setThreshold:");
  if (v8)
  {
    int v12 = [v8 allKeys];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v8 error:0];
      id v28 = 0;
      id v15 = [v9 predictionFromFeatures:v14 error:&v28];
      id v16 = v28;
      if (v16)
      {
        uint64_t v17 = v16;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v17;
          _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Error in prediction %@", buf, 0xCu);
        }
        uint64_t v19 = v15;
      }
      else
      {
        uint64_t v20 = [v15 featureValueForName:@"classProbability"];
        uint64_t v19 = [v20 dictionaryValue];

        double v21 = [v19 objectForKeyedSubscript:&unk_26D3853F0];
        [v21 doubleValue];
        double v23 = v22;

        [v11 setConfidence:v23];
        [v10 doubleValue];
        objc_msgSend(v11, "setThreshold:");
        [v11 confidence];
        double v25 = v24;
        [v11 threshold];
        [v11 setSignificantDrainAhead:v25 >= v26];
        uint64_t v17 = v15;
      }
    }
  }

  return v11;
}

- (id)analyticsEventFromFeatures:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v20 = a3;
  double v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v18 = [&unk_26D385AC8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  double v4 = 0;
  double v5 = 0;
  if (v18)
  {
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(&unk_26D385AC8);
        }
        uint64_t v19 = v6;
        double v22 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v23 = [&unk_26D385AE0 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v23)
        {
          uint64_t v21 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(&unk_26D385AE0);
              }
              id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v9 = [v22 integerValue];
              uint64_t v10 = [v8 integerValue];
              id v11 = objc_msgSend(NSString, "stringWithFormat:", @"n_drain_below_%lu_%lddays", v10, v9);

              int v12 = objc_msgSend(NSString, "stringWithFormat:", @"ndays_below_%lu_%lddays", v10, v9);

              uint64_t v13 = [v20 objectForKeyedSubscript:v11];
              [v3 setObject:v13 forKeyedSubscript:v12];

              double v5 = objc_msgSend(NSString, "stringWithFormat:", @"n_drain_above_%lu_%lddays", v10, v9);

              double v4 = objc_msgSend(NSString, "stringWithFormat:", @"ndays_above_%lu_%lddays", v10, v9);

              uint64_t v14 = [v20 objectForKeyedSubscript:v5];
              [v3 setObject:v14 forKeyedSubscript:v4];
            }
            uint64_t v23 = [&unk_26D385AE0 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v23);
        }
        uint64_t v6 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [&unk_26D385AC8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v18);
  }
  id v15 = v3;

  return v15;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_double threshold = a3;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLocuint64_t k = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)modelCache
{
  return self->_modelCache;
}

- (void)setModelCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_relevantDrainPredictorModel, 0);
}

- (void)loadModelFromBundle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)relevantDrainPredictorModel
{
}

- (void)predictedRelevantDrainWithFeatures:(os_log_t)log forSchemes:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Invalid scheme", v1, 2u);
}

@end