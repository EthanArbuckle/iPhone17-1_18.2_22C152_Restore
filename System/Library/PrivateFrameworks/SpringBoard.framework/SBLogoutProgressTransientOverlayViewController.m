@interface SBLogoutProgressTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_supportsDebugUI;
- (BOOL)isContentOpaque;
- (BOOL)shouldDisableControlCenter;
- (NSString)coverSheetIdentifier;
- (SBLogoutProgressDataSource)dataSource;
- (SBLogoutProgressDelegate)delegate;
- (SBLogoutProgressTransientOverlayViewController)initWithUserAccount:(id)a3;
- (UMUser)user;
- (id)_legibilitySettings;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)preferredStatusBarStyle;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_updateData;
- (void)_updateDebugTasksViewControllerSizeFromSize:(CGSize)a3;
- (void)_updateLegibility;
- (void)prepareForRestart;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBLogoutProgressTransientOverlayViewController

- (SBLogoutProgressTransientOverlayViewController)initWithUserAccount:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  v6 = [(SBLogoutProgressTransientOverlayViewController *)&v13 init];
  if (v6)
  {
    uint64_t v7 = +[SBPlatformController sharedInstance];
    platformController = v6->_platformController;
    v6->_platformController = (SBPlatformController *)v7;

    v9 = +[SBDefaults localDefaults];
    uint64_t v10 = [v9 multiUserDefaults];
    multiUserDefaults = v6->_multiUserDefaults;
    v6->_multiUserDefaults = (SBMultiUserDefaults *)v10;

    objc_storeStrong((id *)&v6->_user, a3);
  }

  return v6;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(SBLogoutProgressTransientOverlayViewController *)self _updateData];
    id v5 = obj;
  }
}

- (void)prepareForRestart
{
  v3 = [(SBLogoutDebugBlockingViewController *)self->_debugTasksViewController view];
  [v3 setHidden:1];

  progressView = self->_progressView;
  [(SBLogoutProgressView *)progressView setProgressVisible:0];
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(SBLogoutProgressTransientOverlayViewController *)self _legibilitySettings];
  unint64_t v3 = [v2 style];

  return v3 < 2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v6 viewDidDisappear:a3];
  v4 = +[SBMainStatusBarStateProvider sharedInstance];
  [v4 enableStatusBarItem:8 requestor:@"SBLogoutProgressTransientOverlayViewController"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained logoutProgressTransientOverlayViewControllerDidDisappear:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidLayoutSubviews];
  unint64_t v3 = [(SBTransientOverlayViewController *)self backgroundView];
  [v3 bounds];
  -[MTMaterialView setFrame:](self->_overlayMaterialView, "setFrame:");
  v4 = [(SBTransientOverlayViewController *)self contentView];
  [v4 bounds];
  -[SBLogoutProgressView setFrame:](self->_progressView, "setFrame:");
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v29 viewDidLoad];
  unint64_t v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  v8 = -[SBLogoutProgressView initWithFrame:]([SBLogoutProgressView alloc], "initWithFrame:", v4, v5, v6, v7);
  progressView = self->_progressView;
  self->_progressView = v8;

  uint64_t v10 = self->_progressView;
  v11 = [MEMORY[0x1E4F1B8F8] contactForUser:self->_user];
  [(SBLogoutProgressView *)v10 setUserContact:v11];

  v12 = self->_progressView;
  objc_super v13 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBLogoutProgressView *)v12 setBackgroundColor:v13];

  [v3 addSubview:self->_progressView];
  v14 = [(SBTransientOverlayViewController *)self backgroundView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = (void *)MEMORY[0x1E4F743C8];
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v23 materialViewWithRecipeNamed:@"logoutProgressOverlay" inBundle:v24 options:0 initialWeighting:0 scaleAdjustment:1.0];
  overlayMaterialView = self->_overlayMaterialView;
  self->_overlayMaterialView = v25;

  -[MTMaterialView setFrame:](self->_overlayMaterialView, "setFrame:", v16, v18, v20, v22);
  [v14 addSubview:self->_overlayMaterialView];
  if ([(SBLogoutProgressTransientOverlayViewController *)self _supportsDebugUI])
  {
    v27 = objc_alloc_init(SBLogoutDebugBlockingViewController);
    debugTasksViewController = self->_debugTasksViewController;
    self->_debugTasksViewController = v27;
  }
  [(SBLogoutProgressTransientOverlayViewController *)self _updateData];
  [(SBLogoutProgressTransientOverlayViewController *)self _updateLegibility];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  [(SBLogoutProgressTransientOverlayViewController *)&v13 viewWillAppear:a3];
  debugTasksViewController = self->_debugTasksViewController;
  if (debugTasksViewController)
  {
    double v5 = [(SBLogoutDebugBlockingViewController *)debugTasksViewController parentViewController];

    if (v5 == self)
    {
      [(SBLogoutProgressView *)self->_progressView frame];
      -[SBLogoutProgressTransientOverlayViewController _updateDebugTasksViewControllerSizeFromSize:](self, "_updateDebugTasksViewControllerSizeFromSize:", v10, v11);
    }
    else
    {
      [(SBLogoutDebugBlockingViewController *)self->_debugTasksViewController willMoveToParentViewController:self];
      [(SBLogoutProgressTransientOverlayViewController *)self addChildViewController:self->_debugTasksViewController];
      [(SBLogoutProgressView *)self->_progressView frame];
      -[SBLogoutProgressTransientOverlayViewController _updateDebugTasksViewControllerSizeFromSize:](self, "_updateDebugTasksViewControllerSizeFromSize:", v6, v7);
      progressView = self->_progressView;
      v9 = [(SBLogoutDebugBlockingViewController *)self->_debugTasksViewController view];
      [(SBLogoutProgressView *)progressView addSubview:v9];

      [(SBLogoutDebugBlockingViewController *)self->_debugTasksViewController didMoveToParentViewController:self];
    }
  }
  v12 = +[SBMainStatusBarStateProvider sharedInstance];
  [v12 disableStatusBarItem:8 requestor:@"SBLogoutProgressTransientOverlayViewController"];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[SBLogoutProgressTransientOverlayViewController _updateDebugTasksViewControllerSizeFromSize:](self, "_updateDebugTasksViewControllerSizeFromSize:", width, height);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isContentOpaque
{
  return 0;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  unint64_t v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAnimated])
  {
    double v4 = [*(id *)(a1 + 32) view];
    double v5 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v9[3] = &unk_1E6AF5290;
    id v10 = v4;
    id v11 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v7[3] = &unk_1E6AF5350;
    id v8 = v11;
    id v6 = v4;
    [v5 animateWithDuration:327680 delay:v9 options:v7 animations:0.3 completion:0.0];
  }
  else
  {
    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
  }
}

uint64_t __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 performAlongsideTransitions];
}

uint64_t __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1456));
  if ([v3 isAnimated])
  {
    double v5 = [*(id *)(a1 + 32) view];
    id v6 = (void *)MEMORY[0x1E4F42FF0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v19[3] = &unk_1E6AF4AC0;
    id v7 = v5;
    id v20 = v7;
    [v6 performWithoutAnimation:v19];
    id v8 = (void *)MEMORY[0x1E4F42FF0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v16[3] = &unk_1E6AF5290;
    id v17 = v7;
    id v18 = v3;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v12[3] = &unk_1E6AF5860;
    id v13 = v18;
    id v9 = WeakRetained;
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v11 = v7;
    [v8 animateWithDuration:327680 delay:v16 options:v12 animations:0.3 completion:0.0];
  }
  else
  {
    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 performAlongsideTransitions];
}

uint64_t __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:v4];
  }
  return result;
}

- (void)setContainerOrientation:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 setContainerOrientation:a3];
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  return 0;
}

- (int64_t)idleTimerMode
{
  return 3;
}

- (int64_t)idleWarnMode
{
  return 1;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (BOOL)_supportsDebugUI
{
  if (([(SBMultiUserDefaults *)self->_multiUserDefaults disablesInternalDebugBlockingTasksUI] & 1) != 0|| ![(SBPlatformController *)self->_platformController isInternalInstall])
  {
    char v4 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)_updateDebugTasksViewControllerSizeFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(SBLogoutDebugBlockingViewController *)self->_debugTasksViewController view];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, width * 0.5, height);
}

- (id)_legibilitySettings
{
  return (id)[MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
}

- (void)_updateLegibility
{
  progressView = self->_progressView;
  id v3 = [(SBLogoutProgressTransientOverlayViewController *)self _legibilitySettings];
  [(SBLogoutProgressView *)progressView setLegibilitySettings:v3];
}

- (void)_updateData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v3 = [WeakRetained pendingApplicationsForLogoutProgressTransientOverlayViewController:self];
  [(SBLogoutProgressView *)self->_progressView setPendingApplications:v3];
  if ([(SBLogoutProgressTransientOverlayViewController *)self _supportsDebugUI])
  {
    debugTasksViewController = self->_debugTasksViewController;
    id v5 = [WeakRetained debugBlockingTasksForLogoutProgressTransientOverlayViewController:self];
    [(SBLogoutDebugBlockingViewController *)debugTasksViewController setDebugBlockingTasks:v5];
  }
}

- (SBLogoutProgressDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBLogoutProgressDataSource *)WeakRetained;
}

- (UMUser)user
{
  return self->_user;
}

- (SBLogoutProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLogoutProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_user, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_overlayMaterialView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_multiUserDefaults, 0);
  objc_storeStrong((id *)&self->_debugTasksViewController, 0);
}

@end