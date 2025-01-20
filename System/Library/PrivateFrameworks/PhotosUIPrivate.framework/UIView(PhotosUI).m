@interface UIView(PhotosUI)
+ (double)pu_layoutMarginWidthForCurrentScreenSize;
+ (long)pu_springOscillationRootAtIndex:()PhotosUI forMass:stiffness:damping:initialVelocity:;
+ (uint64_t)pu_animateWithDuration:()PhotosUI animations:;
+ (uint64_t)pu_animateWithDuration:()PhotosUI animations:completion:;
+ (uint64_t)pu_animateWithEnforcedDuration:()PhotosUI animations:completion:;
+ (void)_pu_animateWithDuration:()PhotosUI enforced:animations:completion:;
+ (void)pu_transitionWithView:()PhotosUI duration:options:animations:completion:;
- (uint64_t)pu_addTransform:()PhotosUI;
- (uint64_t)pu_setCenterAndBoundsForFrameRect:()PhotosUI;
- (void)pu_removeAllGeometryAnimationsRecursively:()PhotosUI;
@end

@implementation UIView(PhotosUI)

- (void)pu_removeAllGeometryAnimationsRecursively:()PhotosUI
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [a1 layer];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v4 = [v3 animationKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v9 hasPrefix:@"position"] & 1) != 0
          || ([v9 hasPrefix:@"bounds"] & 1) != 0
          || ([v9 hasPrefix:@"opacity"] & 1) != 0
          || [v9 hasPrefix:@"transform"])
        {
          [v3 removeAnimationForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  if (a3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = [a1 subviews];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "pu_removeAllGeometryAnimationsRecursively:", 1);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (uint64_t)pu_setCenterAndBoundsForFrameRect:()PhotosUI
{
  double MidX = CGRectGetMidX(*(CGRect *)&a2);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  objc_msgSend(a1, "setCenter:", MidX, CGRectGetMidY(v15));
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  return objc_msgSend(a1, "setBounds:", v11, v12, a4, a5);
}

- (uint64_t)pu_addTransform:()PhotosUI
{
  memset(&v10, 0, sizeof(v10));
  [a1 transform];
  CGAffineTransform t1 = v10;
  memset(&v9, 0, sizeof(v9));
  long long v5 = a3[1];
  *(_OWORD *)&v7.a = *a3;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = a3[2];
  CGAffineTransformConcat(&v9, &t1, &v7);
  CGAffineTransform t1 = v9;
  return [a1 setTransform:&t1];
}

+ (long)pu_springOscillationRootAtIndex:()PhotosUI forMass:stiffness:damping:initialVelocity:
{
  double v11 = sqrt(a4 * a5);
  double v12 = a6 / (v11 + v11);
  if (v12 >= 1.0)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"UIView+PhotosUI.m", 75, @"The specified damped spring system is critically or over damped, and doesn't oscillate." object file lineNumber description];
  }
  double v13 = sqrt(a5 / a4);
  return -(atan(1.0 / (-(a7 - v12 * v13) / (v13 * sqrt(1.0 - v12 * v12)))) - (double)a3 * 3.14159265) / (v13 * a5);
}

+ (void)pu_transitionWithView:()PhotosUI duration:options:animations:completion:
{
  id v11 = a7;
  id v13 = v11;
  if (a1 == 0.0)
  {
    (*(void (**)(uint64_t, id))(a6 + 16))(a6, v11);
    double v12 = v13;
    if (!v13) {
      goto LABEL_6;
    }
    (*((void (**)(void))v13 + 2))();
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] transitionWithView:a4 duration:a5 options:a6 animations:v11 completion:a1];
  }
  double v12 = v13;
LABEL_6:
}

+ (uint64_t)pu_animateWithDuration:()PhotosUI animations:
{
  return objc_msgSend(a1, "_pu_animateWithDuration:enforced:animations:completion:", 0, a3, 0);
}

+ (uint64_t)pu_animateWithDuration:()PhotosUI animations:completion:
{
  return objc_msgSend(a1, "_pu_animateWithDuration:enforced:animations:completion:", 0, a3, a4);
}

+ (uint64_t)pu_animateWithEnforcedDuration:()PhotosUI animations:completion:
{
  return objc_msgSend(a1, "_pu_animateWithDuration:enforced:animations:completion:", 1, a3, a4);
}

+ (void)_pu_animateWithDuration:()PhotosUI enforced:animations:completion:
{
  CGAffineTransform v9 = a5;
  CGAffineTransform v10 = a6;
  if (a1 == 0.0)
  {
    v9[2](v9);
    if (v10) {
      v10[2](v10, 1);
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:a1];
    if (v10)
    {
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__UIView_PhotosUI___pu_animateWithDuration_enforced_animations_completion___block_invoke;
      block[3] = &unk_1E5F2EBA0;
      id v13 = v10;
      dispatch_after(v11, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:v10 completion:a1];
  }
}

+ (double)pu_layoutMarginWidthForCurrentScreenSize
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;

  if (v2 >= v4) {
    double v2 = v4;
  }
  long long v5 = [MEMORY[0x1E4F902F8] legacyLayoutMarginWidthInterpolator];
  [v5 valueForMetric:v2];
  double v7 = v6;

  return v7;
}

@end