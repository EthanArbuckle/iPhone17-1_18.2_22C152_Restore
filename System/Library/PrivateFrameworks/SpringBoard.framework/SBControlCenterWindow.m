@interface SBControlCenterWindow
+ (id)_traitsArbiterOrientationActuationRole;
- (BOOL)_canBecomeKeyWindow;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBControlCenterWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBControlCenterWindow;
  -[SBControlCenterWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBControlCenterWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return @"SBTraitsParticipantRoleControlCenter";
}

@end