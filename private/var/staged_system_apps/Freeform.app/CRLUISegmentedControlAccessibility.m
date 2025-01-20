@interface CRLUISegmentedControlAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (void)crlaxSetSegmentDescriptions:(id)a3;
@end

@implementation CRLUISegmentedControlAccessibility

+ (id)crlaxTargetClassName
{
  return @"UISegmentedControl";
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

- (void)crlaxSetSegmentDescriptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(CRLUISegmentedControlAccessibility *)v5 valueForKey:@"_segments"];
  id v7 = [v6 count];
  id v8 = [v4 count];
  if (v8 == v7)
  {
    if (v7)
    {
      uint64_t v9 = 0;
      while (1)
      {
        char v26 = 0;
        v10 = [v6 objectAtIndex:v9];
        v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v10, 1, &v26);
        if (v26) {
          break;
        }
        v13 = (void *)v12;

        char v25 = 0;
        v14 = [v4 objectAtIndex:v9];
        v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = __CRLAccessibilityCastAsClass(v15, (uint64_t)v14, 1, &v25);
        if (v25) {
          break;
        }
        v17 = (void *)v16;

        [v13 setAccessibilityLabel:v17];
        if (v7 == (id)++v9) {
          goto LABEL_10;
        }
      }
LABEL_11:
      abort();
    }
  }
  else
  {
    uint64_t v18 = (uint64_t)v8;
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Number of segments have changed from %lu to %lu", v20, v21, v22, v23, v24, v18))goto LABEL_11; {
    }
      }
  }
LABEL_10:
}

@end