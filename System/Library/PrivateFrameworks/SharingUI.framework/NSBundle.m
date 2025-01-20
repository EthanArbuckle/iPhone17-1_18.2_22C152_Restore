@interface NSBundle
@end

@implementation NSBundle

void __34__NSBundle_SharingUI__sfui_bundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = (void *)sfui_bundle_frameworkBundle;
  sfui_bundle_frameworkBundle = v0;
}

@end