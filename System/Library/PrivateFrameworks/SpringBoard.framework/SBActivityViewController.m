@interface SBActivityViewController
- (ACUISActivityHostViewController)activityHostViewController;
- (BOOL)wantsIdleTimerDisabled;
- (CGSize)preferredActivityContentSize;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (SBActivityItem)activityItem;
- (SBActivityViewController)initWithActivityItem:(id)a3;
- (SBActivityViewController)initWithActivityItem:(id)a3 sceneType:(int64_t)a4 payloadID:(id)a5;
- (SBActivityViewController)initWithActivityItem:(id)a3 viewController:(id)a4;
- (SBActivityViewControllerDelegate)delegate;
- (unint64_t)presentationMode;
- (unint64_t)visibility;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4;
- (void)_viewWillLayoutSubviews;
- (void)activityHostViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4;
- (void)activityHostViewController:(id)a3 requestsLaunchWithAction:(id)a4;
- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:(id)a3;
- (void)activityHostViewControllerHostShouldCancelTouches:(id)a3;
- (void)dealloc;
- (void)ensureContent:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setActivityHostViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBActivityViewController

- (SBActivityViewController)initWithActivityItem:(id)a3 sceneType:(int64_t)a4 payloadID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 descriptor];
  uint64_t v11 = [v10 contentType];
  if (a4 == 3)
  {
    if (v11 == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4FA7CB0] ambientCompactDefaultMetrics];
      goto LABEL_13;
    }
    if (!v11) {
      goto LABEL_5;
    }
LABEL_8:
    v13 = 0;
LABEL_14:
    uint64_t v14 = [MEMORY[0x1E4F49758] activityHostViewControllerWithDescriptor:v10 sceneType:a4 metricsRequest:v13];
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    if (v11 == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4FA7CB0] ambientDefaultMetrics];
      goto LABEL_13;
    }
    if (!v11)
    {
LABEL_5:
      uint64_t v12 = [MEMORY[0x1E4FA7CB0] ambientWidgetMetrics];
LABEL_13:
      v13 = (void *)v12;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  v13 = [MEMORY[0x1E4FA7CB0] defaultMetrics];
  if (a4 != 1) {
    goto LABEL_14;
  }
  uint64_t v14 = [MEMORY[0x1E4F49758] activityHostViewControllerWithDescriptor:v10 metricsRequest:v13 payloadID:v8];
LABEL_15:
  v15 = (void *)v14;
  v16 = [(SBActivityViewController *)self initWithActivityItem:v9 viewController:v14];

  return v16;
}

- (SBActivityViewController)initWithActivityItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBActivityViewController;
  v6 = [(SBActivityViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_activityItem, a3);
  }

  return v7;
}

- (SBActivityViewController)initWithActivityItem:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBActivityViewController;
  objc_super v9 = [(SBActivityViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityItem, a3);
    objc_storeStrong((id *)&v10->_activityHostViewController, a4);
  }

  return v10;
}

- (void)dealloc
{
  [(SBActivityViewController *)self bs_removeChildViewController:self->_activityHostViewController];
  [(ACUISActivityHostViewController *)self->_activityHostViewController invalidate];
  activityHostViewController = self->_activityHostViewController;
  self->_activityHostViewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityViewController;
  [(SBActivityViewController *)&v4 dealloc];
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  objc_super v4 = (ACUISActivityHostViewController *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SBActivityViewController;
  [(SBActivityViewController *)&v6 _preferredContentSizeDidChangeForChildViewController:v4];
  if (self->_activityHostViewController == v4)
  {
    [(ACUISActivityHostViewController *)v4 preferredContentSize];
    -[SBActivityViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    id v5 = [(SBActivityViewController *)self view];
    [v5 layoutIfNeeded];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBActivityViewController;
  [(SBActivityViewController *)&v5 viewDidLoad];
  v3 = [(SBActivityViewController *)self activityHostViewController];
  [v3 setDelegate:self];

  objc_super v4 = [(SBActivityViewController *)self activityHostViewController];
  [(SBActivityViewController *)self bs_addChildViewController:v4];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBActivityViewController;
  [(SBActivityViewController *)&v3 viewWillLayoutSubviews];
  [(SBActivityViewController *)self _viewWillLayoutSubviews];
}

- (void)_viewWillLayoutSubviews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SBActivityViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  [(SBActivityViewController *)self preferredActivityContentSize];
  double v7 = v6;
  double v9 = v8;
  v10 = [(SBActivityViewController *)self traitCollection];
  [v10 displayScale];

  BSFloatRoundForScale();
  double v12 = v11;
  BSFloatRoundForScale();
  double v14 = v13;
  if (v7 < v5) {
    double v5 = v7;
  }
  v15 = SBLogActivity();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(ACUISActivityHostViewController *)self->_activityHostViewController activityIdentifier];
    v24.origin.x = v12;
    v24.origin.y = v14;
    v24.size.width = v5;
    v24.size.height = v9;
    v17 = NSStringFromCGRect(v24);
    int v19 = 138543618;
    v20 = v16;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Setting host view controller frame: %@", (uint8_t *)&v19, 0x16u);
  }
  v18 = [(ACUISActivityHostViewController *)self->_activityHostViewController view];
  objc_msgSend(v18, "setFrame:", v12, v14, v5, v9);
}

- (CGSize)preferredActivityContentSize
{
  [(ACUISActivityHostViewController *)self->_activityHostViewController preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (ACUISActivityHostViewController)activityHostViewController
{
  return self->_activityHostViewController;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivityViewController;
  [(SBActivityViewController *)&v4 viewWillAppear:a3];
  [(ACUISActivityHostViewController *)self->_activityHostViewController setVisibility:1];
  [(ACUISActivityHostViewController *)self->_activityHostViewController setPresentationMode:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivityViewController;
  [(SBActivityViewController *)&v4 viewDidDisappear:a3];
  [(ACUISActivityHostViewController *)self->_activityHostViewController setVisibility:0];
  [(ACUISActivityHostViewController *)self->_activityHostViewController setPresentationMode:0];
}

- (void)ensureContent:(double)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    -[ACUISActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:");
  }
}

- (void)setVisibility:(unint64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    -[ACUISActivityHostViewController setVisibility:](self->_activityHostViewController, "setVisibility:");
  }
}

- (void)invalidate
{
}

- (BOOL)wantsIdleTimerDisabled
{
  return [(ACUISActivityHostViewController *)self->_activityHostViewController idleTimerDisabled];
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  double v2 = [(ACUISActivityHostViewController *)self->_activityHostViewController audioCategoriesDisablingVolumeHUD];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    double v3 = 0;
  }

  return (NSSet *)v3;
}

- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  BSDispatchQueueAssertMain();
  double v7 = [v6 activityIdentifier];
  double v8 = [v6 activitySceneDescriptor];

  double v9 = [v8 activityDescriptor];
  v10 = [v9 platterTargetBundleIdentifier];

  if (v10)
  {
    double v11 = (void *)MEMORY[0x1E4F629C8];
    v26[0] = *MEMORY[0x1E4F625E0];
    if (v5)
    {
      id v25 = v5;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    }
    else
    {
      double v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v14 = *MEMORY[0x1E4F62688];
    v27[0] = v12;
    v27[1] = MEMORY[0x1E4F1CC38];
    uint64_t v15 = *MEMORY[0x1E4F626A0];
    v26[1] = v14;
    v26[2] = v15;
    v27[2] = MEMORY[0x1E4F1CC38];
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    double v13 = [v11 optionsWithDictionary:v16];

    if (v5) {
    v17 = SBLogActivity();
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v22 = v7;
      __int16 v23 = 2113;
      id v24 = v5;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Sending open application request for %{private}@", buf, 0x16u);
    }

    v18 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke;
    v19[3] = &unk_1E6AFFD60;
    id v20 = v7;
    [v18 openApplication:v10 withOptions:v13 completion:v19];
  }
  else
  {
    double v13 = SBLogActivity();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[SBActivityViewController _unlockAndLaunchAppIfPossible:withAction:]((uint64_t)v7, v13);
    }
  }
}

void __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogActivity();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Open application from banner succeeded.", (uint8_t *)&v8, 0xCu);
  }
}

- (void)activityHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SBActivityViewController_activityHostViewController_requestsLaunchWithAction___block_invoke;
  block[3] = &unk_1E6AF4E00;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__SBActivityViewController_activityHostViewController_requestsLaunchWithAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unlockAndLaunchAppIfPossible:*(void *)(a1 + 40) withAction:*(void *)(a1 + 48)];
}

- (void)activityHostViewControllerHostShouldCancelTouches:(id)a3
{
  id v4 = [(SBActivityViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 activityViewControllerContentRequestsCancellingGesture:self];
  }
}

- (void)activityHostViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBActivityViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 activityViewController:self didSetIdleTimerDisabled:v4];
  }
}

- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:(id)a3
{
  id v4 = [(SBActivityViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 activityViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:self];
  }
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (SBActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBActivityItem)activityItem
{
  return self->_activityItem;
}

- (void)setActivityHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityHostViewController, 0);
  objc_storeStrong((id *)&self->_activityItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_unlockAndLaunchAppIfPossible:(uint64_t)a1 withAction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "Activity[%{public}@] Unable to resolve container bundle identifier", (uint8_t *)&v2, 0xCu);
}

void __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Activity[%{public}@] Open application from banner failed: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end