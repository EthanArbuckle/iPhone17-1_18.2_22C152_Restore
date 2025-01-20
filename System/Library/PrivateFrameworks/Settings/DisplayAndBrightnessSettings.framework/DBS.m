@interface DBS
@end

@implementation DBS

uint64_t __DBS_BundleForDisplayAndBrightnessSettingsFramework_block_invoke()
{
  DBS_BundleForDisplayAndBrightnessSettingsFramework__displayAndBrightnessSettingsFrameworkBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

@end