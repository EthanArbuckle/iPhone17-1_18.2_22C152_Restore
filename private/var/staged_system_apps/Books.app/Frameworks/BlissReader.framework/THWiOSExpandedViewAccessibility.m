@interface THWiOSExpandedViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation THWiOSExpandedViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWiOSExpandedView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end