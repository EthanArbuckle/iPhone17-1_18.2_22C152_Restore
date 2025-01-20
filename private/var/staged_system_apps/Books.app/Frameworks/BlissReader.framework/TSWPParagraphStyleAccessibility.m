@interface TSWPParagraphStyleAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSWPParagraphStyleAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPParagraphStyle";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end