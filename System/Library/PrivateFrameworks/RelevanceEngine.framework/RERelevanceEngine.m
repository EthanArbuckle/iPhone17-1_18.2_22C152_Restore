@interface RERelevanceEngine
+ (void)prewarmWithConfiguration:(id)a3;
- (BOOL)automaticallyResumeEngine;
- (BOOL)isRunning;
- (BOOL)isSectionWithNameHistoric:(id)a3;
- (BOOL)wantsImmutableContent;
- (NSArray)historicSectionDescriptors;
- (NSArray)sectionDescriptors;
- (NSArray)subsystems;
- (NSDictionary)inflectionFeatureValues;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_queue)subsystemQueue;
- (REDataSourceCatalog)dataSourceCatalog;
- (REDataSourceManager)dataSourceManager;
- (REEngineLocationManager)locationManager;
- (REFeatureSet)mlFeatures;
- (REFeatureSet)rootFeatures;
- (REFeatureTransmuter)featureTransmuter;
- (RELiveElementCoordinator)coordinator;
- (REMLModelManager)modelManager;
- (RERelevanceEngine)initWithConfiguration:(id)a3;
- (RERelevanceEngine)initWithName:(id)a3 configuration:(id)a4;
- (RERelevanceEngineConfiguration)configuration;
- (RERelevanceEngineLogger)logger;
- (RERelevanceEnginePreferences)effectivePreferences;
- (RETrainingManager)trainingManager;
- (_REEngineDefaults)defaults;
- (id)dictionaryFromElement:(id)a3;
- (id)elementAtPath:(id)a3;
- (id)elementFromDictionary:(id)a3;
- (id)elementRankerForSection:(id)a3;
- (id)featureProviderForElement:(id)a3;
- (id)featureProviderForElementAtPath:(id)a3;
- (id)historicSectionForSection:(id)a3;
- (id)newInputFeatureMap;
- (id)newOutputFeatureMap;
- (id)pathForElement:(id)a3;
- (id)predictionForElement:(id)a3;
- (id)predictionForElementAtPath:(id)a3;
- (id)sectionForHistoricSection:(id)a3;
- (unint64_t)numberOfElementsInSection:(id)a3;
- (void)_addSubsystem:(id)a3;
- (void)_callbackQueue_notifyLoadingState;
- (void)_captureAndStoreDiagnosticLogs:(id)a3;
- (void)_notifyResumeCompleted;
- (void)_queue_pauseSubsystem:(id)a3;
- (void)_queue_resumeSubsystem:(id)a3;
- (void)_queue_resumeWithTimeout:(double)a3 completion:(id)a4;
- (void)_removeSubsystem:(id)a3;
- (void)activityTracker:(id)a3 didBeginActivity:(id)a4;
- (void)activityTracker:(id)a3 didEndActivity:(id)a4;
- (void)addElement:(id)a3 section:(id)a4;
- (void)addObserver:(id)a3;
- (void)addTrainingContext:(id)a3;
- (void)beginActivity:(id)a3 forObject:(id)a4;
- (void)dealloc;
- (void)endActivity:(id)a3 forObject:(id)a4;
- (void)enumerateRankedContent:(id)a3;
- (void)enumerateRankedContentInSection:(id)a3 usingBlock:(id)a4;
- (void)enumerateSectionDescriptorsWithOptions:(unint64_t)a3 includeHistoric:(BOOL)a4 usingBlock:(id)a5;
- (void)gatherMetrics;
- (void)pause;
- (void)pauseForSimulation;
- (void)removeElement:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removePreferencesForObject:(id)a3;
- (void)removeTrainingContext:(id)a3;
- (void)resetModelWithCompletion:(id)a3;
- (void)resume;
- (void)resumeFromSimulation;
- (void)resumeWithTimeout:(double)a3 completion:(id)a4;
- (void)saveModelFile;
- (void)setAutomaticallyResumeEngine:(BOOL)a3;
- (void)setPreferences:(id)a3 forObject:(id)a4;
- (void)storeDiagnosticLogs:(id)a3;
- (void)storeDiagnosticLogsToFile:(id)a3;
- (void)trainPendingEventsWithCompletion:(id)a3;
- (void)trainWithPendingEvents;
- (void)updateSectionsWithIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation RERelevanceEngine

- (void)endActivity:(id)a3 forObject:(id)a4
{
  p_activityTrackerLock = &self->_activityTrackerLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_activityTrackerLock);
  [(REActivityTracker *)self->_activityTracker endActivity:v8 forObject:v7];

  os_unfair_lock_unlock(p_activityTrackerLock);
}

- (void)beginActivity:(id)a3 forObject:(id)a4
{
  p_activityTrackerLock = &self->_activityTrackerLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_activityTrackerLock);
  [(REActivityTracker *)self->_activityTracker beginActivity:v8 forObject:v7];

  os_unfair_lock_unlock(p_activityTrackerLock);
}

- (void)activityTracker:(id)a3 didEndActivity:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = RELogForDomain(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEFAULT, "Engine finished tracking %{public}@.", buf, 0xCu);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__RERelevanceEngine_activityTracker_didEndActivity___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)activityTracker:(id)a3 didBeginActivity:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = RELogForDomain(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEFAULT, "Engine started tracking %{public}@.", buf, 0xCu);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RERelevanceEngine_activityTracker_didBeginActivity___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (OS_dispatch_queue)subsystemQueue
{
  return self->_queue;
}

- (void)_addSubsystem:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_subsystems addObject:v4];
  os_unfair_lock_lock(&self->_activityTrackerLock);
  [(REActivityTracker *)self->_activityTracker trackObject:v4];
  os_unfair_lock_unlock(&self->_activityTrackerLock);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__RERelevanceEngine_RESubsystems___addSubsystem___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __116__RERelevanceEngine_RERelevanceEngineProperties__enumerateSectionDescriptorsWithOptions_includeHistoric_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RERelevanceEngine)initWithName:(id)a3 configuration:(id)a4
{
  location[16] = *(id *)MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v215 = a4;
  v225 = v6;
  if (!v6) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Relevance engine name must be non-nil", v7, v8, v9, v10, v11, v12, v207);
  }
  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  v13 = +[RESingleton sharedInstance];
  v14 = [v13 availableEngines];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v230 objects:v282 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v231;
    v17 = (void *)*MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v231 != v16) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v230 + 1) + 8 * i) name];
        v20 = v225;
        v21 = v19;
        if (v21 == v20)
        {

LABEL_12:
          RERaiseInternalException(v17, @"Relevance engine with name %@ already exists", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
          continue;
        }
        v22 = v21;
        int v23 = [(__CFString *)v20 isEqual:v21];

        if (v23) {
          goto LABEL_12;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v230 objects:v282 count:16];
    }
    while (v15);
  }

  v229.receiver = self;
  v229.super_class = (Class)RERelevanceEngine;
  val = [(RERelevanceEngine *)&v229 init];

  if (val)
  {
    uint64_t v30 = [(__CFString *)v225 copy];
    name = val->_name;
    val->_name = (NSString *)v30;

    val->_running = 0;
    val->_automaticallyResumeEngine = 1;
    val->_activityTrackerLock._os_unfair_lock_opaque = 0;
    v212 = [v215 preferenceDomain];
    if (v212)
    {
      v32 = [[_REEngineDefaults alloc] initWithDomain:v212];
      defaults = val->_defaults;
      val->_defaults = v32;
    }
    +[RESingleton _incrementSingletonCache];
    uint64_t v34 = [v215 copy];
    configuratiouint64_t n = val->_configuration;
    val->_configuratiouint64_t n = (RERelevanceEngineConfiguration *)v34;

    uint64_t v36 = [MEMORY[0x263EFF980] array];
    subsystems = val->_subsystems;
    val->_subsystems = (NSMutableArray *)v36;

    uint64_t v38 = [MEMORY[0x263EFF9A0] dictionary];
    addedElementsByIdentifier = val->_addedElementsByIdentifier;
    val->_addedElementsByIdentifier = (NSMutableDictionary *)v38;

    uint64_t v40 = objc_opt_new();
    logger = val->_logger;
    val->_logger = (RERelevanceEngineLogger *)v40;

    v42 = [[REActivityTracker alloc] initWithDelegate:val];
    [(REActivityTracker *)v42 trackObject:val];
    v43 = v42;

    activityTracker = val->_activityTracker;
    val->_activityTracker = v43;

    v45 = @"engine";
    if (v225) {
      v45 = v225;
    }
    v46 = [NSString stringWithFormat:@"com.apple.relevanceengine.%@", v45];
    attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v211 = [(RERelevanceEngineConfiguration *)val->_configuration engineQueue];
    id v209 = v46;
    v47 = (const char *)[v209 UTF8String];
    if (v211) {
      dispatch_queue_t v48 = dispatch_queue_create_with_target_V2(v47, attr, v211);
    }
    else {
      dispatch_queue_t v48 = dispatch_queue_create(v47, attr);
    }
    queue = val->_queue;
    val->_queue = (OS_dispatch_queue *)v48;

    v50 = [v215 observerQueue];
    if (v50)
    {
      objc_storeStrong((id *)&val->_callbackQueue, v50);
    }
    else
    {
      v51 = (void *)MEMORY[0x263EF83A0];
      id v52 = MEMORY[0x263EF83A0];
      objc_storeStrong((id *)&val->_callbackQueue, v51);
    }
    v53 = [RERelevanceEnginePreferencesController alloc];
    v54 = [(RERelevanceEngineConfiguration *)val->_configuration observerQueue];
    uint64_t v55 = [(RERelevanceEnginePreferencesController *)v53 initWithQueue:v54];
    preferenceController = val->_preferenceController;
    val->_preferenceController = (RERelevanceEnginePreferencesController *)v55;

    v214 = val->_configuration;
    v57 = [(RERelevanceEngineConfiguration *)v214 sectionDescriptors];
    v58 = (void *)[v57 copy];

    v224 = [MEMORY[0x263EFF9C0] set];
    long long v280 = 0u;
    long long v281 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    id v59 = v58;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v278 objects:location count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v279;
      uint64_t v62 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v279 != v61) {
            objc_enumerationMutation(v59);
          }
          v64 = [*(id *)(*((void *)&v278 + 1) + 8 * j) name];
          if ([v224 containsObject:v64]) {
            [MEMORY[0x263EFF940] raise:v62, @"Section with name \"%@\" already exists. Please choose a unique name", v64 format];
          }
          else {
            [v224 addObject:v64];
          }
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v278 objects:location count:16];
      }
      while (v60);
    }

    objc_storeStrong((id *)&val->_configurationSectionDescriptors, v58);
    v65 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    long long v276 = 0u;
    long long v277 = 0u;
    long long v274 = 0u;
    long long v275 = 0u;
    id v66 = v59;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v274 objects:v294 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v275;
      do
      {
        for (uint64_t k = 0; k != v67; ++k)
        {
          if (*(void *)v275 != v68) {
            objc_enumerationMutation(v66);
          }
          v70 = [[_RESectionDescriptor alloc] initWithSectionDescriptor:*(void *)(*((void *)&v274 + 1) + 8 * k)];
          [v65 addObject:v70];
        }
        uint64_t v67 = [v66 countByEnumeratingWithState:&v274 objects:v294 count:16];
      }
      while (v67);
    }

    uint64_t v71 = [v65 copy];
    sectionDescriptors = val->_sectionDescriptors;
    val->_sectionDescriptors = (NSArray *)v71;

    v73 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v65, "count"));
    long long v272 = 0u;
    long long v273 = 0u;
    long long v270 = 0u;
    long long v271 = 0u;
    obuint64_t j = v66;
    uint64_t v74 = [obj countByEnumeratingWithState:&v270 objects:v293 count:16];
    if (v74)
    {
      uint64_t v75 = *(void *)v271;
      do
      {
        for (uint64_t m = 0; m != v74; ++m)
        {
          if (*(void *)v271 != v75) {
            objc_enumerationMutation(obj);
          }
          v77 = [*(id *)(*((void *)&v270 + 1) + 8 * m) historicSectionDescriptor];
          if (v77)
          {
            v78 = [[_RESectionDescriptor alloc] initWithHistoricSectionDescriptor:v77];
            [v73 addObject:v78];
          }
        }
        uint64_t v74 = [obj countByEnumeratingWithState:&v270 objects:v293 count:16];
      }
      while (v74);
    }

    uint64_t v79 = [v73 copy];
    historicSectionDescriptors = val->_historicSectionDescriptors;
    val->_historicSectionDescriptors = (NSArray *)v79;

    v217 = +[REFeatureSet featureSet];
    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    v81 = [(RERelevanceEngineConfiguration *)v214 primaryFeatures];
    uint64_t v82 = [v81 countByEnumeratingWithState:&v266 objects:v292 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v267;
      do
      {
        for (uint64_t n = 0; n != v82; ++n)
        {
          if (*(void *)v267 != v83) {
            objc_enumerationMutation(v81);
          }
          v85 = *(void **)(*((void *)&v266 + 1) + 8 * n);
          if ([v85 featureType] == 2)
          {
            v86 = RELogForDomain(0);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v291 = v85;
              _os_log_impl(&dword_21E6E6000, v86, OS_LOG_TYPE_DEFAULT, "Skipping loading primary feature %@ from configuration since it isn't a categorcial feature", buf, 0xCu);
            }
          }
          else
          {
            [v217 addFeature:v85];
          }
        }
        uint64_t v82 = [v81 countByEnumeratingWithState:&v266 objects:v292 count:16];
      }
      while (v82);
    }

    uint64_t v87 = [v217 copy];
    mlFeatures = val->_mlFeatures;
    val->_mlFeatures = (REFeatureSet *)v87;

    v89 = [(RERelevanceEngineConfiguration *)v214 primaryFeatures];
    v226 = (void *)[v89 mutableCopy];

    v90 = [MEMORY[0x263EFF980] array];
    v91 = [MEMORY[0x263EFF980] array];
    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    id v222 = v65;
    uint64_t v92 = [v222 countByEnumeratingWithState:&v262 objects:buf count:16];
    if (v92)
    {
      uint64_t v93 = *(void *)v263;
      do
      {
        for (iuint64_t i = 0; ii != v92; ++ii)
        {
          if (*(void *)v263 != v93) {
            objc_enumerationMutation(v222);
          }
          v95 = [*(id *)(*((void *)&v262 + 1) + 8 * ii) rules];
          REExtractRules(v95, v90, v91);
        }
        uint64_t v92 = [v222 countByEnumeratingWithState:&v262 objects:buf count:16];
      }
      while (v92);
    }

    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    id v221 = v73;
    uint64_t v96 = [v221 countByEnumeratingWithState:&v258 objects:v289 count:16];
    if (v96)
    {
      uint64_t v97 = *(void *)v259;
      do
      {
        for (juint64_t j = 0; jj != v96; ++jj)
        {
          if (*(void *)v259 != v97) {
            objc_enumerationMutation(v221);
          }
          v99 = [*(id *)(*((void *)&v258 + 1) + 8 * jj) rules];
          REExtractRules(v99, v90, v91);
        }
        uint64_t v96 = [v221 countByEnumeratingWithState:&v258 objects:v289 count:16];
      }
      while (v96);
    }

    long long v256 = 0u;
    long long v257 = 0u;
    long long v254 = 0u;
    long long v255 = 0u;
    id v100 = v90;
    uint64_t v101 = [v100 countByEnumeratingWithState:&v254 objects:v288 count:16];
    if (v101)
    {
      uint64_t v102 = *(void *)v255;
      do
      {
        for (kuint64_t k = 0; kk != v101; ++kk)
        {
          if (*(void *)v255 != v102) {
            objc_enumerationMutation(v100);
          }
          v104 = *(void **)(*((void *)&v254 + 1) + 8 * kk);
          v105 = [v104 condition];
          v106 = [v105 _dependentFeatures];
          [v226 unionFeatureSet:v106];

          id v107 = (id)[v104 conditionEvaluator];
        }
        uint64_t v101 = [v100 countByEnumeratingWithState:&v254 objects:v288 count:16];
      }
      while (v101);
    }

    long long v252 = 0u;
    long long v253 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    id v108 = v91;
    uint64_t v109 = [v108 countByEnumeratingWithState:&v250 objects:v287 count:16];
    if (v109)
    {
      uint64_t v110 = *(void *)v251;
      do
      {
        for (muint64_t m = 0; mm != v109; ++mm)
        {
          if (*(void *)v251 != v110) {
            objc_enumerationMutation(v108);
          }
          v112 = *(void **)(*((void *)&v250 + 1) + 8 * mm);
          v113 = [v112 leftCondition];
          v114 = [v113 _dependentFeatures];
          [v226 unionFeatureSet:v114];

          v115 = [v112 rightCondition];
          v116 = [v115 _dependentFeatures];
          [v226 unionFeatureSet:v116];

          v117 = [v112 comparison];
          v118 = [v117 _dependentFeatures];
          [v226 unionFeatureSet:v118];

          id v119 = (id)[v112 leftConditionEvaluator];
          id v120 = (id)[v112 rightConditionEvaluator];
          id v121 = (id)[v112 comparisonConditionEvaluator];
        }
        uint64_t v109 = [v108 countByEnumeratingWithState:&v250 objects:v287 count:16];
      }
      while (v109);
    }

    v122 = REIntrinsicFeatureSet();
    [v226 unionFeatureSet:v122];

    long long v248 = 0u;
    long long v249 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    v123 = [(RERelevanceEngineConfiguration *)v214 interactionDescriptors];
    uint64_t v124 = [v123 countByEnumeratingWithState:&v246 objects:v286 count:16];
    if (v124)
    {
      uint64_t v125 = *(void *)v247;
      do
      {
        for (nuint64_t n = 0; nn != v124; ++nn)
        {
          if (*(void *)v247 != v125) {
            objc_enumerationMutation(v123);
          }
          v127 = *(void **)(*((void *)&v246 + 1) + 8 * nn);
          v128 = [v127 selectionFeature];

          if (v128)
          {
            v129 = [v127 selectionFeature];
            [v226 addFeature:v129];
          }
          v130 = [v127 identificationFeature];

          if (v130)
          {
            v131 = [v127 identificationFeature];
            [v226 addFeature:v131];
          }
          v132 = [v127 biasFeature];

          if (v132)
          {
            v133 = [v127 biasFeature];
            [v226 addFeature:v133];
          }
        }
        uint64_t v124 = [v123 countByEnumeratingWithState:&v246 objects:v286 count:16];
      }
      while (v124);
    }

    v134 = RERootFeatureSetForFeatures(v226);
    v213 = (void *)[v134 mutableCopy];

    v135 = REIntrinsicFeatureSet();
    [v213 unionFeatureSet:v135];

    uint64_t v136 = [v213 copy];
    rootFeatures = val->_rootFeatures;
    val->_rootFeatures = (REFeatureSet *)v136;

    v208 = (void *)[v226 copy];
    v138 = [MEMORY[0x263EFF9C0] set];
    long long v244 = 0u;
    long long v245 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    id v220 = v100;
    uint64_t v139 = [v220 countByEnumeratingWithState:&v242 objects:v285 count:16];
    if (v139)
    {
      uint64_t v140 = *(void *)v243;
      do
      {
        for (uint64_t i1 = 0; i1 != v139; ++i1)
        {
          if (*(void *)v243 != v140) {
            objc_enumerationMutation(v220);
          }
          v142 = [*(id *)(*((void *)&v242 + 1) + 8 * i1) condition];
          v143 = [v142 _inflectionFeatureValuePairs];
          [v138 unionSet:v143];
        }
        uint64_t v139 = [v220 countByEnumeratingWithState:&v242 objects:v285 count:16];
      }
      while (v139);
    }

    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    id v219 = v108;
    v144 = (void *)[v219 countByEnumeratingWithState:&v238 objects:v284 count:16];
    if (v144)
    {
      uint64_t v145 = *(void *)v239;
      do
      {
        for (i2 = 0; i2 != v144; i2 = (char *)i2 + 1)
        {
          if (*(void *)v239 != v145) {
            objc_enumerationMutation(v219);
          }
          v147 = *(void **)(*((void *)&v238 + 1) + 8 * (void)i2);
          v148 = [v147 leftCondition];
          v149 = [v148 _inflectionFeatureValuePairs];
          [v138 unionSet:v149];

          v150 = [v147 rightCondition];
          v151 = [v150 _inflectionFeatureValuePairs];
          [v138 unionSet:v151];

          v152 = [v147 comparison];
          v153 = [v152 _inflectionFeatureValuePairs];
          [v138 unionSet:v153];
        }
        v144 = (void *)[v219 countByEnumeratingWithState:&v238 objects:v284 count:16];
      }
      while (v144);
    }

    v154 = [MEMORY[0x263EFF9A0] dictionary];
    long long v236 = 0u;
    long long v237 = 0u;
    long long v235 = 0u;
    long long v234 = 0u;
    id v218 = v138;
    uint64_t v155 = [v218 countByEnumeratingWithState:&v234 objects:v283 count:16];
    if (v155)
    {
      uint64_t v156 = *(void *)v235;
      do
      {
        for (uint64_t i3 = 0; i3 != v155; ++i3)
        {
          if (*(void *)v235 != v156) {
            objc_enumerationMutation(v218);
          }
          v158 = *(void **)(*((void *)&v234 + 1) + 8 * i3);
          v159 = [v158 feature];
          v160 = [v154 objectForKeyedSubscript:v159];

          if (!v160)
          {
            v160 = [MEMORY[0x263EFFA08] set];
          }
          v161 = REFeatureValueForTaggedPointer([v158 value]);
          v162 = v161;
          if (!v161)
          {
            v144 = [MEMORY[0x263EFF9D0] null];
            v162 = v144;
          }
          v163 = [v160 setByAddingObject:v162];

          if (!v161) {
          v164 = [v158 feature];
          }
          [v154 setObject:v163 forKeyedSubscript:v164];
        }
        uint64_t v155 = [v218 countByEnumeratingWithState:&v234 objects:v283 count:16];
      }
      while (v155);
    }

    uint64_t v165 = [v154 copy];
    inflectionFeatureValues = val->_inflectionFeatureValues;
    val->_inflectionFeatureValues = (NSDictionary *)v165;

    v167 = (void *)[v208 mutableCopy];
    v168 = [[REMLModelManager alloc] initWithRelevanceEngine:val];
    modelManager = val->_modelManager;
    val->_modelManager = v168;

    v170 = [(REMLModelManager *)val->_modelManager _orderedModelFeatures];
    v171 = (void *)[v170 mutableCopy];

    v172 = +[REFeatureSet featureSetWithFeatures:v171];
    [v167 minusFeatureSet:v172];

    v173 = [v167 allFeatures];
    [v171 addObjectsFromArray:v173];

    v174 = +[REFeatureSet featureSetWithFeatures:v171];
    [v167 unionFeatureSet:v174];

    v175 = [REFeatureMapGenerator alloc];
    v176 = [(REFeatureSet *)val->_rootFeatures allFeatures];
    uint64_t v177 = [(REFeatureMapGenerator *)v175 initWithFeatureList:v176];
    inputFeatureMapGenerator = val->_inputFeatureMapGenerator;
    val->_inputFeatureMapGenerator = (REFeatureMapGenerator *)v177;

    v179 = [[REFeatureMapGenerator alloc] initWithFeatureList:v171];
    outputFeatureMapGenerator = val->_outputFeatureMapGenerator;
    val->_outputFeatureMapGenerator = v179;

    v181 = [[REFeatureTransmuter alloc] initWithInputFeatures:val->_rootFeatures outputFeatures:v167 outputFeatureMapGenerator:val->_outputFeatureMapGenerator];
    featureTransmuter = val->_featureTransmuter;
    val->_featureTransmuter = v181;

    [(RERelevanceEngineLogger *)val->_logger addLoggable:val->_featureTransmuter];
    v183 = [[RELiveElementCoordinator alloc] initWithRelevanceEngine:val];
    coordinator = val->_coordinator;
    val->_coordinator = v183;

    v185 = [REDataSourceManager alloc];
    v186 = [v215 dataSourceLoader];
    uint64_t v187 = [(REDataSourceManager *)v185 initWithRelevanceEngine:val dataSourceLoader:v186 withDelegate:val->_coordinator];
    dataSourceManager = val->_dataSourceManager;
    val->_dataSourceManager = (REDataSourceManager *)v187;

    v189 = [[RETrainingManager alloc] initWithRelevanceEngine:val];
    trainingManager = val->_trainingManager;
    val->_trainingManager = v189;

    v191 = [REEngineLocationManager alloc];
    v192 = [v215 locationManager];
    uint64_t v193 = [(REEngineLocationManager *)v191 initWithRelevanceEngine:val locationManager:v192];
    locationManager = val->_locationManager;
    val->_locationManager = (REEngineLocationManager *)v193;

    v195 = [[REDataSourceCatalog alloc] initWithDataSourceManager:val->_dataSourceManager];
    dataSourceCatalog = val->_dataSourceCatalog;
    val->_dataSourceCatalog = v195;

    v197 = +[RESingleton sharedInstance];
    [v197 _registerEngine:val];

    if (_fetchedInternalBuildOnceToken_0 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_0, &__block_literal_global_35);
    }
    if (_isInternalDevice_0) {
      +[RETrainingSimulationCoordinator prewarm];
    }
    -[RERelevanceEngineLogger addLoggable:](val->_logger, "addLoggable:");
    v198 = [(RERelevanceEngine *)val configuration];
    int v199 = [v198 allowsDiagnosticExtension];

    if (v199)
    {
      v200 = +[RESingleton sharedInstance];
      [v200 checkinEngine:val];
    }
    objc_initWeak(location, val);
    callbackQueue = val->_callbackQueue;
    if ([v215 wantsImmutableContent]) {
      double v202 = 0.0;
    }
    else {
      double v202 = 0.05;
    }
    v227[0] = MEMORY[0x263EF8330];
    v227[1] = 3221225472;
    v227[2] = __48__RERelevanceEngine_initWithName_configuration___block_invoke_2;
    v227[3] = &unk_2644BC638;
    objc_copyWeak(&v228, location);
    uint64_t v203 = +[REUpNextScheduler schedulerWithQueue:callbackQueue delay:v227 updateBlock:v202];
    loadingScheduler = val->_loadingScheduler;
    val->_loadingScheduler = (REUpNextScheduler *)v203;

    objc_destroyWeak(&v228);
    objc_destroyWeak(location);
  }
  v205 = val;

  return v205;
}

uint64_t __49__RERelevanceEngine_RESubsystems___addSubsystem___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[200]) {
    return objc_msgSend(v2, "_queue_resumeSubsystem:", v3);
  }
  else {
    return objc_msgSend(v2, "_queue_pauseSubsystem:", v3);
  }
}

- (void)_queue_pauseSubsystem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 isRunning])
  {
    [v4 setRunning:0];
    [v4 pause];
  }
}

uint64_t __52__RERelevanceEngine_activityTracker_didEndActivity___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 201) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 208) schedule];
}

uint64_t __54__RERelevanceEngine_activityTracker_didBeginActivity___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 201) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 208) schedule];
}

- (RERelevanceEngineLogger)logger
{
  return self->_logger;
}

- (NSDictionary)inflectionFeatureValues
{
  return self->_inflectionFeatureValues;
}

- (REFeatureSet)rootFeatures
{
  return self->_rootFeatures;
}

- (REMLModelManager)modelManager
{
  return self->_modelManager;
}

- (RERelevanceEngineConfiguration)configuration
{
  return self->_configuration;
}

- (void)enumerateSectionDescriptorsWithOptions:(unint64_t)a3 includeHistoric:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __116__RERelevanceEngine_RERelevanceEngineProperties__enumerateSectionDescriptorsWithOptions_includeHistoric_usingBlock___block_invoke;
    v13[3] = &unk_2644BE1D0;
    id v14 = v8;
    uint64_t v10 = (void *)MEMORY[0x223C31700](v13);
    if (v5)
    {
      if ((a3 & 2) != 0) {
        uint64_t v11 = 184;
      }
      else {
        uint64_t v11 = 176;
      }
      if ((a3 & 2) != 0) {
        uint64_t v12 = 176;
      }
      else {
        uint64_t v12 = 184;
      }
      [*(id *)((char *)&self->super.isa + v11) enumerateObjectsWithOptions:a3 usingBlock:v10];
    }
    else
    {
      uint64_t v12 = 176;
    }
    [*(id *)((char *)&self->super.isa + v12) enumerateObjectsWithOptions:a3 usingBlock:v10];
  }
}

void __48__RERelevanceEngine_initWithName_configuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyLoadingState");
}

uint64_t __48__RERelevanceEngine_initWithName_configuration___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_0 = result;
  return result;
}

- (BOOL)wantsImmutableContent
{
  return [(RERelevanceEngineConfiguration *)self->_configuration wantsImmutableContent];
}

- (RETrainingManager)trainingManager
{
  return self->_trainingManager;
}

- (REFeatureSet)mlFeatures
{
  return self->_mlFeatures;
}

- (REFeatureTransmuter)featureTransmuter
{
  return self->_featureTransmuter;
}

- (RELiveElementCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSString)name
{
  return self->_name;
}

- (RERelevanceEnginePreferences)effectivePreferences
{
  return [(RERelevanceEnginePreferencesController *)self->_preferenceController effectivePreferences];
}

- (void)addTrainingContext:(id)a3
{
}

- (void)_notifyResumeCompleted
{
  p_activityTrackerLocuint64_t k = &self->_activityTrackerLock;
  os_unfair_lock_lock(&self->_activityTrackerLock);
  resumeCompletionBlocuint64_t k = self->_resumeCompletionBlock;
  if (resumeCompletionBlock)
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, resumeCompletionBlock);
    id v5 = self->_resumeCompletionBlock;
    self->_resumeCompletionBlocuint64_t k = 0;
  }
  os_unfair_lock_unlock(p_activityTrackerLock);
}

- (void)_callbackQueue_notifyLoadingState
{
  BOOL updatedLoading = self->_updatedLoading;
  if (updatedLoading == self->_loading)
  {
    if (!self->_updatedLoading)
    {
      [(RERelevanceEngine *)self _notifyResumeCompleted];
    }
  }
  else
  {
    self->_loading = updatedLoading;
    id v4 = RELogForDomain(0);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (updatedLoading)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "Engine started loading new data", buf, 2u);
      }

      coordinator = self->_coordinator;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke;
      v9[3] = &unk_2644BE1A8;
      v9[4] = self;
      [(REElementCoordinator *)coordinator enumerateObservers:v9];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "Engine finished loading new data", buf, 2u);
      }

      uint64_t v7 = self->_coordinator;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke_52;
      v8[3] = &unk_2644BE1A8;
      v8[4] = self;
      [(REElementCoordinator *)v7 enumerateObservers:v8];
      [(RERelevanceEngine *)self _notifyResumeCompleted];
    }
  }
}

+ (void)prewarmWithConfiguration:(id)a3
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 dataSourceLoader];
  [v4 prewarm];

  BOOL v5 = [v3 relevanceProviderManagerLoader];
  [v5 prewarm];

  REApplicationCachePrewarm();
  id v107 = v3;
  id v6 = [v107 sectionDescriptors];
  uint64_t v7 = (void *)[v6 copy];

  v115 = [MEMORY[0x263EFF9C0] set];
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v162 objects:v178 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v163;
    uint64_t v11 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v163 != v10) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v162 + 1) + 8 * i) name];
        if ([v115 containsObject:v13]) {
          [MEMORY[0x263EFF940] raise:v11, @"Section with name \"%@\" already exists. Please choose a unique name", v13 format];
        }
        else {
          [v115 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v162 objects:v178 count:16];
    }
    while (v9);
  }

  id v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v158 objects:v177 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v159;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v159 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = [[_RESectionDescriptor alloc] initWithSectionDescriptor:*(void *)(*((void *)&v158 + 1) + 8 * j)];
        [v14 addObject:v19];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v158 objects:v177 count:16];
    }
    while (v16);
  }

  v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  obuint64_t j = v15;
  uint64_t v21 = [obj countByEnumeratingWithState:&v154 objects:v176 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v155;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v155 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = [*(id *)(*((void *)&v154 + 1) + 8 * k) historicSectionDescriptor];
        if (v24)
        {
          uint64_t v25 = [[_RESectionDescriptor alloc] initWithHistoricSectionDescriptor:v24];
          [v20 addObject:v25];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v154 objects:v176 count:16];
    }
    while (v21);
  }

  id v108 = +[REFeatureSet featureSet];
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  uint64_t v26 = [v107 primaryFeatures];
  uint64_t n = [v26 countByEnumeratingWithState:&v150 objects:v175 count:16];
  if (n)
  {
    uint64_t v28 = *(void *)v151;
    do
    {
      for (uint64_t m = 0; m != n; ++m)
      {
        if (*(void *)v151 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void **)(*((void *)&v150 + 1) + 8 * m);
        if ([v30 featureType] == 2)
        {
          v31 = RELogForDomain(0);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v174 = v30;
            _os_log_impl(&dword_21E6E6000, v31, OS_LOG_TYPE_DEFAULT, "Skipping loading primary feature %@ from configuration since it isn't a categorcial feature", buf, 0xCu);
          }
        }
        else
        {
          [v108 addFeature:v30];
        }
      }
      uint64_t n = [v26 countByEnumeratingWithState:&v150 objects:v175 count:16];
    }
    while (n);
  }

  v32 = [v107 primaryFeatures];
  v116 = (void *)[v32 mutableCopy];

  v33 = [MEMORY[0x263EFF980] array];
  uint64_t v34 = [MEMORY[0x263EFF980] array];
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v113 = v14;
  uint64_t v35 = [v113 countByEnumeratingWithState:&v146 objects:buf count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v147;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v147 != v36) {
          objc_enumerationMutation(v113);
        }
        v37 = [*(id *)(*((void *)&v146 + 1) + 8 * n) rules];
        REExtractRules(v37, v33, v34);
      }
      uint64_t v35 = [v113 countByEnumeratingWithState:&v146 objects:buf count:16];
    }
    while (v35);
  }

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v112 = v20;
  uint64_t v38 = [v112 countByEnumeratingWithState:&v142 objects:v172 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v143;
    do
    {
      for (uint64_t n = 0; n != v38; ++n)
      {
        if (*(void *)v143 != v39) {
          objc_enumerationMutation(v112);
        }
        uint64_t v40 = [*(id *)(*((void *)&v142 + 1) + 8 * n) rules];
        REExtractRules(v40, v33, v34);
      }
      uint64_t v38 = [v112 countByEnumeratingWithState:&v142 objects:v172 count:16];
    }
    while (v38);
  }

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v41 = v33;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v138 objects:v171 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v139;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v139 != v43) {
          objc_enumerationMutation(v41);
        }
        v45 = *(void **)(*((void *)&v138 + 1) + 8 * ii);
        v46 = [v45 condition];
        uint64_t n = [v46 _dependentFeatures];
        [v116 unionFeatureSet:n];

        id v47 = (id)[v45 conditionEvaluator];
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v138 objects:v171 count:16];
    }
    while (v42);
  }

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v48 = v34;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v134 objects:v170 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v135;
    do
    {
      for (juint64_t j = 0; jj != v49; ++jj)
      {
        if (*(void *)v135 != v50) {
          objc_enumerationMutation(v48);
        }
        id v52 = *(void **)(*((void *)&v134 + 1) + 8 * jj);
        v53 = [v52 leftCondition];
        v54 = [v53 _dependentFeatures];
        [v116 unionFeatureSet:v54];

        uint64_t v55 = [v52 rightCondition];
        v56 = [v55 _dependentFeatures];
        [v116 unionFeatureSet:v56];

        v57 = [v52 comparison];
        uint64_t n = [v57 _dependentFeatures];
        [v116 unionFeatureSet:n];

        id v58 = (id)[v52 leftConditionEvaluator];
        id v59 = (id)[v52 rightConditionEvaluator];
        id v60 = (id)[v52 comparisonConditionEvaluator];
      }
      uint64_t v49 = [v48 countByEnumeratingWithState:&v134 objects:v170 count:16];
    }
    while (v49);
  }

  uint64_t v61 = REIntrinsicFeatureSet();
  [v116 unionFeatureSet:v61];

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v62 = [v107 interactionDescriptors];
  uint64_t v63 = [v62 countByEnumeratingWithState:&v130 objects:v169 count:16];
  if (v63)
  {
    uint64_t v64 = *(void *)v131;
    do
    {
      for (kuint64_t k = 0; kk != v63; ++kk)
      {
        if (*(void *)v131 != v64) {
          objc_enumerationMutation(v62);
        }
        uint64_t n = *(void *)(*((void *)&v130 + 1) + 8 * kk);
        id v66 = [(id)n selectionFeature];

        if (v66)
        {
          uint64_t v67 = [(id)n selectionFeature];
          [v116 addFeature:v67];
        }
        uint64_t v68 = [(id)n identificationFeature];

        if (v68)
        {
          v69 = [(id)n identificationFeature];
          [v116 addFeature:v69];
        }
        v70 = [(id)n biasFeature];

        if (v70)
        {
          uint64_t v71 = [(id)n biasFeature];
          [v116 addFeature:v71];
        }
      }
      uint64_t v63 = [v62 countByEnumeratingWithState:&v130 objects:v169 count:16];
    }
    while (v63);
  }

  v72 = RERootFeatureSetForFeatures(v116);
  v106 = (void *)[v72 mutableCopy];

  v73 = REIntrinsicFeatureSet();
  [v106 unionFeatureSet:v73];

  v105 = (void *)[v106 copy];
  uint64_t v74 = [MEMORY[0x263EFF9C0] set];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v111 = v41;
  uint64_t v75 = [v111 countByEnumeratingWithState:&v126 objects:v168 count:16];
  if (v75)
  {
    uint64_t n = *(void *)v127;
    do
    {
      for (muint64_t m = 0; mm != v75; ++mm)
      {
        if (*(void *)v127 != n) {
          objc_enumerationMutation(v111);
        }
        v77 = [*(id *)(*((void *)&v126 + 1) + 8 * mm) condition];
        v78 = [v77 _inflectionFeatureValuePairs];
        [v74 unionSet:v78];
      }
      uint64_t v75 = [v111 countByEnumeratingWithState:&v126 objects:v168 count:16];
    }
    while (v75);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v110 = v48;
  uint64_t v79 = [v110 countByEnumeratingWithState:&v122 objects:v167 count:16];
  if (v79)
  {
    uint64_t v80 = *(void *)v123;
    do
    {
      for (nuint64_t n = 0; nn != v79; ++nn)
      {
        if (*(void *)v123 != v80) {
          objc_enumerationMutation(v110);
        }
        uint64_t v82 = *(void **)(*((void *)&v122 + 1) + 8 * nn);
        uint64_t v83 = [v82 leftCondition];
        v84 = [v83 _inflectionFeatureValuePairs];
        [v74 unionSet:v84];

        v85 = [v82 rightCondition];
        uint64_t n = [v85 _inflectionFeatureValuePairs];
        [v74 unionSet:n];

        v86 = [v82 comparison];
        uint64_t v87 = [v86 _inflectionFeatureValuePairs];
        [v74 unionSet:v87];
      }
      uint64_t v79 = [v110 countByEnumeratingWithState:&v122 objects:v167 count:16];
    }
    while (v79);
  }

  v88 = [MEMORY[0x263EFF9A0] dictionary];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v109 = v74;
  uint64_t v89 = [v109 countByEnumeratingWithState:&v118 objects:v166 count:16];
  if (v89)
  {
    uint64_t v90 = *(void *)v119;
    do
    {
      for (uint64_t i1 = 0; i1 != v89; ++i1)
      {
        if (*(void *)v119 != v90) {
          objc_enumerationMutation(v109);
        }
        uint64_t v92 = *(void **)(*((void *)&v118 + 1) + 8 * i1);
        uint64_t v93 = [v92 feature];
        v94 = [v88 objectForKeyedSubscript:v93];

        if (!v94)
        {
          v94 = [MEMORY[0x263EFFA08] set];
        }
        v95 = REFeatureValueForTaggedPointer([v92 value]);
        uint64_t v96 = v95;
        if (!v95)
        {
          uint64_t n = [MEMORY[0x263EFF9D0] null];
          uint64_t v96 = (void *)n;
        }
        uint64_t v97 = [v94 setByAddingObject:v96];

        if (!v95) {
        v98 = [v92 feature];
        }
        [v88 setObject:v97 forKeyedSubscript:v98];
      }
      uint64_t v89 = [v109 countByEnumeratingWithState:&v118 objects:v166 count:16];
    }
    while (v89);
  }

  v99 = +[REContentRelevanceProviderManager _features];
  id v100 = +[REFeatureSet featureSetWithFeatures:v99];
  int v101 = [v105 intersectsFeatureSet:v100];

  if (v101) {
    RETokenizeStringPrewarm();
  }
  id v102 = +[RERelevanceProviderManager providerManagerClasses];
  +[RESingleton _incrementSingletonCache];
  v178[0] = 0;
  v178[1] = v178;
  v178[2] = 0x3032000000;
  v178[3] = __Block_byref_object_copy__7;
  v178[4] = __Block_byref_object_dispose__7;
  id v179 = +[REPredictor systemPredictorsSupportingFeatureSet:v105 relevanceEngine:0];
  dispatch_time_t v103 = dispatch_time(0, 500000000);
  v104 = [v107 observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__RERelevanceEngine_prewarmWithConfiguration___block_invoke;
  block[3] = &unk_2644BC768;
  block[4] = v178;
  dispatch_after(v103, v104, block);

  _Block_object_dispose(v178, 8);
}

uint64_t __46__RERelevanceEngine_prewarmWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;

  return +[RESingleton _decrementSingletonCache];
}

- (RERelevanceEngine)initWithConfiguration:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 UUID];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [(RERelevanceEngine *)self initWithName:v7 configuration:v5];

  return v8;
}

- (void)dealloc
{
  id v3 = +[RESingleton sharedInstance];
  [v3 _unregisterEngine:self];

  +[RESingleton _decrementSingletonCache];
  [(RERelevanceEngineLogger *)self->_logger removeLoggable:self];
  [(RERelevanceEngineLogger *)self->_logger removeLoggable:self->_featureTransmuter];
  v4.receiver = self;
  v4.super_class = (Class)RERelevanceEngine;
  [(RERelevanceEngine *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(RERelevanceEngine *)self name];
  id v6 = [v3 stringWithFormat:@"<%@ %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (REDataSourceCatalog)dataSourceCatalog
{
  return self->_dataSourceCatalog;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  [(RERelevanceEngine *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  [(REElementCoordinator *)self->_coordinator addObserver:v4];

  if (self->_automaticallyResumeEngine
    && [(REElementCoordinator *)self->_coordinator numberOfObservers])
  {
    [(RERelevanceEngine *)self resume];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__RERelevanceEngine_addObserver___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__RERelevanceEngine_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  [(REElementCoordinator *)self->_coordinator removeObserver:a3];
  if (self->_automaticallyResumeEngine
    && ![(REElementCoordinator *)self->_coordinator numberOfObservers])
  {
    [(RERelevanceEngine *)self pause];
  }
}

- (void)removeTrainingContext:(id)a3
{
}

- (void)trainWithPendingEvents
{
}

- (void)trainPendingEventsWithCompletion:(id)a3
{
}

- (void)saveModelFile
{
}

- (id)elementAtPath:(id)a3
{
  return [(REElementCoordinator *)self->_coordinator elementAtPath:a3];
}

- (unint64_t)numberOfElementsInSection:(id)a3
{
  return [(REElementCoordinator *)self->_coordinator numberOfElementsInSection:a3];
}

- (id)pathForElement:(id)a3
{
  return [(REElementCoordinator *)self->_coordinator pathForElement:a3];
}

- (void)enumerateRankedContent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__RERelevanceEngine_enumerateRankedContent___block_invoke;
    v6[3] = &unk_2644BE130;
    v6[4] = self;
    id v7 = v4;
    [(RERelevanceEngine *)self enumerateSectionDescriptorsWithOptions:0 includeHistoric:1 usingBlock:v6];
  }
}

void __44__RERelevanceEngine_enumerateRankedContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__RERelevanceEngine_enumerateRankedContent___block_invoke_2;
  v6[3] = &unk_2644BE108;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateRankedContentInSection:v5 usingBlock:v6];
}

void __44__RERelevanceEngine_enumerateRankedContent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [[RESectionPath alloc] initWithSectionName:*(void *)(a1 + 32) element:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateRankedContentInSection:(id)a3 usingBlock:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    unint64_t v7 = [(RERelevanceEngine *)self numberOfElementsInSection:v12];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [[RESectionPath alloc] initWithSectionName:v12 element:i];
        uint64_t v11 = [(RERelevanceEngine *)self elementAtPath:v10];
        if (v11) {
          v6[2](v6, i, v11);
        }
      }
    }
  }
}

- (void)addElement:(id)a3 section:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(RERelevanceEngineSubsystem *)self->_coordinator beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__RERelevanceEngine_addElement_section___block_invoke;
  block[3] = &unk_2644BDBF0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __40__RERelevanceEngine_addElement_section___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 160);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqualToString:", v2, (void)v9))
          {

            goto LABEL_15;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    [*(id *)(*(void *)(a1 + 40) + 160) setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
    if (*(void *)(a1 + 48)) {
      unint64_t v8 = *(__CFString **)(a1 + 48);
    }
    else {
      unint64_t v8 = @"defaultSectionIdentifier";
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "addElement:toSection:", *(void *)(a1 + 32), v8, (void)v9);
  }
LABEL_15:
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "endActivity:forObject:", @"RERelevanceEngineSubsystemLoadingActivity");
}

- (void)removeElement:(id)a3
{
  id v4 = a3;
  [(RERelevanceEngineSubsystem *)self->_coordinator beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__RERelevanceEngine_removeElement___block_invoke;
  v7[3] = &unk_2644BC688;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __35__RERelevanceEngine_removeElement___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) identifier];
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 160);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqualToString:", v2, (void)v9))
          {
            id v8 = *(id *)(a1 + 32);

            [*(id *)(*(void *)(a1 + 40) + 160) setObject:0 forKeyedSubscript:v2];
            [*(id *)(*(void *)(a1 + 40) + 56) removeElement:v8];
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v8 = 0;
LABEL_12:
    [*(id *)(*(void *)(a1 + 40) + 56) endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:(void)v9];
  }
  else
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "endActivity:forObject:", @"RERelevanceEngineSubsystemLoadingActivity");
  }
}

- (BOOL)isRunning
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__RERelevanceEngine_isRunning__block_invoke;
  v5[3] = &unk_2644BD938;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __30__RERelevanceEngine_isRunning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 200);
  return result;
}

- (void)_queue_resumeWithTimeout:(double)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(void))a4;
  id v7 = v6;
  if (self->_running)
  {
    uint64_t v8 = RELogForDomain(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "Engine is already running!", buf, 2u);
    }

    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    if (v6)
    {
      os_unfair_lock_lock(&self->_activityTrackerLock);
      char v9 = (void *)[v7 copy];
      resumeCompletionBlocuint64_t k = self->_resumeCompletionBlock;
      self->_resumeCompletionBlocuint64_t k = v9;

      double v11 = a3 * 1000000000.0;
      if (a3 < 10.0) {
        double v11 = 1.0e10;
      }
      dispatch_time_t v12 = dispatch_time(0, (uint64_t)v11);
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__RERelevanceEngine__queue_resumeWithTimeout_completion___block_invoke;
      block[3] = &unk_2644BC660;
      void block[4] = self;
      dispatch_after(v12, queue, block);
      os_unfair_lock_unlock(&self->_activityTrackerLock);
    }
    [(RERelevanceEngineSubsystem *)self->_coordinator beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
    uint64_t v14 = self->_subsystems;
    id v15 = RELogForDomain(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(NSMutableArray *)v14 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v16;
      _os_log_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEFAULT, "Resuming engine and subsystems: %{public}@", buf, 0xCu);
    }
    self->_running = 1;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v17 = v14;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          -[RERelevanceEngine _queue_resumeSubsystem:](self, "_queue_resumeSubsystem:", *(void *)(*((void *)&v22 + 1) + 8 * v21++), (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v19);
    }

    [(RERelevanceEngineSubsystem *)self->_coordinator endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  }
}

uint64_t __57__RERelevanceEngine__queue_resumeWithTimeout_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyResumeCompleted];
}

- (void)resumeWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RERelevanceEngine_resumeWithTimeout_completion___block_invoke;
  block[3] = &unk_2644BE158;
  double v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __50__RERelevanceEngine_resumeWithTimeout_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeWithTimeout:completion:", *(void *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)updateSectionsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke;
  block[3] = &unk_2644BC570;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "beginActivity:forObject:", @"RERelevanceEngineSubsystemLoadingActivity");
  id v3 = *(void **)(*(void *)(a1 + 32) + 64);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_2;
  v10[3] = &unk_2644BE180;
  double v11 = v2;
  id v12 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_4;
  v6[3] = &unk_2644BC570;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v11;
  uint64_t v8 = v4;
  id v9 = *(id *)(a1 + 48);
  uint64_t v5 = v11;
  [v3 enumerateElementDataSourceControllers:v10 completion:v6];
}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_3;
  v6[3] = &unk_2644BC660;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v4 invalidateElementsInSections:v5 completion:v6];
}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_3(uint64_t a1)
{
}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_t v2 = *(NSObject **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_5;
  v4[3] = &unk_2644BC5E8;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v3, v4);
}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "endActivity:forObject:", @"RERelevanceEngineSubsystemLoadingActivity");
  dispatch_group_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_async(v3, v2);
  }
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__RERelevanceEngine_resume__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__RERelevanceEngine_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeWithTimeout:completion:", 0, 0.0);
}

- (void)pause
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__RERelevanceEngine_pause__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __26__RERelevanceEngine_pause__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 200))
  {
    id v3 = *(id *)(v1 + 24);
    id v4 = RELogForDomain(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v5;
      _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "Pausing engine and subsystems: %{public}@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(a1 + 32), "_queue_pauseSubsystem:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_queue_resumeSubsystem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([v4 isRunning] & 1) == 0)
  {
    [v4 setRunning:1];
    [v4 resume];
  }
}

uint64_t __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 relevanceEngineDidBeginUpdatingRelevance:*(void *)(a1 + 32)];
}

uint64_t __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke_52(uint64_t a1, void *a2)
{
  return [a2 relevanceEngineDidFinishUpdatingRelevance:*(void *)(a1 + 32)];
}

- (void)setPreferences:(id)a3 forObject:(id)a4
{
}

- (void)removePreferencesForObject:(id)a3
{
}

- (BOOL)automaticallyResumeEngine
{
  return self->_automaticallyResumeEngine;
}

- (void)setAutomaticallyResumeEngine:(BOOL)a3
{
  self->_automaticallyResumeEngine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_resumeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_loadingScheduler, 0);
  objc_storeStrong((id *)&self->_inflectionFeatureValues, 0);
  objc_storeStrong((id *)&self->_historicSectionDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionDescriptors, 0);
  objc_storeStrong((id *)&self->_configurationSectionDescriptors, 0);
  objc_storeStrong((id *)&self->_addedElementsByIdentifier, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_activityTracker, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_preferenceController, 0);
  objc_storeStrong((id *)&self->_dataSourceCatalog, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_storeStrong((id *)&self->_featureTransmuter, 0);
  objc_storeStrong((id *)&self->_outputFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_inputFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mlFeatures, 0);
  objc_storeStrong((id *)&self->_rootFeatures, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (REDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (REEngineLocationManager)locationManager
{
  return self->_locationManager;
}

- (NSArray)sectionDescriptors
{
  return self->_sectionDescriptors;
}

- (NSArray)historicSectionDescriptors
{
  return self->_historicSectionDescriptors;
}

- (id)newInputFeatureMap
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newOutputFeatureMap
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_REEngineDefaults)defaults
{
  return self->_defaults;
}

- (id)elementFromDictionary:(id)a3
{
  coordinator = self->_coordinator;
  id v4 = a3;
  id v5 = [(RELiveElementCoordinator *)coordinator elementRelevanceEngine];
  id v6 = [v5 relevanceProviderEnvironment];

  uint64_t v7 = [[REElement alloc] initWithDictionary:v4 relevanceProviderGenerator:v6];
  return v7;
}

- (id)dictionaryFromElement:(id)a3
{
  coordinator = self->_coordinator;
  id v4 = a3;
  id v5 = [(RELiveElementCoordinator *)coordinator elementRelevanceEngine];
  id v6 = [v5 relevanceProviderEnvironment];

  uint64_t v7 = [v4 dictionaryEncodingWithRelevanceProviderGenerator:v6];

  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x263EFFA78];
  }
  id v9 = v8;

  return v9;
}

- (NSArray)subsystems
{
  dispatch_group_t v2 = (void *)[(NSMutableArray *)self->_subsystems copy];
  return (NSArray *)v2;
}

- (BOOL)isSectionWithNameHistoric:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_historicSectionDescriptors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name", (void)v12);
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)historicSectionForSection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_configurationSectionDescriptors;
  uint64_t v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "name", (void)v14);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          long long v12 = [v9 historicSectionDescriptor];
          uint64_t v6 = [v12 name];

          goto LABEL_11;
        }
      }
      uint64_t v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)sectionForHistoricSection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_configurationSectionDescriptors;
  uint64_t v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "historicSectionDescriptor", (void)v14);
        char v11 = [v10 name];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          uint64_t v6 = [v9 name];
          goto LABEL_11;
        }
      }
      uint64_t v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)elementRankerForSection:(id)a3
{
  return [(RELiveElementCoordinator *)self->_coordinator elementRankerForSection:a3];
}

- (void)_removeSubsystem:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_subsystems removeObject:v4];
  os_unfair_lock_lock(&self->_activityTrackerLock);
  [(REActivityTracker *)self->_activityTracker withdrawObject:v4];
  os_unfair_lock_unlock(&self->_activityTrackerLock);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__RERelevanceEngine_RESubsystems___removeSubsystem___block_invoke;
  v7[3] = &unk_2644BC688;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__RERelevanceEngine_RESubsystems___removeSubsystem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pauseSubsystem:", *(void *)(a1 + 40));
}

- (void)storeDiagnosticLogs:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__RERelevanceEngine_RELogging__storeDiagnosticLogs___block_invoke;
    v6[3] = &unk_2644BE1F8;
    id v7 = v4;
    [(RERelevanceEngine *)self _captureAndStoreDiagnosticLogs:v6];
  }
}

uint64_t __52__RERelevanceEngine_RELogging__storeDiagnosticLogs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeDiagnosticLogsToFile:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__RERelevanceEngine_RELogging__storeDiagnosticLogsToFile___block_invoke;
    v6[3] = &unk_2644BE1F8;
    id v7 = v4;
    [(RERelevanceEngine *)self _captureAndStoreDiagnosticLogs:v6];
  }
}

uint64_t __58__RERelevanceEngine_RELogging__storeDiagnosticLogsToFile___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_captureAndStoreDiagnosticLogs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    logger = self->_logger;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke;
    v12[3] = &unk_2644BE220;
    id v13 = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke_2;
    v8[3] = &unk_2644BC570;
    id v9 = v13;
    char v10 = self;
    id v11 = v4;
    id v7 = v13;
    [(RERelevanceEngineLogger *)logger collectLogs:v12 completion:v8];
  }
}

void __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke_2(uint64_t a1)
{
  id v4 = [MEMORY[0x263F089D8] string];
  while ([*(id *)(a1 + 32) count])
  {
    dispatch_group_t v2 = [*(id *)(a1 + 32) firstObject];
    [*(id *)(a1 + 32) removeObjectAtIndex:0];
    [v4 appendString:v2];
  }
  id v3 = RENewLogFilePathForTask(*(void **)(*(void *)(a1 + 40) + 48));
  [v4 writeToFile:v3 atomically:1 encoding:4 error:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)predictionForElementAtPath:(id)a3
{
  return [(RELiveElementCoordinator *)self->_coordinator predictionForElementAtPath:a3];
}

- (id)predictionForElement:(id)a3
{
  return [(RELiveElementCoordinator *)self->_coordinator predictionForElement:a3];
}

- (id)featureProviderForElement:(id)a3
{
  return [(RELiveElementCoordinator *)self->_coordinator featureProviderForElement:a3];
}

- (id)featureProviderForElementAtPath:(id)a3
{
  return [(RELiveElementCoordinator *)self->_coordinator featureProviderForElementAtPath:a3];
}

- (void)pauseForSimulation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) pause];
  dispatch_group_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  return [v2 enumerateElementDataSourceControllers:&__block_literal_global_335];
}

void __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 elementOperationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke_3;
  block[3] = &unk_2644BC660;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "allElements", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) identifier];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 identifier];

          id v8 = (void *)v9;
        }
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) removeElementsWithIds:v2];
}

- (void)resumeFromSimulation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__RERelevanceEngine_RESimulation__resumeFromSimulation__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__RERelevanceEngine_RESimulation__resumeFromSimulation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 200))
  {
    [*(id *)(v1 + 64) resume];
    uint64_t v1 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v1 + 64);
  return [v3 enumerateElementDataSourceControllers:&__block_literal_global_338];
}

uint64_t __55__RERelevanceEngine_RESimulation__resumeFromSimulation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateElements];
}

- (void)resetModelWithCompletion:(id)a3
{
}

- (void)gatherMetrics
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"REDidCollectMetrics" object:0];
}

@end