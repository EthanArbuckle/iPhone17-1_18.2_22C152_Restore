@interface WBSCyclerMoveTabGroupOperation
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerMoveTabGroupOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 tabGroupsParent];
  v8 = [v5 topLevelItem];
  v9 = [v8 randomProfileDescendant];

  if (v7 && v9)
  {
    v10 = [v7 randomTabGroupDescendant];
    if ([v9 numberOfChildren]) {
      unint64_t v11 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v9 numberOfChildren]);
    }
    else {
      unint64_t v11 = 0;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      [v10 title];
      v15 = unint64_t v22 = v11;
      v16 = [v10 uniqueIdentifier];
      v17 = [v7 title];
      v18 = [v9 title];
      *(_DWORD *)buf = 138544386;
      v31 = v15;
      __int16 v32 = 2114;
      v33 = v16;
      __int16 v34 = 2114;
      v35 = v17;
      __int16 v36 = 2114;
      v37 = v18;
      __int16 v38 = 2048;
      unint64_t v39 = v22;
      _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_INFO, "Moving Tab Group with title %{public}@ (identifier: %{public}@) from profile with title %{public}@ to profile with title %{public}@ at index %lu", buf, 0x34u);

      unint64_t v11 = v22;
    }
    v19 = [v5 testTarget];
    v20 = [v10 uniqueIdentifier];
    v21 = [v9 uniqueIdentifier];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__WBSCyclerMoveTabGroupOperation_executeWithContext_completionHandler___block_invoke;
    v23[3] = &unk_1E5C9A6E0;
    id v28 = v6;
    id v24 = v5;
    id v25 = v7;
    id v26 = v9;
    id v27 = v10;
    unint64_t v29 = v11;
    id v12 = v10;
    [v19 moveBookmarkWithIdentifier:v20 intoListWithIdentifier:v21 atIndex:v11 reply:v23];
  }
  else
  {
    id v12 = [v5 topLevelItem];
    (*((void (**)(id, id))v6 + 2))(v6, v12);
  }
}

void __71__WBSCyclerMoveTabGroupOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) topLevelItem];
    id v11 = (id)[v3 copy];

    v4 = [*(id *)(a1 + 40) uniqueIdentifier];
    id v5 = [v11 descendantWithUniqueIdentifier:v4];

    id v6 = [*(id *)(a1 + 48) uniqueIdentifier];
    v7 = [v11 descendantWithUniqueIdentifier:v6];

    v8 = [*(id *)(a1 + 56) uniqueIdentifier];
    v9 = [v11 descendantWithUniqueIdentifier:v8];

    [v5 deleteChild:v9];
    [v7 insertChild:v9 atIndex:*(void *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
}

@end