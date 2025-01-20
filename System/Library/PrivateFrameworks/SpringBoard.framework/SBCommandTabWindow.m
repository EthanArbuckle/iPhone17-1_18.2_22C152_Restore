@interface SBCommandTabWindow
- (BOOL)_canBecomeKeyWindow;
@end

@implementation SBCommandTabWindow

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

@end