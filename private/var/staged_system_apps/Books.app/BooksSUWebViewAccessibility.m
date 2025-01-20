@interface BooksSUWebViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
@end

@implementation BooksSUWebViewAccessibility

+ (id)imaxTargetClassName
{
  return @"SUWebView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end