@interface UINavigationBarVisualProviderLegacyIOS
@end

@implementation UINavigationBarVisualProviderLegacyIOS

double __72___UINavigationBarVisualProviderLegacyIOS__preferredContentSizeForItem___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

void __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(void *)(a1 + 56) > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (_barItemHidden(v7))
    {
      [v7 removeFromSuperview];
    }
    else
    {
      [a2 CGRectValue];
      objc_msgSend(v7, "setFrame:");
      v6 = [v7 superview];

      if (!v6)
      {
        [v7 setAlpha:1.0];
        [*(id *)(*(void *)(a1 + 40) + 136) addSubview:v7];
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

void __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(void *)(a1 + 56) > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (_barItemHidden(v7))
    {
      [v7 removeFromSuperview];
    }
    else
    {
      [a2 CGRectValue];
      objc_msgSend(v7, "setFrame:");
      v6 = [v7 superview];

      if (!v6)
      {
        [v7 setAlpha:1.0];
        [*(id *)(*(void *)(a1 + 40) + 136) addSubview:v7];
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

uint64_t __73___UINavigationBarVisualProviderLegacyIOS_setBackButtonVisible_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  if (*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  v4 = *(void **)(*(void *)(a1 + 40) + 88);
  return [v4 setAlpha:v3];
}

void __71___UINavigationBarVisualProviderLegacyIOS__effectiveBackIndicatorImage__block_invoke()
{
  id v2 = +[UIImage kitImageNamed:@"UINavigationBarBackIndicatorDefault"];
  uint64_t v0 = [v2 imageFlippedForRightToLeftLayoutDirection];
  v1 = (void *)_MergedGlobals_29_0;
  _MergedGlobals_29_0 = v0;
}

void __85___UINavigationBarVisualProviderLegacyIOS__effectiveBackIndicatorTransitionMaskImage__block_invoke()
{
  id v2 = +[UIImage kitImageNamed:@"UINavigationBarTitleTransitionBackIndicatorMask"];
  uint64_t v0 = [v2 imageFlippedForRightToLeftLayoutDirection];
  v1 = (void *)qword_1EB25C380;
  qword_1EB25C380 = v0;
}

void __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 CGPointValue];
  objc_msgSend(v5, "setCenter:");
}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 104)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) setAlpha:0.0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  if (([*(id *)(a1 + 48) shouldCrossfade] & 1) == 0)
  {
    v9 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3;
    v28[3] = &unk_1E52DA8E8;
    id v29 = *(id *)(a1 + 56);
    [v9 enumerateObjectsUsingBlock:v28];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * j) setAlpha:1.0];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v12);
  }

  if (([*(id *)(a1 + 48) shouldCrossfade] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4;
    v22[3] = &unk_1E52DA8E8;
    v15 = *(void **)(a1 + 64);
    id v23 = *(id *)(a1 + 72);
    [v15 enumerateObjectsUsingBlock:v22];
  }
  if (*(unsigned char *)(a1 + 105))
  {
    v16 = *(void **)(a1 + 80);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v21.c = v17;
    *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v16 setTransform:&v21];
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeScale(&v21, *(CGFloat *)(a1 + 96), 1.0);
    v18 = *(void **)(a1 + 88);
    CGAffineTransform v20 = v21;
    [v18 setTransform:&v20];
  }
  return [*(id *)(a1 + 32) _updateBackground];
}

void __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 CGPointValue];
  objc_msgSend(v5, "setCenter:");
}

void __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 CGPointValue];
  objc_msgSend(v5, "setCenter:");
}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _completeNavigationTransitionWithIncomingViews:*(void *)(a1 + 40) outgoingViews:*(void *)(a1 + 48) transitionAssistant:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  id v2 = *(void **)(a1 + 64);
  return [v2 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 CGPointValue];
  objc_msgSend(v5, "setCenter:");
}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 104)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) setAlpha:0.0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  if (([*(id *)(a1 + 48) shouldCrossfade] & 1) == 0)
  {
    v9 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3;
    v28[3] = &unk_1E52DA8E8;
    id v29 = *(id *)(a1 + 56);
    [v9 enumerateObjectsUsingBlock:v28];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * j) setAlpha:1.0];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v12);
  }

  if (([*(id *)(a1 + 48) shouldCrossfade] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4;
    v22[3] = &unk_1E52DA8E8;
    v15 = *(void **)(a1 + 64);
    id v23 = *(id *)(a1 + 72);
    [v15 enumerateObjectsUsingBlock:v22];
  }
  if (*(unsigned char *)(a1 + 105))
  {
    v16 = *(void **)(a1 + 80);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v21[0] = *MEMORY[0x1E4F1DAB8];
    v21[1] = v17;
    v21[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v16 setTransform:v21];
    v18 = *(void **)(a1 + 88);
    CGAffineTransformMakeScale(&v20, 1.0 / *(double *)(a1 + 96), 1.0);
    [v18 setTransform:&v20];
  }
  return [*(id *)(a1 + 32) _updateBackground];
}

void __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 CGPointValue];
  objc_msgSend(v5, "setCenter:");
}

void __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 CGPointValue];
  objc_msgSend(v5, "setCenter:");
}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _setFadingInFromCustomAlpha:0];
  [*(id *)(a1 + 40) _completeNavigationTransitionWithIncomingViews:*(void *)(a1 + 48) outgoingViews:*(void *)(a1 + 56) transitionAssistant:*(void *)(a1 + 64) completion:*(void *)(a1 + 80)];
  id v2 = *(void **)(a1 + 72);
  return [v2 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __135___UINavigationBarVisualProviderLegacyIOS__completeNavigationTransitionWithIncomingViews_outgoingViews_transitionAssistant_completion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) topItem];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) topItem];
  double v3 = [v2 _pendingTitle];
  [v4 _setTitle:v3 animated:1 matchBarButtonItemAnimationDuration:1];
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  if (*(unsigned char *)(a1 + 56) && *(void *)(a1 + 32)) {
    ++a3;
  }
  uint64_t v7 = [*(id *)(a1 + 40) objectAtIndex:a3];
  [v7 CGRectValue];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (CGRectIsEmpty(v21))
  {
    [v19 frame];
    if (!CGRectIsEmpty(v22))
    {
      v16 = *(void **)(a1 + 40);
      long long v17 = (void *)MEMORY[0x1E4F29238];
      [v19 frame];
      v18 = objc_msgSend(v17, "valueWithCGRect:");
      [v16 replaceObjectAtIndex:a3 withObject:v18];
    }
  }
  if (a3 == *(void *)(a1 + 48) - 1) {
    *a4 = 1;
  }
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndex:a3];
  [v7 CGRectValue];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (CGRectIsEmpty(v21))
  {
    [v19 frame];
    if (!CGRectIsEmpty(v22))
    {
      v16 = *(void **)(a1 + 32);
      long long v17 = (void *)MEMORY[0x1E4F29238];
      [v19 frame];
      v18 = objc_msgSend(v17, "valueWithCGRect:");
      [v16 replaceObjectAtIndex:a3 withObject:v18];
    }
  }
  if (*(void *)(a1 + 40) - 1 == a3) {
    *a4 = 1;
  }
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = a2;
  [v4 setAlpha:v3];
  [*(id *)(a1 + 32) addObject:v4];
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = a2;
  [v4 setAlpha:v3];
  [*(id *)(a1 + 32) addObject:v4];
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _titleView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_6(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) setAlpha:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setAlpha:", 1.0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_7(void *a1)
{
  v1 = (id *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[9];
  id v7 = [v1[2] transitionAssistant];
  [v1 _completeTopItemTransitionWithIncomingViews:v2 outgoingViews:v3 previousLeftViews:v4 previousRightViews:v5 enableUserInteraction:v6 transitionAssistant:v7];
}

uint64_t __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidateIntrinsicContentSize];
  [*(id *)(*(void *)(a1 + 32) + 8) intrinsicContentSize];
  double v11 = v10;
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) window];
  if (v12)
  {
    long long v13 = (void *)v12;
    int v14 = [*(id *)(*(void *)(a1 + 32) + 8) _delegateWantsNavigationBarHidden];

    if (v14)
    {
      v24.origin.x = v3;
      v24.origin.y = v5;
      v24.size.width = v7;
      v24.size.height = v9;
      double MaxY = CGRectGetMaxY(v24);
      v25.origin.x = v3;
      v25.origin.y = v5;
      v25.size.width = v7;
      v25.size.height = v11;
      double v5 = v5 + MaxY - CGRectGetMaxY(v25);
    }
  }
  uint64_t v16 = *(void *)(a1 + 32);
  long long v17 = *(void **)(v16 + 8);
  if ((~v17[12] & 0x420000000000000) == 0)
  {
    [v17 layoutIfNeeded];
    uint64_t v16 = *(void *)(a1 + 32);
  }
  if (v9 != v11)
  {
    long long v18 = *(void **)(v16 + 8);
    if ((~v18[12] & 0x420000000000000) != 0)
    {
      objc_msgSend(v18, "setFrame:", v3, v5, v7, v11);
      long long v18 = *(void **)(*(void *)(a1 + 32) + 8);
    }
    [v18 _sendResizeForPromptChange];
    uint64_t v16 = *(void *)(a1 + 32);
  }
  uint64_t v19 = [*(id *)(v16 + 8) window];
  if (!v19 || (CGAffineTransform v20 = (void *)v19, (*(void *)(v19 + 96) & 0x400000000000000) == 0)) {
    CGAffineTransform v20 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  id v22 = (id)v19;
  id v21 = v20;
  [v21 layoutIfNeeded];
  [*(id *)(a1 + 40) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 96) setAlpha:1.0];
}

uint64_t __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

@end