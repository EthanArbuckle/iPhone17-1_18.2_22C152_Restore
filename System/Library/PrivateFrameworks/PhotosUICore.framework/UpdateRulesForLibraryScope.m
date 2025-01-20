@interface UpdateRulesForLibraryScope
@end

@implementation UpdateRulesForLibraryScope

void ___UpdateRulesForLibraryScope_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (![v5 contactType])
  {
    [*(id *)(a1 + 32) addObject:v5];
    v3 = *(void **)(a1 + 40);
    v4 = [v5 identifier];
    [v3 addObject:v4];
  }
}

void ___UpdateRulesForLibraryScope_block_invoke_639(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (![v5 contactType])
  {
    [*(id *)(a1 + 32) addObject:v5];
    v3 = *(void **)(a1 + 40);
    v4 = [v5 identifier];
    [v3 addObject:v4];
  }
}

void ___UpdateRulesForLibraryScope_block_invoke_2(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F39118] changeRequestForLibraryScope:*(void *)(a1 + 32)];
  [v7 setAutoSharePolicy:*(__int16 *)(a1 + 56)];
  if (*(_WORD *)(a1 + 56) == 2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*(void *)(a1 + 40))
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F39130]);
      v4 = PXSharedLibraryDateConditionForSelectedStartDate(*(void **)(a1 + 40));
      [v3 addCondition:v4];
      [v2 addObject:v3];
    }
    if ([*(id *)(a1 + 48) count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F39130]);
      v6 = PXSharedLibraryPersonConditionForSelectedPeople(*(void **)(a1 + 48));
      [v5 addCondition:v6];
      [v2 addObject:v5];
    }
    [v7 updateWithCustomRules:v2];
  }
}

void ___UpdateRulesForLibraryScope_block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *(id *)(a1 + 32);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "UpdateRulesForLibraryScope", "", buf, 2u);
  }

  v9 = PLSharedLibraryGetLog();
  v10 = v9;
  if (a2)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    v11 = [*(id *)(a1 + 40) localIdentifier];
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    v12 = "Did update rules for library scope with identifier: %{public}@";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    uint32_t v15 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v11 = [*(id *)(a1 + 40) localIdentifier];
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v5;
    v12 = "Failed to update rules for library scope with identifier: %{public}@, error: %@";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
  }
  _os_log_impl(&dword_1A9AE7000, v13, v14, v12, buf, v15);

LABEL_10:
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___UpdateRulesForLibraryScope_block_invoke_644;
    block[3] = &unk_1E5DD1758;
    id v19 = v16;
    char v20 = a2;
    id v18 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t ___UpdateRulesForLibraryScope_block_invoke_644(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t ___UpdateRulesForLibraryScope_block_invoke_640(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

@end