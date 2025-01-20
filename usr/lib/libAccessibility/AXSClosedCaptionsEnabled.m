@interface AXSClosedCaptionsEnabled
@end

@implementation AXSClosedCaptionsEnabled

void ___AXSClosedCaptionsEnabled_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 1;
  if (_AXSVideosPreferenceDomain_onceToken != -1) {
    dispatch_once(&_AXSVideosPreferenceDomain_onceToken, &__block_literal_global_1726);
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MovieClosedCaptioningEnabledSetting", (CFStringRef)_AXSVideosPreferenceDomain_Domain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v1 = AppBooleanValue;
    if (_AXSVideosPreferenceDomain_onceToken != -1) {
      dispatch_once(&_AXSVideosPreferenceDomain_onceToken, &__block_literal_global_1726);
    }
    CFPreferencesSetAppValue(@"MovieClosedCaptioningEnabledSetting", 0, (CFStringRef)_AXSVideosPreferenceDomain_Domain);
    _AXSClosedCaptionsSetEnabled(v1);
  }
}

@end