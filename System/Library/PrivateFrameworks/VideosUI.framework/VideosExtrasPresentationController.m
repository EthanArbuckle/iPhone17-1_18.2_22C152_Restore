@interface VideosExtrasPresentationController
- (CGRect)extrasMenuBarFrame;
- (UIView)extrasMenuBarView;
- (VideosExtrasPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 extrasMenuBarView:(id)a5 extrasmenuBarFrame:(CGRect)a6;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setExtrasMenuBarFrame:(CGRect)a3;
- (void)setExtrasMenuBarView:(id)a3;
@end

@implementation VideosExtrasPresentationController

- (VideosExtrasPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 extrasMenuBarView:(id)a5 extrasmenuBarFrame:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VideosExtrasPresentationController;
  v15 = [(VideosExtrasPresentationController *)&v18 initWithPresentedViewController:a3 presentingViewController:a4];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_extrasMenuBarView, a5);
    v16->_extrasMenuBarFrame.origin.CGFloat x = x;
    v16->_extrasMenuBarFrame.origin.CGFloat y = y;
    v16->_extrasMenuBarFrame.size.CGFloat width = width;
    v16->_extrasMenuBarFrame.size.CGFloat height = height;
  }

  return v16;
}

- (void)presentationTransitionWillBegin
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v3 = [(VideosExtrasPresentationController *)self extrasMenuBarView];

  if (v3)
  {
    v4 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
    [v4 setAlpha:0.0];

    v5 = [(VideosExtrasPresentationController *)self containerView];
    v6 = [(VideosExtrasPresentationController *)self presentedViewController];
    v7 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
    [(VideosExtrasPresentationController *)self extrasMenuBarFrame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(v7, "setFrame:");
    [v5 addSubview:v7];
    [v5 bringSubviewToFront:v7];
    id v14 = [v7 heightAnchor];
    v15 = [v14 constraintEqualToConstant:v13];

    v16 = [v7 bottomAnchor];
    v17 = [v5 topAnchor];
    objc_super v18 = [v16 constraintEqualToAnchor:v17 constant:v9 + v13];

    v19 = [v7 centerXAnchor];
    v20 = [v5 centerXAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];

    v22 = [v7 widthAnchor];
    v23 = [v22 constraintEqualToConstant:v11];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v33[0] = v21;
    v33[1] = v23;
    v33[2] = v15;
    v33[3] = v18;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v24 activateConstraints:v25];

    v26 = [v6 transitionCoordinator];

    if (v26)
    {
      objc_initWeak(&location, self);
      v27 = [v6 transitionCoordinator];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__VideosExtrasPresentationController_presentationTransitionWillBegin__block_invoke;
      v29[3] = &unk_1E6DF7028;
      objc_copyWeak(&v31, &location);
      id v30 = v5;
      [v27 animateAlongsideTransition:v29 completion:&__block_literal_global_142];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      v28 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
      [v28 setAlpha:1.0];
    }
  }
}

void __69__VideosExtrasPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained extrasMenuBarView];

  [v3 setAlpha:1.0];
  [*(id *)(a1 + 32) bringSubviewToFront:v3];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v4 = [(VideosExtrasPresentationController *)self extrasMenuBarView];

  if (v4)
  {
    id v5 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
    [v5 removeFromSuperview];
  }
}

- (void)dismissalTransitionWillBegin
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(VideosExtrasPresentationController *)self extrasMenuBarView];

  if (v3)
  {
    v4 = [(VideosExtrasPresentationController *)self containerView];
    id v5 = [(VideosExtrasPresentationController *)self presentedViewController];
    v6 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
    [(VideosExtrasPresentationController *)self extrasMenuBarFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    objc_msgSend(v6, "setFrame:");
    [v4 addSubview:v6];
    [v4 bringSubviewToFront:v6];
    double v13 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
    [v13 setAlpha:1.0];

    id v14 = [v6 heightAnchor];
    v15 = [v14 constraintEqualToConstant:v12];

    v16 = [v6 bottomAnchor];
    v17 = [v4 topAnchor];
    objc_super v18 = [v16 constraintEqualToAnchor:v17 constant:v8 + v12];

    v19 = [v6 centerXAnchor];
    v20 = [v4 centerXAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];

    v22 = [v6 widthAnchor];
    v23 = [v22 constraintEqualToConstant:v10];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v33[0] = v21;
    v33[1] = v23;
    v33[2] = v15;
    v33[3] = v18;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v24 activateConstraints:v25];

    v26 = [v5 transitionCoordinator];

    if (v26)
    {
      objc_initWeak(&location, self);
      v27 = [v5 transitionCoordinator];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __66__VideosExtrasPresentationController_dismissalTransitionWillBegin__block_invoke;
      v29[3] = &unk_1E6DF7028;
      objc_copyWeak(&v31, &location);
      id v30 = v4;
      [v27 animateAlongsideTransition:v29 completion:0];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      v28 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
      [v28 setAlpha:0.0];
    }
  }
}

void __66__VideosExtrasPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained extrasMenuBarView];

  [v3 setAlpha:0.0];
  [*(id *)(a1 + 32) bringSubviewToFront:v3];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v4 = [(VideosExtrasPresentationController *)self extrasMenuBarView];

  if (v4)
  {
    id v5 = [(VideosExtrasPresentationController *)self extrasMenuBarView];
    [v5 removeFromSuperview];
  }
}

- (UIView)extrasMenuBarView
{
  return self->_extrasMenuBarView;
}

- (void)setExtrasMenuBarView:(id)a3
{
}

- (CGRect)extrasMenuBarFrame
{
  double x = self->_extrasMenuBarFrame.origin.x;
  double y = self->_extrasMenuBarFrame.origin.y;
  double width = self->_extrasMenuBarFrame.size.width;
  double height = self->_extrasMenuBarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExtrasMenuBarFrame:(CGRect)a3
{
  self->_extrasMenuBarFrame = a3;
}

- (void).cxx_destruct
{
}

@end