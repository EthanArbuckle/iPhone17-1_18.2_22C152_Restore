@interface PHFetchResult
@end

@implementation PHFetchResult

void __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_2_204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a2 + a3;
  v7 = *(void **)(a1 + 32);
  v8 = [NSNumber numberWithInteger:a2 - 1];
  id v13 = [v7 objectForKeyedSubscript:v8];

  v9 = *(void **)(a1 + 32);
  v10 = [NSNumber numberWithInteger:v6];
  v11 = [v9 objectForKeyedSubscript:v10];

  if (v13) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && (*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))()) {
    objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", a2, a3);
  }
}

void __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_201(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  uint64_t v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v7 = *(void **)(a1 + 32);
  v8 = [NSNumber numberWithUnsignedInteger:a2];
  [v7 setObject:v6 forKeyedSubscript:v8];

  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

uint64_t __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 creationDate];
}

unint64_t __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = a2 + (a3 >> 1);
  }
  [*(id *)(a1 + 32) addIndex:v7];
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= 0x3E8) {
    *a4 = 1;
  }
  return result;
}

void __81__PHFetchResult_PhotosUICore__px_subfetchResultWithObjectsAtIndexes_objectClass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsIndex:a3]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __64__PHFetchResult_PhotosUICore__px_fetchedObjectIDsSortedByUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __75__PHFetchResult_PhotosUICore__px_fetchedObjectIDsSortedByLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addedDate];
}

uint64_t __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_isBetweenDate:andDate:", a2, a3) ^ 1;
}

uint64_t __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 timeIntervalSinceDate:a1[4]];
  double v7 = fabs(v6);
  if (v7 < *(double *)(*(void *)(a1[5] + 8) + 24))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *(double *)(*(void *)(a1[5] + 8) + 24) = v7;
  }
  return result;
}

@end