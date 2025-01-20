@interface TSDStrokeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxStrokeIsEmpty;
- (NSString)tsaxStrokeColorDescription;
- (NSString)tsaxStrokePatternDescription;
- (NSString)tsaxStrokeWidthDescription;
- (TSDStrokePatternAccessibility)tsaxStrokePattern;
- (double)_tsaxStrokeWidth;
- (id)_tsaxStrokeColor;
- (id)accessibilityLabel;
@end

@implementation TSDStrokeAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDStroke";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSDStrokePatternAccessibility)tsaxStrokePattern
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDStrokePatternAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDStrokeAccessibility *)self tsaxValueForKey:@"pattern"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)tsaxStrokeIsEmpty
{
  return [(TSDStrokeAccessibility *)self tsaxBoolValueForKey:@"isNullStroke"];
}

- (NSString)tsaxStrokePatternDescription
{
  if ([(TSDStrokeAccessibility *)self tsaxStrokeIsEmpty])
  {
    return TSAccessibilityLocalizedString(@"stroke.emptyPattern");
  }
  else
  {
    v4 = [(TSDStrokeAccessibility *)self tsaxStrokePattern];
    return [(TSDStrokePatternAccessibility *)v4 tsaxDescription];
  }
}

- (NSString)tsaxStrokeWidthDescription
{
  [(TSDStrokeAccessibility *)self _tsaxStrokeWidth];
  if (v2 <= 1.0) {
    CFStringRef v3 = @"stroke.width.singular %f";
  }
  else {
    CFStringRef v3 = @"stroke.width.plural %f";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v3), *(void *)&v2);
}

- (NSString)tsaxStrokeColorDescription
{
  id v2 = [(TSDStrokeAccessibility *)self _tsaxStrokeColor];

  return (NSString *)[v2 tsaxStyleInfoDescription];
}

- (id)_tsaxStrokeColor
{
  char v5 = 0;
  CFStringRef v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDStrokeAccessibility *)self tsaxValueForKey:@"color"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (double)_tsaxStrokeWidth
{
  [(TSDStrokeAccessibility *)self tsaxCGFloatValueForKey:@"width"];
  return result;
}

- (id)accessibilityLabel
{
  id result = [(TSDStrokeAccessibility *)self tsaxValueForKey:@"accessibilityUserDefinedLabel"];
  if (!result)
  {
    return [(TSDStrokeAccessibility *)self tsaxStrokePatternDescription];
  }
  return result;
}

@end