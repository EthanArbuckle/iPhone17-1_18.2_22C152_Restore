@interface UICollectionLayoutItemSolverState
@end

@implementation UICollectionLayoutItemSolverState

void *__63___UICollectionLayoutItemSolverState__generateGeometricIndexer__block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  if (a2)
  {
    CGFloat v3 = a2[8];
    CGFloat v4 = a2[9];
    CGFloat v5 = a2[10];
    CGFloat v6 = a2[11];
  }
  else
  {
    CGFloat v4 = 0.0;
    CGFloat v5 = 0.0;
    CGFloat v6 = 0.0;
    CGFloat v3 = 0.0;
  }
  return -[_UIRTree insertFrame:forIndex:](*(void **)(a1 + 32), a3, v3, v4, v5, v6);
}

@end