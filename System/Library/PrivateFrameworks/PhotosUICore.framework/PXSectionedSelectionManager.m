@interface PXSectionedSelectionManager
@end

@implementation PXSectionedSelectionManager

uint64_t __106__PXSectionedSelectionManager_DirectionalSelection___moveSelectionFromIndexPath_inDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

uint64_t __103__PXSectionedSelectionManager_DirectionalSelection___selectInitialItemForMoveInDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

uint64_t __106__PXSectionedSelectionManager_DirectionalSelection___selectInitialSectionForMoveInDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

uint64_t __97__PXSectionedSelectionManager_DirectionalSelection__extendSelectionToItemIndexPath_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *((_OWORD *)off_1E5DAB028 + 1);
  v4[0] = *(_OWORD *)off_1E5DAB028;
  v4[1] = v2;
  return [a2 setCursorIndexPath:v4];
}

void __120__PXSectionedSelectionManager_DirectionalSelection___extendSelectionFromIndexPath_toIndexPath_inDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(unsigned char *)(a1 + 72) == 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setSelectedState:v3 forIndexPathSet:v4];
  long long v6 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v6;
  [v5 setCursorIndexPath:v7];
}

void __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  long long v5 = a2[1];
  long long v11 = *a2;
  long long v12 = v5;
  long long v6 = [v4 assetAtItemIndexPath:&v11];
  uint64_t v7 = [*(id *)(a1 + 40) importStateForAsset:v6];
  if (v7 == 3 || v7 == 0)
  {
    v9 = *(void **)(a1 + 48);
    long long v10 = a2[1];
    long long v11 = *a2;
    long long v12 = v10;
    [v9 addIndexPath:&v11];
  }
}

uint64_t __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

@end