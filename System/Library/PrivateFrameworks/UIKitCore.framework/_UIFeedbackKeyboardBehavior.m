@interface _UIFeedbackKeyboardBehavior
- (void)userTypedOnKeyWithType:(int64_t)a3;
@end

@implementation _UIFeedbackKeyboardBehavior

- (void)userTypedOnKeyWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_186B95060[a3 - 1];
  }
  [(_UIKeyboardFeedbackGenerator *)self actionOccurred:v3];
}

@end