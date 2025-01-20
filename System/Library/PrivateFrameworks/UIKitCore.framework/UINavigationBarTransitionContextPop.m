@interface UINavigationBarTransitionContextPop
@end

@implementation UINavigationBarTransitionContextPop

uint64_t __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_2;
  v5[3] = &unk_1E52D9F70;
  v5[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v5 relativeDuration:0.0 animations:0.6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_3;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_4;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.5 animations:0.5];
}

void __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) setContentAlpha:0.0];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 88) backButton];
  v2 = [v4 visualProvider];
  v3 = [v2 contentView];
  [v3 setAlpha:0.0];
}

uint64_t __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setContentAlpha:0.0];
}

uint64_t __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setContentAlpha:1.0];
}

void __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_5(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_6;
  v3[3] = &unk_1E52DA520;
  id v4 = *(id *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.0 animations:0.1];
}

uint64_t __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke(uint64_t a1, double a2)
{
  CGAffineTransform v4 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_2;
  v13[3] = &unk_1E52DE670;
  v13[4] = v4;
  [v4 _animateInProcessAsTwoPartsWithOverlapIfNecessaryWithKeyframeID:@"contentViewAlpha" fractionComplete:v13 partOne:0 partTwo:a2];
  CGAffineTransform v5 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v5) {
    CGAffineTransform v5 = (void *)v5[16];
  }
  long long v6 = v5;

  if (v6)
  {
    v7 = +[_UINavigationBarTransitionContext fadeInFunction];
    *(float *)&double v8 = a2;
    [v7 _solveForInput:v8];
    double v10 = v9;

    uint64_t v11 = *(void *)(a1 + 32);
    if ((*(_WORD *)(v11 + 160) & 0x40) != 0) {
      double v12 = 0.0;
    }
    else {
      double v12 = v10;
    }
    [*(id *)(v11 + 96) setBackButtonAlpha:v10 titleLabelAlpha:v12 titleViewAlpha:v10 barsAlpha:v10];
  }
}

uint64_t __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_2(uint64_t a1, double a2)
{
  CGAffineTransform v4 = +[_UINavigationBarTransitionContext fadeOutFunction];
  *(float *)&double v5 = a2;
  [v4 _solveForInput:v5];
  double v7 = 1.0 - v6;

  uint64_t v8 = *(void *)(a1 + 32);
  float v9 = *(void **)(v8 + 88);
  if ((*(_WORD *)(v8 + 160) & 0x20) != 0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v7;
  }
  return [v9 setBackButtonAlpha:v7 titleLabelAlpha:v10 titleViewAlpha:v7 barsAlpha:v7];
}

uint64_t __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  __int16 v5 = *(_WORD *)(v4 + 160);
  float v6 = [*(id *)(v4 + 88) titleViewGuide];
  [v6 layoutFrame];
  if ((v5 & 2) != 0)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v7);
    double MaxX = MinX - CGRectGetWidth(*(CGRect *)(a1 + 48));
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v7);
  }

  double v13 = *(double *)(a1 + 56);
  double v14 = *(double *)(a1 + 64);
  double v15 = *(double *)(a1 + 72);
  double v16 = MaxX * a2 + (1.0 - a2) * *(double *)(a1 + 48);
  v17 = *(void **)(a1 + 40);
  return objc_msgSend(v17, "setFrame:", v16, v13, v14, v15);
}

uint64_t __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_4(uint64_t a1, double a2)
{
  CGFloat v3 = *(double *)(a1 + 48);
  CGFloat v4 = *(double *)(a1 + 56);
  v25.size.width = *(CGFloat *)(a1 + 64);
  CGFloat v5 = *(double *)(a1 + 72);
  CGFloat v6 = *(double *)(*(void *)(a1 + 40) + 200);
  CGFloat v7 = *(double *)(*(void *)(a1 + 40) + 208);
  CGFloat rect = v25.size.width;
  CGFloat v8 = *(double *)(*(void *)(a1 + 40) + 216);
  CGFloat v9 = *(double *)(*(void *)(a1 + 40) + 224);
  CGFloat v22 = v6;
  CGFloat v23 = v9;
  v25.origin.x = v3;
  v25.origin.y = v4;
  v25.size.height = v5;
  double MinX = CGRectGetMinX(v25);
  v26.origin.x = v6;
  v26.origin.y = v7;
  v26.size.width = v8;
  v26.size.height = v9;
  double v20 = (1.0 - a2) * MinX + CGRectGetMinX(v26) * a2;
  v27.origin.x = v3;
  v27.origin.y = v4;
  v27.size.width = rect;
  v27.size.height = v5;
  double MinY = CGRectGetMinY(v27);
  v28.origin.x = v6;
  v28.origin.y = v7;
  v28.size.width = v8;
  v28.size.height = v9;
  double v19 = (1.0 - a2) * MinY + CGRectGetMinY(v28) * a2;
  v29.origin.x = v3;
  v29.origin.y = v4;
  v29.size.width = rect;
  v29.size.height = v5;
  double Width = CGRectGetWidth(v29);
  v30.origin.x = v6;
  v30.origin.y = v7;
  v30.size.width = v8;
  v30.size.height = v9;
  double v12 = (1.0 - a2) * Width + CGRectGetWidth(v30) * a2;
  v31.origin.x = v3;
  v31.origin.y = v4;
  v31.size.width = rect;
  v31.size.height = v5;
  double Height = CGRectGetHeight(v31);
  v32.origin.y = v7;
  v32.origin.x = v22;
  v32.size.width = v8;
  v32.size.height = v23;
  double v14 = (1.0 - a2) * Height + CGRectGetHeight(v32) * a2;
  double v15 = *(void **)(a1 + 32);
  return objc_msgSend(v15, "setFrame:", v20, v19, v12, v14);
}

void __62___UINavigationBarTransitionContextPop__animateLargeTitleView__block_invoke(uint64_t a1, double a2)
{
  CGFloat v4 = +[_UINavigationBarTransitionContext fadeInFunction];
  float v5 = a2;
  *(float *)&double v6 = v5;
  [v4 _solveForInput:v6];
  float v8 = v7;

  CGFloat v9 = +[_UINavigationBarTransitionContext fadeOutFunction];
  *(float *)&double v10 = a2;
  [v9 _solveForInput:v10];
  float v12 = v11;

  uint64_t v13 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v13 + 160) & 0x20) != 0)
  {
    objc_msgSend(*(id *)(v13 + 104), "layoutViewsWithOffset:useRestingTitleHeight:", 1, (1.0 - a2) * 0.0 + *(double *)(a1 + 40) * a2, (1.0 - a2) * 0.0 + *(double *)(a1 + 48) * a2);
    [*(id *)(*(void *)(a1 + 32) + 104) setContentAlpha:1.0 - v12];
    uint64_t v13 = *(void *)(a1 + 32);
  }
  double v14 = v8;
  uint64_t v15 = *(void *)(v13 + 144);
  if (v15 == 1)
  {
    if ((*(_WORD *)(v13 + 160) & 0x40) != 0)
    {
      if ((_textDiffersBetweenLargeTitleAndBackButtonLayouts(*(void **)(v13 + 112), *(void **)(v13 + 88)) & 1) == 0) {
        [*(id *)(*(void *)(a1 + 32) + 112) setContentAlpha:v14];
      }
      uint64_t v18 = *(void *)(a1 + 32);
      double v19 = *(void **)(v18 + 112);
      if (a2 == 1.0)
      {
        objc_msgSend(v19, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
      }
      else
      {
        double v20 = (double *)(v18 + 280);
        double v21 = *v20 * a2;
        double v22 = v20[1] * a2;
        double v23 = *(double *)(a1 + 56);
        double v24 = *(double *)(a1 + 64);
        _updateLargeTitleSpacingForLayout(v19, v23, v24, v21, v22);
      }
    }
  }
  else if (!v15)
  {
    if ((*(_WORD *)(v13 + 160) & 0x40) != 0)
    {
      objc_msgSend(*(id *)(v13 + 112), "layoutViewsWithOffset:useRestingTitleHeight:", 1, a2 * 0.0 + (1.0 - a2) * *(double *)(a1 + 40), a2 * 0.0 + (1.0 - a2) * *(double *)(a1 + 48));
      double v16 = *(void **)(*(void *)(a1 + 32) + 112);
      double v17 = v14;
    }
    else
    {
      double v16 = *(void **)(v13 + 112);
      double v17 = 0.0;
    }
    [v16 setContentAlpha:v17];
  }
}

uint64_t __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke(uint64_t a1, double a2)
{
  double v3 = -[_UINavigationBarLayout searchBarLayoutFrame](*(void **)(*(void *)(a1 + 32) + 80));
  CGFloat v5 = v4;
  CGFloat v32 = v7;
  CGFloat v33 = v6;
  float v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[9];
  if (v9 && *(unsigned char *)(v9 + 115))
  {
    double v10 = -[_UINavigationBarLayout searchBarLayoutFrame]((void *)v8[9]);
  }
  else
  {
    int v14 = [v8 isRTL];
    v35.origin.x = v3;
    v35.origin.y = v5;
    v35.size.width = v33;
    v35.size.height = v32;
    double Width = CGRectGetWidth(v35);
    if (!v14) {
      double Width = -Width;
    }
    double v10 = v3 + Width;
    double v13 = v32;
    double v12 = v33;
    double v11 = v5;
  }
  CGFloat v16 = v10;
  CGFloat v30 = v13;
  CGFloat v31 = v11;
  CGFloat v17 = v12;
  double MinX = CGRectGetMinX(*(CGRect *)&v10);
  v36.origin.x = v3;
  v36.origin.y = v5;
  v36.size.height = v32;
  v36.size.width = v33;
  CGFloat v25 = v5;
  double rect_24 = (1.0 - a2) * MinX + CGRectGetMinX(v36) * a2;
  v37.origin.x = v16;
  v37.origin.y = v31;
  v37.size.width = v17;
  v37.size.height = v30;
  double rect_16a = CGRectGetMinY(v37);
  v38.origin.x = v3;
  v38.origin.y = v5;
  v38.size.width = v33;
  v38.size.height = v32;
  double rect_16 = (1.0 - a2) * rect_16a + CGRectGetMinY(v38) * a2;
  v39.origin.x = v16;
  v39.origin.y = v31;
  v39.size.width = v17;
  v39.size.height = v30;
  double v19 = CGRectGetWidth(v39);
  v40.origin.x = v3;
  v40.origin.y = v25;
  v40.size.width = v33;
  v40.size.height = v32;
  double v20 = (1.0 - a2) * v19 + CGRectGetWidth(v40) * a2;
  v41.origin.x = v16;
  v41.size.height = v30;
  v41.origin.y = v31;
  v41.size.width = v17;
  double Height = CGRectGetHeight(v41);
  v42.origin.x = v3;
  v42.origin.y = v25;
  v42.size.width = v33;
  v42.size.height = v32;
  double v22 = (1.0 - a2) * Height + CGRectGetHeight(v42) * a2;
  double v23 = *(void **)(a1 + 40);
  return objc_msgSend(v23, "setFrame:", rect_24, rect_16, v20, v22);
}

uint64_t __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_2(uint64_t a1)
{
  if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(*(void **)(*(void *)(a1 + 32) + 72), *(void **)(*(void *)(a1 + 32) + 80), 0, 1) & 1) != 0|| (uint64_t result = [*(id *)(a1 + 32) shouldSlideBarBackground], (result & 1) == 0))
  {
    double v3 = *(void **)(a1 + 40);
    return [v3 setAlpha:0.0];
  }
  return result;
}

uint64_t __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_4(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) _scopeBar];
  double v3 = [*(id *)(a1 + 40) _scopeBar];
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_5;
    v6[3] = &unk_1E52D9F70;
    id v7 = v2;
    +[UIView addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.15];
  }
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_6;
    v4[3] = &unk_1E52D9F70;
    id v5 = v3;
    +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.97 animations:0.03];
  }
}

uint64_t __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_7(uint64_t a1, double a2)
{
  double v4 = [*(id *)(a1 + 32) _searchController];
  char v5 = [v4 isActive];

  if ((v5 & 1) == 0)
  {
    double v6 = -[_UINavigationBarLayout searchBarLayoutFrame](*(void **)(*(void *)(a1 + 40) + 72));
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    int v13 = [*(id *)(a1 + 40) isRTL];
    v18.origin.x = v6;
    v18.origin.y = v8;
    v18.size.width = v10;
    v18.size.height = v12;
    double Width = CGRectGetWidth(v18);
    if (v13) {
      double Width = -Width;
    }
    double v15 = v6 + Width * a2;
    CGFloat v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "setFrame:", v15, v8, v10, v12);
  }
}

uint64_t __102___UINavigationBarTransitionContextPop__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __102___UINavigationBarTransitionContextPop__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end