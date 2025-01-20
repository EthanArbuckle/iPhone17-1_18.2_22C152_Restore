@interface PXPhotosBarsItemIdentifierProviderBase
+ (void)_topBarValuesForSelectionModeWithModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 allowSelectAll:(BOOL)a7 allowAdd:(BOOL)a8 allowTrashActions:(BOOL)a9 allowDeleteShareActions:(BOOL)a10;
@end

@implementation PXPhotosBarsItemIdentifierProviderBase

+ (void)_topBarValuesForSelectionModeWithModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 allowSelectAll:(BOOL)a7 allowAdd:(BOOL)a8 allowTrashActions:(BOOL)a9 allowDeleteShareActions:(BOOL)a10
{
  BOOL v39 = a8;
  BOOL v10 = a7;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (([v12 allowsMoveToLibraryAction] & 1) != 0
    || ([v12 allowsMoveToPersonalLibraryAction] & 1) != 0
    || [v12 allowsMoveToSharedLibraryAction])
  {
    *a4 = 0;
  }
  else
  {
    v31 = [v12 selectionManager];
    v32 = [v31 assetTypeCounter];
    uint64_t v33 = [v32 typedCount];
    PXLocalizedSelectModeCaption(1, v33, v34);
    id v35 = objc_claimAutoreleasedReturnValue();
    *a4 = v35;
  }
  int v13 = [v12 isInCompactMode];
  v14 = [v12 selectionSnapshot];
  int v15 = [v14 areAllItemsSelected];

  int v16 = [v12 allowsAddToLibraryAction];
  int v17 = [v12 allowsInfoAction];
  if [v12 wantsToolbarVisible] && (objc_msgSend(v12, "prefersActionsInToolbar"))
  {
    int v18 = 1;
  }
  else if ([v12 shouldAlwaysRespectToolbarActionPlacementPreference])
  {
    int v18 = [v12 prefersActionsInToolbar];
  }
  else
  {
    int v18 = 0;
  }
  int v19 = [v12 allowsTapbackAction];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __192__PXPhotosBarsItemIdentifierProviderBase__topBarValuesForSelectionModeWithModel_title_leadingIdentifiers_trailingIdentifiers_allowSelectAll_allowAdd_allowTrashActions_allowDeleteShareActions___block_invoke;
  aBlock[3] = &unk_1E5DD2D18;
  id v21 = v20;
  id v43 = v21;
  v22 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  if ([v12 canExitSelectMode]) {
    v22[2](v22, @"PXBarItemIdentifierCancel");
  }
  if (((v19 ^ 1 | v18) & 1) == 0) {
    v22[2](v22, @"PXBarItemIdentifierTapback");
  }
  if ((v16 ^ 1 | v18))
  {
    if (!v17) {
      goto LABEL_17;
    }
LABEL_23:
    v22[2](v22, @"PXBarItemIdentifierInfo");
    if (v13) {
      goto LABEL_18;
    }
LABEL_24:
    if (a9)
    {
      v47[0] = @"PXBarItemIdentifierDelete";
      v47[1] = @"PXBarItemIdentifierRestore";
      v25 = (void *)MEMORY[0x1E4F1C978];
      v26 = (__CFString **)v47;
      uint64_t v27 = 2;
    }
    else
    {
      if (a10)
      {
        v46 = @"PXBarItemIdentifierShare";
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
        if ([v12 allowsTrashAction])
        {
          uint64_t v29 = [v24 arrayByAddingObject:@"PXBarItemIdentifierTrash"];

          v24 = (void *)v29;
        }
        if (v39)
        {
          uint64_t v30 = [v24 arrayByAddingObject:@"PXBarItemIdentifierAdd"];

          v24 = (void *)v30;
          if (!v10) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }
LABEL_39:
        if (!v10) {
          goto LABEL_44;
        }
LABEL_40:
        if (v15) {
          v36 = @"PXBarItemIdentifierDeselectAll";
        }
        else {
          v36 = @"PXBarItemIdentifierSelectAll";
        }
        v22[2](v22, v36);
        goto LABEL_44;
      }
      if (!v39)
      {
        v24 = (void *)MEMORY[0x1E4F1CBF0];
        if (!v10) {
          goto LABEL_44;
        }
        goto LABEL_40;
      }
      v45 = @"PXBarItemIdentifierAdd";
      v25 = (void *)MEMORY[0x1E4F1C978];
      v26 = &v45;
      uint64_t v27 = 1;
    }
    v24 = [v25 arrayWithObjects:v26 count:v27];
    goto LABEL_39;
  }
  v22[2](v22, @"PXBarItemIdentifierAddToLibrary");
  if (v17) {
    goto LABEL_23;
  }
LABEL_17:
  if (!v13) {
    goto LABEL_24;
  }
LABEL_18:
  if (v10)
  {
    v23 = @"PXBarItemIdentifierSelectAll";
    if (v15) {
      v23 = @"PXBarItemIdentifierDeselectAll";
    }
    v48[0] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v39)
  {
    uint64_t v28 = [v24 arrayByAddingObject:@"PXBarItemIdentifierAdd"];

    v24 = (void *)v28;
  }
LABEL_44:
  if (![v24 count])
  {
    v44 = @"PXBarItemIdentifierPlaceholder";
    uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];

    v24 = (void *)v37;
  }
  if ([v21 count]) {
    [v21 insertObject:@"PXBarItemIdentifierButtonEndSpacing" atIndex:0];
  }
  id v38 = v24;
  *a5 = v38;
  *a6 = (id)[v21 copy];
}

void __192__PXPhotosBarsItemIdentifierProviderBase__topBarValuesForSelectionModeWithModel_title_leadingIdentifiers_trailingIdentifiers_allowSelectAll_allowAdd_allowTrashActions_allowDeleteShareActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

@end