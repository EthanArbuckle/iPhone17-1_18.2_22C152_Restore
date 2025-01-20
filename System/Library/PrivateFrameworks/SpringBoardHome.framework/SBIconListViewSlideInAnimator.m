@interface SBIconListViewSlideInAnimator
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
@end

@implementation SBIconListViewSlideInAnimator

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  [v11 bounds];
  double Width = CGRectGetWidth(v33);
  [v11 bounds];
  double Height = CGRectGetHeight(v34);
  uint64_t v14 = [v11 userInterfaceLayoutDirection];
  uint64_t v15 = [v11 iconInsertionAnimationOriginatingEdge];

  double v16 = -Width;
  if (v14 != 1) {
    double v16 = Width;
  }
  if (v15 == 1) {
    double v17 = Height;
  }
  else {
    double v17 = 0.0;
  }
  if (v15 == 1) {
    double v16 = 0.0;
  }
  objc_msgSend(v9, "setCenter:", a5->var0.x + v16, a5->var0.y + v17);
  v18 = (void *)MEMORY[0x1E4FB1EB0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __116__SBIconListViewSlideInAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v24[3] = &unk_1E6AAFF90;
  long long v19 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  long long v29 = *(_OWORD *)&a5->var2.size.height;
  long long v30 = v19;
  long long v20 = *(_OWORD *)&a5->var5;
  SBIconCoordinate var4 = a5->var4;
  long long v32 = v20;
  long long v21 = *(_OWORD *)&a5->var1;
  CGPoint var0 = a5->var0;
  long long v28 = v21;
  id v25 = v9;
  id v26 = v10;
  id v22 = v10;
  id v23 = v9;
  [v18 animateWithDuration:v24 animations:0.3];
}

uint64_t __116__SBIconListViewSlideInAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end