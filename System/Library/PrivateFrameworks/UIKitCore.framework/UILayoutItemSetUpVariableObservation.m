@interface UILayoutItemSetUpVariableObservation
@end

@implementation UILayoutItemSetUpVariableObservation

void ___UILayoutItemSetUpVariableObservation_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "nsis_valueOfVariable:didChangeInEngine:", v2, v3);
}

@end