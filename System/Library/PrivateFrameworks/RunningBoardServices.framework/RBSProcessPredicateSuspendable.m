@interface RBSProcessPredicateSuspendable
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessPredicateSuspendable

- (BOOL)matchesProcess:(id)a3
{
  return [a3 isLifecycleManaged];
}

@end