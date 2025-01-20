@interface THWReviewSummaryRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_thaxConfigureRepIgnorance;
- (void)didUpdateLayer:(id)a3;
- (void)thaxShouldIgnore:(BOOL)a3 checkingRep:(id)a4;
- (void)thaxShouldIgnore:(BOOL)a3 resultsRep:(id)a4;
- (void)tsaxLoadAccessibilityInformation;
@end

@implementation THWReviewSummaryRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewSummaryRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryRepAccessibility;
  [(THWReviewSummaryRepAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THWReviewSummaryRepAccessibility *)self _thaxConfigureRepIgnorance];
}

- (void)didUpdateLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWReviewSummaryRepAccessibility;
  [(THWReviewSummaryRepAccessibility *)&v4 didUpdateLayer:a3];
  [(THWReviewSummaryRepAccessibility *)self _thaxConfigureRepIgnorance];
}

- (void)_thaxConfigureRepIgnorance
{
  objc_super v3 = [(TSDRepAccessibility *)self tsaxLayout];
  objc_super v4 = [(TSDRepAccessibility *)self tsaxCanvas];
  char v22 = 0;
  v5 = objc_opt_class();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = sub_283EC0;
  v20 = sub_283ED0;
  uint64_t v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_283EDC;
  v15[3] = &unk_457DA0;
  v15[5] = v3;
  v15[6] = &v16;
  v15[4] = v4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v15)) {
    abort();
  }
  uint64_t v6 = v17[5];
  _Block_object_dispose(&v16, 8);
  Class v7 = __TSAccessibilityCastAsSafeCategory(v5, v6, 1, &v22);
  if (v22) {
    goto LABEL_10;
  }
  Class v8 = v7;
  char v22 = 0;
  v9 = objc_opt_class();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = sub_283EC0;
  v20 = sub_283ED0;
  uint64_t v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_283F24;
  v14[3] = &unk_457DA0;
  v14[5] = v3;
  v14[6] = &v16;
  v14[4] = v4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v14)) {
    abort();
  }
  uint64_t v10 = v17[5];
  _Block_object_dispose(&v16, 8);
  Class v11 = __TSAccessibilityCastAsSafeCategory(v9, v10, 1, &v22);
  if (v22) {
LABEL_10:
  }
    abort();
  Class v12 = v11;
  id v13 = [[v3 tsaxValueForKey:@"delegate"] tsaxBoolValueForKey:@"reviewSummaryShouldShowResults"];
  if ([(THWReviewSummaryRepAccessibility *)self tsaxRespondsToSelector:"thaxShouldIgnore:resultsRep:" fromExtrasProtocol:&OBJC_PROTOCOL___THWReviewSummaryRepAccessibilityExtras])[(THWReviewSummaryRepAccessibility *)self thaxShouldIgnore:v13 ^ 1 resultsRep:v8]; {
  if ([(THWReviewSummaryRepAccessibility *)self tsaxRespondsToSelector:"thaxShouldIgnore:checkingRep:" fromExtrasProtocol:&OBJC_PROTOCOL___THWReviewSummaryRepAccessibilityExtras])[(THWReviewSummaryRepAccessibility *)self thaxShouldIgnore:v13 resultsRep:v12];
  }
}

- (void)thaxShouldIgnore:(BOOL)a3 resultsRep:(id)a4
{
  BOOL v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  [a4 tsaxChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) thaxSetShouldHideElement:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)thaxShouldIgnore:(BOOL)a3 checkingRep:(id)a4
{
  BOOL v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a4 tsaxChildReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) thaxSetShouldHideElement:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end