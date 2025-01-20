@interface TSDKeyboardMovementManipulatorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSDKeyboardMovementManipulatorAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDKeyboardMovementManipulator";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end