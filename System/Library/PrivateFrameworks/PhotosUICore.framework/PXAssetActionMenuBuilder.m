@interface PXAssetActionMenuBuilder
+ (id)_actionTypesGroupedBySectionForActionManager:(id)a3 excludedActionTypes:(id)a4;
+ (id)_internalActionTypesForActionManager:(id)a3;
+ (id)menuElementsForActionManager:(id)a3;
+ (id)menuElementsForActionManager:(id)a3 excludedActionTypes:(id)a4;
+ (id)pxMenuElementsForActionManager:(id)a3 excludedActionTypes:(id)a4 handler:(id)a5;
@end

@implementation PXAssetActionMenuBuilder

+ (id)_internalActionTypesForActionManager:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PXAssetActionMenuBuilder__internalActionTypesForActionManager___block_invoke;
  v10[3] = &unk_1E5DD0BD0;
  id v11 = v3;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  v7 = (void (**)(void *, __CFString *))_Block_copy(v10);
  v7[2](v7, @"PXAssetActionTypeInternalContentSyndicationPromoteToGuest");
  v7[2](v7, @"PXAssetActionTypeInternalContentSyndicationFileRadar");
  v7[2](v7, @"PXAssetActionTypeInternalAssetDetails");
  v7[2](v7, @"PXAssetActionTypeInternalAssetSearchDetails");
  v7[2](v7, @"PXAssetActionTypeInternalCopyURL");
  v7[2](v7, @"PXAssetActionTypeInternalFileRadarForSharedLibrary");
  v7[2](v7, @"PXAssetActionTypeInternalToggleStacks");
  id v8 = v5;

  return v8;
}

void __65__PXAssetActionMenuBuilder__internalActionTypesForActionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

+ (id)_actionTypesGroupedBySectionForActionManager:(id)a3 excludedActionTypes:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PXAssetActionMenuBuilder__actionTypesGroupedBySectionForActionManager_excludedActionTypes___block_invoke;
  aBlock[3] = &unk_1E5DD0AA0;
  id v8 = v6;
  id v29 = v8;
  id v9 = v5;
  id v30 = v9;
  v10 = (void (**)(void *, __CFString *, id))_Block_copy(aBlock);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    v13 = [v12 selectionManager];
    v14 = [v13 dataSourceManager];
    id v15 = [v14 dataSource];

    v16 = [v15 containerCollection];
    LODWORD(v14) = objc_msgSend(v16, "px_isRecentlyDeletedSmartAlbum");

    if (v14)
    {
      v10[2](v10, @"PXAssetActionTypeDelete", v11);
      v10[2](v10, @"PXAssetActionTypeRestore", v11);
      v32[0] = v11;
      v17 = (id *)v32;
LABEL_6:
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      goto LABEL_23;
    }
    v18 = [v15 containerCollection];
    int v19 = objc_msgSend(v18, "px_isRecoveredSmartAlbum");

    if (v19)
    {
      v10[2](v10, @"PXAssetActionTypeDelete", v11);
      v10[2](v10, @"PXAssetActionTypeRecover", v11);
      id v31 = v11;
      v17 = &v31;
      goto LABEL_6;
    }
  }
  v10[2](v10, @"PXAssetActionTypeCopy", v11);
  v10[2](v10, @"PXAssetActionTypeShare", v11);
  v10[2](v10, @"PXAssetActionTypeToggleFavorite", v11);
  v10[2](v10, @"PXAssetActionTypeDuplicate", v11);
  v10[2](v10, @"PXAssetActionTypeHide", v11);
  v10[2](v10, @"PXAssetActionTypeShowInLibrary", v11);
  v10[2](v10, @"PXAssetActionTypeSlideshow", v11);
  v10[2](v10, @"PXAssetActionTypePlayMovie", v11);
  v10[2](v10, @"PXAssetActionTypeCompositeVideo", v11);
  v10[2](v10, @"PXAssetActionTypeSyndicationSaveToLibrary", v11);
  if ([v11 count]) {
    [v7 addObject:v11];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[2](v10, @"PXAssetActionTypeAddToAlbum", v12);
  v10[2](v10, @"PXAssetActionTypeAddToLastUsedAlbum", v12);
  v21 = +[PXDocumentMenuSettings sharedInstance];
  int v22 = [v21 showAddToSharedAlbumAction];

  if (v22) {
    v10[2](v10, @"PXAssetActionTypeAddToAlbumStream", v12);
  }
  v10[2](v10, @"PXAssetActionTypeMoveToSharedLibrary", v12);
  v10[2](v10, @"PXAssetActionTypeMoveToPersonalLibrary", v12);
  v10[2](v10, @"PXAssetActionTypeRemoveSharingSuggestion", v12);
  if ([v12 count]) {
    [v7 addObject:v12];
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[2](v10, @"PXAssetActionTypeCopyAdjustments", v15);
  v10[2](v10, @"PXAssetActionTypePasteAdjustments", v15);
  v10[2](v10, @"PXAssetActionTypeRevertAdjustments", v15);
  if ([v15 count]) {
    [v7 addObject:v15];
  }
  id v27 = v9;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[2](v10, @"PXAssetActionTypeEditDateTime", v23);
  v10[2](v10, @"PXAssetActionTypeEditLocation", v23);
  if ([v23 count]) {
    [v7 addObject:v23];
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[2](v10, @"PXAssetActionTypeInternalAddStacks", v24);
  v10[2](v10, @"PXAssetActionTypeInternalRemoveStacks", v24);
  if ([v24 count]) {
    [v7 addObject:v24];
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[2](v10, @"PXAssetActionTypeRemove", v25);
  v10[2](v10, @"PXAssetActionTypeTrash", v25);
  v10[2](v10, @"PXAssetActionTypeRemoveFromFeaturedPhotos", v25);
  v10[2](v10, @"PXAssetActionTypeFeatureLess", v25);
  v10[2](v10, @"PXAssetActionTypeNotThisPerson", v25);
  v10[2](v10, @"PXAssetActionTypeClearRecentlyViewed", v25);
  v10[2](v10, @"PXAssetActionTypeClearRecentlyShared", v25);
  if ([v25 count]) {
    [v7 addObject:v25];
  }
  id v20 = v7;

  id v9 = v27;
LABEL_23:

  return v20;
}

void __93__PXAssetActionMenuBuilder__actionTypesGroupedBySectionForActionManager_excludedActionTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0
    && [*(id *)(a1 + 40) canPerformActionType:v6])
  {
    [v5 addObject:v6];
  }
}

+ (id)pxMenuElementsForActionManager:(id)a3 excludedActionTypes:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a4;
  id v12 = [v10 array];
  v13 = [a1 _actionTypesGroupedBySectionForActionManager:v8 excludedActionTypes:v11];

  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __87__PXAssetActionMenuBuilder_pxMenuElementsForActionManager_excludedActionTypes_handler___block_invoke;
  id v29 = &unk_1E5DD0A78;
  id v14 = v12;
  id v30 = v14;
  id v15 = v8;
  id v31 = v15;
  id v16 = v9;
  id v33 = v16;
  id v17 = v13;
  id v32 = v17;
  [v17 enumerateObjectsUsingBlock:&v26];
  v18 = +[PXRootSettings sharedInstance];
  LODWORD(v13) = [v18 canShowInternalUI];

  if (v13)
  {
    int v19 = objc_opt_new();
    [v14 addObject:v19];

    id v20 = [a1 _internalActionTypesForActionManager:v15];
    v21 = [v15 actionItemsForActionTypes:v20 handler:v16];
    int v22 = +[PXActionMenu menuWithTitle:@" Internal" childElements:v21];
    [v14 addObject:v22];
  }
  id v23 = v32;
  id v24 = v14;

  return v24;
}

void __87__PXAssetActionMenuBuilder_pxMenuElementsForActionManager_excludedActionTypes_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) actionItemsForActionTypes:a2 handler:*(void *)(a1 + 56)];
  [v5 addObjectsFromArray:v6];

  if (a3 + 1 < (unint64_t)[*(id *)(a1 + 48) count])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = (id)objc_opt_new();
    [v7 addObject:v8];
  }
}

+ (id)menuElementsForActionManager:(id)a3
{
  return (id)[a1 menuElementsForActionManager:a3 excludedActionTypes:0];
}

+ (id)menuElementsForActionManager:(id)a3 excludedActionTypes:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a1 _actionTypesGroupedBySectionForActionManager:v6 excludedActionTypes:v7];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v9 count])
        {
          uint64_t v26 = i;
          v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v28 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                id v17 = [v6 systemImageNameForActionType:v16];
                v18 = [MEMORY[0x1E4FB1818] systemImageNamed:v17];
                int v19 = [v6 previewActionForActionType:v16 image:v18];

                [v10 addObject:v19];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v13);
          }

          id v20 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v10];
          [v23 addObject:v20];

          uint64_t i = v26;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  return v23;
}

@end