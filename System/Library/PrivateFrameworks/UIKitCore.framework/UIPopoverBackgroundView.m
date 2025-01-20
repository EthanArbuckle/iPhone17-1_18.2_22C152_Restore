@interface UIPopoverBackgroundView
+ (BOOL)wantsDefaultContentAppearance;
+ (UIEdgeInsets)contentViewInsets;
+ (double)arrowBase;
+ (double)arrowHeight;
+ (double)cornerRadius;
- (BOOL)_chromeHidden;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGFloat)arrowOffset;
- (CGRect)_backgroundContentViewFrame;
- (CGRect)_contentViewFrame;
- (CGSize)_shadowOffset;
- (UIEdgeInsets)_contentViewInsets;
- (UIEdgeInsets)_shadowInsets;
- (UIPopoverArrowDirection)arrowDirection;
- (UIPopoverBackgroundView)initWithFrame:(CGRect)a3;
- (double)_customCornerRadius;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (id)_shadowPath;
- (id)_shadowPathForRect:(CGRect)a3 arrowDirection:(unint64_t)a4;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (int64_t)_backgroundBlurEffectStyle;
- (int64_t)backgroundStyle;
- (void)_setBackgroundBlurEffectStyle:(int64_t)a3;
- (void)_setChromeHidden:(BOOL)a3;
- (void)_setCustomCornerRadius:(double)a3;
- (void)_updateShadow;
- (void)layoutSubviews;
- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection;
- (void)setArrowOffset:(CGFloat)arrowOffset;
@end

@implementation UIPopoverBackgroundView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shadowPath"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPopoverBackgroundView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIPopoverBackgroundView;
  [(UIView *)&v3 layoutSubviews];
  [(UIPopoverBackgroundView *)self _updateShadow];
}

- (void)_updateShadow
{
  id v3 = [(UIPopoverBackgroundView *)self _shadowPath];
  uint64_t v4 = [v3 CGPath];

  if (v4)
  {
    BOOL v5 = [(UIView *)self layer];
    [v5 setShadowPath:v4];

    v6 = [(UIView *)self layer];
    [(UIPopoverBackgroundView *)self _shadowOpacity];
    *(float *)&double v7 = v7;
    [v6 setShadowOpacity:v7];

    v8 = [(UIView *)self layer];
    [(UIPopoverBackgroundView *)self _shadowRadius];
    objc_msgSend(v8, "setShadowRadius:");

    id v9 = [(UIView *)self layer];
    [(UIPopoverBackgroundView *)self _shadowOffset];
    objc_msgSend(v9, "setShadowOffset:");
  }
}

- (CGRect)_contentViewFrame
{
  [(UIPopoverBackgroundView *)self _backgroundContentViewFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIPopoverBackgroundView *)self _contentViewInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)_contentViewInsets
{
  v2 = objc_opt_class();
  [v2 contentViewInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGRect)_backgroundContentViewFrame
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIPopoverArrowDirection v11 = [(UIPopoverBackgroundView *)self arrowDirection];
  double v12 = 0.0;
  if (v10 > 44.0) {
    double v13 = 0.0;
  }
  else {
    double v13 = 6.0;
  }
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  switch(v11)
  {
    case 0uLL:
    case 2uLL:
      [(id)objc_opt_class() arrowHeight];
      double v14 = 0.0;
      double v15 = 0.0;
      goto LABEL_12;
    case 1uLL:
      [(id)objc_opt_class() arrowHeight];
      double v12 = v17;
      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_12;
    case 4uLL:
      [(id)objc_opt_class() arrowHeight];
      double v15 = v13 + v18;
      double v14 = 0.0;
      goto LABEL_11;
    case 8uLL:
      [(id)objc_opt_class() arrowHeight];
      double v14 = v13 + v19;
      goto LABEL_10;
    default:
LABEL_7:
      double v14 = 0.0;
LABEL_10:
      double v15 = 0.0;
LABEL_11:
      double v16 = 0.0;
LABEL_12:
      double v20 = v4 + v15;
      double v21 = v6 + v12;
      double v22 = v8 - (v14 + v15);
      double v23 = v10 - (v16 + v12);
      double v24 = v20;
      result.size.height = v23;
      result.size.width = v22;
      result.origin.y = v21;
      result.origin.x = v24;
      return result;
  }
}

- (double)_customCornerRadius
{
  return self->_customCornerRadius;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UIPopoverBackgroundView;
  id v7 = a3;
  double v8 = [(UIView *)&v22 actionForLayer:v7 forKey:v6];
  int v9 = objc_msgSend(v7, "hasBeenCommitted", v22.receiver, v22.super_class);

  if (v9 && [v6 isEqual:@"shadowPath"] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v10 = [(UIView *)self layer];
    UIPopoverArrowDirection v11 = [v10 presentationLayer];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    -[UIPopoverBackgroundView _shadowPathForRect:arrowDirection:](self, "_shadowPathForRect:arrowDirection:", [(UIPopoverBackgroundView *)self arrowDirection], v13, v15, v17, v19);
    id v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFromValue:", objc_msgSend(v20, "CGPath"));
  }
  return v8;
}

- (UIPopoverBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPopoverBackgroundView;
  double v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [(id)objc_opt_class() cornerRadius];
    v3->_customCornerRadius = v4;
  }
  return v3;
}

- (void)_setChromeHidden:(BOOL)a3
{
  if (self->__chromeHidden != a3)
  {
    self->__chromeHidden = a3;
    [(UIPopoverBackgroundView *)self _updateChrome];
  }
}

- (void)_setBackgroundBlurEffectStyle:(int64_t)a3
{
  if (self->__backgroundBlurEffectStyle != a3)
  {
    self->__backgroundBlurEffectStyle = a3;
    [(UIPopoverBackgroundView *)self _updateChrome];
  }
}

- (BOOL)_chromeHidden
{
  return self->__chromeHidden;
}

- (int64_t)_backgroundBlurEffectStyle
{
  return self->__backgroundBlurEffectStyle;
}

- (CGFloat)arrowOffset
{
  return NAN;
}

- (void)setArrowOffset:(CGFloat)arrowOffset
{
}

- (UIPopoverArrowDirection)arrowDirection
{
  return -1;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
{
}

+ (double)arrowHeight
{
  return NAN;
}

+ (double)arrowBase
{
  return NAN;
}

+ (UIEdgeInsets)contentViewInsets
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
  double v2 = NAN;
  double v3 = NAN;
  double v4 = NAN;
  double v5 = NAN;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)cornerRadius
{
  return 14.0;
}

- (void)_setCustomCornerRadius:(double)a3
{
  self->_customCornerRadius = a3;
  [(UIView *)self setNeedsLayout];
}

+ (BOOL)wantsDefaultContentAppearance
{
  return 1;
}

- (id)_shadowPathForRect:(CGRect)a3 arrowDirection:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = 6.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      [(id)objc_opt_class() arrowHeight];
      double v10 = v13;
      goto LABEL_4;
    case 1uLL:
      [(id)objc_opt_class() arrowHeight];
      double v9 = v14 + 6.0;
      goto LABEL_4;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_8;
    case 4uLL:
      [(id)objc_opt_class() arrowHeight];
      double v12 = v15;
      double v11 = 0.0;
      goto LABEL_8;
    case 8uLL:
      [(id)objc_opt_class() arrowHeight];
      goto LABEL_7;
    default:
LABEL_4:
      double v11 = 0.0;
LABEL_7:
      double v12 = 0.0;
LABEL_8:
      double v16 = x + v12;
      double v17 = width - (v11 + v12);
      [(UIPopoverBackgroundView *)self _shadowInsets];
      return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v16 + v19, y + v9 + v18, v17 - (v19 + v21), height - (v10 + v9) - (v18 + v20), 8.0);
  }
}

- (UIEdgeInsets)_shadowInsets
{
  double v2 = 2.0;
  double v3 = 2.0;
  double v4 = 2.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 1.0;
}

- (double)_shadowRadius
{
  return 23.0;
}

- (CGSize)_shadowOffset
{
  double v2 = 0.0;
  double v3 = 6.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)_shadowPath
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIPopoverArrowDirection v11 = [(UIPopoverBackgroundView *)self arrowDirection];
  return -[UIPopoverBackgroundView _shadowPathForRect:arrowDirection:](self, "_shadowPathForRect:arrowDirection:", v11, v4, v6, v8, v10);
}

- (int64_t)backgroundStyle
{
  return 0;
}

@end