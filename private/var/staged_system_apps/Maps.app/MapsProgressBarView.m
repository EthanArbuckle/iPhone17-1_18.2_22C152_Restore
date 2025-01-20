@interface MapsProgressBarView
- (MapsProgressBarView)initWithFrame:(CGRect)a3;
- (double)progress;
- (unint64_t)fillStyle;
- (void)_customInit;
- (void)_updateFillConstraint;
- (void)_updateFillTintColor;
- (void)layoutSubviews;
- (void)setFillStyle:(unint64_t)a3;
- (void)setProgress:(double)a3;
- (void)tintColorDidChange;
- (void)updateTheme;
@end

@implementation MapsProgressBarView

- (MapsProgressBarView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MapsProgressBarView;
  v3 = -[MapsProgressBarView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MapsProgressBarView *)v3 _customInit];
    v5 = v4;
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [0 setAccessibilityIdentifier:v7];
  }
  return v4;
}

- (void)_customInit
{
  [(MapsProgressBarView *)self setClipsToBounds:1];
  self->_fillStyle = 0;
  v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  fillView = self->_fillView;
  self->_fillView = v3;

  [(UIView *)self->_fillView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsProgressBarView *)self addSubview:self->_fillView];
  v5 = [(UIView *)self->_fillView trailingAnchor];
  v6 = [(MapsProgressBarView *)self leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  progressFillConstraint = self->_progressFillConstraint;
  self->_progressFillConstraint = v7;

  v19 = [(UIView *)self->_fillView topAnchor];
  objc_super v9 = [(MapsProgressBarView *)self topAnchor];
  v10 = [v19 constraintEqualToAnchor:v9];
  v20[0] = v10;
  v11 = [(UIView *)self->_fillView bottomAnchor];
  v12 = [(MapsProgressBarView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v20[1] = v13;
  v14 = [(UIView *)self->_fillView leadingAnchor];
  v15 = [(MapsProgressBarView *)self leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v17 = self->_progressFillConstraint;
  v20[2] = v16;
  v20[3] = v17;
  v18 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (void)updateTheme
{
  id v4 = [(MapsProgressBarView *)self theme];
  v3 = [v4 progressBarTrackTintColor];
  [(MapsProgressBarView *)self setBackgroundColor:v3];

  [(MapsProgressBarView *)self _updateFillTintColor];
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    BOOL v3 = a3 > 1.0 || a3 < 0.0;
    double v4 = fmin(fmax(a3, 0.0), 1.0);
    if (v3) {
      a3 = v4;
    }
    self->_progress = a3;
    [(MapsProgressBarView *)self _updateFillConstraint];
  }
}

- (void)setFillStyle:(unint64_t)a3
{
  self->_fillStyle = a3;
  [(MapsProgressBarView *)self _updateFillTintColor];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MapsProgressBarView;
  [(MapsProgressBarView *)&v7 layoutSubviews];
  [(MapsProgressBarView *)self bounds];
  CGFloat v3 = CGRectGetHeight(v8) * 0.5;
  double v4 = [(MapsProgressBarView *)self layer];
  [v4 setCornerRadius:v3];

  [(UIView *)self->_fillView bounds];
  CGFloat v5 = CGRectGetHeight(v9) * 0.5;
  v6 = [(UIView *)self->_fillView layer];
  [v6 setCornerRadius:v5];

  [(MapsProgressBarView *)self _updateFillConstraint];
}

- (void)_updateFillConstraint
{
  if (self->_fillView)
  {
    [(MapsProgressBarView *)self bounds];
    CGRectGetWidth(v8);
    UIRoundToViewScale();
    double v4 = v3;
    [(NSLayoutConstraint *)self->_progressFillConstraint constant];
    if (vabdd_f64(v4, v5) > 2.22044605e-16)
    {
      progressFillConstraint = self->_progressFillConstraint;
      [(NSLayoutConstraint *)progressFillConstraint setConstant:v4];
    }
  }
}

- (void)_updateFillTintColor
{
  double v3 = [(MapsProgressBarView *)self window];

  if (!v3) {
    return;
  }
  double v4 = [(MapsProgressBarView *)self theme];
  unint64_t fillStyle = self->_fillStyle;
  switch(fillStyle)
  {
    case 2uLL:
      id v8 = v4;
      uint64_t v6 = [(MapsProgressBarView *)self tintColor];
      goto LABEL_9;
    case 1uLL:
      id v8 = v4;
      uint64_t v6 = [v4 progressBarLightFillTintColor];
      goto LABEL_9;
    case 0uLL:
      id v8 = v4;
      uint64_t v6 = [v4 progressBarDarkFillTintColor];
LABEL_9:
      objc_super v7 = (void *)v6;
      [(UIView *)self->_fillView setBackgroundColor:v6];

      double v4 = v8;
      break;
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MapsProgressBarView;
  [(MapsProgressBarView *)&v3 tintColorDidChange];
  [(MapsProgressBarView *)self _updateFillTintColor];
}

- (double)progress
{
  return self->_progress;
}

- (unint64_t)fillStyle
{
  return self->_fillStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressFillConstraint, 0);

  objc_storeStrong((id *)&self->_fillView, 0);
}

@end