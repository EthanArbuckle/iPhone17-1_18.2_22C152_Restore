@interface CarSharingRingView
+ (Class)layerClass;
- (BOOL)isFilled;
- (CAAnimationDelegate)animationDelegate;
- (CGColor)color;
- (CarSharingRingView)initWithFrame:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAnimationDelegate:(id)a3;
- (void)setColor:(CGColor *)a3;
- (void)setFilled:(BOOL)a3;
- (void)setFilled:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CarSharingRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CarSharingRingView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CarSharingRingView;
  v3 = -[CarSharingRingView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarSharingRingView *)v3 setUserInteractionEnabled:0];
    id v5 = +[UIColor clearColor];
    id v6 = [v5 CGColor];
    v7 = [(CarSharingRingView *)v4 shapeLayer];
    [v7 setFillColor:v6];

    v8 = [(CarSharingRingView *)v4 shapeLayer];
    [v8 setLineWidth:2.0];

    v9 = [(CarSharingRingView *)v4 shapeLayer];
    [v9 setStrokeEnd:0.0];

    CGAffineTransformMakeRotation(&v13, -1.57079633);
    v10 = [(CarSharingRingView *)v4 shapeLayer];
    CGAffineTransform v12 = v13;
    [v10 setAffineTransform:&v12];
  }
  return v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CarSharingRingView;
  [(CarSharingRingView *)&v9 layoutSubviews];
  [(CarSharingRingView *)self bounds];
  if (v3 != self->_lastSize.width || v4 != self->_lastSize.height)
  {
    self->_lastSize.width = v3;
    self->_lastSize.height = v4;
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0);
    id v6 = objc_claimAutoreleasedReturnValue();
    id v7 = [v6 CGPath];
    v8 = [(CarSharingRingView *)self shapeLayer];
    [v8 setPath:v7];
  }
}

- (CGColor)color
{
  v2 = [(CarSharingRingView *)self shapeLayer];
  double v3 = (CGColor *)[v2 strokeColor];

  return v3;
}

- (void)setColor:(CGColor *)a3
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v5 = [(CarSharingRingView *)self shapeLayer];
  [v5 setStrokeColor:a3];

  +[CATransaction commit];
}

- (void)setFilled:(BOOL)a3
{
}

- (void)setFilled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_filled = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v7 = [(CarSharingRingView *)self shapeLayer];
  [v7 removeAnimationForKey:@"drawCircleAnimation"];

  if (v4)
  {
    v8 = [(CarSharingRingView *)self shapeLayer];
    [v8 setStrokeEnd:(double)(v5 ^ 1)];

    [(CarSharingRingView *)self setAlpha:1.0];
    +[CATransaction commit];
    id v14 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [v14 setDuration:1.5];
    objc_super v9 = +[NSNumber numberWithInt:v5];
    [v14 setToValue:v9];

    v10 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [v14 setTimingFunction:v10];

    [v14 setDelegate:self];
    [v14 setFillMode:kCAFillModeBoth];
    [v14 setRemovedOnCompletion:0];
    v11 = [(CarSharingRingView *)self shapeLayer];
    [v11 addAnimation:v14 forKey:@"drawCircleAnimation"];
  }
  else
  {
    double v12 = (double)v5;
    CGAffineTransform v13 = [(CarSharingRingView *)self shapeLayer];
    [v13 setStrokeEnd:v12];

    [(CarSharingRingView *)self setAlpha:v12];
    +[CATransaction commit];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CarSharingRingView *)self setFilled:[(CarSharingRingView *)self isFilled]];
  id v7 = [(CarSharingRingView *)self animationDelegate];
  [v7 animationDidStop:v6 finished:v4];
}

- (CAAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);

  return (CAAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (BOOL)isFilled
{
  return self->_filled;
}

- (void).cxx_destruct
{
}

@end