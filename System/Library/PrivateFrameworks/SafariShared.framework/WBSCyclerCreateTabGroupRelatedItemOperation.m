@interface WBSCyclerCreateTabGroupRelatedItemOperation
- (void)_createRandomTabGroupFavoriteWithContext:(id)a3 completionHandler:(id)a4;
- (void)_createRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4;
- (void)_createRandomTabWithContext:(id)a3 completionHandler:(id)a4;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerCreateTabGroupRelatedItemOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v9 tabGroupsParent];
  v8 = [v9 randomDescendantOfList:v7 enforcingTitlePrefixValidity:1 passingTest:&__block_literal_global_38];
  if (v8
    && !+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:2])
  {
    if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:5])
    {
      [(WBSCyclerCreateTabGroupRelatedItemOperation *)self _createRandomTabGroupFavoriteWithContext:v9 completionHandler:v6];
    }
    else
    {
      [(WBSCyclerCreateTabGroupRelatedItemOperation *)self _createRandomTabWithContext:v9 completionHandler:v6];
    }
  }
  else
  {
    [(WBSCyclerCreateTabGroupRelatedItemOperation *)self _createRandomTabGroupWithContext:v9 completionHandler:v6];
  }
}

uint64_t __84__WBSCyclerCreateTabGroupRelatedItemOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_createRandomTabWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 tabGroupsParent];
  v8 = [v7 randomTabGroupDescendant];
  if (v8)
  {
    id v9 = [v5 randomItemTitle];
    v10 = +[WBSCyclerRandomnessUtilities randomURL];
    unint64_t v11 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v8 numberOfTabs] + 1);
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      v14 = [v8 title];
      *(_DWORD *)buf = 138544130;
      v28 = v9;
      __int16 v29 = 2114;
      v30 = v10;
      __int16 v31 = 2114;
      v32 = v14;
      __int16 v33 = 2048;
      unint64_t v34 = v11;
      _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Creating tab with title %{public}@ and URL %{public}@ in tab group with title %{public}@ at index %lu", buf, 0x2Au);
    }
    v15 = [v5 testTarget];
    v16 = [v8 uniqueIdentifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __93__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabWithContext_completionHandler___block_invoke;
    v20[3] = &unk_1E5C9A6E0;
    id v25 = v6;
    id v21 = v5;
    id v22 = v8;
    id v23 = v10;
    id v24 = v9;
    unint64_t v26 = v11;
    id v17 = v9;
    id v18 = v10;
    [v15 createBookmarkWithTitle:v17 url:v18 inListWithIdentifier:v16 atIndex:v11 reply:v20];
  }
  else
  {
    v19 = [v5 topLevelItem];
    (*((void (**)(id, void *))v6 + 2))(v6, v19);
  }
}

void __93__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) topLevelItem];
    id v13 = (id)[v3 copy];

    v4 = [*(id *)(a1 + 40) uniqueIdentifier];
    id v5 = [v13 descendantWithUniqueIdentifier:v4];

    id v6 = [WBSCyclerBookmarkLeafRepresentation alloc];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = [v9 UUIDString];
    unint64_t v11 = [(WBSCyclerBookmarkLeafRepresentation *)v6 initWithURL:v7 title:v8 uniqueIdentifier:v10];

    [v5 insertChild:v11 atIndex:*(void *)(a1 + 72) + 1];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
}

- (void)_createRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 randomItemTitle];
  uint64_t v8 = [v5 tabGroupsParent];
  unint64_t v9 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v8 numberOfChildren] + 1);
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = v10;
    uint64_t v12 = [v8 title];
    *(_DWORD *)buf = 138543874;
    unint64_t v26 = v12;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2048;
    unint64_t v30 = v9;
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "Creating tab group in profile %{public}@ with title %{public}@ at index %lu", buf, 0x20u);
  }
  id v13 = [v5 testTarget];
  v14 = [v8 uniqueIdentifier];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupWithContext_completionHandler___block_invoke;
  v19[3] = &unk_1E5C9A6B8;
  id v20 = v5;
  id v21 = v7;
  id v22 = v8;
  id v23 = v6;
  unint64_t v24 = v9;
  id v15 = v8;
  id v16 = v7;
  id v17 = v5;
  id v18 = v6;
  [v13 createBookmarkListWithTitle:v16 inListWithIdentifier:v14 atIndex:v9 reply:v19];
}

void __98__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [WBSCyclerTabGroupRepresentation alloc];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F29128] UUID];
    id v6 = [v5 UUIDString];
    id v17 = [(WBSCyclerItemListRepresentation *)v3 initWithTitle:v4 uniqueIdentifier:v6];

    uint64_t v7 = [WBSCyclerTopScopedBookmarkListRepresentation alloc];
    uint64_t v8 = NSString;
    unint64_t v9 = [(WBSCyclerItemRepresentation *)v17 uniqueIdentifier];
    v10 = [v8 stringWithFormat:@"TopScopedBookmarkList_%@", v9];
    unint64_t v11 = [(WBSCyclerItemListRepresentation *)v7 initWithTitle:&stru_1EFBE3CF8 uniqueIdentifier:v10];

    [(WBSCyclerItemListRepresentation *)v17 insertChild:v11 atIndex:0];
    uint64_t v12 = [*(id *)(a1 + 32) topLevelItem];
    id v13 = (void *)[v12 copy];

    v14 = [*(id *)(a1 + 48) uniqueIdentifier];
    id v15 = [v13 descendantWithUniqueIdentifier:v14];

    [v15 insertChild:v17 atIndex:*(void *)(a1 + 64)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 56);
    id v17 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
}

- (void)_createRandomTabGroupFavoriteWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 tabGroupsParent];
  uint64_t v8 = [v7 randomTabGroupDescendant];
  unint64_t v9 = v8;
  if (v8)
  {
    v10 = [v8 childAtIndex:0];
    if (v10)
    {
      unint64_t v11 = [v5 randomItemTitle];
      uint64_t v12 = +[WBSCyclerRandomnessUtilities randomURL];
      unint64_t v13 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v10 numberOfChildren] + 1);
      v14 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = v14;
        uint64_t v16 = [v9 title];
        *(_DWORD *)buf = 138544130;
        unint64_t v30 = v11;
        __int16 v31 = 2114;
        v32 = v12;
        __int16 v33 = 2114;
        unint64_t v34 = v16;
        __int16 v35 = 2048;
        unint64_t v36 = v13;
        _os_log_impl(&dword_1A6B5F000, v15, OS_LOG_TYPE_INFO, "Creating Tab Group Favorite with title %{public}@ and URL %{public}@ in tab group with title %{public}@ at index %lu", buf, 0x2Au);
      }
      id v17 = [v5 testTarget];
      id v18 = [v10 uniqueIdentifier];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __106__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupFavoriteWithContext_completionHandler___block_invoke;
      v22[3] = &unk_1E5C9A6E0;
      id v27 = v6;
      id v23 = v5;
      id v24 = v10;
      id v25 = v12;
      id v26 = v11;
      unint64_t v28 = v13;
      id v19 = v11;
      id v20 = v12;
      [v17 createBookmarkWithTitle:v19 url:v20 inListWithIdentifier:v18 atIndex:v13 reply:v22];
    }
    else
    {
      id v21 = [v5 topLevelItem];
      (*((void (**)(id, void *))v6 + 2))(v6, v21);
    }
  }
  else
  {
    v10 = [v5 topLevelItem];
    (*((void (**)(id, void *))v6 + 2))(v6, v10);
  }
}

void __106__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupFavoriteWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) topLevelItem];
    id v13 = (id)[v3 copy];

    uint64_t v4 = [*(id *)(a1 + 40) uniqueIdentifier];
    id v5 = [v13 descendantWithUniqueIdentifier:v4];

    id v6 = [WBSCyclerBookmarkLeafRepresentation alloc];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    unint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = [v9 UUIDString];
    unint64_t v11 = [(WBSCyclerBookmarkLeafRepresentation *)v6 initWithURL:v7 title:v8 uniqueIdentifier:v10];

    [v5 insertChild:v11 atIndex:*(void *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
}

@end