@interface UICalendarViewPlatformMetrics
@end

@implementation UICalendarViewPlatformMetrics

double __38___UICalendarViewPlatformMetrics_init__block_invoke(double a1, double a2, double a3, double a4)
{
  return a4 + a2 + 375.0;
}

double __38___UICalendarViewPlatformMetrics_init__block_invoke_2()
{
  return 16.0;
}

double __38___UICalendarViewPlatformMetrics_init__block_invoke_3()
{
  return 0.0;
}

double __38___UICalendarViewPlatformMetrics_init__block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) headerViewDefaultButtonConfiguration];
  [v1 contentInsets];

  return 0.0;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return _UICalendarFont(@"UICTFontTextStyleHeadline", a3, 2, a2, 0.0);
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_6(uint64_t a1, uint64_t a2)
{
  v2 = _UICalendarFont(@"UICTFontTextStyleBody", a2, 2, 0, 0.0);
  v3 = +[UIImageSymbolConfiguration configurationWithFont:v2 scale:1];

  return v3;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_7(uint64_t a1, uint64_t a2)
{
  v2 = _UICalendarFont(@"UICTFontTextStyleTitle3", a2, 0, 0, *(double *)off_1E52D6C00);
  v3 = +[_UICalendarViewPlatformMetrics _headerViewDefaultButtonConfiguration];
  v4 = +[UIImageSymbolConfiguration configurationWithFont:v2 scale:2];
  [v3 setPreferredSymbolConfigurationForImage:v4];

  return v3;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_8()
{
  v0 = +[UIButtonConfiguration plainButtonConfiguration];
  v1 = +[UIColor clearColor];
  v2 = [v0 background];
  [v2 setBackgroundColor:v1];

  return v0;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_9()
{
  v0 = objc_opt_new();
  [v0 setUserInteractionEnabled:1];
  v1 = [v0 layer];
  [v1 setCornerRadius:4.0];

  return v0;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOutOfRange])
  {
    uint64_t v3 = +[UIColor quaternaryLabelColor];
  }
  else if ([v2 isOverhangMonth])
  {
    uint64_t v3 = +[UIColor tertiaryLabelColor];
  }
  else
  {
    if ([v2 isSelected]
      && [v2 isToday]
      && [v2 highlightsToday])
    {
      v4 = +[UIColor tintColor];
      v5 = [v2 traits];
      v6 = [v4 resolvedColorWithTraitCollection:v5];

      [v6 _luminance];
      if (v7 <= 0.8) {
        +[UIColor whiteColor];
      }
      else {
      v8 = +[UIColor blackColor];
      }

      goto LABEL_17;
    }
    if ([v2 isSelected]
      || [v2 isToday]
      && (([v2 isHighlighted] & 1) != 0 || (objc_msgSend(v2, "isSelected") & 1) == 0))
    {
      uint64_t v3 = +[UIColor tintColor];
    }
    else
    {
      uint64_t v3 = +[UIColor labelColor];
    }
  }
  v8 = (void *)v3;
LABEL_17:

  return v8;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 isSelected]
    || ![v2 isToday]
    || ![v2 highlightsToday])
  {
    if ([v2 isSelected])
    {
      v4 = +[UIColor tintColor];
      v5 = v4;
      double v6 = 0.12;
    }
    else
    {
      if (![v2 isHighlighted])
      {
        uint64_t v3 = +[UIColor clearColor];
        goto LABEL_11;
      }
      v4 = +[UIColor tintColor];
      v5 = v4;
      double v6 = 0.06;
    }
    double v7 = [v4 colorWithAlphaComponent:v6];

    goto LABEL_12;
  }
  uint64_t v3 = +[UIColor tintColor];
LABEL_11:
  double v7 = (void *)v3;
LABEL_12:

  return v7;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v6 forceEmphasizedFont])
  {
    [v6 isSelected];
    v9 = (double *)off_1E52D6C00;
  }
  else
  {
    if (_AXSDifferentiateWithoutColorEnabled()) {
      int v10 = [v6 isToday];
    }
    else {
      int v10 = 0;
    }
    if ([v6 isSelected] | v10) {
      v9 = (double *)off_1E52D6C00;
    }
    else {
      v9 = (double *)off_1E52D6BF8;
    }
  }
  v11 = _UICalendarFont(@"UICTFontTextStyleTitle3", (uint64_t)v8, 0, v7, *v9);

  return v11;
}

@end