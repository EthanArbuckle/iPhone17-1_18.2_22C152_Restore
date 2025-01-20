@interface SBDockView
- (BOOL)isDockInset;
- (CGRect)dockListViewFrame;
- (SBDockIconListView)dockListView;
- (SBDockView)initWithDockListView:(id)a3 forSnapshot:(BOOL)a4;
- (SBDockViewDelegate)delegate;
- (UIColor)accessibilityBackgroundColor;
- (UIEdgeInsets)_dockOverhangInsets;
- (UIView)backgroundView;
- (_UILegibilitySettings)legibilitySettings;
- (double)_layoutScale;
- (double)_minimumHomeScreenScale;
- (double)dockHeight;
- (double)dockHeightPadding;
- (double)dockListOffset;
- (id)_listLayout;
- (id)_visualConfiguration;
- (unint64_t)dockEdge;
- (void)_backgroundContrastDidChange:(id)a3;
- (void)_updateBackgroundUserInterfaceStyle;
- (void)_updateCornerRadii;
- (void)dealloc;
- (void)getDockViewMetrics:(id *)a3;
- (void)layoutSubviews;
- (void)listLayoutProviderDidChange;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockEdge:(unint64_t)a3;
- (void)setDockListOffset:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)updateAccessibilityTintColor;
@end

@implementation SBDockView

- (SBDockIconListView)dockListView
{
  return self->_iconListView;
}

- (BOOL)isDockInset
{
  v2 = [(SBDockView *)self _visualConfiguration];
  [v2 dockBackgroundViewCornerRadius];
  double v4 = v3;

  return v4 > 0.0;
}

- (void)setBackgroundAlpha:(double)a3
{
  -[SBHighlightView setAlpha:](self->_highlightView, "setAlpha:");
  [(UIView *)self->_backgroundView setAlpha:a3];
  accessibilityBackgroundView = self->_accessibilityBackgroundView;
  [(UIView *)accessibilityBackgroundView setAlpha:a3];
}

- (id)_visualConfiguration
{
  v2 = [(SBDockView *)self _listLayout];
  double v3 = [v2 rootFolderVisualConfiguration];

  return v3;
}

- (id)_listLayout
{
  v2 = [(SBIconListView *)self->_iconListView layoutProvider];
  double v3 = [v2 layoutForIconLocation:@"SBIconLocationRoot"];

  return v3;
}

- (double)dockHeight
{
  v2 = [(SBDockView *)self _visualConfiguration];
  [v2 dockViewHeight];
  double v4 = v3;

  return v4;
}

- (void)setDockListOffset:(double)a3
{
  if (self->_dockListOffset != a3)
  {
    self->_dockListOffset = a3;
    [(SBDockView *)self setNeedsLayout];
  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBDockView)initWithDockListView:(id)a3 forSnapshot:(BOOL)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12 = -[SBDockView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconListView, a3);
    v13->_dockEdge = 4;
    v13->_forSnapshot = a4;
    [(SBDockView *)v13 _layoutScale];
    v15 = -[SBHighlightView initWithFrame:highlightAlpha:highlightHeight:]([SBHighlightView alloc], "initWithFrame:highlightAlpha:highlightHeight:", v8, v9, v10, v11, 0.05, 1.0 / v14);
    highlightView = v13->_highlightView;
    v13->_highlightView = v15;

    [(SBDockView *)v13 addSubview:v13->_iconListView];
    [(SBDockView *)v13 addSubview:v13->_highlightView];
    [(SBDockView *)v13 _updateCornerRadii];
    [(SBDockView *)v13 _backgroundContrastDidChange:0];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v13 selector:sel__backgroundContrastDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];

    v18 = self;
    v23[0] = v18;
    v19 = self;
    v23[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v21 = (id)[(SBDockView *)v13 registerForTraitChanges:v20 withTarget:v13 action:sel__updateBackgroundUserInterfaceStyle];

    [(SBDockView *)v13 setAutoresizesSubviews:0];
  }

  return v13;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBDockView;
  [(SBDockView *)&v4 dealloc];
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBDockView *)self updateAccessibilityTintColor];
  }
}

- (void)setDockEdge:(unint64_t)a3
{
  if (self->_dockEdge != a3)
  {
    self->_dockEdge = a3;
    [(SBDockView *)self setNeedsLayout];
  }
}

- (void)setBackgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    id v7 = v5;
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    id v5 = v7;
    if (v7)
    {
      [(SBDockView *)self insertSubview:v7 atIndex:0];
      [(SBDockView *)self _updateCornerRadii];
      [(SBDockView *)self _updateBackgroundUserInterfaceStyle];
      id v5 = v7;
    }
  }
}

- (double)dockHeightPadding
{
  v2 = [(SBDockView *)self _visualConfiguration];
  [v2 dockListViewInsets];
  double v4 = v3;

  return v4;
}

- (CGRect)dockListViewFrame
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  [(SBDockView *)self getDockViewMetrics:&v6];
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = *((double *)&v7 + 1);
  double v4 = *(double *)&v7;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)getDockViewMetrics:(id *)a3
{
  [(SBDockView *)self bounds];
  double x = v68.origin.x;
  double y = v68.origin.y;
  double width = v68.size.width;
  double height = v68.size.height;
  double v9 = CGRectGetWidth(v68);
  v69.origin.double x = x;
  v69.origin.double y = y;
  v69.size.double width = width;
  v69.size.double height = height;
  double v10 = CGRectGetHeight(v69);
  long long v11 = [(SBDockView *)self _visualConfiguration];
  [v11 dockListViewInsets];
  SBFEdgeInsetsRelativeToRectEdge();
  double v13 = v12;
  double v15 = v14;
  double v66 = v16;
  double v64 = v17;

  v18 = [(SBDockView *)self _visualConfiguration];
  [v18 dockBackgroundViewInsets];
  SBFEdgeInsetsRelativeToRectEdge();
  double v59 = v19;
  double v54 = v21;
  double v55 = v20;
  double v57 = v22;

  [(SBDockView *)self _dockOverhangInsets];
  double v58 = v23;
  double v52 = v25;
  double v53 = v24;
  double v56 = v26;
  double v60 = v10;
  double v61 = v9;
  double v62 = x;
  double v63 = y;
  double v27 = x + v15;
  double v28 = y + v13;
  double v29 = v15 + v64;
  double v65 = width;
  double v30 = width - v29;
  double v31 = v13 + v66;
  double v67 = height;
  double v32 = height - v31;
  double v33 = v27;
  double v34 = v28;
  double v35 = v30;
  double v36 = v32;
  if (v9 >= v10)
  {
    double v51 = CGRectGetMinY(*(CGRect *)&v33) + -1.0;
    [(SBHighlightView *)self->_highlightView highlightHeight];
    double v40 = v41 + 2.0;
    double v37 = v27;
    double v39 = v30;
  }
  else
  {
    double v37 = CGRectGetMinX(*(CGRect *)&v33) + -1.0;
    [(SBHighlightView *)self->_highlightView highlightHeight];
    double v39 = v38 + 2.0;
    double v51 = v28;
    double v40 = v32;
  }
  [(SBDockView *)self dockListOffset];
  double v43 = v42;
  char IsZero = BSFloatIsZero();
  double v45 = v27 + v43;
  double v46 = v28 + v43;
  if (v61 < v60) {
    double v45 = v27;
  }
  else {
    double v46 = v28;
  }
  if (IsZero)
  {
    double v46 = v28;
    double v45 = v27;
  }
  CGFloat v47 = v62 + v55 + v53;
  CGFloat v48 = v63 + v59 + v58;
  CGFloat v49 = v65 - (v55 + v54) - (v53 + v52);
  a3->var0.origin.double x = v45;
  a3->var0.origin.double y = v46;
  a3->var0.size.double width = v30;
  a3->var0.size.double height = v32;
  a3->var1.origin.double x = v37;
  a3->var1.origin.double y = v51;
  a3->var1.size.double width = v39;
  a3->var1.size.double height = v40;
  a3->var2.origin.double x = v47;
  a3->var2.origin.double y = v48;
  CGFloat v50 = v67 - (v59 + v57) - (v58 + v56);
  a3->var2.size.double width = v49;
  a3->var2.size.double height = v50;
  a3->var3.origin.double x = v47;
  a3->var3.origin.double y = v48;
  a3->var3.size.double width = v49;
  a3->var3.size.double height = v50;
  a3->var4.origin.double x = v47;
  a3->var4.origin.double y = v48;
  a3->var4.size.double width = v49;
  a3->var4.size.double height = v50;
}

- (UIEdgeInsets)_dockOverhangInsets
{
  [(SBDockView *)self _minimumHomeScreenScale];
  double v4 = v3;
  double v6 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (![(SBDockView *)self isDockInset] && BSFloatGreaterThanFloat())
  {
    unint64_t v9 = [(SBDockView *)self dockEdge];
    [(SBDockView *)self bounds];
    CGFloat v11 = v10;
    CGFloat rect = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat rect_16 = v16;
    double v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 bounds];
    double rect_24 = v19;
    double v34 = v18;

    v35.origin.double x = v11;
    v35.origin.double y = v13;
    v35.size.double width = v15;
    v35.size.double height = rect_16;
    double rect_8 = CGRectGetWidth(v35);
    v36.origin.double x = rect;
    v36.origin.double y = v13;
    v36.size.double width = v15;
    v36.size.double height = rect_16;
    CGFloat Height = CGRectGetHeight(v36);
    double v21 = 1.0 / v4 + -1.0;
    double v22 = v21 * v34;
    double v23 = v21 * rect_24;
    if (rect_8 >= Height)
    {
      double v24 = 0.0;
      if (v9 == 1) {
        double v25 = 0.0;
      }
      else {
        double v25 = v23;
      }
      double v8 = v8 - v25;
      if (v9 == 1) {
        double v24 = v23;
      }
      double v6 = v6 - v24;
      double v5 = v5 - v22 * 0.5;
      double v7 = v7 - v22 * 0.5;
    }
    else
    {
      if (v9 == 2) {
        double v5 = -v22;
      }
      else {
        double v7 = -v22;
      }
      double v8 = v23 * -0.5;
      double v6 = v23 * -0.5;
    }
  }
  double v26 = v6;
  double v27 = v5;
  double v28 = v8;
  double v29 = v7;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (void)layoutSubviews
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  [(SBDockView *)self getDockViewMetrics:&v3];
  -[SBIconListView setFrame:](self->_iconListView, "setFrame:", v3, v4);
  -[SBHighlightView sbf_setBoundsAndPositionFromFrame:](self->_highlightView, "sbf_setBoundsAndPositionFromFrame:", v5, v6);
  -[UIView sbf_setBoundsAndPositionFromFrame:](self->_backgroundView, "sbf_setBoundsAndPositionFromFrame:", v7, v8);
  -[UIView sbf_setBoundsAndPositionFromFrame:](self->_accessibilityBackgroundView, "sbf_setBoundsAndPositionFromFrame:", v11, v12);
}

- (double)_minimumHomeScreenScale
{
  long long v3 = [(SBDockView *)self delegate];
  long long v4 = v3;
  if (v3)
  {
    [v3 minimumHomeScreenScaleForDockView:self];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (void)listLayoutProviderDidChange
{
  [(SBDockView *)self _updateCornerRadii];
  [(SBDockView *)self setNeedsLayout];
  [(SBDockView *)self layoutIfNeeded];
}

- (void)_backgroundContrastDidChange:(id)a3
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  accessibilityBackgroundView = self->_accessibilityBackgroundView;
  if (IsReduceTransparencyEnabled)
  {
    if (!accessibilityBackgroundView)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      memset(v11, 0, sizeof(v11));
      [(SBDockView *)self getDockViewMetrics:v11];
      id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      long long v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", v12, v13);
      long long v8 = self->_accessibilityBackgroundView;
      self->_accessibilityBackgroundView = v7;

      [(SBDockView *)self updateAccessibilityTintColor];
      [(SBDockView *)self _updateCornerRadii];
      [(SBDockView *)self insertSubview:self->_accessibilityBackgroundView atIndex:0];
      [(UIView *)self->_backgroundView removeFromSuperview];
    }
  }
  else if (accessibilityBackgroundView)
  {
    long long v10 = self->_backgroundView;
    if (v10) {
      [(SBDockView *)self insertSubview:v10 atIndex:0];
    }
    [(UIView *)self->_accessibilityBackgroundView removeFromSuperview];
    long long v9 = self->_accessibilityBackgroundView;
    self->_accessibilityBackgroundView = 0;
  }
}

- (void)updateAccessibilityTintColor
{
  if (self->_accessibilityBackgroundView)
  {
    id v4 = [(SBDockView *)self delegate];
    long long v3 = [v4 accessibilityTintColorForDockView:self];
    if (!v3)
    {
      long long v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    }
    [(UIView *)self->_accessibilityBackgroundView setBackgroundColor:v3];
  }
}

- (void)_updateCornerRadii
{
  long long v3 = [(SBDockView *)self _visualConfiguration];
  [v3 dockBackgroundViewCornerRadius];
  double v5 = v4;

  [(UIView *)self->_backgroundView _cornerRadius];
  if (v5 != v6 || ([(UIView *)self->_accessibilityBackgroundView _cornerRadius], v5 != v7))
  {
    [(UIView *)self->_backgroundView _setContinuousCornerRadius:v5];
    [(UIView *)self->_accessibilityBackgroundView _setContinuousCornerRadius:v5];
    [(SBHighlightView *)self->_highlightView setHidden:v5 > 0.0];
    [(SBDockView *)self setNeedsLayout];
  }
}

- (void)_updateBackgroundUserInterfaceStyle
{
  id v4 = [(SBDockView *)self traitCollection];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v4);
  [(UIView *)self->_backgroundView setOverrideUserInterfaceStyle:v3];
  [(UIView *)self->_accessibilityBackgroundView setOverrideUserInterfaceStyle:v3];
  [(SBHighlightView *)self->_highlightView setOverrideUserInterfaceStyle:v3];
}

- (UIColor)accessibilityBackgroundColor
{
  return [(UIView *)self->_accessibilityBackgroundView backgroundColor];
}

- (double)_layoutScale
{
  double v2 = [(SBDockView *)self _listLayout];
  [v2 iconImageInfo];
  double v4 = v3;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)dockEdge
{
  return self->_dockEdge;
}

- (double)dockListOffset
{
  return self->_dockListOffset;
}

- (SBDockViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDockViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_accessibilityBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
}

@end