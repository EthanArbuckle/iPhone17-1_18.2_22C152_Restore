@interface _UIPlatterShadowView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)punchOut;
- (CGSize)shadowOffset;
- (UIBezierPath)shadowPath;
- (UIColor)shadowColor;
- (_UIPlatterShadowView)initWithShadowPath:(id)a3;
- (_UIShapeView)shadowMaskView;
- (double)shadowOpacity;
- (double)shadowRadius;
- (void)setPunchOut:(BOOL)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowPath:(id)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation _UIPlatterShadowView

- (_UIPlatterShadowView)initWithShadowPath:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v11.receiver = self;
  v11.super_class = (Class)_UIPlatterShadowView;
  v5 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0);
  v6 = v5;
  if (v5)
  {
    v7 = [(UIView *)v5 layer];
    [v7 setAllowsGroupBlending:1];

    [(_UIPlatterShadowView *)v6 setShadowPath:v4];
    v8 = +[UIColor blackColor];
    [(_UIPlatterShadowView *)v6 setShadowColor:v8];

    v9 = v6;
  }

  return v6;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIPlatterShadowView;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"shadowOpacity"] & 1) != 0
    || ([v4 isEqualToString:@"shadowColor"] & 1) != 0
    || ([v4 isEqualToString:@"shadowRadius"] & 1) != 0
    || ([v4 isEqualToString:@"shadowOffset"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"shadowPath"];
  }

  return v5;
}

- (void)setPunchOut:(BOOL)a3
{
  if (self->_punchOut != a3)
  {
    self->_punchOut = a3;
    shadowMaskView = self->_shadowMaskView;
    if (a3)
    {
      if (!shadowMaskView)
      {
        char v5 = [_UIShapeView alloc];
        [(UIView *)self bounds];
        v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
        objc_super v7 = self->_shadowMaskView;
        self->_shadowMaskView = v6;

        uint64_t v8 = *MEMORY[0x1E4F3A098];
        v9 = [(UIView *)self->_shadowMaskView layer];
        [v9 setCompositingFilter:v8];

        v10 = [(UIView *)self layer];
        uint64_t v11 = [v10 shadowPath];
        v12 = [(_UIShapeView *)self->_shadowMaskView shapeLayer];
        [v12 setPath:v11];

        shadowMaskView = self->_shadowMaskView;
      }
      [(UIView *)self addSubview:shadowMaskView];
    }
    else
    {
      v13 = self->_shadowMaskView;
      [(UIView *)v13 removeFromSuperview];
    }
  }
}

- (void)setShadowColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [(UIView *)self layer];
  [v5 setShadowColor:v4];
}

- (UIColor)shadowColor
{
  v2 = [(UIView *)self layer];
  v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 shadowColor]);

  return (UIColor *)v3;
}

- (void)setShadowRadius:(double)a3
{
  id v5 = [(UIView *)self layer];
  [v5 setShadowRadius:a3];

  [(UIView *)self setNeedsLayout];
}

- (double)shadowRadius
{
  v2 = [(UIView *)self layer];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(double)a3
{
  float v3 = a3;
  id v5 = [(UIView *)self layer];
  *(float *)&double v4 = v3;
  [v5 setShadowOpacity:v4];
}

- (double)shadowOpacity
{
  v2 = [(UIView *)self layer];
  [v2 shadowOpacity];
  double v4 = v3;

  return v4;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(UIView *)self layer];
  objc_msgSend(v5, "setShadowOffset:", width, height);
}

- (CGSize)shadowOffset
{
  v2 = [(UIView *)self layer];
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (UIBezierPath)shadowPath
{
  v2 = [(UIView *)self layer];
  double v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v2 shadowPath]);

  return (UIBezierPath *)v3;
}

- (void)setShadowPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 CGPath];
  double v6 = [(UIView *)self layer];
  [v6 setShadowPath:v5];

  id v7 = v4;
  uint64_t v8 = [v7 CGPath];

  id v10 = [(_UIPlatterShadowView *)self shadowMaskView];
  v9 = [v10 shapeLayer];
  [v9 setPath:v8];
}

- (BOOL)punchOut
{
  return self->_punchOut;
}

- (_UIShapeView)shadowMaskView
{
  return self->_shadowMaskView;
}

- (void).cxx_destruct
{
}

@end