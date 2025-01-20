@interface WBSCyclerCreateBookmarkOperation
- (id)_randomListWithContext:(id)a3;
- (void)_createRandomLeafWithContext:(id)a3 completionHandler:(id)a4;
- (void)_createRandomListWithContext:(id)a3 completionHandler:(id)a4;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerCreateBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:2])
  {
    [(WBSCyclerCreateBookmarkOperation *)self _createRandomLeafWithContext:v7 completionHandler:v6];
  }
  else
  {
    [(WBSCyclerCreateBookmarkOperation *)self _createRandomListWithContext:v7 completionHandler:v6];
  }
}

- (id)_randomListWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 topLevelItem];
  v5 = [v3 randomDescendantOfList:v4 enforcingTitlePrefixValidity:1 passingTest:&__block_literal_global_37];

  return v5;
}

uint64_t __59__WBSCyclerCreateBookmarkOperation__randomListWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_createRandomListWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WBSCyclerCreateBookmarkOperation *)self _randomListWithContext:v6];
  v9 = [v8 uniqueIdentifier];
  v10 = [v6 randomItemTitle];
  unint64_t v11 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v8 numberOfChildren] + 1);
  v12 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v9;
    __int16 v28 = 1024;
    int v29 = v11;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Creating bookmark list with title %{public}@ in list with identifier %{public}@ at index %d", buf, 0x1Cu);
  }
  v13 = [v6 testTarget];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__WBSCyclerCreateBookmarkOperation__createRandomListWithContext_completionHandler___block_invoke;
  v18[3] = &unk_1E5C9A6B8;
  id v19 = v6;
  id v20 = v9;
  id v21 = v10;
  id v22 = v7;
  unint64_t v23 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  [v13 createBookmarkListWithTitle:v14 inListWithIdentifier:v15 atIndex:v11 reply:v18];
}

void __83__WBSCyclerCreateBookmarkOperation__createRandomListWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) topLevelItem];
    id v11 = (id)[v3 copy];

    v4 = [v11 descendantWithUniqueIdentifier:*(void *)(a1 + 40)];
    v5 = [WBSCyclerItemListRepresentation alloc];
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [v7 UUIDString];
    v9 = [(WBSCyclerItemListRepresentation *)v5 initWithTitle:v6 uniqueIdentifier:v8];

    [v4 insertChild:v9 atIndex:*(void *)(a1 + 64)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
}

- (void)_createRandomLeafWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WBSCyclerCreateBookmarkOperation *)self _randomListWithContext:v6];
  v9 = [v8 uniqueIdentifier];
  uint64_t v10 = [v6 randomItemTitle];
  id v11 = +[WBSCyclerRandomnessUtilities randomURL];
  unint64_t v12 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v8 numberOfChildren] + 1);
  v13 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v28 = v10;
    __int16 v29 = 2114;
    uint64_t v30 = v11;
    __int16 v31 = 2114;
    v32 = v9;
    __int16 v33 = 1024;
    int v34 = v12;
    _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Creating bookmark leaf with title %{public}@ and URL %{public}@ in list with identifier %{public}@ at index %d", buf, 0x26u);
  }
  id v14 = [v6 testTarget];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__WBSCyclerCreateBookmarkOperation__createRandomLeafWithContext_completionHandler___block_invoke;
  v20[3] = &unk_1E5C9A6E0;
  id v21 = v6;
  id v22 = v9;
  id v23 = v11;
  id v24 = v10;
  id v25 = v7;
  unint64_t v26 = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v9;
  id v18 = v6;
  id v19 = v7;
  [v14 createBookmarkWithTitle:v15 url:v16 inListWithIdentifier:v17 atIndex:v12 reply:v20];
}

void __83__WBSCyclerCreateBookmarkOperation__createRandomLeafWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) topLevelItem];
    id v12 = (id)[v3 copy];

    v4 = [v12 descendantWithUniqueIdentifier:*(void *)(a1 + 40)];
    v5 = [WBSCyclerBookmarkLeafRepresentation alloc];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [(WBSCyclerBookmarkLeafRepresentation *)v5 initWithURL:v6 title:v7 uniqueIdentifier:v9];

    [v4 insertChild:v10 atIndex:*(void *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }
}

@end