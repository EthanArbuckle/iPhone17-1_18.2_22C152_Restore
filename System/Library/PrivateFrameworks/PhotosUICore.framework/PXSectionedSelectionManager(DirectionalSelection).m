@interface PXSectionedSelectionManager(DirectionalSelection)
- (double)_moveItemSelectionInDirection:()DirectionalSelection withDelegate:;
- (double)_moveSectionSelectionInDirection:()DirectionalSelection withDelegate:;
- (uint64_t)_selectInitialItemForMoveInDirection:()DirectionalSelection withDelegate:;
- (uint64_t)_selectInitialSectionForMoveInDirection:()DirectionalSelection withDelegate:;
- (void)_extendSelectionFromIndexPath:()DirectionalSelection toIndexPath:inDirection:withDelegate:;
- (void)_initialItemIndexPathForMoveInDirection:()DirectionalSelection;
- (void)_initialSectionIndexPathForMoveInDirection:()DirectionalSelection;
- (void)_moveSelectionFromIndexPath:()DirectionalSelection inDirection:withDelegate:;
- (void)extendSelectionFromIndexPath:()DirectionalSelection inDirection:withDelegate:;
- (void)extendSelectionToItemIndexPath:()DirectionalSelection withDelegate:;
- (void)moveSelectionInDirection:()DirectionalSelection withDelegate:;
- (void)startingIndexPathForMoveInDirection:()DirectionalSelection;
@end

@implementation PXSectionedSelectionManager(DirectionalSelection)

- (void)_moveSelectionFromIndexPath:()DirectionalSelection inDirection:withDelegate:
{
  id v9 = a4;
  v10 = v9;
  *a5 = 0u;
  a5[1] = 0u;
  if (v9)
  {
    long long v11 = a2[1];
    v17[0] = *a2;
    v17[1] = v11;
    [v9 selectionManager:a1 indexPathClosestToIndexPath:v17 inDirection:a3];
    uint64_t v12 = *(void *)a5;
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v12 != *(void *)off_1E5DAAED8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __106__PXSectionedSelectionManager_DirectionalSelection___moveSelectionFromIndexPath_inDirection_withDelegate___block_invoke;
    v14[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v13 = a5[1];
    long long v15 = *a5;
    long long v16 = v13;
    [a1 performChanges:v14];
  }
}

- (uint64_t)_selectInitialItemForMoveInDirection:()DirectionalSelection withDelegate:
{
  *a2 = 0u;
  a2[1] = 0u;
  uint64_t result = objc_msgSend(a1, "_initialItemIndexPathForMoveInDirection:");
  if (*(void *)a2 != *(void *)off_1E5DAAED8)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__PXSectionedSelectionManager_DirectionalSelection___selectInitialItemForMoveInDirection_withDelegate___block_invoke;
    v6[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v5 = a2[1];
    long long v7 = *a2;
    long long v8 = v5;
    return [a1 performChanges:v6];
  }
  return result;
}

- (uint64_t)_selectInitialSectionForMoveInDirection:()DirectionalSelection withDelegate:
{
  *a2 = 0u;
  a2[1] = 0u;
  uint64_t result = objc_msgSend(a1, "_initialSectionIndexPathForMoveInDirection:");
  if (*(void *)a2 != *(void *)off_1E5DAAED8)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __106__PXSectionedSelectionManager_DirectionalSelection___selectInitialSectionForMoveInDirection_withDelegate___block_invoke;
    v6[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    long long v5 = a2[1];
    long long v7 = *a2;
    long long v8 = v5;
    return [a1 performChanges:v6];
  }
  return result;
}

- (void)_initialItemIndexPathForMoveInDirection:()DirectionalSelection
{
  long long v5 = [a1 selectionSnapshot];
  id v7 = [v5 dataSource];

  if (a2 <= 6)
  {
    if (((1 << a2) & 0x34) != 0)
    {
      if (v7)
      {
        [v7 firstItemIndexPath];
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    if (((1 << a2) & 0x4A) != 0)
    {
      if (v7)
      {
        [v7 lastItemIndexPath];
        goto LABEL_10;
      }
LABEL_8:
      *a3 = 0u;
      a3[1] = 0u;
      goto LABEL_10;
    }
    long long v6 = *((_OWORD *)off_1E5DAB028 + 1);
    *a3 = *(_OWORD *)off_1E5DAB028;
    a3[1] = v6;
  }
LABEL_10:
}

- (void)_initialSectionIndexPathForMoveInDirection:()DirectionalSelection
{
  long long v5 = [a1 selectionSnapshot];
  id v7 = [v5 dataSource];

  if (a2 <= 6)
  {
    if (((1 << a2) & 0x34) != 0)
    {
      if (v7)
      {
        [v7 firstSectionIndexPath];
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    if (((1 << a2) & 0x4A) != 0)
    {
      if (v7)
      {
        [v7 lastSectionIndexPath];
        goto LABEL_10;
      }
LABEL_8:
      *a3 = 0u;
      a3[1] = 0u;
      goto LABEL_10;
    }
    long long v6 = *((_OWORD *)off_1E5DAB028 + 1);
    *a3 = *(_OWORD *)off_1E5DAB028;
    a3[1] = v6;
  }
LABEL_10:
}

- (double)_moveItemSelectionInDirection:()DirectionalSelection withDelegate:
{
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a3;
  [a1 startingIndexPathForMoveInDirection:a2];
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  *a4 = *(_OWORD *)off_1E5DAB028;
  a4[1] = v8;
  if ((void)v14 == *(void *)off_1E5DAAED8)
  {
    [a1 _selectInitialItemForMoveInDirection:a2 withDelegate:v7];
  }
  else
  {
    v11[0] = v14;
    v11[1] = v15;
    [a1 _moveSelectionFromIndexPath:v11 inDirection:a2 withDelegate:v7];
  }

  double result = *(double *)&v12;
  long long v10 = v13;
  *a4 = v12;
  a4[1] = v10;
  return result;
}

- (double)_moveSectionSelectionInDirection:()DirectionalSelection withDelegate:
{
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a3;
  [a1 startingIndexPathForMoveInDirection:a2];
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  *a4 = *(_OWORD *)off_1E5DAB028;
  a4[1] = v8;
  if ((void)v14 == *(void *)off_1E5DAAED8)
  {
    [a1 _selectInitialSectionForMoveInDirection:a2 withDelegate:v7];
  }
  else
  {
    v11[0] = v14;
    v11[1] = v15;
    [a1 _moveSelectionFromIndexPath:v11 inDirection:a2 withDelegate:v7];
  }

  double result = *(double *)&v12;
  long long v10 = v13;
  *a4 = v12;
  a4[1] = v10;
  return result;
}

- (void)moveSelectionInDirection:()DirectionalSelection withDelegate:
{
  id v7 = a3;
  uint64_t v8 = [v7 selectionBasisForSelectionManager:a1];
  long long v9 = *((_OWORD *)off_1E5DAB028 + 1);
  *a4 = *(_OWORD *)off_1E5DAB028;
  a4[1] = v9;
  if (!v8)
  {
    [a1 _moveItemSelectionInDirection:a2 withDelegate:v7];
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    [a1 _moveSectionSelectionInDirection:a2 withDelegate:v7];
LABEL_5:
    *a4 = v10;
    a4[1] = v11;
  }
}

- (void)extendSelectionFromIndexPath:()DirectionalSelection inDirection:withDelegate:
{
  id v8 = a5;
  long long v9 = v8;
  long long v15 = 0u;
  long long v16 = 0u;
  if (v8)
  {
    long long v10 = a3[1];
    long long v13 = *a3;
    long long v14 = v10;
    [v8 selectionManager:a1 indexPathClosestToIndexPath:&v13 inDirection:a4];
  }
  long long v11 = a3[1];
  long long v13 = *a3;
  long long v14 = v11;
  v12[0] = v15;
  v12[1] = v16;
  [a1 _extendSelectionFromIndexPath:&v13 toIndexPath:v12 inDirection:a4 withDelegate:v9];
}

- (void)extendSelectionToItemIndexPath:()DirectionalSelection withDelegate:
{
  id v6 = a4;
  id v7 = [a1 selectionSnapshot];
  if (([v7 isAnyItemSelected] & 1) == 0) {
    [a1 performChanges:&__block_literal_global_110093];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  [a1 startingIndexPathForMoveInDirection:0];
  v10[0] = v11;
  v10[1] = v12;
  long long v8 = a3[1];
  v9[0] = *a3;
  v9[1] = v8;
  [a1 _extendSelectionFromIndexPath:v10 toIndexPath:v9 inDirection:0 withDelegate:v6];
}

- (void)_extendSelectionFromIndexPath:()DirectionalSelection toIndexPath:inDirection:withDelegate:
{
  id v11 = a5;
  long long v12 = v11;
  if (*(void *)a3 != *(void *)off_1E5DAAED8)
  {
    if (*(void *)a2 == *(void *)off_1E5DAAED8)
    {
      long long v14 = a3[1];
      long long v42 = *a3;
      long long v43 = v14;
      long long v15 = [off_1E5DA7430 indexPathSetWithIndexPath:&v42];
      if (!a4)
      {
LABEL_7:
        long long v19 = a2[1];
        long long v42 = *a2;
        long long v43 = v19;
        long long v20 = a3[1];
        long long v40 = *a3;
        long long v41 = v20;
        PXSimpleIndexPathCompare();
      }
    }
    else
    {
      long long v16 = a2[1];
      long long v42 = *a2;
      long long v43 = v16;
      long long v17 = a3[1];
      long long v40 = *a3;
      long long v41 = v17;
      v18 = [v11 selectionManager:a1 indexPathsBetweenIndexPath:&v42 andIndexPath:&v40 inDirection:a4];
      long long v15 = (void *)[v18 mutableCopy];

      if (!a4) {
        goto LABEL_7;
      }
    }
    v21 = [a1 selectionSnapshot];
    long long v22 = a3[1];
    long long v42 = *a3;
    long long v43 = v22;
    int v23 = [v21 isIndexPathSelected:&v42];

    if (!v23) {
      goto LABEL_32;
    }
    long long v24 = a3[1];
    long long v42 = *a3;
    long long v43 = v24;
    [v15 removeIndexPath:&v42];
    unint64_t v25 = a4 & 0xFFFFFFFFFFFFFFFELL;
    if (a4 == 3 || a4 == 6)
    {
      if (v25 != 4) {
        goto LABEL_17;
      }
    }
    else if (v25 != 4)
    {
      goto LABEL_24;
    }
    if (*((void *)a3 + 2) > *((void *)a2 + 2))
    {
      long long v42 = 0u;
      long long v43 = 0u;
      v26 = [a1 selectionSnapshot];
      v27 = v26;
      if (v26)
      {
        [v26 firstSelectedIndexPath];
      }
      else
      {
        long long v42 = 0u;
        long long v43 = 0u;
      }

      BOOL v28 = (uint64_t)v43 >= *((void *)a2 + 2) && *((void *)&v42 + 1) >= *((void *)a2 + 1);
LABEL_18:
      if ((a4 == 6 || a4 == 3) && *((void *)a3 + 2) < *((void *)a2 + 2))
      {
        long long v42 = 0u;
        long long v43 = 0u;
        v29 = [a1 selectionSnapshot];
        v30 = v29;
        if (v29)
        {
          [v29 lastSelectedIndexPath];
        }
        else
        {
          long long v42 = 0u;
          long long v43 = 0u;
        }

        if ((uint64_t)v43 > *((void *)a2 + 2) || *((uint64_t *)&v42 + 1) > *((void *)a2 + 1)) {
          goto LABEL_32;
        }
        goto LABEL_24;
      }
      if (v28)
      {
LABEL_24:
        long long v31 = a2[1];
        long long v42 = *a2;
        long long v43 = v31;
        [v15 addIndexPath:&v42];
      }
LABEL_32:
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      long long v32 = a3[1];
      long long v37 = *a3;
      v35[2] = __120__PXSectionedSelectionManager_DirectionalSelection___extendSelectionFromIndexPath_toIndexPath_inDirection_withDelegate___block_invoke;
      v35[3] = &unk_1E5DBAA80;
      char v39 = v23;
      id v36 = v15;
      long long v38 = v32;
      id v33 = v15;
      [a1 performChanges:v35];
      long long v34 = a3[1];
      *a6 = *a3;
      a6[1] = v34;

      goto LABEL_33;
    }
LABEL_17:
    BOOL v28 = 1;
    goto LABEL_18;
  }
  long long v13 = a3[1];
  *a6 = *a3;
  a6[1] = v13;
LABEL_33:
}

- (void)startingIndexPathForMoveInDirection:()DirectionalSelection
{
  long long v5 = *((_OWORD *)off_1E5DAB028 + 1);
  *a3 = *(_OWORD *)off_1E5DAB028;
  a3[1] = v5;
  id v6 = [a1 selectionSnapshot];
  id v7 = [v6 selectedIndexPaths];
  if ([v7 count] == 1)
  {
    if (v7)
    {
      [v7 anyItemIndexPath];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *a3 = v11;
    a3[1] = v12;
  }
  uint64_t v8 = *(void *)a3;
  uint64_t v9 = *(void *)off_1E5DAAED8;
  if (*(void *)a3 == *(void *)off_1E5DAAED8)
  {
    if (v6)
    {
      [v6 cursorIndexPath];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *a3 = v11;
    a3[1] = v12;
    uint64_t v8 = *(void *)a3;
  }
  if (v8 == v9)
  {
    if (v6)
    {
      [v6 pendingIndexPath];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *a3 = v11;
    a3[1] = v12;
    uint64_t v8 = *(void *)a3;
  }
  if (v8 == v9 && a2 <= 6)
  {
    if (((1 << a2) & 0x34) != 0)
    {
      if (v6)
      {
        [v6 lastSelectedIndexPath];
        goto LABEL_27;
      }
LABEL_26:
      long long v11 = 0u;
      long long v12 = 0u;
      goto LABEL_27;
    }
    if (((1 << a2) & 0x4A) != 0)
    {
      if (v6)
      {
        [v6 firstSelectedIndexPath];
LABEL_27:
        *a3 = v11;
        a3[1] = v12;
        goto LABEL_28;
      }
      goto LABEL_26;
    }
  }
LABEL_28:
}

@end