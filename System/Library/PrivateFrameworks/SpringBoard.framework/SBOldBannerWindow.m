@interface SBOldBannerWindow
+ (BOOL)layoutContentViewControllerWithConstraints;
+ (id)_traitsArbiterOrientationActuationRole;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)becomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)resignFirstResponder;
- (SBOldBannerWindow)initWithWindowScene:(id)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SBOldBannerWindow

- (SBOldBannerWindow)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBOldBannerWindow;
  v5 = [(SBMainScreenActiveInterfaceOrientationWindow *)&v9 initWithWindowScene:v4 role:@"SBTraitsParticipantRoleBanner" debugName:@"bannerPresentationWindow"];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBOldBannerWindow *)v5 setBackgroundColor:v6];

    [(SBOldBannerWindow *)v5 setOpaque:0];
    [(SBMainScreenActiveInterfaceOrientationWindow *)v5 setPassesTouchesThrough:1];
    id v7 = (id)[MEMORY[0x1E4F42F08] sharedTextEffectsWindowForWindowScene:v4];
    [(SBOldBannerWindow *)v5 setHidden:1];
  }

  return v5;
}

- (BOOL)_canBecomeKeyWindow
{
  v2 = [(SBMainScreenActiveInterfaceOrientationWindow *)self contentViewController];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(SBMainScreenActiveInterfaceOrientationWindow *)self contentViewController];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(SBMainScreenActiveInterfaceOrientationWindow *)self contentViewController];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(SBMainScreenActiveInterfaceOrientationWindow *)self contentViewController];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBMainScreenActiveInterfaceOrientationWindow *)self rootViewController];
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", v3 ^ 1, 0);
  v6.receiver = self;
  v6.super_class = (Class)SBOldBannerWindow;
  [(SBMainScreenActiveInterfaceOrientationWindow *)&v6 setHidden:v3];
  objc_msgSend(v5, "bs_endAppearanceTransition");
}

+ (BOOL)layoutContentViewControllerWithConstraints
{
  return 0;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return @"SBTraitsParticipantRoleBanner";
}

@end