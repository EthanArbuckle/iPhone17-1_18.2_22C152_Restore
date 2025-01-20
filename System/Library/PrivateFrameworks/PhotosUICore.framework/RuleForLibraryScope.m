@interface RuleForLibraryScope
@end

@implementation RuleForLibraryScope

void ___RuleForLibraryScope_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 dateRangeCondition];
  v5 = v4;
  if (v4)
  {
    v6 = PXSharedLibraryStartDateFromExclusiveCondition(v4);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9)
    {
      v10 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [*(id *)(a1 + 32) uuid];
        int v17 = 138543362;
        v18 = v11;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Library scope has multiple start date rules: %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      objc_storeStrong(v8, v6);
    }
  }
  v12 = [v3 personCondition];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 personUUIDs];
    if ([*(id *)(a1 + 40) count])
    {
      v15 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [*(id *)(a1 + 32) uuid];
        int v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Library scope has multiple person UUID rules: %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 40) addObjectsFromArray:v14];
    }
  }
}

@end