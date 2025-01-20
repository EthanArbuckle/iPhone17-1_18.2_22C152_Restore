@interface TransitDirectionsColoredLine
- (TransitDirectionsColoredLine)initWithFrame:(CGRect)a3;
- (TransitDirectionsColoredLine)initWithStyle:(unint64_t)a3;
- (UIColor)lineColor;
- (double)innerGapLength;
- (double)outerGapLength;
- (unint64_t)_maximumNumberOfDots:(double *)a3;
- (unint64_t)style;
- (void)drawRect:(CGRect)a3;
- (void)setInnerGapLength:(double)a3;
- (void)setLineColor:(id)a3;
- (void)setOuterGapLength:(double)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation TransitDirectionsColoredLine

- (TransitDirectionsColoredLine)initWithStyle:(unint64_t)a3
{
  result = -[TransitDirectionsColoredLine initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (TransitDirectionsColoredLine)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsColoredLine;
  v3 = -[TransitDirectionsColoredLine initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(TransitDirectionsColoredLine *)v3 setBackgroundColor:v4];

    [(TransitDirectionsColoredLine *)v3 setContentMode:3];
  }
  return v3;
}

- (void)setLineColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    [(TransitDirectionsColoredLine *)self setNeedsDisplay];
    v5 = v6;
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(TransitDirectionsColoredLine *)self setNeedsDisplay];
  }
}

- (void)setOuterGapLength:(double)a3
{
  if (self->_outerGapLength != a3)
  {
    self->_outerGapLength = a3;
    [(TransitDirectionsColoredLine *)self setNeedsDisplay];
  }
}

- (double)innerGapLength
{
  double result = self->_innerGapLength;
  if (result <= 0.0)
  {
    [(TransitDirectionsColoredLine *)self bounds];
    return CGRectGetWidth(*(CGRect *)&v3);
  }
  return result;
}

- (void)setInnerGapLength:(double)a3
{
  if (self->_innerGapLength != a3)
  {
    self->_innerGapLength = a3;
    [(TransitDirectionsColoredLine *)self setNeedsDisplay];
  }
}

- (unint64_t)_maximumNumberOfDots:(double *)a3
{
  [(TransitDirectionsColoredLine *)self bounds];
  double Width = CGRectGetWidth(v20);
  [(TransitDirectionsColoredLine *)self innerGapLength];
  double v7 = v6;
  [(TransitDirectionsColoredLine *)self outerGapLength];
  double v9 = v8;
  [(TransitDirectionsColoredLine *)self bounds];
  double Height = CGRectGetHeight(v21);
  [(TransitDirectionsColoredLine *)self outerGapLength];
  double v12 = Height - v11;
  double v13 = Width + v9;
  uint64_t v14 = 0;
  while (v13 <= v12)
  {
    ++v14;
    double v13 = Width + v7 + v13;
  }
  unint64_t v15 = (v14 & 1) + v14;
  if (a3)
  {
    [(TransitDirectionsColoredLine *)self outerGapLength];
    double v17 = Width * (double)(v15 - 1) + v16 * 2.0;
    if (v15 != 1)
    {
      [(TransitDirectionsColoredLine *)self innerGapLength];
      double v17 = v17 + (double)v15 * v18;
    }
    *a3 = v17;
  }
  return v15 - 1;
}

- (void)drawRect:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)TransitDirectionsColoredLine;
  -[TransitDirectionsColoredLine drawRect:](&v27, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(TransitDirectionsColoredLine *)self lineColor];
  if (v4)
  {
    unint64_t v5 = [(TransitDirectionsColoredLine *)self style];
    [(TransitDirectionsColoredLine *)self bounds];
    double Width = CGRectGetWidth(v29);
    double v26 = 0.0;
    if (v5 != 3 || [(TransitDirectionsColoredLine *)self _maximumNumberOfDots:&v26])
    {
      CurrentContext = UIGraphicsGetCurrentContext();
      [(TransitDirectionsColoredLine *)self bounds];
      CGContextClearRect(CurrentContext, v30);
      CGContextSetLineWidth(CurrentContext, Width);
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v4 CGColor]);
      double v8 = Width * 0.5;
      [(TransitDirectionsColoredLine *)self bounds];
      double Height = CGRectGetHeight(v31);
      if (v5)
      {
        if (v5 != 3)
        {
          CGLineCap v20 = v5 == 1;
          if (v5 == 1) {
            double v21 = Width * 0.5 + 0.0;
          }
          else {
            double v21 = 0.0;
          }
          BOOL v22 = v5 == 2;
          CGLineCap v23 = v5 == 2;
          if (v22) {
            double v24 = Height - Width * 0.5;
          }
          else {
            double v24 = Height;
          }
          [(TransitDirectionsColoredLine *)self bounds];
          CGFloat MidY = CGRectGetMidY(v33);
          CGContextSetLineCap(CurrentContext, v20);
          CGContextMoveToPoint(CurrentContext, v8, MidY);
          CGContextAddLineToPoint(CurrentContext, v8, v21);
          CGContextStrokePath(CurrentContext);
          CGContextSetLineCap(CurrentContext, v23);
          CGContextMoveToPoint(CurrentContext, v8, MidY);
          double v17 = CurrentContext;
          double v18 = v8;
          CGFloat v19 = v24;
          goto LABEL_16;
        }
        [(TransitDirectionsColoredLine *)self innerGapLength];
        double v11 = Width + v10;
        [(TransitDirectionsColoredLine *)self bounds];
        CGFloat v12 = (CGRectGetHeight(v32) - v26) * 0.5;
        CGFloat v13 = v12 + 0.0;
        double Height = Height - v12;
        lengths[0] = 0.0;
        lengths[1] = v11;
        CGContextSetLineDash(CurrentContext, v11 + Width * 0.5, lengths, 2uLL);
        CGContextSetLineCap(CurrentContext, kCGLineCapRound);
        uint64_t v14 = CurrentContext;
        double v15 = Width * 0.5;
        CGFloat v16 = v13;
      }
      else
      {
        CGFloat v16 = 0.0;
        uint64_t v14 = CurrentContext;
        double v15 = Width * 0.5;
      }
      CGContextMoveToPoint(v14, v15, v16);
      double v17 = CurrentContext;
      double v18 = Width * 0.5;
      CGFloat v19 = Height;
LABEL_16:
      CGContextAddLineToPoint(v17, v18, v19);
      CGContextStrokePath(CurrentContext);
    }
  }
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (double)outerGapLength
{
  return self->_outerGapLength;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end