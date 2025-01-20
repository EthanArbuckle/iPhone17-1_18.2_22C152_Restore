@interface PRUISPosterRenderingViewController
- ($04E7BC5D857DAB0C87BC5F8C0E9AAC02)renderingMetrics;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isSceneContentReady;
- (BOOL)_shouldSceneBeForeground;
- (BOOL)forcesSceneForeground;
- (BOOL)showsContentWhenReady;
- (PRSPosterConfiguration)configuration;
- (PRUISPosterContentViewCoordinator)contentViewCoordinator;
- (PRUISPosterRenderingContext)context;
- (PRUISPosterRenderingViewController)initWithArchivedConfigurationURL:(id)a3 context:(id)a4;
- (PRUISPosterRenderingViewController)initWithArchivedConfigurationURL:(id)a3 context:(id)a4 boundingShape:(int64_t)a5;
- (PRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4;
- (PRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5;
- (PRUISPosterRenderingViewControllerDelegate)delegate;
- (UIView)obscurableContentView;
- (id)_cachedImageForRequest:(id)a3;
- (id)_currentAppearance;
- (id)_levelSetForSnapshotOptions:(unint64_t)a3;
- (id)_obscurableContentView;
- (id)_serverPath;
- (id)_snapshotRequestForOptions:(unint64_t)a3 screen:(id)a4 levelSet:(id)a5;
- (id)_updateContentStyleWithAppearance:(id)a3;
- (id)snapshotWithOptions:(int64_t)a3;
- (int64_t)boundingShape;
- (unint64_t)renderingMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginExecutingSnapshotsIfNeeded;
- (void)_createPosterScene;
- (void)_currentAppearance;
- (void)_loadTitleStyleConfigurationIfNeeded;
- (void)_processNextSnapshot;
- (void)_sceneContentReadinessDidChange;
- (void)_setContentHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setContentHidden:(BOOL)a3 animationSettings:(id)a4 completion:(id)a5;
- (void)_updateBackgroundScene;
- (void)_updateBackgroundSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6;
- (void)_updateFloatingLayer;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)registerPosterAppearanceObserver:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setForcesSceneForeground:(BOOL)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setShowsContentWhenReady:(BOOL)a3;
- (void)snapshotWithOptions:(unint64_t)a3 forScreen:(id)a4 completionBlock:(id)a5;
- (void)updateLayoutForChangedObscuredSubviewBounds;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PRUISPosterRenderingViewController

- (PRUISPosterRenderingViewController)initWithArchivedConfigurationURL:(id)a3 context:(id)a4
{
  return [(PRUISPosterRenderingViewController *)self initWithArchivedConfigurationURL:a3 context:a4 boundingShape:-1];
}

- (PRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4
{
  return [(PRUISPosterRenderingViewController *)self initWithConfiguration:a3 context:a4 boundingShape:-1];
}

- (PRUISPosterRenderingViewController)initWithArchivedConfigurationURL:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263F5F348];
  id v16 = 0;
  id v10 = a4;
  v11 = [v9 unarchiveConfigurationAtURL:v8 format:-1 error:&v16];
  id v12 = v16;
  v13 = PRUISLogRendering();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[PRUISPosterRenderingViewController initWithArchivedConfigurationURL:context:boundingShape:]();
  }

  v14 = [(PRUISPosterRenderingViewController *)self initWithConfiguration:v11 context:v10 boundingShape:a5];
  return v14;
}

- (PRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PRUISPosterRenderingViewController;
  v11 = [(PRUISPosterRenderingViewController *)&v23 initWithNibName:0 bundle:0];
  if (!v11) {
    goto LABEL_9;
  }
  id v12 = [v9 _path];
  NSClassFromString(&cfstr_Pfserverposter.isa);
  if (!v12)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:](a2);
    }
LABEL_18:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0551ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:](a2);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A055250);
  }

  uint64_t v13 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PUIPosterBoundingShapeIsValid(puiBoundingShape)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterRenderingViewController initWithConfiguration:context:boundingShape:](a2);
    }
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v11->_configuration, a3);
  objc_storeStrong((id *)&v11->_context, a4);
  v14 = [MEMORY[0x263F29CA0] sharedInstance];
  int v15 = [v14 deviceClass];

  if (v15 == 2) {
    uint64_t v16 = [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
  }
  else {
    uint64_t v16 = 1;
  }
  v11->_activeOrientation = v16;
  uint64_t v17 = [MEMORY[0x263EFF980] array];
  enqueuedSnapshotRequests = v11->_enqueuedSnapshotRequests;
  v11->_enqueuedSnapshotRequests = (NSMutableArray *)v17;

  v11->_boundingShape = v13;
  id v19 = [(PRUISPosterRenderingViewController *)v11 contentViewCoordinator];
  [(PRUISPosterRenderingViewController *)v11 _createPosterScene];
LABEL_9:

  return v11;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [MEMORY[0x263F29CA0] sharedInstance];
  int v4 = [v3 deviceClass];

  if (v4 != 2) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)PRUISPosterRenderingViewController;
  return [(PRUISPosterRenderingViewController *)&v6 supportedInterfaceOrientations];
}

- ($04E7BC5D857DAB0C87BC5F8C0E9AAC02)renderingMetrics
{
  id v19 = [MEMORY[0x263F1C920] mainScreen];
  [v19 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(PRUISPosterRenderingViewController *)self supportedInterfaceOrientations];
  int64_t activeOrientation = self->_activeOrientation;
  if (v10 <= v12) {
    double v15 = v10;
  }
  else {
    double v15 = v12;
  }
  if (v10 <= v12) {
    double v16 = v12;
  }
  else {
    double v16 = v10;
  }
  if ((unint64_t)(activeOrientation - 3) < 2) {
    int64_t v17 = 1;
  }
  else {
    int64_t v17 = self->_activeOrientation;
  }
  if ((v13 & 0x18) != 0) {
    double v15 = v10;
  }
  retstr->var0.origin.x = v6;
  retstr->var0.origin.y = v8;
  if ((v13 & 0x18) != 0) {
    double v16 = v12;
  }
  retstr->var0.size.width = v15;
  retstr->var0.size.height = v16;
  if ((v13 & 0x18) == 0) {
    int64_t activeOrientation = v17;
  }
  retstr->var1 = v13;
  retstr->var2 = activeOrientation;

  return result;
}

- (void)dealloc
{
  [(FBScene *)self->_scene pui_invalidateWithCompletion:0];
  [(FBScene *)self->_floatingScene pui_invalidateWithCompletion:0];
  [(PRUISPosterSnapshotController *)self->_snapshotController invalidate];
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  [(UIScenePresenter *)self->_floatingPresenter invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v19 viewDidLayoutSubviews];
  [(PRUISPosterRenderingViewController *)self renderingMetrics];
  objc_super v3 = [(PRUISPosterRenderingViewController *)self view];
  [v3 frame];
  BOOL v4 = CGRectEqualToRect(v20, *(CGRect *)v18);

  if (!v4)
  {
    double v5 = [(PRUISPosterRenderingViewController *)self view];
    objc_msgSend(v5, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
  }
  CGFloat v6 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  double v7 = [v6 obscurableContentView];

  [v7 frame];
  if (CGRectEqualToRect(v21, *(CGRect *)v18))
  {
    int v8 = !v4;
  }
  else
  {
    objc_msgSend(v7, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    int v8 = 1;
  }
  double v9 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  double v10 = [v9 obscurableContentVibrancyView];

  [v10 frame];
  if (!CGRectEqualToRect(v22, *(CGRect *)v18))
  {
    objc_msgSend(v10, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    int v8 = 1;
  }
  double v11 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  double v12 = [v11 vibrantObscurableContentView];

  [v12 frame];
  if (!CGRectEqualToRect(v23, *(CGRect *)v18))
  {
    objc_msgSend(v12, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    int v8 = 1;
  }
  unint64_t v13 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  v14 = [v13 overlayContentView];

  [v14 frame];
  if (!CGRectEqualToRect(v24, *(CGRect *)v18))
  {
    objc_msgSend(v14, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    int v8 = 1;
  }
  double v15 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  double v16 = [v15 obscurableOverlayView];

  [v16 frame];
  if (!CGRectEqualToRect(v25, *(CGRect *)v18))
  {
    objc_msgSend(v16, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    int v8 = 1;
  }
  [(UIView *)self->_sceneView frame];
  if (!CGRectEqualToRect(v26, *(CGRect *)v18))
  {
    -[UIView setFrame:](self->_sceneView, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
    int v8 = 1;
  }
  [(UIView *)self->_floatingSceneView frame];
  if (CGRectEqualToRect(v27, *(CGRect *)v18))
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    -[UIView setFrame:](self->_floatingSceneView, "setFrame:", *(double *)v18, *(double *)&v18[8], *(double *)&v18[16], *(double *)&v18[24]);
  }
  int64_t v17 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  [v17 updateLayoutForChangedVibrantObscuredSubviewBounds];

LABEL_21:
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v16 viewDidLoad];
  objc_super v3 = [(PRUISPosterRenderingViewController *)self view];
  BOOL v4 = [MEMORY[0x263F1C550] blackColor];
  [v3 setBackgroundColor:v4];

  [(PRUISPosterRenderingViewController *)self renderingMetrics];
  double v5 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  CGFloat v6 = [v5 obscurableContentView];

  objc_msgSend(v3, "setFrame:", v12, v13, v14, v15);
  objc_msgSend(v6, "setFrame:", v12, v13, v14, v15);
  sceneView = self->_sceneView;
  int v8 = [(PRUISPosterRenderingViewController *)self view];
  double v9 = v8;
  if (sceneView) {
    [v8 insertSubview:v6 aboveSubview:self->_sceneView];
  }
  else {
    [v8 addSubview:v6];
  }

  if (self->_floatingSceneView)
  {
    double v10 = [(PRUISPosterRenderingViewController *)self view];
    [v10 addSubview:self->_floatingSceneView];

    double v11 = [(PRUISPosterRenderingViewController *)self view];
    [v11 bringSubviewToFront:self->_floatingSceneView];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v4 viewWillAppear:a3];
  [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v4 viewDidAppear:a3];
  [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterRenderingViewController;
  [(PRUISPosterRenderingViewController *)&v4 didMoveToParentViewController:a3];
  [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PRUISPosterRenderingViewController;
  -[PRUISPosterRenderingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  int v8 = [v7 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 window];
  }
  double v10 = v9;
  if (v7)
  {
    uint64_t v11 = [v9 _toWindowOrientation];
    double v12 = [v10 windowScene];
    double v13 = [v12 _synchronizedDrawingFence];

    double v14 = (void *)MEMORY[0x263F29BC8];
    [v7 transitionDuration];
    double v15 = objc_msgSend(v14, "settingsWithDuration:");
  }
  else
  {
    uint64_t v11 = [(PRUISPosterRenderingViewController *)self interfaceOrientation];
    double v15 = 0;
    double v13 = 0;
  }
  [(PRUISPosterRenderingViewController *)self renderingMetrics];
  if (v7) {
    double v16 = height;
  }
  else {
    double v16 = v19;
  }
  if (v7) {
    double v17 = width;
  }
  else {
    double v17 = v18;
  }
  -[PRUISPosterRenderingViewController _updateBackgroundSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateBackgroundSceneToSize:orientation:withAnimationSettings:fence:", v11, v15, v13, v17, v16, v18);
}

- (PRUISPosterContentViewCoordinator)contentViewCoordinator
{
  contentViewCoordinator = self->_contentViewCoordinator;
  if (!contentViewCoordinator)
  {
    [(PRUISPosterRenderingViewController *)self renderingMetrics];
    objc_super v4 = -[PRUISPosterContentViewCoordinator initWithBounds:]([PRUISPosterContentViewCoordinator alloc], "initWithBounds:", v10, v11, v12, v13);
    objc_super v5 = self->_contentViewCoordinator;
    self->_contentViewCoordinator = v4;

    CGFloat v6 = [(PRUISPosterContentViewCoordinator *)self->_contentViewCoordinator obscurableContentView];
    objc_msgSend(v6, "setFrame:", v10, v11, v12, v13);
    id v7 = [(PRUISPosterRenderingViewController *)self _currentAppearance];
    id v8 = [(PRUISPosterRenderingViewController *)self _updateContentStyleWithAppearance:v7];

    contentViewCoordinator = self->_contentViewCoordinator;
  }

  return contentViewCoordinator;
}

- (void)registerPosterAppearanceObserver:(id)a3
{
  id v4 = a3;
  id v6 = [(PRUISPosterRenderingViewController *)self _currentAppearance];
  objc_super v5 = [(PRUISPosterRenderingViewController *)self _updateContentStyleWithAppearance:v6];
  [v4 posterAppearanceDidChange:v5];
}

- (void)updateLayoutForChangedObscuredSubviewBounds
{
  id v2 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  [v2 updateLayoutForChangedVibrantObscuredSubviewBounds];
}

- (void)setRenderingMode:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3 >= 3)
  {
    id v8 = PRUISLogRendering();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterRenderingViewController setRenderingMode:](a3);
    }
  }
  else if (self->_renderingMode != a3)
  {
    objc_super v5 = PRUISLogRendering();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"default";
      if (a3 == 1) {
        id v6 = @"paused";
      }
      if (a3 == 2) {
        id v6 = @"live";
      }
      id v7 = v6;
      int v9 = 138412290;
      double v10 = v7;
      _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Updating to rendering mode: %@", (uint8_t *)&v9, 0xCu);
    }
    self->_renderingMode = a3;
    [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
  }
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  if (self->_showsContentWhenReady != a3)
  {
    self->_showsContentWhenReady = a3;
    if (a3)
    {
      [(PRUISPosterRenderingViewController *)self _setContentHidden:[(PRUISPosterRenderingViewController *)self _isSceneContentReady] ^ 1 animated:0 completion:0];
      [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
    }
  }
}

- (void)setForcesSceneForeground:(BOOL)a3
{
  if (self->_forcesSceneForeground != a3)
  {
    self->_forcesSceneForeground = a3;
    [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_serverPath
{
  return (id)[(PRSPosterConfiguration *)self->_configuration _path];
}

- (id)_currentAppearance
{
  [(PRUISPosterRenderingViewController *)self _loadTitleStyleConfigurationIfNeeded];
  if (self->_titleStyleConfiguration)
  {
    objc_super v3 = [(PRSPosterConfiguration *)self->_configuration pr_posterProvider];
    if (v3)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v3 error:0];
      objc_super v5 = [v4 URL];
    }
    else
    {
      id v7 = PRUISLogRendering();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterRenderingViewController _currentAppearance](self);
      }

      objc_super v5 = 0;
    }
    id v8 = [(PRSPosterConfiguration *)self->_configuration role];
    if (v5)
    {
      uint64_t v9 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:v5 forRole:v8];
    }
    else
    {
      double v10 = PRUISLogRendering();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterRenderingViewController _currentAppearance](self);
      }

      uint64_t v9 = [MEMORY[0x263F5F520] defaultTitleFontForRole:v8];
    }
    uint64_t v11 = (void *)v9;

    double v12 = [v11 fontWithSize:84.0];

    id v13 = objc_alloc(MEMORY[0x263F5F4C0]);
    id v14 = objc_alloc(MEMORY[0x263F5F4C8]);
    double v15 = [MEMORY[0x263F1C550] whiteColor];
    double v16 = (void *)[v14 initWithColor:v15];
    id v6 = objc_msgSend(v13, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v12, v16, -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self->_titleStyleConfiguration, "preferredTitleAlignment"), -[PRPosterTitleStyleConfiguration preferredTitleLayout](self->_titleStyleConfiguration, "preferredTitleLayout"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_obscurableContentView
{
  id v2 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  objc_super v3 = [v2 obscurableContentView];

  return v3;
}

- (id)_updateContentStyleWithAppearance:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  id v6 = [(PRPosterTitleStyleConfiguration *)self->_titleStyleConfiguration effectiveTitleContentStyle];
  id v7 = [v5 updateContentViewsWithContentStyle:v6 initialAppearance:v4];

  return v7;
}

- (void)_loadTitleStyleConfigurationIfNeeded
{
  if (!self->_didLoadTitleStyleConfiguration)
  {
    objc_super v3 = [(PRUISPosterRenderingViewController *)self configuration];
    objc_msgSend(v3, "pr_loadTitleStyleConfigurationWithError:", 0);
    id v4 = (PRPosterTitleStyleConfiguration *)objc_claimAutoreleasedReturnValue();
    titleStyleConfiguration = self->_titleStyleConfiguration;
    self->_titleStyleConfiguration = v4;

    if (!self->_titleStyleConfiguration)
    {
      id v6 = (PRPosterTitleStyleConfiguration *)objc_alloc_init(MEMORY[0x263F5F520]);
      id v7 = self->_titleStyleConfiguration;
      self->_titleStyleConfiguration = v6;
    }
    self->_didLoadTitleStyleConfiguration = 1;
  }
}

- (BOOL)_shouldSceneBeForeground
{
  return self->_forcesSceneForeground
      || [(PRUISPosterRenderingViewController *)self _appearState] != 0;
}

- (void)_createPosterScene
{
  id v5 = [(PRUISPosterRenderingViewController *)self _serverPath];
  objc_msgSend(MEMORY[0x263F3F4E0], "pr_createPosterSceneWithRole:path:", *MEMORY[0x263F5F5E0], v5);
  objc_super v3 = (FBScene *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  self->_scene = v3;

  [(FBScene *)self->_scene setDelegate:self];
}

- (void)_updateBackgroundScene
{
}

- (void)_updateBackgroundSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(PRUISPosterRenderingViewController *)self _screen];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x263F1C920] mainScreen];
  }
  double v16 = v15;

  double v17 = [v16 displayConfiguration];
  scene = self->_scene;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __107__PRUISPosterRenderingViewController__updateBackgroundSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
  v35[3] = &unk_26546BA38;
  v35[4] = self;
  id v19 = v17;
  id v36 = v19;
  CGFloat v39 = width;
  CGFloat v40 = height;
  int64_t v41 = a4;
  id v20 = v12;
  id v37 = v20;
  id v21 = v11;
  id v38 = v21;
  [(FBScene *)scene performUpdate:v35];
  CGRect v22 = [(PRUISPosterRenderingViewController *)self viewIfLoaded];
  CGRect v23 = [v22 window];

  scenePresenter = self->_scenePresenter;
  if (!v23)
  {
    [(UIScenePresenter *)scenePresenter invalidate];
    v34 = self->_scenePresenter;
    self->_scenePresenter = 0;
    goto LABEL_8;
  }
  if (!scenePresenter)
  {
    CGRect v25 = [(FBScene *)self->_scene uiPresentationManager];
    CGRect v26 = (objc_class *)objc_opt_class();
    CGRect v27 = NSStringFromClass(v26);
    v28 = [v25 createPresenterWithIdentifier:v27];
    v29 = self->_scenePresenter;
    self->_scenePresenter = v28;

    [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_10];
    [(UIScenePresenter *)self->_scenePresenter activate];
    v30 = [(UIScenePresenter *)self->_scenePresenter presentationView];
    sceneView = self->_sceneView;
    self->_sceneView = v30;

    v32 = self->_sceneView;
    BSRectWithSize();
    -[UIView setFrame:](v32, "setFrame:");
    [(UIView *)self->_sceneView setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [(PRUISPosterRenderingViewController *)self view];
    [v33 addSubview:self->_sceneView];

    v34 = [(PRUISPosterRenderingViewController *)self view];
    [v34 sendSubviewToBack:self->_sceneView];
LABEL_8:
  }
}

void __107__PRUISPosterRenderingViewController__updateBackgroundSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v8 = a3;
  id v6 = a2;
  objc_msgSend(v6, "setForeground:", objc_msgSend(v5, "_shouldSceneBeForeground"));
  [v6 setDisplayConfiguration:*(void *)(a1 + 40)];
  BSRectWithSize();
  objc_msgSend(v6, "setFrame:");
  [v6 setInterfaceOrientation:*(void *)(a1 + 80)];
  objc_msgSend(v6, "pui_setPosterBoundingShape:", objc_msgSend(*(id *)(a1 + 32), "boundingShape"));
  if ([*(id *)(a1 + 32) renderingMode] == 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 4294967293;
  }
  [v6 setActivityMode:v7];

  [v8 setAnimationFence:*(void *)(a1 + 48)];
  [v8 setAnimationSettings:*(void *)(a1 + 56)];
}

void __107__PRUISPosterRenderingViewController__updateBackgroundSceneToSize_orientation_withAnimationSettings_fence___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:0];
  id v3 = [MEMORY[0x263F1C550] blackColor];
  [v2 setBackgroundColorWhileHosting:v3];
}

- (void)_updateFloatingLayer
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = [(FBScene *)self->_scene layerManager];
  id v4 = [v3 layers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    double v6 = (double)(uint64_t)*MEMORY[0x263F5F550];
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v9 level];
        double v11 = v10;
        if ([v9 type] == 1 && v11 == v6)
        {
          LODWORD(v5) = [v9 contextID];
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (v5 != self->_floatingContextID)
  {
    self->_floatingContextID = v5;
    [(UIScenePresenter *)self->_floatingPresenter invalidate];
    floatingPresenter = self->_floatingPresenter;
    self->_floatingPresenter = 0;

    if (self->_floatingContextID)
    {
      id v14 = NSString;
      id v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      double v17 = [v14 stringWithFormat:@"%@-floating", v16];

      double v18 = [MEMORY[0x263F1C910] targetForContextID:self->_floatingContextID];
      id v19 = [(FBScene *)self->_scene uiPresentationManager];
      id v20 = [v19 createPresenterForLayerTarget:v18 identifier:v17 priority:100];
      id v21 = self->_floatingPresenter;
      self->_floatingPresenter = v20;

      [(UIScenePresenter *)self->_floatingPresenter modifyPresentationContext:&__block_literal_global_87];
      [(UIScenePresenter *)self->_floatingPresenter activate];
      [(PRUISPosterRenderingViewController *)self renderingMetrics];
      CGRect v22 = [(UIScenePresenter *)self->_floatingPresenter presentationView];
      floatingSceneView = self->_floatingSceneView;
      self->_floatingSceneView = v22;

      -[UIView setFrame:](self->_floatingSceneView, "setFrame:", (unsigned __int128)0, (unsigned __int128)0);
      if ([(PRUISPosterRenderingViewController *)self isViewLoaded])
      {
        CGRect v24 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
        CGRect v25 = [v24 obscurableContentView];

        CGRect v26 = [(PRUISPosterRenderingViewController *)self view];
        CGRect v27 = v26;
        if (v25) {
          sceneView = v25;
        }
        else {
          sceneView = self->_sceneView;
        }
        [v26 insertSubview:self->_floatingSceneView aboveSubview:sceneView];
      }
    }
  }
}

void __58__PRUISPosterRenderingViewController__updateFloatingLayer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:1];
}

- (BOOL)_isSceneContentReady
{
  id v3 = [(FBScene *)self->_scene clientSettings];
  int v4 = objc_msgSend(v3, "pui_didFinishInitialization");

  return v4 && [(FBScene *)self->_scene contentState] == 2;
}

- (void)_sceneContentReadinessDidChange
{
  if ([(PRUISPosterRenderingViewController *)self showsContentWhenReady])
  {
    objc_initWeak(&location, self);
    BOOL v3 = [(PRUISPosterRenderingViewController *)self _isSceneContentReady];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __69__PRUISPosterRenderingViewController__sceneContentReadinessDidChange__block_invoke;
    v4[3] = &unk_26546BA60;
    objc_copyWeak(&v5, &location);
    BOOL v6 = v3;
    [(PRUISPosterRenderingViewController *)self _setContentHidden:v3 ^ 1 animated:v3 completion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __69__PRUISPosterRenderingViewController__sceneContentReadinessDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 renderingViewControllerDidFinishShowingContent:v4];
    }

    id WeakRetained = v4;
  }
}

- (void)_setContentHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v9 = a5;
  if (v5)
  {
    id v8 = [MEMORY[0x263F29BC8] settingsWithDuration:0.25];
  }
  else
  {
    id v8 = 0;
  }
  [(PRUISPosterRenderingViewController *)self _setContentHidden:v6 animationSettings:v8 completion:v9];
}

- (void)_setContentHidden:(BOOL)a3 animationSettings:(id)a4 completion:(id)a5
{
  if (self->_contentHidden != a3)
  {
    self->_contentHidden = a3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __85__PRUISPosterRenderingViewController__setContentHidden_animationSettings_completion___block_invoke;
    v5[3] = &unk_26546BA88;
    v5[4] = self;
    BOOL v6 = a3;
    [MEMORY[0x263F29D20] animateWithSettings:a4 actions:v5 completion:a5];
  }
}

void __85__PRUISPosterRenderingViewController__setContentHidden_animationSettings_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewIfLoaded];
  id v4 = v2;
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  id v8 = PRUISLogRendering();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_25A03F000, v8, OS_LOG_TYPE_DEFAULT, "Will receive settings: %@ context: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PRUISLogRendering();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 identityToken];
    id v10 = [v9 stringRepresentation];
    int v11 = 134218498;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_25A03F000, v8, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did receive actions %@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = PRUISLogRendering();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identityToken];
    id v7 = [v6 stringRepresentation];
    [v4 contentState];
    id v8 = NSStringFromFBSceneContentState();
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did change content state to %@", (uint8_t *)&v9, 0x20u);
  }
  [(PRUISPosterRenderingViewController *)self _sceneContentReadinessDidChange];
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = PRUISLogRendering();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identityToken];
    id v7 = [v6 stringRepresentation];
    int v8 = 134218242;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did activate", (uint8_t *)&v8, 0x16u);
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = PRUISLogRendering();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 identityToken];
    __int16 v10 = [v9 stringRepresentation];
    int v19 = 134218498;
    id v20 = self;
    __int16 v21 = 2112;
    CGRect v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_25A03F000, v8, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with error %@", (uint8_t *)&v19, 0x20u);
  }
  __int16 v11 = [v7 domain];
  if ([v11 isEqualToString:*MEMORY[0x263F3F3D0]])
  {
    uint64_t v12 = [v7 code];

    if (v12 == 1)
    {
      __int16 v13 = PRUISLogRendering();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v6 identityToken];
        uint64_t v15 = [v14 stringRepresentation];
        int v19 = 134218498;
        id v20 = self;
        __int16 v21 = 2112;
        CGRect v22 = v15;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_25A03F000, v13, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with fatal error %@", (uint8_t *)&v19, 0x20u);
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v16 = PRUISLogRendering();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v6 identityToken];
    double v18 = [v17 stringRepresentation];
    int v19 = 134218498;
    id v20 = self;
    __int16 v21 = 2112;
    CGRect v22 = v18;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_25A03F000, v16, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with transient error %@", (uint8_t *)&v19, 0x20u);
  }
  [(PRUISPosterRenderingViewController *)self _updateBackgroundScene];
LABEL_12:
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = PRUISLogRendering();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [v9 identityToken];
    id v14 = [v13 stringRepresentation];
    *(_DWORD *)buf = 134218754;
    double v18 = self;
    __int16 v19 = 2112;
    id v20 = v14;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_25A03F000, v12, OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did update client settings with diff %@, transition %@", buf, 0x2Au);
  }
  id v15 = objc_alloc_init(MEMORY[0x263F3F4C8]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __112__PRUISPosterRenderingViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v16[3] = &unk_26546B768;
  v16[4] = self;
  [v15 observeLayersWithBlock:v16];
  objc_msgSend(v15, "inspectDiff:withContext:", v10, objc_msgSend(v9, "clientSettings"));
  [v15 removeAllObservers];
}

uint64_t __112__PRUISPosterRenderingViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFloatingLayer];
}

- (PRUISPosterRenderingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISPosterRenderingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRSPosterConfiguration)configuration
{
  return self->_configuration;
}

- (PRUISPosterRenderingContext)context
{
  return self->_context;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)showsContentWhenReady
{
  return self->_showsContentWhenReady;
}

- (BOOL)forcesSceneForeground
{
  return self->_forcesSceneForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_enqueuedSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_contentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_contentViewCoordinator, 0);
  objc_storeStrong((id *)&self->_floatingSceneView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_floatingScene, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_floatingPresenter, 0);

  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

- (UIView)obscurableContentView
{
  id v2 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  double v3 = [v2 vibrantObscurableContentView];

  return (UIView *)v3;
}

- (id)snapshotWithOptions:(int64_t)a3
{
  return 0;
}

- (void)snapshotWithOptions:(unint64_t)a3 forScreen:(id)a4 completionBlock:(id)a5
{
  int v8 = (void (**)(id, void *, void))a5;
  id v9 = a4;
  id v10 = [(PRUISPosterRenderingViewController *)self contentViewCoordinator];
  id v11 = [v10 obscurableContentView];
  [v11 removeFromSuperview];

  uint64_t v12 = [(PRUISPosterRenderingViewController *)self _levelSetForSnapshotOptions:a3];
  __int16 v13 = [(PRUISPosterRenderingViewController *)self _snapshotRequestForOptions:a3 screen:v9 levelSet:v12];

  id v14 = [(PRUISPosterRenderingViewController *)self _cachedImageForRequest:v13];
  if (v14)
  {
    v8[2](v8, v14, 0);
  }
  else
  {
    id v15 = PRUISLogRendering();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl(&dword_25A03F000, v15, OS_LOG_TYPE_DEFAULT, "Enqueuing snapshot request", v18, 2u);
    }

    enqueuedSnapshotRequests = self->_enqueuedSnapshotRequests;
    uint64_t v17 = [[_PRUISPosterRenderingEnqueuedSnapshot alloc] initWithSnapshotRequest:v13 completionBlock:v8];
    [(NSMutableArray *)enqueuedSnapshotRequests addObject:v17];

    [(PRUISPosterRenderingViewController *)self _beginExecutingSnapshotsIfNeeded];
  }
}

- (id)_cachedImageForRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[PRUISPosterSnapshotController sharedIncomingCallSnapshotController];
  id v16 = 0;
  BOOL v5 = [v4 currentSnapshotBundleForRequest:v3 error:&v16];
  id v6 = v16;
  if (v5)
  {
    id v7 = [v3 definition];
    int v8 = [v7 levelSets];
    id v9 = [v8 firstObject];

    id v10 = [v5 snapshotForLevelSet:v9];
    if (!v10)
    {
      id v11 = PRUISLogRendering();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25A03F000, v11, OS_LOG_TYPE_DEFAULT, "Snapshot bundle did not contain desired levelSet", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v12 = PRUISLogRendering();
    id v9 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterRenderingViewController(Deprecated) _cachedImageForRequest:]();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_25A03F000, v9, OS_LOG_TYPE_DEFAULT, "Unable to fetch latest snapshot bundle", v14, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)_beginExecutingSnapshotsIfNeeded
{
  if (!self->_isSnapshotting)
  {
    self->_isSnapshotting = 1;
    [(PRUISPosterRenderingViewController *)self _processNextSnapshot];
  }
}

- (void)_processNextSnapshot
{
  if ([(NSMutableArray *)self->_enqueuedSnapshotRequests count])
  {
    id v3 = [(NSMutableArray *)self->_enqueuedSnapshotRequests firstObject];
    [(NSMutableArray *)self->_enqueuedSnapshotRequests removeObject:v3];
    id v4 = [v3 snapshotRequest];
    BOOL v5 = [(PRUISPosterRenderingViewController *)self _cachedImageForRequest:v4];
    if (v5)
    {
      id v6 = [v3 completionBlock];
      ((void (**)(void, void *, void))v6)[2](v6, v5, 0);
    }
    else
    {
      id v10 = PRUISLogRendering();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_25A03F000, v10, OS_LOG_TYPE_DEFAULT, "Executing snapshot request", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      id v11 = +[PRUISPosterSnapshotController sharedIncomingCallSnapshotController];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke;
      v13[3] = &unk_26546BAD8;
      id v14 = v3;
      objc_copyWeak(&v16, buf);
      id v15 = self;
      [v11 executeSnapshotRequest:v4 completion:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    self->_isSnapshotting = 0;
    id v12 = [(PRUISPosterRenderingViewController *)self _obscurableContentView];
    id v7 = [v12 superview];
    int v8 = [(PRUISPosterRenderingViewController *)self viewIfLoaded];

    if (v7 != v8)
    {
      id v9 = [(PRUISPosterRenderingViewController *)self viewIfLoaded];
      [v9 insertSubview:v12 aboveSubview:self->_sceneView];
    }
  }
}

void __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [a3 posterSnapshotBundle];
  id v10 = [v8 definition];

  id v11 = [v10 levelSets];
  id v12 = [v11 firstObject];
  __int16 v13 = [v9 snapshotForLevelSet:v12];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke_2;
  block[3] = &unk_26546BAB0;
  id v17 = *(id *)(a1 + 32);
  id v18 = v13;
  id v19 = v7;
  id v14 = v7;
  id v15 = v13;
  objc_copyWeak(&v21, (id *)(a1 + 48));
  uint64_t v20 = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v21);
}

void __70__PRUISPosterRenderingViewController_Deprecated___processNextSnapshot__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionBlock];
  id v4 = (id)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained) {
    [*(id *)(a1 + 56) _processNextSnapshot];
  }
}

- (id)_snapshotRequestForOptions:(unint64_t)a3 screen:(id)a4 levelSet:(id)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x263F5F4D8];
  id v10 = a4;
  id v11 = [v9 alloc];
  id v12 = [(PRUISPosterRenderingViewController *)self _serverPath];
  __int16 v13 = (void *)[v11 _initWithPath:v12];

  id v14 = [v13 role];
  uint64_t v15 = [v14 isEqualToString:*MEMORY[0x263F5F570]] ^ 1;

  id v16 = objc_alloc(MEMORY[0x263F5F518]);
  id v17 = [NSNumber numberWithUnsignedInteger:a3];
  id v18 = [v17 stringValue];
  v28[0] = v8;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  uint64_t v20 = (void *)[v16 initWithUniqueIdentifier:v18 includeHeaderElements:1 includesComplications:v15 levelSets:v19 isUnlocked:0 renderingContent:0 renderingMode:1 previewContent:1 boundingShape:self->_boundingShape];

  id v21 = [(PRUISPosterSnapshotRequest *)[PRUISMutablePosterSnapshotRequest alloc] initWithPoster:v13 definition:v20 interfaceOrientation:self->_activeOrientation];
  [(PRUISPosterSnapshotRequest *)v21 setScreen:v10];

  id v22 = [(PRUISPosterRenderingViewController *)self _obscurableContentView];
  if (v22)
  {
    __int16 v23 = +[PRUISPosterAttachment attachmentWithView:v22 level:*MEMORY[0x263F5F550] - 1];
    CGRect v27 = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    [(PRUISPosterSnapshotRequest *)v21 setAttachments:v24];
  }
  uint64_t v25 = (void *)[(PRUISMutablePosterSnapshotRequest *)v21 copy];

  return v25;
}

- (id)_levelSetForSnapshotOptions:(unint64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    id v6 = [PRUISPosterLevelSet alloc];
    BOOL v5 = [(PRUISPosterLevelSet *)v6 initWithLevel:*MEMORY[0x263F5F550]];
  }
  else if ((a3 & 4) != 0)
  {
    id v7 = [PRUISPosterLevelSet alloc];
    if ((v3 & 2) != 0) {
      BOOL v5 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v7, "initWithNumberOfLevels:", 2, *MEMORY[0x263F5F550], *MEMORY[0x263F5F560], v9, v10);
    }
    else {
      BOOL v5 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v7, "initWithNumberOfLevels:", 3, *MEMORY[0x263F5F550], *MEMORY[0x263F5F560], *MEMORY[0x263F5F550] - 1, v10);
    }
  }
  else if ((a3 & 2) != 0)
  {
    BOOL v5 = +[PRUISPosterLevelSet defaultLevelSet];
  }
  else
  {
    id v4 = [PRUISPosterLevelSet alloc];
    BOOL v5 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v4, "initWithNumberOfLevels:", 4, *MEMORY[0x263F5F540], *MEMORY[0x263F5F560], *MEMORY[0x263F5F550], *MEMORY[0x263F5F550] - 1);
  }

  return v5;
}

- (void)initWithArchivedConfigurationURL:context:boundingShape:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_25A03F000, v1, OS_LOG_TYPE_ERROR, "Unable to unarchive configuration from URL %{public}@: %{public}@", v2, 0x16u);
}

- (void)initWithConfiguration:(const char *)a1 context:boundingShape:.cold.1(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  __int16 v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:(const char *)a1 context:boundingShape:.cold.2(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  __int16 v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setRenderingMode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_25A03F000, v2, v3, "Invalid rendering mode %@, bailing", v4, v5, v6, v7, v8);
}

- (void)_currentAppearance
{
  os_log_t v1 = [a1 configuration];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_25A03F000, v2, v3, "Missing poster provider from the poster configuration %@", v4, v5, v6, v7, v8);
}

@end