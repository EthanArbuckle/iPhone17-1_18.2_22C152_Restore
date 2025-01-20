@interface SUUIContextActionsPresentationController
- (BOOL)shouldRemovePresentersView;
- (SUUIContextActionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIVisualEffectView)backgroundView;
- (id)dismissalAnimations;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setBackgroundView:(id)a3;
- (void)setDismissalAnimations:(id)a3;
@end

@implementation SUUIContextActionsPresentationController

- (SUUIContextActionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIContextActionsPresentationController;
  v4 = [(SUUIContextActionsPresentationController *)&v9 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:0];
    [(UIVisualEffectView *)v5 setAutoresizingMask:18];
    v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.400000006];
    [(UIVisualEffectView *)v5 setBackgroundColor:v6];

    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;
  }
  return v4;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (void)presentationTransitionWillBegin
{
  v26.receiver = self;
  v26.super_class = (Class)SUUIContextActionsPresentationController;
  [(SUUIContextActionsPresentationController *)&v26 presentationTransitionWillBegin];
  v3 = [(SUUIContextActionsPresentationController *)self presentedViewController];
  v4 = [(SUUIContextActionsPresentationController *)self containerView];
  v5 = [MEMORY[0x263F82438] sharedApplication];
  v6 = [v5 statusBar];

  LODWORD(v5) = [v3 isOrbPresentation];
  v7 = [(SUUIContextActionsPresentationController *)self backgroundView];
  [v4 addSubview:v7];

  [v4 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(SUUIContextActionsPresentationController *)self backgroundView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(SUUIContextActionsPresentationController *)self backgroundView];
  [v17 setAlpha:0.0];

  if (v5)
  {
    [MEMORY[0x263F82E88] _synchronizeDrawing];
    v18 = [(SUUIContextActionsPresentationController *)self backgroundView];
    [v4 insertSubview:v6 belowSubview:v18];
  }
  v19 = [(SUUIContextActionsPresentationController *)self presentedViewController];
  v20 = [v19 transitionCoordinator];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __75__SUUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke;
  v25[3] = &unk_265400820;
  v25[4] = self;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __75__SUUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke_2;
  v22[3] = &unk_265406818;
  id v23 = v6;
  v24 = self;
  id v21 = v6;
  [v20 animateAlongsideTransition:v25 completion:v22];
}

void __75__SUUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backgroundView];
  v3 = [v2 backgroundColor];
  v4 = [MEMORY[0x263F825C8] clearColor];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) backgroundView];
    [v6 setAlpha:1.0];
  }
}

void __75__SUUIContextActionsPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    [MEMORY[0x263F82E88] _synchronizeDrawing];
    v3 = [MEMORY[0x263F82438] sharedApplication];
    v4 = [v3 statusBarWindow];
    [v4 addSubview:*(void *)(a1 + 32)];

    id v5 = [*(id *)(a1 + 40) backgroundView];
    [v5 setAlpha:0.0];
  }
}

- (void)dismissalTransitionWillBegin
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIContextActionsPresentationController;
  [(SUUIContextActionsPresentationController *)&v13 dismissalTransitionWillBegin];
  v3 = [(SUUIContextActionsPresentationController *)self presentedViewController];
  v4 = [MEMORY[0x263F82438] sharedApplication];
  id v5 = [v4 statusBar];

  LOBYTE(v4) = [v3 isOrbPresentation];
  id v6 = [(SUUIContextActionsPresentationController *)self presentedViewController];
  v7 = [v6 transitionCoordinator];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__SUUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke;
  v12[3] = &unk_265400820;
  v12[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__SUUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke_2;
  v9[3] = &unk_265408168;
  char v11 = (char)v4;
  id v10 = v5;
  id v8 = v5;
  [v7 animateAlongsideTransition:v12 completion:v9];
}

void __72__SUUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
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

void __72__SUUIContextActionsPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0 && *(unsigned char *)(a1 + 40))
  {
    [MEMORY[0x263F82E88] _synchronizeDrawing];
    id v4 = [MEMORY[0x263F82438] sharedApplication];
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

@end