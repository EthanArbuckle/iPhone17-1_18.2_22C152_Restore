@interface AEMarginNotesControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
@end

@implementation AEMarginNotesControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AEMarginNotesController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end