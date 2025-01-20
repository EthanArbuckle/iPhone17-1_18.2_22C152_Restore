@interface UITableViewMultiSelectController
@end

@implementation UITableViewMultiSelectController

void __55___UITableViewMultiSelectController__selectIndexPaths___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        v8 = [*(id *)(a1 + 40) tableView];
        LOBYTE(v12) = 0;
        [v8 _selectRowAtIndexPath:v7 animated:0 scrollPosition:0 notifyDelegate:1 isCellMultiSelect:1 deselectPrevious:0 performCustomSelectionAction:v12];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  v9 = [*(id *)(a1 + 40) tableView];
  v10 = [v9 indexPathsForSelectedRows];
  v11 = [*(id *)(a1 + 40) currentSelectionState];
  [v11 setAllSelectedIndexPaths:v10];
}

void __57___UITableViewMultiSelectController__deselectIndexPaths___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  uint64_t v3 = [*(id *)(a1 + 40) allObjects];
  [v2 _deselectRowsAtIndexPaths:v3 animated:1 notifyDelegate:1];

  id v6 = [*(id *)(a1 + 32) tableView];
  uint64_t v4 = [v6 indexPathsForSelectedRows];
  uint64_t v5 = [*(id *)(a1 + 32) currentSelectionState];
  [v5 setAllSelectedIndexPaths:v4];
}

@end