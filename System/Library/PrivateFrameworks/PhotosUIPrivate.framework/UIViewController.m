@interface UIViewController
@end

@implementation UIViewController

void __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_2;
  block[3] = &unk_1E5F2EBA0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_3;
  block[3] = &unk_1E5F2EBA0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__UIViewController_CustomTransitions__pu_dismissViewControllerAnimated_interactive_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) transitionContext];
  char v3 = [v2 transitionWasCancelled];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) transitioningDelegate];
    v5 = *(void **)(a1 + 32);

    if (v4 == v5) {
      [*(id *)(a1 + 40) setTransitioningDelegate:0];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __82__UIViewController_PhotosUI___pu_setNavigationBarTintColor_withAnimationSettings___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    dispatch_time_t v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "setTintColor:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB19D0] appearance];
    char v3 = [v4 tintColor];
    [*(id *)(a1 + 32) setTintColor:v3];
  }
}

uint64_t __81__UIViewController_PhotosUI___pu_updateStatusBarVisibilityWithAnimationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

void __59__UIViewController_PhotosUI__pu_currentViewControllerStack__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v0 = objc_msgSend(v2, "px_firstKeyWindow");
  v1 = (void *)pu_currentViewControllerStack_window;
  pu_currentViewControllerStack_window = v0;
}

@end