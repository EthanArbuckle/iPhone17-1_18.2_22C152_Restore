@interface PXPhotosBarsItemIdentifierProviderGeneric
+ (void)valuesForModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 toolbarIdentifiers:(id *)a7 hasSharedLibraryOrPreview:(BOOL)a8;
@end

@implementation PXPhotosBarsItemIdentifierProviderGeneric

+ (void)valuesForModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 toolbarIdentifiers:(id *)a7 hasSharedLibraryOrPreview:(BOOL)a8
{
  id v10 = a3;
  uint64_t v11 = [v10 currentDataSource];
  unint64_t v12 = [v10 allowedChromeItems];
  int v13 = [v10 isInSelectMode];
  v14 = [v10 selectionSnapshot];
  char v15 = [v14 isAnyItemSelected];

  uint64_t v16 = [v10 navBarStyle];
  unsigned int v17 = 0;
  if ([v10 allowsAddAction] && (v13 & 1) == 0 && (v15 & 1) == 0) {
    unsigned int v17 = [v10 allowsEmptyPlaceholderBehavior];
  }
  unsigned int v101 = v17;
  id v92 = a1;
  if ([v10 allowsShareAction])
  {
    v18 = [v10 assetActionManager];
    HIDWORD(v82) = [v18 supportsActionType:@"PXAssetActionTypeShare"];
  }
  else
  {
    HIDWORD(v82) = 0;
  }
  int v19 = [v10 allowsTrashAction];
  v105 = a6;
  unsigned int v90 = [v10 allowsSelectAllAction];
  if (([v10 isInCompactMode] & 1) != 0 || !objc_msgSend(v10, "supportsAspectRatioToggle")) {
    LODWORD(v86) = 0;
  }
  else {
    uint64_t v86 = (v12 >> 13) & 1;
  }
  int v20 = [v10 wantsToolbarVisible];
  v21 = +[PXPhotosGridSettings sharedInstance];
  int v85 = v19;
  if ([v21 enableNewActionMenu])
  {
    int v22 = [v10 allowsActionMenuBehavior];

    if (v22)
    {
      v23 = [v10 currentLens];
      int v24 = [v23 allowsActionMenu];

      if (v24)
      {
        uint64_t v99 = (v12 >> 1) & 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
  }
  LODWORD(v99) = 0;
LABEL_18:
  if (v16) {
    char v25 = v20;
  }
  else {
    char v25 = 0;
  }
  int v26 = [v10 allowsDismissAction];
  int v27 = [v10 allowsAddToLibraryAction];
  int v89 = [v10 allowsContentSyndicationSaveAllAction];
  int v28 = [v10 allowsInfoAction];
  int v84 = [v10 allowsMultiSelectMenu];
  int v91 = [v10 allowsReplyAction];
  char v87 = [v10 allowsTapbackAction];
  if [v10 wantsToolbarVisible] && (objc_msgSend(v10, "prefersActionsInToolbar"))
  {
    int v94 = 1;
  }
  else if ([v10 shouldAlwaysRespectToolbarActionPlacementPreference])
  {
    int v94 = [v10 prefersActionsInToolbar];
  }
  else
  {
    int v94 = 0;
  }
  v106 = (void *)v11;
  int v97 = v13;
  int v100 = v28;
  if (v12) {
    uint64_t v29 = [v10 dismissAffordance];
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v30 = [v10 contentPrivacyState];
  int v31 = [v10 allowsShareAllAction];
  uint64_t v88 = v16;
  int v93 = v27;
  int v96 = v26;
  if ([v10 allowsShareAllAction]) {
    int v32 = [v10 wantsShareGridButtonVisible];
  }
  else {
    int v32 = 0;
  }
  v33 = [v10 specManager];
  v34 = [v33 spec];
  int v35 = [v34 wantsToggleSidebarButton];

  char v36 = [v10 wantsSelectModeCaptionInContextMenu];
  if (v30)
  {
    id v37 = [MEMORY[0x1E4F1CA48] array];
    v38 = [MEMORY[0x1E4F1CA48] array];
    id v39 = v38;
    if (v35)
    {
      v40 = &PXBarItemIdentifierToggleSidebar;
      v38 = v37;
      v42 = v105;
      v41 = v106;
      v43 = a7;
      v44 = a5;
LABEL_93:
      [v38 addObject:*v40];
      v47 = 0;
      id v46 = 0;
      goto LABEL_169;
    }
    v44 = a5;
    v42 = v105;
    if (v29 == 1)
    {
      v40 = PXBarItemIdentifierDismiss;
    }
    else
    {
      if (v29 != 4)
      {
        v41 = v106;
        if (v29 != 2)
        {
          v47 = 0;
          id v46 = 0;
          v43 = a7;
          goto LABEL_169;
        }
        v40 = PXBarItemIdentifierDismiss;
        goto LABEL_92;
      }
      v40 = PXBarItemIdentifierExplicitBack;
    }
    v38 = v37;
    v41 = v106;
LABEL_92:
    v43 = a7;
    goto LABEL_93;
  }
  char v45 = v36;
  v41 = v106;
  if ([v106 containsAnyItems])
  {
    if (v97)
    {
      v119[0] = 0;
      id v117 = (id)MEMORY[0x1E4F1CBF0];
      id v118 = (id)MEMORY[0x1E4F1CBF0];
      BYTE1(v82) = v25 ^ 1;
      LOBYTE(v82) = 0;
      objc_msgSend(v92, "_topBarValuesForSelectionModeWithModel:title:leadingIdentifiers:trailingIdentifiers:allowSelectAll:allowAdd:allowTrashActions:allowDeleteShareActions:", v10, v119, &v118, &v117, v90, v101, v82);
      id v46 = v119[0];
      id v37 = v118;
      id v39 = v117;
      v47 = 0;
      if (!v20)
      {
LABEL_166:
        if (a4)
        {
          v43 = a7;
          v44 = a5;
          v42 = v105;
          if (v46)
          {
            id v46 = v46;
            *a4 = v46;
          }
          goto LABEL_169;
        }
        v43 = a7;
LABEL_135:
        v44 = a5;
        v42 = v105;
        goto LABEL_169;
      }
      id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v49 = v48;
      if ((v83 | v85) == 1)
      {
        int v50 = v83 ^ 1;
        if (v83) {
          v51 = @"PXBarItemIdentifierShare";
        }
        else {
          v51 = @"PXBarItemIdentifierTrash";
        }
        [v48 addObject:v51];
      }
      else
      {
        int v50 = 0;
      }
      if ([v10 navBarStyle])
      {
        [v49 addObject:@"PXBarItemIdentifierPlaceholder"];
        if ([v10 allowsMergeDuplicatesAction])
        {
          v74 = PXBarItemIdentifierMergeDuplicates;
LABEL_150:
          int v79 = v93;
LABEL_156:
          [v49 addObject:*v74];
          goto LABEL_157;
        }
        if ([v10 allowsMoveToLibraryAction])
        {
          v74 = PXBarItemIdentifierMoveToLibrary;
          goto LABEL_150;
        }
        if ([v10 allowsMoveToPersonalLibraryAction])
        {
          v74 = PXBarItemIdentifierMoveToPersonalLibrary;
          goto LABEL_150;
        }
        int v80 = [v10 allowsMoveToSharedLibraryAction];
        if (v80) {
          v74 = PXBarItemIdentifierMoveToSharedLibrary;
        }
        else {
          v74 = PXBarItemIdentifierSelectModeCaption;
        }
        if (v80) {
          goto LABEL_150;
        }
        char v81 = v45 ^ 1;
        int v79 = v93;
        if (v81) {
          goto LABEL_156;
        }
LABEL_157:
        v41 = v106;
        if ((v79 & v94) == 1)
        {
          [v49 addObject:@"PXBarItemIdentifierPlaceholder"];
          [v49 addObject:@"PXBarItemIdentifierAddToLibrary"];
        }
        if ([v10 allowsFileRadarAction])
        {
          [v49 addObject:@"PXBarItemIdentifierPlaceholder"];
          [v49 addObject:@"PXBarItemIdentifierFileRadar"];
        }
        if (((v50 | v85 ^ 1) & 1) == 0)
        {
          [v49 addObject:@"PXBarItemIdentifierPlaceholder"];
          [v49 addObject:@"PXBarItemIdentifierTrash"];
        }
        if ((v84 & v97) != 0)
        {
          [v49 addObject:@"PXBarItemIdentifierInterButtonSpacing"];
          [v49 addObject:@"PXBarItemIdentifierSelectModeMenu"];
        }
        v47 = (void *)[v49 copy];

        goto LABEL_166;
      }
      if (v101)
      {
        v74 = PXBarItemIdentifierAdd;
        int v79 = v93;
      }
      else
      {
        int v79 = v93;
        if ([v10 allowsMergeDuplicatesAction])
        {
          v74 = PXBarItemIdentifierMergeDuplicates;
        }
        else if ([v10 allowsMoveToLibraryAction])
        {
          v74 = PXBarItemIdentifierMoveToLibrary;
        }
        else if ([v10 allowsMoveToPersonalLibraryAction])
        {
          v74 = PXBarItemIdentifierMoveToPersonalLibrary;
        }
        else
        {
          if (![v10 allowsMoveToSharedLibraryAction]) {
            goto LABEL_157;
          }
          v74 = PXBarItemIdentifierMoveToSharedLibrary;
        }
      }
      [v49 addObject:@"PXBarItemIdentifierPlaceholder"];
      goto LABEL_156;
    }
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke;
    v115[3] = &unk_1E5DD2D18;
    id v62 = v61;
    id v116 = v62;
    v63 = (void (**)(void *, __CFString *))_Block_copy(v115);
    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2;
    v113[3] = &unk_1E5DD2D18;
    id v98 = v64;
    id v114 = v98;
    v65 = (void (**)(void *, __CFString *))_Block_copy(v113);
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3;
    v111[3] = &unk_1E5DD2D18;
    id v112 = v66;
    id v102 = v66;
    v67 = (void (**)(void *, __CFString *))_Block_copy(v111);
    if (v29 == 2) {
      char v68 = v35;
    }
    else {
      char v68 = 1;
    }
    if ((v68 & 1) == 0) {
      v63[2](v63, @"PXBarItemIdentifierDismiss");
    }
    if (v99) {
      v63[2](v63, @"PXBarItemIdentifierActionMenu");
    }
    if (v89)
    {
      if (v94) {
        v69 = v67;
      }
      else {
        v69 = v63;
      }
      v69[2](v69, @"PXBarItemIdentifierContentSyndicationSaveAll");
    }
    if ([v10 wantsSelectButton]) {
      v63[2](v63, @"PXBarItemIdentifierSelect");
    }
    int v70 = v31 & v94;
    if ([v10 searchActionLocation] == 1) {
      v63[2](v63, @"PXBarItemIdentifierSearch");
    }
    if ((v70 | v32) == 1)
    {
      if (v70) {
        v71 = v67;
      }
      else {
        v71 = v63;
      }
      v71[2](v71, @"PXBarItemIdentifierShare");
    }
    if (v91)
    {
      int v72 = v86;
      if (v94)
      {
        v67[2](v67, @"PXBarItemIdentifierReply");
        v73 = v67;
        if ((v87 & 1) == 0)
        {
LABEL_110:
          if (v100) {
            v63[2](v63, @"PXBarItemIdentifierInfo");
          }
          if (v93)
          {
            if (v94) {
              v78 = v67;
            }
            else {
              v78 = v63;
            }
            v78[2](v78, @"PXBarItemIdentifierAddToLibrary");
            if (!v72)
            {
LABEL_114:
              if (v35)
              {
LABEL_115:
                v75 = &PXBarItemIdentifierToggleSidebar;
                v43 = a7;
                uint64_t v76 = v88;
                v77 = v98;
                goto LABEL_130;
              }
LABEL_121:
              if (v96) {
                v65[2](v65, @"PXBarItemIdentifierDismiss");
              }
              uint64_t v76 = v88;
              v77 = v98;
              if (v29 == 1)
              {
                v75 = PXBarItemIdentifierDismiss;
                v43 = a7;
              }
              else
              {
                BOOL v59 = v29 == 4;
                v43 = a7;
                if (!v59)
                {
LABEL_131:
                  if (v76 && [v62 count]) {
                    [v62 insertObject:@"PXBarItemIdentifierButtonEndSpacing" atIndex:0];
                  }
                  id v37 = v77;
                  id v39 = v62;
                  v47 = (void *)[v102 copy];

                  id v46 = 0;
                  v41 = v106;
                  goto LABEL_135;
                }
                v75 = PXBarItemIdentifierExplicitBack;
              }
LABEL_130:
              v65[2](v65, *v75);
              goto LABEL_131;
            }
          }
          else if (!v72)
          {
            goto LABEL_114;
          }
          v63[2](v63, @"PXBarItemIdentifierToggleAspectFit");
          if (v35) {
            goto LABEL_115;
          }
          goto LABEL_121;
        }
LABEL_109:
        v73[2](v73, @"PXBarItemIdentifierTapback");
        goto LABEL_110;
      }
      v63[2](v63, @"PXBarItemIdentifierReply");
      if ((v87 & 1) == 0) {
        goto LABEL_110;
      }
    }
    else
    {
      int v72 = v86;
      if ((v87 & 1) == 0) {
        goto LABEL_110;
      }
      v73 = v67;
      if (v94) {
        goto LABEL_109;
      }
    }
    v73 = v63;
    goto LABEL_109;
  }
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4;
  aBlock[3] = &unk_1E5DD2D18;
  id v53 = v52;
  id v110 = v53;
  v54 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_5;
  v107[3] = &unk_1E5DD2D18;
  id v56 = v55;
  id v108 = v56;
  v57 = _Block_copy(v107);
  v58 = (void (**)(void, void))v57;
  if (v35) {
    (*((void (**)(void *, __CFString *))v57 + 2))(v57, @"PXBarItemIdentifierToggleSidebar");
  }
  v42 = v105;
  if (v29 == 2) {
    v54[2](v54, @"PXBarItemIdentifierDismiss");
  }
  if (v99) {
    v54[2](v54, @"PXBarItemIdentifierActionMenu");
  }
  if (v100) {
    v54[2](v54, @"PXBarItemIdentifierInfo");
  }
  if (v101) {
    v54[2](v54, @"PXBarItemIdentifierAdd");
  }
  if (((v96 ^ 1 | v35) & 1) == 0) {
    ((void (**)(void, __CFString *))v58)[2](v58, @"PXBarItemIdentifierDismiss");
  }
  if (v29 == 1)
  {
    v60 = PXBarItemIdentifierDismiss;
    v43 = a7;
  }
  else
  {
    BOOL v59 = v29 == 4;
    v43 = a7;
    if (!v59) {
      goto LABEL_97;
    }
    v60 = PXBarItemIdentifierExplicitBack;
  }
  ((void (**)(void, __CFString *))v58)[2](v58, *v60);
LABEL_97:
  if ([v53 count]) {
    [v53 insertObject:@"PXBarItemIdentifierButtonEndSpacing" atIndex:0];
  }
  id v37 = v56;
  id v39 = v53;

  v47 = 0;
  id v46 = 0;
  v44 = a5;
LABEL_169:
  if (v44 && v37) {
    id *v44 = v37;
  }
  if (v42 && v39) {
    id *v42 = v39;
  }
  if (v43 && v47) {
    id *v43 = v47;
  }
}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]
    && ([v3 isEqualToString:@"PXBarItemIdentifierInterButtonSpacing"] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierPlaceholder"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 32) addObject:@"PXBarItemIdentifierInterButtonSpacing"];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

@end