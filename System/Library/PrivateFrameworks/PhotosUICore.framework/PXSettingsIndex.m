@interface PXSettingsIndex
+ (id)_entriesForSettingsController:(id)a3 usingProgress:(id)a4;
+ (id)createIndexForSettings:(id)a3 resultHandler:(id)a4;
- (NSArray)entries;
- (PXSettingsIndex)init;
- (id)_initWithEntries:(id)a3;
- (id)searchForText:(id)a3 resultHandler:(id)a4;
@end

@implementation PXSettingsIndex

- (void).cxx_destruct
{
}

- (NSArray)entries
{
  return self->_entries;
}

- (id)searchForText:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXSettingsIndex *)self entries];
  v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
  if ([v6 length])
  {
    v10 = dispatch_get_global_queue(2, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__PXSettingsIndex_searchForText_resultHandler___block_invoke;
    v12[3] = &unk_1E5DD2BB8;
    id v13 = v8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v10, v12);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }

  return v9;
}

void __47__PXSettingsIndex_searchForText_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
      if ([*(id *)(a1 + 40) isCancelled]) {
        break;
      }
      if ([v8 matchesSearchString:*(void *)(a1 + 48)])
      {
        id v9 = [[PXSettingsSearchResult alloc] _initWithEntry:v8];
        [v2 addObject:v9];
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PXSettingsIndex_searchForText_resultHandler___block_invoke_2;
  block[3] = &unk_1E5DD0E78;
  id v13 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v14 = v2;
  id v15 = v10;
  id v11 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__PXSettingsIndex_searchForText_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

- (id)_initWithEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSettingsIndex;
  uint64_t v5 = [(PXSettingsIndex *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;
  }
  return v5;
}

- (PXSettingsIndex)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsIndex.m", 179, @"%s is not available as initializer", "-[PXSettingsIndex init]");

  abort();
}

+ (id)_entriesForSettingsController:(id)a3 usingProgress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke;
  aBlock[3] = &unk_1E5DB48C8;
  v30 = &v35;
  id v12 = v8;
  id v25 = v12;
  id v13 = v7;
  id v26 = v13;
  v31 = v40;
  v32 = v39;
  id v14 = v11;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  id v16 = v10;
  id v29 = v16;
  SEL v33 = a2;
  id v34 = a1;
  long long v17 = _Block_copy(aBlock);
  if (!*((unsigned char *)v36 + 24))
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    long long v19 = MEMORY[0x1E4F14428];
    do
    {
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_5;
      v22[3] = &unk_1E5DD3128;
      id v23 = v17;
      dispatch_sync(v19, v22);
    }
    while (!*((unsigned char *)v36 + 24));
  }
  id v20 = v15;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);

  return v20;
}

void __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 72) + 8);
LABEL_4:
    *(unsigned char *)(v1 + 24) = 1;
    return;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_2;
  v5[3] = &unk_1E5DCAA50;
  id v6 = *(id *)(a1 + 40);
  long long v10 = *(_OWORD *)(a1 + 80);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 72);
  id v9 = v3;
  uint64_t v11 = v4;
  PXSettingsPerformIndexingOperation(v5);
}

uint64_t __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_5(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2 + 0.0333333333;
  while (1)
  {
    uint64_t result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v5 > v3) {
      break;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

void __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v4 = [*(id *)(a1 + 32) topViewController];
    double v5 = [v4 tableView];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v6 < [v4 numberOfSectionsInTableView:v5])
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v7 >= [v4 tableView:v5 numberOfRowsInSection:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)])
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
LABEL_22:

        return;
      }
      id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) inSection:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      id v9 = [[_PXSettingsIndexEntry alloc] initWithRowAtIndexPath:v8 inTableView:v5];
      long long v10 = [*(id *)(a1 + 40) lastObject];
      [(_PXSettingsIndexEntry *)v9 setParentEntry:v10];

      [*(id *)(a1 + 48) addObject:v9];
      [v5 scrollToRowAtIndexPath:v8 atScrollPosition:0 animated:0];
      uint64_t v11 = +[_PXSettingsIndexEntry _cellForRowAtIndexPath:v8 inTableView:v5];
      if ([v11 accessoryType] != 1) {
        goto LABEL_9;
      }
      id v26 = v11;
      id v27 = [*(id *)(a1 + 32) viewControllers];
      uint64_t v12 = isIndexingQueryCount;
      uint64_t v34 = 0;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x2020000000;
      char v37 = 0;
      id v13 = *(void **)(a1 + 32);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_3;
      v30[3] = &unk_1E5DD0F30;
      id v31 = v4;
      id v32 = v5;
      id v14 = v8;
      id v33 = v14;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_4;
      v29[3] = &unk_1E5DD2B08;
      v29[4] = &v34;
      objc_msgSend(v13, "px_performWithoutAnimations:completionHandler:", v30, v29);
      if (*((unsigned char *)v35 + 24))
      {
        id v15 = [*(id *)(a1 + 32) viewControllers];
        id v16 = v15;
        if (isIndexingQueryCount > v12 && ([v15 isEqualToArray:v27] & 1) != 0) {
          goto LABEL_8;
        }
        uint64_t v18 = [v16 count];
        if (v18 == [v27 count] + 1)
        {
          long long v19 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v27, "count"));
          id v20 = [v16 objectsAtIndexes:v19];
          if ([v20 isEqualToArray:v27])
          {
            uint64_t v21 = [*(id *)(a1 + 32) presentedViewController];

            if (!v21)
            {
              [*(id *)(a1 + 56) addObject:v14];
              [*(id *)(a1 + 40) addObject:v9];
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
              *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;

              _Block_object_dispose(&v34, 8);
              uint64_t v11 = v26;
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
      }
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = *(void *)(a1 + 88);
      uint64_t v23 = *(void *)(a1 + 96);
      v24 = [(_PXSettingsIndexEntry *)v9 subtitle];
      id v25 = [(_PXSettingsIndexEntry *)v9 title];
      [v16 handleFailureInMethod:v22, v23, @"PXSettingsIndex.m", 141, @"The action for '%@ %@' didn't push a view controller as expected. Please use PXSettingsIsIndexing() to bail out of non-indexable actions.", v24, v25 object file lineNumber description];

LABEL_8:
      _Block_object_dispose(&v34, 8);

      uint64_t v11 = v26;
LABEL_9:
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
LABEL_21:

      goto LABEL_22;
    }
  }
  if ([*(id *)(a1 + 56) count])
  {
    id v17 = (id)[*(id *)(a1 + 32) popViewControllerAnimated:0];
    id v28 = [*(id *)(a1 + 56) lastObject];
    [*(id *)(a1 + 56) removeLastObject];
    [*(id *)(a1 + 40) removeLastObject];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v28 section];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v28 row] + 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
}

uint64_t __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) tableView:*(void *)(a1 + 40) didSelectRowAtIndexPath:*(void *)(a1 + 48)];
}

uint64_t __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

+ (id)createIndexForSettings:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
  id v9 = dispatch_queue_create("PXSettingsIndex", 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke;
  v16[3] = &unk_1E5DC2380;
  id v17 = v6;
  id v10 = v8;
  id v19 = v7;
  id v20 = a1;
  id v18 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v16);

  id v13 = v19;
  id v14 = v10;

  return v14;
}

void __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke(id *a1)
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__59651;
  void v22[4] = __Block_byref_object_dispose__59652;
  id v23 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__59651;
  id v20 = __Block_byref_object_dispose__59652;
  id v21 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_1;
  block[3] = &unk_1E5DCCE38;
  id v14 = v22;
  id v15 = &v16;
  id v13 = a1[4];
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if ([a1[5] isCancelled])
  {
    double v2 = 0;
  }
  else
  {
    double v2 = [(id)objc_opt_class() _entriesForSettingsController:v17[5] usingProgress:a1[5]];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_2;
  v11[3] = &unk_1E5DD2B08;
  v11[4] = v22;
  double v3 = (void *)MEMORY[0x1E4F14428];
  dispatch_sync(MEMORY[0x1E4F14428], v11);

  if (([a1[5] isCancelled] & 1) == 0)
  {
    uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithEntries:v2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_3;
    v8[3] = &unk_1E5DD3280;
    id v5 = a1[6];
    id v9 = v4;
    id v10 = v5;
    id v6 = v4;
    id v7 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(v22, 8);
}

uint64_t __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_1(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1F48]);
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  uint64_t v4 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F94208]) initWithRootSettings:a1[4]];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  [*(id *)(*(void *)(a1[5] + 8) + 40) setRootViewController:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [*(id *)(*(void *)(a1[5] + 8) + 40) setAlpha:0.0];
  id v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
  return [v10 setHidden:0];
}

uint64_t __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setHidden:1];
}

uint64_t __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end