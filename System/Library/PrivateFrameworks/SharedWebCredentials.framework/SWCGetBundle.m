@interface SWCGetBundle
@end

@implementation SWCGetBundle

void ___SWCGetBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v0;
}

@end