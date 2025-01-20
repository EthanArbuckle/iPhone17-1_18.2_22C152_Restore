@interface _VUILoadingOverlayWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_wantsFocusEngine;
@end

@implementation _VUILoadingOverlayWindow

- (BOOL)_wantsFocusEngine
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end