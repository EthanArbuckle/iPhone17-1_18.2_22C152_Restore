@interface UIHyperAnimatorClasses
@end

@implementation UIHyperAnimatorClasses

void ___UIHyperAnimatorClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)_MergedGlobals_938;
  _MergedGlobals_938 = v3;
}

@end