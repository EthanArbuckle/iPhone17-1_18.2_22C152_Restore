@interface UINavigationBarTransitionContextPush
@end

@implementation UINavigationBarTransitionContextPush

uint64_t __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_3;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.5 animations:0.5];
}

uint64_t __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setContentAlpha:0.0];
}

void __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 96) backButton];
  v1 = [v3 visualProvider];
  v2 = [v1 contentView];
  [v2 setAlpha:1.0];
}

void __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_5;
  v4[3] = &unk_1E52D9F98;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.9 animations:0.1];
}

uint64_t __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(a1 + 40) + 264), *(double *)(*(void *)(a1 + 40) + 272), *(double *)(*(void *)(a1 + 40) + 280), *(double *)(*(void *)(a1 + 40) + 288));
}

void *__60___UINavigationBarTransitionContextPush__animateContentView__block_invoke(uint64_t a1, double a2)
{
  v4 = +[_UINavigationBarTransitionContext fadeOutFunction];
  *(float *)&double v5 = a2;
  [v4 _solveForInput:v5];
  double v7 = 1.0 - v6;

  uint64_t v8 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v8 + 160) & 0x20) != 0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v7;
  }
  [*(id *)(v8 + 88) setBackButtonAlpha:v7 titleLabelAlpha:v9 titleViewAlpha:v7 barsAlpha:v7];
  result = *(void **)(a1 + 32);
  if (result[12])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_2;
    v11[3] = &unk_1E52DE670;
    v11[4] = result;
    return (void *)[result _animateInProcessAsTwoPartsWithOverlapIfNecessaryWithKeyframeID:@"contentViewAlpha" fractionComplete:0 partOne:v11 partTwo:a2];
  }
  return result;
}

uint64_t __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_2(uint64_t a1, double a2)
{
  v4 = +[_UINavigationBarTransitionContext fadeInFunction];
  *(float *)&double v5 = a2;
  [v4 _solveForInput:v5];
  double v7 = v6;

  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 96);
  if ((*(_WORD *)(v8 + 160) & 0x40) != 0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v7;
  }
  return [v9 setBackButtonAlpha:v7 titleLabelAlpha:v10 titleViewAlpha:v7 barsAlpha:v7];
}

uint64_t __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_3(uint64_t a1, double a2)
{
  double v3 = *(double *)(a1 + 48);
  double v2 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 32);
  float v6 = *(void **)(a1 + 40);
  double v8 = *(double *)(v7 + 296);
  if ((*(_WORD *)(v7 + 160) & 2) != 0) {
    double v8 = -v8;
  }
  return objc_msgSend(v6, "setFrame:", v3 - v8 * a2, v2, v4, v5);
}

uint64_t __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_4(uint64_t a1, double a2)
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
  v15 = *(void **)(a1 + 32);
  return objc_msgSend(v15, "setFrame:", v20, v19, v12, v14);
}

uint64_t __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke(uint64_t a1, double a2)
{
  CGFloat v4 = +[_UINavigationBarTransitionContext fadeOutFunction];
  *(float *)&double v5 = a2;
  [v4 _solveForInput:v5];
  double v7 = 1.0 - v6;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 144);
  if (v9 != 1)
  {
    if (v9) {
      goto LABEL_10;
    }
    double v10 = *(void **)(v8 + 104);
    if ((*(_WORD *)(v8 + 160) & 0x20) != 0)
    {
      objc_msgSend(v10, "layoutViewsWithOffset:useRestingTitleHeight:", 1, (1.0 - a2) * 0.0 + *(double *)(a1 + 40) * a2, 0.0);
      v11 = [*(id *)(*(void *)(a1 + 32) + 104) accessoryView];
      [v11 setAlpha:v7];

      goto LABEL_10;
    }
    goto LABEL_6;
  }
  double v10 = *(void **)(v8 + 104);
  if ((*(_WORD *)(v8 + 160) & 0x20) == 0)
  {
LABEL_6:
    [v10 setContentAlpha:0.0];
    goto LABEL_10;
  }
  if ((_textDiffersBetweenLargeTitleAndBackButtonLayouts(v10, *(void **)(v8 + 96)) & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 104) setContentAlpha:v7];
  }
  _updateLargeTitleSpacingForLayout(*(void **)(*(void *)(a1 + 32) + 104), *(double *)(a1 + 48), *(double *)(a1 + 56), -(*(double *)(*(void *)(a1 + 32) + 296) * a2), -(*(double *)(*(void *)(a1 + 32) + 304) * a2));
LABEL_10:
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 112);
  if ((*(_WORD *)(v12 + 160) & 0x40) != 0)
  {
    objc_msgSend(v13, "layoutViewsWithOffset:useRestingTitleHeight:", 1, a2 * 0.0 + (1.0 - a2) * *(double *)(a1 + 40), 0.0);
    uint64_t v15 = [*(id *)(a1 + 32) _animationOptions];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_2;
    v16[3] = &unk_1E52D9F70;
    v16[4] = *(void *)(a1 + 32);
    return +[UIView _animateInProcessKeyframesAlongsideTransitionWithOptions:v15 animations:v16];
  }
  else
  {
    return [v13 setContentAlpha:0.0];
  }
}

uint64_t __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_3;
  v2[3] = &unk_1E52DE670;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView _animateKeyframeWithID:@"largeTitlePush" relativeStartTime:v2 relativeDuration:0.0 animations:0.5];
}

uint64_t __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_3(uint64_t a1, double a2)
{
  CGFloat v4 = +[_UINavigationBarTransitionContext fadeInFunction];
  *(float *)&double v5 = a2;
  [v4 _solveForInput:v5];
  double v7 = v6;

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 112);
  return [v8 setContentAlpha:v7];
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke(uint64_t a1, double a2)
{
  double v3 = -[_UINavigationBarLayout searchBarLayoutFrame](*(void **)(*(void *)(a1 + 32) + 80));
  CGFloat v5 = v4;
  CGFloat v32 = v7;
  CGFloat v33 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 80);
  if (v9 && *(unsigned char *)(v9 + 115))
  {
    double v10 = -[_UINavigationBarLayout searchBarLayoutFrame](*(void **)(v8 + 72));
  }
  else
  {
    int v14 = [(id)v8 isRTL];
    v35.origin.x = v3;
    v35.origin.y = v5;
    v35.size.width = v33;
    v35.size.height = v32;
    double Width = CGRectGetWidth(v35);
    if (v14) {
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
  CGFloat v23 = *(void **)(a1 + 40);
  return objc_msgSend(v23, "setFrame:", rect_24, rect_16, v20, v22);
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_2(uint64_t a1)
{
  if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(*(void **)(*(void *)(a1 + 32) + 72), *(void **)(*(void *)(a1 + 32) + 80), 1, 1) & 1) != 0|| (uint64_t result = [*(id *)(a1 + 32) shouldSlideBarBackground], (result & 1) == 0))
  {
    double v3 = *(void **)(a1 + 40);
    return [v3 setAlpha:0.0];
  }
  return result;
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _scopeBar];
  double v3 = [*(id *)(a1 + 40) _scopeBar];
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_5;
    v6[3] = &unk_1E52D9F70;
    id v7 = v2;
    +[UIView addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.15];
  }
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_6;
    v4[3] = &unk_1E52D9F70;
    id v5 = v3;
    +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.97 animations:0.03];
  }
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_7(uint64_t a1, double a2)
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
    if (!v13) {
      double Width = -Width;
    }
    double v15 = v6 + Width * a2;
    CGFloat v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "setFrame:", v15, v8, v10, v12);
  }
}

uint64_t __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end