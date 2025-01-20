@interface UIBarCustomizer
@end

@implementation UIBarCustomizer

void __37___UIBarCustomizer_beginWithSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isActive])
  {
    [WeakRetained _reflow];
    v1 = [WeakRetained reservoir];
    [v1 invalidateLayoutAndForceUpdate:1];
  }
}

void __37___UIBarCustomizer_beginWithSession___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setWasReset:1];
  [WeakRetained _setActive:0];
  [WeakRetained setWasReset:0];
}

void __37___UIBarCustomizer_beginWithSession___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setActive:0];
}

void __37___UIBarCustomizer_beginWithSession___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _reflow];
  id v2 = [*(id *)(a1 + 32) containerView];
  [v2 layoutIfNeeded];
}

void __31___UIBarCustomizer__setActive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a2, "_mutableVisibleItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) _chiclet];
        v9 = [v8 anchorView];
        [v9 removeFromSuperview];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained isActive] & 1) == 0)
  {
    v11 = [WeakRetained containerView];
    [v11 removeFromSuperview];
  }
}

uint64_t __31___UIBarCustomizer__setActive___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  v3 = [*(id *)(a1 + 32) dimmingView];
  [v3 setAlpha:v2];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [*(id *)(a1 + 40) _mutableVisibleItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (!*(unsigned char *)(a1 + 56))
        {
          v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) _chiclet];
          [v10 updateItemCenterPoints];
        }
        v11 = [v9 _chiclet];
        long long v12 = [v11 anchorView];

        uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
        long long v14 = [v12 chiclet];
        [v14 setPlatterVisible:v13];

        [v12 setNeedsLayout];
        [v12 layoutIfNeeded];
        [v12 setJiggling:*(unsigned __int8 *)(a1 + 56)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v15 = objc_msgSend(*(id *)(a1 + 32), "ellipsisDotViews", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * j) setAlpha:0.0];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  [*(id *)(a1 + 32) _reflow];
  return [*(id *)(a1 + 48) performAllAnimations];
}

uint64_t __31___UIBarCustomizer__setActive___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAllCompletionsWithSession:*(void *)(a1 + 40)];
}

void __27___UIBarCustomizer__reflow__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 40) delegate];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 _activeSession];
  [v2 barCustomizer:v3 customizationAreaBoundsForSession:v4];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  [*(id *)(a1 + 32) frame];
  double MidX = CGRectGetMidX(v9);
  [*(id *)(a1 + 32) frame];
  CGFloat v6 = CGRectGetMaxY(v10) + -15.0;
  id v7 = [*(id *)(a1 + 40) reservoir];
  objc_msgSend(v7, "setCenter:", MidX, v6);
}

void __27___UIBarCustomizer__reflow__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 _chiclet];
  id v7 = [v5 anchorView];

  if (!*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 32) _dropIndex] == a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 24)
                                                                + 40.0;
  [v7 setContentPadding:16.0];
  [v7 bounds];
  double Width = CGRectGetWidth(v9);
  objc_msgSend(v7, "setCenter:", Width * 0.5 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(double *)(a1 + 48));
  if (*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 32) _dropIndex] == a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 24)
                                                                + 40.0;
  if ([v7 state] != 1) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = Width
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
}

void __27___UIBarCustomizer__reflow__block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) chiclet];
  [v2 setMinimized:0];

  id v3 = [*(id *)(a1 + 32) chiclet];
  [v3 layoutIfNeeded];
}

uint64_t __27___UIBarCustomizer__reflow__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) center];
  double v3 = v2 + *(double *)(a1 + 40);
  [*(id *)(a1 + 32) center];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setCenter:v3];
}

void __27___UIBarCustomizer__reflow__block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) chiclet];
  [v2 setMinimized:1];

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) chiclet];
  [v3 layoutIfNeeded];
}

uint64_t __27___UIBarCustomizer__reflow__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [*(id *)(a1 + 32) _setCornerRadius:*(double *)(a1 + 40) * 0.5];
  double v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __56___UIBarCustomizer__reflowAnimatedWithAlongsideActions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reflow];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __53___UIBarCustomizer_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _chiclet];
  id v3 = [v2 representedItem];
  [v3 setCollapsed:0];

  uint64_t v4 = [*(id *)(a1 + 32) _chiclet];
  [v4 sizeToFit];

  id v5 = [*(id *)(a1 + 32) _chiclet];
  [v5 layoutIfNeeded];
}

uint64_t __53___UIBarCustomizer_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDebugUI];
}

uint64_t __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) jiggling];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 40) presentationValue];
    if (v3 < 10.0)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      return [v4 setJiggling:1];
    }
  }
  return result;
}

uint64_t __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCollapsed:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) setChicletSize:*(unsigned char *)(a1 + 48) == 0];
  [*(id *)(a1 + 40) setLabelVisible:*(unsigned char *)(a1 + 48) == 0];
  [*(id *)(a1 + 40) sizeToFit];
  double v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

void __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reflow];
  if (!*(unsigned char *)(a1 + 48))
  {
    double v2 = [WeakRetained reservoir];
    [v2 sizeToFit];

    double v3 = [WeakRetained reservoir];
    [v3 layoutIfNeeded];

    [*(id *)(a1 + 32) setValue:0.0];
  }
}

void __34___UIBarCustomizer__updateDebugUI__block_invoke(uint64_t a1)
{
  id v2 = +[UIColor blueColor];
  uint64_t v3 = [v2 CGColor];
  uint64_t v4 = [*(id *)(a1 + 32) containerView];
  id v5 = [v4 layer];
  [v5 setBorderColor:v3];

  CGFloat v6 = [*(id *)(a1 + 32) containerView];
  id v7 = [v6 layer];
  [v7 setBorderWidth:2.0];

  id v8 = +[UIColor systemGreenColor];
  uint64_t v9 = [v8 CGColor];
  CGRect v10 = [*(id *)(a1 + 32) visibleItemScrollView];
  v11 = [v10 layer];
  [v11 setBorderColor:v9];

  id v13 = [*(id *)(a1 + 32) visibleItemScrollView];
  long long v12 = [v13 layer];
  [v12 setBorderWidth:3.0];
}

void __34___UIBarCustomizer__updateDebugUI__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) _dropIndex];
  if (v2 >= [*(id *)(a1 + 40) count])
  {
    id v13 = [*(id *)(a1 + 40) lastObject];
    long long v14 = [v13 _chiclet];
    id v21 = [v14 anchorView];

    if ([v21 state] == 1)
    {
      [v21 frame];
      double MinX = CGRectGetMinX(v23);
      goto LABEL_6;
    }
    uint64_t v17 = [*(id *)(a1 + 32) containerView];
    uint64_t v18 = [v17 traitCollection];
    uint64_t v19 = [v18 layoutDirection];

    [v21 frame];
    if (!v19)
    {
LABEL_3:
      double MinX = CGRectGetMaxX(*(CGRect *)&v8);
LABEL_6:
      double v15 = *(double *)(a1 + 48);
      double v16 = 0.5;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "_dropIndex"));
    uint64_t v4 = [v3 _chiclet];
    id v21 = [v4 anchorView];

    id v5 = [*(id *)(a1 + 32) containerView];
    CGFloat v6 = [v5 traitCollection];
    uint64_t v7 = [v6 layoutDirection];

    [v21 frame];
    if (v7) {
      goto LABEL_3;
    }
  }
  double MinX = CGRectGetMinX(*(CGRect *)&v8);
  double v15 = *(double *)(a1 + 48);
  double v16 = -0.5;
LABEL_9:
  double v20 = MinX + v15 * v16;
  [v21 frame];
  objc_msgSend((id)qword_1EB260790, "setCenter:", v20, CGRectGetMidY(v24));
}

@end