@interface SiriSharedUIAdaptiveGrabberView
+ (Class)layerClass;
- (CGPath)_pathForStyle:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriSharedUIAdaptiveGrabberView)initWithFrame:(CGRect)a3;
- (SiriSharedUIAdaptiveGrabberView)initWithStyle:(int64_t)a3;
- (id)shapeLayer;
- (int64_t)style;
- (void)_commonInit;
- (void)_setupWithStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation SiriSharedUIAdaptiveGrabberView

- (SiriSharedUIAdaptiveGrabberView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIAdaptiveGrabberView;
  v3 = -[SiriSharedUIAdaptiveGrabberView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SiriSharedUIAdaptiveGrabberView *)v3 _commonInit];
    [(SiriSharedUIAdaptiveGrabberView *)v4 _setupWithStyle:0 animated:0];
  }
  return v4;
}

- (SiriSharedUIAdaptiveGrabberView)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIAdaptiveGrabberView;
  v4 = -[SiriSharedUIAdaptiveGrabberView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(SiriSharedUIAdaptiveGrabberView *)v4 _commonInit];
    [(SiriSharedUIAdaptiveGrabberView *)v5 sizeToFit];
    [(SiriSharedUIAdaptiveGrabberView *)v5 _setupWithStyle:a3 animated:0];
  }
  return v5;
}

- (void)_commonInit
{
  v3 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
  id v4 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  v5 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
  id v6 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  objc_super v7 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
  uint64_t v8 = *MEMORY[0x263F15E70];
  [v7 setLineCap:*MEMORY[0x263F15E70]];

  v9 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
  [v9 setLineWidth:5.0];

  id v10 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
  [v10 setLineJoin:v8];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)shapeLayer
{
  v2 = [(SiriSharedUIAdaptiveGrabberView *)self layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  -[SiriSharedUIAdaptiveGrabberView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 36.0;
  double v4 = 18.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SiriSharedUIAdaptiveGrabberView _setupWithStyle:animated:](self, "_setupWithStyle:animated:");
  }
}

- (void)_setupWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SiriSharedUIAdaptiveGrabberView *)self _pathForStyle:a3];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
    v9 = v8;
    if (v4)
    {
      uint64_t v10 = [v8 path];

      v9 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
      [v9 setDuration:0.2];
      [v9 setToValue:v7];
      [v9 setFromValue:v10];
      v11 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      [v9 setTimingFunction:v11];

      v12 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
      [v12 addAnimation:v9 forKey:@"path"];

      v13 = [(SiriSharedUIAdaptiveGrabberView *)self shapeLayer];
      [v13 setPath:v7];
    }
    else
    {
      [v8 setPath:v7];
    }

    CGPathRelease(v7);
  }
}

- (CGPath)_pathForStyle:(int64_t)a3
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 13.0);
  if (a3 == 1) {
    double v5 = 8.0;
  }
  else {
    double v5 = 13.0;
  }
  CGPathAddLineToPoint(Mutable, 0, 18.0, v5);
  CGPathAddLineToPoint(Mutable, 0, 36.0, 13.0);
  id v6 = (CGPath *)MEMORY[0x2105527B0](Mutable);
  CGPathRelease(Mutable);
  return v6;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end