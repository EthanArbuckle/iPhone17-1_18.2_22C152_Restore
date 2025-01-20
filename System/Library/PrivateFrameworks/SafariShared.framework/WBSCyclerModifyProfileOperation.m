@interface WBSCyclerModifyProfileOperation
- (void)_updateIconOfProfile:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)_updateTitleOfProfile:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerModifyProfileOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = [v9 tabGroupsParent];
  if (v7)
  {
    if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:2])
    {
      [(WBSCyclerModifyProfileOperation *)self _updateTitleOfProfile:v7 withContext:v9 completionHandler:v6];
    }
    else
    {
      [(WBSCyclerModifyProfileOperation *)self _updateIconOfProfile:v7 withContext:v9 completionHandler:v6];
    }
  }
  else
  {
    v8 = [v9 topLevelItem];
    v6[2](v6, v8);
  }
}

- (void)_updateTitleOfProfile:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 randomItemTitle];
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = [v7 uniqueIdentifier];
    v14 = [v7 title];
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Changing title of profile (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
  }
  v15 = [v9 topLevelItem];
  v16 = [v9 testTarget];

  v17 = [v7 uniqueIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__WBSCyclerModifyProfileOperation__updateTitleOfProfile_withContext_completionHandler___block_invoke;
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

void __87__WBSCyclerModifyProfileOperation__updateTitleOfProfile_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = (id)[*(id *)(a1 + 32) copy];
    v3 = [*(id *)(a1 + 40) uniqueIdentifier];
    v4 = [v6 descendantWithUniqueIdentifier:v3];

    [v4 setTitle:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

- (void)_updateIconOfProfile:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 randomSymbolImageName];
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = [v7 uniqueIdentifier];
    v14 = [v7 symbolImageName];
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Changing icon of profile (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
  }
  v15 = [v9 topLevelItem];
  v16 = [v9 testTarget];

  v17 = [v7 uniqueIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__WBSCyclerModifyProfileOperation__updateIconOfProfile_withContext_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9A640;
  id v23 = v15;
  id v24 = v7;
  id v25 = v10;
  id v26 = v8;
  id v18 = v10;
  id v19 = v7;
  id v20 = v15;
  id v21 = v8;
  [v16 setSymbolImageName:v18 forBookmarkWithIdentifier:v17 reply:v22];
}

void __86__WBSCyclerModifyProfileOperation__updateIconOfProfile_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = (id)[*(id *)(a1 + 32) copy];
    v3 = [*(id *)(a1 + 40) uniqueIdentifier];
    v4 = [v6 descendantWithUniqueIdentifier:v3];

    [v4 setSymbolImageName:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

@end