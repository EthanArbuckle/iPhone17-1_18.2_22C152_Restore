@interface PXPhotosGridShowFiltersMenuActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (NSMutableArray)filterMenuItems;
- (NSMutableArray)viewOptionsMenuItems;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
@end

@implementation PXPhotosGridShowFiltersMenuActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4 = a4;
  if ([v4 canFilterContent])
  {
    v5 = [v4 dataSourceManager];
    v6 = [v5 dataSource];
    v7 = [v6 containerCollection];

    if (objc_msgSend(v7, "px_isAllPhotosSmartAlbum")) {
      LOBYTE(v8) = 0;
    }
    else {
      int v8 = objc_msgSend(v7, "px_isRecentsSmartAlbum") ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(@"PXPhotosGridsFilter", @"PhotosUICore");
}

- (id)menuElement
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  v5 = [(PXPhotosGridActionPerformer *)self viewModel];
  v6 = [v5 viewOptionsModel];
  id v7 = [v6 sortOrderMenu];

  if (v7)
  {
    int v8 = [v7 children];
  }
  else
  {
    v9 = [(PXPhotosGridActionPerformer *)self viewModel];
    v10 = [v9 assetCollectionActionManager];
    v11 = [v10 standardActionForActionType:@"PXAssetCollectionActionTypeSetSortOrder"];

    id v12 = v11;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        v36 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
        [v33 handleFailureInMethod:a2, self, @"PXPhotosGridShowFiltersMenuActionPerformer.m", 126, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"action", v35, v36 object file lineNumber description];
      }
      int v8 = [v12 children];
      id v7 = v12;
    }
    else
    {
      v13 = [(PXPhotosGridActionPerformer *)self viewModel];
      v14 = [v13 assetCollectionActionManager];
      v15 = [v14 standardActionForActionType:@"PXAssetCollectionActionTypeChangePersonSortOrder"];

      id v7 = v15;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v37 = [MEMORY[0x1E4F28B00] currentHandler];
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          v40 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
          [v37 handleFailureInMethod:a2, self, @"PXPhotosGridShowFiltersMenuActionPerformer.m", 131, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"action", v39, v40 object file lineNumber description];
        }
        int v8 = [v7 children];
      }
      else
      {
        int v8 = 0;
      }
    }
  }
  if ([v8 count])
  {
    v16 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v8];
    [v4 addObject:v16];
  }
  v17 = [(PXPhotosGridShowFiltersMenuActionPerformer *)self viewOptionsMenuItems];
  v18 = [(PXPhotosGridShowFiltersMenuActionPerformer *)self filterMenuItems];
  if ([v18 count])
  {
    if ([v17 count]) {
      BOOL v19 = 0;
    }
    else {
      BOOL v19 = [v8 count] == 0;
    }
    v20 = (void *)MEMORY[0x1E4FB1970];
    v21 = PXLocalizedStringFromTable(@"PXFilterMenuTitle", @"PhotosUICore");
    v22 = [v20 menuWithTitle:v21 image:0 identifier:0 options:v19 children:v18];

    [v4 addObject:v22];
  }
  if ([v17 count])
  {
    if ([v18 count]) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = [v8 count] == 0;
    }
    v24 = (void *)MEMORY[0x1E4FB1970];
    v25 = PXLocalizedStringFromTable(@"PXContentViewOptionsMenuTitle", @"PhotosUICore");
    v26 = [v24 menuWithTitle:v25 image:0 identifier:0 options:v23 children:v17];

    [v4 addObject:v26];
  }
  v27 = [(PXPhotosGridShowFiltersMenuActionPerformer *)self localizedTitleForUseCase:1];
  v28 = (void *)MEMORY[0x1E4FB1818];
  v29 = [(PXPhotosGridShowFiltersMenuActionPerformer *)self activitySystemImageName];
  v30 = [v28 systemImageNamed:v29];

  v31 = [MEMORY[0x1E4FB1970] menuWithTitle:v27 image:v30 identifier:0 options:0 children:v4];

  return v31;
}

- (NSMutableArray)viewOptionsMenuItems
{
  if (viewOptionsMenuItems_onceToken_85649 != -1) {
    dispatch_once(&viewOptionsMenuItems_onceToken_85649, &__block_literal_global_193_85650);
  }
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v4 = [v3 gridActionManager];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXPhotosGridShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke_2;
  aBlock[3] = &unk_1E5DB7D30;
  aBlock[4] = v4;
  id v5 = v4;
  _Block_copy(aBlock);
  PXMap();
}

uint64_t __66__PXPhotosGridShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) standardActionForActionType:a2];
}

void __66__PXPhotosGridShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"PXPhotosGridActionZoomIn";
  v5[1] = @"PXPhotosGridActionZoomOut";
  v5[2] = @"PXPhotosGridActionToggleAspectFit";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v1 = (void *)viewOptionsMenuItems_viewOptionsActionTypes_85651;
  viewOptionsMenuItems_viewOptionsActionTypes_85651 = v0;

  v4[0] = @"PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter";
  v4[1] = @"PXPhotosGridActionTogglePreviewHeader";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v3 = (void *)viewOptionsMenuItems_viewOptionsShowActionTypes_85653;
  viewOptionsMenuItems_viewOptionsShowActionTypes_85653 = v2;
}

- (NSMutableArray)filterMenuItems
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (filterMenuItems_onceToken != -1) {
    dispatch_once(&filterMenuItems_onceToken, &__block_literal_global_85659);
  }
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v4 = [v3 gridActionManager];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)filterMenuItems_filterActionTypes, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (id)filterMenuItems_filterActionTypes;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v4, "actionPerformerForActionType:", v12, (void)v19);
        v14 = [(PXActionPerformer *)self sender];
        [v13 setSender:v14];

        int v15 = [v4 canPerformActionType:v12];
        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          v17 = [v13 menuElement];
          if (v17) {
            [v6 addObject:v17];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return (NSMutableArray *)v6;
}

void __61__PXPhotosGridShowFiltersMenuActionPerformer_filterMenuItems__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXPhotosGridActionUnfilter";
  v2[1] = @"PXPhotosGridActionToggleFavoritesFilter";
  v2[2] = @"PXPhotosGridActionToggleImagesFilter";
  v2[3] = @"PXPhotosGridActionToggleEditedFilter";
  v2[4] = @"PXPhotosGridActionToggleVideosFilter";
  v2[5] = @"PXPhotosGridActionToggleShowOnlyScreenshotsFilter";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)filterMenuItems_filterActionTypes;
  filterMenuItems_filterActionTypes = v0;
}

- (id)activitySystemImageName
{
  uint64_t v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 contentFilterState];
  id v4 = PXContentFilterImageNameForFilterState(v3);

  return v4;
}

- (id)activityType
{
  uint64_t v2 = @"PXActivityTypeShowFiltersMenu";
  return @"PXActivityTypeShowFiltersMenu";
}

@end