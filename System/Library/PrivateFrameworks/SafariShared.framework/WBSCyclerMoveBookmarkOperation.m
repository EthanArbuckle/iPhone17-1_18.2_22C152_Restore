@interface WBSCyclerMoveBookmarkOperation
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerMoveBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 topLevelItem];
  v8 = [v5 randomValidStrictDescendantOfTopLevelItem];
  v9 = v8;
  if (v8)
  {
    v24 = v6;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke;
    v31[3] = &unk_1E5C9A758;
    id v10 = v8;
    id v32 = v10;
    v11 = [v5 randomDescendantOfList:v7 enforcingTitlePrefixValidity:1 passingTest:v31];
    unint64_t v12 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v11 numberOfChildren] + (objc_msgSend(v11, "containsChild:", v10) ^ 1));
    v13 = [v10 uniqueIdentifier];
    v14 = [v11 uniqueIdentifier];
    v15 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      [v10 title];
      v17 = v23 = v7;
      v18 = [v11 title];
      v19 = [v11 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      v34 = v17;
      __int16 v35 = 2114;
      v36 = v13;
      __int16 v37 = 2114;
      v38 = v18;
      __int16 v39 = 2114;
      v40 = v19;
      __int16 v41 = 1024;
      int v42 = v12;
      _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_INFO, "Moving bookmark (title: %{public}@, identifier: %{public}@) into folder (title: %{public}@, identifier: %{public}@) at index %d", buf, 0x30u);

      v7 = v23;
    }
    v20 = [v5 testTarget];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke_2;
    v25[3] = &unk_1E5C9A6B8;
    id v6 = v24;
    id v29 = v24;
    id v26 = v7;
    id v27 = v13;
    id v28 = v14;
    unint64_t v30 = v12;
    id v21 = v14;
    id v22 = v13;
    [v20 moveBookmarkWithIdentifier:v22 intoListWithIdentifier:v21 atIndex:v12 reply:v25];
  }
  else
  {
    (*((void (**)(id, void *))v6 + 2))(v6, v7);
  }
}

uint64_t __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || *(id *)(a1 + 32) == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = [*(id *)(a1 + 32) containsDescendant:v3] ^ 1;
    }
    else {
      uint64_t v4 = 1;
    }
  }

  return v4;
}

void __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    id v6 = (id)[*(id *)(a1 + 32) copy];
    id v3 = [v6 descendantWithUniqueIdentifier:*(void *)(a1 + 40)];
    uint64_t v4 = [v6 descendantWithUniqueIdentifier:*(void *)(a1 + 48)];
    [v6 deleteDescendant:v3];
    [v4 insertChild:v3 atIndex:*(void *)(a1 + 64)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

@end