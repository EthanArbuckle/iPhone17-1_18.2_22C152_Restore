@interface UIHomeAffordanceRegistrationTokenForNotifierAndRecord
@end

@implementation UIHomeAffordanceRegistrationTokenForNotifierAndRecord

void ___UIHomeAffordanceRegistrationTokenForNotifierAndRecord_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _unregisterHomeAffordanceObserverForRecord:*(void *)(a1 + 32)];
}

@end