@interface UICheckeredPatternView
- (BOOL)_canDrawContent;
- (UICheckeredPatternView)initWithFrame:(CGRect)a3;
- (UIColor)checkerColor;
- (void)didMoveToWindow;
- (void)setCheckerColor:(id)a3;
- (void)updatePatternColor;
@end

@implementation UICheckeredPatternView

- (UICheckeredPatternView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICheckeredPatternView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIScreen mainScreen];
    [v4 scale];
    v3->_scale = v5;

    [(UIView *)v3 setUserInteractionEnabled:0];
    [(UICheckeredPatternView *)v3 updatePatternColor];
    v6 = v3;
  }

  return v3;
}

- (BOOL)_canDrawContent
{
  return 0;
}

- (void)didMoveToWindow
{
  v3 = [(UIView *)self window];
  v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;

  if (v6 != self->_scale)
  {
    self->_scale = v6;
    [(UICheckeredPatternView *)self updatePatternColor];
  }
}

- (void)updatePatternColor
{
  CGFloat v3 = self->_scale * 96.0;
  *(void *)&callbacks.version = 0;
  callbacks.drawPattern = (CGPatternDrawPatternCallback)DrawCheckeredPattern;
  v4 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  callbacks.releaseInfo = (CGPatternReleaseInfoCallback)ReleasePatternInfo;
  double v5 = [(UIColor *)self->_checkerColor CGColor];
  CGColorRetain(v5);
  void *v4 = v5;
  v4[1] = *(void *)&self->_scale;
  CGAffineTransformMakeScale(&matrix, 1.0 / self->_scale, 1.0 / self->_scale);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = v3;
  v14.size.height = v3;
  double v6 = CGPatternCreate(v4, v14, &matrix, v3, v3, kCGPatternTilingConstantSpacing, 1, &callbacks);
  Pattern = CGColorSpaceCreatePattern(0);
  objc_super v8 = CGColorCreateWithPattern(Pattern, v6, &updatePatternColor_alpha);
  v9 = [[UIColor alloc] initWithCGColor:v8];
  patternColor = self->_patternColor;
  self->_patternColor = v9;

  CGColorRelease(v8);
  CFRelease(Pattern);
  CFRelease(v6);
  v11 = [(UIView *)self layer];
  objc_msgSend(v11, "setBackgroundColor:", -[UIColor CGColor](self->_patternColor, "CGColor"));
}

- (void)setCheckerColor:(id)a3
{
  double v5 = (UIColor *)a3;
  checkerColor = self->_checkerColor;
  if (checkerColor != v5)
  {
    objc_super v8 = v5;
    BOOL v7 = [(UIColor *)checkerColor isEqual:v5];
    double v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_checkerColor, a3);
      [(UICheckeredPatternView *)self updatePatternColor];
      double v5 = v8;
    }
  }
}

- (UIColor)checkerColor
{
  return self->_checkerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkerColor, 0);
  objc_storeStrong((id *)&self->_patternColor, 0);
}

@end