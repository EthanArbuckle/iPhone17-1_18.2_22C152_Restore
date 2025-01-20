@interface CRLPulseAnimationController
- (BOOL)autohide;
- (BOOL)drawRoundedRect;
- (BOOL)pulsating;
- (CRLPulseAnimationController)initWithDelegate:(id)a3;
- (double)duration;
- (double)pulseOffset;
- (unint64_t)pulseAnimationStyle;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)disconnect;
- (void)reset;
- (void)setAutohide:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setPulsating:(BOOL)a3;
- (void)setPulseOffset:(double)a3;
- (void)startAnimating;
- (void)startAnimatingStandardPulse;
- (void)startAnimatingStandardThreePhasePulse;
- (void)stop;
@end

@implementation CRLPulseAnimationController

- (CRLPulseAnimationController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLPulseAnimationController;
  v6 = [(CRLPulseAnimationController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_duration = 0.1;
    v7->_pulseOffset = 6.0;
  }

  return v7;
}

- (void)reset
{
  delegate = self->_delegate;
  self->_delegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLPulseAnimationController;
  [(CRLHighlightController *)&v4 reset];
}

- (void)disconnect
{
  delegate = self->_delegate;
  self->_delegate = 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  if (self->_pulsating)
  {
    id v7 = v5;
    self->_pulsating = 0;
    if (self->_autohide)
    {
      [(CRLHighlightController *)self hide];
      v6 = [(CRLHighlightController *)self layer];
      [v6 removeAllAnimations];

      [(CRLHighlightController *)self setImage:0];
    }
    [(CRLPulseAnimationControllerProtocol *)self->_delegate pulseAnimationDidStopForPulse:self];
    id v5 = v7;
  }
}

- (void)stop
{
  BOOL pulsating = self->_pulsating;
  self->_BOOL pulsating = 0;
  [(CRLHighlightController *)self hide];
  objc_super v4 = [(CRLHighlightController *)self layer];
  [v4 removeAllAnimations];

  [(CRLHighlightController *)self setImage:0];
  if (pulsating)
  {
    delegate = self->_delegate;
    [(CRLPulseAnimationControllerProtocol *)delegate pulseAnimationDidStopForPulse:self];
  }
}

- (BOOL)drawRoundedRect
{
  return 1;
}

- (unint64_t)pulseAnimationStyle
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return (unint64_t)[(CRLPulseAnimationControllerProtocol *)delegate pulseAnimationStyle:self];
}

- (void)startAnimatingStandardPulse
{
  v3 = [(CRLHighlightController *)self layer];
  [v3 removeAllAnimations];

  if ([(CRLHighlightController *)self path])
  {
    [(CRLHighlightController *)self rectToAnimate];
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
    float v8 = CGRectGetWidth(v43);
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    float v9 = CGRectGetHeight(v44);
    double pulseOffset = self->_pulseOffset;
    double v11 = pulseOffset + v8;
    double v12 = (pulseOffset + v9) / v9;
    if (v11 / v8 < v12) {
      double v12 = v11 / v8;
    }
    double v13 = sub_100407E48(v12, 1.0, 1.1);
    self->_BOOL pulsating = 1;
    *(float *)&double v13 = v13;
    long long v14 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v39.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&v39.m33 = v14;
    long long v35 = *(_OWORD *)&v39.m31;
    long long v36 = v14;
    long long v15 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v39.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v39.m43 = v15;
    long long v33 = *(_OWORD *)&v39.m41;
    long long v34 = v15;
    long long v16 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v39.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v39.m13 = v16;
    long long v31 = *(_OWORD *)&v39.m11;
    long long v32 = v16;
    long long v17 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v39.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v39.m23 = v17;
    long long v29 = *(_OWORD *)&v39.m21;
    long long v30 = v17;
    CGFloat v18 = *(float *)&v13;
    *(_OWORD *)&v38.m31 = *(_OWORD *)&v39.m31;
    *(_OWORD *)&v38.m33 = v14;
    *(_OWORD *)&v38.m41 = *(_OWORD *)&v39.m41;
    *(_OWORD *)&v38.m43 = v15;
    *(_OWORD *)&v38.m11 = *(_OWORD *)&v39.m11;
    *(_OWORD *)&v38.m13 = v16;
    *(_OWORD *)&v38.m21 = *(_OWORD *)&v39.m21;
    *(_OWORD *)&v38.m23 = v17;
    CATransform3DTranslate(&v39, &v38, -(x * *(float *)&v13 - x), -(y * *(float *)&v13 - y), 0.0);
    CATransform3D v37 = v39;
    CATransform3DTranslate(&v38, &v37, -(width - width * v18) * -0.5, -(height - height * v18) * -0.5, 0.0);
    CATransform3D v39 = v38;
    CATransform3D v37 = v38;
    CATransform3DScale(&v38, &v37, v18, v18, 1.0);
    CATransform3D v39 = v38;
    v19 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    [v19 setKeyTimes:&off_10155CF68];
    *(_OWORD *)&v38.m31 = v35;
    *(_OWORD *)&v38.m33 = v36;
    *(_OWORD *)&v38.m41 = v33;
    *(_OWORD *)&v38.m43 = v34;
    *(_OWORD *)&v38.m11 = v31;
    *(_OWORD *)&v38.m13 = v32;
    *(_OWORD *)&v38.m21 = v29;
    *(_OWORD *)&v38.m23 = v30;
    v20 = +[NSValue valueWithCATransform3D:&v38];
    v41[0] = v20;
    CATransform3D v38 = v39;
    v21 = +[NSValue valueWithCATransform3D:&v38];
    v41[1] = v21;
    *(_OWORD *)&v38.m31 = v35;
    *(_OWORD *)&v38.m33 = v36;
    *(_OWORD *)&v38.m41 = v33;
    *(_OWORD *)&v38.m43 = v34;
    *(_OWORD *)&v38.m11 = v31;
    *(_OWORD *)&v38.m13 = v32;
    *(_OWORD *)&v38.m21 = v29;
    *(_OWORD *)&v38.m23 = v30;
    v22 = +[NSValue valueWithCATransform3D:&v38];
    v41[2] = v22;
    v23 = +[NSArray arrayWithObjects:v41 count:3];
    [v19 setValues:v23];

    v24 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    v40[0] = v24;
    v25 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    v40[1] = v25;
    v26 = +[NSArray arrayWithObjects:v40 count:2];
    [v19 setTimingFunctions:v26];

    [v19 setDuration:self->_duration];
    [v19 setDelegate:self];
    v27 = [(CRLHighlightController *)self layerToAnimate];
    [v27 addAnimation:v19 forKey:@"PulseAnimation"];
  }
  else
  {
    delegate = self->_delegate;
    [(CRLPulseAnimationControllerProtocol *)delegate pulseAnimationDidStopForPulse:self];
  }
}

- (void)startAnimatingStandardThreePhasePulse
{
  self->_duration = 1.5;
  [(CRLPulseAnimationController *)self startAnimatingStandardPulse];
}

- (void)startAnimating
{
  unint64_t v3 = [(CRLPulseAnimationController *)self pulseAnimationStyle];
  if (v3 == 1)
  {
    [(CRLPulseAnimationController *)self startAnimatingStandardThreePhasePulse];
  }
  else if (!v3)
  {
    [(CRLPulseAnimationController *)self startAnimatingStandardPulse];
  }
}

- (BOOL)pulsating
{
  return self->_pulsating;
}

- (void)setPulsating:(BOOL)a3
{
  self->_BOOL pulsating = a3;
}

- (BOOL)autohide
{
  return self->_autohide;
}

- (void)setAutohide:(BOOL)a3
{
  self->_autohide = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)pulseOffset
{
  return self->_pulseOffset;
}

- (void)setPulseOffset:(double)a3
{
  self->_double pulseOffset = a3;
}

- (void).cxx_destruct
{
}

@end