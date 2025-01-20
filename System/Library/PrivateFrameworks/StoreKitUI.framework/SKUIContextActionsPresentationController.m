@interface SKUIContextActionsPresentationController
- (BOOL)shouldRemovePresentersView;
- (SKUIContextActionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIVisualEffectView)backgroundView;
- (id)dismissalAnimations;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setBackgroundView:(id)a3;
- (void)setDismissalAnimations:(id)a3;
@end

@implementation SKUIContextActionsPresentationController

- (SKUIContextActionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsPresentationController initWithPresentedViewController:presentingViewController:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIContextActionsPresentationController;
  v8 = [(SKUIContextActionsPresentationController *)&v13 initWithPresentedViewController:v6 presentingViewController:v7];
  if (v8)
  {
    v9 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
    [(UIVisualEffectView *)v9 setAutoresizingMask:18];
    v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.400000006];
    [(UIVisualEffectView *)v9 setBackgroundColor:v10];

    backgroundView = v8->_backgroundView;
    v8->_backgroundView = v9;
  }
  return v8;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (void)presentationTransitionWillBegin
{
  v26.receiver = self;
  v26.super_class = (Class)SKUIContextActionsPresentationController;
  [(SKUIContextActionsPresentationController *)&v26 presentationTransitionWillBegin];
  v3 = [(SKUIContextActionsPresentationController *)self presentedViewController];
  v4 = [(SKUIContextActionsPresentationController *)self containerView];
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v6 = [v5 statusBar];

  LODWORD(v5) = [v3 isOrbPresentation];
  id v7 = [(SKUIContextActionsPresentationController *)self backgroundView];
  [v4 addSubview:v7];

  [v4 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(SKUIContextActionsPresentationController *)self backgroundView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(SKUIContextActionsPresentationController *)self backgroundView];
  [v17 setAlpha:0.0];

  if (v5)
  {
    [MEMORY[0x1E4FB1F48] _synchronizeDrawing];
    v18 = [(SKUIContextActionsPresentationController *)self backgroundView];
    [v4 insertSubview:v6 belowSubview:v18];
  }
  v19 = [(SKUIContextActionsPresentationController *)self presentedViewController];
  v20 = [v19 transitionCoordinator];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke;
  v25[3] = &unk_1E6422278;
  v25[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke_2;
  v22[3] = &unk_1E6425670;
  id v23 = v6;
  v24 = self;
  id v21 = v6;
  [v20 animateAlongsideTransition:v25 completion:v22];
}

void __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backgroundView];
  v3 = [v2 backgroundColor];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) backgroundView];
    [v6 setAlpha:1.0];
  }
}

void __75__SKUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    [MEMORY[0x1E4FB1F48] _synchronizeDrawing];
    v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    v4 = [v3 statusBarWindow];
    [v4 addSubview:*(void *)(a1 + 32)];

    id v5 = [*(id *)(a1 + 40) backgroundView];
    [v5 setAlpha:0.0];
  }
}

- (void)dismissalTransitionWillBegin
{
  v13.receiver = self;
  v13.super_class = (Class)SKUIContextActionsPresentationController;
  [(SKUIContextActionsPresentationController *)&v13 dismissalTransitionWillBegin];
  v3 = [(SKUIContextActionsPresentationController *)self presentedViewController];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = [v4 statusBar];

  LOBYTE(v4) = [v3 isOrbPresentation];
  id v6 = [(SKUIContextActionsPresentationController *)self presentedViewController];
  id v7 = [v6 transitionCoordinator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke;
  v12[3] = &unk_1E6422278;
  v12[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke_2;
  v9[3] = &unk_1E6425898;
  char v11 = (char)v4;
  id v10 = v5;
  id v8 = v5;
  [v7 animateAlongsideTransition:v12 completion:v9];
}

void __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:0.0];

  v3 = [*(id *)(a1 + 32) dismissalAnimations];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) dismissalAnimations];
    v4[2]();
  }
}

void __72__SKUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0 && *(unsigned char *)(a1 + 40))
  {
    [MEMORY[0x1E4FB1F48] _synchronizeDrawing];
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    v3 = [v4 statusBarWindow];
    [v3 addSubview:*(void *)(a1 + 32)];
  }
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (id)dismissalAnimations
{
  return self->_dismissalAnimations;
}

- (void)setDismissalAnimations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalAnimations, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)initWithPresentedViewController:presentingViewController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContextActionsPresentationController initWithPresentedViewController:presentingViewController:]";
}

@end