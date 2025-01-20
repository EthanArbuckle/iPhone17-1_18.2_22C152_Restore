@interface TSADocumentManagerHeaderViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSADocumentManagerHeaderViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerHeaderView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end