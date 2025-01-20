@interface NWCCBundle
+ (NSBundle)bundle;
@end

@implementation NWCCBundle

+ (NSBundle)bundle
{
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)bundle_instance;

  return (NSBundle *)v2;
}

uint64_t __20__NWCCBundle_bundle__block_invoke()
{
  bundle_instance = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

@end