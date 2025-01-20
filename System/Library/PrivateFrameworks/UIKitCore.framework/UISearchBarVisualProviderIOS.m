@interface UISearchBarVisualProviderIOS
@end

@implementation UISearchBarVisualProviderIOS

double __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hostedScopeBarHeightForBarMetrics:a2];
  double v5 = v4;

  return v5;
}

void __49___UISearchBarVisualProviderIOS_setUpSearchField__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) barStyle]) {
    [*(id *)(a1 + 32) colorForComponent:4 disabled:0];
  }
  else {
  id v2 = +[UIColor labelColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 160) setTextColor:v2];
}

void __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _searchBarTextField];
  [v2 _setEnabled:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
}

uint64_t __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 248) numberOfSegments])
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
      double v4 = [*(id *)(*(void *)(a1 + 32) + 248) infoViewForSegment:v2];
      [v4 setAlpha:v3];

      ++v2;
    }
    while (v2 < [*(id *)(*(void *)(a1 + 32) + 248) numberOfSegments]);
  }
  double v5 = *(void **)(a1 + 32);
  return [v5 updateMagnifyingGlassView];
}

uint64_t __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    result = *(void *)(result + 32);
    if (!*(void *)(result + 200)) {
      result = [(id)result setUpCancelButton];
    }
    if (!*(unsigned char *)(v1 + 49)) {
      result = [*(id *)(*(void *)(v1 + 32) + 200) setAlpha:1.0];
    }
  }
  if (*(unsigned char *)(v1 + 49))
  {
    unint64_t v2 = *(void **)(v1 + 40);
    return [v2 layoutBelowIfNeeded];
  }
  return result;
}

uint64_t __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

void __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) centerPlaceholder])
  {
    unint64_t v2 = *(unsigned char **)(a1 + 32);
    if ((v2[154] & 4) != 0) {
      [v2 allowCursorToAppear:1];
    }
    double v3 = [*(id *)(a1 + 40) textInputTraits];
    [v3 setDeferBecomingResponder:1];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    double v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    [v4 _setClipsToBounds:v5];
  }
}

void __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_2;
  v8[3] = &unk_1E52D9FC0;
  char v9 = *(unsigned char *)(a1 + 48);
  v8[4] = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_5;
  v4[3] = &unk_1E52DF270;
  char v7 = v9;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = v2;
  uint64_t v6 = v3;
  +[UIView animateKeyframesWithDuration:0 delay:v8 options:v4 animations:0.0 completion:0.0];
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_3;
    v12 = &unk_1E52D9F70;
    uint64_t v13 = *(void *)(a1 + 32);
    double v1 = 0.0;
    id v2 = &v9;
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    uint64_t v6 = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_4;
    char v7 = &unk_1E52D9F70;
    uint64_t v8 = *(void *)(a1 + 32);
    double v1 = 0.7;
    id v2 = &v4;
  }
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, v1, 0.3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:0.0];
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:1.0];
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_5(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) setNeedsLayout];
    id v2 = *(void **)(*(void *)(v1 + 40) + 64);
    return [v2 setNeedsLayout];
  }
  return result;
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) setHidden:0];
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  return [v3 setAlpha:v2];
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_7(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) frame];
    double x = v9.origin.x;
    double y = v9.origin.y;
    double width = v9.size.width;
    objc_msgSend(*(id *)(a1 + 40), "sizeThatFits:", CGRectGetWidth(v9), 0.0);
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", x, y, width, v5);
    [*(id *)(a1 + 32) layoutIfNeeded];
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

uint64_t __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(*(void *)(a1 + 32) + 64);
  return [v2 layoutIfNeeded];
}

void __63___UISearchBarVisualProviderIOS_revertViewHierarchyIfNecessary__block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  double v2 = [v1 superview];
  if (v2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = objc_msgSend(v1, "subviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 addSubview:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [v1 removeFromSuperview];
    [v2 setNeedsLayout];
  }
}

void __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sizeToFit];
  double v2 = [*(id *)(a1 + 40) rightView];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) rightView];
    [v3 frame];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
}

void __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) sizeToFit];
  double v2 = [*(id *)(a1 + 40) rightView];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) rightView];
    [v3 frame];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
}

void __66___UISearchBarVisualProviderIOS_dictationButtonPressed_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained text];
  uint64_t v2 = [v1 length];

  if (v2)
  {
    id v3 = [WeakRetained textualRange];
    [WeakRetained setSelectedTextRange:v3];
  }
}

uint64_t __68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateTransitionToSearchLayoutState:*(void *)(a1 + 40)];
}

void *__68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 96) &= ~2uLL;
  result = (void *)a1[5];
  if (result[47] != a1[6]) {
    return objc_msgSend(result, "completeTransitionToSearchLayoutState:");
  }
  return result;
}

double __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    double Width = CGRectGetWidth(*(CGRect *)&v9);
    v19.origin.double x = a2;
    v19.origin.double y = a3;
    v19.size.double width = a4;
    v19.size.height = a5;
    CGRect v17 = CGRectIntersection(*(CGRect *)(a1 + 32), v19);
    return Width - CGRectGetMinX(v17);
  }
  else
  {
    v20.origin.double x = a2;
    v20.origin.double y = a3;
    v20.size.double width = a4;
    v20.size.height = a5;
    CGRect v18 = CGRectIntersection(*(CGRect *)&v9, v20);
    return CGRectGetMaxX(v18);
  }
}

double __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    v19.origin.double x = a2;
    v19.origin.double y = a3;
    v19.size.double width = a4;
    v19.size.height = a5;
    CGRect v17 = CGRectIntersection(*(CGRect *)&v9, v19);
    return CGRectGetMaxX(v17);
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)&v9);
    v20.origin.double x = a2;
    v20.origin.double y = a3;
    v20.size.double width = a4;
    v20.size.height = a5;
    CGRect v18 = CGRectIntersection(*(CGRect *)(a1 + 32), v20);
    return Width - CGRectGetMinX(v18);
  }
}

double __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hostedScopeBarTopInsetForBarMetrics:a2];
  double v5 = v4;

  return v5;
}

@end