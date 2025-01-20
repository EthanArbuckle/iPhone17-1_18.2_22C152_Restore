@interface PXCuratedLibraryShowFiltersMenuActionPerformer
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (NSMutableArray)filterInlineMenuItems;
- (NSMutableArray)filterMenuItems;
- (NSMutableArray)viewOptionsMenuItems;
- (NSString)filterMenuSubtitle;
- (NSString)viewOptionsMenuSubtitle;
- (id)_filterActionTypes;
- (id)activitySystemImageName;
- (id)activityType;
- (id)menuElement;
- (id)sharedLibraryModeMenuItems;
@end

@implementation PXCuratedLibraryShowFiltersMenuActionPerformer

- (NSMutableArray)filterMenuItems
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self _filterActionTypes];
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 actionManager];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        v14 = [(PXActionPerformer *)self sender];
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

- (id)_filterActionTypes
{
  if (_filterActionTypes_onceToken != -1) {
    dispatch_once(&_filterActionTypes_onceToken, &__block_literal_global_207);
  }
  v2 = (void *)_filterActionTypes_filterActionTypes;
  return v2;
}

- (NSString)filterMenuSubtitle
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self _filterActionTypes];
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 actionManager];

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
          v14 = objc_msgSend(v5, "actionPerformerForActionType:");
          int v15 = v14;
          if (v14)
          {
            BOOL v16 = [v14 localizedTitleForUseCase:0];
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
                uint64_t v24 = v23 = v6;
                [v23 appendString:v24];

                id v6 = v23;
                id v7 = v22;
                v5 = v21;
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
  v27 = v26;

  return v27;
}

- (id)menuElement
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 viewOptionsModel];
  id v6 = [v5 sortOrderMenu];
  id v7 = [v6 children];

  if ([v7 count])
  {
    uint64_t v8 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v7];
    [v3 addObject:v8];
  }
  uint64_t v9 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self sharedLibraryModeMenuItems];
  if ([v9 count])
  {
    uint64_t v10 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v9];
    [v3 addObject:v10];
  }
  uint64_t v11 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self filterInlineMenuItems];
  if ([v11 count])
  {
    if ([v11 count] == 1) {
      [v11 firstObject];
    }
    else {
    uint64_t v12 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:@"com.apple.photos.menu.contentFilterInlineMenu" options:1 children:v11];
    }
    [v3 addObject:v12];
  }
  v13 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self viewOptionsMenuItems];
  if ([v13 count])
  {
    v14 = (void *)MEMORY[0x1E4FB1970];
    int v15 = PXLocalizedStringFromTable(@"PXContentViewOptionsMenuTitle", @"PhotosUICore");
    BOOL v16 = [v14 menuWithTitle:v15 image:0 identifier:0 options:0 children:v13];

    uint64_t v17 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self viewOptionsMenuSubtitle];
    [v16 setSubtitle:v17];

    [v3 addObject:v16];
  }
  BOOL v18 = [(PXCuratedLibraryActionPerformer *)self localizedTitleForUseCase:1];
  uint64_t v19 = (void *)MEMORY[0x1E4FB1818];
  long long v20 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self activitySystemImageName];
  long long v21 = [v19 systemImageNamed:v20];

  id v22 = [MEMORY[0x1E4FB1970] menuWithTitle:v18 image:v21 identifier:0 options:0 children:v3];

  return v22;
}

- (NSString)viewOptionsMenuSubtitle
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 currentContentFilterState];
  char v4 = [v3 isContentFilterActive:2];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = PXLocalizedStringFromTable(@"PXContentViewOptionsMenuSubtitleHiddenScreenshots", @"PhotosUICore");
  }
  return (NSString *)v5;
}

- (id)sharedLibraryModeMenuItems
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (sharedLibraryModeMenuItems_onceToken != -1) {
    dispatch_once(&sharedLibraryModeMenuItems_onceToken, &__block_literal_global_1052);
  }
  v3 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  char v4 = [v3 actionManager];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)sharedLibraryModeMenuItems_sharedLibraryModeActionTypes, "count"));
  id v7 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v8 = [v7 configuration];
  uint64_t v9 = [v8 photoLibrary];

  uint64_t v10 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v9];
  if ([v10 hasSharedLibraryOrPreview])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = (id)sharedLibraryModeMenuItems_sharedLibraryModeActionTypes;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v4, "actionPerformerForActionType:", v16, (void)v22);
          int v18 = [v4 canPerformActionType:v16];
          if (v17) {
            BOOL v19 = v18 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19)
          {
            long long v20 = [v17 menuElement];
            if (v20) {
              [v6 addObject:v20];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  return v6;
}

- (NSMutableArray)viewOptionsMenuItems
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (viewOptionsMenuItems_onceToken != -1) {
    dispatch_once(&viewOptionsMenuItems_onceToken, &__block_literal_global_220);
  }
  v3 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  char v4 = [v3 actionManager];

  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)viewOptionsMenuItems_viewOptionsActionTypes, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = (id)viewOptionsMenuItems_viewOptionsActionTypes;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v13 = [v4 actionPerformerForActionType:v12];
        int v14 = [v4 canPerformActionType:v12];
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          uint64_t v16 = [v13 menuElement];
          if (v16) {
            [v6 addObject:v16];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  int v18 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend((id)viewOptionsMenuItems_viewOptionsShowActionTypes, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v19 = (id)viewOptionsMenuItems_viewOptionsShowActionTypes;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        long long v25 = objc_msgSend(v4, "actionPerformerForActionType:", v24, (void)v33);
        int v26 = [v4 canPerformActionType:v24];
        if (v25) {
          BOOL v27 = v26 == 0;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          v28 = [v25 menuElement];
          if (v28) {
            [v18 addObject:v28];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }

  uint64_t v29 = (void *)MEMORY[0x1E4FB1970];
  long long v30 = PXLocalizedStringFromTable(@"PXContentViewOptionsShowMenuTitle", @"PhotosUICore");
  long long v31 = [v29 menuWithTitle:v30 image:0 identifier:0 options:1 children:v18];
  [v6 addObject:v31];

  return (NSMutableArray *)v6;
}

- (NSMutableArray)filterInlineMenuItems
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  char v4 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self filterMenuItems];
  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x1E4FB1970];
    id v6 = PXLocalizedStringFromTable(@"PXFilterMenuTitle", @"PhotosUICore");
    id v7 = [v5 menuWithTitle:v6 image:0 identifier:0 options:0 children:v4];

    uint64_t v8 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self filterMenuSubtitle];
    [v7 setSubtitle:v8];

    [v3 addObject:v7];
  }
  uint64_t v9 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v10 = [v9 currentContentFilterState];
  int v11 = [v10 isFiltering];

  if (v11)
  {
    uint64_t v12 = [(PXCuratedLibraryActionPerformer *)self viewModel];
    uint64_t v13 = [v12 actionManager];

    int v14 = [v13 actionPerformerForActionType:@"PXCuratedLibraryActionRemoveFilters"];
    BOOL v15 = [(PXActionPerformer *)self sender];
    [v14 setSender:v15];

    int v16 = [v13 canPerformActionType:@"PXCuratedLibraryActionRemoveFilters"];
    if (v14 && v16)
    {
      id v17 = [v14 menuElement];
      if (v17) {
        [v3 addObject:v17];
      }
    }
  }

  return (NSMutableArray *)v3;
}

- (id)activitySystemImageName
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 libraryFilterState];
  char v4 = [v2 currentContentFilterState];
  id v5 = PXContentFilterImageNameForFilterStates(v3, v4);

  return v5;
}

void __76__PXCuratedLibraryShowFiltersMenuActionPerformer_sharedLibraryModeMenuItems__block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXCuratedLibraryActionSetAllLibrariesFilter";
  v2[1] = @"PXCuratedLibraryActionSetPersonalLibraryFilter";
  v2[2] = @"PXCuratedLibraryActionSetSharedLibraryFilter";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)sharedLibraryModeMenuItems_sharedLibraryModeActionTypes;
  sharedLibraryModeMenuItems_sharedLibraryModeActionTypes = v0;
}

void __68__PXCuratedLibraryShowFiltersMenuActionPerformer__filterActionTypes__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXCuratedLibraryActionUnfilter";
  v2[1] = @"PXCuratedLibraryActionToggleFavoriteFilter";
  v2[2] = @"PXCuratedLibraryActionToggleEditFilter";
  v2[3] = @"PXCuratedLibraryActionToggleImageFilter";
  void v2[4] = @"PXCuratedLibraryActionToggleVideoFilter";
  v2[5] = @"PXCuratedLibraryActionToggleShowOnlyScreenshotFilter";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)_filterActionTypes_filterActionTypes;
  _filterActionTypes_filterActionTypes = v0;
}

void __70__PXCuratedLibraryShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"PXCuratedLibraryActionAllPhotosZoomIn";
  v5[1] = @"PXCuratedLibraryActionAllPhotosZoomOut";
  v5[2] = @"PXCuratedLibraryActionAllPhotosToggleAspectFit";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v1 = (void *)viewOptionsMenuItems_viewOptionsActionTypes;
  viewOptionsMenuItems_viewOptionsActionTypes = v0;

  v4[0] = @"PXCuratedLibraryActionToggleIncludeScreenshotFilter";
  v4[1] = @"PXCuratedLibraryActionToggleIncludeSharedWithYouFilter";
  v4[2] = @"PXCuratedLibraryActionToggleSharedLibraryBadge";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  v3 = (void *)viewOptionsMenuItems_viewOptionsShowActionTypes;
  viewOptionsMenuItems_viewOptionsShowActionTypes = v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXCuratedLibraryShowFiltersMenuActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  uint64_t v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryShowFiltersMenuActionPerformer.m", 39, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  return 1;
}

- (id)activityType
{
  uint64_t v2 = @"PXActivityTypeShowFiltersMenu";
  return @"PXActivityTypeShowFiltersMenu";
}

@end