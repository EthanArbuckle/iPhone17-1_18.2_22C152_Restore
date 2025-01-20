@interface _UIKeyboardChangedInformationWithFencing
+ (id)animationFence;
@end

@implementation _UIKeyboardChangedInformationWithFencing

+ (id)animationFence
{
  return +[UIScene _synchronizedDrawingFence];
}

@end