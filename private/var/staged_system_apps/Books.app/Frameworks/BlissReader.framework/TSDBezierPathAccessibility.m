@interface TSDBezierPathAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxHasZeroArcs;
- (BOOL)_tsaxIsCircular;
- (BOOL)_tsaxIsDiamond;
- (BOOL)_tsaxIsLineSegment;
- (BOOL)_tsaxIsRectangular;
- (BOOL)_tsaxIsTriangular;
- (BOOL)_tsaxLastElementIsClose;
- (BOOL)_tsaxLastElementIsMove;
- (id)tsaxInferredLabelForSize:(CGSize)a3;
- (unint64_t)_tsaxElementAtIndex:(int64_t)a3;
- (unint64_t)_tsaxElementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4;
- (unint64_t)_tsaxElementCount;
- (unint64_t)_tsaxNumberOfArcs;
- (unint64_t)_tsaxNumberOfConsecutiveLineSegments;
- (unint64_t)_tsaxNumberOfLineSegments;
- (unint64_t)_tsaxNumberOfLineSegmentsConsecutive:(BOOL)a3;
- (unint64_t)_tsaxNumberOfSides;
@end

@implementation TSDBezierPathAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDBezierPath";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxInferredLabelForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(TSDBezierPathAccessibility *)self _tsaxIsLineSegment])
  {
    v6 = @"Line";
    goto LABEL_15;
  }
  if ([(TSDBezierPathAccessibility *)self _tsaxIsRectangular])
  {
    if (height == width) {
      CFStringRef v7 = @"Square";
    }
    else {
      CFStringRef v7 = @"Rectangle";
    }
    goto LABEL_13;
  }
  if ([(TSDBezierPathAccessibility *)self _tsaxIsCircular])
  {
    CFStringRef v7 = @"Circle";
LABEL_13:
    v8 = TSAccessibilityLocalizedString((uint64_t)v7);
LABEL_14:
    v6 = (__CFString *)v8;
    goto LABEL_15;
  }
  if ([(TSDBezierPathAccessibility *)self _tsaxIsTriangular])
  {
    CFStringRef v7 = @"Triangle";
    goto LABEL_13;
  }
  if ([(TSDBezierPathAccessibility *)self _tsaxIsDiamond])
  {
    CFStringRef v7 = @"Diamond";
    goto LABEL_13;
  }
  unint64_t v10 = [(TSDBezierPathAccessibility *)self _tsaxNumberOfSides];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = TSAccessibilityLocalizedString(@"shape.with.number.of.sides %@");
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, TSAccessibilityLocalizedUnsignedInteger(v11), v19);
    goto LABEL_14;
  }
  uint64_t v13 = [(TSDBezierPathAccessibility *)self _tsaxNumberOfLineSegments];
  unsigned int v14 = [(TSDBezierPathAccessibility *)self _tsaxHasZeroArcs];
  if (v14 && v13)
  {
    v15 = TSAccessibilityLocalizedString(@"shape.with.number.of.line.segments %@");
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, TSAccessibilityLocalizedUnsignedInteger(v13), v19);
    goto LABEL_14;
  }
  v6 = 0;
  if ((v14 & 1) == 0 && v13)
  {
    uint64_t v16 = [(TSDBezierPathAccessibility *)self _tsaxNumberOfArcs];
    v17 = TSAccessibilityLocalizedString(@"shape.with.number.of.line.segments.and.arcs %@ %@");
    id v18 = TSAccessibilityLocalizedUnsignedInteger(v13);
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18, TSAccessibilityLocalizedUnsignedInteger(v16));
    goto LABEL_14;
  }
LABEL_15:
  if ([(__CFString *)v6 length]) {
    return v6;
  }

  return TSAccessibilityLocalizedString(@"shape");
}

- (BOOL)_tsaxIsRectangular
{
  return [(TSDBezierPathAccessibility *)self tsaxBoolValueForKey:@"isRectangular"];
}

- (BOOL)_tsaxIsTriangular
{
  return [(TSDBezierPathAccessibility *)self tsaxBoolValueForKey:@"isTriangular"];
}

- (BOOL)_tsaxIsCircular
{
  return [(TSDBezierPathAccessibility *)self tsaxBoolValueForKey:@"isCircular"];
}

- (BOOL)_tsaxIsDiamond
{
  return [(TSDBezierPathAccessibility *)self tsaxBoolValueForKey:@"isDiamond"];
}

- (BOOL)_tsaxIsLineSegment
{
  return [(TSDBezierPathAccessibility *)self tsaxBoolValueForKey:@"isLineSegment"];
}

- (unint64_t)_tsaxElementCount
{
  return (unint64_t)[(TSDBezierPathAccessibility *)self tsaxUnsignedIntegerValueForKey:@"elementCount"];
}

- (BOOL)_tsaxHasZeroArcs
{
  return [(TSDBezierPathAccessibility *)self tsaxBoolValueForKey:@"isFlat"];
}

- (unint64_t)_tsaxNumberOfSides
{
  unint64_t v3 = [(TSDBezierPathAccessibility *)self _tsaxElementCount];
  if (![(TSDBezierPathAccessibility *)self _tsaxHasZeroArcs]) {
    return 0;
  }
  unint64_t v4 = [(TSDBezierPathAccessibility *)self _tsaxNumberOfConsecutiveLineSegments];
  unint64_t v5 = v4 + [(TSDBezierPathAccessibility *)self _tsaxLastElementIsClose];
  unsigned int v6 = [(TSDBezierPathAccessibility *)self _tsaxLastElementIsMove];
  uint64_t v7 = -2;
  double v13 = 0.0;
  double v14 = 0.0;
  if (!v6) {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 + v3;
  double v12 = 0.0;
  -[TSDBezierPathAccessibility _tsaxElementAtIndex:associatedPoints:](self, "_tsaxElementAtIndex:associatedPoints:", 0, &v13, 0);
  [(TSDBezierPathAccessibility *)self _tsaxElementAtIndex:v8 associatedPoints:&v11];
  if (v14 == v12 && v13 == v11) {
    return v5;
  }
  else {
    return 0;
  }
}

- (unint64_t)_tsaxNumberOfConsecutiveLineSegments
{
  return [(TSDBezierPathAccessibility *)self _tsaxNumberOfLineSegmentsConsecutive:1];
}

- (unint64_t)_tsaxNumberOfLineSegments
{
  return [(TSDBezierPathAccessibility *)self _tsaxNumberOfLineSegmentsConsecutive:0];
}

- (unint64_t)_tsaxNumberOfLineSegmentsConsecutive:(BOOL)a3
{
  unint64_t v5 = [(TSDBezierPathAccessibility *)self _tsaxElementCount];
  if (v5 < 2) {
    return 0;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0;
  for (uint64_t i = 1; i != v6; ++i)
  {
    if ((char *)[(TSDBezierPathAccessibility *)self _tsaxElementAtIndex:i] == (char *)&dword_0 + 1)
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

- (unint64_t)_tsaxNumberOfArcs
{
  if ([(TSDBezierPathAccessibility *)self _tsaxElementCount] < 2) {
    return 0;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 1;
  do
  {
    if ((char *)[(TSDBezierPathAccessibility *)self _tsaxElementAtIndex:v4] == (char *)&dword_0 + 2) {
      ++v3;
    }
    ++v4;
  }
  while (v4 < [(TSDBezierPathAccessibility *)self _tsaxElementCount]);
  return v3;
}

- (BOOL)_tsaxLastElementIsMove
{
  return [(TSDBezierPathAccessibility *)self _tsaxElementAtIndex:(char *)[(TSDBezierPathAccessibility *)self _tsaxElementCount] - 1] == 0;
}

- (BOOL)_tsaxLastElementIsClose
{
  return (char *)[(TSDBezierPathAccessibility *)self _tsaxElementAtIndex:(char *)[(TSDBezierPathAccessibility *)self _tsaxElementCount] - 1] == (char *)&dword_0 + 3;
}

- (unint64_t)_tsaxElementAtIndex:(int64_t)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25CA58;
  v5[3] = &unk_458E98;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_tsaxElementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_25CB5C;
  v6[3] = &unk_46B940;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  v6[7] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end