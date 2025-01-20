@interface BatteryIconView
+ (id)batteryIconWithLevel:(unint64_t)a3;
- (BatteryIconView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (unint64_t)level;
- (void)_setupConstraints;
- (void)setLevel:(unint64_t)a3;
@end

@implementation BatteryIconView

- (BatteryIconView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BatteryIconView;
  v3 = -[BatteryIconView initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    v5 = +[UIImage imageNamed:@"batteryOutline"];
    v6 = [v5 imageWithRenderingMode:2];
    v7 = (UIImageView *)[v4 initWithImage:v6];
    outlineView = v3->_outlineView;
    v3->_outlineView = v7;

    [(UIImageView *)v3->_outlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BatteryIconView *)v3 addSubview:v3->_outlineView];
    id v9 = objc_alloc((Class)UIImageView);
    v10 = +[UIImage imageNamed:@"batteryFill"];
    v11 = [v10 imageWithRenderingMode:2];
    v12 = (UIImageView *)[v9 initWithImage:v11];
    levelView = v3->_levelView;
    v3->_levelView = v12;

    [(UIImageView *)v3->_levelView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BatteryIconView *)v3 addSubview:v3->_levelView];
    [(BatteryIconView *)v3 _setupConstraints];
    [(BatteryIconView *)v3 setLevel:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (void)_setupConstraints
{
  v3 = +[NSMutableArray array];
  id v4 = [(UIImageView *)self->_outlineView _maps_constraintsForCenteringInView:self];
  [v3 addObjectsFromArray:v4];

  v5 = [(UIImageView *)self->_levelView widthAnchor];
  v6 = [v5 constraintEqualToConstant:17.0];
  fillWidthConstraint = self->_fillWidthConstraint;
  self->_fillWidthConstraint = v6;

  v18 = [(UIImageView *)self->_levelView topAnchor];
  v17 = [(UIImageView *)self->_outlineView topAnchor];
  v8 = [v18 constraintEqualToAnchor:v17 constant:2.0];
  v19[0] = v8;
  id v9 = [(UIImageView *)self->_levelView leftAnchor];
  v10 = [(UIImageView *)self->_outlineView leftAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:2.0];
  v19[1] = v11;
  v12 = [(UIImageView *)self->_outlineView bottomAnchor];
  v13 = [(UIImageView *)self->_levelView bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:2.0];
  objc_super v15 = self->_fillWidthConstraint;
  v19[2] = v14;
  v19[3] = v15;
  v16 = +[NSArray arrayWithObjects:v19 count:4];
  [v3 addObjectsFromArray:v16];

  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)setLevel:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a3 < 0x65)
  {
    if (self->_level != a3)
    {
      self->_level = a3;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v6 = 17.0;
        unint64_t v3 = 100;
      }
      else
      {
        double v6 = fmax((double)a3 / 100.0 * 17.0, 4.0);
      }
      [(NSLayoutConstraint *)self->_fillWidthConstraint setConstant:v6];
      id v7 = +[VehicleBatteryView colorForBatteryLevel:v3];
      [(UIImageView *)self->_levelView setTintColor:v7];
      [(UIImageView *)self->_outlineView setTintColor:v7];
      [(BatteryIconView *)self setNeedsLayout];
    }
  }
  else
  {
    v5 = sub_1000519B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Tried to set %lu level on the battery view.", buf, 0xCu);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 24.0;
  double v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)batteryIconWithLevel:(unint64_t)a3
{
  id v4 = -[BatteryIconView initWithFrame:]([BatteryIconView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BatteryIconView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BatteryIconView *)v4 setLevel:a3];
  v5 = [(BatteryIconView *)v4 widthAnchor];
  double v6 = [v5 constraintEqualToConstant:24.0];
  [(BatteryIconView *)v4 addConstraint:v6];

  id v7 = [(BatteryIconView *)v4 heightAnchor];
  v8 = [v7 constraintEqualToConstant:11.0];
  [(BatteryIconView *)v4 addConstraint:v8];

  [(BatteryIconView *)v4 setNeedsLayout];
  [(BatteryIconView *)v4 layoutIfNeeded];
  unint64_t v9 = [(BatteryIconView *)v4 traitCollection];
  [v9 displayScale];
  CGFloat v11 = v10;
  v15.width = 24.0;
  v15.height = 11.0;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v11);

  -[BatteryIconView drawViewHierarchyInRect:afterScreenUpdates:](v4, "drawViewHierarchyInRect:afterScreenUpdates:", 1, 0.0, 0.0, 24.0, 11.0);
  v12 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v12;
}

- (unint64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillWidthConstraint, 0);
  objc_storeStrong((id *)&self->_levelView, 0);

  objc_storeStrong((id *)&self->_outlineView, 0);
}

@end