@interface UICollectionLayoutSolveParameters
@end

@implementation UICollectionLayoutSolveParameters

void __65___UICollectionLayoutSolveParameters_invalidatedAuxillaryOffsets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    if (![a2 length])
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_setIndexes_forElementKind_, v3, @"_UICollectionLayoutHelpers.m", 1674, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:a3];
    [*(id *)(v3 + 8) setObject:v7 forKeyedSubscript:a2];
  }
}

@end