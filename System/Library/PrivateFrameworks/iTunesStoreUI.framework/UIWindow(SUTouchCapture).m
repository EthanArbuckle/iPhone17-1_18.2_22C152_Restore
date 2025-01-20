@interface UIWindow(SUTouchCapture)
- (SUTouchCaptureView)addTouchCaptureViewWithTag:()SUTouchCapture;
- (void)removeTouchCaptureViewWithTag:()SUTouchCapture;
@end

@implementation UIWindow(SUTouchCapture)

- (SUTouchCaptureView)addTouchCaptureViewWithTag:()SUTouchCapture
{
  uint64_t v5 = objc_msgSend(a1, "viewWithTag:");
  if (v5)
  {
    v6 = (SUTouchCaptureView *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"View with tag exists"];
    }
  }
  else
  {
    [a1 bounds];
    v6 = -[SUTouchCaptureView initWithFrame:]([SUTouchCaptureView alloc], "initWithFrame:", v7, v8, v9, v10);
    [(SUTouchCaptureView *)v6 setTag:a3];
    [a1 addSubview:v6];
  }
  return v6;
}

- (void)removeTouchCaptureViewWithTag:()SUTouchCapture
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "viewWithTag:");
  v2 = (void *)[v1 allTargets];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [v1 removeTarget:*(void *)(*((void *)&v9 + 1) + 8 * v6++) action:0 forControlEvents:0xFFFFFFFFLL];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  id v7 = v1;
  [v1 removeFromSuperview];
  return v1;
}

@end