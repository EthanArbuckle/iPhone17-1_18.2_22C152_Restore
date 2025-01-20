@interface UIViewSortedConstraintsForDebugging
@end

@implementation UIViewSortedConstraintsForDebugging

uint64_t ___UIViewSortedConstraintsForDebugging_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

NSString *___UIViewSortedConstraintsForDebugging_block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end