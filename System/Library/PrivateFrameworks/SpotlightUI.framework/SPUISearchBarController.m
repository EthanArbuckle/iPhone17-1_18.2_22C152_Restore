@interface SPUISearchBarController
+ (id)notificationCenterSearchBar;
+ (id)todayViewSearchBar;
- (BOOL)roundedCornerVisible;
- (BOOL)setSceneFrameOnRotation;
- (CGSize)initialFittingSize;
- (NSLayoutConstraint)heightAnchor;
- (SPUISearchBarDelegate)delegate;
- (id)backgroundBlurView;
- (id)sceneSpecification;
- (void)didInvalidateSceneWhenForeground;
- (void)loadView;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setHeightAnchor:(id)a3;
- (void)updateSceneSettingsWithBlock:(id)a3;
@end

@implementation SPUISearchBarController

+ (id)todayViewSearchBar
{
  v2 = [(SPUISpotlightRemoteViewController *)[SPUISearchBarController alloc] initWithSceneIdentifier:@"searchBar-todayView"];
  return v2;
}

+ (id)notificationCenterSearchBar
{
  v2 = [(SPUISpotlightRemoteViewController *)[SPUISearchBarController alloc] initWithSceneIdentifier:@"searchBar-notificationCenter"];
  return v2;
}

- (void)loadView
{
  v3 = objc_opt_new();
  [(SPUISearchBarController *)self setView:v3];

  v4 = [(SPUISearchBarController *)self view];
  [v4 setHeight:60.0];

  v5 = [(SPUISearchBarController *)self view];
  v6 = [v5 heightAnchor];
  v7 = [(SPUISearchBarController *)self view];
  [v7 height];
  v8 = objc_msgSend(v6, "constraintEqualToConstant:");
  [(SPUISearchBarController *)self setHeightAnchor:v8];

  id v9 = [(SPUISearchBarController *)self heightAnchor];
  [v9 setActive:1];
}

- (CGSize)initialFittingSize
{
  v2 = [(SPUISearchBarController *)self view];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)sceneSpecification
{
  v2 = objc_opt_new();
  return v2;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v20 = a3;
  id v8 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 searchBarDidFocus])
  {
    id v9 = [(SPUISearchBarController *)self delegate];
    [v9 searchBarDidFocus];
  }
  v10 = [v20 clientSettings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v20 clientSettings];
    [v12 headerHeight];
    if (v13 > 0.0)
    {
      [v12 headerHeight];
      double v15 = v14;
      v16 = [(SPUISearchBarController *)self view];
      [v16 setHeight:v15];

      [v12 headerHeight];
      double v18 = v17;
      v19 = [(SPUISearchBarController *)self heightAnchor];
      [v19 setConstant:v18];
    }
  }
}

- (void)didInvalidateSceneWhenForeground
{
  [(SPUISpotlightRemoteViewController *)self viewWillAppear:0];
  id v3 = [(SPUISearchBarController *)self view];
  [v3 setNeedsLayout];
}

- (id)backgroundBlurView
{
  return 0;
}

- (void)updateSceneSettingsWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke;
  v6[3] = &unk_264702C08;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(SPUISpotlightRemoteViewController *)self addOrExecuteEventAsNeeded:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained scene];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke_2;
  v4[3] = &unk_264702BE0;
  id v5 = *(id *)(a1 + 32);
  [v3 updateSettingsWithBlock:v4];
}

void __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)setSceneFrameOnRotation
{
  return 1;
}

- (SPUISearchBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPUISearchBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)roundedCornerVisible
{
  return self->_roundedCornerVisible;
}

- (NSLayoutConstraint)heightAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setHeightAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end