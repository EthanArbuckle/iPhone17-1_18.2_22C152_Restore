@interface CRLLineSpacingAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSString)crlaxLineSpacingDescription;
- (double)crlaxAmount;
- (int64_t)crlaxMode;
@end

@implementation CRLLineSpacingAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPLineSpacing";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (int64_t)crlaxMode
{
  v2 = [(CRLLineSpacingAccessibility *)self crlaxTarget];
  id v3 = [v2 mode];

  return (int64_t)v3;
}

- (double)crlaxAmount
{
  v2 = [(CRLLineSpacingAccessibility *)self crlaxTarget];
  [v2 amount];
  double v4 = v3;

  return v4;
}

- (NSString)crlaxLineSpacingDescription
{
  unint64_t v3 = [(CRLLineSpacingAccessibility *)self crlaxMode];
  if (v3 >= 5)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unknown line spacing, treat as relative format multiplier.", v6, v7, v8, v9, v10, v15))abort(); {
    }
      }
    double v4 = @"line.spacing.relative";
  }
  else
  {
    double v4 = *(&off_101500BF8 + v3);
  }
  v11 = CRLAccessibilityStringsDictKey(v4);
  if (v11)
  {
    [(CRLLineSpacingAccessibility *)self crlaxAmount];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
  }
  else
  {
    v13 = 0;
  }

  return (NSString *)v13;
}

@end