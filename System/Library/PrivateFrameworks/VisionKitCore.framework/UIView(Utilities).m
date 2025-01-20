@interface UIView(Utilities)
- (double)vk_backingScaleFactor;
- (double)vk_convertFrameToViewScale:()Utilities shouldRound:;
- (double)vk_safeAreaBounds;
- (double)vk_viewLengthFromWindowLength:()Utilities;
- (double)vk_windowLengthFromViewLength:()Utilities;
- (id)vk_autoFadeOutLayerWithPath:()Utilities fadeOutDelay:;
- (id)vk_autoFadeOutLayerWithQuad:()Utilities fadeOutDelay:;
- (id)vk_autoFadeOutShapePointLayer;
- (id)vk_autoFadeOutShapeRectLayer;
- (id)vk_constraintsToFillLayoutGuide:()Utilities;
- (id)vk_constraintsToFillView:()Utilities;
- (id)vk_renderImageFromViewBackingStoreWithSubrect:()Utilities;
- (uint64_t)setVk_userInteractionEnabled:()Utilities;
- (uint64_t)summaryDescription;
- (uint64_t)vk_autoFadeOutLayerWithPath:()Utilities;
- (uint64_t)vk_autoFadeOutLayerWithQuad:()Utilities;
- (uint64_t)vk_isFlipped;
- (uint64_t)vk_renderImageFromViewBackingStore;
- (uint64_t)vk_setHidden:()Utilities animated:;
- (uint64_t)vk_viewPointRatioFromWindow;
- (uint64_t)vk_windowPointRatioFromView;
- (void)setVk_backgroundColor:()Utilities;
@end

@implementation UIView(Utilities)

- (void)setVk_backgroundColor:()Utilities
{
  id v4 = (id)[a3 copy];
  [a1 setBackgroundColor:v4];
}

- (uint64_t)setVk_userInteractionEnabled:()Utilities
{
  return [a1 setUserInteractionEnabled:1];
}

- (uint64_t)vk_isFlipped
{
  return 1;
}

- (double)vk_backingScaleFactor
{
  v1 = [a1 window];
  v2 = [v1 screen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (double)vk_safeAreaBounds
{
  [a1 bounds];
  double v3 = v2;
  double v5 = v4;
  double v25 = v6;
  double v8 = v7;
  [a1 safeAreaInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (!vk_isiOS() || (objc_msgSend(a1, "vk_viewPointRatioFromWindow"), v17 == 1.0))
  {
    double v18 = v5;
  }
  else
  {
    double v18 = v5;
    if (fabs(v17 + -1.0) >= 0.000000999999997)
    {
      double v10 = 0.0;
      double v12 = 0.0;
      double v14 = 0.0;
      double v16 = 0.0;
    }
  }
  double v19 = v3 + v12;
  double v20 = v18 + v10;
  double v21 = v25 - (v12 + v16);
  double v22 = v8 - (v10 + v14);
  CGFloat v23 = v18;
  if ((objc_msgSend(a1, "vk_isFlipped") & 1) == 0) {
    return VKMFlipRect(v19, v20, v21, v22, v3, v23, v25, v8);
  }
  return v19;
}

- (uint64_t)vk_viewPointRatioFromWindow
{
  return objc_msgSend(a1, "vk_viewLengthFromWindowLength:", 1.0);
}

- (uint64_t)vk_windowPointRatioFromView
{
  return objc_msgSend(a1, "vk_windowLengthFromViewLength:", 1.0);
}

- (uint64_t)vk_setHidden:()Utilities animated:
{
  uint64_t result = [a1 isHidden];
  if (result != a3)
  {
    if (a4)
    {
      int v8 = [a1 isHidden];
      double v9 = 1.0;
      if (v8) {
        double v9 = 0.0;
      }
      objc_msgSend(a1, "setVk_alpha:", v9);
      if ((a3 & 1) == 0) {
        [a1 setHidden:0];
      }
      double v10 = (void *)MEMORY[0x1E4F42FF0];
      [MEMORY[0x1E4F42FF0] inheritedAnimationDuration];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __43__UIView_Utilities__vk_setHidden_animated___block_invoke;
      v13[3] = &unk_1E6BF0CC8;
      v13[4] = a1;
      char v14 = a3;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__UIView_Utilities__vk_setHidden_animated___block_invoke_2;
      v11[3] = &unk_1E6BF1948;
      v11[4] = a1;
      char v12 = a3;
      return objc_msgSend(v10, "animateWithDuration:animations:completion:", v13, v11);
    }
    else
    {
      return [a1 setHidden:a3];
    }
  }
  return result;
}

- (double)vk_viewLengthFromWindowLength:()Utilities
{
  [a1 convertRect:0 fromView:VKMRectWithSize()];
  return v1;
}

- (double)vk_windowLengthFromViewLength:()Utilities
{
  [a1 convertRect:0 toView:VKMRectWithSize()];
  return v1;
}

- (id)vk_autoFadeOutShapeRectLayer
{
  double v1 = [a1 layer];
  double v2 = objc_msgSend(v1, "vk_autoFadeOutShapeRectLayer");

  return v2;
}

- (id)vk_autoFadeOutShapePointLayer
{
  double v1 = [a1 layer];
  double v2 = objc_msgSend(v1, "vk_autoFadeOutShapePointLayer");

  return v2;
}

- (uint64_t)vk_autoFadeOutLayerWithPath:()Utilities
{
  return objc_msgSend(a1, "vk_autoFadeOutLayerWithPath:fadeOutDelay:", 1.0);
}

- (uint64_t)vk_autoFadeOutLayerWithQuad:()Utilities
{
  return objc_msgSend(a1, "vk_autoFadeOutLayerWithQuad:fadeOutDelay:", 1.0);
}

- (id)vk_autoFadeOutLayerWithQuad:()Utilities fadeOutDelay:
{
  double v6 = [a4 path];
  double v7 = objc_msgSend(a1, "vk_autoFadeOutLayerWithPath:fadeOutDelay:", v6, a2);

  return v7;
}

- (id)vk_autoFadeOutLayerWithPath:()Utilities fadeOutDelay:
{
  double v6 = (objc_class *)MEMORY[0x1E4F39C88];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  [a1 bounds];
  objc_msgSend(v8, "setFrame:");
  uint64_t v9 = objc_msgSend(v7, "vk_CGPath");

  [v8 setPath:v9];
  objc_msgSend(MEMORY[0x1E4F428B8], "vk_randomColor");
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

  [v8 setFillColor:0];
  [v8 setLineWidth:2.0];
  id v11 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  char v12 = [a1 layer];
  [v12 addSublayer:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke;
  v15[3] = &unk_1E6BF0D18;
  id v13 = v8;
  id v16 = v13;
  vk_dispatchMainAfterDelay(v15, a2);

  return v13;
}

- (id)vk_constraintsToFillView:()Utilities
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = a1;
  id v7 = v4;
  if (v7)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v6 leadingAnchor];
    uint64_t v9 = [v7 leadingAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    [v5 addObject:v10];

    id v11 = [v6 trailingAnchor];
    char v12 = [v7 trailingAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12];
    [v5 addObject:v13];

    char v14 = [v6 topAnchor];
    double v15 = [v7 topAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    [v5 addObject:v16];

    double v17 = [v6 bottomAnchor];
    double v18 = [v7 bottomAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18];
    [v5 addObject:v19];
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((v2) != nil)", "-[UIView(Utilities) vk_constraintsToFillView:]", 0, 0, @"Expected non-nil value for '%s'", "v2");
  }
  double v20 = (void *)[v5 copy];

  return v20;
}

- (id)vk_renderImageFromViewBackingStoreWithSubrect:()Utilities
{
  id v10 = [MEMORY[0x1E4F42A60] defaultFormat];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v10, a4, a5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__UIView_Utilities__vk_renderImageFromViewBackingStoreWithSubrect___block_invoke;
  v14[3] = &unk_1E6BF1970;
  v14[4] = a1;
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  *(double *)&v14[8] = a5;
  char v12 = [v11 imageWithActions:v14];

  return v12;
}

- (uint64_t)vk_renderImageFromViewBackingStore
{
  [a1 bounds];
  return objc_msgSend(a1, "vk_renderImageFromViewBackingStoreWithSubrect:");
}

- (id)vk_constraintsToFillLayoutGuide:()Utilities
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = a1;
  id v7 = v6;
  if (v4)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v7 leadingAnchor];
    uint64_t v9 = [v4 leadingAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    [v5 addObject:v10];

    id v11 = [v7 trailingAnchor];
    char v12 = [v4 trailingAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12];
    [v5 addObject:v13];

    char v14 = [v7 topAnchor];
    double v15 = [v4 topAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    [v5 addObject:v16];

    double v17 = [v7 bottomAnchor];
    double v18 = [v4 bottomAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18];
    [v5 addObject:v19];
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((layoutGuide) != nil)", "-[UIView(Utilities) vk_constraintsToFillLayoutGuide:]", 0, 0, @"Expected non-nil value for '%s'", "layoutGuide");
  }
  double v20 = (void *)[v5 copy];

  return v20;
}

- (double)vk_convertFrameToViewScale:()Utilities shouldRound:
{
  char v12 = [a1 traitCollection];
  [v12 displayScale];
  double v14 = VKMRectForScale(a7, a2, a3, a4, a5, v13);

  return v14;
}

- (uint64_t)summaryDescription
{
  [a1 frame];
  return VKMUIStringForRect(v1, v2, v3, v4);
}

@end