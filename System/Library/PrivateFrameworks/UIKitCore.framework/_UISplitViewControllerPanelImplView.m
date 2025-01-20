@interface _UISplitViewControllerPanelImplView
+ (BOOL)_supportsInvalidatingFocusCache;
- (UISplitViewControllerPanelImpl)impl;
- (id)focusItemsInRect:(CGRect)a3;
- (void)_didChangeWidthFrom:(double)a3 to:;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImpl:(id)a3;
@end

@implementation _UISplitViewControllerPanelImplView

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v8 = CGRectGetWidth(v11);
  v10.receiver = self;
  v10.super_class = (Class)_UISplitViewControllerPanelImplView;
  -[UILayoutContainerView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  if (v8 != CGRectGetWidth(v12))
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    double v9 = CGRectGetWidth(v13);
    -[_UISplitViewControllerPanelImplView _didChangeWidthFrom:to:](self, v8, v9);
  }
}

- (void)setImpl:(id)a3
{
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v8 = CGRectGetWidth(v11);
  v10.receiver = self;
  v10.super_class = (Class)_UISplitViewControllerPanelImplView;
  -[UILayoutContainerView setBounds:](&v10, sel_setBounds_, x, y, width, height);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  if (v8 != CGRectGetWidth(v12))
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    double v9 = CGRectGetWidth(v13);
    -[_UISplitViewControllerPanelImplView _didChangeWidthFrom:to:](self, v8, v9);
  }
}

- (void).cxx_destruct
{
}

- (void)_didChangeWidthFrom:(double)a3 to:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v46 = [a1 impl];
  if ([v46 style])
  {
    v6 = [a1 window];

    if (v46)
    {
      if (v6)
      {
        uint64_t v7 = [v46 style];
        if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          unint64_t v43 = v7;
          v44 = [MEMORY[0x1E4F28B00] currentHandler];
          v45 = _UISplitViewControllerStyleDescription(v43);
          [v44 handleFailureInMethod:sel__updateDisplayModeIfNecessaryForChangeFromOldWidth_toNewWidth_, v46, @"UISplitViewControllerPanelImpl.m", 3512, @"Incorrect code path for UISplitViewControllerStyle %@", v45 object file lineNumber description];
        }
        double v8 = v46 + 2;
        WeakRetained = objc_loadWeakRetained(v46 + 2);
        if (!_UISplitViewControllerAutoHidesColumns(WeakRetained)) {
          goto LABEL_55;
        }
        char v10 = [v46 _isCollapsedOrCollapsing];

        if ((v10 & 1) == 0)
        {
          if (_UIGetUISplitViewControllerChamoisResizeLogging())
          {
            CGRect v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260110) + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              CGRect v12 = v11;
              id v13 = objc_loadWeakRetained(v8);
              *(_DWORD *)buf = 138412802;
              *(void *)&buf[4] = v13;
              __int16 v49 = 2048;
              double v50 = a2;
              __int16 v51 = 2048;
              double v52 = a3;
              _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Updating display mode if necessary for change in width from %g to %g", buf, 0x20u);
            }
          }
          WeakRetained = [v46 currentState];
          unint64_t v14 = [v46 displayMode];
          uint64_t v15 = [v46 preferredDisplayMode];
          if (v14 == v15 && v15)
          {
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260118) + 8);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v17 = v16;
                id v18 = objc_loadWeakRetained(v8);
                v19 = _UISplitViewControllerDisplayModeDescription(v14);
                BOOL v20 = ((unint64_t)v46[36] & 0xC0000) != 0 && v14 == 1;
                v21 = &stru_1ED0E84C0;
                *(_DWORD *)buf = 138412802;
                *(void *)&buf[4] = v18;
                if (v20) {
                  v21 = @" Clearing behavior override flags.";
                }
                __int16 v49 = 2112;
                double v50 = *(double *)&v19;
                __int16 v51 = 2112;
                double v52 = *(double *)&v21;
                _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "%@: Will not change preferred display mode, %@, for change in width.%@", buf, 0x20u);
              }
            }
            if (v14 != 1) {
              goto LABEL_55;
            }
            v46[36] = (id)((unint64_t)v46[36] & 0xFFFFFFFFFFF3FFFFLL);
            goto LABEL_24;
          }
          if (v14 > 6 || ((1 << v14) & 0x56) == 0)
          {
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260120) + 8);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v35 = v34;
                id v36 = objc_loadWeakRetained(v8);
                v37 = _UISplitViewControllerDisplayModeDescription(v14);
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v36;
                __int16 v49 = 2112;
                double v50 = *(double *)&v37;
                _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "%@: Will not change non-tile display mode, %@, for change in width", buf, 0x16u);
              }
            }
            goto LABEL_55;
          }
          if (a3 < a2)
          {
            if (![WeakRetained _collapsedState] && v14 != 1)
            {
              double v47 = 0.0;
              *(void *)buf = 0;
              objc_msgSend(v46, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", buf, &v47, v14, 1, 0, 0, a2, 800.0);
              unint64_t v22 = 0;
              if (![v46 _isSecondaryColumnCompactInTotalWidth:a3 withPrimaryColumnWidth:*(double *)buf supplementaryColumnWidth:v47]|| (unint64_t v22 = 1, *(double *)buf <= 0.0)|| v47 <= 0.0)
              {
LABEL_25:
                if (v22 && v22 != v14)
                {
                  if (_UIGetUISplitViewControllerChamoisResizeLogging())
                  {
                    v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260128) + 8);
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      v24 = v23;
                      id v25 = objc_loadWeakRetained(v8);
                      v26 = _UISplitViewControllerDisplayModeDescription(v14);
                      v27 = _UISplitViewControllerDisplayModeDescription(v22);
                      *(_DWORD *)buf = 138412802;
                      *(void *)&buf[4] = v25;
                      __int16 v49 = 2112;
                      double v50 = *(double *)&v26;
                      __int16 v51 = 2112;
                      double v52 = *(double *)&v27;
                      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "%@: Automatically changing displayMode from %@ to %@ for change in width", buf, 0x20u);
                    }
                  }
                  [v46 setUserGeneratedDisplayMode:0];
                  v28 = [v46 panelController];
                  [v28 setNeedsUpdate];
                }
                goto LABEL_55;
              }
              if (([v46 _isSecondaryColumnCompactInTotalWidth:a3 withPrimaryColumnWidth:0.0 supplementaryColumnWidth:v47] & 1) == 0)
              {
                unint64_t v22 = [v46 allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:2];
                goto LABEL_25;
              }
LABEL_24:
              unint64_t v22 = 1;
              goto LABEL_25;
            }
LABEL_55:

            goto LABEL_56;
          }
          if (a3 <= a2) {
            goto LABEL_55;
          }
          [WeakRetained leadingWidth];
          if (v29 != 0.0) {
            goto LABEL_55;
          }
          [WeakRetained trailingWidth];
          if (v30 != 0.0) {
            goto LABEL_55;
          }
          [WeakRetained supplementaryWidth];
          if (v31 != 0.0 && ((unint64_t)v46[36] & 0xC0000) == 0x80000) {
            goto LABEL_55;
          }
          double v47 = 0.0;
          *(void *)buf = 0;
          [WeakRetained supplementaryWidth];
          if (v32 == 0.0)
          {
            id v33 = objc_loadWeakRetained(v8);
            if (_UISplitViewControllerAutoHidesColumns(v33) && qword_1EB260168 != -1) {
              dispatch_once(&qword_1EB260168, &__block_literal_global_1400);
            }
            if (byte_1EB26008B)
            {

              goto LABEL_60;
            }
            id v38 = objc_loadWeakRetained(v8);
            int v39 = _UISplitViewControllerAutoRevealsFullSidebar(v38);

            if (v39)
            {
LABEL_60:
              unint64_t v22 = 2;
              objc_msgSend(v46, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:", buf, &v47, 2, 0, 0, a3, 800.0);
              if (([v46 _isSecondaryColumnCompactInTotalWidth:a3 withPrimaryColumnWidth:*(double *)buf supplementaryColumnWidth:v47] & 1) == 0)
              {
LABEL_61:
                v46[36] = (id)((unint64_t)v46[36] & 0xFFFFFFFFFFF3FFFFLL);
                goto LABEL_25;
              }
              goto LABEL_65;
            }
          }
          [WeakRetained supplementaryWidth];
          if (v40 > 0.0)
          {
            id v41 = objc_loadWeakRetained(v8);
            int v42 = _UISplitViewControllerAutoRevealsFullSidebar(v41);

            if (v42)
            {
              if (([v46 _isSecondaryColumnCompactInTotalWidth:a3 withPrimaryColumnWidth:0.0 supplementaryColumnWidth:0.0] & 1) == 0)
              {
                unint64_t v22 = objc_msgSend(v46, "_greatestAllowedAutohidingDisplayModeInSize:", a3, 800.0);
                goto LABEL_61;
              }
            }
          }
LABEL_65:
          unint64_t v22 = 0;
          goto LABEL_25;
        }
      }
    }
  }
LABEL_56:
}

- (UISplitViewControllerPanelImpl)impl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_impl);
  return (UISplitViewControllerPanelImpl *)WeakRetained;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)_UISplitViewControllerPanelImplView;
  double v8 = -[UIView focusItemsInRect:](&v19, sel_focusItemsInRect_);
  double v9 = [(_UISplitViewControllerPanelImplView *)self impl];
  char v10 = [v9 _primaryViewControllerFocusPromiseItem];
  if (!v10) {
    goto LABEL_4;
  }
  CGRect v11 = [(UIView *)self coordinateSpace];
  v22.origin.CGFloat x = _UIFocusItemFrameInCoordinateSpace(v10, v11);
  v22.origin.CGFloat y = v12;
  v22.size.CGFloat width = v13;
  v22.size.CGFloat height = v14;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  BOOL v15 = CGRectIntersectsRect(v21, v22);

  if (v15)
  {
    id v16 = [v8 arrayByAddingObject:v10];
  }
  else
  {
LABEL_4:
    id v16 = v8;
  }
  v17 = v16;

  return v17;
}

@end