@interface TSDMultiPaneControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSDMultiPaneControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDMultiPaneController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end