@interface UICollectionView(VideosUI)
+ (id)_vui_indexPathsWithIndexSet:()VideosUI andSection:;
- (uint64_t)vui_applyChangeSet:()VideosUI completionHandler:;
- (uint64_t)vui_applyChangeSet:()VideosUI inSection:completionHandler:;
- (uint64_t)vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:;
- (uint64_t)vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:completionHandler:;
- (void)_vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:;
- (void)_vui_applyDeleteChange:()VideosUI inSection:applyChangeBlock:;
- (void)_vui_applyInsertChange:()VideosUI inSection:applyChangeBlock:;
- (void)_vui_applyItemUpdateChanges:()VideosUI inSection:applyChangeBlock:;
- (void)_vui_applyMoveChanges:()VideosUI inSection:applyChangeBlock:;
- (void)_vui_applySectionUpdateChanges:()VideosUI applyChangeBlock:updateDataSourceBlock:;
- (void)_vui_applyUpdateChanges:()VideosUI inSection:applyChangeBlock:updateDataSourceBlock:;
@end

@implementation UICollectionView(VideosUI)

- (uint64_t)vui_applyChangeSet:()VideosUI completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:completionHandler:", a3, 0, a4);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:updateDataSourceBlock:completionHandler:", a3, a4, 0, a5);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:", a3, a4, a5, 0, a6);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:
{
  return objc_msgSend(a1, "_vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:", a3, a4, a5, a6, 0, a7);
}

- (void)_vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke;
  v29[3] = &unk_1E6DF8A70;
  id v32 = v15;
  char v35 = a7;
  uint64_t v34 = a4;
  id v30 = v14;
  v31 = a1;
  id v33 = v16;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke_2;
  v22[3] = &unk_1E6DF8A98;
  char v28 = a7;
  v22[4] = a1;
  id v23 = v30;
  id v24 = v33;
  id v25 = v32;
  id v26 = v17;
  uint64_t v27 = a4;
  id v18 = v17;
  id v19 = v32;
  id v20 = v33;
  id v21 = v30;
  [a1 performBatchUpdates:v29 completion:v22];
}

- (void)_vui_applyDeleteChange:()VideosUI inSection:applyChangeBlock:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v8 && (!v9 || ((*((uint64_t (**)(id, void *, id))v9 + 2))(v9, a4, v8) & 1) == 0))
  {
    v11 = [v8 sourceIndexes];
    if (a4 == (void *)-1)
    {
      id v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_INFO, "Applying Delete Change: Deleting Sections At: %@", (uint8_t *)&v19, 0xCu);
      }

      [a1 deleteSections:v11];
    }
    else
    {
      v12 = objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v11, a4);
      int v13 = [v12 count];
      int v14 = [a1 numberOfItemsInSection:a4];
      id v15 = VUIDefaultLogObject();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v13 == v14)
      {
        if (v16)
        {
          int v19 = 134217984;
          id v20 = a4;
          _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_INFO, "Applying Delete Change: Deleting Section At: %lu", (uint8_t *)&v19, 0xCu);
        }

        id v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
        [a1 deleteSections:v17];
      }
      else
      {
        if (v16)
        {
          int v19 = 134218242;
          id v20 = a4;
          __int16 v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_INFO, "Applying Delete Change To Section: %lu. Delete Items At: %@", (uint8_t *)&v19, 0x16u);
        }

        [a1 deleteItemsAtIndexPaths:v12];
      }
    }
  }
}

- (void)_vui_applyInsertChange:()VideosUI inSection:applyChangeBlock:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v8 && (!v9 || ((*((uint64_t (**)(id, void *, id))v9 + 2))(v9, a4, v8) & 1) == 0))
  {
    v11 = [v8 destinationIndexes];
    if (a4 == (void *)-1)
    {
      BOOL v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v11;
        _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_INFO, "Applying Insert Change: Inserting Sections At: %@", (uint8_t *)&v17, 0xCu);
      }

      [a1 insertSections:v11];
    }
    else
    {
      v12 = objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v11, a4);
      if ((int)[a1 numberOfSections] <= (int)a4)
      {
        int v13 = VUIDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v17 = 134217984;
          id v18 = a4;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_INFO, "Applying Insert Change: Inserting Section At: %lu", (uint8_t *)&v17, 0xCu);
        }

        int v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
        [a1 insertSections:v14];
      }
      id v15 = VUIDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 134218242;
        id v18 = a4;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_INFO, "Applying Insert Change To Section: %lu. Insert Items At: %@", (uint8_t *)&v17, 0x16u);
      }

      [a1 insertItemsAtIndexPaths:v12];
    }
  }
}

- (void)_vui_applyMoveChanges:()VideosUI inSection:applyChangeBlock:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v10 = 134218240;
    long long v23 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (!v8 || (v8[2](v8, a4, *(void *)(*((void *)&v26 + 1) + 8 * i)) & 1) == 0)
        {
          id v15 = objc_msgSend(v14, "sourceIndexes", v23);
          BOOL v16 = [v14 destinationIndexes];
          uint64_t v17 = [v15 firstIndex];
          uint64_t v18 = [v16 firstIndex];
          if (a4 == -1)
          {
            v22 = VUIDefaultLogObject();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              uint64_t v31 = v17;
              __int16 v32 = 2048;
              uint64_t v33 = v18;
              _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_INFO, "Applying Move Change To Section %lu to %lu", buf, 0x16u);
            }

            [a1 moveSection:v17 toSection:v18];
          }
          else
          {
            __int16 v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v17 inSection:a4];
            id v20 = [MEMORY[0x1E4F28D58] indexPathForRow:v18 inSection:a4];
            uint64_t v21 = VUIDefaultLogObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v31 = (uint64_t)v19;
              __int16 v32 = 2112;
              uint64_t v33 = (uint64_t)v20;
              _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_INFO, "Applying Move Change To Item %@ to %@", buf, 0x16u);
            }

            [a1 moveItemAtIndexPath:v19 toIndexPath:v20];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v11);
  }
}

- (void)_vui_applyUpdateChanges:()VideosUI inSection:applyChangeBlock:updateDataSourceBlock:
{
  if (a4 == -1)
  {
    id v12 = a6;
    id v13 = a5;
    id v14 = a3;
    objc_msgSend(a1, "_vui_applySectionUpdateChanges:applyChangeBlock:updateDataSourceBlock:");
  }
  else
  {
    long long v10 = (objc_class *)MEMORY[0x1E4FB3C50];
    uint64_t v11 = a6;
    id v12 = a5;
    id v13 = a3;
    id v14 = objc_alloc_init(v10);
    [v14 setUpdateChanges:v13];
    v11[2](v11, v14);

    objc_msgSend(a1, "_vui_applyItemUpdateChanges:inSection:applyChangeBlock:", v13, a4, v12);
  }
}

- (void)_vui_applySectionUpdateChanges:()VideosUI applyChangeBlock:updateDataSourceBlock:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v30;
    *(void *)&long long v12 = 138412290;
    long long v26 = v12;
    long long v27 = v9;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        if (!v9 || (v9[2](v9, -1, *(void *)(*((void *)&v29 + 1) + 8 * v15)) & 1) == 0)
        {
          uint64_t v17 = objc_msgSend(v16, "destinationIndexes", v26);
          uint64_t v18 = [v17 firstIndex];
          __int16 v19 = VUIDefaultLogObject();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v18];
            uint64_t v20 = v13;
            uint64_t v21 = v14;
            id v22 = v10;
            v24 = long long v23 = a1;
            *(_DWORD *)buf = v26;
            uint64_t v34 = v24;
            _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_INFO, "Applying Update Change: Updating Sections At: %@", buf, 0xCu);

            a1 = v23;
            id v10 = v22;
            uint64_t v14 = v21;
            uint64_t v13 = v20;
            uint64_t v9 = v27;
          }

          id v25 = [v16 updateChangeSet];
          objc_msgSend(a1, "_vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:", v25, v18, v10, v9, 1, 0);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v13);
  }
}

- (void)_vui_applyItemUpdateChanges:()VideosUI inSection:applyChangeBlock:
{
  uint64_t v20 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        if (!v8 || (v8[2](v8, a4, *(void *)(*((void *)&v22 + 1) + 8 * v13)) & 1) == 0)
        {
          uint64_t v15 = objc_msgSend(v14, "destinationIndexes", v20);
          uint64_t v16 = [v15 firstIndex];
          uint64_t v17 = [MEMORY[0x1E4F28D58] indexPathForRow:v16 inSection:a4];
          [v9 addObject:v17];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v11);
  }

  if ([v9 count])
  {
    uint64_t v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138412546;
      long long v27 = v19;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_INFO, "Applying Update Change To Section: %@. Reloading Items At: %@", buf, 0x16u);
    }
    [v20 reloadItemsAtIndexPaths:v9];
  }
}

+ (id)_vui_indexPathsWithIndexSet:()VideosUI andSection:
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__UICollectionView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke;
  v10[3] = &unk_1E6DF7F48;
  id v8 = v7;
  id v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateIndexesUsingBlock:v10];

  return v8;
}

@end