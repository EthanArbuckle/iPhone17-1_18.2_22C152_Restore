@interface SBCursiveTextView
- (SBCursiveTextView)init;
- (SBCursiveTextView)initWithFrame:(CGRect)a3;
- (double)duration;
- (void)configure;
- (void)layoutSubviews;
- (void)loadText:(id)a3 pointSize:(double)a4;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityLanguage:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setTime:(float)a3;
@end

@implementation SBCursiveTextView

- (SBCursiveTextView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBCursiveTextView;
  v2 = [(SBCursiveTextView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SBCursiveTextView *)v2 configure];
  }
  return v3;
}

- (SBCursiveTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBCursiveTextView;
  v3 = -[SBCursiveTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBCursiveTextView *)v3 configure];
  }
  return v4;
}

- (void)configure
{
  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  textLayer = self->_textLayer;
  self->_textLayer = v3;

  objc_super v5 = self->_textLayer;
  [(SBCursiveTextView *)self bounds];
  -[CAShapeLayer setFrame:](v5, "setFrame:");
  [(CAShapeLayer *)self->_textLayer setShadowRadius:1.0];
  LODWORD(v6) = 1036831949;
  [(CAShapeLayer *)self->_textLayer setShadowOpacity:v6];
  -[CAShapeLayer setShadowOffset:](self->_textLayer, "setShadowOffset:", 0.0, 1.0);
  id v7 = [(SBCursiveTextView *)self layer];
  [v7 addSublayer:self->_textLayer];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBCursiveTextView;
  [(SBCursiveTextView *)&v4 layoutSubviews];
  textLayer = self->_textLayer;
  [(SBCursiveTextView *)self bounds];
  -[CAShapeLayer setFrame:](textLayer, "setFrame:");
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  double v6 = [[SBCursiveTextPath alloc] initWithURL:v5];

  textPath = self->_textPath;
  self->_textPath = v6;

  v8 = self->_textPath;
  if (v8)
  {
    [(CAShapeLayer *)self->_textLayer bounds];
    -[SBCursiveTextPath transformForRect:pointSize:flipped:](v8, "transformForRect:pointSize:flipped:", 1);
    *(_OWORD *)&self->_textTransform.a = v9;
    *(_OWORD *)&self->_textTransform.c = v10;
    *(_OWORD *)&self->_textTransform.tx = v11;
  }
}

- (double)duration
{
  [(SBCursiveTextPath *)self->_textPath duration];
  return result;
}

- (void)setTime:(float)a3
{
  objc_super v4 = [(SBCursiveTextPath *)self->_textPath pathForTime:a3];
  id v5 = (const CGPath *)MEMORY[0x1D9488FC0](v4, &self->_textTransform);
  [(CAShapeLayer *)self->_textLayer setPath:v5];
  [(CAShapeLayer *)self->_textLayer setShadowPath:v5];
  CGPathRelease(v5);
  CGPathRelease(v4);
}

- (void)setFillColor:(id)a3
{
  textLayer = self->_textLayer;
  uint64_t v4 = [a3 CGColor];
  [(CAShapeLayer *)textLayer setFillColor:v4];
}

- (void)setAccessibilityLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCursiveTextView;
  id v4 = a3;
  [(SBCursiveTextView *)&v5 setAccessibilityLabel:v4];
  -[SBCursiveTextPath setAccessibilityLabel:](self->_textPath, "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);
}

- (void)setAccessibilityLanguage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCursiveTextView;
  id v4 = a3;
  [(SBCursiveTextView *)&v5 setAccessibilityLanguage:v4];
  -[SBCursiveTextPath setAccessibilityLanguage:](self->_textPath, "setAccessibilityLanguage:", v4, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPath, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);
}

@end