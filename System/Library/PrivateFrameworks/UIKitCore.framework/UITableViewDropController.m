@interface UITableViewDropController
@end

@implementation UITableViewDropController

void __48___UITableViewDropController_beginIgnoringDrags__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endIgnoringDrags];
}

void __79___UITableViewDropController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained tableView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(id *)(a1 + 32);
    v4 = [v3 cell];
    if (v4 && [v3 _didBeginAnimation]) {
      [v2 _endAnimatingDropOfCell:v4];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v3 = *(id *)(a1 + 32);
    v4 = [v3 cellForTargetContainerInTableView:v2];
    if (v4 && [v3 _didBeginAnimation]) {
      [v2 _endAnimatingDropIntoCell:v4];
    }
  }

LABEL_10:
  v5 = [WeakRetained dragItemDropAnimations];
  [v5 removeObjectForKey:*(void *)(a1 + 40)];
}

void __97___UITableViewDropController_insertPlaceholderAtIndexPath_withContext_previewParametersProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end