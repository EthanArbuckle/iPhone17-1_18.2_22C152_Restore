@interface PLProgressArcLayer
- (PLProgressArcLayer)init;
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

@implementation PLProgressArcLayer

- (double)lineWidth
{
  return self->_lineWidth;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (double)radius
{
  return self->_radius;
}

- (void)setLineWidth:(double)a3
{
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    [(PLProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)setEndAngle:(double)a3
{
  if (self->_endAngle != a3)
  {
    self->_endAngle = a3;
    [(PLProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)setStartAngle:(double)a3
{
  if (self->_startAngle != a3)
  {
    self->_startAngle = a3;
    [(PLProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    [(PLProgressArcLayer *)self setNeedsDisplay];
  }
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(PLProgressArcLayer *)self bounds];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  CGFloat MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v32);
  [(PLProgressArcLayer *)self radius];
  double v10 = v9;
  [(PLProgressArcLayer *)self lineWidth];
  double v12 = v11;
  [(PLProgressArcLayer *)self startAngle];
  CGFloat v14 = v13;
  [(PLProgressArcLayer *)self endAngle];
  double v16 = v15;
  v20[1] = 3221225472;
  v20[0] = MEMORY[0x1E4F143A8];
  v21 = __36__PLProgressArcLayer_drawInContext___block_invoke;
  v22 = &__block_descriptor_96_e8_v16__0d8l;
  CGFloat v17 = v10 + v12 * -0.5;
  CGFloat v23 = x;
  CGFloat v24 = y;
  CGFloat v25 = width;
  CGFloat v26 = height;
  double v27 = v12;
  CGFloat v28 = MidX;
  CGFloat v29 = MidY;
  v30 = a3;
  __36__PLProgressArcLayer_drawInContext___block_invoke((uint64_t)v20, v14);
  v21((uint64_t)v20, v16);
  CGContextSetLineWidth(a3, v12);
  CGContextAddArc(a3, MidX, MidY, v17, v14, v16, 0);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "whiteColor"), "CGColor"));
  CGContextStrokePath(a3);
  CGContextAddArc(a3, MidX, MidY, v17, v16, v14 + 6.28318531, 0);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 1.0, 0.600000024), "CGColor"));
  CGContextStrokePath(a3);
  CGContextRestoreGState(a3);
}

void __36__PLProgressArcLayer_drawInContext___block_invoke(uint64_t a1, CGFloat a2)
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

- (PLProgressArcLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLProgressArcLayer;
  v2 = [(PLProgressArcLayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_lineWidth = 1.0;
    [(PLProgressArcLayer *)v2 setNeedsDisplayOnBoundsChange:1];
  }
  return v3;
}

@end