@interface UIViewController
@end

@implementation UIViewController

uint64_t __48__UIViewController_IC__ic_viewControllerManager__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) viewIfLoaded];
  return MEMORY[0x1F41817F8]();
}

uint64_t __62__UIViewController_IC__ic_showViewController_animated_sender___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showViewController:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

uint64_t __76__UIViewController_IC__ic_dismissViewControllerOfClass_animated_completion___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __96__UIViewController_IC__ic_replacePresentedViewControllerWithViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __61__UIViewController_IC__ic_performBlockAfterActiveTransition___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end