@interface PSCluster
@end

@implementation PSCluster

uint64_t __24___PSCluster_sortArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) compareByAnglePoint:a2 andPoint:a3 withRef:*(void *)(a1 + 40)];
}

@end