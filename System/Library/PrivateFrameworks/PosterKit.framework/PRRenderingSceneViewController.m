@interface PRRenderingSceneViewController
+ (id)role;
- (BOOL)showDebugGear;
- (PRRenderingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 previewing:(BOOL)a5;
- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4;
- (void)doThing;
- (void)environmentViewController:(id)a3 didUpdateEnvironment:(id)a4;
- (void)setShowDebugGear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PRRenderingSceneViewController

- (PRRenderingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 previewing:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PRRenderingSceneViewController;
  result = [(PRSceneViewController *)&v6 _initWithProvider:a3 contents:a4 previewing:a5];
  if (result) {
    result->_showDebugGear = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)PRRenderingSceneViewController;
  [(PRSceneViewController *)&v37 viewDidLoad];
  v3 = [MEMORY[0x1E4F629C0] settings];
  settings = self->_settings;
  self->_settings = v3;

  [(FBSMutableSceneSettings *)self->_settings pui_setMode:1];
  v5 = self->_settings;
  objc_super v6 = (void *)MEMORY[0x1E4F4F6E0];
  uint32_t v7 = arc4random_uniform(0x64u);
  uint32_t v8 = arc4random_uniform(0x64u);
  v9 = [v6 colorWithRed:(double)v7 / 100.0 green:(double)v8 / 100.0 blue:(double)arc4random_uniform(0x64u) / 100.0 alpha:1.0];
  [(FBSMutableSceneSettings *)v5 pr_setCaseColor:v9];

  v10 = [(PRRenderingSceneViewController *)self view];
  v32 = [v10 traitCollection];

  v11 = [[PRPosterEnvironmentImpl alloc] initWithSceneSettings:self->_settings traitCollection:v32 targetConfig:0 extensionBundleURL:0];
  environment = self->_environment;
  self->_environment = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v39 = *MEMORY[0x1E4FB06F8];
  v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:52.0];
  v40[0] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v31 = (void *)[v13 initWithString:@"⚙️" attributes:v15];

  v33 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
  [v33 setAttributedTitle:v31];
  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E4FB13F0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __45__PRRenderingSceneViewController_viewDidLoad__block_invoke;
  v34[3] = &unk_1E54DADA8;
  objc_copyWeak(&v35, &location);
  v29 = [v16 actionWithHandler:v34];
  objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v33);
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v17;

  [(UIButton *)self->_button sizeToFit];
  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_button setHidden:!self->_showDebugGear];
  v19 = [(PRRenderingSceneViewController *)self view];
  [v19 addSubview:self->_button];
  v20 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(UIButton *)self->_button centerXAnchor];
  v21 = [v19 safeAreaLayoutGuide];
  v22 = [v21 centerXAnchor];
  v23 = [v30 constraintEqualToAnchor:v22];
  v38[0] = v23;
  v24 = [(UIButton *)self->_button bottomAnchor];
  v25 = [v19 safeAreaLayoutGuide];
  v26 = [v25 bottomAnchor];
  v27 = [v24 constraintLessThanOrEqualToAnchor:v26];
  v38[1] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v20 activateConstraints:v28];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __45__PRRenderingSceneViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained doThing];
}

- (void)setShowDebugGear:(BOOL)a3
{
  if (self->_showDebugGear != a3)
  {
    self->_showDebugGear = a3;
    [(UIButton *)self->_button setHidden:!a3];
  }
}

- (void)doThing
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [[PRRenderingEnvironmentViewController alloc] initWithEnvironment:self->_environment delegate:self];
  v4 = [(PRRenderingEnvironmentViewController *)v3 sheetPresentationController];
  [v4 setSourceView:self->_button];

  v5 = [(PRRenderingEnvironmentViewController *)v3 sheetPresentationController];
  [(UIButton *)self->_button bounds];
  objc_msgSend(v5, "setSourceRect:");

  objc_super v6 = [(PRRenderingEnvironmentViewController *)v3 sheetPresentationController];
  [v6 setPrefersEdgeAttachedInCompactHeight:1];

  uint32_t v7 = [(PRRenderingEnvironmentViewController *)v3 sheetPresentationController];
  uint32_t v8 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:@"EnvironmentDetent" resolver:&__block_literal_global_36];
  v10[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v7 setDetents:v9];

  [(PRRenderingSceneViewController *)self presentViewController:v3 animated:1 completion:0];
}

double __41__PRRenderingSceneViewController_doThing__block_invoke(uint64_t a1, void *a2)
{
  [a2 maximumDetentValue];
  return v2 * 0.3;
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PRRenderingSceneViewController;
  [(PRRenderingSceneViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(PRRenderingSceneViewController *)self view];
  [v3 bringSubviewToFront:self->_button];
}

+ (id)role
{
  return (id)*MEMORY[0x1E4F92840];
}

- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PRRenderingSceneViewController;
  id v6 = a3;
  [(PRSceneViewController *)&v7 _updateSceneSettings:v6 transitionContext:a4];
  -[PRPosterEnvironmentImpl _applyToSceneSettings:](self->_environment, "_applyToSceneSettings:", v6, v7.receiver, v7.super_class);
}

- (void)environmentViewController:(id)a3 didUpdateEnvironment:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_environment, a4);
  scene = self->super._scene;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PRRenderingSceneViewController_environmentViewController_didUpdateEnvironment___block_invoke;
  v9[3] = &unk_1E54DBD10;
  id v10 = v6;
  id v8 = v6;
  [(FBScene *)scene updateSettingsWithBlock:v9];
}

uint64_t __81__PRRenderingSceneViewController_environmentViewController_didUpdateEnvironment___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyToSceneSettings:a2];
}

- (BOOL)showDebugGear
{
  return self->_showDebugGear;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end