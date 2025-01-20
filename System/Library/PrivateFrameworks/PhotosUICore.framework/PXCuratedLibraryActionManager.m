@interface PXCuratedLibraryActionManager
+ (id)actionsWithActionPerformers;
- (BOOL)canPerformActionType:(id)a3;
- (NSDictionary)actionPerformersByType;
- (NSDictionary)assetCollectionActionPerformersByType;
- (NSDictionary)constructorSpecificActionPerformersByType;
- (PXCuratedLibraryActionManager)init;
- (PXCuratedLibraryActionManager)initWithViewModel:(id)a3;
- (PXCuratedLibraryViewModel)viewModel;
- (id)actionPerformerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3 withAssetCollectionReference:(id)a4;
- (id)actionPerformerForHitTestResult:(id)a3;
- (id)actionPerformerForNavigatingToNextZoomLevelInLayout:(id)a3;
- (id)curationDebugPerformerAssetCollectionReference:(id)a3 diagnosticLayout:(id)a4;
- (id)ellipsisButtonActionPerformerWithAssetCollectionReference:(id)a3;
- (id)ellipsisButtonActionPerformerWithAssetCollectionReferenceProvider:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)showAllActionPerformerWithAssetCollectionReference:(id)a3;
- (id)tapToRadarPerformerAssetCollectionReference:(id)a3 diagnosticLayout:(id)a4;
@end

@implementation PXCuratedLibraryActionManager

- (id)actionPerformerForActionType:(id)a3
{
  id v5 = a3;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:v5])
  {
    v6 = [(PXCuratedLibraryActionManager *)self actionPerformersByType];
    v7 = (void *)[v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      v15 = [(PXCuratedLibraryActionManager *)self assetCollectionActionPerformersByType];
      uint64_t v16 = [v15 objectForKeyedSubscript:v5];

      if (!v16)
      {
        v17 = [(PXCuratedLibraryActionManager *)self constructorSpecificActionPerformersByType];
        uint64_t v18 = [v17 objectForKeyedSubscript:v5];

        if (v18)
        {
          v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 296, @"You must use the specific action performer constructor for %@ Action type.", v5 object file lineNumber description];
        }
        else
        {
          v19 = +[PXCuratedLibraryActionManager actionsWithActionPerformers];
          uint64_t v20 = [v19 containsObject:v5];

          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          v22 = v21;
          if (v20) {
            [v21 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 300, @"Unknown action type \"%@\"", v5 object file lineNumber description];
          }
          else {
            [v21 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 298, @"The %@ action isn't currently handled by a PXCuratedLibraryActionPerformer.", v5 object file lineNumber description];
          }
        }

        abort();
      }
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryActionManager.m" lineNumber:294 description:@"You must use the PXCuratedLibraryAssetCollectionActionPerformer constructor method for this type of action."];

      abort();
    }
    int v8 = [v7 instancesRespondToSelector:sel_initWithActionType_viewModel_];
    id v9 = objc_alloc((Class)v7);
    v10 = v9;
    if (v8)
    {
      v11 = [(PXCuratedLibraryActionManager *)self viewModel];
      v12 = (void *)[v10 initWithActionType:v5 viewModel:v11];
    }
    else
    {
      v12 = (void *)[v9 initWithActionType:v5];
    }
    v13 = [(PXActionManager *)self performerDelegate];
    [v12 setDelegate:v13];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryActionManager *)self viewModel];
  v6 = [v5 allowedActions];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (PXCuratedLibraryViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXCuratedLibraryViewModel *)WeakRetained;
}

- (NSDictionary)actionPerformersByType
{
  return self->_actionPerformersByType;
}

- (PXCuratedLibraryActionManager)initWithViewModel:(id)a3
{
  v20[24] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryActionManager;
  id v5 = [(PXCuratedLibraryActionManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    v19[0] = @"PXCuratedLibraryActionEnterSelectMode";
    v20[0] = objc_opt_class();
    v19[1] = @"PXCuratedLibraryActionCancelSelectMode";
    v20[1] = objc_opt_class();
    v19[2] = @"PXCuratedLibraryActionAllPhotosZoomIn";
    v20[2] = objc_opt_class();
    v19[3] = @"PXCuratedLibraryActionAllPhotosZoomOut";
    v20[3] = objc_opt_class();
    v19[4] = @"PXCuratedLibraryActionShowSidebar";
    v20[4] = objc_opt_class();
    v19[5] = @"PXCuratedLibraryActionSetAllLibrariesFilter";
    v20[5] = objc_opt_class();
    v19[6] = @"PXCuratedLibraryActionSetPersonalLibraryFilter";
    v20[6] = objc_opt_class();
    v19[7] = @"PXCuratedLibraryActionSetSharedLibraryFilter";
    v20[7] = objc_opt_class();
    v19[8] = @"PXCuratedLibraryActionToggleSharedLibraryBadge";
    v20[8] = objc_opt_class();
    v19[9] = @"PXCuratedLibraryActionShowFiltersMenu";
    v20[9] = objc_opt_class();
    v19[10] = @"PXCuratedLibraryActionShowFilters";
    v20[10] = objc_opt_class();
    v19[11] = @"PXCuratedLibraryActionUnfilter";
    v20[11] = objc_opt_class();
    v19[12] = @"PXCuratedLibraryActionRemoveFilters";
    v20[12] = objc_opt_class();
    v19[13] = @"PXCuratedLibraryActionToggleFavoriteFilter";
    v20[13] = objc_opt_class();
    v19[14] = @"PXCuratedLibraryActionToggleEditFilter";
    v20[14] = objc_opt_class();
    v19[15] = @"PXCuratedLibraryActionToggleImageFilter";
    v20[15] = objc_opt_class();
    v19[16] = @"PXCuratedLibraryActionToggleVideoFilter";
    v20[16] = objc_opt_class();
    v19[17] = @"PXCuratedLibraryActionToggleShowOnlyScreenshotFilter";
    v20[17] = objc_opt_class();
    v19[18] = @"PXCuratedLibraryActionToggleIncludeScreenshotFilter";
    v20[18] = objc_opt_class();
    v19[19] = @"PXCuratedLibraryActionToggleShowOnlySharedWithYouFilter";
    v20[19] = objc_opt_class();
    v19[20] = @"PXCuratedLibraryActionToggleIncludeSharedWithYouFilter";
    v20[20] = objc_opt_class();
    v19[21] = @"PXCuratedLibraryActionToggleLiveFilter";
    v20[21] = objc_opt_class();
    v19[22] = @"PXCuratedLibraryActionTogglePortraitFilter";
    v20[22] = objc_opt_class();
    v19[23] = @"PXCuratedLibraryActionAllPhotosToggleAspectFit";
    v20[23] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:24];
    actionPerformersByType = v6->_actionPerformersByType;
    v6->_actionPerformersByType = (NSDictionary *)v7;

    v17[0] = @"PXCuratedLibraryActionSelectAllToggle";
    v18[0] = objc_opt_class();
    v17[1] = @"PXCuratedLibraryActionShowAll";
    v18[1] = objc_opt_class();
    v17[2] = @"PXCuratedLibraryActionShare";
    v18[2] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    assetCollectionActionPerformersByType = v6->_assetCollectionActionPerformersByType;
    v6->_assetCollectionActionPerformersByType = (NSDictionary *)v9;

    v15[0] = @"PXCuratedLibraryActionEllipsisButton";
    v16[0] = objc_opt_class();
    v15[1] = @"PXCuratedLibraryActionTapToRadar";
    v16[1] = objc_opt_class();
    v15[2] = @"PXCuratedLibraryActionCurationDebug";
    v16[2] = objc_opt_class();
    v15[3] = @"PXCuratedLibraryActionNavigateToNextZoomLevel";
    v16[3] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    constructorSpecificActionPerformersByType = v6->_constructorSpecificActionPerformersByType;
    v6->_constructorSpecificActionPerformersByType = (NSDictionary *)v11;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constructorSpecificActionPerformersByType, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionPerformersByType, 0);
  objc_storeStrong((id *)&self->_actionPerformersByType, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (NSDictionary)constructorSpecificActionPerformersByType
{
  return self->_constructorSpecificActionPerformersByType;
}

- (NSDictionary)assetCollectionActionPerformersByType
{
  return self->_assetCollectionActionPerformersByType;
}

- (id)actionPerformerForNavigatingToNextZoomLevelInLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryActionManager *)self viewModel];
  uint64_t v6 = [v5 zoomLevel];
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 selectionSnapshot];
  int v8 = v7;
  if (v7)
  {
    [v7 firstSelectedIndexPath];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }

  if ((unint64_t)(v6 - 1) > 1 || (void)v17 == *(void *)off_1E5DAAED8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v10 = [v5 currentDataSource];
    v16[0] = v17;
    v16[1] = v18;
    uint64_t v11 = [v10 assetCollectionReferenceAtSectionIndexPath:v16];

    v12 = [v4 spriteReferenceForObjectReference:v11];
    if (v6 == 1) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 3;
    }
    objc_super v14 = [[PXCuratedLibraryHitTestResult alloc] initWithControl:v13 spriteReference:v12 layout:v4 assetCollectionReference:v11];
    uint64_t v9 = [(PXCuratedLibraryActionManager *)self actionPerformerForHitTestResult:v14];
  }
  return v9;
}

- (id)actionPerformerForHitTestResult:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([v4 control] - 2) <= 2
    && [(PXCuratedLibraryActionManager *)self canPerformActionType:@"PXCuratedLibraryActionNavigateToNextZoomLevel"])
  {
    id v5 = [_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer alloc];
    uint64_t v6 = [(PXCuratedLibraryActionManager *)self viewModel];
    uint64_t v7 = [v4 layout];
    int v8 = [v4 spriteReference];
    uint64_t v9 = [(_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *)v5 initWithActionType:@"PXCuratedLibraryActionNavigateToNextZoomLevel" viewModel:v6 layout:v7 hitSpriteReference:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)curationDebugPerformerAssetCollectionReference:(id)a3 diagnosticLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:@"PXCuratedLibraryActionCurationDebug"])
  {
    int v8 = [PXCuratedLibraryCurationDebugActionPerformer alloc];
    uint64_t v9 = [(PXCuratedLibraryActionManager *)self viewModel];
    v10 = [(PXCuratedLibraryCurationDebugActionPerformer *)v8 initWithViewModel:v9 assetCollectionReference:v6 diagnosticLayout:v7];

    uint64_t v11 = [(PXActionManager *)self performerDelegate];
    [(PXActionPerformer *)v10 setDelegate:v11];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tapToRadarPerformerAssetCollectionReference:(id)a3 diagnosticLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:@"PXCuratedLibraryActionTapToRadar"])
  {
    int v8 = [PXCuratedLibraryTapToRadarActionPerformer alloc];
    uint64_t v9 = [(PXCuratedLibraryActionManager *)self viewModel];
    v10 = [(PXCuratedLibraryTapToRadarActionPerformer *)v8 initWithViewModel:v9 assetCollectionReference:v6 diagnosticLayout:v7];

    uint64_t v11 = [(PXActionManager *)self performerDelegate];
    [(PXActionPerformer *)v10 setDelegate:v11];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)showAllActionPerformerWithAssetCollectionReference:(id)a3
{
  id v4 = a3;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:@"PXCuratedLibraryActionShowAll"])
  {
    id v5 = [PXCuratedLibraryShowAllActionPerformer alloc];
    id v6 = [(PXCuratedLibraryActionManager *)self viewModel];
    id v7 = [(PXCuratedLibraryAssetCollectionActionPerformer *)v5 initWithActionType:@"PXCuratedLibraryActionShowAll" viewModel:v6 assetCollectionReference:v4];

    int v8 = [(PXActionManager *)self performerDelegate];
    [(PXActionPerformer *)v7 setDelegate:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)ellipsisButtonActionPerformerWithAssetCollectionReferenceProvider:(id)a3
{
  id v4 = a3;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:@"PXCuratedLibraryActionEllipsisButton"])
  {
    id v5 = [PXCuratedLibraryEllipsisButtonActionPerformer alloc];
    id v6 = [(PXCuratedLibraryActionManager *)self viewModel];
    id v7 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)v5 initWithViewModel:v6 assetCollectionReferenceProvider:v4 actionManager:self];

    int v8 = [(PXActionManager *)self performerDelegate];
    [(PXActionPerformer *)v7 setDelegate:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)ellipsisButtonActionPerformerWithAssetCollectionReference:(id)a3
{
  id v4 = a3;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:@"PXCuratedLibraryActionEllipsisButton"])
  {
    id v5 = [PXCuratedLibraryEllipsisButtonActionPerformer alloc];
    id v6 = [(PXCuratedLibraryActionManager *)self viewModel];
    id v7 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)v5 initWithViewModel:v6 assetCollectionReference:v4 actionManager:self];

    int v8 = [(PXActionManager *)self performerDelegate];
    [(PXActionPerformer *)v7 setDelegate:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)actionPerformerForActionType:(id)a3 withAssetCollectionReference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(PXCuratedLibraryActionManager *)self canPerformActionType:v7])
  {
    uint64_t v9 = [(PXCuratedLibraryActionManager *)self assetCollectionActionPerformersByType];
    v10 = (objc_class *)[v9 objectForKeyedSubscript:v7];

    if (!v10)
    {
      uint64_t v16 = [(PXCuratedLibraryActionManager *)self actionPerformersByType];
      uint64_t v17 = [v16 objectForKeyedSubscript:v7];

      if (!v17)
      {
        long long v18 = [(PXCuratedLibraryActionManager *)self constructorSpecificActionPerformersByType];
        uint64_t v19 = [v18 objectForKeyedSubscript:v7];

        if (v19)
        {
          v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 317, @"You must use the specific action performer constructor for %@ Action type.", v7 object file lineNumber description];
        }
        else
        {
          uint64_t v20 = +[PXCuratedLibraryActionManager actionsWithActionPerformers];
          uint64_t v21 = [v20 containsObject:v7];

          v22 = [MEMORY[0x1E4F28B00] currentHandler];
          v23 = v22;
          if (v21) {
            [v22 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 321, @"Unknown action type \"%@\"", v7 object file lineNumber description];
          }
          else {
            [v22 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 319, @"The %@ action isn't currently handled by a PXCuratedLibraryActionPerformer.", v7 object file lineNumber description];
          }
        }

        abort();
      }
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryActionManager.m" lineNumber:315 description:@"You must use the -[PXCuratedLibraryActionManager actionPerformerForActionType:] constructor method for this type of action."];

      abort();
    }
    id v11 = [v10 alloc];
    v12 = [(PXCuratedLibraryActionManager *)self viewModel];
    uint64_t v13 = (void *)[v11 initWithActionType:v7 viewModel:v12 assetCollectionReference:v8];

    objc_super v14 = [(PXActionManager *)self performerDelegate];
    [v13 setDelegate:v14];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(PXCuratedLibraryActionManager *)self viewModel];
  id v8 = _PXCuratedLibraryActionTitle(v5, v7, v6, 0);

  return v8;
}

- (PXCuratedLibraryActionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryActionManager.m", 214, @"%s is not available as initializer", "-[PXCuratedLibraryActionManager init]");

  abort();
}

+ (id)actionsWithActionPerformers
{
  if (actionsWithActionPerformers_onceToken != -1) {
    dispatch_once(&actionsWithActionPerformers_onceToken, &__block_literal_global_97552);
  }
  v2 = (void *)actionsWithActionPerformers_actionsWithPerformers;
  return v2;
}

void __60__PXCuratedLibraryActionManager_actionsWithActionPerformers__block_invoke()
{
  v4[19] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PXCuratedLibraryActionEnterSelectMode";
  v4[1] = @"PXCuratedLibraryActionCancelSelectMode";
  v4[2] = @"PXCuratedLibraryActionAllPhotosZoomIn";
  v4[3] = @"PXCuratedLibraryActionAllPhotosZoomOut";
  v4[4] = @"PXCuratedLibraryActionSelectAllToggle";
  v4[5] = @"PXCuratedLibraryActionShowAll";
  v4[6] = @"PXCuratedLibraryActionSetAllLibrariesFilter";
  v4[7] = @"PXCuratedLibraryActionSetPersonalLibraryFilter";
  v4[8] = @"PXCuratedLibraryActionSetSharedLibraryFilter";
  v4[9] = @"PXCuratedLibraryActionToggleSharedLibraryBadge";
  v4[10] = @"PXCuratedLibraryActionEllipsisButton";
  v4[11] = @"PXCuratedLibraryActionShowFiltersMenu";
  v4[12] = @"PXCuratedLibraryActionShowFilters";
  v4[13] = @"PXCuratedLibraryActionAllPhotosToggleAspectFit";
  v4[14] = @"PXCuratedLibraryActionShowMap";
  v4[15] = @"PXCuratedLibraryActionTapToRadar";
  v4[16] = @"PXCuratedLibraryActionCurationDebug";
  v4[17] = @"PXCuratedLibraryActionNavigateToNextZoomLevel";
  v4[18] = @"PXCuratedLibraryActionShare";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:19];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)actionsWithActionPerformers_actionsWithPerformers;
  actionsWithActionPerformers_actionsWithPerformers = v2;
}

@end