@interface SBIconListModelRepairUtilities
+ (BOOL)_findAndRepairEmptyRows:(id)a3 avoidingIcons:(id)a4 gridCellInfo:(id)a5;
+ (BOOL)_findAndRepairIconSizedGaps:(id)a3 gridSizeClassSizes:(id)a4 gridCellInfo:(id)a5;
+ (BOOL)_findAndRepairWidgetSizedGaps:(id)a3 widgetGridSizeClass:(id)a4 widgetGridSize:(SBHIconGridSize)a5 iconLayoutBehavior:(unint64_t)a6 gridCellInfo:(id)a7;
+ (id)_firstIconOfSizeClass:(id)a3 withIcons:(id)a4 inRange:(_NSRange)a5;
+ (id)_performRepairOnIcons:(id)a3 startingGridCellInfo:(id)a4 gridCellInfoProvider:(id)a5 usingRepairBlock:(id)a6;
+ (id)repairModelByEliminatingGapsInIcons:(id)a3 avoidingIcons:(id)a4 gridSize:(SBHIconGridSize)a5 gridSizeClassSizes:(id)a6 iconLayoutBehavior:(unint64_t)a7 fixedIconLocations:(id)a8;
+ (unint64_t)_maxGridCellIndexWithGridCellInfo:(id)a3;
@end

@implementation SBIconListModelRepairUtilities

+ (id)repairModelByEliminatingGapsInIcons:(id)a3 avoidingIcons:(id)a4 gridSize:(SBHIconGridSize)a5 gridSizeClassSizes:(id)a6 iconLayoutBehavior:(unint64_t)a7 fixedIconLocations:(id)a8
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  if (![v14 count])
  {
    v28 = 0;
    goto LABEL_21;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (!v19)
  {
    v28 = 0;
    goto LABEL_20;
  }
  uint64_t v20 = v19;
  SBHIconGridSize v44 = a5;
  unint64_t v45 = a7;
  id v46 = a1;
  v47 = v15;
  v48 = v17;
  unint64_t v21 = a7 & 3;
  uint64_t v22 = *(void *)v74;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v74 != v22) {
        objc_enumerationMutation(v18);
      }
      v24 = [*(id *)(*((void *)&v73 + 1) + 8 * i) gridSizeClass];
      v25 = v24;
      if (!v24) {
        goto LABEL_11;
      }
      int v26 = [v24 isEqualToString:@"SBHIconGridSizeClassDefault"];
      int v27 = v26;
      if (v21 == 3 && (v26 & 1) == 0)
      {
        if ([v16 gridSizeForGridSizeClass:v25] != 65537)
        {

LABEL_19:
          uint64_t v43 = [v18 nodes];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke;
          aBlock[3] = &unk_1E6AB4EF8;
          id v29 = v18;
          id v68 = v29;
          SBHIconGridSize v72 = v44;
          id v30 = v16;
          id v69 = v30;
          unint64_t v71 = v45;
          id v70 = v48;
          v31 = (void (**)(void))_Block_copy(aBlock);
          v32 = v31[2]();
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_2;
          v63[3] = &unk_1E6AB4F20;
          id v66 = v46;
          id v33 = v29;
          id v64 = v33;
          id v65 = v47;
          v34 = [v46 _performRepairOnIcons:v33 startingGridCellInfo:v32 gridCellInfoProvider:v31 usingRepairBlock:v63];

          LODWORD(v32) = [v30 gridSizeForGridSizeClass:@"SBHIconGridSizeClassLarge"];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_3;
          v58[3] = &unk_1E6AB4F48;
          id v60 = v46;
          id v35 = v33;
          int v62 = (int)v32;
          id v59 = v35;
          unint64_t v61 = v45;
          v36 = [v46 _performRepairOnIcons:v35 startingGridCellInfo:v34 gridCellInfoProvider:v31 usingRepairBlock:v58];

          LODWORD(v34) = [v30 gridSizeForGridSizeClass:@"SBHIconGridSizeClassSmall"];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_4;
          v53[3] = &unk_1E6AB4F48;
          id v55 = v46;
          id v37 = v35;
          int v57 = (int)v34;
          id v54 = v37;
          unint64_t v56 = v45;
          v38 = [v46 _performRepairOnIcons:v37 startingGridCellInfo:v36 gridCellInfoProvider:v31 usingRepairBlock:v53];

          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_5;
          v49[3] = &unk_1E6AB4F20;
          id v52 = v46;
          id v39 = v37;
          id v50 = v39;
          id v51 = v30;
          v40 = [v46 _performRepairOnIcons:v39 startingGridCellInfo:v38 gridCellInfoProvider:v31 usingRepairBlock:v49];

          v41 = [v39 nodes];
          id v15 = v47;
          id v18 = (id)v43;
          v28 = +[SBIconListModel movedIconsWithOriginalOrder:v43 newOrder:v41];

          id v17 = v48;
          goto LABEL_20;
        }
LABEL_11:

        continue;
      }

      if (!v27) {
        goto LABEL_19;
      }
    }
    uint64_t v20 = [v18 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v20) {
      continue;
    }
    break;
  }
  v28 = 0;
  id v15 = v47;
  id v17 = v48;
LABEL_20:

LABEL_21:
  return v28;
}

id __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nodes];
  v3 = +[SBIconListModel iconGridCellInfoForIcons:v2 gridSize:*(unsigned int *)(a1 + 64) gridSizeClassSizes:*(void *)(a1 + 40) iconLayoutBehavior:*(void *)(a1 + 56) referenceIconOrder:v2 fixedIconLocations:*(void *)(a1 + 48) options:12];

  return v3;
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _findAndRepairEmptyRows:*(void *)(a1 + 32) avoidingIcons:*(void *)(a1 + 40) gridCellInfo:a2];
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _findAndRepairWidgetSizedGaps:*(void *)(a1 + 32) widgetGridSizeClass:@"SBHIconGridSizeClassLarge" widgetGridSize:*(unsigned int *)(a1 + 56) iconLayoutBehavior:*(void *)(a1 + 48) gridCellInfo:a2];
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _findAndRepairWidgetSizedGaps:*(void *)(a1 + 32) widgetGridSizeClass:@"SBHIconGridSizeClassSmall" widgetGridSize:*(unsigned int *)(a1 + 56) iconLayoutBehavior:*(void *)(a1 + 48) gridCellInfo:a2];
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _findAndRepairIconSizedGaps:*(void *)(a1 + 32) gridSizeClassSizes:*(void *)(a1 + 40) gridCellInfo:a2];
}

+ (id)_performRepairOnIcons:(id)a3 startingGridCellInfo:(id)a4 gridCellInfoProvider:(id)a5 usingRepairBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(void))a5;
  v12 = (unsigned int (**)(id, id))a6;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = 20;
  while (1)
  {
    id v14 = objc_msgSend(v9, "copy", v26);
    if (!v12[2](v12, v10)) {
      break;
    }
    id v15 = v11[2](v11);
    if ([v15 isEqual:v10])
    {
      id v16 = SBLogIcon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "List model repair did not change icon order, rolling back and stopping", buf, 2u);
      }

      id v17 = [v14 nodes];
      [v9 setNodes:v17];

      char v18 = 0;
      uint64_t v19 = v14;
      uint64_t v20 = v9;
      id v9 = v14;
    }
    else
    {
      if ([v26 containsObject:v15])
      {
        unint64_t v21 = SBLogIcon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v27 = 0;
          _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "Previous layout detecting when trying to repair list model", v27, 2u);
        }

        char v18 = 0;
      }
      else
      {
        [v26 insertObject:v15 atIndex:0];
        if ((unint64_t)[v26 count] >= 4) {
          [v26 removeLastObject];
        }
        char v18 = 1;
      }
      uint64_t v19 = v15;
      uint64_t v20 = v10;
      id v10 = v15;
    }
    id v22 = v19;

    if (!v13) {
      goto LABEL_19;
    }

    --v13;
    if ((v18 & 1) == 0) {
      goto LABEL_23;
    }
  }
  if (v13) {
    goto LABEL_22;
  }
LABEL_19:
  v23 = SBLogIcon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[SBIconListModelRepairUtilities _performRepairOnIcons:startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:](v23);
  }

LABEL_22:
LABEL_23:
  id v24 = v10;

  return v24;
}

+ (BOOL)_findAndRepairEmptyRows:(id)a3 avoidingIcons:(id)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  unsigned int v12 = [v10 gridSize];
  if ([a1 _maxGridCellIndexWithGridCellInfo:v10] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v13 = 0;
  }
  else
  {
    int v24 = (unsigned __int16)v12;
    unsigned __int16 v14 = v12;
    unsigned int v15 = [v10 usedGridSize];
    __int16 v16 = v15;
    uint64_t v17 = HIWORD(v15);
    unsigned int v18 = [v10 isLayoutOutOfBounds];
    if (v17 < HIWORD(v12)) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = v19 + v17;
    if (v20 && v20 == HIWORD(v12)) {
      LOWORD(v20) = v20 - (v18 ^ 1);
    }
    unint64_t v41 = 0;
    uint64_t v42 = 0;
    v40[0] = 0;
    v40[1] = 0;
    SBHIconGridRangeDivide(0, v12, (uint64_t)&v41, (uint64_t)v40, (unsigned __int16)v20, 1, v12);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke;
    aBlock[3] = &unk_1E6AADB28;
    id v39 = v9;
    unint64_t v21 = _Block_copy(aBlock);
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_2;
    v25[3] = &unk_1E6AB4F98;
    unsigned int v31 = v12;
    id v26 = v10;
    __int16 v32 = v16;
    __int16 v33 = v17;
    id v27 = v8;
    id v22 = v21;
    id v29 = &v34;
    uint64_t v30 = v11;
    id v28 = v22;
    SBHIconGridRangeEnumerateSubranges(v41, v42, v24 | 0x10000, v14, 0, v25);
    BOOL v13 = *((unsigned char *)v35 + 24) != 0;

    _Block_object_dispose(&v34, 8);
  }

  return v13;
}

uint64_t __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = a2 / *(unsigned __int16 *)(a1 + 72);
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfUsedGridCellsInRow:columnRange:", v6, 0, *(unsigned __int16 *)(a1 + 76)))
  {
    return;
  }
  v25[0] = 0;
  v25[1] = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  SBHIconGridRangeDivide(0, *(unsigned int *)(a1 + 72), (uint64_t)v25, (uint64_t)&v23, (unsigned __int16)v6, 1, *(_DWORD *)(a1 + 72));
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfFirstUsedGridCellInGridRange:", v23, v24);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  unint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v10 = SBHIconGridRangeMaxCellIndex(v23, v24, *(_DWORD *)(a1 + 72));
  if (v8 >= v10) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v11 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:v8];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || ([v9 containsIndex:v11] & 1) != 0) {
      goto LABEL_8;
    }
    [v9 addIndex:v11];
    unsigned int v12 = [*(id *)(a1 + 40) nodeAtIndex:v11];
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))()) {
      break;
    }

LABEL_8:
    if (v10 == ++v8) {
      goto LABEL_11;
    }
  }
  v20[3] = v11;

LABEL_11:
  if (v20[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    BOOL v13 = objc_msgSend(*(id *)(a1 + 32), "indexesOfOutOfBoundsIconInRange:", 0, *(void *)(a1 + 64));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_3;
    v15[3] = &unk_1E6AB4F70;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    unsigned int v18 = &v19;
    [v13 enumerateIndexesUsingBlock:v15];

    if (v20[3] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    unsigned __int16 v14 = objc_msgSend(*(id *)(a1 + 40), "nodeAtIndex:");
    [*(id *)(a1 + 40) moveNode:v14 toIndex:v20[3] - 1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  *a4 = 1;
  _Block_object_dispose(&v19, 8);
}

void __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) nodeAtIndex:a2];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
}

+ (BOOL)_findAndRepairWidgetSizedGaps:(id)a3 widgetGridSizeClass:(id)a4 widgetGridSize:(SBHIconGridSize)a5 iconLayoutBehavior:(unint64_t)a6 gridCellInfo:(id)a7
{
  unsigned int v35 = a6;
  unint64_t v8 = *(void *)&a5.columns;
  unint64_t v11 = (unint64_t)a3;
  v38 = (__CFString *)a4;
  id v12 = a7;
  id v34 = a1;
  uint64_t v13 = [a1 _maxGridCellIndexWithGridCellInfo:v12];
  v40 = (void *)v11;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = v13;
    unsigned int v15 = [(id)v11 indexesOfNodesPassingTest:&__block_literal_global_70];
    uint64_t v16 = [v15 count];

    unsigned int v17 = [v12 gridSize];
    if (v14)
    {
      unint64_t v32 = v16;
      unint64_t v18 = 0;
      char v39 = 0;
      unint64_t v19 = 0;
      unint64_t v20 = (unsigned __int16)v17;
      uint64_t v42 = v8;
      uint64_t v33 = v17;
      unsigned int v21 = v35;
      while (1)
      {
        unint64_t v22 = [v12 iconIndexForGridCellIndex:v18];
        if (v22 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v22 > v19) {
            unint64_t v19 = v22;
          }
          goto LABEL_20;
        }
        unint64_t v8 = v8 & 0xFFFFFFFF00000000 | v42;
        if (_SBIconListIsColumnValidForGridSize(v18 % v20, v20, v8, v21))
        {
          unint64_t v11 = v11 & 0xFFFFFFFF00000000 | [v12 gridSize];
          unint64_t v41 = v41 & 0xFFFFFFFF00000000 | v42;
          if (_SBIconListIsRowValidForGridSize(v18 / v20, v42, v11, v21)) {
            break;
          }
        }
LABEL_20:
        if (v14 == ++v18) {
          goto LABEL_31;
        }
      }
      unint64_t v36 = v11;
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      char v49 = 1;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __131__SBIconListModelRepairUtilities__findAndRepairWidgetSizedGaps_widgetGridSizeClass_widgetGridSize_iconLayoutBehavior_gridCellInfo___block_invoke_2;
      v43[3] = &unk_1E6AB2210;
      id v23 = v12;
      id v44 = v23;
      unint64_t v45 = &v46;
      unint64_t v37 = v37 & 0xFFFFFFFF00000000 | v33;
      SBHIconGridRangeEnumerateCellIndexes(v18, v42, v33, v43);
      if (!*((unsigned char *)v47 + 24))
      {
        char v30 = 1;
        goto LABEL_28;
      }
      unint64_t v24 = v19 + 1;
      uint64_t v25 = [v40 count] - (v19 + 1);
      uint64_t v26 = objc_msgSend(v34, "_firstIconOfSizeClass:withIcons:inRange:", v38, v40, v19 + 1, v25);
      id v27 = (void *)v26;
      if (v39 & 1 | (v26 == 0))
      {
        if (!v26)
        {
          if ((@"SBHIconGridSizeClassLarge" == v38
             || -[__CFString isEqualToString:](v38, "isEqualToString:", @"SBHIconGridSizeClassLarge"))&& ((v28 = [v23 isLayoutOutOfBounds], v32 < 2) ? (int v29 = v28) : (int v29 = 0), v29 == 1))
          {
            id v27 = objc_msgSend(v34, "_firstIconOfSizeClass:withIcons:inRange:", @"SBHIconGridSizeClassExtraLarge", v40, v19 + 1, v25);
            if (!(v39 & 1 | (v27 == 0)))
            {
              [v40 moveNode:v27 toIndex:v19];
LABEL_24:
              char v30 = 1;
              char v39 = 1;
LABEL_27:

              unint64_t v19 = v24;
              unsigned int v21 = v35;
LABEL_28:
              unint64_t v11 = v36;

              _Block_object_dispose(&v46, 8);
              if ((v30 & 1) == 0) {
                goto LABEL_31;
              }
              goto LABEL_20;
            }
          }
          else
          {
            id v27 = 0;
          }
        }
        char v30 = 0;
        unint64_t v24 = v19;
        goto LABEL_27;
      }
      [v40 moveNode:v26 toIndex:v19 + 1];
      goto LABEL_24;
    }
  }
  char v39 = 0;
LABEL_31:

  return v39 & 1;
}

uint64_t __131__SBIconListModelRepairUtilities__findAndRepairWidgetSizedGaps_widgetGridSizeClass_widgetGridSize_iconLayoutBehavior_gridCellInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 gridSizeClass];
  if (v3 == @"SBHIconGridSizeClassExtraLarge")
  {
    uint64_t v5 = 1;
  }
  else
  {
    v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassExtraLarge"];
  }
  return v5;
}

uint64_t __131__SBIconListModelRepairUtilities__findAndRepairWidgetSizedGaps_widgetGridSizeClass_widgetGridSize_iconLayoutBehavior_gridCellInfo___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)_findAndRepairIconSizedGaps:(id)a3 gridSizeClassSizes:(id)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 _maxGridCellIndexWithGridCellInfo:v10];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v13 = v11;
    uint64_t v20 = 0;
    unsigned int v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke;
    v15[3] = &unk_1E6AB4FE8;
    id v16 = v10;
    uint64_t v19 = v13;
    id v17 = v8;
    unint64_t v18 = &v20;
    [v9 enumerateGridSizesSortedByAreaWithOptions:2 usingBlock:v15];
    BOOL v12 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }

  return v12;
}

void __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke(uint64_t a1, void *a2, unsigned int a3, unsigned char *a4)
{
  id v7 = a2;
  unint64_t v8 = [*(id *)(a1 + 32) indexOfFirstEmptyGridCellRangeOfSize:a3];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_19;
  }
  unint64_t v9 = v8;
  if (v8 > *(void *)(a1 + 56)) {
    goto LABEL_19;
  }
  uint64_t v20 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v11 = 0;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", v11, v20);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_15;
    }
    uint64_t v14 = v13;
    if ([v10 containsIndex:v13]) {
      goto LABEL_15;
    }
    [v10 addIndex:v14];
    if (v11 <= v9) {
      goto LABEL_15;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = v14;
    }
    unsigned int v15 = [*(id *)(a1 + 40) nodeAtIndex:v14];
    id v16 = [v15 gridSizeClass];
    if (v16 != v7)
    {
      if ([v7 isEqualToString:v16] && v12 != v14) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
    if (v12 != v14) {
      break;
    }
LABEL_14:

LABEL_15:
    if (++v11 > *(void *)(a1 + 56)) {
      goto LABEL_16;
    }
  }
  id v16 = v7;
LABEL_21:
  [*(id *)(a1 + 40) moveNode:v15 toIndex:v12];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  *uint64_t v20 = 1;

LABEL_16:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v17 = [*(id *)(a1 + 32) indexesOfOutOfBoundsIcons];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke_2;
    v21[3] = &unk_1E6AB4FC0;
    id v22 = *(id *)(a1 + 40);
    id v18 = v7;
    uint64_t v19 = *(void *)(a1 + 48);
    id v23 = v18;
    uint64_t v24 = v19;
    uint64_t v25 = v12;
    uint64_t v26 = v20;
    [v17 enumerateIndexesUsingBlock:v21];
  }
LABEL_19:
}

void __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v7 = [*(id *)(a1 + 32) nodeAtIndex:a2];
  uint64_t v5 = [v7 gridSizeClass];
  id v6 = *(void **)(a1 + 40);
  if (v6 == v5 || [v6 isEqualToString:v5])
  {
    [*(id *)(a1 + 32) moveNode:v7 toIndex:*(void *)(a1 + 56)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
    **(unsigned char **)(a1 + 64) = 1;
  }
}

+ (id)_firstIconOfSizeClass:(id)a3 withIcons:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a3;
  if (location >= location + length)
  {
LABEL_5:
    unint64_t v9 = 0;
  }
  else
  {
    while (1)
    {
      unint64_t v9 = [a4 nodeAtIndex:location];
      uint64_t v10 = [v9 gridSizeClass];
      if ((id)v10 == v8) {
        break;
      }
      unint64_t v11 = (void *)v10;
      uint64_t v12 = [v9 gridSizeClass];
      char v13 = [v12 isEqualToString:v8];

      if (v13) {
        goto LABEL_7;
      }

      ++location;
      if (!--length) {
        goto LABEL_5;
      }
    }
  }
LABEL_7:

  return v9;
}

+ (unint64_t)_maxGridCellIndexWithGridCellInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isLayoutOutOfBounds])
  {
    int v4 = [v3 gridSize];

    return SBHIconGridSizeGetArea(v4);
  }
  else
  {
    unint64_t v6 = [v3 lastUsedGridCellIndex];

    return v6;
  }
}

+ (void)_performRepairOnIcons:(os_log_t)log startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Too may tries to repair list model", v1, 2u);
}

@end