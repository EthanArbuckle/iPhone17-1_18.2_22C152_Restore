@interface _TVLoadingOverlayWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_wantsFocusEngine;
@end

@implementation _TVLoadingOverlayWindow

- (BOOL)_wantsFocusEngine
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end