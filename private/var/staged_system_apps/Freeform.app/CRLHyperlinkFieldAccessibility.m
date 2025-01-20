@interface CRLHyperlinkFieldAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_axShouldTreatAsCustomItemForTextElement;
- (CGRect)accessibilityFrame;
- (NSString)crlaxLinkTitle;
- (NSURL)crlaxLinkURL;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CRLHyperlinkFieldAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPHyperlinkField";
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

- (NSString)crlaxLinkTitle
{
  v2 = [(CRLHyperlinkFieldAccessibility *)self crlaxTarget];
  id v3 = [v2 displayText];

  return (NSString *)v3;
}

- (NSURL)crlaxLinkURL
{
  v2 = [(CRLHyperlinkFieldAccessibility *)self crlaxTarget];
  id v3 = [v2 url];

  return (NSURL *)v3;
}

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1004A0E58;
  v18 = sub_1004A0E68;
  id v19 = 0;
  id v3 = [(CRLWPSmartFieldAccessibility *)self crlaxParentTextRep];
  id v5 = [(CRLWPSmartFieldAccessibility *)self crlaxFieldRange];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    if (v4)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1004A0E70;
      v9[3] = &unk_1014D3490;
      v11 = &v14;
      id v10 = v3;
      id v12 = v5;
      uint64_t v13 = v6;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v9)) {
        abort();
      }
    }
  }
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)accessibilityValue
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CRLHyperlinkFieldAccessibility;
  return UIAccessibilityTraitLink | [(CRLHyperlinkFieldAccessibility *)&v3 accessibilityTraits];
}

- (CGRect)accessibilityFrame
{
  LOBYTE(v41) = 0;
  objc_super v3 = [(CRLWPSmartFieldAccessibility *)self crlaxParentTextRep];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v41);
  if ((_BYTE)v41) {
    goto LABEL_8;
  }
  uint64_t v6 = (void *)v5;

  id v7 = [v6 crlaxInteractiveCanvasController];
  LOBYTE(v41) = 0;
  v8 = [v7 crlaxCanvasView];
  v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v41);
  if ((_BYTE)v41) {
LABEL_8:
  }
    abort();
  v11 = (void *)v10;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;

  id v16 = [(CRLHyperlinkFieldAccessibility *)self crlaxRangeValueForKey:@"range"];
  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = v17;
    if (v17)
    {
      id v19 = v16;
      uint64_t v41 = 0;
      v42 = (double *)&v41;
      uint64_t v43 = 0x4010000000;
      v44 = "";
      long long v45 = 0u;
      long long v46 = 0u;
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_1004A1144;
      v36 = &unk_1014D3490;
      v38 = &v41;
      id v20 = v6;
      id v37 = v20;
      id v39 = v19;
      uint64_t v40 = v18;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)&v33)) {
        abort();
      }

      double v21 = v42[4];
      double v22 = v42[5];
      double v23 = v42[6];
      double v24 = v42[7];
      _Block_object_dispose(&v41, 8);
      [v20 crlaxConvertNaturalRectToUnscaledCanvas:v21, v22, v23, v24, v33, v34, v35, v36];
      [v7 crlaxConvertUnscaledToBoundsRect:];
      [v11 crlaxFrameFromBounds:];
      CGFloat x = v25;
      CGFloat y = v26;
      CGFloat width = v27;
      CGFloat height = v28;
    }
  }

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

@end