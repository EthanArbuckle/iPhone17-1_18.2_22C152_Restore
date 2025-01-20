@interface TSDGradientAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)tsaxGradientColorDescriptions;
- (NSString)tsaxGradientTypeDescription;
- (id)_tsaxGradientStops;
- (unint64_t)_tsaxGradientType;
@end

@implementation TSDGradientAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDGradient";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxGradientTypeDescription
{
  unint64_t v2 = [(TSDGradientAccessibility *)self _tsaxGradientType];
  if (v2)
  {
    if (v2 != 1) {
      return 0;
    }
    CFStringRef v3 = @"gradient.radial";
  }
  else
  {
    CFStringRef v3 = @"gradient.linear";
  }

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

- (NSArray)tsaxGradientColorDescriptions
{
  CFStringRef v3 = (NSArray *)+[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(TSDGradientAccessibility *)self _tsaxGradientStops];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        char v14 = 0;
        v10 = objc_opt_class();
        Class v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 1, &v14);
        if (v14) {
          abort();
        }
        id v12 = [(objc_class *)v11 tsaxColorDescription];
        if ([v12 length]) {
          [(NSArray *)v3 addObject:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)_tsaxGradientStops
{
  char v5 = 0;
  CFStringRef v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDGradientAccessibility *)self tsaxValueForKey:@"gradientStops"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (unint64_t)_tsaxGradientType
{
  return (unint64_t)[(TSDGradientAccessibility *)self tsaxUnsignedIntegerValueForKey:@"gradientType"];
}

@end