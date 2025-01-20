@interface SBControlCenterModuleTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldBlurBackground;
- (BOOL)handleHomeButtonPress;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableOrientationUpdates;
- (CCSModulePresentationOptions)presentationOptions;
- (SBControlCenterModuleTransientOverlayViewController)init;
- (SBControlCenterModuleTransientOverlayViewController)initWithCoder:(id)a3;
- (SBControlCenterModuleTransientOverlayViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4;
- (SBControlCenterModuleTransientOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBControlCenterModuleTransientOverlayViewControllerDelegate)delegate;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateTransitionFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 isAnimated:(BOOL)a6 otherAnimations:(id)a7 completion:(id)a8;
- (void)_dismiss;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBControlCenterModuleTransientOverlayViewController

- (SBControlCenterModuleTransientOverlayViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBControlCenterModuleTransientOverlayViewController.m", 44, @"Invalid parameter not satisfying: %@", @"moduleIdentifier" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)SBControlCenterModuleTransientOverlayViewController;
  v9 = [(SBTransientOverlayViewController *)&v19 initWithNibName:0 bundle:0];
  if (v9)
  {
    v10 = +[SBControlCenterController sharedInstance];
    v11 = [v10 viewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    v13 = (objc_class *)MEMORY[0x1E4F5AD30];
    id v14 = v12;
    uint64_t v15 = [[v13 alloc] initWithModuleIdentifier:v7 presentationOptions:v8 mainViewController:v14];

    moduleOverlayViewController = v9->_moduleOverlayViewController;
    v9->_moduleOverlayViewController = (CCUIModuleAlertViewController *)v15;

    [(CCUIModuleAlertViewController *)v9->_moduleOverlayViewController setDelegate:v9];
  }

  return v9;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 1;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 1;
}

- (SBControlCenterModuleTransientOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithModuleIdentifier_presentationOptions_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBControlCenterModuleTransientOverlayViewController.m", 68, @"%s is unavailable; use %@ instead",
    "-[SBControlCenterModuleTransientOverlayViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (SBControlCenterModuleTransientOverlayViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithModuleIdentifier_presentationOptions_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBControlCenterModuleTransientOverlayViewController.m", 72, @"%s is unavailable; use %@ instead",
    "-[SBControlCenterModuleTransientOverlayViewController initWithCoder:]",
    v6);

  return 0;
}

- (SBControlCenterModuleTransientOverlayViewController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithModuleIdentifier_presentationOptions_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBControlCenterModuleTransientOverlayViewController.m", 76, @"%s is unavailable; use %@ instead",
    "-[SBControlCenterModuleTransientOverlayViewController init]",
    v5);

  return 0;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBControlCenterModuleTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidLoad];
  v3 = [(SBTransientOverlayViewController *)self contentView];
  [(SBControlCenterModuleTransientOverlayViewController *)self bs_addChildViewController:self->_moduleOverlayViewController withSuperview:v3];
  v4 = [(CCUIModuleAlertViewController *)self->_moduleOverlayViewController view];
  [v4 setAutoresizingMask:18];
  [v4 setHidden:1];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setNeedsLayout];
  [v4 layoutIfNeeded];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_dismiss
{
  id v3 = [(SBControlCenterModuleTransientOverlayViewController *)self delegate];
  [v3 controlCenterModuleTransientOverlayViewControllerNeedsDismissal:self];
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return [(id)SBApp activeInterfaceOrientation];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (CCSModulePresentationOptions)presentationOptions
{
  return (CCSModulePresentationOptions *)[(CCUIModuleAlertViewController *)self->_moduleOverlayViewController presentationOptions];
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (BOOL)shouldDisableOrientationUpdates
{
  return 1;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  BOOL v3 = [(SBControlCenterModuleTransientOverlayViewController *)self _shouldBlurBackground];
  v4 = [(CCUIModuleAlertViewController *)self->_moduleOverlayViewController view];
  objc_super v5 = [(SBTransientOverlayViewController *)self contentView];
  v6 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v10[3] = &unk_1E6AFEF60;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  BOOL v13 = v3;
  id v7 = v4;
  id v8 = v5;
  [(SBTransientOverlayBlockTransitionCoordinator *)v6 setStartTransitionHandler:v10];

  return v6;
}

void __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = v4[175];
  uint64_t v7 = [v3 isAnimated];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
  v13[3] = &unk_1E6AF5B18;
  id v8 = *(id *)(a1 + 48);
  char v17 = *(unsigned char *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
  v11[3] = &unk_1E6AF5350;
  id v12 = v16;
  id v10 = v16;
  [v4 _animateTransitionFromViewController:v4 toViewController:v6 containerView:v5 isAnimated:v7 otherAnimations:v13 completion:v11];
}

uint64_t __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(*(void *)(a1 + 40) + 1400) setBackgroundViewWeighting:1.0];
  }
  v2 = *(void **)(a1 + 48);
  return [v2 performAlongsideTransitions];
}

uint64_t __107__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  BOOL v3 = [(SBControlCenterModuleTransientOverlayViewController *)self _shouldBlurBackground];
  v4 = [(CCUIModuleAlertViewController *)self->_moduleOverlayViewController view];
  uint64_t v5 = [(SBTransientOverlayViewController *)self contentView];
  uint64_t v6 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v10[3] = &unk_1E6AFEF60;
  v10[4] = self;
  id v11 = v5;
  BOOL v13 = v3;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [(SBTransientOverlayBlockTransitionCoordinator *)v6 setStartTransitionHandler:v10];

  return v6;
}

void __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = v4[175];
  uint64_t v7 = [v3 isAnimated];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v12[3] = &unk_1E6AF5770;
  char v14 = *(unsigned char *)(a1 + 56);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
  v9[3] = &unk_1E6AF4A98;
  id v10 = *(id *)(a1 + 48);
  id v11 = v13;
  id v8 = v13;
  [v4 _animateTransitionFromViewController:v6 toViewController:v4 containerView:v5 isAnimated:v7 otherAnimations:v12 completion:v9];
}

uint64_t __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 1400) setBackgroundViewWeighting:0.0];
  }
  v2 = *(void **)(a1 + 40);
  return [v2 performAlongsideTransitions];
}

uint64_t __104__SBControlCenterModuleTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  v2 = *(void **)(a1 + 40);
  return [v2 completeTransition:1];
}

- (BOOL)handleHomeButtonPress
{
  moduleOverlayViewController = self->_moduleOverlayViewController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SBControlCenterModuleTransientOverlayViewController_handleHomeButtonPress__block_invoke;
  v4[3] = &unk_1E6AF5350;
  v4[4] = self;
  [(CCUIModuleAlertViewController *)moduleOverlayViewController dismissModulePresentedContentAnimated:1 completion:v4];
  return 1;
}

uint64_t __76__SBControlCenterModuleTransientOverlayViewController_handleHomeButtonPress__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _dismiss];
  }
  return result;
}

- (BOOL)_shouldBlurBackground
{
  v2 = [(SBControlCenterModuleTransientOverlayViewController *)self presentationOptions];
  char v3 = [v2 blurBackground];

  return v3;
}

- (void)_animateTransitionFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 isAnimated:(BOOL)a6 otherAnimations:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v12 = (CCUIModuleAlertViewController *)a4;
  id v13 = (void (**)(void))a7;
  id v14 = a8;
  moduleOverlayViewController = self->_moduleOverlayViewController;
  id v16 = [(CCUIModuleAlertViewController *)moduleOverlayViewController moduleAlertView];
  memset(&v32, 0, sizeof(v32));
  BOOL v17 = moduleOverlayViewController == v12;
  if (moduleOverlayViewController == v12)
  {
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v32.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v32.c = v18;
    *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v32, 0.8, 0.8);
  }
  objc_super v19 = (void *)MEMORY[0x1E4F42FF0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke;
  v29[3] = &unk_1E6AF5D38;
  id v20 = v16;
  id v30 = v20;
  BOOL v31 = v17;
  [v19 performWithoutAnimation:v29];
  if (v10)
  {
    v21 = (void *)MEMORY[0x1E4F42FF0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_2;
    v24[3] = &unk_1E6AFEF88;
    id v25 = v20;
    BOOL v28 = v17;
    CGAffineTransform v27 = v32;
    v26 = v13;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_3;
    v22[3] = &unk_1E6AFA3D8;
    id v23 = v14;
    [v21 _animateUsingSpringWithTension:0 friction:v24 interactive:v22 animations:500.0 completion:30.0];
  }
  else
  {
    if (v13) {
      v13[2](v13);
    }
    if (v14) {
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    }
  }
}

uint64_t __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v7, 0.8, 0.8);
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v5;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  return [v4 setTransform:&v7];
}

uint64_t __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 96)) {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 80);
  [v4 setTransform:v7];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __161__SBControlCenterModuleTransientOverlayViewController__animateTransitionFromViewController_toViewController_containerView_isAnimated_otherAnimations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (SBControlCenterModuleTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBControlCenterModuleTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moduleOverlayViewController, 0);
}

@end