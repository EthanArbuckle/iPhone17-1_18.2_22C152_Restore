@interface UIAlertControllerShimPresenter
@end

@implementation UIAlertControllerShimPresenter

uint64_t __91___UIAlertControllerShimPresenter__presentAlertControllerAnimated_hostingScene_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _popoverController];
  objc_msgSend(v3, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", *(void *)(a1 + 40), *(void *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

uint64_t __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) alertController];
  [v2 _flipFrameForShimDismissalIfNecessary];

  +[_UIAlertControllerShimPresenter _removePresenter:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _tearDownInPopoverViewController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) alertController];
  [v2 _flipFrameForShimDismissalIfNecessary];

  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 dismissViewControllerAnimated:v3 completion:v5];
}

uint64_t __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end