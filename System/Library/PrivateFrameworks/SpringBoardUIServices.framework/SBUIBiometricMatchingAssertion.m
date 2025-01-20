@interface SBUIBiometricMatchingAssertion
@end

@implementation SBUIBiometricMatchingAssertion

void __73___SBUIBiometricMatchingAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  [v2 appendString:v3 withName:@"identifier"];

  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) reason];
  [v4 appendString:v5 withName:@"reason"];

  v6 = *(void **)(a1 + 32);
  v7 = NSStringFromSBUIBiometricMatchMode(*(void *)(*(void *)(a1 + 40) + 56));
  [v6 appendString:v7 withName:@"matchMode"];

  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "restartCount"), @"restartCount");
  v9 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) operations];
  v10 = [v11 allObjects];
  [v9 appendArraySection:v10 withName:@"operations" skipIfEmpty:0];
}

@end