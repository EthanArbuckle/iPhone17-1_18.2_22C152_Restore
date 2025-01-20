@interface SBUISimulatedLockoutAssertion
@end

@implementation SBUISimulatedLockoutAssertion

void __72___SBUISimulatedLockoutAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  [v2 appendString:v3 withName:@"identifier"];

  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) reason];
  [v4 appendString:v5 withName:@"reason"];

  v6 = *(void **)(a1 + 32);
  NSStringFromSBUIBiometricLockoutState(*(void *)(*(void *)(a1 + 40) + 48));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendString:v7 withName:@"lockoutState"];
}

@end