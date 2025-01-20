@interface CRLStrokeAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxStrokeIsEmpty;
- (CRLColorAccessibility)crlaxStrokeColor;
- (CRLStrokePatternAccessibility)crlaxStrokePattern;
- (NSString)crlaxStrokeColorDescription;
- (NSString)crlaxStrokeFullDescription;
- (NSString)crlaxStrokePatternDescription;
- (NSString)crlaxStrokeWidthDescription;
- (NSString)crlaxStyleInfoDescription;
- (double)crlaxStrokeWidth;
@end

@implementation CRLStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLStroke";
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

- (CRLStrokePatternAccessibility)crlaxStrokePattern
{
  char v8 = 0;
  v2 = [(CRLStrokeAccessibility *)self crlaxTarget];
  id v3 = [v2 pattern];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLStrokePatternAccessibility *)v6;
}

- (BOOL)crlaxStrokeIsEmpty
{
  v2 = [(CRLStrokeAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isNullStroke];

  return v3;
}

- (NSString)crlaxStrokePatternDescription
{
  if ([(CRLStrokeAccessibility *)self crlaxStrokeIsEmpty])
  {
    unsigned __int8 v3 = +[NSBundle mainBundle];
    [v3 localizedStringForKey:@"Empty stroke" value:0 table:0];
  }
  else
  {
    unsigned __int8 v3 = [(CRLStrokeAccessibility *)self crlaxStrokePattern];
    [v3 crlaxStyleInfoDescription];
  v4 = };

  return (NSString *)v4;
}

- (NSString)crlaxStrokeWidthDescription
{
  [(CRLStrokeAccessibility *)self crlaxStrokeWidth];
  uint64_t v3 = v2;
  v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"%.2f points wide" value:0 table:0];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return (NSString *)v6;
}

- (NSString)crlaxStrokeColorDescription
{
  uint64_t v2 = [(CRLStrokeAccessibility *)self crlaxStrokeColor];
  uint64_t v3 = [v2 crlaxStyleInfoDescription];

  return (NSString *)v3;
}

- (NSString)crlaxStrokeFullDescription
{
  if ([(CRLStrokeAccessibility *)self crlaxStrokeIsEmpty]
    || ([(CRLStrokeAccessibility *)self crlaxStrokeWidth], v3 <= 0.0))
  {
    v4 = +[NSBundle mainBundle];
    v14 = [v4 localizedStringForKey:@"None" value:0 table:0];
  }
  else
  {
    v4 = [(CRLStrokeAccessibility *)self crlaxStrokeColor];
    uint64_t v5 = [v4 crlaxApproximateColorDescriptionWithOpacity];
    v6 = [(CRLStrokeAccessibility *)self crlaxStrokeWidthDescription];
    v7 = [(CRLStrokeAccessibility *)self crlaxStrokePattern];
    v16 = [v7 crlaxStyleInfoDescriptionOmittingStroke];
    v14 = __CRLAccessibilityStringForVariables(1, v5, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  }

  return (NSString *)v14;
}

- (CRLColorAccessibility)crlaxStrokeColor
{
  char v8 = 0;
  uint64_t v2 = [(CRLStrokeAccessibility *)self crlaxTarget];
  double v3 = [v2 color];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLColorAccessibility *)v6;
}

- (double)crlaxStrokeWidth
{
  uint64_t v2 = [(CRLStrokeAccessibility *)self crlaxTarget];
  [v2 width];
  double v4 = v3;

  return v4;
}

- (NSString)crlaxStyleInfoDescription
{
  if ([(CRLStrokeAccessibility *)self crlaxStrokeIsEmpty])
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = [v3 localizedStringForKey:@"No stroke" value:0 table:0];
  }
  else
  {
    double v3 = [(CRLStrokeAccessibility *)self crlaxStrokePatternDescription];
    uint64_t v5 = [(CRLStrokeAccessibility *)self crlaxStrokeWidthDescription];
    uint64_t v13 = [(CRLStrokeAccessibility *)self crlaxStrokeColorDescription];
    double v4 = __CRLAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }

  return (NSString *)v4;
}

@end