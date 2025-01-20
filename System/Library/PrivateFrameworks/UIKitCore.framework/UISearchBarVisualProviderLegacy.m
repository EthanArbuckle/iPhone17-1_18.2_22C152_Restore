@interface UISearchBarVisualProviderLegacy
@end

@implementation UISearchBarVisualProviderLegacy

uint64_t __56___UISearchBarVisualProviderLegacy_setEnabled_animated___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 200) numberOfSegments])
  {
    unint64_t v2 = 0;
    do
    {
      if (*(unsigned char *)(a1 + 40)) {
        double v3 = 1.0;
      }
      else {
        double v3 = 0.4;
      }
      v4 = [*(id *)(*(void *)(a1 + 32) + 200) infoViewForSegment:v2];
      [v4 setAlpha:v3];

      ++v2;
    }
    while (v2 < [*(id *)(*(void *)(a1 + 32) + 200) numberOfSegments]);
  }
  v5 = *(void **)(a1 + 32);
  return [v5 updateMagnifyingGlassView];
}

uint64_t __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    result = *(void *)(result + 32);
    if (!*(void *)(result + 152)) {
      result = [(id)result setUpCancelButton];
    }
    if (!*(unsigned char *)(v1 + 49)) {
      result = [*(id *)(*(void *)(v1 + 32) + 152) setAlpha:1.0];
    }
  }
  if (*(unsigned char *)(v1 + 49))
  {
    unint64_t v2 = *(void **)(v1 + 40);
    return [v2 layoutBelowIfNeeded];
  }
  return result;
}

uint64_t __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

void __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) centerPlaceholder])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));

    if (!WeakRetained)
    {
      double v3 = *(unsigned char **)(a1 + 32);
      if ((v3[106] & 4) != 0) {
        [v3 allowCursorToAppear:1];
      }
      id v4 = [*(id *)(a1 + 40) textInputTraits];
      [v4 setDeferBecomingResponder:1];
    }
  }
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_2;
    v12 = &unk_1E52D9F70;
    uint64_t v13 = *(void *)(a1 + 32);
    double v1 = 0.7;
    unint64_t v2 = &v9;
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    v6 = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_3;
    v7 = &unk_1E52D9F70;
    uint64_t v8 = *(void *)(a1 + 32);
    double v1 = 0.0;
    unint64_t v2 = &v4;
  }
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, v1, 0.3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:1.0];
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:0.0];
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 104) &= ~0x40000000u;
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 104);
  *(_DWORD *)(v1 + 104) = v2 & 0x7FFFFFFF;
  if (v2 < 0) {
    return [*(id *)(result + 32) updateScopeBarFrame];
  }
  return result;
}

void __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sizeToFit];
  int v2 = [*(id *)(a1 + 40) rightView];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) rightView];
    [v3 frame];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
}

void __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) sizeToFit];
  int v2 = [*(id *)(a1 + 40) rightView];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) rightView];
    [v3 frame];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
}

uint64_t __55___UISearchBarVisualProviderLegacy_updateScopeBarFrame__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  int v2 = *(void **)(*(void *)(a1 + 32) + 200);
  return [v2 layoutIfNeeded];
}

uint64_t __49___UISearchBarVisualProviderLegacy_setUpScopeBar__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) setAlpha:0.0];
  int v2 = *(void **)(*(void *)(a1 + 32) + 200);
  return [v2 layoutBelowIfNeeded];
}

void __52___UISearchBarVisualProviderLegacy_setUpSearchField__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) barStyle]) {
    [*(id *)(a1 + 32) colorForComponent:4 disabled:0];
  }
  else {
  id v2 = +[UIColor labelColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 112) setTextColor:v2];
}

double __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    double Width = CGRectGetWidth(*(CGRect *)&v9);
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    CGRect v17 = CGRectIntersection(*(CGRect *)(a1 + 32), v19);
    return Width - CGRectGetMinX(v17);
  }
  else
  {
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    CGRect v18 = CGRectIntersection(*(CGRect *)&v9, v20);
    return CGRectGetMaxX(v18);
  }
}

double __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    CGRect v17 = CGRectIntersection(*(CGRect *)&v9, v19);
    return CGRectGetMaxX(v17);
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)&v9);
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    CGRect v18 = CGRectIntersection(*(CGRect *)(a1 + 32), v20);
    return Width - CGRectGetMinX(v18);
  }
}

uint64_t __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

double __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_2(uint64_t a1, double a2, double a3)
{
  double v3 = fmax((*(double *)(a1 + 32) - a2) / (a3 - a2), 0.0);
  if (v3 >= 1.0) {
    return 0.0;
  }
  else {
    return 1.0 - v3;
  }
}

uint64_t __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_3(uint64_t a1)
{
  double v2 = CGRectGetMaxX(*(CGRect *)(a1 + 48)) + 13.0;
  UIRoundToViewScale(*(void **)(a1 + 40));
  double v4 = v3 + 1.0;
  [*(id *)(a1 + 32) landscapeScopeBarWidth];
  v6 = *(void **)(*(void *)(a1 + 32) + 208);
  double v7 = *(double *)(a1 + 112);
  return objc_msgSend(v6, "setFrame:", v2, v4, v5, v7);
}

uint64_t __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 152) layoutIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 1.0;
  if ((*(_DWORD *)(v2 + 104) & 0x40000) == 0) {
    double v3 = 0.0;
  }
  double v4 = *(void **)(v2 + 152);
  return [v4 setAlpha:v3];
}

void __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 128) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 128) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 128) transitionToPrivateStyle:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 240) && (*(_DWORD *)(v2 + 104) & 0x38) == 0x10)
  {
    id v3 = [*(id *)(a1 + 40) _searchBarTextField];
    [v3 _setBottomEffectBackgroundVisible:1];
  }
}

uint64_t __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) setAlpha:1.0];
}

uint64_t __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) setAlpha:0.0];
}

uint64_t __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 128) transitionToPrivateStyle:-2];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  return [v2 setHidden:1];
}

@end