@interface PrivateBrowsingObfuscationViewController
- (SFCapsuleNavigationBarTheme)theme;
- (UIToolbar)bottomBar;
- (UIVisualEffectView)URLButtonBackground;
- (UIVisualEffectView)capsuleBackground;
- (UIVisualEffectView)topBarBackground;
- (void)_updateTheme;
- (void)setBottomBar:(id)a3;
- (void)setCapsuleBackground:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTopBarBackground:(id)a3;
- (void)setURLButtonBackground:(id)a3;
- (void)viewDidLoad;
@end

@implementation PrivateBrowsingObfuscationViewController

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PrivateBrowsingObfuscationViewController;
  [(PrivateBrowsingObfuscationViewController *)&v9 viewDidLoad];
  v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
  bottomBarBackground = self->_bottomBarBackground;
  self->_bottomBarBackground = v3;

  v5 = self->_bottomBarBackground;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBar);
  [WeakRetained _setBackgroundView:v5];

  [(PrivateBrowsingObfuscationViewController *)self _updateTheme];
  v10[0] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = (id)[(PrivateBrowsingObfuscationViewController *)self registerForTraitChanges:v7 withTarget:self action:sel__updateTheme];
}

- (void)_updateTheme
{
  v3 = [(PrivateBrowsingObfuscationViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = [MEMORY[0x1E4F78228] themeWithBarTintStyle:v5];
  [(PrivateBrowsingObfuscationViewController *)self setTheme:v6];
}

- (void)setTheme:(id)a3
{
  p_theme = (id *)&self->_theme;
  id v8 = a3;
  if ((objc_msgSend(*p_theme, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    id v6 = *p_theme;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleBackground);
    [v6 applyBackdropEffectsToView:WeakRetained];
  }
}

- (UIVisualEffectView)URLButtonBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLButtonBackground);
  return (UIVisualEffectView *)WeakRetained;
}

- (void)setURLButtonBackground:(id)a3
{
}

- (UIVisualEffectView)topBarBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topBarBackground);
  return (UIVisualEffectView *)WeakRetained;
}

- (void)setTopBarBackground:(id)a3
{
}

- (UIToolbar)bottomBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBar);
  return (UIToolbar *)WeakRetained;
}

- (void)setBottomBar:(id)a3
{
}

- (UIVisualEffectView)capsuleBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleBackground);
  return (UIVisualEffectView *)WeakRetained;
}

- (void)setCapsuleBackground:(id)a3
{
}

- (SFCapsuleNavigationBarTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_destroyWeak((id *)&self->_capsuleBackground);
  objc_destroyWeak((id *)&self->_bottomBar);
  objc_destroyWeak((id *)&self->_topBarBackground);
  objc_destroyWeak((id *)&self->_URLButtonBackground);
  objc_storeStrong((id *)&self->_bottomBarBackground, 0);
}

@end