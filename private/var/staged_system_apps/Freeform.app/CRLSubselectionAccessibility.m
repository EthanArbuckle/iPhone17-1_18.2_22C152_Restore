@interface CRLSubselectionAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSSet)crlaxInfos;
- (NSSet)crlaxUnlockedInfos;
@end

@implementation CRLSubselectionAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLSubselection";
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

- (NSSet)crlaxInfos
{
  id v3 = NSProtocolFromString(@"CRLCanvasSelection");
  unsigned int v4 = [(CRLSubselectionAccessibility *)self conformsToProtocol:v3];

  if (v4)
  {
    char v17 = 0;
    v5 = [(CRLSubselectionAccessibility *)self crlaxValueForKey:@"infos"];
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v17);
    if (!v17)
    {
      v8 = (void *)v7;

      goto LABEL_7;
    }
LABEL_10:
    abort();
  }
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v10 = objc_opt_class();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"%@ does not implement CRLCanvasSelection protocol, we should not be asking it for infos", v11, v12, v13, v14, v15, v10))goto LABEL_10; {
  }
    }
  v8 = 0;
LABEL_7:

  return (NSSet *)v8;
}

- (NSSet)crlaxUnlockedInfos
{
  id v3 = NSProtocolFromString(@"CRLCanvasSelection");
  unsigned int v4 = [(CRLSubselectionAccessibility *)self conformsToProtocol:v3];

  if (v4)
  {
    char v17 = 0;
    v5 = [(CRLSubselectionAccessibility *)self crlaxValueForKey:@"unlockedInfos"];
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v5, 1, &v17);
    if (!v17)
    {
      v8 = (void *)v7;

      goto LABEL_7;
    }
LABEL_10:
    abort();
  }
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v10 = objc_opt_class();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"%@ does not implement CRLCanvasSelection protocol, we should not be asking it for infos", v11, v12, v13, v14, v15, v10))goto LABEL_10; {
  }
    }
  v8 = 0;
LABEL_7:

  return (NSSet *)v8;
}

@end