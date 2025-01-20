@interface UIEditMenuOverlayUIClientPresentation
@end

@implementation UIEditMenuOverlayUIClientPresentation

void __87___UIEditMenuOverlayUIClientPresentation_preparedMenuWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = a2;
  v4 = [v3 menuManager];
  [v4 setDisplayedMenu:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentAnimator];
  [v1 runAnimations];
}

void __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dismissAnimator];
  [v1 runAnimations];
}

@end