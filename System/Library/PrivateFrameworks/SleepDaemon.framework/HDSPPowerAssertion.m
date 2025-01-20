@interface HDSPPowerAssertion
@end

@implementation HDSPPowerAssertion

uint64_t __39___HDSPPowerAssertion_releaseAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_release");
}

@end