@interface PXArrayChangeDetails
@end

@implementation PXArrayChangeDetails

uint64_t __77__PXArrayChangeDetails_PXGDecoratingLayout__changeDetailsShiftedBy_scaledBy___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", (*(void *)(a1 + 48) + a2) * *(void *)(a1 + 40), *(void *)(a1 + 40) * a3);
}

id __77__PXArrayChangeDetails_PXGDecoratingLayout__changeDetailsShiftedBy_scaledBy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    [*(id *)(a1 + 32) removeAllIndexes];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__PXArrayChangeDetails_PXGDecoratingLayout__changeDetailsShiftedBy_scaledBy___block_invoke_2;
    v6[3] = &unk_1E5DC55B0;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v3 enumerateRangesUsingBlock:v6];
    v4 = (void *)[*(id *)(a1 + 32) copy];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __94__PXArrayChangeDetails_PhotoKit__changeDetailsFromFetchResultChangeDetails_originatingChange___block_invoke(id *a1, uint64_t a2)
{
  v4 = [a1[4] objectIDAtIndex:a2];
  if (v4)
  {
    v6 = v4;
    int v5 = [a1[5] contentOrThumbnailChangedForPHAssetOID:v4];
    v4 = v6;
    if (v5)
    {
      [a1[6] addIndex:a2];
      v4 = v6;
    }
  }
}

@end