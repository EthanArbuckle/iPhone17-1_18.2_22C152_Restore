@interface CRLFreehandDrawingRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_crlaxContainsMath;
- (BOOL)crlaxUsesAccessibilityPath;
- (CGRect)accessibilityFrame;
- (_TtC8Freeform22CRLFreehandDrawingItem)_crlaxFreehandDrawingInfo;
- (id)_accessibilitySpeakThisString;
- (id)_containedHandwrittenText;
- (id)_containedMathematicalText;
- (id)_crlaxFreehandDrawingSummary;
- (id)crlaxLabel;
@end

@implementation CRLFreehandDrawingRepAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLFreehandDrawingRep";
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

- (id)crlaxLabel
{
  id v3 = [(CRLCanvasRepAccessibility *)self crlaxTitleLabel];
  v4 = [(CRLFreehandDrawingRepAccessibility *)self _crlaxFreehandDrawingInfo];
  v5 = [v4 accessibilityDescription];

  if ([(CRLFreehandDrawingRepAccessibility *)self _crlaxContainsMath])
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Handwritten math" value:0 table:0];

    id v8 = [(CRLFreehandDrawingRepAccessibility *)self _containedMathematicalText];
    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
    v9 = [(CRLFreehandDrawingRepAccessibility *)self _containedHandwrittenText];
    if ([v9 length])
    {
      id v8 = v9;
      v10 = +[NSBundle mainBundle];
      v7 = [v10 localizedStringForKey:@"Handwritten text" value:0 table:0];
    }
    else
    {
      id v8 = 0;
      v7 = 0;
    }

    if (v7) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = [(CRLFreehandDrawingRepAccessibility *)self _crlaxFreehandDrawingSummary];

  v12 = +[NSBundle mainBundle];
  v7 = [v12 localizedStringForKey:@"Freehand drawing" value:0 table:0];

  id v8 = (id)v11;
LABEL_9:
  v21 = [(CRLCanvasRepAccessibility *)self crlaxCaptionLabel];
  v19 = __CRLAccessibilityStringForVariables(1, v3, v13, v14, v15, v16, v17, v18, (uint64_t)v8);

  return v19;
}

- (BOOL)crlaxUsesAccessibilityPath
{
  unsigned __int8 v3 = [(CRLFreehandDrawingRepAccessibility *)self _crlaxContainsMath];
  v4 = [(CRLFreehandDrawingRepAccessibility *)self _containedHandwrittenText];
  BOOL v5 = [v4 length] == 0;

  return v5 & ~v3;
}

- (CGRect)accessibilityFrame
{
  v20.receiver = self;
  v20.super_class = (Class)CRLFreehandDrawingRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v20 accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(CRLFreehandDrawingRepAccessibility *)self _crlaxContainsMath])
  {
    uint64_t v11 = [(CRLFreehandDrawingRepAccessibility *)self crlaxTarget];
    [v11 crlaxAttachedMathResultViewFrame];
    v24.origin.CGFloat x = v12;
    v24.origin.CGFloat y = v13;
    v24.size.CGFloat width = v14;
    v24.size.CGFloat height = v15;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectUnion(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  if ([(CRLFreehandDrawingRepAccessibility *)self _crlaxContainsMath]) {
    return 1;
  }
  v4 = [(CRLFreehandDrawingRepAccessibility *)self _containedHandwrittenText];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (id)_accessibilitySpeakThisString
{
  if ([(CRLFreehandDrawingRepAccessibility *)self _crlaxContainsMath])
  {
    id v3 = [(CRLFreehandDrawingRepAccessibility *)self _containedMathematicalText];
  }
  else
  {
    v4 = [(CRLFreehandDrawingRepAccessibility *)self _containedHandwrittenText];
    if ([v4 length]) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }

  return v3;
}

- (_TtC8Freeform22CRLFreehandDrawingItem)_crlaxFreehandDrawingInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLFreehandDrawingRepAccessibility *)self crlaxTarget];
  double v5 = [v4 info];
  v6 = sub_1002469D0(v3, v5);

  return (_TtC8Freeform22CRLFreehandDrawingItem *)v6;
}

- (BOOL)_crlaxContainsMath
{
  BOOL v3 = +[CRLFeatureFlagGroup isMathPaperEnabled];
  if (v3)
  {
    v4 = [(CRLFreehandDrawingRepAccessibility *)self crlaxTarget];
    unsigned __int8 v5 = [v4 crlaxHasAttachedMathResultView];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_containedMathematicalText
{
  v2 = [(CRLFreehandDrawingRepAccessibility *)self crlaxTarget];
  BOOL v3 = [v2 crlaxRecognizedMathDescription];

  return v3;
}

- (id)_containedHandwrittenText
{
  return &stru_101538650;
}

- (id)_crlaxFreehandDrawingSummary
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(CRLFreehandDrawingRepAccessibility *)self crlaxTarget];
  unsigned __int8 v5 = [v4 allRepsContainedInGroup];

  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v21 = 0;
        id v11 = v10;
        CGFloat v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v11, 1, &v21);
        if (v21) {
          goto LABEL_15;
        }
        CGFloat v14 = (void *)v13;

        char v21 = 0;
        CGFloat v15 = [v14 shapeInfo];
        double v16 = (objc_class *)objc_opt_class();
        uint64_t v17 = __CRLAccessibilityCastAsClass(v16, (uint64_t)v15, 1, &v21);
        if (v21) {
LABEL_15:
        }
          abort();
        double v18 = (void *)v17;

        if (v18) {
          [v3 addObject:v18];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  double v19 = +[CRLFreehandDrawingShapeItem crlaxDescriptionFor:v3];

  return v19;
}

@end