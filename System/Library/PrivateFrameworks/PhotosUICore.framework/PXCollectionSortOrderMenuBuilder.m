@interface PXCollectionSortOrderMenuBuilder
+ (BOOL)_supportsAscendingDescending:(unsigned int)a3;
+ (id)_localizedTitleForSortOrder:(int64_t)a3;
+ (id)sortOrderMenuActionsForCollection:(id)a3;
+ (id)sortOrderMenuConfigurationsForCollection:(id)a3;
+ (unsigned)_sortKeyFromSortOrder:(int64_t)a3;
+ (void)_enumeratePossibleSortOrdersUsingBlock:(id)a3;
+ (void)_updateSortOrderWithSortKey:(unsigned int)a3 ascending:(BOOL)a4 forCollection:(id)a5;
@end

@implementation PXCollectionSortOrderMenuBuilder

+ (void)_enumeratePossibleSortOrdersUsingBlock:(id)a3
{
  v3 = (void (**)(id, uint64_t))((char *)a3 + 16);
  v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, 3);
  (*v3)(v5, 2);
  (*v3)(v5, 4);
}

+ (id)_localizedTitleForSortOrder:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = PXLocalizedStringFromTable(off_1E5DBB900[a3 - 1], @"PhotosUICore");
  }
  return v4;
}

+ (BOOL)_supportsAscendingDescending:(unsigned int)a3
{
  BOOL result = 1;
  if (a3 <= 5 && ((1 << a3) & 0x35) != 0 || a3 == 101) {
    return 0;
  }
  return result;
}

+ (unsigned)_sortKeyFromSortOrder:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 1;
  }
  else {
    return dword_1AB35A250[a3 - 1];
  }
}

+ (id)sortOrderMenuConfigurationsForCollection:(id)a3
{
  id v4 = a3;
  char v18 = 0;
  int64_t v5 = +[PXCollectionSortOrderUtilities sortOrderFromCollection:v4 isAscending:&v18];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PXCollectionSortOrderMenuBuilder_sortOrderMenuConfigurationsForCollection___block_invoke;
  v12[3] = &unk_1E5DBB8E0;
  id v13 = v4;
  id v15 = a1;
  int64_t v16 = v5;
  char v17 = v18;
  id v7 = v6;
  id v14 = v7;
  id v8 = v4;
  [a1 _enumeratePossibleSortOrdersUsingBlock:v12];
  v9 = v14;
  id v10 = v7;

  return v10;
}

void __77__PXCollectionSortOrderMenuBuilder_sortOrderMenuConfigurationsForCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  if (+[PXCollectionSortOrderUtilities supportsFetchSortOrder:a2 inCollection:*(void *)(a1 + 32)])
  {
    id v11 = [*(id *)(a1 + 48) _localizedTitleForSortOrder:a2];
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "_supportsAscendingDescending:", objc_msgSend(*(id *)(a1 + 48), "_sortKeyFromSortOrder:", a2));
    if (v5) {
      BOOL v6 = v4 == a2;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      if (*(unsigned char *)(a1 + 64)) {
        v9 = @"chevron.up";
      }
      else {
        v9 = @"chevron.down";
      }
      id v8 = v9;
      BOOL v7 = *(unsigned char *)(a1 + 64) == 0;
    }
    else
    {
      BOOL v7 = v5;
      id v8 = 0;
    }
    id v10 = [[PXCollectionSortMenuItemConfiguration alloc] initWithSortOrder:a2 title:v11 systemImageName:v8 selected:v4 == a2 actionAscending:v7];
    [*(id *)(a1 + 40) addObject:v10];
  }
}

+ (void)_updateSortOrderWithSortKey:(unsigned int)a3 ascending:(BOOL)a4 forCollection:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = [v9 photoLibrary];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__PXCollectionSortOrderMenuBuilder__updateSortOrderWithSortKey_ascending_forCollection___block_invoke;
    v12[3] = &unk_1E5DBB8B8;
    unsigned int v15 = a3;
    id v13 = v9;
    id v14 = a1;
    BOOL v16 = a4;
    id v11 = v9;
    [v10 performChanges:v12 completionHandler:&__block_literal_global_117018];
  }
}

void __88__PXCollectionSortOrderMenuBuilder__updateSortOrderWithSortKey_ascending_forCollection___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(a1 + 32)];
  [v2 setCustomSortKey:*(unsigned int *)(a1 + 48)];
  if ([*(id *)(a1 + 40) _supportsAscendingDescending:*(unsigned int *)(a1 + 48)]) {
    [v2 setCustomSortAscending:*(unsigned __int8 *)(a1 + 52)];
  }
}

void __88__PXCollectionSortOrderMenuBuilder__updateSortOrderWithSortKey_ascending_forCollection___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLUIGetLog();
  BOOL v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      BOOL v7 = "Sort Action: change request succeeded";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    BOOL v7 = "Sort Action: change request failed with error: %@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

+ (id)sortOrderMenuActionsForCollection:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = objc_msgSend(a1, "sortOrderMenuConfigurationsForCollection:");
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint32_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v11 = [v10 systemImageName];
        if (v11)
        {
          id v12 = (void *)MEMORY[0x1E4FB1818];
          uint64_t v13 = [v10 systemImageName];
          id v14 = [v12 systemImageNamed:v13];
        }
        else
        {
          id v14 = 0;
        }

        unsigned int v15 = (void *)MEMORY[0x1E4FB13F0];
        BOOL v16 = [v10 title];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __70__PXCollectionSortOrderMenuBuilder_sortOrderMenuActionsForCollection___block_invoke;
        v21[3] = &unk_1E5DBB890;
        id v23 = a1;
        v21[4] = v10;
        id v22 = v20;
        char v17 = [v15 actionWithTitle:v16 image:v14 identifier:0 handler:v21];

        objc_msgSend(v17, "setState:", objc_msgSend(v10, "selected"));
        [v5 addObject:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

uint64_t __70__PXCollectionSortOrderMenuBuilder_sortOrderMenuActionsForCollection___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = objc_msgSend(v2, "_sortKeyFromSortOrder:", objc_msgSend(*(id *)(a1 + 32), "sortOrder"));
  uint64_t v4 = [*(id *)(a1 + 32) actionAscending];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v2 _updateSortOrderWithSortKey:v3 ascending:v4 forCollection:v5];
}

@end