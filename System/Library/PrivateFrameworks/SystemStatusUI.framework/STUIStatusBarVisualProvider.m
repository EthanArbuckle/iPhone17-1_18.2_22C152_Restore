@interface STUIStatusBarVisualProvider
@end

@implementation STUIStatusBarVisualProvider

uint64_t __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setDynamicScaleTransform:&v4];
}

void __65__STUIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke(uint64_t a1, uint64_t a2)
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
    v6 = v7;
  }
  else
  {
    char v5 = v3 ^ [v7 isEnabled];
    v6 = v7;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = v5;
}

void __71__STUIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E4FB1618];
    id v3 = a2;
    id v4 = [v2 colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v3, "setBackgroundColor:");
  }
  else
  {
    id v4 = a2;
    [v4 setBackgroundColor:0];
  }
}

void __71__STUIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

void __79__STUIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E4FB1618];
    id v3 = a2;
    id v4 = [v2 colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v3, "setBackgroundColor:");
  }
  else
  {
    id v4 = a2;
    [v4 setBackgroundColor:0];
  }
}

uint64_t __62__STUIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOverriddenStyle:*(void *)(a1 + 32)];
}

void __71__STUIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 statusBar];
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

uint64_t __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) expandedBaselineOffset];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) statusBar];
  char v5 = [v4 regionWithIdentifier:@"expandedLowerLeading"];
  char v6 = [v5 displayItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [*(id *)(a1 + 32) dualLineExpandedBaselineOffset];
    double v3 = v8;
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 208) constant];
  if (v3 != v10)
  {
    [*(id *)(*(void *)(a1 + 32) + 208) setConstant:v3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2;
    v11[3] = &unk_1E6AA37A0;
    v11[4] = *(void *)(a1 + 32);
    return [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.25];
  }
  return result;
}

void __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 layoutIfNeeded];
}

uint64_t __55__STUIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOverriddenStyle:*(void *)(a1 + 32)];
}

void __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
    long long v19 = *(_OWORD *)(v9 + 40);
    uint64_t v20 = *(void *)(v9 + 56);
    CGFloat MinX = CGRectGetMinX(*(CGRect *)(*(void *)(v8 + 8) + 32));
    v11 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2;
    v14[3] = &unk_1E6AA38D8;
    id v15 = v6;
    CGFloat v16 = MinX;
    long long v17 = v19;
    uint64_t v18 = v20;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3;
    v12[3] = &unk_1E6AA3900;
    v13 = v7;
    [v11 _animateUsingSpringWithTension:0 friction:v14 interactive:v12 animations:100.0 completion:20.0];
  }
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  id v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setAbsoluteFrame:", v2, v3, v4, v5);
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
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
    id v15 = (void *)v14;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    BOOL v16 = CGRectContainsRect(*(CGRect *)(a1 + 40), v19);

    if (v16)
    {
      long long v17 = *(CGFloat **)(*(void *)(a1 + 32) + 8);
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

void __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
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
    id v15 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6;
    v23[3] = &unk_1E6AA3860;
    id v16 = v7;
    uint64_t v17 = *(void *)(a1 + 32);
    id v24 = v16;
    uint64_t v25 = v17;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7;
    v21[3] = &unk_1E6AA3900;
    id v22 = v8;
    [v15 _animateUsingSpringWithTension:0 friction:v23 interactive:v21 animations:100.0 completion:20.0];
    uint64_t v18 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8;
    v19[3] = &unk_1E6AA37A0;
    id v20 = v16;
    [v18 animateWithDuration:0 delay:v19 options:0 animations:0.2 completion:0.0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
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
    uint64_t v18 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
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

    v34.origin.x = v21;
    v34.origin.y = v22;
    v34.size.width = v23;
    v34.size.height = v24;
    if (!CGRectIsNull(v34)) {
      objc_msgSend(v7, "setAbsoluteFrame:", v21, v22, v23, v24);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4FB1EB0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10;
    v28[3] = &unk_1E6AA38D8;
    id v29 = v7;
    uint64_t v30 = v10;
    uint64_t v31 = v12;
    uint64_t v32 = v14;
    uint64_t v33 = v16;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11;
    v26[3] = &unk_1E6AA3900;
    id v27 = v8;
    [v25 _animateUsingSpringWithTension:0 friction:v28 interactive:v26 animations:100.0 completion:20.0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
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
      uint64_t v18 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];

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

uint64_t __47__STUIStatusBarVisualProvider_iOS_setExpanded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disableWithToken:10];
}

uint64_t __47__STUIStatusBarVisualProvider_iOS_setExpanded___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 enableWithToken:10];
}

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [v6 region];
  uint64_t v9 = [v8 identifier];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  CGFloat v12 = *(void **)(a1 + 32);
  id v65 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v14 = v65;
  [v12 airplaneTravelOffsetInProposedPartWithIdentifier:&v65 animationType:v13];
  double v57 = v15;
  id v16 = v65;

  [v6 absoluteFrame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  uint64_t v25 = [*(id *)(a1 + 32) statusBar];
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
      v66.origin.x = v27;
      v66.origin.y = v29;
      v66.size.width = v31;
      v66.size.height = v33;
      double v39 = MinX - CGRectGetMaxX(v66) - v57;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v68.origin.x = v27;
      v68.origin.y = v29;
      v68.size.width = v31;
      v68.size.height = v33;
      double v39 = v57 + MaxX - CGRectGetMinX(v68);
    }
    CGAffineTransformMakeTranslation(&v64, -v39, 0.0);
    CGAffineTransform v63 = v64;
    [v6 setTransform:&v63];
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
      v67.origin.x = v18;
      v67.origin.y = v20;
      v67.size.width = v22;
      v67.size.height = v24;
      double v39 = v44 - CGRectGetMaxX(v67) - v57;
    }
    else
    {
      double v47 = CGRectGetMaxX(*(CGRect *)&v40);
      v69.origin.x = v18;
      v69.origin.y = v20;
      v69.size.width = v22;
      v69.size.height = v24;
      double v39 = v57 + v47 - CGRectGetMinX(v69);
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
  v53 = (void *)MEMORY[0x1E4FB1EB0];
  double v54 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2;
  v58[3] = &unk_1E6AA3D58;
  uint64_t v61 = v51;
  double v62 = v39;
  uint64_t v55 = *(void *)(a1 + 32);
  id v59 = v6;
  uint64_t v60 = v55;
  id v56 = v6;
  [v53 animateWithDuration:v46 delay:v58 options:v7 animations:v54 completion:0.0];
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2(uint64_t a1)
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
  double v3 = *(void **)(a1 + 32);
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

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 type];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 2) {
    [v5 setFloating:1];
  }

  return 1;
}

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  uint64_t v10 = [v8 region];
  double v11 = [v10 identifier];
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
      id v14 = (void *)MEMORY[0x1E4FB1EB0];
      double v15 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) * 0.5;
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5;
      v90[3] = &unk_1E6AA37A0;
      id v91 = v8;
      [v14 animateWithDuration:v90 animations:v9 completion:v15];

      goto LABEL_18;
    }
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v13 != 2)
  {
    double v44 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v45 = [v8 identifier];
    uint64_t v46 = [v44 objectForKeyedSubscript:v45];

    if (v46)
    {
      [v46 CGRectValue];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      [v8 absoluteFrame];
      CGFloat x = v92.origin.x;
      CGFloat y = v92.origin.y;
      CGFloat width = v92.size.width;
      CGFloat height = v92.size.height;
      v93.origin.CGFloat x = v48;
      v93.origin.CGFloat y = v50;
      v93.size.CGFloat width = v52;
      v93.size.CGFloat height = v54;
      if (CGRectEqualToRect(v92, v93))
      {
        v9[2](v9, 1);
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v8, "setAbsoluteFrame:", v48, v50, v52, v54);
      uint64_t v61 = (void *)MEMORY[0x1E4FB1EB0];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11;
      v70[3] = &unk_1E6AA38D8;
      id v71 = v8;
      CGFloat v72 = x;
      CGFloat v73 = y;
      CGFloat v74 = width;
      CGFloat v75 = height;
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12;
      v68[3] = &unk_1E6AA3900;
      CGRect v69 = v9;
      [v61 _animateUsingSpringWithTension:0 friction:v70 interactive:v68 animations:100.0 completion:20.0];

      uint64_t v60 = v71;
    }
    else
    {
      [v8 setAlpha:0.0];
      id v59 = (void *)MEMORY[0x1E4FB1EB0];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13;
      v66[3] = &unk_1E6AA37A0;
      id v67 = v8;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14;
      v64[3] = &unk_1E6AA3900;
      id v65 = v9;
      [v59 _animateUsingSpringWithTension:0 friction:v66 interactive:v64 animations:100.0 completion:20.0];

      uint64_t v60 = v67;
    }

    goto LABEL_17;
  }
  id v16 = [*(id *)(a1 + 32) statusBar];
  double v17 = [v16 regions];
  CGFloat v18 = [v17 objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  double v19 = [v18 displayItems];

  double v20 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  double v21 = v20 / (double)(unint64_t)[v19 count];
  double v62 = v21 * (double)(unint64_t)([v19 indexOfObject:v8] + 1);
  double v63 = v21 + *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  CGFloat v22 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  double v23 = [v8 identifier];
  CGFloat v24 = [v22 objectForKeyedSubscript:v23];
  [v24 CGRectValue];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  [v8 absoluteFrame];
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  if ([v7 type] == 3) {
    objc_msgSend(v8, "setAbsoluteFrame:", v26, v28, v30, v32);
  }
  CGFloat v41 = (void *)MEMORY[0x1E4FB1EB0];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6;
  v76[3] = &unk_1E6AA3DA8;
  id v42 = v7;
  uint64_t v43 = *(void *)(a1 + 32);
  id v77 = v42;
  uint64_t v78 = v43;
  id v79 = v8;
  double v80 = v26;
  double v81 = v28;
  double v82 = v30;
  double v83 = v32;
  uint64_t v84 = v34;
  uint64_t v85 = v36;
  uint64_t v86 = v38;
  uint64_t v87 = v40;
  double v88 = v62;
  double v89 = v63;
  objc_msgSend(v41, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v76, v9);

LABEL_18:
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) type];
  double v3 = (void *)MEMORY[0x1E4FB1EB0];
  if (v2 == 3)
  {
    [*(id *)(a1 + 40) airplaneObstacleFadeOutDuration];
    double v5 = v4;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7;
    v23[3] = &unk_1E6AA38D8;
    double v6 = &v24;
    id v24 = *(id *)(a1 + 48);
    long long v7 = *(_OWORD *)(a1 + 72);
    long long v25 = *(_OWORD *)(a1 + 56);
    long long v26 = v7;
    [v3 addKeyframeWithRelativeStartTime:v23 relativeDuration:0.0 animations:v5];
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    [*(id *)(a1 + 40) airplaneObstacleFadeOutDuration];
    double v10 = v9;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8;
    v19[3] = &unk_1E6AA38D8;
    id v20 = *(id *)(a1 + 48);
    long long v21 = *(_OWORD *)(a1 + 88);
    long long v22 = *(_OWORD *)(a1 + 104);
    [v8 addKeyframeWithRelativeStartTime:v19 relativeDuration:v10 animations:0.0];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9;
    v17[3] = &unk_1E6AA37A0;
    double v6 = &v18;
    id v18 = *(id *)(a1 + 48);
    [v3 addKeyframeWithRelativeStartTime:v17 relativeDuration:0.0 animations:0.0];
  }

  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  double v12 = *(double *)(a1 + 120) / *(double *)(a1 + 128);
  [*(id *)(a1 + 40) airplaneObstacleFadeInDuration];
  double v14 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10;
  v15[3] = &unk_1E6AA37A0;
  id v16 = *(id *)(a1 + 48);
  [v11 addKeyframeWithRelativeStartTime:v15 relativeDuration:v12 animations:v14];
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setAbsoluteFrame:", v2, v3, v4, v5);
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15(uint64_t a1, void *a2, void *a3)
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

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = +[STUIStatusBarItem defaultDisplayIdentifier];
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

void __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5 = a3;
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2;
  v8[3] = &unk_1E6AA37A0;
  id v9 = v5;
  id v7 = v5;
  [v6 animateWithDuration:4 delay:v8 options:a4 animations:0.333333333 completion:0.0];
}

uint64_t __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [v6 absoluteFrame];
  UIRectGetCenter();
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&v17, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) - v8, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) - v9);
  CGAffineTransform v15 = v17;
  CGAffineTransformScale(&v16, &v15, 0.66, 0.66);
  CGAffineTransform v17 = v16;
  [v6 setAlpha:0.0];
  CGAffineTransform v14 = v17;
  [v6 setTransform:&v14];
  double v10 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4;
  v12[3] = &unk_1E6AA37A0;
  id v13 = v6;
  id v11 = v6;
  [v10 animateWithDuration:v12 animations:v7 completion:0.333333333];
}

uint64_t __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 absoluteFrame];
  UIRectGetCenter();
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  [v4 setFloating:1];

  return 1;
}

void __67__STUIStatusBarVisualProvider_DynamicSplit_leadingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EC05F050;
  qword_1EC05F050 = (uint64_t)&unk_1F2F9C8B8;
}

void __68__STUIStatusBarVisualProvider_DynamicSplit_trailingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EC05F060;
  qword_1EC05F060 = (uint64_t)&unk_1F2F9C8D0;
}

uint64_t __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  long long v3 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  id v4 = [*(id *)(a1 + 32) view];
  uint64_t v5 = [v4 layer];
  uint64_t v6 = [v5 presentationLayer];
  uint64_t v7 = [v6 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];

  if (v2)
  {
    if (v7) {
      double v8 = v7;
    }
    else {
      double v8 = &unk_1F2F9CC70;
    }
    [v3 setFromValue:v8];
    [v3 setToValue:&unk_1F2F9CC80];
    [v3 setDuration:*(double *)(a1 + 40) * 0.35];
    LODWORD(v9) = 1045220557;
    LODWORD(v10) = 1.0;
    LODWORD(v11) = 1.0;
    double v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :v9 :v10 :v11];
    [v3 setTimingFunction:v12];

    id v13 = [*(id *)(a1 + 32) view];
    CGAffineTransform v14 = [v13 layer];
    [v14 addAnimation:v3 forKey:@"blur"];

    [*(id *)(a1 + 32) setDynamicHidingAlpha:0.0];
    CGAffineTransformMakeScale(&v35, 0.5, 0.5);
    CGAffineTransform v15 = *(void **)(a1 + 32);
    CGAffineTransform v34 = v35;
    CGAffineTransform v16 = &v34;
  }
  else
  {
    if (v7)
    {
      [v7 doubleValue];
      if (v17 == 0.0) {
        id v18 = &unk_1F2F9CC80;
      }
      else {
        id v18 = v7;
      }
    }
    else
    {
      id v18 = &unk_1F2F9CC80;
    }
    [v3 setFromValue:v18];
    [v3 setToValue:&unk_1F2F9CC70];
    [v3 setDuration:*(double *)(a1 + 40)];
    LODWORD(v19) = 1045220557;
    LODWORD(v20) = 1.0;
    LODWORD(v21) = 1.0;
    long long v22 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :v19 :v20 :v21];
    [v3 setTimingFunction:v22];

    double v23 = [*(id *)(a1 + 32) view];
    id v24 = [v23 layer];
    [v24 addAnimation:v3 forKey:@"blur"];

    [*(id *)(a1 + 32) setDynamicHidingAlpha:1.0];
    CGAffineTransform v15 = *(void **)(a1 + 32);
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v33[0] = *MEMORY[0x1E4F1DAB8];
    v33[1] = v25;
    v33[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransform v16 = (CGAffineTransform *)v33;
  }
  [v15 setDynamicHidingTransform:v16];

  CGAffineTransformMakeScale(&v32, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  long long v26 = *(void **)(a1 + 32);
  CGAffineTransform v31 = v32;
  uint64_t result = [v26 setDynamicScaleTransform:&v31];
  if (!*(unsigned char *)(a1 + 56))
  {
    CGAffineTransformMakeScale(&v30, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
    double v28 = *(void **)(a1 + 32);
    CGAffineTransform v29 = v30;
    return [v28 setDynamicScaleTransform:&v29];
  }
  return result;
}

uint64_t __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_95(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setDynamicScaleTransform:&v4];
}

uint64_t __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setDynamicScaleTransform:&v4];
}

void __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cutoutLayoutGuide];
  id v1 = [v2 owningView];
  [v1 layoutSubviews];
}

void __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cutoutLayoutGuide];
  id v1 = [v2 owningView];
  [v1 layoutSubviews];
}

void __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

void __73__STUIStatusBarVisualProvider_DynamicSplitMedium_leadingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EC05F070;
  qword_1EC05F070 = (uint64_t)&unk_1F2F9C8E8;
}

void __74__STUIStatusBarVisualProvider_DynamicSplitMedium_trailingItemCutoffWidths__block_invoke()
{
  v0 = (void *)qword_1EC05F080;
  qword_1EC05F080 = (uint64_t)&unk_1F2F9C900;
}

void __110__STUIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideActivityDetailAndUpdate:1];
}

void __104__STUIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x1E4FB1618];
    id v3 = a2;
    id v4 = [v2 colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v3, "setBackgroundColor:");
  }
  else
  {
    id v4 = a2;
    [v4 setBackgroundColor:0];
  }
}

id __88__STUIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
      id result = STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(a2, *(void **)(a1 + 32), 0);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
      *a4 = 1;
    }
  }
  return result;
}

void __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [v6 absoluteFrame];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
  double v16 = (void *)MEMORY[0x1E4FB1EB0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2;
  v21[3] = &unk_1E6AA38D8;
  id v22 = v6;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v13;
  uint64_t v26 = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3;
  v19[3] = &unk_1E6AA3900;
  id v20 = v7;
  id v17 = v7;
  id v18 = v6;
  [v16 _animateUsingSpringWithTension:0 friction:v21 interactive:v19 animations:100.0 completion:20.0];
}

uint64_t __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 absoluteFrame];
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return 1;
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = a2;
  [(STUIStatusBarVisualProvider_Split *)&v22 _collapseChargingBoltTransformForDisplayItem:v7];
  CGAffineTransform v21 = v22;
  [v7 setTransform:&v21];
  [v7 setAlpha:0.0];
  uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2;
  v18[3] = &unk_1E6AA39F0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v19 = v7;
  uint64_t v20 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3;
  v16[3] = &unk_1E6AA4B08;
  v16[4] = v12;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  [v11 animateWithDuration:v18 animations:v16 completion:0.3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5;
  v15[3] = &unk_1E6AA37A0;
  void v15[4] = *(void *)(a1 + 32);
  [v10 addTimeout:v15 withHandler:0.6];
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  id v2 = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8))
  {
    id v4 = [v2 view];
    if ([v4 _shouldReverseLayoutDirection]) {
      double v5 = 7.0;
    }
    else {
      double v5 = -7.0;
    }

    CGAffineTransformMakeTranslation(&v8, v5, -1.66666667);
    id v2 = *(void **)(a1 + 32);
  }
  else
  {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    CGAffineTransform v8 = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4;
    uint64_t v9 = &unk_1E6AA3A18;
    objc_copyWeak(&v10, &location);
    id v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v6 block:3.0];
    objc_msgSend(*(id *)(a1 + 32), "setBatteryExpansionTimer:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[STUIStatusBarVisualProvider_Split _collapseBattery](*(id **)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[STUIStatusBarVisualProvider_Split _collapseBattery](WeakRetained);
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5(uint64_t a1)
{
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  CGAffineTransform v8 = [v6 view];
  uint64_t v9 = [v6 item];
  [v8 center];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  objc_msgSend(v8, "setCenter:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  id v14 = [v8 layer];
  [v14 setShouldRasterize:0];

  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, 1.4, 1.4);
  int v15 = [v8 _shouldReverseLayoutDirection];
  double v16 = -6.0;
  if (v15) {
    double v16 = 6.0;
  }
  CGAffineTransform t1 = v31;
  CGAffineTransformTranslate(&v30, &t1, v16, -1.0);
  CGAffineTransform v31 = v30;
  if (v8) {
    [v8 transform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransform t1 = v31;
  CGAffineTransformConcat(&v30, &t1, &t2);
  CGAffineTransform v31 = v30;
  id v17 = (void *)MEMORY[0x1E4FB1EB0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7;
  v21[3] = &unk_1E6AA4B30;
  CGAffineTransform v25 = v30;
  id v22 = v6;
  id v23 = v8;
  uint64_t v26 = v11;
  uint64_t v27 = v13;
  id v24 = v9;
  id v18 = v9;
  id v19 = v8;
  id v20 = v6;
  [v17 animateWithDuration:v21 animations:v7 completion:0.3];
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 72);
  v4[0] = *(_OWORD *)(a1 + 56);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 88);
  [*(id *)(a1 + 32) setTransform:v4];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  return [*(id *)(a1 + 48) setHighlighted:1];
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 view];
  [v4 center];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;

  return 1;
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10;
  v13[3] = &unk_1E6AA37A0;
  id v14 = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11;
  v10[3] = &unk_1E6AA4B08;
  id v11 = v14;
  id v12 = v6;
  id v8 = v6;
  id v9 = v14;
  [v7 animateWithDuration:v13 animations:v10 completion:0.1];
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) setFloating:0];
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  return 1;
}

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  int v15 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2;
  v22[3] = &unk_1E6AA39F0;
  uint64_t v16 = *(void *)(a1 + 32);
  id v23 = v7;
  uint64_t v24 = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3;
  v20[3] = &unk_1E6AA4B08;
  v20[4] = v16;
  id v21 = v8;
  id v17 = v8;
  id v18 = v7;
  [v15 animateWithDuration:v22 animations:v20 completion:0.3];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4;
  v19[3] = &unk_1E6AA37A0;
  void v19[4] = *(void *)(a1 + 32);
  [v14 addTimeout:v19 withHandler:0.6];
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  [(STUIStatusBarVisualProvider_Split *)&v5 _collapseChargingBoltTransformForDisplayItem:*(void **)(a1 + 32)];
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 144) isEnabled]) {
    [*(id *)(*(void *)(a1 + 32) + 144) setEnabled:0];
  }
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 144) isEnabled])
  {
    [*(id *)(*(void *)(a1 + 32) + 144) setEnabled:0];
    long long v2 = *(void **)(a1 + 32);
    -[STUIStatusBarVisualProvider_Split _resetBattery](v2);
  }
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 absoluteFrame];
  CGAffineTransform v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  [v4 setFloating:1];

  return 1;
}

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 view];
  uint64_t v9 = [v6 item];
  [v8 center];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  objc_msgSend(v8, "setCenter:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v14 = (void *)MEMORY[0x1E4FB1EB0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7;
  v24[3] = &unk_1E6AA4BA0;
  id v25 = v6;
  uint64_t v28 = v11;
  uint64_t v29 = v13;
  id v26 = v8;
  id v27 = v9;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8;
  v20[3] = &unk_1E6AA4BC8;
  uint64_t v15 = *(void *)(a1 + 32);
  id v21 = v26;
  uint64_t v22 = v15;
  id v23 = v7;
  id v16 = v7;
  id v17 = v26;
  id v18 = v9;
  id v19 = v6;
  [v14 animateWithDuration:v24 animations:v20 completion:0.3];
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
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

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  [v2 setShouldRasterize:1];

  -[STUIStatusBarVisualProvider_Split _resetBattery](*(void **)(a1 + 40));
  long long v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 view];
  [v4 center];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;

  return 1;
}

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  [v5 setAlpha:0.0];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11;
  v9[3] = &unk_1E6AA37A0;
  id v10 = v5;
  id v8 = v5;
  [v7 animateWithDuration:0 delay:v9 options:v6 animations:0.15 completion:0.2];
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a2 type];
  [(id)objc_opt_class() height];
  if (v8 == 1)
  {
    double v10 = v9;
    [v6 setAlpha:0.0];
    CGAffineTransformMakeTranslation(&v22, 0.0, v10 * -0.5);
    CGAffineTransform v21 = v22;
    [v6 setTransform:&v21];
    double v11 = 0.25;
    uint64_t v12 = 0x20000;
  }
  else
  {
    double v11 = 0.0;
    uint64_t v12 = 0x10000;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4FB1EB0];
  id v17 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_2;
  v18[3] = &unk_1E6AA3F30;
  id v19 = v6;
  uint64_t v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_3;
  v16[3] = &unk_1E6AA4200;
  id v14 = v7;
  id v15 = v6;
  [v13 animateWithDuration:v12 delay:v18 options:v16 animations:0.66 completion:v11];
}

uint64_t __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_2(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v6];
  double v4 = 0.0;
  if (*(void *)(a1 + 40) == 1) {
    double v4 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v4];
}

uint64_t __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if ([a2 type] == 2) {
    [v4 setFloating:1];
  }

  return 1;
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 view];
  double v11 = [*(id *)(a1 + 32) statusBar];
  uint64_t v12 = [v11 regions];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"systemUpdates"];

  uint64_t v14 = [v7 type];
  [v10 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = [*(id *)(a1 + 32) statusBar];
  uint64_t v24 = [v23 containerView];
  objc_msgSend(v10, "convertRect:toView:", v24, v16, v18, v20, v22);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  if (*(unsigned char *)(a1 + 48))
  {
    [v10 bounds];
    double v34 = v33;
    id v35 = v10;
  }
  else
  {
    if (*(unsigned char *)(a1 + 49) == (v14 == 1))
    {
      uint64_t v36 = [v13 layoutItem];
      objc_msgSend(v36, "_ui_frame");
      double MaxX = CGRectGetMaxX(v75);
      v76.origin.CGFloat x = v26;
      v76.origin.CGFloat y = v28;
      v76.size.CGFloat width = v30;
      v76.size.CGFloat height = v32;
      double v34 = MaxX - CGRectGetMaxX(v76);
    }
    else
    {
      v77.origin.CGFloat x = v26;
      v77.origin.CGFloat y = v28;
      v77.size.CGFloat width = v30;
      v77.size.CGFloat height = v32;
      double MinX = CGRectGetMinX(v77);
      uint64_t v36 = [v13 layoutItem];
      objc_msgSend(v36, "_ui_frame");
      double v34 = MinX - CGRectGetMinX(v78);
    }

    id v35 = 0;
    if (*(unsigned char *)(a1 + 49)) {
      double v34 = -v34;
    }
  }
  if (v14 == 1)
  {
    double v39 = 0.25;
    if (*(unsigned char *)(a1 + 48)
      || (double v39 = (double)(unint64_t)[*(id *)(a1 + 40) count] * 0.25, *(unsigned char *)(a1 + 48)))
    {
      [v35 setHideWithWipe:1];
    }
    else
    {
      [v8 setAlpha:0.0];
      CGAffineTransformMakeTranslation(&v74, -v34, 0.0);
      CGAffineTransform v73 = v74;
      [v8 setTransform:&v73];
    }
    char v40 = *(unsigned char *)(a1 + 48);
    if (v40)
    {
      id v56 = v13;
      id v57 = v7;
      id v41 = v9;
      objc_initWeak(&location, v35);
      id v42 = [MEMORY[0x1E4F41A40] disappearUpEffect];
      uint64_t v43 = [v42 effectWithByLayer];
      double v44 = [MEMORY[0x1E4F41A50] optionsWithNonRepeating];
      [v35 addSymbolEffect:v43 options:v44 animated:0];

      dispatch_time_t v45 = dispatch_time(0, (uint64_t)((v39 + 0.165) * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2;
      block[3] = &unk_1E6AA4C10;
      uint64_t v46 = &v71;
      objc_copyWeak(&v71, &location);
      dispatch_after(v45, MEMORY[0x1E4F14428], block);
      uint64_t v13 = v56;
LABEL_16:
      objc_destroyWeak(v46);
      objc_destroyWeak(&location);
      char v40 = *(unsigned char *)(a1 + 48);
      id v9 = v41;
      id v7 = v57;
    }
  }
  else
  {
    double v47 = [*(id *)(a1 + 32) systemUpdatesTimer];
    [v47 invalidate];

    [*(id *)(a1 + 32) setSystemUpdatesTimer:0];
    -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](*(void **)(a1 + 32));
    char v40 = *(unsigned char *)(a1 + 48);
    if (v40)
    {
      id v57 = v7;
      id v41 = v9;
      objc_initWeak(&location, v35);
      dispatch_time_t v48 = dispatch_time(0, 217800000);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4;
      v68[3] = &unk_1E6AA4C10;
      uint64_t v46 = &v69;
      objc_copyWeak(&v69, &location);
      dispatch_after(v48, MEMORY[0x1E4F14428], v68);
      double v39 = 0.0;
      goto LABEL_16;
    }
    double v39 = 0.0;
  }
  BOOL v49 = v14 == 1;
  BOOL v50 = v14 == 1;
  double v51 = (void *)MEMORY[0x1E4FB1EB0];
  if (v49) {
    uint64_t v52 = 0x20000;
  }
  else {
    uint64_t v52 = 0x10000;
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5;
  v62[3] = &unk_1E6AA4C38;
  BOOL v66 = v50;
  char v67 = v40;
  id v63 = v35;
  id v64 = v8;
  double v65 = v34;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6;
  v59[3] = &unk_1E6AA4C60;
  BOOL v61 = v50;
  v59[4] = *(void *)(a1 + 32);
  id v60 = v9;
  id v53 = v9;
  id v54 = v8;
  id v55 = v35;
  [v51 animateWithDuration:v52 delay:v62 options:v59 animations:0.66 completion:v39];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9;
  v58[3] = &unk_1E6AA37A0;
  void v58[4] = *(void *)(a1 + 32);
  [v7 addTimeout:v58 withHandler:2.0];
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [MEMORY[0x1E4F41A20] appearUpEffect];
  long long v2 = [v1 effectWithByLayer];
  long long v3 = [MEMORY[0x1E4F41A50] optionsWithNonRepeating];
  [WeakRetained addSymbolEffect:v2 options:v3 animated:1 completion:&__block_literal_global_153];
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [MEMORY[0x1E4F41A40] disappearDownEffect];
  long long v2 = [v1 effectWithByLayer];
  long long v3 = [MEMORY[0x1E4F41A50] optionsWithNonRepeating];
  [WeakRetained addSymbolEffect:v2 options:v3 animated:1];
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(unsigned char *)(a1 + 57))
    {
      long long v2 = *(void **)(a1 + 32);
      return [v2 setHideWithWipe:0];
    }
    id v5 = *(void **)(a1 + 40);
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *MEMORY[0x1E4F1DAB8];
    v12[1] = v6;
    v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v12];
    id v7 = *(void **)(a1 + 40);
    double v8 = 1.0;
    return [v7 setAlpha:v8];
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    CGAffineTransformMakeTranslation(&v11, *(CGFloat *)(a1 + 48), 0.0);
    id v9 = *(void **)(a1 + 40);
    CGAffineTransform v10 = v11;
    [v9 setTransform:&v10];
    id v7 = *(void **)(a1 + 40);
    double v8 = 0.0;
    return [v7 setAlpha:v8];
  }
  [*(id *)(a1 + 32) setHideWithWipe:0];
  id v4 = *(void **)(a1 + 32);
  return [v4 setAlpha:0.99];
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      long long v3 = *(void **)(a1 + 32);
      if (v3)
      {
        id v4 = +[STUIStatusBarSettingsDomain rootSettings];
        id v5 = [v4 visualProviderSettings];
        int v6 = [v5 showVPNDisconnect];

        if (v6)
        {
          id v7 = [v3 delayedSystemUpdateDataToken];

          if (!v7)
          {
            id v23 = [v3 statusBar];
            double v22 = [v23 dataAggregator];
            double v8 = [MEMORY[0x1E4F1CA80] set];
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id obj = [v3 orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
            uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:location count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v30;
              do
              {
                uint64_t v11 = 0;
                do
                {
                  if (*(void *)v30 != v10) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
                  uint64_t v13 = [v3 statusBar];
                  uint64_t v14 = [v12 identifier];
                  double v15 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v14];
                  double v16 = [v13 itemWithIdentifier:v15];

                  double v17 = [v16 dependentEntryKeys];
                  [v8 unionSet:v17];

                  ++v11;
                }
                while (v9 != v11);
                uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:location count:16];
              }
              while (v9);
            }

            double v18 = [v22 beginDelayingUpdatesForEntryKeys:v8];
            [v3 setDelayedSystemUpdateDataToken:v18];
          }
        }
      }
      objc_initWeak(location, *(id *)(a1 + 32));
      double v19 = (void *)MEMORY[0x1E4F1CB00];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7;
      v27[3] = &unk_1E6AA3A18;
      objc_copyWeak(&v28, location);
      double v20 = [v19 scheduledTimerWithTimeInterval:0 repeats:v27 block:2.0];
      [*(id *)(a1 + 32) setSystemUpdatesTimer:v20];

      -[STUIStatusBarVisualProvider_Split _collapseBattery](*(id **)(a1 + 32));
      objc_destroyWeak(&v28);
      objc_destroyWeak(location);
      uint64_t v2 = a1;
    }
    return (*(uint64_t (**)(void))(*(void *)(v2 + 40) + 16))();
  }
  else
  {
    -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](*(void **)(a1 + 32));
    (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_8;
    v26[3] = &unk_1E6AA37A0;
    void v26[4] = *(void *)(v2 + 32);
    return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v26];
  }
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](WeakRetained);
    uint64_t v2 = [v3 statusBar];
    [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

    -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](v3);
    id WeakRetained = v3;
  }
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) statusBar];
  [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

  id v3 = *(void **)(a1 + 32);
  -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](v3);
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9(uint64_t a1)
{
  -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](*(void **)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10;
  v3[3] = &unk_1E6AA37A0;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) statusBar];
  [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

  id v3 = *(void **)(a1 + 32);
  -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](v3);
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if ([a2 type] == 2) {
    [v4 setFloating:1];
  }

  return 1;
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  double v8 = a4;
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
    double v17 = (double)v14 * 0.2;
    double v18 = 0.0;
    if (*(unsigned char *)(a1 + 40)) {
      double v17 = 0.0;
    }
    double v19 = (void *)MEMORY[0x1E4FB1EB0];
    if (v10 == 1) {
      double v18 = 0.5;
    }
    double v20 = v18 + v17;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_13;
    v21[3] = &unk_1E6AA3F30;
    id v22 = v7;
    uint64_t v23 = v10;
    [v19 animateWithDuration:0 delay:v21 options:v8 animations:0.25 completion:v20];
  }
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v1 = *(void **)(a1 + 32);
  double v3 = 0.0;
  if (*(void *)(v2 + 8) == 1) {
    double v3 = 1.0;
  }
  return [v1 setAlpha:v3];
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 type] == 2)
  {
    [v5 setFloating:1];
    int v6 = [v5 region];
    id v7 = [v6 displayItems];
    uint64_t v8 = [v7 indexOfObject:v5];

    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v5 identifier];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  return 1;
}

void __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) orientation] - 1;
  double v3 = [*(id *)(a1 + 40) expandedPillPlacement];
  [v3 setEnabled:v2 > 1];

  id v4 = [*(id *)(a1 + 32) currentAggregatedData];
  id v5 = [v4 secondaryCellularEntry];

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
  [*(id *)(*(void *)(a1 + 40) + 176) constant];
  if (v14 != v16)
  {
    [*(id *)(*(void *)(a1 + 40) + 176) setConstant:v14];
    double v17 = (void *)MEMORY[0x1E4FB1EB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2;
    v18[3] = &unk_1E6AA37A0;
    id v19 = *(id *)(a1 + 32);
    [v17 animateWithDuration:v18 animations:0.25];
  }
}

uint64_t __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __49__STUIStatusBarVisualProvider_Split_setExpanded___block_invoke(uint64_t a1)
{
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [(id)objc_opt_class() showsLargeBatteryChargingAnimation];
  id v4 = [v2 identifier];

  if (v3) {
    +[STUIStatusBarBatteryItem iconDisplayIdentifier];
  }
  else {
  id v5 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];
  }
  BOOL v6 = v4 == v5;

  return v6;
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  int v3 = +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  int v3 = +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  int v3 = +[STUIStatusBarItem defaultDisplayIdentifier];
  BOOL v4 = v2 == v3;

  return v4;
}

void __74__STUIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBar];
  [v1 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

@end