@interface UIGestureRecognizer
- (void)cancel;
@end

@implementation UIGestureRecognizer

- (void)cancel
{
  if ([(UIGestureRecognizer *)self state])
  {
    if ((char *)[(UIGestureRecognizer *)self state] != (char *)&dword_0 + 1
      && (char *)[(UIGestureRecognizer *)self state] != (char *)&dword_0 + 2)
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