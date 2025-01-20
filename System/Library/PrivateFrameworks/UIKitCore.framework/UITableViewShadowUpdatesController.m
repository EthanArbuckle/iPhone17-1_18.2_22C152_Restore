@interface UITableViewShadowUpdatesController
@end

@implementation UITableViewShadowUpdatesController

uint64_t __67___UITableViewShadowUpdatesController_sectionsBeforeShadowUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) initialSectionIndexForFinalSectionIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

void __87___UITableViewShadowUpdatesController_sectionsAfterShadowUpdates_allowAppendingInsert___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) finalSectionIndexForInitialSectionIndex:a2];
  uint64_t v5 = v4;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v6 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) initialSnapshot];
    uint64_t v8 = [v7 numberOfSections];

    if (v8 != a2) {
      return;
    }
    v9 = [*(id *)(a1 + 32) finalSnapshot];
    uint64_t v5 = [v9 numberOfSections];
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *(void **)(a1 + 40);
    [v10 addIndex:v5];
  }
}

uint64_t __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexPathBeforeShadowUpdates:a2];
}

uint64_t __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexPathBeforeShadowUpdates:a2];
}

uint64_t __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexPathBeforeShadowUpdates:a2];
}

uint64_t __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexPathBeforeShadowUpdates:a2];
}

@end