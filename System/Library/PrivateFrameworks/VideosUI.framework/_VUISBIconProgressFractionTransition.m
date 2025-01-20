@interface _VUISBIconProgressFractionTransition
+ (id)newTransitionToFraction:(double)a3;
- (BOOL)isCompleteWithView:(id)a3;
- (void)_updateView:(id)a3 forDisplayedFraction:(double)a4;
- (void)completeTransitionAndUpdateView:(id)a3;
- (void)updateToFraction:(double)a3;
- (void)updateView:(id)a3 withElapsedTime:(double)a4;
@end

@implementation _VUISBIconProgressFractionTransition

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
  double v6 = a4 * 0.3;
  [a3 displayedFraction];
  double targetFraction = v6 + v7;
  if (self->_targetFraction < targetFraction) {
    double targetFraction = self->_targetFraction;
  }
  [(_VUISBIconProgressFractionTransition *)self _updateView:a3 forDisplayedFraction:targetFraction];
}

- (void)completeTransitionAndUpdateView:(id)a3
{
}

- (void)_updateView:(id)a3 forDisplayedFraction:(double)a4
{
  [a3 setDisplayedFraction:a4];
  [a3 circleBoundingRect];
  objc_msgSend(a3, "setNeedsDisplayInRect:");
}

- (BOOL)isCompleteWithView:(id)a3
{
  [a3 displayedFraction];
  return vabdd_f64(v4, self->_targetFraction) < 2.22044605e-16;
}

@end