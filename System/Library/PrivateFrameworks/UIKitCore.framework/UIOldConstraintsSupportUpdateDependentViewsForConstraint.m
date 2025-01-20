@interface UIOldConstraintsSupportUpdateDependentViewsForConstraint
@end

@implementation UIOldConstraintsSupportUpdateDependentViewsForConstraint

uint64_t ___UIOldConstraintsSupportUpdateDependentViewsForConstraint_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [a2 _didAddDependentConstraint:v2];
  }
  else {
    return [a2 _didRemoveDependentConstraint:v2];
  }
}

@end