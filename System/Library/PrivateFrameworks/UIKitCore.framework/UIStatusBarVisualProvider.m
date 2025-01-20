@interface UIStatusBarVisualProvider
@end

@implementation UIStatusBarVisualProvider

void __66___UIStatusBarVisualProvider_DynamicSplit_leadingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EB25D3D8;
  qword_1EB25D3D8 = (uint64_t)&unk_1ED3F0D48;
}

void __67___UIStatusBarVisualProvider_DynamicSplit_trailingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EB25D3E8;
  qword_1EB25D3E8 = (uint64_t)&unk_1ED3F0D60;
}

uint64_t __87___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  v4 = v3;
  if (v2)
  {
    v5 = [*(id *)(a1 + 32) view];
    v6 = [v5 layer];
    v7 = [v6 presentationLayer];
    v8 = [v7 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];

    if (v8) {
      v9 = v8;
    }
    else {
      v9 = &unk_1ED3F22C8;
    }
    [v4 setFromValue:v9];
    [v4 setToValue:&unk_1ED3F22D8];
    [v4 setDuration:*(double *)(a1 + 40) * 0.35];
    LODWORD(v10) = 1045220557;
    LODWORD(v11) = 1.0;
    LODWORD(v12) = 1.0;
    v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :v10 :v11 :v12];
    [v4 setTimingFunction:v13];

    v14 = [*(id *)(a1 + 32) view];
    v15 = [v14 layer];
    [v15 addAnimation:v4 forKey:@"blur"];

    [*(id *)(a1 + 32) setDynamicHidingAlpha:0.0];
    CGAffineTransformMakeScale(&v34, 0.5, 0.5);
    v16 = *(void **)(a1 + 32);
    CGAffineTransform v33 = v34;
    [v16 setDynamicHidingTransform:&v33];
  }
  else
  {
    [v3 setFromValue:&unk_1ED3F22D8];
    [v4 setToValue:&unk_1ED3F22C8];
    [v4 setDuration:*(double *)(a1 + 40)];
    LODWORD(v17) = 1045220557;
    LODWORD(v18) = 1.0;
    LODWORD(v19) = 1.0;
    v20 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :v17 :v18 :v19];
    [v4 setTimingFunction:v20];

    v21 = [*(id *)(a1 + 32) view];
    v22 = [v21 layer];
    [v22 addAnimation:v4 forKey:@"blur"];

    [*(id *)(a1 + 32) setDynamicHidingAlpha:1.0];
    v23 = *(void **)(a1 + 32);
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v32[0] = *MEMORY[0x1E4F1DAB8];
    v32[1] = v24;
    v32[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v23 setDynamicHidingTransform:v32];
  }

  CGAffineTransformMakeScale(&v31, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  v25 = *(void **)(a1 + 32);
  CGAffineTransform v30 = v31;
  uint64_t result = [v25 setDynamicScaleTransform:&v30];
  if (!*(unsigned char *)(a1 + 56))
  {
    CGAffineTransformMakeScale(&v29, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
    v27 = *(void **)(a1 + 32);
    CGAffineTransform v28 = v29;
    return [v27 setDynamicScaleTransform:&v28];
  }
  return result;
}

uint64_t __87___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_98(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setDynamicScaleTransform:&v4];
}

uint64_t __69___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setDynamicScaleTransform:&v4];
}

uint64_t __69___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setDynamicScaleTransform:&v4];
}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained statusBar];
  int v3 = -[UIView _isInVisibleHierarchy]((uint64_t)v2);

  if (v3) {
    objc_msgSend(WeakRetained, "avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:", *(void *)(a1 + 32), *(void *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained deferredAvoidanceFrameUpdateBlock];
  int v2 = (void *)v1;
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cutoutLayoutGuide];
  uint64_t v1 = [v2 owningView];
  [v1 layoutSubviews];
}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cutoutLayoutGuide];
  uint64_t v1 = [v2 owningView];
  [v1 layoutSubviews];
}

void __72___UIStatusBarVisualProvider_DynamicSplitMedium_leadingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EB25D3F8;
  qword_1EB25D3F8 = (uint64_t)&unk_1ED3F0D78;
}

void __73___UIStatusBarVisualProvider_DynamicSplitMedium_trailingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EB25D408;
  qword_1EB25D408 = (uint64_t)&unk_1ED3F0D90;
}

void __78___UIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v2 = a2;
    id v3 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v2, "setBackgroundColor:");
  }
  else
  {
    id v3 = a2;
    [v3 setBackgroundColor:0];
  }
}

uint64_t __61___UIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOverriddenStyle:*(void *)(a1 + 32)];
}

void __70___UIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  CGAffineTransform v5 = [v3 statusBar];
  id v10 = [v5 regionWithIdentifier:v4];

  char v6 = [v10 isEnabled];
  if (*(unsigned char *)(a1 + 48)) {
    [v10 enableWithToken:12];
  }
  else {
    [v10 disableWithToken:12];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
    v9 = v10;
  }
  else
  {
    char v8 = v6 ^ [v10 isEnabled];
    v9 = v10;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
}

uint64_t __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) expandedBaselineOffset];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) statusBar];
  CGAffineTransform v5 = [v4 regionWithIdentifier:@"expandedLowerLeading"];
  char v6 = [v5 displayItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [*(id *)(a1 + 32) dualLineExpandedBaselineOffset];
    double v3 = v8;
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) constant];
  if (v3 != v10)
  {
    [*(id *)(*(void *)(a1 + 32) + 200) setConstant:v3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2;
    v11[3] = &unk_1E52D9F70;
    v11[4] = *(void *)(a1 + 32);
    return +[UIView animateWithDuration:v11 animations:0.25];
  }
  return result;
}

void __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 layoutIfNeeded];
}

uint64_t __54___UIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOverriddenStyle:*(void *)(a1 + 32)];
}

void __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  if (CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32))
    || CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)))
  {
    v7[2](v7, 1);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v18 = *(_OWORD *)(v9 + 40);
    uint64_t v19 = *(void *)(v9 + 56);
    CGFloat MinX = CGRectGetMinX(*(CGRect *)(*(void *)(v8 + 8) + 32));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2;
    v13[3] = &unk_1E52DA520;
    id v14 = v6;
    CGFloat v15 = MinX;
    long long v16 = v18;
    uint64_t v17 = v19;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3;
    v11[3] = &unk_1E52E8F50;
    double v12 = v7;
    +[UIView _animateUsingSpringWithTension:0 friction:v13 interactive:v11 animations:100.0 completion:20.0];
  }
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  id v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setAbsoluteFrame:", v2, v3, v4, v5);
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 absoluteFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = [v4 view];
  uint64_t v14 = [v13 window];
  if (v14)
  {
    CGFloat v15 = (void *)v14;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    BOOL v16 = CGRectContainsRect(*(CGRect *)(a1 + 40), v19);

    if (v16)
    {
      uint64_t v17 = *(CGFloat **)(*(void *)(a1 + 32) + 8);
      v17[4] = v6;
      v17[5] = v8;
      v17[6] = v10;
      v17[7] = v12;
    }
  }
  else
  {
  }
  [v4 setFloating:1];

  return 1;
}

void __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ([a2 type] == 1
    && ([v7 absoluteFrame],
        double v9 = *(void **)(*(void *)(a1 + 32) + 8),
        v9[4] = v10,
        v9[5] = v11,
        v9[6] = v12,
        v9[7] = v13,
        !CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32))))
  {
    uint64_t v14 = *(double **)(*(void *)(a1 + 32) + 8);
    objc_msgSend(v7, "setAbsoluteFrame:", CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)), v14[5], v14[6], v14[7]);
    [v7 setAlpha:0.0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6;
    v21[3] = &unk_1E52E4728;
    id v15 = v7;
    uint64_t v16 = *(void *)(a1 + 32);
    id v22 = v15;
    uint64_t v23 = v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7;
    v19[3] = &unk_1E52E8F50;
    id v20 = v8;
    +[UIView _animateUsingSpringWithTension:0 friction:v21 interactive:v19 animations:100.0 completion:20.0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8;
    v17[3] = &unk_1E52D9F70;
    id v18 = v15;
    +[UIView animateWithDuration:0 delay:v17 options:0 animations:0.2 completion:0.0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ([a2 type] == 3)
  {
    [v7 absoluteFrame];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v17 = [v7 identifier];
    id v18 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
    if (v17 == v18) {
      uint64_t v19 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v19 = *(void *)(a1 + 40);
    }
    id v20 = *(double **)(v19 + 8);
    double v21 = v20[4];
    double v22 = v20[5];
    double v23 = v20[6];
    double v24 = v20[7];

    v33.origin.x = v21;
    v33.origin.y = v22;
    v33.size.width = v23;
    v33.size.height = v24;
    if (!CGRectIsNull(v33)) {
      objc_msgSend(v7, "setAbsoluteFrame:", v21, v22, v23, v24);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10;
    v27[3] = &unk_1E52DA520;
    id v28 = v7;
    uint64_t v29 = v10;
    uint64_t v30 = v12;
    uint64_t v31 = v14;
    uint64_t v32 = v16;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11;
    v25[3] = &unk_1E52E8F50;
    id v26 = v8;
    +[UIView _animateUsingSpringWithTension:0 friction:v27 interactive:v25 animations:100.0 completion:20.0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 absoluteFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = [v4 view];
  uint64_t v14 = [v13 window];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    BOOL v16 = CGRectContainsRect(*(CGRect *)(a1 + 48), v22);

    if (v16)
    {
      uint64_t v17 = [v4 identifier];
      id v18 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];

      if (v17 == v18) {
        uint64_t v19 = *(void *)(a1 + 32);
      }
      else {
        uint64_t v19 = *(void *)(a1 + 40);
      }
      id v20 = *(CGFloat **)(v19 + 8);
      v20[4] = v6;
      v20[5] = v8;
      v20[6] = v10;
      v20[7] = v12;
    }
  }
  else
  {
  }
  return 1;
}

void __70___UIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v2 = a2;
    id v3 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v2, "setBackgroundColor:");
  }
  else
  {
    id v3 = a2;
    [v3 setBackgroundColor:0];
  }
}

void __70___UIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

id __87___UIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = (id)[a2 nativeDisplayWidth];
  if (vabdd_f64(v8, *(double *)(a1 + 48)) <= 0.0001)
  {
    [*(id *)(a1 + 32) _nativeScale];
    double v10 = v9;
    if (objc_opt_respondsToSelector()) {
      [a2 referenceScreenScale];
    }
    else {
      [*(id *)(a1 + 32) _scale];
    }
    double v12 = v10 / v11;
    double v13 = *(double *)(a1 + 64);
    double v14 = *(double *)(a1 + 56) * v12;
    id result = (id)[a2 notchSize];
    if (vabdd_f64(v16, v14) <= 0.0001 && vabdd_f64(v15, v12 * v13) <= 0.0001)
    {
      id result = _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(a2, *(void **)(a1 + 32), 0);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
      *a4 = 1;
    }
  }
  return result;
}

void __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [v6 absoluteFrame];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2;
  v20[3] = &unk_1E52DA520;
  id v21 = v6;
  uint64_t v22 = v9;
  uint64_t v23 = v11;
  uint64_t v24 = v13;
  uint64_t v25 = v15;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3;
  v18[3] = &unk_1E52E8F50;
  id v19 = v7;
  id v16 = v7;
  id v17 = v6;
  +[UIView _animateUsingSpringWithTension:0 friction:v20 interactive:v18 animations:100.0 completion:20.0];
}

uint64_t __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 absoluteFrame];
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return 1;
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 _collapseChargingBoltTransformForDisplayItem:v8];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
  }
  v20[0] = v21;
  v20[1] = v22;
  v20[2] = v23;
  [v8 setTransform:v20];
  [v8 setAlpha:0.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2;
  v17[3] = &unk_1E52D9F98;
  uint64_t v11 = *(void *)(a1 + 32);
  id v18 = v8;
  uint64_t v19 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3;
  v15[3] = &unk_1E52E45A0;
  v15[4] = v11;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  +[UIView animateWithDuration:v17 animations:v15 completion:0.3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5;
  v14[3] = &unk_1E52D9F70;
  v14[4] = *(void *)(a1 + 32);
  [v7 addTimeout:v14 withHandler:0.6];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 _expandedChargingBoltTransformForDisplayItem:*(void *)(a1 + 32)];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  id v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    long long v8 = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4;
    id v9 = &unk_1E52DAB28;
    objc_copyWeak(&v10, &location);
    id v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v6 block:3.0];
    objc_msgSend(*(id *)(a1 + 32), "setBatteryExpansionTimer:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) _collapseBattery];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _collapseBattery];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _collapseBattery];
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v6 view];
  id v9 = [v6 item];
  [v8 center];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  objc_msgSend(v8, "setCenter:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v14 = [v8 layer];
  [v14 setShouldRasterize:0];

  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeScale(&v30, 1.4, 1.4);
  int v15 = [v8 _shouldReverseLayoutDirection];
  double v16 = -6.0;
  if (v15) {
    double v16 = 6.0;
  }
  CGAffineTransform t1 = v30;
  CGAffineTransformTranslate(&v29, &t1, v16, -1.0);
  CGAffineTransform v30 = v29;
  if (v8) {
    [v8 transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransform t1 = v30;
  CGAffineTransformConcat(&v29, &t1, &t2);
  CGAffineTransform v30 = v29;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7;
  _OWORD v20[3] = &unk_1E5306720;
  CGAffineTransform v24 = v29;
  id v21 = v6;
  id v22 = v8;
  uint64_t v25 = v11;
  uint64_t v26 = v13;
  id v23 = v9;
  id v17 = v9;
  id v18 = v8;
  id v19 = v6;
  +[UIView animateWithDuration:v20 animations:v7 completion:0.3];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 72);
  v4[0] = *(_OWORD *)(a1 + 56);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 88);
  [*(id *)(a1 + 32) setTransform:v4];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  return [*(id *)(a1 + 48) setHighlighted:1];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 view];
  [v4 center];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;

  return 1;
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10;
  v12[3] = &unk_1E52D9F70;
  id v13 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11;
  v9[3] = &unk_1E52E45A0;
  id v10 = v13;
  id v11 = v6;
  id v7 = v6;
  id v8 = v13;
  +[UIView animateWithDuration:v12 animations:v9 completion:0.1];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) setFloating:0];
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  return 1;
}

void __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(double **)(*(void *)(a1 + 40) + 8);
  double v10 = v9[4];
  double v11 = v9[5];
  double v12 = v9[6];
  double v13 = v9[7];
  id v14 = a2;
  objc_msgSend(v7, "setAbsoluteFrame:", v10, v11, v12, v13);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2;
  v21[3] = &unk_1E52D9F98;
  uint64_t v15 = *(void *)(a1 + 32);
  id v22 = v7;
  uint64_t v23 = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3;
  v19[3] = &unk_1E52E45A0;
  void v19[4] = v15;
  id v20 = v8;
  id v16 = v8;
  id v17 = v7;
  +[UIView animateWithDuration:v21 animations:v19 completion:0.3];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4;
  v18[3] = &unk_1E52D9F70;
  void v18[4] = *(void *)(a1 + 32);
  [v14 addTimeout:v18 withHandler:0.6];
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 _collapseChargingBoltTransformForDisplayItem:*(void *)(a1 + 32)];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  id v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 136) isEnabled]) {
    [*(id *)(*(void *)(a1 + 32) + 136) setEnabled:0];
  }
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) isEnabled];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 136) setEnabled:0];
    id v3 = *(void **)(a1 + 32);
    return [v3 _resetBattery];
  }
  return result;
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 absoluteFrame];
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  [v4 setFloating:1];

  return 1;
}

void __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 view];
  uint64_t v9 = [v6 item];
  [v8 center];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  objc_msgSend(v8, "setCenter:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7;
  v23[3] = &unk_1E52E9D28;
  id v24 = v6;
  uint64_t v27 = v11;
  uint64_t v28 = v13;
  id v25 = v8;
  id v26 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8;
  v19[3] = &unk_1E52F0BC0;
  uint64_t v14 = *(void *)(a1 + 32);
  id v20 = v25;
  uint64_t v21 = v14;
  id v22 = v7;
  id v15 = v7;
  id v16 = v25;
  id v17 = v9;
  id v18 = v6;
  +[UIView animateWithDuration:v23 animations:v19 completion:0.3];
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(a1 + 48) setHighlighted:0];
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setShouldRasterize:1];

  [*(id *)(a1 + 40) _resetBattery];
  long long v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 view];
  [v4 center];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;

  return 1;
}

void __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  [v5 setAlpha:0.0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11;
  v8[3] = &unk_1E52D9F70;
  id v9 = v5;
  id v7 = v5;
  +[UIView animateWithDuration:0 delay:v8 options:v6 animations:0.15 completion:0.2];
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 view];
  uint64_t v11 = [*(id *)(a1 + 32) statusBar];
  uint64_t v12 = [v11 regions];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"systemUpdates"];

  uint64_t v14 = [v7 type];
  [v10 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [*(id *)(a1 + 32) statusBar];
  id v24 = [v23 containerView];
  objc_msgSend(v10, "convertRect:toView:", v24, v16, v18, v20, v22);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  if (*(unsigned char *)(a1 + 48) == (v14 == 1))
  {
    CGRect v33 = [v13 layoutItem];
    objc_msgSend(v33, "_ui_frame");
    double MaxX = CGRectGetMaxX(v53);
    v54.origin.x = v26;
    v54.origin.y = v28;
    v54.size.width = v30;
    v54.size.height = v32;
    double v35 = MaxX - CGRectGetMaxX(v54);
  }
  else
  {
    v55.origin.x = v26;
    v55.origin.y = v28;
    v55.size.width = v30;
    v55.size.height = v32;
    double MinX = CGRectGetMinX(v55);
    CGRect v33 = [v13 layoutItem];
    objc_msgSend(v33, "_ui_frame");
    double v35 = MinX - CGRectGetMinX(v56);
  }

  if (*(unsigned char *)(a1 + 48)) {
    double v37 = -v35;
  }
  else {
    double v37 = v35;
  }
  if (v14 == 1)
  {
    [v8 setAlpha:0.0];
    CGAffineTransformMakeTranslation(&v52, -v37, 0.0);
    CGAffineTransform v51 = v52;
    [v8 setTransform:&v51];
    double v38 = (double)(unint64_t)[*(id *)(a1 + 40) count] * 0.25;
    uint64_t v39 = 0x20000;
  }
  else
  {
    v40 = [*(id *)(a1 + 32) systemUpdatesTimer];
    [v40 invalidate];

    [*(id *)(a1 + 32) setSystemUpdatesTimer:0];
    [*(id *)(a1 + 32) _resumeSystemUpdateData];
    double v38 = 0.0;
    uint64_t v39 = 0x10000;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2;
  v47[3] = &unk_1E52DD178;
  id v48 = v8;
  uint64_t v49 = v14;
  double v50 = v37;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_3;
  v44[3] = &unk_1E52EAFB8;
  id v45 = v9;
  uint64_t v46 = v14;
  v44[4] = *(void *)(a1 + 32);
  id v41 = v9;
  id v42 = v8;
  +[UIView animateWithDuration:v39 delay:v47 options:v44 animations:0.66 completion:v38];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6;
  v43[3] = &unk_1E52D9F70;
  v43[4] = *(void *)(a1 + 32);
  [v7 addTimeout:v43 withHandler:2.0];
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1)
  {
    long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v2;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v7, *(CGFloat *)(a1 + 48), 0.0);
  }
  long long v3 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v7;
  [v3 setTransform:&v6];
  double v4 = 0.0;
  if (*(void *)(a1 + 40) == 1) {
    double v4 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v4];
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 48) == 1)
    {
      [*(id *)(a1 + 32) _delaySystemUpdateData];
      objc_initWeak(&location, *(id *)(a1 + 32));
      long long v3 = (void *)MEMORY[0x1E4F1CB00];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4;
      v7[3] = &unk_1E52DAB28;
      objc_copyWeak(&v8, &location);
      double v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v7 block:2.0];
      [*(id *)(a1 + 32) setSystemUpdatesTimer:v4];

      [*(id *)(a1 + 32) _collapseBattery];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _disableSystemUpdates];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5;
    v6[3] = &unk_1E52D9F70;
    v6[4] = *(void *)(a1 + 32);
    return +[UIView performWithoutAnimation:v6];
  }
}

void __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _disableSystemUpdates];
    long long v2 = [v3 statusBar];
    [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

    [v3 _resumeSystemUpdateData];
    id WeakRetained = v3;
  }
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) statusBar];
  [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

  id v3 = *(void **)(a1 + 32);
  return [v3 _resumeSystemUpdateData];
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _disableSystemUpdates];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v3];
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) statusBar];
  [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

  id v3 = *(void **)(a1 + 32);
  return [v3 _resumeSystemUpdateData];
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if ([a2 type] == 2) {
    [v4 setFloating:1];
  }

  return 1;
}

void __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a2 type];
  if ((unint64_t)(v9 - 1) > 1)
  {
    v8[2](v8, 1);
  }
  else
  {
    uint64_t v10 = v9;
    if (v9 == 2)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = [v7 identifier];
      uint64_t v13 = [v11 objectForKeyedSubscript:v12];
      uint64_t v14 = [v13 integerValue];
    }
    else
    {
      double v15 = [v7 region];
      double v16 = [v15 displayItems];
      uint64_t v14 = [v16 indexOfObject:v7];

      [v7 setAlpha:0.0];
    }
    double v17 = 0.0;
    if (v10 == 1) {
      double v17 = 0.5;
    }
    double v18 = v17 + (double)v14 * 0.2;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10;
    v19[3] = &unk_1E52D9CD0;
    id v20 = v7;
    uint64_t v21 = v10;
    +[UIView animateWithDuration:0 delay:v19 options:v8 animations:0.25 completion:v18];
  }
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v1 = *(void **)(a1 + 32);
  double v3 = 0.0;
  if (*(void *)(v2 + 8) == 1) {
    double v3 = 1.0;
  }
  return [v1 setAlpha:v3];
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 type] == 2)
  {
    [v5 setFloating:1];
    CGAffineTransform v6 = [v5 region];
    id v7 = [v6 displayItems];
    uint64_t v8 = [v7 indexOfObject:v5];

    uint64_t v9 = [NSNumber numberWithInteger:v8];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v5 identifier];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  return 1;
}

void __64___UIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) regionWithIdentifier:a2];
  char v3 = [v7 isEnabled];
  if (*(unsigned char *)(a1 + 48)) {
    [v7 enableWithToken:12];
  }
  else {
    [v7 disableWithToken:12];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    char v5 = 1;
    CGAffineTransform v6 = v7;
  }
  else
  {
    char v5 = v3 ^ [v7 isEnabled];
    CGAffineTransform v6 = v7;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = v5;
}

void __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) orientation] - 1;
  char v3 = [*(id *)(a1 + 40) expandedPillPlacement];
  [v3 setEnabled:v2 > 1];

  uint64_t v4 = [*(id *)(a1 + 32) currentAggregatedData];
  char v5 = [v4 secondaryCellularEntry];

  if (v5)
  {
    int v6 = [v5 isEnabled] ^ 1;
    if (v2 > 1) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
  }
  else
  {
    int v7 = 1;
  }
  uint64_t v8 = [*(id *)(a1 + 32) regionWithIdentifier:@"expandedLeading"];
  uint64_t v9 = [v8 displayItems];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [*(id *)(a1 + 32) regionWithIdentifier:@"expandedLowerTrailing"];
  uint64_t v12 = [v11 displayItems];
  uint64_t v13 = [v12 count];

  if (v10 || v13 || (double v14 = 0.0, v7))
  {
    [*(id *)(a1 + 40) lowerExpandedBaselineOffset];
    double v14 = v15;
  }
  [*(id *)(*(void *)(a1 + 40) + 168) constant];
  if (v14 != v16)
  {
    [*(id *)(*(void *)(a1 + 40) + 168) setConstant:v14];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2;
    v17[3] = &unk_1E52D9F70;
    id v18 = *(id *)(a1 + 32);
    +[UIView animateWithDuration:v17 animations:0.25];
  }
}

uint64_t __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __48___UIStatusBarVisualProvider_Split_setExpanded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _collapseBattery];
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 identifier];
  char v3 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 identifier];
  char v3 = +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 identifier];
  char v3 = +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_4(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 identifier];
  char v3 = +[_UIStatusBarItem defaultDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

void __73___UIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

uint64_t __46___UIStatusBarVisualProvider_iOS_setExpanded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disableWithToken:10];
}

uint64_t __46___UIStatusBarVisualProvider_iOS_setExpanded___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 enableWithToken:10];
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 region];
  uint64_t v9 = [v8 identifier];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void **)(a1 + 32);
  id v64 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v14 = v64;
  [v12 airplaneTravelOffsetInProposedPartWithIdentifier:&v64 animationType:v13];
  double v56 = v15;
  id v16 = v64;

  [v6 absoluteFrame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  double v25 = [*(id *)(a1 + 32) statusBar];
  [v25 frameForPartWithIdentifier:v16 includeInternalItems:1];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    CGFloat v34 = v18;
    CGFloat v35 = v20;
    CGFloat v36 = v22;
    CGFloat v37 = v24;
    if (*(unsigned char *)(a1 + 64))
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v34);
      v65.origin.x = v27;
      v65.origin.y = v29;
      v65.size.width = v31;
      v65.size.height = v33;
      double v39 = MinX - CGRectGetMaxX(v65) - v56;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v67.origin.x = v27;
      v67.origin.y = v29;
      v67.size.width = v31;
      v67.size.height = v33;
      double v39 = v56 + MaxX - CGRectGetMinX(v67);
    }
    CGAffineTransformMakeTranslation(&v63, -v39, 0.0);
    CGAffineTransform v62 = v63;
    [v6 setTransform:&v62];
    uint64_t v46 = 0x20000;
  }
  else
  {
    CGFloat v40 = v27;
    CGFloat v41 = v29;
    CGFloat v42 = v31;
    CGFloat v43 = v33;
    if (*(unsigned char *)(a1 + 64))
    {
      double v44 = CGRectGetMinX(*(CGRect *)&v40);
      v66.origin.x = v18;
      v66.origin.y = v20;
      v66.size.width = v22;
      v66.size.height = v24;
      double v39 = v44 - CGRectGetMaxX(v66) - v56;
    }
    else
    {
      double v47 = CGRectGetMaxX(*(CGRect *)&v40);
      v68.origin.x = v18;
      v68.origin.y = v20;
      v68.size.width = v22;
      v68.size.height = v24;
      double v39 = v56 + v47 - CGRectGetMinX(v68);
    }
    uint64_t v46 = 0x10000;
  }
  [*(id *)(a1 + 32) airplaneSpeedForAnimationType:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  double v49 = 1.0 / v48;
  double v50 = -v39;
  if (v39 >= 0.0) {
    double v50 = v39;
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v50 * v49;
  [*(id *)(a1 + 32) airplaneShouldFadeForAnimationType:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v51 = *(void *)(a1 + 48);
  if (v52 != 0.0 && *(void *)(*(void *)(v51 + 8) + 24) == 1)
  {
    [v6 setAlpha:0.0];
    uint64_t v51 = *(void *)(a1 + 48);
  }
  double v53 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2;
  v57[3] = &unk_1E5306868;
  uint64_t v60 = v51;
  double v61 = v39;
  uint64_t v54 = *(void *)(a1 + 32);
  id v58 = v6;
  uint64_t v59 = v54;
  id v55 = v6;
  +[UIView animateWithDuration:v46 delay:v57 options:v7 animations:v53 completion:0.0];
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8.c = v2;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v8, *(CGFloat *)(a1 + 56), 0.0);
  }
  char v3 = *(void **)(a1 + 32);
  CGAffineTransform v7 = v8;
  [v3 setTransform:&v7];
  uint64_t result = [*(id *)(a1 + 40) airplaneShouldFadeForAnimationType:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (v5 != 0.0)
  {
    double v6 = 1.0;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 2) {
      double v6 = 0.0;
    }
    return [*(id *)(a1 + 32) setAlpha:v6];
  }
  return result;
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 type];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 2) {
    [v5 setFloating:1];
  }

  return 1;
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  uint64_t v10 = [v8 region];
  uint64_t v11 = [v10 identifier];
  int v12 = [v11 isEqual:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if (!v12)
  {
    v9[2](v9, 1);
    goto LABEL_18;
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v13 == 1)
  {
    if ([v7 type] == 2)
    {
      double v14 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) * 0.5;
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5;
      v86[3] = &unk_1E52D9F70;
      id v87 = v8;
      +[UIView animateWithDuration:v86 animations:v9 completion:v14];

      goto LABEL_18;
    }
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v13 != 2)
  {
    CGFloat v42 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    CGFloat v43 = [v8 identifier];
    double v44 = [v42 objectForKeyedSubscript:v43];

    if (v44)
    {
      [v44 CGRectValue];
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      [v8 absoluteFrame];
      CGFloat x = v88.origin.x;
      CGFloat y = v88.origin.y;
      CGFloat width = v88.size.width;
      CGFloat height = v88.size.height;
      v89.origin.CGFloat x = v46;
      v89.origin.CGFloat y = v48;
      v89.size.CGFloat width = v50;
      v89.size.CGFloat height = v52;
      if (CGRectEqualToRect(v88, v89))
      {
        v9[2](v9, 1);
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v8, "setAbsoluteFrame:", v46, v48, v50, v52);
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11;
      v66[3] = &unk_1E52DA520;
      id v67 = v8;
      CGFloat v68 = x;
      CGFloat v69 = y;
      CGFloat v70 = width;
      CGFloat v71 = height;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12;
      v64[3] = &unk_1E52E8F50;
      CGRect v65 = v9;
      +[UIView _animateUsingSpringWithTension:0 friction:v66 interactive:v64 animations:100.0 completion:20.0];

      v57 = v67;
    }
    else
    {
      [v8 setAlpha:0.0];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13;
      v62[3] = &unk_1E52D9F70;
      id v63 = v8;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14;
      v60[3] = &unk_1E52E8F50;
      double v61 = v9;
      +[UIView _animateUsingSpringWithTension:0 friction:v62 interactive:v60 animations:100.0 completion:20.0];

      v57 = v63;
    }

    goto LABEL_17;
  }
  double v15 = [*(id *)(a1 + 32) statusBar];
  id v16 = [v15 regions];
  double v17 = [v16 objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  CGFloat v18 = [v17 displayItems];

  double v19 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v20 = v19 / (double)(unint64_t)[v18 count];
  double v58 = v20 * (double)(unint64_t)([v18 indexOfObject:v8] + 1);
  double v59 = v20 + *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v21 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  CGFloat v22 = [v8 identifier];
  double v23 = [v21 objectForKeyedSubscript:v22];
  [v23 CGRectValue];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  [v8 absoluteFrame];
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  if ([v7 type] == 3) {
    objc_msgSend(v8, "setAbsoluteFrame:", v25, v27, v29, v31);
  }
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6;
  v72[3] = &unk_1E53068B8;
  id v40 = v7;
  uint64_t v41 = *(void *)(a1 + 32);
  id v73 = v40;
  uint64_t v74 = v41;
  id v75 = v8;
  double v76 = v25;
  double v77 = v27;
  double v78 = v29;
  double v79 = v31;
  uint64_t v80 = v33;
  uint64_t v81 = v35;
  uint64_t v82 = v37;
  uint64_t v83 = v39;
  double v84 = v58;
  double v85 = v59;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v72, v9);

LABEL_18:
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == 3)
  {
    [*(id *)(a1 + 40) airplaneObstacleFadeOutDuration];
    double v3 = v2;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7;
    v19[3] = &unk_1E52DA520;
    BOOL v4 = &v20;
    id v20 = *(id *)(a1 + 48);
    long long v5 = *(_OWORD *)(a1 + 72);
    long long v21 = *(_OWORD *)(a1 + 56);
    long long v22 = v5;
    +[UIView addKeyframeWithRelativeStartTime:v19 relativeDuration:0.0 animations:v3];
    [*(id *)(a1 + 40) airplaneObstacleFadeOutDuration];
    double v7 = v6;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8;
    v15[3] = &unk_1E52DA520;
    id v16 = *(id *)(a1 + 48);
    long long v17 = *(_OWORD *)(a1 + 88);
    long long v18 = *(_OWORD *)(a1 + 104);
    +[UIView addKeyframeWithRelativeStartTime:v15 relativeDuration:v7 animations:0.0];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9;
    v13[3] = &unk_1E52D9F70;
    BOOL v4 = &v14;
    id v14 = *(id *)(a1 + 48);
    +[UIView addKeyframeWithRelativeStartTime:v13 relativeDuration:0.0 animations:0.0];
  }

  double v8 = *(double *)(a1 + 120) / *(double *)(a1 + 128);
  [*(id *)(a1 + 40) airplaneObstacleFadeInDuration];
  double v10 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10;
  v11[3] = &unk_1E52D9F70;
  id v12 = *(id *)(a1 + 48);
  +[UIView addKeyframeWithRelativeStartTime:v11 relativeDuration:v8 animations:v10];
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setAbsoluteFrame:", v2, v3, v4, v5);
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 displayItemAbsoluteFrames];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [v7 type];
  if (v11 == 2) {
    [v5 setFloating:1];
  }

  return 1;
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = +[_UIStatusBarItem defaultDisplayIdentifier];
  if ([v5 isEqual:v3])
  {
  }
  else
  {
    char v4 = [*(id *)(a1 + 32) containsObject:v5];

    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 40) addSubAnimation:*(void *)(a1 + 48) forDisplayItemWithIdentifier:v5];
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

void __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2;
  v7[3] = &unk_1E52D9F70;
  id v8 = v5;
  id v6 = v5;
  +[UIView animateWithDuration:4 delay:v7 options:a4 animations:0.333333333 completion:0.0];
}

uint64_t __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [v6 absoluteFrame];
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) - (v9 + v8 * 0.5), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) - (v11 + v10 * 0.5));
  CGAffineTransform v16 = v18;
  CGAffineTransformScale(&v17, &v16, 0.66, 0.66);
  CGAffineTransform v18 = v17;
  [v6 setAlpha:0.0];
  CGAffineTransform v15 = v18;
  [v6 setTransform:&v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4;
  v13[3] = &unk_1E52D9F70;
  id v14 = v6;
  id v12 = v6;
  +[UIView animateWithDuration:v13 animations:v7 completion:0.333333333];
}

uint64_t __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 absoluteFrame];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  *(double *)(v8 + 32) = v6 + v5 * 0.5;
  *(double *)(v8 + 40) = v9 + v7 * 0.5;
  [v4 setFloating:1];

  return 1;
}

void __109___UIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideActivityDetailAndUpdate:1];
}

void __103___UIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v2 = a2;
    id v3 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v2, "setBackgroundColor:");
  }
  else
  {
    id v3 = a2;
    [v3 setBackgroundColor:0];
  }
}

@end