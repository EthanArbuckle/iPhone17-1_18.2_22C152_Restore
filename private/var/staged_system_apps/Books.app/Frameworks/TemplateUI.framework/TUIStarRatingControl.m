@interface TUIStarRatingControl
- (BOOL)_isRTL;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_foregroundImageClipBounds;
- (CGRect)_foregroundImageContainerClipBounds;
- (CGRect)hitRect;
- (TUIStarRatingControl)initWithRating:(double)a3 backgroundImageName:(id)a4 foregroundImageName:(id)a5 direction:(unint64_t)a6 color:(id)a7 startColor:(id)a8 backgroundColor:(id)a9 starWidth:(double)a10 starPadding:(double)a11;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (UIColor)startColor;
- (double)starPadding;
- (double)starWidth;
- (float)value;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateBackgroundImage;
- (void)_updateForegroundImage;
- (void)_updateImagesIfNeededWithForegroundImageName:(id)a3 backgroundImageName:(id)a4 starWidth:(double)a5 starPadding:(double)a6;
- (void)_updateValueForPoint:(CGPoint)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHitPadding:(CGSize)a3;
- (void)setStarPadding:(double)a3;
- (void)setStarWidth:(double)a3;
- (void)setStartColor:(id)a3;
- (void)setValue:(float)a3;
- (void)sizeToFit;
@end

@implementation TUIStarRatingControl

- (TUIStarRatingControl)initWithRating:(double)a3 backgroundImageName:(id)a4 foregroundImageName:(id)a5 direction:(unint64_t)a6 color:(id)a7 startColor:(id)a8 backgroundColor:(id)a9 starWidth:(double)a10 starPadding:(double)a11
{
  id v46 = a4;
  id v45 = a5;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v47.receiver = self;
  v47.super_class = (Class)TUIStarRatingControl;
  v24 = [(TUIStarRatingControl *)&v47 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_backgroundImageName, a4);
    objc_storeStrong((id *)&v25->_foregroundImageName, a5);
    v25->_direction = a6;
    objc_storeStrong((id *)&v25->_foregroundColor, a7);
    objc_storeStrong((id *)&v25->_backgroundColor, a9);
    objc_storeStrong((id *)&v25->_startColor, a8);
    float v26 = a3;
    v25->_value = v26;
    v25->_starWidth = a10;
    v25->_starPadding = a11;
    v27 = +[TUIStarRatingImageCache sharedInstance];
    v28 = [(TUIStarRatingControl *)v25 traitCollection];
    v29 = [v27 ratingStarsImageWithName:v46 starSize:5 starCount:v28 starPadding:a10 traitCollection:a11];

    v30 = +[TUIStarRatingImageCache sharedInstance];
    v31 = [(TUIStarRatingControl *)v25 traitCollection];
    v32 = [v30 ratingStarsImageWithName:v45 starSize:5 starCount:v31 starPadding:a10 traitCollection:a11];

    v33 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v29];
    placeholderImageView = v25->_placeholderImageView;
    v25->_placeholderImageView = v33;

    [(UIImageView *)v25->_placeholderImageView setTintColor:v22];
    [(UIImageView *)v25->_placeholderImageView setUserInteractionEnabled:0];
    [(UIImageView *)v25->_placeholderImageView sizeToFit];
    [(TUIStarRatingControl *)v25 addSubview:v25->_placeholderImageView];
    v35 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v29];
    backgroundImageView = v25->_backgroundImageView;
    v25->_backgroundImageView = v35;

    [(UIImageView *)v25->_backgroundImageView setTintColor:v23];
    [(UIImageView *)v25->_backgroundImageView setUserInteractionEnabled:0];
    [(UIImageView *)v25->_backgroundImageView sizeToFit];
    [(TUIStarRatingControl *)v25 addSubview:v25->_backgroundImageView];
    id v37 = objc_alloc((Class)UIView);
    [(TUIStarRatingControl *)v25 bounds];
    v38 = [v37 initWithFrame:];
    foregroundContainerView = v25->_foregroundContainerView;
    v25->_foregroundContainerView = v38;

    [(UIView *)v25->_foregroundContainerView setClipsToBounds:1];
    [(UIView *)v25->_foregroundContainerView setUserInteractionEnabled:0];
    [(UIView *)v25->_foregroundContainerView setContentMode:7];
    [(UIView *)v25->_foregroundContainerView sizeToFit];
    v40 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v32];
    foregroundImageView = v25->_foregroundImageView;
    v25->_foregroundImageView = v40;

    [(UIImageView *)v25->_foregroundImageView setTintColor:v21];
    [(UIImageView *)v25->_foregroundImageView setUserInteractionEnabled:0];
    [(UIImageView *)v25->_foregroundImageView sizeToFit];
    [(UIView *)v25->_foregroundContainerView addSubview:v25->_foregroundImageView];
    [(TUIStarRatingControl *)v25 addSubview:v25->_foregroundContainerView];
    v42 = +[UITraitCollection tui_allAPITraits];
    id v43 = [(TUIStarRatingControl *)v25 registerForTraitChanges:v42 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v25;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)TUIStarRatingControl;
  [(TUIStarRatingControl *)&v14 layoutSubviews];
  [(TUIStarRatingControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  *(float *)&double v3 = self->_value;
  BOOL v11 = *(float *)&v3 != 0.0;
  [(UIImageView *)self->_backgroundImageView setHidden:*(float *)&v3 == 0.0];
  [(UIImageView *)self->_placeholderImageView setHidden:v11];
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4, v6, v8, v10);
  foregroundImageView = self->_foregroundImageView;
  [(TUIStarRatingControl *)self _foregroundImageClipBounds];
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  foregroundContainerView = self->_foregroundContainerView;
  [(TUIStarRatingControl *)self _foregroundImageContainerClipBounds];
  -[UIView setFrame:](foregroundContainerView, "setFrame:");
}

- (void)sizeToFit
{
  [(TUIStarRatingControl *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_backgroundImageView bounds];

  -[TUIStarRatingControl setFrame:](self, "setFrame:", v4, v6);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  [(TUIStarRatingControl *)self _updateForegroundImage];

  [(TUIStarRatingControl *)self _updateBackgroundImage];
}

- (void)setHitPadding:(CGSize)a3
{
  self->_hitPadding = a3;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
  [(TUIStarRatingControl *)self setNeedsLayout];
}

- (void)setStarWidth:(double)a3
{
  if (self->_starWidth != a3)
  {
    self->_starWidth = a3;
    [(TUIStarRatingControl *)self _updateForegroundImage];
    [(TUIStarRatingControl *)self _updateBackgroundImage];
  }
}

- (void)setStarPadding:(double)a3
{
  if (self->_starPadding != a3)
  {
    self->_starPadding = a3;
    [(TUIStarRatingControl *)self _updateForegroundImage];
    [(TUIStarRatingControl *)self _updateBackgroundImage];
  }
}

- (void)setForegroundColor:(id)a3
{
  double v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_foregroundColor != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_foregroundColor, a3);
      [(UIImageView *)self->_foregroundImageView setTintColor:v8];
      double v6 = v8;
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  double v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_backgroundColor != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      [(UIImageView *)self->_backgroundImageView setTintColor:v8];
      double v6 = v8;
    }
  }
}

- (void)setStartColor:(id)a3
{
  double v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_startColor != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_startColor, a3);
      [(UIImageView *)self->_placeholderImageView setTintColor:v8];
      double v6 = v8;
    }
  }
}

- (void)_updateImagesIfNeededWithForegroundImageName:(id)a3 backgroundImageName:(id)a4 starWidth:(double)a5 starPadding:(double)a6
{
  id v12 = a3;
  id v11 = a4;
  if (self->_starWidth != a5 || self->_starPadding != a6)
  {
    self->_starWidth = a5;
    self->_starPadding = a6;
    objc_storeStrong((id *)&self->_foregroundImageName, a3);
    [(TUIStarRatingControl *)self _updateForegroundImage];
LABEL_4:
    objc_storeStrong((id *)&self->_backgroundImageName, a4);
    [(TUIStarRatingControl *)self _updateBackgroundImage];
    goto LABEL_5;
  }
  if (([v12 isEqualToString:self->_foregroundImageName] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundImageName, a3);
    [(TUIStarRatingControl *)self _updateForegroundImage];
  }
  if (([v11 isEqualToString:self->_backgroundImageName] & 1) == 0) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)_updateForegroundImage
{
  double v3 = +[TUIStarRatingImageCache sharedInstance];
  foregroundImageName = self->_foregroundImageName;
  double starWidth = self->_starWidth;
  double starPadding = self->_starPadding;
  unsigned __int8 v7 = [(TUIStarRatingControl *)self traitCollection];
  id v8 = [v3 ratingStarsImageWithName:foregroundImageName starSize:5 starCount:v7 starPadding:starWidth traitCollection:starPadding];

  [(UIImageView *)self->_foregroundImageView setImage:v8];
}

- (void)_updateBackgroundImage
{
  double v3 = +[TUIStarRatingImageCache sharedInstance];
  backgroundImageName = self->_backgroundImageName;
  double starWidth = self->_starWidth;
  double starPadding = self->_starPadding;
  unsigned __int8 v7 = [(TUIStarRatingControl *)self traitCollection];
  id v8 = [v3 ratingStarsImageWithName:backgroundImageName starSize:5 starCount:v7 starPadding:starWidth traitCollection:starPadding];

  [(UIImageView *)self->_placeholderImageView setImage:v8];
  [(UIImageView *)self->_backgroundImageView setImage:v8];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3 = a3;
  BOOL v4 = 1;
  if ([v3 numberOfTouches] == (char *)&def_141F14 + 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_trackingStartPoint = &self->_trackingStartPoint;
  [a3 locationInView:self];
  p_trackingStartPoint->x = v5;
  p_trackingStartPoint->y = v6;
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  [a3 locationInView:self];
  double v6 = v5 - self->_trackingStartPoint.y;
  self->_trackingLastPoint.x = v7;
  self->_trackingLastPoint.y = v5;
  if (v6 >= 0.0) {
    double v8 = v6;
  }
  else {
    double v8 = -v6;
  }
  if (v8 > 40.0)
  {
    uint64_t v9 = 64;
  }
  else
  {
    -[TUIStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
    uint64_t v9 = 4096;
  }
  -[TUIStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v9, 40.0);
  return v8 <= 40.0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_trackingLastPoint = &self->_trackingLastPoint;
  [a3 locationInView:self];
  p_trackingLastPoint->x = v6;
  p_trackingLastPoint->y = v7;
  -[TUIStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");

  [(TUIStarRatingControl *)self sendActionsForControlEvents:4096];
}

- (CGRect)hitRect
{
  [(TUIStarRatingControl *)self bounds];
  double v7 = -self->_hitPadding.width;
  double v8 = -self->_hitPadding.height;

  return CGRectInset(*(CGRect *)&v3, v7, v8);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TUIStarRatingControl *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)_isRTL
{
  return self->_direction == 2;
}

- (CGRect)_foregroundImageClipBounds
{
  [(TUIStarRatingControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(TUIStarRatingControl *)self _isRTL])
  {
    [(TUIStarRatingControl *)self _foregroundImageContainerClipBounds];
    double v4 = -v11;
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)_foregroundImageContainerClipBounds
{
  [(TUIStarRatingControl *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v11 = self->_value / (1.0 / (double)5uLL);
  [(TUIStarRatingControl *)self starWidth];
  double v13 = v12;
  [(TUIStarRatingControl *)self starPadding];
  double v15 = v14 * (double)4uLL + v13 * (double)5uLL;
  [(TUIStarRatingControl *)self starWidth];
  double v17 = v8 * (v16 / v15);
  [(TUIStarRatingControl *)self starPadding];
  double v19 = v8 * (v18 / v15);
  float v20 = v11;
  double v21 = ceilf(v20 + -1.0);
  if (v21 < 0.0) {
    double v21 = 0.0;
  }
  double v22 = v19 * (double)(unint64_t)v21 + v17 * v11;
  if ([(TUIStarRatingControl *)self _isRTL])
  {
    v28.origin.CGFloat x = v4;
    v28.origin.CGFloat y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    double MaxX = CGRectGetMaxX(v28);
    v29.origin.CGFloat x = v4;
    v29.origin.CGFloat y = v6;
    v29.size.width = v22;
    v29.size.height = v10;
    double v4 = MaxX - CGRectGetWidth(v29);
  }
  double v24 = v4;
  double v25 = v6;
  double v26 = v22;
  double v27 = v10;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (void)_updateValueForPoint:(CGPoint)a3
{
  double x = a3.x;
  [(TUIStarRatingControl *)self starWidth];
  double v7 = v6;
  [(TUIStarRatingControl *)self bounds];
  double v9 = ceil((v8 - v7 * (double)5uLL) / (double)4uLL);
  double v10 = (v7 + v9) * (double)5uLL;
  double v11 = -(v9 - v10);
  if (x <= v10) {
    double v11 = x;
  }
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  LODWORD(v3) = vcvtpd_u64_f64(v11 / (v7 + v9));
  if ([(TUIStarRatingControl *)self _isRTL]) {
    unint64_t v13 = 6 - v3;
  }
  else {
    unint64_t v13 = v3;
  }
  if (v13 <= 1) {
    unint64_t v13 = 1;
  }

  *(float *)&double v12 = (float)v13 / (float)5uLL;
  [(TUIStarRatingControl *)self setValue:v12];
}

- (double)starWidth
{
  return self->_starWidth;
}

- (double)starPadding
{
  return self->_starPadding;
}

- (float)value
{
  return self->_value;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundImageName, 0);
  objc_storeStrong((id *)&self->_backgroundImageName, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);

  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
}

@end