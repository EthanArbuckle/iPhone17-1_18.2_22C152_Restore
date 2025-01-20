@interface PXStoryResourcesDataSourceManager
- (BOOL)isDataSourceFinal;
- (OS_dispatch_queue)storyQueue;
- (PXStoryConfiguration)configuration;
- (PXStoryRecipe)recipe;
- (PXStoryRecipeManager)recipeManager;
- (PXStoryResourcesDataSource)dataSource;
- (PXStoryResourcesDataSourceManager)init;
- (PXStoryResourcesDataSourceManager)initWithRecipeManager:(id)a3;
- (PXUpdater)updater;
- (void)_invalidateDataSource;
- (void)_invalidateIsDataSourceFinal;
- (void)_invalidateRecipe;
- (void)_setNeedsUpdate;
- (void)_updateDataSource;
- (void)_updateIsDataSourceFinal;
- (void)_updateRecipe;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsDataSourceFinal:(BOOL)a3;
- (void)setRecipe:(id)a3;
@end

@implementation PXStoryResourcesDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (PXStoryRecipe)recipe
{
  return self->_recipe;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isDataSourceFinal
{
  return self->_isDataSourceFinal;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PXStoryResourcesDataSourceManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCCD20;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryResourcesDataSourceManager *)self performChanges:v5];
}

void __66__PXStoryResourcesDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40) != RecipeManagerObservationContext_121765)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryResourcesDataSourceManager.m" lineNumber:174 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = v3;
    [*(id *)(a1 + 32) _invalidateRecipe];
    [*(id *)(a1 + 32) _invalidateIsDataSourceFinal];
    id v3 = v5;
  }
}

- (void)_updateIsDataSourceFinal
{
  id v3 = [(PXStoryResourcesDataSourceManager *)self recipeManager];
  -[PXStoryResourcesDataSourceManager setIsDataSourceFinal:](self, "setIsDataSourceFinal:", ([v3 recipeAttributes] & 3) != 0);
}

- (void)_invalidateIsDataSourceFinal
{
  id v2 = [(PXStoryResourcesDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsDataSourceFinal];
}

- (void)_updateDataSource
{
  id v3 = [(PXStoryResourcesDataSourceManager *)self recipe];
  v14 = [PXStoryResourcesDataSource alloc];
  uint64_t v4 = [v3 keyAsset];
  id v5 = [v3 curatedAssets];
  v6 = [v3 allAssets];
  v7 = [v3 movieHighlights];
  v8 = [v3 detailedSaliency];
  v9 = [v3 chapterCollection];
  v10 = [v3 assetCollection];
  if (v3) {
    [v3 overallDurationInfo];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v11 = [(PXStoryResourcesDataSourceManager *)self configuration];
  uint64_t v12 = [(PXStoryResourcesDataSource *)v14 initWithKeyAsset:v4 displayAssets:v5 availableDisplayAssets:v6 movieHighlights:v7 detailedSaliency:v8 chapterCollection:v9 audioAssets:0 assetCollection:v10 overallDurationInfo:v16 storyConfiguration:v11];
  v15 = (void *)v4;
  v13 = (void *)v12;
  [(PXStoryResourcesDataSourceManager *)self setDataSource:v12];
}

- (void)_invalidateDataSource
{
  id v2 = [(PXStoryResourcesDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDataSource];
}

- (void)_updateRecipe
{
  id v4 = [(PXStoryResourcesDataSourceManager *)self recipeManager];
  id v3 = [v4 recipe];
  [(PXStoryResourcesDataSourceManager *)self setRecipe:v3];
}

- (void)_invalidateRecipe
{
  id v2 = [(PXStoryResourcesDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRecipe];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesDataSourceManager;
  [(PXStoryResourcesDataSourceManager *)&v4 didPerformChanges];
  id v3 = [(PXStoryResourcesDataSourceManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryResourcesDataSourceManager *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesDataSourceManager;
  [(PXStoryResourcesDataSourceManager *)&v6 performChanges:v4];
}

- (void)setIsDataSourceFinal:(BOOL)a3
{
  if (self->_isDataSourceFinal != a3)
  {
    if (self->_isDataSourceFinal && !a3) {
      PXAssertGetLog();
    }
    self->_isDataSourceFinal = a3;
    [(PXStoryResourcesDataSourceManager *)self signalChange:2];
  }
}

- (void)setDataSource:(id)a3
{
  v7 = (PXStoryResourcesDataSource *)a3;
  id v5 = self->_dataSource;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryResourcesDataSource *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      [(PXStoryResourcesDataSourceManager *)self signalChange:1];
    }
  }
}

- (PXStoryResourcesDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXStoryResourcesDataSourceManager.m" lineNumber:91 description:@"data source not set"];

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)setRecipe:(id)a3
{
  id v5 = (PXStoryRecipe *)a3;
  char v6 = self->_recipe;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(PXStoryRecipe *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      v9 = self->_recipe;
      objc_storeStrong((id *)&self->_recipe, a3);
      id v10 = [(PXStoryRecipe *)v5 keyAsset];
      id v11 = [(PXStoryRecipe *)v9 keyAsset];
      if (v10 == v11)
      {
      }
      else
      {
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_26;
        }
      }
      id v13 = [(PXStoryRecipe *)v5 curatedAssets];
      id v14 = [(PXStoryRecipe *)v9 curatedAssets];
      if (v13 == v14)
      {
      }
      else
      {
        int v15 = [v13 isEqual:v14];

        if (!v15) {
          goto LABEL_25;
        }
      }
      id v16 = [(PXStoryRecipe *)v5 movieHighlights];
      id v17 = [(PXStoryRecipe *)v9 movieHighlights];
      v37 = v16;
      if (v16 == v17)
      {
      }
      else
      {
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_24;
        }
      }
      id v19 = [(PXStoryRecipe *)v5 detailedSaliency];
      id v20 = [(PXStoryRecipe *)v9 detailedSaliency];
      v35 = v20;
      v36 = v19;
      if (v19 == v20)
      {
      }
      else
      {
        v21 = v20;
        int v22 = [v19 isEqual:v20];

        if (!v22) {
          goto LABEL_23;
        }
      }
      id v23 = [(PXStoryRecipe *)v5 chapterCollection];
      id v24 = [(PXStoryRecipe *)v9 chapterCollection];
      v33 = v24;
      v34 = v23;
      if (v23 == v24)
      {
      }
      else
      {
        v25 = v24;
        int v26 = [v23 isEqual:v24];

        if (!v26)
        {

LABEL_23:
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
          [(PXStoryResourcesDataSourceManager *)self _invalidateDataSource];
LABEL_28:

          goto LABEL_29;
        }
      }
      v27 = [(PXStoryRecipe *)v5 assetCollection];
      v28 = [(PXStoryRecipe *)v9 assetCollection];
      if (v27 == v28)
      {
        v30 = v28;
        if (v5)
        {
          [(PXStoryRecipe *)v5 overallDurationInfo];
        }
        else
        {
          memset(v42, 0, sizeof(v42));
          long long v41 = 0u;
          memset(&v40[4], 0, 32);
        }
        if (v9)
        {
          [(PXStoryRecipe *)v9 overallDurationInfo];
          uint64_t v31 = v38[0];
        }
        else
        {
          uint64_t v31 = 0;
          memset(v40, 0, 32);
          long long v39 = 0u;
          memset(v38, 0, sizeof(v38));
        }
        if (v40[4] != v31) {
          goto LABEL_42;
        }
        long long v44 = v41;
        long long v43 = v39;
        CMTime time1 = *(CMTime *)&v40[5];
        CMTime time2 = *(CMTime *)&v38[1];
        if (CMTimeCompare(&time1, &time2)
          || (*(_OWORD *)&time1.value = v44,
              time1.epoch = v42[0],
              *(_OWORD *)&time2.value = v43,
              time2.epoch = v40[0],
              CMTimeCompare(&time1, &time2)))
        {
LABEL_42:
          BOOL v32 = 0;
        }
        else
        {
          CMTime time1 = *(CMTime *)&v42[1];
          CMTime time2 = *(CMTime *)&v40[1];
          BOOL v32 = CMTimeCompare(&time1, &time2) == 0;
        }
        v28 = v30;
        char v29 = !v32;
      }
      else
      {
        char v29 = 1;
      }

      if ((v29 & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
LABEL_29:
}

- (PXStoryResourcesDataSourceManager)initWithRecipeManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryResourcesDataSourceManager;
  char v6 = [(PXStoryResourcesDataSourceManager *)&v17 init];
  v7 = v6;
  if (v6)
  {
    [(PXStoryResourcesDataSourceManager *)v6 copyLogConfigurationFrom:v5];
    objc_storeStrong((id *)&v7->_recipeManager, a3);
    [(PXStoryRecipeManager *)v7->_recipeManager registerChangeObserver:v7 context:RecipeManagerObservationContext_121765];
    uint64_t v8 = [(PXStoryRecipeManager *)v7->_recipeManager storyQueue];
    storyQueue = v7->_storyQueue;
    v7->_storyQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [(PXStoryRecipeManager *)v7->_recipeManager configuration];
    configuration = v7->_configuration;
    v7->_configuration = (PXStoryConfiguration *)v10;

    uint64_t v12 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v12;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateRecipe];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateDataSource];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateIsDataSourceFinal];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PXStoryResourcesDataSourceManager_initWithRecipeManager___block_invoke;
    v15[3] = &unk_1E5DBC388;
    id v16 = v7;
    [(PXStoryResourcesDataSourceManager *)v16 performChanges:v15];
  }
  return v7;
}

uint64_t __59__PXStoryResourcesDataSourceManager_initWithRecipeManager___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateRecipe];
  [*(id *)(a1 + 32) _invalidateDataSource];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateIsDataSourceFinal];
}

- (PXStoryResourcesDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesDataSourceManager.m", 42, @"%s is not available as initializer", "-[PXStoryResourcesDataSourceManager init]");

  abort();
}

@end