@interface CRLAngleGradientFillAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (NSString)crlaxStyleInfoDescription;
- (double)crlaxGradientAngleInDegrees;
@end

@implementation CRLAngleGradientFillAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLAngleGradientFill";
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

- (double)crlaxGradientAngleInDegrees
{
  v2 = [(CRLAngleGradientFillAccessibility *)self crlaxTarget];
  [v2 gradientAngleInDegrees];
  double v4 = v3;

  return v4;
}

- (NSString)crlaxStyleInfoDescription
{
  [(CRLAngleGradientFillAccessibility *)self crlaxGradientAngleInDegrees];
  if (v3 == 0.0)
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLAngleGradientFillAccessibility;
    v8 = [(CRLGradientFillAccessibility *)&v11 crlaxStyleInfoDescription];
  }
  else
  {
    double v4 = v3;
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"%1$@, %2$.0f degrees", 0, 0 value table];

    v12.receiver = self;
    v12.super_class = (Class)CRLAngleGradientFillAccessibility;
    v7 = [(CRLGradientFillAccessibility *)&v12 crlaxStyleInfoDescription];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, *(void *)&v4);
  }
  v9 = [v8 capitalizedString];

  return (NSString *)v9;
}

@end