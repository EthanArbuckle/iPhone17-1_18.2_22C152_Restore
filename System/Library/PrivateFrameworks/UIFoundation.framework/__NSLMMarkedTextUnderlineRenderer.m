@interface __NSLMMarkedTextUnderlineRenderer
- (double)renderUnderline;
- (void)_renderUnderlineStartX:(double)a3 endX:(double)a4 yPosition:(double)a5 alphaValue:(double)a6;
- (void)dealloc;
- (void)processMarkedTextUnderlineStartX:(int)a3 endX:(double)a4 yPosition:(double)a5 underlineColor:(double)a6 selected:;
@end

@implementation __NSLMMarkedTextUnderlineRenderer

- (void)processMarkedTextUnderlineStartX:(int)a3 endX:(double)a4 yPosition:(double)a5 underlineColor:(double)a6 selected:
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    double v12 = *(double *)(a1 + 40);
    double v11 = *(double *)(a1 + 48);
    double v14 = *(double *)(a1 + 56);
    double v13 = *(double *)(a1 + 64);
    if (v11 > v12) {
      int v15 = a3;
    }
    else {
      int v15 = 0;
    }
    if (v13 <= v14) {
      int v15 = 1;
    }
    if (v15) {
      double v16 = *(double *)(a1 + 40);
    }
    else {
      double v16 = *(double *)(a1 + 56);
    }
    if (v15) {
      double v17 = *(double *)(a1 + 48);
    }
    else {
      double v17 = *(double *)(a1 + 64);
    }
    if (![*(id *)(a1 + 16) isEqual:a2]
      || *(double *)(a1 + 32) != a6
      || vabdd_f64(a4, v17) > 0.001 && vabdd_f64(a5, v16) > 0.001)
    {
      -[__NSLMMarkedTextUnderlineRenderer renderUnderline](a1);
      goto LABEL_17;
    }
    if (!a3)
    {
      if (v13 <= v14)
      {
        *(double *)(a1 + 56) = a4;
LABEL_44:
        *(double *)(a1 + 64) = a5;
        goto LABEL_17;
      }
LABEL_41:
      if (*(double *)(a1 + 56) > a4) {
        *(double *)(a1 + 56) = a4;
      }
      if (*(double *)(a1 + 64) >= a5) {
        goto LABEL_17;
      }
      goto LABEL_44;
    }
    if (v11 <= v12)
    {
      *(double *)(a1 + 40) = a4;
    }
    else
    {
      if (*(double *)(a1 + 40) > a4) {
        *(double *)(a1 + 40) = a4;
      }
      if (*(double *)(a1 + 48) >= a5)
      {
LABEL_40:
        if (v13 <= v14) {
          goto LABEL_17;
        }
        goto LABEL_41;
      }
    }
    *(double *)(a1 + 48) = a5;
    goto LABEL_40;
  }
LABEL_17:
  if (a5 > a4 && *(unsigned char *)(a1 + 24) == 0)
  {
    *(void *)(a1 + 16) = a2;
    *(double *)(a1 + 32) = a6;
    uint64_t v19 = 56;
    if (a3) {
      uint64_t v19 = 40;
    }
    uint64_t v20 = 64;
    if (a3) {
      uint64_t v20 = 48;
    }
    *(double *)(a1 + v19) = a4;
    *(double *)(a1 + v20) = a5;
    *(unsigned char *)(a1 + 24) = 1;
  }
}

- (double)renderUnderline
{
  if (a1 && *(unsigned char *)(a1 + 24))
  {
    double v2 = 0.35;
    if (*(double *)(a1 + 40) == *(double *)(a1 + 48)) {
      double v2 = 1.0;
    }
    [(id)a1 _renderUnderlineStartX:*(double *)(a1 + 56) endX:*(double *)(a1 + 64) yPosition:*(double *)(a1 + 32) alphaValue:v2];
    [(id)a1 _renderUnderlineStartX:*(double *)(a1 + 40) endX:*(double *)(a1 + 48) yPosition:*(double *)(a1 + 32) alphaValue:1.0];
    *(unsigned char *)(a1 + 24) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(void *)(a1 + 64) = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSLMMarkedTextUnderlineRenderer;
  [(__NSLMMarkedTextUnderlineRenderer *)&v3 dealloc];
}

- (void)_renderUnderlineStartX:(double)a3 endX:(double)a4 yPosition:(double)a5 alphaValue:(double)a6
{
  if (a4 > a3)
  {
    double v9 = a4;
    double v10 = a3;
    CGContextSaveGState(self->_cgContextRef);
    [(UIColor *)self->_underlineColor set];
    if (v9 - v10 > 1.0) {
      double v10 = v10 + 1.0;
    }
    if (v9 - v10 > 1.0) {
      double v9 = v9 + -1.0;
    }
    CGContextSetLineWidth(self->_cgContextRef, 2.0);
    CGContextSetLineCap(self->_cgContextRef, kCGLineCapRound);
    CGContextSetAlpha(self->_cgContextRef, a6);
    CGContextMoveToPoint(self->_cgContextRef, v10, a5);
    CGContextAddLineToPoint(self->_cgContextRef, v9, a5);
    CGContextStrokePath(self->_cgContextRef);
    cgContextRef = self->_cgContextRef;
    CGContextRestoreGState(cgContextRef);
  }
}

@end