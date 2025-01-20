@interface CRLGroupItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (id)crlaxTypeDescription;
@end

@implementation CRLGroupItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLGroupItem";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)crlaxTypeDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"GROUP_ACCESSIBILITY" value:@"Group" table:0];

  return v3;
}

@end