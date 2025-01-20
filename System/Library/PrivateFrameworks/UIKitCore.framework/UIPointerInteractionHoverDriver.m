@interface UIPointerInteractionHoverDriver
@end

@implementation UIPointerInteractionHoverDriver

void __46___UIPointerInteractionHoverDriver_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 32))
    {
      *((unsigned char *)WeakRetained + 32) = 0;
      v3 = WeakRetained;
      unint64_t v2 = [*((id *)WeakRetained + 2) state] - 1;
      id WeakRetained = v3;
      if (v2 <= 1)
      {
        [v3 _updateHover:v3[2] forced:1];
        id WeakRetained = v3;
      }
    }
  }
}

@end