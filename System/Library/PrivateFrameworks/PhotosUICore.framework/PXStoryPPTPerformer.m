@interface PXStoryPPTPerformer
- (NSDictionary)testOptions;
- (NSMutableDictionary)extraResults;
- (NSString)configurationName;
- (NSString)currentTestName;
- (PXAsyncIterator)configurationIterator;
- (PXPPTDelegate)delegate;
- (PXStoryExportManager)exportManager;
- (PXStoryModel)observedModel;
- (PXStoryPPTPerformer)init;
- (PXStoryPPTPerformer)initWithDelegate:(id)a3 testOptions:(id)a4;
- (PXStoryPPTResultsAggregate)resultsAggregate;
- (PXStoryPlayerTestElement)testElement;
- (double)currentTestTimeout;
- (id)_configurationSpecificSubtestName:(id)a3;
- (id)_mainScrollViewInTungstenView:(id)a3;
- (id)_tungstenViewFromStoryPlayerTestElement:(id)a3;
- (id)_viewModelForPlayerTestElement:(id)a3;
- (id)playbackEndHandler;
- (id)playbackReadyToPlayHandler;
- (int64_t)currentTestIterations;
- (void)_callPlaybackEndHandlerIfNeeded;
- (void)_callPlaybackReadyToPlayHandlerIfNeeded;
- (void)_cleanUpPlaybackTest;
- (void)_exportWithTestElement:(id)a3 atResolution:(CGSize)a4 completion:(id)a5;
- (void)_finalize;
- (void)_installPlaybackEndHandler:(id)a3;
- (void)_installPlaybackReadyToPlayHandler:(id)a3;
- (void)_pausePlaybackWithTestElement:(id)a3;
- (void)_preparePlaybackTestWithElement:(id)a3;
- (void)_produceTimelineForViewConfiguration:(id)a3 recipeManagerWithProducedRecipe:(id)a4 initialCompletionHandler:(id)a5 finalCompletionHandler:(id)a6;
- (void)_requestRecipeForViewConfiguration:(id)a3 resultHandler:(id)a4;
- (void)_runScrollSubtestOnScrollView:(id)a3 containedInTungstenView:(id)a4 completion:(id)a5;
- (void)_runScrubbingSubtestWithTestElement:(id)a3 direction:(int64_t)a4 subtestName:(id)a5 completion:(id)a6;
- (void)_runScrubbingSubtestsWithTestElement:(id)a3 completion:(id)a4;
- (void)_skipToSegmentWithTestElement:(id)a3 direction:(int64_t)a4 completion:(id)a5;
- (void)enumerateFeedConfigurationsUsingBlock:(id)a3 completion:(id)a4;
- (void)enumerateStoryConfigurationsUsingBlock:(id)a3 completion:(id)a4;
- (void)finishSubtestWithName:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)runExportTestWithElement:(id)a3 completion:(id)a4;
- (void)runFeedScrollingTestWithElement:(id)a3 completion:(id)a4;
- (void)runPlaybackStartTestWithElement:(id)a3 completion:(id)a4;
- (void)runPlaybackTestWithElement:(id)a3 completion:(id)a4;
- (void)runRecipeProductionTestWithViewConfiguration:(id)a3 completion:(id)a4;
- (void)runScrollingWithTestElement:(id)a3 completion:(id)a4;
- (void)runScrubbingTestWithElement:(id)a3 completion:(id)a4;
- (void)runTimelineProductionTestWithViewConfiguration:(id)a3 completion:(id)a4;
- (void)setConfigurationIterator:(id)a3;
- (void)setConfigurationName:(id)a3;
- (void)setExportManager:(id)a3;
- (void)setObservedModel:(id)a3;
- (void)setPlaybackEndHandler:(id)a3;
- (void)setPlaybackReadyToPlayHandler:(id)a3;
- (void)setTestElement:(id)a3;
- (void)startSubtestWithName:(id)a3 metrics:(id)a4;
@end

@implementation PXStoryPPTPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportManager, 0);
  objc_storeStrong(&self->_playbackEndHandler, 0);
  objc_storeStrong(&self->_playbackReadyToPlayHandler, 0);
  objc_storeStrong((id *)&self->_observedModel, 0);
  objc_storeStrong((id *)&self->_testElement, 0);
  objc_destroyWeak((id *)&self->_configurationIterator);
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_storeStrong((id *)&self->_extraResults, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultsAggregate, 0);
}

- (void)setExportManager:(id)a3
{
}

- (PXStoryExportManager)exportManager
{
  return self->_exportManager;
}

- (void)setPlaybackEndHandler:(id)a3
{
}

- (id)playbackEndHandler
{
  return self->_playbackEndHandler;
}

- (void)setPlaybackReadyToPlayHandler:(id)a3
{
}

- (id)playbackReadyToPlayHandler
{
  return self->_playbackReadyToPlayHandler;
}

- (PXStoryModel)observedModel
{
  return self->_observedModel;
}

- (void)setTestElement:(id)a3
{
}

- (PXStoryPlayerTestElement)testElement
{
  return self->_testElement;
}

- (void)setConfigurationIterator:(id)a3
{
}

- (PXAsyncIterator)configurationIterator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationIterator);
  return (PXAsyncIterator *)WeakRetained;
}

- (void)setConfigurationName:(id)a3
{
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (NSMutableDictionary)extraResults
{
  return self->_extraResults;
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (PXPPTDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPPTDelegate *)WeakRetained;
}

- (void)_runScrollSubtestOnScrollView:(id)a3 containedInTungstenView:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(PXStoryPPTPerformer *)self currentTestName];
  v12 = [(PXStoryPPTPerformer *)self configurationName];
  v13 = [(PXStoryPPTPerformer *)self delegate];
  v14 = [(PXStoryPPTPerformer *)self testOptions];
  v15 = [(PXStoryPPTPerformer *)self _configurationSpecificSubtestName:@"Scrolling"];
  [(PXStoryPPTPerformer *)self startSubtestWithName:@"Scrolling" metrics:&unk_1F02D53E0];
  objc_msgSend(v8, "ppt_prepareForTest:withOptions:isScrollTest:", v11, v14, 1);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke;
  v21[3] = &unk_1E5DC7BA0;
  id v22 = v8;
  id v23 = v11;
  v24 = self;
  v25 = @"Scrolling";
  id v26 = v12;
  id v27 = v13;
  id v28 = v9;
  id v16 = v9;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v8;
  [v17 runScrollTestOnScrollView:v10 withOptions:v14 subTestName:v15 completion:v21];
}

void __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = objc_msgSend(v5, "ppt_extraResults");
  id v8 = (void *)[v6 mutableCopy];

  [v8 addEntriesFromDictionary:v7];
  objc_msgSend(*(id *)(a1 + 32), "ppt_cleanUpAfterTest:isScrollTest:", *(void *)(a1 + 40), 1);
  if (a2)
  {
    [*(id *)(a1 + 48) finishSubtestWithName:*(void *)(a1 + 56)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke_2;
    v12[3] = &unk_1E5DCD770;
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 48);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    [*(id *)(a1 + 72) failedTest:*(void *)(a1 + 40), @"Scrolling failure, results %@", v8 withFailureFormat];
  }
  uint64_t v11 = *(void *)(a1 + 80);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
  }
}

void __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = NSString;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v9 = [v5 stringWithFormat:@"sub:%@:%@", v6, a2];
  id v8 = [*(id *)(a1 + 40) extraResults];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (id)_mainScrollViewInTungstenView:(id)a3
{
  return (id)[a3 diagnosticsMainScrollView];
}

- (id)_viewModelForPlayerTestElement:(id)a3
{
  v3 = [a3 storyView];
  v4 = [v3 viewModel];

  return v4;
}

- (int64_t)currentTestIterations
{
  v2 = [(PXStoryPPTPerformer *)self testOptions];
  v3 = [v2 objectForKeyedSubscript:@"iterations"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (double)currentTestTimeout
{
  v2 = [(PXStoryPPTPerformer *)self testOptions];
  v3 = [v2 objectForKeyedSubscript:@"timeoutInSeconds"];

  if (!v3) {
    PXAssertGetLog();
  }
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NSString)currentTestName
{
  v2 = [(PXStoryPPTPerformer *)self testOptions];
  v3 = [v2 objectForKeyedSubscript:@"testName"];

  return (NSString *)v3;
}

- (void)_pausePlaybackWithTestElement:(id)a3
{
  id v3 = [(PXStoryPPTPerformer *)self _viewModelForPlayerTestElement:a3];
  [v3 performChanges:&__block_literal_global_230065];
}

uint64_t __53__PXStoryPPTPerformer__pausePlaybackWithTestElement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ObservedModelObservationContext != a5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryPPTPerformer.m" lineNumber:658 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v11 = v9;
  if ((a4 & 0x200000) != 0)
  {
    [(PXStoryPPTPerformer *)self _callPlaybackReadyToPlayHandlerIfNeeded];
    id v9 = v11;
  }
  if ((a4 & 0x40000000000) != 0)
  {
    [(PXStoryPPTPerformer *)self _callPlaybackEndHandlerIfNeeded];
    id v9 = v11;
  }
}

- (void)runFeedScrollingTestWithElement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "ppt_scrollView");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v8, "px_ancestorViewOfClass:", objc_opt_class());
  [(PXStoryPPTPerformer *)self _runScrollSubtestOnScrollView:v8 containedInTungstenView:v7 completion:v6];
}

- (void)enumerateFeedConfigurationsUsingBlock:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[PXStorySettings sharedInstance];
  uint64_t v10 = [(PXStoryPPTPerformer *)self testOptions];
  id v11 = +[PXFeedPPTConfiguration configurationsForPreset:v9 testOptions:v10];

  v12 = [(PXStoryPPTPerformer *)self currentTestName];
  id v13 = [(PXStoryPPTPerformer *)self delegate];
  [v13 startedTest:v12];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 1;
  uint64_t v14 = [(PXStoryPPTPerformer *)self configurationIterator];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXStoryPPTPerformer.m" lineNumber:613 description:@"nested configuration enumeration isn't supported yet"];
  }
  [v11 count];
  v11;
  v7;
  v13;
  v12;
  v8;
  PXIterateAsynchronously();
}

void __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setConfigurationIterator:v3];
  double v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  double v5 = [v4 name];
  [*(id *)(a1 + 32) setConfigurationName:v5];

  id v6 = [v4 feedConfiguration];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke_2;
  v11[3] = &unk_1E5DD3608;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v12 = v3;
  uint64_t v13 = v7;
  uint64_t v9 = *(void (**)(uint64_t, void *, void *))(v8 + 16);
  id v10 = v3;
  v9(v8, v6, v11);
}

uint64_t __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfigurationIterator:0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 32) _finalize];
    id v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 48);
    double v4 = [*(id *)(a1 + 32) extraResults];
    [v3 finishedTest:v2 extraResults:v4];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) next];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return [*(id *)(a1 + 32) stop];
}

- (void)_produceTimelineForViewConfiguration:(id)a3 recipeManagerWithProducedRecipe:(id)a4 initialCompletionHandler:(id)a5 finalCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  id v32 = a6;
  id v12 = [v10 configuration];
  uint64_t v13 = [v12 timelineProducer];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v16 = v15;

  char v17 = [[PXStoryResourcesDataSourceManager alloc] initWithRecipeManager:v11];
  id v18 = [PXStoryStyleManager alloc];
  id v19 = [v12 errorReporter];
  id v20 = [(PXStoryStyleManager *)v18 initWithRecipeManager:v11 errorReporter:v19];

  v21 = [PXStoryTimelineSpecManager alloc];
  id v22 = [v10 extendedTraitCollection];
  id v23 = [(PXStoryTimelineSpecManager *)v21 initWithExtendedTraitCollection:v22 configuration:v12];

  v24 = [PXStoryTimelineManager alloc];
  v25 = [v12 errorReporter];
  id v26 = [(PXStoryTimelineManager *)v24 initWithTimelineProducer:v16 resourcesDataSourceManager:v17 styleManager:v20 specManager:v23 loadingCoordinator:0 errorReporter:v25 options:0 paperTrailOptions:0];

  [(PXStoryPPTPerformer *)self currentTestTimeout];
  double v28 = v27;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke;
  v35[3] = &unk_1E5DC7B50;
  v38 = v42;
  id v29 = v31;
  id v36 = v29;
  v39 = v40;
  id v37 = v32;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke_2;
  v33[3] = &unk_1E5DD3128;
  id v30 = v37;
  id v34 = v30;
  [(PXObservable *)v26 pxStory_enumerateStatesWithTimeout:3 watchingChanges:v35 usingBlock:v33 timeoutHandler:v28];

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

void __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  double v5 = [v10 timeline];
  id v6 = v10;
  uint64_t v7 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    if ([v5 numberOfSegments])
    {
      (*(void (**)(void))(a1[4] + 16))();
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"initially delivered timeline is unexpectedly empty");
      (*(void (**)(void))(a1[4] + 16))();
      *a3 = 1;
    }
    id v6 = v10;
  }
  if ([v6 isTimelineFinal])
  {
    uint64_t v9 = *(void *)(a1[7] + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      (*(void (**)(void))(a1[5] + 16))();
      *a3 = 1;
    }
  }
}

void __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"timed out");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)runTimelineProductionTestWithViewConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PXStoryPPTPerformer *)self currentTestName];
  objc_claimAutoreleasedReturnValue();
  [(PXStoryPPTPerformer *)self currentTestIterations];
  [(PXStoryPPTPerformer *)self delegate];
  objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6;
  v7;
  PXIterateAsynchronously();
}

void __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v5 = *(void **)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_2;
  v8[3] = &unk_1E5DC7B00;
  void v8[4] = v5;
  id v9 = v4;
  long long v10 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v3;
  uint64_t v12 = v6;
  id v7 = v3;
  [v5 _requestRecipeForViewConfiguration:v9 resultHandler:v8];
}

uint64_t __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != *(void *)(a1 + 64)) {
    [*(id *)(a1 + 32) failedTest:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [v6 recipe];
  if (v8)
  {
    [*(id *)(a1 + 32) startSubtestWithName:@"totalTimeBetweenRecipeAndDeliveredTimeline" metrics:&unk_1F02D5398];
    [*(id *)(a1 + 32) startSubtestWithName:@"timeBetweenRecipeAndDeliveredInitialTimeline" metrics:&unk_1F02D53B0];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_3;
    v20[3] = &unk_1E5DC7AB0;
    v20[4] = v9;
    long long v21 = *(_OWORD *)(a1 + 48);
    id v22 = *(id *)(a1 + 64);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_4;
    void v16[3] = &unk_1E5DC7AD8;
    uint64_t v12 = *(void **)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    v16[4] = *(void *)(a1 + 32);
    uint64_t v19 = v11;
    id v17 = v12;
    long long v18 = *(_OWORD *)(a1 + 48);
    [v9 _produceTimelineForViewConfiguration:v10 recipeManagerWithProducedRecipe:v6 initialCompletionHandler:v20 finalCompletionHandler:v16];
  }
  else
  {
    uint64_t v14 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v15 = [v7 localizedDescription];
    [v14 failedTest:v13, @"recipe production failed: %@", v15 withFailureFormat];
  }
}

uint64_t __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    [*(id *)(a1 + 32) finishSubtestWithName:@"timeBetweenRecipeAndDeliveredInitialTimeline"];
    double v4 = *(void **)(a1 + 32);
    return [v4 startSubtestWithName:@"timeBetweenRecipeAndDeliveredFinalTimeline" metrics:&unk_1F02D53C8];
  }
  else
  {
    [*(id *)(a1 + 40) failedTest:*(void *)(a1 + 48), @"failed to produce initial timeline: %@", a3 withFailureFormat];
    id v6 = *(void **)(a1 + 56);
    return [v6 stop];
  }
}

uint64_t __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    [*(id *)(a1 + 32) finishSubtestWithName:@"timeBetweenRecipeAndDeliveredFinalTimeline"];
    [*(id *)(a1 + 32) finishSubtestWithName:@"totalTimeBetweenRecipeAndDeliveredTimeline"];
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    double v4 = *(void **)(a1 + 40);
    return [v4 next];
  }
  else
  {
    [*(id *)(a1 + 48) failedTest:*(void *)(a1 + 56), @"failed to produce final timeline: %@", a3 withFailureFormat];
    id v6 = *(void **)(a1 + 40);
    return [v6 stop];
  }
}

- (void)_requestRecipeForViewConfiguration:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [PXStoryRecipeManager alloc];
  id v9 = [v6 configuration];
  uint64_t v10 = [(PXStoryRecipeManager *)v8 initWithConfiguration:v9];

  [(PXStoryPPTPerformer *)self currentTestTimeout];
  double v12 = v11;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__230121;
  v26[4] = __Block_byref_object_dispose__230122;
  id v27 = 0;
  uint64_t v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke;
  v23[3] = &unk_1E5DC7A88;
  v25 = v26;
  v24 = v13;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_2;
  v21[3] = &unk_1E5DD36F8;
  uint64_t v14 = v24;
  id v22 = v14;
  [(PXObservable *)v10 pxStory_enumerateStatesWithTimeout:3 watchingChanges:v23 usingBlock:v21 timeoutHandler:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_3;
  v17[3] = &unk_1E5DCA938;
  long long v18 = v10;
  id v19 = v7;
  id v20 = v26;
  id v15 = v7;
  id v16 = v10;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], v17);

  _Block_object_dispose(v26, 8);
}

void __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ([v8 isRecipeFinal])
  {
    uint64_t v5 = [v8 resultsByComponent];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_2(uint64_t a1)
{
}

void __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRecipeFinal]
    && ([*(id *)(a1 + 32) recipe], id v2 = objc_claimAutoreleasedReturnValue(),
                                                  v2,
                                                  !v2))
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"failed to produce final recipe");
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)runRecipeProductionTestWithViewConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXStoryPPTPerformer *)self resultsAggregate];
  id v9 = [(PXStoryPPTPerformer *)self configurationName];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke;
  v14[3] = &unk_1E5DC7A60;
  uint64_t v19 = v10;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v18 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v8;
  [(PXStoryPPTPerformer *)self _requestRecipeForViewConfiguration:v7 resultHandler:v14];
}

void __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a2;
  [v9 timeIntervalSinceReferenceDate];
  double v12 = v11;
  double v13 = *(double *)(a1 + 64);
  uint64_t v14 = [v10 recipe];

  if (v14)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke_2;
    v18[3] = &unk_1E5DC7A38;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    [v7 enumerateKeysAndObjectsUsingBlock:v18];
    [*(id *)(a1 + 32) addValue:1 metric:@"Recipe:Total" forMeasure:*(void *)(a1 + 40) configuration:v12 - v13];
  }
  else
  {
    id v15 = [*(id *)(a1 + 48) delegate];
    id v16 = [*(id *)(a1 + 48) currentTestName];
    id v17 = [v8 localizedDescription];
    [v15 failedTest:v16, @"recipe production failed: %@", v17 withFailureFormat];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v11 = (id)[[v5 alloc] initWithFormat:@"Recipe:%@", v7];

  id v8 = *(void **)(a1 + 32);
  [v6 productionDuration];
  double v10 = v9;

  [v8 addValue:1 metric:v11 forMeasure:*(void *)(a1 + 40) configuration:v10];
}

- (void)_exportWithTestElement:(id)a3 atResolution:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(PXStoryExportVideoOptions);
  [(PXStoryExportVideoOptions *)v11 setFrameRate:30];
  -[PXStoryExportVideoOptions setResolution:](v11, "setResolution:", width, height);
  double v12 = objc_alloc_init(PXStoryExportManager);
  [(PXStoryExportManager *)v12 setQualityOfService:25];
  double v13 = [v10 storyView];

  uint64_t v14 = [v13 viewModel];
  id v15 = [v14 mainConfiguration];
  id v16 = (void *)[v15 copy];

  [v16 setSongsProducerKind:1];
  id v17 = [[PXStoryExportConfiguration alloc] initWithConfiguration:v16 videoOptions:v11];
  id v18 = NSString;
  id v19 = [(PXStoryPPTPerformer *)self currentTestName];
  id v20 = [(PXStoryPPTPerformer *)self configurationName];
  long long v21 = [v18 stringWithFormat:@"%@-%@.mov", v19, v20];

  id v22 = (void *)MEMORY[0x1E4F1CB10];
  id v23 = NSTemporaryDirectory();
  v24 = [v22 fileURLWithPath:v23];
  v25 = [v24 URLByAppendingPathComponent:v21];

  [(PXStoryPPTPerformer *)self setExportManager:v12];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke;
  v29[3] = &unk_1E5DD1B00;
  v29[4] = self;
  id v30 = v25;
  id v31 = v9;
  id v26 = v9;
  id v27 = v25;
  id v28 = [(PXStoryExportManager *)v12 requestExportWithDestinationURL:v27 configuration:v17 progressHandler:0 completionHandler:v29];
}

void __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setExportManager:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke_2;
  block[3] = &unk_1E5DC7A10;
  char v13 = a2;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v7 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64))
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  id v2 = [*(id *)(a1 + 32) testOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"keepFiles"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = NSString;
    id v6 = [*(id *)(a1 + 40) path];
    id v7 = [v5 stringWithFormat:@"exportPath:%@", v6];

    id v8 = [*(id *)(a1 + 32) extraResults];
    [v8 setObject:&unk_1F02D9760 forKeyedSubscript:v7];

    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_5:
    v9();
    return;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [*(id *)(a1 + 40) path];
  [v11 removeItemAtPath:v10 error:0];
}

- (void)runExportTestWithElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXStoryPPTPerformer *)self delegate];
  id v9 = [(PXStoryPPTPerformer *)self currentTestName];
  id v10 = [(PXStoryPPTPerformer *)self testOptions];
  id v11 = [v10 objectForKeyedSubscript:@"exportOrientation"];

  int v12 = [v11 isEqualToString:@"landscape"];
  if (v12) {
    double v13 = 1080.0;
  }
  else {
    double v13 = 1920.0;
  }
  if (v12) {
    double v14 = 1920.0;
  }
  else {
    double v14 = 1080.0;
  }
  [(PXStoryPPTPerformer *)self _preparePlaybackTestWithElement:v6];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke;
  v19[3] = &unk_1E5DC79E8;
  v19[4] = self;
  id v20 = v6;
  double v24 = v14;
  double v25 = v13;
  id v21 = v8;
  id v22 = v9;
  id v23 = v7;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v18 = v6;
  [(PXStoryPPTPerformer *)self _installPlaybackReadyToPlayHandler:v19];
}

void __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _pausePlaybackWithTestElement:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) startSubtestWithName:@"Export" metrics:&unk_1F02D5380];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke_2;
  v4[3] = &unk_1E5DD1B28;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_exportWithTestElement:atResolution:completion:", v3, v4, *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishSubtestWithName:@"Export"];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) configurationName];
    [v6 failedTest:v5, @"failure for configuration %@ error %@", v7, v9 withFailureFormat];
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
}

- (id)_tungstenViewFromStoryPlayerTestElement:(id)a3
{
  uint64_t v3 = [a3 storyView];
  int v4 = [v3 tungstenView];

  return v4;
}

- (void)runScrollingWithTestElement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PXStoryPPTPerformer *)self _pausePlaybackWithTestElement:v7];
  id v9 = [(PXStoryPPTPerformer *)self _tungstenViewFromStoryPlayerTestElement:v7];

  uint64_t v8 = [(PXStoryPPTPerformer *)self _mainScrollViewInTungstenView:v9];
  [(PXStoryPPTPerformer *)self _runScrollSubtestOnScrollView:v8 containedInTungstenView:v9 completion:v6];
}

- (void)_skipToSegmentWithTestElement:(id)a3 direction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  id v10 = [(PXStoryPPTPerformer *)self _viewModelForPlayerTestElement:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke;
  v15[3] = &unk_1E5DC79C0;
  v15[4] = v16;
  v15[5] = a4;
  [v10 performChanges:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke_2;
  v12[3] = &unk_1E5DD35B8;
  id v13 = v9;
  double v14 = v16;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  _Block_object_dispose(v16, 8);
}

uint64_t __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 skipToSegmentWithOffset:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)_runScrubbingSubtestWithTestElement:(id)a3 direction:(int64_t)a4 subtestName:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v9;
  v8;
  v10;
  PXIterateAsynchronously();
}

void __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startSubtestWithName:*(void *)(a1 + 40) metrics:&unk_1F02D5368];
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke_2;
  v10[3] = &unk_1E5DC7970;
  v10[4] = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v3;
  uint64_t v13 = v8;
  id v11 = v7;
  id v9 = v3;
  [v4 _skipToSegmentWithTestElement:v6 direction:v5 completion:v10];
}

uint64_t __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 4)
  {
    id v2 = PLStoryGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v5 = 134218240;
      uint64_t v6 = v3;
      __int16 v7 = 2048;
      uint64_t v8 = 5;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "scrubbing test failed because number of skips (%ti) is too low (minimum: %ti)", (uint8_t *)&v5, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke_2(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) finishSubtestWithName:*(void *)(a1 + 40)];
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v4 = *(void **)(a1 + 48);
    return [v4 next];
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 48);
    return [v6 stop];
  }
}

- (void)_runScrubbingSubtestsWithTestElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PXStoryPPTPerformer__runScrubbingSubtestsWithTestElement_completion___block_invoke;
  v10[3] = &unk_1E5DC7948;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(PXStoryPPTPerformer *)self _runScrubbingSubtestWithTestElement:v8 direction:1 subtestName:@"SkipNext-Latency" completion:v10];
}

uint64_t __71__PXStoryPPTPerformer__runScrubbingSubtestsWithTestElement_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _runScrubbingSubtestWithTestElement:*(void *)(a1 + 40) direction:-1 subtestName:@"SkipPrevious-Latency" completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)runScrubbingTestWithElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXStoryPPTPerformer *)self delegate];
  id v9 = [(PXStoryPPTPerformer *)self currentTestName];
  if (v6)
  {
    int64_t v10 = [(PXStoryPPTPerformer *)self currentTestIterations];
    [(PXStoryPPTPerformer *)self _preparePlaybackTestWithElement:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke;
    v11[3] = &unk_1E5DC89D0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v8;
    id v14 = v9;
    int64_t v16 = v10;
    id v15 = v7;
    [(PXStoryPPTPerformer *)self _installPlaybackReadyToPlayHandler:v11];
  }
  else
  {
    [v8 failedTest:v9 withFailureFormat:@"Missing PXStoryPlayerTestElement."];
  }
}

void __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _pausePlaybackWithTestElement:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_2;
  v6[3] = &unk_1E5DC89D0;
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 64);
  dispatch_after(v2, MEMORY[0x1E4F14428], v6);
}

void __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_2(id *a1)
{
  [a1[4] startedTest:a1[5]];
  v2[0] = 0;
  v2[1] = v2;
  v2[2] = 0x2020000000;
  char v3 = 1;
  a1[7];
  a1[4];
  a1[5];
  a1[8];
  PXIterateAsynchronously();
}

void __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_4;
  v8[3] = &unk_1E5DD3608;
  uint64_t v6 = a1[6];
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v4 _runScrubbingSubtestsWithTestElement:v5 completion:v8];
}

uint64_t __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_5(void *a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  if (v2) {
    [v3 finishedTest:v4];
  }
  else {
    [v3 failedTest:v4];
  }
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_4(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) next];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return [*(id *)(a1 + 32) stop];
}

- (void)setObservedModel:(id)a3
{
  uint64_t v5 = (PXStoryModel *)a3;
  observedModel = self->_observedModel;
  if (observedModel != v5)
  {
    id v7 = v5;
    [(PXStoryModel *)observedModel unregisterChangeObserver:self context:ObservedModelObservationContext];
    objc_storeStrong((id *)&self->_observedModel, a3);
    [(PXStoryModel *)self->_observedModel registerChangeObserver:self context:ObservedModelObservationContext];
    uint64_t v5 = v7;
  }
}

- (void)_cleanUpPlaybackTest
{
}

- (void)_callPlaybackEndHandlerIfNeeded
{
  id v3 = [(PXStoryPPTPerformer *)self observedModel];
  int v4 = [v3 isAtPlaybackEnd];

  if (v4)
  {
    uint64_t v5 = [(PXStoryPPTPerformer *)self playbackEndHandler];
    if (v5)
    {
      [(PXStoryPPTPerformer *)self setPlaybackEndHandler:0];
      v5[2]();
    }
  }
}

- (void)_installPlaybackEndHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryPPTPerformer *)self playbackEndHandler];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__PXStoryPPTPerformer__installPlaybackEndHandler___block_invoke;
  id v11 = &unk_1E5DCC5D0;
  id v12 = v5;
  id v13 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PXStoryPPTPerformer *)self setPlaybackEndHandler:&v8];
  [(PXStoryPPTPerformer *)self _callPlaybackEndHandlerIfNeeded];
}

uint64_t __50__PXStoryPPTPerformer__installPlaybackEndHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_callPlaybackReadyToPlayHandlerIfNeeded
{
  id v3 = [(PXStoryPPTPerformer *)self observedModel];
  uint64_t v4 = [v3 readinessStatus];

  if (v4 == 3)
  {
    uint64_t v5 = [(PXStoryPPTPerformer *)self playbackReadyToPlayHandler];
    if (v5)
    {
      [(PXStoryPPTPerformer *)self setPlaybackReadyToPlayHandler:0];
      v5[2]();
    }
  }
}

- (void)_installPlaybackReadyToPlayHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(PXStoryPPTPerformer *)self testElement];

  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = NSStringFromSelector(a2);
    id v11 = NSStringFromSelector(sel__preparePlaybackTestWithElement_);
    [v9 handleFailureInMethod:a2, self, @"PXStoryPPTPerformer.m", 229, @"%@ called without previous call to %@", v10, v11 object file lineNumber description];
  }
  id v7 = [(PXStoryPPTPerformer *)self testElement];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke;
  v12[3] = &unk_1E5DD3280;
  void v12[4] = self;
  id v13 = v5;
  id v8 = v5;
  [v7 installViewDidLoadHandler:v12];
}

void __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playbackReadyToPlayHandler];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke_2;
  id v8 = &unk_1E5DCC5D0;
  id v9 = v2;
  id v10 = *(id *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v4 = v2;
  [v3 setPlaybackReadyToPlayHandler:&v5];
  objc_msgSend(*(id *)(a1 + 32), "_callPlaybackReadyToPlayHandlerIfNeeded", v5, v6, v7, v8);
}

uint64_t __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_preparePlaybackTestWithElement:(id)a3
{
  id v4 = a3;
  [(PXStoryPPTPerformer *)self setTestElement:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PXStoryPPTPerformer__preparePlaybackTestWithElement___block_invoke;
  v6[3] = &unk_1E5DD32A8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 installViewDidLoadHandler:v6];
}

void __55__PXStoryPPTPerformer__preparePlaybackTestWithElement___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _viewModelForPlayerTestElement:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 mainModel];
  [*(id *)(a1 + 32) setObservedModel:v2];
}

- (void)runPlaybackTestWithElement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(PXStoryPPTPerformer *)self _preparePlaybackTestWithElement:a3];
  id v7 = [(PXStoryPPTPerformer *)self currentTestName];
  id v8 = [(PXStoryPPTPerformer *)self _configurationSpecificSubtestName:@"Playback"];
  id v9 = [(PXStoryPPTPerformer *)self delegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke;
  v14[3] = &unk_1E5DC78D0;
  id v15 = v9;
  id v16 = v7;
  char v17 = self;
  id v18 = v8;
  id v19 = v6;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  [(PXStoryPPTPerformer *)self _installPlaybackReadyToPlayHandler:v14];
}

void __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke(id *a1)
{
  [a1[4] startedTest:a1[5]];
  [a1[6] startSubtestWithName:a1[7] metrics:&unk_1F02D5350];
  id v2 = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke_2;
  v3[3] = &unk_1E5DC78D0;
  v3[4] = v2;
  id v4 = a1[7];
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[8];
  [v2 _installPlaybackEndHandler:v3];
}

uint64_t __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishSubtestWithName:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) finishedTest:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) _cleanUpPlaybackTest];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (void)runPlaybackStartTestWithElement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(PXStoryPPTPerformer *)self _preparePlaybackTestWithElement:a3];
  id v7 = [(PXStoryPPTPerformer *)self currentTestName];
  id v8 = [(PXStoryPPTPerformer *)self delegate];
  [v8 startedTest:v7];
  [(PXStoryPPTPerformer *)self startSubtestWithName:@"PlaybackStart" metrics:&unk_1F02D5338];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke;
  v12[3] = &unk_1E5DC78D0;
  void v12[4] = self;
  id v13 = @"PlaybackStart";
  id v14 = v8;
  id v15 = v7;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  [(PXStoryPPTPerformer *)self _installPlaybackReadyToPlayHandler:v12];
}

void __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishSubtestWithName:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) finishedTest:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) _cleanUpPlaybackTest];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke_2;
  block[3] = &unk_1E5DD3128;
  id v3 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_configurationSpecificSubtestName:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(PXStoryPPTPerformer *)self configurationName];
  id v8 = (void *)[v6 initWithFormat:@"%@-%@", v5, v7];

  return v8;
}

- (void)finishSubtestWithName:(id)a3
{
  id v11 = a3;
  id v4 = [(PXStoryPPTPerformer *)self delegate];
  id v5 = [(PXStoryPPTPerformer *)self currentTestName];
  [v4 finishedSubTest:v11 forTest:v5];

  id v6 = [(PXStoryPPTPerformer *)self configurationIterator];
  unint64_t v7 = [v6 count];

  if (v7 < 2)
  {
    id v8 = [(PXStoryPPTPerformer *)self delegate];
    id v9 = [(PXStoryPPTPerformer *)self currentTestName];
    [v8 finishedSubTest:v11 forTest:v9];
  }
  else
  {
    id v8 = [(PXStoryPPTPerformer *)self _configurationSpecificSubtestName:v11];
    id v9 = [(PXStoryPPTPerformer *)self delegate];
    id v10 = [(PXStoryPPTPerformer *)self currentTestName];
    [v9 finishedSubTest:v8 forTest:v10];
  }
}

- (void)startSubtestWithName:(id)a3 metrics:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  unint64_t v7 = [(PXStoryPPTPerformer *)self delegate];
  id v8 = [(PXStoryPPTPerformer *)self currentTestName];
  [v7 startedSubTest:v14 forTest:v8 withMetrics:v6];

  id v9 = [(PXStoryPPTPerformer *)self configurationIterator];
  unint64_t v10 = [v9 count];

  if (v10 < 2)
  {
    id v11 = [(PXStoryPPTPerformer *)self delegate];
    id v12 = [(PXStoryPPTPerformer *)self currentTestName];
    [v11 startedSubTest:v14 forTest:v12 withMetrics:v6];
  }
  else
  {
    id v11 = [(PXStoryPPTPerformer *)self _configurationSpecificSubtestName:v14];
    id v12 = [(PXStoryPPTPerformer *)self delegate];
    id v13 = [(PXStoryPPTPerformer *)self currentTestName];
    [v12 startedSubTest:v11 forTest:v13 withMetrics:v6];
  }
}

- (void)enumerateStoryConfigurationsUsingBlock:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[PXStorySettings sharedInstance];
  uint64_t v10 = [v9 currentPPTPreset];
  uint64_t v11 = [v9 currentPPTSubpreset];
  id v12 = [(PXStoryPPTPerformer *)self testOptions];
  id v13 = +[PXStoryPPTConfiguration configurationsForPreset:v10 subpreset:v11 testOptions:v12];

  id v14 = [(PXStoryPPTPerformer *)self currentTestName];
  id v15 = [(PXStoryPPTPerformer *)self delegate];
  [v15 startedTest:v14];

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 1;
  id v16 = [(PXStoryPPTPerformer *)self configurationIterator];

  if (v16)
  {
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXStoryPPTPerformer.m" lineNumber:116 description:@"nested configuration enumeration isn't supported yet"];
  }
  [v13 count];
  v13;
  id v18 = v14;
  v7;
  v18;
  v8;
  PXIterateAsynchronously();
}

void __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setConfigurationIterator:v3];
  id v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  id v5 = [v4 name];
  [*(id *)(a1 + 32) setConfigurationName:v5];

  id v6 = [*(id *)(a1 + 32) testOptions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_2;
  v11[3] = &unk_1E5DC7880;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v13 = v4;
  id v14 = v3;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  id v10 = v4;
  [v10 requestStoryConfigurationWithOptions:v6 resultHandler:v11];
}

uint64_t __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfigurationIterator:0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 32) _finalize];
    id v2 = [*(id *)(a1 + 32) delegate];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) extraResults];
    [v2 finishedTest:v3 extraResults:v4];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_3;
    v11[3] = &unk_1E5DD3608;
    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 72);
    id v12 = v5;
    uint64_t v13 = v6;
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, a2, v11);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) name];
    [v7 failedTest:v8, @"Unable to create story configuration for %@", v9 withFailureFormat];

    id v10 = *(void **)(a1 + 56);
    [v10 stop];
  }
}

uint64_t __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) next];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return [*(id *)(a1 + 32) stop];
}

- (void)_finalize
{
  resultsAggregate = self->_resultsAggregate;
  if (resultsAggregate)
  {
    uint64_t v4 = resultsAggregate;
    id v6 = [(PXStoryPPTPerformer *)self extraResults];
    id v5 = [(PXStoryPPTResultsAggregate *)v4 extraResultsDictionaryRepresentation];

    [v6 addEntriesFromDictionary:v5];
  }
}

- (PXStoryPPTResultsAggregate)resultsAggregate
{
  resultsAggregate = self->_resultsAggregate;
  if (!resultsAggregate)
  {
    uint64_t v4 = objc_alloc_init(PXStoryPPTResultsAggregate);
    id v5 = self->_resultsAggregate;
    self->_resultsAggregate = v4;

    resultsAggregate = self->_resultsAggregate;
  }
  return resultsAggregate;
}

- (PXStoryPPTPerformer)initWithDelegate:(id)a3 testOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryPPTPerformer;
  uint64_t v8 = [(PXStoryPPTPerformer *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_testOptions, a4);
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    extraResults = v9->_extraResults;
    v9->_extraResults = v10;
  }
  return v9;
}

- (PXStoryPPTPerformer)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPPTPerformer.m", 77, @"%s is not available as initializer", "-[PXStoryPPTPerformer init]");

  abort();
}

@end