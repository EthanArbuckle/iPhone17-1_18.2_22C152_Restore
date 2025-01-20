@interface WBSCyclerMoveTabOperation
- (id)_randomTabGroupInContext:(id)a3 requireTabs:(BOOL)a4 notIntersecting:(id)a5;
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerMoveTabOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [MEMORY[0x1E4F1CAD0] set];
  v9 = [(WBSCyclerMoveTabOperation *)self _randomTabGroupInContext:v6 requireTabs:1 notIntersecting:v8];

  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  v11 = [(WBSCyclerMoveTabOperation *)self _randomTabGroupInContext:v6 requireTabs:0 notIntersecting:v10];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v13 = [v6 topLevelItem];
    v7[2](v7, v13);
  }
  else
  {
    v14 = [v9 randomTabDescendant];
    unint64_t v15 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", [v11 numberOfTabs] + 1);
    v16 = [v6 testTarget];
    v17 = [v14 uniqueIdentifier];
    v18 = [v11 uniqueIdentifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__WBSCyclerMoveTabOperation_executeWithContext_completionHandler___block_invoke;
    v20[3] = &unk_1E5C9A6E0;
    v25 = v7;
    id v21 = v6;
    id v22 = v9;
    id v23 = v11;
    id v24 = v14;
    unint64_t v26 = v15;
    id v19 = v14;
    [v16 moveBookmarkWithIdentifier:v17 intoListWithIdentifier:v18 atIndex:v15 reply:v20];
  }
}

void __66__WBSCyclerMoveTabOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) topLevelItem];
    id v15 = (id)[v3 copy];

    v4 = [*(id *)(a1 + 40) uniqueIdentifier];
    v5 = [v15 descendantWithUniqueIdentifier:v4];

    id v6 = [*(id *)(a1 + 48) uniqueIdentifier];
    v7 = [v15 descendantWithUniqueIdentifier:v6];

    v8 = [*(id *)(a1 + 56) uniqueIdentifier];
    v9 = [v15 descendantWithUniqueIdentifier:v8];

    [v5 deleteChild:v9];
    if ([v5 numberOfChildren] == 1)
    {
      v10 = [WBSCyclerBookmarkLeafRepresentation alloc];
      v11 = [MEMORY[0x1E4F29128] UUID];
      BOOL v12 = [v11 UUIDString];
      v13 = [(WBSCyclerBookmarkLeafRepresentation *)v10 initWithURL:0 title:@"Start Page" uniqueIdentifier:v12];

      [v5 insertChild:v13 atIndex:1];
    }
    [v7 insertChild:v9 atIndex:*(void *)(a1 + 72) + 1];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 64);
    id v15 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }
}

- (id)_randomTabGroupInContext:(id)a3 requireTabs:(BOOL)a4 notIntersecting:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 topLevelItem];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__WBSCyclerMoveTabOperation__randomTabGroupInContext_requireTabs_notIntersecting___block_invoke;
  v14[3] = &unk_1E5C9A7A8;
  BOOL v17 = a4;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  BOOL v12 = [v11 randomDescendantOfList:v9 enforcingTitlePrefixValidity:1 passingTest:v14];

  return v12;
}

uint64_t __82__WBSCyclerMoveTabOperation__randomTabGroupInContext_requireTabs_notIntersecting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = v4;
    if (*(unsigned char *)(a1 + 48) && ![v4 numberOfTabs])
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) topLevelItem];
      if (v6 == v5) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = [*(id *)(a1 + 40) containsObject:v5] ^ 1;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end