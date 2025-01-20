@interface _UITextHighlightBackgroundView
- (CALayer)shadowLayer;
- (CAShapeLayer)highlightLayer;
- (UIBezierPath)visiblePath;
- (_UITextHighlightBackgroundView)initWithFrame:(CGRect)a3;
- (void)setVisiblePath:(id)a3;
@end

@implementation _UITextHighlightBackgroundView

- (_UITextHighlightBackgroundView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UITextHighlightBackgroundView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    shadowLayer = v3->_shadowLayer;
    v3->_shadowLayer = v4;

    [(CALayer *)v3->_shadowLayer setShadowColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB60])];
    LODWORD(v6) = 0.25;
    [(CALayer *)v3->_shadowLayer setShadowOpacity:v6];
    -[CALayer setShadowOffset:](v3->_shadowLayer, "setShadowOffset:", 0.0, 5.0);
    [(CALayer *)v3->_shadowLayer setShadowRadius:15.0];
    v7 = [(UIView *)v3 layer];
    [v7 addSublayer:v3->_shadowLayer];

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    highlightLayer = v3->_highlightLayer;
    v3->_highlightLayer = v8;

    _UIGetTextHighlightFillColor();
    id v10 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setFillColor:](v3->_highlightLayer, "setFillColor:", [v10 CGColor]);

    v11 = [(UIView *)v3 layer];
    [v11 addSublayer:v3->_highlightLayer];
  }
  return v3;
}

- (void)setVisiblePath:(id)a3
{
  v4 = (UIBezierPath *)[a3 copy];
  visiblePath = self->_visiblePath;
  self->_visiblePath = v4;

  [(CAShapeLayer *)self->_highlightLayer setPath:[(UIBezierPath *)self->_visiblePath CGPath]];
  double v6 = [(UIBezierPath *)self->_visiblePath CGPath];
  id v7 = [(_UITextHighlightBackgroundView *)self shadowLayer];
  [v7 setShadowPath:v6];
}

- (UIBezierPath)visiblePath
{
  return self->_visiblePath;
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (CAShapeLayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_visiblePath, 0);
}

@end