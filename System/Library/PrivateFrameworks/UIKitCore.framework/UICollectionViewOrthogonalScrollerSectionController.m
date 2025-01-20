@interface UICollectionViewOrthogonalScrollerSectionController
@end

@implementation UICollectionViewOrthogonalScrollerSectionController

void __88___UICollectionViewOrthogonalScrollerSectionController_reconfigureScrollViewsForUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v14 integerValue];
  if (v6) {
    uint64_t v7 = [v6 finalSectionIndexForInitialSectionIndex:v7];
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || ![*(id *)(a1 + 40) containsIndex:v7])
  {
    v10 = *(void **)(*(void *)(a1 + 56) + 32);
    if (v10)
    {
      [v10 addObject:v5];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
      uint64_t v12 = *(void *)(a1 + 56);
      v13 = *(void **)(v12 + 32);
      *(void *)(v12 + 32) = v11;
    }
  }
  else
  {
    if (v5) {
      v5[260] = v7;
    }
    v8 = *(void **)(a1 + 48);
    v9 = [NSNumber numberWithInteger:v7];
    [v8 setObject:v5 forKeyedSubscript:v9];
  }
}

@end