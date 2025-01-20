@interface UIDoubleTapInteraction
@end

@implementation UIDoubleTapInteraction

void __38___UIDoubleTapInteraction__captureTap__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((void *)WeakRetained + 6))
    {
      if (os_variant_has_internal_diagnostics())
      {
        v6 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unexpected interaction state", buf, 2u);
        }
      }
      else
      {
        v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category_2) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Unexpected interaction state", v7, 2u);
        }
      }
    }
    if (objc_msgSend(v3, "continueProcessingSecondTapAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48)))
    {
      v4 = [v3 doubleTapAction];
      [v4 touch];
    }
  }
}

@end