@interface CarUserTrackingButton
+ (CarUserTrackingButton)buttonWithUserTrackingView:(id)a3;
- (BOOL)_isHighlightedForState:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)needsContinuousRoundedCorners;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CarUserTrackingButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchInsets;
- (double)roundedCornerRadius;
- (int64_t)_activityIndicatorStyle;
- (unint64_t)behavior;
- (unint64_t)roundedCorners;
- (void)_updateColors;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarUserTrackingButton

+ (CarUserTrackingButton)buttonWithUserTrackingView:(id)a3
{
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CarUserTrackingButton;
  v3 = [super buttonWithUserTrackingView:a3 withType:0];
  [v3 setAccessibilityIdentifier:@"CarUserTrackingButton"];
  [v3 _setSelectsWhenTracking:0];
  v4 = +[UIImage _mapsCar_systemImageNamed:@"location" textStyle:UIFontTextStyleSubheadline];
  [v3 _setImage:v4 forUserTrackingMode:0 controlState:0];

  v5 = +[UIImage _mapsCar_systemImageNamed:@"location.fill" textStyle:UIFontTextStyleSubheadline];
  [v3 _setImage:v5 forUserTrackingMode:1 controlState:0];

  v6 = +[UIImage _mapsCar_systemImageNamed:@"location.north.line.fill" textStyle:UIFontTextStyleSubheadline];
  [v3 _setImage:v6 forUserTrackingMode:2 controlState:0];

  v7 = [v3 imageView];
  [v7 setContentMode:1];

  uint64_t v8 = [v3 _mapsCar_injectBlurView];
  v9 = (void *)v3[6];
  v3[6] = v8;

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"CarPlay_Location" value:@"localized string not found" table:0];
  v17[0] = v11;
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"CarPlay_Tracking" value:@"localized string not found" table:0];
  v17[1] = v13;
  v14 = +[NSArray arrayWithObjects:v17 count:2];
  [v3 setAccessibilityUserInputLabels:v14];

  return (CarUserTrackingButton *)v3;
}

- (CarUserTrackingButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CarUserTrackingButton;
  v3 = -[CarUserTrackingButton initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarUserTrackingButton *)v3 _updateColors];
    v5 = [(CarUserTrackingButton *)v4 heightAnchor];
    id v6 = [(CarUserTrackingButton *)v4 roundedCorners];
    double v7 = 33.0;
    if (v6 == (id)15) {
      double v7 = 28.0;
    }
    uint64_t v8 = [v5 constraintEqualToConstant:v7];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v8;

    v10 = [(CarUserTrackingButton *)v4 widthAnchor];
    v11 = [v10 constraintEqualToConstant:28.0];
    v15[0] = v11;
    v15[1] = v4->_heightConstraint;
    v12 = +[NSArray arrayWithObjects:v15 count:2];
    +[NSLayoutConstraint activateConstraints:v12];
  }
  return v4;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarUserTrackingButton;
  [(CarUserTrackingButton *)&v4 didMoveToWindow];
  v3 = [(CarUserTrackingButton *)self window];

  if (v3) {
    [(CarUserTrackingButton *)self _updateColors];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarUserTrackingButton;
  id v4 = a3;
  [(CarUserTrackingButton *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  id v6 = [(CarUserTrackingButton *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(CarUserTrackingButton *)self _updateColors];
  }
}

- (void)setRoundedCorners:(unint64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    double v3 = 33.0;
    if (a3 == 15) {
      double v3 = 28.0;
    }
    [(NSLayoutConstraint *)self->_heightConstraint setConstant:v3];
  }
}

- (void)_updateColors
{
  if ([(CarUserTrackingButton *)self isFocused]) {
    +[UIColor _carSystemFocusLabelColor];
  }
  else {
  double v3 = +[UIColor _carSystemFocusColor];
  }
  [(CarUserTrackingButton *)self setTintColor:v3];

  if ([(CarUserTrackingButton *)self isFocused]) {
    +[UIColor _carSystemFocusColor];
  }
  else {
  id v5 = +[UIColor clearColor];
  }
  id v4 = [(CarDynamicBlurView *)self->_blurView contentView];
  [v4 setBackgroundColor:v5];
}

- (int64_t)_activityIndicatorStyle
{
  return 21;
}

- (BOOL)_isHighlightedForState:(int64_t)a3
{
  return 0;
}

- (unint64_t)behavior
{
  return 1;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CarUserTrackingButton;
  [(CarUserTrackingButton *)&v9 layoutSubviews];
  [(CarUserTrackingButton *)self bounds];
  if (!CGRectEqualToRect(v10, self->_lastBounds) || self->_roundedCorners != self->_lastRoundedCorners)
  {
    blurView = self->_blurView;
    [(CarUserTrackingButton *)self roundedCornerRadius];
    [(CarDynamicBlurView *)blurView _setCornerRadius:[(CarUserTrackingButton *)self needsContinuousRoundedCorners] continuous:self->_roundedCorners & 0xF maskedCorners:v4];
    [(CarUserTrackingButton *)self bounds];
    self->_lastBounds.origin.x = v5;
    self->_lastBounds.origin.y = v6;
    self->_lastBounds.size.width = v7;
    self->_lastBounds.size.height = v8;
    self->_lastRoundedCorners = self->_roundedCorners;
  }
}

- (double)roundedCornerRadius
{
  return 14.0;
}

- (BOOL)needsContinuousRoundedCorners
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CarUserTrackingButton *)self _updateColors];

  +[CATransaction commit];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CarUserTrackingButton *)self bounds];
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchInsets.right);
  double v16 = v15 - (top + self->_touchInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end