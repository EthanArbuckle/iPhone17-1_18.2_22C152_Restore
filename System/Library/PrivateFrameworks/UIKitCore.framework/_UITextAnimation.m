@interface _UITextAnimation
+ (id)animationNamesForDomain:(id)a3;
+ (id)animationWithName:(id)a3;
+ (id)animationWithName:(id)a3 localeIdentifier:(id)a4;
@end

@implementation _UITextAnimation

+ (id)animationNamesForDomain:(id)a3
{
  return UITextAnimationNamesForDomain(a3);
}

+ (id)animationWithName:(id)a3
{
  return UITextAnimationWithName(a3);
}

+ (id)animationWithName:(id)a3 localeIdentifier:(id)a4
{
  return UITextAnimationWithNameAndLocaleIdentifier(a3, a4);
}

@end