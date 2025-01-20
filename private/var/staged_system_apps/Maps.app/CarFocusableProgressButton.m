@interface CarFocusableProgressButton
- (BOOL)progressBarHidden;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (UIColor)progressFillColor;
- (UIColor)progressFillFocusedColor;
- (double)progress;
- (void)_insertFillViewIfNecessary;
- (void)_updateColors;
- (void)_updateProgressConstraint;
- (void)didMoveToWindow;
- (void)focusDidChange:(BOOL)a3;
- (void)setProgessFillColor:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBarHidden:(BOOL)a3;
- (void)setProgressFillColor:(id)a3;
- (void)setProgressFillFocusedColor:(id)a3;
@end

@implementation CarFocusableProgressButton

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CarFocusableProgressButton;
  [(CarFocusableButton *)&v3 didMoveToWindow];
  [(CarFocusableProgressButton *)self _insertFillViewIfNecessary];
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarFocusableProgressButton;
  -[CarCardRoundedButton titleRectForContentRect:](&v8, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_progressBarHidden) {
    double v5 = v5 + -4.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_insertFillViewIfNecessary
{
  if (!self->_fillView)
  {
    id v3 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
    barView = self->_barView;
    self->_barView = v7;

    [(UIView *)self->_barView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_barView setUserInteractionEnabled:0];
    v9 = +[UIColor _carSystemQuaternaryColor];
    [(UIView *)self->_barView setBackgroundColor:v9];

    [(UIView *)self->_barView setAccessibilityIdentifier:@"BarView"];
    v10 = [(UIView *)self->_barView layer];
    [v10 setCornerRadius:2.0];

    v11 = [(UIView *)self->_barView layer];
    [v11 setMasksToBounds:1];

    [(CarFocusableProgressButton *)self addSubview:self->_barView];
    v12 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    fillView = self->_fillView;
    self->_fillView = v12;

    [(UIView *)self->_fillView setAccessibilityIdentifier:@"FillView"];
    [(UIView *)self->_fillView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_fillView setUserInteractionEnabled:0];
    v14 = [(CarFocusableProgressButton *)self progressFillColor];
    [(UIView *)self->_fillView setBackgroundColor:v14];

    v15 = [(UIView *)self->_fillView layer];
    [v15 setCornerRadius:2.0];

    v16 = [(UIView *)self->_fillView layer];
    [v16 setMasksToBounds:1];

    [(UIView *)self->_barView addSubview:self->_fillView];
    v17 = [(CarFocusableProgressButton *)self titleLabel];
    [(CarFocusableProgressButton *)self bringSubviewToFront:v17];

    v18 = [(UIView *)self->_fillView trailingAnchor];
    v19 = [(UIView *)self->_barView leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    horizontalConstraint = self->_horizontalConstraint;
    self->_horizontalConstraint = v20;

    v43 = [(UIView *)self->_barView bottomAnchor];
    v42 = [(CarFocusableProgressButton *)self bottomAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:-5.0];
    v44[0] = v41;
    v40 = [(UIView *)self->_barView leadingAnchor];
    v39 = [(CarFocusableProgressButton *)self leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:8.0];
    v44[1] = v38;
    v37 = [(UIView *)self->_barView trailingAnchor];
    v36 = [(CarFocusableProgressButton *)self trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:-8.0];
    v44[2] = v35;
    v34 = [(UIView *)self->_barView heightAnchor];
    v33 = [v34 constraintEqualToConstant:4.0];
    v44[3] = v33;
    v32 = [(UIView *)self->_fillView topAnchor];
    v22 = [(UIView *)self->_barView topAnchor];
    v23 = [v32 constraintEqualToAnchor:v22];
    v44[4] = v23;
    v24 = [(UIView *)self->_fillView bottomAnchor];
    v25 = [(UIView *)self->_barView bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v44[5] = v26;
    v27 = [(UIView *)self->_fillView leadingAnchor];
    v28 = [(UIView *)self->_barView leadingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v30 = self->_horizontalConstraint;
    v44[6] = v29;
    v44[7] = v30;
    v31 = +[NSArray arrayWithObjects:v44 count:8];
    +[NSLayoutConstraint activateConstraints:v31];
  }
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    BOOL v4 = a3 > 1.0 || a3 < 0.0;
    double v5 = fmin(fmax(a3, 0.0), 1.0);
    if (v4) {
      a3 = v5;
    }
    self->_progress = a3;
    [(CarFocusableProgressButton *)self _updateProgressConstraint];
    [(CarFocusableProgressButton *)self layoutIfNeeded];
  }
}

- (void)setProgessFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressFillColor, a3);

  [(CarFocusableProgressButton *)self _updateColors];
}

- (void)setProgressFillFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressFillFocusedColor, a3);

  [(CarFocusableProgressButton *)self _updateColors];
}

- (void)setProgressBarHidden:(BOOL)a3
{
  if (self->_progressBarHidden != a3)
  {
    BOOL v3 = a3;
    self->_progressBarHidden = a3;
    -[UIView setHidden:](self->_fillView, "setHidden:");
    [(UIView *)self->_barView setHidden:v3];
    [(CarFocusableProgressButton *)self setNeedsLayout];
    [(CarFocusableProgressButton *)self layoutIfNeeded];
  }
}

- (void)focusDidChange:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarFocusableProgressButton;
  [(CarFocusableButton *)&v4 focusDidChange:a3];
  [(CarFocusableProgressButton *)self _updateColors];
  [(CarFocusableProgressButton *)self _updateProgressConstraint];
}

- (void)_updateColors
{
  if ([(CarFocusableProgressButton *)self isFocused])
  {
    BOOL v3 = +[UIColor _carSystemTertiaryColor];
    [(UIView *)self->_barView setBackgroundColor:v3];

    [(CarFocusableProgressButton *)self progressFillFocusedColor];
  }
  else
  {
    objc_super v4 = +[UIColor _carSystemQuaternaryColor];
    [(UIView *)self->_barView setBackgroundColor:v4];

    [(CarFocusableProgressButton *)self progressFillColor];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)self->_fillView setBackgroundColor:v5];
}

- (void)_updateProgressConstraint
{
  if (self->_fillView)
  {
    [(UIView *)self->_barView bounds];
    CGRectGetWidth(v14);
    UIRoundToViewScale();
    double v4 = v3;
    [(NSLayoutConstraint *)self->_horizontalConstraint constant];
    if (vabdd_f64(v4, v5) > 2.22044605e-16) {
      [(NSLayoutConstraint *)self->_horizontalConstraint setConstant:v4];
    }
    double v6 = +[NSString stringWithFormat:@"%@%.2f", @"FillView.Progress=", *(void *)&self->_progress];
    [(UIView *)self->_fillView setAccessibilityIdentifier:v6];

    double v7 = [(UIView *)self->_fillView layer];
    [v7 removeAnimationForKey:@"backgroundColor"];

    objc_super v8 = [(CarFocusableProgressButton *)self layer];
    [v8 removeAnimationForKey:@"backgroundColor"];

    v9 = [(CarFocusableProgressButton *)self titleLabel];
    v10 = [v9 layer];
    [v10 removeAnimationForKey:@"backgroundColor"];

    id v12 = [(CarFocusableProgressButton *)self titleLabel];
    v11 = [v12 layer];
    [v11 removeAnimationForKey:@"contents"];
  }
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressFillColor
{
  return self->_progressFillColor;
}

- (void)setProgressFillColor:(id)a3
{
}

- (UIColor)progressFillFocusedColor
{
  return self->_progressFillFocusedColor;
}

- (BOOL)progressBarHidden
{
  return self->_progressBarHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressFillFocusedColor, 0);
  objc_storeStrong((id *)&self->_progressFillColor, 0);
  objc_storeStrong((id *)&self->_horizontalConstraint, 0);
  objc_storeStrong((id *)&self->_barView, 0);

  objc_storeStrong((id *)&self->_fillView, 0);
}

@end