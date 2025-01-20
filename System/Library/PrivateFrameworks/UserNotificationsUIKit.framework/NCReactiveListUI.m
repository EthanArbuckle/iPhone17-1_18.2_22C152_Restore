@interface NCReactiveListUI
@end

@implementation NCReactiveListUI

void ___NCReactiveListUI_block_invoke()
{
  _NCReactiveListUI___reactiveUI = _os_feature_enabled_impl();
  if (_NCDeviceIsRunningInternalBuild_onceToken != -1) {
    dispatch_once(&_NCDeviceIsRunningInternalBuild_onceToken, &__block_literal_global_75);
  }
  if (_NCDeviceIsRunningInternalBuild___internalBuild)
  {
    v0 = +[NCUserNotificationsUIKitDefaults standardDefaults];
    char v1 = [v0 shouldUseReactiveList];

    if ((v1 & 1) == 0) {
      _NCReactiveListUI___reactiveUI = 0;
    }
  }
}

@end