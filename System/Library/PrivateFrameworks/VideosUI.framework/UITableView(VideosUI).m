@interface UITableView(VideosUI)
+ (id)_vui_indexPathsWithIndexSet:()VideosUI andSection:;
- (uint64_t)vui_applyChangeSet:()VideosUI completionHandler:;
- (uint64_t)vui_applyChangeSet:()VideosUI inSection:completionHandler:;
- (void)_vui_applyDeleteChange:()VideosUI inSection:rowAnimation:;
- (void)_vui_applyInsertChange:()VideosUI inSection:rowAnimation:;
- (void)_vui_applyMoveChanges:()VideosUI inSection:rowAnimation:;
- (void)_vui_applyUpdateChanges:()VideosUI inSection:rowAnimation:;
- (void)vui_applyChangeSet:()VideosUI inSection:rowAnimation:updateDataSourceBlock:completionHandler:;
@end

@implementation UITableView(VideosUI)

- (uint64_t)vui_applyChangeSet:()VideosUI completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:completionHandler:", a3, 0, a4);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:rowAnimation:updateDataSourceBlock:completionHandler:", a3, a4, 100, 0, a5);
}

- (void)vui_applyChangeSet:()VideosUI inSection:rowAnimation:updateDataSourceBlock:completionHandler:
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke;
  v23[3] = &unk_1E6DF7EF8;
  id v25 = v13;
  v23[4] = a1;
  id v24 = v12;
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke_2;
  v18[3] = &unk_1E6DF7F20;
  v18[4] = a1;
  id v19 = v24;
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  id v20 = v14;
  id v15 = v14;
  id v16 = v24;
  id v17 = v13;
  [a1 performBatchUpdates:v23 completion:v18];
}

- (void)_vui_applyDeleteChange:()VideosUI inSection:rowAnimation:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v8 = [a3 sourceIndexes];
    if (a4 == -1)
    {
      v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "Applying Delete Change: Deleting Sections At: %@", (uint8_t *)&v12, 0xCu);
      }

      [a1 deleteSections:v8 withRowAnimation:100];
    }
    else
    {
      v9 = objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v8, a4);
      v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v9;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "Applying Delete Change. Deleting Rows At: %@", (uint8_t *)&v12, 0xCu);
      }

      [a1 deleteRowsAtIndexPaths:v9 withRowAnimation:a5];
    }
  }
}

- (void)_vui_applyInsertChange:()VideosUI inSection:rowAnimation:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v8 = [a3 destinationIndexes];
    v9 = objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v8, a4);
    v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      int v12 = v9;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "Applying Insert Change. Inserting Rows At: %@", (uint8_t *)&v11, 0xCu);
    }

    [a1 insertRowsAtIndexPaths:v9 withRowAnimation:a5];
  }
}

- (void)_vui_applyMoveChanges:()VideosUI inSection:rowAnimation:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 138412546;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "sourceIndexes", v18);
        int v12 = [v10 destinationIndexes];
        uint64_t v13 = [v11 firstIndex];
        uint64_t v14 = [v12 firstIndex];
        id v15 = [MEMORY[0x1E4F28D58] indexPathForRow:v13 inSection:a4];
        id v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v14 inSection:a4];
        id v17 = VUIDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v18;
          uint64_t v26 = v15;
          __int16 v27 = 2112;
          v28 = v16;
          _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_INFO, "Applying Move Change To Row %@ to %@", buf, 0x16u);
        }

        [a1 moveRowAtIndexPath:v15 toIndexPath:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
}

- (void)_vui_applyUpdateChanges:()VideosUI inSection:rowAnimation:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) destinationIndexes];
        uint64_t v15 = [v14 firstIndex];
        id v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v15 inSection:a4];
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138412546;
      id v25 = v18;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_INFO, "Applying Update Change To Section: %@. Reloading Rows At: %@", buf, 0x16u);
    }
    [a1 reloadRowsAtIndexPaths:v8 withRowAnimation:a5];
  }
}

+ (id)_vui_indexPathsWithIndexSet:()VideosUI andSection:
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__UITableView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke;
  v10[3] = &unk_1E6DF7F48;
  id v8 = v7;
  id v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateIndexesUsingBlock:v10];

  return v8;
}

@end