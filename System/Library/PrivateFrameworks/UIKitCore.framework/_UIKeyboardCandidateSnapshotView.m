@interface _UIKeyboardCandidateSnapshotView
- (void)drawRect:(CGRect)a3;
@end

@implementation _UIKeyboardCandidateSnapshotView

- (void)drawRect:(CGRect)a3
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextClear();
  v5 = +[UIKeyboardImpl activeInstance];
  v6 = [v5 candidateController];
  v7 = [v6 candidateBar];
  id v8 = [v7 layer];

  [v8 renderInContext:v4];
}

@end