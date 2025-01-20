@interface _SBIconProgressLoadingNoneStateTransition
- (void)_updateView:(id)a3;
@end

@implementation _SBIconProgressLoadingNoneStateTransition

- (void)_updateView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SBIconProgressLoadingNoneStateTransition;
  [(_SBIconProgressStateTransition *)&v10 _updateView:v4];
  [v4 bounds];
  UIRectGetCenter();
  UIDistanceBetweenPoints();
  double v6 = v5;
  [v4 setBackgroundAlpha:1.0];
  double fraction = self->super._fraction;
  if (self->super._fromState == 2)
  {
    [v4 setForegroundAlpha:1.0 - fraction];
    double v8 = self->super._fraction;
  }
  else
  {
    [v4 setForegroundAlpha:fraction];
    double v8 = 1.0 - self->super._fraction;
  }
  float v9 = v6 / 18.0;
  [v4 setCircleRadiusFraction:v8 * (ceilf(v9) + -1.0) + 1.0];
  [v4 setNeedsDisplay];
}

@end