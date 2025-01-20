@interface _VUISBIconProgressLoadingNoneStateTransition
- (void)_updateView:(id)a3;
@end

@implementation _VUISBIconProgressLoadingNoneStateTransition

- (void)_updateView:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_VUISBIconProgressLoadingNoneStateTransition;
  -[_VUISBInstallProgressStateTransition _updateView:](&v10, sel__updateView_);
  [a3 bounds];
  UIRectGetCenter();
  UIDistanceBetweenPoints();
  double v6 = v5;
  [a3 setBackgroundAlpha:1.0];
  double fraction = self->super._fraction;
  if (self->super._fromState == 2)
  {
    [a3 setForegroundAlpha:1.0 - fraction];
    double v8 = self->super._fraction;
  }
  else
  {
    [a3 setForegroundAlpha:fraction];
    double v8 = 1.0 - self->super._fraction;
  }
  float v9 = v6;
  [a3 setCircleRadiusFraction:v8 * (ceilf(v9 / 36.0) + -1.0) + 1.0];
  [a3 setNeedsDisplay];
}

@end