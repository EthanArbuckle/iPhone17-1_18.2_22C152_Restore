@interface PXSelectionSnapshot
@end

@implementation PXSelectionSnapshot

void __88__PXSelectionSnapshot_CMMAdditions__areAllUnsavedAssetsSelectedWithImportStatusManager___block_invoke(uint64_t a1, long long *a2, unsigned char *a3)
{
  v6 = *(void **)(a1 + 32);
  long long v7 = a2[1];
  long long v13 = *a2;
  long long v14 = v7;
  v8 = [v6 assetAtItemIndexPath:&v13];
  uint64_t v9 = [*(id *)(a1 + 40) importStateForAsset:v8];
  if (v9 == 3 || v9 == 0)
  {
    v11 = *(void **)(a1 + 48);
    long long v12 = a2[1];
    long long v13 = *a2;
    long long v14 = v12;
    if (([v11 containsIndexPath:&v13] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

@end