@interface NUAssertionPolicyThrowAlways
- (void)notifyAssertion:(id)a3;
@end

@implementation NUAssertionPolicyThrowAlways

- (void)notifyAssertion:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = a3;
  id v10 = [v5 prettyMethodName];
  v6 = [v5 fileName];
  uint64_t v7 = [v5 lineNumber];
  v8 = [v5 message];
  v9 = [v5 currentlyExecutingJobName];

  [v3 raise:v4, @"Assertion failure in %@, %@:%ld: %@ %@", v10, v6, v7, v8, v9 format];
}

@end