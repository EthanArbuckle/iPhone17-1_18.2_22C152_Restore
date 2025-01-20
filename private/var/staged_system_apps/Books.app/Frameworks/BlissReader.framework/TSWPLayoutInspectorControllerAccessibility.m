@interface TSWPLayoutInspectorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)p_updateAlignmentControl:(id)a3 forVertical:(BOOL)a4;
@end

@implementation TSWPLayoutInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPLayoutInspectorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_updateAlignmentControl:(id)a3 forVertical:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)TSWPLayoutInspectorControllerAccessibility;
  -[TSWPLayoutInspectorControllerAccessibility p_updateAlignmentControl:forVertical:](&v13, "p_updateAlignmentControl:forVertical:");
  if (a4)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = objc_alloc((Class)NSArray);
    v8 = TSAccessibilityLocalizedString(@"vertical.align.top");
    v9 = TSAccessibilityLocalizedString(@"vertical.align.middle");
    id v6 = [v7 initWithObjects:v8, v9, TSAccessibilityLocalizedString(@"vertical.align.bottom"), 0];
  }
  char v12 = 0;
  v10 = objc_opt_class();
  Class v11 = __TSAccessibilityCastAsSafeCategory(v10, (uint64_t)a3, 1, &v12);
  if (v12) {
    abort();
  }
  [(objc_class *)v11 tsaxSetSegmentDescriptions:v6];
}

@end