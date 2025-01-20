@interface UITableViewCellReorderControl
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)shouldTrack;
- (BOOL)wantsMaskingWhileAnimatingDisabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)accessoryTintColor;
- (UITableViewCellReorderControl)initWithTableViewCell:(id)a3;
- (id)_imageView;
- (id)grabberImage;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateImageView;
- (void)adjustLayoutForFocalRect:(CGRect)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAccessoryTintColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTracking:(BOOL)a3;
@end

@implementation UITableViewCellReorderControl

- (id)grabberImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v4 = [WeakRetained _reorderControlImage];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    accessoryTintColor = self->_accessoryTintColor;
    if (accessoryTintColor)
    {
      v8 = accessoryTintColor;
    }
    else
    {
      v9 = [WeakRetained _tableView];
      v8 = [v9 _accessoryBaseColor];
    }
    v10 = [WeakRetained _constants];
    v11 = [WeakRetained traitCollection];
    objc_msgSend(v10, "defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:", v11, v8, -[UIControl isTracking](self, "isTracking"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (UITableViewCellReorderControl)initWithTableViewCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 _constants];
  id v6 = [v4 _tableView];
  v7 = [v6 _accessoryBaseColor];
  [v5 defaultReorderControlSizeForCell:v4 withAccessoryBaseColor:v7];
  double v9 = v8;
  double v11 = v10;

  v28.receiver = self;
  v28.super_class = (Class)UITableViewCellReorderControl;
  v12 = -[UIControl initWithFrame:](&v28, sel_initWithFrame_, 0.0, 0.0, v9, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_cell, v4);
    [(UIView *)v13 setOpaque:0];
    [(UIView *)v13 setExclusiveTouch:1];
    [(UIView *)v13 setAutoresizingMask:1];
    [(UIView *)v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(UITableViewCellReorderControl *)v13 grabberImage];
    [v22 size];
    v25 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", round(v15 + (v19 - v23) * 0.5), round(v17 + (v21 - v24) * 0.5), v23, v24);
    [(UIImageView *)v25 setImage:v22];
    [(UIView *)v13 addSubview:v25];
    imageView = v13->_imageView;
    v13->_imageView = v25;

    v13->_focalY = NAN;
    v13->_focalHeight = NAN;
  }
  return v13;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  [(UIView *)self frame];
  double v5 = v4;
  double v6 = height;
  result.CGFloat height = v6;
  result.width = v5;
  return result;
}

- (void)adjustLayoutForFocalRect:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  IsEmptdouble y = CGRectIsEmpty(a3);
  double v7 = NAN;
  if (IsEmpty) {
    double v8 = NAN;
  }
  else {
    double v8 = y;
  }
  if (!IsEmpty) {
    double v7 = height;
  }
  self->_focalY = v8;
  self->_focalHeight = v7;
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  double v9 = self->_imageView;
  [(UIView *)v9 frame];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self bounds];
  -[UIImageView setFrame:](v9, "setFrame:", round(v8 + (v7 - v4) * 0.5), round(self->_focalY + (self->_focalHeight - v6) * 0.5), v4, v6);
}

- (void)_updateImageView
{
  id v3 = [(UITableViewCellReorderControl *)self grabberImage];
  [(UIImageView *)self->_imageView setImage:v3];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellReorderControl;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self layoutBelowIfNeeded];
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return 0;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellReorderControl;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(UITableViewCellReorderControl *)self _updateImageView];
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_accessoryTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    [(UITableViewCellReorderControl *)self _updateImageView];
  }
}

- (void)setTracking:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellReorderControl;
  [(UIControl *)&v4 setTracking:a3];
  [(UITableViewCellReorderControl *)self _updateImageView];
}

- (BOOL)shouldTrack
{
  if ([(UIControl *)self isTracking]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  char v5 = [WeakRetained _isReorderControlActive];

  return v5;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(UITableViewCellReorderControl *)self setTracking:1];
  [v5 locationInView:self];
  self->_downPoint.x = v6;
  self->_downPoint.double y = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  LOBYTE(self) = [WeakRetained _grabberBeganReorder:self touch:v5];

  return (char)self;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_cell = &self->_cell;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_cell);
  [v6 locationInView:self];
  double v9 = round(v8 - self->_downPoint.y);
  *(float *)&double v9 = v9;
  [WeakRetained _grabberDragged:self yDelta:v6 touch:v9];

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[UITableViewCellReorderControl setTracking:](self, "setTracking:", 0, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  [WeakRetained _grabberReleased:self];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  if ([(UIControl *)self isTracking]) {
    [(UITableViewCellReorderControl *)self endTrackingWithTouch:0 withEvent:v4];
  }
}

- (id)_imageView
{
  return self->_imageView;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end