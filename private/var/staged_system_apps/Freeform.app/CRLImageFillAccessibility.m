@interface CRLImageFillAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLColorAccessibility)crlaxTintColor;
- (CRLDataAccessibility)crlaxImageData;
- (NSString)crlaxFillTechniqueDescription;
- (NSString)crlaxStyleInfoDescription;
- (unint64_t)crlaxFillTechnique;
@end

@implementation CRLImageFillAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLImageFill";
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

- (NSString)crlaxFillTechniqueDescription
{
  switch([(CRLImageFillAccessibility *)self crlaxFillTechnique])
  {
    case 0uLL:
      v2 = +[NSBundle mainBundle];
      id v3 = v2;
      CFStringRef v4 = @"Natural size";
      goto LABEL_8;
    case 1uLL:
      v2 = +[NSBundle mainBundle];
      id v3 = v2;
      CFStringRef v4 = @"Stretch";
      goto LABEL_8;
    case 2uLL:
      v2 = +[NSBundle mainBundle];
      id v3 = v2;
      CFStringRef v4 = @"Tile";
      goto LABEL_8;
    case 3uLL:
      v2 = +[NSBundle mainBundle];
      id v3 = v2;
      CFStringRef v4 = @"Scale to fill";
      goto LABEL_8;
    case 4uLL:
      v2 = +[NSBundle mainBundle];
      id v3 = v2;
      CFStringRef v4 = @"Scale to fit";
LABEL_8:
      v5 = [v2 localizedStringForKey:v4 value:0 table:0];

      break;
    default:
      v5 = 0;
      break;
  }

  return (NSString *)v5;
}

- (unint64_t)crlaxFillTechnique
{
  v2 = [(CRLImageFillAccessibility *)self crlaxTarget];
  id v3 = [v2 technique];

  return (unint64_t)v3;
}

- (CRLDataAccessibility)crlaxImageData
{
  char v8 = 0;
  v2 = [(CRLImageFillAccessibility *)self crlaxTarget];
  id v3 = [v2 imageData];

  CFStringRef v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLDataAccessibility *)v6;
}

- (CRLColorAccessibility)crlaxTintColor
{
  char v8 = 0;
  v2 = [(CRLImageFillAccessibility *)self crlaxTarget];
  id v3 = [v2 tintColor];

  CFStringRef v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLColorAccessibility *)v6;
}

- (NSString)crlaxStyleInfoDescription
{
  id v3 = +[NSMutableArray array];
  CFStringRef v4 = [(CRLImageFillAccessibility *)self crlaxImageData];
  uint64_t v5 = [v4 crlaxLabel];

  if (v5 && [v5 length]) {
    [v3 addObject:v5];
  }
  v6 = [(CRLImageFillAccessibility *)self crlaxFillTechniqueDescription];
  v7 = v6;
  if (v6 && [v6 length]) {
    [v3 addObject:v7];
  }
  char v8 = [(CRLImageFillAccessibility *)self crlaxTintColor];
  v9 = [v8 crlaxStyleInfoDescription];

  if (v9 && [v9 length]) {
    [v3 addObject:v9];
  }
  v17 = __CRLAccessibilityStringForArraysAndVariables(v3, v10, v11, v12, v13, v14, v15, v16, @"__CRLAccessibilityStringForArraysAndVariablesSentinel");

  return (NSString *)v17;
}

@end