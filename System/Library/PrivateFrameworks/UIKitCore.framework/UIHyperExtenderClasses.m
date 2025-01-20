@interface UIHyperExtenderClasses
@end

@implementation UIHyperExtenderClasses

void ___UIHyperExtenderClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)_MergedGlobals_1057;
  _MergedGlobals_1057 = v2;
}

@end