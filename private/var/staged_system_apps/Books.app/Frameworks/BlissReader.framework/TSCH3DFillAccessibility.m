@interface TSCH3DFillAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSCH3DFillAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCH3DFill";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end