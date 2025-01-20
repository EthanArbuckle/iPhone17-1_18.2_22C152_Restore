@interface NSISEngine
- (uint64_t)_UIKitPerformPendingChangeNotifications;
@end

@implementation NSISEngine

- (uint64_t)_UIKitPerformPendingChangeNotifications
{
  if (result)
  {
    v1 = (void *)result;
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIKitEngineTracking, @"UIKitEngineTracking") & 1) != 0|| byte_1EB2579DC)
    {
      [v1 _setUIKitEngineTrackingOn:1];
    }
    return [v1 performPendingChangeNotifications];
  }
  return result;
}

uint64_t __55__NSISEngine__UILayoutEngineStatistics___UIKitRowCount__block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  byte_1EB25A5B1 = result & 1;
  return result;
}

uint64_t __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x40000000) != 0) {
    return *(_DWORD *)(a1 + 32) + (a2 & 0xBFFFFFFF);
  }
  return a2;
}

uint64_t __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x40000000) != 0) {
    return *(_DWORD *)(a1 + 32) + (a2 & 0xBFFFFFFF);
  }
  return a2;
}

void __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  v4 = +[UIColor whiteColor];
  [v4 setFill];

  CGContextFillRect(v3, *(CGRect *)(a1 + 48));
  CGContextSetLineWidth(v3, *(double *)(a1 + 80) * 0.25);
  uint64_t v5 = *(void *)(a1 + 88);
  if (*(_DWORD *)(v5 + 24))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(v5 + 28) + v6;
      unsigned int v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      unsigned int v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      double v11 = *(double *)(a1 + 80);
      double v12 = v11 * (double)v9;
      double v13 = v11 * (double)v10;
      char v14 = *(unsigned char *)(v8 + 8);
      if ((v14 & 4) != 0)
      {
        v18 = +[UIColor blackColor];
        [v18 setFill];

        v22.origin.x = v12;
        v22.origin.y = v13;
        v22.size.width = v11;
        v22.size.height = v11;
        CGContextFillRect(v3, v22);
        char v14 = *(unsigned char *)(v8 + 8);
        if (v14)
        {
LABEL_10:
          v19 = +[UIColor blueColor];
          [v19 setStroke];

          v23.origin.x = v12;
          v23.origin.y = v13;
          v23.size.width = v11;
          v23.size.height = v11;
          CGContextClipToRect(v3, v23);
          v24.origin.x = v12;
          v24.origin.y = v13;
          v24.size.width = v11;
          v24.size.height = v11;
          CGContextStrokeRect(v3, v24);
          CGContextResetClip(v3);
          if ((*(unsigned char *)(v8 + 8) & 2) == 0) {
            goto LABEL_7;
          }
LABEL_6:
          v15 = +[UIColor redColor];
          [v15 setFill];

          v20.size.width = *(CGFloat *)(a1 + 80);
          CGFloat v16 = v20.size.width * 0.125;
          CGFloat v17 = v20.size.width * 0.125 * 0.5;
          v20.origin.y = v13 + v20.size.width * 0.5 - v17;
          v20.origin.x = v12;
          v20.size.height = v20.size.width * 0.125;
          CGContextFillRect(v3, v20);
          v21.size.height = *(CGFloat *)(a1 + 80);
          v21.origin.x = v12 + v21.size.height * 0.5 - v17;
          v21.origin.y = v13;
          v21.size.width = v16;
          CGContextFillRect(v3, v21);
          goto LABEL_7;
        }
      }
      else if (*(unsigned char *)(v8 + 8))
      {
        goto LABEL_10;
      }
      if ((v14 & 2) != 0) {
        goto LABEL_6;
      }
LABEL_7:
      ++v7;
      uint64_t v5 = *(void *)(a1 + 88);
      v6 += 9;
    }
    while (v7 < *(unsigned int *)(v5 + 24));
  }
}

@end