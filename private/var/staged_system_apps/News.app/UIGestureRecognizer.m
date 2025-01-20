@interface UIGestureRecognizer
- (void)cancel;
@end

@implementation UIGestureRecognizer

- (void)cancel
{
  if ([(UIGestureRecognizer *)self state])
  {
    if ((id)[(UIGestureRecognizer *)self state] != (id)1
      && (id)[(UIGestureRecognizer *)self state] != (id)2)
    {
      return;
    }
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = 5;
  }

  [(UIGestureRecognizer *)self setState:v3];
}

@end