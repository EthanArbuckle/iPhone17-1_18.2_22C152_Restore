@interface NUAssertionPolicyCrashReport
- (void)notifyAssertion:(id)a3;
@end

@implementation NUAssertionPolicyCrashReport

- (void)notifyAssertion:(id)a3
{
  id v11 = a3;
  if ([v11 isFatal])
  {
    v3 = NSString;
    v4 = [v11 prettyMethodName];
    v5 = [v11 fileName];
    uint64_t v6 = [v11 lineNumber];
    v7 = [v11 message];
    v8 = [v11 currentlyExecutingJobName];
    v9 = [v3 stringWithFormat:@"Assertion failure in %@, %@:%ld\n%@\n%@", v4, v5, v6, v7, v8];

    id v10 = v9;
    qword_1E9808D30 = [v10 UTF8String];
  }
}

@end