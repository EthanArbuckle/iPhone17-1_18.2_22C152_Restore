@interface TSWPopoverTheme
- (BOOL)popoverHasGradientBackground;
- (CGSize)popoverShadowOffset;
- (TSDStroke)popoverStroke;
- (TSUColor)popoverBackgroundColor;
- (TSUColor)popoverShadowColor;
- (TSWPopoverTheme)init;
- (UIEdgeInsets)popoverContentInsets;
- (UIEdgeInsets)popoverFadeInsets;
- (UIEdgeInsets)popoverFadeSizes;
- (double)popoverCornerRadius;
- (double)popoverShadowOpacity;
- (double)popoverShadowRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (int)presentationMode;
- (void)dealloc;
- (void)scaleWithFactor:(double)a3;
- (void)setPopoverBackgroundColor:(id)a3;
- (void)setPopoverContentInsets:(UIEdgeInsets)a3;
- (void)setPopoverCornerRadius:(double)a3;
- (void)setPopoverFadeInsets:(UIEdgeInsets)a3;
- (void)setPopoverFadeSizes:(UIEdgeInsets)a3;
- (void)setPopoverHasGradientBackground:(BOOL)a3;
- (void)setPopoverShadowColor:(id)a3;
- (void)setPopoverShadowOffset:(CGSize)a3;
- (void)setPopoverShadowOpacity:(double)a3;
- (void)setPopoverShadowRadius:(double)a3;
- (void)setPopoverStroke:(id)a3;
- (void)setPresentationMode:(int)a3;
@end

@implementation TSWPopoverTheme

- (TSWPopoverTheme)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPopoverTheme;
  v2 = [(TSWPopoverTheme *)&v4 init];
  if (v2)
  {
    [(TSWPopoverTheme *)v2 setPopoverBackgroundColor:+[TSUColor lightGrayColor]];
    [(TSWPopoverTheme *)v2 setPopoverHasGradientBackground:0];
    [(TSWPopoverTheme *)v2 setPopoverStroke:+[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", +[TSUColor grayColor], 1.0)];
    [(TSWPopoverTheme *)v2 setPopoverCornerRadius:8.0];
    -[TSWPopoverTheme setPopoverContentInsets:](v2, "setPopoverContentInsets:", 8.0, 12.0, 8.0, 12.0);
    -[TSWPopoverTheme setPopoverFadeInsets:](v2, "setPopoverFadeInsets:", TSDEdgeInsetsZero[0].f64[0], TSDEdgeInsetsZero[0].f64[1], TSDEdgeInsetsZero[1].f64[0], TSDEdgeInsetsZero[1].f64[1]);
    -[TSWPopoverTheme setPopoverFadeSizes:](v2, "setPopoverFadeSizes:", 4.0, 0.0, 4.0, 0.0);
    [(TSWPopoverTheme *)v2 setPopoverShadowColor:+[TSUColor blackColor]];
    -[TSWPopoverTheme setPopoverShadowOffset:](v2, "setPopoverShadowOffset:", 0.0, 10.0);
    [(TSWPopoverTheme *)v2 setPopoverShadowRadius:25.0];
    [(TSWPopoverTheme *)v2 setPopoverShadowOpacity:0.5];
    [(TSWPopoverTheme *)v2 setPresentationMode:TSUPhoneUI()];
  }
  return v2;
}

- (void)dealloc
{
  [(TSWPopoverTheme *)self setPopoverBackgroundColor:0];
  [(TSWPopoverTheme *)self setPopoverStroke:0];
  [(TSWPopoverTheme *)self setPopoverShadowColor:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPopoverTheme;
  [(TSWPopoverTheme *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(TSWPopoverTheme);
  [(TSWPopoverTheme *)v5 setPopoverHasGradientBackground:[(TSWPopoverTheme *)self popoverHasGradientBackground]];
  [(TSWPopoverTheme *)self popoverCornerRadius];
  -[TSWPopoverTheme setPopoverCornerRadius:](v5, "setPopoverCornerRadius:");
  [(TSWPopoverTheme *)self popoverContentInsets];
  -[TSWPopoverTheme setPopoverContentInsets:](v5, "setPopoverContentInsets:");
  [(TSWPopoverTheme *)self popoverFadeInsets];
  -[TSWPopoverTheme setPopoverFadeInsets:](v5, "setPopoverFadeInsets:");
  [(TSWPopoverTheme *)self popoverFadeSizes];
  -[TSWPopoverTheme setPopoverFadeSizes:](v5, "setPopoverFadeSizes:");
  [(TSWPopoverTheme *)self popoverShadowOffset];
  -[TSWPopoverTheme setPopoverShadowOffset:](v5, "setPopoverShadowOffset:");
  [(TSWPopoverTheme *)self popoverShadowRadius];
  -[TSWPopoverTheme setPopoverShadowRadius:](v5, "setPopoverShadowRadius:");
  [(TSWPopoverTheme *)self popoverShadowOpacity];
  -[TSWPopoverTheme setPopoverShadowOpacity:](v5, "setPopoverShadowOpacity:");
  [(TSWPopoverTheme *)v5 setPresentationMode:[(TSWPopoverTheme *)self presentationMode]];
  [(TSWPopoverTheme *)v5 setPopoverBackgroundColor:[(TSUColor *)[(TSWPopoverTheme *)self popoverBackgroundColor] copy]];
  [(TSWPopoverTheme *)v5 setPopoverStroke:[(TSDStroke *)[(TSWPopoverTheme *)self popoverStroke] mutableCopyWithZone:a3]];
  [(TSWPopoverTheme *)v5 setPopoverShadowColor:[(TSUColor *)[(TSWPopoverTheme *)self popoverShadowColor] copy]];
  return v5;
}

- (void)scaleWithFactor:(double)a3
{
  self->_popoverCornerRadius = self->_popoverCornerRadius * a3;
  float64x2_t v4 = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeInsets.top, a3);
  *(float64x2_t *)&self->_popoverContentInsets.bottom = vmulq_n_f64(*(float64x2_t *)&self->_popoverContentInsets.bottom, a3);
  *(float64x2_t *)&self->_popoverFadeInsets.top = v4;
  float64x2_t v5 = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeSizes.top, a3);
  *(float64x2_t *)&self->_popoverFadeInsets.bottom = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeInsets.bottom, a3);
  *(float64x2_t *)&self->_popoverFadeSizes.top = v5;
  *(float64x2_t *)&self->_popoverFadeSizes.bottom = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeSizes.bottom, a3);
  float64x2_t v6 = vmulq_n_f64(*(float64x2_t *)&self->_popoverContentInsets.top, a3);
  self->_popoverShadowOffset = (CGSize)vmulq_n_f64((float64x2_t)self->_popoverShadowOffset, a3);
  *(float64x2_t *)&self->_popoverContentInsets.top = v6;
  self->_popoverShadowRadius = self->_popoverShadowRadius * a3;
  id v7 = [(TSDStroke *)[(TSWPopoverTheme *)self popoverStroke] mutableCopy];
  [v7 width];
  [v7 setWidth:v8 * a3];
  [v7 miterLimit];
  [v7 setMiterLimit:v9 * a3];

  [(TSWPopoverTheme *)self setPopoverStroke:v7];
}

- (TSUColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
}

- (BOOL)popoverHasGradientBackground
{
  return self->_popoverHasGradientBackground;
}

- (void)setPopoverHasGradientBackground:(BOOL)a3
{
  self->_popoverHasGradientBackground = a3;
}

- (TSDStroke)popoverStroke
{
  return self->_popoverStroke;
}

- (void)setPopoverStroke:(id)a3
{
}

- (double)popoverCornerRadius
{
  return self->_popoverCornerRadius;
}

- (void)setPopoverCornerRadius:(double)a3
{
  self->_popoverCornerRadius = a3;
}

- (UIEdgeInsets)popoverContentInsets
{
  double top = self->_popoverContentInsets.top;
  double left = self->_popoverContentInsets.left;
  double bottom = self->_popoverContentInsets.bottom;
  double right = self->_popoverContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPopoverContentInsets:(UIEdgeInsets)a3
{
  self->_popoverContentInsets = a3;
}

- (UIEdgeInsets)popoverFadeInsets
{
  double top = self->_popoverFadeInsets.top;
  double left = self->_popoverFadeInsets.left;
  double bottom = self->_popoverFadeInsets.bottom;
  double right = self->_popoverFadeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPopoverFadeInsets:(UIEdgeInsets)a3
{
  self->_popoverFadeInsets = a3;
}

- (UIEdgeInsets)popoverFadeSizes
{
  double top = self->_popoverFadeSizes.top;
  double left = self->_popoverFadeSizes.left;
  double bottom = self->_popoverFadeSizes.bottom;
  double right = self->_popoverFadeSizes.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPopoverFadeSizes:(UIEdgeInsets)a3
{
  self->_popoverFadeSizes = a3;
}

- (TSUColor)popoverShadowColor
{
  return self->_popoverShadowColor;
}

- (void)setPopoverShadowColor:(id)a3
{
}

- (CGSize)popoverShadowOffset
{
  double width = self->_popoverShadowOffset.width;
  double height = self->_popoverShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPopoverShadowOffset:(CGSize)a3
{
  self->_popoverShadowOffset = a3;
}

- (double)popoverShadowRadius
{
  return self->_popoverShadowRadius;
}

- (void)setPopoverShadowRadius:(double)a3
{
  self->_popoverShadowRadius = a3;
}

- (double)popoverShadowOpacity
{
  return self->_popoverShadowOpacity;
}

- (void)setPopoverShadowOpacity:(double)a3
{
  self->_popoverShadowOpacity = a3;
}

- (int)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int)a3
{
  self->_presentationMode = a3;
}

@end