@interface UIGestureRecognizer(SXCancel)
- (uint64_t)cancel;
@end

@implementation UIGestureRecognizer(SXCancel)

- (uint64_t)cancel
{
  [a1 setEnabled:0];
  return [a1 setEnabled:1];
}

@end