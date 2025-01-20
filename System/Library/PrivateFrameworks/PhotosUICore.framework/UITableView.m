@interface UITableView
@end

@implementation UITableView

uint64_t __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = [*(id *)(a1 + 32) deletedSections];

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = [*(id *)(a1 + 32) deletedSections];
    [v3 deleteSections:v4 withRowAnimation:100];
  }
  v5 = [*(id *)(a1 + 32) insertedSections];

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 32) insertedSections];
    [v6 insertSections:v7 withRowAnimation:100];
  }
  v8 = [*(id *)(a1 + 32) changedSections];

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    v10 = [*(id *)(a1 + 32) changedSections];
    [v9 reloadSections:v10 withRowAnimation:100];
  }
  v11 = [*(id *)(a1 + 32) deletedItemsIndexPaths];

  if (v11)
  {
    v12 = *(void **)(a1 + 40);
    v13 = [*(id *)(a1 + 32) deletedItemsIndexPaths];
    [v12 deleteRowsAtIndexPaths:v13 withRowAnimation:0];
  }
  v14 = [*(id *)(a1 + 32) insertedItemsIndexPaths];

  if (v14)
  {
    v15 = *(void **)(a1 + 40);
    v16 = [*(id *)(a1 + 32) insertedItemsIndexPaths];
    [v15 insertRowsAtIndexPaths:v16 withRowAnimation:0];
  }
  v17 = [*(id *)(a1 + 32) changedItemsIndexPaths];

  if (v17)
  {
    v18 = *(void **)(a1 + 40);
    v19 = [*(id *)(a1 + 32) changedItemsIndexPaths];
    [v18 reloadRowsAtIndexPaths:v19 withRowAnimation:0];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke_2;
  v22[3] = &unk_1E5DC02F8;
  v20 = *(void **)(a1 + 32);
  v22[4] = *(void *)(a1 + 40);
  return [v20 enumerateMovedIndexPathsUsingBlock:v22];
}

uint64_t __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) moveRowAtIndexPath:a2 toIndexPath:a2];
}

@end