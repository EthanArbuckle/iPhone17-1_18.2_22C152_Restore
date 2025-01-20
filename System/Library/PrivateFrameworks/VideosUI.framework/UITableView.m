@interface UITableView
@end

@implementation UITableView

void __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) deleteChange];
  objc_msgSend(v3, "_vui_applyDeleteChange:inSection:rowAnimation:", v4, *(void *)(a1 + 56), *(void *)(a1 + 64));

  v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) insertChange];
  objc_msgSend(v5, "_vui_applyInsertChange:inSection:rowAnimation:", v6, *(void *)(a1 + 56), *(void *)(a1 + 64));

  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) moveChanges];
  objc_msgSend(v7, "_vui_applyMoveChanges:inSection:rowAnimation:", v8, *(void *)(a1 + 56), *(void *)(a1 + 64));
}

uint64_t __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) updateChanges];
  objc_msgSend(v2, "_vui_applyUpdateChanges:inSection:rowAnimation:", v3, *(void *)(a1 + 56), *(void *)(a1 + 64));

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __64__UITableView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

@end