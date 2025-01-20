@interface PXPhotosGridActionManager
+ (id)actionsWithActionPerformers;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)supportsActionType:(id)a3;
- (NSDictionary)actionPerformersByType;
- (NSMapTable)actionTypeByBarButtonItem;
- (PXPhotosGridActionManager)init;
- (PXPhotosGridActionManager)initWithViewModel:(id)a3;
- (PXPhotosViewModel)viewModel;
- (id)actionPerformerForActionType:(id)a3;
- (id)activityForActionType:(id)a3;
- (id)barButtonItemForActionType:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)standardActionForActionType:(id)a3;
- (void)_handleBarButtonItem:(id)a3;
@end

@implementation PXPhotosGridActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypeByBarButtonItem, 0);
  objc_storeStrong((id *)&self->_actionPerformersByType, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (NSMapTable)actionTypeByBarButtonItem
{
  return self->_actionTypeByBarButtonItem;
}

- (NSDictionary)actionPerformersByType
{
  return self->_actionPerformersByType;
}

- (PXPhotosViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXPhotosViewModel *)WeakRetained;
}

- (id)activityForActionType:(id)a3
{
  v3 = [(PXPhotosGridActionManager *)self actionPerformerForActionType:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 activity];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)standardActionForActionType:(id)a3
{
  v3 = [(PXPhotosGridActionManager *)self actionPerformerForActionType:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 menuElement];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_handleBarButtonItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(PXPhotosGridActionManager *)self actionTypeByBarButtonItem];
    id v7 = [v5 objectForKey:v4];

    v6 = [(PXPhotosGridActionManager *)self actionPerformerForActionType:v7];
    [v6 performActionWithCompletionHandler:0];
  }
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotosGridActionManager *)self actionPerformerForActionType:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 localizedTitleForUseCase:1];
    v8 = [v6 barButtonItemWithTarget:self action:sel__handleBarButtonItem_];
    if (!v8) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:0 target:self action:sel__handleBarButtonItem_];
    }
    v9 = [v8 title];

    if (!v9) {
      [v8 setTitle:v7];
    }

    if (v8)
    {
      v10 = [(PXPhotosGridActionManager *)self actionTypeByBarButtonItem];
      [v10 setObject:v4 forKey:v8];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PXPhotosGridActionManager *)self actionPerformersByType];
  id v8 = objc_alloc((Class)[v7 objectForKeyedSubscript:v6]);
  v9 = [(PXPhotosGridActionManager *)self viewModel];
  v10 = (void *)[v8 initWithViewModel:v9 actionType:v6];

  v11 = [v10 localizedTitleForUseCase:a4];

  return v11;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  if ([(PXPhotosGridActionManager *)self canPerformActionType:v4])
  {
    v5 = [(PXPhotosGridActionManager *)self actionPerformersByType];
    id v6 = objc_alloc((Class)[v5 objectForKeyedSubscript:v4]);
    id v7 = [(PXPhotosGridActionManager *)self viewModel];
    id v8 = (void *)[v6 initWithViewModel:v7 actionType:v4];

    v9 = [(PXActionManager *)self performerDelegate];
    [v8 setDelegate:v9];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)supportsActionType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(PXPhotosGridActionManager *)self actionPerformersByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotosGridActionManager *)self viewModel];
  uint64_t v6 = (void *)v5;
  char v7 = 0;
  if (v4 && v5)
  {
    if (![(PXActionManager *)self isActionTypeAllowed:v4]) {
      goto LABEL_7;
    }
    id v8 = [v6 currentLens];
    int v9 = [v8 allowsActionType:v4];

    if (!v9) {
      goto LABEL_7;
    }
    v10 = [(PXPhotosGridActionManager *)self actionPerformersByType];
    v11 = (void *)[v10 objectForKeyedSubscript:v4];

    if (v11) {
      char v7 = [v11 canPerformActionType:v4 withViewModel:v6];
    }
    else {
LABEL_7:
    }
      char v7 = 0;
  }

  return v7;
}

- (PXPhotosGridActionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridActionManager.m", 184, @"%s is not available as initializer", "-[PXPhotosGridActionManager init]");

  abort();
}

- (PXPhotosGridActionManager)initWithViewModel:(id)a3
{
  v14[24] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosGridActionManager;
  uint64_t v5 = [(PXPhotosGridActionManager *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    v13[0] = @"PXPhotosGridActionShare";
    v14[0] = objc_opt_class();
    v13[1] = @"PXPhotosGridActionSetAllLibrariesFilter";
    v14[1] = objc_opt_class();
    v13[2] = @"PXPhotosGridActionSetPersonalLibraryFilter";
    v14[2] = objc_opt_class();
    v13[3] = @"PXPhotosGridActionSetSharedLibraryFilter";
    v14[3] = objc_opt_class();
    v13[4] = @"PXPhotosGridActionToggleSharedLibraryBadge";
    v14[4] = objc_opt_class();
    v13[5] = @"PXPhotosGridActionShowFiltersMenu";
    v14[5] = objc_opt_class();
    v13[6] = @"PXPhotosPickerGridActionShowFiltersMenu";
    v14[6] = objc_opt_class();
    v13[7] = @"PXPhotosGridActionUnfilter";
    v14[7] = objc_opt_class();
    v13[8] = @"PXPhotosGridActionToggleFavoritesFilter";
    v14[8] = objc_opt_class();
    v13[9] = @"PXPhotosGridActionToggleEditedFilter";
    v14[9] = objc_opt_class();
    v13[10] = @"PXPhotosGridActionToggleImagesFilter";
    v14[10] = objc_opt_class();
    v13[11] = @"PXPhotosGridActionToggleVideosFilter";
    v14[11] = objc_opt_class();
    v13[12] = @"PXPhotosGridActionToggleShowOnlyScreenshotsFilter";
    v14[12] = objc_opt_class();
    v13[13] = @"PXPhotosGridActionToggleIncludeScreenshotsFilter";
    v14[13] = objc_opt_class();
    v13[14] = @"PXPhotosGridActionToggleLiveFilter";
    v14[14] = objc_opt_class();
    v13[15] = @"PXPhotosGridActionTogglePortraitFilter";
    v14[15] = objc_opt_class();
    v13[16] = @"PXPhotosGridActionShowFilters";
    v14[16] = objc_opt_class();
    v13[17] = @"PXPhotosGridActionToggleAspectFit";
    v14[17] = objc_opt_class();
    v13[18] = @"PXPhotosGridActionZoomIn";
    v14[18] = objc_opt_class();
    v13[19] = @"PXPhotosGridActionZoomOut";
    v14[19] = objc_opt_class();
    v13[20] = @"PXPhotosGridActionToggleFaceMode";
    v14[20] = objc_opt_class();
    v13[21] = @"PXPhotosGridActionSearch";
    v14[21] = objc_opt_class();
    v13[22] = @"PXPhotosGridActionTogglePreviewHeader";
    v14[22] = objc_opt_class();
    v13[23] = @"PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter";
    v14[23] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:24];
    actionPerformersByType = v6->_actionPerformersByType;
    v6->_actionPerformersByType = (NSDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    actionTypeByBarButtonItem = v6->_actionTypeByBarButtonItem;
    v6->_actionTypeByBarButtonItem = (NSMapTable *)v9;
  }
  return v6;
}

+ (id)actionsWithActionPerformers
{
  if (actionsWithActionPerformers_onceToken_184037 != -1) {
    dispatch_once(&actionsWithActionPerformers_onceToken_184037, &__block_literal_global_184038);
  }
  v2 = (void *)actionsWithActionPerformers_actionsWithPerformers_184039;
  return v2;
}

void __56__PXPhotosGridActionManager_actionsWithActionPerformers__block_invoke()
{
  v4[24] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PXPhotosGridActionShare";
  v4[1] = @"PXPhotosGridActionSetAllLibrariesFilter";
  v4[2] = @"PXPhotosGridActionSetPersonalLibraryFilter";
  v4[3] = @"PXPhotosGridActionSetSharedLibraryFilter";
  v4[4] = @"PXPhotosGridActionToggleSharedLibraryBadge";
  v4[5] = @"PXPhotosGridActionShowFiltersMenu";
  v4[6] = @"PXPhotosPickerGridActionShowFiltersMenu";
  v4[7] = @"PXPhotosGridActionUnfilter";
  v4[8] = @"PXPhotosGridActionToggleFavoritesFilter";
  v4[9] = @"PXPhotosGridActionToggleEditedFilter";
  v4[10] = @"PXPhotosGridActionToggleImagesFilter";
  v4[11] = @"PXPhotosGridActionToggleVideosFilter";
  v4[12] = @"PXPhotosGridActionToggleShowOnlyScreenshotsFilter";
  v4[13] = @"PXPhotosGridActionToggleIncludeScreenshotsFilter";
  v4[14] = @"PXPhotosGridActionToggleLiveFilter";
  v4[15] = @"PXPhotosGridActionTogglePortraitFilter";
  v4[16] = @"PXPhotosGridActionShowFilters";
  v4[17] = @"PXPhotosGridActionToggleAspectFit";
  v4[18] = @"PXPhotosGridActionZoomIn";
  v4[19] = @"PXPhotosGridActionZoomOut";
  v4[20] = @"PXPhotosGridActionToggleFaceMode";
  v4[21] = @"PXPhotosGridActionSearch";
  v4[22] = @"PXPhotosGridActionTogglePreviewHeader";
  v4[23] = @"PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:24];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)actionsWithActionPerformers_actionsWithPerformers_184039;
  actionsWithActionPerformers_actionsWithPerformers_184039 = v2;
}

@end