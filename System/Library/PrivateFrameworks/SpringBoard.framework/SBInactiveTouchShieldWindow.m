@interface SBInactiveTouchShieldWindow
+ (BOOL)_isSecure;
- (BOOL)_appearsInLoupe;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_shouldPrepareScreenForWindow;
- (BOOL)_usesWindowServerHitTesting;
- (SBInactiveTouchShieldWindow)initWithDisplay:(id)a3;
@end

@implementation SBInactiveTouchShieldWindow

- (SBInactiveTouchShieldWindow)initWithDisplay:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBInactiveTouchShieldWindow;
  v3 = [(_UIRootWindow *)&v7 initWithDisplay:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(SBInactiveTouchShieldWindow *)v3 layer];
    [v5 setHitTestsAsOpaque:1];
  }
  return v4;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end