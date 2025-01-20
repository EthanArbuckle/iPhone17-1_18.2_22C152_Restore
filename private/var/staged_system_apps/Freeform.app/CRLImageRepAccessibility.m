@interface CRLImageRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_crlaxAllowedToEditMask;
- (BOOL)accessibilityActivate;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)supportsAlternatePressureDrag;
- (CRLImageItemAccessibility)_crlaxImageInfo;
- (CRLImageLayoutAccessibility)crlaxImageLayout;
- (CRLImageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4;
- (NSString)crlaxLabel;
- (id)accessibilityHint;
- (id)crlaxKnobLabel;
- (void)editMaskWithHUD:(BOOL)a3;
@end

@implementation CRLImageRepAccessibility

- (CRLImageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRLImageRepAccessibility;
  v4 = [(CRLImageRepAccessibility *)&v8 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    unint64_t v6 = [(CRLCanvasRepAccessibility *)v4 accessibilityTraits];
    [(CRLImageRepAccessibility *)v5 setAccessibilityTraits:UIAccessibilityTraitImage | v6];
  }
  return v5;
}

- (void)editMaskWithHUD:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLImageRepAccessibility;
  -[CRLImageRepAccessibility editMaskWithHUD:](&v6, "editMaskWithHUD:");
  if (v3)
  {
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Image mask slider visible below image" value:0 table:0];
    CRLAccessibilityPostHighPriorityAnnouncementNotification(0, v5);
  }
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLImageRepAccessibility;
  return -[CRLImageRepAccessibility handleDoubleTapAtPoint:inputType:](&v9, "handleDoubleTapAtPoint:inputType:", a4, x, y);
}

- (BOOL)supportsAlternatePressureDrag
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLImageRepAccessibility;
  return [(CRLImageRepAccessibility *)&v4 supportsAlternatePressureDrag];
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  BOOL v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  if (([v3 crlaxDocumentIsSharedReadOnly] & 1) != 0
    || ![(CRLCanvasRepAccessibility *)self crlaxIsSelected])
  {
  }
  else
  {
    unsigned int v4 = [(CRLImageRepAccessibility *)self _crlaxAllowedToEditMask];

    if (v4)
    {
      v5 = [(CRLImageRepAccessibility *)self crlaxImageLayout];
      unsigned int v6 = [v5 crlaxIsInMaskEditMode];

      v7 = +[NSBundle mainBundle];
      objc_super v8 = v7;
      if (v6) {
        CFStringRef v9 = @"Image mask slider visible below image";
      }
      else {
        CFStringRef v9 = @"Double tap to view image";
      }
      v10 = [v7 localizedStringForKey:v9 value:0 table:0];

      goto LABEL_8;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLImageRepAccessibility;
  v10 = [(CRLCanvasRepAccessibility *)&v12 accessibilityHint];
LABEL_8:

  return v10;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsSelected])
  {
    [(CRLCanvasRepAccessibility *)self accessibilityActivationPoint];
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRepAccessibility;
    BOOL v3 = 1;
    -[CRLImageRepAccessibility handleDoubleTapAtPoint:inputType:](&v6, "handleDoubleTapAtPoint:inputType:", 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLImageRepAccessibility;
    return [(CRLCanvasRepAccessibility *)&v5 accessibilityActivate];
  }
  return v3;
}

- (BOOL)_crlaxAllowedToEditMask
{
  v2 = [(CRLImageRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 i_allowedToEditMask];

  return v3;
}

+ (id)crlaxTargetClassName
{
  return @"CRLImageRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_opt_class();
  objc_super v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (CRLImageLayoutAccessibility)crlaxImageLayout
{
  char v8 = 0;
  v2 = [(CRLImageRepAccessibility *)self crlaxTarget];
  id v3 = [v2 imageLayout];

  unsigned int v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  objc_super v6 = (void *)v5;

  return (CRLImageLayoutAccessibility *)v6;
}

- (NSString)crlaxLabel
{
  v2 = [(CRLImageRepAccessibility *)self crlaxTarget];
  id v3 = [v2 imageInfo];

  unsigned int v4 = [v3 localizedName];
  uint64_t v5 = [v3 accessibilityDescription];
  if (![v5 length])
  {
    objc_super v12 = [v3 imageAssetPayload];
    uint64_t v13 = [v12 filename];

    uint64_t v5 = (void *)v13;
  }
  v14 = __CRLAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  return (NSString *)v14;
}

- (id)crlaxKnobLabel
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Image" value:0 table:0];

  return v3;
}

- (CRLImageItemAccessibility)_crlaxImageInfo
{
  char v8 = 0;
  v2 = [(CRLImageRepAccessibility *)self crlaxTarget];
  id v3 = [v2 imageInfo];

  unsigned int v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLImageItemAccessibility *)v6;
}

@end