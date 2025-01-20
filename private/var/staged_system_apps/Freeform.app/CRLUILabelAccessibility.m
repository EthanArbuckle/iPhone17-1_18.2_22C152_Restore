@interface CRLUILabelAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation CRLUILabelAccessibility

+ (id)crlaxTargetClassName
{
  return @"UILabel";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CRLUILabelAccessibility *)self crlaxTarget];
  v4 = [v3 text];
  v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];
  id v7 = [v6 length];

  if (!v7) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLUILabelAccessibility;
  return [(CRLUILabelAccessibility *)&v9 isAccessibilityElement];
}

@end