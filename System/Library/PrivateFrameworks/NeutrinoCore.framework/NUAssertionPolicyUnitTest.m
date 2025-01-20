@interface NUAssertionPolicyUnitTest
- (void)notifyAssertion:(id)a3;
@end

@implementation NUAssertionPolicyUnitTest

- (void)notifyAssertion:(id)a3
{
  id v10 = a3;
  if (([v10 isFatal] & 1) != 0 || objc_msgSend(MEMORY[0x1E4F29060], "isMainThread"))
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    v5 = [v10 prettyMethodName];
    v6 = [v10 fileName];
    uint64_t v7 = [v10 lineNumber];
    v8 = [v10 message];
    v9 = [v10 currentlyExecutingJobName];
    [v3 raise:v4, @"Assertion failure in %@, %@:%ld: %@ %@", v5, v6, v7, v8, v9 format];
  }
}

@end