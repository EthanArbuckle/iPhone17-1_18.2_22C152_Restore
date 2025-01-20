@interface _UIPreviewPresentationEffectView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)shouldRasterizeForTransition;
- (CGSize)shadowOffset;
- (UIColor)shadowColor;
- (_UIPreviewPresentationEffectView)initWithFrame:(CGRect)a3;
- (double)blurRadius;
- (double)cornerRadius;
- (double)shadowAlpha;
- (double)shadowRadius;
- (void)setBlurRadius:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShouldRasterizeForTransition:(BOOL)a3;
@end

@implementation _UIPreviewPresentationEffectView

- (_UIPreviewPresentationEffectView)initWithFrame:(CGRect)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UIPreviewPresentationEffectView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v5 = (void *)[v4 initWithType:*MEMORY[0x1E4F3A0D0]];
    [v5 setValue:&unk_1ED3F2248 forKey:*MEMORY[0x1E4F1E4E0]];
    [v5 setValue:@"low" forKey:@"inputQuality"];
    [v5 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
    [v5 setName:@"gaussianBlur"];
    v13[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v7 = [(UIView *)v3 layer];
    [v7 setFilters:v6];

    -[_UIPreviewPresentationEffectView setShadowOffset:](v3, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(_UIPreviewPresentationEffectView *)v3 setShadowRadius:0.0];
    v8 = +[UIColor blackColor];
    v9 = [v8 colorWithAlphaComponent:0.333333333];
    [(_UIPreviewPresentationEffectView *)v3 setShadowColor:v9];

    [(_UIPreviewPresentationEffectView *)v3 setShadowAlpha:0.0];
    v10 = v3;
  }
  return v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewPresentationEffectView;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"] & 1) != 0
    || ([v4 isEqualToString:@"cornerRadius"] & 1) != 0
    || ([v4 isEqualToString:@"shadowOpacity"] & 1) != 0
    || ([v4 isEqualToString:@"shadowOffset"] & 1) != 0
    || ([v4 isEqualToString:@"shadowRadius"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"shadowColor"];
  }

  return v5;
}

- (double)blurRadius
{
  v2 = [(UIView *)self layer];
  v3 = [v2 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(UIView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)setCornerRadius:(double)a3
{
  id v5 = [(UIView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"cornerRadius"];
}

- (double)cornerRadius
{
  v2 = [(UIView *)self layer];
  v3 = [v2 valueForKeyPath:@"cornerRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setShadowAlpha:(double)a3
{
  id v5 = [(UIView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"shadowOpacity"];
}

- (double)shadowAlpha
{
  v2 = [(UIView *)self layer];
  v3 = [v2 valueForKeyPath:@"shadowOpacity"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(UIView *)self layer];
  double v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  [v6 setValue:v5 forKeyPath:@"shadowOffset"];
}

- (CGSize)shadowOffset
{
  v2 = [(UIView *)self layer];
  v3 = [v2 valueForKeyPath:@"shadowOffset"];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)setShadowRadius:(double)a3
{
  id v5 = [(UIView *)self layer];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"shadowRadius"];
}

- (double)shadowRadius
{
  v2 = [(UIView *)self layer];
  v3 = [v2 valueForKeyPath:@"shadowRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setShadowColor:(id)a3
{
  id v9 = a3;
  double v4 = [(_UIPreviewPresentationEffectView *)self shadowColor];
  char v5 = [v4 isEqual:v9];

  if ((v5 & 1) == 0)
  {
    double v6 = (UIColor *)[v9 copy];
    shadowColor = self->_shadowColor;
    self->_shadowColor = v6;

    double v8 = [(UIView *)self layer];
    objc_msgSend(v8, "setValue:forKeyPath:", -[UIColor CGColor](self->_shadowColor, "CGColor"), @"shadowColor");
  }
}

- (void)setShouldRasterizeForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldRasterizeForTransition = a3;
  char v5 = [(UIView *)self layer];
  [v5 setShouldRasterize:v3];

  double v6 = [(UIView *)self window];
  double v7 = [v6 screen];
  [v7 scale];
  double v9 = v8;

  if (v9 >= 3.0) {
    double v9 = v9 * 0.5;
  }
  id v10 = [(UIView *)self layer];
  [v10 setRasterizationScale:v9];
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (BOOL)shouldRasterizeForTransition
{
  return self->_shouldRasterizeForTransition;
}

- (void).cxx_destruct
{
}

@end