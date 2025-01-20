@interface _SBIconProgressFractionTransition
+ (id)newTransitionToFraction:(double)a3;
- (BOOL)isCompleteWithView:(id)a3;
- (void)_updateView:(id)a3 forDisplayedFraction:(double)a4;
- (void)completeTransitionAndUpdateView:(id)a3;
- (void)updateToFraction:(double)a3;
- (void)updateView:(id)a3 withElapsedTime:(double)a4;
@end

@implementation _SBIconProgressFractionTransition

+ (id)newTransitionToFraction:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 updateToFraction:a3];
  return v4;
}

- (void)updateToFraction:(double)a3
{
  self->_targetFraction = a3;
}

- (void)updateView:(id)a3 withElapsedTime:(double)a4
{
  double v5 = a4 * 0.3;
  id v8 = a3;
  [v8 displayedFraction];
  double targetFraction = v5 + v6;
  if (self->_targetFraction < targetFraction) {
    double targetFraction = self->_targetFraction;
  }
  [(_SBIconProgressFractionTransition *)self _updateView:v8 forDisplayedFraction:targetFraction];
}

- (void)completeTransitionAndUpdateView:(id)a3
{
}

- (void)_updateView:(id)a3 forDisplayedFraction:(double)a4
{
  id v5 = a3;
  [v5 setDisplayedFraction:a4];
  [v5 circleBoundingRect];
  objc_msgSend(v5, "setNeedsDisplayInRect:");
}

- (BOOL)isCompleteWithView:(id)a3
{
  [a3 displayedFraction];
  return BSFloatEqualToFloat();
}

@end