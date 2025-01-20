@interface TSWPBIUInspectorCellControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSWPBIUInspectorCellControllerAccessibility)initWithEditor:(id)a3;
- (id)tsaxPropertiesCell;
@end

@implementation TSWPBIUInspectorCellControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPBIUInspectorCellController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSWPBIUInspectorCellControllerAccessibility)initWithEditor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPBIUInspectorCellControllerAccessibility;
  v3 = [(TSWPBIUInspectorCellControllerAccessibility *)&v7 initWithEditor:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [-[TSWPBIUInspectorCellControllerAccessibility tsaxPropertiesCell](v3, "tsaxPropertiesCell") tsaxSegmentedControl];
    v8[0] = TSAccessibilityLocalizedString(@"bold");
    v8[1] = TSAccessibilityLocalizedString(@"italic");
    v8[2] = TSAccessibilityLocalizedString(@"underline");
    v8[3] = TSAccessibilityLocalizedString(@"strikethrough");
    [v5 tsaxSetSegmentDescriptions:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4)];
  }
  return v4;
}

- (id)tsaxPropertiesCell
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPBIUInspectorCellControllerAccessibility *)self tsaxValueForKey:@"_biuPropertiesCell"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end