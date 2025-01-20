@interface NSBundle
@end

@implementation NSBundle

void __35__NSBundle_PhotosUICore__px_bundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = (void *)px_bundle_frameworkBundle;
  px_bundle_frameworkBundle = v0;
}

@end