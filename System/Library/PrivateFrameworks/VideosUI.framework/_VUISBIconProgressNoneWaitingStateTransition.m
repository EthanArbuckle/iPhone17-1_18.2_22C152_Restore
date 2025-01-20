@interface _VUISBIconProgressNoneWaitingStateTransition
- (void)_updateView:(id)a3;
@end

@implementation _VUISBIconProgressNoneWaitingStateTransition

- (void)_updateView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_VUISBIconProgressNoneWaitingStateTransition;
  -[_VUISBInstallProgressStateTransition _updateView:](&v6, sel__updateView_);
  [a3 setCircleRadiusFraction:0.0];
  [a3 setForegroundAlpha:0.0];
  double fraction = self->super._fraction;
  if (self->super._fromState) {
    double fraction = 1.0 - fraction;
  }
  [a3 setBackgroundAlpha:fraction];
  [a3 setNeedsDisplay];
}

@end