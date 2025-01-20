@interface NCTouchEaterGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
@end

@implementation NCTouchEaterGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

@end