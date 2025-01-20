@interface _UIStatusBarSensorActivityView
- (CGSize)intrinsicContentSize;
- (UIView)sensorActivityView;
- (_UIPortalView)portalView;
- (int64_t)iconSize;
- (void)applyStyleAttributes:(id)a3;
- (void)configurePortalViewIfNeededForTargetScreen:(id)a3;
- (void)configureSensorViewWithoutPortalIfNeededForTargetScreen:(id)a3;
- (void)layoutSubviews;
- (void)setIconSize:(int64_t)a3;
- (void)setPortalView:(id)a3;
- (void)setSensorActivityView:(id)a3;
@end

@implementation _UIStatusBarSensorActivityView

- (void)configureSensorViewWithoutPortalIfNeededForTargetScreen:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v4 = +[_UIStatusBar sensorActivityIndicatorForScreen:a3];
  v5 = [(_UIStatusBarSensorActivityView *)self sensorActivityView];
  v6 = v5;
  if (v4)
  {

    if (v6 != v4)
    {
      v7 = [(_UIStatusBarSensorActivityView *)self sensorActivityView];
      [v7 removeFromSuperview];
    }
    [(_UIStatusBarSensorActivityView *)self setSensorActivityView:v4];
    v8 = [(_UIStatusBarSensorActivityView *)self sensorActivityView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(UIView *)self addSubview:v4];
    v18 = (void *)MEMORY[0x1E4F5B268];
    v19 = [(_UIStatusBarSensorActivityView *)self sensorActivityView];
    v9 = [v19 centerXAnchor];
    v10 = [(UIView *)self centerXAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v20[0] = v11;
    v12 = [(_UIStatusBarSensorActivityView *)self sensorActivityView];
    v13 = [v12 centerYAnchor];
    v14 = [(UIView *)self centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v20[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v18 activateConstraints:v16];

    [(UIView *)self invalidateIntrinsicContentSize];
  }
  else
  {

    if (v6)
    {
      v17 = [(_UIStatusBarSensorActivityView *)self sensorActivityView];
      [v17 removeFromSuperview];

      [(_UIStatusBarSensorActivityView *)self setSensorActivityView:0];
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v3 = [(UIView *)self _screen];
  v4 = (void *)v3;
  if (self->_portalView) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v15 = (void *)v3;
    v6 = +[_UIStatusBar sensorActivityIndicatorForScreen:v3];
    v7 = v6;
    if (v6)
    {
      [v6 bounds];
      double v9 = v8;
      double v11 = v10;
      if (self->_iconSize) {
        +[_UIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:](_UIStatusBarBatteryView, "_statusBarIntrinsicContentSizeForIconSize:");
      }
      UIRoundToViewScale(self);
      double v13 = v12;
      UIRoundToViewScale(self);
      -[_UIPortalView setFrame:](self->_portalView, "setFrame:", v13, v14, v9, v11);
    }

    v4 = v15;
  }
}

- (void)configurePortalViewIfNeededForTargetScreen:(id)a3
{
  v4 = +[_UIStatusBar sensorActivityIndicatorForScreen:a3];
  portalView = self->_portalView;
  if (v4)
  {
    double v9 = v4;
    if (portalView)
    {
      [(_UIPortalView *)portalView setSourceView:v4];
    }
    else
    {
      v7 = [[_UIPortalView alloc] initWithSourceView:v4];
      double v8 = self->_portalView;
      self->_portalView = v7;

      [(_UIPortalView *)self->_portalView setName:@"_UIStatusBarSensorActivityView.portal"];
      [(_UIPortalView *)self->_portalView setMatchesAlpha:0];
      [(UIView *)self addSubview:self->_portalView];
    }
    [(UIView *)self setNeedsLayout];
  }
  else
  {
    if (!portalView) {
      goto LABEL_9;
    }
    double v9 = 0;
    [(UIView *)portalView removeFromSuperview];
    v6 = self->_portalView;
    self->_portalView = 0;

    [(UIView *)self invalidateIntrinsicContentSize];
  }
  v4 = v9;
LABEL_9:
}

- (void)applyStyleAttributes:(id)a3
{
  uint64_t v4 = [a3 iconSize];
  int64_t iconSize = self->_iconSize;
  [(_UIStatusBarSensorActivityView *)self setIconSize:v4];
  if (self->_portalView) {
    BOOL v6 = iconSize == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  if (self->_portalView)
  {
    +[_UIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:self->_iconSize];
    double v3 = 7.0;
  }
  else
  {
    sensorActivityView = self->_sensorActivityView;
    if (sensorActivityView)
    {
      [(UIView *)sensorActivityView bounds];
      double v3 = v5;
      double v2 = v6;
    }
    else
    {
      double v3 = *MEMORY[0x1E4F1DB30];
      double v2 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  result.height = v2;
  result.width = v3;
  return result;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_int64_t iconSize = a3;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (UIView)sensorActivityView
{
  return self->_sensorActivityView;
}

- (void)setSensorActivityView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorActivityView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end