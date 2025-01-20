@interface CarFocusableControl
- (BOOL)canBecomeFocused;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CarFocusableControl)initWithFrame:(CGRect)a3;
- (UIColor)focusedBackgroundColor;
- (UIColor)focusedTintColor;
- (UIColor)unfocusedBackgroundColor;
- (UIColor)unfocusedTintColor;
- (UIEdgeInsets)roundedFocusInsets;
- (UIEdgeInsets)touchInsets;
- (id)_adjustedColor:(id)a3 forState:(unint64_t)a4;
- (id)_createFocusShapeLayer;
- (unint64_t)focusableControlStyle;
- (void)_selectButtonPressed:(id)a3;
- (void)addSubview:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusableControlStyle:(unint64_t)a3;
- (void)setFocusedBackgroundColor:(id)a3;
- (void)setFocusedTintColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedFocusInsets:(UIEdgeInsets)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setUnfocusedBackgroundColor:(id)a3;
- (void)setUnfocusedTintColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation CarFocusableControl

- (CarFocusableControl)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CarFocusableControl;
  v3 = -[CarFocusableControl initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v3 action:"_selectButtonPressed:"];
    selectButtonRecognizer = v3->_selectButtonRecognizer;
    v3->_selectButtonRecognizer = v4;

    [(UILongPressGestureRecognizer *)v3->_selectButtonRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v3->_selectButtonRecognizer setAllowedPressTypes:&off_1013ADC80];
    [(CarFocusableControl *)v3 addGestureRecognizer:v3->_selectButtonRecognizer];
    uint64_t v6 = +[UIColor _carSystemFocusLabelColor];
    focusedTintColor = v3->_focusedTintColor;
    v3->_focusedTintColor = (UIColor *)v6;

    uint64_t v8 = +[UIColor _carSystemFocusColor];
    unfocusedTintColor = v3->_unfocusedTintColor;
    v3->_unfocusedTintColor = (UIColor *)v8;

    uint64_t v10 = +[UIColor _carSystemFocusColor];
    focusedBackgroundColor = v3->_focusedBackgroundColor;
    v3->_focusedBackgroundColor = (UIColor *)v10;

    uint64_t v12 = +[UIColor clearColor];
    unfocusedBackgroundColor = v3->_unfocusedBackgroundColor;
    v3->_unfocusedBackgroundColor = (UIColor *)v12;
  }
  return v3;
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarFocusableControl;
  id v3 = a3;
  [(CarFocusableControl *)&v4 addSubview:v3];
  [v3 setUserInteractionEnabled:0];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_focusShapeLayer)
  {
    [(CarFocusableControl *)self bounds];
    if (width != v9 || height != v8)
    {
      [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
      focusShapeLayer = self->_focusShapeLayer;
      self->_focusShapeLayer = 0;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CarFocusableControl;
  -[CarFocusableControl setBounds:](&v12, "setBounds:", x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CarFocusableControl;
  id v4 = a3;
  [(CarFocusableControl *)&v9 traitCollectionDidChange:v4];
  v5 = [(CarFocusableControl *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

    [(CarFocusableControl *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)CarFocusableControl;
  [(CarFocusableControl *)&v37 layoutSubviews];
  unsigned int v3 = [(CarFocusableControl *)self isFocused];
  if (v3) {
    [(CarFocusableControl *)self focusedTintColor];
  }
  else {
  id v4 = [(CarFocusableControl *)self unfocusedTintColor];
  }
  v5 = [(CarFocusableControl *)self _adjustedColor:v4 forState:[(CarFocusableControl *)self state]];
  [(CarFocusableControl *)self setTintColor:v5];

  unint64_t v6 = [(CarFocusableControl *)self focusableControlStyle];
  if (v6)
  {
    if (v6 != 2)
    {
      if (v6 != 1) {
        return;
      }
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      if (!self->_focusShapeLayer)
      {
        id v7 = [(CarFocusableControl *)self _createFocusShapeLayer];
        focusShapeLayer = self->_focusShapeLayer;
        self->_focusShapeLayer = v7;
      }
      objc_super v9 = [(CarFocusableControl *)self layer];
      [v9 insertSublayer:self->_focusShapeLayer atIndex:0];

      [(CarFocusableControl *)self bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      [(CarFocusableControl *)self roundedFocusInsets];
      if (UIEdgeInsetsZero.left == v19
        && UIEdgeInsetsZero.top == v18
        && UIEdgeInsetsZero.right == v21
        && UIEdgeInsetsZero.bottom == v20)
      {
        UIRoundToViewScale();
        double v18 = -v22;
        double v19 = -*(double *)&qword_1015F8140;
        double v20 = v18;
        double v21 = -*(double *)&qword_1015F8140;
      }
      -[CAShapeLayer setFrame:](self->_focusShapeLayer, "setFrame:", v11 + v19, v13 + v18, v15 - (v19 + v21), v17 - (v18 + v20));
      [(CAShapeLayer *)self->_focusShapeLayer setBorderWidth:1.0];
      id v23 = +[UIColor _carSystemFocusColor];
      -[CAShapeLayer setBorderColor:](self->_focusShapeLayer, "setBorderColor:", [v23 CGColor]);

      if (v3)
      {
        id v24 = +[UIColor _carSystemFocusColor];
        -[CAShapeLayer setBackgroundColor:](self->_focusShapeLayer, "setBackgroundColor:", [v24 CGColor]);

        [(CAShapeLayer *)self->_focusShapeLayer setCornerRadius:2.0];
        uint64_t v25 = 0;
        v26 = self->_focusShapeLayer;
      }
      else
      {
        id v28 = +[UIColor clearColor];
        -[CAShapeLayer setBackgroundColor:](self->_focusShapeLayer, "setBackgroundColor:", [v28 CGColor]);

        [(CAShapeLayer *)self->_focusShapeLayer setCornerRadius:4.0];
        v26 = self->_focusShapeLayer;
        uint64_t v25 = [(CarFocusableControl *)self isSelected] ^ 1;
      }
      [(CAShapeLayer *)v26 setHidden:v25];
      goto LABEL_31;
    }
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    if (v3)
    {
      uint64_t v27 = [(CarFocusableControl *)self focusedBackgroundColor];
    }
    else
    {
      if (![(CarFocusableControl *)self isSelected]) {
        goto LABEL_30;
      }
      uint64_t v27 = +[UIColor labelColor];
    }
    v30 = (void *)v27;
    if (v27)
    {
      if (!self->_focusShapeLayer)
      {
        v31 = [(CarFocusableControl *)self _createFocusShapeLayer];
        v32 = self->_focusShapeLayer;
        self->_focusShapeLayer = v31;

        v33 = [(CarFocusableControl *)self layer];
        [v33 addSublayer:self->_focusShapeLayer];
      }
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      v34 = self->_focusShapeLayer;
      id v35 = v30;
      -[CAShapeLayer setStrokeColor:](v34, "setStrokeColor:", [v35 CGColor]);
      +[CATransaction commit];
      v36 = [(CarFocusableControl *)self layer];
      [v36 addSublayer:self->_focusShapeLayer];

      goto LABEL_31;
    }
LABEL_30:
    [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
LABEL_31:
    +[CATransaction commit];
    return;
  }
  if (v3) {
    [(CarFocusableControl *)self focusedBackgroundColor];
  }
  else {
  v29 = [(CarFocusableControl *)self unfocusedBackgroundColor];
  }
  [(CarFocusableControl *)self setBackgroundColor:v29];
}

- (void)setFocusableControlStyle:(unint64_t)a3
{
  if (self->_focusableControlStyle != a3)
  {
    self->_focusableControlStyle = a3;
    [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

    [(CarFocusableControl *)self setNeedsLayout];
  }
}

- (void)setRoundedFocusInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_roundedFocusInsets.left
    || a3.top != self->_roundedFocusInsets.top
    || a3.right != self->_roundedFocusInsets.right
    || a3.bottom != self->_roundedFocusInsets.bottom)
  {
    self->_roundedFocusInsets = a3;
    [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
    focusShapeLayer = self->_focusShapeLayer;
    self->_focusShapeLayer = 0;

    [(CarFocusableControl *)self setNeedsLayout];
  }
}

- (id)_createFocusShapeLayer
{
  unint64_t v3 = [(CarFocusableControl *)self focusableControlStyle];
  if (v3 == 2)
  {
    id v4 = +[CAShapeLayer layer];
    [(CarFocusableControl *)self bounds];
    CGRect v12 = CGRectInset(v11, -0.75, -0.75);
    unint64_t v6 = CGPathCreateWithEllipseInRect(v12, 0);
    [v4 setPath:v6];
    CGPathRelease(v6);
    id v7 = [(CarFocusableControl *)self focusedBackgroundColor];
    [v4 setStrokeColor:[v7 CGColor]];

    id v8 = +[UIColor clearColor];
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v8, "CGColor"));

    [v4 setLineWidth:1.5];
  }
  else if (v3 == 1)
  {
    id v4 = +[CAShapeLayer layer];
    id v5 = +[UIColor _carSystemFocusColor];
    [v4 setBackgroundColor:[v5 CGColor]];

    [v4 setCornerRadius:2.0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CarFocusableControl *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(CarFocusableControl *)self touchInsets];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;

  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (void)_selectButtonPressed:(id)a3
{
  id v9 = a3;
  unsigned int v4 = [(CarFocusableControl *)self isEnabled];
  id v5 = v9;
  if (v4)
  {
    id v6 = [v9 state];
    if (v6 == (id)3)
    {
      [(CarFocusableControl *)self setHighlighted:0];
      [(CarFocusableControl *)self sendActionsForControlEvents:64];
    }
    else
    {
      if (v6 == (id)1)
      {
        double v7 = self;
        uint64_t v8 = 1;
      }
      else
      {
        double v7 = self;
        uint64_t v8 = 0;
      }
      [(CarFocusableControl *)v7 setHighlighted:v8];
    }
    id v5 = v9;
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarFocusableControl;
  [(CarFocusableControl *)&v5 willMoveToSuperview:a3];
  [(CAShapeLayer *)self->_focusShapeLayer removeFromSuperlayer];
  focusShapeLayer = self->_focusShapeLayer;
  self->_focusShapeLayer = 0;
}

- (id)_adjustedColor:(id)a3 forState:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    double v10 = 0.0;
    double v11 = 0.0;
    [v5 getWhite:&v11 alpha:&v10];
    id v7 = +[UIColor colorWithWhite:v11 alpha:v10 * 0.349999994];
  }
  else if ((v4 & 2) != 0)
  {
    id v7 = [v5 colorWithAlphaComponent:0.200000003];
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CarFocusableControl *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableControl;
  [(CarFocusableControl *)&v6 setEnabled:v3];
  if (v5 != [(CarFocusableControl *)self isEnabled])
  {
    [(CarFocusableControl *)self setNeedsFocusUpdate];
    [(CarFocusableControl *)self setNeedsLayout];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CarFocusableControl;
  id v6 = a3;
  [(CarFocusableControl *)&v8 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  [v6 nextFocusedItem];
  id v7 = (CarFocusableControl *)objc_claimAutoreleasedReturnValue();

  [(CarFocusableControl *)self focusDidChange:v7 == self];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CarFocusableControl *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableControl;
  [(CarFocusableControl *)&v6 setHighlighted:v3];
  if (v5 != [(CarFocusableControl *)self isHighlighted]) {
    [(CarFocusableControl *)self setNeedsLayout];
  }
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)CarFocusableControl;
  unsigned int v3 = [(CarFocusableControl *)&v5 canBecomeFocused];
  if (v3)
  {
    unsigned int v3 = [(CarFocusableControl *)self isEnabled];
    if (v3) {
      LOBYTE(v3) = [(CarFocusableControl *)self isHidden] ^ 1;
    }
  }
  return v3;
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

- (unint64_t)focusableControlStyle
{
  return self->_focusableControlStyle;
}

- (UIEdgeInsets)roundedFocusInsets
{
  double top = self->_roundedFocusInsets.top;
  double left = self->_roundedFocusInsets.left;
  double bottom = self->_roundedFocusInsets.bottom;
  double right = self->_roundedFocusInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)unfocusedTintColor
{
  return self->_unfocusedTintColor;
}

- (void)setUnfocusedTintColor:(id)a3
{
}

- (UIColor)focusedTintColor
{
  return self->_focusedTintColor;
}

- (void)setFocusedTintColor:(id)a3
{
}

- (UIColor)unfocusedBackgroundColor
{
  return self->_unfocusedBackgroundColor;
}

- (void)setUnfocusedBackgroundColor:(id)a3
{
}

- (UIColor)focusedBackgroundColor
{
  return self->_focusedBackgroundColor;
}

- (void)setFocusedBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_unfocusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedTintColor, 0);
  objc_storeStrong((id *)&self->_unfocusedTintColor, 0);
  objc_storeStrong((id *)&self->_focusShapeLayer, 0);

  objc_storeStrong((id *)&self->_selectButtonRecognizer, 0);
}

@end