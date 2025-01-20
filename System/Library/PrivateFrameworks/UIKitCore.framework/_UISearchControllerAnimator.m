@interface _UISearchControllerAnimator
- (BOOL)collapesKeyboardWhenNotFocused;
- (double)transitionDuration:(id)a3;
@end

@implementation _UISearchControllerAnimator

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (BOOL)collapesKeyboardWhenNotFocused
{
  return 0;
}

@end