@interface SBDismissOverlaysAnimationController
+ (BOOL)willDismissOverlaysForDismissOptions:(unint64_t)a3;
+ (unint64_t)_overlaysToDismissForOptions:(unint64_t)a3;
- (BOOL)_canBeInterrupted;
- (SBDismissOverlaysAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBDismissOverlaysAnimationController)initWithTransitionContextProvider:(id)a3 options:(unint64_t)a4;
- (id)animationSettings;
- (unint64_t)dismissOptions;
- (void)_startAnimation;
@end

@implementation SBDismissOverlaysAnimationController

+ (BOOL)willDismissOverlaysForDismissOptions:(unint64_t)a3
{
  return [a1 _overlaysToDismissForOptions:a3] != 0;
}

+ (unint64_t)_overlaysToDismissForOptions:(unint64_t)a3
{
  char v3 = a3;
  v4 = +[SBIconController sharedInstance];
  v5 = [v4 iconManager];
  if (v3)
  {
    v7 = +[SBControlCenterController sharedInstanceIfExists];
    unsigned int v8 = [v7 isPresented];

    unint64_t v6 = v8;
    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
  }
  if ([v4 areAnyIconViewContextMenusShowing]) {
    v6 |= 2uLL;
  }
LABEL_7:
  if ((v3 & 4) != 0)
  {
    if ([v5 areAnyIconShareSheetsShowing]) {
      v6 |= 4uLL;
    }
    if ((v3 & 8) == 0)
    {
LABEL_9:
      if ((v3 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_9;
  }
  if (+[SBAssistantController isVisible]) {
    v6 |= 8uLL;
  }
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_23:
  v15 = +[SBCommandTabController sharedInstance];
  int v16 = [v15 isVisible];

  if (v16) {
    v6 |= 0x10uLL;
  }
  if ((v3 & 0x20) != 0)
  {
LABEL_11:
    v9 = [(id)SBApp bannerManager];
    int v10 = [v9 isDisplayingBannerInAnyWindowScene];

    if (v10) {
      v6 |= 0x20uLL;
    }
  }
LABEL_13:
  v11 = [v4 homeScreenViewController];
  v12 = v11;
  if ((v3 & 0x40) != 0)
  {
    v13 = [v11 presentedViewController];

    if (v13) {
      v6 |= 0x40uLL;
    }
  }

  return v6;
}

- (SBDismissOverlaysAnimationController)initWithTransitionContextProvider:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F28B00];
  id v6 = a3;
  v7 = [v5 currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"SBDismissOverlaysAnimationController.m" lineNumber:39 description:@"Unsupported initializer"];

  unsigned int v8 = [(SBDismissOverlaysAnimationController *)self initWithTransitionContextProvider:v6 options:-1];
  return v8;
}

- (SBDismissOverlaysAnimationController)initWithTransitionContextProvider:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDismissOverlaysAnimationController;
  unsigned int v8 = [(SBUIAnimationController *)&v11 initWithTransitionContextProvider:v7];
  v9 = v8;
  if (v8)
  {
    v8->_dismissOptions = a4;
    objc_storeStrong((id *)&v8->_transitionRequest, a3);
  }

  return v9;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_startAnimation
{
  uint64_t v3 = [(id)objc_opt_class() _overlaysToDismissForOptions:self->_dismissOptions];
  v4 = [(id)SBApp windowSceneManager];
  v5 = [(SBWorkspaceTransitionRequest *)self->_transitionRequest displayIdentity];
  id v6 = [v4 windowSceneForDisplayIdentity:v5];

  objc_initWeak(location, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke;
  v33[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v34, location);
  id v7 = (void (**)(void))MEMORY[0x1D948C7A0](v33);
  if ((v3 & 0x10) != 0)
  {
    unsigned int v8 = +[SBCommandTabController sharedInstance];
    [v8 dismiss];
  }
  if ((v3 & 0xFFFFFFFFFFFFFFEFLL) != 0)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_2;
    v31[3] = &unk_1E6AF56B0;
    v31[4] = v32;
    v9 = (void (**)(void))MEMORY[0x1D948C7A0](v31);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_3;
    v28[3] = &unk_1E6AFD800;
    v30 = v32;
    v29 = v7;
    int v10 = (void (**)(void))MEMORY[0x1D948C7A0](v28);
    v9[2](v9);
    if (v3)
    {
      v9[2](v9);
      [(SBDismissOverlaysAnimationController *)self addMilestone:@"Control Center Dismissal Milestone"];
      objc_super v11 = +[SBControlCenterController sharedInstance];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_4;
      v25[3] = &unk_1E6AF8068;
      objc_copyWeak(&v27, location);
      v26 = v10;
      [v11 dismissAnimated:1 completion:v25];

      objc_destroyWeak(&v27);
    }
    if ((v3 & 2) != 0)
    {
      v9[2](v9);
      [(SBDismissOverlaysAnimationController *)self addMilestone:@"App Icon Force Touch Dismissal Milestone"];
      v12 = +[SBIconController sharedInstance];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_5;
      v22[3] = &unk_1E6AF8068;
      objc_copyWeak(&v24, location);
      v23 = v10;
      [v12 dismissAppIconForceTouchControllers:v22];

      objc_destroyWeak(&v24);
    }
    if ((v3 & 4) != 0)
    {
      v9[2](v9);
      [(SBDismissOverlaysAnimationController *)self addMilestone:@"App Icon Share Sheet Dismissal Milestone"];
      v13 = +[SBIconController sharedInstance];
      v14 = [v13 iconManager];

      [v14 dismissIconShareSheets];
      [(SBDismissOverlaysAnimationController *)self removeMilestone:@"App Icon Share Sheet Dismissal Milestone"];
      v10[2](v10);
    }
    if ((v3 & 8) != 0)
    {
      v9[2](v9);
      [(SBDismissOverlaysAnimationController *)self addMilestone:@"Assistant Dismissal Milestone"];
      v15 = [v6 assistantController];
      [v15 dismissAssistantViewIfNecessaryWithAnimation:1];

      [(SBDismissOverlaysAnimationController *)self removeMilestone:@"Assistant Dismissal Milestone"];
      v10[2](v10);
    }
    if ((v3 & 0x20) != 0)
    {
      v9[2](v9);
      [(SBDismissOverlaysAnimationController *)self addMilestone:@"Banner Dismissal Milestone"];
      int v16 = [(id)SBApp bannerManager];
      [v16 dismissAllBannersInWindowScene:v6 animated:1 reason:@"dismissOverlays"];

      [(SBDismissOverlaysAnimationController *)self removeMilestone:@"Banner Dismissal Milestone"];
      v10[2](v10);
    }
    if ((v3 & 0x40) != 0)
    {
      v9[2](v9);
      [(SBDismissOverlaysAnimationController *)self addMilestone:@"Presented View Controller Dismissal Milestone"];
      v17 = +[SBIconController sharedInstance];
      v18 = [v17 homeScreenViewController];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_6;
      v19[3] = &unk_1E6AF8068;
      objc_copyWeak(&v21, location);
      v20 = v10;
      [v18 dismissViewControllerAnimated:1 completion:v19];

      objc_destroyWeak(&v21);
    }
    v10[2](v10);

    _Block_object_dispose(v32, 8);
  }
  else
  {
    v7[2](v7);
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(location);
}

void __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteAnimationDidFinish];
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_3(uint64_t result)
{
  if (!--*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeMilestone:@"Control Center Dismissal Milestone"];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeMilestone:@"App Icon Force Touch Dismissal Milestone"];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeMilestone:@"Presented View Controller Dismissal Milestone"];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (id)animationSettings
{
  char v2 = [(id)objc_opt_class() _overlaysToDismissForOptions:self->_dismissOptions];
  double v3 = fmax(*(double *)&kSBAssistantDefaultAnimationDuration, 0.0);
  if ((v2 & 8) == 0) {
    double v3 = 0.0;
  }
  double v4 = 0.375;
  if (v3 >= 0.375) {
    double v4 = v3;
  }
  if ((v2 & 0x20) != 0) {
    double v5 = v4;
  }
  else {
    double v5 = v3;
  }
  if (BSFloatGreaterThanFloat())
  {
    id v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unint64_t)dismissOptions
{
  return self->_dismissOptions;
}

- (void).cxx_destruct
{
}

@end