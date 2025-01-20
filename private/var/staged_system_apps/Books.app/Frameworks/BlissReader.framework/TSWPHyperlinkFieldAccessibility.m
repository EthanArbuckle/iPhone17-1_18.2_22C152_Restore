@interface TSWPHyperlinkFieldAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_axShouldTreatAsCustomItemForTextElement;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSString)tsaxLinkTitle;
- (NSURL)tsaxLinkURL;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TSWPHyperlinkFieldAccessibility

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_268280;
  v13 = sub_268290;
  uint64_t v14 = 0;
  v3 = [(TSWPSmartFieldAccessibility *)self tsaxParentTextRep];
  id v4 = [(TSWPSmartFieldAccessibility *)self tsaxFieldRange];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_26829C;
      v8[3] = &unk_46B940;
      v8[4] = v3;
      v8[5] = &v9;
      v8[6] = v4;
      v8[7] = v5;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
        abort();
      }
    }
  }
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkFieldAccessibility;
  return UIAccessibilityTraitLink | [(TSWPHyperlinkFieldAccessibility *)&v3 accessibilityTraits];
}

- (CGRect)accessibilityFrame
{
  LOBYTE(v29) = 0;
  objc_super v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPSmartFieldAccessibility *)self tsaxParentTextRep], 1, &v29);
  if ((_BYTE)v29
    || (Class v5 = v4,
        id v6 = [(objc_class *)v4 tsaxInteractiveCanvasController],
        LOBYTE(v29) = 0,
        v7 = (objc_class *)objc_opt_class(),
        uint64_t v8 = __TSAccessibilityCastAsClass(v7, (uint64_t)[v6 tsaxCanvasView], 1, &v29),
        (_BYTE)v29))
  {
    abort();
  }
  uint64_t v9 = (void *)v8;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  id v14 = [(TSWPHyperlinkFieldAccessibility *)self tsaxRangeValueForKey:@"range"];
  if (v14 != (id)0x7FFFFFFFFFFFFFFFLL && v15)
  {
    uint64_t v29 = 0;
    v30 = (double *)&v29;
    uint64_t v31 = 0x4010000000;
    v32 = &unk_41622E;
    long long v33 = 0u;
    long long v34 = 0u;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_268520;
    v28[3] = &unk_46B940;
    v28[4] = v5;
    v28[5] = &v29;
    v28[6] = v14;
    v28[7] = v15;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v28)) {
      abort();
    }
    double v16 = v30[4];
    double v17 = v30[5];
    double v18 = v30[6];
    double v19 = v30[7];
    _Block_object_dispose(&v29, 8);
    -[objc_class tsaxConvertNaturalRectToUnscaledCanvas:](v5, "tsaxConvertNaturalRectToUnscaledCanvas:", v16, v17, v18, v19);
    [v6 tsaxConvertUnscaledToBoundsRect:];
    [v9 tsaxFrameFromBounds:];
    CGFloat x = v20;
    CGFloat y = v21;
    CGFloat width = v22;
    CGFloat height = v23;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

+ (id)tsaxTargetClassName
{
  return @"TSWPHyperlinkField";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLinkTitle
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  CGRect result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSWPHyperlinkFieldAccessibility *)self tsaxValueForKey:@"displayText"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSURL)tsaxLinkURL
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  CGRect result = (NSURL *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSWPHyperlinkFieldAccessibility *)self tsaxValueForKey:@"url"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end