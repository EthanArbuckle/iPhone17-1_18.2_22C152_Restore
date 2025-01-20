@interface TSTCompletionTokenAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxCompletionPrefixText;
- (NSString)tsaxCompletionText;
@end

@implementation TSTCompletionTokenAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTCompletionToken";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxCompletionText
{
  return (NSString *)[(TSTCompletionTokenAccessibility *)self tsaxValueForKey:@"completionText"];
}

- (NSString)tsaxCompletionPrefixText
{
  id v3 = [(TSTCompletionTokenAccessibility *)self tsaxValueForKey:@"completionText"];
  id length = [v3 length];
  id v5 = [(TSTCompletionTokenAccessibility *)self tsaxRangeValueForKey:@"prefixRange"];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger location = 0;
  }
  else
  {
    NSUInteger v8 = (NSUInteger)v5;
    NSUInteger v9 = v6;
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (v8 + v9 > (unint64_t)length)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Completion token's prefix range property is bogus.", v11, v12, v13, v14, v15, v18))abort(); {
      }
        }
    }
    v20.NSUInteger location = v8;
    v20.id length = v9;
    v21.NSUInteger location = 0;
    v21.id length = (NSUInteger)length;
    NSRange v16 = NSIntersectionRange(v20, v21);
    NSUInteger location = v16.location;
    id length = (id)v16.length;
  }

  return [v3 substringWithRange:location, length];
}

@end