@interface PUImportChangeDetailsCollectionViewHelper
- (PUImportChangeDetailsCollectionViewHelper)initWithCollectionView:(id)a3 dataSourceSettingHandler:(id)a4;
- (UICollectionView)collectionView;
- (id)dataSourceSettingHandler;
- (void)applyChangeDetails:(id)a3 forNewDataSource:(id)a4 completionBlock:(id)a5;
- (void)setCollectionView:(id)a3;
- (void)setDataSourceSettingHandler:(id)a3;
- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 changeHistory:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation PUImportChangeDetailsCollectionViewHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataSourceSettingHandler, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (void)setDataSourceSettingHandler:(id)a3
{
}

- (id)dataSourceSettingHandler
{
  return self->_dataSourceSettingHandler;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)applyChangeDetails:(id)a3 forNewDataSource:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v12 = [(PUImportChangeDetailsCollectionViewHelper *)self collectionView];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke;
  v16[3] = &unk_1E5F2D098;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_3;
  v13[3] = &unk_1E5F2E930;
  id v15 = v10;
  id v14 = v19;
  [v12 performBatchUpdates:v16 completion:v13];
}

void __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) dataSourceSettingHandler];
  v2[2](v2, *(void *)(a1 + 40));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = [MEMORY[0x1E4F1CA98] null];
        char v10 = [v8 isEqual:v9];

        if ((v10 & 1) == 0)
        {
          id v11 = [v8 sectionChanges];
          if ([v11 hasAnyChanges])
          {
            id v12 = v3;
            v13 = [v11 removedIndexes];
            id v14 = [v11 insertedIndexes];
            id v15 = [v11 changedIndexes];
            if ([v13 count])
            {
              v16 = [*(id *)(a1 + 32) collectionView];
              [v16 deleteSections:v13];
            }
            if ([v14 count])
            {
              id v17 = [*(id *)(a1 + 32) collectionView];
              [v17 insertSections:v14];
            }
            if ([v15 count])
            {
              id v18 = [*(id *)(a1 + 32) collectionView];
              [v18 reloadSections:v15];
            }
            id v3 = v12;
            uint64_t v6 = v22;
          }
          id v19 = [v8 sectionsWithItemChanges];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_2;
          v23[3] = &unk_1E5F25CE8;
          v23[4] = v8;
          id v20 = *(id *)(a1 + 56);
          uint64_t v21 = *(void *)(a1 + 32);
          id v24 = v20;
          uint64_t v25 = v21;
          [v19 enumerateIndexesUsingBlock:v23];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
}

uint64_t __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

void __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_2(id *a1, uint64_t a2)
{
  id v15 = [a1[4] itemChangesInSection:a2];
  int v4 = [v15 hasAnyChanges];
  uint64_t v5 = v15;
  if (v4)
  {
    uint64_t v6 = [v15 removedIndexes];
    v7 = [v15 insertedIndexes];
    id v8 = [v15 changedIndexes];
    id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v6, a2);
    char v10 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v7, a2);
    id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v8, a2);
    if ([v9 count])
    {
      [a1[5] addIndex:a2];
      id v12 = [a1[6] collectionView];
      [v12 deleteItemsAtIndexPaths:v9];
    }
    if ([v10 count])
    {
      [a1[5] addIndex:a2];
      v13 = [a1[6] collectionView];
      [v13 insertItemsAtIndexPaths:v10];
    }
    if ([v11 count])
    {
      id v14 = [a1[6] collectionView];
      [v14 reloadItemsAtIndexPaths:v11];
    }
    uint64_t v5 = v15;
  }
}

- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 changeHistory:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v27 = a5;
  id v14 = a7;
  id v15 = 0;
  if (v12 && v13)
  {
    id v15 = objc_msgSend(v27, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v12, "identifier"), objc_msgSend(v13, "identifier"));
  }
  v16 = [NSString stringWithFormat:@"Applying changes:\n%@", v15];
  id v17 = _importGridLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory"
                         ":animated:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  BOOL v42 = 0;
  if (v15 && [v15 count] == 1)
  {
    id v18 = [(PUImportChangeDetailsCollectionViewHelper *)self collectionView];
    id v19 = [v18 window];
    BOOL v20 = v19 != 0;
  }
  else
  {
    BOOL v20 = 0;
  }
  BOOL v42 = v20;
  if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
    goto LABEL_15;
  }
  uint64_t v21 = [v15 firstObject];
  uint64_t v22 = [v21 sectionsWithItemChanges];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke;
  v34[3] = &unk_1E5F25C98;
  id v23 = v21;
  id v35 = v23;
  v36 = buf;
  [v22 enumerateIndexesUsingBlock:v34];

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    if (!a6)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke_6;
    v28[3] = &unk_1E5F25CC0;
    BOOL v33 = a6;
    id v29 = v12;
    id v30 = v13;
    id v31 = v15;
    id v32 = v14;
    [(PUImportChangeDetailsCollectionViewHelper *)self applyChangeDetails:v31 forNewDataSource:v30 completionBlock:v28];
  }
  else
  {
LABEL_15:
    id v24 = _importGridLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 136315394;
      v38 = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory:animated:com"
            "pletionHandler:]";
      __int16 v39 = 2112;
      v40 = @"Reloading data";
      _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_DEFAULT, "%s: %@", v37, 0x16u);
    }

    uint64_t v25 = [(PUImportChangeDetailsCollectionViewHelper *)self dataSourceSettingHandler];
    ((void (**)(void, id))v25)[2](v25, v13);

    long long v26 = [(PUImportChangeDetailsCollectionViewHelper *)self collectionView];
    [v26 reloadData];

    if (v14) {
      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    }
  }
  _Block_object_dispose(buf, 8);
}

void __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  uint64_t v6 = [v5 removedIndexes];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [v5 removedIndexes];
    id v9 = [v5 insertedIndexes];
    char v10 = [v8 isEqualToIndexSet:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = _importGridLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        id v13 = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory:animated:c"
              "ompletionHandler:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = @"Skipping animating changes, as there are deletes in the change details";
        _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v12, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

void __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    id v10 = v5;
    if (!*(unsigned char *)(a1 + 64)) {
      [MEMORY[0x1E4F39CF8] commit];
    }
    uint64_t v7 = [NSString stringWithFormat:@"Error applying change from \n%@\nto\n%@\nData Source Diff:\n%@\n%@", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), v10];
    id v8 = _importGridLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v12 = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory:animated:com"
            "pletionHandler:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
    }

    objc_exception_throw(v10);
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 64), v9);
  }
  if (!*(unsigned char *)(a1 + 64)) {
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (PUImportChangeDetailsCollectionViewHelper)initWithCollectionView:(id)a3 dataSourceSettingHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUImportChangeDetailsCollectionViewHelper;
  id v8 = [(PUImportChangeDetailsCollectionViewHelper *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    id v10 = _Block_copy(v7);
    id dataSourceSettingHandler = v9->_dataSourceSettingHandler;
    v9->_id dataSourceSettingHandler = v10;
  }
  return v9;
}

@end