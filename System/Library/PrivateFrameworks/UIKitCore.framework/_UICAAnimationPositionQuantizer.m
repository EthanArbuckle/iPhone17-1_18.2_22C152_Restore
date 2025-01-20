@interface _UICAAnimationPositionQuantizer
+ (id)animationWithQuantizedPositionsGivenAnimation:(id)a3 appliedToView:(id)a4;
+ (void)quantizePositionsInAnimation:(id)a3 givenView:(id)a4;
@end

@implementation _UICAAnimationPositionQuantizer

+ (void)quantizePositionsInAnimation:(id)a3 givenView:(id)a4
{
}

+ (id)animationWithQuantizedPositionsGivenAnimation:(id)a3 appliedToView:(id)a4
{
  id v6 = 0;
  _quantizePositionsInAnimation(a3, a4, &v6);
  id v4 = v6;
  return v4;
}

@end