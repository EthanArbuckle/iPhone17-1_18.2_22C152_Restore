@interface UICollectionLayoutSectionFixedSolver
@end

@implementation UICollectionLayoutSectionFixedSolver

double __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_3(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  return _UISetPointValueForAxis(*(void *)(a1 + 40), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v2);
}

double __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 32) * (double)a2 + 0.0;
}

uint64_t __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 0.0) {
    return (uint64_t)(a2 / *(double *)(a1 + 32));
  }
  else {
    return 0;
  }
}

@end