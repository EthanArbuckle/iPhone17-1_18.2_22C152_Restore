@interface UIPreviewPresentationController2
@end

@implementation UIPreviewPresentationController2

uint64_t __68___UIPreviewPresentationController2_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPresentationAnimationsWithTransitionContext:0];
}

uint64_t __65___UIPreviewPresentationController2_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDismissAnimationsWithTransitionContext:0];
}

uint64_t __56___UIPreviewPresentationController2__layoutContentViews__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

void __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 72);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_2;
  v31[3] = &unk_1E52DD450;
  id v32 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  id v33 = v3;
  uint64_t v34 = v4;
  id v35 = v5;
  +[UIView addKeyframeWithRelativeStartTime:v31 relativeDuration:0.0 animations:v2];
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_3;
  v21[3] = &unk_1E53003B0;
  id v22 = *(id *)(a1 + 32);
  long long v27 = *(_OWORD *)(a1 + 88);
  long long v28 = *(_OWORD *)(a1 + 104);
  long long v29 = *(_OWORD *)(a1 + 120);
  long long v30 = *(_OWORD *)(a1 + 136);
  id v23 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  id v24 = v8;
  uint64_t v25 = v9;
  id v26 = v10;
  +[UIView addKeyframeWithRelativeStartTime:v21 relativeDuration:v6 animations:v7];
  double v11 = *(double *)(a1 + 72);
  double v12 = *(double *)(a1 + 80);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_4;
  v18[3] = &unk_1E52D9F98;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 64);
  +[UIView addKeyframeWithRelativeStartTime:v18 relativeDuration:v11 animations:v12];
  double v13 = *(double *)(a1 + 72);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_5;
  v16[3] = &unk_1E52D9F70;
  id v17 = *(id *)(a1 + 64);
  +[UIView addKeyframeWithRelativeStartTime:v16 relativeDuration:v13 animations:0.1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_6;
  v14[3] = &unk_1E52D9F70;
  id v15 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v14 relativeDuration:0.98 animations:0.02];
}

void __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.0175, 1.0175);
  double v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  id v3 = [(id)objc_opt_class() _backgroundEffectForTraitCollection:*(void *)(a1 + 56) interactive:1];
  [*(id *)(a1 + 40) setEffect:v3];
}

void __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_3(uint64_t a1)
{
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x1E4F1DAB8];
  long long v13 = *(_OWORD *)&v19.a;
  *(_OWORD *)&v19.c = v14;
  *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v12 = *(_OWORD *)&v19.tx;
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 72));
  CGFloat v3 = MidX - CGRectGetMidX(*(CGRect *)(a1 + 104));
  double MidY = CGRectGetMidY(*(CGRect *)(a1 + 72));
  CGFloat v5 = CGRectGetMidY(*(CGRect *)(a1 + 104));
  *(_OWORD *)&v18.a = *(_OWORD *)&v19.a;
  *(_OWORD *)&v18.c = v14;
  *(_OWORD *)&v18.tx = *(_OWORD *)&v19.tx;
  CGAffineTransformTranslate(&v19, &v18, v3, MidY - v5);
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
  CGFloat v7 = Width / CGRectGetWidth(*(CGRect *)(a1 + 104));
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 72));
  CGFloat v9 = CGRectGetHeight(*(CGRect *)(a1 + 104));
  CGAffineTransform v17 = v19;
  CGAffineTransformScale(&v18, &v17, v7, Height / v9);
  *(_OWORD *)&v19.tx = *(_OWORD *)&v18.tx;
  CGAffineTransform v16 = v18;
  [*(id *)(a1 + 32) setTransform:&v16];
  v10 = *(void **)(a1 + 40);
  v15[0] = v13;
  v15[1] = v14;
  v15[2] = v12;
  [v10 setTransform:v15];
  [*(id *)(a1 + 40) setDropShadowEnabled:1];
  double v11 = [(id)objc_opt_class() _backgroundEffectForTraitCollection:*(void *)(a1 + 64) interactive:0];
  [*(id *)(a1 + 48) setEffect:v11];
}

uint64_t __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setBlurRadius:16.0];
  double v2 = *(void **)(a1 + 40);
  return [v2 setBlurRadius:0.0];
}

uint64_t __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_2;
  v8[3] = &unk_1E52DF190;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  long long v12 = v2;
  long long v3 = *(_OWORD *)(a1 + 96);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = v3;
  +[UIView addKeyframeWithRelativeStartTime:v8 relativeDuration:0.0 animations:1.0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_3;
  v6[3] = &unk_1E52D9F70;
  id v7 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:v6 relativeDuration:0.2 animations:1.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_4;
  _OWORD v4[3] = &unk_1E52D9F70;
  id v5 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.2];
}

uint64_t __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEffect:0];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  CGFloat v3 = MidX - CGRectGetMidX(*(CGRect *)(a1 + 80));
  double MidY = CGRectGetMidY(*(CGRect *)(a1 + 48));
  CGFloat v5 = CGRectGetMidY(*(CGRect *)(a1 + 80));
  *(_OWORD *)&v12.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tx = *(_OWORD *)&v13.tx;
  CGAffineTransformTranslate(&v13, &v12, v3, MidY - v5);
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  CGFloat v7 = CGRectGetHeight(*(CGRect *)(a1 + 80));
  CGAffineTransform v11 = v13;
  CGAffineTransformScale(&v12, &v11, Height / v7, Height / v7);
  *(_OWORD *)&v13.tx = *(_OWORD *)&v12.tx;
  CGAffineTransform v10 = v12;
  return [*(id *)(a1 + 40) setTransform:&v10];
}

uint64_t __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setBlurRadius:128.0];
  long long v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDropShadowEnabled:0];
}

@end