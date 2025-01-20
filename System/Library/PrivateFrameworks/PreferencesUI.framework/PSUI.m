@interface PSUI
@end

@implementation PSUI

uint64_t __PSUI_BundleForPreferencesUIFramework_block_invoke()
{
  PSUI_BundleForPreferencesUIFramework__preferencesUIFrameworkBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

@end