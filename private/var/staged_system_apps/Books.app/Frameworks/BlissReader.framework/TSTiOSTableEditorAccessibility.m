@interface TSTiOSTableEditorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSTiOSTableEditorAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTiOSTableEditor";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end