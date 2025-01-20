@interface TSDBezierPath
+ (BOOL)supportsSecureCoding;
+ (CGRect)p_pathToBounds:(Path *)a3;
+ (Path)p_bezierToPath:(id)a3;
+ (TSDBezierPath)bezierPathWithCGPath:(CGPath *)a3;
+ (TSDBezierPath)bezierPathWithConvexHullOfPoints:(CGPoint *)a3 count:(unint64_t)a4;
+ (TSDBezierPath)bezierPathWithOvalInRect:(CGRect)a3;
+ (TSDBezierPath)bezierPathWithRect:(CGRect)a3;
+ (TSDBezierPath)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
+ (TSDBezierPath)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4;
+ (double)defaultFlatness;
+ (double)defaultLineWidth;
+ (double)defaultMiterLimit;
+ (id)appendBezierPaths:(id)a3;
+ (id)bezierPath;
+ (id)excludeBezierPaths:(id)a3;
+ (id)exteriorOfBezierPath:(id)a3;
+ (id)intersectBezierPaths:(id)a3;
+ (id)outlineBezierPath:(id)a3;
+ (id)outlineBezierPath:(id)a3 withThreshold:(double)a4;
+ (id)outsideEdgeOfBezierPath:(id)a3;
+ (id)p_BOOLeanWithBezierPaths:(id)a3 operation:(int)a4;
+ (id)p_pathToBezier:(Path *)a3;
+ (id)smoothBezierPath:(id)a3 withThreshold:(double)a4;
+ (id)subtractBezierPaths:(id)a3;
+ (id)tracedPathForImage:(CGImage *)a3 alphaThreshold:(double)a4 pointSpacing:(double)a5;
+ (id)tracedPathForInstantAlphaBinaryBitmap:(id)a3 pointSpacing:(double)a4;
+ (id)uniteBezierPaths:(id)a3;
+ (unint64_t)defaultLineCapStyle;
+ (unint64_t)defaultLineJoinStyle;
+ (unint64_t)defaultWindingRule;
+ (void)clipRect:(CGRect)a3;
+ (void)fillRect:(CGRect)a3;
+ (void)initialize;
+ (void)setDefaultFlatness:(double)a3;
+ (void)setDefaultLineCapStyle:(unint64_t)a3;
+ (void)setDefaultLineJoinStyle:(unint64_t)a3;
+ (void)setDefaultLineWidth:(double)a3;
+ (void)setDefaultMiterLimit:(double)a3;
+ (void)setDefaultWindingRule:(unint64_t)a3;
+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
+ (void)strokeRect:(CGRect)a3;
- (BOOL)containsClosePathElement;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)intersectsRect:(CGRect)a3 hasFill:(BOOL)a4;
- (BOOL)isCircular;
- (BOOL)isClockwise;
- (BOOL)isCompound;
- (BOOL)isDiamond;
- (BOOL)isEffectivelyClosed;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlat;
- (BOOL)isLineSegment;
- (BOOL)isOpen;
- (BOOL)isRectangular;
- (BOOL)isSelfIntersecting;
- (BOOL)isTriangular;
- (BOOL)pointOnPath:(CGPoint)a3 tolerance:(double)a4;
- (CGPath)CGPath;
- (CGPoint)currentPoint;
- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)gradientAt:(float)a3;
- (CGPoint)myGradientAt:(float)a3;
- (CGPoint)myGradientAt:(float)a3 fromElement:(int64_t)a4;
- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2];
- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2];
- (CGPoint)pointAlongPathAtPercentage:(double)a3;
- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)rawGradientAt:(float)a3 fromElement:(int64_t)a4;
- (CGPoint)roundPoint:(CGPoint)a3 inContext:(CGContext *)a4 strokeWidth:(int)a5;
- (CGPoint)transformedCoordinate:(CGPoint)a3 withPressure:(id)a4;
- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 withPressure:(id)a6 getElement:(int64_t *)a7 getPercentage:(float *)a8;
- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 inElement:(int64_t)a4 withPressure:(id)a5;
- (CGRect)_addMitersFromSegments:(id)a3 toRect:(CGRect)a4;
- (CGRect)bounds;
- (CGRect)boundsIncludingStroke;
- (CGRect)boundsIncludingStrokeWidth:(double)a3 joinStyle:(unint64_t)a4 capStyle:(unint64_t)a5 miterLimit:(double)a6 needsToExtendJoins:(BOOL)a7;
- (CGRect)boundsIncludingTSDStroke:(id)a3;
- (CGRect)controlPointBounds;
- (TSDBezierPath)init;
- (TSDBezierPath)initWithCString:(const char *)a3;
- (TSDBezierPath)initWithCoder:(id)a3;
- (const)cString;
- (double)calculateLengthOfElement:(int64_t)a3;
- (double)curvatureAt:(double)a3 fromElement:(int)a4;
- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6;
- (double)flatness;
- (double)length;
- (double)lengthOfElement:(int64_t)a3;
- (double)lengthToElement:(int64_t)a3;
- (double)lineWidth;
- (double)miterLimit;
- (double)yValueFromXValue:(double)a3;
- (double)yValueFromXValue:(double)a3 elementIndex:(int64_t *)a4 parametricValue:(double *)a5;
- (float)curvatureAt:(float)a3;
- (float)elementPercentageFromElement:(int)a3 forOverallPercentage:(float)a4;
- (id)_copyFlattenedPath;
- (id)aliasedPathInContext:(CGContext *)a3 effectiveStrokeWidth:(float)a4;
- (id)aliasedPathWithViewScale:(float)a3 effectiveStrokeWidth:(float)a4;
- (id)bezierPathByFittingCurve;
- (id)bezierPathByFittingCurve:(id)a3;
- (id)bezierPathByFlatteningPath;
- (id)bezierPathByFlatteningPathWithFlatness:(double)a3;
- (id)bezierPathByOffsettingPath:(double)a3 joinStyle:(unint64_t)a4 withThreshold:(double)a5;
- (id)bezierPathByRemovingRedundantElements;
- (id)bezierPathByReversingPath;
- (id)chisel;
- (id)copyFromSegment:(int)a3 t:(float)a4 toSegment:(int)a5 t:(float)a6;
- (id)copyWithPointsInRange:(_NSRange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)intersectBezierPath:(id)a3;
- (id)outlineStroke;
- (id)p_aliasedPathInContext:(CGContext *)a3 viewScale:(float)a4 effectiveStrokeWidth:(float)a5;
- (id)p_beziersFromSegmentIntersections:(id)a3;
- (id)p_copyWithPointsInRange:(_NSRange)a3 countingSubpaths:(unint64_t *)a4;
- (id)p_elementCountForSubpaths;
- (id)p_pathAsSegments;
- (id)pathBySplittingAtPointOnPath:(CGPoint)a3;
- (id)pathByWobblingByUpTo:(double)a3 subdivisions:(unint64_t)a4;
- (id)pathSplitAtSubpathBoundariesWithSoftElementLimit:(unint64_t)a3 hardElementLimit:(unint64_t)a4;
- (id)pressure;
- (id)subtractBezierPath:(id)a3;
- (id)uniteWithBezierPath:(id)a3;
- (int64_t)elementCount;
- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4 startingElementIndex:(int64_t)a5 lengthToStartingElement:(double)a6;
- (int64_t)elementPercentage:(float *)a3 forOverallPercentage:(float)a4;
- (unint64_t)elementAtIndex:(int64_t)a3;
- (unint64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4;
- (unint64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4;
- (unint64_t)lineCapStyle;
- (unint64_t)lineJoinStyle;
- (unint64_t)windingRule;
- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4;
- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6;
- (void)_appendToPath:(id)a3;
- (void)_deviceClosePath;
- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)_deviceLineToPoint:(CGPoint)a3;
- (void)_deviceMoveToPoint:(CGPoint)a3;
- (void)_doPath;
- (void)addClip;
- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4;
- (void)addIntersectionsWithPath:(id)a3 to:(id)a4;
- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6;
- (void)addPathToContext:(CGContext *)a3;
- (void)alignBoundsToOrigin;
- (void)appendBezierPath:(id)a3;
- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8;
- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5;
- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7;
- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(int)a6 startNewPath:(BOOL)a7;
- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(int)a6 startNewPath:(BOOL)a7;
- (void)appendBezierPathWithOvalInRect:(CGRect)a3;
- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4;
- (void)appendBezierPathWithRect:(CGRect)a3;
- (void)calculateLengths;
- (void)clearStroke:(CGContext *)a3;
- (void)copyPathAttributesTo:(id)a3;
- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fill;
- (void)flattenIntoPath:(id)a3 flatness:(double)a4;
- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5;
- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4;
- (void)lineToPoint:(CGPoint)a3;
- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4;
- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6;
- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5;
- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)relativeLineToPoint:(CGPoint)a3;
- (void)relativeMoveToPoint:(CGPoint)a3;
- (void)removeAllPoints;
- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4;
- (void)setFlatness:(double)a3;
- (void)setLineCapStyle:(unint64_t)a3;
- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5;
- (void)setLineJoinStyle:(unint64_t)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setWindingRule:(unint64_t)a3;
- (void)stroke;
- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7;
- (void)takeAttributesFromStroke:(id)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation TSDBezierPath

- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  [(TSDBezierPath *)self elementAtIndex:0 associatedPoints:a3];
  unint64_t v7 = [(TSDBezierPath *)self elementAtIndex:[(TSDBezierPath *)self elementCount] - 1 associatedPoints:v9];
  v8 = (CGPoint *)v9;
  if (v7 == 2) {
    v8 = (CGPoint *)v10;
  }
  if (v7 == 3) {
    v8 = a3;
  }
  *a4 = *v8;
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  unint64_t v30 = [a4 count];
  v33 = self;
  uint64_t v10 = [(TSDBezierPath *)self elementCount];
  uint64_t v11 = [a3 elementCount];
  if (v10 < 2) {
    return;
  }
  uint64_t v12 = v11;
  if (v11 < 2) {
    return;
  }
  if (v6) {
    uint64_t v13 = v10 - 1;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v6) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = v10;
  }
  uint64_t v32 = v14;
  if (v6) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = 1;
  }
  while (2)
  {
    uint64_t v16 = [(TSDBezierPath *)v33 elementAtIndex:v13 allPoints:v35];
    if (!v16) {
      goto LABEL_29;
    }
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = [a3 elementAtIndex:v18 allPoints:v34];
      if (!v19) {
        goto LABEL_26;
      }
      if (v17 != 2)
      {
        if (v19 != 2)
        {
          lineIntersectsLine(v35[0].f64, (double *)v34, v13, v18, a4);
          goto LABEL_26;
        }
        v25 = (float64x2_t *)v34;
        v26 = v35;
        uint64_t v27 = v18;
        uint64_t v28 = v13;
        int v29 = 1;
LABEL_24:
        curveIntersectLine(v25->f64, v26->f64, v27, v28, v29, a4);
        goto LABEL_26;
      }
      if (v19 != 2)
      {
        v25 = v35;
        v26 = (float64x2_t *)v34;
        uint64_t v27 = v13;
        uint64_t v28 = v18;
        int v29 = 0;
        goto LABEL_24;
      }
      uint64_t v20 = [a4 count];
      v37[0] = v35[0];
      v37[1] = v35[1];
      v37[2] = v35[2];
      v37[3] = v35[3];
      v36[0] = v34[0];
      v36[1] = v34[1];
      v36[2] = v34[2];
      v36[3] = v34[3];
      curveIntersectCurveR(v37, (double *)v36, v13, v18, 0, a4, 1.0, 0.0, 1.0, 0.0);
      uint64_t v21 = [a4 count];
      if (v20 < v21)
      {
        uint64_t v22 = v21;
        do
        {
          v23 = (void *)[a4 objectAtIndex:v20];
          [v23 t];
          objc_msgSend(v23, "setPoint:", TSDPointOnCurve(v35, v24));
          ++v20;
        }
        while (v22 != v20);
      }
LABEL_26:
      ++v18;
    }
    while (v18 != v12);
    if (a5 || v30 >= [a4 count])
    {
LABEL_29:
      v13 += v15;
      if (v13 == v32) {
        return;
      }
      continue;
    }
    break;
  }
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4
{
}

- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v11 = *MEMORY[0x263F00148];
  int64_t v7 = [(TSDBezierPath *)self elementCount];
  if (v7)
  {
    int64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v13, v11, v12))
      {
        case 0uLL:
          long long v11 = v13[0];
          long long v12 = v13[0];
          continue;
        case 1uLL:
          goto LABEL_7;
        case 2uLL:
          curveIntersectLine((double *)&v12, &a3->x, i, -1, 0, a4);
          long long v10 = v13[2];
          goto LABEL_8;
        case 3uLL:
          v13[0] = v11;
LABEL_7:
          lineIntersectsLine((double *)&v12, &a3->x, i, -1, a4);
          long long v10 = v13[0];
LABEL_8:
          long long v12 = v10;
          break;
        default:
          continue;
      }
    }
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a4 < a5)
  {
    int64_t v6 = a4;
    do
    {
      switch([a3 elementAtIndex:v6 associatedPoints:&v9])
      {
        case 0:
          -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
          break;
        case 1:
          -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
          break;
        case 2:
          -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
          break;
        case 3:
          [(TSDBezierPath *)self closePath];
          break;
        default:
          break;
      }
      ++v6;
    }
    while (a5 != v6);
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int64_t v15 = [a3 elementCount];
  int64_t v16 = v15;
  BOOL v18 = a4 < 1 || v15 <= a4;
  if (v18) {
    int64_t v19 = -1;
  }
  else {
    int64_t v19 = a4;
  }
  if (a6 <= 0) {
    a6 = v15 + 1;
  }
  if (v19 == a6)
  {
    if (a7 < a5 || v19 >= v15) {
      LOBYTE(v18) = 1;
    }
    if (!v18)
    {
      uint64_t v21 = [a3 elementAtIndex:v19 allPoints:&v34];
      if (v21 == 3)
      {
LABEL_22:
        if (!a8) {
          -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
        }
        goto LABEL_55;
      }
      if (v21 != 2)
      {
        if (v21 != 1) {
          return;
        }
        goto LABEL_22;
      }
      TSDCurveBetween(&v34, (uint64_t)&v26, a5, a7);
      if (!a8) {
        -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
      }
      goto LABEL_57;
    }
  }
  else
  {
    if (!v18)
    {
      switch([a3 elementAtIndex:a4 allPoints:&v34])
      {
        case 0:
          if (!a8) {
            [(TSDBezierPath *)self moveToPoint:*(_OWORD *)&v34];
          }
          break;
        case 1:
        case 3:
          if (!a8) {
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
          }
          -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v35, v36);
          break;
        case 2:
          TSDCurveBetween(&v34, (uint64_t)&v26, a5, 1.0);
          if (!a8) {
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
          }
          -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
          break;
        default:
          break;
      }
    }
    if (a6 >= v16) {
      int64_t v22 = v16;
    }
    else {
      int64_t v22 = a6;
    }
    int64_t v23 = v19 + 1;
    if (v23 < v22)
    {
      char v24 = 0;
      do
      {
        switch([a3 elementAtIndex:v23 associatedPoints:&v34])
        {
          case 0:
            [(TSDBezierPath *)self moveToPoint:*(_OWORD *)&v34];
            goto LABEL_47;
          case 1:
            [(TSDBezierPath *)self lineToPoint:*(_OWORD *)&v34];
            break;
          case 2:
            -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v37, v38, *(_OWORD *)&v34, v35, v36);
            break;
          case 3:
            if (v24)
            {
              [(TSDBezierPath *)self closePath];
LABEL_47:
              char v24 = 1;
            }
            else
            {
              [(TSDBezierPath *)self lineToPoint:*(_OWORD *)&v34];
              char v24 = 0;
            }
            break;
          default:
            break;
        }
        ++v23;
      }
      while (v22 != v23);
    }
    if (a6 >= 1 && a6 < v16)
    {
      uint64_t v25 = [a3 elementAtIndex:a6 allPoints:&v34];
      if (v25 == 3)
      {
LABEL_55:
        -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v35 * a7 + v34.f64[0] * (1.0 - a7), v36 * a7 + v34.f64[1] * (1.0 - a7));
        return;
      }
      if (v25 != 2)
      {
        if (v25 != 1) {
          return;
        }
        goto LABEL_55;
      }
      TSDCurveBetween(&v34, (uint64_t)&v26, 0.0, a7);
LABEL_57:
      -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
    }
  }
}

- (id)copyFromSegment:(int)a3 t:(float)a4 toSegment:(int)a5 t:(float)a6
{
  id v11 = objc_alloc_init((Class)objc_opt_class());
  [v11 appendBezierPath:self fromSegment:a3 t:a5 toSegment:0 t:a4 withoutMove:a6];
  objc_msgSend(v11, "setWindingRule:", -[TSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v11, "setLineCapStyle:", -[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v11, "setLineJoinStyle:", -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  [(TSDBezierPath *)self lineWidth];
  objc_msgSend(v11, "setLineWidth:");
  return v11;
}

- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2]
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v25 = *MEMORY[0x263F00148];
  int64_t v7 = [(TSDBezierPath *)self elementCount];
  if (v7)
  {
    int64_t v8 = v7;
    uint64_t v9 = 0;
    float v10 = 3.4028e38;
    while (1)
    {
      unint64_t v11 = [(TSDBezierPath *)self elementAtIndex:v9 associatedPoints:v27];
      if (v11 == 2) {
        break;
      }
      if (v11 == 3)
      {
        long long v12 = v25;
LABEL_9:
        v27[0] = v12;
        unint64_t v11 = 2;
      }
      double x = a3[1].x;
      CGFloat y = a3[1].y;
      CGFloat v16 = y - a3->y;
      double v17 = x - a3->x;
      float v18 = v17 * v17 + v16 * v16;
      double v19 = (float)(1.0 / sqrtf(v18));
      *(float *)&CGFloat y = *((double *)v27 + 1) * -(v17 * v19)
                   + v16 * v19 * *(double *)v27
                   - (y * -(v17 * v19)
                    + v16 * v19 * x);
      float v20 = fabsf(*(float *)&y);
      if (v10 > v20)
      {
        double v6 = *((double *)v27 + 1);
        double v5 = *(double *)v27;
        float v10 = v20;
      }
      float64x2_t v26 = (float64x2_t)v27[0];
      if (!v11) {
        long long v25 = v27[0];
      }
      if (v8 == ++v9) {
        goto LABEL_15;
      }
    }
    double v23 = 0.0;
    double v24 = 0.0;
    TSDNearestPointOnCurveToLine(&v26, &a3->x, (uint64_t)&v23);
    if (v13 < v10)
    {
      double v6 = v24;
      double v5 = v23;
      float v10 = v13;
    }
    long long v12 = v27[2];
    goto LABEL_9;
  }
LABEL_15:
  double v21 = v5;
  double v22 = v6;
  result.CGFloat y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2]
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  double x = a3[1].x;
  double y = a3[1].y;
  double v9 = a3->x;
  long long v33 = *MEMORY[0x263F00148];
  int64_t v10 = [(TSDBezierPath *)self elementCount];
  if (v10)
  {
    int64_t v11 = v10;
    double v12 = TSDSubtractPoints(x, y, v9);
    double v14 = TSDNormalizePoint(v12, v13);
    double v16 = v15;
    uint64_t v17 = 0;
    float v18 = -2.0;
    do
    {
      unint64_t v19 = [(TSDBezierPath *)self elementAtIndex:v17 associatedPoints:v35];
      uint64_t v20 = v19;
      if (v19 == 2)
      {
        double v31 = 0.0;
        double v32 = 0.0;
        nearestAngleOnCurveToLine(&v34, &a3->x, (uint64_t)&v31);
        float v22 = v21;
        if (v18 < v22)
        {
          float v18 = v22;
          double v6 = v32;
          double v5 = v31;
        }
        v35[0] = v35[2];
      }
      else if (v19 == 3)
      {
        v35[0] = v33;
        uint64_t v20 = 2;
      }
      long long v23 = v35[0];
      double v24 = TSDSubtractPoints(*(double *)v35, *((double *)v35 + 1), a3->x);
      double v26 = TSDNormalizePoint(v24, v25);
      float v28 = TSDDotPoints(v14, v16, v26, v27);
      if (v18 < v28)
      {
        float v18 = v28;
        double v6 = *((double *)&v23 + 1);
        double v5 = *(double *)&v23;
      }
      float64x2_t v34 = (float64x2_t)v35[0];
      if (!v20) {
        long long v33 = v35[0];
      }
      ++v17;
    }
    while (v11 != v17);
  }
  double v29 = v5;
  double v30 = v6;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (id)pressure
{
  return 0;
}

- (int64_t)elementPercentage:(float *)a3 forOverallPercentage:(float)a4
{
  [(TSDBezierPath *)self length];
  float v8 = v7;
  if (a4 < 0.0)
  {
    int64_t v9 = 0;
    do
      [(TSDBezierPath *)self lengthOfElement:++v9];
    while (v10 == 0.0);
    [(TSDBezierPath *)self lengthOfElement:v9];
    double v12 = (float)(v8 * a4) / v11;
LABEL_12:
    float v19 = v12;
    goto LABEL_13;
  }
  float v13 = v8 * a4;
  uint64_t v14 = [(TSDBezierPath *)self elementCount];
  if (v14 < 2)
  {
LABEL_9:
    int64_t v9 = v14;
    do
      [(TSDBezierPath *)self lengthOfElement:--v9];
    while (v17 == 0.0);
    [(TSDBezierPath *)self lengthOfElement:v9];
    double v12 = v13 / v18 + 1.0;
    goto LABEL_12;
  }
  int64_t v9 = 1;
  while (1)
  {
    [(TSDBezierPath *)self lengthOfElement:v9];
    float v16 = v15;
    float v13 = v13 - v16;
    if (v13 < 0.0) {
      break;
    }
    if (v14 == ++v9) {
      goto LABEL_9;
    }
  }
  float v19 = (float)(v13 + v16) / v16;
LABEL_13:
  *a3 = v19;
  return v9;
}

- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4 startingElementIndex:(int64_t)a5 lengthToStartingElement:(double)a6
{
  [(TSDBezierPath *)self length];
  if (v11 <= 0.0 || (double v12 = v11, [(TSDBezierPath *)self elementCount] <= 0))
  {
    uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSDBezierPath(Distortion) elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:]"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPathDistortion.m"), 1335, @"Can't calculate a percentage of a path with no length or elements.");
    a5 = 0;
    double v22 = 0.0;
  }
  else
  {
    double v13 = v12 * a4;
    if (a4 <= 0.0)
    {
      if ([(TSDBezierPath *)self elementCount] < 1)
      {
        a5 = 0;
      }
      else
      {
        a5 = 0;
        do
        {
          [(TSDBezierPath *)self lengthOfElement:a5];
          if (v24 > 0.0) {
            break;
          }
          ++a5;
        }
        while (a5 < [(TSDBezierPath *)self elementCount]);
      }
      [(TSDBezierPath *)self lengthOfElement:a5];
      double v22 = v13 / v25;
    }
    else
    {
      double v14 = v13 - a6;
      int64_t v15 = [(TSDBezierPath *)self elementCount];
      if (v15 <= a5)
      {
        do
        {
LABEL_7:
          if (v15-- < 1) {
            break;
          }
          [(TSDBezierPath *)self lengthOfElement:v15];
        }
        while (v18 <= 0.0);
        [(TSDBezierPath *)self lengthOfElement:v15];
        double v19 = v14 + v16;
        a5 = v15;
      }
      else
      {
        while (1)
        {
          [(TSDBezierPath *)self lengthOfElement:a5];
          double v14 = v14 - v16;
          if (v14 < 0.0) {
            break;
          }
          if (v15 == ++a5) {
            goto LABEL_7;
          }
        }
        double v19 = v16 + v14;
      }
      double v22 = v19 / v16;
    }
  }
  *a3 = v22;
  return a5;
}

- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  switch([(TSDBezierPath *)self elementAtIndex:a4 allPoints:&v24])
  {
    case 0uLL:
      float64x2_t v7 = v24;
      break;
    case 1uLL:
    case 3uLL:
      float64x2_t v7 = vmlaq_n_f64(vmulq_n_f64(v25, a3), v24, 1.0 - a3);
      break;
    case 2uLL:
      if (a3 >= 0.0)
      {
        double v13 = 1.0;
        if (a3 <= 1.0)
        {
          __asm { FMOV            V4.2D, #3.0 }
          float64x2_t v7 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(v25, _Q4), a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v24, 1.0 - a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(vmulq_f64(v26, _Q4), a3), a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v27, a3), a3), a3);
          break;
        }
        *(float *)&double v13 = a3;
        [(TSDBezierPath *)self rawGradientAt:a4 fromElement:v13];
        double v10 = TSDMultiplyPointScalar(v14, v15, a3 + -1.0);
        double v12 = v27.f64[1];
        double v11 = v27.f64[0];
      }
      else
      {
        *(float *)&double v6 = a3;
        [(TSDBezierPath *)self rawGradientAt:a4 fromElement:v6];
        double v10 = TSDMultiplyPointScalar(v8, v9, a3);
        double v12 = v24.f64[1];
        double v11 = v24.f64[0];
      }
      v7.f64[0] = TSDAddPoints(v11, v12, v10);
      v7.f64[1] = v16;
      break;
    default:
      float64x2_t v7 = *(float64x2_t *)MEMORY[0x263F00148];
      break;
  }
  double v22 = v7.f64[1];
  result.double x = v7.f64[0];
  result.double y = v22;
  return result;
}

- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4
{
  *(float *)&a3 = a3;
  [(TSDBezierPath *)self rawGradientAt:a4 fromElement:a3];
  float v6 = v4 * v4 + v5 * v5;
  double v7 = (float)(1.0 / sqrtf(v6));
  double v8 = v5 * v7;
  double v9 = v4 * v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)gradientAt:(float)a3
{
  float v7 = 0.0;
  int64_t v4 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v7);
  [(TSDBezierPath *)self gradientAt:v4 fromElement:v7];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)transformedCoordinate:(CGPoint)a3 withPressure:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  float v23 = 0.0;
  *(float *)&a3.double x = a3.x;
  int64_t v8 = [(TSDBezierPath *)self elementPercentage:&v23 forOverallPercentage:a3.x];
  [(TSDBezierPath *)self pointAt:v8 fromElement:v23];
  double v10 = v9;
  double v12 = v11;
  [(TSDBezierPath *)self gradientAt:v8 fromElement:v23];
  double v14 = v13;
  double v16 = v15;
  [(TSDBezierPath *)self lineWidth];
  double v18 = v17;
  if (a4) {
    [a4 pressureAt:x];
  }
  else {
    double v19 = 1.0;
  }
  double v20 = y * (v18 * v19);
  double v21 = v10 - v16 * v20;
  double v22 = v12 + v14 * v20;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 inElement:(int64_t)a4 withPressure:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  *(float *)&a3.double x = a3.x;
  -[TSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a3.x);
  double v11 = v10;
  [(TSDBezierPath *)self pointAt:a4 fromElement:v10];
  double v13 = v12;
  double v15 = v14;
  [(TSDBezierPath *)self gradientAt:a4 fromElement:v11];
  double v17 = v16;
  double v19 = v18;
  [(TSDBezierPath *)self lineWidth];
  double v21 = v20;
  if (a5) {
    [a5 pressureAt:x];
  }
  else {
    double v22 = 1.0;
  }
  double v23 = y * (v21 * v22);
  double v24 = v13 - v19 * v23;
  double v25 = v15 + v17 * v23;
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 withPressure:(id)a6 getElement:(int64_t *)a7 getPercentage:(float *)a8
{
  double y = a3.y;
  double x = a3.x;
  float v34 = 0.0;
  float v16 = a3.x;
  *(float *)&a3.double x = v16;
  int64_t v17 = [(TSDBezierPath *)self elementPercentage:&v34 forOverallPercentage:a3.x];
  if (v17 >= a4)
  {
    if (v17 <= a5)
    {
      float v19 = v34;
      a4 = v17;
    }
    else
    {
      *(float *)&double v18 = v16;
      [(TSDBezierPath *)self elementPercentageFromElement:a5 forOverallPercentage:v18];
      float v34 = v19;
      a4 = a5;
    }
  }
  else
  {
    *(float *)&double v18 = v16;
    [(TSDBezierPath *)self elementPercentageFromElement:a4 forOverallPercentage:v18];
    float v34 = v19;
  }
  [(TSDBezierPath *)self pointAt:a4 fromElement:v19];
  double v21 = v20;
  double v23 = v22;
  [(TSDBezierPath *)self gradientAt:a4 fromElement:v34];
  double v25 = v24;
  double v27 = v26;
  [(TSDBezierPath *)self lineWidth];
  double v29 = v28;
  if (a6) {
    [a6 pressureAt:x];
  }
  else {
    double v30 = 1.0;
  }
  double v31 = y * (v29 * v30);
  double v32 = v21 - v27 * v31;
  double v33 = v23 + v25 * v31;
  *a7 = a4;
  *a8 = v34;
  result.double y = v33;
  result.double x = v32;
  return result;
}

- (float)elementPercentageFromElement:(int)a3 forOverallPercentage:(float)a4
{
  [(TSDBezierPath *)self length];
  double v8 = v7;
  if (a3 < 1)
  {
    float v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    float v10 = 0.0;
    do
    {
      [(TSDBezierPath *)self lengthOfElement:v9];
      float v10 = v11 + v10;
      ++v9;
    }
    while (a3 != v9);
  }
  float v12 = v8 * a4;
  double v13 = (float)(v12 - v10);
  [(TSDBezierPath *)self lengthOfElement:a3];
  return v13 / v14;
}

- (CGPoint)rawGradientAt:(float)a3 fromElement:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float64x2_t v14 = *(float64x2_t *)MEMORY[0x263F00148];
  switch([(TSDBezierPath *)self elementAtIndex:a4 allPoints:&v15])
  {
    case 0uLL:
      NSLog((NSString *)@"GA can't handle move to");
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      float64x2_t v5 = vsubq_f64(v16, v15);
      break;
    case 2uLL:
      float v6 = 0.01;
      if (a3 >= 0.01) {
        float v6 = a3;
      }
      if (v6 > 0.99) {
        float v6 = 0.99;
      }
      __asm
      {
        FMOV            V4.2D, #-3.0
        FMOV            V5.2D, #3.0
      }
      float64x2_t v5 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_f64(v16, _Q5), (float)((float)((float)(v6 * -4.0) + 1.0) + (float)((float)(v6 * 3.0) * v6))), vmulq_n_f64(vmulq_f64(v15, _Q4), (float)(v6 + -1.0)), (float)(v6 + -1.0)), vmulq_n_f64(vmulq_f64(v17, _Q5), v6), (float)((float)(v6 * -3.0) + 2.0)), vmulq_n_f64(vmulq_f64(v18, _Q5), v6), v6);
      break;
    default:
LABEL_4:
      float64x2_t v5 = v14;
      break;
  }
  double v13 = v5.f64[1];
  result.double x = v5.f64[0];
  result.double y = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3
{
  int v15 = 0;
  int64_t v4 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v15);
  LODWORD(v5) = v15;
  [(TSDBezierPath *)self rawGradientAt:v4 fromElement:v5];
  double v7 = v6;
  double v9 = v8;
  [(TSDBezierPath *)self length];
  double v11 = v10;
  [(TSDBezierPath *)self lengthOfElement:v4];
  double v13 = TSDMultiplyPointScalar(v7, v9, v11 / v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3 fromElement:(int64_t)a4
{
  -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:");
  double v7 = v6;
  double v9 = v8;
  [(TSDBezierPath *)self length];
  double v11 = v10;
  [(TSDBezierPath *)self lengthOfElement:a4];

  double v13 = TSDMultiplyPointScalar(v7, v9, v11 / v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (float)curvatureAt:(float)a3
{
  float v8 = 0.0;
  int64_t v4 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v8);
  [(TSDBezierPath *)self curvatureAt:v4 fromElement:v8];
  double v6 = v5;
  float result = 0.5;
  if (v6 <= 0.5)
  {
    float result = -0.5;
    if (v6 >= -0.5) {
      return v6;
    }
  }
  return result;
}

- (double)curvatureAt:(double)a3 fromElement:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(TSDBezierPath *)self elementAtIndex:a4 allPoints:&v13];
  if (v5 == 2)
  {
    double v7 = 0.01;
    if (a3 >= 0.01) {
      double v7 = a3;
    }
    if (v7 > 0.99) {
      double v7 = 0.99;
    }
    double v8 = (v7 * (v7 * (v19 - v17) + (1.0 - v7) * (v17 - v15)) + (1.0 - v7)
                                                             * (v7 * (v17 - v15) + (1.0 - v7) * (v15 - v13)))
       * 3.0;
    double v9 = (v7 * (v7 * (v20 - v18) + (1.0 - v7) * (v18 - v16)) + (1.0 - v7)
                                                             * (v7 * (v18 - v16) + (1.0 - v7) * (v16 - v14)))
       * 3.0;
    float v10 = v8 * ((v7 * (v20 - v18 - (v18 - v16)) + (1.0 - v7) * (v18 - v16 - (v16 - v14))) * 6.0)
        - v9 * ((v7 * (v19 - v17 - (v17 - v15)) + (1.0 - v7) * (v17 - v15 - (v15 - v13))) * 6.0);
    return (float)(v10 / pow(v9 * v9 + v8 * v8, 1.5));
  }
  else
  {
    double v6 = 0.0;
    if (!v5) {
      NSLog((NSString *)@"CA can't handle move to");
    }
  }
  return v6;
}

- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4
{
  uint64_t v7 = [a3 elementCount] - 1;

  -[TSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", a3, 0, v7, a4, 0.0, 1.0);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v10 = [a3 elementCount] - 1;

  -[TSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", a3, 0, v10, a5, var0, var1);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v11 = [TSDPathCut alloc];
  [a3 lengthToElement:location];
  double v13 = v12;
  [a3 length];
  double v15 = [(TSDPathCut *)v11 initWithSegment:location atT:v13 / v14 withSkew:0.0];
  [v10 addObject:v15];

  [a3 miterLimit];
  NSUInteger v17 = location + length;
  NSUInteger v18 = location + 1;
  if (v18 < v17)
  {
    double v77 = v16 * 0.995;
    NSUInteger v19 = length - 1;
    do
    {
      NSUInteger v20 = v18 + 1;
      objc_msgSend(a3, "lengthOfElement:", v18 + 1, *(void *)&var1);
      if (v21 >= 0.1)
      {
        [a3 lengthOfElement:v18];
        if (v22 >= 0.1)
        {
          [a3 gradientAt:v18 fromElement:1.0];
          double v25 = TSDNormalizePoint(v23, v24);
          double v27 = v26;
          [a3 gradientAt:v18 + 1 fromElement:0.0];
          double v30 = TSDNormalizePoint(v28, v29);
          double v32 = v31;
          float v33 = TSDDotPoints(v25, v27, v30, v31);
          if (v33 < 0.99)
          {
            objc_msgSend(a3, "lengthToElement:", v18 + 1, v33);
            double v79 = v34;
            [a3 length];
            double v36 = v35;
            float v37 = 0.0;
            if (v20 < v17)
            {
              double v38 = TSDMultiplyPointScalar(v30, v32, -1.0);
              double v39 = TSDAddPoints(v25, v27, v38);
              double v41 = v40;
              double v42 = -TSDDotPoints(v25, v27, v39, v40);
              double v43 = TSDRotatePoint90Degrees(0, v25, v27);
              float v37 = v42 / TSDDotPoints(v39, v41, v43, v44);
              float v45 = fmin(fmax((float)-v33, -1.0), 1.0);
              float v46 = acosf(v45);
              if (1.0 / sinf(v46 * 0.5) > v77) {
                float v37 = 0.0;
              }
            }
            float v47 = v79 / v36;
            v48 = [[TSDPathCut alloc] initWithSegment:v18 atT:v47 withSkew:v37];
            [v10 addObject:v48];
          }
        }
      }
      NSUInteger v18 = v20;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    while (1)
    {
      objc_msgSend(a3, "lengthOfElement:", v17, *(void *)&var1);
      if (v49 >= 0.1) {
        break;
      }
      if (!--v17) {
        goto LABEL_14;
      }
    }
    v55 = [TSDPathCut alloc];
    [a3 lengthToElement:v17 + 1];
    double v57 = v56;
    [a3 length];
    v59 = [(TSDPathCut *)v55 initWithSegment:v17 atT:v57 / v58 withSkew:0.0];
    [v10 addObject:v59];

    float64x2_t v83 = *(float64x2_t *)MEMORY[0x263F00148];
    int64_t v60 = [(TSDBezierPath *)self elementCount];
    if (v60)
    {
      int64_t v61 = v60;
      uint64_t v62 = 0;
      BOOL v63 = 0;
      do
      {
        unint64_t v64 = [(TSDBezierPath *)self elementAtIndex:v62 associatedPoints:&v85];
        BOOL v65 = v64 == 0;
        if (v64)
        {
          unint64_t v66 = v64;
          if (v64 == 2)
          {
            v85.f64[0] = var0 + v85.f64[0] * var1;
            double v86 = var0 + v86 * var1;
            v88.f64[0] = var0 + v88.f64[0] * var1;
            float64x2_t v81 = v88;
            recursiveSubdivideCurveSplit(&v84, a3, 0, a6, v63, v10);
            float64x2_t v84 = v81;
          }
          else
          {
            if (v64 == 3)
            {
              float64x2_t v85 = v83;
              float64x2_t v67 = v83;
            }
            else
            {
              v67.f64[0] = var0 + v85.f64[0] * var1;
              v85.f64[0] = v67.f64[0];
            }
            float64x2_t v68 = v84;
            double v69 = TSDSubtractPoints(v67.f64[0], v85.f64[1], v84.f64[0]);
            double v71 = v70;
            float64x2_t v88 = v85;
            double v72 = TSDMultiplyPointScalar(v69, v70, 0.33);
            v85.f64[0] = TSDAddPoints(v68.f64[0], v68.f64[1], v72);
            v85.f64[1] = v73;
            double v74 = TSDMultiplyPointScalar(v69, v71, 0.66);
            double v86 = TSDAddPoints(v68.f64[0], v68.f64[1], v74);
            uint64_t v87 = v75;
            float64x2_t v82 = v88;
            recursiveSubdivideCurveSplit(&v84, a3, 0, a6, v63, v10);
            float64x2_t v84 = v82;
            if (v66 == 3) {
              [a6 closePath];
            }
          }
        }
        else
        {
          v85.f64[0] = var0 + v85.f64[0] * var1;
          float64x2_t v83 = v85;
          float64x2_t v84 = v85;
        }
        ++v62;
        BOOL v63 = v65;
      }
      while (v61 != v62);
    }
  }
  else
  {
LABEL_14:
    v50 = [TSDPathCut alloc];
    [a3 lengthToElement:1];
    double v52 = v51;
    [a3 length];
    v54 = [(TSDPathCut *)v50 initWithSegment:0 atT:v52 / v53 withSkew:0.0];
    [v10 addObject:v54];
  }
}

- (id)chisel
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v3 = +[TSDBezierPath bezierPath];
  [(TSDBezierPath *)self lineWidth];
  float v5 = v4 * 0.5;
  int64_t v6 = [(TSDBezierPath *)self elementCount];
  if (!v6)
  {
    BOOL v9 = 1;
    uint64_t v54 = -1;
    goto LABEL_60;
  }
  int64_t v7 = v6;
  uint64_t v8 = 0;
  BOOL v9 = 1;
  float v10 = 9.0;
  float v11 = -3.0;
  do
  {
    BOOL v12 = v9;
    unint64_t v13 = [(TSDBezierPath *)self elementAtIndex:v8 allPoints:&v111];
    BOOL v9 = v13 == 0;
    if (!v13) {
      goto LABEL_56;
    }
    unint64_t v14 = v13;
    [(TSDBezierPath *)self rawGradientAt:v8 fromElement:0.0];
    if (v15 <= 0.0) {
      float v16 = -v5;
    }
    else {
      float v16 = v5;
    }
    if (v14 == 2)
    {
      float v17 = v111.f64[0];
      float v18 = v112;
      float v19 = v114;
      float v20 = v116;
      float v21 = (float)((float)((float)(v18 * v10) + (float)(v17 * v11)) + (float)(v19 * -9.0)) + (float)(v20 * 3.0);
      float v22 = (float)((float)(v18 * -12.0) + (float)(v17 * 6.0)) + (float)(v19 * 6.0);
      float v23 = (float)(v18 * 3.0) + (float)(v17 * v11);
      float v24 = (float)(v23 * (float)(v21 * -4.0)) + (float)(v22 * v22);
      if (v24 <= 0.0)
      {
        double v35 = v16;
        double v36 = v111.f64[1] + v16;
        if (v12) {
          objc_msgSend(v3, "moveToPoint:", v111.f64[0], v36);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v111.f64[0], v36);
        }
        double v40 = v116;
        double v41 = v117 + v35;
        double v42 = v112;
        double v43 = v113 + v35;
        double v44 = v114;
        double v45 = v115;
        goto LABEL_55;
      }
      float v25 = sqrtf(v24);
      float v26 = (float)((float)-v22 - v25) / (float)(v21 + v21);
      float v27 = (float)(v25 - v22) / (float)(v21 + v21);
      if (v27 >= v26) {
        float v28 = v27;
      }
      else {
        float v28 = v26;
      }
      if (v27 < v26) {
        float v26 = v27;
      }
      double v29 = fabsf(v21);
      float v30 = (float)-v23 / v22;
      if (v29 <= 0.001) {
        float v31 = 10.0;
      }
      else {
        float v31 = v28;
      }
      if (v29 <= 0.001) {
        float v32 = v30;
      }
      else {
        float v32 = v26;
      }
      if (v32 > 0.0 && v32 < 1.0)
      {
        double v37 = v32;
        TSDCurveBetween(&v111, (uint64_t)&v103, 0.0, v32);
        double v38 = v16;
        double v39 = v104 + v38;
        if (v12) {
          objc_msgSend(v3, "moveToPoint:", v103, v39);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v103, v39);
        }
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v109, v110 + v38, v105, v106 + v38, v107, v108 + v38);
        double v46 = v37 + 0.01;
        *(float *)&double v46 = v37 + 0.01;
        [(TSDBezierPath *)self rawGradientAt:v8 fromElement:v46];
        BOOL v12 = 0;
        if (v47 <= 0.0) {
          float v16 = -v5;
        }
        else {
          float v16 = v5;
        }
      }
      else
      {
        float v32 = 0.0;
      }
      double v48 = v32;
      if (v31 > 0.0 && v31 < 1.0)
      {
        double v50 = v31;
        TSDCurveBetween(&v111, (uint64_t)&v103, v48, v31);
        double v51 = v104 + v16;
        if (v12) {
          objc_msgSend(v3, "moveToPoint:", v103, v51);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v103, v51);
        }
        float v10 = 9.0;
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v109, v110 + v16, v105, v106 + v16, v107, v108 + v16);
        double v52 = v50 + 0.01;
        *(float *)&double v52 = v50 + 0.01;
        [(TSDBezierPath *)self rawGradientAt:v8 fromElement:v52];
        if (v53 <= 0.0) {
          float v16 = -v5;
        }
        else {
          float v16 = v5;
        }
        TSDCurveBetween(&v111, (uint64_t)&v103, v50, 1.0);
      }
      else
      {
        TSDCurveBetween(&v111, (uint64_t)&v103, v48, 1.0);
        if (v12)
        {
          double v35 = v16;
          objc_msgSend(v3, "moveToPoint:", v103, v104 + v16);
          float v10 = 9.0;
          float v11 = -3.0;
LABEL_54:
          double v40 = v109;
          double v41 = v110 + v35;
          double v42 = v105;
          double v43 = v106 + v35;
          double v44 = v107;
          double v45 = v108;
LABEL_55:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v40, v41, v42, v43, v44, v45 + v35);
          goto LABEL_56;
        }
        float v10 = 9.0;
      }
      float v11 = -3.0;
      double v35 = v16;
      objc_msgSend(v3, "lineToPoint:", v103, v104 + v16);
      goto LABEL_54;
    }
    double v34 = v111.f64[1] + v16;
    if (v12) {
      objc_msgSend(v3, "moveToPoint:", v111.f64[0], v34);
    }
    else {
      objc_msgSend(v3, "lineToPoint:", v111.f64[0], v34);
    }
    objc_msgSend(v3, "lineToPoint:", v112, v113 + v16);
LABEL_56:
    ++v8;
  }
  while (v7 != v8);
  uint64_t v54 = v7 - 1;
  if (v54)
  {
LABEL_60:
    if (*MEMORY[0x263F00148] >= 0.0) {
      float v55 = -v5;
    }
    else {
      float v55 = v5;
    }
    double v56 = v55;
    float v57 = 9.0;
    float v58 = -3.0;
    do
    {
      unint64_t v59 = [(TSDBezierPath *)self elementAtIndex:v54 allPoints:&v111];
      BOOL v61 = v59 == 0;
      if (v59)
      {
        unint64_t v62 = v59;
        LODWORD(v60) = 1.0;
        [(TSDBezierPath *)self rawGradientAt:v54 fromElement:v60];
        if (v63 >= 0.0) {
          float v64 = -v5;
        }
        else {
          float v64 = v5;
        }
        if (v62 == 2)
        {
          float v65 = v111.f64[0];
          float v66 = v112;
          float v67 = v114;
          float v68 = v116;
          float v69 = (float)((float)((float)(v66 * v57) + (float)(v65 * v58)) + (float)(v67 * -9.0)) + (float)(v68 * 3.0);
          float v70 = (float)((float)(v66 * -12.0) + (float)(v65 * 6.0)) + (float)(v67 * 6.0);
          float v71 = (float)(v66 * 3.0) + (float)(v65 * v58);
          float v72 = (float)(v71 * (float)(v69 * -4.0)) + (float)(v70 * v70);
          if (v72 <= 0.0)
          {
            double v85 = v64;
            if (v9) {
              objc_msgSend(v3, "moveToPoint:");
            }
            else {
              objc_msgSend(v3, "lineToPoint:");
            }
            double v89 = v111.f64[0];
            double v90 = v111.f64[1] + v85;
            double v91 = v114;
            double v92 = v115 + v85;
            double v93 = v112;
            double v94 = v113;
          }
          else
          {
            float v73 = sqrtf(v72);
            float v74 = (float)((float)-v70 - v73) / (float)(v69 + v69);
            float v75 = (float)(v73 - v70) / (float)(v69 + v69);
            if (v75 <= v74) {
              float v76 = v75;
            }
            else {
              float v76 = v74;
            }
            if (v75 > v74) {
              float v74 = v75;
            }
            double v77 = fabsf(v69);
            float v78 = (float)-v71 / v70;
            if (v77 <= 0.001) {
              float v79 = 10.0;
            }
            else {
              float v79 = v76;
            }
            if (v77 <= 0.001) {
              float v80 = v78;
            }
            else {
              float v80 = v74;
            }
            if (v80 > 0.0 && v80 < 1.0)
            {
              double v86 = v80;
              TSDCurveBetween(&v111, (uint64_t)&v103, v80, 1.0);
              double v87 = v64;
              double v88 = v110 + v87;
              if (v9) {
                objc_msgSend(v3, "moveToPoint:", v109, v88);
              }
              else {
                objc_msgSend(v3, "lineToPoint:", v109, v88);
              }
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v103, v104 + v87, v107, v108 + v87, v105, v106 + v87);
              double v95 = v86 + -0.01;
              *(float *)&double v95 = v86 + -0.01;
              [(TSDBezierPath *)self rawGradientAt:v54 fromElement:v95];
              BOOL v9 = 0;
              if (v96 >= 0.0) {
                float v64 = -v5;
              }
              else {
                float v64 = v5;
              }
            }
            else
            {
              float v80 = 1.0;
            }
            if (v79 > 0.0 && v79 < 1.0)
            {
              double v98 = v79;
              TSDCurveBetween(&v111, (uint64_t)&v103, v79, v80);
              double v99 = v110 + v64;
              if (v9) {
                objc_msgSend(v3, "moveToPoint:", v109, v99);
              }
              else {
                objc_msgSend(v3, "lineToPoint:", v109, v99);
              }
              float v57 = 9.0;
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v103, v104 + v64, v107, v108 + v64, v105, v106 + v64);
              double v100 = v98 + -0.01;
              *(float *)&double v100 = v98 + -0.01;
              [(TSDBezierPath *)self rawGradientAt:v54 fromElement:v100];
              if (v101 >= 0.0) {
                float v64 = -v5;
              }
              else {
                float v64 = v5;
              }
              TSDCurveBetween(&v111, (uint64_t)&v103, 0.0, v98);
            }
            else
            {
              TSDCurveBetween(&v111, (uint64_t)&v103, 0.0, v80);
              if (v9)
              {
                double v85 = v64;
                objc_msgSend(v3, "moveToPoint:", v109, v110 + v64);
                float v57 = 9.0;
                float v58 = -3.0;
                goto LABEL_117;
              }
              float v57 = 9.0;
            }
            float v58 = -3.0;
            double v85 = v64;
            objc_msgSend(v3, "lineToPoint:", v109, v110 + v64);
LABEL_117:
            double v89 = v103;
            double v90 = v104 + v85;
            double v91 = v107;
            double v92 = v108 + v85;
            double v93 = v105;
            double v94 = v106;
          }
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v89, v90, v91, v92, v93, v94 + v85);
          goto LABEL_119;
        }
        double v84 = v113 + v64;
        if (v9) {
          objc_msgSend(v3, "moveToPoint:", v112, v84);
        }
        else {
          objc_msgSend(v3, "lineToPoint:", v112, v84);
        }
        double v82 = v111.f64[0];
        double v83 = v111.f64[1] + v64;
      }
      else
      {
        double v82 = v111.f64[0];
        double v83 = v111.f64[1] - v56;
      }
      objc_msgSend(v3, "lineToPoint:", v82, v83);
LABEL_119:
      BOOL v9 = v61;
      --v54;
    }
    while (v54);
  }
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[TSDBezierPath setVersion:524];
  }
}

+ (id)bezierPath
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (TSDBezierPath)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v8 = (TSDBezierPath *)[a1 bezierPath];
  -[TSDBezierPath moveToPoint:](v8, "moveToPoint:", v7, v6);
  -[TSDBezierPath lineToPoint:](v8, "lineToPoint:", x, y);
  return v8;
}

+ (TSDBezierPath)bezierPathWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (TSDBezierPath *)[a1 bezierPath];
  -[TSDBezierPath appendBezierPathWithRect:](v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (TSDBezierPath)bezierPathWithOvalInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (TSDBezierPath *)[a1 bezierPath];
  -[TSDBezierPath appendBezierPathWithOvalInRect:](v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (TSDBezierPath)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  double v4 = TSDCreateRoundRectPathForRectWithRadius(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  float v5 = +[TSDBezierPath bezierPathWithCGPath:v4];
  CGPathRelease(v4);
  return v5;
}

- (void)copyPathAttributesTo:(id)a3
{
  objc_msgSend(a3, "setWindingRule:", -[TSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(a3, "setLineCapStyle:", -[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(a3, "setLineJoinStyle:", -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  [(TSDBezierPath *)self lineWidth];
  objc_msgSend(a3, "setLineWidth:");
  [(TSDBezierPath *)self miterLimit];
  objc_msgSend(a3, "setMiterLimit:");
  [(TSDBezierPath *)self flatness];
  objc_msgSend(a3, "setFlatness:");
  if (self->sfr_dashedLinePattern)
  {
    double sfr_dashedLinePhase = self->sfr_dashedLinePhase;
    objc_msgSend(a3, "setLineDash:count:phase:", sfr_dashedLinePhase);
  }
}

+ (TSDBezierPath)bezierPathWithCGPath:(CGPath *)a3
{
  double v4 = (TSDBezierPath *)[a1 bezierPath];
  CGPathApply(a3, v4, (CGPathApplierFunction)pBuildBezierPath);
  return v4;
}

+ (void)fillRect:(CGRect)a3
{
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGFloat v8 = x;
      CGFloat v9 = y;
      CGFloat v10 = width;
      CGFloat v11 = height;
      CGContextFillRect(CurrentContext, *(CGRect *)&v8);
    }
  }
}

+ (void)strokeRect:(CGRect)a3
{
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextSetLineCap(CurrentContext, (CGLineCap)sfrdefaultLineCapStyle);
      CGContextSetLineJoin(CurrentContext, (CGLineJoin)sfrdefaultLineJoinStyle);
      _SFRSetLineWidth(CurrentContext, *(CGFloat *)&sfrdefaultLineWidth);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&sfrdefaultMiterLimit);
      CGContextBeginPath(CurrentContext);
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v17);
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v18);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v19);
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGFloat v11 = CGRectGetMinY(v20);
      CGContextAddLineToPoint(CurrentContext, MaxX, v11);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat v12 = CGRectGetMaxX(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v22);
      CGContextAddLineToPoint(CurrentContext, v12, MaxY);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGFloat v14 = CGRectGetMinX(v23);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      CGFloat v15 = CGRectGetMaxY(v24);
      CGContextAddLineToPoint(CurrentContext, v14, v15);
      CGContextClosePath(CurrentContext);
      CGContextStrokePath(CurrentContext);
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)clipRect:(CGRect)a3
{
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGFloat v8 = x;
      CGFloat v9 = y;
      CGFloat v10 = width;
      CGFloat v11 = height;
      CGContextClipToRect(CurrentContext, *(CGRect *)&v8);
    }
  }
}

+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)sfrdefaultLineCapStyle);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)sfrdefaultLineJoinStyle);
  _SFRSetLineWidth(CurrentContext, *(CGFloat *)&sfrdefaultLineWidth);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);

  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  sfrdefaultMiterLimit = *(void *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&sfrdefaultMiterLimit;
}

+ (void)setDefaultFlatness:(double)a3
{
  sfrdefaultFlatness = *(void *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&sfrdefaultFlatness;
}

+ (void)setDefaultWindingRule:(unint64_t)a3
{
  sfrdefaultWindingRule = a3;
}

+ (unint64_t)defaultWindingRule
{
  return sfrdefaultWindingRule;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  sfrdefaultLineCapStyle = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return sfrdefaultLineCapStyle;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  sfrdefaultLineJoinStyle = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return sfrdefaultLineJoinStyle;
}

+ (void)setDefaultLineWidth:(double)a3
{
  sfrdefaultLineWidth = *(void *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&sfrdefaultLineWidth;
}

- (TSDBezierPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSDBezierPath;
  float result = [(TSDBezierPath *)&v6 init];
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = result->sfr_bpFlags;
  *(_OWORD *)&result->sfr_elementCount = 0u;
  *(_OWORD *)&result->sfr_head = 0u;
  result->sfr_extraSegmentCount = 0;
  result->sfr_extraSegmentMaCGFloat x = 0;
  result->sfr_totalLength = 0.0;
  result->sfr_lastSubpathIndeCGFloat x = -1;
  result->sfr_extraSegments = 0;
  $7B3C09426D5A94CD5FE07DCF037609F1 v4 = ($7B3C09426D5A94CD5FE07DCF037609F1)(((8 * sfrdefaultWindingRule) | ((_BYTE)sfrdefaultLineCapStyle << 6)) | 5 | *(_DWORD *)&sfr_bpFlags & 0xFFFFF800 | (16 * (sfrdefaultLineJoinStyle & 0xF)));
  *(void *)&result->sfr_lineWidth = sfrdefaultLineWidth;
  double v5 = *(double *)&sfrdefaultFlatness;
  *(void *)&result->sfr_miterLimit = sfrdefaultMiterLimit;
  result->sfr_flatness = v5;
  result->sfr_dashedLinePattern = 0;
  result->sfr_dashedLineCount = 0;
  result->double sfr_dashedLinePhase = 0.0;
  result->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = v4;
  return result;
}

- (void)dealloc
{
  id v3 = (NSZone *)[(TSDBezierPath *)self zone];
  NSZoneFree(v3, self->sfr_head);
  NSZoneFree(v3, self->sfr_elementLength);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern) {
    NSZoneFree(v3, sfr_dashedLinePattern);
  }
  sfr_path = self->sfr_path;
  if (sfr_path) {
    CFRelease(sfr_path);
  }
  sfr_extraSegments = self->sfr_extraSegments;
  if (sfr_extraSegments) {
    NSZoneFree(v3, sfr_extraSegments);
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDBezierPath;
  [(TSDBezierPath *)&v7 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 appendBezierPath:self];
  objc_msgSend(v4, "setWindingRule:", -[TSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v4, "setLineCapStyle:", -[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v4, "setLineJoinStyle:", -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  [(TSDBezierPath *)self lineWidth];
  objc_msgSend(v4, "setLineWidth:");
  [(TSDBezierPath *)self miterLimit];
  objc_msgSend(v4, "setMiterLimit:");
  [(TSDBezierPath *)self flatness];
  objc_msgSend(v4, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern) {
    [v4 setLineDash:sfr_dashedLinePattern count:self->sfr_dashedLineCount phase:self->sfr_dashedLinePhase];
  }
  return v4;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(TSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for line"];
  }

  -[TSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  if ([(TSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for curve"];
  }

  -[TSDBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v10, v9, v8, v7, x, y);
}

- (void)removeAllPoints
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF);
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = sfr_bpFlags;
  self->sfr_elementCount = 0;
  self->sfr_extraSegmentCount = 0;
  self->sfr_lastSubpathIndedouble x = -1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
    $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  }
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDBezierPath *)self currentPoint];
  double v7 = x + v6;
  double v9 = y + v8;

  -[TSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v7, v9);
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDBezierPath *)self currentPoint];
  double v7 = x + v6;
  double v9 = y + v8;

  -[TSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v7, v9);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  [(TSDBezierPath *)self currentPoint];
  double v13 = v8 + v12;
  double v15 = v7 + v14;
  double v16 = x + v12;
  double v17 = y + v14;
  double v18 = v10 + v12;
  double v19 = v9 + v14;

  -[TSDBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v18, v19, v13, v15, v16, v17);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_lineWidth = a3;
}

- (unint64_t)lineCapStyle
{
  return *(_DWORD *)&self->sfr_bpFlags >> 6;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFF3F | ((a3 & 3) << 6));
}

- (unint64_t)lineJoinStyle
{
  return ((unint64_t)self->sfr_bpFlags >> 4) & 3;
}

- (void)setLineJoinStyle:(unint64_t)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFCF | (16 * (a3 & 0xF)));
}

- (unint64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(unint64_t)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFF7 | (8 * (a3 & 0x1F)));
}

- (double)miterLimit
{
  return self->sfr_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->sfr_miterLimit = a3;
}

- (double)flatness
{
  return self->sfr_flatness;
}

- (void)setFlatness:(double)a3
{
  self->sfr_flatness = a3;
}

- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5
{
  p_sfr_dashedLinePattern = &self->sfr_dashedLinePattern;
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (a3)
  {
    double v10 = a3;
    CGFloat v11 = (NSZone *)[(TSDBezierPath *)self zone];
    if (sfr_dashedLinePattern) {
      double v12 = (double *)NSZoneRealloc(v11, *p_sfr_dashedLinePattern, 8 * a4);
    }
    else {
      double v12 = (double *)NSZoneMalloc(v11, 8 * a4);
    }
    self->sfr_dashedLinePattern = v12;
    self->sfr_dashedLineCount = a4;
    self->double sfr_dashedLinePhase = a5;
    if (a4 >= 1)
    {
      do
      {
        uint64_t v13 = *(void *)v10++;
        *(void *)v12++ = v13;
        --a4;
      }
      while (a4);
    }
  }
  else if (sfr_dashedLinePattern)
  {
    NSZoneFree((NSZone *)[(TSDBezierPath *)self zone], self->sfr_dashedLinePattern);
    *p_sfr_dashedLinePattern = 0;
    p_sfr_dashedLinePattern[1] = 0;
    p_sfr_dashedLinePattern[2] = 0;
  }
}

- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5
{
  if (a4) {
    *a4 = self->sfr_dashedLineCount;
  }
  if (a5) {
    *a5 = self->sfr_dashedLinePhase;
  }
  if (a3)
  {
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      for (unint64_t i = self->sfr_dashedLineCount; i; --i)
      {
        uint64_t v7 = *(void *)sfr_dashedLinePattern++;
        *(void *)a3++ = v7;
      }
    }
  }
}

- (void)_doPath
{
  if (!self->sfr_path && ![(TSDBezierPath *)self isEmpty])
  {
    Mutable = CGPathCreateMutable();
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      double v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
      do
      {
        switch(*(_DWORD *)sfr_head & 0xF)
        {
          case 0:
            CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 1:
            CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 2:
            CGPathAddCurveToPoint(Mutable, 0, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            sfr_extraSegments += 4;
            break;
          case 3:
            CGPathCloseSubpath(Mutable);
            break;
          default:
            break;
        }
        sfr_head += 6;
      }
      while (sfr_head < v6);
    }
    self->sfr_path = Mutable;
  }
}

- (void)stroke
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)[(TSDBezierPath *)self lineCapStyle]);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)[(TSDBezierPath *)self lineJoinStyle]);
  _SFRSetLineWidth(CurrentContext, self->sfr_lineWidth);
  CGContextSetMiterLimit(CurrentContext, self->sfr_miterLimit);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern) {
    CGContextSetLineDash(CurrentContext, self->sfr_dashedLinePhase, sfr_dashedLinePattern, self->sfr_dashedLineCount);
  }
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    uint64_t v7 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v7);
  }
  CGContextStrokePath(CurrentContext);

  CGContextRestoreGState(CurrentContext);
}

- (void)fill
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    double v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if ([(TSDBezierPath *)self windingRule]) {
    CGContextEOFillPath(CurrentContext);
  }
  else {
    CGContextFillPath(CurrentContext);
  }

  CGContextRestoreGState(CurrentContext);
}

- (void)addClip
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  CGContextBeginPath(CurrentContext);
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    double v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if ([(TSDBezierPath *)self windingRule]) {
    CGContextEOClip(CurrentContext);
  }
  else {
    CGContextClip(CurrentContext);
  }

  CGContextBeginPath(CurrentContext);
}

- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  float64x2_t v8 = (float64x2_t)a4;
  a4.double x = a7.x;
  *(CGFloat *)&long long v7 = a7.y;
  CGFloat y = a5.y;
  float64x2_t v11 = vsubq_f64((float64x2_t)a5, v8);
  CGFloat v12 = a6.y;
  CGPoint v38 = a4;
  long long v39 = v7;
  CGFloat v13 = a7.y;
  float64x2_t v14 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  float64x2_t v15 = vsubq_f64(v14, v11);
  float64x2_t v16 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v14);
  float64x2_t v17 = (float64x2_t)vzip2q_s64((int64x2_t)v15, (int64x2_t)v16);
  float64x2_t v18 = (float64x2_t)vzip1q_s64((int64x2_t)v15, (int64x2_t)v16);
  float64x2_t v19 = vmlaq_f64(vmulq_f64(v17, v17), v18, v18);
  if (v19.f64[0] <= v19.f64[1]) {
    v19.f64[0] = v19.f64[1];
  }
  double v20 = a3 * a3;
  double v21 = v19.f64[0] * 9.0 * 0.0625;
  if (v21 > v20)
  {
    float64x2_t v22 = vsubq_f64(v16, v15);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    float64x2_t v29 = vmulq_f64(v22, _Q6);
    float64x2_t v30 = vmlaq_f64(v22, _Q5, vaddq_f64(v11, v15));
    float64x2_t v31 = vmulq_f64(vaddq_f64(v15, v22), _Q6);
    uint64_t v32 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      uint64_t v36 = v32;
      float64x2_t v29 = vmulq_f64(v29, _Q2);
      float64x2_t v31 = vsubq_f64(vmulq_f64(v31, _Q3), v29);
      float64x2_t v30 = vsubq_f64(vmulq_f64(v30, _Q4), vmulq_f64(v31, _Q4));
      v32 *= 2;
      double v21 = v21 * 0.0625;
    }
    while (v21 > v20 && v32 <= 0x10000);
    if (v32 >= 2)
    {
      unint64_t v37 = (2 * v36) | 1;
      do
      {
        float64x2_t v42 = v29;
        float64x2_t v43 = vaddq_f64(v8, v30);
        float64x2_t v40 = vaddq_f64(v30, v31);
        float64x2_t v41 = vaddq_f64(v29, v31);
        -[TSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v43, v38, v39);
        float64x2_t v30 = v40;
        float64x2_t v31 = v41;
        float64x2_t v29 = v42;
        float64x2_t v8 = v43;
        --v37;
      }
      while (v37 > 2);
    }
  }

  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v38.x, *(double *)&v39);
}

- (void)flattenIntoPath:(id)a3 flatness:(double)a4
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    float64x2_t v8 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:", a4, *(double *)&sfr_head[-4], *(double *)&sfr_head[-2], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(void *)&sfr_head[2], *(void *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          [a3 closePath];
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v8);
  }
}

- (id)bezierPathByFlatteningPath
{
  if ((*(unsigned char *)&self->sfr_bpFlags & 4) != 0)
  {
    id v3 = (id)[(TSDBezierPath *)self copy];
  }
  else
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    [(TSDBezierPath *)self flattenIntoPath:v3 flatness:*(double *)&sfrdefaultFlatness];
  }

  return v3;
}

- (id)bezierPathByFlatteningPathWithFlatness:(double)a3
{
  if ([(TSDBezierPath *)self isFlat])
  {
    id v5 = (id)[(TSDBezierPath *)self copy];
  }
  else
  {
    id v5 = objc_alloc_init((Class)objc_opt_class());
    [(TSDBezierPath *)self flattenIntoPath:v5 flatness:a3];
  }

  return v5;
}

- (id)_copyFlattenedPath
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [(TSDBezierPath *)self flattenIntoPath:v3 flatness:*(double *)&sfrdefaultFlatness];
  return v3;
}

- (id)bezierPathByReversingPath
{
  if (self->sfr_elementCount > 1)
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 2)
    {
      sfr_head = self->sfr_head;
      unint64_t v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      float64x2_t v8 = sfr_head + 6;
      do
      {
        double v9 = v8;
        uint64_t v10 = *(void *)&sfr_head[6] & 0xFLL;
        if (v10) {
          BOOL v11 = (unint64_t)&sfr_head[12] >= v6;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11)
        {
          if (v10) {
            CGFloat v12 = v9;
          }
          else {
            CGFloat v12 = sfr_head;
          }
          objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
          char v13 = 0;
          float64x2_t v14 = (double *)&v12[-2];
          while (1)
          {
            switch(v14[1] & 0xF)
            {
              case 0:
                goto LABEL_25;
              case 1:
                if ((v13 & 1) != 0 && (*(unsigned char *)(v14 - 2) & 0xF) == 0) {
                  goto LABEL_20;
                }
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_24;
              case 2:
                objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v14 - 1), *v14, sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4) + 2], sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4) + 3], sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4)], sfr_extraSegments[4 * (*((void *)v14 + 1) >> 4) + 1]);
                if (v13)
                {
                  if ((*(unsigned char *)(v14 - 2) & 0xF) == 0) {
LABEL_20:
                  }
                    [v3 closePath];
LABEL_22:
                  char v13 = 1;
                }
                else
                {
                  char v13 = 0;
                }
LABEL_24:
                v14 -= 3;
                break;
              case 3:
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_22;
              default:
                goto LABEL_24;
            }
          }
        }
LABEL_25:
        float64x2_t v8 = v9 + 6;
        sfr_head = v9;
      }
      while ((unint64_t)&v9[6] < v6);
    }
  }
  else
  {
    id v3 = (id)[(TSDBezierPath *)self copy];
  }

  return v3;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
    do
    {
      *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  if (sfr_extraSegments)
  {
    int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
    if (sfr_extraSegmentCount >= 1)
    {
      double v9 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
      do
      {
        *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
        *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
        sfr_extraSegments += 4;
      }
      while (sfr_extraSegments < v9);
    }
  }
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (CGPath)CGPath
{
  return (CGPath *)self->sfr_path;
}

- (BOOL)isTriangular
{
  int64_t v3 = [(TSDBezierPath *)self elementCount];
  if (v3)
  {
    int64_t v4 = v3;
    int64_t v5 = v3 - 1;
    if ([(TSDBezierPath *)self elementAtIndex:v3 - 1]) {
      int64_t v6 = v4;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    int64_t v6 = 0;
  }
  BOOL v7 = [(TSDBezierPath *)self isFlat];
  BOOL result = 0;
  if (v7 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v9 = 1;
    while ([(TSDBezierPath *)self elementAtIndex:v9] == 1)
    {
      if (v6 == ++v9)
      {
        uint64_t v10 = v6 - 1;
        goto LABEL_13;
      }
    }
    uint64_t v10 = v9 - 1;
LABEL_13:
    if ([(TSDBezierPath *)self elementAtIndex:v6 - 1] == 3) {
      uint64_t v11 = v10 + 1;
    }
    else {
      uint64_t v11 = v10;
    }
    BOOL result = 0;
    if (v6 == v11 + 1)
    {
      if (v10 != 3) {
        return 1;
      }
      double v15 = 0.0;
      double v16 = 0.0;
      double v13 = 0.0;
      double v14 = 0.0;
      [(TSDBezierPath *)self elementAtIndex:0 associatedPoints:&v15];
      [(TSDBezierPath *)self elementAtIndex:3 associatedPoints:&v13];
      if (v15 == v13 && v16 == v14) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)isDiamond
{
  int64_t v3 = [(TSDBezierPath *)self elementCount];
  if (!v3)
  {
    [(TSDBezierPath *)self isFlat];
    return 0;
  }
  int64_t v4 = v3;
  int64_t v5 = v3 - 1;
  if (![(TSDBezierPath *)self elementAtIndex:v3 - 1]) {
    int64_t v4 = v5;
  }
  BOOL v6 = [(TSDBezierPath *)self isFlat];
  BOOL result = 0;
  if (v6 && v4 == 5)
  {
    unint64_t v8 = -5;
    uint64_t v9 = 4;
    while ([(TSDBezierPath *)self elementAtIndex:v8 + 6] == 1)
    {
      if (++v8 == -1) {
        goto LABEL_13;
      }
    }
    if (v8 < 0xFFFFFFFFFFFFFFFELL) {
      return 0;
    }
    uint64_t v9 = v8 + 5;
LABEL_13:
    unint64_t v10 = [(TSDBezierPath *)self elementAtIndex:4];
    if (v9 != 3 || v10 == 3)
    {
      [(TSDBezierPath *)self bounds];
      CGFloat x = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
      double MidX = CGRectGetMidX(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      uint64_t v16 = 0;
      double MidY = (double)(unint64_t)CGRectGetMidY(v22);
      uint64_t v18 = v9 + 1;
      long long v19 = *MEMORY[0x263F00148];
      while (1)
      {
        long long v20 = v19;
        -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v16, &v20, v19);
        if (vabdd_f64((double)(unint64_t)MidX, *(double *)&v20) > 0.01
          && vabdd_f64(MidY, *((double *)&v20 + 1)) > 0.01)
        {
          break;
        }
        if (v18 == ++v16) {
          return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

- (BOOL)isRectangular
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  LODWORD(v3) = [(TSDBezierPath *)self isFlat];
  if (v3)
  {
    int64_t v3 = [(TSDBezierPath *)self elementCount];
    if (v3)
    {
      unint64_t v4 = v3;
      unint64_t v5 = v3 - 1;
      if ([(TSDBezierPath *)self elementAtIndex:v3 - 1]) {
        unint64_t v6 = v4;
      }
      else {
        unint64_t v6 = v5;
      }
      if (v6 < 5) {
        goto LABEL_7;
      }
      if (v6 <= 6)
      {
        uint64_t v9 = 1;
        while ([(TSDBezierPath *)self elementAtIndex:v9] == 1)
        {
          if (v6 == ++v9)
          {
            unint64_t v10 = v6 - 1;
            goto LABEL_19;
          }
        }
        unint64_t v10 = v9 - 1;
LABEL_19:
        unint64_t v11 = [(TSDBezierPath *)self elementAtIndex:v6 - 1];
        LOBYTE(v3) = 0;
        if (v11 == 3) {
          unint64_t v12 = v10 + 2;
        }
        else {
          unint64_t v12 = v10 + 1;
        }
        if (v11 == 3) {
          unint64_t v13 = v10 + 1;
        }
        else {
          unint64_t v13 = v10;
        }
        if (v6 == v12 && v13 >= 4)
        {
          [(TSDBezierPath *)self bounds];
          double x = v30.origin.x;
          double y = v30.origin.y;
          CGFloat width = v30.size.width;
          CGFloat height = v30.size.height;
          double MaxX = CGRectGetMaxX(v30);
          v31.origin.double x = x;
          v31.origin.double y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v31);
          unint64_t v20 = 0;
          CGRect v21 = (double *)v27;
          while (1)
          {
            [(TSDBezierPath *)self elementAtIndex:v20 associatedPoints:v21];
            if (vabdd_f64(x, *v21) >= 0.01 && vabdd_f64(MaxX, *v21) >= 0.01) {
              goto LABEL_7;
            }
            double v22 = v21[1];
            if (vabdd_f64(y, v22) >= 0.01 && vabdd_f64(MaxY, v22) >= 0.01) {
              goto LABEL_7;
            }
            ++v20;
            v21 += 2;
            if (v20 > v10)
            {
              uint64_t v23 = 0;
              BOOL v24 = 0;
              while (1)
              {
                float64x2_t v25 = vabdq_f64(v27[(v23 + 1) % (v10 + 1)], v27[v23]);
                if (v25.f64[0] > 0.01 != v25.f64[1] <= 0.01 || v23 && ((v24 ^ (v25.f64[0] > 0.01)) & 1) == 0) {
                  break;
                }
                ++v23;
                BOOL v24 = v25.f64[0] > 0.01;
                if (v23 == 4)
                {
                  LOBYTE(v3) = 1;
                  return v3;
                }
              }
              goto LABEL_7;
            }
          }
        }
      }
      else
      {
        id v7 = [(TSDBezierPath *)self bezierPathByRemovingRedundantElements];
        uint64_t v8 = [v7 elementCount];
        if (v8 >= [(TSDBezierPath *)self elementCount])
        {
LABEL_7:
          LOBYTE(v3) = 0;
          return v3;
        }
        LOBYTE(v3) = [v7 isRectangular];
      }
    }
  }
  return v3;
}

- (BOOL)isCircular
{
  v25[5] = *(double *)MEMORY[0x263EF8340];
  [(TSDBezierPath *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TSDBezierPath *)self elementCount];
  if (v11 >= 1)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    BOOL v14 = 0;
    double v15 = v4 + v8 * 0.5;
    double v16 = v6 + v10 * 0.5;
    while (1)
    {
      unint64_t v17 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, v24, *(_OWORD *)&v23);
      if (v17 == 2)
      {
        if (fabs(TSDPointLength((v25[2] - v15) / v8, (v25[3] - v16) / v10) + -0.5) > 0.0001) {
          return v14;
        }
        double v19 = TSDPointOnCurve(&v23, 0.5);
        double v21 = TSDPointLength((v19 - v15) / v8, (v20 - v16) / v10);
        uint64_t v18 = (float64x2_t *)v25;
        if (fabs(v21 + -0.5) > 0.0001) {
          return v14;
        }
      }
      else
      {
        uint64_t v18 = (float64x2_t *)v24;
        if (v17 == 1) {
          return v14;
        }
      }
      float64x2_t v23 = *v18;
      BOOL v14 = v12 <= ++v13;
      if (v12 == v13) {
        return v14;
      }
    }
  }
  return 1;
}

- (BOOL)isEmpty
{
  return self->sfr_elementCount == 0;
}

- (CGPoint)currentPoint
{
  if ([(TSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for line"];
  }
  double v3 = &self->sfr_head[6 * self->sfr_elementCount];
  double v4 = *(double *)&v3[-4];
  double v5 = *(double *)&v3[-2];
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGRect)controlPointBounds
{
  if ([(TSDBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for control point bounds"];
  }
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  if (*(unsigned char *)&sfr_bpFlags)
  {
    sfr_head = self->sfr_head;
    int64_t sfr_elementCount = self->sfr_elementCount;
    float64x2_t v9 = *(float64x2_t *)&sfr_head[2];
    if (sfr_elementCount < 2)
    {
      CGPoint v4 = *(CGPoint *)&sfr_head[2];
    }
    else
    {
      unint64_t v10 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      uint64_t v11 = sfr_head + 6;
      CGPoint v4 = (CGPoint)v9;
      do
      {
        if ((*(_DWORD *)v11 & 0xF) != 3 && ((*(_DWORD *)v11 & 0xF) != 0 || (unint64_t)&v11[6] < v10))
        {
          float64x2_t v13 = *(float64x2_t *)&v11[2];
          CGPoint v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v13, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v13);
          float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v9, v13), (int8x16_t)v9, (int8x16_t)v13);
        }
        v11 += 6;
      }
      while ((unint64_t)v11 < v10);
    }
    sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        double v16 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          float64x2_t v17 = *sfr_extraSegments;
          float64x2_t v18 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          float64x2_t v19 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v17, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v17);
          float64x2_t v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v9, v17), (int8x16_t)v9, (int8x16_t)v17);
          CGPoint v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v18, v19), (int8x16_t)v19, (int8x16_t)v18);
          float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v20, v18), (int8x16_t)v20, (int8x16_t)v18);
        }
        while (sfr_extraSegments < v16);
      }
    }
    self->sfr_controlPointBounds.origin = v4;
    float64x2_t size = vsubq_f64(v9, (float64x2_t)v4);
    self->sfr_controlPointBounds.float64x2_t size = (CGSize)size;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFFFE);
    double y = v4.y;
  }
  else
  {
    v4.double x = self->sfr_controlPointBounds.origin.x;
    double y = self->sfr_controlPointBounds.origin.y;
    float64x2_t size = (float64x2_t)self->sfr_controlPointBounds.size;
  }
  double v21 = size.f64[1];
  result.size.CGFloat width = size.f64[0];
  result.origin.double x = v4.x;
  result.size.CGFloat height = v21;
  result.origin.double y = y;
  return result;
}

- (CGRect)bounds
{
  if ((*(unsigned char *)&self->sfr_bpFlags & 4) != 0)
  {
    [(TSDBezierPath *)self controlPointBounds];
  }
  else
  {
    [(TSDBezierPath *)self _doPath];
    sfr_path = (const CGPath *)self->sfr_path;
    if (sfr_path) {
      return CGPathGetPathBoundingBox(sfr_path);
    }
    else {
      return *(CGRect *)*(void *)&MEMORY[0x263F001A8];
    }
  }
  return result;
}

- (BOOL)isFlat
{
  int64_t v3 = [(TSDBezierPath *)self elementCount];
  if (!v3) {
    return 1;
  }
  unint64_t v4 = v3;
  if ([(TSDBezierPath *)self elementAtIndex:0] == 2) {
    return 0;
  }
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (v4 == v6) {
      break;
    }
    unint64_t v8 = [(TSDBezierPath *)self elementAtIndex:v6];
    uint64_t v6 = v7 + 1;
  }
  while (v8 != 2);
  return v7 >= v4;
}

- (BOOL)isClockwise
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TSDBezierPath *)self elementCount];
  if (v3 < 1)
  {
    float v9 = 0.0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    char v6 = 0;
    double v7 = *MEMORY[0x263F00148];
    double v8 = *(double *)(MEMORY[0x263F00148] + 8);
    float v9 = 0.0;
    double v10 = v8;
    double v11 = *MEMORY[0x263F00148];
    do
    {
      switch([(TSDBezierPath *)self elementAtIndex:v5 associatedPoints:&v15])
      {
        case 0uLL:
          double v11 = v15;
          double v10 = v16;
          double v7 = v15;
          double v8 = v16;
          break;
        case 1uLL:
          if (v7 != v15 || v8 != v16) {
            float v9 = v7 * v16 - v8 * v15 + v9;
          }
          char v6 = 1;
          double v7 = v15;
          double v8 = v16;
          break;
        case 2uLL:
          NSLog((NSString *)@"Warning: Path should be flat. Illegal TSDCurveToBezierPathElement.");
          break;
        case 3uLL:
          BOOL v13 = v7 == v11 && v8 == v10;
          char v6 = 0;
          if (!v13) {
            float v9 = v7 * v10 - v8 * v11 + v9;
          }
          break;
        default:
          break;
      }
      ++v5;
    }
    while (v4 != v5);
    if (v6) {
      float v9 = v7 * v10 - v8 * v11 + v9;
    }
  }
  return v9 >= 0.0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v3 = 0.0;
  if (a3)
  {
    unint64_t v4 = [(TSDBezierPath *)self elementAtIndex:a3 allPoints:&v9];
    switch(v4)
    {
      case 3uLL:
        goto LABEL_5;
      case 2uLL:
        float v8 = 0.0;
        addifclose((uint64_t)&v9, &v8);
        return v8;
      case 1uLL:
LABEL_5:
        float v5 = (v10 - v12) * (v10 - v12) + (v9 - v11) * (v9 - v11);
        return sqrtf(v5);
    }
  }
  return v3;
}

- (void)calculateLengths
{
  self->sfr_totalLength = 0.0;
  uint64_t v3 = [(TSDBezierPath *)self elementCount];
  self->sfr_elementLength = (double *)NSZoneRealloc((NSZone *)[(TSDBezierPath *)self zone], self->sfr_elementLength, 8 * self->sfr_elementMax);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      [(TSDBezierPath *)self calculateLengthOfElement:i];
      self->sfr_elementLength[i] = v5;
      self->sfr_totalLength = v5 + self->sfr_totalLength;
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(TSDBezierPath *)self calculateLengths];
  }
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(TSDBezierPath *)self calculateLengths];
  }
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(TSDBezierPath *)self calculateLengths];
  }
  if (self->sfr_elementCount < a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPath.m", 1490, @"Invalid parameter not satisfying: %@", @"e <= sfr_elementCount");
  }
  if (a3 < 1) {
    return 0.0;
  }
  sfr_elementLength = self->sfr_elementLength;
  double result = 0.0;
  do
  {
    double v8 = *sfr_elementLength++;
    double result = result + v8;
    --a3;
  }
  while (a3);
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (unint64_t)elementAtIndex:(int64_t)a3
{
  return [(TSDBezierPath *)self elementAtIndex:a3 associatedPoints:0];
}

- (unint64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  if (a3 < 0 || self->sfr_elementCount <= a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578], @"%@: index (%ld) beyond bounds (%ld)", NSStringFromSelector(a2), a3, self->sfr_elementCount format];
  }
  sfr_head = self->sfr_head;
  double v8 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(void *)v8 & 0xFLL) == 2)
    {
      double v9 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(void *)v8 >> 4));
      *a4 = *v9;
      a4[1] = v9[1];
      a4 += 2;
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(void *)v8 & 0xFLL;
}

- (unint64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  if (a3 < 0 || self->sfr_elementCount <= a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578], @"%@: index (%ld) beyond bounds (%ld)", NSStringFromSelector(a2), a3, self->sfr_elementCount format];
  }
  sfr_head = self->sfr_head;
  double v8 = &sfr_head[6 * a3];
  if (a4)
  {
    unint64_t v9 = *(void *)v8;
    if ((*(void *)v8 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      unint64_t v9 = *(void *)v8;
    }
    if ((v9 & 0xF) != 0)
    {
      if ((v9 & 0xF) == 2)
      {
        double v10 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v9 >> 4));
        a4[1] = *v10;
        a4[2] = v10[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(void *)v8 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  if (a4 < 0 || self->sfr_elementCount <= a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578], @"%@: index (%ld) beyond bounds (%ld)", NSStringFromSelector(a2), a4, self->sfr_elementCount format];
  }
  sfr_head = self->sfr_head;
  if ((*(void *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    double v8 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(void *)&sfr_head[6 * a4] >> 4));
    CGPoint *v8 = *a3;
    CGPoint v9 = a3[1];
    a3 += 2;
    v8[1] = v9;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (void)_appendToPath:(id)a3
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    char v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "curveToPoint:controlPoint1:controlPoint2:", *(double *)&sfr_head[2], *(double *)&sfr_head[4], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]);
          sfr_extraSegments += 4;
          break;
        case 3:
          [a3 closePath];
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
}

- (void)appendBezierPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    [a3 _appendToPath:self];
  }
  else
  {
    uint64_t v6 = [a3 elementCount];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        switch([a3 elementAtIndex:i associatedPoints:&v9])
        {
          case 0:
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
            break;
          case 1:
            -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
            break;
          case 2:
            -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
            break;
          case 3:
            [(TSDBezierPath *)self closePath];
            break;
          default:
            continue;
        }
      }
    }
  }
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[TSDBezierPath moveToPoint:](self, "moveToPoint:");
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v13));
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetMaxX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v15));
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v17));

  [(TSDBezierPath *)self closePath];
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4 = a4 - 1;
  if (a4 >= 1)
  {
    if ([(TSDBezierPath *)self isEmpty] || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100) {
      -[TSDBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    }
    else {
      -[TSDBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    }
    if ((unint64_t)a4 >= 2)
    {
      p_CGFloat y = &a3[1].y;
      do
      {
        -[TSDBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
        p_y += 2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  double v8 = objc_alloc_init(TSDBezierPath);
  -[TSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0, -45.0, 315.0);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v18);
  *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&v16.tx;
  CGAffineTransformTranslate(&v16, &v15, MidX, MidY);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v11 = CGRectGetWidth(v19) * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v12 = CGRectGetHeight(v20);
  CGAffineTransform v14 = v16;
  CGAffineTransformScale(&v15, &v14, v11, v12 * 0.5);
  CGAffineTransform v16 = v15;
  [(TSDBezierPath *)v8 transformUsingAffineTransform:&v15];
  [(TSDBezierPath *)self appendBezierPath:v8];
}

- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  __double2 v12 = __sincos_stret((a6 - a5) * 0.5);
  double v13 = (1.0 - v12.__cosval) * 4.0 / (v12.__sinval * 3.0);
  __double2 v14 = __sincos_stret(a5);
  double v15 = v13 * a4;
  double v16 = x + a4 * v14.__cosval - v13 * a4 * v14.__sinval;
  double v17 = y + a4 * v14.__sinval + v13 * a4 * v14.__cosval;
  __double2 v18 = __sincos_stret(a6);

  -[TSDBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", x + a4 * v18.__cosval, y + a4 * v18.__sinval, v16, v17, x + a4 * v18.__cosval + v15 * v18.__sinval, y + a4 * v18.__sinval - v15 * v18.__cosval);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y = a3.y;
  double x = a3.x;
  if (__fpclassifyd(a5) < 3 || __fpclassifyd(a6) <= 2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@: illegal angle argument", NSStringFromSelector(a2) format];
  }
  double v15 = a5 * 3.14159265 / 180.0;
  double v16 = a6 * 3.14159265;
  __double2 v17 = __sincos_stret(v15);
  double v18 = x + a4 * v17.__cosval;
  double v19 = y + a4 * v17.__sinval;
  if ([(TSDBezierPath *)self isEmpty]) {
    -[TSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v18, v19);
  }
  else {
    -[TSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v18, v19);
  }
  double v20 = v16 / 180.0;
  if (a7)
  {
    for (; v15 < v20; double v15 = v15 + 6.28318531)
      ;
    double v21 = v15 - v20;
    if (v15 - v20 > 1.57079633)
    {
      do
      {
        double v22 = v15 + -1.57079633;
        -[TSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + -1.57079633);
        double v21 = v22 - v20;
        double v15 = v15 + -1.57079633;
      }
      while (v22 - v20 > 1.57079633);
      goto LABEL_19;
    }
LABEL_18:
    double v22 = v15;
    goto LABEL_19;
  }
  for (; v20 < v15; double v20 = v20 + 6.28318531)
    ;
  double v21 = v20 - v15;
  if (v20 - v15 <= 1.57079633) {
    goto LABEL_18;
  }
  do
  {
    double v22 = v15 + 1.57079633;
    -[TSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + 1.57079633);
    double v21 = v20 - v22;
    double v15 = v15 + 1.57079633;
  }
  while (v20 - v22 > 1.57079633);
LABEL_19:
  if (v21 > 0.0)
  {
    -[TSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v22, v20);
  }
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6
{
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  CGFloat v37 = *(double *)(MEMORY[0x263F000D0] + 8);
  CGFloat v38 = *MEMORY[0x263F000D0];
  CGFloat v35 = *(double *)(MEMORY[0x263F000D0] + 24);
  CGFloat v36 = *(double *)(MEMORY[0x263F000D0] + 16);
  CGFloat v33 = *(double *)(MEMORY[0x263F000D0] + 40);
  CGFloat v34 = *(double *)(MEMORY[0x263F000D0] + 32);
  [(TSDBezierPath *)self currentPoint];
  double v13 = v11;
  double v14 = v12;
  if (v11 == v9 && v12 == v8)
  {
    double v17 = v9 - v11;
    double v16 = v8 - v12;
    double v18 = 0.0;
    double v30 = 0.0;
  }
  else
  {
    double v30 = a5;
    double v16 = v8 - v12;
    double v17 = v9 - v11;
    double v18 = atan2(v8 - v12, v17);
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tdouble x = v34;
  v39.tdouble y = v33;
  CGAffineTransformRotate(&v40, &v39, -v18);
  double v19 = v40.tx + v16 * v40.c + v40.a * v17;
  double v20 = v40.ty + v16 * v40.d + v40.b * v17;
  double v32 = v14;
  double v21 = v40.tx + (y - v14) * v40.c + v40.a * (x - v13);
  double v22 = v40.ty + (y - v14) * v40.d + v40.b * (x - v13);
  BOOL v23 = v19 == v21 && v20 == v22;
  double v24 = 0.0;
  if (!v23) {
    double v24 = 3.14159265 - fabs(atan2(v22 - v20, v21 - v19));
  }
  double v25 = sin(v24 * 0.5);
  double v31 = v13;
  if (v25 == 0.0)
  {
    double v26 = 0.0;
    double v27 = v20;
    double v28 = 0.0;
    double v29 = 0.0;
  }
  else
  {
    double v19 = v19 - v30 * fabs(cos(v24 * 0.5) / v25);
    if (v22 <= v20)
    {
      double v27 = -v30;
      double v29 = v24 + -1.57079633;
      double v26 = 1.57079633;
    }
    else
    {
      double v29 = 1.57079633 - v24;
      double v26 = -1.57079633;
      double v27 = v30;
    }
    double v28 = v30;
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tdouble x = v34;
  v39.tdouble y = v33;
  CGAffineTransformRotate(&v40, &v39, v18);
  -[TSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v40.tx + v27 * v40.c + v40.a * v19, v32 + v40.ty + v27 * v40.d + v40.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ((containsPoint__doWindingRule & 1) == 0) {
    containsPoint__doWindingRule = 1;
  }
  [(TSDBezierPath *)self _doPath];
  sfr_path = (const CGPath *)self->sfr_path;
  if (!sfr_path) {
    return 0;
  }
  BOOL v7 = [(TSDBezierPath *)self windingRule] == 1;
  CGFloat v8 = x;
  CGFloat v9 = y;

  return CGPathContainsPoint(sfr_path, 0, *(CGPoint *)&v8, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    unint64_t v5 = [(TSDBezierPath *)self windingRule];
    unint64_t v6 = [(TSDBezierPath *)self lineCapStyle];
    unint64_t v7 = [(TSDBezierPath *)self lineJoinStyle];
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      double v11 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
      NSUInteger v13 = 9 * (sfr_elementCount + 2 * self->sfr_extraSegmentCount);
      double v14 = (char *)NSZoneMalloc((NSZone *)[(TSDBezierPath *)self zone], v13);
      double v15 = v14;
      do
      {
        uint64_t v16 = *(void *)sfr_head;
        if ((*(void *)sfr_head & 0xFLL) == 2)
        {
          *double v15 = 2;
          *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*sfr_extraSegments));
          v15[9] = 2;
          *(int8x8_t *)(v15 + 10) = vrev32_s8((int8x8_t)vcvt_f32_f64(sfr_extraSegments[1]));
          v15 += 18;
          sfr_extraSegments += 2;
          uint64_t v16 = *(void *)sfr_head;
        }
        *double v15 = v16 & 0xF;
        *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*(float64x2_t *)&sfr_head[2]));
        v15 += 9;
        sfr_head += 6;
      }
      while (sfr_head < v11);
      [a3 encodeBytes:v14 length:v13 forKey:@"TSDSegments"];
      NSZoneFree((NSZone *)[(TSDBezierPath *)self zone], v14);
    }
    if (v5)
    {
      *(float *)&double v8 = (float)v5;
      [a3 encodeFloat:@"TSDWindingRule" forKey:v8];
    }
    if (v6)
    {
      *(float *)&double v8 = (float)v6;
      [a3 encodeFloat:@"TSDCapStyle" forKey:v8];
    }
    if (v7)
    {
      *(float *)&double v8 = (float)v7;
      [a3 encodeFloat:@"TSDJoinStyle" forKey:v8];
    }
    if (self->sfr_lineWidth != 1.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"TSDLineWidth");
    }
    if (self->sfr_miterLimit != 10.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"TSDMiterLimit");
    }
    if (self->sfr_flatness != 0.6) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"TSDFlatness");
    }
    if (self->sfr_dashedLineCount)
    {
      [a3 encodeDouble:@"TSDDashPhase" forKey:self->sfr_dashedLinePhase];
      NSUInteger v17 = 4 * self->sfr_dashedLineCount;
      double v18 = NSZoneMalloc((NSZone *)[(TSDBezierPath *)self zone], v17);
      double v19 = v18;
      int64_t sfr_dashedLineCount = self->sfr_dashedLineCount;
      if (sfr_dashedLineCount >= 1)
      {
        sfr_dashedLinePattern = self->sfr_dashedLinePattern;
        double v22 = v18;
        do
        {
          double v23 = *sfr_dashedLinePattern++;
          *(float *)&unsigned int v24 = v23;
          *v22++ = bswap32(v24);
          --sfr_dashedLineCount;
        }
        while (sfr_dashedLineCount);
      }
      [a3 encodeBytes:v18 length:v17 forKey:@"TSDDashPatterns"];
      double v25 = (NSZone *)[(TSDBezierPath *)self zone];
      NSZoneFree(v25, v19);
    }
  }
  else
  {
    float v53 = (float)(self->sfr_elementCount + 2 * self->sfr_extraSegmentCount);
    int v52 = [(TSDBezierPath *)self windingRule];
    int v51 = [(TSDBezierPath *)self lineCapStyle];
    int v50 = [(TSDBezierPath *)self lineJoinStyle];
    float sfr_lineWidth = self->sfr_lineWidth;
    double sfr_flatness = self->sfr_flatness;
    float sfr_miterLimit = self->sfr_miterLimit;
    float v48 = sfr_miterLimit;
    float v49 = sfr_lineWidth;
    float v29 = sfr_flatness;
    float v46 = (float)self->sfr_dashedLineCount;
    float v47 = v29;
    [a3 encodeValueOfObjCType:"i" at:&v53];
    int64_t v30 = self->sfr_elementCount;
    if (v30 >= 1)
    {
      double v31 = self->sfr_head;
      double v32 = &v31[6 * v30];
      CGFloat v33 = (double *)self->sfr_extraSegments;
      do
      {
        char v45 = *(unsigned char *)v31 & 0xF;
        if (v45 == 2)
        {
          float v34 = *v33;
          float v35 = v33[1];
          float v43 = v35;
          float v44 = v34;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v45, &v44, &v43);
          float v36 = v33[2];
          float v37 = v33[3];
          float v43 = v37;
          float v44 = v36;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v45, &v44, &v43);
          v33 += 4;
        }
        float v38 = *(double *)&v31[2];
        float v39 = *(double *)&v31[4];
        float v43 = v39;
        float v44 = v38;
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v45, &v44, &v43);
        v31 += 6;
      }
      while (v31 < v32);
    }
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iiifffi", &v52, &v51, &v50, &v49, &v48, &v47, &v46);
    if (self->sfr_dashedLineCount)
    {
      float sfr_dashedLinePhase = self->sfr_dashedLinePhase;
      float v44 = sfr_dashedLinePhase;
      [a3 encodeValueOfObjCType:"f" at:&v44];
      if ((uint64_t)self->sfr_dashedLineCount >= 1)
      {
        int64_t v41 = 0;
        do
        {
          float v42 = self->sfr_dashedLinePattern[v41];
          float v44 = v42;
          [a3 encodeValueOfObjCType:"f" at:&v44];
          ++v41;
        }
        while (v41 < (int64_t)self->sfr_dashedLineCount);
      }
    }
  }
}

- (TSDBezierPath)initWithCoder:(id)a3
{
  int64_t v4 = [(TSDBezierPath *)self init];
  if (![a3 allowsKeyedCoding])
  {
    LODWORD(v46) = 0;
    char v45 = 0;
    float v44 = 0.0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v12 = [a3 versionForClassName:@"TSDBezierPath"];
    [a3 decodeValueOfObjCType:"i" at:&v46];
    if (v46)
    {
      unsigned int v13 = 0;
      do
      {
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v45, &v44, (char *)&v43 + 4);
        double v14 = v44;
        double v15 = *((float *)&v43 + 1);
        switch(v45)
        {
          case 0:
            -[TSDBezierPath moveToPoint:](v4, "moveToPoint:", v44, *((float *)&v43 + 1));
            break;
          case 1:
            -[TSDBezierPath lineToPoint:](v4, "lineToPoint:", v44, *((float *)&v43 + 1));
            break;
          case 2:
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v45, &v44, (char *)&v43 + 4);
            double v16 = v44;
            double v17 = *((float *)&v43 + 1);
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v45, &v44, (char *)&v43 + 4);
            v13 += 2;
            -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", v44, *((float *)&v43 + 1), v14, v15, v16, v17);
            break;
          case 3:
            [(TSDBezierPath *)v4 closePath];
            break;
          default:
            break;
        }
        ++v13;
      }
      while (v13 < v46);
    }
    if (v12 > 523)
    {
      float sfr_lineWidth = v4->sfr_lineWidth;
      double sfr_flatness = v4->sfr_flatness;
      float sfr_miterLimit = v4->sfr_miterLimit;
      float v40 = sfr_miterLimit;
      float v41 = sfr_lineWidth;
      float v21 = sfr_flatness;
      float sfr_dashedLineCount = (float)v4->sfr_dashedLineCount;
      float v39 = v21;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifffi", &v43, &v42, (char *)&v42 + 4, &v41, &v40, &v39, &sfr_dashedLineCount);
      [(TSDBezierPath *)v4 setWindingRule:v43];
      [(TSDBezierPath *)v4 setLineCapStyle:v42];
      [(TSDBezierPath *)v4 setLineJoinStyle:HIDWORD(v42)];
      v4->float sfr_lineWidth = v41;
      double v22 = v39;
      v4->float sfr_miterLimit = v40;
      v4->double sfr_flatness = v22;
      unint64_t v23 = (unint64_t)sfr_dashedLineCount;
      v4->float sfr_dashedLineCount = (unint64_t)sfr_dashedLineCount;
      if (v23)
      {
        float v37 = 0.0;
        [a3 decodeValueOfObjCType:"f" at:&v37];
        v4->float sfr_dashedLinePhase = v37;
        v4->sfr_dashedLinePattern = (double *)NSZoneMalloc((NSZone *)[(TSDBezierPath *)v4 zone], 8 * v4->sfr_dashedLineCount);
        if (v4->sfr_dashedLineCount)
        {
          unint64_t v24 = 0;
          do
          {
            [a3 decodeValueOfObjCType:"f" at:&v37];
            v4->sfr_dashedLinePattern[v24++] = v37;
          }
          while (v24 < v4->sfr_dashedLineCount);
        }
      }
    }
    else
    {
      float v41 = 0.0;
      LOBYTE(v40) = 0;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifc", &v43, &v42, (char *)&v42 + 4, &v41, &v40);
      v4->float sfr_lineWidth = v41;
      [(TSDBezierPath *)v4 setWindingRule:v43];
      [(TSDBezierPath *)v4 setLineCapStyle:v42];
      [(TSDBezierPath *)v4 setLineJoinStyle:HIDWORD(v42)];
    }
    return v4;
  }
  unint64_t v46 = 0;
  unint64_t v5 = [a3 decodeBytesForKey:@"TSDSegments" returnedLength:&v46];
  if (!v5) {
    goto LABEL_38;
  }
  if (!v46) {
    goto LABEL_38;
  }
  unint64_t v6 = v5 + v46;
  if (v5 >= v5 + v46) {
    goto LABEL_38;
  }
  while (v5 + 1 <= v6)
  {
    if (v5 + 5 > v6) {
      break;
    }
    unint64_t v7 = (int8x8_t *)(v5 + 9);
    if (v5 + 9 > v6) {
      break;
    }
    float v8 = COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 1)));
    float v9 = COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 5)));
    switch(*(unsigned char *)v5)
    {
      case 0:
        -[TSDBezierPath moveToPoint:](v4, "moveToPoint:", v8, v9);
        break;
      case 1:
        -[TSDBezierPath lineToPoint:](v4, "lineToPoint:", v8, v9);
        break;
      case 2:
        unint64_t v7 = (int8x8_t *)(v5 + 14);
        if (v5 + 14 <= v6)
        {
          if (v5 + 18 <= v6)
          {
            unint64_t v7 = (int8x8_t *)(v5 + 19);
            double v10 = (int8x8_t *)(v5 + 23);
            if (v5 + 23 <= v6)
            {
              double v11 = (int8x8_t *)(v5 + 27);
              if (v5 + 27 <= v6)
              {
                -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", vcvtq_f64_f32((float32x2_t)vrev32_s8(*v7)), v8, v9, COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 10))), COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 14))));
                unint64_t v7 = v11;
              }
              else
              {
                NSLog((NSString *)@"ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit ");
                unint64_t v7 = v10;
              }
              break;
            }
          }
        }
        else
        {
          unint64_t v7 = (int8x8_t *)(v5 + 10);
        }
        NSLog((NSString *)@"ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit ");
        break;
      case 3:
        [(TSDBezierPath *)v4 closePath];
        break;
      default:
        break;
    }
    unint64_t v5 = (unint64_t)v7;
    if ((unint64_t)v7 >= v6) {
      goto LABEL_38;
    }
  }
  NSLog((NSString *)@"ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit ");
LABEL_38:
  -[TSDBezierPath setWindingRule:](v4, "setWindingRule:", (int)[a3 decodeInt32ForKey:@"TSDWindingRule"]);
  -[TSDBezierPath setLineCapStyle:](v4, "setLineCapStyle:", (int)[a3 decodeInt32ForKey:@"TSDCapStyle"]);
  -[TSDBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", (int)[a3 decodeInt32ForKey:@"TSDJoinStyle"]);
  int v25 = [a3 containsValueForKey:@"TSDLineWidth"];
  double v26 = 1.0;
  if (v25) {
    objc_msgSend(a3, "decodeDoubleForKey:", @"TSDLineWidth", 1.0);
  }
  v4->float sfr_lineWidth = v26;
  int v27 = [a3 containsValueForKey:@"TSDMiterLimit"];
  double v28 = 10.0;
  if (v27) {
    objc_msgSend(a3, "decodeDoubleForKey:", @"TSDMiterLimit", 10.0);
  }
  v4->float sfr_miterLimit = v28;
  if ([a3 containsValueForKey:@"TSDFlatness"]) {
    [a3 decodeDoubleForKey:@"TSDFlatness"];
  }
  else {
    uint64_t v29 = 0x3FE3333333333333;
  }
  *(void *)&v4->double sfr_flatness = v29;
  uint64_t v30 = [a3 decodeBytesForKey:@"TSDDashPatterns" returnedLength:&v46];
  if (v30)
  {
    if (v46)
    {
      double v31 = (unsigned int *)v30;
      unint64_t v32 = v30 + v46;
      v4->float sfr_dashedLineCount = v46 >> 2;
      [a3 decodeDoubleForKey:@"TSDDashPhase"];
      v4->float sfr_dashedLinePhase = v33;
      float v34 = (double *)NSZoneMalloc((NSZone *)[(TSDBezierPath *)v4 zone], 8 * v4->sfr_dashedLineCount);
      v4->sfr_dashedLinePattern = v34;
      if ((unint64_t)v31 < v32)
      {
        while (1)
        {
          float v35 = v31 + 1;
          if ((unint64_t)(v31 + 1) > v32) {
            break;
          }
          *v34++ = COERCE_FLOAT(bswap32(*v31++));
          if ((unint64_t)v35 >= v32) {
            return v4;
          }
        }
        NSLog((NSString *)@"ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit ");
      }
    }
  }
  return v4;
}

- (const)cString
{
  *(void *)&v17[255] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF990] data];
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        float v8 = &v16;
        size_t v9 = 256;
      }
      else
      {
        char v16 = 32;
        float v8 = v17;
        size_t v9 = 255;
      }
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          int v10 = snprintf(v8, v9, "M %f %f");
          goto LABEL_12;
        case 1:
          int v10 = snprintf(v8, v9, "L %f %f");
          goto LABEL_12;
        case 2:
          int v10 = snprintf(v8, v9, "C %f %f %f %f %f %f", *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          sfr_extraSegments += 4;
          goto LABEL_12;
        case 3:
          char *v8 = 90;
          int v10 = 1;
LABEL_12:
          if (v10 < 1 || v10 >= (int)v9) {
            goto LABEL_17;
          }
          [v3 appendBytes:&v16 length:&v8[v10] - &v16];
          sfr_head += 6;
          if (sfr_head >= v6) {
            break;
          }
          continue;
        default:
          double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v12 = [NSString stringWithUTF8String:"-[TSDBezierPath cString]"];
          objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"), 2252, @"Unhandled path element type");
LABEL_17:
          unsigned int v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v14 = [NSString stringWithUTF8String:"-[TSDBezierPath cString]"];
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"), 2261, @"buffer too small for path element string");
          goto LABEL_18;
      }
      break;
    }
  }
LABEL_18:
  char v16 = 0;
  [v3 appendBytes:&v16 length:1];
  return (const char *)[v3 bytes];
}

- (TSDBezierPath)initWithCString:(const char *)a3
{
  int64_t v4 = [(TSDBezierPath *)self init];
  unint64_t v5 = v4;
  if (a3)
  {
    if (v4)
    {
      if (*a3)
      {
        char v29 = 0;
        int v28 = 0;
        if (sscanf(a3, " %c%n", &v29, &v28) >= 1)
        {
          do
          {
            unint64_t v6 = &a3[v28];
            int v28 = 0;
            uint64_t v26 = 0;
            uint64_t v27 = 0;
            uint64_t v25 = 0;
            if (v29 > 98)
            {
              if (v29 > 108)
              {
                if (v29 == 122) {
                  goto LABEL_28;
                }
                if (v29 == 113)
                {
LABEL_29:
                  int v7 = sscanf(v6, " %g %g %g %g%n", (char *)&v27 + 4, &v27, (char *)&v26 + 4, &v26, &v28);
                  float v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                  uint64_t v9 = [NSString stringWithUTF8String:"-[TSDBezierPath initWithCString:]"];
                  uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"];
                  if (v7 == 4)
                  {
                    [v8 handleFailureInFunction:v9 file:v10 lineNumber:2313 description:@"kCGPathElementAddQuadCurveToPoint not supported yet"];
                    -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", *((float *)&v27 + 1), *(float *)&v27);
                  }
                  else
                  {
                    [v8 handleFailureInFunction:v9 file:v10 lineNumber:2317 description:@"Could not read bezier quad curve-to elmt"];
                  }
                  goto LABEL_37;
                }
                if (v29 != 109)
                {
LABEL_32:
                  uint64_t v18 = [MEMORY[0x263F7C7F0] currentHandler];
                  uint64_t v19 = [NSString stringWithUTF8String:"-[TSDBezierPath initWithCString:]"];
                  uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"];
                  uint64_t v14 = (void *)v18;
                  uint64_t v15 = v19;
                  uint64_t v16 = 2338;
                  double v17 = @"Bezier path string contained unknown elmt.";
                  goto LABEL_35;
                }
LABEL_24:
                if (sscanf(v6, " %g %g%n", (char *)&v27 + 4, &v27, &v28) != 2)
                {
                  uint64_t v20 = [MEMORY[0x263F7C7F0] currentHandler];
                  uint64_t v21 = [NSString stringWithUTF8String:"-[TSDBezierPath initWithCString:]"];
                  uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"];
                  uint64_t v14 = (void *)v20;
                  uint64_t v15 = v21;
                  uint64_t v16 = 2298;
                  double v17 = @"Could not read bezier movement elmt";
                  goto LABEL_35;
                }
                -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", *((float *)&v27 + 1), *(float *)&v27);
                goto LABEL_37;
              }
              if (v29 == 99)
              {
LABEL_26:
                if (sscanf(v6, " %g %g %g %g %g %g%n", (char *)&v26 + 4, &v26, (char *)&v25 + 4, &v25, (char *)&v27 + 4, &v27, &v28) != 6)
                {
                  uint64_t v22 = [MEMORY[0x263F7C7F0] currentHandler];
                  uint64_t v23 = [NSString stringWithUTF8String:"-[TSDBezierPath initWithCString:]"];
                  uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"];
                  uint64_t v14 = (void *)v22;
                  uint64_t v15 = v23;
                  uint64_t v16 = 2326;
                  double v17 = @"Could not read bezier curve-to elmt";
                  goto LABEL_35;
                }
                -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", *((float *)&v27 + 1), *(float *)&v27, *((float *)&v26 + 1), *(float *)&v26, *((float *)&v25 + 1), *(float *)&v25);
                goto LABEL_37;
              }
              if (v29 == 101) {
                goto LABEL_37;
              }
              if (v29 != 108) {
                goto LABEL_32;
              }
            }
            else
            {
              if (v29 > 76)
              {
                if (v29 != 77)
                {
                  if (v29 == 81) {
                    goto LABEL_29;
                  }
                  if (v29 != 90) {
                    goto LABEL_32;
                  }
LABEL_28:
                  [(TSDBezierPath *)v5 closePath];
                  goto LABEL_37;
                }
                goto LABEL_24;
              }
              if (v29 == 67) {
                goto LABEL_26;
              }
              if (v29 == 69) {
                goto LABEL_37;
              }
              if (v29 != 76) {
                goto LABEL_32;
              }
            }
            if (sscanf(v6, " %g %g%n", (char *)&v27 + 4, &v27, &v28) != 2)
            {
              uint64_t v11 = [MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v12 = [NSString stringWithUTF8String:"-[TSDBezierPath initWithCString:]"];
              uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"];
              uint64_t v14 = (void *)v11;
              uint64_t v15 = v12;
              uint64_t v16 = 2307;
              double v17 = @"Could not read bezier line path elmt";
LABEL_35:
              [v14 handleFailureInFunction:v15 file:v13 lineNumber:v16 description:v17];
              goto LABEL_37;
            }
            -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", *((float *)&v27 + 1), *(float *)&v27);
LABEL_37:
            a3 = &v6[v28];
          }
          while (sscanf(a3, " %c%n", &v29, &v28) > 0);
        }
      }
    }
  }
  return v5;
}

- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount == self->sfr_elementMax)
  {
    self->sfr_elementMaCGFloat x = 2 * sfr_elementCount + 10;
    uint64_t v9 = (PATHSEGMENT *)NSZoneRealloc((NSZone *)[(TSDBezierPath *)self zone], self->sfr_head, 24 * self->sfr_elementMax);
    if (v9) {
      self->sfr_head = v9;
    }
    else {
      NSLog((NSString *)@"ERROR: TSDBezierPath _addPathSegment. sfr_head could not NSZoneRealloc. No memory");
    }
    if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) != 0)
    {
      uint64_t v10 = (double *)NSZoneRealloc((NSZone *)[(TSDBezierPath *)self zone], self->sfr_elementLength, 8 * self->sfr_elementMax);
      if (v10) {
        self->sfr_elementLength = v10;
      }
      else {
        NSLog((NSString *)@"ERROR: TSDBezierPath _addPathSegment. sfr_elementLength could not NSZoneRealloc. No memory");
      }
    }
  }
  *(void *)&self->sfr_head[6 * self->sfr_elementCount] = *(void *)&self->sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
  *(void *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
  int64_t v11 = self->sfr_elementCount;
  uint64_t v12 = &self->sfr_head[6 * v11];
  *(CGFloat *)&v12[2] = x;
  *(CGFloat *)&v12[4] = y;
  self->int64_t sfr_elementCount = v11 + 1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
  if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    [(TSDBezierPath *)self lengthOfElement:self->sfr_elementCount - 1];
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_head = self->sfr_head;
    int64_t v6 = self->sfr_elementCount - 1;
    if ((*(unsigned char *)&sfr_head[6 * v6] & 0xF) == 0) {
      goto LABEL_6;
    }
  }
  else if (v4 == 1)
  {
    sfr_head = self->sfr_head;
    int64_t v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  int64_t v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndeCGFloat x = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v7 = a4.y;
  CGFloat v8 = a4.x;
  -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    self->sfr_extraSegmentMaCGFloat x = 2 * sfr_extraSegmentCount + 10;
    int64_t v11 = NSZoneRealloc((NSZone *)[(TSDBezierPath *)self zone], self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
    if (v11) {
      self->sfr_extraSegments = v11;
    }
    else {
      NSLog((NSString *)@"ERROR: TSDBezierPath _deviceCurveToPoint sfr_extraSegments could not NSZoneRealloc. No memory");
    }
  }
  int64_t v12 = self->sfr_extraSegmentCount;
  uint64_t v13 = (CGFloat *)((char *)self->sfr_extraSegments + 32 * v12);
  *uint64_t v13 = v8;
  v13[1] = v7;
  v13[2] = x;
  _OWORD v13[3] = y;
  self->int64_t sfr_extraSegmentCount = v12 + 1;
  uint64_t v14 = &self->sfr_head[6 * self->sfr_elementCount];
  *(void *)&v14[-6] = *(void *)&v14[-6] & 0xFLL | (16 * v12);
  LODWORD(v14) = self->sfr_bpFlags;
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(v14 & 0xFFFFFCFB | 0x200);
  if (((unsigned __int16)v14 & 0x400) != 0)
  {
    [(TSDBezierPath *)self lengthOfElement:self->sfr_elementCount - 1];
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    sfr_lastSubpathIndeCGFloat x = self->sfr_lastSubpathIndex;
    if (sfr_lastSubpathIndex < 0)
    {
      int v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDBezierPath(TSDBezierPathDevicePrimitives) _deviceClosePath]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"), 2475, @"Invalid parameter not satisfying: %s", "sfr_lastSubpathIndex >= 0");
      sfr_lastSubpathIndeCGFloat x = self->sfr_lastSubpathIndex;
    }
    -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 2], *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 4]);
    int64_t v6 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v6[2], *(double *)&v6[4]);
    self->sfr_lastSubpathIndeCGFloat x = self->sfr_elementCount - 1;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"TSDBezierPath <%p>", self);
  if (![(TSDBezierPath *)self isEmpty])
  {
    [(TSDBezierPath *)self bounds];
    [v3 appendFormat:@"\n  Bounds: %@", NSStringFromCGRect(v16)];
    [(TSDBezierPath *)self controlPointBounds];
    [v3 appendFormat:@"\n  Control point bounds: %@", NSStringFromCGRect(v17)];
    uint64_t v4 = [(TSDBezierPath *)self elementCount];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        switch([(TSDBezierPath *)self elementAtIndex:i associatedPoints:v12])
        {
          case 0uLL:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f moveto", v12[0], v8, v9, v10, v11);
            break;
          case 1uLL:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f lineto", v12[0], v8, v9, v10, v11);
            break;
          case 2uLL:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f %f %f %f %f curveto", v12[0], v12[1], v13, v14);
            break;
          case 3uLL:
            [v3 appendString:@"\n    closepath"];
            break;
          default:
            continue;
        }
      }
    }
  }
  return v3;
}

- (double)yValueFromXValue:(double)a3 elementIndex:(int64_t *)a4 parametricValue:(double *)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  double v11 = *MEMORY[0x263F00148];
  double v10 = *(double *)(MEMORY[0x263F00148] + 8);
  int64_t v12 = 1;
  if ([(TSDBezierPath *)self elementCount] < 2)
  {
    double v13 = v11;
    double v14 = v10;
  }
  else
  {
    do
    {
      double v13 = v11;
      double v14 = v10;
      switch([(TSDBezierPath *)self elementAtIndex:v12 associatedPoints:&v49])
      {
        case 0uLL:
          double v11 = v49;
          double v10 = v50;
          break;
        case 1uLL:
          double v11 = v49;
          double v10 = v50;
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPathAdditions.mm", 71, @"Don't use LineTo!");
          break;
        case 2uLL:
          double v11 = v53;
          double v10 = v54;
          break;
        case 3uLL:
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPathAdditions.mm", 77, @"Don't use ClosePath!");
          break;
        default:
          break;
      }
      if (v13 <= a3 && v11 >= a3) {
        break;
      }
      ++v12;
    }
    while (v12 < [(TSDBezierPath *)self elementCount]);
  }
  if (v13 == v11)
  {
    if (v13 != a3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPathAdditions.mm", 88, @"something went wrong!");
    }
    if (v14 != v10) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPathAdditions.mm", 89, @"something is wrong with the curve!");
    }
  }
  else if (v13 >= a3)
  {
    if (a4) {
      *a4 = v12 - 1;
    }
    if (a5) {
      *a5 = 0.0;
    }
    return v14;
  }
  else if (v11 <= a3)
  {
    if (a4)
    {
      if ([(TSDBezierPath *)self elementCount] <= v12) {
        int64_t v12 = [(TSDBezierPath *)self elementCount] - 1;
      }
      *a4 = v12;
    }
    if (a5) {
      *a5 = 1.0;
    }
  }
  else
  {
    if (a4)
    {
      if ([(TSDBezierPath *)self elementCount] <= v12) {
        int64_t v12 = [(TSDBezierPath *)self elementCount] - 1;
      }
      *a4 = v12;
    }
    double v16 = v50;
    double v17 = v52;
    double v18 = v11 + v49 * 3.0 - v13 + v51 * -3.0;
    double v19 = v49 * 3.0 + v13 * -3.0;
    double v20 = v13 - a3;
    double v21 = (v49 * -6.0 + v13 * 3.0 + v51 * 3.0) / v18;
    double v22 = v19 / v18;
    double v23 = v20 / v18;
    double v24 = v20 / v18 + v21 * (v21 * (v21 + v21)) / 27.0 + v21 * v22 / -3.0;
    double v25 = v24 * v24 * 0.25;
    double v26 = (v22 + v21 * v21 / -3.0) * ((v22 + v21 * v21 / -3.0) * (v22 + v21 * v21 / -3.0)) / 27.0 + v25;
    if (v26 <= 0.0)
    {
      if (v26 == 0.0)
      {
        if (v23 >= 0.0) {
          long double v34 = -pow(v23, 0.333333333);
        }
        else {
          long double v34 = pow(fabs(v23), 0.333333333);
        }
      }
      else
      {
        long double v35 = sqrt(v25 - v26);
        double v36 = pow(v35, 0.333333333);
        long double v37 = acos(-v24 / (v35 + v35));
        __double2 v38 = __sincos_stret(v37 / 3.0);
        double v39 = v21 / -3.0;
        long double v34 = v21 / -3.0 + (v36 + v36) * v38.__cosval;
        if (v34 < 0.0 || v34 > 1.0)
        {
          long double v34 = v39 + -v36 * (v38.__cosval + v38.__sinval * 1.73205081);
          if (v34 < 0.0 || v34 > 1.0)
          {
            long double v34 = v39 - v36 * (v38.__cosval - v38.__sinval * 1.73205081);
            if (v34 < 0.0 || v34 > 1.0)
            {
              uint64_t v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v44 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) yValueFromXValue:elementIndex:parametricValue:]"];
              objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 192, @"No valid roots!");
              long double v34 = 0.0;
            }
          }
        }
      }
    }
    else
    {
      double v27 = v24 * -0.5;
      double v47 = v52;
      double v48 = v50;
      double v28 = sqrt(v26);
      double v29 = v24 * -0.5 + v28;
      double v30 = pow(fabs(v29), 0.333333333);
      if (v29 <= 0.0) {
        double v30 = -v30;
      }
      double v46 = v30;
      double v31 = v27 - v28;
      long double v32 = vabdd_f64(v27, v28);
      double v16 = v48;
      double v33 = pow(v32, 0.333333333);
      if (v31 <= 0.0) {
        double v33 = -v33;
      }
      double v17 = v47;
      long double v34 = v46 + v33 + v21 / -3.0;
    }
    if (a5) {
      *a5 = v34;
    }
    return v14
         + (v16 * -6.0 + v14 * 3.0 + v17 * 3.0) * (v34 * v34)
         + v34 * (v34 * v34) * (v10 + v16 * 3.0 - v14 + v17 * -3.0)
         + v34 * (v16 * 3.0 + v14 * -3.0);
  }
  return v10;
}

- (id)pathBySplittingAtPointOnPath:(CGPoint)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  double v78 = 0.0;
  uint64_t v79 = 0;
  -[TSDBezierPath yValueFromXValue:elementIndex:parametricValue:](self, "yValueFromXValue:elementIndex:parametricValue:", &v79, &v78, a3.x, a3.y);
  double v6 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  id v7 = +[TSDBezierPath bezierPath];
  if ([(TSDBezierPath *)self elementCount] >= 1)
  {
    int64_t v8 = 0;
    do
    {
      unint64_t v9 = [(TSDBezierPath *)self elementAtIndex:v8 associatedPoints:&v80];
      if (v8 == v79)
      {
        double v10 = v80;
        double v11 = v81;
        double v12 = v82;
        double v13 = v83;
        double v14 = v85;
        double v76 = v85;
        double v77 = v84;
        double v15 = TSDSubtractPoints(v80, v81, v6);
        double v16 = v78;
        double v18 = TSDMultiplyPointScalar(v15, v17, v78);
        double v19 = TSDAddPoints(v6, v5, v18);
        double v72 = v20;
        double v73 = v19;
        double v21 = TSDSubtractPoints(v12, v13, v10);
        double v22 = v16;
        double v24 = TSDMultiplyPointScalar(v21, v23, v16);
        double v25 = TSDAddPoints(v10, v11, v24);
        double v27 = v26;
        double v71 = v26;
        double v28 = TSDSubtractPoints(v77, v14, v12);
        double v30 = TSDMultiplyPointScalar(v28, v29, v22);
        double v31 = TSDAddPoints(v12, v13, v30);
        double v74 = v32;
        double v75 = v31;
        double v33 = v32;
        double v34 = TSDSubtractPoints(v25, v27, v73);
        double v36 = TSDMultiplyPointScalar(v34, v35, v22);
        double v37 = TSDAddPoints(v73, v72, v36);
        double v39 = v38;
        double v40 = TSDSubtractPoints(v31, v33, v25);
        double v42 = TSDMultiplyPointScalar(v40, v41, v22);
        double v43 = TSDAddPoints(v25, v71, v42);
        double v45 = v44;
        double v46 = TSDSubtractPoints(v43, v44, v37);
        double v48 = TSDMultiplyPointScalar(v46, v47, v22);
        double v49 = TSDAddPoints(v37, v39, v48);
        double v51 = v50;
        double v52 = TSDSubtractPoints(v37, v39, v49);
        double v54 = v53;
        double v55 = TSDSubtractPoints(v43, v45, v49);
        double v57 = TSDMultiplyPointScalar(v55, v56, -1.0);
        double v58 = TSDAddPoints(v52, v54, v57);
        double v60 = TSDMultiplyPointScalar(v58, v59, 0.5);
        double v62 = v61;
        double v63 = TSDAddPoints(v49, v51, v60);
        double v65 = v64;
        double v66 = TSDMultiplyPointScalar(v60, v62, -1.0);
        double v67 = TSDAddPoints(v49, v51, v66);
        double v69 = v68;
        objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v49, v51, v73, v72, v63, v65);
        double v5 = v76;
        double v6 = v77;
        objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v77, v76, v67, v69, v75, v74);
      }
      else
      {
        switch(v9)
        {
          case 0uLL:
            objc_msgSend(v7, "moveToPoint:", v80, v81);
            goto LABEL_8;
          case 1uLL:
            objc_msgSend(v7, "lineToPoint:", v80, v81);
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPathAdditions.mm", 288, @"Don't use LineTo!");
LABEL_8:
            double v6 = v80;
            double v5 = v81;
            break;
          case 2uLL:
            objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v84, v85, v80, v81, v82, v83);
            double v6 = v84;
            double v5 = v85;
            break;
          case 3uLL:
            [v7 closePath];
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSDBezierPathAdditions.mm", 297, @"Don't use ClosePath!");
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (v8 < [(TSDBezierPath *)self elementCount]);
  }
  return v7;
}

- (double)yValueFromXValue:(double)a3
{
  [(TSDBezierPath *)self yValueFromXValue:0 elementIndex:0 parametricValue:a3];
  return result;
}

- (void)alignBoundsToOrigin
{
  if ([(TSDBezierPath *)self elementCount] >= 1)
  {
    [(TSDBezierPath *)self bounds];
    double v4 = v3;
    double v6 = v5;
    if (!TSDNearlyEqualPoints(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v3, v5))
    {
      CGAffineTransformMakeTranslation(&v7, -v4, -v6);
      [(TSDBezierPath *)self transformUsingAffineTransform:&v7];
    }
  }
}

- (BOOL)isCompound
{
  uint64_t v3 = [(TSDBezierPath *)self elementCount];
  if (v3 < 1)
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    int v6 = 0;
    do
    {
      if (![(TSDBezierPath *)self elementAtIndex:v5]) {
        ++v6;
      }
      ++v5;
    }
    while (v4 != v5);
    int v7 = v6 - ([(TSDBezierPath *)self elementAtIndex:v4 - 1] == 0);
  }
  return v7 > 1;
}

- (BOOL)isSelfIntersecting
{
  return 0;
}

- (void)takeAttributesFromStroke:(id)a3
{
  int v5 = [a3 supportsWidth];
  double v6 = 0.0;
  if (v5) {
    objc_msgSend(a3, "width", 0.0);
  }
  [(TSDBezierPath *)self setLineWidth:v6];
  if ([a3 supportsLineOptions])
  {
    [a3 miterLimit];
    -[TSDBezierPath setMiterLimit:](self, "setMiterLimit:");
    -[TSDBezierPath setLineCapStyle:](self, "setLineCapStyle:", (int)[a3 cap]);
    uint64_t v7 = (int)[a3 join];
  }
  else
  {
    uint64_t v7 = 1;
  }

  [(TSDBezierPath *)self setLineJoinStyle:v7];
}

- (CGRect)_addMitersFromSegments:(id)a3 toRect:(CGRect)a4
{
  unint64_t v6 = [a3 count];
  [(TSDBezierPath *)self lineWidth];
  double v8 = v7;
  [(TSDBezierPath *)self miterLimit];
  double v10 = v9;
  uint64_t v11 = [a3 objectAtIndex:0];
  if (v6 >= 2)
  {
    double v12 = (void *)v11;
    float v13 = v8;
    float v14 = v10;
    float v58 = v14;
    float v59 = v13;
    double v57 = v13;
    for (uint64_t i = 1; i != v6; ++i)
    {
      double v16 = v12;
      double v12 = (void *)[a3 objectAtIndex:i];
      [v16 inPoint];
      double v18 = v17;
      double v20 = v19;
      [v16 toPoint];
      double v22 = v21;
      double v24 = v23;
      [v12 outPoint];
      double v26 = v25;
      double v28 = v27;
      long double v29 = TSDSubtractPoints(v18, v20, v22);
      long double v31 = v30;
      long double v32 = TSDSubtractPoints(v26, v28, v22);
      double v34 = v33;
      double v35 = TSDAngleFromDelta(v32, v33);
      float v36 = v35 - TSDAngleFromDelta(v29, v31);
      float v37 = fabsf(v36);
      if (v37 > 3.14159265)
      {
        float v38 = 6.28318531 - v37;
        float v37 = v38;
      }
      double v39 = v37;
      double v40 = sin(v37 * 0.5);
      if (vabdd_f64(3.14159265, v39) > 0.001)
      {
        float v41 = v57 / v40;
        float v42 = fabsf(v41);
        if ((float)(v42 / v59) < v58)
        {
          float v43 = sqrt(v31 * v31 + v29 * v29);
          float v44 = sqrt(v34 * v34 + v32 * v32);
          double v45 = TSDAveragePoints(v29 / v43, v31 / v43, v32 / v44);
          double v46 = -v45;
          *(float *)&double v45 = sqrt(v47 * v47 + v45 * v45);
          double v48 = TSDAddPoints(v22, v24, v42 * 0.5 * (v46 / *(float *)&v45));
          a4.origin.double x = TSDGrowRectToPoint(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v48, v49);
          a4.origin.double y = v50;
          a4.size.double width = v51;
          a4.size.double height = v52;
        }
      }
    }
  }
  double x = a4.origin.x;
  double y = a4.origin.y;
  double width = a4.size.width;
  double height = a4.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)boundsIncludingStrokeWidth:(double)a3 joinStyle:(unint64_t)a4 capStyle:(unint64_t)a5 miterLimit:(double)a6 needsToExtendJoins:(BOOL)a7
{
  v30[6] = *MEMORY[0x263EF8340];
  if (a3 == 0.0)
  {
    [(TSDBezierPath *)self bounds];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
    goto LABEL_12;
  }
  BOOL v16 = a7;
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath([(TSDBezierPath *)self CGPath], 0, a3, (CGLineCap)a5, (CGLineJoin)a4, a6);
  PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(CopyByStrokingPath);
  CGFloat x = PathBoundingBox.origin.x;
  CGFloat y = PathBoundingBox.origin.y;
  CGFloat width = PathBoundingBox.size.width;
  CGFloat height = PathBoundingBox.size.height;
  CGPathRelease(CopyByStrokingPath);
  if (v16)
  {
    uint64_t v19 = [(TSDBezierPath *)self elementCount];
    if (v19 >= 1)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      double v22 = sqrt(a3 * 0.5 * a3);
      while (1)
      {
        unint64_t v23 = [(TSDBezierPath *)self elementAtIndex:v21 associatedPoints:v30];
        if (v23 < 2) {
          break;
        }
        if (v23 == 2)
        {
          double v24 = *(double *)&v30[4];
          double v25 = *(double *)&v30[5];
          goto LABEL_10;
        }
LABEL_11:
        if (v20 == ++v21) {
          goto LABEL_12;
        }
      }
      double v24 = *(double *)v30;
      double v25 = *(double *)&v30[1];
LABEL_10:
      v35.origin.CGFloat x = v24 - v22;
      v35.origin.CGFloat y = v25 - v22;
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      v35.size.CGFloat width = v22 + v22;
      v35.size.CGFloat height = v22 + v22;
      CGRect v33 = CGRectUnion(v32, v35);
      CGFloat x = v33.origin.x;
      CGFloat y = v33.origin.y;
      CGFloat width = v33.size.width;
      CGFloat height = v33.size.height;
      goto LABEL_11;
    }
  }
LABEL_12:
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)boundsIncludingStroke
{
  [(TSDBezierPath *)self lineWidth];
  double v4 = v3;
  unint64_t v5 = [(TSDBezierPath *)self lineJoinStyle];
  unint64_t v6 = [(TSDBezierPath *)self lineCapStyle];
  [(TSDBezierPath *)self miterLimit];

  [(TSDBezierPath *)self boundsIncludingStrokeWidth:v5 joinStyle:v6 capStyle:0 miterLimit:v4 needsToExtendJoins:v7];
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)boundsIncludingTSDStroke:(id)a3
{
  [(TSDBezierPath *)self bounds];
  if (TSDNearlyEqualSizes(v5, v6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8))
    || [(TSDBezierPath *)self isEmpty])
  {
    goto LABEL_21;
  }
  if ([a3 isFrame])
  {
    [(TSDBezierPath *)self bounds];
    objc_msgSend(a3, "coverageRect:");
  }
  else
  {
    double v11 = 0.0;
    if ([a3 supportsWidth])
    {
      [a3 width];
      double v11 = v12;
    }
    if ([a3 supportsLineOptions])
    {
      unint64_t v13 = (int)[a3 join];
      unint64_t v14 = (int)[a3 cap];
      [a3 miterLimit];
    }
    else
    {
      unint64_t v13 = +[TSDBezierPath defaultLineJoinStyle];
      unint64_t v14 = +[TSDBezierPath defaultLineCapStyle];
      +[TSDBezierPath defaultMiterLimit];
    }
    double v16 = v15;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "pattern"), "count");
    char v18 = [a3 needsToExtendJoinsForBoundsCalculation];
    BOOL v19 = !v17 || v14 == 0;
    BOOL v20 = !v19;
    uint64_t v21 = (v18 & 1) != 0 || (unint64_t)v20;
    [(TSDBezierPath *)self boundsIncludingStrokeWidth:v13 joinStyle:v14 capStyle:v21 miterLimit:v11 needsToExtendJoins:v16];
  }
  double v22 = v7;
  double v23 = v8;
  double v24 = v9;
  double v25 = v10;
  if (CGRectIsNull(*(CGRect *)&v7))
  {
LABEL_21:
    double v22 = *MEMORY[0x263F001A8];
    double v23 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v24 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v25 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (BOOL)pointOnPath:(CGPoint)a3 tolerance:(double)a4
{
  double v4 = a4 * 0.5;
  -[TSDBezierPath distanceToPoint:elementIndex:tValue:threshold:](self, "distanceToPoint:elementIndex:tValue:threshold:", 0, 0, a3.x, a3.y, a4 * 0.5);
  return v5 < v4;
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int64_t v12 = [(TSDBezierPath *)self elementCount];
  unint64_t v13 = 0;
  float64x2_t v25 = *(float64x2_t *)MEMORY[0x263F00148];
  double v14 = 0.0;
  double v15 = 1.79769313e308;
  if (v12)
  {
    double v16 = a6 * a6;
    if (a6 * a6 < 1.79769313e308)
    {
      unint64_t v17 = v12;
      unint64_t v13 = 0;
      double v15 = 1.79769313e308;
      unint64_t v18 = 1;
      do
      {
        switch(-[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v18 - 1, &v26, *(_OWORD *)&v25))
        {
          case 0uLL:
            float64x2_t v25 = v26;
            break;
          case 1uLL:
            goto LABEL_8;
          case 2uLL:
            double v19 = TSDNearestPointOnCurveToPoint(&v26, x, y, 1.0);
            double v20 = TSDPointOnCurve(&v26, v19);
            goto LABEL_9;
          case 3uLL:
            float64x2_t v27 = v25;
LABEL_8:
            TSDNearestPointOnLineToPoint(v26.f64, x, y);
            double v19 = v22;
            double v20 = TSDMixPoints(v26.f64[0], v26.f64[1], v27.f64[0], v27.f64[1], v22);
LABEL_9:
            double v23 = TSDDistanceSquared(v20, v21, x, y);
            if (v23 < v15)
            {
              double v14 = v19;
              unint64_t v13 = v18 - 1;
              double v15 = v23;
            }
            break;
          default:
            break;
        }
        if (v18 >= v17) {
          break;
        }
        ++v18;
      }
      while (v15 > v16);
    }
  }
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v14;
  }
  return sqrt(v15);
}

- (CGPoint)pointAlongPathAtPercentage:(double)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(TSDBezierPath *)self bezierPathByFlatteningPath];
  uint64_t v4 = [v3 elementCount];
  if (v4 < 1)
  {
    double v10 = 0.0;
    float v6 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    uint64_t v5 = 0;
    float v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = [v3 elementAtIndex:v5 associatedPoints:&v28];
      switch(v11)
      {
        case 3:
          float v6 = TSDDistance(v10, v9, v7, v8) + v6;
          break;
        case 1:
          double v12 = v28;
          double v13 = v29;
          float v6 = TSDDistance(v10, v9, v28, v29) + v6;
          double v10 = v12;
          double v9 = v13;
          break;
        case 0:
          double v10 = v28;
          double v9 = v29;
          double v8 = v29;
          double v7 = v28;
          break;
      }
      ++v5;
    }
    while (v4 != v5);
  }
  TSUClamp();
  if (v4 < 1)
  {
LABEL_25:
    double v22 = *MEMORY[0x263F00148];
    double v23 = *(double *)(MEMORY[0x263F00148] + 8);
    goto LABEL_29;
  }
  uint64_t v15 = 0;
  float v16 = v14 * v6;
  float v27 = v16;
  float v17 = 0.0;
  while (1)
  {
    uint64_t v18 = [v3 elementAtIndex:v15 associatedPoints:&v28];
    if (!v18)
    {
      double v10 = v28;
      double v9 = v29;
      double v8 = v29;
      double v7 = v28;
      goto LABEL_24;
    }
    double v19 = v18 == 1 ? v28 : v7;
    double v20 = v18 == 1 ? v29 : v8;
    float v21 = TSDDistance(v10, v9, v19, v20);
    if ((float)(v17 + v21) >= v27) {
      break;
    }
    float v17 = v17 + v21;
    double v10 = v19;
    double v9 = v20;
LABEL_24:
    if (v4 == ++v15) {
      goto LABEL_25;
    }
  }
  double v24 = TSDSubtractPoints(v19, v20, v10);
  double v26 = v24;
  if (v21 > 0.0) {
    double v26 = TSDMultiplyPointScalar(v24, v25, (float)((float)(v27 - v17) / v21));
  }
  double v22 = TSDAddPoints(v10, v9, v26);
LABEL_29:
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (BOOL)isEffectivelyClosed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(TSDBezierPath *)self containsClosePathElement]) {
    return 1;
  }
  if ([(TSDBezierPath *)self elementCount] < 2
    || [(TSDBezierPath *)self elementAtIndex:0 associatedPoints:&v10])
  {
    return 0;
  }
  unint64_t v4 = [(TSDBezierPath *)self elementAtIndex:[(TSDBezierPath *)self elementCount] - 1 associatedPoints:v9];
  if (v4 < 2)
  {
    double v5 = v10;
    double v6 = v11;
    double v7 = *(double *)v9;
    double v8 = *(double *)&v9[1];
  }
  else
  {
    if (v4 != 2) {
      return v4 == 3;
    }
    double v5 = v10;
    double v6 = v11;
    double v7 = *(double *)&v9[4];
    double v8 = *(double *)&v9[5];
  }
  return v6 == v8 && v5 == v7;
}

- (BOOL)containsClosePathElement
{
  uint64_t v3 = [(TSDBezierPath *)self elementCount];
  if (v3 < 2) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 2;
  do
    BOOL result = [(TSDBezierPath *)self elementAtIndex:v5 - 1] == 3;
  while (!result && v4 != v5++);
  return result;
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(int)a6 startNewPath:(BOOL)a7
{
  BOOL v38 = a7;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v46 = *MEMORY[0x263EF8340];
  CGFloat MidX = CGRectGetMidX(a3);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v15 = CGRectGetWidth(v48) * 0.5;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v49) * 0.5;
  if (a6 == 1)
  {
    TSDEllipseParametricAngleWithPolarAngle(a4, v15, v16);
    double v18 = v19;
    TSDEllipseParametricAngleWithPolarAngle(a4 + a5, v15, v16);
    double v17 = v20;
  }
  else
  {
    if (a6) {
      double v17 = 0.0;
    }
    else {
      double v17 = a4 + a5;
    }
    if (a6) {
      double v18 = 0.0;
    }
    else {
      double v18 = a4;
    }
  }
  id v21 = +[TSDBezierPath bezierPath];
  objc_msgSend(v21, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v18 > v17, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0, v18, v17);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeScale(&t1, v15, v16);
  CGAffineTransformMakeTranslation(&t2, MidX, MidY);
  CGAffineTransformConcat(&v42, &t1, &t2);
  CGAffineTransform v39 = v42;
  [v21 transformUsingAffineTransform:&v39];
  uint64_t v22 = [v21 elementCount];
  if (v22 >= 1)
  {
    uint64_t v23 = v22;
    for (uint64_t i = 0; i != v23; ++i)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
      switch([v21 elementAtIndex:i associatedPoints:&v43])
      {
        case 0:
          if (i)
          {
            double v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v26 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"];
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 794, @"Only the first element of the arc should be a moveto");
          }
          if (v38) {
            [(TSDBezierPath *)self moveToPoint:v43];
          }
          else {
            [(TSDBezierPath *)self lineToPoint:v43];
          }
          break;
        case 1:
          uint64_t v27 = [MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v28 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"];
          uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"];
          uint64_t v30 = (void *)v27;
          uint64_t v31 = v28;
          uint64_t v32 = 805;
          CGRect v33 = @"The arc shouldn't contain lineto elements";
          goto LABEL_19;
        case 2:
          [(TSDBezierPath *)self curveToPoint:v45 controlPoint1:v43 controlPoint2:v44];
          break;
        case 3:
          uint64_t v34 = [MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"];
          uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"];
          uint64_t v30 = (void *)v34;
          uint64_t v31 = v35;
          uint64_t v32 = 811;
          CGRect v33 = @"The arc shouldn't contain close_subpath elements";
LABEL_19:
          [v30 handleFailureInFunction:v31 file:v29 lineNumber:v32 description:v33];
          break;
        default:
          continue;
      }
    }
  }
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(int)a6 startNewPath:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a5.y;
  double x = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v14 = a3.origin.y;
  CGFloat v15 = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v30.origin.double x = v15;
  v30.origin.double y = v14;
  CGFloat v27 = height;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v30);
  double v19 = atan2(v10 - MidY, v11 - MidX) * 180.0 / 3.14159265;
  double v20 = atan2(y - MidY, x - MidX) * 180.0 / 3.14159265;
  if (a6)
  {
    if (a6 == 1)
    {
      if (v19 < v20)
      {
        double v21 = width;
        double v22 = v27;
        double v23 = v15;
        double i = v14;
        do
          double v19 = v19 + 360.0;
        while (v19 < v20);
        goto LABEL_12;
      }
    }
    else
    {
      double v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v26 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:]"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 842, @"Unexpected angle sign");
    }
    double v21 = width;
    double v22 = v27;
    double v23 = v15;
    double i = v14;
    goto LABEL_12;
  }
  double v21 = width;
  double v22 = v27;
  double v23 = v15;
  for (i = v14; v20 < v19; double v20 = v20 + 360.0)
    ;
LABEL_12:

  -[TSDBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](self, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, v7, v23, i, v21, v22, v19, v20 - v19);
}

- (id)bezierPathByRemovingRedundantElements
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = +[TSDBezierPath bezierPath];
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v6 = [(TSDBezierPath *)self elementCount];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    char v9 = 0;
    double v10 = v5;
    double v11 = v4;
    double v12 = v5;
    double v13 = v4;
    while (2)
    {
      switch([(TSDBezierPath *)self elementAtIndex:v8 associatedPoints:&v24])
      {
        case 0uLL:
          objc_msgSend(v3, "moveToPoint:", v24, v25);
          char v9 = 0;
          double v4 = v24;
          double v5 = v25;
          goto LABEL_16;
        case 1uLL:
          double v15 = v24;
          double v14 = v25;
          if (v11 == v24 && v10 == v25) {
            goto LABEL_13;
          }
          if ((v9 & 1) != 0
            && TSDCollinearPoints(v13, v12, v11, v10, v24, v25)
            && (double v17 = TSDSubtractPoints(v11, v10, v13),
                double v22 = v18,
                double v23 = v17,
                double v19 = TSDSubtractPoints(v15, v14, v13),
                TSDDotPoints(v23, v22, v19, v20) > 0.0))
          {
            objc_msgSend(v3, "setAssociatedPoints:atIndex:", &v24, objc_msgSend(v3, "elementCount") - 1);
            char v9 = 1;
LABEL_13:
            double v11 = v13;
            double v10 = v12;
          }
          else
          {
            objc_msgSend(v3, "lineToPoint:", v15, v14);
            char v9 = 1;
          }
          double v13 = v11;
          double v12 = v10;
          double v11 = v24;
          double v10 = v25;
LABEL_19:
          if (v7 == ++v8) {
            return v3;
          }
          continue;
        case 2uLL:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v28, v29, v24, v25, v26, v27);
          char v9 = 0;
          double v13 = v11;
          double v12 = v10;
          double v11 = v28;
          double v10 = v29;
          goto LABEL_19;
        case 3uLL:
          [v3 closePath];
          char v9 = 0;
LABEL_16:
          double v13 = v11;
          double v12 = v10;
          double v11 = v4;
          double v10 = v5;
          goto LABEL_19;
        default:
          goto LABEL_19;
      }
    }
  }
  return v3;
}

- (id)p_copyWithPointsInRange:(_NSRange)a3 countingSubpaths:(unint64_t *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = +[TSDBezierPath bezierPath];
  if (location < location + length)
  {
    char v9 = 0;
    double v10 = (long long *)MEMORY[0x263F7C920];
    do
    {
      long long v13 = *v10;
      *(_OWORD *)double v14 = v13;
      *(_OWORD *)&v14[16] = v13;
      long long v15 = v13;
      unint64_t v11 = [(TSDBezierPath *)self elementAtIndex:location allPoints:&v13];
      if (v9)
      {
        switch(v11)
        {
          case 0uLL:
            ++*a4;
            goto LABEL_7;
          case 1uLL:
            goto LABEL_9;
          case 2uLL:
            goto LABEL_11;
          case 3uLL:
            goto LABEL_13;
          default:
            break;
        }
      }
      else
      {
        ++*a4;
        switch(v11)
        {
          case 0uLL:
LABEL_7:
            [v8 moveToPoint:v13];
            break;
          case 1uLL:
            [v8 moveToPoint:v13];
LABEL_9:
            [v8 lineToPoint:*(_OWORD *)v14];
            break;
          case 2uLL:
            [v8 moveToPoint:v13];
LABEL_11:
            objc_msgSend(v8, "curveToPoint:controlPoint1:controlPoint2:", v15, *(double *)v14, *(_OWORD *)&v14[8], *(double *)&v14[24]);
            break;
          case 3uLL:
            [v8 moveToPoint:v13];
LABEL_13:
            [v8 closePath];
            break;
          default:
            break;
        }
      }
      ++location;
      char v9 = 1;
      --length;
    }
    while (length);
  }
  return v8;
}

- (id)copyWithPointsInRange:(_NSRange)a3
{
  uint64_t v4 = 0;
  return -[TSDBezierPath p_copyWithPointsInRange:countingSubpaths:](self, "p_copyWithPointsInRange:countingSubpaths:", a3.location, a3.length, &v4);
}

- (id)pathSplitAtSubpathBoundariesWithSoftElementLimit:(unint64_t)a3 hardElementLimit:(unint64_t)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  if ([(TSDBezierPath *)self elementCount] < 0)
  {
    double v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 975, @"elementCount (%zd) should be positive.", -[TSDBezierPath elementCount](self, "elementCount"), v27);
    return (id)MEMORY[0x263EFFA68];
  }
  unint64_t v7 = [(TSDBezierPath *)self elementCount];
  if (a3 > a4)
  {
    id v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 982, @"softElementLimit (%zu) should be less than or equal to hardElementLimit (%zu).", a3, a4);
    return (id)MEMORY[0x263EFFA68];
  }
  if (a3 < 2 || a4 <= 1)
  {
    double v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"-[TSDBezierPath(Additions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 987, @"Unable to split a path with subpaths less than 2 elements at a time.", v26, v27);
    return (id)MEMORY[0x263EFFA68];
  }
  if (!v7) {
    return (id)MEMORY[0x263EFFA68];
  }
  if (v7 <= a3)
  {
    v29[0] = [(TSDBezierPath *)self copy];
    return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  }
  double v12 = (void *)[MEMORY[0x263EFF980] array];
  id v28 = [(TSDBezierPath *)self p_elementCountForSubpaths];
  uint64_t v13 = [v28 count];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    while (1)
    {
      uint64_t v18 = v17++;
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v28, "objectAtIndexedSubscript:", v18), "unsignedIntegerValue");
      if (v19 + v16 <= a3) {
        break;
      }
      unint64_t v20 = v19;
      if (v16)
      {
        objc_msgSend(v12, "addObject:", -[TSDBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v15, v16));
        v15 += v16;
      }
      if (v20 <= a4) {
        goto LABEL_22;
      }
      unint64_t v21 = a4;
      do
      {
        if (v20 >= v21) {
          unint64_t v22 = v21;
        }
        else {
          unint64_t v22 = v20;
        }
        objc_msgSend(v12, "addObject:", -[TSDBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v15, v22));
        v15 += v22;
        unint64_t v21 = a4 - 1;
        v20 -= v22;
      }
      while (v20);
LABEL_25:
      unint64_t v16 = v20;
      if (v17 == v14) {
        return v12;
      }
    }
    unint64_t v20 = v19 + v16;
LABEL_22:
    if (v17 == v14 && v20) {
      objc_msgSend(v12, "addObject:", -[TSDBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v15, v20));
    }
    goto LABEL_25;
  }
  return v12;
}

- (id)p_elementCountForSubpaths
{
  id v3 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v4 = [(TSDBezierPath *)self elementCount];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = -v4;
    uint64_t v7 = 1;
    do
    {
      if (!(v6 + v7) || ![(TSDBezierPath *)self elementAtIndex:v7])
      {
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v7 - v5));
        uint64_t v5 = v7;
      }
      ++v7;
    }
    while (v6 + v7 != 1);
  }
  return v3;
}

- (id)p_pathAsSegments
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  double v4 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  id v28 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  int64_t v6 = [(TSDBezierPath *)self elementCount];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = [(TSDBezierPath *)self elementAtIndex:0 associatedPoints:v32];
    if (v7 >= 2)
    {
      unint64_t v9 = v8;
      if (!v8)
      {
        double v3 = *((double *)v32 + 1);
        double v4 = *(double *)v32;
      }
      uint64_t v10 = 1;
      while (1)
      {
        unint64_t v11 = [(TSDBezierPath *)self elementAtIndex:v10 associatedPoints:&v29];
        switch(v11)
        {
          case 0uLL:
            if ([v5 count])
            {
              [v28 addObject:v5];
              uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
            }
            double v3 = *((double *)&v29 + 1);
            double v4 = *(double *)&v29;
            goto LABEL_32;
          case 1uLL:
            if (v9 < 2)
            {
              double v13 = *((double *)v32 + 1);
              double v12 = *(double *)v32;
              goto LABEL_18;
            }
            if (v9 == 2)
            {
              double v13 = *((double *)&v33 + 1);
              double v12 = *(double *)&v33;
LABEL_18:
              unsigned long long v18 = v29;
              if (!TSDNearlyEqualPoints(v12, v13, *(double *)&v29, *((double *)&v29 + 1)))
              {
                double v14 = v12;
                double v15 = v13;
                double v19 = v12;
                double v20 = v13;
                *(void *)&double v22 = v18 >> 64;
                *(void *)&double v21 = v18;
                *(void *)&double v24 = v18 >> 64;
                *(void *)&double v23 = v18;
                goto LABEL_23;
              }
              goto LABEL_32;
            }
            goto LABEL_32;
          case 2uLL:
            if (v9 < 2)
            {
              double v15 = *((double *)v32 + 1);
              double v14 = *(double *)v32;
              goto LABEL_22;
            }
            if (v9 == 2)
            {
              double v15 = *((double *)&v33 + 1);
              double v14 = *(double *)&v33;
LABEL_22:
              double v20 = *((double *)&v29 + 1);
              double v19 = *(double *)&v29;
              double v22 = *((double *)&v30 + 1);
              double v21 = *(double *)&v30;
              double v24 = *((double *)&v31 + 1);
              double v23 = *(double *)&v31;
LABEL_23:
              id v25 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v14, v15, v19, v20, v21, v22, v23, v24);
              if (([v25 bogusSegment] & 1) == 0) {
                [v5 addObject:v25];
              }
              goto LABEL_32;
            }
            goto LABEL_32;
          case 3uLL:
            if (v9 < 2)
            {
              double v17 = *((double *)v32 + 1);
              double v16 = *(double *)v32;
LABEL_27:
              if (!TSDNearlyEqualPoints(v16, v17, v4, v3))
              {
                id v26 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v16, v17, v16, v17, v4, v3, v4, v3);
                if (([v26 bogusSegment] & 1) == 0) {
                  [v5 addObject:v26];
                }
              }
              goto LABEL_30;
            }
            if (v9 == 2)
            {
              double v17 = *((double *)&v33 + 1);
              double v16 = *(double *)&v33;
              goto LABEL_27;
            }
LABEL_30:
            if ([v5 count])
            {
              objc_msgSend(v5, "addObject:", objc_msgSend(v5, "objectAtIndex:", 0));
              [v28 addObject:v5];
              uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
            }
LABEL_32:
            v32[0] = v29;
            v32[1] = v30;
            long long v33 = v31;
            ++v10;
            unint64_t v9 = v11;
            if (v7 == v10) {
              goto LABEL_33;
            }
            break;
          default:
            goto LABEL_32;
        }
      }
    }
LABEL_33:
    if ([v5 count]) {
      [v28 addObject:v5];
    }
  }
  return v28;
}

- (id)p_beziersFromSegmentIntersections:(id)a3
{
  uint64_t v5 = [a3 count];
  [(TSDBezierPath *)self lineWidth];
  double v7 = v6;
  [(TSDBezierPath *)self miterLimit];
  double v9 = v8;
  uint64_t v10 = (void *)[MEMORY[0x263EFF980] array];
  unint64_t v11 = [(TSDBezierPath *)self lineJoinStyle];
  uint64_t v12 = [a3 objectAtIndex:0];
  if (v5 >= 2)
  {
    double v13 = (void *)v12;
    float v14 = v7;
    float v15 = v9;
    float v88 = v15;
    float v89 = v14;
    double v87 = v14;
    double v92 = (float)(v14 * 0.5);
    uint64_t v16 = 1;
    double v17 = (double *)MEMORY[0x263F00148];
    do
    {
      unsigned long long v18 = (void *)[a3 objectAtIndex:v16];
      [v13 inPoint];
      double v20 = v19;
      double v22 = v21;
      [v13 toPoint];
      double v24 = v23;
      double v26 = v25;
      [v18 outPoint];
      double v28 = v27;
      double v103 = v29;
      double v95 = v20;
      double v96 = v22;
      double v30 = TSDSubtractPoints(v20, v22, v24);
      double v32 = v31;
      double v34 = *v17;
      double v33 = v17[1];
      float v35 = TSDDistance(v30, v31, *v17, v33);
      double v36 = TSDMultiplyPointScalar(v30, v32, (float)(1.0 / v35));
      double v38 = v37;
      double v98 = v28;
      double v39 = TSDSubtractPoints(v28, v103, v24);
      double v41 = v40;
      double v93 = v33;
      double v94 = v34;
      double v42 = v33;
      double v43 = v26;
      float v44 = TSDDistance(v39, v40, v34, v42);
      double v45 = TSDMultiplyPointScalar(v39, v41, (float)(1.0 / v44));
      double v47 = v46;
      double v104 = TSDAddPoints(v24, v26, v36);
      double v100 = v48;
      double v49 = v24;
      double v50 = TSDAddPoints(v24, v43, v45);
      double v52 = v51;
      double v101 = v47;
      double v102 = v38;
      float v53 = acos(v38 * v47 + v45 * v36);
      double v54 = v53;
      double v55 = sin(v53 * 0.5);
      double v99 = v52;
      double v97 = v50;
      if (v11 == 2)
      {
        double v56 = v96;
        int v57 = 0;
      }
      else
      {
        double v56 = v96;
        int v57 = 0;
        if (vabdd_f64(3.14159265, v54) > 0.001)
        {
          float v60 = v87 / v55;
          float v61 = fabsf(v60);
          double v58 = v49;
          double v59 = v95;
          if ((float)(v61 / v89) < v88)
          {
            double v62 = TSDAveragePoints(v36, v102, v45);
            double v91 = (float)(v61 * 0.5);
            double v64 = TSDMultiplyPointScalar(v62, v63, -1.0);
            double v66 = v65;
            double v67 = TSDDistance(v64, v65, v94, v93);
            double v90 = TSDMultiplyPointScalar(v64, v66, v91 / v67);
            int v57 = 1;
          }
          goto LABEL_9;
        }
      }
      double v58 = v49;
      double v59 = v95;
LABEL_9:
      float v68 = v59 * v43 - v56 * v58 + 0.0;
      float v69 = v58 * v103 - v43 * v98 + v68;
      float v70 = v98 * v56 - v103 * v59 + v69;
      BOOL v71 = v70 < 0.0;
      BOOL v72 = v70 >= 0.0;
      double v73 = TSDMultiplyPointScalar(v36, v102, v92);
      double v75 = TSDRotatePoint90Degrees(v72, v73, v74);
      double v76 = TSDAddPoints(v104, v100, v75);
      double v78 = v77;
      double v79 = TSDMultiplyPointScalar(v45, v101, v92);
      double v81 = TSDRotatePoint90Degrees(v71, v79, v80);
      double v82 = TSDAddPoints(v97, v99, v81);
      double v84 = v83;
      id v85 = +[TSDBezierPath bezierPath];
      objc_msgSend(v85, "moveToPoint:", v76, v78);
      if (v57) {
        objc_msgSend(v85, "lineToPoint:", TSDAddPoints(v58, v43, v90));
      }
      objc_msgSend(v85, "lineToPoint:", v82, v84);
      objc_msgSend(v85, "lineToPoint:", v97, v99);
      objc_msgSend(v85, "lineToPoint:", v104, v100);
      [v85 closePath];
      [v10 addObject:v85];
      ++v16;
      double v13 = v18;
    }
    while (v5 != v16);
  }
  return v10;
}

- (id)bezierPathByOffsettingPath:(double)a3 joinStyle:(unint64_t)a4 withThreshold:(double)a5
{
  uint64_t v5 = self;
  if (a3 == 0.0) {
    return v5;
  }
  if (![(TSDBezierPath *)self isRectangular])
  {
    uint64_t v10 = (void *)[(TSDBezierPath *)v5 copy];
    [v10 setLineWidth:fabs(a3 + a3)];
    [v10 setLineJoinStyle:a4];
    id v11 = +[TSDBezierPath outlineBezierPath:v10 withThreshold:a5];
    if (a3 <= 0.0) {
      uint64_t v12 = [v10 subtractBezierPath:v11];
    }
    else {
      uint64_t v12 = [v10 uniteWithBezierPath:v11];
    }
    uint64_t v5 = (TSDBezierPath *)v12;

    return v5;
  }
  [(TSDBezierPath *)v5 bounds];
  CGRect v15 = CGRectInset(v14, -a3, -a3);
  if (a3 > 0.0 && a4 == 1)
  {
    return +[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, a3);
  }
  else
  {
    return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  }
}

- (id)outlineStroke
{
  return +[TSDBezierPath outlineBezierPath:self];
}

- (id)uniteWithBezierPath:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self, a3, 0);

  return +[TSDBezierPath uniteBezierPaths:v3];
}

- (id)subtractBezierPath:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self, a3, 0);

  return +[TSDBezierPath subtractBezierPaths:v3];
}

- (id)intersectBezierPath:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self, a3, 0);

  return +[TSDBezierPath intersectBezierPaths:v3];
}

- (BOOL)isEqual:(id)a3
{
  v12[6] = *(double *)MEMORY[0x263EF8340];
  if (self == a3)
  {
LABEL_16:
    LOBYTE(v5) = 1;
    return v5;
  }
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    uint64_t v6 = [(TSDBezierPath *)self elementCount];
    if (v6 != [a3 elementCount])
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = [(TSDBezierPath *)self elementAtIndex:v7 associatedPoints:v12];
        if (v8 != [a3 elementAtIndex:v7 associatedPoints:v11]) {
          goto LABEL_17;
        }
        if (v8 >= 2)
        {
          if (v8 == 2)
          {
            uint64_t v9 = 0;
            while (TSDNearlyEqualPoints(v12[v9], v12[v9 + 1], v11[v9], v11[v9 + 1]))
            {
              v9 += 2;
              if (v9 == 6) {
                goto LABEL_14;
              }
            }
            goto LABEL_17;
          }
        }
        else if (!TSDNearlyEqualPoints(v12[0], v12[1], v11[0], v11[1]))
        {
          goto LABEL_17;
        }
LABEL_14:
        ++v7;
        LOBYTE(v5) = 1;
        if (v7 == v6) {
          return v5;
        }
      }
    }
    goto LABEL_16;
  }
  return v5;
}

- (void)clearStroke:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(TSDBezierPath *)self flatness];
  CGContextSetFlatness(a3, v5);
  CGContextBeginPath(a3);
  [(TSDBezierPath *)self addPathToContext:a3];
  [(TSDBezierPath *)self lineWidth];
  CGContextSetLineWidth(a3, v6);
  CGContextReplacePathWithStrokedPath(a3);
  CGContextClip(a3);
  CGContextBeginPath(a3);
  [(TSDBezierPath *)self lineWidth];
  double v8 = v7;
  [(TSDBezierPath *)self bounds];
  CGRect v11 = CGRectInset(v10, -(v8 + 10.0), -(v8 + 10.0));
  CGContextClearRect(a3, v11);

  CGContextRestoreGState(a3);
}

- (id)pathByWobblingByUpTo:(double)a3 subdivisions:(unint64_t)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = (id)[(TSDBezierPath *)self copy];
  [v7 removeAllPoints];
  double v45 = *(double *)(MEMORY[0x263F00148] + 8);
  double v46 = *MEMORY[0x263F00148];
  uint64_t v8 = [(TSDBezierPath *)self elementCount];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    float v11 = a3;
    double v12 = v11;
    do
    {
      switch([(TSDBezierPath *)self elementAtIndex:v10 associatedPoints:&v47])
      {
        case 0uLL:
          double v13 = v47;
          double v14 = v48;
          TSURandom();
          double v16 = v13 + (v15 + -0.5) * v12;
          TSURandom();
          double v45 = v14 + (v17 + -0.5) * v12;
          double v46 = v16;
          [v7 moveToPoint:v16];
          break;
        case 1uLL:
          int v18 = 0;
          double v19 = v47;
          double v20 = v48;
          goto LABEL_8;
        case 2uLL:
          double v21 = v51;
          double v22 = v52;
          TSURandom();
          double v24 = v21 + (v23 + -0.5) * v12;
          TSURandom();
          objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v24, v22 + (v25 + -0.5) * v12, v47, v48, v49, v50);
          break;
        case 3uLL:
          double v20 = v45;
          double v19 = v46;
          double v47 = v46;
          double v48 = v45;
          int v18 = 1;
LABEL_8:
          unint64_t v26 = 0;
          unsigned int v27 = 1;
          do
          {
            [v7 currentPoint];
            double v29 = v28;
            double v31 = v30;
            double v32 = TSDSubtractPoints(v19, v20, v28);
            double v34 = v33;
            float v35 = 1.0;
            unint64_t v36 = a4 - v26;
            if (v36)
            {
              TSURandom();
              *(float *)&double v37 = v37 + 0.5;
              float v35 = fminf((float)(1.0 / (float)v36) * *(float *)&v37, 1.0);
            }
            double v38 = v35;
            double v39 = v29 + v32 * v38;
            double v40 = v31 + v34 * v38;
            TSURandom();
            double v42 = v39 + (v41 + -0.5) * v12;
            TSURandom();
            objc_msgSend(v7, "lineToPoint:", v42, v40 + (v43 + -0.5) * v12);
            unint64_t v26 = v27++;
          }
          while (v26 <= a4);
          if (v18) {
            [v7 closePath];
          }
          break;
        default:
          break;
      }
      ++v10;
    }
    while (v10 != v9);
  }
  return v7;
}

- (BOOL)isOpen
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TSDBezierPath *)self elementCount];
  double v5 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v3 < 1)
  {
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
    double v10 = *MEMORY[0x263F00148];
    return v4 != v9 || v10 != v5;
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = 0;
    int v8 = 0;
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
    double v10 = *MEMORY[0x263F00148];
    while (2)
    {
      switch([(TSDBezierPath *)self elementAtIndex:v7 associatedPoints:&v12])
      {
        case 0uLL:
          double v5 = v12;
          double v9 = v13;
          if (!v8)
          {
            double v10 = v12;
            double v4 = v13;
          }
          ++v8;
          goto LABEL_9;
        case 1uLL:
          double v5 = v12;
          double v9 = v13;
          goto LABEL_9;
        case 2uLL:
          double v5 = v14;
          double v9 = v15;
          goto LABEL_9;
        case 3uLL:
          goto LABEL_11;
        default:
LABEL_9:
          if (v6 != ++v7) {
            continue;
          }
          if (v8 <= 1) {
            return v4 != v9 || v10 != v5;
          }
LABEL_11:
          BOOL result = 0;
          break;
      }
      break;
    }
  }
  return result;
}

- (BOOL)isLineSegment
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL result = 0;
  if ([(TSDBezierPath *)self elementCount] == 2
    && ![(TSDBezierPath *)self elementAtIndex:0])
  {
    unint64_t v4 = [(TSDBezierPath *)self elementAtIndex:1];
    if (v4 == 1) {
      return 1;
    }
    if (v4 == 2)
    {
      [(TSDBezierPath *)self elementAtIndex:0 associatedPoints:v9];
      [(TSDBezierPath *)self elementAtIndex:1 associatedPoints:&v10];
      double v5 = v10;
      double v6 = v11;
      double v7 = v12;
      double v8 = v13;
      if (TSDNearlyCollinearPoints(v9[0], v9[1], v10, v11, v12, v13)
        && TSDNearlyCollinearPoints(v5, v6, v7, v8, v14, v15))
      {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)intersectsRect:(CGRect)a3 hasFill:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([(TSDBezierPath *)self elementCount] < 2)
  {
LABEL_2:
    LOBYTE(v10) = 0;
    return v10;
  }
  [(TSDBezierPath *)self bounds];
  BOOL v10 = TSDIntersectsRect(v11, v12, v13, v14, x, y, width, height);
  if (!v10) {
    return v10;
  }
  if (!v4)
  {
LABEL_8:
    id v19 = [(TSDBezierPath *)self bezierPathByFlatteningPath];
    double v20 = *MEMORY[0x263F00148];
    double v21 = *(double *)(MEMORY[0x263F00148] + 8);
    uint64_t v22 = [v19 elementCount];
    if (v22 >= 1)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      CGFloat v25 = v21;
      CGFloat v26 = v20;
      do
      {
        uint64_t v27 = [v19 elementAtIndex:v24 associatedPoints:&v34];
        switch(v27)
        {
          case 3:
            if (TSDLineIntersectsRect(v26, v25, v20, v21, x, y, width, height)) {
              goto LABEL_19;
            }
            break;
          case 1:
            double v32 = v21;
            double v33 = v20;
            double v28 = v34;
            double v29 = v35;
            char v30 = TSDLineIntersectsRect(v26, v25, v34, v35, x, y, width, height);
            CGFloat v26 = v28;
            CGFloat v25 = v29;
            double v21 = v32;
            double v20 = v33;
            if (v30) {
              goto LABEL_19;
            }
            break;
          case 0:
            CGFloat v26 = v34;
            CGFloat v25 = v35;
            double v20 = v34;
            double v21 = v35;
            break;
        }
        ++v24;
      }
      while (v23 != v24);
    }
    goto LABEL_2;
  }
  double v34 = x;
  double v35 = y;
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v43);
  v44.origin.double x = x;
  v44.origin.double y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  CGFloat v36 = MaxX;
  CGFloat MinY = CGRectGetMinY(v44);
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  CGFloat v16 = CGRectGetMaxX(v45);
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  CGFloat v38 = v16;
  CGFloat MaxY = CGRectGetMaxY(v46);
  v47.origin.double x = x;
  v47.origin.double y = y;
  v47.size.double width = width;
  v47.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v47);
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  uint64_t v18 = 0;
  CGFloat v40 = MinX;
  CGFloat v41 = CGRectGetMaxY(v48);
  while (!-[TSDBezierPath containsPoint:](self, "containsPoint:", *(double *)((char *)&v34 + v18), *(double *)((char *)&v34 + v18 + 8)))
  {
    v18 += 16;
    if (v18 == 64) {
      goto LABEL_8;
    }
  }
LABEL_19:
  LOBYTE(v10) = 1;
  return v10;
}

- (void)addPathToContext:(CGContext *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TSDBezierPath *)self elementCount];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      switch([(TSDBezierPath *)self elementAtIndex:i associatedPoints:&v8])
      {
        case 0uLL:
          CGContextMoveToPoint(a3, v8, v9);
          break;
        case 1uLL:
          CGContextAddLineToPoint(a3, v8, v9);
          break;
        case 2uLL:
          CGContextAddCurveToPoint(a3, v8, v9, v10, v11, v12, v13);
          break;
        case 3uLL:
          CGContextClosePath(a3);
          break;
        default:
          continue;
      }
    }
  }
}

- (CGPoint)roundPoint:(CGPoint)a3 inContext:(CGContext *)a4 strokeWidth:(int)a5
{
  char v5 = a5;
  CGPoint v7 = CGContextConvertPointToDeviceSpace(a4, a3);
  double v8 = TSDRoundedPoint();
  if (v5)
  {
    float x = v7.x;
    if (v8 - x <= 0.0) {
      double v12 = 0.5;
    }
    else {
      double v12 = -0.5;
    }
    double v8 = v8 + v12;
    float y = v7.y;
    if (v9 - y <= 0.0) {
      double v13 = 0.5;
    }
    else {
      double v13 = -0.5;
    }
    double v9 = v9 + v13;
  }

  CGPoint v16 = CGContextConvertPointToUserSpace(a4, *(CGPoint *)&v8);
  double v15 = v16.y;
  double v14 = v16.x;
  result.float y = v15;
  result.float x = v14;
  return result;
}

- (id)p_aliasedPathInContext:(CGContext *)a3 viewScale:(float)a4 effectiveStrokeWidth:(float)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v9 = [(TSDBezierPath *)self elementCount];
  TSURound();
  if (!v9) {
    return self;
  }
  int v70 = (int)v10;
  if (vabds_f32((float)(int)v10, a5) > 0.1) {
    return self;
  }
  if (a3)
  {
    memset(&v84, 0, sizeof(v84));
    CGContextGetUserSpaceToDeviceSpaceTransform(&v84, a3);
    CGAffineTransform v77 = v84;
    if (TSDIsTransformAxisAligned(&v77.a))
    {
      BOOL v69 = fabs(v84.a) < fabs(v84.b);
      goto LABEL_9;
    }
    return self;
  }
  BOOL v69 = 0;
LABEL_9:
  id v11 = +[TSDBezierPath bezierPath];
  if (v9 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v75 = 0;
    int v74 = 0;
    int v72 = 0;
    int v14 = 0;
    uint64_t v71 = 0;
    uint64_t v73 = 0;
    double v68 = a4;
    double v15 = (float)(1.0 / a4);
    double v16 = 0.5;
    while (2)
    {
      int v17 = 0;
      switch([(TSDBezierPath *)self elementAtIndex:v13 associatedPoints:&v84.c])
      {
        case 0uLL:
          objc_msgSend(v11, "moveToPoint:", v84.c, v84.d);
          int v72 = 0;
          int v74 = 0;
          uint64_t v75 = 0;
          uint64_t v71 = [v11 elementCount] - 1;
          int v14 = 1;
          p_double c = &v84.c;
          uint64_t v73 = v13;
          goto LABEL_45;
        case 1uLL:
          goto LABEL_18;
        case 2uLL:
          double a = v84.a;
          double b = v84.b;
          double c = v84.c;
          double d = v84.d;
          if (TSDNearlyEqualPoints(v84.a, v84.b, v84.c, v84.d)
            && TSDNearlyEqualPoints(a, b, v84.tx, v84.ty)
            && TSDNearlyEqualPoints(a, b, *(double *)&v85, *((double *)&v85 + 1)))
          {
            goto LABEL_46;
          }
          [v11 currentPoint];
          double v25 = TSDSubtractPoints(v23, v24, v84.a);
          v84.double c = TSDAddPoints(c, d, v25);
          v84.double d = v26;
          objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v85, v84.c, v26, v84.tx, v84.ty);
          int v14 = 0;
          uint64_t v75 = 0;
          p_double c = (CGFloat *)&v85;
          goto LABEL_45;
        case 3uLL:
          [(TSDBezierPath *)self elementAtIndex:v73 associatedPoints:&v84.c];
          int v17 = 1;
LABEL_18:
          double v28 = v84.a;
          double v27 = v84.b;
          double v30 = v84.c;
          double v29 = v84.d;
          double v31 = fabs(TSDSubtractPoints(v84.a, v84.b, v84.c));
          double v33 = fabs(v32);
          BOOL v34 = v33 > v31 + v15 * -0.01 && v31 < v15;
          BOOL v35 = v31 > v33 + v15 * -0.01 && v33 < v15;
          if (v35 || v34)
          {
            if (v35 && v34)
            {
              if ((v17 & (v74 | v72)) == 1)
              {
                [v11 elementAtIndex:v71 associatedPoints:&v84.c];
              }
              else if (objc_msgSend(v11, "elementAtIndex:associatedPoints:", objc_msgSend(v11, "elementCount") - 1, &v84.c) == 2)
              {
                *(_OWORD *)&v84.double c = v85;
              }
              CGPoint v76 = *(CGPoint *)&v84.c;
              double y = v84.d;
              double x = v84.c;
            }
            else
            {
              if (a3)
              {
                v87.double x = v28;
                v87.double y = v27;
                *(void *)&double v39 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(a3, v87);
                *(void *)&double v40 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(a3, *(CGPoint *)&v84.c);
              }
              else
              {
                double v39 = TSDMultiplyPointScalar(v28, v27, v68);
                double v16 = 0.5;
                double v40 = TSDMultiplyPointScalar(v30, v29, v68);
              }
              double v48 = v40;
              if (vabdd_f64(v39, v40) < 0.1) {
                double v48 = v39;
              }
              if (v69) {
                BOOL v49 = v34;
              }
              else {
                BOOL v49 = v35;
              }
              if (v70)
              {
                if (v69) {
                  BOOL v52 = v35;
                }
                else {
                  BOOL v52 = v34;
                }
                double v51 = v39 + v16;
                double v50 = v48 + v16;
                if (v52)
                {
                  BYTE4(v75) = 1;
                  int v53 = v14;
                  int v54 = v74;
                }
                else
                {
                  if ((v75 & 0x100000000) == 0) {
                    double v51 = v39;
                  }
                  int v54 = v74;
                  int v53 = v17 & v74;
                  if ((v17 & v74) == 0) {
                    double v50 = v48;
                  }
                }
                int v74 = v53 | v54;
                if (v49)
                {
                  v72 |= v14;
                  LOBYTE(v75) = 1;
                }
              }
              else
              {
                double v50 = v48;
                double v51 = v39;
              }
              double v55 = TSDAliasRoundedPoint(v51);
              double v57 = v56;
              double v59 = TSDAliasRoundedPoint(v50);
              double v60 = v58;
              v76.double x = v59;
              v76.double y = v58;
              if ((v75 & 0x100000000) != 0)
              {
                double v55 = v55 + -0.5;
                double v59 = v59 + -0.5;
                v76.double x = v59;
              }
              if (v75)
              {
                double v57 = v57 + -0.5;
                double v60 = v58 + -0.5;
                v76.double y = v58 + -0.5;
              }
              if (a3)
              {
                v88.double x = v55;
                v88.double y = v57;
                CGPoint v61 = CGContextConvertPointToUserSpace(a3, v88);
                double x = v61.x;
                double y = v61.y;
                CGPoint v64 = CGContextConvertPointToUserSpace(a3, v76);
                CGFloat v63 = v64.y;
                double v62 = v64.x;
              }
              else
              {
                double x = TSDMultiplyPointScalar(v55, v57, v15);
                double y = v65;
                double v62 = TSDMultiplyPointScalar(v59, v60, v15);
              }
              double v16 = 0.5;
              v76.double x = v62;
              v76.double y = v63;
              if (v35)
              {
                if ((v14 & 1) == 0)
                {
                  [v11 currentPoint];
                  double x = v66;
                }
                if (v13 + 1 < v9 && -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:")) {
                  v76.double x = v84.c;
                }
              }
              else if (v34)
              {
                if ((v14 & 1) == 0)
                {
                  [v11 currentPoint];
                  double y = v67;
                }
                if (v13 + 1 < v9 && -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:")) {
                  v76.double y = v84.d;
                }
              }
            }
            if (objc_msgSend(v11, "elementAtIndex:associatedPoints:", objc_msgSend(v11, "elementCount") - 1, &v78) == 2)
            {
              double v43 = v80;
              double v44 = v81;
              double v45 = TSDSubtractPoints(x, y, v82);
              double v80 = TSDAddPoints(v43, v44, v45);
              double v81 = v46;
              double v82 = x;
              CGRect v47 = (double *)&v83;
            }
            else
            {
              double v78 = x;
              CGRect v47 = (double *)&v79;
            }
            *CGRect v47 = y;
            objc_msgSend(v11, "setAssociatedPoints:atIndex:", &v78, objc_msgSend(v11, "elementCount") - 1);
            if (v17)
            {
              [v11 setAssociatedPoints:&v76 atIndex:v71];
              CGFloat v36 = v11;
LABEL_41:
              [v36 closePath];
              goto LABEL_44;
            }
            double v38 = v76.y;
            double v37 = v76.x;
            CGFloat v36 = v11;
          }
          else
          {
            CGFloat v36 = v11;
            if (v17) {
              goto LABEL_41;
            }
            double v37 = v30;
            double v38 = v29;
          }
          objc_msgSend(v36, "lineToPoint:", v37, v38);
LABEL_44:
          int v14 = 0;
          p_double c = &v84.c;
LABEL_45:
          *(_OWORD *)&v84.double a = *(_OWORD *)p_c;
LABEL_46:
          if (v9 == ++v13) {
            return v11;
          }
          continue;
        default:
          goto LABEL_46;
      }
    }
  }
  return v11;
}

- (id)aliasedPathInContext:(CGContext *)a3 effectiveStrokeWidth:(float)a4
{
  *(float *)&double v4 = a4;
  LODWORD(v5) = 1.0;
  return [(TSDBezierPath *)self p_aliasedPathInContext:a3 viewScale:v5 effectiveStrokeWidth:v4];
}

- (id)aliasedPathWithViewScale:(float)a3 effectiveStrokeWidth:(float)a4
{
  return -[TSDBezierPath p_aliasedPathInContext:viewScale:effectiveStrokeWidth:](self, "p_aliasedPathInContext:viewScale:effectiveStrokeWidth:", 0);
}

+ (TSDBezierPath)bezierPathWithConvexHullOfPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  uint64_t v6 = +[TSDBezierPath bezierPath];
  CGPoint v7 = v6;
  double x = a3->x;
  double y = a3->y;
  if (a4)
  {
    p_double y = &a3->y;
    unint64_t v11 = a4;
    do
    {
      if (*(p_y - 1) < x)
      {
        double y = *p_y;
        double x = *(p_y - 1);
      }
      p_y += 2;
      --v11;
    }
    while (v11);
  }
  -[TSDBezierPath moveToPoint:](v6, "moveToPoint:", x, y);
  double v12 = x;
  double v13 = y;
  do
  {
    double v14 = a3->x;
    double v15 = a3->y;
    double v16 = &a3->y;
    for (unint64_t i = a4; i; --i)
    {
      double v18 = *(v16 - 1);
      double v19 = *v16;
      if (v18 != v12 || v19 != v13)
      {
        BOOL v21 = v14 == v12 && v15 == v13;
        if (v21
          || (double v22 = (v15 - v13) * (v18 - v12), v23 = (v14 - v12) * (v19 - v13), v22 < v23)
          && vabdd_f64(v22, v23) >= 0.01)
        {
          double v14 = *(v16 - 1);
          double v15 = *v16;
        }
      }
      v16 += 2;
    }
    -[TSDBezierPath lineToPoint:](v7, "lineToPoint:", v14, v15);
    BOOL v24 = v14 == x && v15 == y;
    double v12 = v14;
    double v13 = v15;
  }
  while (!v24);
  -[TSDBezierPath lineToPoint:](v7, "lineToPoint:", x, y);
  [(TSDBezierPath *)v7 closePath];
  return v7;
}

- (id)bezierPathByFittingCurve
{
  id v3 = +[TSDCurveFitter curveFitter];

  return [(TSDBezierPath *)self bezierPathByFittingCurve:v3];
}

- (id)bezierPathByFittingCurve:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [(TSDBezierPath *)self bezierPathByFlatteningPath];
  uint64_t v5 = [v4 elementCount];
  if (!v5) {
    return v4;
  }
  int64_t v6 = v5;
  uint64_t v7 = *MEMORY[0x263F00148];
  uint64_t v8 = *(void *)(MEMORY[0x263F00148] + 8);
  if ([v4 isRectangular]) {
    return v4;
  }
  double v10 = malloc_type_calloc(v6, 0x10uLL, 0x1000040451B5BE8uLL);
  id v9 = +[TSDBezierPath bezierPath];
  if (v6 >= 1)
  {
    int v11 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v13 = [v4 elementAtIndex:i associatedPoints:&v17];
      switch(v13)
      {
        case 3:
          if (v11 >= 2)
          {
            double v14 = &v10[2 * v11];
            *double v14 = v7;
            v14[1] = v8;
            double v15 = (void *)[a3 bezierPathFittingPointArray:v10 count:(v11 + 1)];
            [v15 closePath];
            [v9 appendBezierPath:v15];
          }
          int v11 = 0;
          break;
        case 1:
          *(_OWORD *)&v10[2 * v11++] = v17;
          break;
        case 0:
          if (v11 >= 2) {
            objc_msgSend(v9, "appendBezierPath:", objc_msgSend(a3, "bezierPathFittingPointArray:count:", v10, v11));
          }
          uint64_t v8 = *((void *)&v17 + 1);
          uint64_t v7 = v17;
          *double v10 = v17;
          v10[1] = v8;
          int v11 = 1;
          break;
      }
    }
    if (v11 >= 2) {
      objc_msgSend(v9, "appendBezierPath:", objc_msgSend(a3, "bezierPathFittingPointArray:count:", v10, v11));
    }
  }
  free(v10);
  return v9;
}

+ (id)uniteBezierPaths:(id)a3
{
  return (id)objc_msgSend(a1, "p_BOOLeanWithBezierPaths:operation:", a3, 0);
}

+ (id)intersectBezierPaths:(id)a3
{
  return (id)objc_msgSend(a1, "p_BOOLeanWithBezierPaths:operation:", a3, 1);
}

+ (id)subtractBezierPaths:(id)a3
{
  return (id)objc_msgSend(a1, "p_BOOLeanWithBezierPaths:operation:", a3, 2);
}

+ (id)excludeBezierPaths:(id)a3
{
  id v4 = +[TSDBezierPath p_BOOLeanWithBezierPaths:a3 operation:0];
  id v5 = +[TSDBezierPath p_BOOLeanWithBezierPaths:a3 operation:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, v5, 0);

  return +[TSDBezierPath p_BOOLeanWithBezierPaths:v6 operation:2];
}

+ (id)appendBezierPaths:(id)a3
{
  id v4 = +[TSDBezierPath bezierPath];
  id v5 = (void *)[a3 objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      [v4 appendBezierPath:v7];
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
  return v4;
}

+ (id)outlineBezierPath:(id)a3
{
  return +[TSDBezierPath outlineBezierPath:a3 withThreshold:-1.0];
}

+ (id)outlineBezierPath:(id)a3 withThreshold:(double)a4
{
  objc_msgSend(a3, "lineWidth", a4);
  if (v6 != 0.0)
  {
    objc_msgSend(a1, "p_bezierToPath:", a3);
    [a3 lineJoinStyle];
    [a3 lineCapStyle];
    operator new();
  }
  return a3;
}

+ (id)outsideEdgeOfBezierPath:(id)a3
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  +[TSDBezierPath p_bezierToPath:](TSDBezierPath, "p_bezierToPath:");
  operator new();
}

+ (id)exteriorOfBezierPath:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 elementCount];
  uint64_t v5 = v4 - 1;
  if (v4 >= 1)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    id v8 = 0;
    uint64_t v9 = 0;
    BOOL v10 = 1;
    while (1)
    {
      uint64_t v11 = v7 + 1;
      if (v5 == v7 || ![a3 elementAtIndex:v7 + 1])
      {
        if (v10)
        {
          if (!v8) {
            id v8 = +[TSDBezierPath bezierPath];
          }
          [v8 appendBezierPath:a3 fromSegment:v9 toSegment:v7 + 1];
        }
        if (v11 < v5)
        {
          [a3 elementAtIndex:v7 + 1 associatedPoints:v17];
          int v12 = objc_msgSend(v8, "containsPoint:", v17[0], v17[1]) ^ 1;
          if ((v12 & 1) == 0)
          {
            uint64_t v13 = [a3 elementAtIndex:v7 + 2 associatedPoints:&v18];
            if (v13 == 2)
            {
              double v14 = *(double *)&v19[3];
              double v15 = (double *)v20;
LABEL_17:
              int v12 = objc_msgSend(v8, "containsPoint:", v14, *v15) ^ 1;
            }
            else if (v13 == 1)
            {
              double v14 = v18;
              double v15 = (double *)v19;
              goto LABEL_17;
            }
          }
          BOOL v10 = v12 != 0;
          goto LABEL_19;
        }
        BOOL v10 = 0;
      }
      uint64_t v11 = v9;
LABEL_19:
      ++v7;
      uint64_t v9 = v11;
      if (v6 == v7) {
        goto LABEL_22;
      }
    }
  }
  id v8 = 0;
LABEL_22:
  if (v8) {
    return v8;
  }
  else {
    return a3;
  }
}

+ (id)smoothBezierPath:(id)a3 withThreshold:(double)a4
{
  uint64_t v6 = (Path *)objc_msgSend(a1, "p_bezierToPath:", a3);
  float v7 = a4;
  Path::Coalesce(v6, v7);
  id v8 = objc_msgSend(a1, "p_pathToBezier:", v6);
  if (v6)
  {
    Path::~Path(v6);
    MEMORY[0x223CB8F20]();
  }
  return v8;
}

+ (Path)p_bezierToPath:(id)a3
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  operator new();
}

+ (id)p_pathToBezier:(Path *)a3
{
  id v4 = +[TSDBezierPath bezierPath];
  int var2 = a3->var2;
  if (var2 >= 1)
  {
    uint64_t v6 = 0;
    double v8 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
    uint64_t v9 = 44 * var2;
    while (1)
    {
      var3 = a3->var3;
      switch(*(_DWORD *)((char *)var3 + v6))
      {
        case 0:
          uint64_t v11 = (float *)((char *)var3 + v6);
          double v8 = v11[4];
          double v7 = v11[5];
          objc_msgSend(v4, "moveToPoint:", v8, v7);
          goto LABEL_28;
        case 1:
          int v12 = (float *)((char *)var3 + v6);
          double v8 = v12[4];
          double v7 = v12[5];
          objc_msgSend(v4, "lineToPoint:", v8, v7);
          goto LABEL_28;
        case 2:
          uint64_t v13 = (float *)((char *)var3 + v6);
          double v14 = v13[4];
          double v15 = v13[5];
          objc_msgSend(v4, "curveToPoint:controlPoint1:controlPoint2:", v14, v15, v8 + v13[6] * 0.333333333, v7 + v13[7] * 0.333333333, v14 - v13[8] * 0.333333333, v15 - v13[9] * 0.333333333);
          double v7 = v15;
          double v8 = v14;
          goto LABEL_28;
        case 4:
          double v16 = (float *)((char *)var3 + v6);
          double v17 = v16[6];
          double v18 = v16[7];
          int v19 = *((unsigned __int8 *)v16 + 36);
          int v20 = *((unsigned __int8 *)v16 + 37);
          double v41 = v16[4];
          double v42 = v8;
          double v43 = v7;
          double v40 = v16[5];
          __double2 v21 = __sincos_stret(v16[8]);
          double v44 = v18;
          double v45 = v17;
          double v22 = TSDDotPoints(v41 - v8, v40 - v7, v21.__cosval, v21.__sinval) / v17;
          double v23 = TSDCrossPoints(v41 - v8, v40 - v7, v21.__cosval, v21.__sinval) / v18;
          double v24 = TSDDotPoints(v22, v23, v22, v23);
          double v25 = 0.0;
          if (v24 < 4.0)
          {
            float v26 = sqrt(1.0 / v24 + -0.25);
            double v25 = v26;
          }
          double v27 = v23 * v25;
          double v28 = -(v22 * v25);
          double v29 = -(v23 * v25 - v22 * -0.5);
          double v30 = 3.14159265;
          if (v29 > -1.0)
          {
            double v30 = 0.0;
            if (v29 < 1.0)
            {
              double v30 = acos(v29);
              if (-(v28 - v23 * -0.5) < 0.0) {
                double v30 = 6.28318531 - v30;
              }
            }
          }
          double v31 = v22 * 0.5 - v23 * v25;
          double v32 = 3.14159265;
          if (v31 > -1.0)
          {
            double v32 = 0.0;
            if (v31 < 1.0)
            {
              double v32 = acos(v31);
              if (v23 * 0.5 - v25 * -v22 < 0.0) {
                double v32 = 6.28318531 - v32;
              }
            }
          }
          double v33 = v28 * v44;
          double v34 = TSDDotPoints(v27 * v45, v28 * v44, v21.__cosval, -v21.__sinval);
          double v35 = TSDCrossPoints(v27 * v45, v33, v21.__cosval, -v21.__sinval);
          if (v20)
          {
            if (v19) {
              goto LABEL_19;
            }
          }
          else if (!v19)
          {
LABEL_19:
            double v34 = -v34;
            double v35 = -v35;
            double v36 = v30 + 3.14159265;
            double v30 = v32 + 3.14159265;
            if (v36 >= 6.28318531) {
              double v32 = v36 + -6.28318531;
            }
            else {
              double v32 = v36;
            }
            double v37 = v42;
            double v38 = v43;
            double v7 = v40;
            double v8 = v41;
            if (v30 >= 6.28318531) {
              double v30 = v30 + -6.28318531;
            }
            goto LABEL_27;
          }
          double v37 = v42;
          double v38 = v43;
          double v7 = v40;
          double v8 = v41;
LABEL_27:
          objc_msgSend(v4, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v20 != 0, v34 + (v37 + v8) * 0.5, v35 + (v38 + v7) * 0.5, v45, v30 * 180.0 / 3.14159265, v32 * 180.0 / 3.14159265);
LABEL_28:
          v6 += 44;
          if (v9 == v6) {
            return v4;
          }
          break;
        case 5:
          [v4 closePath];
          goto LABEL_28;
        default:
          goto LABEL_28;
      }
    }
  }
  return v4;
}

+ (CGRect)p_pathToBounds:(Path *)a3
{
  uint64_t var8 = a3->var8;
  if ((int)var8 >= 1)
  {
    double v8 = (float *)(a3->var11 + 8);
    char v9 = 1;
    do
    {
      if (v9)
      {
        double v5 = 0.0;
        double v3 = *(v8 - 1);
        double v4 = *v8;
        double v6 = 0.0;
      }
      else
      {
        double v3 = TSDGrowRectToPoint(v3, v4, v5, v6, *(v8 - 1), *v8);
      }
      char v9 = 0;
      v8 += 3;
      --var8;
    }
    while (var8);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (id)p_BOOLeanWithBezierPaths:(id)a3 operation:(int)a4
{
  unint64_t v6 = [a3 count];
  if (v6 >> 31)
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"+[TSDBezierPath(LivarotPrivate) p_BOOLeanWithBezierPaths:operation:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 2453, @"Out-of-bounds type assignment failed");
    return 0;
  }
  else
  {
    unint64_t v7 = v6;
    if (v6 == 1)
    {
      return (id)[a3 lastObject];
    }
    else
    {
      if (v6)
      {
        char v9 = malloc_type_malloc(8 * v6, 0x2004093837F09uLL);
        uint64_t v10 = 0;
        do
        {
          v9[v10] = objc_msgSend(a1, "p_bezierToPath:", objc_msgSend(a3, "objectAtIndex:", v10));
          ++v10;
        }
        while (v7 != v10);
        operator new();
      }
      return +[TSDBezierPath bezierPath];
    }
  }
}

+ (id)tracedPathForImage:(CGImage *)a3 alphaThreshold:(double)a4 pointSpacing:(double)a5
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  id v8 = +[TSDBezierPath bezierPath];
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  if (AlphaInfo <= kCGImageAlphaNoneSkipFirst && ((1 << AlphaInfo) & 0x61) != 0)
  {
    [v8 appendBezierPathWithRect:TSDRectWithSize()];
  }
  else
  {
    float v10 = fminf((float)Width, 1024.0);
    float v11 = fminf((float)Height, 1024.0) / (float)Height;
    if (v11 >= (float)(v10 / (float)Width)) {
      float v12 = v10 / (float)Width;
    }
    else {
      float v12 = v11;
    }
    double v13 = ceil((double)Width * v12) + 2.0;
    size_t v14 = (unint64_t)v13;
    double v15 = ceil((double)Height * v12) + 2.0;
    double v16 = (unsigned __int8 *)malloc_type_calloc((unint64_t)(v15 * (double)(unint64_t)v13), 1uLL, 0x100004077774924uLL);
    double v17 = CGBitmapContextCreate(v16, v14, (unint64_t)v15, 8uLL, v14, 0, 7u);
    CGContextSetBlendMode(v17, kCGBlendModeCopy);
    v82.size.double width = v13 + -2.0;
    v82.size.double height = v15 + -2.0;
    v82.origin.double x = 1.0;
    v82.origin.double y = 1.0;
    CGContextDrawImage(v17, v82, a3);
    CGContextFlush(v17);
    CGContextRelease(v17);
    TSUClamp();
    double v19 = v15 + -1.0;
    double v68 = v12;
    float v69 = v12;
    if (v19 <= 1.0)
    {
      uint64_t v79 = 0;
      uint64_t v80 = 0;
      CGAffineTransform v77 = 0;
      double v78 = (uint64_t *)&v79;
      long long __p = 0uLL;
    }
    else
    {
      unsigned int v20 = (v18 * 255.0);
      double v21 = v13 + -1.0;
      double v22 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          uint64_t v23 = 1;
          do
          {
            v16[(int)v22 * v14 + v23] = v16[(int)v22 * v14 + v23] >= v20;
            ++v23;
          }
          while (v21 > (double)v23);
        }
        double v22 = v22 + 1.0;
      }
      while (v22 < v19);
      uint64_t v79 = 0;
      uint64_t v80 = 0;
      double v78 = (uint64_t *)&v79;
      double v24 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          size_t v25 = (int)v24 * v14;
          int v26 = v16[v25];
          double v27 = 1.0;
          do
          {
            int v28 = v26;
            int v26 = v16[v25 + (int)v27];
            if (v28 != 1 && v26 == 1)
            {
              *(double *)&long long __p = v27 + 0.5;
              *((double *)&__p + 1) = v24 + 0.5;
              std::__tree<CGPoint>::__emplace_unique_key_args<CGPoint,CGPoint>(&v78, (double *)&__p, &__p);
            }
            double v27 = v27 + 1.0;
          }
          while (v27 < v21);
        }
        double v24 = v24 + 1.0;
      }
      while (v24 < v19);
      long long __p = 0uLL;
      CGAffineTransform v77 = 0;
      while (v80)
      {
        CGPoint v75 = (CGPoint)*((_OWORD *)v78 + 2);
        std::__tree<CGPoint>::__erase_unique<CGPoint>(&v78, &v75.x);
        unint64_t v29 = __p;
        *((void *)&__p + 1) = __p;
        CGPoint v74 = v75;
        double v31 = TSDFlooredPoint(v75.x);
        if (v16[(int)(v30 - 1.0) * v14 + (int)(v31 - 1.0)]) {
          double v32 = v30 + 1.0;
        }
        else {
          double v32 = v30;
        }
        double v33 = v31 + -1.0;
        double v34 = v32 + -1.0;
        if (v29 >= (unint64_t)v77)
        {
          unint64_t v36 = 0x5555555555555556 * ((uint64_t)((uint64_t)v77 - v29) >> 3);
          if (v36 <= 1) {
            unint64_t v36 = 1;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v77 - v29) >> 3) >= 0x555555555555555) {
            unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v37 = v36;
          }
          double v38 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v77, v37);
          *double v38 = v33;
          v38[1] = v34;
          *((void *)v38 + 2) = 8;
          double v40 = (double *)*((void *)&__p + 1);
          double v41 = (double *)__p;
          double v42 = v38;
          if (*((void *)&__p + 1) != (void)__p)
          {
            do
            {
              long long v43 = *(_OWORD *)(v40 - 3);
              *(v42 - 1) = *(v40 - 1);
              *(_OWORD *)(v42 - 3) = v43;
              v42 -= 3;
              v40 -= 3;
            }
            while (v40 != v41);
            double v40 = (double *)__p;
          }
          double v35 = (char *)(v38 + 3);
          *(void *)&long long __p = v42;
          *((void *)&__p + 1) = v38 + 3;
          CGAffineTransform v77 = &v38[3 * v39];
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          *(double *)unint64_t v29 = v33;
          *(double *)(v29 + 8) = v34;
          double v35 = (char *)(v29 + 24);
          *(void *)(v29 + 16) = 8;
        }
        *((void *)&__p + 1) = v35;
        double v44 = v32;
        double v45 = v31;
        do
        {
          v81.double x = v45;
          v81.double y = v44;
          nextPivotAndBlackVectors(v74, v81, &v73, &v72);
          double v46 = v74.x + v73.x;
          double v47 = v74.y + v73.y;
          double v48 = TSDFlooredPoint(v74.x + v73.x);
          if (v16[(int)v49 * v14 + (int)v48])
          {
            v74.double x = v46;
            v74.double y = v47;
            std::__tree<CGPoint>::__erase_unique<CGPoint>(&v78, &v74.x);
          }
          else
          {
            double x = v72.x;
            double y = v72.y;
            unsigned int v52 = directionForVector(v72);
            unsigned int v53 = v52;
            unint64_t v54 = *((void *)&__p + 1);
            if (*((void *)&__p + 1) != (void)__p && *(_DWORD *)(*((void *)&__p + 1) - 8) == v52)
            {
              unint64_t v54 = *((void *)&__p + 1) - 24;
              *((void *)&__p + 1) -= 24;
            }
            double v45 = v45 + x;
            double v44 = v44 + y;
            double v55 = v45 + -1.0;
            double v56 = v44 + -1.0;
            if (v54 >= (unint64_t)v77)
            {
              unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - __p) >> 3);
              unint64_t v59 = v58 + 1;
              if (v58 + 1 > 0xAAAAAAAAAAAAAAALL) {
                abort();
              }
              if (0x5555555555555556 * ((uint64_t)((uint64_t)v77 - __p) >> 3) > v59) {
                unint64_t v59 = 0x5555555555555556 * ((uint64_t)((uint64_t)v77 - __p) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v77 - __p) >> 3) >= 0x555555555555555) {
                unint64_t v60 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v60 = v59;
              }
              if (v60) {
                CGPoint v61 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v77, v60);
              }
              else {
                CGPoint v61 = 0;
              }
              double v62 = (double *)&v61[24 * v58];
              *double v62 = v55;
              v62[1] = v56;
              *((_DWORD *)v62 + 4) = v53;
              *((_DWORD *)v62 + 5) = 0;
              CGFloat v63 = (double *)*((void *)&__p + 1);
              CGPoint v64 = (double *)__p;
              double v65 = v62;
              if (*((void *)&__p + 1) != (void)__p)
              {
                do
                {
                  long long v66 = *(_OWORD *)(v63 - 3);
                  *(v65 - 1) = *(v63 - 1);
                  *(_OWORD *)(v65 - 3) = v66;
                  v65 -= 3;
                  v63 -= 3;
                }
                while (v63 != v64);
                CGFloat v63 = (double *)__p;
              }
              unint64_t v57 = (unint64_t)(v62 + 3);
              *(void *)&long long __p = v65;
              *((void *)&__p + 1) = v62 + 3;
              CGAffineTransform v77 = (double *)&v61[24 * v60];
              if (v63) {
                operator delete(v63);
              }
            }
            else
            {
              *(double *)unint64_t v54 = v55;
              *(double *)(v54 + 8) = v56;
              unint64_t v57 = v54 + 24;
              *(void *)(v54 + 16) = v52;
            }
            *((void *)&__p + 1) = v57;
          }
        }
        while (v31 != v45 || v32 != v44);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&__p + 1) - __p) >> 3) >= 2) {
          buildSimplifiedPathFromPoints(v8, (long long **)&__p, a5);
        }
      }
    }
    free(v16);
    if (v69 != 1.0)
    {
      CGAffineTransformMakeScale(&v71, 1.0 / v68, 1.0 / v68);
      [v8 transformUsingAffineTransform:&v71];
    }
    if ((void)__p)
    {
      *((void *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&v78, v79);
  }
  if ([v8 elementCount] <= 0) {
    return 0;
  }
  else {
    return v8;
  }
}

+ (id)tracedPathForInstantAlphaBinaryBitmap:(id)a3 pointSpacing:(double)a4
{
  uint64_t v5 = *((void *)a3 + 1);
  uint64_t v6 = *((void *)a3 + 2);
  id v64 = +[TSDBezierPath bezierPath];
  CGPoint v72 = 0;
  uint64_t v73 = 0;
  CGAffineTransform v71 = (uint64_t *)&v72;
  if ((unint64_t)(v6 + 1) <= 1)
  {
    long long __p = 0uLL;
    int v70 = 0;
    goto LABEL_77;
  }
  unint64_t v7 = v5 + 1;
  double v8 = 1.0;
  do
  {
    if (v7 >= 2)
    {
      int v9 = 0;
      uint64_t v10 = (uint64_t)v8;
      double v11 = 1.0;
      do
      {
        if ((uint64_t)v11 >= 1)
        {
          int v12 = 0;
          if (v10 < 1 || *((void *)a3 + 1) < (uint64_t)v11) {
            goto LABEL_10;
          }
          if (*((void *)a3 + 2) >= v10)
          {
            unint64_t v13 = (0x80uLL >> (((uint64_t)v11 - 1) & 7)) & *(unsigned __int8 *)(*((void *)a3 + 4)
                                                                             + *((void *)a3 + 3) * ((uint64_t)v8 - 1)
                                                                             + ((unint64_t)((uint64_t)v11 - 1) >> 3));
            int v12 = v13 == 0;
            if (v13) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = v9 == v12;
            }
            if (!v14)
            {
              *(double *)&long long __p = v11 + 0.5;
              *((double *)&__p + 1) = v8 + 0.5;
              std::__tree<CGPoint>::__emplace_unique_key_args<CGPoint,CGPoint>(&v71, (double *)&__p, &__p);
              int v12 = 1;
            }
            goto LABEL_10;
          }
        }
        int v12 = 0;
LABEL_10:
        double v11 = v11 + 1.0;
        int v9 = v12;
      }
      while (v11 < (double)v7);
    }
    double v8 = v8 + 1.0;
  }
  while (v8 < (double)(unint64_t)(v6 + 1));
  long long __p = 0uLL;
  int v70 = 0;
  if (v73)
  {
    double v15 = &TSDPointOne;
    do
    {
      double v16 = (double *)v15;
      CGPoint v68 = (CGPoint)*((_OWORD *)v71 + 2);
      std::__tree<CGPoint>::__erase_unique<CGPoint>(&v71, &v68.x);
      unint64_t v17 = __p;
      *((void *)&__p + 1) = __p;
      CGPoint v67 = v68;
      double v19 = TSDFlooredPoint(v68.x);
      double v20 = v18;
      uint64_t v21 = (uint64_t)(v19 - *v16);
      if (v21 >= 1)
      {
        uint64_t v22 = (uint64_t)(v18 - v16[1]);
        BOOL v23 = v22 < 1 || *((void *)a3 + 1) < v21;
        if (!v23
          && *((void *)a3 + 2) >= v22
          && (((unint64_t)*(unsigned __int8 *)(*((void *)a3 + 4)
                                                    + *((void *)a3 + 3) * (v22 - 1)
                                                    + ((unint64_t)(v21 - 1) >> 3)) << ((v21 - 1) & 7)) & 0x80) == 0)
        {
          double v20 = v18 + 1.0;
        }
      }
      double v24 = v19 + -1.0;
      double v25 = v20 + -1.0;
      if (v17 >= (unint64_t)v70)
      {
        unint64_t v27 = 0x5555555555555556 * ((uint64_t)((uint64_t)v70 - v17) >> 3);
        if (v27 <= 1) {
          unint64_t v27 = 1;
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v70 - v17) >> 3) >= 0x555555555555555) {
          unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v28 = v27;
        }
        unint64_t v29 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v70, v28);
        double v15 = (uint64_t *)v16;
        *unint64_t v29 = v24;
        v29[1] = v25;
        *((void *)v29 + 2) = 8;
        double v31 = (double *)*((void *)&__p + 1);
        double v32 = (double *)__p;
        double v33 = v29;
        if (*((void *)&__p + 1) != (void)__p)
        {
          do
          {
            long long v34 = *(_OWORD *)(v31 - 3);
            *(v33 - 1) = *(v31 - 1);
            *(_OWORD *)(v33 - 3) = v34;
            v33 -= 3;
            v31 -= 3;
          }
          while (v31 != v32);
          double v31 = (double *)__p;
        }
        int v26 = (char *)(v29 + 3);
        *(void *)&long long __p = v33;
        *((void *)&__p + 1) = v29 + 3;
        int v70 = &v29[3 * v30];
        if (v31) {
          operator delete(v31);
        }
      }
      else
      {
        *(double *)unint64_t v17 = v24;
        *(double *)(v17 + 8) = v25;
        int v26 = (char *)(v17 + 24);
        *(void *)(v17 + 16) = 8;
        double v15 = (uint64_t *)v16;
      }
      *((void *)&__p + 1) = v26;
      double v35 = v20;
      double v36 = v19;
      do
      {
        v74.double x = v36;
        v74.double y = v35;
        nextPivotAndBlackVectors(v67, v74, &v66, &v65);
        double v37 = v67.x + v66.x;
        double v38 = v67.y + v66.y;
        uint64_t v39 = (uint64_t)TSDFlooredPoint(v67.x + v66.x);
        if (v39 < 1
          || ((uint64_t v41 = (uint64_t)v40, (uint64_t)v40 >= 1) ? (v42 = *((void *)a3 + 1) < v39) : (v42 = 1),
              v42
           || *((void *)a3 + 2) < v41
           || (((unint64_t)*(unsigned __int8 *)(*((void *)a3 + 4)
                                                     + *((void *)a3 + 3) * (v41 - 1)
                                                     + ((unint64_t)(v39 - 1) >> 3)) << ((v39 - 1) & 7)) & 0x80) != 0))
        {
          double x = v65.x;
          double y = v65.y;
          unsigned int v45 = directionForVector(v65);
          unsigned int v46 = v45;
          unint64_t v47 = *((void *)&__p + 1);
          if (*((void *)&__p + 1) != (void)__p && *(_DWORD *)(*((void *)&__p + 1) - 8) == v45)
          {
            unint64_t v47 = *((void *)&__p + 1) - 24;
            *((void *)&__p + 1) -= 24;
          }
          double v36 = v36 + x;
          double v35 = v35 + y;
          double v48 = v36 + -1.0;
          double v49 = v35 + -1.0;
          if (v47 >= (unint64_t)v70)
          {
            unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v47 - __p) >> 3);
            unint64_t v52 = v51 + 1;
            if (v51 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            if (0x5555555555555556 * ((uint64_t)((uint64_t)v70 - __p) >> 3) > v52) {
              unint64_t v52 = 0x5555555555555556 * ((uint64_t)((uint64_t)v70 - __p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v70 - __p) >> 3) >= 0x555555555555555) {
              unint64_t v53 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v53 = v52;
            }
            if (v53) {
              unint64_t v54 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v70, v53);
            }
            else {
              unint64_t v54 = 0;
            }
            double v55 = (double *)&v54[24 * v51];
            double *v55 = v48;
            v55[1] = v49;
            *((_DWORD *)v55 + 4) = v46;
            *((_DWORD *)v55 + 5) = 0;
            double v56 = (double *)*((void *)&__p + 1);
            unint64_t v57 = (double *)__p;
            unint64_t v58 = v55;
            double v15 = (uint64_t *)v16;
            if (*((void *)&__p + 1) != (void)__p)
            {
              do
              {
                long long v59 = *(_OWORD *)(v56 - 3);
                *(v58 - 1) = *(v56 - 1);
                *(_OWORD *)(v58 - 3) = v59;
                v58 -= 3;
                v56 -= 3;
              }
              while (v56 != v57);
              double v56 = (double *)__p;
            }
            unint64_t v50 = (unint64_t)(v55 + 3);
            *(void *)&long long __p = v58;
            *((void *)&__p + 1) = v55 + 3;
            int v70 = (double *)&v54[24 * v53];
            if (v56) {
              operator delete(v56);
            }
          }
          else
          {
            *(double *)unint64_t v47 = v48;
            *(double *)(v47 + 8) = v49;
            unint64_t v50 = v47 + 24;
            *(void *)(v47 + 16) = v45;
            double v15 = (uint64_t *)v16;
          }
          *((void *)&__p + 1) = v50;
        }
        else
        {
          v67.double x = v37;
          v67.double y = v38;
          std::__tree<CGPoint>::__erase_unique<CGPoint>(&v71, &v67.x);
        }
      }
      while (v19 != v36 || v20 != v35);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&__p + 1) - __p) >> 3) >= 2) {
        buildSimplifiedPathFromPoints(v64, (long long **)&__p, a4);
      }
    }
    while (v73);
  }
LABEL_77:
  uint64_t v60 = [v64 elementCount];
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (v60 <= 0) {
    CGPoint v61 = 0;
  }
  else {
    CGPoint v61 = v64;
  }
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&v71, v72);
  return v61;
}

@end