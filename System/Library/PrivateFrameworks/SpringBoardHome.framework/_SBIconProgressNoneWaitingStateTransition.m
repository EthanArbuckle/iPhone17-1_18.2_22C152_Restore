@interface _SBIconProgressNoneWaitingStateTransition
- (void)_updateView:(id)a3;
@end

@implementation _SBIconProgressNoneWaitingStateTransition

- (void)_updateView:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SBIconProgressNoneWaitingStateTransition;
  [(_SBIconProgressStateTransition *)&v6 _updateView:v4];
  [v4 setCircleRadiusFraction:0.0];
  [v4 setForegroundAlpha:0.0];
  double fraction = self->super._fraction;
  if (self->super._fromState) {
    double fraction = 1.0 - fraction;
  }
  [v4 setBackgroundAlpha:fraction];
  [v4 setNeedsDisplay];
}

@end