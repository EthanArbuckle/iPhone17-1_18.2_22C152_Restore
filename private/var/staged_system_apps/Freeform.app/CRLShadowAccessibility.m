@interface CRLShadowAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsShadowEnabled;
- (CRLColorAccessibility)_crlaxShadowColor;
- (NSString)crlaxShadowAngleDescription;
- (NSString)crlaxShadowColorDescription;
- (NSString)crlaxShadowTypeDescription;
- (NSString)crlaxStyleInfoDescription;
- (double)_crlaxShadowAngle;
@end

@implementation CRLShadowAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLShadow";
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

- (BOOL)crlaxIsShadowEnabled
{
  v2 = [(CRLShadowAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (NSString)crlaxShadowTypeDescription
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"Shadow" value:0 table:0];

  return (NSString *)v3;
}

- (NSString)crlaxShadowAngleDescription
{
  [(CRLShadowAccessibility *)self _crlaxShadowAngle];
  if (v2 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    double v3 = v2;
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"%.0f degrees" value:0 table:0];
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, *(void *)&v3);
  }

  return (NSString *)v6;
}

- (NSString)crlaxShadowColorDescription
{
  double v2 = [(CRLShadowAccessibility *)self _crlaxShadowColor];
  double v3 = [v2 crlaxStyleInfoDescription];

  return (NSString *)v3;
}

- (NSString)crlaxStyleInfoDescription
{
  if ([(CRLShadowAccessibility *)self crlaxIsShadowEnabled])
  {
    double v3 = [(CRLShadowAccessibility *)self crlaxShadowTypeDescription];
    v4 = [(CRLShadowAccessibility *)self crlaxShadowAngleDescription];
    v13 = [(CRLShadowAccessibility *)self crlaxShadowColorDescription];
    v11 = __CRLAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
  else
  {
    double v3 = +[NSBundle mainBundle];
    v11 = [v3 localizedStringForKey:@"No shadow" value:0 table:0];
  }

  return (NSString *)v11;
}

- (double)_crlaxShadowAngle
{
  double v2 = [(CRLShadowAccessibility *)self crlaxTarget];
  [v2 angle];
  double v4 = v3;

  return v4;
}

- (CRLColorAccessibility)_crlaxShadowColor
{
  char v8 = 0;
  double v2 = [(CRLShadowAccessibility *)self crlaxTarget];
  double v3 = [v2 color];

  double v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLColorAccessibility *)v6;
}

@end