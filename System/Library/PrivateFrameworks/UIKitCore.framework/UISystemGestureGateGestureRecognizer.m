@interface UISystemGestureGateGestureRecognizer
@end

@implementation UISystemGestureGateGestureRecognizer

void __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesBegan___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_0)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 32)) {
      v3 = "YES";
    }
    else {
      v3 = "NO";
    }
    int v4 = 136315138;
    v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Trying to set delaysTouchesBegan to %s on a system gate gesture recognizer - this is unsupported and will have undesired side effects", (uint8_t *)&v4, 0xCu);
  }
}

void __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesEnded___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 32)) {
      v3 = "YES";
    }
    else {
      v3 = "NO";
    }
    int v4 = 136315138;
    v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Trying to set delaysTouchesEnded to %s on a system gate gesture recognizer - this is unsupported and will have undesired side effects", (uint8_t *)&v4, 0xCu);
  }
}

void __64___UISystemGestureGateGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _timeOut];
    id WeakRetained = v2;
  }
}

@end