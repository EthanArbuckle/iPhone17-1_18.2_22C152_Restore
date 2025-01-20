@interface TVStorePlaybackLaunchShroudWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_wantsFocusEngine;
@end

@implementation TVStorePlaybackLaunchShroudWindow

- (BOOL)_wantsFocusEngine
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end