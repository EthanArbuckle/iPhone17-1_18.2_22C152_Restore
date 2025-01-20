@interface _UITabBarTouchDetectionGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UITabBarTouchDetectionGestureRecognizer

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateBegan)
  {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateBegan)
  {
    [(UIGestureRecognizer *)self setState:4];
  }
}

@end