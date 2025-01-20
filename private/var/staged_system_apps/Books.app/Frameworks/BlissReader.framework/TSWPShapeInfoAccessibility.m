@interface TSWPShapeInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)p_bootstrapShapePresetsInTheme:(id)a3 alternate:(int64_t)a4;
- (BOOL)tsaxIsTextBox;
- (NSString)tsaxShapeString;
- (TSWPStorageAccessibility)tsaxContainedStorage;
@end

@implementation TSWPShapeInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPShapeInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxShapeString
{
  v2 = [(TSWPShapeInfoAccessibility *)self tsaxContainedStorage];

  return [(TSWPStorageAccessibility *)v2 tsaxString];
}

- (BOOL)tsaxIsTextBox
{
  return [(TSWPShapeInfoAccessibility *)self tsaxBoolValueForKey:@"isTextBox"];
}

- (TSWPStorageAccessibility)tsaxContainedStorage
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPShapeInfoAccessibility *)self tsaxValueForKey:@"containedStorage"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

+ (void)p_bootstrapShapePresetsInTheme:(id)a3 alternate:(int64_t)a4
{
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___TSWPShapeInfoAccessibility;
  [super p_bootstrapShapePresetsInTheme:a3 alternate:a4];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [a3 presetsOfKind:String];
    id v6 = objc_alloc((Class)NSArray);
    v7 = TSAccessibilityLocalizedString(@"darkBlueGradient");
    v8 = TSAccessibilityLocalizedString(@"lightBlue");
    v9 = TSAccessibilityLocalizedString(@"darkGreenGradient");
    v10 = TSAccessibilityLocalizedString(@"purple");
    v11 = TSAccessibilityLocalizedString(@"grayGradient");
    id v12 = [v6 initWithObjects:v7, v8, v9, v10, v11, TSAccessibilityLocalizedString(@"Red"), 0];
    v13 = (char *)[v5 count];
    v14 = (char *)[v12 count];
    if (v13)
    {
      v15 = v14;
      for (i = 0; i != v13; ++i)
      {
        id v17 = [v5 objectAtIndex:i];
        if (i < v15) {
          [v17 setAccessibilityLabel:[v12 objectAtIndex:i]];
        }
      }
    }
  }
}

@end