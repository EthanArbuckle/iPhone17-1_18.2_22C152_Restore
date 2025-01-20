@interface TSDStrokePatternAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxSolidPatternDescription;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxIsDefaultStroke;
- (BOOL)tsaxIsSeparatorStroke;
- (NSString)tsaxDescription;
- (int)_tsaxStrokePattern;
- (void)tsaxSetDefaultStroke:(BOOL)a3;
- (void)tsaxSetSeparatorStroke:(BOOL)a3;
@end

@implementation TSDStrokePatternAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDStrokePattern";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxIsSeparatorStroke
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738E8);
}

- (void)tsaxSetSeparatorStroke:(BOOL)a3
{
}

- (BOOL)tsaxIsDefaultStroke
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738E9);
}

- (void)tsaxSetDefaultStroke:(BOOL)a3
{
}

- (NSString)tsaxDescription
{
  v3 = (NSString *)[&off_499B90 count];
  if ([(TSDStrokePatternAccessibility *)self tsaxIsDefaultStroke])
  {
    CFStringRef v4 = @"stroke.default";
LABEL_3:
    v3 = TSAccessibilityLocalizedString((uint64_t)v4);
    goto LABEL_4;
  }
  if ([(TSDStrokePatternAccessibility *)self tsaxIsSeparatorStroke])
  {
    TSAccessibilityShouldPerformValidationChecks();
    return (NSString *)&stru_46D7E8;
  }
  if (v3)
  {
    uint64_t v12 = 0;
    while (!-[TSDStrokePatternAccessibility isEqual:](self, "isEqual:", objc_msgSend((id)objc_opt_class(), "tsaxValueForKey:", objc_msgSend(&off_499B90, "objectAtIndexedSubscript:", v12))))
    {
      if (v3 == (NSString *)++v12)
      {
        v3 = 0;
        goto LABEL_4;
      }
    }
    CFStringRef v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"stroke.%@", [&off_499B90 objectAtIndexedSubscript:v12]);
    goto LABEL_3;
  }
LABEL_4:
  if (TSAccessibilityShouldPerformValidationChecks() && !v3)
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No name for stroke was found: %@", v6, v7, v8, v9, v10, (uint64_t)self))abort(); {
    return 0;
    }
  }
  return v3;
}

- (int)_tsaxStrokePattern
{
  return [(TSDStrokePatternAccessibility *)self tsaxIntValueForKey:@"patternType"];
}

+ (id)tsaxSolidPatternDescription
{
  return TSAccessibilityLocalizedString(@"stroke.solidPattern");
}

@end