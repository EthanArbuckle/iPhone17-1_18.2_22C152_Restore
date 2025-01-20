@interface UIFocusRingStyle
+ (double)alphaThreshold;
+ (double)animationActualDuration;
+ (double)animationConfiguredDuration;
+ (double)animationSpeed;
+ (double)animationTruncationDuration;
+ (double)borderThickness;
+ (double)childrenFocusedBorderThickness;
+ (double)cornerRadius;
+ (double)maxAlpha;
+ (double)maxRadius;
+ (double)minAlpha;
+ (double)minRadius;
@end

@implementation UIFocusRingStyle

+ (double)minRadius
{
  return 3.0;
}

+ (double)maxRadius
{
  return 28.0;
}

+ (double)cornerRadius
{
  return 8.0;
}

+ (double)borderThickness
{
  return 3.0;
}

+ (double)childrenFocusedBorderThickness
{
  return 3.0;
}

+ (double)minAlpha
{
  return 0.0;
}

+ (double)maxAlpha
{
  return 0.5;
}

+ (double)alphaThreshold
{
  return 0.15;
}

+ (double)animationConfiguredDuration
{
  return 0.91;
}

+ (double)animationActualDuration
{
  return 0.606666667;
}

+ (double)animationTruncationDuration
{
  return 0.25;
}

+ (double)animationSpeed
{
  return 1.5;
}

@end