@interface _UISearchBarScopeContainerLayout
- (BOOL)hasScopeBar;
- (BOOL)isCollapsed;
- (CGRect)scopeBarLayoutFrame;
- (UIEdgeInsets)containerSpecificInsets;
- (UIEdgeInsets)defaultScopeBarInsets;
- (UIView)scopeBar;
- (_UISearchBarContainerSublayoutDelegate)delegate;
- (_UISearchBarSearchContainerLayout)neighboringSearchLayout;
- (double)naturalContainerHeight;
- (double)scopeBarOpacity;
- (double)scopeControlHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hostedScopeBarHeightForBarMetrics;
- (id)hostedScopeBarTopInsetForBarMetrics;
- (unint64_t)numberOfScopeTitles;
- (void)applyLayout;
- (void)setCollapsed:(BOOL)a3;
- (void)setDefaultScopeBarInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setHasScopeBar:(BOOL)a3;
- (void)setHostedScopeBarHeightForBarMetrics:(id)a3;
- (void)setHostedScopeBarTopInsetForBarMetrics:(id)a3;
- (void)setNeighboringSearchLayout:(id)a3;
- (void)setNumberOfScopeTitles:(unint64_t)a3;
- (void)setScopeBar:(id)a3;
- (void)updateLayout;
@end

@implementation _UISearchBarScopeContainerLayout

- (double)naturalContainerHeight
{
  if ([(_UISearchBarLayoutBase *)self isHostedByNavigationBar])
  {
    int64_t v3 = [(_UISearchBarLayoutBase *)self barMetrics];
    v4 = [(_UISearchBarScopeContainerLayout *)self hostedScopeBarHeightForBarMetrics];
    double v5 = v4[2](v4, v3);

    return v5;
  }
  else
  {
    [(_UISearchBarScopeContainerLayout *)self scopeControlHeight];
    double v8 = v7;
    [(_UISearchBarScopeContainerLayout *)self containerSpecificInsets];
    return v10 + v8 + v9;
  }
}

- (void)setScopeBar:(id)a3
{
}

- (void)setNumberOfScopeTitles:(unint64_t)a3
{
  if (self->_numberOfScopeTitles != a3)
  {
    self->_numberOfScopeTitles = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setNeighboringSearchLayout:(id)a3
{
}

- (void)setHostedScopeBarTopInsetForBarMetrics:(id)a3
{
}

- (void)setHostedScopeBarHeightForBarMetrics:(id)a3
{
}

- (void)setHasScopeBar:(BOOL)a3
{
  if (self->_hasScopeBar != a3)
  {
    self->_hasScopeBar = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setDefaultScopeBarInsets:(UIEdgeInsets)a3
{
  self->_defaultScopeBarInsets = a3;
}

- (id)hostedScopeBarHeightForBarMetrics
{
  return self->_hostedScopeBarHeightForBarMetrics;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hostedScopeBarTopInsetForBarMetrics, 0);
  objc_storeStrong(&self->_hostedScopeBarHeightForBarMetrics, 0);
  objc_storeStrong((id *)&self->_scopeBar, 0);
  objc_storeStrong((id *)&self->_neighboringSearchLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CGRect)scopeBarLayoutFrame
{
  [(_UISearchBarLayoutBase *)self updateLayoutIfNeeded];
  double x = self->_scopeBarLayoutFrame.origin.x;
  double y = self->_scopeBarLayoutFrame.origin.y;
  double width = self->_scopeBarLayoutFrame.size.width;
  double height = self->_scopeBarLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)containerSpecificInsets
{
  [(_UISearchBarLayoutBase *)self contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  if ([(_UISearchBarLayoutBase *)self isHostedByNavigationBar])
  {
    int64_t v9 = [(_UISearchBarLayoutBase *)self barMetrics];
    double v10 = [(_UISearchBarScopeContainerLayout *)self hostedScopeBarTopInsetForBarMetrics];
    double v11 = v10[2](v10, v9);
  }
  else
  {
    [(_UISearchBarScopeContainerLayout *)self defaultScopeBarInsets];
    double v11 = v12;
    [(_UISearchBarScopeContainerLayout *)self defaultScopeBarInsets];
    double v6 = v13;
  }
  double v14 = v11;
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)scopeControlHeight
{
  int64_t v3 = [(_UISearchBarLayoutBase *)self barMetrics];
  BOOL v4 = [(_UISearchBarLayoutBase *)self isHostedByNavigationBar];
  BOOL v6 = (v3 == 1 || v3 == 102) && v4;
  +[UISegmentedControl defaultHeightForStyle:7 size:v6];
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UISearchBarScopeContainerLayout;
  BOOL v4 = [(_UISearchBarLayoutBase *)&v11 copyWithZone:a3];
  double v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 12, self->_scopeBar);
    *((unsigned char *)v5 + 73) = self->_hasScopeBar;
    v5[13] = self->_numberOfScopeTitles;
    long long v6 = *(_OWORD *)&self->_defaultScopeBarInsets.bottom;
    *(_OWORD *)(v5 + 21) = *(_OWORD *)&self->_defaultScopeBarInsets.top;
    *(_OWORD *)(v5 + 23) = v6;
    uint64_t v7 = [self->_hostedScopeBarHeightForBarMetrics copy];
    id v8 = v5[14];
    v5[14] = (id)v7;

    CGSize size = self->_scopeBarLayoutFrame.size;
    *(CGPoint *)(v5 + 17) = self->_scopeBarLayoutFrame.origin;
    *(CGSize *)(v5 + 19) = size;
    v5[16] = *(id *)&self->_scopeBarOpacity;
  }
  return v5;
}

- (void)updateLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained containerLayoutWillUpdateLayout:self];

  [(_UISearchBarLayoutBase *)self layoutSize];
  double v5 = v4;
  double v7 = v6;
  BOOL v8 = [(_UISearchBarLayoutBase *)self isLayoutRTL];
  [(_UISearchBarScopeContainerLayout *)self containerSpecificInsets];
  double v10 = v9;
  double v12 = v11;
  double v46 = v5 - v11 - v13;
  [(_UISearchBarScopeContainerLayout *)self scopeControlHeight];
  CGFloat v48 = v14;
  -[UIView sizeThatFits:](self->_scopeBar, "sizeThatFits:", v5, v7);
  double v16 = v15 + (double)self->_numberOfScopeTitles * 78.0;
  [(_UISearchBarSearchContainerLayout *)self->_neighboringSearchLayout visibleCancelButtonSearchFieldLayoutFrame];
  double v21 = v17;
  CGFloat v22 = v18;
  CGFloat v23 = v19;
  neighboringSearchLayout = self->_neighboringSearchLayout;
  CGFloat v25 = v12;
  if (!neighboringSearchLayout) {
    double v17 = v12;
  }
  CGFloat v47 = v10;
  if (!neighboringSearchLayout) {
    double v18 = v10;
  }
  CGFloat v26 = v46;
  CGFloat v27 = v20;
  if (!neighboringSearchLayout) {
    double v19 = v46;
  }
  double v28 = v48;
  if (neighboringSearchLayout) {
    double v28 = v27;
  }
  if (v16 < CGRectGetWidth(*(CGRect *)&v17))
  {
    CGFloat v45 = v21;
    double v29 = round((v5 - v16) * 0.5);
    if (!self->_neighboringSearchLayout) {
      goto LABEL_15;
    }
    double v30 = v29;
    if (v8)
    {
      CGFloat v31 = v47;
      CGFloat v32 = v48;
      double v33 = v16;
      double MinX = CGRectGetMinX(*(CGRect *)&v30);
      v49.origin.double x = v45;
      v49.origin.double y = v22;
      v49.size.double width = v23;
      v49.size.double height = v27;
      if (MinX < CGRectGetMinX(v49) + 20.0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    CGFloat v35 = v47;
    CGFloat v36 = v48;
    double v37 = v16;
    double MaxX = CGRectGetMaxX(*(CGRect *)&v30);
    v50.origin.double x = v45;
    v50.origin.double y = v22;
    v50.size.double width = v23;
    v50.size.double height = v27;
    if (MaxX <= CGRectGetMaxX(v50) + -20.0)
    {
LABEL_15:
      CGFloat v25 = v29;
      CGFloat v26 = v16;
    }
  }
LABEL_16:
  self->_scopeBarLayoutFrame.origin.double x = v25;
  self->_scopeBarLayoutFrame.origin.double y = v47;
  self->_scopeBarLayoutFrame.size.double width = v26;
  self->_scopeBarLayoutFrame.size.double height = v48;
  v39 = self->_neighboringSearchLayout;
  double v40 = 1.0;
  if (v39)
  {
    if (![(_UISearchBarSearchContainerLayout *)v39 allowSearchFieldShrinkage])
    {
      double MaxY = CGRectGetMaxY(self->_scopeBarLayoutFrame);
      [(_UISearchBarScopeContainerLayout *)self naturalContainerHeight];
      double v43 = v42 - MaxY;
      [(_UISearchBarLayoutBase *)self layoutSize];
      if (v44 - MaxY < v43) {
        double v40 = 1.0 - (v43 - (v44 - MaxY)) / v43;
      }
    }
  }
  self->_scopeBarOpacitdouble y = v40;
}

- (void)applyLayout
{
  [(_UISearchBarScopeContainerLayout *)self scopeBarLayoutFrame];
  -[UIView setFrame:](self->_scopeBar, "setFrame:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained isHostingNavBarTransitionActive];

  if ((v4 & 1) == 0)
  {
    [(_UISearchBarScopeContainerLayout *)self scopeBarOpacity];
    scopeBar = self->_scopeBar;
    -[UIView setAlpha:](scopeBar, "setAlpha:");
  }
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)_UISearchBarScopeContainerLayout;
  int64_t v3 = [(_UISearchBarLayoutBase *)&v15 description];
  if (os_variant_has_internal_diagnostics())
  {
    if (!self->_hasScopeBar)
    {
      uint64_t v5 = [v3 stringByAppendingString:@" [no scopeBar]"];

      int64_t v3 = (void *)v5;
    }
    if (self->_collapsed)
    {
      uint64_t v6 = [v3 stringByAppendingString:@" collapsed"];

      int64_t v3 = (void *)v6;
    }
    double v7 = v3;
    [(_UISearchBarScopeContainerLayout *)self naturalContainerHeight];
    int64_t v3 = objc_msgSend(v3, "stringByAppendingFormat:", @" naturalContainerHeight=%g", v8);

    [(_UISearchBarScopeContainerLayout *)self containerSpecificInsets];
    if (v10 != 0.0 || v9 != 0.0 || v12 != 0.0 || v11 != 0.0)
    {
      uint64_t v13 = [v3 stringByAppendingFormat:@" containerSpecificInsets={%g, %g, %g, %g}", *(void *)&v9, *(void *)&v10, *(void *)&v11, *(void *)&v12];

      int64_t v3 = (void *)v13;
    }
    if (self->_hasScopeBar)
    {
      double v14 = objc_msgSend(v3, "stringByAppendingFormat:", @" numberOfScopeTitles=%lu scopeBar=%p", self->_numberOfScopeTitles, self->_scopeBar);

      if ([(_UISearchBarLayoutBase *)self isLayoutValid])
      {
        objc_msgSend(v14, "stringByAppendingFormat:", @" scopeBarLayoutFrame=(%g, %g; %g, %g) opacity=%g",
          *(void *)&self->_scopeBarLayoutFrame.origin.x,
          *(void *)&self->_scopeBarLayoutFrame.origin.y,
          *(void *)&self->_scopeBarLayoutFrame.size.width,
          *(void *)&self->_scopeBarLayoutFrame.size.height,
        int64_t v3 = *(void *)&self->_scopeBarOpacity);
      }
      else
      {
        int64_t v3 = v14;
      }
    }
  }
  return v3;
}

- (_UISearchBarContainerSublayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISearchBarContainerSublayoutDelegate *)WeakRetained;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (_UISearchBarSearchContainerLayout)neighboringSearchLayout
{
  return self->_neighboringSearchLayout;
}

- (UIView)scopeBar
{
  return self->_scopeBar;
}

- (BOOL)hasScopeBar
{
  return self->_hasScopeBar;
}

- (unint64_t)numberOfScopeTitles
{
  return self->_numberOfScopeTitles;
}

- (UIEdgeInsets)defaultScopeBarInsets
{
  double top = self->_defaultScopeBarInsets.top;
  double left = self->_defaultScopeBarInsets.left;
  double bottom = self->_defaultScopeBarInsets.bottom;
  double right = self->_defaultScopeBarInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)hostedScopeBarTopInsetForBarMetrics
{
  return self->_hostedScopeBarTopInsetForBarMetrics;
}

- (double)scopeBarOpacity
{
  return self->_scopeBarOpacity;
}

@end