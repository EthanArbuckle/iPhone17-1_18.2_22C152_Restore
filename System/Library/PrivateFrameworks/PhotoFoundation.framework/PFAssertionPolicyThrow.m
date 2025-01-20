@interface PFAssertionPolicyThrow
- (void)notifyAssertion:(id)a3;
@end

@implementation PFAssertionPolicyThrow

- (void)notifyAssertion:(id)a3
{
  id v9 = a3;
  if ([v9 isFatal])
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    v5 = [v9 prettyMethodName];
    v6 = [v9 fileName];
    uint64_t v7 = [v9 lineNumber];
    v8 = [v9 message];
    [v3 raise:v4, @"Assertion failure in %@, %@:%lu: %@", v5, v6, v7, v8 format];
  }
}

@end