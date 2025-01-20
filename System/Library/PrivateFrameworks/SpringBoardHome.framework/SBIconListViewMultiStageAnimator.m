@interface SBIconListViewMultiStageAnimator
- (SBIconListViewMultiStageAnimator)init;
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5;
@end

@implementation SBIconListViewMultiStageAnimator

- (SBIconListViewMultiStageAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBIconListViewMultiStageAnimator;
  result = [(SBIconListViewMultiStageAnimator *)&v3 init];
  if (result) {
    result->_iconInitialCenter = (CGPoint)vdupq_n_s64(0xC0C3880000000000);
  }
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = dbl_1D81E7FF0[!a5->var5];
  v14 = (void *)MEMORY[0x1E4FB1EB0];
  unint64_t var7 = a5->var7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v22[3] = &unk_1E6AB4BB8;
  long long v16 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  long long v28 = *(_OWORD *)&a5->var2.size.height;
  long long v29 = v16;
  long long v17 = *(_OWORD *)&a5->var5;
  SBIconCoordinate var4 = a5->var4;
  long long v31 = v17;
  long long v18 = *(_OWORD *)&a5->var1;
  CGPoint var0 = a5->var0;
  long long v27 = v18;
  v22[4] = self;
  id v23 = v11;
  id v24 = v10;
  id v25 = v12;
  id v19 = v12;
  id v20 = v10;
  id v21 = v11;
  [v14 animateWithDuration:var7 delay:v22 options:0 animations:0.3 completion:v13];
}

void __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v20.minimum;
  float maximum = v20.maximum;
  float preferred = v20.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v10[3] = &unk_1E6AB4BB8;
  *(_OWORD *)&v20.float maximum = *(_OWORD *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 96);
  long long v17 = *(_OWORD *)&v20.maximum;
  *(_OWORD *)&v20.float maximum = *(_OWORD *)(a1 + 144);
  long long v18 = *(_OWORD *)(a1 + 128);
  long long v19 = *(_OWORD *)&v20.maximum;
  *(_OWORD *)&v20.float maximum = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)&v20.maximum;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v10, v7, v8, v9);
}

uint64_t __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  v2 = (long long *)(a1 + 64);
  if (*(unsigned char *)(a1 + 144))
  {
    objc_super v3 = (void *)MEMORY[0x1E4FB1EB0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v25[3] = &unk_1E6AB4B90;
    long long v4 = *(_OWORD *)(a1 + 112);
    long long v29 = *(_OWORD *)(a1 + 96);
    long long v30 = v4;
    long long v5 = *(_OWORD *)(a1 + 144);
    long long v31 = *(_OWORD *)(a1 + 128);
    long long v32 = v5;
    long long v6 = *(_OWORD *)(a1 + 80);
    long long v27 = *v2;
    long long v28 = v6;
    double v7 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v7;
    [v3 performWithoutAnimation:v25];
    [*(id *)(a1 + 40) setAlpha:1.0];
    uint64_t v9 = *(void *)(a1 + 40);
    double v8 = *(void **)(a1 + 48);
    long long v10 = v2[3];
    long long v21 = v2[2];
    long long v22 = v10;
    long long v11 = v2[5];
    long long v23 = v2[4];
    long long v24 = v11;
    long long v12 = v2[1];
    long long v19 = *v2;
    long long v20 = v12;
    [v8 performDefaultAnimatedLayoutUpdateForIconView:v9 withParameters:&v19];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = *(void **)(a1 + 48);
    long long v15 = v2[3];
    long long v21 = v2[2];
    long long v22 = v15;
    long long v16 = v2[5];
    long long v23 = v2[4];
    long long v24 = v16;
    long long v17 = v2[1];
    long long v19 = *v2;
    long long v20 = v17;
    [v13 performDefaultAnimatedLayoutUpdateForIconView:v14 withParameters:&v19];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(double *)(v2 + 8) <= -10000.0)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    *(void *)(v2 + 8) = *(void *)(a1 + 48);
    *(void *)(v2 + 16) = v3;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  [*(id *)(a1 + 40) setIconContentScale:*(double *)(a1 + 64)];
  uint64_t result = [*(id *)(a1 + 40) isDropping];
  if ((result & 1) == 0)
  {
    long long v5 = *(void **)(a1 + 40);
    return [v5 setAlpha:0.0];
  }
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
}

@end