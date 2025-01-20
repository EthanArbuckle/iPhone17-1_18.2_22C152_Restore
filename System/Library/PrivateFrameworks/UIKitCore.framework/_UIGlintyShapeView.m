@interface _UIGlintyShapeView
+ (Class)layerClass;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (_UIGlintyShapeView)initWithFrame:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setPath:(id)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation _UIGlintyShapeView

- (_UIGlintyShapeView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIGlintyShapeView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    v6 = [(UIView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    [(UIView *)v4 setOpaque:0];
    v7 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v7];

    v8 = v4;
  }

  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGPath];

  id v7 = [(_UIGlintyShapeView *)self shapeLayer];
  [v7 setPath:v6];
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGColor];

  id v7 = [(_UIGlintyShapeView *)self shapeLayer];
  [v7 setFillColor:v6];
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGColor];

  id v7 = [(_UIGlintyShapeView *)self shapeLayer];
  [v7 setStrokeColor:v6];
}

- (UIBezierPath)path
{
  return self->_path;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end