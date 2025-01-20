@interface UIDataSourceUpdateMap
@end

@implementation UIDataSourceUpdateMap

uint64_t __67___UIDataSourceUpdateMap_updateMapByRevertingUpdateWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = *(void **)(a2 + 88);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __51___UIDataSourceUpdateMap__oldSectionMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finalSectionIndexForInitialSectionIndex:a2];
}

uint64_t __51___UIDataSourceUpdateMap__newSectionMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) initialSectionIndexForFinalSectionIndex:a2];
}

uint64_t __54___UIDataSourceUpdateMap__oldGlobalItemMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) finalSnapshot];
  uint64_t v5 = *(void **)(a1 + 32);
  v6 = [v5 initialSnapshot];
  v7 = [v6 indexPathForGlobalIndex:a2];
  v8 = [v5 finalIndexPathForInitialIndexPath:v7];
  uint64_t v9 = [v4 globalIndexForIndexPath:v8];

  return v9;
}

uint64_t __54___UIDataSourceUpdateMap__newGlobalItemMapDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) initialSnapshot];
  uint64_t v5 = *(void **)(a1 + 32);
  v6 = [v5 finalSnapshot];
  v7 = [v6 indexPathForGlobalIndex:a2];
  v8 = [v5 initialIndexPathForFinalIndexPath:v7];
  uint64_t v9 = [v4 globalIndexForIndexPath:v8];

  return v9;
}

void __51___UIDataSourceUpdateMap__findUpdateForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v11 = v7;
  if (v7) {
    v8 = (void *)*((void *)v7 + 11);
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  int v10 = [v9 isEqual:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __45___UIDataSourceUpdateMap_submapBeforeUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = *(void **)(a2 + 88);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v5 = (void *)v5[11];
  }
  v6 = v5;
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

uint64_t __44___UIDataSourceUpdateMap_submapAfterUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = *(void **)(a2 + 88);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v5 = (void *)v5[11];
  }
  v6 = v5;
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

@end