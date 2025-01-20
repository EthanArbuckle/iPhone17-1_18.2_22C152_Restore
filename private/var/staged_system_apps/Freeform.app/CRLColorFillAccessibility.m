@interface CRLColorFillAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLColorAccessibility)crlaxColor;
- (NSString)crlaxColorFillName;
- (NSString)crlaxColorFillNameWithOpacity;
@end

@implementation CRLColorFillAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLColorFill";
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

- (NSString)crlaxColorFillName
{
  v2 = [(CRLColorFillAccessibility *)self crlaxColor];
  id v3 = [v2 crlaxStyleInfoDescription];

  return (NSString *)v3;
}

- (NSString)crlaxColorFillNameWithOpacity
{
  id v3 = [(CRLColorFillAccessibility *)self crlaxColor];
  v4 = [v3 crlaxTarget];
  unsigned int v5 = [v4 isClear];

  if (v5)
  {
    v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Clear" value:0 table:0];
  }
  else
  {
    v8 = [(CRLColorFillAccessibility *)self crlaxColor];
    v9 = [v8 crlaxTarget];
    int v10 = [v9 isOpaque];

    v6 = [(CRLColorFillAccessibility *)self crlaxColorFillName];
    if (v10) {
      goto LABEL_6;
    }
    v11 = [(CRLColorFillAccessibility *)self crlaxColor];
    v12 = [v11 crlaxTarget];
    [v12 alphaComponent];
    v13 = +[CRLColorAccessibility crlaxOpacityDescriptionStringForAlphaComponent:](CRLColorAccessibility, "crlaxOpacityDescriptionStringForAlphaComponent:");
    uint64_t v7 = __CRLAccessibilityStringForVariables(1, v6, v14, v15, v16, v17, v18, v19, (uint64_t)v13);
  }
  v6 = (void *)v7;
LABEL_6:

  return (NSString *)v6;
}

- (CRLColorAccessibility)crlaxColor
{
  char v8 = 0;
  v2 = [(CRLColorFillAccessibility *)self crlaxTarget];
  id v3 = [v2 color];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLColorAccessibility *)v6;
}

@end