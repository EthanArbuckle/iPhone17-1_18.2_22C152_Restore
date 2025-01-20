@interface PFAssertionPolicyDebuggerWarning
- (void)notifyAssertion:(id)a3;
@end

@implementation PFAssertionPolicyDebuggerWarning

- (void)notifyAssertion:(id)a3
{
  id v14 = a3;
  if (!+[PFAssertionHandler runningUnderDebugger]
    || ![v14 isWarning])
  {
    goto LABEL_15;
  }
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v3 BOOLForKey:@"__skipWarningAssertions"])
  {
    v4 = NSNumber;
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
    [v5 timeIntervalSinceReferenceDate];
    v6 = objc_msgSend(v4, "numberWithDouble:");

    id v7 = [v3 objectForKey:@"PFAssertSkipWarningExpirationDate"];
    if (!v7)
    {
      id v7 = v6;
      [v3 setObject:v7 forKey:@"PFAssertSkipWarningExpirationDate"];
    }
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    [v9 timeIntervalSinceNow];
    if (v10 <= 86400.0)
    {
      if (v10 >= 0.0)
      {
LABEL_11:

        goto LABEL_12;
      }
      [v3 removeObjectForKey:@"PFAssertSkipWarningExpirationDate"];
      v13 = (void *)MEMORY[0x1E4F1CC28];
      v11 = @"__skipWarningAssertions";
      v12 = v3;
    }
    else
    {
      v11 = @"PFAssertSkipWarningExpirationDate";
      v12 = v3;
      v13 = v6;
    }
    [v12 setObject:v13 forKey:v11];
    goto LABEL_11;
  }
LABEL_12:
  if (([v3 BOOLForKey:@"__skipWarningAssertions"] & 1) == 0) {
    __debugbreak();
  }

LABEL_15:
}

@end