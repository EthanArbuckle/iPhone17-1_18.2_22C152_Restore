@interface SXViewportConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXViewportConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 viewportSize];
  double v8 = v7;
  double v10 = v9;
  [v6 contentScaleFactor];
  CGFloat v12 = 1.0 / v11;
  [v6 contentScaleFactor];
  double v14 = v13;

  CGAffineTransformMakeScale(&v29, v12, 1.0 / v14);
  double v15 = round(v10 * v29.c + v29.a * v8);
  BOOL v16 = 1;
  if (v15 > 0.0)
  {
    double v17 = round(v10 * v29.d + v29.b * v8);
    if (v17 > 0.0)
    {
      [v5 minViewportWidth];
      if (v18 < 0.0) {
        goto LABEL_12;
      }
      [v5 minViewportWidth];
      if (v19 > 0.0)
      {
        [v5 minViewportWidth];
        if (v20 > v15) {
          goto LABEL_12;
        }
      }
      if (([v5 maxViewportWidth], v21 != 1.79769313e308)
        && ([v5 maxViewportWidth], v22 < v15)
        || (double v23 = v15 / v17, [v5 minViewportAspectRatio], v24 > 0.0)
        && ([v5 minViewportAspectRatio], v25 > v23)
        || ([v5 maxViewportAspectRatio], v26 != 1.79769313e308)
        && ([v5 maxViewportAspectRatio], v27 < v23))
      {
LABEL_12:
        BOOL v16 = 0;
      }
    }
  }

  return v16;
}

@end