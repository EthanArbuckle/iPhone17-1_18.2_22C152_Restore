@interface CRLShapeItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (CRLPathSourceAccessibility)crlaxPathSource;
- (NSString)crlaxShapeStyleName;
- (NSString)crlaxShapeTypeHint;
- (NSString)crlaxShapeTypeLabel;
@end

@implementation CRLShapeItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLShapeItem";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (CRLPathSourceAccessibility)crlaxPathSource
{
  char v8 = 0;
  v2 = [(CRLShapeItemAccessibility *)self crlaxTarget];
  v3 = [v2 pathSource];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLPathSourceAccessibility *)v6;
}

- (NSString)crlaxShapeTypeLabel
{
  v2 = [(CRLShapeItemAccessibility *)self crlaxPathSource];
  v3 = [v2 crlaxLabel];

  return (NSString *)v3;
}

- (NSString)crlaxShapeTypeHint
{
  v2 = [(CRLShapeItemAccessibility *)self crlaxPathSource];
  v3 = [v2 crlaxHint];

  return (NSString *)v3;
}

- (NSString)crlaxShapeStyleName
{
  return self->_crlaxShapeStyleName;
}

- (void).cxx_destruct
{
}

@end