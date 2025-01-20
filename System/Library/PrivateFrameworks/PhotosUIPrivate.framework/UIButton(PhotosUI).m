@interface UIButton(PhotosUI)
- (uint64_t)pu_setRTLAwareContentEdgeInsets:()PhotosUI;
- (void)pu_sendActionForControlEventsWithHighlightTimeout:()PhotosUI;
- (void)pu_setTitle:()PhotosUI andAccessibilityTitle:withFallback:forState:;
@end

@implementation UIButton(PhotosUI)

- (void)pu_sendActionForControlEventsWithHighlightTimeout:()PhotosUI
{
  objc_msgSend(a1, "sendActionsForControlEvents:");
  [a1 setHighlighted:1];
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__UIButton_PhotosUI__pu_sendActionForControlEventsWithHighlightTimeout___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = a1;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

- (void)pu_setTitle:()PhotosUI andAccessibilityTitle:withFallback:forState:
{
  id v14 = a3;
  id v10 = a4;
  v11 = a5;
  v12 = v11;
  if (pu_setTitle_andAccessibilityTitle_withFallback_forState__onceToken != -1)
  {
    dispatch_once(&pu_setTitle_andAccessibilityTitle_withFallback_forState__onceToken, &__block_literal_global_103342);
    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    [a1 setImage:0 forState:a6];
    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  if ([v14 length] && !pu_setTitle_andAccessibilityTitle_withFallback_forState__forceFallback) {
    goto LABEL_5;
  }
  v13 = v12[2](v12);
  [a1 setImage:v13 forState:a6];

  id v14 = 0;
LABEL_7:
  [a1 setTitle:v14 forState:a6];
  [a1 setAccessibilityLabel:v10];
}

- (uint64_t)pu_setRTLAwareContentEdgeInsets:()PhotosUI
{
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "pu_currentCharacterDirection");
  if (v10 == 2) {
    double v11 = a5;
  }
  else {
    double v11 = a3;
  }
  if (v10 == 2) {
    double v12 = a3;
  }
  else {
    double v12 = a5;
  }
  return objc_msgSend(a1, "setContentEdgeInsets:", a2, v11, a4, v12);
}

@end