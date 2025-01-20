@interface PXStoryPersistableRecipeManager
- (BOOL)hasAnyUserChange;
- (BOOL)hasUserExperiencedFirstPlaybackEver;
- (BOOL)hasUserExperiencedPlayback;
- (BOOL)isOriginalPersistableRecipeValid;
- (BOOL)isProducingPersistableRecipe;
- (BOOL)isReadyToProducePersistableRecipe;
- (NSError)error;
- (NSProgress)progress;
- (NSString)diagnosticDescription;
- (OS_dispatch_queue)storyQueue;
- (OS_dispatch_queue)workQueue;
- (PFStoryRecipe)originalPersistableRecipe;
- (PFStoryRecipe)persistableRecipe;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryModel)model;
- (PXStoryPersistableRecipeManager)init;
- (PXStoryPersistableRecipeManager)initWithModel:(id)a3 styleManager:(id)a4;
- (PXStoryRecipeAssetEdits)recipeAssetEdits;
- (PXStoryRecipeManager)recipeManager;
- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager;
- (PXStoryStyleManager)styleManager;
- (PXUpdater)updater;
- (id)_persistableRecipeWithOriginalPersistableRecipe:(id)a3 recipe:(id)a4 recipeAssetEdits:(id)a5 currentStyle:(id)a6 error:(id *)a7;
- (int64_t)persistencePermission;
- (void)_handlePersistableRecipe:(id)a3 recipeAssetEdits:(id)a4 error:(id)a5 progress:(id)a6;
- (void)_invalidateHasUserExperiencedFirstPlaybackEver;
- (void)_invalidateHasUserExperiencedPlayback;
- (void)_invalidateIsReadyToProducePersistableRecipe;
- (void)_invalidateOriginalPersistableRecipe;
- (void)_invalidatePersistableRecipe;
- (void)_invalidatePersistencePermission;
- (void)_setNeedsUpdate;
- (void)_updateHasUserExperiencedFirstPlaybackEver;
- (void)_updateHasUserExperiencedPlayback;
- (void)_updateIsReadyToProducePersistableRecipe;
- (void)_updateOriginalPersistableRecipe;
- (void)_updatePersistableRecipe;
- (void)_updatePersistencePermission;
- (void)dealloc;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setError:(id)a3;
- (void)setHasAnyUserChange:(BOOL)a3;
- (void)setHasUserExperiencedFirstPlaybackEver:(BOOL)a3;
- (void)setHasUserExperiencedPlayback:(BOOL)a3;
- (void)setIsOriginalPersistableRecipeValid:(BOOL)a3;
- (void)setIsProducingPersistableRecipe:(BOOL)a3;
- (void)setIsReadyToProducePersistableRecipe:(BOOL)a3;
- (void)setOriginalPersistableRecipe:(id)a3;
- (void)setPersistableRecipe:(id)a3;
- (void)setPersistencePermission:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)setRecipeAssetEdits:(id)a3;
@end

@implementation PXStoryPersistableRecipeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_originalPersistableRecipe, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_recipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (int64_t)persistencePermission
{
  return self->_persistencePermission;
}

- (BOOL)hasAnyUserChange
{
  return self->_hasAnyUserChange;
}

- (BOOL)hasUserExperiencedFirstPlaybackEver
{
  return self->_hasUserExperiencedFirstPlaybackEver;
}

- (BOOL)hasUserExperiencedPlayback
{
  return self->_hasUserExperiencedPlayback;
}

- (void)setOriginalPersistableRecipe:(id)a3
{
}

- (PFStoryRecipe)originalPersistableRecipe
{
  return self->_originalPersistableRecipe;
}

- (BOOL)isOriginalPersistableRecipeValid
{
  return self->_isOriginalPersistableRecipeValid;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (NSError)error
{
  return self->_error;
}

- (PXStoryRecipeAssetEdits)recipeAssetEdits
{
  return self->_recipeAssetEdits;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (BOOL)isProducingPersistableRecipe
{
  return self->_isProducingPersistableRecipe;
}

- (BOOL)isReadyToProducePersistableRecipe
{
  return self->_isReadyToProducePersistableRecipe;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p\n", v5, self];

  if ([(PXStoryPersistableRecipeManager *)self isOriginalPersistableRecipeValid])
  {
    v7 = [(PXStoryPersistableRecipeManager *)self originalPersistableRecipe];
    if (v7)
    {
      v8 = [(PXStoryPersistableRecipeManager *)self originalPersistableRecipe];
      v9 = [v8 diagnosticDescription];
      [v6 appendFormat:@"originalPersistableRecipe: %@\n", v9];
    }
    else
    {
      [v6 appendFormat:@"originalPersistableRecipe: %@\n", @"-"];
    }
  }
  else
  {
    [v6 appendFormat:@"originalPersistableRecipe: %@\n", @"?"];
  }
  objc_msgSend(v6, "appendFormat:", @"isReadyToProducePersistableRecipe: %i\n", -[PXStoryPersistableRecipeManager isReadyToProducePersistableRecipe](self, "isReadyToProducePersistableRecipe"));
  objc_msgSend(v6, "appendFormat:", @"hasUserExperiencedPlayback: %i\n", -[PXStoryPersistableRecipeManager hasUserExperiencedPlayback](self, "hasUserExperiencedPlayback"));
  objc_msgSend(v6, "appendFormat:", @"hasUserExperiencedFirstPlaybackEver: %i\n", -[PXStoryPersistableRecipeManager hasUserExperiencedFirstPlaybackEver](self, "hasUserExperiencedFirstPlaybackEver"));
  objc_msgSend(v6, "appendFormat:", @"hasAnyUserChange: %i\n", -[PXStoryPersistableRecipeManager hasAnyUserChange](self, "hasAnyUserChange"));
  if (![(PXStoryPersistableRecipeManager *)self isReadyToProducePersistableRecipe])
  {
    v10 = [(PXStoryPersistableRecipeManager *)self recipeManager];
    objc_msgSend(v6, "appendFormat:", @"isRecipeFinal: %i\n", objc_msgSend(v10, "isRecipeFinal"));

    v11 = [(PXStoryPersistableRecipeManager *)self resourcesDataSourceManager];
    objc_msgSend(v6, "appendFormat:", @"areResourcesFinal: %i\n", objc_msgSend(v11, "isDataSourceFinal"));

    v12 = [(PXStoryPersistableRecipeManager *)self styleManager];
    objc_msgSend(v6, "appendFormat:", @"isCurrentStyleFinal: %i\n", objc_msgSend(v12, "isCurrentStyleFinal"));
  }
  objc_msgSend(v6, "appendFormat:", @"isProducingPersistableRecipe: %i\n", -[PXStoryPersistableRecipeManager isProducingPersistableRecipe](self, "isProducingPersistableRecipe"));
  v13 = [(PXStoryPersistableRecipeManager *)self persistableRecipe];
  uint64_t v14 = [v13 diagnosticDescription];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"-";
  }
  [v6 appendFormat:@"persistableRecipe: %@\n", v16];

  uint64_t v17 = [(PXStoryPersistableRecipeManager *)self error];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"-";
  }
  [v6 appendFormat:@"error: %@\n", v19];

  v20 = (void *)[v6 copy];
  return (NSString *)v20;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PXStoryPersistableRecipeManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCCD20;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryPersistableRecipeManager *)self performChanges:v5];
}

void __64__PXStoryPersistableRecipeManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == ModelObservationContext_134568)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if ((v10 & 2) != 0)
    {
      [*(id *)(a1 + 32) _invalidateHasUserExperiencedPlayback];
      uint64_t v10 = *(void *)(a1 + 48);
    }
    if ((v10 & 0x4000000000) != 0)
    {
      v11 = *(void **)(a1 + 32);
      v5 = (id *)(a1 + 32);
      [v11 _invalidatePersistencePermission];
      goto LABEL_23;
    }
  }
  else if (v3 == RecipeManagerObservationContext_134569)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      [*(id *)(a1 + 32) _invalidateIsReadyToProducePersistableRecipe];
      [*(id *)(a1 + 32) _invalidateOriginalPersistableRecipe];
      [*(id *)(a1 + 32) _invalidatePersistableRecipe];
      uint64_t v12 = *(void *)(a1 + 48);
    }
    if ((v12 & 0x40) != 0)
    {
      v13 = *(void **)(a1 + 32);
      v5 = (id *)(a1 + 32);
      id v9 = v13;
      goto LABEL_18;
    }
  }
  else if (v3 == ResourcesDataSourceManagerObservationContext)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if ((v14 & 2) != 0)
    {
      [*(id *)(a1 + 32) _invalidateIsReadyToProducePersistableRecipe];
      uint64_t v14 = *(void *)(a1 + 48);
    }
    if (v14)
    {
      v5 = (id *)(a1 + 32);
      goto LABEL_23;
    }
  }
  else
  {
    if (v3 != StyleManagerObservationContext)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryPersistableRecipeManager.m" lineNumber:486 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if ((v4 & 0x10) != 0)
    {
      [*(id *)(a1 + 32) _invalidateIsReadyToProducePersistableRecipe];
      uint64_t v4 = *(void *)(a1 + 48);
    }
    if ((v4 & 6) != 0)
    {
      v6 = *(void **)(a1 + 32);
      v5 = (id *)(a1 + 32);
      v7 = [v6 styleManager];
      char v8 = [v7 changesOrigin];

      if ((v8 & 2) != 0)
      {
        id v9 = *v5;
LABEL_18:
        [v9 setHasAnyUserChange:1];
      }
LABEL_23:
      [*v5 _invalidatePersistableRecipe];
    }
  }
}

- (void)_handlePersistableRecipe:(id)a3 recipeAssetEdits:(id)a4 error:(id)a5 progress:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([a6 isCancelled] & 1) == 0)
  {
    if (!v10 || v12)
    {
      v13 = [(PXStoryPersistableRecipeManager *)self model];
      [v13 reportPersistenceFailureWithError:v12];
    }
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __92__PXStoryPersistableRecipeManager__handlePersistableRecipe_recipeAssetEdits_error_progress___block_invoke;
    v19 = &unk_1E5DBEF80;
    v20 = self;
    id v21 = v10;
    id v22 = v11;
    id v14 = v12;
    id v23 = v14;
    [(PXStoryPersistableRecipeManager *)self performChanges:&v16];
    v15 = [(PXStoryPersistableRecipeManager *)self errorReporter];
    [v15 setError:v14 forComponent:@"RecipePersistence"];
  }
}

uint64_t __92__PXStoryPersistableRecipeManager__handlePersistableRecipe_recipeAssetEdits_error_progress___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPersistableRecipe:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setRecipeAssetEdits:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 32);
  return [v2 setProgress:0];
}

- (void)_updatePersistableRecipe
{
  if ([(PXStoryPersistableRecipeManager *)self isReadyToProducePersistableRecipe])
  {
    uint64_t v3 = [(PXStoryPersistableRecipeManager *)self model];
    uint64_t v4 = [v3 persistencePermission];
    v5 = [v3 configuration];
    int v6 = [v5 isRelated];

    if (v6)
    {
      if (![(PXStoryPersistableRecipeManager *)self hasAnyUserChange]) {
        goto LABEL_9;
      }
    }
    else if ((![(PXStoryPersistableRecipeManager *)self hasUserExperiencedFirstPlaybackEver]|| v4 != 1)&& ![(PXStoryPersistableRecipeManager *)self hasAnyUserChange])
    {
      goto LABEL_9;
    }
    [(PXStoryPersistableRecipeManager *)self setHasAnyUserChange:0];
    v7 = [(PXStoryPersistableRecipeManager *)self originalPersistableRecipe];
    char v8 = [(PXStoryPersistableRecipeManager *)self recipeManager];
    id v22 = [v8 recipeAssetEdits];

    id v9 = [(PXStoryPersistableRecipeManager *)self recipeManager];
    id v10 = [v9 recipe];

    id v21 = [(PXStoryPersistableRecipeManager *)self styleManager];
    id v11 = [v21 currentStyle];
    id v12 = [(PXStoryPersistableRecipeManager *)self storyQueue];
    v13 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    objc_initWeak(&location, self);
    id v14 = [(PXStoryPersistableRecipeManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke;
    block[3] = &unk_1E5DBDF78;
    id v15 = v13;
    id v24 = v15;
    v25 = self;
    id v20 = v7;
    id v26 = v20;
    id v16 = v10;
    id v27 = v16;
    id v17 = v22;
    id v28 = v17;
    id v18 = v11;
    id v29 = v18;
    id v19 = v12;
    id v30 = v19;
    objc_copyWeak(&v31, &location);
    dispatch_async(v14, block);

    [(PXStoryPersistableRecipeManager *)self setProgress:v15];
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
LABEL_9:
  }
}

void __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    id v18 = 0;
    v7 = [v2 _persistableRecipeWithOriginalPersistableRecipe:v3 recipe:v4 recipeAssetEdits:v5 currentStyle:v6 error:&v18];
    id v8 = v18;
    id v9 = *(NSObject **)(a1 + 80);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke_2;
    v12[3] = &unk_1E5DBDF50;
    objc_copyWeak(&v17, (id *)(a1 + 88));
    id v13 = v7;
    id v14 = *(id *)(a1 + 64);
    id v15 = v8;
    id v16 = *(id *)(a1 + 32);
    id v10 = v8;
    id v11 = v7;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v17);
  }
}

void __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handlePersistableRecipe:*(void *)(a1 + 32) recipeAssetEdits:*(void *)(a1 + 40) error:*(void *)(a1 + 48) progress:*(void *)(a1 + 56)];
}

- (void)_invalidatePersistableRecipe
{
  id v2 = [(PXStoryPersistableRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistableRecipe];
}

- (void)_updatePersistencePermission
{
  id v3 = [(PXStoryPersistableRecipeManager *)self model];
  -[PXStoryPersistableRecipeManager setPersistencePermission:](self, "setPersistencePermission:", [v3 persistencePermission]);
}

- (void)_invalidatePersistencePermission
{
  id v2 = [(PXStoryPersistableRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistencePermission];
}

- (void)_updateHasUserExperiencedFirstPlaybackEver
{
  if ([(PXStoryPersistableRecipeManager *)self hasUserExperiencedPlayback])
  {
    if ([(PXStoryPersistableRecipeManager *)self isOriginalPersistableRecipeValid])
    {
      id v3 = [(PXStoryPersistableRecipeManager *)self originalPersistableRecipe];

      if (!v3)
      {
        [(PXStoryPersistableRecipeManager *)self setHasUserExperiencedFirstPlaybackEver:1];
      }
    }
  }
}

- (void)_invalidateHasUserExperiencedFirstPlaybackEver
{
  id v2 = [(PXStoryPersistableRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHasUserExperiencedFirstPlaybackEver];
}

- (void)_updateHasUserExperiencedPlayback
{
  id v3 = [(PXStoryPersistableRecipeManager *)self model];
  uint64_t v4 = [v3 desiredPlayState];

  if (v4 == 1)
  {
    [(PXStoryPersistableRecipeManager *)self setHasUserExperiencedPlayback:1];
  }
}

- (void)_invalidateHasUserExperiencedPlayback
{
  id v2 = [(PXStoryPersistableRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHasUserExperiencedPlayback];
}

- (void)_updateIsReadyToProducePersistableRecipe
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryPersistableRecipeManager *)self resourcesDataSourceManager];
  int v4 = [v3 isDataSourceFinal];

  uint64_t v5 = [(PXStoryPersistableRecipeManager *)self styleManager];
  uint64_t v6 = [v5 currentStyleAttributes] & 3;

  BOOL v7 = [(PXStoryPersistableRecipeManager *)self isOriginalPersistableRecipeValid];
  id v8 = PLStoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138413058;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = v6 != 0;
    __int16 v16 = 1024;
    BOOL v17 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "%@ areResourcesFinal: %i isCurrentStyleFinal: %i isOriginalPersistableRecipeValid: %i", (uint8_t *)&v10, 0x1Eu);
  }

  if (v6) {
    int v9 = v4;
  }
  else {
    int v9 = 0;
  }
  [(PXStoryPersistableRecipeManager *)self setIsReadyToProducePersistableRecipe:v9 & v7];
}

- (void)_invalidateIsReadyToProducePersistableRecipe
{
  id v2 = [(PXStoryPersistableRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsReadyToProducePersistableRecipe];
}

- (void)_updateOriginalPersistableRecipe
{
  id v6 = [(PXStoryPersistableRecipeManager *)self recipeManager];
  if ([v6 recipeAttributes])
  {
    [(PXStoryPersistableRecipeManager *)self setIsOriginalPersistableRecipeValid:1];
    id v3 = [(PXStoryPersistableRecipeManager *)self recipeManager];
    int v4 = [v3 recipe];
    uint64_t v5 = [v4 sourcePersistableRecipe];
    [(PXStoryPersistableRecipeManager *)self setOriginalPersistableRecipe:v5];
  }
}

- (void)_invalidateOriginalPersistableRecipe
{
  id v2 = [(PXStoryPersistableRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOriginalPersistableRecipe];
}

- (void)_setNeedsUpdate
{
}

- (id)_persistableRecipeWithOriginalPersistableRecipe:(id)a3 recipe:(id)a4 recipeAssetEdits:(id)a5 currentStyle:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v46 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__134590;
  v70 = __Block_byref_object_dispose__134591;
  id v71 = 0;
  __int16 v14 = [MEMORY[0x1E4F8CDD0] createRecipe];
  BOOL v15 = (void *)[v14 mutableCopyWithZone:0];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  if (v11) {
    [v11 overallDurationInfo];
  }
  if (v12)
  {
    [v12 overallDurationInfo];
    if (v60)
    {
      [v12 overallDurationInfo];
      long long v63 = v57;
      long long v64 = v58;
      long long v65 = v59;
      long long v61 = v55;
      long long v62 = v56;
    }
  }
  v54[2] = v63;
  v54[3] = v64;
  v54[4] = v65;
  v54[0] = v61;
  v54[1] = v62;
  [v15 setOverallDurationInfo:v54];
  v43 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke;
  aBlock[3] = &unk_1E5DBDF00;
  id v17 = v16;
  id v51 = v17;
  v53 = &v66;
  id v18 = v15;
  id v52 = v18;
  v45 = (uint64_t (**)(void *, void *, uint64_t, void))_Block_copy(aBlock);
  id v19 = [v13 originalColorGradeCategory];
  v42 = v12;
  uint64_t v44 = [v13 customColorGradeKind];
  id v20 = [v13 songResource];
  if (PXStorySongResourceIsNullResource(v20))
  {
    id v21 = (id)*MEMORY[0x1E4F8D290];
    int v22 = 1;
  }
  else
  {
    id v23 = [v13 songResource];
    id v24 = objc_msgSend(v23, "px_storyResourceSongAsset");

    if (v24)
    {
      int v22 = v45[2](v45, v24, 2, 0);
      v25 = [v24 identifier];
      id v21 = [v17 objectForKeyedSubscript:v25];

      if (!v21)
      {
        uint64_t v32 = PXStoryErrorCreateWithCodeDebugFormat(1, @"recipe doesn't contain audio asset: %@", v26, v27, v28, v29, v30, v31, (uint64_t)v24);
        v33 = (void *)v67[5];
        v67[5] = v32;

        id v21 = 0;
        int v22 = 0;
      }
    }
    else
    {
      id v21 = 0;
      int v22 = 1;
    }
  }
  v34 = objc_msgSend(v20, "px_storyResourceSongAsset");
  uint64_t v35 = [v34 catalog];

  if (v35 != 4)
  {
    *(void *)&long long v55 = 0;
    *((void *)&v55 + 1) = &v55;
    *(void *)&long long v56 = 0x2020000000;
    BYTE8(v56) = 0;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke_2;
    v47[3] = &unk_1E5DBDF28;
    id v48 = v18;
    v49 = &v55;
    [v11 enumerateAssetsWithKind:2 usingBlock:v47];
    v36 = [v46 fallbackSongResource];
    v37 = objc_msgSend(v36, "px_storyResourceSongAsset");

    if (!*(unsigned char *)(*((void *)&v55 + 1) + 24) && [v37 catalog] == 4) {
      v45[2](v45, v37, 1, 0);
    }

    _Block_object_dispose(&v55, 8);
  }
  v38 = objc_msgSend(MEMORY[0x1E4F8CDE0], "createStyleWithOriginalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", v19, v44, v21, objc_msgSend(v13, "isCustomized"));
  [v18 setCurrentStyle:v38];
  v39 = [v11 seedSongIdentifiersByCatalog];
  [v18 setSeedSongIdentifiersByCatalog:v39];

  if (v43) {
    id *v43 = (id) v67[5];
  }
  if (v22) {
    v40 = (void *)[v18 copyWithZone:0];
  }
  else {
    v40 = 0;
  }

  _Block_object_dispose(&v66, 8);
  return v40;
}

BOOL __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [v7 identifier];
  int v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v11 + 40);
    id v12 = +[PFStoryRecipe_PXStoryExtension recipeAssetFromAudioAsset:v7 withCategory:a3 subcategory:a4 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    BOOL v10 = v12 != 0;
    if (v12)
    {
      [*(id *)(a1 + 40) addAsset:v12];
      id v13 = [v12 identifier];
      [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v8];
    }
  }

  return v10;
}

void __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  uint64_t v5 = [v7 catalog];
  int v6 = [v5 isEqual:*MEMORY[0x1E4F8D2A0]];

  if (v6)
  {
    [*(id *)(a1 + 32) addAsset:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)setError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSError *)a3;
  int v6 = self->_error;
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(NSError *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      int v9 = PLStoryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        error = self->_error;
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        __int16 v14 = error;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "%@ error: %@", (uint8_t *)&v11, 0x16u);
      }

      [(PXStoryPersistableRecipeManager *)self signalChange:16];
    }
  }
}

- (void)setRecipeAssetEdits:(id)a3
{
  char v8 = (PXStoryRecipeAssetEdits *)a3;
  uint64_t v5 = self->_recipeAssetEdits;
  if (v5 == v8)
  {
  }
  else
  {
    int v6 = v5;
    BOOL v7 = [(PXStoryRecipeAssetEdits *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_recipeAssetEdits, a3);
      [(PXStoryPersistableRecipeManager *)self signalChange:8];
    }
  }
}

- (void)setPersistableRecipe:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = (PFStoryRecipe *)a3;
  uint64_t v5 = self->_persistableRecipe;
  if (v5 == v4)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [(PFStoryRecipe *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      char v8 = (PFStoryRecipe *)[(PFStoryRecipe *)v4 copyWithZone:0];
      persistableRecipe = self->_persistableRecipe;
      self->_persistableRecipe = v8;

      BOOL v10 = PLStoryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = self->_persistableRecipe;
        int v12 = 138412546;
        __int16 v13 = self;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "%@ persistableRecipe: %@", (uint8_t *)&v12, 0x16u);
      }

      [(PXStoryPersistableRecipeManager *)self signalChange:4];
    }
  }
}

- (void)setIsProducingPersistableRecipe:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_isProducingPersistableRecipe != a3)
  {
    self->_BOOL isProducingPersistableRecipe = a3;
    int v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL isProducingPersistableRecipe = self->_isProducingPersistableRecipe;
      int v6 = 138412546;
      char v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = isProducingPersistableRecipe;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ isProducingPersistableRecipe: %i", (uint8_t *)&v6, 0x12u);
    }

    [(PXStoryPersistableRecipeManager *)self signalChange:2];
  }
}

- (void)setProgress:(id)a3
{
  uint64_t v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    char v7 = v5;
    [(NSProgress *)progress cancel];
    objc_storeStrong((id *)&self->_progress, a3);
    [(PXStoryPersistableRecipeManager *)self setIsProducingPersistableRecipe:self->_progress != 0];
    uint64_t v5 = v7;
  }
}

- (void)setPersistencePermission:(int64_t)a3
{
  if (self->_persistencePermission != a3)
  {
    self->_persistencePermission = a3;
    if (a3 == 1)
    {
      id v5 = [(PXStoryPersistableRecipeManager *)self model];
      int v4 = [v5 configuration];
      [(PXStoryPersistableRecipeManager *)self setHasAnyUserChange:+[PXStoryPersistableRecipeWriterFactory canPersistForConfiguration:v4] ^ 1];
    }
    else
    {
      [(PXStoryPersistableRecipeManager *)self setHasAnyUserChange:0];
    }
  }
}

- (void)setHasAnyUserChange:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_hasAnyUserChange != a3)
  {
    self->_BOOL hasAnyUserChange = a3;
    int v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL hasAnyUserChange = self->_hasAnyUserChange;
      int v8 = 138412546;
      BOOL v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = hasAnyUserChange;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ hasAnyUserChange: %i", (uint8_t *)&v8, 0x12u);
    }

    if (self->_hasAnyUserChange)
    {
      int v6 = [(PXStoryPersistableRecipeManager *)self model];
      uint64_t v7 = [v6 persistencePermission];

      if (v7 != 1) {
        PXAssertGetLog();
      }
      [(PXStoryPersistableRecipeManager *)self _invalidatePersistableRecipe];
    }
  }
}

- (void)setHasUserExperiencedFirstPlaybackEver:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_hasUserExperiencedFirstPlaybackEver != a3)
  {
    self->_BOOL hasUserExperiencedFirstPlaybackEver = a3;
    int v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL hasUserExperiencedFirstPlaybackEver = self->_hasUserExperiencedFirstPlaybackEver;
      int v6 = 138412546;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = hasUserExperiencedFirstPlaybackEver;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ hasUserExperiencedFirstPlaybackEver: %i", (uint8_t *)&v6, 0x12u);
    }

    if (self->_hasUserExperiencedFirstPlaybackEver) {
      [(PXStoryPersistableRecipeManager *)self _invalidatePersistableRecipe];
    }
  }
}

- (void)setHasUserExperiencedPlayback:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_hasUserExperiencedPlayback != a3)
  {
    self->_BOOL hasUserExperiencedPlayback = a3;
    int v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL hasUserExperiencedPlayback = self->_hasUserExperiencedPlayback;
      int v6 = 138412546;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = hasUserExperiencedPlayback;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ hasUserExperiencedPlayback: %i", (uint8_t *)&v6, 0x12u);
    }

    [(PXStoryPersistableRecipeManager *)self _invalidateHasUserExperiencedFirstPlaybackEver];
  }
}

- (void)setIsReadyToProducePersistableRecipe:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_isReadyToProducePersistableRecipe != a3)
  {
    self->_BOOL isReadyToProducePersistableRecipe = a3;
    int v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL isReadyToProducePersistableRecipe = self->_isReadyToProducePersistableRecipe;
      int v6 = 138412546;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = isReadyToProducePersistableRecipe;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ isReadyToProducePersistableRecipe: %i", (uint8_t *)&v6, 0x12u);
    }

    [(PXStoryPersistableRecipeManager *)self signalChange:1];
    [(PXStoryPersistableRecipeManager *)self _invalidatePersistableRecipe];
  }
}

- (void)setIsOriginalPersistableRecipeValid:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_isOriginalPersistableRecipeValid != a3)
  {
    self->_BOOL isOriginalPersistableRecipeValid = a3;
    int v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL isOriginalPersistableRecipeValid = self->_isOriginalPersistableRecipeValid;
      int v6 = 138412546;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = isOriginalPersistableRecipeValid;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@ isOriginalPersistableRecipeValid: %i", (uint8_t *)&v6, 0x12u);
    }

    [(PXStoryPersistableRecipeManager *)self _invalidateHasUserExperiencedFirstPlaybackEver];
    [(PXStoryPersistableRecipeManager *)self _invalidateIsReadyToProducePersistableRecipe];
  }
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryPersistableRecipeManager;
  [(PXStoryPersistableRecipeManager *)&v4 didPerformChanges];
  id v3 = [(PXStoryPersistableRecipeManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryPersistableRecipeManager *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryPersistableRecipeManager;
  [(PXStoryPersistableRecipeManager *)&v6 performChanges:v4];
}

- (void)dealloc
{
  [(NSProgress *)self->_progress cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryPersistableRecipeManager;
  [(PXStoryPersistableRecipeManager *)&v3 dealloc];
}

- (PXStoryPersistableRecipeManager)initWithModel:(id)a3 styleManager:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryPersistableRecipeManager;
  uint64_t v10 = [(PXStoryPersistableRecipeManager *)&v46 init];
  BOOL v11 = v10;
  if (v10)
  {
    SEL v43 = a2;
    objc_storeStrong((id *)&v10->_model, a3);
    [(PXStoryModel *)v11->_model registerChangeObserver:v11 context:ModelObservationContext_134568];
    uint64_t v12 = [v8 recipeManager];
    recipeManager = v11->_recipeManager;
    v11->_recipeManager = (PXStoryRecipeManager *)v12;

    [(PXStoryRecipeManager *)v11->_recipeManager registerChangeObserver:v11 context:RecipeManagerObservationContext_134569];
    uint64_t v14 = [v8 resourcesDataSourceManager];
    resourcesDataSourceManager = v11->_resourcesDataSourceManager;
    v11->_resourcesDataSourceManager = (PXStoryResourcesDataSourceManager *)v14;

    [(PXStoryResourcesDataSourceManager *)v11->_resourcesDataSourceManager registerChangeObserver:v11 context:ResourcesDataSourceManagerObservationContext];
    objc_storeStrong((id *)&v11->_styleManager, a4);
    [(PXStoryStyleManager *)v11->_styleManager registerChangeObserver:v11 context:StyleManagerObservationContext];
    uint64_t v16 = [v8 configuration];
    uint64_t v17 = [v16 errorReporter];
    errorReporter = v11->_errorReporter;
    v11->_errorReporter = (PXStoryErrorReporter *)v17;

    uint64_t v19 = [v16 storyQueue];
    storyQueue = v11->_storyQueue;
    v11->_storyQueue = (OS_dispatch_queue *)v19;

    id v21 = v11->_storyQueue;
    int v22 = [(PXStoryRecipeManager *)v11->_recipeManager storyQueue];

    if (v21 != v22)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:v43, v11, @"PXStoryPersistableRecipeManager.m", 88, @"Invalid parameter not satisfying: %@", @"_storyQueue == _recipeManager.storyQueue" object file lineNumber description];
    }
    id v23 = v11->_storyQueue;
    id v24 = [(PXStoryResourcesDataSourceManager *)v11->_resourcesDataSourceManager storyQueue];

    if (v23 != v24)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:v43, v11, @"PXStoryPersistableRecipeManager.m", 89, @"Invalid parameter not satisfying: %@", @"_storyQueue == _resourcesDataSourceManager.storyQueue" object file lineNumber description];
    }
    v25 = v11->_storyQueue;
    uint64_t v26 = [(PXStoryStyleManager *)v11->_styleManager storyQueue];

    if (v25 != v26)
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:v43, v11, @"PXStoryPersistableRecipeManager.m", 90, @"Invalid parameter not satisfying: %@", @"_storyQueue == _styleManager.storyQueue" object file lineNumber description];
    }
    uint64_t v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    id v28 = objc_claimAutoreleasedReturnValue();
    uint64_t v29 = (const char *)[v28 UTF8String];
    uint64_t v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v32 = dispatch_queue_create(v29, v31);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v32;

    uint64_t v34 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v11 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v11->_updater;
    v11->_updater = (PXUpdater *)v34;

    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updateOriginalPersistableRecipe];
    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updateIsReadyToProducePersistableRecipe];
    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updateHasUserExperiencedPlayback];
    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updateHasUserExperiencedFirstPlaybackEver];
    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updatePersistencePermission];
    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updatePersistableRecipe];
    v36 = PLStoryGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = v11->_recipeManager;
      v38 = v11->_resourcesDataSourceManager;
      *(_DWORD *)buf = 138413058;
      id v48 = v11;
      __int16 v49 = 2112;
      v50 = v37;
      __int16 v51 = 2112;
      id v52 = v38;
      __int16 v53 = 2112;
      id v54 = v9;
      _os_log_impl(&dword_1A9AE7000, v36, OS_LOG_TYPE_DEBUG, "%@ initialized with recipeManager: %@ resourcesDataSourceManager: %@ styleManager: %@", buf, 0x2Au);
    }

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __62__PXStoryPersistableRecipeManager_initWithModel_styleManager___block_invoke;
    v44[3] = &unk_1E5DD0FA8;
    v45 = v11;
    [(PXStoryPersistableRecipeManager *)v45 performChanges:v44];
  }
  return v11;
}

uint64_t __62__PXStoryPersistableRecipeManager_initWithModel_styleManager___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateOriginalPersistableRecipe];
  [*(id *)(a1 + 32) _invalidateIsReadyToProducePersistableRecipe];
  [*(id *)(a1 + 32) _invalidateHasUserExperiencedPlayback];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidatePersistencePermission];
}

- (PXStoryPersistableRecipeManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPersistableRecipeManager.m", 66, @"%s is not available as initializer", "-[PXStoryPersistableRecipeManager init]");

  abort();
}

@end