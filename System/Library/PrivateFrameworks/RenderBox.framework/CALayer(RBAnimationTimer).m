@interface CALayer(RBAnimationTimer)
- (uint64_t)screen;
@end

@implementation CALayer(RBAnimationTimer)

- (uint64_t)screen
{
  if (screen_once != -1) {
    dispatch_once_f(&screen_once, 0, (dispatch_function_t)screen_init);
  }
  uint64_t v2 = uiview_cls;
  if (uiview_cls) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  while (1)
  {
    if (v2)
    {
      uint64_t Delegate = CALayerGetDelegate();
      if (Delegate)
      {
        v6 = (void *)Delegate;
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
    }
    if (!CALayerGetSuperlayer()) {
      return 0;
    }
    uint64_t v2 = uiview_cls;
  }
  v7 = (void *)[v6 window];
  return [v7 screen];
}

@end