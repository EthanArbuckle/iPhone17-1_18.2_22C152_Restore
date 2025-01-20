@interface PKNoHighlightTextView
- (BOOL)canBecomeFirstResponder;
@end

@implementation PKNoHighlightTextView

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

@end