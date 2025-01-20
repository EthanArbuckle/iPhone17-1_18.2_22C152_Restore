@interface WBSCyclerDeleteProfileOperation
- (void)_deleteItemWithIdentifier:(id)a3 inContext:(id)a4 completionHandler:(id)a5;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerDeleteProfileOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 tabGroupsParent];
  if (v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v11 = [v8 title];
      v12 = [v8 uniqueIdentifier];
      int v15 = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Deleting profile with title %{public}@ (%@)", (uint8_t *)&v15, 0x16u);
    }
    v13 = [v8 uniqueIdentifier];
    [(WBSCyclerDeleteProfileOperation *)self _deleteItemWithIdentifier:v13 inContext:v6 completionHandler:v7];
  }
  else
  {
    v14 = [v6 topLevelItem];
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }
}

- (void)_deleteItemWithIdentifier:(id)a3 inContext:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 testTarget];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__WBSCyclerDeleteProfileOperation__deleteItemWithIdentifier_inContext_completionHandler___block_invoke;
  v14[3] = &unk_1E5C9A730;
  id v16 = v7;
  id v17 = v9;
  id v15 = v8;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  [v10 deleteBookmarkWithIdentifier:v11 reply:v14];
}

void __89__WBSCyclerDeleteProfileOperation__deleteItemWithIdentifier_inContext_completionHandler___block_invoke(uint64_t a1, char a2)
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