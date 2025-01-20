@interface SBFolderPresentingViewController
- (BOOL)_canShowWhileLocked;
- (SBFolderContainerView)view;
- (SBFolderController)presentedFolderController;
- (SBFolderPresentingViewControllerDelegate)folderPresentationDelegate;
- (UIViewControllerAnimatedTransitioning)currentFolderAnimator;
- (double)minimumHomeScreenScaleForFolderControllerBackgroundView:(id)a3;
- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6;
- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4;
- (unint64_t)backgroundEffect;
- (void)dismissPresentedFolderControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6;
- (void)presentFolderController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setBackgroundEffect:(unint64_t)a3;
- (void)setCurrentFolderAnimator:(id)a3;
- (void)setFolderPresentationDelegate:(id)a3;
@end

@implementation SBFolderPresentingViewController

- (SBFolderContainerView)view
{
  v4.receiver = self;
  v4.super_class = (Class)SBFolderPresentingViewController;
  v2 = [(SBFolderPresentingViewController *)&v4 view];
  return (SBFolderContainerView *)v2;
}

- (void)loadView
{
  v3 = [[SBFolderContainerView alloc] initWithFolderView:0];
  [(SBFolderPresentingViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SBFolderController)presentedFolderController
{
  v3 = [(SBNestingViewController *)self nestedViewController];
  if (!v3)
  {
    v3 = [(SBFolderPresentingViewController *)self presentedViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (SBFolderController *)v4;
}

- (void)presentFolderController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  v8 = (void (**)(id, void))a5;
  v9 = [(SBFolderPresentingViewController *)self presentedFolderController];
  if (v9)
  {
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    [(SBNestingViewController *)self pushNestedViewController:v10 animated:v6 withCompletion:v8];
  }
}

- (void)dismissPresentedFolderControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E6AB50D8;
  aBlock[4] = self;
  BOOL v16 = a3;
  id v7 = v6;
  id v15 = v7;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (a3)
  {
    id v10 = +[SBHIconViewContextMenuStateController sharedInstance];
    [v10 dismissAppIconForceTouchControllers:v9];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke_2;
    v12[3] = &unk_1E6AAD4C8;
    id v13 = v8;
    [v11 performWithoutAnimation:v12];
    id v10 = v13;
  }
}

void __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentedFolderController];
  if (v2)
  {
    id v4 = v2;
    [*(id *)(a1 + 32) popNestedViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      goto LABEL_6;
    }
    id v4 = 0;
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  v2 = v4;
LABEL_6:
}

void __88__SBFolderPresentingViewController_dismissPresentedFolderControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v2 = +[SBHIconViewContextMenuStateController sharedInstance];
  [v2 dismissAppIconForceTouchControllers:*(void *)(a1 + 32)];
}

- (void)setBackgroundEffect:(unint64_t)a3
{
  if ([(SBFolderPresentingViewController *)self backgroundEffect] != a3)
  {
    self->_backgroundEffect = a3;
    if ([(SBFolderPresentingViewController *)self isViewLoaded])
    {
      v5 = [(SBFolderPresentingViewController *)self view];
      id v6 = [v5 backgroundView];

      [v6 setEffect:a3];
    }
  }
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if (v12)
    {
      id v13 = [(SBFolderPresentingViewController *)self folderPresentationDelegate];
      if (objc_opt_respondsToSelector())
      {
        v14 = [v13 folderPresentationController:self animationControllerForTransitionWithFolder:v12 presenting:a4 == 1 animated:v6];
        [(SBFolderPresentingViewController *)self setCurrentFolderAnimator:v14];

        goto LABEL_8;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)SBFolderPresentingViewController;
  v14 = [(SBNestingViewController *)&v16 nestingViewController:v10 animationControllerForOperation:a4 onViewController:v11 animated:v6];
LABEL_8:

  return v14;
}

- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderPresentingViewController *)self currentFolderAnimator];

  if (v8 == v7)
  {
    v9 = [(SBFolderPresentingViewController *)self folderPresentationDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v9 folderPresentationController:self interactionControllerForAnimationController:v7];

      goto LABEL_6;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SBFolderPresentingViewController;
  id v10 = [(SBNestingViewController *)&v12 nestingViewController:v6 interactionControllerForAnimationController:v7];
LABEL_6:

  return v10;
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  id v10 = (SBFolderPresentingViewController *)a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 == self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v11;
      v14 = [(SBFolderPresentingViewController *)v10 folderPresentationDelegate];
      id v15 = [(SBFolderPresentingViewController *)v10 view];
      objc_super v16 = [v15 backgroundView];

      v25 = v13;
      if (a4 == 1)
      {
        if (v16) {
          [v16 removeFromSuperview];
        }
        v17 = [SBFolderControllerBackgroundView alloc];
        v18 = [(SBFolderPresentingViewController *)v10 view];
        [v18 bounds];
        v19 = -[SBFolderControllerBackgroundView initWithFrame:](v17, "initWithFrame:");

        [(SBFolderControllerBackgroundView *)v19 setDelegate:v10];
        [(SBFolderControllerBackgroundView *)v19 setEffect:[(SBFolderPresentingViewController *)v10 backgroundEffect]];
        v20 = [(SBFolderPresentingViewController *)v10 view];
        [v20 setBackgroundView:v19];

        v21 = [(SBFolderPresentingViewController *)v10 view];
        [v21 addSubview:v19];

        v22 = [(SBFolderPresentingViewController *)v10 view];
        v23 = [v25 folderContainerView];
        [v22 setChildFolderContainerView:v23];

        objc_super v16 = v19;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
      v30[3] = &unk_1E6AB1330;
      id v31 = v16;
      BOOL v32 = a4 == 1;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
      v27[3] = &unk_1E6AB1380;
      BOOL v29 = a4 == 1;
      v27[4] = v10;
      id v24 = v31;
      id v28 = v24;
      [v12 animateAlongsideTransition:v30 completion:v27];
      [v24 setExpanding:a4 == 1];
      if (objc_opt_respondsToSelector()) {
        [v14 folderPresentationController:v10 willPerformTransitionWithFolder:v25 presenting:a4 == 1 withTransitionCoordinator:v12];
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)SBFolderPresentingViewController;
  -[SBNestingViewController nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:](&v26, sel_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator_, v10, a4, v11, v12, v25);
}

void __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 isInteractive] & 1) == 0)
  {
    int v3 = [v7 isCancelled];
    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 setTransitionCancelled:1];
      v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(unsigned char *)(a1 + 40) == 0;
    }
    else
    {
      [v4 setTransitionCancelled:0];
      v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
    }
    [v5 setEffectActive:v6];
  }
}

uint64_t __122__SBFolderPresentingViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  if ((([a2 isCancelled] ^ (*(unsigned char *)(a1 + 48) != 0)) & 1) == 0)
  {
    int v3 = [*(id *)(a1 + 32) view];
    [v3 setChildFolderContainerView:0];

    [*(id *)(a1 + 40) removeFromSuperview];
    id v4 = [*(id *)(a1 + 32) view];
    [v4 setBackgroundView:0];
  }
  v5 = *(void **)(a1 + 32);
  return [v5 setCurrentFolderAnimator:0];
}

- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBFolderPresentingViewController *)self folderPresentationDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 folderPresentationController:self sourceViewForPresentingViewController:v5];
  }
  else {
  id v7 = [(SBFolderPresentingViewController *)self view];
  }

  return v7;
}

- (double)minimumHomeScreenScaleForFolderControllerBackgroundView:(id)a3
{
  id v4 = [(SBFolderPresentingViewController *)self folderPresentationDelegate];
  double v5 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 minimumHomeScreenScaleForFolderPresentationController:self];
    double v5 = v6;
  }

  return v5;
}

- (SBFolderPresentingViewControllerDelegate)folderPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderPresentationDelegate);
  return (SBFolderPresentingViewControllerDelegate *)WeakRetained;
}

- (void)setFolderPresentationDelegate:(id)a3
{
}

- (unint64_t)backgroundEffect
{
  return self->_backgroundEffect;
}

- (UIViewControllerAnimatedTransitioning)currentFolderAnimator
{
  return self->_currentFolderAnimator;
}

- (void)setCurrentFolderAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFolderAnimator, 0);
  objc_destroyWeak((id *)&self->_folderPresentationDelegate);
}

@end