@interface PXActivityProgressController
- (BOOL)isCancelled;
- (BOOL)shouldAutoDisplay;
- (BOOL)shouldUseProgressText;
- (BOOL)showCheckmarkOnCompletion;
- (NSProgress)progress;
- (NSString)message;
- (NSString)title;
- (PXActivityProgressController)init;
- (UIViewController)presentingViewController;
- (UIWindow)window;
- (id)_newProgressContainerView;
- (id)cancellationHandler;
- (void)_cancel;
- (void)_didFinishHiding;
- (void)_updateFractionCompletedFromProgress;
- (void)_updatePrimaryText;
- (void)_updateSecondaryText;
- (void)dealloc;
- (void)handleShowingProgressView;
- (void)hideAnimated:(BOOL)a3 allowDelay:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCancellationHandler:(id)a3;
- (void)setFractionCompleted:(double)a3;
- (void)setMessage:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgress:(id)a3;
- (void)setShouldAutoDisplay:(BOOL)a3;
- (void)setShouldUseProgressText:(BOOL)a3;
- (void)setShowCheckmarkOnCompletion:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setWindow:(id)a3;
- (void)showAnimated:(BOOL)a3 allowDelay:(BOOL)a4;
@end

@implementation PXActivityProgressController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityPresentingViewController, 0);
  objc_storeStrong((id *)&self->_progressContainerView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setCancellationHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setWindow:(id)a3
{
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (BOOL)shouldUseProgressText
{
  return self->_shouldUseProgressText;
}

- (void)setShouldAutoDisplay:(BOOL)a3
{
  self->_shouldAutoDisplay = a3;
}

- (BOOL)shouldAutoDisplay
{
  return self->_shouldAutoDisplay;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = v10;
  if ((void *)PXActivityProgressControllerProgressObserverContext == a6)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __79__PXActivityProgressController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v16 = &unk_1E5DD32A8;
    id v17 = v10;
    v18 = self;
    px_dispatch_on_main_queue();
  }
  v12.receiver = self;
  v12.super_class = (Class)PXActivityProgressController;
  [(PXActivityProgressController *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
}

void __79__PXActivityProgressController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSelector(sel_fractionCompleted);
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    v4 = *(void **)(a1 + 40);
    [v4 _updateFractionCompletedFromProgress];
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = NSStringFromSelector(sel_localizedDescription);
    LODWORD(v5) = [v5 isEqualToString:v6];

    if (v5)
    {
      v7 = *(void **)(a1 + 40);
      [v7 _updatePrimaryText];
    }
    else
    {
      v8 = *(void **)(a1 + 32);
      v9 = NSStringFromSelector(sel_localizedAdditionalDescription);
      LODWORD(v8) = [v8 isEqualToString:v9];

      if (v8)
      {
        id v10 = *(void **)(a1 + 40);
        [v10 _updateSecondaryText];
      }
    }
  }
}

- (void)_didFinishHiding
{
  [(UIView *)self->_containerView removeFromSuperview];
  *(_WORD *)&self->_didShow = 0;
  progressViewController = self->_progressViewController;
  [(PXActivityProgressViewController *)progressViewController reset];
}

- (void)hideAnimated:(BOOL)a3 allowDelay:(BOOL)a4
{
  if (self->_didShow && !self->_didHide)
  {
    BOOL v5 = a3;
    self->_didHide = 1;
    if (a4 && self->_whenDidShow > 0.0)
    {
      CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - self->_whenDidShow;
      double v7 = (1.0 - v6) * 1000000000.0;
      BOOL v8 = v6 < 1.0;
      double v9 = 0.0;
      if (v8) {
        double v9 = v7;
      }
      int64_t v10 = (uint64_t)v9;
    }
    else
    {
      int64_t v10 = 0;
    }
    if (v5) {
      double v11 = 0.3;
    }
    else {
      double v11 = 0.0;
    }
    dispatch_time_t v12 = dispatch_time(0, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke;
    v13[3] = &unk_1E5DD08D8;
    v13[4] = self;
    *(double *)&v13[5] = v11;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);
  }
}

void __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  double v3 = *(double *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_2;
  v6[3] = &unk_1E5DD36F8;
  v6[4] = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_3;
  v4[3] = &unk_1E5DCE660;
  objc_copyWeak(&v5, &location);
  [v2 animateWithDuration:v6 animations:v4 completion:v3];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
}

void __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinishHiding];
}

- (void)showAnimated:(BOOL)a3 allowDelay:(BOOL)a4
{
  if (!self->_didShow && !self->_didHide)
  {
    BOOL v5 = a4;
    BOOL v6 = a3;
    self->_didShow = 1;
    double v7 = [(PXActivityProgressController *)self window];
    BOOL v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      int64_t v10 = [MEMORY[0x1E4FB1438] sharedApplication];
      objc_msgSend(v10, "px_firstKeyWindow");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v9 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v11, v13, v15, v17);
    containerView = self->_containerView;
    self->_containerView = v19;

    [(UIView *)self->_containerView setAutoresizingMask:18];
    [(UIView *)self->_containerView setAlpha:1.0];
    [v9 addSubview:self->_containerView];
    v21 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v12, v14, v16, v18);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v21;

    [(UIView *)self->_dimmingView setAutoresizingMask:18];
    double v23 = 0.0;
    [(UIView *)self->_dimmingView setAlpha:0.0];
    v24 = self->_dimmingView;
    v25 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v24 setBackgroundColor:v25];

    [(UIView *)self->_containerView addSubview:self->_dimmingView];
    if (v6) {
      double v23 = 0.3;
    }
    if (v5) {
      int64_t v26 = 1000000000;
    }
    else {
      int64_t v26 = 0;
    }
    dispatch_time_t v27 = dispatch_time(0, v26);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke;
    v28[3] = &unk_1E5DD08D8;
    v28[4] = self;
    *(double *)&v28[5] = v23;
    dispatch_after(v27, MEMORY[0x1E4F14428], v28);
  }
}

void __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 57))
  {
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
    uint64_t v2 = [*(id *)(a1 + 32) _newProgressContainerView];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 24) addSubview:*(void *)(*(void *)(a1 + 32) + 40)];
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    BOOL v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(*(void *)(a1 + 32) + 24) attribute:9 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 32) + 40) attribute:9 multiplier:1.0 constant:0.0];
    [v5 addObject:v6];

    double v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(*(void *)(a1 + 32) + 24) attribute:10 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 32) + 40) attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v7];

    [*(id *)(*(void *)(a1 + 32) + 24) addConstraints:v5];
    double v8 = *(double *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke_2;
    v9[3] = &unk_1E5DD36F8;
    v9[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:v8];
  }
}

uint64_t __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.5];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v2 setAlpha:1.0];
}

- (void)handleShowingProgressView
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if (!self->_didHide)
  {
    self->_whenDidShow = CFAbsoluteTimeGetCurrent();
    uint64_t v3 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    activityPresentingViewController = self->_activityPresentingViewController;
    self->_activityPresentingViewController = v3;

    BOOL v5 = [(PXActivityProgressController *)self _newProgressContainerView];
    progressContainerView = self->_progressContainerView;
    self->_progressContainerView = v5;

    [(UIView *)self->_progressContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(UIViewController *)self->_activityPresentingViewController view];
    [v7 addSubview:self->_progressContainerView];

    v19 = (void *)MEMORY[0x1E4F28DC8];
    int64_t v26 = [(UIViewController *)self->_activityPresentingViewController view];
    v25 = [v26 centerXAnchor];
    v24 = [(UIView *)self->_progressContainerView centerXAnchor];
    double v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [(UIViewController *)self->_activityPresentingViewController view];
    v21 = [v22 centerYAnchor];
    v20 = [(UIView *)self->_progressContainerView centerYAnchor];
    double v18 = [v21 constraintEqualToAnchor:v20];
    v27[1] = v18;
    double v8 = [(UIViewController *)self->_activityPresentingViewController view];
    id v9 = [v8 widthAnchor];
    int64_t v10 = [(UIView *)self->_progressContainerView widthAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v27[2] = v11;
    double v12 = [(UIViewController *)self->_activityPresentingViewController view];
    double v13 = [v12 topAnchor];
    double v14 = [(UIView *)self->_progressContainerView topAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v27[3] = v15;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v19 activateConstraints:v16];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    [WeakRetained showViewController:self->_activityPresentingViewController sender:0];
  }
}

- (void)_cancel
{
  uint64_t v3 = [(PXActivityProgressController *)self cancellationHandler];
  [(PXActivityProgressController *)self setCancellationHandler:0];
  if (v3) {
    v3[2](v3);
  }
  if ([(PXActivityProgressController *)self shouldAutoDisplay]) {
    [(PXActivityProgressController *)self hideAnimated:1 allowDelay:1];
  }
}

- (id)_newProgressContainerView
{
  uint64_t v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:1];
  objc_storeStrong((id *)&self->_alertController, v3);
  objc_initWeak(&location, self);
  v4 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __57__PXActivityProgressController__newProgressContainerView__block_invoke;
  int64_t v10 = &unk_1E5DD32D0;
  objc_copyWeak(&v11, &location);
  [v3 _addActionWithTitle:v4 style:1 handler:&v7 shouldDismissHandler:&__block_literal_global_251053];

  objc_msgSend(v3, "setContentViewController:", self->_progressViewController, v7, v8, v9, v10);
  BOOL v5 = [v3 view];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __57__PXActivityProgressController__newProgressContainerView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

uint64_t __57__PXActivityProgressController__newProgressContainerView__block_invoke_2()
{
  return 0;
}

- (void)_updateSecondaryText
{
  if ([(PXActivityProgressController *)self shouldUseProgressText])
  {
    id v4 = [(PXActivityProgressController *)self progress];
    uint64_t v3 = [v4 localizedAdditionalDescription];
    [(PXActivityProgressViewController *)self->_progressViewController setSecondaryText:v3];
  }
  else
  {
    id v4 = [(PXActivityProgressController *)self message];
    -[PXActivityProgressViewController setSecondaryText:](self->_progressViewController, "setSecondaryText:");
  }
}

- (void)_updatePrimaryText
{
  if ([(PXActivityProgressController *)self shouldUseProgressText])
  {
    id v4 = [(PXActivityProgressController *)self progress];
    uint64_t v3 = [v4 localizedDescription];
    [(PXActivityProgressViewController *)self->_progressViewController setPrimaryText:v3];
  }
  else
  {
    id v4 = [(PXActivityProgressController *)self title];
    -[PXActivityProgressViewController setPrimaryText:](self->_progressViewController, "setPrimaryText:");
  }
}

- (void)setShouldUseProgressText:(BOOL)a3
{
  if (self->_shouldUseProgressText != a3)
  {
    self->_shouldUseProgressText = a3;
    [(PXActivityProgressController *)self _updatePrimaryText];
    [(PXActivityProgressController *)self _updateSecondaryText];
  }
}

- (BOOL)isCancelled
{
  uint64_t v2 = [(PXActivityProgressController *)self cancellationHandler];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setMessage:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  BOOL v5 = self->_message;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_message, a3);
      [(PXActivityProgressController *)self _updateSecondaryText];
    }
  }
}

- (void)setTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  BOOL v5 = self->_title;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_title, a3);
      [(PXActivityProgressController *)self _updatePrimaryText];
    }
  }
}

- (void)setShowCheckmarkOnCompletion:(BOOL)a3
{
}

- (BOOL)showCheckmarkOnCompletion
{
  return [(PXActivityProgressViewController *)self->_progressViewController showCheckmarkOnCompletion];
}

- (void)setFractionCompleted:(double)a3
{
  -[PXActivityProgressViewController setFractionCompleted:](self->_progressViewController, "setFractionCompleted:");
  if ([(PXActivityProgressController *)self shouldAutoDisplay])
  {
    BOOL v5 = a3 > 0.0 && a3 < 1.0;
    if (v5 && ![(PXActivityProgressController *)self isCancelled])
    {
      [(PXActivityProgressController *)self showAnimated:1 allowDelay:1];
    }
    else
    {
      [(PXActivityProgressController *)self hideAnimated:1 allowDelay:1];
    }
  }
}

- (void)_updateFractionCompletedFromProgress
{
  id v3 = [(PXActivityProgressController *)self progress];
  [v3 fractionCompleted];
  -[PXActivityProgressController setFractionCompleted:](self, "setFractionCompleted:");
}

- (void)setProgress:(id)a3
{
  BOOL v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)progress removeObserver:self forKeyPath:@"fractionCompleted" context:PXActivityProgressControllerProgressObserverContext];
    [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"localizedDescription" context:PXActivityProgressControllerProgressObserverContext];
    [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"localizedAdditionalDescription" context:PXActivityProgressControllerProgressObserverContext];
    objc_storeStrong((id *)&self->_progress, a3);
    [(NSProgress *)self->_progress addObserver:self forKeyPath:@"fractionCompleted" options:4 context:PXActivityProgressControllerProgressObserverContext];
    [(NSProgress *)self->_progress addObserver:self forKeyPath:@"localizedDescription" options:4 context:PXActivityProgressControllerProgressObserverContext];
    [(NSProgress *)self->_progress addObserver:self forKeyPath:@"localizedAdditionalDescription" options:4 context:PXActivityProgressControllerProgressObserverContext];
    BOOL v5 = v7;
  }
}

- (void)dealloc
{
  [(PXActivityProgressController *)self setProgress:0];
  v3.receiver = self;
  v3.super_class = (Class)PXActivityProgressController;
  [(PXActivityProgressController *)&v3 dealloc];
}

- (PXActivityProgressController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXActivityProgressController;
  uint64_t v2 = [(PXActivityProgressController *)&v6 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(PXActivityProgressViewController);
    progressViewController = v2->_progressViewController;
    v2->_progressViewController = v3;
  }
  return v2;
}

@end