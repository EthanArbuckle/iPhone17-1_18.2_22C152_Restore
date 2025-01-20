@interface _UIPointerInteractionHoverGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (CGPoint)locationInView:(id)a3;
@end

@implementation _UIPointerInteractionHoverGestureRecognizer

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

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan
     || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged))
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIPointerInteractionHoverGestureRecognizer;
    [(UIHoverGestureRecognizer *)&v11 locationInView:v4];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v6 = 0x7FEFFFFFFFFFFFFFLL;
  }

  double v9 = *(double *)&v6;
  double v10 = *(double *)&v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end