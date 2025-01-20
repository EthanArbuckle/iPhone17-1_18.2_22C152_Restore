@interface UICursorAccessoryView
@end

@implementation UICursorAccessoryView

void __51___UICursorAccessoryView__reloadAccessoryItemViews__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 592);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "objectForKey:", v7, (void)v10);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 584));
        [WeakRetained configureItemView:v8 forAccessoryIdentifier:v7];

        [v8 layoutIfNeeded];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 32) tintColor];
  [v4 grayscaleLuminance:v5];
  double v7 = v6;

  double v8 = 1.0;
  if (v7 > 0.75) {
    double v8 = 0.0;
  }
  id v9 = +[UIColor colorWithWhite:v8 alpha:0.2];
  [v3 setBackgroundColor:v9];
}

uint64_t __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _scheduleRemovedItemViewCleanup];
  }
  return result;
}

void __60___UICursorAccessoryView__layoutDisplayedAccessoryItemViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v26 = [*(id *)(*(void *)(a1 + 32) + 552) objectForKey:a2];
  uint64_t v5 = [*(id *)(a1 + 32) _displayedItemViewAtIndex:a3 - 1];
  double v6 = [*(id *)(a1 + 32) _displayedItemViewAtIndex:a3 + 1];
  double v7 = v26;
  if (a3)
  {
    double v8 = [*(id *)(*(void *)(a1 + 32) + 560) objectAtIndex:a3 - 1];
    if ([v26 isActive]
      && ([v26 collapsed] & 1) == 0
      && [v5 isActive]
      && ([v5 collapsed] & 1) == 0)
    {
      [v8 setHidden:0];
      if (*(unsigned char *)(a1 + 80)) {
        double v25 = *(double *)(a1 + 64) - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + -1.0;
      }
      else {
        double v25 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      objc_msgSend(v8, "setFrame:", v25, 0.0, 1.0, *(double *)(a1 + 72));
    }
    else
    {
      [v8 setHidden:1];
    }

    double v7 = v26;
  }
  if ([v7 isActive])
  {
    if ([v5 isActive]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
    if ([v6 isActive]) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v9 | 8;
    }
    [v26 setRoundedEdges:v10];
  }
  long long v11 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 6)
  {
    double v13 = *(double *)(a1 + 72);
    int v14 = [v26 collapsed];
    double v15 = 1.0;
    if (v14)
    {
      double v15 = 0.0;
      double v16 = 0.0;
    }
    else
    {
      double v16 = 72.0;
    }
  }
  else
  {
    objc_msgSend(v26, "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    double v18 = v17;
    double v13 = *(double *)(a1 + 72);
    [v26 horizontalPadding];
    double v20 = v19;
    int v21 = [v26 collapsed];
    double v15 = 1.0;
    if (v21)
    {
      double v15 = 0.0;
      double v16 = 0.0;
    }
    else
    {
      double v16 = v18 + v20 + v20;
    }
  }
  [v26 setAlpha:v15];
  if (*(unsigned char *)(a1 + 80)) {
    double v22 = *(double *)(a1 + 64) - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - v16;
  }
  else {
    double v22 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v23 = round(*(double *)(a1 + 56) + (*(double *)(a1 + 72) - v13) * 0.5);
  [*(id *)(a1 + 32) contentScaleFactor];
  objc_msgSend(v26, "setFrame:", UIRectIntegralWithScale(v22, v23, v16, v13, v24));
  [v26 layoutIfNeeded];
  v28.origin.x = v22;
  v28.origin.y = v23;
  v28.size.width = v16;
  v28.size.height = v13;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetWidth(v28)
                                                               + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 24);
}

void __69___UICursorAccessoryView__didRecognizeAccessoryTapGestureRecognizer___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "convertPoint:fromView:", WeakRetained, *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (objc_msgSend(v7, "pointInside:withEvent:", 0))
  {
    [*(id *)(a1 + 32) didTapToActivateAccessoryWithIdentifier:v11];
    uint64_t v9 = [WeakRetained traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10 == 6) {
      [v7 setSelected:*(unsigned __int8 *)(*(void *)(a1 + 40) + 576)];
    }
    *a4 = 1;
  }
}

void __38___UICursorAccessoryView_baseFontSize__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UICTContentSizeCategoryXL";
  v2[1] = @"UICTContentSizeCategoryXXL";
  v3[0] = &unk_1ED3F6720;
  v3[1] = &unk_1ED3F6738;
  v2[2] = @"UICTContentSizeCategoryXXXL";
  v2[3] = @"UICTContentSizeCategoryAccessibilityM";
  v3[2] = &unk_1ED3F6750;
  v3[3] = &unk_1ED3F2468;
  v2[4] = @"UICTContentSizeCategoryAccessibilityL";
  v2[5] = @"UICTContentSizeCategoryAccessibilityXL";
  v3[4] = &unk_1ED3F2468;
  v3[5] = &unk_1ED3F2468;
  v2[6] = @"UICTContentSizeCategoryAccessibilityXXL";
  v2[7] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v3[6] = &unk_1ED3F2468;
  v3[7] = &unk_1ED3F2468;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)_MergedGlobals_7_5;
  _MergedGlobals_7_5 = v0;
}

void __41___UICursorAccessoryView_defaultItemSize__block_invoke()
{
  v7[8] = *MEMORY[0x1E4F143B8];
  v6[0] = @"UICTContentSizeCategoryXL";
  v6[1] = @"UICTContentSizeCategoryXXL";
  v7[0] = &unk_1ED3F2478;
  v7[1] = &unk_1ED3F2488;
  v6[2] = @"UICTContentSizeCategoryXXXL";
  v6[3] = @"UICTContentSizeCategoryAccessibilityM";
  v7[2] = &unk_1ED3F2498;
  v7[3] = &unk_1ED3F24A8;
  v6[4] = @"UICTContentSizeCategoryAccessibilityL";
  v6[5] = @"UICTContentSizeCategoryAccessibilityXL";
  v7[4] = &unk_1ED3F24B8;
  v7[5] = &unk_1ED3F24B8;
  v6[6] = @"UICTContentSizeCategoryAccessibilityXXL";
  v6[7] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v7[6] = &unk_1ED3F24B8;
  v7[7] = &unk_1ED3F24B8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:8];
  v1 = (void *)qword_1EB25D550;
  qword_1EB25D550 = v0;

  v4[0] = @"UICTContentSizeCategoryXL";
  v4[1] = @"UICTContentSizeCategoryXXL";
  v5[0] = &unk_1ED3F2478;
  v5[1] = &unk_1ED3F2488;
  v4[2] = @"UICTContentSizeCategoryXXXL";
  v4[3] = @"UICTContentSizeCategoryAccessibilityM";
  v5[2] = &unk_1ED3F2498;
  v5[3] = &unk_1ED3F24C8;
  v4[4] = @"UICTContentSizeCategoryAccessibilityL";
  v4[5] = @"UICTContentSizeCategoryAccessibilityXL";
  v5[4] = &unk_1ED3F24C8;
  v5[5] = &unk_1ED3F24C8;
  v4[6] = @"UICTContentSizeCategoryAccessibilityXXL";
  v4[7] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v5[6] = &unk_1ED3F24C8;
  v5[7] = &unk_1ED3F24C8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:8];
  id v3 = (void *)qword_1EB25D558;
  qword_1EB25D558 = v2;
}

void __39___UICursorAccessoryView_largeItemSize__block_invoke()
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v6[0] = @"UICTContentSizeCategoryXXXL";
  v6[1] = @"UICTContentSizeCategoryAccessibilityM";
  v7[0] = &unk_1ED3F6738;
  v7[1] = &unk_1ED3F24D8;
  v6[2] = @"UICTContentSizeCategoryAccessibilityL";
  v6[3] = @"UICTContentSizeCategoryAccessibilityXL";
  v7[2] = &unk_1ED3F24D8;
  v7[3] = &unk_1ED3F24D8;
  v6[4] = @"UICTContentSizeCategoryAccessibilityXXL";
  v6[5] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v7[4] = &unk_1ED3F24D8;
  v7[5] = &unk_1ED3F24D8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];
  v1 = (void *)qword_1EB25D568;
  qword_1EB25D568 = v0;

  v4[0] = @"UICTContentSizeCategoryXXXL";
  v4[1] = @"UICTContentSizeCategoryAccessibilityM";
  v5[0] = &unk_1ED3F6738;
  v5[1] = &unk_1ED3F24A8;
  v4[2] = @"UICTContentSizeCategoryAccessibilityL";
  v4[3] = @"UICTContentSizeCategoryAccessibilityXL";
  v5[2] = &unk_1ED3F24A8;
  v5[3] = &unk_1ED3F24A8;
  v4[4] = @"UICTContentSizeCategoryAccessibilityXXL";
  v4[5] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v5[4] = &unk_1ED3F24A8;
  v5[5] = &unk_1ED3F24A8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  id v3 = (void *)qword_1EB25D570;
  qword_1EB25D570 = v2;
}

@end