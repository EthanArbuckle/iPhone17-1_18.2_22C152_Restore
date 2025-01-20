@interface UIStatusBarThermalItem
@end

@implementation UIStatusBarThermalItem

void __42___UIStatusBarThermalItem_imageForUpdate___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 set];
  if ([*(id *)(a1 + 40) sunlightMode])
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v6 = 0;
    }
    else {
      v6 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSetLineWidth(v6, 3.0);
    id v7 = [v4 format];
    [v7 bounds];
    objc_msgSend(v4, "strokeRect:");
  }
  else
  {
    id v7 = [v4 format];
    [v7 bounds];
    objc_msgSend(v4, "fillRect:");
  }
}

@end