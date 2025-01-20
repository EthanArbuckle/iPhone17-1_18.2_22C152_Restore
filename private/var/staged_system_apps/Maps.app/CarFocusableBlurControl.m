@interface CarFocusableBlurControl
- (BOOL)castsShadow;
- (BOOL)hidesBlur;
- (BOOL)needsContinuousRoundedCorners;
- (CarFocusableBlurControl)init;
- (CarFocusableBlurControl)initWithFrame:(CGRect)a3;
- (double)roundedCornerRadius;
- (id)backgroundColor;
- (unint64_t)roundedCorners;
- (void)_commonInit;
- (void)_updateShadow;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCastsShadow:(BOOL)a3;
- (void)setHidesBlur:(BOOL)a3;
- (void)setRoundedCornerRadius:(double)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarFocusableBlurControl

- (CarFocusableBlurControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)CarFocusableBlurControl;
  v2 = [(CarFocusableBlurControl *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CarFocusableBlurControl *)v2 _commonInit];
  }
  return v3;
}

- (CarFocusableBlurControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarFocusableBlurControl;
  v3 = -[CarFocusableControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CarFocusableBlurControl *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  self->_castsShadow = 1;
  v3 = [(CarFocusableBlurControl *)self _mapsCar_injectBlurView];
  blurView = self->_blurView;
  self->_blurView = v3;

  [(CarFocusableBlurControl *)self setClipsToBounds:0];
  objc_super v5 = [(CarFocusableBlurControl *)self layer];
  [v5 setMasksToBounds:0];

  objc_super v6 = [(CarFocusableBlurControl *)self layer];
  [v6 setShadowPathIsBounds:1];

  [(CarFocusableBlurControl *)self setRoundedCorners:-1];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarFocusableBlurControl;
  [(CarFocusableBlurControl *)&v4 didMoveToWindow];
  v3 = [(CarFocusableBlurControl *)self window];

  if (v3) {
    [(CarFocusableBlurControl *)self _updateShadow];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CarFocusableBlurControl;
  [(CarFocusableControl *)&v15 layoutSubviews];
  [(CarFocusableBlurControl *)self bounds];
  if (!CGRectEqualToRect(v16, self->_lastBounds)
    || self->_roundedCorners != self->_lastRoundedCorners
    || self->_roundedCornerRadius != self->_lastRoundedCornerRadius)
  {
    unint64_t v3 = self->_roundedCorners & 0xF;
    BOOL v4 = [(CarFocusableBlurControl *)self needsContinuousRoundedCorners];
    [(CarDynamicBlurView *)self->_blurView _setCornerRadius:v4 continuous:v3 maskedCorners:self->_roundedCornerRadius];
    double roundedCornerRadius = self->_roundedCornerRadius;
    objc_super v6 = [(CarFocusableBlurControl *)self layer];
    [v6 setCornerRadius:roundedCornerRadius];

    v7 = &kCACornerCurveContinuous;
    if (!v4) {
      v7 = &kCACornerCurveCircular;
    }
    CALayerCornerCurve v8 = *v7;
    v9 = [(CarFocusableBlurControl *)self layer];
    [v9 setCornerCurve:v8];

    v10 = [(CarFocusableBlurControl *)self layer];
    [v10 setMaskedCorners:v3];

    [(CarFocusableBlurControl *)self bounds];
    self->_lastBounds.origin.x = v11;
    self->_lastBounds.origin.y = v12;
    self->_lastBounds.size.width = v13;
    self->_lastBounds.size.height = v14;
    self->_lastRoundedCorners = self->_roundedCorners;
    self->_lastRoundedCornerRadius = self->_roundedCornerRadius;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarFocusableBlurControl;
  id v4 = a3;
  [(CarFocusableControl *)&v8 traitCollectionDidChange:v4];
  objc_super v5 = [(CarFocusableBlurControl *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(CarFocusableBlurControl *)self _updateShadow];
  }
}

- (BOOL)needsContinuousRoundedCorners
{
  return 1;
}

- (id)backgroundColor
{
  v2 = [(CarDynamicBlurView *)self->_blurView contentView];
  unint64_t v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  blurView = self->_blurView;
  id v4 = a3;
  id v5 = [(CarDynamicBlurView *)blurView contentView];
  [v5 setBackgroundColor:v4];
}

- (void)setRoundedCorners:(unint64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    [(CarFocusableBlurControl *)self setNeedsLayout];
  }
}

- (void)setRoundedCornerRadius:(double)a3
{
  if (self->_roundedCornerRadius != a3)
  {
    self->_double roundedCornerRadius = a3;
    [(CarFocusableBlurControl *)self setNeedsLayout];
  }
}

- (void)setHidesBlur:(BOOL)a3
{
  if (self->_hidesBlur != a3)
  {
    self->_hidesBlur = a3;
    [(CarDynamicBlurView *)self->_blurView setAlpha:(double)!a3];
  }
}

- (void)setCastsShadow:(BOOL)a3
{
  if (self->_castsShadow != a3)
  {
    self->_castsShadow = a3;
    [(CarFocusableBlurControl *)self _updateShadow];
  }
}

- (void)_updateShadow
{
  if (self->_castsShadow)
  {
    [(CarFocusableBlurControl *)self _mapsCar_updateShadow];
  }
  else
  {
    unint64_t v3 = [(CarFocusableBlurControl *)self layer];
    [v3 setShadowRadius:0.0];

    id v4 = [(CarFocusableBlurControl *)self layer];
    [v4 setShadowOpacity:0.0];
  }
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (BOOL)castsShadow
{
  return self->_castsShadow;
}

- (BOOL)hidesBlur
{
  return self->_hidesBlur;
}

- (void).cxx_destruct
{
}

@end