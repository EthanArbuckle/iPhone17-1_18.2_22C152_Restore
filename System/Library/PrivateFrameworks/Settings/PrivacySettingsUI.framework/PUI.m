@interface PUI
@end

@implementation PUI

uint64_t __PUI_BundleForPrivacySettingsFramework_block_invoke()
{
  PUI_BundleForPrivacySettingsFramework__privacySettingsFrameworkBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

@end