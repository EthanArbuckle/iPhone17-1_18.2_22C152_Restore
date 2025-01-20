@interface _UISwipeActionSpringAnimationParameters
+ (double)defaultDamping;
+ (double)defaultStiffness;
+ (void)setDefaultDamping:(double)a3;
+ (void)setDefaultStiffness:(double)a3;
@end

@implementation _UISwipeActionSpringAnimationParameters

+ (void)setDefaultDamping:(double)a3
{
  _UISwipeActionSpringAnimationParametersDamping = *(void *)&a3;
}

+ (double)defaultDamping
{
  return *(double *)&_UISwipeActionSpringAnimationParametersDamping;
}

+ (void)setDefaultStiffness:(double)a3
{
  _UISwipeActionSpringAnimationParametersStiffness = *(void *)&a3;
}

+ (double)defaultStiffness
{
  return *(double *)&_UISwipeActionSpringAnimationParametersStiffness;
}

@end