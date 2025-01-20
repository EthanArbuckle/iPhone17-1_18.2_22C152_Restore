@interface PassThroughWindow
+ (BOOL)_isSecure;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)canBecomeKeyWindow;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassThroughWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PassThroughWindow;
  -[PassThroughWindow hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (PassThroughWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end