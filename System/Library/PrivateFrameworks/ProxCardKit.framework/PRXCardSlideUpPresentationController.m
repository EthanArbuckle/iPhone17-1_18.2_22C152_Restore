@interface PRXCardSlideUpPresentationController
- (PRXCardSlideUpPresentationController)initWithDimmingStyle:(int64_t)a3 presentedViewController:(id)a4 presentingViewController:(id)a5;
- (PRXCardSlideUpPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIView)dimmingView;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation PRXCardSlideUpPresentationController

- (PRXCardSlideUpPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  return [(PRXCardSlideUpPresentationController *)self initWithDimmingStyle:0 presentedViewController:a3 presentingViewController:a4];
}

- (PRXCardSlideUpPresentationController)initWithDimmingStyle:(int64_t)a3 presentedViewController:(id)a4 presentingViewController:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)PRXCardSlideUpPresentationController;
  v6 = [(PRXCardSlideUpPresentationController *)&v15 initWithPresentedViewController:a4 presentingViewController:a5];
  if (v6)
  {
    if (a3 == 1)
    {
      id v7 = objc_alloc(MEMORY[0x263F1CB98]);
      v8 = [MEMORY[0x263F1C480] effectWithStyle:2];
      uint64_t v9 = [v7 initWithEffect:v8];
      dimmingView = v6->_dimmingView;
      v6->_dimmingView = (UIView *)v9;
    }
    else
    {
      v11 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
      v12 = v6->_dimmingView;
      v6->_dimmingView = v11;

      v8 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.6];
      [(UIView *)v6->_dimmingView setBackgroundColor:v8];
    }

    [(UIView *)v6->_dimmingView setAutoresizingMask:18];
    v13 = v6;
  }

  return v6;
}

- (void)presentationTransitionWillBegin
{
  [(UIView *)self->_dimmingView setAlpha:0.0];
  v3 = [(PRXCardSlideUpPresentationController *)self containerView];
  [v3 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");

  v4 = [(PRXCardSlideUpPresentationController *)self containerView];
  [v4 addSubview:self->_dimmingView];

  v5 = [(PRXCardSlideUpPresentationController *)self presentedViewController];
  v6 = [v5 transitionCoordinator];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__PRXCardSlideUpPresentationController_presentationTransitionWillBegin__block_invoke;
  v7[3] = &unk_264418280;
  v7[4] = self;
  [v6 animateAlongsideTransition:v7 completion:0];
}

void __71__PRXCardSlideUpPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dimmingView];
  [v1 setAlpha:1.0];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    [(UIView *)self->_dimmingView removeFromSuperview];
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;
  }
}

- (void)dismissalTransitionWillBegin
{
  uint64_t v3 = [(PRXCardSlideUpPresentationController *)self presentedViewController];
  v4 = [v3 transitionCoordinator];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__PRXCardSlideUpPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_264418280;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

void __68__PRXCardSlideUpPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dimmingView];
  [v1 setAlpha:0.0];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    [(UIView *)self->_dimmingView removeFromSuperview];
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;
  }
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void).cxx_destruct
{
}

@end