@interface WBSUIFeatureAvailability
+ (BOOL)isLockdownModeEnabledForSafari;
@end

@implementation WBSUIFeatureAvailability

+ (BOOL)isLockdownModeEnabledForSafari
{
  if (isLockdownModeEnabledForSafari_onceToken != -1) {
    dispatch_once(&isLockdownModeEnabledForSafari_onceToken, &__block_literal_global_57);
  }
  v2 = [(id)isLockdownModeEnabledForSafari_configuration defaultWebpagePreferences];
  char v3 = [v2 _captivePortalModeEnabled];

  return v3;
}

void __58__WBSUIFeatureAvailability_isLockdownModeEnabledForSafari__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  v1 = (void *)isLockdownModeEnabledForSafari_configuration;
  isLockdownModeEnabledForSafari_configuration = (uint64_t)v0;
}

@end