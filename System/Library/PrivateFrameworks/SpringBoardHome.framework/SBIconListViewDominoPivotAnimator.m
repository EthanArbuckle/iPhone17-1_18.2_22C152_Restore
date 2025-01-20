@interface SBIconListViewDominoPivotAnimator
- (SBIcon)pivotIcon;
- (SBIconListViewDominoPivotAnimator)initWithPivotIcon:(id)a3;
- (SBIconListViewDominoPivotAnimatorDelegate)delegate;
- (unint64_t)pivotIconIndex;
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPivotIconIndex:(unint64_t)a3;
@end

@implementation SBIconListViewDominoPivotAnimator

- (SBIconListViewDominoPivotAnimator)initWithPivotIcon:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconListViewDominoPivotAnimator;
  v6 = [(SBIconListViewDominoPivotAnimator *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pivotIcon, a3);
    v7->_pivotIconIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v9 = [v8 iconEditingSettings];
    iconEditingSettings = v7->_iconEditingSettings;
    v7->_iconEditingSettings = (SBHIconEditingSettings *)v9;
  }
  return v7;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 model];
  v14 = [v11 icon];
  unint64_t v15 = [v13 indexForIcon:v14];
  unint64_t v16 = [(SBIconListViewDominoPivotAnimator *)self pivotIconIndex];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [(SBIconListViewDominoPivotAnimator *)self pivotIcon];
    if (v17) {
      unint64_t v16 = [v13 indexForIcon:v17];
    }
    else {
      unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(SBIconListViewDominoPivotAnimator *)self setPivotIconIndex:v16];
  }
  v18 = [(SBIconListViewDominoPivotAnimator *)self delegate];
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDuration];
  double v20 = v19;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDampingRatio];
  double v22 = v21 + -0.03;
  double v23 = vabdd_f64((double)v15, (double)v16) * 0.05;
  v24 = (void *)MEMORY[0x1E4FB1EB0];
  unint64_t var7 = a5->var7;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  long long v26 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  long long v41 = *(_OWORD *)&a5->var2.size.height;
  long long v42 = v26;
  long long v27 = *(_OWORD *)&a5->var5;
  SBIconCoordinate var4 = a5->var4;
  long long v44 = v27;
  long long v28 = *(_OWORD *)&a5->var1;
  CGPoint var0 = a5->var0;
  v33[2] = __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v33[3] = &unk_1E6AAD4A0;
  long long v40 = v28;
  id v34 = v11;
  id v35 = v10;
  v37 = self;
  id v38 = v12;
  id v36 = v18;
  id v29 = v18;
  id v30 = v12;
  id v31 = v10;
  id v32 = v11;
  [v24 animateWithDuration:var7 delay:v33 usingSpringWithDamping:0 initialSpringVelocity:v20 options:v23 animations:v22 completion:0.0];
}

void __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v23.minimum;
  float maximum = v23.maximum;
  float preferred = v23.preferred;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v11[3] = &unk_1E6AAD4A0;
  *(_OWORD *)&v23.float minimum = *(_OWORD *)(a1 + 120);
  long long v19 = *(_OWORD *)(a1 + 104);
  long long v20 = *(_OWORD *)&v23.minimum;
  long long v21 = *(_OWORD *)(a1 + 136);
  long long v22 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)&v23.float minimum = *(_OWORD *)(a1 + 88);
  long long v17 = *(_OWORD *)(a1 + 72);
  long long v18 = *(_OWORD *)&v23.minimum;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v14 = v6;
  uint64_t v15 = v7;
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v11, v8, v9, v10);
}

uint64_t __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  v2 = (long long *)(a1 + 72);
  if (*(unsigned char *)(a1 + 152))
  {
    v3 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v15[3] = &unk_1E6AACDB8;
    id v16 = *(id *)(a1 + 32);
    long long v4 = v2[3];
    long long v19 = v2[2];
    long long v20 = v4;
    long long v5 = v2[5];
    long long v21 = v2[4];
    long long v22 = v5;
    long long v6 = v2[1];
    long long v17 = *v2;
    long long v18 = v6;
    [v3 performWithoutAnimation:v15];
    [*(id *)(a1 + 32) setAlpha:1.0];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    long long v9 = v2[3];
    v14[2] = v2[2];
    v14[3] = v9;
    long long v10 = v2[5];
    v14[4] = v2[4];
    v14[5] = v10;
    long long v11 = v2[1];
    v14[0] = *v2;
    v14[1] = v11;
    [v7 performDefaultAnimatedLayoutUpdateForIconView:v8 withParameters:v14];
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
  return [*(id *)(a1 + 48) dominoPivotAnimator:*(void *)(a1 + 56) didLayOutIconView:*(void *)(a1 + 32)];
}

uint64_t __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
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

- (SBIcon)pivotIcon
{
  return self->_pivotIcon;
}

- (SBIconListViewDominoPivotAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconListViewDominoPivotAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)pivotIconIndex
{
  return self->_pivotIconIndex;
}

- (void)setPivotIconIndex:(unint64_t)a3
{
  self->_pivotIconIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pivotIcon, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
}

@end