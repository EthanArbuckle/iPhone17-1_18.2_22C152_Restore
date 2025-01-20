@interface _UISplitViewControllerStyle
- (BOOL)alwaysHideSidebarToggleButton;
- (UIColor)primaryBackgroundColor;
- (UISplitViewController)splitViewController;
- (_UISplitViewControllerStyle)initWithSplitViewController:(id)a3;
- (double)defaultMaximumWidthForColumn:(int64_t)a3 withSize:(CGSize)a4 splitBehavior:(int64_t)a5;
- (double)maximumRubberbandingDistance;
- (int64_t)splitBehaviorForSize:(CGSize)a3;
@end

@implementation _UISplitViewControllerStyle

- (double)maximumRubberbandingDistance
{
  return 100.0;
}

- (int64_t)splitBehaviorForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);
  uint64_t v7 = [WeakRetained _panelImpl];

  v8 = [(_UISplitViewControllerStyle *)self splitViewController];
  LODWORD(WeakRetained) = _UISplitViewControllerAutoHidesColumns(v8);

  if (WeakRetained)
  {
    if (!v7)
    {
      int64_t v16 = 0;
      goto LABEL_36;
    }
    unint64_t v9 = [(id)v7 style];
    if (v9 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = _UISplitViewControllerStyleDescription(v9);
      [v21 handleFailureInMethod:sel__defaultAutoHidingSplitBehaviorUpdatingOverrideFlagsIfNecessaryForSize_, v7, @"UISplitViewControllerPanelImpl.m", 1634, @"Incorrect code path for UISplitViewControllerStyle %@", v22 object file lineNumber description];
    }
    id v10 = objc_loadWeakRetained((id *)(v7 + 16));
    char v11 = _UISplitViewControllerAutoHidesColumns(v10);

    if ((v11 & 1) == 0)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel__defaultAutoHidingSplitBehaviorUpdatingOverrideFlagsIfNecessaryForSize_ object:v7 file:@"UISplitViewControllerPanelImpl.m" lineNumber:1634 description:@"Method restricted to autohiding context for UISplitViewController"];
    }
    v12 = [(id)v7 currentState];
    if (v12)
    {
    }
    else if (([(id)v7 _isSecondaryColumnCompactInTotalWidth:width withPrimaryColumnWidth:0.0 supplementaryColumnWidth:0.0] & 1) == 0)
    {
      double v24 = 0.0;
      double v25 = 0.0;
      if (v9 == 2)
      {
        v17 = [*(id *)(v7 + 8) objectForKeyedSubscript:&unk_1ED3F3A20];
        uint64_t v18 = v17 ? 4 : 2;
        objc_msgSend((id)v7, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v25, &v24, v18, 1, 0, 0, width, height);
      }
      else
      {
        objc_msgSend((id)v7, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v25, &v24, 2, 1, 0, 0, width, height);
      }
      if ([(id)v7 _isSecondaryColumnCompactInTotalWidth:width withPrimaryColumnWidth:v25 supplementaryColumnWidth:v24])
      {
        if (v24 <= 0.0)
        {
          int64_t v16 = 2;
        }
        else if ([(id)v7 _isSecondaryColumnCompactInTotalWidth:width withPrimaryColumnWidth:0.0 supplementaryColumnWidth:v24])
        {
          int64_t v16 = 2;
        }
        else
        {
          int64_t v16 = 3;
        }
        int64_t v19 = v16 << 18;
        goto LABEL_35;
      }
    }
    int64_t v19 = 0;
    int64_t v16 = 1;
LABEL_35:
    *(void *)(v7 + 288) = *(void *)(v7 + 288) & 0xFFFFFFFFFFF3FFFFLL | v19;
    goto LABEL_36;
  }
  int v29 = 802516499;
  long long v28 = xmmword_186B945C0;
  int v27 = -1919324456;
  long long v26 = xmmword_186B945D4;
  int v13 = MGIsDeviceOneOfType();
  double v14 = 1194.0;
  if (v13) {
    double v14 = 1210.0;
  }
  double v15 = 1536.0;
  if (width > height) {
    double v15 = v14;
  }
  if (width <= v15)
  {
    if (width > height) {
      double v14 = 1024.0;
    }
    if (width >= v14)
    {
      if (objc_msgSend((id)v7, "_hasDoubleSideBar", &v26, 0)) {
        int64_t v16 = 3;
      }
      else {
        int64_t v16 = 1;
      }
    }
    else
    {
      int64_t v16 = 2;
    }
  }
  else
  {
    int64_t v16 = 1;
  }
LABEL_36:

  return v16;
}

- (BOOL)alwaysHideSidebarToggleButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);
  v3 = [WeakRetained _panelImpl];

  BOOL v4 = ([v3 _forceDisplayModeBarButtonHidden] & 1) != 0
    || ([v3 _isCollapsedOrCollapsing] & 1) != 0
    || ([v3 presentsWithGesture] & 1) == 0
    && ([v3 _visibleToggleButtonRequiresPresentsWithGesture] & 1) != 0
    || UIApp == 0;

  return v4;
}

- (UISplitViewController)splitViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);
  return (UISplitViewController *)WeakRetained;
}

- (UIColor)primaryBackgroundColor
{
  if (dyld_program_sdk_at_least()) {
    +[UIColor systemBackgroundColor];
  }
  else {
  v2 = +[UIColor _splitViewBorderColor];
  }
  return (UIColor *)v2;
}

- (_UISplitViewControllerStyle)initWithSplitViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISplitViewControllerStyle;
  v5 = [(_UISplitViewControllerStyle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_splitViewController, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (double)defaultMaximumWidthForColumn:(int64_t)a3 withSize:(CGSize)a4 splitBehavior:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  p_splitViewController = &self->_splitViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);

  if (!WeakRetained)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:9916 description:@"Style for a dealloced UISplitViewController not expected"];
  }
  id v13 = objc_loadWeakRetained((id *)p_splitViewController);
  double v14 = [v13 _panelImpl];

  uint64_t v15 = [v14 style];
  if (a3 == 1)
  {
    double v19 = 0.0;
    if (v15 == 2)
    {
      [v14 _screenSize];
      if (width < v20 && a5 == 2) {
        double v19 = 320.0;
      }
      else {
        double v19 = 375.0;
      }
    }
    goto LABEL_40;
  }
  if (a3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v23 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        goto LABEL_18;
      }
      double v24 = _UISplitViewControllerColumnDescription(a3);
      int v40 = 138412290;
      v41 = v24;
      _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "Unexpected request for default max width for %@ column. Using CGFLOAT_MAX", (uint8_t *)&v40, 0xCu);
    }
    else
    {
      v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &defaultMaximumWidthForColumn_withSize_splitBehavior____s_category)+ 8);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_19:
        *(double *)&uint64_t v18 = 1.79769313e308;
        goto LABEL_39;
      }
      v23 = v22;
      double v24 = _UISplitViewControllerColumnDescription(a3);
      int v40 = 138412290;
      v41 = v24;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Unexpected request for default max width for %@ column. Using CGFLOAT_MAX", (uint8_t *)&v40, 0xCu);
    }

LABEL_18:
    goto LABEL_19;
  }
  id v16 = objc_loadWeakRetained((id *)p_splitViewController);
  char v17 = _UISplitViewControllerWantsPickerBehaviors(v16);

  if (v17)
  {
    *(double *)&uint64_t v18 = 240.0;
LABEL_39:
    double v19 = *(double *)&v18;
    goto LABEL_40;
  }
  double v25 = [(_UISplitViewControllerStyle *)self splitViewController];
  int v26 = [v25 _usesExtraWidePrimaryColumn];

  if (!v26) {
    goto LABEL_38;
  }
  [v14 _screenSize];
  double v19 = 320.0;
  if (width != v28 || height != v27) {
    goto LABEL_40;
  }
  if (height >= width) {
    double v29 = height;
  }
  else {
    double v29 = width;
  }
  if (v29 > 1210.0)
  {
    double v19 = dbl_186B94590[height < width];
    goto LABEL_40;
  }
  if (height >= width) {
    goto LABEL_38;
  }
  if (width > 1112.0)
  {
    double v19 = 414.0;
    goto LABEL_40;
  }
  if (width > 926.0)
  {
    double v19 = 375.0;
    goto LABEL_40;
  }
  if (width <= 844.0)
  {
LABEL_38:
    *(double *)&uint64_t v18 = 320.0;
    goto LABEL_39;
  }
  int v30 = [v14 _layoutPrimaryOnRight];
  id v31 = objc_loadWeakRetained((id *)p_splitViewController);
  v32 = [v31 view];
  [v32 safeAreaInsets];
  double v34 = v33;
  double v36 = v35;

  if (v30) {
    double v37 = v36;
  }
  else {
    double v37 = v34;
  }
  double v19 = v37 + 320.0;
LABEL_40:

  return v19;
}

@end