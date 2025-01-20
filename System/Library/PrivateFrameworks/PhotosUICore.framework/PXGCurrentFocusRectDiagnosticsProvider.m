@interface PXGCurrentFocusRectDiagnosticsProvider
- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4;
@end

@implementation PXGCurrentFocusRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, __CFString *, unsigned char *, double, double, double, double))a4;
  v7 = [off_1E5DA9658 sharedInstance];
  int v8 = [v7 enableCurrentFocusRectDiagnostics];

  if (v8)
  {
    v9 = [v5 rootLayout];
    v10 = [v9 axGroup];
    v11 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:v10];
    v12 = [v11 focusedItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      v14 = [v13 axContainingGroup];
      v15 = [v14 containingLayout];

      if (v15)
      {
        [v13 axFrame];
        objc_msgSend(v9, "convertRect:fromLayout:", v15);
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        char v25 = 0;
        v24 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
        v6[2](v6, v24, @"Current Item", &v25, v17, v19, v21, v23);
      }
    }
  }
}

@end