@interface WBSCyclerTabsTestSuite
- (id)_relativeProbabilitiesForOperationsWithNoTabGroups;
- (id)operations;
- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3;
@end

@implementation WBSCyclerTabsTestSuite

- (id)operations
{
  if (operations_onceToken_0 != -1) {
    dispatch_once(&operations_onceToken_0, &__block_literal_global_42);
  }
  v2 = (void *)operations_operations_0;
  return v2;
}

void __36__WBSCyclerTabsTestSuite_operations__block_invoke()
{
  v11[9] = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(WBSCyclerCreateTabGroupRelatedItemOperation);
  v11[0] = v0;
  v1 = objc_alloc_init(WBSCyclerDeleteTabOperation);
  v11[1] = v1;
  v2 = objc_alloc_init(WBSCyclerMoveTabOperation);
  v11[2] = v2;
  v3 = objc_alloc_init(WBSCyclerModifyTabOperation);
  v11[3] = v3;
  v4 = objc_alloc_init(WBSCyclerCreateProfileOperation);
  v11[4] = v4;
  v5 = objc_alloc_init(WBSCyclerMoveTabGroupOperation);
  v11[5] = v5;
  v6 = objc_alloc_init(WBSCyclerDeleteProfileOperation);
  v11[6] = v6;
  v7 = objc_alloc_init(WBSCyclerModifyProfileOperation);
  v11[7] = v7;
  v8 = objc_alloc_init(WBSCyclerSyncReloadOperation);
  v11[8] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
  v10 = (void *)operations_operations_0;
  operations_operations_0 = v9;
}

- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3
{
  v13[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 numberOfChildren])
  {
    v5 = &unk_1EFC225B8;
    if ([v4 containsChildPassingTest:&__block_literal_global_12])
    {
      if ((unint64_t)[v4 numberOfChildren] < 2)
      {
        v6 = &unk_1EFC225E8;
      }
      else
      {
        v5 = &unk_1EFC225D0;
        v6 = &unk_1EFC225D0;
      }
    }
    else
    {
      v6 = &unk_1EFC225E8;
    }
    v8 = [v4 uniqueIdentifier];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F980C8]];

    if (v9) {
      v10 = &unk_1EFC225E8;
    }
    else {
      v10 = &unk_1EFC22600;
    }
    v13[0] = v5;
    v13[1] = &unk_1EFC22618;
    v13[2] = v6;
    v13[3] = &unk_1EFC225D0;
    v13[4] = &unk_1EFC22618;
    v13[5] = &unk_1EFC22630;
    v13[6] = v10;
    v13[7] = &unk_1EFC22618;
    v13[8] = &unk_1EFC22600;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];
  }
  else
  {
    uint64_t v7 = [(WBSCyclerTabsTestSuite *)self _relativeProbabilitiesForOperationsWithNoTabGroups];
  }
  v11 = (void *)v7;

  return v11;
}

BOOL __77__WBSCyclerTabsTestSuite_relativeProbabilitiesForOperationsWithTopLevelItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 numberOfTabs] != 0;
}

- (id)_relativeProbabilitiesForOperationsWithNoTabGroups
{
  if (_relativeProbabilitiesForOperationsWithNoTabGroups_onceToken != -1) {
    dispatch_once(&_relativeProbabilitiesForOperationsWithNoTabGroups_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)_relativeProbabilitiesForOperationsWithNoTabGroups_relativeProbabilitiesForOperations;
  return v2;
}

void __76__WBSCyclerTabsTestSuite__relativeProbabilitiesForOperationsWithNoTabGroups__block_invoke()
{
  v0 = (void *)_relativeProbabilitiesForOperationsWithNoTabGroups_relativeProbabilitiesForOperations;
  _relativeProbabilitiesForOperationsWithNoTabGroups_relativeProbabilitiesForOperations = (uint64_t)&unk_1EFC22100;
}

@end