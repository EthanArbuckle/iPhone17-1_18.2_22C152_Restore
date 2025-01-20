@interface RETrainingSimulationCoordinator
+ (void)prewarm;
- (BOOL)isActivelyTraining;
- (id)_engineWithName:(id)a3;
- (id)_init;
- (id)_unavailableEngineWithNameError:(id)a3;
- (void)_accesssEngineWithName:(id)a3 completion:(id)a4;
- (void)_relevanceEnginesDidChange;
- (void)availableRelevanceEngines:(id)a3;
- (void)dealloc;
- (void)elementAction:(id)a3 didFinishTask:(BOOL)a4;
- (void)elementAction:(id)a3 wantsViewControllerDisplayed:(id)a4;
- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4;
- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5;
- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5;
- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5;
- (void)setIsActivelyTraining:(BOOL)a3;
@end

@implementation RETrainingSimulationCoordinator

uint64_t __40__RETrainingSimulationCoordinator__init__block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_1 = result;
  return result;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)RETrainingSimulationCoordinator;
  id v2 = [(RESingleton *)&v11 _init];
  if (v2)
  {
    if (_fetchedInternalBuildOnceToken_1 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_1, &__block_literal_global_9_0);
    }
    if (_isInternalDevice_1)
    {
      uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
      v4 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v3;

      uint64_t v5 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v6 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v5;

      uint64_t v7 = +[RETrainingSimulationServer sharedServer];
      v8 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v7;

      [*((id *)v2 + 1) addObserver:v2];
      v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:v2 selector:sel__relevanceEnginesDidChange name:@"RERelevanceEngineDebuggerAvailableEnginesDidChange" object:0];
    }
  }
  return v2;
}

+ (void)prewarm
{
  id v2 = +[RESingleton sharedInstance];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"RERelevanceEngineDebuggerAvailableEnginesDidChange" object:0];

  v4.receiver = self;
  v4.super_class = (Class)RETrainingSimulationCoordinator;
  [(RETrainingSimulationCoordinator *)&v4 dealloc];
}

- (void)_relevanceEnginesDidChange
{
}

- (id)_engineWithName:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[RESingleton sharedInstance];
  uint64_t v5 = [v4 engineWithName:v3];

  return v5;
}

- (void)_accesssEngineWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke;
    block[3] = &unk_2644BC570;
    block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _engineWithName:*(void *)(a1 + 40)];
  id v3 = [v2 configuration];
  objc_super v4 = [v3 observerQueue];

  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke_2;
    v5[3] = &unk_2644BCCD0;
    id v7 = *(id *)(a1 + 48);
    id v6 = v2;
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_unavailableEngineWithNameError:(id)a3
{
  id v3 = [NSString stringWithFormat:@"No Relevance engine with name \"%@\" found", a3];
  objc_super v4 = RECreateErrorWithCodeAndMessage(1, v3);

  return v4;
}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[a4 mutableCopy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke;
  v14[3] = &unk_2644BEBD8;
  id v15 = v10;
  v16 = self;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(RETrainingSimulationCoordinator *)self _accesssEngineWithName:v12 completion:v14];
}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v6 = [*(id *)(a1 + 40) _unavailableEngineWithNameError:*(void *)(a1 + 48)];
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  objc_super v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"section"];
  [*(id *)(a1 + 32) removeObjectForKey:@"section"];
  uint64_t v5 = [v3 elementFromDictionary:*(void *)(a1 + 32)];
  if (!v5)
  {
    id v6 = RECreateErrorWithCode(2);

    goto LABEL_8;
  }
  id v6 = (void *)v5;
  id v7 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:v8 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  id v9 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v9 addObject:v6];

  [v3 addElement:v6 section:v4];
  id v10 = [v3 subsystemQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_2;
  block[3] = &unk_2644BEBB0;
  id v13 = v3;
  id v11 = *(id *)(a1 + 56);
  id v14 = 0;
  id v15 = v11;
  dispatch_async(v10, block);

LABEL_9:
}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_2(id *a1)
{
  id v2 = [a1[4] subsystemQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_3;
  v3[3] = &unk_2644BCCD0;
  id v5 = a1[6];
  id v4 = a1[5];
  dispatch_async(v2, v3);
}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_4;
  v2[3] = &unk_2644BCCD0;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_5;
  v2[3] = &unk_2644BCCD0;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke;
  v18[3] = &unk_2644BEC00;
  id v19 = v11;
  v20 = self;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [(RETrainingSimulationCoordinator *)self _accesssEngineWithName:v16 completion:v18];
}

void __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"sysdiagnose"])
    {
      if (_fetchedInternalBuildOnceToken_1 != -1) {
        dispatch_once(&_fetchedInternalBuildOnceToken_1, &__block_literal_global_32_0);
      }
      if (_isInternalDevice_1 && (REProcessIsRelevanced() & 1) != 0) {
        goto LABEL_31;
      }
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"begin"])
    {
      if (([*(id *)(a1 + 40) isActivelyTraining] & 1) == 0)
      {
        [*(id *)(a1 + 40) setIsActivelyTraining:1];
        id v4 = [MEMORY[0x263F08A00] defaultCenter];
        [v4 postNotificationName:@"RETrainingSimulationCoordinatorDidBeginTraining" object:*(void *)(a1 + 40)];
      }
      [v3 pauseForSimulation];
      goto LABEL_31;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"end"])
    {
      id v6 = +[RESingleton sharedInstance];
      [v6 _setOverrideLocation:-1 forEngine:*(void *)(a1 + 48)];

      id v7 = +[RESingleton sharedInstance];
      [v7 _setOverrideRoutineType:0];

      if ([*(id *)(a1 + 40) isActivelyTraining])
      {
        [*(id *)(a1 + 40) setIsActivelyTraining:0];
        id v8 = [MEMORY[0x263F08A00] defaultCenter];
        [v8 postNotificationName:@"RETrainingSimulationCoordinatorDidEndTraining" object:*(void *)(a1 + 40)];
      }
      [v3 resumeFromSimulation];
      goto LABEL_31;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"reset"])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)];
      id v10 = (void *)v9;
      id v11 = (void *)MEMORY[0x263EFFA68];
      if (v9) {
        id v11 = (void *)v9;
      }
      id v12 = v11;

      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v12);
            }
            [v3 removeElement:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v14);
      }

      [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
      goto LABEL_31;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"clear"])
    {
      [v3 trainPendingEventsWithCompletion:0];
      id v17 = [v3 modelManager];
      [v17 performModelClearWithCompletion:&__block_literal_global_48];

LABEL_31:
      id v5 = 0;
      goto LABEL_32;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"train"])
    {
      [v3 trainPendingEventsWithCompletion:0];
      goto LABEL_31;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"set_core_routine"])
    {
      id v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"core_routine"];
      uint64_t v18 = RELocationPredictorUserLocationFromString(v5);
      id v19 = +[RESingleton sharedInstance];
      [v19 _setOverrideLocation:v18 forEngine:*(void *)(a1 + 48)];

      dispatch_time_t v20 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_4;
      block[3] = &unk_2644BCBC0;
      id v31 = *(id *)(a1 + 64);
      dispatch_after(v20, MEMORY[0x263EF83A0], block);
      id v21 = v31;
LABEL_38:

      goto LABEL_33;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"set_routine_type"])
    {
      id v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"routine_type"];
      uint64_t v22 = REDailyRoutineTypeFromString(v5);
      id v23 = +[RESingleton sharedInstance];
      [v23 _setOverrideRoutineType:v22];

      dispatch_time_t v24 = dispatch_time(0, 1000000000);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_5;
      v28[3] = &unk_2644BCBC0;
      id v29 = *(id *)(a1 + 64);
      dispatch_after(v24, MEMORY[0x263EF83A0], v28);
      id v21 = v29;
      goto LABEL_38;
    }
    v25 = [v3 trainingManager];
    v26 = [v25 currentTrainingContext];

    if (v26)
    {
      if ([v26 performSimulationCommand:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 56)])
      {
        id v5 = 0;
LABEL_45:

        goto LABEL_32;
      }
      uint64_t v27 = 100;
    }
    else
    {
      uint64_t v27 = 3;
    }
    id v5 = RECreateErrorWithCode(v27);
    goto LABEL_45;
  }
  id v5 = [*(id *)(a1 + 40) _unavailableEngineWithNameError:*(void *)(a1 + 48)];
LABEL_32:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_33:
}

uint64_t __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_2()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_1 = result;
  return result;
}

uint64_t __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)availableRelevanceEngines:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = +[RESingleton sharedInstance];
  id v6 = [v5 availableEngines];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) name];
        [v4 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v3[2](v3, v4, 0);
}

- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__RETrainingSimulationCoordinator_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_2644BEC28;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RETrainingSimulationCoordinator *)self _accesssEngineWithName:v9 completion:v10];
}

void __90__RETrainingSimulationCoordinator_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [MEMORY[0x263EFF980] array];
  if (v9)
  {
    if ([v9 numberOfElementsInSection:@"defaultSectionIdentifier"])
    {
      unint64_t v4 = 0;
      do
      {
        id v5 = [[RESectionPath alloc] initWithSectionName:@"defaultSectionIdentifier" element:v4];
        id v6 = [v9 elementAtPath:v5];

        if (v6)
        {
          id v7 = [v6 identifier];
          [v3 addObject:v7];
        }
        ++v4;
      }
      while (v4 < [v9 numberOfElementsInSection:@"defaultSectionIdentifier"]);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) _unavailableEngineWithNameError:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__RETrainingSimulationCoordinator_fetchAllElementsInRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_2644BEC28;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(RETrainingSimulationCoordinator *)self _accesssEngineWithName:v9 completion:v10];
}

void __80__RETrainingSimulationCoordinator_fetchAllElementsInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [MEMORY[0x263EFF980] array];
  if (v13)
  {
    if ([v13 numberOfElementsInSection:@"defaultSectionIdentifier"])
    {
      unint64_t v4 = 0;
      do
      {
        id v5 = [[RESectionPath alloc] initWithSectionName:@"defaultSectionIdentifier" element:v4];
        id v6 = [v13 elementAtPath:v5];
        if (v6)
        {
          id v7 = [v13 dictionaryFromElement:v6];
          id v8 = (void *)[v7 mutableCopy];

          id v9 = [v13 predictionForElementAtPath:v5];
          uint64_t v10 = NSNumber;
          [v9 probability];
          id v11 = objc_msgSend(v10, "numberWithFloat:");
          [v8 setObject:v11 forKeyedSubscript:@"probability"];

          [v3 addObject:v8];
        }

        ++v4;
      }
      while (v4 < [v13 numberOfElementsInSection:@"defaultSectionIdentifier"]);
      id v12 = 0;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) _unavailableEngineWithNameError:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(RETrainingSimulationCoordinator *)self _engineWithName:a3];
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __85__RETrainingSimulationCoordinator_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke;
    v9[3] = &unk_2644BEC50;
    id v10 = v6;
    [v7 storeDiagnosticLogsToFile:v9];
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"RETrainingSimulationCoordinatorErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v8);
  }
}

void __85__RETrainingSimulationCoordinator_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSURL fileURLWithPath:a2];
  id v6 = 0;
  unint64_t v4 = [v3 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke;
  v14[3] = &unk_2644BECC8;
  id v15 = v9;
  id v16 = self;
  id v17 = v8;
  id v18 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  [(RETrainingSimulationCoordinator *)self _accesssEngineWithName:v11 completion:v14];
}

void __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke(uint64_t a1, void *a2)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = v3;
  if (!v3)
  {
    id v7 = [*(id *)(a1 + 40) _unavailableEngineWithNameError:*(void *)(a1 + 48)];
    goto LABEL_8;
  }
  if (![v3 numberOfElementsInSection:@"defaultSectionIdentifier"])
  {
LABEL_6:
    id v9 = [NSString stringWithFormat:@"Unable to find element with description %@", *(void *)(a1 + 32)];
    id v7 = RECreateErrorWithCodeAndMessage(4, v9);

LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = [[RESectionPath alloc] initWithSectionName:@"defaultSectionIdentifier" element:v5];
    id v7 = [v4 elementAtPath:v6];

    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v22[0] = @"REContentDescription1TextKey";
    v22[1] = @"REContentCLKDescription1TextKey";
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2;
    v15[3] = &unk_2644BEC78;
    id v16 = *(id *)(a1 + 32);
    id v17 = &v18;
    REEnumerateContentAttributesOfElement(v8, v7, v15);
    if (*((unsigned char *)v19 + 24)) {
      break;
    }

    _Block_object_dispose(&v18, 8);
    if (++v5 >= (unint64_t)[v4 numberOfElementsInSection:@"defaultSectionIdentifier"]) {
      goto LABEL_6;
    }
  }
  id v10 = [v7 action];
  id v11 = *(void **)(*(void *)(a1 + 40) + 24);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3;
  v13[3] = &unk_2644BECA0;
  id v14 = *(id *)(a1 + 56);
  id v12 = (void *)MEMORY[0x223C31700](v13);
  [v11 setObject:v12 forKey:v10];

  [v10 setForceExecution:1];
  [v10 setDelegate:*(void *)(a1 + 40)];
  [v10 _performWithContext:MEMORY[0x263EFFA78]];

  _Block_object_dispose(&v18, 8);
LABEL_9:
}

uint64_t __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = RECreateErrorWithCode(101);
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke;
  v12[3] = &unk_2644BECF0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(RETrainingSimulationCoordinator *)self _accesssEngineWithName:a3 completion:v12];
}

void __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[*(id *)(a1 + 32) mutableCopy];
  if (v3)
  {
    id v12 = [(REExportedValueEncoder *)[REJSONExportedValueEncoder alloc] initWithOptions:0];
    uint64_t v5 = +[REExportedValue exportedValueForObject:v3];
    while ([v4 count])
    {
      if ([v5 type] == 2 && objc_msgSend(v5, "propertyCount") == 1)
      {
        uint64_t v14 = 0;
        id v15 = &v14;
        uint64_t v16 = 0x3032000000;
        id v17 = __Block_byref_object_copy__13;
        uint64_t v18 = __Block_byref_object_dispose__13;
        id v19 = 0;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke_81;
        v13[3] = &unk_2644BC970;
        void v13[4] = &v14;
        [v5 enumerateValuesUsingBlock:v13];
        id v6 = (void *)v15[5];
        if (v6)
        {
          id v7 = v6;

          uint64_t v5 = v7;
        }
        _Block_object_dispose(&v14, 8);

        if (v6) {
          continue;
        }
      }
      id v8 = [v4 firstObject];
      [v4 removeObjectAtIndex:0];
      uint64_t v9 = [v5 exportedValueForKey:v8];

      uint64_t v5 = (void *)v9;
    }
    id v10 = [(REExportedValueEncoder *)v12 dataFromExportedValue:v5];
    id v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  }
  else
  {
    id v11 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v2 = +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)elementAction:(id)a3 didFinishTask:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__RETrainingSimulationCoordinator_elementAction_didFinishTask___block_invoke;
  block[3] = &unk_2644BDF28;
  void block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__RETrainingSimulationCoordinator_elementAction_didFinishTask___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 48));
    uint64_t v2 = (void *)v3;
  }
}

- (void)elementAction:(id)a3 wantsViewControllerDisplayed:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (UIKitLibraryCore())
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v7 = (void *)getUIWindowClass_softClass;
    uint64_t v15 = getUIWindowClass_softClass;
    if (!getUIWindowClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getUIWindowClass_block_invoke;
      v11[3] = &unk_2644BC768;
      v11[4] = &v12;
      __getUIWindowClass_block_invoke((uint64_t)v11);
      id v7 = (void *)v13[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v12, 8);
    id v9 = [v8 keyWindow];
    BOOL v10 = [v9 rootViewController];
    [v10 presentViewController:v6 animated:0 completion:0];
  }
}

- (BOOL)isActivelyTraining
{
  return self->_isActivelyTraining;
}

- (void)setIsActivelyTraining:(BOOL)a3
{
  self->_isActivelyTraining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_elementsAddedByEngine, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end