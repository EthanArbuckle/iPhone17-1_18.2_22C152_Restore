@interface THTSWPHyperlinkFieldAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THTSWPHyperlinkFieldAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPHyperlinkField";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end