@interface _UICollectionLayoutSectionSolver
+ (id)solverWithLayoutSection:(uint64_t)a3 layoutAxis:;
@end

@implementation _UICollectionLayoutSectionSolver

+ (id)solverWithLayoutSection:(uint64_t)a3 layoutAxis:
{
  self;
  if ([a2 _isListSolverCompatibleForLayoutAxis:a3])
  {
    v5 = -[_UICollectionLayoutSectionListSolver initWithLayoutSection:]([_UICollectionLayoutSectionListSolver alloc], a2);
  }
  else if ([a2 _containsEstimatedSizeElement])
  {
    v5 = -[_UICollectionLayoutSectionEstimatedSolver initWithLayoutSection:]([_UICollectionLayoutSectionEstimatedSolver alloc], a2);
  }
  else
  {
    v5 = -[_UICollectionLayoutSectionFixedSolver initWithLayoutSection:]((id *)[_UICollectionLayoutSectionFixedSolver alloc], a2);
  }
  return v5;
}

@end