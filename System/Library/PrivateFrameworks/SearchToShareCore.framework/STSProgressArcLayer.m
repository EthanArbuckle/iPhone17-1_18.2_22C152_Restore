@interface STSProgressArcLayer
- (STSProgressArcLayer)init;
- (double)endAngle;
- (double)lineWidth;
- (double)radius;
- (double)startAngle;
- (void)drawInContext:(CGContext *)a3;
- (void)setEndAngle:(double)a3;
- (void)setLineWidth:(double)a3;
- (void)setRadius:(double)a3;
- (void)setStartAngle:(double)a3;
@end

@implementation STSProgressArcLayer

- (STSProgressArcLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)STSProgressArcLayer;
  v2 = [(STSProgressArcLayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_lineWidth = 1.0;
    [(STSProgressArcLayer *)v2 setNeedsDisplayOnBoundsChange:1];
  }
  return v3;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(STSProgressArcLayer *)self bounds];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  CGFloat MidX = CGRectGetMidX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v25);
  [(STSProgressArcLayer *)self radius];
  double v10 = v9;
  [(STSProgressArcLayer *)self lineWidth];
  double v12 = v11;
  [(STSProgressArcLayer *)self startAngle];
  double v14 = v13;
  [(STSProgressArcLayer *)self endAngle];
  double v16 = v15;
  v23[1] = 3221225472;
  v23[0] = MEMORY[0x263EF8330];
  v23[2] = __37__STSProgressArcLayer_drawInContext___block_invoke;
  v23[3] = &__block_descriptor_96_e8_v16__0d8l;
  CGFloat v17 = v10 + v12 * -0.5;
  *(CGFloat *)&v23[4] = x;
  *(CGFloat *)&v23[5] = y;
  *(CGFloat *)&v23[6] = width;
  *(CGFloat *)&v23[7] = height;
  *(double *)&v23[8] = v12;
  *(CGFloat *)&v23[9] = MidX;
  *(CGFloat *)&v23[10] = MidY;
  v23[11] = a3;
  v18 = (void (**)(double))MEMORY[0x230FB7F40](v23);
  v18[2](v14);
  ((void (*)(void (**)(double), double))v18[2])(v18, v16);
  CGContextSetLineWidth(a3, v12);
  CGContextAddArc(a3, MidX, MidY, v17, v14, v16, 0);
  id v19 = [MEMORY[0x263F825C8] whiteColor];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v19 CGColor]);

  CGContextStrokePath(a3);
  CGContextAddArc(a3, MidX, MidY, v17, v16, v14 + 6.28318531, 0);
  id v20 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.600000024];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v20 CGColor]);

  CGContextStrokePath(a3);
  CGContextRestoreGState(a3);
}

void __37__STSProgressArcLayer_drawInContext___block_invoke(uint64_t a1, CGFloat a2)
{
  Mutable = CGPathCreateMutable();
  CGPathAddRect(Mutable, 0, *(CGRect *)(a1 + 32));
  CGFloat v5 = *(double *)(a1 + 72);
  CGFloat v6 = *(double *)(a1 + 64) * 0.5;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&v7, v5, *(CGFloat *)(a1 + 80));
  CGAffineTransformRotate(&m, &v7, a2);
  v9.size.CGFloat width = CGRectGetWidth(*(CGRect *)(a1 + 32)) * 0.5;
  v9.origin.CGFloat x = 0.0;
  v9.origin.CGFloat y = v6 * -0.5;
  v9.size.CGFloat height = v6;
  CGPathAddRect(Mutable, &m, v9);
  CGContextAddPath(*(CGContextRef *)(a1 + 88), Mutable);
  CGContextEOClip(*(CGContextRef *)(a1 + 88));
  CGPathRelease(Mutable);
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    [(STSProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)setStartAngle:(double)a3
{
  if (self->_startAngle != a3)
  {
    self->_startAngle = a3;
    [(STSProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)setEndAngle:(double)a3
{
  if (self->_endAngle != a3)
  {
    self->_endAngle = a3;
    [(STSProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)setLineWidth:(double)a3
{
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    [(STSProgressArcLayer *)self setNeedsDisplay];
  }
}

- (double)radius
{
  return self->_radius;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

@end