@interface TSDScalarPathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxInferredLabel;
- (unint64_t)_tsaxNumberOfSides;
@end

@implementation TSDScalarPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDScalarPathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxInferredLabel
{
  unsigned int v3 = [(TSDScalarPathSourceAccessibility *)self tsaxUnsignedIntValueForKey:@"type"];
  if (v3 == 1)
  {
    unint64_t v5 = [(TSDScalarPathSourceAccessibility *)self _tsaxNumberOfSides] - 3;
    if (v5 <= 2)
    {
      CFStringRef v4 = off_46BFF0[v5];
      goto LABEL_8;
    }
    return 0;
  }
  if (v3) {
    return 0;
  }
  if ([(TSDScalarPathSourceAccessibility *)self _tsaxNumberOfSides]) {
    CFStringRef v4 = @"RoundRect";
  }
  else {
    CFStringRef v4 = @"Square";
  }
LABEL_8:

  return TSAccessibilityLocalizedString((uint64_t)v4);
}

- (unint64_t)_tsaxNumberOfSides
{
  [(TSDScalarPathSourceAccessibility *)self tsaxCGFloatValueForKey:@"scalar"];
  return llround(v2);
}

@end