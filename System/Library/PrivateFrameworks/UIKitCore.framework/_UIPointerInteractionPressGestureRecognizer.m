@interface _UIPointerInteractionPressGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
@end

@implementation _UIPointerInteractionPressGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0 && [(UIGestureRecognizer *)self state] < UIGestureRecognizerStateEnded;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_affectedByGesture:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIPointerInteractionPressGestureRecognizer;
  if ([(UIGestureRecognizer *)&v7 _affectedByGesture:v4])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  return [a3 _isPointerTouch];
}

@end