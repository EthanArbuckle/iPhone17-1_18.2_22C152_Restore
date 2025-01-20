@interface CRLBezierPathAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxHasZeroArcs;
- (BOOL)_crlaxIsCircular;
- (BOOL)_crlaxIsDiamond;
- (BOOL)_crlaxIsLineSegment;
- (BOOL)_crlaxIsRectangular;
- (BOOL)_crlaxIsTriangular;
- (BOOL)_crlaxLastElementIsClose;
- (BOOL)_crlaxLastElementIsMove;
- (id)crlaxInferredLabelForSize:(CGSize)a3;
- (int64_t)_crlaxElementAtIndex:(int64_t)a3;
- (int64_t)_crlaxElementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4;
- (unint64_t)_crlaxElementCount;
- (unint64_t)_crlaxNumberOfArcs;
- (unint64_t)_crlaxNumberOfConsecutiveLineSegments;
- (unint64_t)_crlaxNumberOfLineSegments;
- (unint64_t)_crlaxNumberOfLineSegmentsConsecutive:(BOOL)a3;
- (unint64_t)_crlaxNumberOfSides;
@end

@implementation CRLBezierPathAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLBezierPath";
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

- (id)crlaxInferredLabelForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CRLBezierPathAccessibility *)self _crlaxIsLineSegment])
  {
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"Line";
LABEL_16:
    v9 = [v6 localizedStringForKey:v8 value:0 table:0];
LABEL_17:

    goto LABEL_18;
  }
  if ([(CRLBezierPathAccessibility *)self _crlaxIsRectangular])
  {
    v7 = +[NSBundle mainBundle];
    if (height == width || vabdd_f64(height, width) < 0.00999999978) {
      CFStringRef v8 = @"Square";
    }
    else {
      CFStringRef v8 = @"Rectangle";
    }
LABEL_15:
    v6 = v7;
    goto LABEL_16;
  }
  if ([(CRLBezierPathAccessibility *)self _crlaxIsCircular])
  {
    v7 = +[NSBundle mainBundle];
    if (height == width || vabdd_f64(height, width) < 0.00999999978) {
      CFStringRef v8 = @"Circle";
    }
    else {
      CFStringRef v8 = @"Oval";
    }
    goto LABEL_15;
  }
  if ([(CRLBezierPathAccessibility *)self _crlaxIsTriangular])
  {
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"Triangle";
    goto LABEL_16;
  }
  if ([(CRLBezierPathAccessibility *)self _crlaxIsDiamond])
  {
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"Diamond";
    goto LABEL_16;
  }
  unint64_t v13 = [(CRLBezierPathAccessibility *)self _crlaxNumberOfSides];
  if (v13)
  {
    uint64_t v14 = v13;
    v7 = +[NSBundle mainBundle];
    v15 = [v7 localizedStringForKey:@"%@-sided shape" value:0 table:0];
    v16 = CRLAccessibilityLocalizedUnsignedInteger(v14);
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);

LABEL_30:
    goto LABEL_17;
  }
  uint64_t v17 = [(CRLBezierPathAccessibility *)self _crlaxNumberOfLineSegments];
  unsigned int v18 = [(CRLBezierPathAccessibility *)self _crlaxHasZeroArcs];
  if (v18 && v17)
  {
    v7 = +[NSBundle mainBundle];
    v15 = [v7 localizedStringForKey:@"%@ line segments, non-closed", 0, 0 value table];
    v19 = CRLAccessibilityLocalizedUnsignedInteger(v17);
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v19);

    goto LABEL_30;
  }
  v9 = 0;
  if ((v18 & 1) == 0 && v17)
  {
    uint64_t v20 = [(CRLBezierPathAccessibility *)self _crlaxNumberOfArcs];
    v7 = +[NSBundle mainBundle];
    v21 = [v7 localizedStringForKey:@"%1$@ line segments, %2$@ arcs", 0, 0 value table];
    v22 = CRLAccessibilityLocalizedUnsignedInteger(v17);
    v23 = CRLAccessibilityLocalizedUnsignedInteger(v20);
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v22, v23);

    goto LABEL_17;
  }
LABEL_18:
  if (![v9 length])
  {
    v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"Shape" value:0 table:0];

    v9 = (void *)v11;
  }

  return v9;
}

- (BOOL)_crlaxIsRectangular
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isRectangular];

  return v3;
}

- (BOOL)_crlaxIsTriangular
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isTriangular];

  return v3;
}

- (BOOL)_crlaxIsCircular
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isCircular];

  return v3;
}

- (BOOL)_crlaxIsDiamond
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isDiamond];

  return v3;
}

- (BOOL)_crlaxIsLineSegment
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isLineSegment];

  return v3;
}

- (unint64_t)_crlaxElementCount
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  id v3 = [v2 elementCount];

  return (unint64_t)v3;
}

- (BOOL)_crlaxHasZeroArcs
{
  v2 = [(CRLBezierPathAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isFlat];

  return v3;
}

- (unint64_t)_crlaxNumberOfSides
{
  unint64_t v3 = [(CRLBezierPathAccessibility *)self _crlaxElementCount];
  if (![(CRLBezierPathAccessibility *)self _crlaxHasZeroArcs]) {
    return 0;
  }
  unint64_t v4 = [(CRLBezierPathAccessibility *)self _crlaxNumberOfConsecutiveLineSegments];
  unint64_t v5 = v4 + [(CRLBezierPathAccessibility *)self _crlaxLastElementIsClose];
  unsigned int v6 = [(CRLBezierPathAccessibility *)self _crlaxLastElementIsMove];
  uint64_t v7 = -2;
  double v13 = 0.0;
  double v14 = 0.0;
  if (!v6) {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 + v3;
  double v12 = 0.0;
  -[CRLBezierPathAccessibility _crlaxElementAtIndex:associatedPoints:](self, "_crlaxElementAtIndex:associatedPoints:", 0, &v13, 0);
  [(CRLBezierPathAccessibility *)self _crlaxElementAtIndex:v8 associatedPoints:&v11];
  if (v14 == v12 && v13 == v11) {
    return v5;
  }
  else {
    return 0;
  }
}

- (unint64_t)_crlaxNumberOfConsecutiveLineSegments
{
  return [(CRLBezierPathAccessibility *)self _crlaxNumberOfLineSegmentsConsecutive:1];
}

- (unint64_t)_crlaxNumberOfLineSegments
{
  return [(CRLBezierPathAccessibility *)self _crlaxNumberOfLineSegmentsConsecutive:0];
}

- (unint64_t)_crlaxNumberOfLineSegmentsConsecutive:(BOOL)a3
{
  unint64_t v5 = [(CRLBezierPathAccessibility *)self _crlaxElementCount];
  if (v5 < 2) {
    return 0;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0;
  for (uint64_t i = 1; i != v6; ++i)
  {
    if ((id)[(CRLBezierPathAccessibility *)self _crlaxElementAtIndex:i] == (id)1
      || ![(CRLBezierPathAccessibility *)self _crlaxElementAtIndex:i])
    {
      ++v7;
    }
    else if (a3)
    {
      return v7;
    }
  }
  return v7;
}

- (unint64_t)_crlaxNumberOfArcs
{
  if ([(CRLBezierPathAccessibility *)self _crlaxElementCount] < 2) {
    return 0;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 1;
  do
  {
    if ((id)[(CRLBezierPathAccessibility *)self _crlaxElementAtIndex:v4] == (id)2) {
      ++v3;
    }
    ++v4;
  }
  while (v4 < [(CRLBezierPathAccessibility *)self _crlaxElementCount]);
  return v3;
}

- (BOOL)_crlaxLastElementIsMove
{
  return [(CRLBezierPathAccessibility *)self _crlaxElementAtIndex:(char *)[(CRLBezierPathAccessibility *)self _crlaxElementCount] - 1] == 0;
}

- (BOOL)_crlaxLastElementIsClose
{
  return (id)[(CRLBezierPathAccessibility *)self _crlaxElementAtIndex:(char *)[(CRLBezierPathAccessibility *)self _crlaxElementCount] - 1] == (id)3;
}

- (int64_t)_crlaxElementAtIndex:(int64_t)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10042EBDC;
  v5[3] = &unk_1014CC6B8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_crlaxElementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10042ECE0;
  v6[3] = &unk_1014D3490;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  v6[7] = a4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end