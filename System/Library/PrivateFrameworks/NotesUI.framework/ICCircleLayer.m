@interface ICCircleLayer
- (CGColor)fillColor;
- (CGColor)strokeColor;
- (double)strokeWidth;
- (void)drawInContext:(CGContext *)a3;
- (void)setFillColor:(CGColor *)a3;
- (void)setStrokeColor:(CGColor *)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation ICCircleLayer

- (void)drawInContext:(CGContext *)a3
{
  [(ICCircleLayer *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(ICCircleLayer *)self strokeWidth];
  CGFloat v14 = v13;
  [(ICCircleLayer *)self strokeWidth];
  CGFloat v16 = v15;
  v28.origin.CGFloat x = v6;
  v28.origin.CGFloat y = v8;
  v28.size.CGFloat width = v10;
  v28.size.CGFloat height = v12;
  CGRect v29 = CGRectInset(v28, v14, v16);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  [(ICCircleLayer *)self strokeWidth];
  if (v21 > 0.0 && [(ICCircleLayer *)self strokeColor])
  {
    [(ICCircleLayer *)self strokeWidth];
    CGContextSetLineWidth(a3, v22);
    CGContextSetStrokeColorWithColor(a3, [(ICCircleLayer *)self strokeColor]);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGContextStrokeEllipseInRect(a3, v30);
  }
  if ([(ICCircleLayer *)self fillColor])
  {
    CGContextSetFillColorWithColor(a3, [(ICCircleLayer *)self fillColor]);
    CGFloat v23 = x;
    CGFloat v24 = y;
    CGFloat v25 = width;
    CGFloat v26 = height;
    CGContextFillEllipseInRect(a3, *(CGRect *)&v23);
  }
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (CGColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(CGColor *)a3
{
}

- (CGColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(CGColor *)a3
{
}

@end