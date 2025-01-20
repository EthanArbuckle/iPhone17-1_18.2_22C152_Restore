@interface SBUISystemApertureElementSourceContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (SBUISystemApertureElement)elementViewController;
- (id)_transitionCoordinator;
- (void)setElementViewController:(id)a3;
@end

@implementation SBUISystemApertureElementSourceContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setElementViewController:(id)a3
{
  v4 = (SBUISystemApertureElement *)a3;
  v5 = v4;
  if (self->_elementViewController != v4)
  {
    v6 = (void *)MEMORY[0x1E4F42FF0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__SBUISystemApertureElementSourceContainerViewController_setElementViewController___block_invoke;
    v7[3] = &unk_1E5CCC878;
    v7[4] = self;
    v8 = v4;
    [v6 performWithoutAnimation:v7];
  }
}

void __83__SBUISystemApertureElementSourceContainerViewController_setElementViewController___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) willMoveToParentViewController:0];
  v2 = [*(id *)(*(void *)(a1 + 32) + 976) view];
  [v2 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 976) removeFromParentViewController];
  v3 = [*(id *)(a1 + 40) parentViewController];

  if (v3)
  {
    [*(id *)(a1 + 40) willMoveToParentViewController:0];
    v4 = [*(id *)(a1 + 40) view];
    [v4 removeFromSuperview];

    [*(id *)(a1 + 40) removeFromParentViewController];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 976), *(id *)(a1 + 40));
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:");
    v5 = [*(id *)(a1 + 32) view];
    v6 = [*(id *)(a1 + 40) view];
    [v5 addSubview:v6];

    uint64_t v8 = *(void *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    [v7 didMoveToParentViewController:v8];
  }
}

- (id)_transitionCoordinator
{
  v3 = [(UIViewController *)self systemApertureElementContext];
  v4 = [v3 transitionContext];
  v5 = [v4 transitionCoordinator];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBUISystemApertureElementSourceContainerViewController;
    id v7 = [(SBUISystemApertureElementSourceContainerViewController *)&v10 _transitionCoordinator];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (SBUISystemApertureElement)elementViewController
{
  return self->_elementViewController;
}

- (void).cxx_destruct
{
}

@end