@interface CRLPathSourceAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
+ (id)pathSourceForShapeType:(int64_t)a3 naturalSize:(CGSize)a4;
- (BOOL)crlaxIsCircular;
- (BOOL)crlaxIsRectangular;
- (CGSize)crlaxNaturalSize;
- (NSString)_crlaxStoredLabel;
- (NSString)crlaxHint;
- (NSString)crlaxLabel;
- (id)_crlaxInferredLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_crlaxSetStoredLabel:(id)a3;
- (void)_crlaxUpdatePathSourceLabelForType:(int64_t)a3;
@end

@implementation CRLPathSourceAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLPathSource";
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

- (NSString)_crlaxStoredLabel
{
  return (NSString *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9350);
}

- (void)_crlaxSetStoredLabel:(id)a3
{
}

+ (id)pathSourceForShapeType:(int64_t)a3 naturalSize:(CGSize)a4
{
  char v11 = 0;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CRLPathSourceAccessibility;
  v5 = [super pathSourceForShapeType:a4.width naturalSize:a4.height];
  v6 = objc_opt_class();
  uint64_t v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v5, 1, &v11);
  if (v11) {
    abort();
  }
  v8 = (void *)v7;

  [v8 _crlaxUpdatePathSourceLabelForType:a3];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRLPathSourceAccessibility;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10023075C;
  v6[3] = &unk_1014CBE78;
  id v4 = [(CRLPathSourceAccessibility *)&v9 copyWithZone:a3];
  id v7 = v4;
  v8 = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }

  return v4;
}

- (NSString)crlaxLabel
{
  id v3 = [(CRLPathSourceAccessibility *)self _crlaxStoredLabel];
  if (!v3)
  {
    id v4 = [(CRLPathSourceAccessibility *)self crlaxTarget];
    id v3 = [v4 inferredAccessibilityDescription];

    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      if (!v3)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"_crlaxInferredLabel did not return an inferred label for object: %@", v6, v7, v8, v9, v10, (uint64_t)self))abort(); {
        id v3 = 0;
        }
      }
    }
  }

  return (NSString *)v3;
}

- (NSString)crlaxHint
{
  return 0;
}

- (BOOL)crlaxIsCircular
{
  v2 = [(CRLPathSourceAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isCircular];

  return v3;
}

- (BOOL)crlaxIsRectangular
{
  v2 = [(CRLPathSourceAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isRectangular];

  return v3;
}

- (CGSize)crlaxNaturalSize
{
  v2 = [(CRLPathSourceAccessibility *)self crlaxTarget];
  [v2 naturalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_crlaxInferredLabel
{
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    double v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    int v10 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Class should override _crlaxInferredLabel: %@", v5, v6, v7, v8, v9, (uint64_t)v4);

    if (v10) {
      abort();
    }
  }
  return 0;
}

- (void)_crlaxUpdatePathSourceLabelForType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
    case 20:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Line";
      goto LABEL_22;
    case 2:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Curved connection line";
      goto LABEL_22;
    case 3:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Square";
      goto LABEL_22;
    case 4:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Rounded rectangle";
      goto LABEL_22;
    case 5:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Circle";
      goto LABEL_22;
    case 6:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Triangle";
      goto LABEL_22;
    case 7:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Right triangle";
      goto LABEL_22;
    case 8:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Arrow";
      goto LABEL_22;
    case 9:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Double arrow";
      goto LABEL_22;
    case 10:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Diamond";
      goto LABEL_22;
    case 11:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Quote bubble";
      goto LABEL_22;
    case 12:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Callout";
      goto LABEL_22;
    case 13:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Pentagon";
      goto LABEL_22;
    case 14:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Star";
      goto LABEL_22;
    case 15:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Line with two arrowheads";
      goto LABEL_22;
    case 16:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Line with arrowhead";
      goto LABEL_22;
    case 17:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Draw with pen";
      goto LABEL_22;
    case 18:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Right angle connection line";
      goto LABEL_22;
    case 19:
      double v4 = +[NSBundle mainBundle];
      uint64_t v5 = v4;
      CFStringRef v6 = @"Straight connection line";
LABEL_22:
      id v7 = [v4 localizedStringForKey:v6 value:0 table:0];

      [(CRLPathSourceAccessibility *)self _crlaxSetStoredLabel:v7];
      break;
    default:
      id v7 = 0;
      [(CRLPathSourceAccessibility *)self _crlaxSetStoredLabel:0];
      break;
  }
}

@end