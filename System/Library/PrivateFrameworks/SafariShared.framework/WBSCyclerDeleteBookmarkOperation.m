@interface WBSCyclerDeleteBookmarkOperation
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerDeleteBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 randomValidStrictDescendantOfTopLevelItem];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 uniqueIdentifier];
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      v12 = [v8 title];
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      __int16 v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "Deleting bookmark (title: %{public}@, identifier: %{public}@)", buf, 0x16u);
    }
    v13 = [v5 testTarget];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__WBSCyclerDeleteBookmarkOperation_executeWithContext_completionHandler___block_invoke;
    v15[3] = &unk_1E5C9A730;
    id v18 = v6;
    id v16 = v5;
    id v17 = v9;
    id v14 = v9;
    [v13 deleteBookmarkWithIdentifier:v14 reply:v15];
  }
  else
  {
    id v14 = [v5 topLevelItem];
    (*((void (**)(id, id))v6 + 2))(v6, v14);
  }
}

void __73__WBSCyclerDeleteBookmarkOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) topLevelItem];
    id v6 = (id)[v3 copy];

    v4 = [v6 descendantWithUniqueIdentifier:*(void *)(a1 + 40)];
    [v6 deleteDescendant:v4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

@end