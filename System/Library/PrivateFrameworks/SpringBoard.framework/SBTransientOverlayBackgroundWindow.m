@interface SBTransientOverlayBackgroundWindow
- (BOOL)_canBecomeKeyWindow;
@end

@implementation SBTransientOverlayBackgroundWindow

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end