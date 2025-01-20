@interface UIHyperGesture
@end

@implementation UIHyperGesture

uint64_t __34___UIHyperGesture__handleGesture___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getCurrentTranslation:a2];
}

uint64_t __34___UIHyperGesture__handleGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getCurrentVelocity:a2];
}

uint64_t __34___UIHyperGesture__handleGesture___block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _hyperGestureUpdateStateForInteractionChanged:v4];
  }
  return result;
}

uint64_t __34___UIHyperGesture__handleGesture___block_invoke_4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _hyperGestureUpdateStateForInteractionEnded:v4];
  }
  return result;
}

@end