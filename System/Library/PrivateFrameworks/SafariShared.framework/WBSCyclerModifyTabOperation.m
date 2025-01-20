@interface WBSCyclerModifyTabOperation
- (void)_modifyRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4;
- (void)_modifyRandomTabInTabGroup:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)_updateTitleOfTab:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)_updateURLOfTab:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerModifyTabOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 topLevelItem];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__WBSCyclerModifyTabOperation_executeWithContext_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9A758;
  id v9 = v6;
  id v12 = v9;
  v10 = [v9 randomDescendantOfList:v8 enforcingTitlePrefixValidity:1 passingTest:v11];

  if (v10
    && +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:2])
  {
    [(WBSCyclerModifyTabOperation *)self _modifyRandomTabInTabGroup:v10 withContext:v9 completionHandler:v7];
  }
  else
  {
    [(WBSCyclerModifyTabOperation *)self _modifyRandomTabGroupWithContext:v9 completionHandler:v7];
  }
}

BOOL __68__WBSCyclerModifyTabOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) topLevelItem];
  if ((id)v4 == v3)
  {
    BOOL v8 = 0;
    id v7 = v3;
  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    id v7 = [v3 randomTabDescendant];
    BOOL v8 = v7 != 0;
  }

LABEL_7:
  return v8;
}

- (void)_modifyRandomTabInTabGroup:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  BOOL v8 = (void (**)(id, void *))a5;
  id v9 = [a3 randomTabDescendant];
  if (v9)
  {
    if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:2])
    {
      [(WBSCyclerModifyTabOperation *)self _updateTitleOfTab:v9 withContext:v11 completionHandler:v8];
    }
    else
    {
      [(WBSCyclerModifyTabOperation *)self _updateURLOfTab:v9 withContext:v11 completionHandler:v8];
    }
  }
  else
  {
    v10 = [v11 topLevelItem];
    v8[2](v8, v10);
  }
}

- (void)_updateTitleOfTab:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 randomItemTitle];
  id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    v13 = [v7 uniqueIdentifier];
    v14 = [v7 title];
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Changing title of tab (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
  }
  v15 = [v9 topLevelItem];
  v16 = [v9 testTarget];

  v17 = [v7 uniqueIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__WBSCyclerModifyTabOperation__updateTitleOfTab_withContext_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9A640;
  id v23 = v15;
  id v24 = v7;
  id v25 = v10;
  id v26 = v8;
  id v18 = v10;
  id v19 = v7;
  id v20 = v15;
  id v21 = v8;
  [v16 setTitle:v18 forBookmarkWithIdentifier:v17 reply:v22];
}

void __79__WBSCyclerModifyTabOperation__updateTitleOfTab_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = (id)[*(id *)(a1 + 32) copy];
    id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v4 = [v6 descendantWithUniqueIdentifier:v3];

    [v4 setTitle:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

- (void)_updateURLOfTab:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = +[WBSCyclerRandomnessUtilities randomURL];
  id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    v13 = [v7 uniqueIdentifier];
    v14 = [v7 url];
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Changing URL of tab (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
  }
  v15 = [v9 topLevelItem];
  v16 = [v9 testTarget];

  v17 = [v7 uniqueIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__WBSCyclerModifyTabOperation__updateURLOfTab_withContext_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9A640;
  id v23 = v15;
  id v24 = v7;
  id v25 = v10;
  id v26 = v8;
  id v18 = v10;
  id v19 = v7;
  id v20 = v15;
  id v21 = v8;
  [v16 setURL:v18 forBookmarkWithIdentifier:v17 reply:v22];
}

void __77__WBSCyclerModifyTabOperation__updateURLOfTab_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = (id)[*(id *)(a1 + 32) copy];
    id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v4 = [v6 descendantWithUniqueIdentifier:v3];

    [v4 setURL:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

- (void)_modifyRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 tabGroupsParent];
  id v8 = [v7 randomTabGroupDescendant];
  if (v8)
  {
    id v9 = [v5 randomItemTitle];
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      id v12 = [v8 uniqueIdentifier];
      v13 = [v8 title];
      *(_DWORD *)buf = 138543874;
      id v26 = v12;
      __int16 v27 = 2114;
      v28 = v13;
      __int16 v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "Changing title of tab group (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
    }
    v14 = [v5 topLevelItem];
    v15 = [v5 testTarget];
    v16 = [v8 uniqueIdentifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__WBSCyclerModifyTabOperation__modifyRandomTabGroupWithContext_completionHandler___block_invoke;
    v20[3] = &unk_1E5C9A640;
    id v24 = v6;
    id v21 = v14;
    id v22 = v8;
    id v23 = v9;
    id v17 = v9;
    id v18 = v14;
    [v15 setTitle:v17 forBookmarkWithIdentifier:v16 reply:v20];
  }
  else
  {
    id v19 = [v5 topLevelItem];
    (*((void (**)(id, void *))v6 + 2))(v6, v19);
  }
}

void __82__WBSCyclerModifyTabOperation__modifyRandomTabGroupWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = (id)[*(id *)(a1 + 32) copy];
    id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v4 = [v6 descendantWithUniqueIdentifier:v3];

    [v4 setTitle:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

@end