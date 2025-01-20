@interface WBSCyclerModifyBookmarkOperation
- (void)_changeTitleOfBookmark:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)_changeURLOfBookmark:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerModifyBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 randomValidStrictDescendantOfTopLevelItem];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke;
    v24[3] = &unk_1E5C9A780;
    v24[4] = self;
    id v10 = v8;
    id v25 = v10;
    id v11 = v6;
    id v26 = v11;
    id v12 = v7;
    id v27 = v12;
    v13 = (void *)MEMORY[0x1AD0C4F80](v24);
    [v9 addObject:v13];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke_2;
      v19 = &unk_1E5C9A780;
      v20 = self;
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      v14 = (void *)MEMORY[0x1AD0C4F80](&v16);
      objc_msgSend(v9, "addObject:", v14, v16, v17, v18, v19, v20);
    }
    v15 = +[WBSCyclerRandomnessUtilities randomElementOfArray:v9];
    v15[2]();
  }
  else
  {
    v9 = [v6 topLevelItem];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

uint64_t __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeTitleOfBookmark:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeURLOfBookmark:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_changeTitleOfBookmark:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 randomItemTitle];
  id v11 = [v7 uniqueIdentifier];
  id v12 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = [v7 title];
    *(_DWORD *)buf = 138543874;
    id v27 = v11;
    __int16 v28 = 2114;
    v29 = v14;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Changing title of bookmark (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
  }
  v15 = [v9 topLevelItem];
  uint64_t v16 = [v9 testTarget];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__WBSCyclerModifyBookmarkOperation__changeTitleOfBookmark_withContext_completionHandler___block_invoke;
  v21[3] = &unk_1E5C9A640;
  id v22 = v15;
  id v23 = v11;
  id v24 = v10;
  id v25 = v8;
  id v17 = v10;
  id v18 = v11;
  id v19 = v15;
  id v20 = v8;
  [v16 setTitle:v17 forBookmarkWithIdentifier:v18 reply:v21];
}

void __89__WBSCyclerModifyBookmarkOperation__changeTitleOfBookmark_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v5 = (id)[*(id *)(a1 + 32) copy];
    v3 = [v5 descendantWithUniqueIdentifier:*(void *)(a1 + 40)];
    [v3 setTitle:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
}

- (void)_changeURLOfBookmark:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[WBSCyclerRandomnessUtilities randomURL];
  id v11 = [v7 uniqueIdentifier];
  id v12 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = [v7 url];
    *(_DWORD *)buf = 138543874;
    id v27 = v11;
    __int16 v28 = 2114;
    v29 = v14;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Changing URL of bookmark (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);
  }
  v15 = [v9 topLevelItem];
  uint64_t v16 = [v9 testTarget];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__WBSCyclerModifyBookmarkOperation__changeURLOfBookmark_withContext_completionHandler___block_invoke;
  v21[3] = &unk_1E5C9A640;
  id v22 = v15;
  id v23 = v11;
  id v24 = v10;
  id v25 = v8;
  id v17 = v10;
  id v18 = v11;
  id v19 = v15;
  id v20 = v8;
  [v16 setURL:v17 forBookmarkWithIdentifier:v18 reply:v21];
}

void __87__WBSCyclerModifyBookmarkOperation__changeURLOfBookmark_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v5 = (id)[*(id *)(a1 + 32) copy];
    v3 = [v5 descendantWithUniqueIdentifier:*(void *)(a1 + 40)];
    [v3 setURL:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
}

@end