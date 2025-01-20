@interface UIKBGridCandidateView
- (id)getConfiguration;
@end

@implementation UIKBGridCandidateView

- (id)getConfiguration
{
  return +[UIKeyboardCandidateViewConfiguration configuration];
}

@end