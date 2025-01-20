@interface THiOSCanvasViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxEditMenuItems;
@end

@implementation THiOSCanvasViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THiOSCanvasViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxEditMenuItems
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THiOSCanvasViewControllerAccessibility *)self tsaxValueForKey:@"extraMenuItems"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end