@interface MKBundle
+ (id)bundle;
@end

@implementation MKBundle

+ (id)bundle
{
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)bundle_bundle;
  return v2;
}

uint64_t __18__MKBundle_bundle__block_invoke()
{
  bundle_bundle = [objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/PrivateFrameworks/MigrationKit.framework/MigrationKit.bundle"];
  return MEMORY[0x270F9A758]();
}

@end