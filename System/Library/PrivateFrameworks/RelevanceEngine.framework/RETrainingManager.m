@interface RETrainingManager
- (NSMutableArray)trainingEvents;
- (RETrainingContext)currentTrainingContext;
- (RETrainingManager)initWithRelevanceEngine:(id)a3;
- (RETrainingScheduler)trainingScheduler;
- (void)_performTraining:(BOOL)a3 completion:(id)a4;
- (void)_performTrainingForPredictionElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6;
- (void)_queue_trainElementWithIdentifier:(id)a3 relevanceProviders:(id)a4 featureMap:(id)a5 isPositiveEvent:(BOOL)a6 interaction:(id)a7 context:(id)a8;
- (void)addTrainingContext:(id)a3;
- (void)dealloc;
- (void)flushTraining;
- (void)makeContextCurrent:(id)a3;
- (void)manuallyPerformTrainingWithCompletion:(id)a3;
- (void)performTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
- (void)performTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6;
- (void)performTrainingForElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
- (void)performTrainingForElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6;
- (void)removeTrainingContext:(id)a3;
- (void)setCurrentTrainingContext:(id)a3;
@end

@implementation RETrainingManager

- (RETrainingManager)initWithRelevanceEngine:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RETrainingManager;
  v5 = [(RERelevanceEngineSubsystem *)&v30 initWithRelevanceEngine:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    trainingContexts = v5->_trainingContexts;
    v5->_trainingContexts = (NSMutableSet *)v6;

    v8 = [v4 configuration];
    uint64_t v9 = +[RETrainingScheduler schedulerWithBehavior:](RETrainingScheduler, "schedulerWithBehavior:", [v8 trainingBehavior]);
    trainingScheduler = v5->_trainingScheduler;
    v5->_trainingScheduler = (RETrainingScheduler *)v9;

    uint64_t v11 = [v4 coordinator];
    coordinator = v5->_coordinator;
    v5->_coordinator = (RELiveElementCoordinator *)v11;

    uint64_t v13 = [v4 modelManager];
    modelManager = v5->_modelManager;
    v5->_modelManager = (REMLModelManager *)v13;

    uint64_t v15 = [(RERelevanceEngineSubsystem *)v5 queue];
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    trainingFeatureMaps = v5->_trainingFeatureMaps;
    v5->_trainingFeatureMaps = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    trainingContents = v5->_trainingContents;
    v5->_trainingContents = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    trainingEvents = v5->_trainingEvents;
    v5->_trainingEvents = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    interactionTypes = v5->_interactionTypes;
    v5->_interactionTypes = (NSMutableArray *)v23;

    v25 = [v4 configuration];
    LODWORD(v8) = [v25 allowsRemoteTraining];

    if (v8)
    {
      uint64_t v26 = +[RERemoteTrainingClientListener sharedTrainingClientListener];
      remoteTrainingListener = v5->_remoteTrainingListener;
      v5->_remoteTrainingListener = (RERemoteTrainingClientListener *)v26;

      [(RERemoteTrainingClientListener *)v5->_remoteTrainingListener setDelegate:v5];
    }
    v28 = [v4 logger];
    [v28 addLoggable:v5];
  }
  return v5;
}

- (void)setCurrentTrainingContext:(id)a3
{
}

- (void)makeContextCurrent:(id)a3
{
  id v5 = a3;
  id v4 = [(RETrainingManager *)self currentTrainingContext];
  if (v4 != v5)
  {
    [v4 _willResignCurrent];
    [v5 _willBecomeCurrent];
    [(RETrainingManager *)self setCurrentTrainingContext:v5];
    [v4 _didResignCurrent];
    [v5 _didBecomeCurrent];
  }
}

- (RETrainingContext)currentTrainingContext
{
  return (RETrainingContext *)objc_getProperty(self, a2, 120, 1);
}

- (void)addTrainingContext:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (!v4)
  {
    uint64_t v11 = (void *)*MEMORY[0x263EFF4A0];
    v12 = @"Training context must be non-nill";
    goto LABEL_5;
  }
  if ([(NSMutableSet *)self->_trainingContexts containsObject:v4])
  {
    uint64_t v11 = (void *)*MEMORY[0x263EFF4A0];
    v12 = @"Training context already added to relevance engine";
LABEL_5:
    RERaiseInternalException(v11, v12, v5, v6, v7, v8, v9, v10, v14);
    goto LABEL_7;
  }
  [(NSMutableSet *)self->_trainingContexts addObject:v15];
  uint64_t v13 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  [v15 _configureForRelevanceEngine:v13];

LABEL_7:
}

- (void)dealloc
{
  [(RETrainingManager *)self makeContextCurrent:0];
  v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  id v4 = [v3 logger];
  [v4 removeLoggable:self];

  v5.receiver = self;
  v5.super_class = (Class)RETrainingManager;
  [(RERelevanceEngineSubsystem *)&v5 dealloc];
}

- (void)removeTrainingContext:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (v4)
  {
    if ([(NSMutableSet *)self->_trainingContexts containsObject:v4])
    {
      id v11 = [(RETrainingManager *)self currentTrainingContext];

      v12 = v14;
      if (v11 == v14)
      {
        [(RETrainingManager *)self makeContextCurrent:0];
        v12 = v14;
      }
      [v12 _configureForRelevanceEngine:0];
      [(NSMutableSet *)self->_trainingContexts removeObject:v14];
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Training context must be non-nill", v5, v6, v7, v8, v9, v10, v13);
  }
}

- (void)performTrainingForElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(RETrainingManager *)self currentTrainingContext];
  id v11 = [v10 attributeContext];

  [(RETrainingManager *)self performTrainingForElementWithIdentifier:v9 isPositiveEvent:v5 interaction:v8 context:v11];
}

- (void)performTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(RETrainingManager *)self currentTrainingContext];
  id v11 = [v10 attributeContext];

  [(RETrainingManager *)self performTrainingForElement:v9 isPositiveEvent:v5 interaction:v8 context:v11];
}

- (void)performTrainingForElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__RETrainingManager_performTrainingForElementWithIdentifier_isPositiveEvent_interaction_context___block_invoke;
  block[3] = &unk_2644BDF90;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v12;
  id v20 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __97__RETrainingManager_performTrainingForElementWithIdentifier_isPositiveEvent_interaction_context___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 40) featureMapForElementId:*(void *)(a1 + 40) trainingContext:*(void *)(a1 + 48)];
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) elementForElementId:*(void *)(a1 + 40)];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = [v2 relevanceProviders];
  objc_msgSend(v3, "_queue_trainElementWithIdentifier:relevanceProviders:featureMap:isPositiveEvent:interaction:context:", v4, v5, v6, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)performTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__RETrainingManager_performTrainingForElement_isPositiveEvent_interaction_context___block_invoke;
  block[3] = &unk_2644BDF90;
  id v18 = v10;
  id v19 = self;
  BOOL v22 = a4;
  id v20 = v12;
  id v21 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __83__RETrainingManager_performTrainingForElement_isPositiveEvent_interaction_context___block_invoke(uint64_t a1)
{
  id v6 = +[REPredictionElement predictionElementFromElement:*(void *)(a1 + 32)];
  v2 = [*(id *)(*(void *)(a1 + 40) + 40) featureMapForElement:v6 trainingContext:*(void *)(a1 + 48)];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  BOOL v5 = [*(id *)(a1 + 32) relevanceProviders];
  objc_msgSend(v3, "_queue_trainElementWithIdentifier:relevanceProviders:featureMap:isPositiveEvent:interaction:context:", v4, v5, v2, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_performTrainingForPredictionElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6
{
  BOOL v7 = a4;
  coordinator = self->_coordinator;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v16 = [(RELiveElementCoordinator *)coordinator featureMapForElement:v13 trainingContext:v11];
  id v14 = [v13 identifier];
  id v15 = [v13 relevanceProviders];

  [(RETrainingManager *)self _queue_trainElementWithIdentifier:v14 relevanceProviders:v15 featureMap:v16 isPositiveEvent:v7 interaction:v12 context:v11];
}

- (void)flushTraining
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_20);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_12);
  modelManager = self->_modelManager;
  [(REMLModelManager *)modelManager flushTraining];
}

- (void)_queue_trainElementWithIdentifier:(id)a3 relevanceProviders:(id)a4 featureMap:(id)a5 isPositiveEvent:(BOOL)a6 interaction:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v29 = a4;
  id v14 = a5;
  id v15 = a7;
  id v27 = a8;
  id v16 = RELogForDomain(4);
  uint64_t v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = @"negative";
      *(_DWORD *)buf = 138412802;
      id v38 = v28;
      __int16 v39 = 2112;
      if (v10) {
        uint64_t v26 = @"positive";
      }
      v40 = v26;
      __int16 v41 = 2112;
      id v42 = v15;
      _os_log_debug_impl(&dword_21E6E6000, v17, OS_LOG_TYPE_DEBUG, "Training for element %@ %@ %@", buf, 0x20u);
    }

    -[NSMutableArray addObject:](self->_trainingFeatureMaps, "addObject:", v14, v27);
    trainingEvents = self->_trainingEvents;
    id v19 = [NSNumber numberWithBool:v10];
    [(NSMutableArray *)trainingEvents addObject:v19];

    [(NSMutableArray *)self->_interactionTypes addObject:v15];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v29;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      uint64_t v17 = MEMORY[0x263EFFA68];
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v24 keywords];
            goto LABEL_16;
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v17 = MEMORY[0x263EFFA68];
    }
LABEL_16:

    [(NSMutableArray *)self->_trainingContents addObject:v17];
    objc_initWeak((id *)buf, self);
    trainingScheduler = self->_trainingScheduler;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __121__RETrainingManager__queue_trainElementWithIdentifier_relevanceProviders_featureMap_isPositiveEvent_interaction_context___block_invoke;
    v30[3] = &unk_2644BC638;
    objc_copyWeak(&v31, (id *)buf);
    [(RETrainingScheduler *)trainingScheduler performTask:v30];
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v28;
    _os_log_impl(&dword_21E6E6000, v17, OS_LOG_TYPE_DEFAULT, "Dropping training for element %@ because we couldn't get its feature map", buf, 0xCu);
  }
}

void __121__RETrainingManager__queue_trainElementWithIdentifier_relevanceProviders_featureMap_isPositiveEvent_interaction_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performTraining:0 completion:0];
}

- (void)manuallyPerformTrainingWithCompletion:(id)a3
{
  trainingScheduler = self->_trainingScheduler;
  id v5 = a3;
  [(RETrainingScheduler *)trainingScheduler cancelPendindTasks];
  [(RETrainingManager *)self _performTraining:1 completion:v5];
}

- (void)_performTraining:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 || !RETrainingSimulationIsCurrentlyActive())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__RETrainingManager__performTraining_completion___block_invoke;
    block[3] = &unk_2644BD018;
    void block[4] = self;
    BOOL v10 = a3;
    id v9 = v6;
    dispatch_async(queue, block);
  }
  else if (v6)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v6);
  }
}

void __49__RETrainingManager__performTraining_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C31460]();
  if ([*(id *)(*(void *)(a1 + 32) + 88) count])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    [*(id *)(v3 + 48) performTrainingWithFeatureMaps:*(void *)(v3 + 88) content:*(void *)(v3 + 96) events:*(void *)(v3 + 104) interactions:*(void *)(v3 + 112) purgeCaches:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
    uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v4;

    uint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 96);
    *(void *)(v8 + 96) = v7;

    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 104);
    *(void *)(v11 + 104) = v10;

    uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 112);
    *(void *)(v14 + 112) = v13;
  }
}

- (NSMutableArray)trainingEvents
{
  return self->_trainingEvents;
}

- (RETrainingScheduler)trainingScheduler
{
  return self->_trainingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTrainingContext, 0);
  objc_storeStrong((id *)&self->_interactionTypes, 0);
  objc_storeStrong((id *)&self->_trainingEvents, 0);
  objc_storeStrong((id *)&self->_trainingContents, 0);
  objc_storeStrong((id *)&self->_trainingFeatureMaps, 0);
  objc_storeStrong((id *)&self->_remoteTrainingListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trainingContexts, 0);
  objc_storeStrong((id *)&self->_trainingScheduler, 0);
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end