@interface CRLImageItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (id)crlaxTypeDescription;
@end

@implementation CRLImageItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLImageItem";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)crlaxTypeDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Image" value:0 table:0];

  return v3;
}

@end