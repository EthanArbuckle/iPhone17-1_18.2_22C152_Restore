@interface SBFluidSwitcherModifierTimelineController
+ (BOOL)_isNoisyEvent:(id)a3;
- (BOOL)isVisible;
- (BOOL)wantsEvent:(id)a3;
- (SBFluidSwitcherModifierTimelineController)initWithDelegate:(id)a3;
- (SBFluidSwitcherModifierTimelineControllerDelegate)delegate;
- (double)_windowLevel;
- (id)_windowScene;
- (void)addEntry:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBFluidSwitcherModifierTimelineController

+ (BOOL)_isNoisyEvent:(id)a3
{
  uint64_t v3 = _isNoisyEvent__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isNoisyEvent__onceToken, &__block_literal_global_327);
  }
  v5 = (void *)_isNoisyEvent__noisyEventTypeNums;
  v6 = NSNumber;
  uint64_t v7 = [v4 type];

  v8 = [v6 numberWithInteger:v7];
  LOBYTE(v5) = [v5 containsObject:v8];

  return (char)v5;
}

void __59__SBFluidSwitcherModifierTimelineController__isNoisyEvent___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F33484F8];
  v1 = (void *)_isNoisyEvent__noisyEventTypeNums;
  _isNoisyEvent__noisyEventTypeNums = v0;
}

- (SBFluidSwitcherModifierTimelineController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherModifierTimelineController;
  v5 = [(SBFluidSwitcherModifierTimelineController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
  window = self->_window;
  if (a3)
  {
    if (!window)
    {
      v5 = [[SBFluidSwitcherModifierTimelineViewController alloc] initWithNibName:0 bundle:0];
      rootViewController = self->_rootViewController;
      self->_rootViewController = v5;

      id v7 = objc_alloc(MEMORY[0x1E4FA6030]);
      objc_super v8 = [(SBFluidSwitcherModifierTimelineController *)self _windowScene];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = (UIWindow *)[v7 initWithWindowScene:v8 role:@"SBTraitsParticipantRoleModifierTimeline" debugName:v10];
      v12 = self->_window;
      self->_window = v11;

      [(UIWindow *)self->_window setRootViewController:self->_rootViewController];
      v13 = self->_window;
      [(SBFluidSwitcherModifierTimelineController *)self _windowLevel];
      -[UIWindow setWindowLevel:](v13, "setWindowLevel:");
      [(UIWindow *)self->_window setHidden:0];
      [(UIWindow *)self->_window makeKeyAndVisible];
      v14 = self->_rootViewController;
      [(SBFluidSwitcherModifierTimelineViewController *)v14 bs_endAppearanceTransition:1];
    }
  }
  else if (window)
  {
    [(SBFluidSwitcherModifierTimelineViewController *)self->_rootViewController bs_endAppearanceTransition:0];
    [(UIWindow *)self->_window setHidden:1];
    v15 = self->_window;
    self->_window = 0;

    v16 = self->_rootViewController;
    self->_rootViewController = 0;
  }
}

- (BOOL)wantsEvent:(id)a3
{
  id v4 = a3;
  if ([(SBFluidSwitcherModifierTimelineViewController *)self->_rootViewController ignoreNoisyEvents])
  {
    int v5 = [(id)objc_opt_class() _isNoisyEvent:v4] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)addEntry:(id)a3
{
}

- (id)_windowScene
{
  uint64_t v3 = [(SBFluidSwitcherModifierTimelineController *)self delegate];
  id v4 = [v3 windowSceneForModifierTimelineController:self];

  return v4;
}

- (double)_windowLevel
{
  uint64_t v3 = [(SBFluidSwitcherModifierTimelineController *)self delegate];
  [v3 windowLevelForModifierTimelineController:self];
  double v5 = v4;

  return v5;
}

- (SBFluidSwitcherModifierTimelineControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherModifierTimelineControllerDelegate *)WeakRetained;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end