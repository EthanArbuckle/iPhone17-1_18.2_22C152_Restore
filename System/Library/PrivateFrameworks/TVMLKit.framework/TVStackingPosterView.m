@interface TVStackingPosterView
@end

@implementation TVStackingPosterView

void __58___TVStackingPosterView_setComponents_mainImageComponent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  v5 = [v12 attributedText];
  v6 = (void *)[v5 copy];

  if (a3)
  {
    v7 = [v12 highlightedTextColor];

    if (v7)
    {
      v8 = (void *)[v6 mutableCopy];
      uint64_t v9 = *MEMORY[0x263F1C240];
      v10 = [v12 highlightedTextColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v8, "length"));

      uint64_t v11 = [v8 copy];
      v6 = (void *)v11;
    }
  }
  [*(id *)(a1 + 32) addObject:v6];
}

void __54___TVStackingPosterView_setNeedsUpdateComponentLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  v5 = [v12 attributedText];
  v6 = (void *)[v5 copy];

  if (a3)
  {
    v7 = [v12 highlightedTextColor];

    if (v7)
    {
      v8 = (void *)[v6 mutableCopy];
      uint64_t v9 = *MEMORY[0x263F1C240];
      v10 = [v12 highlightedTextColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v8, "length"));

      uint64_t v11 = [v8 copy];
      v6 = (void *)v11;
    }
  }
  [*(id *)(a1 + 32) addObject:v6];
}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "filteredComponents", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (v7 != *(void **)(*(void *)(a1 + 32) + 528)) {
          [v7 setHighlighted:*(unsigned __int8 *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 49) withAnimationCoordinator:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_2(uint64_t result)
{
  v1 = *(void **)(result + 32);
  if (!v1) {
    return result;
  }
  uint64_t v2 = result;
  [*(id *)(result + 32) size];
  objc_msgSend(v1, "selectionMarginsForSize:");
  double v4 = v3;
  double v41 = v6;
  double v42 = v5;
  double v8 = v7;
  long long v9 = [*(id *)(v2 + 40) layer];
  int v10 = [v9 hasBeenCommitted];

  [*(id *)(v2 + 40) bounds];
  double v12 = v11;
  double v14 = v13;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  v15 = *(void **)(v2 + 40);
  if (v15)
  {
    [v15 cellMetrics];
    double v17 = *((double *)&v47 + 1);
    double v16 = *(double *)&v47;
    double v18 = *((double *)&v48 + 1);
    double v19 = *(double *)&v48;
    v15 = *(void **)(v2 + 40);
  }
  else
  {
    double v19 = 0.0;
    double v16 = 0.0;
    double v18 = 0.0;
    double v17 = 0.0;
  }
  v20 = [v15 overlayView];
  if (*(unsigned char *)(v2 + 48))
  {
    CGFloat v21 = fmin((v41 + v42 + v12 - (v17 + v18)) / (v12 - (v17 + v18)), (v8 + v4 + v14 - (v16 + v19)) / (v14 - (v16 + v19)));
    CGAffineTransformMakeScale(&v45, v21, v21);
  }
  else
  {
    long long v22 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v45.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v45.c = v22;
    *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  [v20 setTransform:&v45];

  if (*(unsigned char *)(v2 + 48)) {
    double v23 = v4;
  }
  else {
    double v23 = -0.0;
  }
  [*(id *)(*(void *)(v2 + 40) + 416) setConstant:*(double *)(*(void *)(v2 + 40) + 448) + v23];
  if (*(unsigned char *)(v2 + 48)) {
    double v24 = v8;
  }
  else {
    double v24 = -0.0;
  }
  [*(id *)(*(void *)(v2 + 40) + 424) setConstant:*(double *)(*(void *)(v2 + 40) + 456) + v24];
  v25 = [*(id *)(v2 + 32) valueForTVViewStyle:@"tv-focus-align"];
  int v26 = [v25 isEqualToString:@"bottom"];

  if (v26)
  {
    if (*(unsigned char *)(v2 + 48)) {
      double v27 = v8;
    }
    else {
      double v27 = 0.0;
    }
    [*(id *)(*(void *)(v2 + 40) + 432) setConstant:*(double *)(*(void *)(v2 + 40) + 464) - v27];
    uint64_t v28 = *(void *)(v2 + 40);
    v29 = *(void **)(v28 + 440);
    if (*(unsigned char *)(v2 + 48)) {
      double v30 = v8;
    }
    else {
      double v30 = 0.0;
    }
    double v31 = *(double *)(v28 + 472) - v30;
LABEL_30:
    [v29 setConstant:v31];
    goto LABEL_31;
  }
  v32 = [*(id *)(v2 + 32) valueForTVViewStyle:@"tv-focus-align"];
  int v33 = [v32 isEqualToString:@"top"];

  if (v33)
  {
    if (*(unsigned char *)(v2 + 48)) {
      double v34 = v8;
    }
    else {
      double v34 = -0.0;
    }
    [*(id *)(*(void *)(v2 + 40) + 432) setConstant:*(double *)(*(void *)(v2 + 40) + 464) + v34];
    uint64_t v35 = *(void *)(v2 + 40);
    v29 = *(void **)(v35 + 440);
    if (*(unsigned char *)(v2 + 48)) {
      double v36 = v8;
    }
    else {
      double v36 = -0.0;
    }
    double v31 = *(double *)(v35 + 472) + v36;
    goto LABEL_30;
  }
LABEL_31:
  if (*(unsigned char *)(v2 + 49)) {
    int v37 = v10;
  }
  else {
    int v37 = 0;
  }
  v38 = *(unsigned char **)(v2 + 40);
  if (v37 == 1)
  {
    [v38 layoutIfNeeded];
  }
  else if (v38[408])
  {
    [v38 _configureSubviews];
    *(unsigned char *)(*(void *)(v2 + 40) + 408) = 0;
  }
  uint64_t v39 = *(void *)(v2 + 40);
  v40 = *(void **)(v39 + 488);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_3;
  v43[3] = &unk_264BA79F0;
  v43[4] = v39;
  char v44 = *(unsigned char *)(v2 + 48);
  return [v40 enumerateObjectsUsingBlock:v43];
}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(double **)(a1 + 32);
  double v6 = v5[60];
  id v7 = a2;
  id v11 = [v5 visibleLabelWidths];
  double v8 = [v11 objectAtIndex:a3];
  [v8 doubleValue];
  double v10 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v10 = v6;
  }
  [v7 setConstant:v9 + v10];
}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) filteredComponents];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    double v17 = v19;
    double v16 = @"marquee-and-show-on-highlight";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v8 = objc_msgSend(*(id *)(a1 + 32), "layer", v16, v17);
        int v9 = [v8 hasBeenCommitted];

        if (v7 != *(void **)(*(void *)(a1 + 32) + 528))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v10 = [v7 valueForTVViewStyle:@"tv-text-highlight-style"];
            if (objc_msgSend(v7, "tv_showOnHighlight"))
            {
              if (*(unsigned char *)(a1 + 48))
              {
                double v11 = 1.0;
                goto LABEL_23;
              }
              if (*(unsigned char *)(a1 + 49)) {
                int v13 = v9;
              }
              else {
                int v13 = 0;
              }
              if (v13 == 1)
              {
                v18[0] = MEMORY[0x263EF8330];
                v18[1] = 3221225472;
                v19[0] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_5;
                v19[1] = &unk_264BA69A0;
                v19[2] = v7;
                [MEMORY[0x263F1CB60] animateWithDuration:2084 delay:v18 options:0 animations:0.2 completion:0.0];
              }
              else
              {
                double v11 = 0.0;
LABEL_23:
                [v7 setAlpha:v11];
              }
            }
            else
            {
              [*(id *)(a1 + 32) _updateShadowForLabel:v7 inFocus:*(unsigned __int8 *)(a1 + 48)];
              [v7 setHighlighted:*(unsigned __int8 *)(a1 + 48)];
            }
            if (objc_msgSend(v7, "tv_marqueeOnHighlight"))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (*(unsigned char *)(a1 + 48))
                {
                  double v14 = v7;
                  uint64_t v15 = 1;
                  goto LABEL_31;
                }
                if ([v10 isEqualToString:v16])
                {
                  [v7 stopAnimatingWithoutResetWithDuration:*(double *)(a1 + 40)];
                }
                else
                {
                  uint64_t v15 = *(unsigned __int8 *)(a1 + 48);
                  double v14 = v7;
LABEL_31:
                  [v14 setAnimating:v15];
                }
              }
            }

            continue;
          }
          if (objc_msgSend(v7, "tv_showOnHighlight"))
          {
            if (*(unsigned char *)(a1 + 48)) {
              double v12 = 1.0;
            }
            else {
              double v12 = 0.0;
            }
            [v7 setAlpha:v12];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
}

uint64_t __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_7;
  v3[3] = &unk_264BA7A40;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "tv_performByPreventingAdditiveAnimations:", v3);
}

uint64_t __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __63___TVStackingPosterView__updateSubviewHeirarchyWithComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) sendSubviewToBack:v3];
  }
  else
  {
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [*(id *)(a1 + 40) insertSubview:v3 atIndex:0];
  }
}

uint64_t __43___TVStackingPosterView__configureSubviews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  [a2 constant];
  return objc_msgSend(v2, "numberWithDouble:");
}

id __52___TVStackingPosterView__updateComponentConstraints__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v22;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      double v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      objc_msgSend(v14, "firstItem", (void)v21);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 != v7) {
        goto LABEL_9;
      }
      id v16 = [v14 secondItem];
      if (v16 != v8)
      {

        id v15 = v7;
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v17 = [v14 firstAttribute];

      if (v17 == a4)
      {
        id v19 = v14;
        goto LABEL_16;
      }
LABEL_10:
      ++v13;
    }
    while (v11 != v13);
    uint64_t v18 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    uint64_t v11 = v18;
  }
  while (v18);
LABEL_15:
  id v19 = 0;
LABEL_16:

  return v19;
}

void __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id v28 = a2;
  objc_msgSend(v28, "tv_margin");
  double v8 = v7;
  objc_msgSend(v28, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v9 + v10));
  double v12 = v11;
  if (!a3)
  {
    objc_msgSend(v28, "tv_margin");
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    double v15 = v12 + v13 + *(double *)(v14 + 32);
    *(double *)(v14 + 32) = v15;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && *(void *)(a1 + 32)
    && objc_msgSend(v28, "tv_showOnHighlight"))
  {
    id v16 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
    objc_msgSend(v16, "tv_margin");
    double v18 = v17;
    objc_msgSend(v16, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v19 + v20));
    double v22 = v21;
    long long v23 = *(void **)(a1 + 48);
    long long v24 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v25 = [v23 objectForKeyedSubscript:v24];
    [v25 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 32)
                                                                + v22
                                                                + fmax(v8, v18)
                                                                + v26
                                                                - v12;

    char v27 = 0;
  }
  else
  {
    char v27 = 1;
  }
  *a4 = v27;
}

void __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id v28 = a2;
  objc_msgSend(v28, "tv_margin");
  double v8 = v7;
  objc_msgSend(v28, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v9 + v10));
  double v12 = v11;
  if ([*(id *)(a1 + 32) count] - 1 == a3)
  {
    objc_msgSend(v28, "tv_margin");
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    double v15 = v12 + v13 + *(double *)(v14 + 48);
    *(double *)(v14 + 48) = v15;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = v15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && *(void *)(a1 + 40)
    && objc_msgSend(v28, "tv_showOnHighlight"))
  {
    id v16 = [*(id *)(a1 + 32) objectAtIndex:a3 - 1];
    objc_msgSend(v16, "tv_margin");
    double v18 = v17;
    objc_msgSend(v16, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v19 + v20));
    double v22 = v21;
    long long v23 = *(void **)(a1 + 48);
    long long v24 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v25 = [v23 objectForKeyedSubscript:v24];
    [v25 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 48)
                                                                + v22
                                                                + fmax(v8, v18)
                                                                + v26
                                                                - v12;

    char v27 = 0;
  }
  else
  {
    char v27 = 1;
  }
  *a4 = v27;
}

@end