@interface SBCoverSheetWindow
+ (BOOL)sb_autorotates;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBCoverSheetWindow

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") ^ 1;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetWindow;
  -[SBCoverSheetWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBCoverSheetWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (BOOL)resignFirstResponder
{
  v3 = [(SBCoverSheetWindow *)self rootViewController];
  v4 = [v3 presentedViewController];

  if (objc_opt_respondsToSelector())
  {
    [v4 preserveInputViews];
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCoverSheetWindow;
    BOOL v5 = [(SBCoverSheetWindow *)&v7 resignFirstResponder];
  }

  return v5;
}

- (BOOL)becomeFirstResponder
{
  v3 = [(SBCoverSheetWindow *)self rootViewController];
  v4 = [v3 presentedViewController];

  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v5 = [v4 restoreInputViews];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCoverSheetWindow;
    unsigned __int8 v5 = [(SBCoverSheetWindow *)&v8 becomeFirstResponder];
  }
  BOOL v6 = v5;

  return v6;
}

@end