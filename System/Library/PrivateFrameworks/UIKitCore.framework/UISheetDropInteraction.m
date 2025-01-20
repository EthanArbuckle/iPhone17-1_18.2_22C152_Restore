@interface UISheetDropInteraction
@end

@implementation UISheetDropInteraction

void __58___UISheetDropInteraction__activityForSession_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 delegate];
    [v5 _sheetDropInteraction:*(void *)(a1 + 32) handleUserActivity:v4 forPresentedViewController:*(void *)(a1 + 40)];
  }
}

void __76___UISheetDropInteraction_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [*(id *)(a1 + 32) presentationController];
    id v3 = [v4 presentedView];
    [v3 setAlpha:1.0];
  }
}

@end