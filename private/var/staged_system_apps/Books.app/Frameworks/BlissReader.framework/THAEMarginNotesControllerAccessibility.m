@interface THAEMarginNotesControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THAEMarginNotesControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"AEMarginNotesController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end