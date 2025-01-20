@interface SHS
@end

@implementation SHS

uint64_t __SHS_BundleForSoundsAndHapticsSettingsFramework_block_invoke()
{
  SHS_BundleForSoundsAndHapticsSettingsFramework__soundsAndHapticsSettingsFrameworkBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

@end