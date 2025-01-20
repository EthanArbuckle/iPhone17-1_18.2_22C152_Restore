@interface UIContextMenuPresentation
@end

@implementation UIContextMenuPresentation

void __66___UIContextMenuPresentation_setAlongsideAnimatorForPresentation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) uiController];
  v2 = [v3 platterContainerView];
  (*(void (**)(uint64_t, uint64_t, void *))(v1 + 16))(v1, 1, v2);
}

uint64_t __46___UIContextMenuPresentation_prepareToPresent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationTransitionDidEnd];
}

void __63___UIContextMenuPresentation_setAlongsideAnimatorForDismissal___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) uiController];
  v2 = [v3 platterContainerView];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

uint64_t __46___UIContextMenuPresentation_prepareToDismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissalTransitionDidEnd];
}

@end