@interface _VUISBIconProgressWaitingLoadingStateTransition
- (void)_updateView:(id)a3;
@end

@implementation _VUISBIconProgressWaitingLoadingStateTransition

- (void)_updateView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_VUISBIconProgressWaitingLoadingStateTransition;
  -[_VUISBInstallProgressStateTransition _updateView:](&v6, sel__updateView_);
  [a3 setBackgroundAlpha:1.0];
  [a3 setForegroundAlpha:1.0];
  double fraction = self->super._fraction;
  if (self->super._fromState != 1) {
    double fraction = 1.0 - fraction;
  }
  [a3 setCircleRadiusFraction:fraction];
  [a3 circleBoundingRect];
  objc_msgSend(a3, "setNeedsDisplayInRect:");
}

@end