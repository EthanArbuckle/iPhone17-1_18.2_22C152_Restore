@interface _UITextFieldPassthroughMetricsProvider
- (BOOL)shouldExtendCaretHeight;
- (double)naturalHeight;
@end

@implementation _UITextFieldPassthroughMetricsProvider

- (BOOL)shouldExtendCaretHeight
{
  return 1;
}

- (double)naturalHeight
{
  return -1.0;
}

@end