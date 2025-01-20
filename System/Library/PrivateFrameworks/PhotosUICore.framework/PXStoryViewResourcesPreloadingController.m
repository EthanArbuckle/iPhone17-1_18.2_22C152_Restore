@interface PXStoryViewResourcesPreloadingController
- (BOOL)isActive;
- (NSMapTable)resourcesPreloadingControllers;
- (PXStoryResourcesPreloadingCoordinator)resourcesPreloadingCoordinator;
- (PXStoryViewModel)viewModel;
- (PXStoryViewResourcesPreloadingController)initWithObservableModel:(id)a3;
- (PXStoryViewResourcesPreloadingController)initWithViewModel:(id)a3;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)resourcesPreloadingControllerForModel:(id)a3;
- (void)_invalidateResourcesPreloadingControllers;
- (void)_updateResourcesPreloadingControllers;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)setIsActive:(BOOL)a3;
@end

@implementation PXStoryViewResourcesPreloadingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesPreloadingControllers, 0);
  objc_storeStrong((id *)&self->_resourcesPreloadingCoordinator, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (NSMapTable)resourcesPreloadingControllers
{
  return self->_resourcesPreloadingControllers;
}

- (PXStoryResourcesPreloadingCoordinator)resourcesPreloadingCoordinator
{
  return self->_resourcesPreloadingCoordinator;
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
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __81__PXStoryViewResourcesPreloadingController_diagnosticTextForHUDType_displaySize___block_invoke;
  v17 = &unk_1E5DC0448;
  id v18 = v5;
  v19 = self;
  id v6 = v5;
  v7 = (void (**)(void *, __CFString *, void *))_Block_copy(&v14);
  v8 = [(PXStoryViewResourcesPreloadingController *)self viewModel];
  v9 = [v8 mainModel];
  v20[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v7[2](v7, @"Main", v10);

  v11 = [v8 relatedModels];
  v7[2](v7, @"Related", v11);

  v12 = (void *)[v6 copy];
  return v12;
}

void __81__PXStoryViewResourcesPreloadingController_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) appendFormat:@"%@:\n", a2];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(a1 + 40) resourcesPreloadingControllerForModel:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        v12 = *(void **)(a1 + 32);
        uint64_t v13 = [v11 diagnosticDescription];
        uint64_t v14 = (void *)v13;
        if (v13) {
          uint64_t v15 = (__CFString *)v13;
        }
        else {
          uint64_t v15 = @"??";
        }
        [v12 appendString:v15];

        [*(id *)(a1 + 32) appendString:@"\n"];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)handleModelChange:(unint64_t)a3
{
  __int16 v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewResourcesPreloadingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((v3 & 0x140) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__PXStoryViewResourcesPreloadingController_handleModelChange___block_invoke;
    v5[3] = &unk_1E5DC0420;
    v5[4] = self;
    [(PXStoryController *)self performChanges:v5];
  }
}

uint64_t __62__PXStoryViewResourcesPreloadingController_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateResourcesPreloadingControllers];
}

- (void)_updateResourcesPreloadingControllers
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = [(PXStoryViewResourcesPreloadingController *)self resourcesPreloadingControllers];
  BOOL v5 = [(PXStoryViewResourcesPreloadingController *)self isActive];
  BOOL v6 = v5;
  uint64_t v7 = "TTRWorkflowBuilder";
  if (v5)
  {
    uint64_t v8 = [(PXStoryViewResourcesPreloadingController *)self viewModel];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v10 = [v4 keyEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 addObject:*(void *)(*((void *)&v40 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v12);
    }

    uint64_t v15 = +[PXStorySettings sharedInstance];
    char v16 = [v15 preloadNonKeyRelated];

    long long v17 = [(PXStoryViewResourcesPreloadingController *)self resourcesPreloadingCoordinator];
    v33[0] = MEMORY[0x1E4F143A8];
    uint64_t v7 = "TTRWorkflowBuilder";
    v33[1] = 3221225472;
    v33[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke;
    v33[3] = &unk_1E5DC03D8;
    id v34 = v9;
    id v35 = v4;
    id v36 = v8;
    v37 = self;
    SEL v38 = a2;
    char v39 = v16;
    id v18 = v8;
    id v19 = v9;
    [v17 performChanges:v33];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v20 = [v4 objectEnumerator];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    uint64_t v24 = *((void *)v7 + 415);
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v29 + 1) + 8 * v25);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = v24;
        v27[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_5;
        v27[3] = &__block_descriptor_33_e55_v16__0___PXStoryMutableResourcesPreloadingController__8l;
        BOOL v28 = v6;
        [v26 performChanges:v27];
        ++v25;
      }
      while (v22 != v25);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v44 count:16];
    }
    while (v22);
  }
}

void __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_2;
  aBlock[3] = &unk_1E5DC03B0;
  id v33 = *(id *)(a1 + 32);
  id v34 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v38 = *(void *)(a1 + 64);
  id v35 = v4;
  uint64_t v36 = v5;
  id v6 = v3;
  id v37 = v6;
  uint64_t v7 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v8 = [*(id *)(a1 + 48) mainModel];
  v7[2](v7, v8, 0);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = [*(id *)(a1 + 48) relatedModels];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v14 viewMode] == 3 && objc_msgSend(v14, "thumbnailStyle") == 2)
        {
          uint64_t v15 = 1;
        }
        else
        {
          if (!*(unsigned char *)(a1 + 72)) {
            continue;
          }
          uint64_t v15 = 2;
        }
        v7[2](v7, v14, v15);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v22 = [*(id *)(a1 + 40) objectForKey:v21];
        if (!v22)
        {
          uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 56), @"PXStoryViewResourcesPreloadingController.m", 135, @"Invalid parameter not satisfying: %@", @"unusedResourcesPreloadingController != nil" object file lineNumber description];
        }
        [v22 performChanges:&__block_literal_global_159944];
        [v6 removePreloadingController:v22];
        [*(id *)(a1 + 40) removeObjectForKey:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v39 count:16];
    }
    while (v18);
  }
}

uint64_t __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setIsActive:*(unsigned __int8 *)(a1 + 32)];
}

void __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(a1 + 32) removeObject:v5];
    id v6 = [*(id *)(a1 + 40) objectForKey:v5];
    if (!v6)
    {
      if (!*(void *)(a1 + 48))
      {
        uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 56), @"PXStoryViewResourcesPreloadingController.m", 95, @"Invalid parameter not satisfying: %@", @"viewModel != nil" object file lineNumber description];
      }
      uint64_t v7 = [PXStoryResourcesPreloadingController alloc];
      uint64_t v8 = [*(id *)(a1 + 48) mediaProvider];
      id v6 = [(PXStoryResourcesPreloadingController *)v7 initWithModel:v5 mediaProvider:v8];

      [*(id *)(a1 + 40) setObject:v6 forKey:v5];
    }
    uint64_t v9 = 2;
    BOOL v10 = a3 == 0;
    if (a3 == 1) {
      BOOL v10 = 0;
    }
    else {
      uint64_t v9 = a3 == 0;
    }
    BOOL v11 = a3 == 2;
    if (a3 == 2) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = v9;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_3;
    v15[3] = &__block_descriptor_34_e55_v16__0___PXStoryMutableResourcesPreloadingController__8l;
    BOOL v13 = !v11 && v10;
    char v16 = 0;
    BOOL v17 = v13;
    [(PXStoryController *)v6 performChanges:v15];
    [*(id *)(a1 + 64) addPreloadingController:v6 withPriority:v12];
  }
}

uint64_t __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

void __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  [v4 setIsSongResourcesPreloadingEnabled:v3];
  [v4 setShouldSkipInitialSegment:*(unsigned __int8 *)(a1 + 33)];
}

- (void)_invalidateResourcesPreloadingControllers
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateResourcesPreloadingControllers];
}

- (id)resourcesPreloadingControllerForModel:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryViewResourcesPreloadingController *)self resourcesPreloadingControllers];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryViewResourcesPreloadingController *)self _invalidateResourcesPreloadingControllers];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewResourcesPreloadingController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateResourcesPreloadingControllers, v4.receiver, v4.super_class);
}

- (PXStoryViewResourcesPreloadingController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryViewResourcesPreloadingController;
  id v6 = [(PXStoryController *)&v22 initWithObservableModel:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = objc_storeWeak((id *)&v6->_viewModel, v5);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __62__PXStoryViewResourcesPreloadingController_initWithViewModel___block_invoke;
    v20 = &unk_1E5DD1EF0;
    uint64_t v9 = v7;
    uint64_t v21 = v9;
    [v5 performChanges:&v17];

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_viewModel);
    uint64_t v11 = [WeakRetained resourcesPreloadingCoordinator];
    resourcesPreloadingCoordinator = v9->_resourcesPreloadingCoordinator;
    v9->_resourcesPreloadingCoordinator = (PXStoryResourcesPreloadingCoordinator *)v11;

    if (!v9->_resourcesPreloadingCoordinator)
    {
      char v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v9, @"PXStoryViewResourcesPreloadingController.m", 40, @"Invalid parameter not satisfying: %@", @"_resourcesPreloadingCoordinator != nil", v17, v18, v19, v20 object file lineNumber description];
    }
    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    resourcesPreloadingControllers = v9->_resourcesPreloadingControllers;
    v9->_resourcesPreloadingControllers = (NSMapTable *)v13;
  }
  return v7;
}

uint64_t __62__PXStoryViewResourcesPreloadingController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:5];
}

- (PXStoryViewResourcesPreloadingController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewResourcesPreloadingController.m", 28, @"%s is not available as initializer", "-[PXStoryViewResourcesPreloadingController initWithObservableModel:]");

  abort();
}

@end