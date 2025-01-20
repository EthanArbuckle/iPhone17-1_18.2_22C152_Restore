@interface RCTouchInsetsButton
+ (RCTouchInsetsButton)new;
+ (id)touchInsetsButton;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldAnimateOnTap;
- (CAShapeLayer)circleLayer;
- (RCTouchInsetsButton)initWithCoder:(id)a3;
- (RCTouchInsetsButton)initWithFrame:(CGRect)a3;
- (UIColor)animationCircleColor;
- (double)animationCircleRadius;
- (void)_animateImage:(BOOL)a3;
- (void)_animateTouch:(BOOL)a3;
- (void)_commonInit;
- (void)setAnimationCircleColor:(id)a3;
- (void)setAnimationCircleRadius:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCircleLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setShouldAnimateOnTap:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation RCTouchInsetsButton

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)RCTouchInsetsButton;
  -[RCTouchInsetsButton setBounds:](&v12, "setBounds:");
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v14);
  [(RCTouchInsetsButton *)self animationCircleRadius];
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v10, 0.0, 6.28318531);
  id v11 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", [v11 CGPath]);
}

- (double)animationCircleRadius
{
  return self->_animationCircleRadius;
}

- (void)_commonInit
{
  if ((byte_10026A770 & 1) == 0) {
    [(RCTouchInsetsButton *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v10 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v10 actionButtonExtraXAxisActiveWidth];
  -[RCTouchInsetsButton _setTouchInsets:](self, "_setTouchInsets:", 0.0, -v3, 0.0, -v3);
  v4 = objc_opt_new();
  [(RCTouchInsetsButton *)self setCircleLayer:v4];
  [v4 setOpacity:0.0];
  id v5 = +[UIColor clearColor];
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  id v6 = [v10 transportButtonAnimationCircleColor];
  objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));

  v7 = [(RCTouchInsetsButton *)self layer];
  v8 = [(RCTouchInsetsButton *)self imageView];
  v9 = [v8 layer];
  [v7 insertSublayer:v4 below:v9];

  self->_shouldAnimateOnTap = 0;
}

- (void)setCircleLayer:(id)a3
{
}

- (RCTouchInsetsButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCTouchInsetsButton;
  double v3 = -[RCPointerInteractionButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RCTouchInsetsButton *)v3 _commonInit];
  }
  return v4;
}

+ (RCTouchInsetsButton)new
{
  return (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue();
}

+ (id)touchInsetsButton
{
  byte_10026A770 = 1;
  v2 = objc_opt_new();
  byte_10026A770 = 0;

  return v2;
}

- (RCTouchInsetsButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCTouchInsetsButton;
  double v3 = [(RCTouchInsetsButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RCTouchInsetsButton *)v3 _commonInit];
  }
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(RCTouchInsetsButton *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(RCTouchInsetsButton *)self _touchInsets];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;

  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (void)setHighlighted:(BOOL)a3
{
  if (!self->_shouldAnimateOnTap)
  {
    v3.receiver = self;
    v3.super_class = (Class)RCTouchInsetsButton;
    [(RCTouchInsetsButton *)&v3 setHighlighted:a3];
  }
}

- (void)setAnimationCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_animationCircleColor, a3);
  id v5 = a3;
  id v6 = [v5 CGColor];

  id v7 = [(RCTouchInsetsButton *)self circleLayer];
  [v7 setFillColor:v6];
}

- (void)_animateImage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v5 transportButtonAnimationDuration];
  double v7 = v6;
  if (v3)
  {
    [v5 transportButtonAnimationShrinkFactor];
    CGFloat v9 = v8;
    double v10 = 1.0;
  }
  else
  {
    CGFloat v9 = 1.0;
    double v10 = 0.0;
  }
  double v11 = [(RCTouchInsetsButton *)self layer];
  [v11 removeAllAnimations];

  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, v9, v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100052560;
  v14[3] = &unk_100221A68;
  v14[4] = self;
  *(double *)&v14[5] = v10;
  CGAffineTransform v15 = v16;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000525C0;
  v12[3] = &unk_100221A90;
  v12[4] = self;
  CGAffineTransform v13 = v16;
  +[UIView animateWithDuration:65540 delay:v14 options:v12 animations:v7 completion:0.0];
}

- (void)_animateTouch:(BOOL)a3
{
  if (self->_shouldAnimateOnTap) {
    [(RCTouchInsetsButton *)self _animateImage:a3];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RCTouchInsetsButton;
  [(RCTouchInsetsButton *)&v5 touchesBegan:a3 withEvent:a4];
  [(RCTouchInsetsButton *)self _animateTouch:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)RCTouchInsetsButton;
  [(RCTouchInsetsButton *)&v4 touchesMoved:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RCTouchInsetsButton;
  [(RCTouchInsetsButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(RCTouchInsetsButton *)self _animateTouch:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RCTouchInsetsButton;
  [(RCTouchInsetsButton *)&v5 touchesCancelled:a3 withEvent:a4];
  [(RCTouchInsetsButton *)self _animateTouch:0];
}

- (BOOL)shouldAnimateOnTap
{
  return self->_shouldAnimateOnTap;
}

- (void)setShouldAnimateOnTap:(BOOL)a3
{
  self->_shouldAnimateOnTap = a3;
}

- (void)setAnimationCircleRadius:(double)a3
{
  self->_animationCircleRadius = a3;
}

- (UIColor)animationCircleColor
{
  return self->_animationCircleColor;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);

  objc_storeStrong((id *)&self->_animationCircleColor, 0);
}

@end