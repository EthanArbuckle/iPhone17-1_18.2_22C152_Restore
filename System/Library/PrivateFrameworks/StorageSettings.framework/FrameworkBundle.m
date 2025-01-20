@interface FrameworkBundle
@end

@implementation FrameworkBundle

uint64_t ___FrameworkBundle_block_invoke()
{
  _FrameworkBundle_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.StorageSettingsFramework"];

  return MEMORY[0x270F9A758]();
}

@end