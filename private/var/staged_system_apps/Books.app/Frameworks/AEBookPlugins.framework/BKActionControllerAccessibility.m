@interface BKActionControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)barButtonItem;
@end

@implementation BKActionControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKActionController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)barButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)BKActionControllerAccessibility;
  v2 = [(BKActionControllerAccessibility *)&v5 barButtonItem];
  v3 = AEAXLocString(@"action.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end