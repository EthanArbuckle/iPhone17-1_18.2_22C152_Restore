@interface MTTableView
- (BOOL)adjustContentOffsetForRefreshControlAsNeeded;
- (BOOL)allowsFooterViewsToFloat;
- (BOOL)disableRefreshControlWhileEditing;
- (BOOL)sectionFooterFloatingDisabled;
- (UIColor)bottomFillColor;
- (UIEdgeInsets)insetsFromRefreshControl;
- (UIView)overlayView;
- (id)preferredFocusEnvironments;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)disablePullToRefresh;
- (void)enablePullToRefresh;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustContentOffsetForRefreshControlAsNeeded:(BOOL)a3;
- (void)setBottomFillColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDisableRefreshControlWhileEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setOverlayView:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setSectionFooterFloatingDisabled:(BOOL)a3;
- (void)setTableFooterView:(id)a3;
- (void)updateRefreshControlEnabledState;
@end

@implementation MTTableView

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)MTTableView;
  [(MTTableView *)&v37 layoutSubviews];
  if (self->_bottomFillView)
  {
    BOOL v3 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:0];
    [(MTTableView *)self bounds];
    double x = v38.origin.x;
    CGFloat y = v38.origin.y;
    double width = v38.size.width;
    CGFloat height = v38.size.height;
    double MaxY = CGRectGetMaxY(v38);
    v9 = [(MTTableView *)self tableHeaderView];
    [v9 frame];
    double v10 = CGRectGetMaxY(v39);

    v40.origin.double x = x;
    v40.origin.CGFloat y = y;
    v40.size.double width = width;
    v40.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v40);
    if (v10 >= MinY) {
      double v12 = v10;
    }
    else {
      double v12 = MinY;
    }
    v41.origin.double x = x;
    v41.origin.CGFloat y = v12;
    v41.size.double width = width;
    v41.size.CGFloat height = height;
    -[UIView setFrame:](self->_bottomFillView, "setFrame:", x, v12, width, (MaxY - CGRectGetMinY(v41)) * 1.5);
    v13 = [(MTTableView *)self backgroundView];

    bottomFillView = self->_bottomFillView;
    if (v13)
    {
      v15 = [(MTTableView *)self backgroundView];
      [(MTTableView *)self insertSubview:bottomFillView aboveSubview:v15];
    }
    else
    {
      [(MTTableView *)self sendSubviewToBack:self->_bottomFillView];
    }
    +[UIView setAnimationsEnabled:v3];
  }
  if (self->_overlayView)
  {
    -[MTTableView bringSubviewToFront:](self, "bringSubviewToFront:");
    [(MTTableView *)self bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    [(MTTableView *)self contentInset];
    overlayView = self->_overlayView;
    double v26 = -v25;
    v42.origin.double x = v17;
    v42.origin.CGFloat y = v19;
    v42.size.double width = v21;
    v42.size.CGFloat height = v23;
    double v27 = CGRectGetWidth(v42);
    v43.origin.double x = v17;
    v43.origin.CGFloat y = v19;
    v43.size.double width = v21;
    v43.size.CGFloat height = v23;
    -[UIView setFrame:](overlayView, "setFrame:", 0.0, v26, v27, CGRectGetHeight(v43));
  }
  v28 = [(MTTableView *)self refreshControl];
  if ([v28 isRefreshing])
  {
    unsigned int v29 = [(MTTableView *)self adjustContentOffsetForRefreshControlAsNeeded];

    if (v29)
    {
      [(MTTableView *)self contentOffset];
      double v31 = v30;
      v32 = [(MTTableView *)self refreshControl];
      [v32 frame];
      double v33 = v31 - CGRectGetHeight(v44);
      [(MTTableView *)self contentInset];
      double v35 = -v34;

      if (v33 == v35)
      {
        [(MTTableView *)self contentInset];
        -[MTTableView setContentOffset:](self, "setContentOffset:", 0.0, -v36);
      }
    }
  }
  else
  {
  }
}

- (void)setTableFooterView:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTableView *)self tableFooterView];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTTableView;
    [(MTTableView *)&v6 setTableFooterView:v4];
  }
}

- (void)setOverlayView:(id)a3
{
  id v4 = (UIView *)a3;
  [(UIView *)self->_overlayView removeFromSuperview];
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  objc_super v6 = v4;

  [(MTTableView *)self addSubview:v6];
}

- (void)setBottomFillColor:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_bottomFillColor, a3);
  [(UIView *)self->_bottomFillView removeFromSuperview];
  bottomFillView = self->_bottomFillView;
  if (!bottomFillView)
  {
    id v6 = objc_alloc((Class)UIView);
    [(MTTableView *)self bounds];
    v7 = [v6 initWithFrame:];
    v8 = self->_bottomFillView;
    self->_bottomFillView = v7;

    bottomFillView = self->_bottomFillView;
  }
  [(UIView *)bottomFillView setBackgroundColor:v9];
  [(MTTableView *)self addSubview:self->_bottomFillView];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTTableView;
  [(MTTableView *)&v5 setEditing:a3 animated:a4];
  [(MTTableView *)self updateRefreshControlEnabledState];
}

- (void)setDisableRefreshControlWhileEditing:(BOOL)a3
{
  if (self->_disableRefreshControlWhileEditing != a3)
  {
    self->_disableRefreshControlWhileEditing = a3;
    [(MTTableView *)self updateRefreshControlEnabledState];
  }
}

- (void)updateRefreshControlEnabledState
{
  if ([(MTTableView *)self disableRefreshControlWhileEditing]
    && [(MTTableView *)self isEditing])
  {
    [(MTTableView *)self disablePullToRefresh];
  }
  else
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      id v4 = [(UIRefreshControl *)refreshControl superview];

      if (!v4)
      {
        [(MTTableView *)self enablePullToRefresh];
      }
    }
  }
}

- (void)disablePullToRefresh
{
  v2.receiver = self;
  v2.super_class = (Class)MTTableView;
  [(MTTableView *)&v2 setRefreshControl:0];
}

- (void)enablePullToRefresh
{
  if (![(MTTableView *)self disableRefreshControlWhileEditing]
    || ([(MTTableView *)self isEditing] & 1) == 0)
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      id v4 = [(UIRefreshControl *)refreshControl superview];

      if (v4)
      {
        objc_super v5 = self->_refreshControl;
        v6.receiver = self;
        v6.super_class = (Class)MTTableView;
        [(MTTableView *)&v6 setRefreshControl:v5];
      }
    }
  }
}

- (void)setRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControl, a3);
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTTableView;
  [(MTTableView *)&v6 setRefreshControl:v5];

  [(MTTableView *)self updateRefreshControlEnabledState];
}

- (UIEdgeInsets)insetsFromRefreshControl
{
  BOOL v3 = [(MTTableView *)self refreshControl];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MTTableView *)self refreshControl];
    [v5 _appliedInsets];
    CGFloat top = v6;
    CGFloat left = v8;
    CGFloat bottom = v10;
    CGFloat right = v12;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }
  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView setContentInset:](&v3, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setContentSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView setContentSize:](&v3, "setContentSize:", a3.width, a3.height);
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  [(MTTableView *)&v3 encodeRestorableStateWithCoder:a3];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  [(MTTableView *)&v3 decodeRestorableStateWithCoder:a3];
}

- (id)preferredFocusEnvironments
{
  v12.receiver = self;
  v12.super_class = (Class)MTTableView;
  uint64_t v3 = [(MTTableView *)&v12 preferredFocusEnvironments];
  char v4 = (void *)v3;
  id v5 = &__NSArray0__struct;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  v7 = [(MTTableView *)self tableHeaderView];
  unsigned int v8 = [v7 canBecomeFocused];

  if (v8)
  {
    id v9 = [v6 mutableCopy];
    double v10 = [(MTTableView *)self tableHeaderView];
    [v9 insertObject:v10 atIndex:0];

    id v6 = v9;
  }

  return v6;
}

- (BOOL)allowsFooterViewsToFloat
{
  if ([(MTTableView *)self sectionFooterFloatingDisabled]) {
    return 0;
  }

  return [(MTTableView *)self _headerAndFooterViewsFloat];
}

- (UIColor)bottomFillColor
{
  return self->_bottomFillColor;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)sectionFooterFloatingDisabled
{
  return self->_sectionFooterFloatingDisabled;
}

- (void)setSectionFooterFloatingDisabled:(BOOL)a3
{
  self->_sectionFooterFloatingDisabled = a3;
}

- (BOOL)adjustContentOffsetForRefreshControlAsNeeded
{
  return self->_adjustContentOffsetForRefreshControlAsNeeded;
}

- (void)setAdjustContentOffsetForRefreshControlAsNeeded:(BOOL)a3
{
  self->_adjustContentOffsetForRefreshControlAsNeeded = a3;
}

- (BOOL)disableRefreshControlWhileEditing
{
  return self->_disableRefreshControlWhileEditing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_bottomFillColor, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_emptyCircleImage, 0);
  objc_storeStrong((id *)&self->_bottomFillView, 0);

  objc_storeStrong((id *)&self->_presentationPath, 0);
}

@end