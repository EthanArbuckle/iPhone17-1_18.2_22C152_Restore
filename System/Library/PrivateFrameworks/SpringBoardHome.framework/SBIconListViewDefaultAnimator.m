@interface SBIconListViewDefaultAnimator
- (SBIconListViewDefaultAnimator)init;
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5;
@end

@implementation SBIconListViewDefaultAnimator

- (SBIconListViewDefaultAnimator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewDefaultAnimator;
  v2 = [(SBIconListViewDefaultAnimator *)&v7 init];
  if (v2)
  {
    v3 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v4 = [v3 iconEditingSettings];
    iconEditingSettings = v2->_iconEditingSettings;
    v2->_iconEditingSettings = (SBHIconEditingSettings *)v4;
  }
  return v2;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDuration];
  double v14 = v13;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDampingRatio];
  double v16 = v15;
  v17 = (void *)MEMORY[0x1E4FB1EB0];
  unint64_t var7 = a5->var7;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  long long v19 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  long long v31 = *(_OWORD *)&a5->var2.size.height;
  long long v32 = v19;
  long long v20 = *(_OWORD *)&a5->var5;
  SBIconCoordinate var4 = a5->var4;
  long long v34 = v20;
  long long v21 = *(_OWORD *)&a5->var1;
  CGPoint var0 = a5->var0;
  long long v30 = v21;
  v25[2] = __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v25[3] = &unk_1E6AB0728;
  id v26 = v11;
  id v27 = v10;
  id v28 = v12;
  id v22 = v12;
  id v23 = v10;
  id v24 = v11;
  [v17 animateWithDuration:var7 delay:v25 usingSpringWithDamping:0 initialSpringVelocity:v14 options:0.0 animations:v16 completion:0.0];
}

void __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v19.minimum;
  float maximum = v19.maximum;
  float preferred = v19.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v9[3] = &unk_1E6AB0728;
  *(_OWORD *)&v19.float minimum = *(_OWORD *)(a1 + 104);
  long long v15 = *(_OWORD *)(a1 + 88);
  long long v16 = *(_OWORD *)&v19.minimum;
  *(_OWORD *)&v19.float minimum = *(_OWORD *)(a1 + 136);
  long long v17 = *(_OWORD *)(a1 + 120);
  long long v18 = *(_OWORD *)&v19.minimum;
  *(_OWORD *)&v19.float minimum = *(_OWORD *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v14 = *(_OWORD *)&v19.minimum;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v9, v6, v7, v8);
}

uint64_t __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  v2 = (long long *)(a1 + 56);
  if (*(unsigned char *)(a1 + 136))
  {
    v3 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v14[3] = &unk_1E6AACDB8;
    id v15 = *(id *)(a1 + 32);
    long long v4 = v2[3];
    long long v18 = v2[2];
    long long v19 = v4;
    long long v5 = v2[5];
    long long v20 = v2[4];
    long long v21 = v5;
    long long v6 = v2[1];
    long long v16 = *v2;
    long long v17 = v6;
    [v3 performWithoutAnimation:v14];
    [*(id *)(a1 + 32) setAlpha:1.0];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    double v7 = *(void **)(a1 + 40);
    long long v9 = v2[3];
    v13[2] = v2[2];
    v13[3] = v9;
    long long v10 = v2[5];
    v13[4] = v2[4];
    v13[5] = v10;
    long long v11 = v2[1];
    v13[0] = *v2;
    v13[1] = v11;
    [v7 performDefaultAnimatedLayoutUpdateForIconView:v8 withParameters:v13];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [*(id *)(a1 + 32) setIconContentScale:*(double *)(a1 + 56)];
  uint64_t result = [*(id *)(a1 + 32) isDropping];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 setAlpha:0.0];
  }
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
}

- (void).cxx_destruct
{
}

@end