@interface SMUFocusedSheetPresentationController
- (SMUFocusedSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIBlurEffect)backgroundBlurEffect;
- (UIVisualEffectView)blurredBackgroundView;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setBackgroundBlurEffect:(id)a3;
@end

@implementation SMUFocusedSheetPresentationController

- (SMUFocusedSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SMUFocusedSheetPresentationController;
  v4 = [(SMUFocusedSheetPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F824D8] effectWithStyle:5];
    backgroundBlurEffect = v4->_backgroundBlurEffect;
    v4->_backgroundBlurEffect = (UIBlurEffect *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:0];
    blurredBackgroundView = v4->_blurredBackgroundView;
    v4->_blurredBackgroundView = (UIVisualEffectView *)v7;

    [(UIVisualEffectView *)v4->_blurredBackgroundView setUserInteractionEnabled:0];
    [(UIVisualEffectView *)v4->_blurredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (void)presentationTransitionWillBegin
{
  v36[4] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)SMUFocusedSheetPresentationController;
  [(SMUFocusedSheetPresentationController *)&v35 presentationTransitionWillBegin];
  v3 = [(SMUFocusedSheetPresentationController *)self containerView];
  v4 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
  [v3 addSubview:v4];

  v18 = (void *)MEMORY[0x263F08938];
  v30 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
  v28 = [v30 leadingAnchor];
  v29 = [(SMUFocusedSheetPresentationController *)self containerView];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v36[0] = v26;
  v25 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
  v23 = [v25 trailingAnchor];
  v24 = [(SMUFocusedSheetPresentationController *)self containerView];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v36[1] = v21;
  v20 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
  v19 = [v20 topAnchor];
  uint64_t v5 = [(SMUFocusedSheetPresentationController *)self containerView];
  v6 = [v5 topAnchor];
  uint64_t v7 = [v19 constraintEqualToAnchor:v6];
  v36[2] = v7;
  v8 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
  v9 = [v8 bottomAnchor];
  objc_super v10 = [(SMUFocusedSheetPresentationController *)self containerView];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v36[3] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
  [v18 activateConstraints:v13];

  v14 = [(SMUFocusedSheetPresentationController *)self presentingViewController];
  v15 = [v14 transitionCoordinator];

  v16 = [(SMUFocusedSheetPresentationController *)self backgroundBlurEffect];
  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __72__SMUFocusedSheetPresentationController_presentationTransitionWillBegin__block_invoke;
  v31[3] = &unk_264DBD030;
  objc_copyWeak(&v33, &location);
  id v17 = v16;
  id v32 = v17;
  [v15 animateAlongsideTransition:v31 completion:0];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __72__SMUFocusedSheetPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained blurredBackgroundView];
  [v2 setEffect:*(void *)(a1 + 32)];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SMUFocusedSheetPresentationController;
  -[SMUFocusedSheetPresentationController presentationTransitionDidEnd:](&v6, sel_presentationTransitionDidEnd_);
  if (!a3)
  {
    uint64_t v5 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
    [v5 removeFromSuperview];
  }
}

- (void)dismissalTransitionWillBegin
{
  v8.receiver = self;
  v8.super_class = (Class)SMUFocusedSheetPresentationController;
  [(SMUFocusedSheetPresentationController *)&v8 dismissalTransitionWillBegin];
  v3 = [(SMUFocusedSheetPresentationController *)self presentingViewController];
  v4 = [v3 transitionCoordinator];

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__SMUFocusedSheetPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_264DBD058;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v5 completion:0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __69__SMUFocusedSheetPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained blurredBackgroundView];
  [v1 setEffect:0];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SMUFocusedSheetPresentationController;
  -[SMUFocusedSheetPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  if (!a3)
  {
    uint64_t v5 = [(SMUFocusedSheetPresentationController *)self blurredBackgroundView];
    [v5 removeFromSuperview];
  }
}

- (UIVisualEffectView)blurredBackgroundView
{
  return self->_blurredBackgroundView;
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void)setBackgroundBlurEffect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);

  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
}

@end