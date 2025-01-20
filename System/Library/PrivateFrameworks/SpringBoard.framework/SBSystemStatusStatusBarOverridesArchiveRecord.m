@interface SBSystemStatusStatusBarOverridesArchiveRecord
@end

@implementation SBSystemStatusStatusBarOverridesArchiveRecord

uint64_t __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) statusBarData];
}

uint64_t __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressedBackgroundActivityIdentifiers];
}

void __98___SBSystemStatusStatusBarOverridesArchiveRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) statusBarData];
  id v4 = (id)[v2 appendObject:v3 withName:@"statusBarData" skipIfNil:1];

  v5 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) suppressedBackgroundActivityIdentifiers];
  v6 = [v8 allObjects];
  v7 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v5 appendArraySection:v6 withName:@"suppressedBackgroundActivityIdentifiers" multilinePrefix:v7 skipIfEmpty:1 objectTransformer:&__block_literal_global_60_1];
}

uint64_t __98___SBSystemStatusStatusBarOverridesArchiveRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2()
{
  return STBackgroundActivityIdentifierDescription();
}

@end