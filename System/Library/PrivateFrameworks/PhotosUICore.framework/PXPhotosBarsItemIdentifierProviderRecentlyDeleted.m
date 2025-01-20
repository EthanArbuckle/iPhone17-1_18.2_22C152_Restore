@interface PXPhotosBarsItemIdentifierProviderRecentlyDeleted
+ (void)valuesForModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 toolbarIdentifiers:(id *)a7 hasSharedLibraryOrPreview:(BOOL)a8;
@end

@implementation PXPhotosBarsItemIdentifierProviderRecentlyDeleted

+ (void)valuesForModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 toolbarIdentifiers:(id *)a7 hasSharedLibraryOrPreview:(BOOL)a8
{
  BOOL v8 = a8;
  v62[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v49 = [v11 currentDataSource];
  int v12 = [v11 isInSelectMode];
  int v13 = [v11 wantsToolbarVisible];
  v14 = +[PXPhotosGridSettings sharedInstance];
  if ([v14 enableNewActionMenu]) {
    int v15 = [v11 allowsActionMenuBehavior];
  }
  else {
    int v15 = 0;
  }

  if ([v11 isInCompactMode]) {
    int v16 = 0;
  }
  else {
    int v16 = [v11 supportsAspectRatioToggle];
  }
  int v17 = [v11 allowsMultiSelectMenu];
  uint64_t v18 = [v11 dismissAffordance];
  if ([v11 contentPrivacyState])
  {
    id v19 = [MEMORY[0x1E4F1CA48] array];
    v20 = [MEMORY[0x1E4F1CA48] array];
    id v21 = v20;
    if (v18 == 1)
    {
      v25 = PXBarItemIdentifierDismiss;
      v20 = v19;
      v23 = a6;
      v22 = a7;
      v24 = a5;
    }
    else
    {
      v23 = a6;
      v22 = a7;
      v24 = a5;
      if (v18 == 4)
      {
        v25 = PXBarItemIdentifierExplicitBack;
        v20 = v19;
      }
      else
      {
        if (v18 != 2)
        {
LABEL_28:
          id v27 = 0;
          v28 = 0;
          goto LABEL_60;
        }
        v25 = PXBarItemIdentifierDismiss;
      }
    }
    [v20 addObject:*v25];
    goto LABEL_28;
  }
  if (![v49 containsAnyItems])
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3;
    aBlock[3] = &unk_1E5DD2D18;
    aBlock[4] = v32;
    v34 = _Block_copy(aBlock);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4;
    v50[3] = &unk_1E5DD2D18;
    v50[4] = v33;
    v35 = _Block_copy(v50);
    v36 = (void (**)(void, void))v35;
    if (v18 == 2) {
      (*((void (**)(void *, __CFString *))v35 + 2))(v35, @"PXBarItemIdentifierDismiss");
    }
    v23 = a6;
    if ((v8 & v15) == 1) {
      ((void (**)(void, __CFString *))v36)[2](v36, @"PXBarItemIdentifierActionMenu");
    }
    if (v18 == 1)
    {
      v37 = PXBarItemIdentifierDismiss;
    }
    else
    {
      if (v18 != 4)
      {
LABEL_42:
        id v21 = v33;
        id v19 = v32;

        id v27 = 0;
        v28 = 0;
        v22 = a7;
        v24 = a5;
        goto LABEL_60;
      }
      v37 = PXBarItemIdentifierExplicitBack;
    }
    (*((void (**)(void *, __CFString *))v34 + 2))(v34, *v37);
    goto LABEL_42;
  }
  if (!v12)
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke;
    v54[3] = &unk_1E5DD2D18;
    id v39 = v38;
    id v55 = v39;
    v40 = (void (**)(void *, __CFString *))_Block_copy(v54);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2;
    v52[3] = &unk_1E5DD2D18;
    id v42 = v41;
    id v53 = v42;
    v43 = _Block_copy(v52);
    if (v18 == 2) {
      v40[2](v40, @"PXBarItemIdentifierDismiss");
    }
    if (v15) {
      v40[2](v40, @"PXBarItemIdentifierActionMenu");
    }
    if ([v11 wantsSelectButton]) {
      v40[2](v40, @"PXBarItemIdentifierSelect");
    }
    if (v16) {
      v40[2](v40, @"PXBarItemIdentifierToggleAspectFit");
    }
    if (v18 == 1)
    {
      v44 = PXBarItemIdentifierDismiss;
      v22 = a7;
    }
    else
    {
      v22 = a7;
      if (v18 != 4)
      {
LABEL_45:
        if ([v39 count]) {
          [v39 insertObject:@"PXBarItemIdentifierButtonEndSpacing" atIndex:0];
        }
        if (v13)
        {
          v59[0] = @"PXBarItemIdentifierDelete";
          v59[1] = @"PXBarItemIdentifierPlaceholder";
          v59[2] = @"PXBarItemIdentifierRecover";
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
        }
        else
        {
          v28 = 0;
        }
        id v21 = v39;
        id v19 = v42;

        id v27 = 0;
        goto LABEL_59;
      }
      v44 = PXBarItemIdentifierExplicitBack;
    }
    (*((void (**)(void *, __CFString *))v43 + 2))(v43, *v44);
    goto LABEL_45;
  }
  id v58 = 0;
  id v56 = (id)MEMORY[0x1E4F1CBF0];
  id v57 = (id)MEMORY[0x1E4F1CBF0];
  char v26 = v13 ^ 1;
  LOWORD(v45) = v13 ^ 1;
  objc_msgSend(a1, "_topBarValuesForSelectionModeWithModel:title:leadingIdentifiers:trailingIdentifiers:allowSelectAll:allowAdd:allowTrashActions:allowDeleteShareActions:", v11, &v58, &v57, &v56, 0, 0, v45);
  id v27 = v58;
  id v19 = v57;
  id v21 = v56;
  v28 = 0;
  if ((v26 & 1) == 0)
  {
    if ([v11 navBarStyle])
    {
      if ((v17 & v12) != 0)
      {
        v62[0] = @"PXBarItemIdentifierPlaceholder";
        v62[1] = @"PXBarItemIdentifierSelectModeCaption";
        v62[2] = @"PXBarItemIdentifierPlaceholder";
        v62[3] = @"PXBarItemIdentifierSelectModeMenu";
        v29 = (void *)MEMORY[0x1E4F1C978];
        v30 = v62;
        uint64_t v31 = 4;
      }
      else
      {
        v61[0] = @"PXBarItemIdentifierDelete";
        v61[1] = @"PXBarItemIdentifierPlaceholder";
        v61[2] = @"PXBarItemIdentifierSelectModeCaption";
        v61[3] = @"PXBarItemIdentifierPlaceholder";
        v61[4] = @"PXBarItemIdentifierRestore";
        v29 = (void *)MEMORY[0x1E4F1C978];
        v30 = v61;
        uint64_t v31 = 5;
      }
    }
    else
    {
      v60[0] = @"PXBarItemIdentifierDelete";
      v60[1] = @"PXBarItemIdentifierPlaceholder";
      v60[2] = @"PXBarItemIdentifierRestore";
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v60;
      uint64_t v31 = 3;
    }
    v28 = [v29 arrayWithObjects:v30 count:v31];
  }
  if (!a4)
  {
    v22 = a7;
LABEL_59:
    v23 = a6;
    v24 = a5;
    goto LABEL_60;
  }
  v22 = a7;
  v24 = a5;
  if (v27)
  {
    id v27 = v27;
    *a4 = v27;
  }
  v23 = a6;
LABEL_60:
  if (v24 && v19) {
    id *v24 = v19;
  }
  if (v23 && v21) {
    id *v23 = v21;
  }
  if (v22 && v28) {
    id *v22 = v28;
  }
}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

@end