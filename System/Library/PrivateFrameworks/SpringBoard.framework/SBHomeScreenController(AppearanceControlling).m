@interface SBHomeScreenController(AppearanceControlling)
- (void)_setupHomeScreenContentBackdropView;
- (void)_setupHomeScreenDimmingWindow;
@end

@implementation SBHomeScreenController(AppearanceControlling)

- (void)_setupHomeScreenDimmingWindow
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  v3 = [v10 view];
  v4 = [MEMORY[0x1E4F428B8] blackColor];
  [v3 setBackgroundColor:v4];

  v5 = [v10 view];
  [v5 setAlpha:0.0];

  v6 = [SBWindow alloc];
  v7 = [(SBHomeScreenController *)self windowScene];
  v8 = [(SBWindow *)v6 initWithWindowScene:v7 rootViewController:v10 role:@"SBTraitsParticipantRoleHomeScreenDimming" debugName:@"HomeScreenDimming"];
  homeScreenDimmingWindow = self->_homeScreenDimmingWindow;
  self->_homeScreenDimmingWindow = v8;

  [(SBWindow *)self->_homeScreenDimmingWindow setWindowLevel:*MEMORY[0x1E4F43F20] + -2.0 + 1.0];
  [(SBWindow *)self->_homeScreenDimmingWindow bs_setHitTestingDisabled:1];
}

- (void)_setupHomeScreenContentBackdropView
{
  id v7 = [(SBHomeScreenController *)self homeScreenContentView];
  if (UIAccessibilityIsReduceTransparencyEnabled()) {
    v3 = SBHomeScreenBackdropDarkTintView;
  }
  else {
    v3 = SBHomeScreenBackdropView;
  }
  id v4 = [v3 alloc];
  [v7 bounds];
  v5 = (SBHomeScreenBackdropViewBase *)objc_msgSend(v4, "initWithFrame:");
  homeScreenBackdropView = self->_homeScreenBackdropView;
  self->_homeScreenBackdropView = v5;

  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView setAutoresizingMask:18];
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView bs_setHitTestingDisabled:1];
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView setDelegate:self];
  [v7 addSubview:self->_homeScreenBackdropView];
}

@end