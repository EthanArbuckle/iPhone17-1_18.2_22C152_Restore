@interface CRLGradientFillAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSArray)_crlaxGradientStops;
- (NSArray)crlaxApproximateColorStopNames;
- (NSString)crlaxGradientTypeDescription;
- (NSString)crlaxStyleInfoDescription;
- (unint64_t)_crlaxGradientType;
@end

@implementation CRLGradientFillAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLGradientFill";
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

- (NSString)crlaxGradientTypeDescription
{
  unint64_t v2 = [(CRLGradientFillAccessibility *)self _crlaxGradientType];
  if (v2 == 1)
  {
    id v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Radial gradient";
    goto LABEL_5;
  }
  if (!v2)
  {
    id v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Linear gradient";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:0 table:0];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSArray)crlaxApproximateColorStopNames
{
  id v3 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(CRLGradientFillAccessibility *)self _crlaxGradientStops];
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v17 = 0;
        id v10 = v9;
        v11 = objc_opt_class();
        uint64_t v12 = __CRLAccessibilityCastAsSafeCategory(v11, (uint64_t)v10, 1, &v17);
        if (v17) {
          abort();
        }
        v13 = (void *)v12;

        v14 = [v13 crlaxColor];
        v15 = [v14 crlaxStyleInfoDescription];

        if ([v15 length]) {
          [v3 addObject:v15];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)crlaxStyleInfoDescription
{
  id v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"to" value:0 table:0];

  id v5 = [(CRLGradientFillAccessibility *)self crlaxApproximateColorStopNames];
  id v6 = +[NSString stringWithFormat:@" %@ ", v4];
  uint64_t v7 = [v5 componentsJoinedByString:v6];

  v8 = [(CRLGradientFillAccessibility *)self crlaxGradientTypeDescription];
  v15 = __CRLAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  return (NSString *)v15;
}

- (NSArray)_crlaxGradientStops
{
  unint64_t v2 = [(CRLGradientFillAccessibility *)self crlaxTarget];
  id v3 = [v2 gradientStops];

  return (NSArray *)v3;
}

- (unint64_t)_crlaxGradientType
{
  unint64_t v2 = [(CRLGradientFillAccessibility *)self crlaxTarget];
  id v3 = [v2 gradientType];

  return (unint64_t)v3;
}

@end