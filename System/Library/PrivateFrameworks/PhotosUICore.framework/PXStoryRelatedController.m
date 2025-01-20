@interface PXStoryRelatedController
- (BOOL)canStartProducingRelated;
- (BOOL)isActive;
- (BOOL)isProductionEnabled;
- (NSProgress)progress;
- (NSSet)recentlyUsedAppleMusicSongIDs;
- (NSSet)recentlyUsedFlexSongIDs;
- (PXStoryConfiguration)mainConfiguration;
- (PXStoryModel)mainModel;
- (PXStoryProducerResult)result;
- (PXStoryRelatedController)initWithObservableModel:(id)a3;
- (PXStoryRelatedController)initWithViewModel:(id)a3;
- (PXStoryRelatedProducer)relatedProducer;
- (PXStoryViewModel)viewModel;
- (id)detailedDebugInformation;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (void)_handleResult:(id)a3;
- (void)_invalidateCanStartProducingRelated;
- (void)_invalidateMainConfiguration;
- (void)_invalidateMainModel;
- (void)_invalidateRelatedConfigurations;
- (void)_updateCanStartProducingRelated;
- (void)_updateMainConfiguration;
- (void)_updateMainModel;
- (void)_updateRelatedConfigurations;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)configureUpdater:(id)a3;
- (void)dealloc;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCanStartProducingRelated:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsProductionEnabled:(BOOL)a3;
- (void)setMainConfiguration:(id)a3;
- (void)setMainModel:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3;
- (void)setRecentlyUsedFlexSongIDs:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation PXStoryRelatedController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_mainConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedProducer, 0);
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (PXStoryProducerResult)result
{
  return self->_result;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isProductionEnabled
{
  return self->_isProductionEnabled;
}

- (BOOL)canStartProducingRelated
{
  return self->_canStartProducingRelated;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryConfiguration)mainConfiguration
{
  return self->_mainConfiguration;
}

- (PXStoryRelatedProducer)relatedProducer
{
  return self->_relatedProducer;
}

- (NSSet)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (NSSet)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXStoryViewModel *)WeakRetained;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryRelatedController *)self result];
  v6 = [v5 description];
  [v4 setObject:v6 forKeyedSubscript:@"result"];

  id v7 = [(PXStoryRelatedController *)self detailedDebugInformation];
  [v4 setObject:v7 forKeyedSubscript:@"upNextDebugInfo"];
}

- (id)detailedDebugInformation
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__202482;
  v19 = __Block_byref_object_dispose__202483;
  v20 = @"{error: \"Debug info could not be fetched in time\"}";
  dispatch_group_t v3 = dispatch_group_create();
  id v4 = [(PXStoryRelatedController *)self mainConfiguration];
  v5 = objc_alloc_init(PXStoryRelatedMusicCurationParameters);
  v6 = [(PXStoryRelatedController *)self relatedProducer];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PXStoryRelatedController_detailedDebugInformation__block_invoke;
  v12[3] = &unk_1E5DC45F8;
  v14 = &v15;
  id v7 = v3;
  v13 = v7;
  id v8 = (id)[v6 requestConfigurationsRelatedToConfiguration:v4 withOptions:8 musicCurationParameters:v5 resultHandler:v12];

  dispatch_group_enter(v7);
  dispatch_time_t v9 = dispatch_time(0, 8000000000);
  dispatch_group_wait(v7, v9);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __52__PXStoryRelatedController_detailedDebugInformation__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  dispatch_group_t v3 = [v12 object];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 debugInfo];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = NSString;
    id v7 = [v12 error];
    uint64_t v9 = [v8 stringWithFormat:@"{error: \"%@\"}", v7];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  uint64_t v5 = [(PXStoryRelatedController *)self result];
  uint64_t v6 = [v5 error];
  [v4 setObject:v6 forKeyedSubscript:@"Related"];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = [(PXStoryRelatedController *)self relatedProducer];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v5 appendFormat:@"Producer: %@\n", v8];

  uint64_t v9 = [(PXStoryRelatedController *)self viewModel];
  if ([v9 wantsRelatedOverlayVisible]) {
    uint64_t v10 = @"Yes";
  }
  else {
    uint64_t v10 = @"No";
  }
  [v9 relatedOverlayVisibilityFraction];
  [v5 appendFormat:@"Wants Overlay: %@ (Opacity: %0.0f%%)\n", v10, v11 * 100.0];
  id v12 = [(PXStoryRelatedController *)self result];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 error];
    uint64_t v15 = v14;
    if (v14)
    {
      v16 = [v14 localizedDescription];
      [v5 appendFormat:@"Failed: ❌ %@\n", v16];
    }
    else
    {
      v19 = [v13 object];
      v16 = v19;
      if (v19)
      {
        v20 = [v19 storyConfigurations];
        objc_msgSend(v5, "appendFormat:", @"Result: ✅ %lu\n", objc_msgSend(v20, "count"));
        v21 = objc_alloc_init(PXStoryDurationFormatter);
        [v13 productionDuration];
        v22 = -[PXStoryDurationFormatter stringFromTimeInterval:](v21, "stringFromTimeInterval:");
        [v5 appendFormat:@"\t%@\n", v22];

        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __65__PXStoryRelatedController_diagnosticTextForHUDType_displaySize___block_invoke;
        v27[3] = &unk_1E5DC45D0;
        id v23 = v5;
        id v28 = v23;
        [v20 enumerateObjectsUsingBlock:v27];
        v24 = [v16 debugInfo];
        [v23 appendFormat:@"Debug Info: %@\n", v24];
      }
      else
      {
        [v5 appendString:@"Result: ❌ None \n"];
      }
    }
  }
  else
  {
    uint64_t v17 = [(PXStoryRelatedController *)self progress];

    if (v17)
    {
      v18 = @"Loading…\n";
    }
    else if ([(PXStoryRelatedController *)self isActive])
    {
      if ([(PXStoryRelatedController *)self canStartProducingRelated]) {
        v18 = @"❌ Unexpected state\n";
      }
      else {
        v18 = @"Waiting…\n";
      }
    }
    else
    {
      v18 = @"Inactive\n";
    }
    [v5 appendString:v18];
  }
  v25 = (void *)[v5 copy];

  return v25;
}

void __65__PXStoryRelatedController_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = [a2 assetCollection];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = PXStoryDisplayAssetCollectionShortTitle(v8);
  id v7 = [v8 uuid];
  [v5 appendFormat:@"\t%li: “%@”\n\t\t%@\n", a3, v6, v7];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)MainModelObservationContext_202542 == a5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__PXStoryRelatedController_observable_didChange_context___block_invoke;
    v6[3] = &unk_1E5DC45A8;
    v6[4] = self;
    v6[5] = a4;
    [(PXStoryController *)self performChanges:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryRelatedController;
    -[PXStoryController observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

void __57__PXStoryRelatedController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x200000) != 0)
  {
    [*(id *)(a1 + 32) _invalidateCanStartProducingRelated];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 0x20000000000) != 0)
  {
    id v4 = [*(id *)(a1 + 32) viewModel];
    char v5 = [v4 shouldAutoReplayPreference];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [*(id *)(a1 + 32) viewModel];
      [v6 performChanges:&__block_literal_global_202546];
    }
  }
}

void __57__PXStoryRelatedController_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setWantsRelatedOverlayVisible:1];
  [v2 setShouldCountDownToUpNext:0];
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryRelatedController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PXStoryRelatedController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5DC45A8;
  v5[4] = self;
  v5[5] = a3;
  [(PXStoryController *)self performChanges:v5];
}

void __46__PXStoryRelatedController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x80) != 0)
  {
    [*(id *)(a1 + 32) _invalidateMainConfiguration];
    uint64_t v3 = *(void *)(a1 + 40);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [*(id *)(a1 + 32) _invalidateMainModel];
  if ((*(void *)(a1 + 40) & 4) != 0) {
LABEL_4:
  }
    [*(id *)(a1 + 32) _invalidateCanStartProducingRelated];
LABEL_5:
}

- (void)_handleResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PXStoryRelatedController__handleResult___block_invoke;
  v6[3] = &unk_1E5DC4580;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryController *)self performChanges:v6];
}

uint64_t __42__PXStoryRelatedController__handleResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setResult:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 setProgress:0];
}

- (void)_updateRelatedConfigurations
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__202482;
  v35 = __Block_byref_object_dispose__202483;
  id v36 = 0;
  uint64_t v3 = [(PXStoryRelatedController *)self mainConfiguration];
  BOOL v4 = [(PXStoryRelatedController *)self isProductionEnabled];
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    objc_super v6 = [(PXStoryRelatedController *)self result];
    BOOL v7 = v6 == 0;

    if (v7)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v9 = v8;
      uint64_t v10 = [(PXStoryController *)self storyQueue];
      objc_initWeak(&location, self);
      double v11 = [(PXStoryRelatedController *)self log];
      id v12 = (void *)[(PXStoryRelatedController *)self logContext];
      v13 = (char *)os_signpost_id_make_with_pointer(v11, self);
      v14 = v11;
      uint64_t v15 = v14;
      if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 134217984;
        v38 = v12;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "PXStoryRelatedControllerProduction", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }

      v16 = objc_alloc_init(PXStoryRelatedMusicCurationParameters);
      uint64_t v17 = [(PXStoryRelatedController *)self recentlyUsedFlexSongIDs];
      [(PXStoryRelatedMusicCurationParameters *)v16 setRecentlyUsedFlexSongIDs:v17];

      v18 = [(PXStoryRelatedController *)self recentlyUsedAppleMusicSongIDs];
      [(PXStoryRelatedMusicCurationParameters *)v16 setRecentlyUsedAppleMusicSongIDs:v18];

      v19 = [(PXStoryRelatedController *)self relatedProducer];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke;
      v24[3] = &unk_1E5DC4558;
      v29[1] = v9;
      id v25 = v3;
      v20 = v15;
      v26 = v20;
      v29[2] = v13;
      v29[3] = v12;
      id v21 = v10;
      id v27 = v21;
      id v28 = &v31;
      objc_copyWeak(v29, &location);
      uint64_t v22 = [v19 requestConfigurationsRelatedToConfiguration:v25 withOptions:2 musicCurationParameters:v16 resultHandler:v24];
      id v23 = (void *)v32[5];
      v32[5] = v22;

      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
    }
  }
  [(PXStoryRelatedController *)self setProgress:v32[5]];

  _Block_object_dispose(&v31, 8);
}

void __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)[v3 deliveredNowWithRequestTime:*(double *)(a1 + 72)];
  BOOL v5 = [v3 object];
  if (v5)
  {
    [v5 storyConfigurations];
    objc_claimAutoreleasedReturnValue();
    v15[1] = (id)MEMORY[0x1E4F143A8];
    v15[2] = (id)3221225472;
    v15[3] = __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_2;
    v15[4] = &unk_1E5DC4508;
    v15[5] = *(id *)(a1 + 32);
    PXMap();
  }
  objc_super v6 = *(id *)(a1 + 40);
  BOOL v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v9 = *(void *)(a1 + 88);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryRelatedControllerProduction", "Context=%{signpost.telemetry:string2}lu Result=%{signpost.description:attribute,public}@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_24;
  v12[3] = &unk_1E5DC4530;
  uint64_t v10 = *(NSObject **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  objc_copyWeak(v15, (id *)(a1 + 64));
  id v13 = v3;
  id v11 = v3;
  dispatch_async(v10, v12);

  objc_destroyWeak(v15);
}

id __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithParentConfiguration:*(void *)(a1 + 32)];
  return v2;
}

void __56__PXStoryRelatedController__updateRelatedConfigurations__block_invoke_24(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleResult:*(void *)(a1 + 32)];
  }
}

- (void)_invalidateRelatedConfigurations
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRelatedConfigurations];
}

- (void)_updateCanStartProducingRelated
{
  id v11 = +[PXStorySettings sharedInstance];
  if ([(PXStoryRelatedController *)self isActive]
    && ([(PXStoryRelatedController *)self viewModel],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 playbackFractionCompleted],
        double v5 = v4,
        [v11 relatedProductionPlaybackFractionCompletedThreshold],
        double v7 = v6,
        v3,
        v5 > v7))
  {
    if ([v11 allowRelatedProductionBeforeReadyToPlay])
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v9 = [(PXStoryRelatedController *)self mainModel];
      uint64_t v10 = [v9 readinessStatus];

      BOOL v8 = v10 == 3;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  [(PXStoryRelatedController *)self setCanStartProducingRelated:v8];
}

- (void)_invalidateCanStartProducingRelated
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCanStartProducingRelated];
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryRelatedController *)self viewModel];
  id v3 = [v4 mainModel];
  [(PXStoryRelatedController *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModel];
}

- (void)_updateMainConfiguration
{
  id v4 = [(PXStoryRelatedController *)self viewModel];
  id v3 = [v4 mainConfiguration];
  [(PXStoryRelatedController *)self setMainConfiguration:v3];
}

- (void)_invalidateMainConfiguration
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainConfiguration];
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  id v4 = (NSSet *)[a3 copy];
  recentlyUsedAppleMusicSongIDs = self->_recentlyUsedAppleMusicSongIDs;
  self->_recentlyUsedAppleMusicSongIDs = v4;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  id v4 = (NSSet *)[a3 copy];
  recentlyUsedFlexSongIDs = self->_recentlyUsedFlexSongIDs;
  self->_recentlyUsedFlexSongIDs = v4;
}

- (void)setResult:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = (PXStoryProducerResult *)a3;
  p_result = (id *)&self->_result;
  if (self->_result != v5)
  {
    objc_storeStrong((id *)&self->_result, a3);
    double v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *p_result;
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "related results: %@", buf, 0xCu);
    }

    [(PXStoryRelatedController *)self signalChange:8];
    uint64_t v9 = [*p_result object];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = [v9 storyConfigurations];
      id v12 = [(PXStoryRelatedController *)self viewModel];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __38__PXStoryRelatedController_setResult___block_invoke;
      v14[3] = &unk_1E5DD1EF0;
      id v15 = v11;
      id v13 = v11;
      [v12 performChanges:v14];
    }
  }
}

uint64_t __38__PXStoryRelatedController_setResult___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRelatedConfigurations:*(void *)(a1 + 32)];
}

- (void)setProgress:(id)a3
{
  double v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    double v7 = v5;
    [(NSProgress *)progress cancel];
    objc_storeStrong((id *)&self->_progress, a3);
    [(PXStoryRelatedController *)self signalChange:4];
    double v5 = v7;
  }
}

- (void)setIsProductionEnabled:(BOOL)a3
{
  if (self->_isProductionEnabled != a3)
  {
    self->_isProductionEnabled = a3;
    [(PXStoryRelatedController *)self signalChange:2];
    [(PXStoryRelatedController *)self _invalidateRelatedConfigurations];
  }
}

- (void)setCanStartProducingRelated:(BOOL)a3
{
  if (self->_canStartProducingRelated != a3)
  {
    self->_canStartProducingRelated = a3;
    [(PXStoryRelatedController *)self signalChange:1];
    if (self->_canStartProducingRelated)
    {
      [(PXStoryRelatedController *)self setIsProductionEnabled:1];
    }
  }
}

- (void)setMainModel:(id)a3
{
  double v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    double v7 = v5;
    [(PXStoryModel *)mainModel unregisterChangeObserver:self context:MainModelObservationContext_202542];
    objc_storeStrong((id *)&self->_mainModel, a3);
    [(PXStoryModel *)self->_mainModel registerChangeObserver:self context:MainModelObservationContext_202542];
    [(PXStoryRelatedController *)self _invalidateCanStartProducingRelated];
    double v5 = v7;
  }
}

- (void)setMainConfiguration:(id)a3
{
  double v7 = (PXStoryConfiguration *)a3;
  double v5 = self->_mainConfiguration;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryConfiguration *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mainConfiguration, a3);
      [(PXStoryRelatedController *)self setIsProductionEnabled:0];
      [(PXStoryRelatedController *)self setCanStartProducingRelated:0];
      [(PXStoryRelatedController *)self setResult:0];
    }
  }
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    if (!a3) {
      [(PXStoryRelatedController *)self setIsProductionEnabled:0];
    }
    [(PXStoryRelatedController *)self _invalidateCanStartProducingRelated];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryRelatedController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainConfiguration, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateMainModel];
  [v3 addUpdateSelector:sel__updateCanStartProducingRelated];
  [v3 addUpdateSelector:sel__updateRelatedConfigurations];
}

- (void)dealloc
{
  [(NSProgress *)self->_progress cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedController;
  [(PXStoryRelatedController *)&v3 dealloc];
}

- (PXStoryRelatedController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryRelatedController;
  char v6 = [(PXStoryController *)&v18 initWithObservableModel:v5];
  double v7 = v6;
  if (v6)
  {
    id v8 = objc_storeWeak((id *)&v6->_viewModel, v5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__PXStoryRelatedController_initWithViewModel___block_invoke;
    v16[3] = &unk_1E5DD1EF0;
    uint64_t v9 = v7;
    id v17 = v9;
    [v5 performChanges:v16];

    uint64_t v10 = [v5 mainConfiguration];
    id v11 = [v10 relatedProducer];
    id v12 = v11;
    if (!v11)
    {
      objc_super v3 = [v5 viewLayoutSpec];
      id v12 = PXStoryRelatedProducerCreateDefaultWithTargetUpNextCount([v3 upNextTargetMemoryCount]);
    }
    objc_storeStrong(v9 + 19, v12);
    if (!v11)
    {
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__PXStoryRelatedController_initWithViewModel___block_invoke_2;
    v14[3] = &unk_1E5DC44E0;
    id v15 = v9;
    [v15 performChanges:v14];
  }
  return v7;
}

uint64_t __46__PXStoryRelatedController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:12];
}

uint64_t __46__PXStoryRelatedController_initWithViewModel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateMainConfiguration];
  [*(id *)(a1 + 32) _invalidateMainModel];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCanStartProducingRelated];
}

- (PXStoryRelatedController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRelatedController.m", 41, @"%s is not available as initializer", "-[PXStoryRelatedController initWithObservableModel:]");

  abort();
}

@end