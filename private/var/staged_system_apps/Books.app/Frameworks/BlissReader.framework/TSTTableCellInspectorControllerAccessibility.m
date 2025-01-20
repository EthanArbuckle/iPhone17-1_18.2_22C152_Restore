@interface TSTTableCellInspectorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)textPropertiesCell;
@end

@implementation TSTTableCellInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableCellInspectorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)textPropertiesCell
{
  char v11 = 0;
  v3 = objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)TSTTableCellInspectorControllerAccessibility;
  id v4 = [(TSTTableCellInspectorControllerAccessibility *)&v10 textPropertiesCell];
  Class v5 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v11);
  if (v11) {
    goto LABEL_3;
  }
  uint64_t v6 = (uint64_t)v5;
  id v7 = [(objc_class *)v5 tsaxSegmentedControl];
  v12[0] = TSAccessibilityLocalizedString(@"bold");
  v12[1] = TSAccessibilityLocalizedString(@"italic");
  v12[2] = TSAccessibilityLocalizedString(@"underline");
  v12[3] = TSAccessibilityLocalizedString(@"strikethrough");
  [v7 tsaxSetSegmentDescriptions:[NSArray arrayWithObjects:count:v12, 4]];
  char v11 = 0;
  v8 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v8, v6, 1, &v11);
  if (v11) {
LABEL_3:
  }
    abort();
  return result;
}

@end