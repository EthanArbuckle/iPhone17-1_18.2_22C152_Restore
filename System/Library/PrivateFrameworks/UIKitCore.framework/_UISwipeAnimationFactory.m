@interface _UISwipeAnimationFactory
+ (id)_animatorForDuration:(double)a3 initialVelocity:(CGVector)a4 shouldLayoutSubviews:(BOOL)a5;
+ (id)_animatorForStiffnessFactor:(double)a3 initialVelocity:(CGVector)a4;
+ (id)animatorForCollapse;
+ (id)animatorForCollapseWithAdditivelyAnimatedViews:(id)a3;
+ (id)animatorForGenericUpdates;
+ (id)animatorForMoveWithOccurrence:(id)a3;
+ (id)animatorForScanlineCollapse;
+ (id)animatorForTentativeWithOccurrence:(id)a3;
+ (id)animatorForTentativeWithOccurrence:(id)a3 additivelyAnimatedViews:(id)a4;
@end

@implementation _UISwipeAnimationFactory

+ (id)animatorForMoveWithOccurrence:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 2 || (objc_msgSend(v4, "offset"), fabs(v5) <= 0.00000011920929))
  {
    [v4 velocity];
    double v7 = v8;
    double v6 = 1.0;
  }
  else
  {
    double v6 = 2.0;
    double v7 = 0.0;
  }
  v9 = objc_msgSend(a1, "_animatorForStiffnessFactor:initialVelocity:", v6, v7, 0.0);

  return v9;
}

+ (id)animatorForTentativeWithOccurrence:(id)a3
{
  return (id)[a1 animatorForTentativeWithOccurrence:a3 additivelyAnimatedViews:0];
}

+ (id)animatorForTentativeWithOccurrence:(id)a3 additivelyAnimatedViews:(id)a4
{
  id v6 = a4;
  [a3 velocity];
  double v8 = objc_msgSend(a1, "_animatorForDuration:initialVelocity:shouldLayoutSubviews:", 0, 0.4, v7, 0.0);
  [v8 addViewsToAnimateAdditively:v6];

  return v8;
}

+ (id)animatorForCollapse
{
  return (id)[a1 animatorForCollapseWithAdditivelyAnimatedViews:0];
}

+ (id)animatorForCollapseWithAdditivelyAnimatedViews:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend(a1, "_animatorForDuration:initialVelocity:shouldLayoutSubviews:", 0, 0.4, 0.0, 0.0);
  [v5 addViewsToAnimateAdditively:v4];

  return v5;
}

+ (id)animatorForScanlineCollapse
{
  return (id)objc_msgSend(a1, "_animatorForDuration:initialVelocity:shouldLayoutSubviews:", 1, 0.4, 0.0, 0.0);
}

+ (id)animatorForGenericUpdates
{
  v2 = [[UICubicTimingParameters alloc] initWithAnimationCurve:0];
  v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.3];

  return v3;
}

+ (id)_animatorForStiffnessFactor:(double)a3 initialVelocity:(CGVector)a4
{
  double dy = a4.dy;
  double dx = a4.dx;
  double v7 = [UISpringTimingParameters alloc];
  +[_UISwipeActionSpringAnimationParameters defaultStiffness];
  double v9 = v8 * a3;
  +[_UISwipeActionSpringAnimationParameters defaultDamping];
  v11 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v7, "initWithMass:stiffness:damping:initialVelocity:", 2.0, v9, v10, dx, dy);
  v12 = [UIViewPropertyAnimator alloc];
  [(UISpringTimingParameters *)v11 settlingDuration];
  v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v12, "initWithDuration:timingParameters:", v11);

  return v13;
}

+ (id)_animatorForDuration:(double)a3 initialVelocity:(CGVector)a4 shouldLayoutSubviews:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = -[UISpringTimingParameters initWithDampingRatio:initialVelocity:]([UISpringTimingParameters alloc], "initWithDampingRatio:initialVelocity:", 1.0, a4.dx, a4.dy);
  double v8 = [(UIViewPropertyAnimator *)[_UISwipePropertyAnimator alloc] initWithDuration:v7 timingParameters:a3];
  [(UIViewPropertyAnimator *)v8 _setShouldLayoutSubviews:v5];

  return v8;
}

@end