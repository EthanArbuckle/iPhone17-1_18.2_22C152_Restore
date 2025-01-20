@interface UIHomeAffordanceGateGestureRecognizer
@end

@implementation UIHomeAffordanceGateGestureRecognizer

void __69___UIHomeAffordanceGateGestureRecognizer_tapRecognizerRecognizedTap___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("HomeAffordanceGestureGate", &kGateTimeout_block_invoke___s_category)
                    + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 134217984;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "<%p> Home affordance gate timed out.", (uint8_t *)&v3, 0xCu);
  }
  [WeakRetained setState:5];
}

@end