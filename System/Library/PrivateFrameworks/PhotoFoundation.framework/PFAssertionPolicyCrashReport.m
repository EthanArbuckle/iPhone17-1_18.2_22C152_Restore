@interface PFAssertionPolicyCrashReport
- (void)notifyAssertion:(id)a3;
@end

@implementation PFAssertionPolicyCrashReport

- (void)notifyAssertion:(id)a3
{
  id v10 = a3;
  if ([v10 isFatal])
  {
    v3 = NSString;
    v4 = [v10 prettyMethodName];
    v5 = [v10 fileName];
    uint64_t v6 = [v10 lineNumber];
    v7 = [v10 message];
    v8 = [v3 stringWithFormat:@"Assertion failure in %@, %@:%lu\n%@", v4, v5, v6, v7];

    id v9 = v8;
    qword_1E9F969C8 = [v9 UTF8String];
  }
}

@end