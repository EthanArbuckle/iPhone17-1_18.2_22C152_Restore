@interface STUIStatusBarBezierView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarBezierView)initWithFrame:(CGRect)a3;
- (UIBezierPath)bezierPath;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (UIEdgeInsets)alignmentRectInsets;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setBezierPath:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation STUIStatusBarBezierView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (STUIStatusBarBezierView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarBezierView;
  v3 = -[STUIStatusBarBezierView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(STUIStatusBarBezierView *)v3 shapeLayer];
  [v4 setFillColor:0];

  return v3;
}

- (void)setBezierPath:(id)a3
{
  v9 = (UIBezierPath *)a3;
  if (self->_bezierPath != v9)
  {
    objc_storeStrong((id *)&self->_bezierPath, a3);
    v5 = [(STUIStatusBarBezierView *)self shapeLayer];
    objc_super v6 = v9;
    objc_msgSend(v5, "setPath:", -[UIBezierPath CGPath](v6, "CGPath"));
    [(UIBezierPath *)v6 lineWidth];
    objc_msgSend(v5, "setLineWidth:");
    BOOL v7 = [(UIBezierPath *)v6 usesEvenOddFillRule];
    v8 = (void *)MEMORY[0x1E4F39FB8];
    if (!v7) {
      v8 = (void *)MEMORY[0x1E4F39FC0];
    }
    [v5 setFillRule:*v8];
    [(STUIStatusBarBezierView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_alignmentRectInsets.left
    || a3.top != self->_alignmentRectInsets.top
    || a3.right != self->_alignmentRectInsets.right
    || a3.bottom != self->_alignmentRectInsets.bottom)
  {
    self->_alignmentRectInsets = a3;
    [(STUIStatusBarBezierView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UIBezierPath *)self->_bezierPath bounds];
  double v4 = v3;
  double v6 = v5;
  [(STUIStatusBarBezierView *)self alignmentRectInsets];
  double v8 = v7;
  [(STUIStatusBarBezierView *)self alignmentRectInsets];
  double v10 = v6 - (v8 + v9);
  [(STUIStatusBarBezierView *)self alignmentRectInsets];
  double v12 = v11;
  [(STUIStatusBarBezierView *)self alignmentRectInsets];
  double v14 = v4 - (v12 + v13);
  double v15 = v10;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setFillColor:(id)a3
{
  double v7 = (UIColor *)a3;
  if (self->_fillColor != v7)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    uint64_t v5 = [(UIColor *)v7 CGColor];
    double v6 = [(STUIStatusBarBezierView *)self shapeLayer];
    [v6 setFillColor:v5];
  }
}

- (void)setStrokeColor:(id)a3
{
  double v7 = (UIColor *)a3;
  if (self->_strokeColor != v7)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    uint64_t v5 = [(UIColor *)v7 CGColor];
    double v6 = [(STUIStatusBarBezierView *)self shapeLayer];
    [v6 setStrokeColor:v5];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarBezierView;
  if ([(STUIStatusBarBezierView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"fillColor"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"strokeColor"];
  }

  return v5;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIBezierPath)bezierPath
{
  return self->_bezierPath;
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
  objc_storeStrong((id *)&self->_bezierPath, 0);
}

@end