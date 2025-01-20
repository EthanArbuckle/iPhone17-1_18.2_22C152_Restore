@interface AXSShouldLoadInvertBundles
@end

@implementation AXSShouldLoadInvertBundles

void ___AXSShouldLoadInvertBundles_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert())
  {
    if (_AXSProcessIsSpringBoard_onceToken != -1) {
      dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_2526);
    }
    if ((_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard & 1) == 0)
    {
      v0 = (void *)CFPreferencesCopyValue(@"AXSSystemUIProcessAppSmartInvertEnabledPreference", (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        _kAXSystemUIProcessShouldLoadInvertBundles = [v0 BOOLValue];
      }
      v1 = AXLogInvertColorsLoadBundles();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        v2 = [NSNumber numberWithBool:_kAXSystemUIProcessShouldLoadInvertBundles];
        int v3 = 138412290;
        v4 = v2;
        _os_log_impl(&dword_190274000, v1, OS_LOG_TYPE_DEFAULT, "SystemUIProcessShouldLoadInvertBundles: %@", (uint8_t *)&v3, 0xCu);
      }
    }
  }
}

@end