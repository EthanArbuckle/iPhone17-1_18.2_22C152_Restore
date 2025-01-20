@interface NTKWorldClockHighlightedMapLocationView
- (NTKWorldClockHighlightedMapLocationView)initWithFrame:(CGRect)a3 fillColor:(id)a4 strokeColor:(id)a5 strokeWidth:(double)a6;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)strokeWidth;
- (void)drawRect:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation NTKWorldClockHighlightedMapLocationView

- (NTKWorldClockHighlightedMapLocationView)initWithFrame:(CGRect)a3 fillColor:(id)a4 strokeColor:(id)a5 strokeWidth:(double)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NTKWorldClockHighlightedMapLocationView;
  v16 = -[NTKWorldClockMapLocationView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_fillColor, a4);
    objc_storeStrong((id *)&v17->_strokeColor, a5);
    v17->_strokeWidth = a6;
    [(NTKWorldClockHighlightedMapLocationView *)v17 setOpaque:0];
  }

  return v17;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(NTKWorldClockHighlightedMapLocationView *)self strokeWidth];
  CGFloat v9 = v8 * 0.5;
  [(NTKWorldClockHighlightedMapLocationView *)self strokeWidth];
  CGFloat v11 = v10 * 0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectInset(v21, v9, v11);
  CGFloat v12 = v22.origin.x;
  CGFloat v13 = v22.origin.y;
  CGFloat v14 = v22.size.width;
  CGFloat v15 = v22.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v17 = [(NTKWorldClockHighlightedMapLocationView *)self fillColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v17 CGColor]);

  id v18 = [(NTKWorldClockHighlightedMapLocationView *)self strokeColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v18 CGColor]);

  [(NTKWorldClockHighlightedMapLocationView *)self strokeWidth];
  CGContextSetLineWidth(CurrentContext, v19);
  v23.origin.CGFloat x = v12;
  v23.origin.CGFloat y = v13;
  v23.size.CGFloat width = v14;
  v23.size.CGFloat height = v15;
  CGContextFillEllipseInRect(CurrentContext, v23);
  v24.origin.CGFloat x = v12;
  v24.origin.CGFloat y = v13;
  v24.size.CGFloat width = v14;
  v24.size.CGFloat height = v15;
  CGContextStrokeEllipseInRect(CurrentContext, v24);

  CGContextFillPath(CurrentContext);
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(NTKWorldClockHighlightedMapLocationView *)self setNeedsDisplay];
  }
}

- (void)setStrokeColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_strokeColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    [(NTKWorldClockHighlightedMapLocationView *)self setNeedsDisplay];
  }
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end