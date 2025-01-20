@interface CRLLineEndAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsTypeNone;
- (NSString)crlaxStyleInfoDescription;
@end

@implementation CRLLineEndAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLLineEnd";
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

- (BOOL)crlaxIsTypeNone
{
  v2 = [(CRLLineEndAccessibility *)self crlaxTarget];
  BOOL v3 = (id)+[CRLLineEnd lineEndTypeFromLineEnd:v2] == (id)10;

  return v3;
}

- (NSString)crlaxStyleInfoDescription
{
  v2 = [(CRLLineEndAccessibility *)self crlaxTarget];
  BOOL v3 = [v2 accessibilityDescription];

  return (NSString *)v3;
}

@end