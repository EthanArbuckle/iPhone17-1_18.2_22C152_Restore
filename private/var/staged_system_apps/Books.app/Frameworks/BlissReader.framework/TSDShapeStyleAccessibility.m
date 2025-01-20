@interface TSDShapeStyleAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxStyleInfoDescription;
- (id)tsaxValueForProperty:(int)a3;
@end

@implementation TSDShapeStyleAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShapeStyle";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxValueForProperty:(int)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_27D064;
  v11 = sub_27D074;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_27D080;
  v5[3] = &unk_46BA50;
  v5[4] = self;
  v5[5] = &v7;
  int v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (NSString)tsaxStyleInfoDescription
{
  id v3 = [(TSSStyleAccessibility *)self tsaxDescriptionForObjectProperty:516];
  id v4 = [(TSSStyleAccessibility *)self tsaxDescriptionForObjectProperty:517];
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

@end