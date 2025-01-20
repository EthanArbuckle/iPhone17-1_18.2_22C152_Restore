@interface PXPhotosGridPickerShowFiltersMenuActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (NSMutableArray)filterMenuItems;
- (NSMutableArray)viewOptionsMenuItems;
- (id)_filterActionTypes;
- (id)activitySystemImageName;
- (id)activityType;
- (id)filterMenuSubtitle;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (id)viewOptionsMenuSubtitle;
@end

@implementation PXPhotosGridPickerShowFiltersMenuActionPerformer

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

- (id)viewOptionsMenuSubtitle
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 contentFilterState];
  char v4 = [v3 isContentFilterActive:2];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = PXLocalizedStringFromTable(@"PXContentViewOptionsMenuSubtitleHiddenScreenshots", @"PhotosUICore");
  }
  return v5;
}

- (NSMutableArray)viewOptionsMenuItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (viewOptionsMenuItems_onceToken_16035 != -1) {
    dispatch_once(&viewOptionsMenuItems_onceToken_16035, &__block_literal_global_227);
  }
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  char v4 = [v3 gridActionManager];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)viewOptionsMenuItems_viewOptionsActionTypes_16037, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (id)viewOptionsMenuItems_viewOptionsActionTypes_16037;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v4, "actionPerformerForActionType:", v12, (void)v18);
        int v14 = [v4 canPerformActionType:v12];
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          v16 = [v13 menuElement];
          if (v16) {
            [v6 addObject:v16];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return (NSMutableArray *)v6;
}

void __72__PXPhotosGridPickerShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXPhotosGridActionZoomIn";
  v2[1] = @"PXPhotosGridActionZoomOut";
  v2[2] = @"PXPhotosGridActionToggleAspectFit";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)viewOptionsMenuItems_viewOptionsActionTypes_16037;
  viewOptionsMenuItems_viewOptionsActionTypes_16037 = v0;
}

- (id)filterMenuSubtitle
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self _filterActionTypes];
  char v4 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v5 = [v4 gridActionManager];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v31;
    uint64_t v12 = @"PXCuratedLibraryActionUnfilter";
    uint64_t v29 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v7);
        }
        if (*(__CFString **)(*((void *)&v30 + 1) + 8 * i) != v12)
        {
          int v14 = objc_msgSend(v5, "actionPerformerForActionType:");
          BOOL v15 = v14;
          if (v14)
          {
            v16 = [v14 localizedTitleForUseCase:0];
            uint64_t v17 = [v15 menuElementState];
            if (v16) {
              BOOL v18 = v17 == 1;
            }
            else {
              BOOL v18 = 0;
            }
            if (v18)
            {
              if (v10 >= 1)
              {
                PXLocalizedStringFromTable(@"PXContentFilterMenu_SubtitleFilterTitlesSeperator", @"PhotosUICore");
                uint64_t v19 = v10;
                long long v20 = v12;
                long long v21 = v5;
                id v22 = v7;
                v24 = uint64_t v23 = v6;
                [v23 appendString:v24];

                id v6 = v23;
                id v7 = v22;
                id v5 = v21;
                uint64_t v12 = v20;
                uint64_t v10 = v19;
                uint64_t v11 = v29;
                if ((unint64_t)v10 > 2)
                {
                  v25 = PXLocalizedStringFromTable(@"PXContentFilterMenu_SubtitleMoreItems", @"PhotosUICore");
                  [v6 appendString:v25];

LABEL_23:
                  v26 = v6;
                  goto LABEL_26;
                }
              }
              ++v10;
              [v6 appendString:v16];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    if (v10 >= 1) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v26 = 0;
LABEL_26:
  id v27 = v26;

  return v27;
}

- (NSMutableArray)filterMenuItems
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self _filterActionTypes];
  char v4 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v5 = [v4 gridActionManager];

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v3;
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
        v13 = objc_msgSend(v5, "actionPerformerForActionType:", v12, (void)v19);
        int v14 = [(PXActionPerformer *)self sender];
        [v13 setSender:v14];

        int v15 = [v5 canPerformActionType:v12];
        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          uint64_t v17 = [v13 menuElement];
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

- (id)_filterActionTypes
{
  if (_filterActionTypes_onceToken_16046 != -1) {
    dispatch_once(&_filterActionTypes_onceToken_16046, &__block_literal_global_16047);
  }
  v2 = (void *)_filterActionTypes_filterActionTypes_16048;
  return v2;
}

void __70__PXPhotosGridPickerShowFiltersMenuActionPerformer__filterActionTypes__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXPhotosGridActionUnfilter";
  v2[1] = @"PXPhotosGridActionToggleFavoritesFilter";
  v2[2] = @"PXPhotosGridActionToggleImagesFilter";
  v2[3] = @"PXPhotosGridActionToggleEditedFilter";
  void v2[4] = @"PXPhotosGridActionToggleVideosFilter";
  v2[5] = @"PXPhotosGridActionToggleShowOnlyScreenshotsFilter";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)_filterActionTypes_filterActionTypes_16048;
  _filterActionTypes_filterActionTypes_16048 = v0;
}

- (id)menuElement
{
  char v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  id v5 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v6 = [v5 viewOptionsModel];
  id v7 = [v6 sortOrderMenu];

  if (v7)
  {
    uint64_t v8 = [v7 children];
  }
  else
  {
    uint64_t v9 = [(PXPhotosGridActionPerformer *)self viewModel];
    uint64_t v10 = [v9 assetCollectionActionManager];
    uint64_t v11 = [v10 standardActionForActionType:@"PXAssetCollectionActionTypeSetSortOrder"];

    id v12 = v11;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = [MEMORY[0x1E4F28B00] currentHandler];
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        v40 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
        [v37 handleFailureInMethod:a2, self, @"PXPhotosGridPickerShowFiltersMenuActionPerformer.m", 51, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"action", v39, v40 object file lineNumber description];
      }
      uint64_t v8 = [v12 children];
      id v7 = v12;
    }
    else
    {
      v13 = [(PXPhotosGridActionPerformer *)self viewModel];
      int v14 = [v13 assetCollectionActionManager];
      int v15 = [v14 standardActionForActionType:@"PXAssetCollectionActionTypeChangePersonSortOrder"];

      id v7 = v15;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v41 = [MEMORY[0x1E4F28B00] currentHandler];
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          v44 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
          [v41 handleFailureInMethod:a2, self, @"PXPhotosGridPickerShowFiltersMenuActionPerformer.m", 56, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"action", v43, v44 object file lineNumber description];
        }
        uint64_t v8 = [v7 children];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  if ([v8 count])
  {
    BOOL v16 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v8];
    [v4 addObject:v16];
  }
  uint64_t v17 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self filterMenuItems];
  BOOL v18 = (void *)[v17 mutableCopy];

  if ([v18 count])
  {
    BOOL v19 = [v18 count] == 0;
    long long v20 = (void *)MEMORY[0x1E4FB1970];
    long long v21 = PXLocalizedStringFromTable(@"PXFilterMenuTitle", @"PhotosUICore");
    long long v22 = [v20 menuWithTitle:v21 image:0 identifier:0 options:v19 children:v18];

    uint64_t v23 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self filterMenuSubtitle];
    [v22 setSubtitle:v23];

    [v4 addObject:v22];
  }
  uint64_t v24 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self viewOptionsMenuItems];
  v25 = (void *)[v24 mutableCopy];

  if ([v25 count])
  {
    BOOL v26 = [v25 count] == 0;
    id v27 = (void *)MEMORY[0x1E4FB1970];
    v28 = PXLocalizedStringFromTable(@"PXContentViewOptionsMenuTitle", @"PhotosUICore");
    uint64_t v29 = [v27 menuWithTitle:v28 image:0 identifier:0 options:v26 children:v25];

    long long v30 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self viewOptionsMenuSubtitle];
    [v29 setSubtitle:v30];

    [v4 addObject:v29];
  }
  long long v31 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self localizedTitleForUseCase:1];
  long long v32 = (void *)MEMORY[0x1E4FB1818];
  long long v33 = [(PXPhotosGridPickerShowFiltersMenuActionPerformer *)self activitySystemImageName];
  v34 = [v32 systemImageNamed:v33];

  uint64_t v35 = [MEMORY[0x1E4FB1970] menuWithTitle:v31 image:v34 identifier:0 options:0 children:v4];

  return v35;
}

- (id)activitySystemImageName
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 contentFilterState];
  if ([v3 isFiltering]) {
    char v4 = @"line.horizontal.3.decrease.circle.fill";
  }
  else {
    char v4 = @"line.horizontal.3.decrease.circle";
  }
  id v5 = v4;

  return v5;
}

- (id)activityType
{
  v2 = @"PXActivityTypeShowFiltersMenu";
  return @"PXActivityTypeShowFiltersMenu";
}

@end