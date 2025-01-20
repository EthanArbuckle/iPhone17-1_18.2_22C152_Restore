@interface CRLFillAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxDescriptionForFill:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLColorAccessibility)crlaxReferenceColor;
- (NSString)crlaxStyleInfoDescription;
- (int64_t)crlaxFillType;
@end

@implementation CRLFillAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLFill";
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

- (int64_t)crlaxFillType
{
  v2 = [(CRLFillAccessibility *)self crlaxTarget];
  id v3 = [v2 fillType];

  return (int64_t)v3;
}

- (CRLColorAccessibility)crlaxReferenceColor
{
  char v8 = 0;
  v2 = [(CRLFillAccessibility *)self crlaxTarget];
  id v3 = [v2 referenceColor];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLColorAccessibility *)v6;
}

+ (id)crlaxDescriptionForFill:(id)a3
{
  id v3 = a3;
  if (!v3
    || (+[NSNull null],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == v3))
  {
    char v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"No fill" value:0 table:0];
LABEL_7:
    v10 = (void *)v9;

    goto LABEL_8;
  }
  +[CRLAccessibilitySafeCategory crlaxTargetClass];
  if (objc_opt_isKindOfClass())
  {
    char v12 = 0;
    id v5 = v3;
    v6 = objc_opt_class();
    uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v12);
    if (v12) {
      abort();
    }
    char v8 = (void *)v7;

    uint64_t v9 = [v8 crlaxStyleInfoDescription];
    goto LABEL_7;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (NSString)crlaxStyleInfoDescription
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v3 = objc_opt_class();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"-[CRLFillAccessibility crlaxStyleInfoDescription] is abstract. Please implement crlaxStyleInfoDescription in %@.", v4, v5, v6, v7, v8, v3))abort(); {
  }
    }
  return 0;
}

@end