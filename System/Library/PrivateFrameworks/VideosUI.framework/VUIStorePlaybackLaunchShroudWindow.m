@interface VUIStorePlaybackLaunchShroudWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_wantsFocusEngine;
@end

@implementation VUIStorePlaybackLaunchShroudWindow

- (BOOL)_wantsFocusEngine
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end