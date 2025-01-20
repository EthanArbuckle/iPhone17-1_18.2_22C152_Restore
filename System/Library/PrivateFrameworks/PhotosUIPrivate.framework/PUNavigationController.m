@interface PUNavigationController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_canPerformAlternateBackKeyCommandToPopViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)_canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:(id)a3;
- (BOOL)_isNavigating;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)_shouldOptOutFromChromelessBars;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)pu_alwaysForwardsPreferredStatusBarStyle;
- (BOOL)pu_alwaysForwardsPrefersStatusBarHidden;
- (BOOL)pu_disablePushPopAnimation;
- (BOOL)pu_preventsAutorotation;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (PUAbstractNavigationBanner)_banner;
- (PUNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (PUNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUNavigationController)initWithRootViewController:(id)a3;
- (UIKeyCommand)_alternateBackKeyCommand;
- (UIViewController)_currentToolbarViewController;
- (UIViewController)viewControllerForStatusBarStyleWhenDisappearing;
- (_UINavigationControllerPalette)_palette;
- (id)_extendedToolbar;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)ppt_onDidShowViewControllerBlock;
- (int64_t)_barStyle;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)pu_supportedInterfaceOrientations;
- (unint64_t)supportedInterfaceOrientations;
- (void)_commonPUNavigationControllerInitialization;
- (void)_performAlternateBackKeyCommand:(id)a3;
- (void)_setAlternateBackKeyCommand:(id)a3;
- (void)_setBanner:(id)a3;
- (void)_setBarStyle:(int64_t)a3;
- (void)_setCurrentToolbarViewController:(id)a3;
- (void)_setCurrentToolbarViewController:(id)a3 animated:(BOOL)a4;
- (void)_setNavigating:(BOOL)a3;
- (void)_setPalette:(id)a3;
- (void)_setShouldOptOutChromelessBars:(BOOL)a3;
- (void)_updateBarStyle;
- (void)_updateChromelessBarsIsBeforeTransition:(BOOL)a3;
- (void)_updateStatusBarOverrides;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)ppt_setOnDidShowViewControllerBlock:(id)a3;
- (void)pu_navigationTransitionDidEnd:(id)a3;
- (void)pu_setAlwaysForwardsPreferredStatusBarHidden:(BOOL)a3;
- (void)pu_setAlwaysForwardsPreferredStatusBarStyle:(BOOL)a3;
- (void)pu_setDisablePushPopAnimation:(BOOL)a3;
- (void)pu_setPreventsAutorotation:(BOOL)a3;
- (void)pu_setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllerForStatusBarStyleWhenDisappearing:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewController:(id)a3 willSetupInitialBarsVisibilityOnViewWillAppearAnimated:(BOOL)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUNavigationController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__currentToolbarViewController);
  objc_storeStrong((id *)&self->__alternateBackKeyCommand, 0);
  objc_storeStrong((id *)&self->__palette, 0);
  objc_storeStrong((id *)&self->__banner, 0);
  objc_storeStrong(&self->_ppt_onDidShowViewControllerBlock, 0);
  objc_destroyWeak((id *)&self->_viewControllerForStatusBarStyleWhenDisappearing);
}

- (BOOL)pu_alwaysForwardsPrefersStatusBarHidden
{
  return self->_pu_alwaysForwardsPrefersStatusBarHidden;
}

- (BOOL)pu_alwaysForwardsPreferredStatusBarStyle
{
  return self->_pu_alwaysForwardsPreferredStatusBarStyle;
}

- (UIViewController)_currentToolbarViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);
  return (UIViewController *)WeakRetained;
}

- (int64_t)_barStyle
{
  return self->__barStyle;
}

- (BOOL)pu_disablePushPopAnimation
{
  return self->_pu_disablePushPopAnimation;
}

- (BOOL)pu_preventsAutorotation
{
  return self->_pu_preventsAutorotation;
}

- (unint64_t)pu_supportedInterfaceOrientations
{
  return self->_pu_supportedInterfaceOrientations;
}

- (void)_setNavigating:(BOOL)a3
{
  self->__navigating = a3;
}

- (BOOL)_isNavigating
{
  return self->__navigating;
}

- (void)_setAlternateBackKeyCommand:(id)a3
{
}

- (UIKeyCommand)_alternateBackKeyCommand
{
  return self->__alternateBackKeyCommand;
}

- (void)_setPalette:(id)a3
{
}

- (_UINavigationControllerPalette)_palette
{
  return self->__palette;
}

- (void)_setBanner:(id)a3
{
}

- (PUAbstractNavigationBanner)_banner
{
  return self->__banner;
}

- (void)ppt_setOnDidShowViewControllerBlock:(id)a3
{
}

- (id)ppt_onDidShowViewControllerBlock
{
  return self->_ppt_onDidShowViewControllerBlock;
}

- (void)setViewControllerForStatusBarStyleWhenDisappearing:(id)a3
{
}

- (UIViewController)viewControllerForStatusBarStyleWhenDisappearing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForStatusBarStyleWhenDisappearing);
  return (UIViewController *)WeakRetained;
}

- (void)pu_setAlwaysForwardsPreferredStatusBarHidden:(BOOL)a3
{
  if (self->_pu_alwaysForwardsPrefersStatusBarHidden != a3)
  {
    self->_pu_alwaysForwardsPrefersStatusBarHidden = a3;
    [(PUNavigationController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (void)pu_setAlwaysForwardsPreferredStatusBarStyle:(BOOL)a3
{
  if (self->_pu_alwaysForwardsPreferredStatusBarStyle != a3)
  {
    self->_pu_alwaysForwardsPreferredStatusBarStyle = a3;
    [(PUNavigationController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUNavigationController *)self viewControllers];
  v6 = [v5 firstObject];

  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v6 prepareForDismissingForced:v3])
  {
    BOOL v7 = 0;
  }
  else
  {
    [(PUNavigationController *)self dismissViewControllerAnimated:0 completion:0];
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  BOOL v3 = [a3 topViewController];
  v4 = objc_msgSend(v3, "pu_navigationTransition");
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return +[PUNavigationTransition animationControllerForOperation:a4 fromViewController:a5 toViewController:a6 inNavigationController:a3];
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  return +[PUViewControllerTransition interactionControllerForAnimationController:a4];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  [(PUNavigationController *)self ppt_notifyTransitionAnimationDidComplete];
  v6 = [(PUNavigationController *)self ppt_onDidShowViewControllerBlock];

  if (v6)
  {
    BOOL v7 = [(PUNavigationController *)self ppt_onDidShowViewControllerBlock];
    v7[2]();

    [(PUNavigationController *)self ppt_setOnDidShowViewControllerBlock:0];
  }
  [(PUNavigationController *)self _updateBarStyle];
  [(PUNavigationController *)self _updateChromelessBarsIsBeforeTransition:0];
  [(PUNavigationController *)self _setNavigating:0];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v26 = a3;
  id v8 = a4;
  [(PUNavigationController *)self _setNavigating:1];
  v9 = [v8 navigationItem];
  v10 = [(PUNavigationController *)self _banner];
  v11 = objc_msgSend(v9, "pu_banner");
  uint64_t v12 = [(PUNavigationController *)self _palette];
  v13 = (void *)v12;
  if (!v12 && v11)
  {
    [v11 height];
    uint64_t v15 = -[PUNavigationController paletteForEdge:size:](self, "paletteForEdge:size:", 2, 0.0, v14);
    [(PUNavigationController *)self attachPalette:v15 isPinned:1];
    v13 = (void *)v15;
LABEL_7:
    [(PUNavigationController *)self _setPalette:v15];
    goto LABEL_8;
  }
  if (!v11 && v12)
  {
    [(PUNavigationController *)self detachPalette:v12];
    uint64_t v15 = 0;
    goto LABEL_7;
  }
LABEL_8:
  [(PUNavigationController *)self _setBanner:v11];
  v16 = [v11 view];
  v17 = v16;
  if (v13)
  {
    if (v16)
    {
      v18 = [v16 superview];

      if (v18 != v13)
      {
        [v13 bounds];
        objc_msgSend(v17, "setFrame:");
        [v17 setAutoresizingMask:18];
        [v17 layoutSubviews];
        v19 = [v10 view];
        v20 = v19;
        if (v5) {
          double v21 = 0.3;
        }
        else {
          double v21 = 0.0;
        }
        v25 = (void *)MEMORY[0x1E4FB1EB0];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke;
        v30[3] = &unk_1E5F2E908;
        id v31 = v19;
        id v32 = v13;
        id v33 = v17;
        id v22 = v20;
        [v25 transitionWithView:v32 duration:5242880 options:v30 animations:0 completion:v21];
      }
    }
  }
  [(PUNavigationController *)self _setCurrentToolbarViewController:v8 animated:v5];
  [(PUNavigationController *)self _updateStatusBarOverrides];
  objc_initWeak(&location, self);
  v23 = [(PUNavigationController *)self transitionCoordinator];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke_2;
  v27[3] = &unk_1E5F2C068;
  objc_copyWeak(&v28, &location);
  [v23 animateAlongsideTransition:0 completion:v27];

  [(PUNavigationController *)self _updateBarStyle];
  [(PUNavigationController *)self _updateChromelessBarsIsBeforeTransition:1];
  v24 = [(PUNavigationController *)self traitCollection];
  objc_msgSend(v9, "px_updateBackButtonVisibilityForTraitCollection:", v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

uint64_t __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 addSubview:v3];
}

void __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _updateStatusBarOverrides];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUNavigationController;
  id v7 = a4;
  [(PUNavigationController *)&v14 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  id v8 = [(PUNavigationController *)self viewControllers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PUNavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E5F28AE8;
  id v12 = v8;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  [v7 animateAlongsideTransition:v11 completion:0];
}

void __84__PUNavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "navigationItem", (void)v8);
        objc_msgSend(v7, "px_updateBackButtonVisibilityForTraitCollection:", *(void *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)childViewControllerForStatusBarHidden
{
  if ([(PUNavigationController *)self pu_alwaysForwardsPrefersStatusBarHidden])
  {
    uint64_t v3 = [(PUNavigationController *)self topViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUNavigationController;
    uint64_t v3 = [(PUNavigationController *)&v5 childViewControllerForStatusBarHidden];
  }
  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  if ([(PUNavigationController *)self pu_alwaysForwardsPreferredStatusBarStyle])
  {
    uint64_t v3 = [(PUNavigationController *)self topViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUNavigationController;
    uint64_t v3 = [(PUNavigationController *)&v5 childViewControllerForStatusBarStyle];
  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v3 = [(PUNavigationController *)self transitionCoordinator];
  uint64_t v4 = [v3 viewControllerForKey:*MEMORY[0x1E4FB30B8]];

  if (v4 == self
    && ([(PUNavigationController *)self viewControllerForStatusBarStyleWhenDisappearing], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    id v5 = (id)[v6 preferredStatusBarStyle];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUNavigationController;
    id v5 = [(PUNavigationController *)&v9 preferredStatusBarStyle];
  }

  return (int64_t)v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return ([(PUNavigationController *)self supportedInterfaceOrientations] & (1 << a3)) != 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result = [(PUNavigationController *)self pu_supportedInterfaceOrientations];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)PUNavigationController;
    return [(PUNavigationController *)&v4 supportedInterfaceOrientations];
  }
  return result;
}

- (BOOL)shouldAutorotate
{
  if ([(PUNavigationController *)self pu_preventsAutorotation]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PUNavigationController;
  return [(PUNavigationController *)&v4 shouldAutorotate];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PUNavigationController;
  [(PUNavigationController *)&v5 loadView];
  uint64_t v3 = [(PUNavigationController *)self _alternateBackKeyCommand];

  if (!v3)
  {
    objc_super v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0x100000 action:sel__performAlternateBackKeyCommand_];
    [(PUNavigationController *)self addKeyCommand:v4];
    [(PUNavigationController *)self _setAlternateBackKeyCommand:v4];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__performAlternateBackKeyCommand_ != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PUNavigationController;
    unsigned __int8 v7 = [(PUNavigationController *)&v10 canPerformAction:a3 withSender:v6];
LABEL_6:
    BOOL v8 = v7;
    goto LABEL_7;
  }
  if (![(PUNavigationController *)self _canPerformAlternateBackKeyCommandToPopViewController])
  {
    unsigned __int8 v7 = [(PUNavigationController *)self _canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:v6];
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (void)_setCurrentToolbarViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);

  if (WeakRetained != v6)
  {
    id v8 = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);
    int v9 = objc_msgSend(v8, "pu_wantsToolbarVisible");

    id v10 = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);
    id v11 = objc_storeWeak((id *)&self->__currentToolbarViewController, v6);
    int v12 = objc_msgSend(v6, "pu_wantsToolbarVisible");

    uint64_t v13 = [(PUNavigationController *)self _extendedToolbar];
    objc_super v14 = objc_msgSend(v6, "pu_toolbarViewModel");
    id v15 = [v6 transitionCoordinator];
    if ([v15 isCancelled])
    {

      if ((v9 ^ 1 | v12))
      {
        id v15 = 0;
        v16 = 0;
LABEL_12:
        [v13 setToolbarViewModel:v14 withAnimatorBlock:v16];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_5;
        v18[3] = &unk_1E5F28AE8;
        v18[4] = self;
        id v19 = v10;
        [v15 animateAlongsideTransitionInView:v13 animation:0 completion:v18];

LABEL_15:
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      char v17 = v9 ^ 1;
      if ((v9 ^ 1 | v12))
      {
        v16 = 0;
        if (!v15) {
          char v17 = 1;
        }
        if ((v17 & 1) == 0 && ((v12 ^ 1) & 1) == 0 && v4)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_2;
          aBlock[3] = &unk_1E5F276F0;
          id v15 = v15;
          id v21 = v15;
          id v22 = v13;
          v16 = _Block_copy(aBlock);
        }
        goto LABEL_12;
      }
      if (v15)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke;
        v23[3] = &unk_1E5F28AE8;
        id v24 = v13;
        id v25 = v14;
        [v15 animateAlongsideTransitionInView:v24 animation:0 completion:v23];

        goto LABEL_15;
      }
    }
    [v13 setToolbarViewModel:v14 withAnimatorBlock:0];
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 setToolbarViewModel:v5 withAnimatorBlock:0];
  }
  return result;
}

void __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_3;
  v13[3] = &unk_1E5F28AC0;
  id v14 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_4;
  v11[3] = &unk_1E5F28AC0;
  id v9 = v6;
  id v10 = v5;
  [v7 animateAlongsideTransitionInView:v8 animation:v13 completion:v11];
}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _setCurrentToolbarViewController:v5];
  }
  return result;
}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 isCancelled];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_setCurrentToolbarViewController:(id)a3
{
}

- (id)_extendedToolbar
{
  id v2 = [(PUNavigationController *)self toolbar];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v2 = 0;
  }
  return v2;
}

- (void)viewController:(id)a3 willSetupInitialBarsVisibilityOnViewWillAppearAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = [(PUNavigationController *)self topViewController];

  unsigned __int8 v7 = v11;
  if (v6 == v11)
  {
    [(PUNavigationController *)self _updateBarStyle];
    [(PUNavigationController *)self _updateChromelessBarsIsBeforeTransition:1];
    char v8 = objc_msgSend(v11, "pu_wantsToolbarVisible");
    id v9 = [v11 transitionCoordinator];
    int v10 = [v9 isCancelled];

    unsigned __int8 v7 = v11;
    if ((v8 & 1) != 0 || v10)
    {
      [(PUNavigationController *)self _setCurrentToolbarViewController:v11 animated:v4];
      unsigned __int8 v7 = v11;
    }
  }
}

- (void)_performAlternateBackKeyCommand:(id)a3
{
  id v6 = a3;
  if ([(PUNavigationController *)self _canPerformAlternateBackKeyCommandToPopViewController])
  {
    id v4 = [(PUNavigationController *)self popViewControllerAnimated:1];
  }
  else if ([(PUNavigationController *)self _canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:v6])
  {
    uint64_t v5 = [(PUNavigationController *)self splitViewController];
    [v5 toggleSidebar:v6];
  }
}

- (BOOL)_canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUNavigationController *)self splitViewController];
  id v6 = v5;
  if (!v5
    || [v5 displayMode] == 2
    || [v6 displayMode] == 4
    || ![v6 canPerformAction:sel_toggleSidebar_ withSender:v4]
    || [(PUNavigationController *)self _isNavigating])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = [(PUNavigationController *)self isNavigationBarHidden] ^ 1;
  }

  return v7;
}

- (BOOL)_canPerformAlternateBackKeyCommandToPopViewController
{
  uint64_t v3 = [(PUNavigationController *)self childViewControllers];
  if ((unint64_t)[v3 count] < 2
    || [(PUNavigationController *)self _isNavigating]
    || ([(PUNavigationController *)self isNavigationBarHidden] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v6 = [(PUNavigationController *)self navigationBar];
    int v7 = [v6 topItem];
    int v4 = [v7 hidesBackButton] ^ 1;
  }
  return v4;
}

- (void)_setShouldOptOutChromelessBars:(BOOL)a3
{
  BOOL v4 = a3;
  if ([(PUNavigationController *)self _shouldOptOutFromChromelessBars] != a3)
  {
    if (v4)
    {
      uint64_t v3 = [(PUNavigationController *)self navigationBar];
      id v6 = [v3 standardAppearance];
    }
    else
    {
      id v6 = 0;
    }
    int v7 = [(PUNavigationController *)self navigationBar];
    [v7 setScrollEdgeAppearance:v6];

    if (v4)
    {

      id v10 = [(PUNavigationController *)self toolbar];
      char v8 = [v10 standardAppearance];
    }
    else
    {
      char v8 = 0;
    }
    id v9 = [(PUNavigationController *)self toolbar];
    [v9 setScrollEdgeAppearance:v8];

    if (v4)
    {
    }
  }
}

- (BOOL)_shouldOptOutFromChromelessBars
{
  id v2 = [(PUNavigationController *)self navigationBar];
  uint64_t v3 = [v2 scrollEdgeAppearance];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_updateChromelessBarsIsBeforeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(PUNavigationController *)self topViewController];
  uint64_t v5 = objc_msgSend(v7, "pu_shouldOptOutFromChromelessBars");
  BOOL v6 = v5;
  if (v3 && (v5 & 1) == 0) {
    BOOL v6 = [(PUNavigationController *)self _shouldOptOutFromChromelessBars];
  }
  [(PUNavigationController *)self _setShouldOptOutChromelessBars:v6];
}

- (void)_setBarStyle:(int64_t)a3
{
  if (self->__barStyle != a3)
  {
    self->__barStyle = a3;
    uint64_t v5 = +[PUInterfaceManager currentTheme];
    id v8 = [v5 tintColorForBarStyle:a3];

    BOOL v6 = [(PUNavigationController *)self navigationBar];
    [v6 setBarStyle:a3];
    [v6 setTintColor:v8];
    id v7 = [(PUNavigationController *)self toolbar];
    [v7 setBarStyle:a3];
    [v7 setTintColor:v8];
  }
}

- (void)_updateBarStyle
{
  id v3 = [(PUNavigationController *)self topViewController];
  -[PUNavigationController _setBarStyle:](self, "_setBarStyle:", objc_msgSend(v3, "pu_preferredBarStyle"));
}

- (void)_updateStatusBarOverrides
{
  id v3 = [(PUNavigationController *)self topViewController];
  -[PUNavigationController pu_setAlwaysForwardsPreferredStatusBarStyle:](self, "pu_setAlwaysForwardsPreferredStatusBarStyle:", objc_msgSend(v3, "px_determinesPreferredStatusBarStyle"));
  -[PUNavigationController pu_setAlwaysForwardsPreferredStatusBarHidden:](self, "pu_setAlwaysForwardsPreferredStatusBarHidden:", objc_msgSend(v3, "px_determinesPreferredStatusBarHidden"));
}

- (void)pu_navigationTransitionDidEnd:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUNavigationController;
  [(UINavigationController *)&v4 pu_navigationTransitionDidEnd:a3];
  [(PUNavigationController *)self _updateBarStyle];
  [(PUNavigationController *)self _updateChromelessBarsIsBeforeTransition:0];
}

- (void)pu_setDisablePushPopAnimation:(BOOL)a3
{
  self->_pu_disablePushPopAnimation = a3;
}

- (void)pu_setPreventsAutorotation:(BOOL)a3
{
  self->_pu_preventsAutorotation = a3;
}

- (void)pu_setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_pu_supportedInterfaceOrientations = a3;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUNavigationController;
  [(PUNavigationController *)&v7 setViewControllers:v6 animated:v4 & ~[(PUNavigationController *)self pu_disablePushPopAnimation]];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUNavigationController;
  id v3 = [(PUNavigationController *)&v5 popViewControllerAnimated:a3 & ~[(PUNavigationController *)self pu_disablePushPopAnimation]];
  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v4 & ~[(PUNavigationController *)self pu_disablePushPopAnimation];
  if ((PUNavigationControllerPushingWithTransition & 1) != 0
    || (int v8 = PURequestedNavigationTransitionIsInteractive,
        (id v9 = (id)PURequestedNavigationTransition) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)PUNavigationController;
    [(PUNavigationController *)&v11 pushViewController:v6 animated:v7];
  }
  else
  {
    id v10 = v9;
    PUNavigationControllerPushingWithTransition = 1;
    [(UINavigationController *)self pu_pushViewController:v6 withTransition:v9 animated:v7 isInteractive:v8 != 0];
    PUNavigationControllerPushingWithTransition = 0;
  }
}

- (void)_commonPUNavigationControllerInitialization
{
  uint64_t v3 = [(PUNavigationController *)self _toolbarClass];
  if (!v3 || v3 == objc_opt_class()) {
    [(PUNavigationController *)self _setToolbarClass:objc_opt_class()];
  }
  [(PUNavigationController *)self setDelegate:self];
}

- (PUNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUNavigationController;
  BOOL v4 = [(PUNavigationController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(PUNavigationController *)v4 _commonPUNavigationControllerInitialization];
  }
  return v5;
}

- (PUNavigationController)initWithRootViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUNavigationController;
  uint64_t v3 = [(PUNavigationController *)&v6 initWithRootViewController:a3];
  BOOL v4 = v3;
  if (v3) {
    [(PUNavigationController *)v3 _commonPUNavigationControllerInitialization];
  }
  return v4;
}

- (PUNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUNavigationController;
  BOOL v4 = [(PUNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
  objc_super v5 = v4;
  if (v4) {
    [(PUNavigationController *)v4 _commonPUNavigationControllerInitialization];
  }
  return v5;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

@end