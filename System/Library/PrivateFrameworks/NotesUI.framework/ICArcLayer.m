@interface ICArcLayer
- (BOOL)drawClockwise;
- (double)endAngle;
- (double)startAngle;
- (void)drawInContext:(CGContext *)a3;
- (void)setDrawClockwise:(BOOL)a3;
- (void)setEndAngle:(double)a3;
- (void)setStartAngle:(double)a3;
@end

@implementation ICArcLayer

- (void)drawInContext:(CGContext *)a3
{
  [(ICArcLayer *)self bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat v9 = CGRectGetWidth(v20) * 0.5;
  [(ICCircleLayer *)self strokeWidth];
  CGFloat v11 = v9 - v10;
  CGContextGetCTM(&v19, a3);
  CGContextScaleCTM(a3, 1.0, -1.0);
  [(ICArcLayer *)self bounds];
  CGContextTranslateCTM(a3, 0.0, -v12);
  CGContextSetLineCap(a3, kCGLineCapRound);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v22);
  [(ICArcLayer *)self startAngle];
  CGFloat v16 = v15;
  [(ICArcLayer *)self endAngle];
  CGContextAddArc(a3, MidX, MidY, v11, v16, v17, [(ICArcLayer *)self drawClockwise]);
  [(ICCircleLayer *)self strokeWidth];
  CGContextSetLineWidth(a3, v18);
  CGContextSetStrokeColorWithColor(a3, [(ICCircleLayer *)self strokeColor]);
  CGContextStrokePath(a3);
}

- (double)startAngle
{
  return self->_startAngle;
}

- (void)setStartAngle:(double)a3
{
  self->_startAngle = a3;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (void)setEndAngle:(double)a3
{
  self->_endAngle = a3;
}

- (BOOL)drawClockwise
{
  return self->_drawClockwise;
}

- (void)setDrawClockwise:(BOOL)a3
{
  self->_drawClockwise = a3;
}

@end