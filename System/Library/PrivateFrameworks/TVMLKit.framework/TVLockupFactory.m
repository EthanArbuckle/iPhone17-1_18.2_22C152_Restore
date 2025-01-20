@interface TVLockupFactory
@end

@implementation TVLockupFactory

_TVStackingPosterView *__35___TVLockupFactory__registerLockup__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(objc_class *)+[TVViewLayout layoutClassForElement:v6] layoutWithLayout:v7 element:v6];

    [v9 setAcceptsFocus:1];
    +[_TVLockupFactory _configureCell:v8 layout:v9 element:v6];
    v10 = (_TVStackingPosterView *)v8;
    id v7 = v9;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = (_TVStackingPosterView *)v8;
    }
    else {
      v11 = objc_alloc_init(_TVStackingPosterView);
    }
    v10 = v11;
    +[_TVLockupFactory _configureStackingPoster:v11 layout:0 element:v6 forMetrics:0];
  }

  return v10;
}

double __52___TVLockupFactory_cellMetricsForCollectionElement___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  double v5 = *(double *)(v2 + 32);
  double v4 = *(double *)(v2 + 40);
  v3 = (_OWORD *)(v2 + 32);
  if (v5 == *MEMORY[0x263F001B0] && v4 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    _OWORD *v3 = *(_OWORD *)a2;
    uint64_t v17 = *(void *)(a1[5] + 8);
    long long v18 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v17 + 32) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v17 + 48) = v18;
    uint64_t v19 = *(void *)(a1[6] + 8);
    long long v20 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v19 + 32) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v19 + 48) = v20;
    uint64_t v21 = *(void *)(a1[7] + 8);
    long long v22 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v21 + 32) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v21 + 48) = v22;
    uint64_t v23 = *(void *)(a1[8] + 8);
    long long v24 = *(_OWORD *)(a2 + 112);
    long long v25 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(v23 + 32) = v24;
    *(_OWORD *)(v23 + 48) = v25;
    return *(double *)&v24;
  }
  if (v5 != 0.0 && v5 != *(double *)a2)
  {
    *(void *)v3 = 0;
    *(void *)(*(void *)(a1[5] + 8) + 56) = 0;
    *(void *)(*(void *)(a1[5] + 8) + 40) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 56) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 40) = 0;
    *(void *)(*(void *)(a1[7] + 8) + 56) = 0;
    *(void *)(*(void *)(a1[7] + 8) + 40) = 0;
    *(void *)(*(void *)(a1[8] + 8) + 56) = 0;
    *(void *)(*(void *)(a1[8] + 8) + 40) = 0;
    double v4 = *(double *)(*(void *)(a1[4] + 8) + 40);
  }
  uint64_t v7 = *(void *)(a1[5] + 8);
  double v8 = *(double *)(v7 + 32);
  double v9 = *(double *)(a2 + 8);
  double v10 = *(double *)(a2 + 16);
  double v11 = v10 - v8;
  double v12 = v4 - (v8 + *(double *)(v7 + 48));
  double v13 = *(double *)(a2 + 32);
  double v14 = v9 - (v10 + v13);
  uint64_t v15 = a1[9];
  if (v15 == 3)
  {
    double v16 = v14 - v12;
    goto LABEL_13;
  }
  if (v15 == 2)
  {
    double v16 = floor((v14 - v12) * 0.5);
LABEL_13:
    double v11 = v11 + v16;
  }
  if (v11 <= 0.0)
  {
    if (v11 < 0.0)
    {
      double v9 = v9 - v11;
      *(double *)(a2 + 8) = v9;
      *(double *)(a2 + 16) = v10 - v11;
      *(double *)(a2 + 112) = fmin(v11 + *(double *)(a2 + 112), 0.0);
    }
  }
  else
  {
    *(double *)(v7 + 32) = v8 + v11;
    *(double *)(*(void *)(a1[4] + 8) + 40) = v11 + *(double *)(*(void *)(a1[4] + 8) + 40);
    *(double *)(*(void *)(a1[8] + 8) + 32) = fmin(*(double *)(*(void *)(a1[8] + 8) + 32) - v11, 0.0);
    double v9 = *(double *)(a2 + 8);
  }
  uint64_t v26 = *(void *)(a1[4] + 8);
  double v27 = *(double *)(v26 + 40);
  double v28 = v9 - v27;
  if (v9 - v27 <= 0.0)
  {
    if (v9 - v27 < 0.0)
    {
      *(double *)(a2 + 8) = v9 - v28;
      double v13 = v13 - v28;
      *(double *)(a2 + 32) = v13;
      *(double *)(a2 + 128) = fmax(v28 + *(double *)(a2 + 128), 0.0);
    }
  }
  else
  {
    *(double *)(v26 + 40) = v27 + v28;
    *(double *)(*(void *)(a1[5] + 8) + 48) = v28 + *(double *)(*(void *)(a1[5] + 8) + 48);
    *(double *)(*(void *)(a1[8] + 8) + 48) = fmax(*(double *)(*(void *)(a1[8] + 8) + 48) - v28, 0.0);
    double v13 = *(double *)(a2 + 32);
  }
  *(double *)(*(void *)(a1[5] + 8) + 48) = fmin(*(double *)(*(void *)(a1[5] + 8) + 48), v13);
  *(double *)(*(void *)(a1[6] + 8) + 32) = fmin(*(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(a2 + 48));
  *(double *)(*(void *)(a1[6] + 8) + 48) = fmin(*(double *)(*(void *)(a1[6] + 8) + 48), *(double *)(a2 + 64));
  *(double *)(*(void *)(a1[7] + 8) + 32) = fmin(*(double *)(*(void *)(a1[7] + 8) + 32), *(double *)(a2 + 80));
  *(double *)(*(void *)(a1[7] + 8) + 48) = fmin(*(double *)(*(void *)(a1[7] + 8) + 48), *(double *)(a2 + 96));
  *(double *)(*(void *)(a1[8] + 8) + 32) = fmax(*(double *)(*(void *)(a1[8] + 8) + 32), *(double *)(a2 + 112));
  uint64_t v29 = *(void *)(a1[8] + 8);
  *(double *)&long long v24 = fmax(*(double *)(v29 + 48), *(double *)(a2 + 128));
  *(void *)(v29 + 48) = v24;
  return *(double *)&v24;
}

void *__71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke(uint64_t a1, void *a2)
{
  result = *(void **)(a1 + 32);
  if (result != a2) {
    return (void *)[result setOverlayView:0];
  }
  return result;
}

void *__71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_2(uint64_t a1, void *a2)
{
  result = *(void **)(a1 + 32);
  if (result != a2) {
    return (void *)[result setOverlayView:0];
  }
  return result;
}

void __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v8 = objc_msgSend(v12, "tv_elementType");
  if (v8 == objc_msgSend(v7, "tv_elementType"))
  {
    if (objc_msgSend(v12, "tv_elementType") == 55)
    {
      double v9 = [v12 valueForTVViewStyle:@"tv-text-highlight-style"];
      double v10 = [v7 style];
      double v11 = objc_msgSend(v10, "tv_textHighlightStyle");

      if (v9 != v11 && ([v9 isEqualToString:v11] & 1) == 0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

void __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_23(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v26 = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
    uint64_t v7 = v26;
    id v8 = (id)v6;
  }
  else
  {
    uint64_t v7 = v5;
    id v8 = 0;
  }
  uint64_t v9 = objc_msgSend(v7, "tv_elementType");
  uint64_t v10 = objc_msgSend(v8, "tv_associatedIKViewElement");
  id v11 = v26;
  id v12 = (void *)v10;
  if (v8 && (id)v10 == v26 && (v13 = [v26 updateType], id v11 = v26, !v13))
  {
    id v16 = v8;
  }
  else
  {
    +[TVViewLayout layoutClassForElement:v11];
    double v14 = objc_opt_new();
    [v14 setAcceptsFocus:*(unsigned __int8 *)(a1 + 80)];
    uint64_t v15 = +[TVInterfaceFactory sharedInterfaceFactory];
    id v16 = [v15 _viewFromElement:v26 layout:v14 existingView:v8];

    if ([v26 isDisabled])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(*(id *)(a1 + 40), "tv_elementType") == 24
        && objc_msgSend(v26, "tv_elementType") == 55
        && (objc_msgSend(v26, "tv_textStyle") == 1 || objc_msgSend(v26, "tv_textStyle") == 2))
      {
        id v17 = v16;
        long long v18 = [v17 textColor];
        uint64_t v19 = [v18 colorWithAlphaComponent:0.4];

        [v17 setTextColor:v19];
      }
    }
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v22 = *(void *)(v20 + 40);
  uint64_t v21 = (id *)(v20 + 40);
  if (!v22 && (v9 == 30 || v9 == 16)) {
    objc_storeStrong(v21, v16);
  }
  uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v23 + 24)) {
    BOOL v24 = v16 == v8;
  }
  else {
    BOOL v24 = 0;
  }
  char v25 = v24;
  *(unsigned char *)(v23 + 24) = v25;
  if (v16)
  {
    objc_msgSend(v16, "tv_setAssociatedIKViewElement:", v26);
    [*(id *)(a1 + 48) addObject:v16];
  }
}

uint64_t __55___TVLockupFactory__configurationIdentifierForElement___block_invoke(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%@:%.0f %.0f %.0f %.0f;",
           a6,
           *(void *)&a1,
           *(void *)&a4,
           *(void *)&a3,
           *(void *)&a2);
}

uint64_t __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_2(double a1, uint64_t a2, uint64_t a3)
{
  return [NSString stringWithFormat:@"%@:%.0f;", a3, *(void *)&a1];
}

id __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  double v4 = NSString;
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [(__CFString *)v5 length];
  id v8 = @"none";
  if (v7) {
    id v8 = v5;
  }
  uint64_t v9 = [v4 stringWithFormat:@"%@:%@;", v6, v8];

  return v9;
}

id __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "tv_imageScaleToSize");
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x263F089D8] string];
  [v7 appendString:@"{"];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) style];
  objc_msgSend(v9, "tv_margin");
  uint64_t v10 = (*(void (**)(uint64_t, __CFString *))(v8 + 16))(v8, @"margin");
  [v7 appendString:v10];

  id v11 = (*(void (**)(double))(*(void *)(a1 + 48) + 16))(v4);
  [v7 appendString:v11];

  id v12 = (*(void (**)(double))(*(void *)(a1 + 48) + 16))(v6);
  [v7 appendString:v12];

  [v7 appendString:@"}"];
  if ([v7 length]) {
    uint64_t v13 = (void *)[v7 copy];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

id __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_5(uint64_t a1, void *a2)
{
  double v3 = [a2 style];
  uint64_t v4 = objc_msgSend(v3, "tv_maxTextLines");

  if (v4 == 1)
  {
    double v5 = [MEMORY[0x263F089D8] string];
    [v5 appendString:@"{"];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) style];
    objc_msgSend(v7, "tv_margin");
    uint64_t v8 = (*(void (**)(uint64_t, __CFString *))(v6 + 16))(v6, @"margin");
    [v5 appendString:v8];

    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [*(id *)(a1 + 32) style];
    id v11 = objc_msgSend(v10, "tv_textStyle");
    id v12 = (*(void (**)(uint64_t, __CFString *, void *))(v9 + 16))(v9, @"textStyle", v11);
    [v5 appendString:v12];

    uint64_t v13 = *(void *)(a1 + 56);
    double v14 = [*(id *)(a1 + 32) style];
    objc_msgSend(v14, "tv_fontSize");
    uint64_t v15 = (*(void (**)(uint64_t, __CFString *))(v13 + 16))(v13, @"fontSize");
    [v5 appendString:v15];

    uint64_t v16 = *(void *)(a1 + 48);
    id v17 = [*(id *)(a1 + 32) style];
    long long v18 = objc_msgSend(v17, "tv_fontWeight");
    uint64_t v19 = (*(void (**)(uint64_t, __CFString *, void *))(v16 + 16))(v16, @"fontWeight", v18);
    [v5 appendString:v19];

    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = [*(id *)(a1 + 32) style];
    uint64_t v22 = objc_msgSend(v21, "tv_fontFamily");
    uint64_t v23 = (*(void (**)(uint64_t, __CFString *, void *))(v20 + 16))(v20, @"fontFamily", v22);
    [v5 appendString:v23];

    [v5 appendString:@"}"];
  }
  else
  {
    double v5 = 0;
  }
  BOOL v24 = (void *)[v5 copy];

  return v24;
}

@end