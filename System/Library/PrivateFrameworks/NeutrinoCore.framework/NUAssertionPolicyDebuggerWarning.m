@interface NUAssertionPolicyDebuggerWarning
- (void)notifyAssertion:(id)a3;
@end

@implementation NUAssertionPolicyDebuggerWarning

- (void)notifyAssertion:(id)a3
{
  id v5 = a3;
  if (+[NUUtilities runningUnderDebugger])
  {
    if ([v5 isWarning])
    {
      v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v4 = [v3 BOOLForKey:@"__skipWarningAssertions"];

      if ((v4 & 1) == 0) {
        raise(2);
      }
    }
  }
}

@end