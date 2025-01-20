@interface SBBannerWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)becomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)resignFirstResponder;
- (SBBannerWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHidden:(BOOL)a3;
@end

@implementation SBBannerWindow

- (SBBannerWindow)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBBannerWindow;
  v5 = [(SBBannerWindow *)&v10 initWithWindowScene:v4];
  v6 = v5;
  if (v5)
  {
    [(SBBannerWindow *)v5 _setRoleHint:@"SBTraitsParticipantRoleBanner"];
    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBBannerWindow *)v6 setBackgroundColor:v7];

    [(SBBannerWindow *)v6 setOpaque:0];
    id v8 = (id)[MEMORY[0x1E4F42F08] sharedTextEffectsWindowForWindowScene:v4];
    [(SBBannerWindow *)v6 setHidden:1];
  }

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBBannerWindow;
  -[SBBannerWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBBannerWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || ([(SBBannerWindow *)self rootViewController],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 view],
        v7 = (SBBannerWindow *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {

    v5 = 0;
  }
  return v5;
}

- (BOOL)_canBecomeKeyWindow
{
  v2 = [(SBBannerWindow *)self rootViewController];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(SBBannerWindow *)self rootViewController];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(SBBannerWindow *)self rootViewController];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(SBBannerWindow *)self rootViewController];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBBannerWindow *)self rootViewController];
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", v3 ^ 1, 0);
  v6.receiver = self;
  v6.super_class = (Class)SBBannerWindow;
  [(SBFWindow *)&v6 setHidden:v3];
  objc_msgSend(v5, "bs_endAppearanceTransition");
}

@end