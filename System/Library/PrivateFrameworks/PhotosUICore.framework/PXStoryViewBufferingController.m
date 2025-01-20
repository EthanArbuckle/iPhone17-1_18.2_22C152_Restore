@interface PXStoryViewBufferingController
- (BOOL)didShowBufferingHUDAutomatically;
- (BOOL)isActive;
- (BOOL)originalIsHUDVisible;
- (BOOL)wantsBufferingHUDVisible;
- (NSDictionary)totalBufferingTimeIntervalsPerReason;
- (PXStoryBufferingController)bufferingController;
- (PXStoryModel)model;
- (PXStoryViewBufferingController)initWithObservableModel:(id)a3;
- (PXStoryViewBufferingController)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (double)lastCriticalBufferingDuration;
- (double)lastNoncriticalBufferingDuration;
- (double)totalBufferingTimeInterval;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (int64_t)originalHUDType;
- (void)_invalidateBufferingController;
- (void)_invalidateBufferingControllerProperties;
- (void)_invalidateMainModel;
- (void)_invalidateWantsBufferingHUDVisible;
- (void)_updateBufferingController;
- (void)_updateBufferingControllerProperties;
- (void)_updateMainModel;
- (void)_updateViewModelProperties;
- (void)_updateWantsBufferingHUDVisible;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBufferingController:(id)a3;
- (void)setDidShowBufferingHUDAutomatically:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setOriginalHUDType:(int64_t)a3;
- (void)setOriginalIsHUDVisible:(BOOL)a3;
- (void)setWantsBufferingHUDVisible:(BOOL)a3;
@end

@implementation PXStoryViewBufferingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (void)setOriginalHUDType:(int64_t)a3
{
  self->_originalHUDType = a3;
}

- (int64_t)originalHUDType
{
  return self->_originalHUDType;
}

- (void)setOriginalIsHUDVisible:(BOOL)a3
{
  self->_originalIsHUDVisible = a3;
}

- (BOOL)originalIsHUDVisible
{
  return self->_originalIsHUDVisible;
}

- (void)setDidShowBufferingHUDAutomatically:(BOOL)a3
{
  self->_didShowBufferingHUDAutomatically = a3;
}

- (BOOL)didShowBufferingHUDAutomatically
{
  return self->_didShowBufferingHUDAutomatically;
}

- (BOOL)wantsBufferingHUDVisible
{
  return self->_wantsBufferingHUDVisible;
}

- (PXStoryBufferingController)bufferingController
{
  return self->_bufferingController;
}

- (PXStoryModel)model
{
  return self->_model;
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

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v6 = +[PXStorySettings sharedInstance];
  int v7 = [v6 simulateSlowResourcesBuffering];

  if (v7) {
    [v5 appendString:@"Simulating slow assets buffering!!!\n"];
  }
  v8 = [(PXStoryViewBufferingController *)self bufferingController];
  v9 = [(PXStoryViewBufferingController *)self model];
  unint64_t v10 = [v9 readinessStatus];
  if (v10 > 3) {
    v11 = @"??";
  }
  else {
    v11 = off_1E5DC5210[v10];
  }
  v12 = v11;
  [v5 appendFormat:@"Readiness Status: %@\n", v12];

  if (![(PXStoryViewBufferingController *)self isActive])
  {
    v13 = @"Not active\n";
    goto LABEL_10;
  }
  if ([v8 isBuffering])
  {
    v13 = @"Spinner is visible because of: \n";
LABEL_10:
    [v5 appendString:v13];
    goto LABEL_12;
  }
  [v8 totalBufferingTimeInterval];
  [v5 appendFormat:@"Total spinning time: %.2fs\n", v14];
LABEL_12:
  v34 = v8;
  v15 = [v8 totalBufferingTimeIntervalsPerReason];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v16 = [v15 allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v22 = PXStoryBufferingReasonsDescription([v21 unsignedIntegerValue]);
        v23 = [v15 objectForKeyedSubscript:v21];
        [v23 doubleValue];
        [v5 appendFormat:@" · %@ - %.2fs\n", v22, v24];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }

  [v5 appendString:@"\n"];
  v25 = [(PXStoryViewBufferingController *)self viewModel];
  v26 = [v25 resourcesPreloadingController];
  v27 = [(PXStoryViewBufferingController *)self model];
  v28 = [v26 resourcesPreloadingControllerForModel:v27];

  if (v28)
  {
    if (([v28 isCompleted] & 1) == 0)
    {
      v29 = [v34 bufferingReasons];
      int v30 = [v29 containsIndex:2];

      if (v30)
      {
        [v5 appendString:@"Assets Buffering Details:\n"];
        v31 = [v28 diagnosticDescription];
        [v5 appendString:v31];
      }
    }
  }
  v32 = (void *)[v5 copy];

  return v32;
}

- (void)setWantsBufferingHUDVisible:(BOOL)a3
{
  if (self->_wantsBufferingHUDVisible != a3)
  {
    self->_wantsBufferingHUDVisible = a3;
    if (a3)
    {
      v4 = [(PXStoryViewBufferingController *)self viewModel];
      -[PXStoryViewBufferingController setOriginalIsHUDVisible:](self, "setOriginalIsHUDVisible:", [v4 isHUDVisible]);

      id v5 = [(PXStoryViewBufferingController *)self viewModel];
      -[PXStoryViewBufferingController setOriginalHUDType:](self, "setOriginalHUDType:", [v5 diagnosticHUDType]);
    }
    [(PXStoryViewBufferingController *)self _invalidateViewModelProperties];
  }
}

- (void)setBufferingController:(id)a3
{
  v8 = (PXStoryBufferingController *)a3;
  p_bufferingController = &self->_bufferingController;
  v6 = self->_bufferingController;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryBufferingController *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryBufferingController *)*p_bufferingController unregisterChangeObserver:self context:BufferingControllerObservationContext];
      objc_storeStrong((id *)&self->_bufferingController, a3);
      [(PXStoryBufferingController *)*p_bufferingController registerChangeObserver:self context:BufferingControllerObservationContext];
      [(PXStoryViewBufferingController *)self _invalidateBufferingControllerProperties];
      [(PXStoryViewBufferingController *)self _invalidateWantsBufferingHUDVisible];
    }
  }
}

- (void)setModel:(id)a3
{
  char v7 = (PXStoryModel *)a3;
  id v5 = self->_model;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryModel *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_model, a3);
      [(PXStoryViewBufferingController *)self _invalidateBufferingController];
    }
  }
}

- (void)_updateViewModelProperties
{
  v3 = [(PXStoryViewBufferingController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PXStoryViewBufferingController__updateViewModelProperties__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __60__PXStoryViewBufferingController__updateViewModelProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) wantsBufferingHUDVisible])
  {
    if (([v3 isHUDVisible] & 1) == 0)
    {
      [v3 setIsHUDVisible:1];
      [v3 setDiagnosticHUDType:4];
      [*(id *)(a1 + 32) setDidShowBufferingHUDAutomatically:1];
    }
  }
  else if ([*(id *)(a1 + 32) didShowBufferingHUDAutomatically])
  {
    [*(id *)(a1 + 32) setDidShowBufferingHUDAutomatically:0];
    if ([v3 isHUDVisible])
    {
      if ([v3 diagnosticHUDType] == 4)
      {
        objc_msgSend(v3, "setIsHUDVisible:", objc_msgSend(*(id *)(a1 + 32), "originalIsHUDVisible"));
        objc_msgSend(v3, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 32), "originalHUDType"));
      }
    }
  }
}

- (void)_updateWantsBufferingHUDVisible
{
  if (PFOSVariantHasInternalUI())
  {
    id v7 = [(PXStoryViewBufferingController *)self bufferingController];
    [v7 lastCriticalBufferingDuration];
    double v4 = v3;
    id v5 = +[PXStorySettings sharedInstance];
    [v5 bufferingHUDAutoPresentationTimeout];
    [(PXStoryViewBufferingController *)self setWantsBufferingHUDVisible:v4 >= v6];
  }
  else
  {
    [(PXStoryViewBufferingController *)self setWantsBufferingHUDVisible:0];
  }
}

- (void)_invalidateWantsBufferingHUDVisible
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsBufferingHUDVisible];
}

- (void)_updateBufferingControllerProperties
{
  double v3 = [(PXStoryViewBufferingController *)self bufferingController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PXStoryViewBufferingController__updateBufferingControllerProperties__block_invoke;
  v4[3] = &unk_1E5DC4DE0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __70__PXStoryViewBufferingController__updateBufferingControllerProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setIsActive:", objc_msgSend(v2, "isActive"));
}

- (void)_invalidateBufferingControllerProperties
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateBufferingControllerProperties];
}

- (void)_updateBufferingController
{
  id v3 = [PXStoryBufferingController alloc];
  id v5 = [(PXStoryViewBufferingController *)self model];
  double v4 = [(PXStoryBufferingController *)v3 initWithModel:v5];
  [(PXStoryViewBufferingController *)self setBufferingController:v4];
}

- (void)_invalidateBufferingController
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateBufferingController];
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryViewBufferingController *)self viewModel];
  id v3 = [v4 mainModel];
  [(PXStoryViewBufferingController *)self setModel:v3];
}

- (void)_invalidateMainModel
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModel];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)BufferingControllerObservationContext == a5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__PXStoryViewBufferingController_observable_didChange_context___block_invoke;
    v6[3] = &unk_1E5DBB848;
    v6[4] = self;
    v6[5] = a4;
    [(PXStoryController *)self performChanges:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryViewBufferingController;
    -[PXStoryController observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

uint64_t __63__PXStoryViewBufferingController_observable_didChange_context___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _invalidateWantsBufferingHUDVisible];
  }
  return result;
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewBufferingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryViewBufferingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5DBB848;
  v5[4] = self;
  v5[5] = a3;
  [(PXStoryController *)self performChanges:v5];
}

uint64_t __52__PXStoryViewBufferingController_handleModelChange___block_invoke(uint64_t result)
{
  if ((*(unsigned char *)(result + 40) & 0x40) != 0) {
    return [*(id *)(result + 32) _invalidateMainModel];
  }
  return result;
}

- (NSDictionary)totalBufferingTimeIntervalsPerReason
{
  id v2 = [(PXStoryViewBufferingController *)self bufferingController];
  id v3 = [v2 totalBufferingTimeIntervalsPerReason];

  return (NSDictionary *)v3;
}

- (double)totalBufferingTimeInterval
{
  id v2 = [(PXStoryViewBufferingController *)self bufferingController];
  [v2 totalBufferingTimeInterval];
  double v4 = v3;

  return v4;
}

- (double)lastCriticalBufferingDuration
{
  id v2 = [(PXStoryViewBufferingController *)self bufferingController];
  [v2 lastCriticalBufferingDuration];
  double v4 = v3;

  return v4;
}

- (double)lastNoncriticalBufferingDuration
{
  id v2 = [(PXStoryViewBufferingController *)self bufferingController];
  [v2 lastNoncriticalBufferingDuration];
  double v4 = v3;

  return v4;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryViewBufferingController *)self _invalidateBufferingControllerProperties];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewBufferingController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateBufferingController];
  [v3 addUpdateSelector:sel__updateBufferingControllerProperties];
  [v3 addUpdateSelector:sel__updateWantsBufferingHUDVisible];
  [v3 addUpdateSelector:sel__updateViewModelProperties];
}

- (PXStoryViewBufferingController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryViewBufferingController;
  objc_super v5 = [(PXStoryController *)&v14 initWithObservableModel:v4];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_viewModel, v4);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__PXStoryViewBufferingController_initWithViewModel___block_invoke;
    v12[3] = &unk_1E5DD1EF0;
    v8 = v6;
    v13 = v8;
    [v4 performChanges:v12];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__PXStoryViewBufferingController_initWithViewModel___block_invoke_2;
    v10[3] = &unk_1E5DBB820;
    v11 = v8;
    [(PXStoryController *)v11 performChanges:v10];
  }
  return v6;
}

uint64_t __52__PXStoryViewBufferingController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:4];
}

uint64_t __52__PXStoryViewBufferingController_initWithViewModel___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateMainModel];
}

- (PXStoryViewBufferingController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewBufferingController.m", 40, @"%s is not available as initializer", "-[PXStoryViewBufferingController initWithObservableModel:]");

  abort();
}

@end