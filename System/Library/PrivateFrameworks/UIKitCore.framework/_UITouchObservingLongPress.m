@interface _UITouchObservingLongPress
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
@end

@implementation _UITouchObservingLongPress

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

@end