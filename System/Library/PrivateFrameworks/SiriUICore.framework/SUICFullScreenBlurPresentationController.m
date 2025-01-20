@interface SUICFullScreenBlurPresentationController
- (SUICFullScreenBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (SUICFullScreenBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 blurStyle:(unint64_t)a5;
- (unint64_t)blurStyle;
- (void)_stageViewsForFadeIn;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setBlurStyle:(unint64_t)a3;
@end

@implementation SUICFullScreenBlurPresentationController

- (SUICFullScreenBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  return [(SUICFullScreenBlurPresentationController *)self initWithPresentedViewController:a3 presentingViewController:a4 blurStyle:0];
}

- (void)presentationTransitionWillBegin
{
  [(_UIBackdropView *)self->_fullScreenBlurView setAlpha:0.0];
  [(SUICFullScreenBlurPresentationController *)self _stageViewsForFadeIn];
  v3 = [(SUICFullScreenBlurPresentationController *)self presentingViewController];
  v4 = [v3 transitionCoordinator];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke;
  v7[3] = &unk_1E5C59678;
  objc_copyWeak(&v8, &location);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke_2;
  v5[3] = &unk_1E5C59678;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v7 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[44] setAlpha:1.0];
    WeakRetained = v2;
  }
}

void __75__SUICFullScreenBlurPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained presentedViewController];
    [v2 becomeFirstResponder];

    id WeakRetained = v3;
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3) {
    [(_UIBackdropView *)self->_fullScreenBlurView removeFromSuperview];
  }
}

- (void)dismissalTransitionWillBegin
{
  id v3 = [(SUICFullScreenBlurPresentationController *)self presentingViewController];
  v4 = [v3 transitionCoordinator];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke;
  v7[3] = &unk_1E5C59678;
  objc_copyWeak(&v8, &location);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke_2;
  v5[3] = &unk_1E5C59678;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v7 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[44] setAlpha:0.0];
    id WeakRetained = v2;
  }
}

void __72__SUICFullScreenBlurPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = [WeakRetained presentedViewController];
    id v3 = [v2 view];
    [v3 removeFromSuperview];

    [v5[44] removeFromSuperview];
    v4 = [v5 presentedViewController];
    [v4 resignFirstResponder];

    id WeakRetained = v5;
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (!a3) {
    [(SUICFullScreenBlurPresentationController *)self _stageViewsForFadeIn];
  }
}

- (SUICFullScreenBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 blurStyle:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SUICFullScreenBlurPresentationController;
  id v6 = [(SUICFullScreenBlurPresentationController *)&v12 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1FE0]);
    if (a5 == 2) {
      uint64_t v8 = 2020;
    }
    else {
      uint64_t v8 = 2030;
    }
    uint64_t v9 = [v7 initWithPrivateStyle:v8];
    fullScreenBlurView = v6->_fullScreenBlurView;
    v6->_fullScreenBlurView = (_UIBackdropView *)v9;
  }
  return v6;
}

- (void)setBlurStyle:(unint64_t)a3
{
  fullScreenBlurView = self->_fullScreenBlurView;
  if (a3 == 2) {
    uint64_t v4 = 2020;
  }
  else {
    uint64_t v4 = 2030;
  }
  [(_UIBackdropView *)fullScreenBlurView transitionToPrivateStyle:v4];
}

- (unint64_t)blurStyle
{
  if ([(_UIBackdropView *)self->_fullScreenBlurView style] == 2020) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_stageViewsForFadeIn
{
  id v6 = [(SUICFullScreenBlurPresentationController *)self containerView];
  fullScreenBlurView = self->_fullScreenBlurView;
  [v6 bounds];
  -[_UIBackdropView setFrame:](fullScreenBlurView, "setFrame:");
  [v6 addSubview:self->_fullScreenBlurView];
  uint64_t v4 = [(SUICFullScreenBlurPresentationController *)self presentedViewController];
  v5 = [v4 view];
  [(_UIBackdropView *)self->_fullScreenBlurView bounds];
  objc_msgSend(v5, "setFrame:");
  [(_UIBackdropView *)self->_fullScreenBlurView addSubview:v5];
}

- (void).cxx_destruct
{
}

@end