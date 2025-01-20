@interface CRLBezierPath
+ ($C03DF7238EFD9881545AA7BAA15E5874)lineEndPositioningOnPath:(SEL)a3 atHead:(id)a4 headPoint:(BOOL)a5 tailPoint:(CGPoint)a6 headLineEnd:(CGPoint)a7 tailLineEnd:(id)a8 stroke:(id)a9;
+ ($C03DF7238EFD9881545AA7BAA15E5874)p_makeDefaultPositioning;
+ (CGPoint)p_findPointWithGreatestSlopeFromStartPoint:(CGPoint)a3 toPointA:(CGPoint)a4 orPointB:(CGPoint)a5;
+ (CRLBezierPath)bezierPathWithCGPath:(CGPath *)a3;
+ (CRLBezierPath)bezierPathWithContinuousCornerRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
+ (CRLBezierPath)bezierPathWithConvexHullFromWrapPath:(id)a3;
+ (CRLBezierPath)bezierPathWithConvexHullOfPoints:(CGPoint *)a3 count:(unint64_t)a4;
+ (CRLBezierPath)bezierPathWithDefaultsForErrorCases;
+ (CRLBezierPath)bezierPathWithLegacyRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
+ (CRLBezierPath)bezierPathWithOvalInRect:(CGRect)a3;
+ (CRLBezierPath)bezierPathWithRect:(CGRect)a3;
+ (CRLBezierPath)bezierPathWithRoundedRect:(CGRect)a3 upperRightRadius:(double)a4 lowerRightRadius:(double)a5 lowerLeftRadius:(double)a6 upperLeftRadius:(double)a7 useLegacyCorners:(BOOL)a8 keepNoOpElements:(BOOL)a9;
+ (CRLBezierPath)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4;
+ (double)defaultFlatness;
+ (double)defaultLineWidth;
+ (double)defaultMiterLimit;
+ (double)flatness;
+ (double)lineWidth;
+ (double)minimumLengthForSideToHaveFullContinuityWithCornerRadius1:(double)a3 cornerRadius2:(double)a4;
+ (id)appendBezierPaths:(id)a3;
+ (id)bezierPath;
+ (id)createClippedPath:(id)a3 headPositioning:(id *)a4 tailPositioning:(id *)a5 stroke:(id)a6;
+ (id)excludeBezierPaths:(id)a3;
+ (id)exteriorOfBezierPath:(id)a3;
+ (id)intersectBezierPaths:(id)a3;
+ (id)pathForObjectEraserWithPoint:(CGPoint)a3;
+ (id)smoothBezierPath:(id)a3 withThreshold:(double)a4;
+ (id)subtractBezierPaths:(id)a3;
+ (id)tracedPathForImage:(CGImage *)a3 alphaThreshold:(double)a4 pointSpacing:(double)a5;
+ (id)tracedPathForInstantAlphaBinaryBitmap:(id)a3 pointSpacing:(double)a4;
+ (id)uniteBezierPaths:(id)a3;
+ (int64_t)defaultWindingRule;
+ (int64_t)windingRule;
+ (unint64_t)defaultLineCapStyle;
+ (unint64_t)defaultLineJoinStyle;
+ (void)clipRect:(CGRect)a3;
+ (void)fillRect:(CGRect)a3;
+ (void)initialize;
+ (void)setDefaultFlatness:(double)a3;
+ (void)setDefaultLineCapStyle:(unint64_t)a3;
+ (void)setDefaultLineJoinStyle:(unint64_t)a3;
+ (void)setDefaultLineWidth:(double)a3;
+ (void)setDefaultMiterLimit:(double)a3;
+ (void)setDefaultWindingRule:(int64_t)a3;
+ (void)setFlatness:(double)a3;
+ (void)setLineCapStyle:(unint64_t)a3;
+ (void)setLineJoinStyle:(unint64_t)a3;
+ (void)setLineWidth:(double)a3;
+ (void)setMiterLimit:(double)a3;
+ (void)setWindingRule:(int64_t)a3;
+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
+ (void)strokeRect:(CGRect)a3;
+ (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7 addLineBlock:(id)a8;
- (BOOL)_isValid:(double)a3;
- (BOOL)containsClosePathElement;
- (BOOL)containsElementsOtherThanMoveAndClose;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)hasAtLeastTwoVisuallyDistinctSubregions;
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
- (BOOL)isTriangular;
- (BOOL)isVisuallyEqualToPath:(id)a3 withThreshold:(double)a4;
- (BOOL)p_equalWidthAndHeightForSize:(CGSize)a3;
- (CGPath)CGPath;
- (CGPoint)_checkPointForValidity:(CGPoint)a3;
- (CGPoint)currentPoint;
- (CGPoint)gradientAt:(double)a3;
- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)myGradientAt:(double)a3;
- (CGPoint)myGradientAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2];
- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2];
- (CGPoint)pointAlongPathAtPercentage:(double)a3;
- (CGPoint)pointAlongPathAtPercentage:(double)a3 withFlattenedPath:(id)a4 andLength:(double *)a5 atStartIndex:(unint64_t *)a6;
- (CGPoint)pointAt:(double)a3;
- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)rawGradientAt:(double)a3 fromElement:(int64_t)a4;
- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 getElement:(int64_t *)a6 getPercentage:(double *)a7;
- (CGRect)bounds;
- (CGRect)boundsIncludingCRLStroke:(id)a3;
- (CGRect)boundsIncludingStroke;
- (CGRect)boundsIncludingStrokeWidth:(double)a3 joinStyle:(unint64_t)a4 capStyle:(unint64_t)a5 miterLimit:(double)a6 needsToExtendJoins:(BOOL)a7;
- (CGRect)controlPointBounds;
- (CRLBezierPath)init;
- (CRLBezierPath)initWithCString:(const char *)a3;
- (NSArray)rangesOfSubpaths;
- (NSArray)visuallyDistinctSubregions;
- (NSString)inferredAccessibilityDescription;
- (NSString)inferredLocalizedAccessibilityDescriptionPlaceholder;
- (const)cString;
- (double)calculateLengthOfElement:(int64_t)a3;
- (double)curvatureAt:(double)a3;
- (double)curvatureAt:(double)a3 fromElement:(int64_t)a4;
- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6 findClosestMatch:(BOOL)a7;
- (double)elementPercentageFromElement:(int64_t)a3 forOverallPercentage:(double)a4;
- (double)flatness;
- (double)flattenedArea;
- (double)length;
- (double)lengthOfElement:(int64_t)a3;
- (double)lengthToElement:(int64_t)a3;
- (double)lineWidth;
- (double)miterLimit;
- (double)p_yValueFromXValue:(double)a3 elementIndex:(int64_t *)a4 parametricValue:(double *)a5;
- (double)yValueFromXValue:(double)a3;
- (id)_copyFlattenedPath;
- (id)aliasedPathInContext:(CGContext *)a3 effectiveStrokeWidth:(float)a4;
- (id)aliasedPathWithViewScale:(float)a3 effectiveStrokeWidth:(float)a4;
- (id)arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:(BOOL)a3;
- (id)bezierPathByFlatteningPath;
- (id)bezierPathByFlatteningPathWithFlatness:(double)a3;
- (id)bezierPathByOffsettingPath:(double)a3 joinStyle:(unint64_t)a4;
- (id)bezierPathByRemovingRedundantElements;
- (id)bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:(double)a3;
- (id)bezierPathByReversingPath;
- (id)chisel;
- (id)copyFromSegment:(int)a3 t:(double)a4 toSegment:(int)a5 t:(double)a6;
- (id)copyWithPointsInRange:(_NSRange)a3;
- (id)copyWithPointsInRange:(_NSRange)a3 countingSubpaths:(unint64_t *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)excludeBezierPath:(id)a3;
- (id)intersectBezierPath:(id)a3;
- (id)labelForSize:(CGSize)a3;
- (id)p_aliasedPathInContext:(CGContext *)a3 viewScale:(float)a4 effectiveStrokeWidth:(float)a5;
- (id)p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:(double)a3;
- (id)p_elementCountForSubpaths;
- (id)p_pathBySplittingAtPointGuaranteedToBeOnPath:(CGPoint)a3 controlPointDistanceEqual:(BOOL)a4 elementIndex:(int64_t)a5 parametricValue:(double)a6;
- (id)p_strokedPathByUsingBrushStroke;
- (id)p_strokedPathByUsingCG;
- (id)pathByCreatingHoleInPathAtPoint:(CGPoint)a3 withDiameter:(id)a4 andThreshold:(double)a5 updatingPatternOffsetsBySubpath:(id)a6;
- (id)pathByNormalizingClosedPathToRemoveSelfIntersections;
- (id)pathBySplittingAtPointOnPath:(CGPoint)a3 controlPointDistanceEqual:(BOOL)a4;
- (id)pathByWobblingByUpTo:(double)a3 subdivisions:(unint64_t)a4;
- (id)pathSplitAtSubpathBoundariesWithSoftElementLimit:(unint64_t)a3 hardElementLimit:(unint64_t)a4;
- (id)strokedCopy;
- (id)subtractBezierPath:(id)a3;
- (id)uniteWithBezierPath:(id)a3;
- (int64_t)elementAtIndex:(int64_t)a3;
- (int64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4;
- (int64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4;
- (int64_t)elementCount;
- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4;
- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4 startingElementIndex:(int64_t)a5 lengthToStartingElement:(double)a6;
- (int64_t)windingRule;
- (unint64_t)lineCapStyle;
- (unint64_t)lineJoinStyle;
- (unint64_t)totalSubpathCountIncludingEffectivelyEmptySubpaths;
- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4;
- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6;
- (void)_appendToPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4;
- (void)_deviceClosePath;
- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5 elementLength:(double)a6;
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
- (void)appendBezierPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4;
- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7;
- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(unint64_t)a6 startNewPath:(BOOL)a7;
- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(unint64_t)a6 startNewPath:(BOOL)a7;
- (void)appendBezierPathWithOvalInRect:(CGRect)a3;
- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4;
- (void)appendBezierPathWithRect:(CGRect)a3;
- (void)appendPointsInRange:(_NSRange)a3 fromBezierPath:(id)a4;
- (void)calculateLengths;
- (void)clearStroke:(CGContext *)a3;
- (void)closePath;
- (void)convertCloseElementsToLineElements;
- (void)copyPathAttributesTo:(id)a3;
- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)curveToPoint:(CGPoint)a3 controlPoint:(CGPoint)a4;
- (void)dealloc;
- (void)fill;
- (void)flattenIntoPath:(id)a3;
- (void)flattenIntoPath:(id)a3 flatness:(double)a4;
- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5;
- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4;
- (void)iterateOverPathWithPointDistancePerIteration:(double)a3 usingBlock:(id)a4;
- (void)iteratePathElementsWithBlock:(id)a3;
- (void)lineToPoint:(CGPoint)a3;
- (void)p_appendPointsInRange:(_NSRange)a3 fromBezierPath:(id)a4 countingSubpaths:(unint64_t *)a5;
- (void)p_subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7;
- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4;
- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6;
- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5;
- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint:(CGPoint)a4;
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
- (void)setWindingRule:(int64_t)a3;
- (void)stroke;
- (void)takeAttributesFromStroke:(id)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation CRLBezierPath

+ (id)tracedPathForImage:(CGImage *)a3 alphaThreshold:(double)a4 pointSpacing:(double)a5
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  v72 = +[CRLBezierPath bezierPath];
  BOOL IsMask = CGImageIsMask(a3);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  if (IsMask || AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)
  {
    float v11 = fminf((float)Width, 1024.0) / (float)Width;
    float v12 = fminf((float)Height, 1024.0) / (float)Height;
    if (v12 >= v11) {
      float v13 = v11;
    }
    else {
      float v13 = v12;
    }
    double v14 = ceil((double)Width * v13) + 2.0;
    double v15 = ceil((double)Height * v13) + 2.0;
    v16 = (unsigned __int8 *)malloc_type_calloc((unint64_t)(v15 * (double)(unint64_t)v14), 1uLL, 0x100004077774924uLL);
    unint64_t v17 = (unint64_t)v14;
    v18 = CGBitmapContextCreate(v16, (unint64_t)v14, (unint64_t)v15, 8uLL, (unint64_t)v14, 0, 7u);
    CGContextSetBlendMode(v18, kCGBlendModeCopy);
    v83.size.width = v14 + -2.0;
    v83.size.height = v15 + -2.0;
    v83.origin.x = 1.0;
    v83.origin.y = 1.0;
    CGContextDrawImage(v18, v83, a3);
    CGContextFlush(v18);
    CGContextRelease(v18);
    float v70 = v13;
    double v19 = sub_100407E48(a4, 0.0, 1.0);
    double v20 = v15 + -1.0;
    double v69 = v13;
    if (v20 <= 1.0)
    {
      v81 = 0;
      uint64_t v82 = 0;
      v79 = 0;
      v80 = (uint64_t *)&v81;
      long long __p = 0uLL;
    }
    else
    {
      double v21 = v14 + -1.0;
      double v22 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          uint64_t v23 = 1;
          do
          {
            v16[(int)v22 * v17 + v23] = v16[(int)v22 * v17 + v23] >= (v19 * 255.0);
            ++v23;
          }
          while (v21 > (double)v23);
        }
        double v22 = v22 + 1.0;
      }
      while (v22 < v20);
      v81 = 0;
      uint64_t v82 = 0;
      v80 = (uint64_t *)&v81;
      double v24 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          unint64_t v25 = (int)v24 * v17;
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
              sub_100046FA4(&v80, (double *)&__p, &__p);
            }
            double v27 = v27 + 1.0;
          }
          while (v27 < v21);
        }
        double v24 = v24 + 1.0;
      }
      while (v24 < v20);
      long long __p = 0uLL;
      v79 = 0;
      while (v82)
      {
        long long v77 = *((_OWORD *)v80 + 2);
        sub_100047098(&v80, (double *)&v77);
        unint64_t v29 = __p;
        *((void *)&__p + 1) = __p;
        long long v76 = v77;
        double v31 = sub_10006538C(*(double *)&v77);
        if (v16[(int)(v30 - 1.0) * v17 + (int)(v31 - 1.0)]) {
          double v32 = v30 + 1.0;
        }
        else {
          double v32 = v30;
        }
        double v33 = v31 + -1.0;
        double v34 = v32 + -1.0;
        if (v29 >= (unint64_t)v79)
        {
          unint64_t v36 = 0x5555555555555556 * ((uint64_t)((uint64_t)v79 - v29) >> 3);
          if (v36 <= 1) {
            unint64_t v36 = 1;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v79 - v29) >> 3) >= 0x555555555555555) {
            unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v37 = v36;
          }
          v38 = (double *)sub_100046F5C((uint64_t)&v79, v37);
          double *v38 = v33;
          v38[1] = v34;
          *((void *)v38 + 2) = 8;
          v40 = (double *)*((void *)&__p + 1);
          v41 = (double *)__p;
          v42 = v38;
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
            v40 = (double *)__p;
          }
          v35 = (char *)(v38 + 3);
          *(void *)&long long __p = v42;
          *((void *)&__p + 1) = v38 + 3;
          v79 = &v38[3 * v39];
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          *(double *)unint64_t v29 = v33;
          *(double *)(v29 + 8) = v34;
          v35 = (char *)(v29 + 24);
          *(void *)(v29 + 16) = 8;
        }
        *((void *)&__p + 1) = v35;
        double v44 = v32;
        double v45 = v31;
        do
        {
          CGPoint v74 = CGPointZero;
          CGPoint v75 = v74;
          sub_100045A24((long long *)&v75, (long long *)&v74, *(double *)&v76, *((double *)&v76 + 1), v45, v44);
          double v46 = *(double *)&v76 + v75.x;
          double v47 = *((double *)&v76 + 1) + v75.y;
          double v48 = sub_10006538C(*(double *)&v76 + v75.x);
          if (v16[(int)v49 * v17 + (int)v48])
          {
            *(double *)&long long v76 = v46;
            *((double *)&v76 + 1) = v47;
            sub_100047098(&v80, (double *)&v76);
          }
          else
          {
            CGPoint v50 = v74;
            unsigned int v51 = sub_1000456A0(v74.x, v74.y);
            unsigned int v52 = v51;
            unint64_t v53 = *((void *)&__p + 1);
            if (*((void *)&__p + 1) != (void)__p && *(_DWORD *)(*((void *)&__p + 1) - 8) == v51)
            {
              unint64_t v53 = *((void *)&__p + 1) - 24;
              *((void *)&__p + 1) -= 24;
            }
            double v45 = v45 + v50.x;
            double v44 = v44 + v50.y;
            double v54 = v45 + -1.0;
            double v55 = v44 + -1.0;
            if (v53 >= (unint64_t)v79)
            {
              unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - __p) >> 3);
              unint64_t v58 = v57 + 1;
              if (v57 + 1 > 0xAAAAAAAAAAAAAAALL) {
                sub_100004E40();
              }
              if (0x5555555555555556 * ((uint64_t)((uint64_t)v79 - __p) >> 3) > v58) {
                unint64_t v58 = 0x5555555555555556 * ((uint64_t)((uint64_t)v79 - __p) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v79 - __p) >> 3) >= 0x555555555555555) {
                unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v59 = v58;
              }
              if (v59) {
                v60 = (char *)sub_100046F5C((uint64_t)&v79, v59);
              }
              else {
                v60 = 0;
              }
              v61 = (double *)&v60[24 * v57];
              double *v61 = v54;
              v61[1] = v55;
              *((_DWORD *)v61 + 4) = v52;
              *((_DWORD *)v61 + 5) = 0;
              v62 = (double *)*((void *)&__p + 1);
              v63 = (double *)__p;
              v64 = v61;
              if (*((void *)&__p + 1) != (void)__p)
              {
                do
                {
                  long long v65 = *(_OWORD *)(v62 - 3);
                  *(v64 - 1) = *(v62 - 1);
                  *(_OWORD *)(v64 - 3) = v65;
                  v64 -= 3;
                  v62 -= 3;
                }
                while (v62 != v63);
                v62 = (double *)__p;
              }
              unint64_t v56 = (unint64_t)(v61 + 3);
              *(void *)&long long __p = v64;
              *((void *)&__p + 1) = v61 + 3;
              v79 = (double *)&v60[24 * v59];
              if (v62) {
                operator delete(v62);
              }
            }
            else
            {
              *(double *)unint64_t v53 = v54;
              *(double *)(v53 + 8) = v55;
              unint64_t v56 = v53 + 24;
              *(void *)(v53 + 16) = v51;
            }
            *((void *)&__p + 1) = v56;
          }
        }
        while (v31 != v45 || v32 != v44);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&__p + 1) - __p) >> 3) >= 2) {
          sub_100045D04(v72, (uint64_t *)&__p, a5);
        }
      }
    }
    free(v16);
    if (v70 != 1.0)
    {
      CGAffineTransformMakeScale(&v73, 1.0 / v69, 1.0 / v69);
      [v72 transformUsingAffineTransform:&v73];
    }
    if ((void)__p)
    {
      *((void *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    sub_10001BC78((uint64_t)&v80, v81);
  }
  else
  {
    [v72 appendBezierPathWithRect:sub_100064070()];
  }
  if ((uint64_t)objc_msgSend(v72, "elementCount", *(void *)&v69) <= 0) {
    v66 = 0;
  }
  else {
    v66 = v72;
  }
  id v67 = v66;

  return v67;
}

+ (id)tracedPathForInstantAlphaBinaryBitmap:(id)a3 pointSpacing:(double)a4
{
  v4 = a3;
  uint64_t v5 = v4[1];
  uint64_t v6 = v4[2];
  CGPoint v74 = +[CRLBezierPath bezierPath];
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  v81 = (uint64_t *)&v82;
  if ((unint64_t)(v6 + 1) <= 1)
  {
    long long __p = 0uLL;
    v80 = 0;
    goto LABEL_86;
  }
  unint64_t v7 = v5 + 1;
  double v8 = 1.0;
  do
  {
    if (v7 >= 2)
    {
      BOOL v9 = 0;
      uint64_t v10 = (uint64_t)v8;
      double v11 = 1.0;
      do
      {
        uint64_t v12 = (uint64_t)v11;
        float v13 = v4;
        if ((uint64_t)v11 >= 1 && v10 >= 1 && v13[1] >= v12 && v13[2] >= v10)
        {
          unint64_t v14 = (0x80uLL >> ((v12 - 1) & 7)) & *(unsigned __int8 *)(v13[4]
                                                                  + v13[3] * ((uint64_t)v8 - 1)
                                                                  + ((unint64_t)(v12 - 1) >> 3));

          if (v14) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v9;
          }
          BOOL v9 = v14 == 0;
          if (!v15)
          {
            *(double *)&long long __p = v11 + 0.5;
            *((double *)&__p + 1) = v8 + 0.5;
            sub_100046FA4(&v81, (double *)&__p, &__p);
            BOOL v9 = 1;
          }
        }
        else
        {

          BOOL v9 = 0;
        }
        double v11 = v11 + 1.0;
      }
      while (v11 < (double)v7);
    }
    double v8 = v8 + 1.0;
  }
  while (v8 < (double)(unint64_t)(v6 + 1));
  long long __p = 0uLL;
  v80 = 0;
  while (v83)
  {
    long long v78 = *((_OWORD *)v81 + 2);
    sub_100047098(&v81, (double *)&v78);
    *((void *)&__p + 1) = __p;
    long long v77 = v78;
    double v16 = sub_10006538C(*(double *)&v78);
    double v18 = v17;
    uint64_t v19 = (uint64_t)(v16 - 1.0);
    double v20 = v4;
    double v21 = v20;
    unint64_t v22 = v19 - 1;
    if (v19 < 1 || ((uint64_t v23 = (uint64_t)(v18 - 1.0), v23 >= 1) ? (v24 = v20[1] < v19) : (v24 = 1), v24 || v20[2] < v23))
    {
    }
    else
    {
      uint64_t v68 = *(unsigned __int8 *)(v20[4] + v20[3] * (v23 - 1) + (v22 >> 3));
      char v69 = v22 & 7;

      if (((v68 << v69) & 0x80) == 0) {
        double v18 = v18 + 1.0;
      }
    }
    unint64_t v25 = *((void *)&__p + 1);
    if (*((void *)&__p + 1) != (void)__p && *(_DWORD *)(*((void *)&__p + 1) - 8) == 8)
    {
      unint64_t v25 = *((void *)&__p + 1) - 24;
      *((void *)&__p + 1) -= 24;
    }
    double v26 = v16 + -1.0;
    double v27 = v18 + -1.0;
    if (v25 >= (unint64_t)v80)
    {
      unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25 - __p) >> 3);
      unint64_t v30 = v29 + 1;
      if (v29 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_100004E40();
      }
      if (0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3) > v30) {
        unint64_t v30 = 0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v80[-__p] >> 3) >= 0x555555555555555) {
        unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        double v32 = (char *)sub_100046F5C((uint64_t)&v80, v31);
      }
      else {
        double v32 = 0;
      }
      double v33 = (double *)&v32[24 * v29];
      *double v33 = v26;
      v33[1] = v27;
      *((void *)v33 + 2) = 8;
      double v34 = (double *)*((void *)&__p + 1);
      v35 = (double *)__p;
      unint64_t v36 = v33;
      if (*((void *)&__p + 1) != (void)__p)
      {
        do
        {
          long long v37 = *(_OWORD *)(v34 - 3);
          *(v36 - 1) = *(v34 - 1);
          *(_OWORD *)(v36 - 3) = v37;
          v36 -= 3;
          v34 -= 3;
        }
        while (v34 != v35);
        double v34 = (double *)__p;
      }
      unint64_t v28 = (unint64_t)(v33 + 3);
      *(void *)&long long __p = v36;
      *((void *)&__p + 1) = v33 + 3;
      v80 = &v32[24 * v31];
      if (v34) {
        operator delete(v34);
      }
    }
    else
    {
      *(double *)unint64_t v25 = v26;
      *(double *)(v25 + 8) = v27;
      unint64_t v28 = v25 + 24;
      *(void *)(v25 + 16) = 8;
    }
    *((void *)&__p + 1) = v28;
    double v38 = v18;
    double v39 = v16;
    do
    {
      CGPoint v75 = CGPointZero;
      CGPoint v76 = v75;
      sub_100045A24((long long *)&v76, (long long *)&v75, *(double *)&v77, *((double *)&v77 + 1), v39, v38);
      double v40 = *(double *)&v77 + v76.x;
      double v41 = *((double *)&v77 + 1) + v76.y;
      double v42 = sub_10006538C(*(double *)&v77 + v76.x);
      double v44 = v43;
      uint64_t v45 = (uint64_t)v42;
      double v46 = v21;
      unint64_t v47 = v45 - 1;
      if (v45 < 1 || ((uint64_t v48 = (uint64_t)v44, (uint64_t)v44 >= 1) ? (v49 = v46[1] < v45) : (v49 = 1), v49 || v46[2] < v48))
      {
      }
      else
      {
        uint64_t v66 = *(unsigned __int8 *)(v46[4] + v46[3] * (v48 - 1) + (v47 >> 3));
        char v67 = v47 & 7;

        if (((v66 << v67) & 0x80) == 0)
        {
          *(double *)&long long v77 = v40;
          *((double *)&v77 + 1) = v41;
          sub_100047098(&v81, (double *)&v77);
          continue;
        }
      }
      CGPoint v50 = v75;
      unsigned int v51 = sub_1000456A0(v75.x, v75.y);
      unsigned int v52 = v51;
      unint64_t v53 = *((void *)&__p + 1);
      if (*((void *)&__p + 1) != (void)__p && *(_DWORD *)(*((void *)&__p + 1) - 8) == v51)
      {
        unint64_t v53 = *((void *)&__p + 1) - 24;
        *((void *)&__p + 1) -= 24;
      }
      double v39 = v39 + v50.x;
      double v38 = v38 + v50.y;
      double v54 = v39 + -1.0;
      double v55 = v38 + -1.0;
      if (v53 >= (unint64_t)v80)
      {
        unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - __p) >> 3);
        unint64_t v58 = v57 + 1;
        if (v57 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_100004E40();
        }
        if (0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3) > v58) {
          unint64_t v58 = 0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v80[-__p] >> 3) >= 0x555555555555555) {
          unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v59 = v58;
        }
        if (v59) {
          v60 = (char *)sub_100046F5C((uint64_t)&v80, v59);
        }
        else {
          v60 = 0;
        }
        v61 = (double *)&v60[24 * v57];
        double *v61 = v54;
        v61[1] = v55;
        *((_DWORD *)v61 + 4) = v52;
        *((_DWORD *)v61 + 5) = 0;
        v62 = (double *)*((void *)&__p + 1);
        v63 = (double *)__p;
        v64 = v61;
        if (*((void *)&__p + 1) != (void)__p)
        {
          do
          {
            long long v65 = *(_OWORD *)(v62 - 3);
            *(v64 - 1) = *(v62 - 1);
            *(_OWORD *)(v64 - 3) = v65;
            v64 -= 3;
            v62 -= 3;
          }
          while (v62 != v63);
          v62 = (double *)__p;
        }
        unint64_t v56 = (unint64_t)(v61 + 3);
        *(void *)&long long __p = v64;
        *((void *)&__p + 1) = v61 + 3;
        v80 = &v60[24 * v59];
        if (v62) {
          operator delete(v62);
        }
      }
      else
      {
        *(double *)unint64_t v53 = v54;
        *(double *)(v53 + 8) = v55;
        unint64_t v56 = v53 + 24;
        *(void *)(v53 + 16) = v51;
      }
      *((void *)&__p + 1) = v56;
    }
    while (v16 != v39 || v18 != v38);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&__p + 1) - __p) >> 3) >= 2) {
      sub_100045D04(v74, (uint64_t *)&__p, a4);
    }
  }
LABEL_86:
  if ((uint64_t)[v74 elementCount] <= 0) {
    float v70 = 0;
  }
  else {
    float v70 = v74;
  }
  id v71 = v70;
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  sub_10001BC78((uint64_t)&v81, v82);

  return v71;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[CRLBezierPath setVersion:524];
  }
}

+ (id)bezierPath
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (CRLBezierPath)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v8 = (CRLBezierPath *)[a1 bezierPath];
  -[CRLBezierPath moveToPoint:](v8, "moveToPoint:", v7, v6);
  -[CRLBezierPath lineToPoint:](v8, "lineToPoint:", x, y);
  return v8;
}

+ (CRLBezierPath)bezierPathWithDefaultsForErrorCases
{
  return (CRLBezierPath *)[a1 bezierPathWithStart:CGPointZero.x, CGPointZero.y, 100.0, 100.0];
}

+ (CRLBezierPath)bezierPathWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (CRLBezierPath *)[a1 bezierPath];
  -[CRLBezierPath appendBezierPathWithRect:](v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (CRLBezierPath)bezierPathWithOvalInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (CRLBezierPath *)[a1 bezierPath];
  -[CRLBezierPath appendBezierPathWithOvalInRect:](v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (CRLBezierPath)bezierPathWithCGPath:(CGPath *)a3
{
  v4 = (CRLBezierPath *)[a1 bezierPath];
  CGPathApply(a3, v4, (CGPathApplierFunction)sub_1000E5CB4);
  if (v4->sfr_path)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4930);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076C04();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPath bezierPathWithCGPath:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 303, 0, "expected nil value for '%{public}s'", "result->sfr_path");
  }
  v4->sfr_path = CGPathCreateCopy(a3);
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
      if (qword_1016A9068 == 2) {
        CGLineCap v8 = kCGLineCapSquare;
      }
      else {
        CGLineCap v8 = qword_1016A9068 == 1;
      }
      CGContextSetLineCap(CurrentContext, v8);
      if (qword_1016A9070 == 2) {
        CGLineJoin v9 = kCGLineJoinBevel;
      }
      else {
        CGLineJoin v9 = qword_1016A9070 == 1;
      }
      CGContextSetLineJoin(CurrentContext, v9);
      sub_1000E57E8(CurrentContext, *(double *)&qword_10166B900);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&qword_10166B908);
      CGContextBeginPath(CurrentContext);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v19);
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v20);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGFloat v13 = CGRectGetMinY(v22);
      CGContextAddLineToPoint(CurrentContext, MaxX, v13);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGFloat v14 = CGRectGetMaxX(v23);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v24);
      CGContextAddLineToPoint(CurrentContext, v14, MaxY);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      CGFloat v16 = CGRectGetMinX(v25);
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      CGFloat v17 = CGRectGetMaxY(v26);
      CGContextAddLineToPoint(CurrentContext, v16, v17);
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
  if (qword_1016A9068 == 2) {
    CGLineCap v9 = kCGLineCapSquare;
  }
  else {
    CGLineCap v9 = qword_1016A9068 == 1;
  }
  CGContextSetLineCap(CurrentContext, v9);
  if (qword_1016A9070 == 2) {
    CGLineJoin v10 = kCGLineJoinBevel;
  }
  else {
    CGLineJoin v10 = qword_1016A9070 == 1;
  }
  CGContextSetLineJoin(CurrentContext, v10);
  sub_1000E57E8(CurrentContext, *(double *)&qword_10166B900);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);

  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  qword_10166B908 = *(void *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&qword_10166B908;
}

+ (void)setDefaultFlatness:(double)a3
{
  qword_10166B910 = *(void *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&qword_10166B910;
}

+ (void)setDefaultWindingRule:(int64_t)a3
{
  qword_1016A9078 = a3;
}

+ (int64_t)defaultWindingRule
{
  return qword_1016A9078;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  qword_1016A9068 = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return qword_1016A9068;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  qword_1016A9070 = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return qword_1016A9070;
}

+ (void)setDefaultLineWidth:(double)a3
{
  qword_10166B900 = *(void *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&qword_10166B900;
}

- (CRLBezierPath)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLBezierPath;
  result = [(CRLBezierPath *)&v8 init];
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = result->sfr_bpFlags;
  *(_OWORD *)&result->sfr_elementCount = 0u;
  *(_OWORD *)&result->sfr_head = 0u;
  result->sfr_extraSegmentCount = 0;
  result->sfr_extraSegmentMaCGFloat x = 0;
  result->sfr_totalLength = 0.0;
  result->sfr_lastSubpathIndeCGFloat x = -1;
  result->sfr_extraSegments = 0;
  $7B3C09426D5A94CD5FE07DCF037609F1 v4 = ($7B3C09426D5A94CD5FE07DCF037609F1)(((8 * qword_1016A9078) | ((_BYTE)qword_1016A9068 << 6)) | *(_DWORD *)&sfr_bpFlags & 0xFFFFF800 | (16 * (qword_1016A9070 & 0xF)) | 7);
  *(void *)&result->sfr_linesize_t Width = qword_10166B900;
  double v5 = *(double *)&qword_10166B910;
  *(void *)&result->sfr_miterLimit = qword_10166B908;
  result->sfr_flatness = v5;
  result->sfr_dashedLinePattern = 0;
  result->sfr_dashedLineCount = 0;
  result->sfr_dashedLinePhase = 0.0;
  result->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = v4;
  CGPoint origin = CGRectZero.origin;
  CGSize size = CGRectZero.size;
  result->sfr_bounds.CGSize size = size;
  result->sfr_bounds.CGPoint origin = origin;
  result->sfr_controlPointBounds.CGSize size = size;
  result->sfr_controlPointBounds.CGPoint origin = origin;
  return result;
}

- (void)dealloc
{
  v3 = (NSZone *)[(CRLBezierPath *)self zone];
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
  v7.super_class = (Class)CRLBezierPath;
  [(CRLBezierPath *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
LABEL_16:
    LOBYTE(v5) = 1;
    return v5;
  }
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    CGFloat v6 = (objc_class *)objc_opt_class();
    id v7 = sub_10024715C(v6, a3);
    uint64_t v8 = [(CRLBezierPath *)self elementCount];
    if ((id)v8 != [v7 elementCount])
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (v8 >= 1)
    {
      uint64_t v9 = 0;
      while (1)
      {
        id v10 = [(CRLBezierPath *)self elementAtIndex:v9 associatedPoints:v14];
        if (v10 != [v7 elementAtIndex:v9 associatedPoints:v13]) {
          goto LABEL_17;
        }
        if ((unint64_t)v10 >= 2)
        {
          if (v10 == (id)2)
          {
            uint64_t v11 = 0;
            while (sub_100064084(v14[v11], v14[v11 + 1], v13[v11], v13[v11 + 1]))
            {
              v11 += 2;
              if (v11 == 6) {
                goto LABEL_14;
              }
            }
            goto LABEL_17;
          }
        }
        else if (!sub_100064084(v14[0], v14[1], v13[0], v13[1]))
        {
          goto LABEL_17;
        }
LABEL_14:
        ++v9;
        LOBYTE(v5) = 1;
        if (v9 == v8) {
          return v5;
        }
      }
    }
    goto LABEL_16;
  }
  return v5;
}

- (void)copyPathAttributesTo:(id)a3
{
  [a3 setWindingRule:[self windingRule]];
  [a3 setLineCapStyle:[self lineCapStyle]];
  [a3 setLineJoinStyle:[self lineJoinStyle]];
  [(CRLBezierPath *)self lineWidth];
  [a3 setLineWidth:];
  [(CRLBezierPath *)self miterLimit];
  [a3 setMiterLimit:];
  [(CRLBezierPath *)self flatness];
  [a3 setFlatness:];
  if (self->sfr_dashedLinePattern)
  {
    double sfr_dashedLinePhase = self->sfr_dashedLinePhase;
    [a3 setLineDash:sfr_dashedLinePhase count:1 phase:0];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  CGFloat v6 = v5;
  *((void *)v5 + 1) = self->sfr_elementCount;
  *((void *)v5 + 2) = self->sfr_elementMax;
  *((void *)v5 + 5) = *(void *)&self->sfr_totalLength;
  *((void *)v5 + 6) = self->sfr_lastSubpathIndex;
  *((void *)v5 + 8) = *(void *)&self->sfr_lineWidth;
  CGSize size = self->sfr_bounds.size;
  *(CGPoint *)(v5 + 72) = self->sfr_bounds.origin;
  *(CGSize *)(v5 + 88) = size;
  CGSize v8 = self->sfr_controlPointBounds.size;
  *(CGPoint *)(v5 + 104) = self->sfr_controlPointBounds.origin;
  *(CGSize *)(v5 + 120) = v8;
  *((void *)v5 + 17) = *(void *)&self->sfr_miterLimit;
  *((void *)v5 + 18) = *(void *)&self->sfr_flatness;
  *((void *)v5 + 23) = self->sfr_extraSegmentCount;
  *((void *)v5 + 24) = self->sfr_extraSegmentMax;
  *((_DWORD *)v5 + 50) = self->sfr_bpFlags;
  if (self->sfr_head)
  {
    if (*((void *)v5 + 3))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4970);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076F24();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString copyWithZone:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 555, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_head"");
    }
    uint64_t v9 = NSZoneMalloc(a3, 24 * self->sfr_elementMax);
    v6[3] = v9;
    memcpy(v9, self->sfr_head, 24 * self->sfr_elementMax);
  }
  if (self->sfr_elementLength)
  {
    if (v6[4])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D49B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076E5C();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString copyWithZone:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 561, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_elementLength"");
    }
    id v10 = NSZoneMalloc(a3, 8 * self->sfr_elementMax);
    v6[4] = v10;
    memcpy(v10, self->sfr_elementLength, 8 * self->sfr_elementMax);
  }
  if (self->sfr_extraSegments)
  {
    if (v6[7])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D49F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076D94();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString copyWithZone:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 567, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_extraSegments"");
    }
    uint64_t v11 = NSZoneMalloc(a3, 32 * self->sfr_extraSegmentMax);
    v6[7] = v11;
    memcpy(v11, self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
  }
  if (v6[22])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4A30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076CCC();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString copyWithZone:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 572, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_path"");
  }
  v6[22] = CGPathCreateCopy(self->sfr_path);
  [v6 setLineDash:self->sfr_dashedLinePattern count:self->sfr_dashedLineCount phase:self->sfr_dashedLinePhase];
  return v6;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CRLBezierPath *)self isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4A70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076FEC();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a line when there is no current point.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CRLBezierPath lineToPoint:]");
    id v13 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString lineToPoint:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 587, 1, "Unable to add a line when there is no current point."");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v13, v14);
    abort();
  }

  -[CRLBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  if ([(CRLBezierPath *)self isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4AB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010770A8();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a curve when there is no current point.", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[CRLBezierPath curveToPoint:controlPoint:]");
    id v18 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath curveToPoint:controlPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 593, 1, "Unable to add a curve when there is no current point.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v18, v19);
    abort();
  }
  [(CRLBezierPath *)self currentPoint];

  -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", v7, v6, v9 * 0.333333333 + x * 0.666666667, v10 * 0.333333333 + y * 0.666666667, v7 * 0.333333333 + x * 0.666666667, v6 * 0.333333333 + y * 0.666666667, NAN);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  if ([(CRLBezierPath *)self isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4AF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101077164();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a curve when there is no current point.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:]");
    id v19 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 607, 1, "Unable to add a curve when there is no current point.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v19, v20);
    abort();
  }

  -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", v10, v9, v8, v7, x, y, NAN);
}

- (void)closePath
{
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
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 3);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLBezierPath *)self currentPoint];
  double v7 = sub_100064698(x, y, v6);

  [(CRLBezierPath *)self moveToPoint:v7];
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLBezierPath *)self currentPoint];
  double v7 = sub_100064698(x, y, v6);

  [(CRLBezierPath *)self lineToPoint:v7];
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  [(CRLBezierPath *)self currentPoint];
  double v10 = v9;
  double v11 = sub_100064698(v7, v6, v9);
  double v13 = v12;
  double v15 = sub_100064698(x, y, v10);

  -[CRLBezierPath curveToPoint:controlPoint:](self, "curveToPoint:controlPoint:", v11, v13, v15, v14);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  [(CRLBezierPath *)self currentPoint];
  double v13 = v12;
  double v14 = sub_100064698(v10, v9, v12);
  double v16 = v15;
  double v17 = sub_100064698(v8, v7, v13);
  double v19 = v18;
  double v21 = sub_100064698(x, y, v13);

  -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v14, v16, v17, v19, v21, v20);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_linesize_t Width = a3;
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

- (int64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(int64_t)a3
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
    double v11 = (NSZone *)[(CRLBezierPath *)self zone];
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
    NSZoneFree((NSZone *)[(CRLBezierPath *)self zone], self->sfr_dashedLinePattern);
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

- (BOOL)_isValid:(double)a3
{
  double v3 = fabs(a3);
  return v3 > INFINITY || v3 < INFINITY;
}

- (CGPoint)_checkPointForValidity:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v6 = -[CRLBezierPath _isValid:](self, "_isValid:");
  unsigned int v7 = [(CRLBezierPath *)self _isValid:y];
  if (![(CRLBezierPath *)self _isValid:x] || ![(CRLBezierPath *)self _isValid:y])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4B30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101077220();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString _checkPointForValidity:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 752, 0, "CRLBezierPath received a NaN or inf value. Please investigate"");
  }
  double v8 = 0.0;
  if (v7) {
    double v9 = y;
  }
  else {
    double v9 = 0.0;
  }
  if (v6) {
    double v8 = x;
  }
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)_doPath
{
  if (!self->sfr_path && ![(CRLBezierPath *)self isEmpty])
  {
    Mutable = CGPathCreateMutable();
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      unsigned int v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      do
      {
        switch(*(void *)sfr_head & 0xFLL)
        {
          case 0:
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathMoveToPoint(Mutable, 0, v8, v9);
            break;
          case 1:
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathAddLineToPoint(Mutable, 0, v10, v11);
            break;
          case 2:
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGFloat v13 = v12;
            CGFloat v15 = v14;
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *sfr_extraSegments, sfr_extraSegments[1]);
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", sfr_extraSegments[2], sfr_extraSegments[3]);
            CGPathAddCurveToPoint(Mutable, 0, v17, v19, v20, v21, v13, v15);
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
  unint64_t v4 = [(CRLBezierPath *)self lineCapStyle];
  if (v4 == 2) {
    CGLineCap v5 = kCGLineCapSquare;
  }
  else {
    CGLineCap v5 = v4 == 1;
  }
  CGContextSetLineCap(CurrentContext, v5);
  unint64_t v6 = [(CRLBezierPath *)self lineJoinStyle];
  if (v6 == 2) {
    CGLineJoin v7 = kCGLineJoinBevel;
  }
  else {
    CGLineJoin v7 = v6 == 1;
  }
  CGContextSetLineJoin(CurrentContext, v7);
  sub_1000E57E8(CurrentContext, self->sfr_lineWidth);
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
    CGFloat v11 = &sfr_head[6 * sfr_elementCount];
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
    while (sfr_head < v11);
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
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
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
  if ([(CRLBezierPath *)self windingRule]) {
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
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
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
  if ([(CRLBezierPath *)self windingRule]) {
    CGContextEOClip(CurrentContext);
  }
  else {
    CGContextClip(CurrentContext);
  }

  CGContextBeginPath(CurrentContext);
}

- (void)p_subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E7D20;
  v7[3] = &unk_1014D4B78;
  v7[4] = self;
  +[CRLBezierPath subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:](CRLBezierPath, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:", v7, a3, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, *(void *)&a7.x, *(void *)&a7.y);
}

+ (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7 addLineBlock:(id)a8
{
  float64x2_t v10 = (float64x2_t)a4;
  a4.double x = a7.x;
  v8.n128_u64[0] = *(void *)&a7.y;
  CGFloat y = a5.y;
  _Q2 = (__n128)vsubq_f64((float64x2_t)a5, v10);
  CGFloat v13 = a6.y;
  CGPoint v38 = a4;
  __n128 v39 = v8;
  CGFloat v14 = a7.y;
  float64x2_t v15 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  float64x2_t v16 = vsubq_f64(v15, (float64x2_t)_Q2);
  float64x2_t v17 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v15);
  float64x2_t v18 = (float64x2_t)vzip2q_s64((int64x2_t)v16, (int64x2_t)v17);
  float64x2_t v19 = (float64x2_t)vzip1q_s64((int64x2_t)v16, (int64x2_t)v17);
  float64x2_t v20 = vmlaq_f64(vmulq_f64(v18, v18), v19, v19);
  if (v20.f64[0] <= v20.f64[1]) {
    v20.f64[0] = v20.f64[1];
  }
  double v21 = a3 * a3;
  double v22 = v20.f64[0] * 9.0 * 0.0625;
  if (v22 > v21)
  {
    float64x2_t v23 = vsubq_f64(v17, v16);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    float64x2_t v30 = vmulq_f64(v23, _Q6);
    float64x2_t v31 = vmlaq_f64(v23, _Q5, vaddq_f64((float64x2_t)_Q2, v16));
    float64x2_t v32 = vmulq_f64(vaddq_f64(v16, v23), _Q6);
    uint64_t v33 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      float64x2_t v30 = vmulq_f64(v30, (float64x2_t)_Q2);
      float64x2_t v32 = vsubq_f64(vmulq_f64(v32, _Q3), v30);
      float64x2_t v31 = vsubq_f64(vmulq_f64(v31, _Q4), vmulq_f64(v32, _Q4));
      v33 *= 2;
      double v22 = v22 * 0.0625;
    }
    while (v22 > v21 && v33 <= 0x10000);
    if (v33 >= 2)
    {
      for (uint64_t i = 1; i != v33; ++i)
      {
        float64x2_t v42 = v30;
        float64x2_t v43 = vaddq_f64(v10, v31);
        float64x2_t v40 = vaddq_f64(v30, v32);
        float64x2_t v41 = vaddq_f64(v31, v32);
        (*((void (**)(id, SEL, float64_t, float64_t, double))a8 + 2))(a8, a2, v43.f64[0], v43.f64[1], (double)(int)i / (double)v33);
        float64x2_t v32 = v40;
        float64x2_t v31 = v41;
        float64x2_t v30 = v42;
        float64x2_t v10 = v43;
      }
    }
  }
  long long v37 = (void (*)(id, __n128, __n128, __n128))*((void *)a8 + 2);
  _Q2.n128_u64[0] = 1.0;

  v37(a8, (__n128)v38, v39, _Q2);
}

- (void)flattenIntoPath:(id)a3
{
}

- (void)flattenIntoPath:(id)a3 flatness:(double)a4
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    __n128 v8 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          [a3 moveToPoint:*(double *)&sfr_head[2], *(double *)&sfr_head[4]];
          break;
        case 1:
          [a3 lineToPoint:*(double *)&sfr_head[2], *(double *)&sfr_head[4]];
          break;
        case 2:
          [a3 p_subdivideBezierWithFlatness:a4 startPoint:*(double *)&sfr_head[-4] controlPoint1:*(double *)&sfr_head[-2] controlPoint2:sfr_extraSegments[1] endPoint:sfr_extraSegments[2] sfr_extraSegments[3] *(void *)&sfr_head[2] *(void *)&sfr_head[4]];
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
  return [(CRLBezierPath *)self bezierPathByFlatteningPathWithFlatness:*(double *)&qword_10166B910];
}

- (id)bezierPathByFlatteningPathWithFlatness:(double)a3
{
  if ([(CRLBezierPath *)self isFlat])
  {
    id v5 = [(CRLBezierPath *)self copy];
  }
  else
  {
    id v5 = objc_alloc_init((Class)objc_opt_class());
    [(CRLBezierPath *)self flattenIntoPath:v5 flatness:a3];
  }

  return v5;
}

- (id)_copyFlattenedPath
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [(CRLBezierPath *)self flattenIntoPath:v3];
  return v3;
}

- (id)bezierPathByReversingPath
{
  if (self->sfr_elementCount <= 1)
  {
    id v3 = [(CRLBezierPath *)self copy];
    goto LABEL_29;
  }
  id v3 = objc_alloc_init((Class)objc_opt_class());
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 2)
  {
    sfr_head = self->sfr_head;
    unint64_t v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    __n128 v8 = sfr_head + 6;
    while (1)
    {
      CGFloat v9 = sfr_head;
      sfr_head = v8;
      uint64_t v10 = *(void *)&v9[6] & 0xFLL;
      if (!v10 || (unint64_t)&v9[12] >= v6)
      {
        double v12 = v10 ? sfr_head : v9;
        [v3 moveToPoint:*(double *)&v12[2], *(double *)&v12[4]];
        unint64_t v13 = *(void *)v12;
        if ((*(void *)v12 & 0xFLL) != 0) {
          break;
        }
      }
LABEL_28:
      __n128 v8 = sfr_head + 6;
      if ((unint64_t)&sfr_head[6] >= v6) {
        goto LABEL_29;
      }
    }
    char v14 = 0;
    float64x2_t v15 = (double *)&v12[-2];
    while (1)
    {
      int v16 = v13 & 0xF;
      if (v16 == 3) {
        break;
      }
      if (v16 == 2)
      {
        [v3 curveToPoint:*(v15 - 1) controlPoint1:*v15 controlPoint2:sfr_extraSegments[4 * (v13 >> 4) + 2] controlPoint2:sfr_extraSegments[4 * (v13 >> 4) + 3] controlPoint1:sfr_extraSegments[4 * (v13 >> 4)] controlPoint2:sfr_extraSegments[4 * (v13 >> 4) + 1]];
        if ((v14 & 1) == 0)
        {
          char v14 = 0;
          goto LABEL_27;
        }
        if ((*(unsigned char *)(v15 - 2) & 0xF) == 0) {
LABEL_23:
        }
          [v3 closePath];
LABEL_25:
        char v14 = 1;
        goto LABEL_27;
      }
      if (v16 == 1)
      {
        if ((v14 & 1) != 0 && (*(unsigned char *)(v15 - 2) & 0xF) == 0) {
          goto LABEL_23;
        }
        [v3 lineToPoint:*(v15 - 1), *v15];
      }
LABEL_27:
      unint64_t v13 = *((void *)v15 - 2);
      v15 -= 3;
      if ((v13 & 0xF) == 0) {
        goto LABEL_28;
      }
    }
    [v3 lineToPoint:*(v15 - 1), *v15];
    goto LABEL_25;
  }
LABEL_29:

  return v3;
}

- (id)bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:(double)a3
{
  return [(CRLBezierPath *)self p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:a3 + a3];
}

- (id)bezierPathByRemovingRedundantElements
{
  return [(CRLBezierPath *)self p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:0.0];
}

- (id)p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:(double)a3
{
  id v5 = +[CRLBezierPath bezierPath];
  id v6 = +[CRLBezierPath bezierPath];
  uint64_t v7 = [(CRLBezierPath *)self elementCount];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    char v10 = 0;
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
    double v13 = CGPointZero.x;
    double v14 = y;
    double v15 = CGPointZero.x;
    double v16 = y;
    while (2)
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, &v36, *(void *)&v33, *(void *)&v34))
      {
        case 0:
          [v6 moveToPoint:v36, v37];
          char v10 = 0;
          CGFloat x = v36;
          CGFloat y = v37;
          goto LABEL_13;
        case 1:
          double v35 = x;
          double v17 = a3;
          double v18 = v36;
          double v19 = v37;
          if (sub_100064084(v13, v14, v36, v37)) {
            goto LABEL_6;
          }
          if ((v10 & 1) != 0
            && sub_100064344(v15, v16, v13, v14, v18, v19)
            && (double v24 = sub_100064680(v13, v14, v15),
                double v33 = v25,
                double v34 = v24,
                double v26 = sub_100064680(v18, v19, v15),
                sub_10006468C(v34, v33, v26, v27) > 0.0))
          {
            [v6 setAssociatedPoints:&v36 atIndex:[v6 elementCount] - 1];
            char v10 = 1;
LABEL_6:
            double v14 = v16;
            double v13 = v15;
          }
          else
          {
            [v6 lineToPoint:v18, v19, *(void *)&v33, *(void *)&v34];
            char v10 = 1;
          }
          a3 = v17;
          double v16 = v14;
          double v15 = v13;
          double v13 = v36;
          double v14 = v37;
          CGFloat x = v35;
LABEL_20:
          if (v8 == ++v9) {
            break;
          }
          continue;
        case 2:
          [v6 curveToPoint:v40 controlPoint1:v41 controlPoint2:v36, v37, v38, v39];
          char v10 = 0;
          double v16 = v14;
          double v15 = v13;
          double v13 = v40;
          double v14 = v41;
          goto LABEL_20;
        case 3:
          [v6 closePath];
          if (a3 > 0.0)
          {
            [v6 bounds];
            float v21 = v20;
            float v23 = v22;
            if (fmaxf(v21, v23) > a3) {
              [v5 appendBezierPath:v6];
            }
            id v6 = +[CRLBezierPath bezierPath];
          }
          char v10 = 0;
LABEL_13:
          double v16 = v14;
          double v15 = v13;
          double v14 = y;
          double v13 = x;
          goto LABEL_20;
        default:
          goto LABEL_20;
      }
      break;
    }
  }
  if (objc_msgSend(v5, "isEmpty", *(void *)&v33, *(void *)&v34)) {
    return v6;
  }
  if (([v6 isEmpty] & 1) == 0)
  {
    [v6 bounds];
    float v29 = v28;
    float v31 = v30;
    if (fmaxf(v29, v31) > a3) {
      [v5 appendBezierPath:v6];
    }
  }
  return v5;
}

- (void)convertCloseElementsToLineElements
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    char v4 = 0;
    sfr_head = self->sfr_head;
    id v6 = &sfr_head[6 * sfr_elementCount];
    do
    {
      while ((*(void *)sfr_head & 0xFLL) == 3)
      {
        *(void *)sfr_head = *(void *)sfr_head & 0xFFFFFFFFFFFFFFF0 | 1;
        sfr_head += 6;
        char v4 = 1;
        if (sfr_head >= v6) {
          goto LABEL_9;
        }
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
    if ((v4 & 1) == 0) {
      return;
    }
LABEL_9:
    sfr_path = self->sfr_path;
    if (sfr_path)
    {
      CFRelease(sfr_path);
      self->sfr_path = 0;
    }
  }
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  if (sub_1001ACE20(&a3->a))
  {
    long long v5 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v5;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v19.c = v6;
    *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (!CGAffineTransformEqualToTransform(&t1, &v19))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      if (sfr_elementCount >= 1)
      {
        sfr_head = self->sfr_head;
        uint64_t v9 = &sfr_head[6 * sfr_elementCount];
        do
        {
          *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
          sfr_head += 6;
        }
        while (sfr_head < v9);
      }
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      if (sfr_extraSegments)
      {
        int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
        if (sfr_extraSegmentCount >= 1)
        {
          double v12 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
          do
          {
            *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
            *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
            sfr_extraSegments += 4;
          }
          while (sfr_extraSegments < v12);
        }
      }
      sfr_path = self->sfr_path;
      if (sfr_path)
      {
        self->sfr_path = CGPathCreateCopyByTransformingPath(self->sfr_path, a3);
        CFRelease(sfr_path);
      }
      long long v14 = *(_OWORD *)&a3->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&t1.c = v14;
      *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
      BOOL v15 = sub_100080074(&t1.a);
      $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
      if (v15)
      {
        if ((*(unsigned char *)&sfr_bpFlags & 1) == 0)
        {
          CGRect sfr_controlPointBounds = self->sfr_controlPointBounds;
          long long v17 = *(_OWORD *)&a3->c;
          *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
          *(_OWORD *)&t1.c = v17;
          *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
          self->CGRect sfr_controlPointBounds = CGRectApplyAffineTransform(sfr_controlPointBounds, &t1);
        }
        if ((*(unsigned char *)&sfr_bpFlags & 2) == 0)
        {
          CGRect sfr_bounds = self->sfr_bounds;
          long long v18 = *(_OWORD *)&a3->c;
          *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
          *(_OWORD *)&t1.c = v18;
          *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
          self->CGRect sfr_bounds = CGRectApplyAffineTransform(sfr_bounds, &t1);
        }
      }
      else
      {
        self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 3);
      }
    }
  }
  else
  {
    sub_1001ACEEC();
  }
}

- (CGPath)CGPath
{
  [(CRLBezierPath *)self _doPath];
  CGPoint result = self->sfr_path;
  if (result)
  {
    CGPathRef v4 = CGPathRetain(result);
    return (CGPath *)CFAutorelease(v4);
  }
  return result;
}

- (BOOL)isTriangular
{
  int64_t v3 = [(CRLBezierPath *)self elementCount];
  if (v3)
  {
    int64_t v4 = v3;
    int64_t v5 = v3 - 1;
    if ([(CRLBezierPath *)self elementAtIndex:v3 - 1]) {
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
  unsigned int v7 = [(CRLBezierPath *)self isFlat];
  BOOL result = 0;
  if (v7 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v9 = 1;
    while ((id)[(CRLBezierPath *)self elementAtIndex:v9] == (id)1)
    {
      if (v6 == ++v9)
      {
        unint64_t v10 = v6 - 1;
        goto LABEL_13;
      }
    }
    unint64_t v10 = v9 - 1;
LABEL_13:
    if ((id)[(CRLBezierPath *)self elementAtIndex:v6 - 1] == (id)3) {
      unint64_t v11 = v10 + 1;
    }
    else {
      unint64_t v11 = v10;
    }
    BOOL v12 = v6 != v11 + 1 || v10 > 3;
    BOOL result = 0;
    if (!v12)
    {
      if (v10 != 3) {
        return 1;
      }
      double v16 = 0.0;
      double v17 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      [(CRLBezierPath *)self elementAtIndex:0 associatedPoints:&v16];
      [(CRLBezierPath *)self elementAtIndex:3 associatedPoints:&v14];
      if (v16 == v14 && v17 == v15) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)isDiamond
{
  int64_t v3 = [(CRLBezierPath *)self elementCount];
  if (!v3)
  {
    [(CRLBezierPath *)self isFlat];
    return 0;
  }
  int64_t v4 = v3;
  int64_t v5 = v3 - 1;
  if (![(CRLBezierPath *)self elementAtIndex:v3 - 1]) {
    int64_t v4 = v5;
  }
  unsigned int v6 = [(CRLBezierPath *)self isFlat];
  BOOL result = 0;
  if (v6 && v4 == 5)
  {
    unint64_t v8 = -5;
    uint64_t v9 = 4;
    while ((id)[(CRLBezierPath *)self elementAtIndex:v8 + 6] == (id)1)
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
    int64_t v10 = [(CRLBezierPath *)self elementAtIndex:4];
    if (v9 != 3 || v10 == 3)
    {
      [(CRLBezierPath *)self bounds];
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
      CGPoint v19 = CGPointZero;
      while (1)
      {
        CGPoint v20 = v19;
        -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v16, &v20, v19);
        if (vabdd_f64((double)(unint64_t)MidX, v20.x) > 0.01 && vabdd_f64(MidY, v20.y) > 0.01) {
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
  LODWORD(v3) = [(CRLBezierPath *)self isFlat];
  if (v3)
  {
    int64_t v3 = [(CRLBezierPath *)self elementCount];
    if (v3)
    {
      unint64_t v4 = v3;
      unint64_t v5 = v3 - 1;
      if ([(CRLBezierPath *)self elementAtIndex:v3 - 1]) {
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
        while ((id)[(CRLBezierPath *)self elementAtIndex:v9] == (id)1)
        {
          if (v6 == ++v9)
          {
            unint64_t v10 = v6 - 1;
            goto LABEL_19;
          }
        }
        unint64_t v10 = v9 - 1;
LABEL_19:
        int64_t v11 = [(CRLBezierPath *)self elementAtIndex:v6 - 1];
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
          [(CRLBezierPath *)self bounds];
          double x = v29.origin.x;
          double y = v29.origin.y;
          CGFloat width = v29.size.width;
          CGFloat height = v29.size.height;
          double MaxX = CGRectGetMaxX(v29);
          v30.origin.double x = x;
          v30.origin.double y = y;
          v30.size.CGFloat width = width;
          v30.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v30);
          unint64_t v20 = 0;
          CGRect v21 = (double *)v27;
          while (1)
          {
            [(CRLBezierPath *)self elementAtIndex:v20 associatedPoints:v21];
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
        id v7 = [(CRLBezierPath *)self bezierPathByRemovingRedundantElements];
        id v8 = [v7 elementCount];
        if ((uint64_t)v8 >= [(CRLBezierPath *)self elementCount])
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
  [(CRLBezierPath *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CRLBezierPath *)self elementCount];
  if (v11 >= 1)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    BOOL v14 = 0;
    int v15 = 0;
    double v16 = v4 + v8 * 0.5;
    double v17 = v6 + v10 * 0.5;
    while (1)
    {
      int64_t v18 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, v25, *(_OWORD *)&v24);
      if (v18 == 2)
      {
        if (fabs(sub_100065398((v26[0] - v16) / v8, (v26[1] - v17) / v10) + -0.5) > 0.0001) {
          return v14;
        }
        double v20 = sub_100064570(&v24, 0.5);
        double v22 = sub_100065398((v20 - v16) / v8, (v21 - v17) / v10);
        CGPoint v19 = (float64x2_t *)v26;
        if (fabs(v22 + -0.5) > 0.0001) {
          return v14;
        }
      }
      else
      {
        if (v18 == 3)
        {
          if (v15 > 0) {
            return v14;
          }
          int v15 = 1;
          goto LABEL_12;
        }
        CGPoint v19 = (float64x2_t *)v25;
        if (v18 == 1) {
          return v14;
        }
      }
      float64x2_t v24 = *v19;
LABEL_12:
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
  if ([(CRLBezierPath *)self isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4B98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010772DC();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can not get the current point of an empty path.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CRLBezierPath currentPoint]");
    id v13 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString currentPoint], 1520, 1, "Can not get the current point of an empty path."");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v13, v14);
    abort();
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
  if ([(CRLBezierPath *)self isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4BD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101077398();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can not determine control point bounds for an empty path.", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLBezierPath controlPointBounds]");
    id v30 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString controlPointBounds], 1529, 1, "Can not determine control point bounds for an empty path."");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v30, v31);
    abort();
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
        uint64_t v12 = *(void *)v11 & 0xFLL;
        if (v12 != 3 && (v12 || (unint64_t)&v11[6] < v10))
        {
          float64x2_t v14 = *(float64x2_t *)&v11[2];
          CGPoint v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v14, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v14);
          float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v9), (int8x16_t)v14, (int8x16_t)v9);
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
        double v17 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          float64x2_t v18 = *sfr_extraSegments;
          float64x2_t v19 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          float64x2_t v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v18);
          float64x2_t v21 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v9), (int8x16_t)v18, (int8x16_t)v9);
          CGPoint v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v19, v20), (int8x16_t)v20, (int8x16_t)v19);
          float64x2_t v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v19, v21), (int8x16_t)v19, (int8x16_t)v21);
        }
        while (sfr_extraSegments < v17);
      }
    }
    self->sfr_controlPointBounds.CGPoint origin = v4;
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
  double v22 = size.f64[1];
  result.size.CGFloat width = size.f64[0];
  result.origin.double x = v4.x;
  result.size.CGFloat height = v22;
  result.origin.double y = y;
  return result;
}

- (CGRect)bounds
{
  if ([(CRLBezierPath *)self isFlat])
  {
    [(CRLBezierPath *)self controlPointBounds];
  }
  else
  {
    if ((*(unsigned char *)&self->sfr_bpFlags & 2) != 0)
    {
      [(CRLBezierPath *)self _doPath];
      sfr_path = self->sfr_path;
      if (sfr_path)
      {
        self->CGRect sfr_bounds = CGPathGetPathBoundingBox(sfr_path);
      }
      else
      {
        CGSize size = CGRectZero.size;
        self->sfr_bounds.CGPoint origin = CGRectZero.origin;
        self->sfr_bounds.CGSize size = size;
      }
      *(_DWORD *)&self->sfr_bpFlags &= ~2u;
    }
    double x = self->sfr_bounds.origin.x;
    double y = self->sfr_bounds.origin.y;
    double width = self->sfr_bounds.size.width;
    double height = self->sfr_bounds.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isFlat
{
  return (*(unsigned char *)&self->sfr_bpFlags >> 2) & 1;
}

- (BOOL)isClockwise
{
  uint64_t v3 = [(CRLBezierPath *)self elementCount];
  if (v3 < 1)
  {
    float v10 = 0.0;
  }
  else
  {
    uint64_t v5 = v3;
    uint64_t v6 = 0;
    char v7 = 0;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    float v10 = 0.0;
    *(void *)&long long v4 = 67109378;
    long long v20 = v4;
    double v11 = y;
    double v12 = CGPointZero.x;
    do
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v6, &v29, v20))
      {
        case 0:
          double v12 = v29;
          double v11 = v30;
          double x = v29;
          double y = v30;
          break;
        case 1:
          if (x != v29 || y != v30) {
            float v10 = x * v30 - y * v29 + v10;
          }
          char v7 = 1;
          double x = v29;
          double y = v30;
          break;
        case 2:
          unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D4C18);
          }
          int v15 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v22 = v14;
            __int16 v23 = 2082;
            uint64_t v24 = "-[CRLBezierPath isClockwise]";
            __int16 v25 = 2082;
            uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
            __int16 v27 = 1024;
            int v28 = 1622;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Path should be flat. Illegal CRLCurveToBezierPathElement.", buf, 0x22u);
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D4C38);
            }
          }
          double v16 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            float64x2_t v18 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v20;
            unsigned int v22 = v14;
            __int16 v23 = 2114;
            uint64_t v24 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString isClockwise], 1622, 0, "Path should be flat. Illegal CRLCurveToBezierPathElement."");
          break;
        case 3:
          BOOL v17 = x == v12 && y == v11;
          char v7 = 0;
          if (!v17) {
            float v10 = x * v11 - y * v12 + v10;
          }
          break;
        default:
          break;
      }
      ++v6;
    }
    while (v5 != v6);
    if (v7) {
      float v10 = x * v11 - y * v12 + v10;
    }
  }
  return v10 >= 0.0;
}

- (BOOL)containsClosePathElement
{
  int64_t sfr_elementCount = self->sfr_elementCount;
  int64_t v3 = sfr_elementCount + 1;
  uint64_t v4 = 24 * sfr_elementCount - 24;
  do
  {
    if (--v3 < 1) {
      break;
    }
    uint64_t v5 = *(void *)((char *)self->sfr_head + v4);
    v4 -= 24;
  }
  while ((v5 & 0xF) != 3);
  return v3 > 0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4C58);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "-[CRLBezierPath calculateLengthOfElement:]";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 1722;
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = a3;
      *(_WORD *)&buf[44] = 2048;
      *(void *)&buf[46] = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4C78);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    int64_t v19 = self->sfr_elementCount;
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[CRLBezierPath calculateLengthOfElement:]");
    id v17 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString calculateLengthOfElement:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 1722, 1, "Given index (%zd) must be within bounds [0, %zd)."", a3, self->sfr_elementCount, 1722, a3, v19);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v17, v18);
    abort();
  }
  if (!a3) {
    return 0.0;
  }
  *(_OWORD *)buf = xmmword_101175160;
  *(_OWORD *)&buf[16] = xmmword_101175160;
  *(_OWORD *)&buf[32] = xmmword_101175160;
  *(_OWORD *)&buf[48] = xmmword_101175160;
  int64_t v3 = [(CRLBezierPath *)self elementAtIndex:a3 allPoints:buf];
  if (v3 == 3) {
    return sub_1000653B4(*(double *)buf, *(double *)&buf[8], *(double *)&buf[16], *(double *)&buf[24]);
  }
  if (v3 == 2)
  {
    float v20 = 0.0;
    sub_1000ED84C((uint64_t)buf, &v20);
    return v20;
  }
  else
  {
    double result = 0.0;
    if (v3 == 1) {
      return sub_1000653B4(*(double *)buf, *(double *)&buf[8], *(double *)&buf[16], *(double *)&buf[24]);
    }
  }
  return result;
}

- (void)calculateLengths
{
  self->sfr_totalLength = 0.0;
  uint64_t v3 = [(CRLBezierPath *)self elementCount];
  self->sfr_elementLength = (double *)NSZoneRealloc((NSZone *)[(CRLBezierPath *)self zone], self->sfr_elementLength, 8 * self->sfr_elementMax);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      [(CRLBezierPath *)self calculateLengthOfElement:i];
      self->sfr_elementLength[i] = v5;
      self->sfr_totalLength = v5 + self->sfr_totalLength;
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(CRLBezierPath *)self calculateLengths];
  }
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    unsigned int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4C98);
    }
    unsigned int v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      unsigned int v20 = v6;
      __int16 v21 = 2082;
      unsigned int v22 = "-[CRLBezierPath lengthOfElement:]";
      __int16 v23 = 2082;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      __int16 v25 = 1024;
      int v26 = 1775;
      __int16 v27 = 2048;
      int64_t v28 = a3;
      __int16 v29 = 2048;
      int64_t v30 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4CB8);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    int64_t v18 = self->sfr_elementCount;
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[CRLBezierPath lengthOfElement:]");
    id v16 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString lengthOfElement:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 1775, 1, "Given index (%zd) must be within bounds [0, %zd)."", a3, self->sfr_elementCount, 1775, a3, v18);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v16, v17);
    abort();
  }
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(CRLBezierPath *)self calculateLengths];
  }
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4CD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101077454();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must not be negative.", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[CRLBezierPath lengthToElement:]");
    id v18 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString lengthToElement:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 1785, 1, "Given index (%zd) must not be negative.", v3, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"", 1785, v3);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v18, v19);
    abort();
  }
  if (self->sfr_elementCount <= a3)
  {
    unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4D18);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      unsigned int v21 = v8;
      __int16 v22 = 2082;
      __int16 v23 = "-[CRLBezierPath lengthToElement:]";
      __int16 v24 = 2082;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      __int16 v26 = 1024;
      int v27 = 1788;
      __int16 v28 = 2048;
      int64_t v29 = v3;
      __int16 v30 = 2048;
      int64_t v31 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must not be greater than or equal to max element (%zd)", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4D38);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString lengthToElement:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 1788, 0, "Given index (%zd) must not be greater than or equal to max element (%zd)"", v3, self->sfr_elementCount);
    [(CRLBezierPath *)self length];
  }
  else
  {
    if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
      [(CRLBezierPath *)self calculateLengths];
    }
    if (v3)
    {
      sfr_elementLength = self->sfr_elementLength;
      double result = 0.0;
      do
      {
        double v7 = *sfr_elementLength++;
        double result = result + v7;
        --v3;
      }
      while (v3);
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (int64_t)elementAtIndex:(int64_t)a3
{
  return [(CRLBezierPath *)self elementAtIndex:a3 associatedPoints:0];
}

- (int64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    unsigned int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4D58);
    }
    uint64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      unsigned int v50 = v12;
      __int16 v51 = 2082;
      unsigned int v52 = "-[CRLBezierPath elementAtIndex:associatedPoints:]";
      __int16 v53 = 2082;
      double v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      __int16 v55 = 1024;
      int v56 = 1816;
      __int16 v57 = 2048;
      int64_t v58 = a3;
      __int16 v59 = 2048;
      int64_t v60 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4D78);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    int64_t v47 = self->sfr_elementCount;
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[CRLBezierPath elementAtIndex:associatedPoints:]");
    id v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:associatedPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1816, 1, "Given index (%zd) must be within bounds [0, %zd).", a3, self->sfr_elementCount, 1816, a3, v47);
    goto LABEL_18;
  }
  sfr_head = self->sfr_head;
  double v5 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(void *)v5 & 0xFLL) != 2)
    {
LABEL_8:
      *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
      return *(void *)v5 & 0xFLL;
    }
    int64_t v6 = *(void *)v5 >> 4;
    if (v6 >= self->sfr_extraSegmentCount)
    {
      unsigned int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4D98);
      }
      __int16 v28 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
        *(_DWORD *)buf = 67110402;
        unsigned int v50 = v27;
        __int16 v51 = 2082;
        unsigned int v52 = "-[CRLBezierPath elementAtIndex:associatedPoints:]";
        __int16 v53 = 2082;
        double v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
        __int16 v55 = 1024;
        int v56 = 1822;
        __int16 v57 = 2048;
        int64_t v58 = a3;
        __int16 v59 = 2048;
        int64_t v60 = sfr_extraSegmentCount;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Extra index (%zd) must be within extra segment bounds [0, %zd).", buf, 0x36u);
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D4DB8);
        }
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      int64_t v48 = self->sfr_extraSegmentCount;
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Extra index (%zd) must be within extra segment bounds [0, %zd).", v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[CRLBezierPath elementAtIndex:associatedPoints:]");
      id v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:associatedPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1822, 1, "Extra index (%zd) must be within extra segment bounds [0, %zd).", a3, self->sfr_extraSegmentCount, 1822, a3, v48);
    }
    else
    {
      sfr_extraSegments = (char *)self->sfr_extraSegments;
      if (sfr_extraSegments)
      {
        unsigned int v8 = (CGPoint *)&sfr_extraSegments[32 * v6];
        *a4 = *v8;
        a4[1] = v8[1];
        a4 += 2;
        goto LABEL_8;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4DD8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101077530();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Missing extra segments.", v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[CRLBezierPath elementAtIndex:associatedPoints:]");
      id v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:associatedPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1824, 1, "Missing extra segments.", v44, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 1824, v45, v46);
    }
LABEL_18:
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v22, *(Swift::String *)&v23);
    abort();
  }
  return *(void *)v5 & 0xFLL;
}

- (void)iteratePathElementsWithBlock:(id)a3
{
  int64_t v5 = [(CRLBezierPath *)self elementCount];
  if (v5)
  {
    int64_t v6 = v5;
    uint64_t v7 = 0;
    CGFloat y = CGPointZero.y;
    do
    {
      switch([(CRLBezierPath *)self elementAtIndex:v7 associatedPoints:&v18])
      {
        case 0:
          uint64_t v15 = (void (*)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))*((void *)a3 + 2);
          v9.n128_u64[0] = v18;
          v10.n128_u64[0] = v19;
          id v16 = a3;
          uint64_t v17 = 0;
          goto LABEL_8;
        case 1:
          uint64_t v15 = (void (*)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))*((void *)a3 + 2);
          v9.n128_u64[0] = v18;
          v10.n128_u64[0] = v19;
          id v16 = a3;
          uint64_t v17 = 1;
          goto LABEL_8;
        case 2:
          v9.n128_u64[0] = v22;
          v10.n128_u64[0] = v23;
          v11.n128_u64[0] = v18;
          v12.n128_u64[0] = v19;
          v13.n128_u64[0] = v20;
          v14.n128_u64[0] = v21;
          (*((void (**)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))a3 + 2))(a3, 2, v9, v10, v11, v12, v13, v14);
          break;
        case 3:
          uint64_t v15 = (void (*)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))*((void *)a3 + 2);
          id v16 = a3;
          uint64_t v17 = 3;
          v9.n128_u64[0] = *(void *)&CGPointZero.x;
          v10.n128_f64[0] = y;
LABEL_8:
          v11.n128_u64[0] = *(void *)&CGPointZero.x;
          v12.n128_f64[0] = y;
          v13.n128_u64[0] = *(void *)&CGPointZero.x;
          v14.n128_f64[0] = y;
          v15(v16, v17, v9, v10, v11, v12, v13, v14);
          break;
        default:
          break;
      }
      ++v7;
    }
    while (v6 != v7);
  }
}

- (int64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4E18);
    }
    __n128 v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      unsigned int v25 = v11;
      __int16 v26 = 2082;
      unsigned int v27 = "-[CRLBezierPath elementAtIndex:allPoints:]";
      __int16 v28 = 2082;
      int64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      __int16 v30 = 1024;
      int v31 = 1869;
      __int16 v32 = 2048;
      int64_t v33 = a3;
      __int16 v34 = 2048;
      int64_t v35 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4E38);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    int64_t v23 = self->sfr_elementCount;
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v14, v15, v16, v17, v18, v19, v20, (uint64_t)"-[CRLBezierPath elementAtIndex:allPoints:]");
    id v21 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:allPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1869, 1, "Given index (%zd) must be within bounds [0, %zd).", a3, self->sfr_elementCount, 1869, a3, v23);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v21, v22);
    abort();
  }
  sfr_head = self->sfr_head;
  int64_t v5 = &sfr_head[6 * a3];
  if (a4)
  {
    unint64_t v6 = *(void *)v5;
    if ((*(void *)v5 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      unint64_t v6 = *(void *)v5;
    }
    if ((v6 & 0xF) != 0)
    {
      if ((v6 & 0xF) == 2)
      {
        uint64_t v7 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v6 >> 4));
        a4[1] = *v7;
        a4[2] = v7[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(void *)v5 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  if (a4 < 0 || self->sfr_elementCount <= a4)
  {
    unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4E58);
    }
    unsigned int v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      unsigned int v24 = v10;
      __int16 v25 = 2082;
      __int16 v26 = "-[CRLBezierPath setAssociatedPoints:atIndex:]";
      __int16 v27 = 2082;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      __int16 v29 = 1024;
      int v30 = 1895;
      __int16 v31 = 2048;
      int64_t v32 = a4;
      __int16 v33 = 2048;
      int64_t v34 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4E78);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    int64_t v22 = self->sfr_elementCount;
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[CRLBezierPath setAssociatedPoints:atIndex:]");
    id v20 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath setAssociatedPoints:atIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1895, 1, "Given index (%zd) must be within bounds [0, %zd).", a4, self->sfr_elementCount, 1895, a4, v22);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v20, v21);
    abort();
  }
  sfr_head = self->sfr_head;
  if ((*(void *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    unint64_t v6 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(void *)&sfr_head[6 * a4] >> 4));
    *unint64_t v6 = *a3;
    CGPoint v7 = a3[1];
    a3 += 2;
    v6[1] = v7;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 3u;
}

- (void)_appendToPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  sfr_head = self->sfr_head;
  int64_t sfr_elementCount = self->sfr_elementCount;
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  BOOL v8 = a4 && (uint64_t)[a3 elementCount] > 0;
  if (sfr_elementCount >= 1)
  {
    __n128 v9 = &sfr_head[6 * sfr_elementCount];
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          if (!v8) {
            [a3 moveToPoint:*(double *)&sfr_head[2], *(double *)&sfr_head[4]];
          }
          BOOL v8 = 0;
          break;
        case 1:
          [a3 lineToPoint:*(double *)&sfr_head[2], *(double *)&sfr_head[4]];
          break;
        case 2:
          [a3 curveToPoint:*(double *)&sfr_head[2] controlPoint1:*(double *)&sfr_head[4] controlPoint2:sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]];
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
    while (sfr_head < v9);
  }
}

- (void)appendBezierPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    _[a3 _appendToPath:self skippingInitialMoveIfPossible:v4];
  }
  else
  {
    BOOL v8 = v4 && [(CRLBezierPath *)self elementCount] > 0;
    uint64_t v9 = (uint64_t)[a3 elementCount];
    if (v9 >= 1)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        switch((unint64_t)[a3 elementAtIndex:i associatedPoints:&v12])
        {
          case 0uLL:
            if (!v8) {
              -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v12, v13);
            }
            BOOL v8 = 0;
            break;
          case 1uLL:
            -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v12, v13);
            break;
          case 2uLL:
            -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v16, v17, v12, v13, v14, v15);
            break;
          case 3uLL:
            [(CRLBezierPath *)self closePath];
            break;
          default:
            continue;
        }
      }
    }
  }
}

- (void)appendBezierPath:(id)a3
{
}

- (void)appendPointsInRange:(_NSRange)a3 fromBezierPath:(id)a4
{
  uint64_t v4 = 0;
  -[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:](self, "p_appendPointsInRange:fromBezierPath:countingSubpaths:", a3.location, a3.length, a4, &v4);
}

- (void)p_appendPointsInRange:(_NSRange)a3 fromBezierPath:(id)a4 countingSubpaths:(unint64_t *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v10 = a3.location + a3.length;
  if (a3.location + a3.length > (unint64_t)[a4 elementCount])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4E98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010776A8();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2004, 0, "Point append range is out of range of available points.");
  }
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) != 0) {
    int v11 = (*((unsigned __int8 *)a4 + 201) >> 2) & 1;
  }
  else {
    int v11 = 0;
  }
  if (location < v10)
  {
    NSUInteger v12 = location;
    do
    {
      long long v24 = xmmword_101175160;
      long long v25 = xmmword_101175160;
      long long v26 = xmmword_101175160;
      switch((unint64_t)[a4 elementAtIndex:v12 associatedPoints:&v24])
      {
        case 0uLL:
          ++*a5;
          [(CRLBezierPath *)self moveToPoint:v24];
          break;
        case 1uLL:
          [(CRLBezierPath *)self lineToPoint:v24];
          break;
        case 2uLL:
          if ([(CRLBezierPath *)self isEmpty])
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D4ED8);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_1010775EC();
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101076AC0();
            }
            sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a curve when there is no current point.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:]");
            id v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2019, 1, "Unable to add a curve when there is no current point.");
            SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v22, v23);
            abort();
          }
          if (v12 > location) {
            int v13 = v11;
          }
          else {
            int v13 = 0;
          }
          if (v13 == 1) {
            double v14 = *(double *)(*((void *)a4 + 4) + 8 * v12);
          }
          else {
            double v14 = NAN;
          }
          [(CRLBezierPath *)self _deviceCurveToPoint:v26 controlPoint1:v24 controlPoint2:v25 elementLength:v14];
          break;
        case 3uLL:
          [(CRLBezierPath *)self closePath];
          break;
        default:
          break;
      }
      ++v12;
      --length;
    }
    while (length);
  }
}

- (id)copyWithPointsInRange:(_NSRange)a3
{
  uint64_t v4 = 0;
  return -[CRLBezierPath copyWithPointsInRange:countingSubpaths:](self, "copyWithPointsInRange:countingSubpaths:", a3.location, a3.length, &v4);
}

- (id)copyWithPointsInRange:(_NSRange)a3 countingSubpaths:(unint64_t *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v8 = objc_alloc_init(CRLBezierPath);
  uint64_t v9 = v8;
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) != 0) {
    [(CRLBezierPath *)v8 calculateLengths];
  }
  if (length)
  {
    v12[0] = xmmword_101175160;
    v12[1] = xmmword_101175160;
    v12[2] = xmmword_101175160;
    v12[3] = xmmword_101175160;
    unint64_t v10 = [(CRLBezierPath *)self elementAtIndex:location allPoints:v12];
    if (v10)
    {
      ++*a4;
      if (v10 <= 3) {
        [(CRLBezierPath *)v9 moveToPoint:v12[0]];
      }
    }
    -[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:](v9, "p_appendPointsInRange:fromBezierPath:countingSubpaths:", location, length, self, a4);
  }
  return v9;
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[CRLBezierPath moveToPoint:](self, "moveToPoint:");
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v13));
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetMaxX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v15));
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v17));

  [(CRLBezierPath *)self closePath];
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4 = a4 - 1;
  if (a4 >= 1)
  {
    if ([(CRLBezierPath *)self isEmpty] || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100) {
      -[CRLBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    }
    else {
      -[CRLBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    }
    if ((unint64_t)a4 >= 2)
    {
      p_CGFloat y = &a3[1].y;
      do
      {
        -[CRLBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
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
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v16.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  BOOL v8 = objc_alloc_init(CRLBezierPath);
  -[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", CGPointZero.x, CGPointZero.y, 1.0, -45.0, 315.0);
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
  [(CRLBezierPath *)v8 transformUsingAffineTransform:&v15];
  [(CRLBezierPath *)self appendBezierPath:v8];
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

  -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", x + a4 * v18.__cosval, y + a4 * v18.__sinval, v16, v17, x + a4 * v18.__cosval + v15 * v18.__sinval, y + a4 * v18.__sinval - v15 * v18.__cosval, NAN);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y = a3.y;
  double x = a3.x;
  if (__fpclassifyd(a5) <= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4F18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101077828();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d angle1 should not be infinte or NaN (%f)", v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]");
    id v29 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2175, 1, "angle1 should not be infinte or NaN (%f)", *(void *)&a5, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 2175, *(void *)&a5);
LABEL_37:
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v29, *(Swift::String *)&v30);
    abort();
  }
  if (__fpclassifyd(a6) <= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4F58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101077764();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d angle2 should not be infinte or NaN (%f)", v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]");
    id v29 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2176, 1, "angle2 should not be infinte or NaN (%f)", *(void *)&a6, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 2176, *(void *)&a6);
    goto LABEL_37;
  }
  double v14 = a5 * 3.14159265 / 180.0;
  double v15 = a6 * 3.14159265;
  __double2 v16 = __sincos_stret(v14);
  double v17 = x + a4 * v16.__cosval;
  double v18 = y + a4 * v16.__sinval;
  if ([(CRLBezierPath *)self isEmpty]) {
    -[CRLBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v17, v18);
  }
  else {
    -[CRLBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v17, v18);
  }
  double v19 = v15 / 180.0;
  if (a7)
  {
    for (; v14 < v19; double v14 = v14 + 6.28318531)
      ;
    double v20 = v14 - v19;
    if (v14 - v19 > 1.57079633)
    {
      do
      {
        double v21 = v14 + -1.57079633;
        -[CRLBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v14, v14 + -1.57079633);
        double v20 = v21 - v19;
        double v14 = v14 + -1.57079633;
      }
      while (v21 - v19 > 1.57079633);
      goto LABEL_18;
    }
LABEL_17:
    double v21 = v14;
    goto LABEL_18;
  }
  for (; v19 < v14; double v19 = v19 + 6.28318531)
    ;
  double v20 = v19 - v14;
  if (v19 - v14 <= 1.57079633) {
    goto LABEL_17;
  }
  do
  {
    double v21 = v14 + 1.57079633;
    -[CRLBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v14, v14 + 1.57079633);
    double v20 = v19 - v21;
    double v14 = v14 + 1.57079633;
  }
  while (v19 - v21 > 1.57079633);
LABEL_18:
  if (v20 > 0.0)
  {
    -[CRLBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v21, v19);
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
  CGFloat b = CGAffineTransformIdentity.b;
  CGFloat d = CGAffineTransformIdentity.d;
  CGFloat c = CGAffineTransformIdentity.c;
  tdouble y = CGAffineTransformIdentity.ty;
  tdouble x = CGAffineTransformIdentity.tx;
  [(CRLBezierPath *)self currentPoint];
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
  v38.a = CGAffineTransformIdentity.a;
  v38.CGFloat b = b;
  v38.CGFloat c = c;
  v38.CGFloat d = d;
  v38.tdouble x = tx;
  v38.tdouble y = ty;
  CGAffineTransformRotate(&v39, &v38, -v18);
  double v19 = v39.tx + v16 * v39.c + v39.a * v17;
  double v20 = v39.ty + v16 * v39.d + v39.b * v17;
  double v32 = v14;
  double v21 = v39.tx + (y - v14) * v39.c + v39.a * (x - v13);
  double v22 = v39.ty + (y - v14) * v39.d + v39.b * (x - v13);
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
  v38.a = CGAffineTransformIdentity.a;
  v38.CGFloat b = b;
  v38.CGFloat c = c;
  v38.CGFloat d = d;
  v38.tdouble x = tx;
  v38.tdouble y = ty;
  CGAffineTransformRotate(&v39, &v38, v18);
  -[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v39.tx + v27 * v39.c + v39.a * v19, v32 + v39.ty + v27 * v39.d + v39.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ((byte_1016A9080 & 1) == 0) {
    byte_1016A9080 = 1;
  }
  [(CRLBezierPath *)self _doPath];
  sfr_path = self->sfr_path;
  if (!sfr_path) {
    return 0;
  }
  BOOL v7 = (id)[(CRLBezierPath *)self windingRule] == (id)1;
  CGFloat v8 = x;
  CGFloat v9 = y;

  return CGPathContainsPoint(sfr_path, 0, *(CGPoint *)&v8, v7);
}

- (const)cString
{
  id v3 = +[NSMutableData data];
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_heaCGFloat d = self->sfr_head;
    unint64_t v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        CGFloat v8 = &v12;
        size_t v9 = 256;
      }
      else
      {
        char v12 = 32;
        CGFloat v8 = v13;
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
          *CGFloat v8 = 90;
          int v10 = 1;
LABEL_12:
          if (v10 < 1 || v10 >= (int)v9) {
            goto LABEL_23;
          }
          [v3 appendBytes:&v12 length:&v8[v10] - &v12];
          sfr_head += 6;
          if (sfr_head >= v6) {
            break;
          }
          continue;
        default:
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D4F98);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010779A8();
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101076AC0();
          }
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString cString], 2405, 0, "Unhandled path element type"");
LABEL_23:
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D4FD8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010778EC();
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101076AC0();
          }
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString cString], 2413, 0, "buffer too small for path element string"");
          goto LABEL_30;
      }
      break;
    }
  }
LABEL_30:
  char v12 = 0;
  [v3 appendBytes:&v12 length:1];
  return (const char *)[v3 bytes];
}

- (CRLBezierPath)initWithCString:(const char *)a3
{
  int64_t v4 = [(CRLBezierPath *)self init];
  int64_t v5 = v4;
  if (a3 && v4 && *a3)
  {
    int v36 = 0;
    char v35 = 0;
    while (1)
    {
      int v6 = v36;
      int v7 = a3[v36];
      if (v7 == 32)
      {
        CGFloat v8 = &a3[v36 + 1];
        do
        {
          ++v6;
          int v9 = *(unsigned __int8 *)v8++;
          int v7 = v9;
        }
        while (v9 == 32);
      }
      int v36 = v6 + 1;
      if (!v7) {
        return v5;
      }
      if ((char)v7 > 98)
      {
        if ((char)v7 > 108)
        {
          if ((char)v7 == 122) {
            goto LABEL_29;
          }
          if ((char)v7 == 113)
          {
LABEL_30:
            sub_1000ECBE0((uint64_t)a3, &v36, &v35);
            double v28 = v27;
            sub_1000ECBE0((uint64_t)a3, &v36, &v35);
            double v30 = v29;
            sub_1000ECBE0((uint64_t)a3, &v36, &v35);
            double v32 = v31;
            sub_1000ECBE0((uint64_t)a3, &v36, &v35);
            -[CRLBezierPath curveToPoint:controlPoint:](v5, "curveToPoint:controlPoint:", v32, v33, v28, v30);
            goto LABEL_31;
          }
          if ((char)v7 != 109)
          {
LABEL_40:
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D5018);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101077B20();
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101076AC0();
            }
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString initWithCString:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 2485, 0, "Bezier path string contained unknown elmt."");
LABEL_32:
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D5058);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101077A64();
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101076AC0();
            }
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath *)NSString initWithCString:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"], 2491, 0, "Something is wrong with this bezier path!"");
            return v5;
          }
LABEL_27:
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v14 = v13;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          -[CRLBezierPath moveToPoint:](v5, "moveToPoint:", v14, v15);
          goto LABEL_31;
        }
        if ((char)v7 == 99)
        {
LABEL_28:
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v17 = v16;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v19 = v18;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v21 = v20;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v23 = v22;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v25 = v24;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", v25, v26, v17, v19, v21, v23);
          goto LABEL_31;
        }
        if ((char)v7 != 101)
        {
          if ((char)v7 != 108) {
            goto LABEL_40;
          }
          goto LABEL_19;
        }
      }
      else
      {
        if ((char)v7 > 76)
        {
          if ((char)v7 != 77)
          {
            if ((char)v7 == 81) {
              goto LABEL_30;
            }
            if ((char)v7 != 90) {
              goto LABEL_40;
            }
LABEL_29:
            [(CRLBezierPath *)v5 closePath];
            goto LABEL_31;
          }
          goto LABEL_27;
        }
        if ((char)v7 == 67) {
          goto LABEL_28;
        }
        if ((char)v7 != 69)
        {
          if ((char)v7 != 76) {
            goto LABEL_40;
          }
LABEL_19:
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          double v11 = v10;
          sub_1000ECBE0((uint64_t)a3, &v36, &v35);
          -[CRLBezierPath lineToPoint:](v5, "lineToPoint:", v11, v12);
        }
      }
LABEL_31:
      if (v35) {
        goto LABEL_32;
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
    int v9 = (PATHSEGMENT *)NSZoneRealloc((NSZone *)[(CRLBezierPath *)self zone], self->sfr_head, 24 * self->sfr_elementMax);
    if (v9)
    {
      self->sfr_heaCGFloat d = v9;
      if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
        goto LABEL_6;
      }
      double v10 = (double *)NSZoneRealloc((NSZone *)[(CRLBezierPath *)self zone], self->sfr_elementLength, 8 * self->sfr_elementMax);
      if (v10)
      {
        self->sfr_elementLength = v10;
        goto LABEL_6;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D50D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101077C98();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_elementLength)", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      char v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      double v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"];
      double v25 = "sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_elementLength)";
      double v26 = v35;
      uint64_t v27 = 2577;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5098);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101077BDC();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_head)", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      double v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      double v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"];
      double v25 = "sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_head)";
      double v26 = v23;
      uint64_t v27 = 2568;
    }
    id v36 = +[CRLAssertionHandler handleFailureInFunction:v26 file:v24 lineNumber:v27 isFatal:1 description:v25];
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v36, v37);
    abort();
  }
LABEL_6:
  *(void *)&self->sfr_head[6 * self->sfr_elementCount] = *(void *)&self->sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
  *(void *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
  int64_t v11 = self->sfr_elementCount;
  double v12 = &self->sfr_head[6 * v11];
  *(CGFloat *)&v12[2] = x;
  *(CGFloat *)&_OWORD v12[4] = y;
  self->int64_t sfr_elementCount = v11 + 1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 3);
  if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    [(CRLBezierPath *)self calculateLengthOfElement:self->sfr_elementCount - 1];
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_heaCGFloat d = self->sfr_head;
    int64_t v6 = self->sfr_elementCount - 1;
    if ((*(unsigned char *)&sfr_head[6 * v6] & 0xF) == 0) {
      goto LABEL_6;
    }
  }
  else if (v4 == 1)
  {
    sfr_heaCGFloat d = self->sfr_head;
    int64_t v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  int64_t v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndeCGFloat x = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5 elementLength:(double)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v9 = a4.y;
  CGFloat v10 = a4.x;
  -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    self->sfr_extraSegmentMaCGFloat x = 2 * sfr_extraSegmentCount + 10;
    sfr_extraSegments = (char *)NSZoneRealloc((NSZone *)[(CRLBezierPath *)self zone], self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
    if (!sfr_extraSegments)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5118);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101077D54();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d sfr_extraSegments could not NSZoneRealloc. No memory", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[CRLBezierPath(CRLBezierPathDevicePrimitives) _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:]");
      id v26 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2642, 1, "sfr_extraSegments could not NSZoneRealloc. No memory");
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v26, v27);
      abort();
    }
    self->sfr_extraSegments = sfr_extraSegments;
    int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  }
  else
  {
    sfr_extraSegments = (char *)self->sfr_extraSegments;
  }
  double v14 = (CGFloat *)&sfr_extraSegments[32 * sfr_extraSegmentCount];
  *double v14 = v10;
  v14[1] = v9;
  v14[2] = x;
  v14[3] = y;
  self->int64_t sfr_extraSegmentCount = sfr_extraSegmentCount + 1;
  double v15 = &self->sfr_head[6 * self->sfr_elementCount];
  *(void *)&v15[-6] = *(void *)&v15[-6] & 0xFLL | (16 * sfr_extraSegmentCount);
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = self->sfr_bpFlags;
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFCFB | 0x200);
  if ((*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    double v17 = fabs(a6);
    if (v17 >= INFINITY && v17 <= INFINITY)
    {
      [(CRLBezierPath *)self calculateLengthOfElement:self->sfr_elementCount - 1];
      a6 = v18;
    }
    self->sfr_elementLength[self->sfr_elementCount - 1] = a6;
    self->sfr_totalLength = a6 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    sfr_lastSubpathIndeCGFloat x = self->sfr_lastSubpathIndex;
    if (sfr_lastSubpathIndex < 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5158);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101077E10();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLBezierPath(CRLBezierPathDevicePrimitives) *)NSString _deviceClosePath], 2671, 0, "Invalid parameter not satisfying: %{public}s", "sfr_lastSubpathIndex >= 0"");
      sfr_lastSubpathIndeCGFloat x = self->sfr_lastSubpathIndex;
    }
    -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 2], *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 4]);
    int v4 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v4[2], *(double *)&v4[4]);
    self->sfr_lastSubpathIndeCGFloat x = self->sfr_elementCount - 1;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

+ (void)setMiterLimit:(double)a3
{
}

+ (void)setFlatness:(double)a3
{
}

+ (double)flatness
{
  _[a1 defaultFlatness];
  return result;
}

+ (void)setWindingRule:(int64_t)a3
{
}

+ (int64_t)windingRule
{
  return (int64_t)_[a1 defaultWindingRule];
}

+ (void)setLineCapStyle:(unint64_t)a3
{
}

+ (void)setLineJoinStyle:(unint64_t)a3
{
}

+ (void)setLineWidth:(double)a3
{
}

+ (double)lineWidth
{
  _[a1 defaultLineWidth];
  return result;
}

- (id)description
{
  id v3 = +[NSMutableString string];
  [v3 appendFormat:@"CRLBezierPath <%p>" self];
  if (![(CRLBezierPath *)self isEmpty])
  {
    [(CRLBezierPath *)self bounds];
    [v3 appendFormat:@"\n  Bounds: %@", NSStringFromCGRect(v15)];
    [(CRLBezierPath *)self controlPointBounds];
    [v3 appendFormat:@"\n  Control point bounds: %@", NSStringFromCGRect(v16)];
    uint64_t v4 = [(CRLBezierPath *)self elementCount];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        switch([(CRLBezierPath *)self elementAtIndex:i associatedPoints:v12])
        {
          case 0:
            [v3 appendFormat:@"\n    %f %f moveto", v12[0], v8, v9, v10, v11];
            break;
          case 1:
            [v3 appendFormat:@"\n    %f %f lineto" v12[0], v8, v9, v10, v11];
            break;
          case 2:
            [v3 appendFormat:@"\n    %f %f %f %f %f %f curveto", v12[0], v12[1], v13, v14];
            break;
          case 3:
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

- (BOOL)isCompound
{
  uint64_t v3 = [(CRLBezierPath *)self elementCount];
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
      if (![(CRLBezierPath *)self elementAtIndex:v5]) {
        ++v6;
      }
      ++v5;
    }
    while (v4 != v5);
    int v7 = v6 - ([(CRLBezierPath *)self elementAtIndex:v4 - 1] == 0);
  }
  return v7 > 1;
}

- (BOOL)isOpen
{
  uint64_t v3 = [(CRLBezierPath *)self elementCount];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (v3 < 1)
  {
    double v9 = CGPointZero.y;
    double v10 = CGPointZero.x;
    return !sub_100064084(v10, y, x, v9);
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = 0;
    int v8 = 0;
    double v9 = CGPointZero.y;
    double v10 = CGPointZero.x;
    while (2)
    {
      switch([(CRLBezierPath *)self elementAtIndex:v7 associatedPoints:&v12])
      {
        case 0:
          double x = v12;
          double v9 = v13;
          if (!v8)
          {
            double v10 = v12;
            double y = v13;
          }
          ++v8;
          goto LABEL_9;
        case 1:
          double x = v12;
          double v9 = v13;
          goto LABEL_9;
        case 2:
          double x = v14;
          double v9 = v15;
          goto LABEL_9;
        case 3:
          goto LABEL_11;
        default:
LABEL_9:
          if (v6 != ++v7) {
            continue;
          }
          if (v8 <= 1) {
            return !sub_100064084(v10, y, x, v9);
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
  if ((id)[(CRLBezierPath *)self elementCount] == (id)2
    && ![(CRLBezierPath *)self elementAtIndex:0])
  {
    BOOL v3 = 1;
    int64_t v5 = [(CRLBezierPath *)self elementAtIndex:1];
    if (v5 == 1) {
      return v3;
    }
    if (v5 == 2)
    {
      [(CRLBezierPath *)self elementAtIndex:0 associatedPoints:&v10];
      [(CRLBezierPath *)self elementAtIndex:1 associatedPoints:v12];
      double v6 = v10;
      double v7 = v11;
      double v8 = v13;
      double v9 = v14;
      if (sub_1000F6F6C(v12[0], v12[1], v10, v11, v13, v14)) {
        return sub_1000F6F6C(v12[2], v12[3], v6, v7, v8, v9);
      }
    }
  }
  return 0;
}

- (BOOL)isEffectivelyClosed
{
  if ([(CRLBezierPath *)self containsClosePathElement]) {
    return 1;
  }
  if ([(CRLBezierPath *)self elementCount] < 2
    || [(CRLBezierPath *)self elementAtIndex:0 associatedPoints:&v10])
  {
    return 0;
  }
  unint64_t v4 = [(CRLBezierPath *)self elementAtIndex:(char *)[(CRLBezierPath *)self elementCount] - 1 associatedPoints:v9];
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

- (BOOL)containsElementsOtherThanMoveAndClose
{
  uint64_t v3 = [(CRLBezierPath *)self elementCount];
  if (v3 < 2) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 1;
  while (![(CRLBezierPath *)self elementAtIndex:v5]
       || (id)[(CRLBezierPath *)self elementAtIndex:v5] == (id)3)
  {
    if (v4 == ++v5) {
      return 0;
    }
  }
  return 1;
}

- (unint64_t)totalSubpathCountIncludingEffectivelyEmptySubpaths
{
  uint64_t v3 = [(CRLBezierPath *)self elementCount];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  do
  {
    if (![(CRLBezierPath *)self elementAtIndex:v5]) {
      ++v6;
    }
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (NSArray)rangesOfSubpaths
{
  uint64_t v3 = +[NSMutableArray array];
  uint64_t v4 = [(CRLBezierPath *)self elementCount];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      if ([(CRLBezierPath *)self elementAtIndex:v6])
      {
        uint64_t v8 = v7;
      }
      else
      {
        if (v7 >= 1)
        {
          double v9 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v7);
          [v3 addObject:v9];
        }
        uint64_t v8 = 0;
        uint64_t v5 = v6;
      }
      uint64_t v7 = v8 + 1;
      ++v6;
    }
    while (v4 != v6);
    if ((v8 & 0x8000000000000000) == 0)
    {
      double v10 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v8 + 1);
      [v3 addObject:v10];
    }
  }

  return (NSArray *)v3;
}

- (double)flattenedArea
{
  id v2 = self;
  if (![(CRLBezierPath *)v2 isFlat])
  {
    uint64_t v3 = [(CRLBezierPath *)v2 bezierPathByFlatteningPath];

    id v2 = (CRLBezierPath *)v3;
  }
  uint64_t v4 = [(CRLBezierPath *)v2 elementCount];
  double v5 = 0.0;
  if ((unint64_t)v4 >= 3)
  {
    uint64_t v6 = v4 - 1;
    [(CRLBezierPath *)v2 elementAtIndex:v4 - 1 associatedPoints:&v12];
    uint64_t v7 = 0;
    double v9 = v12;
    double v8 = v13;
    do
    {
      [(CRLBezierPath *)v2 elementAtIndex:v7 associatedPoints:&v12];
      double v10 = -(v13 * v9);
      double v9 = v12;
      double v5 = v5 + v10 + v12 * v8;
      ++v7;
      double v8 = v13;
    }
    while (v6 != v7);
    double v5 = v5 * 0.5;
  }

  return fabs(v5);
}

- (CGRect)boundsIncludingStroke
{
  [(CRLBezierPath *)self lineWidth];
  double v4 = v3;
  unint64_t v5 = [(CRLBezierPath *)self lineJoinStyle];
  unint64_t v6 = [(CRLBezierPath *)self lineCapStyle];
  [(CRLBezierPath *)self miterLimit];

  [(CRLBezierPath *)self boundsIncludingStrokeWidth:v5 joinStyle:v6 capStyle:0 miterLimit:v4 needsToExtendJoins:v7];
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (NSString)inferredAccessibilityDescription
{
  [(CRLBezierPath *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if ([(CRLBezierPath *)self isLineSegment])
  {
    double v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Line" value:0 table:0];
  }
  else if ([(CRLBezierPath *)self isRectangular])
  {
    double v11 = +[NSBundle mainBundle];
    double v7 = v11;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
    {
      uint64_t v8 = [v11 localizedStringForKey:@"Square" value:0 table:0];
    }
    else
    {
      uint64_t v8 = [v11 localizedStringForKey:@"Rectangle" value:0 table:0];
    }
  }
  else if ([(CRLBezierPath *)self isCircular])
  {
    double v12 = +[NSBundle mainBundle];
    double v7 = v12;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
    {
      uint64_t v8 = [v12 localizedStringForKey:@"Circle" value:0 table:0];
    }
    else
    {
      uint64_t v8 = [v12 localizedStringForKey:@"Oval" value:0 table:0];
    }
  }
  else if ([(CRLBezierPath *)self isTriangular])
  {
    double v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Triangle" value:0 table:0];
  }
  else
  {
    unsigned int v13 = [(CRLBezierPath *)self isDiamond];
    double v14 = +[NSBundle mainBundle];
    double v7 = v14;
    if (v13) {
      [v14 localizedStringForKey:@"Diamond" value:0 table:0];
    }
    else {
    uint64_t v8 = [v14 localizedStringForKey:@"Shape" value:0 table:0];
    }
  }
  double v9 = (void *)v8;

  return (NSString *)v9;
}

- (NSString)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  [(CRLBezierPath *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if ([(CRLBezierPath *)self isLineSegment])
  {
    double v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Describe the selected line." value:0 table:0];
  }
  else if ([(CRLBezierPath *)self isRectangular])
  {
    double v11 = +[NSBundle mainBundle];
    double v7 = v11;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
    {
      uint64_t v8 = [v11 localizedStringForKey:@"Describe the selected square." value:0 table:0];
    }
    else
    {
      uint64_t v8 = [v11 localizedStringForKey:@"Describe the selected rectangle." value:0 table:0];
    }
  }
  else if ([(CRLBezierPath *)self isCircular])
  {
    double v12 = +[NSBundle mainBundle];
    double v7 = v12;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
    {
      uint64_t v8 = [v12 localizedStringForKey:@"Describe the selected circle." value:0 table:0];
    }
    else
    {
      uint64_t v8 = [v12 localizedStringForKey:@"Describe the selected oval." value:0 table:0];
    }
  }
  else if ([(CRLBezierPath *)self isTriangular])
  {
    double v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Describe the selected triangle." value:0 table:0];
  }
  else
  {
    unsigned int v13 = [(CRLBezierPath *)self isDiamond];
    double v14 = +[NSBundle mainBundle];
    double v7 = v14;
    if (v13) {
      [v14 localizedStringForKey:@"Describe the selected diamond." value:0 table:0];
    }
    else {
    uint64_t v8 = [v14 localizedStringForKey:@"Describe the selected shape." value:0 table:0];
    }
  }
  double v9 = (void *)v8;

  return (NSString *)v9;
}

- (BOOL)hasAtLeastTwoVisuallyDistinctSubregions
{
  return +[CRLBezierPathBooleanOperationHelper hasAtLeastTwoVisuallyDistinctSubregionsInPath:self];
}

- (NSArray)visuallyDistinctSubregions
{
  return (NSArray *)+[CRLBezierPathBooleanOperationHelper pathsBySeparatingVisuallyDistinctSubregionsOfPath:self];
}

- (id)strokedCopy
{
  if (![(CRLBezierPath *)self containsElementsOtherThanMoveAndClose])
  {
    id v5 = +[CRLBezierPath bezierPath];
    goto LABEL_19;
  }
  double v3 = [(CRLBezierPath *)self p_strokedPathByUsingCG];
  double v4 = v3;
  if (!v3 || ([v3 containsElementsOtherThanMoveAndClose] & 1) == 0)
  {
    id v5 = 0;
LABEL_8:
    uint64_t v6 = [(CRLBezierPath *)self p_strokedPathByUsingBrushStroke];

    id v5 = (id)v6;
    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5970);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101078C1C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5990);
      }
      double v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) strokedCopy]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:325 isFatal:0 description:"Unable to recover from CoreGraphics and CRLBrushStroke failing to stroke."];

      id v5 = 0;
    }
    goto LABEL_18;
  }
  id v5 = v4;
  if (([v5 containsElementsOtherThanMoveAndClose] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_18:

LABEL_19:

  return v5;
}

- (id)p_strokedPathByUsingCG
{
  CGLineCap v3 = sub_1000E57B8([(CRLBezierPath *)self lineCapStyle]);
  CGLineJoin v4 = sub_1000E57B8([(CRLBezierPath *)self lineJoinStyle]);
  id v5 = self;
  uint64_t v6 = [(CRLBezierPath *)v5 CGPath];
  [(CRLBezierPath *)v5 lineWidth];
  CGFloat v8 = v7;
  [(CRLBezierPath *)v5 miterLimit];
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v6, 0, v8, v3, v4, v9);
  double v11 = +[CRLBezierPath bezierPathWithCGPath:CopyByStrokingPath];
  CGPathRelease(CopyByStrokingPath);

  return v11;
}

- (id)p_strokedPathByUsingBrushStroke
{
  unint64_t v3 = [(CRLBezierPath *)self lineCapStyle];
  if (v3 > 2) {
    CGLineJoin v4 = 0;
  }
  else {
    CGLineJoin v4 = *off_1014D6060[v3];
  }
  id v5 = [CRLBrushStroke alloc];
  uint64_t v6 = +[CRLColor blackColor];
  [(CRLBezierPath *)self lineWidth];
  double v8 = v7;
  unint64_t v9 = [(CRLBezierPath *)self lineCapStyle];
  unint64_t v10 = [(CRLBezierPath *)self lineJoinStyle];
  double v11 = +[CRLStrokePattern solidPattern];
  [(CRLBezierPath *)self miterLimit];
  unsigned int v13 = [(CRLBrushStroke *)v5 initWithName:v4 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];

  double v14 = [(CRLBrushStroke *)v13 strokedCopyOfPath:self];

  return v14;
}

- (id)pathByNormalizingClosedPathToRemoveSelfIntersections
{
  return +[CRLBezierPathBooleanOperationHelper pathByNormalizingPath:self];
}

- (id)uniteWithBezierPath:(id)a3
{
  unint64_t v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0);
  CGLineJoin v4 = +[CRLBezierPath uniteBezierPaths:v3];

  return v4;
}

+ (id)uniteBezierPaths:(id)a3
{
  unint64_t v3 = +[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:0 onPaths:a3];

  return v3;
}

- (id)intersectBezierPath:(id)a3
{
  unint64_t v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0);
  CGLineJoin v4 = +[CRLBezierPath intersectBezierPaths:v3];

  return v4;
}

+ (id)intersectBezierPaths:(id)a3
{
  unint64_t v3 = +[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:1 onPaths:a3];

  return v3;
}

- (id)subtractBezierPath:(id)a3
{
  unint64_t v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0);
  CGLineJoin v4 = +[CRLBezierPath subtractBezierPaths:v3];

  return v4;
}

+ (id)subtractBezierPaths:(id)a3
{
  unint64_t v3 = +[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:2 onPaths:a3];

  return v3;
}

- (id)excludeBezierPath:(id)a3
{
  unint64_t v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0);
  CGLineJoin v4 = +[CRLBezierPath excludeBezierPaths:v3];

  return v4;
}

+ (id)excludeBezierPaths:(id)a3
{
  unint64_t v3 = +[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:3 onPaths:a3];

  return v3;
}

+ (id)exteriorOfBezierPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 elementCount];
  uint64_t v5 = v4 - 1;
  if (v4 < 1)
  {
LABEL_21:
    id v7 = v3;
    goto LABEL_22;
  }
  uint64_t v6 = 0;
  id v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = 1;
  do
  {
    uint64_t v10 = v6 + 1;
    if (v5 != v6 && [v3 elementAtIndex:v6 + 1]) {
      goto LABEL_15;
    }
    if (v9)
    {
      if (!v7)
      {
        id v7 = +[CRLBezierPath bezierPath];
      }
      [v7 appendBezierPath:v3 fromSegment:v8 toSegment:v6 + 1];
    }
    if (v10 >= v5)
    {
      BOOL v9 = 0;
LABEL_15:
      uint64_t v10 = v8;
      goto LABEL_19;
    }
    [v3 elementAtIndex:v6 + 1 associatedPoints:v15];
    unsigned int v11 = [v7 containsPoint:v15[0], v15[1]] ^ 1;
    if ((v11 & 1) == 0)
    {
      id v12 = [v3 elementAtIndex:v6 + 2 associatedPoints:v16];
      if (v12 == (id)2)
      {
        unsigned int v13 = [v7 containsPoint:v16[4], v16[5]];
        goto LABEL_17;
      }
      if (v12 == (id)1)
      {
        unsigned int v13 = [v7 containsPoint:v16[0], v16[1]];
LABEL_17:
        unsigned int v11 = v13 ^ 1;
      }
    }
    BOOL v9 = v11 != 0;
LABEL_19:
    ++v6;
    uint64_t v8 = v10;
  }
  while (v4 != v6);
  if (!v7) {
    goto LABEL_21;
  }
LABEL_22:

  return v7;
}

+ (id)smoothBezierPath:(id)a3 withThreshold:(double)a4
{
  uint64_t v4 = +[CRLBezierPathSimplifier simplifiedPathWithRawPath:a3 threshold:a4];

  return v4;
}

- (id)bezierPathByOffsettingPath:(double)a3 joinStyle:(unint64_t)a4
{
  if (a3 == 0.0)
  {
LABEL_2:
    uint64_t v5 = self;
    goto LABEL_3;
  }
  unsigned __int8 v10 = [(CRLBezierPath *)self isEmpty];
  if (a3 < 0.0 && (v10 & 1) == 0)
  {
    [(CRLBezierPath *)self bounds];
    if (v11 <= a3 * -2.0)
    {
      [(CRLBezierPath *)self bounds];
      if (v12 <= a3 * -2.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D59B0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101078CA4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D59D0);
        }
        double v15 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        CGRect v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) bezierPathByOffsettingPath:joinStyle:]");
        double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:464 isFatal:0 description:"Cannot offset path that is already smaller than the offset amount!"];

        goto LABEL_2;
      }
    }
  }
  if (![(CRLBezierPath *)self isRectangular])
  {
    id v13 = [(CRLBezierPath *)self copy];
    [v13 setLineWidth:fabs(a3 + a3)];
    [v13 setLineJoinStyle:a4];
    double v14 = [v13 strokedCopy];
    if (a3 <= 0.0) {
      [v13 subtractBezierPath:v14];
    }
    else {
    uint64_t v6 = [v13 uniteWithBezierPath:v14];
    }

    goto LABEL_4;
  }
  [(CRLBezierPath *)self bounds];
  CGRect v20 = CGRectInset(v19, -a3, -a3);
  if (a3 > 0.0 && a4 == 1)
  {
    +[CRLBezierPath bezierPathWithLegacyRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithLegacyRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, a3);
    uint64_t v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    uint64_t v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue();
  }
LABEL_3:
  uint64_t v6 = v5;
LABEL_4:

  return v6;
}

+ (CRLBezierPath)bezierPathWithConvexHullOfPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  id v7 = +[CRLBezierPath bezierPath];
  uint64_t v8 = v7;
  double x = a3->x;
  double y = a3->y;
  if (a4)
  {
    p_double y = &a3->y;
    unint64_t v12 = a4;
    do
    {
      double v13 = *(p_y - 1);
      if (v13 >= x)
      {
        if (v13 == x && *p_y > y)
        {
          double x = *(p_y - 1);
          double y = *p_y;
        }
      }
      else
      {
        double y = *p_y;
        double x = *(p_y - 1);
      }
      p_y += 2;
      --v12;
    }
    while (v12);
  }
  [v7 moveToPoint:x, y];
  double v14 = CGPointZero.x;
  double v15 = CGPointZero.y;
  double v16 = x;
  for (double i = y; ; double i = v15)
  {
    if (!a4)
    {
      double v27 = a3->x;
      double v28 = a3->y;
      goto LABEL_26;
    }
    char v18 = 0;
    CGRect v19 = &a3->y;
    unint64_t v20 = a4;
    do
    {
      char v21 = v18;
      double v22 = v14;
      double v23 = v15;
      double v24 = *(v19 - 1);
      v18 |= v16 < v24;
      if (v16 < v24)
      {
        double v14 = *(v19 - 1);
        double v15 = *v19;
        if (v21)
        {
          [a1 p_findPointWithGreatestSlopeFromStartPoint:v16 toPointA:i toPointB:v22];
          double v14 = v25;
          double v15 = v26;
          char v18 = 1;
        }
      }
      v19 += 2;
      --v20;
    }
    while (v20);
    if ((v18 & 1) == 0) {
      break;
    }
    [v8 lineToPoint:v14, v15, v22, v23];
    double v16 = v14;
  }
  double v27 = a3->x;
  uint64_t v29 = &a3->y;
  double v28 = a3->y;
  unint64_t v30 = a4;
  do
  {
    double v31 = *(v29 - 1);
    if (v31 <= v27)
    {
      if (v31 == v27 && *v29 < v28)
      {
        double v27 = *(v29 - 1);
        double v28 = *v29;
      }
    }
    else
    {
      double v28 = *v29;
      double v27 = *(v29 - 1);
    }
    v29 += 2;
    --v30;
  }
  while (v30);
LABEL_26:
  [v8 lineToPoint:v27, v28];
  double v32 = CGPointZero.x;
  double v33 = CGPointZero.y;
  uint64_t v34 = &a3->y;
  while (a4)
  {
    char v35 = 0;
    id v36 = v34;
    unint64_t v37 = a4;
    do
    {
      char v38 = v35;
      double v39 = v32;
      double v40 = v33;
      double v41 = *(v36 - 1);
      v35 |= v27 > v41;
      if (v27 > v41)
      {
        double v32 = *(v36 - 1);
        double v33 = *v36;
        if (v38)
        {
          [a1 p_findPointWithGreatestSlopeFromStartPoint:v27 toPointA:v28 orPointB:v39];
          double v32 = v42;
          double v33 = v43;
          char v35 = 1;
        }
      }
      v36 += 2;
      --v37;
    }
    while (v37);
    if ((v35 & 1) == 0) {
      break;
    }
    [v8 lineToPoint:v32, v33, v39, v40];
    double v27 = v32;
    double v28 = v33;
  }
  [v8 lineToPoint:x, y];
  [v8 closePath];

  return (CRLBezierPath *)v8;
}

+ (CGPoint)p_findPointWithGreatestSlopeFromStartPoint:(CGPoint)a3 toPointA:(CGPoint)a4 orPointB:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a4.x - a3.x;
  double v11 = a5.x - a3.x;
  if (a4.x - a3.x == 0.0 || v11 == 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D59F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101078D2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5A10);
    }
    unint64_t v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPath(CRLAdditions) p_findPointWithGreatestSlopeFromStartPoint:toPointA:orPointB:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 600, 0, "If delta X is 0, we would divide by zero.");
  }
  double v15 = (v7 - v9) / v10;
  if (v10 == 0.0) {
    double v15 = 1.79769313e308;
  }
  double v16 = (y - v9) / v11;
  if (v11 == 0.0) {
    double v16 = 1.79769313e308;
  }
  if (v15 <= v16)
  {
    if (v16 <= v15)
    {
      if (fabs(v11) > fabs(v10))
      {
        double v8 = x;
        double v7 = y;
      }
    }
    else
    {
      double v8 = x;
      double v7 = y;
    }
  }
  double v17 = v8;
  double v18 = v7;
  result.double y = v18;
  result.double x = v17;
  return result;
}

+ (CRLBezierPath)bezierPathWithConvexHullFromWrapPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5A30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101078DB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5A50);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPath(CRLAdditions) bezierPathWithConvexHullFromWrapPath:]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:629 isFatal:0 description:"The wrap path cannot be empty when calculating the convex hull."];
  }
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = sub_1000F90B4;
  v11[4] = sub_1000F90D8;
  v11[5] = "";
  double v13 = 0;
  uint64_t v14 = 0;
  long long __p = 0;
  double v7 = [v3 bezierPathByFlatteningPathWithFlatness:1.0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F90F0;
  v10[3] = &unk_1014D5A78;
  v10[4] = v11;
  [v7 iteratePathElementsWithBlock:v10];
  double v8 = +[CRLBezierPath bezierPathWithConvexHullOfPoints:count:](CRLBezierPath, "bezierPathWithConvexHullOfPoints:count:");

  _Block_object_dispose(v11, 8);
  if (__p)
  {
    double v13 = __p;
    operator delete(__p);
  }

  return (CRLBezierPath *)v8;
}

- (id)pathBySplittingAtPointOnPath:(CGPoint)a3 controlPointDistanceEqual:(BOOL)a4
{
  BOOL v4 = a4;
  double x = a3.x;
  double v10 = 0.0;
  uint64_t v11 = 0;
  -[CRLBezierPath p_yValueFromXValue:elementIndex:parametricValue:](self, "p_yValueFromXValue:elementIndex:parametricValue:", &v11, &v10, a3.x, a3.y);
  double v8 = -[CRLBezierPath p_pathBySplittingAtPointGuaranteedToBeOnPath:controlPointDistanceEqual:elementIndex:parametricValue:](self, "p_pathBySplittingAtPointGuaranteedToBeOnPath:controlPointDistanceEqual:elementIndex:parametricValue:", v4, v11, x, v7, v10);

  return v8;
}

- (id)p_pathBySplittingAtPointGuaranteedToBeOnPath:(CGPoint)a3 controlPointDistanceEqual:(BOOL)a4 elementIndex:(int64_t)a5 parametricValue:(double)a6
{
  BOOL v7 = a4;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  uint64_t v11 = +[CRLBezierPath bezierPath];
  for (uint64_t i = 0; i < [(CRLBezierPath *)self elementCount]; ++i)
  {
    int64_t v13 = [(CRLBezierPath *)self elementAtIndex:i associatedPoints:&v78];
    if (a5 == i)
    {
      double v14 = v78;
      double v15 = v79;
      double v16 = v80;
      double v17 = v81;
      double v18 = v83;
      double v77 = v82;
      double v19 = sub_100064680(v78, v79, x);
      double v21 = sub_1000646A4(v19, v20, a6);
      double v22 = sub_100064698(x, y, v21);
      double v24 = v23;
      double v25 = sub_100064680(v16, v17, v14);
      double v27 = sub_1000646A4(v25, v26, a6);
      double v28 = sub_100064698(v14, v15, v27);
      double v30 = v29;
      double v76 = v18;
      double v31 = sub_100064680(v77, v18, v16);
      double v33 = sub_1000646A4(v31, v32, a6);
      double v34 = sub_100064698(v16, v17, v33);
      double v36 = v35;
      double v37 = sub_100064680(v28, v30, v22);
      double v39 = sub_1000646A4(v37, v38, a6);
      double v75 = v22;
      double v40 = v22;
      double v41 = v24;
      double v42 = sub_100064698(v40, v24, v39);
      double v44 = v43;
      double v73 = v36;
      double v74 = v34;
      double v45 = sub_100064680(v34, v36, v28);
      double v47 = sub_1000646A4(v45, v46, a6);
      double v48 = sub_100064698(v28, v30, v47);
      double v50 = v49;
      double v51 = sub_100064680(v48, v49, v42);
      double v53 = sub_1000646A4(v51, v52, a6);
      double v54 = sub_100064698(v42, v44, v53);
      double v56 = v55;
      if (v7)
      {
        double v57 = sub_100064680(v42, v44, v54);
        double v59 = v58;
        double v60 = sub_100064680(v48, v50, v54);
        double v62 = sub_1000646A4(v60, v61, -1.0);
        double v63 = sub_100064698(v57, v59, v62);
        double v65 = sub_1000646A4(v63, v64, 0.5);
        double v67 = v66;
        double v42 = sub_100064698(v54, v56, v65);
        double v44 = v68;
        double v69 = sub_1000646A4(v65, v67, -1.0);
        double v48 = sub_100064698(v54, v56, v69);
        double v50 = v70;
      }
      [v11 curveToPoint:v54 controlPoint1:v56 controlPoint2:v75];
      double y = v76;
      double x = v77;
      [v11 curveToPoint:v77 controlPoint1:v76 controlPoint2:v48, v50, v74, v73];
    }
    else
    {
      switch(v13)
      {
        case 0:
          [v11 moveToPoint:v78, v79];
          goto LABEL_10;
        case 1:
          [v11 lineToPoint:v78, v79];
LABEL_10:
          double x = v78;
          double y = v79;
          break;
        case 2:
          [v11 curveToPoint:v82 controlPoint1:v83 controlPoint2:v80 v81];
          double x = v82;
          double y = v83;
          break;
        case 3:
          [v11 closePath];
          break;
        default:
          continue;
      }
    }
  }

  return v11;
}

- (id)pathByCreatingHoleInPathAtPoint:(CGPoint)a3 withDiameter:(id)a4 andThreshold:(double)a5 updatingPatternOffsetsBySubpath:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  v96 = (double (**)(double, double, double, double, double))a4;
  id v11 = a6;
  double v98 = 0.0;
  v99 = 0;
  -[CRLBezierPath distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:](self, "distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:", &v99, &v98, 1, x, y, a5);
  double v13 = v12;
  if (v12 > a5
    || ([(CRLBezierPath *)self pointAt:v99 fromElement:v98],
        double v15 = v14,
        double v17 = v16,
        [(CRLBezierPath *)self gradientAt:v99 fromElement:v98],
        double v20 = v96[2](v13, v15, v17, v18, v19),
        v20 <= 0.0))
  {
    id v24 = 0;
    goto LABEL_6;
  }
  double v21 = +[CRLBezierPath bezierPath];
  double v22 = v99;
  if (v99)
  {
    double v23 = v99 - 1;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5A98);
    }
    double v26 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
      sub_10107905C();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5AB8);
    }
    double v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]");
    double v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:761 isFatal:0 description:"firstElementAfter should be at least 1."];

    double v23 = 0;
  }
  double v30 = v20 * 0.5;
  double v31 = v98;
  double v32 = v30;
  while (1)
  {
    long long v105 = xmmword_101175160;
    long long v106 = xmmword_101175160;
    long long v107 = xmmword_101175160;
    long long v108 = xmmword_101175160;
    int64_t v33 = [(CRLBezierPath *)self elementAtIndex:v23 + 1 allPoints:&v105];
    if (v33 == 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5AD8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101078FD4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5AF8);
      }
      double v37 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      double v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]");
      double v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v38 file:v39 lineNumber:798 isFatal:0 description:"-pathByCreatingHoleInPathAtPoint doesn't know how to handle close elements."];

LABEL_34:
      int v35 = 0;
      double v36 = v23 + 1;
      int v97 = 1;
      goto LABEL_35;
    }
    if ((unint64_t)(v33 - 3) < 0xFFFFFFFFFFFFFFFELL) {
      goto LABEL_34;
    }
    [(CRLBezierPath *)self lengthOfElement:v23 + 1];
    if (v32 <= v31 * v34) {
      break;
    }
    if (!v23)
    {
      int v97 = 0;
      int v47 = 0;
      uint64_t v41 = 0;
      double v40 = 0.0;
      id v24 = v21;
      if (v11) {
        goto LABEL_55;
      }
LABEL_52:
      double v48 = 0.0;
      double v49 = 0.0;
      goto LABEL_62;
    }
    double v32 = v32 - v31 * v34;
    --v23;
    double v31 = 1.0;
    if (v32 <= 0.0)
    {
      int v35 = 0;
      int v97 = 0;
      double v36 = v23 + 1;
LABEL_35:
      double v40 = 0.0;
      goto LABEL_37;
    }
  }
  int v97 = 0;
  double v40 = v31 - v32 / v34;
  double v36 = v23 + 1;
  int v35 = 1;
LABEL_37:
  v100[0] = 0;
  id v24 = -[CRLBezierPath copyWithPointsInRange:countingSubpaths:](self, "copyWithPointsInRange:countingSubpaths:", 0, v36, v100);

  uint64_t v41 = v100[0];
  if (v35)
  {
    long long v105 = xmmword_101175160;
    long long v106 = xmmword_101175160;
    long long v107 = xmmword_101175160;
    long long v108 = xmmword_101175160;
    int64_t v42 = [(CRLBezierPath *)self elementAtIndex:v36 allPoints:&v105];
    if ((unint64_t)(v42 - 1) >= 2)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5B18);
      }
      double v43 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
        sub_101078F4C();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5B38);
      }
      double v44 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      double v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]");
      double v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 847, 0, "If we have a path before, the last element before +1 should be a curve or line.");
    }
    if (v42 == 1)
    {
      [v24 lineToPoint:sub_100065E00(*(double *)&v105, *((double *)&v105 + 1), *(double *)&v106, *((double *)&v106 + 1), v40)];
    }
    else if (v42 == 2)
    {
      long long v101 = xmmword_101175160;
      long long v102 = xmmword_101175160;
      long long v103 = xmmword_101175160;
      long long v104 = xmmword_101175160;
      sub_100347D40((float64x2_t *)&v105, (uint64_t)&v101, 0.0, v40);
      [v24 curveToPoint:v104 controlPoint1:v102 controlPoint2:v103];
    }
  }
  int v47 = 1;
  if (!v11) {
    goto LABEL_52;
  }
LABEL_55:
  uint64_t v50 = (uint64_t)[v24 elementCount];
  if (v50 < 1)
  {
    double v49 = 0.0;
  }
  else
  {
    unint64_t v51 = v50 + 1;
    double v49 = 0.0;
    do
    {
      if (![v24 elementAtIndex:v51 - 2]) {
        break;
      }
      [v24 lengthOfElement:v51 - 2];
      double v49 = v49 + v52;
      --v51;
    }
    while (v51 > 1);
  }
  id v53 = [(CRLBezierPath *)self copyFromSegment:(v23 + 1) t:v99 toSegment:v40 t:v98];
  [v53 length];
  double v55 = v54;

  double v48 = v55 + 0.0;
LABEL_62:
  double v56 = INFINITY;
  double v57 = INFINITY;
  double v58 = v98;
  if (v22 >= (char *)[(CRLBezierPath *)self elementCount])
  {
    int v63 = 0;
    char v64 = 0;
LABEL_71:
    double v59 = 1.0;
    if (v11) {
      goto LABEL_109;
    }
  }
  else
  {
    double v59 = 1.0 - v58;
    while (1)
    {
      long long v105 = xmmword_101175160;
      long long v106 = xmmword_101175160;
      long long v107 = xmmword_101175160;
      long long v108 = xmmword_101175160;
      int64_t v60 = [(CRLBezierPath *)self elementAtIndex:v22 allPoints:&v105];
      if (v60 == 3)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5B58);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101078EC4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5B78);
        }
        double v65 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        double v66 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]");
        double v67 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v66 file:v67 lineNumber:894 isFatal:0 description:"-pathByCreatingHoleInPathAtPoint doesn't know how to handle close elements."];

LABEL_82:
        double v59 = 1.0;
        char v64 = 1;
        goto LABEL_89;
      }
      if ((unint64_t)(v60 - 3) < 0xFFFFFFFFFFFFFFFELL) {
        goto LABEL_82;
      }
      [(CRLBezierPath *)self lengthOfElement:v22];
      double v62 = v61;
      if (v30 <= v59 * v61) {
        break;
      }
      if (v22 >= (char *)[(CRLBezierPath *)self elementCount] - 1)
      {
        int v63 = 0;
        char v64 = 0;
        double v22 = (char *)[(CRLBezierPath *)self elementCount] - 1;
        goto LABEL_71;
      }
      double v30 = v30 - v59 * v62;
      ++v22;
      double v59 = 1.0;
      if (v30 <= 0.0) {
        goto LABEL_88;
      }
    }
    double v59 = 1.0 - v59 + v30 / v61;
    if (v60 == 2) {
      double v68 = sub_100064570((float64x2_t *)&v105, v59);
    }
    else {
      double v68 = sub_100065E00(*(double *)&v105, *((double *)&v105 + 1), *(double *)&v106, *((double *)&v106 + 1), v59);
    }
    double v56 = v68;
    double v57 = v69;
LABEL_88:
    char v64 = 0;
LABEL_89:
    BOOL v70 = v56 == INFINITY && v57 == INFINITY;
    id v71 = v22;
    if (!v70)
    {
      [v24 moveToPoint:v56, v57];
      long long v105 = xmmword_101175160;
      long long v106 = xmmword_101175160;
      long long v107 = xmmword_101175160;
      long long v108 = xmmword_101175160;
      int64_t v72 = [(CRLBezierPath *)self elementAtIndex:v22 allPoints:&v105];
      if ((unint64_t)(v72 - 1) >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5B98);
        }
        double v73 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR)) {
          sub_101078E3C();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5BB8);
        }
        double v74 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v95 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]");
        double v75 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v95, v75, 946, 0, "If we have a path after, the first element after should be a curve or line.");
      }
      if (v72 == 1)
      {
        [v24 lineToPoint:v106];
      }
      else if (v72 == 2)
      {
        long long v101 = xmmword_101175160;
        long long v102 = xmmword_101175160;
        long long v103 = xmmword_101175160;
        long long v104 = xmmword_101175160;
        sub_100347D40((float64x2_t *)&v105, (uint64_t)&v101, v59, 1.0);
        [v24 curveToPoint:v104 controlPoint1:v102 controlPoint2:v103];
      }
      id v71 = v22 + 1;
    }
    [v24 appendPointsInRange:v71 fromBezierPath:[self elementCount] - v71];
    int v63 = 1;
    if (v11)
    {
LABEL_109:
      id v76 = [(CRLBezierPath *)self copyFromSegment:v99 t:v22 toSegment:v98 t:v59];
      [v76 length];
      double v78 = v77;

      double v79 = +[NSMutableArray array];
      unint64_t v80 = 0;
      double v81 = v48 + v78;
      while (v80 < (unint64_t)[v11 count])
      {
        if (v80) {
          char v82 = 1;
        }
        else {
          char v82 = v47;
        }
        if (v80 + 1 == v41 || (v82 & 1) == 0)
        {
          if (v47)
          {
            v84 = [v11 objectAtIndexedSubscript:v80];
            [v79 addObject:v84];
          }
          if (!v63) {
            break;
          }
          if ((v64 & 1) == 0)
          {
            if (v97)
            {
              v85 = [v11 objectAtIndexedSubscript:v80 + 1];
              [v85 crl_CGFloatValue];
              double v87 = v86;

              double v88 = v87 + 0.0;
            }
            else
            {
              v89 = [v11 objectAtIndexedSubscript:v80];
              [v89 crl_CGFloatValue];
              double v91 = v90;

              double v88 = v49 + v91 + 0.0;
            }
            v92 = +[NSNumber crl_numberWithCGFloat:v81 + v88];
            [v79 addObject:v92];
          }
          if (v97) {
            unint64_t v93 = v80 + 1;
          }
          else {
            unint64_t v93 = v80;
          }
          unint64_t v80 = v93 + 1;
        }
        else
        {
          double v83 = [v11 objectAtIndexedSubscript:v80];
          [v79 addObject:v83];

          ++v80;
        }
      }
      [v11 removeAllObjects];
      [v11 addObjectsFromArray:v79];
    }
  }
  if (([v24 isEmpty] & 1) == 0
    && ([v24 containsElementsOtherThanMoveAndClose] & 1) == 0)
  {
    uint64_t v94 = +[CRLBezierPath bezierPath];

    id v24 = (id)v94;
    [v11 removeAllObjects];
  }
LABEL_6:

  return v24;
}

- (id)pathByWobblingByUpTo:(double)a3 subdivisions:(unint64_t)a4
{
  id v7 = [(CRLBezierPath *)self copy];
  [v7 removeAllPoints];
  double y = CGPointZero.y;
  double x = CGPointZero.x;
  uint64_t v8 = [(CRLBezierPath *)self elementCount];
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    float v10 = a3;
    double v36 = v10;
    do
    {
      switch([(CRLBezierPath *)self elementAtIndex:v9 associatedPoints:&v37])
      {
        case 0:
          double v12 = v37;
          double v11 = v38;
          double v13 = sub_100407E74();
          double y = v11 + (sub_100407E74() + -0.5) * v36;
          double x = v12 + (v13 + -0.5) * v36;
          [v7 moveToPoint:x];
          break;
        case 1:
          int v14 = 0;
          double v15 = v37;
          double v16 = v38;
          goto LABEL_8;
        case 2:
          double v18 = v41;
          double v17 = v42;
          double v19 = sub_100407E74();
          [v7 curveToPoint:v18 + (v19 + -0.5) * v36 controlPoint1:v17 + (sub_100407E74() + -0.5) * v36 controlPoint2:v37, v38, v39, v40];
          break;
        case 3:
          double v16 = y;
          double v15 = x;
          double v37 = x;
          double v38 = y;
          int v14 = 1;
LABEL_8:
          unint64_t v20 = 0;
          unsigned int v21 = 1;
          do
          {
            [v7 currentPoint];
            double v23 = v22;
            double v25 = v24;
            double v26 = sub_100064680(v15, v16, v22);
            double v28 = v27;
            float v29 = 1.0;
            unint64_t v30 = a4 - v20;
            if (v30)
            {
              float v31 = sub_100407E74() + 0.5;
              float v29 = fminf((float)(1.0 / (float)v30) * v31, 1.0);
            }
            double v32 = sub_100407E74();
            [v7 lineToPoint:v23 + v26 * v29 + (v32 + -0.5) * v36, v25 + v28 * v29 + (sub_100407E74() + -0.5) * v36];
            unint64_t v20 = v21++;
          }
          while (v20 <= a4);
          if (v14) {
            [v7 closePath];
          }
          break;
        default:
          break;
      }
      ++v9;
    }
    while (v9 != v8);
  }

  return v7;
}

- (id)arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSMutableArray array];
  uint64_t v6 = +[CRLBezierPath bezierPath];
  [(CRLBezierPath *)self copyPathAttributesTo:v6];
  for (uint64_t i = 0; [(CRLBezierPath *)self elementCount] > i; ++i)
  {
    switch([(CRLBezierPath *)self elementAtIndex:i associatedPoints:&v10])
    {
      case 0:
        if (([v6 isEmpty] & 1) == 0) {
          [v5 addObject:v6];
        }
        uint64_t v8 = +[CRLBezierPath bezierPath];

        [(CRLBezierPath *)self copyPathAttributesTo:v8];
        [v8 moveToPoint:v10, v11];
        break;
      case 1:
        [v6 lineToPoint:v10, v11];
        uint64_t v8 = v6;
        break;
      case 2:
        [v6 curveToPoint:v14 controlPoint1:v15 controlPoint2:v10, v11, v12, v13];
        uint64_t v8 = v6;
        break;
      case 3:
        [v6 closePath];
        [v5 addObject:v6];
        uint64_t v8 = +[CRLBezierPath bezierPath];

        [(CRLBezierPath *)self copyPathAttributesTo:v8];
        break;
      default:
        uint64_t v8 = v6;
        break;
    }
    uint64_t v6 = v8;
  }
  if (([v6 isEmpty] & 1) == 0
    && (!v3 || [v6 containsElementsOtherThanMoveAndClose]))
  {
    [v5 addObject:v6];
  }

  return v5;
}

- (id)pathSplitAtSubpathBoundariesWithSoftElementLimit:(unint64_t)a3 hardElementLimit:(unint64_t)a4
{
  if ([(CRLBezierPath *)self elementCount] < 0)
  {
    int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5BD8);
    }
    double v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_1010790E4(buf, v14, [(CRLBezierPath *)self elementCount], (os_log_t)v15);
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5BF8);
    }
    double v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]");
    double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1147, 0, "elementCount (%zd) should be positive.", [(CRLBezierPath *)self elementCount]);

    goto LABEL_51;
  }
  unint64_t v7 = [(CRLBezierPath *)self elementCount];
  if (a3 > a4)
  {
    unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    unint64_t v9 = a4;
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5C18);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v44 = v8;
      __int16 v45 = 2082;
      double v46 = "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]";
      __int16 v47 = 2082;
      double v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
      __int16 v49 = 1024;
      int v50 = 1154;
      __int16 v51 = 2048;
      unint64_t v52 = a3;
      __int16 v53 = 2048;
      unint64_t v54 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d softElementLimit (%zu) should be less than or equal to hardElementLimit (%zu).", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5C38);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1154, 0, "softElementLimit (%zu) should be less than or equal to hardElementLimit (%zu).", a3, v9);

    goto LABEL_51;
  }
  unint64_t v41 = a3;
  if (a3 < 2 || (unint64_t v19 = a4 - 1, a4 <= 1))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5C58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079170();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5C78);
    }
    int v35 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]");
    double v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v36 file:v37 lineNumber:1159 isFatal:0 description:"Unable to split a path with subpaths less than 2 elements at a time."];

    goto LABEL_51;
  }
  if (!v7)
  {
LABEL_51:
    unint64_t v20 = &__NSArray0__struct;
    goto LABEL_52;
  }
  if (v7 > a3)
  {
    unint64_t v40 = a4;
    unint64_t v20 = +[NSMutableArray array];
    unsigned int v21 = [(CRLBezierPath *)self p_elementCountForSubpaths];
    double v22 = (char *)[v21 count];
    if (!v22)
    {
LABEL_41:

      goto LABEL_52;
    }
    double v23 = 0;
    double v24 = 0;
    uint64_t v25 = 0;
    while (1)
    {
      double v26 = v21;
      double v27 = [v21 objectAtIndexedSubscript:v23];
      unint64_t v28 = (unint64_t)[v27 unsignedIntegerValue];
      ++v23;

      float v29 = &v24[v28];
      if ((unint64_t)&v24[v28] <= v41) {
        goto LABEL_37;
      }
      if (v24)
      {
        id v30 = -[CRLBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v25, v24);
        [v20 addObject:v30];

        v25 += (uint64_t)v24;
      }
      unint64_t v31 = v40;
      if (v28 <= v40) {
        break;
      }
      do
      {
        if (v28 >= v31) {
          int64_t v32 = v31;
        }
        else {
          int64_t v32 = v28;
        }
        id v33 = -[CRLBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v25, v32);
        [v20 addObject:v33];

        v25 += v32;
        unint64_t v31 = v19;
        v28 -= v32;
      }
      while (v28);
      float v29 = 0;
LABEL_40:
      double v24 = v29;
      unsigned int v21 = v26;
      if (v23 == v22) {
        goto LABEL_41;
      }
    }
    float v29 = (char *)v28;
LABEL_37:
    if (v23 == v22 && v29)
    {
      id v34 = -[CRLBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v25, v29);
      [v20 addObject:v34];
    }
    goto LABEL_40;
  }
  id v39 = [(CRLBezierPath *)self copy];
  id v42 = v39;
  unint64_t v20 = +[NSArray arrayWithObjects:&v42 count:1];

LABEL_52:

  return v20;
}

- (id)p_elementCountForSubpaths
{
  BOOL v3 = +[NSMutableArray array];
  uint64_t v4 = [(CRLBezierPath *)self elementCount];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = -v4;
    uint64_t v7 = 1;
    do
    {
      if (!(v6 + v7) || ![(CRLBezierPath *)self elementAtIndex:v7])
      {
        unsigned int v8 = +[NSNumber numberWithUnsignedInteger:v7 - v5];
        [v3 addObject:v8];

        uint64_t v5 = v7;
      }
      ++v7;
    }
    while (v6 + v7 != 1);
  }

  return v3;
}

- (BOOL)isVisuallyEqualToPath:(id)a3 withThreshold:(double)a4
{
  uint64_t v6 = (CRLBezierPath *)a3;
  uint64_t v7 = v6;
  if (v6 == self)
  {
    BOOL v18 = 1;
  }
  else if (v6)
  {
    uint64_t v25 = 0;
    double v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 1;
    unsigned int v8 = [[CRLBezierHitTester alloc] initWithBucketSize:5.0];
    unint64_t v9 = v8;
    if (a4 >= 1.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = a4;
    }
    [(CRLBezierHitTester *)v8 addPath:self filled:0 pathID:0 crawlingDistance:v10];
    [(CRLBezierHitTester *)v9 addPath:v7 filled:0 pathID:1 crawlingDistance:v10];
    uint64_t v11 = 0;
    char v12 = 1;
    do
    {
      char v13 = v12;
      int v14 = v7;
      if (v12) {
        double v15 = self;
      }
      else {
        double v15 = v7;
      }
      double v16 = v15;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000FB924;
      v20[3] = &unk_1014D5CC0;
      double v22 = &v25;
      double v17 = v9;
      unsigned int v21 = v17;
      double v23 = a4;
      uint64_t v24 = v11;
      [(CRLBezierPath *)v16 iterateOverPathWithPointDistancePerIteration:v20 usingBlock:1.0];

      char v12 = 0;
      uint64_t v11 = 1;
      uint64_t v7 = v14;
    }
    while ((v13 & 1) != 0);
    BOOL v18 = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (CGPoint)pointAlongPathAtPercentage:(double)a3
{
  uint64_t v5 = [(CRLBezierPath *)self bezierPathByFlatteningPath];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  [(CRLBezierPath *)self pointAlongPathAtPercentage:v5 withFlattenedPath:&v13 andLength:&v12 atStartIndex:a3];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)pointAlongPathAtPercentage:(double)a3 withFlattenedPath:(id)a4 andLength:(double *)a5 atStartIndex:(unint64_t *)a6
{
  id v6 = a4;
  if ([v6 isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5CE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010792B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5D00);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1289 isFatal:0 description:"It is impossible to find pointAlongPathAtPercentage at any percentage of an empty path."];
  }
  double v10 = (char *)[v6 elementCount];
  [v6 length];
  double v12 = v11;
  double v13 = v11 * sub_100407E48(a3, 0.0, 1.0);
  double v14 = *a5;
  unint64_t v15 = *a6;
  if (*a6 < (unint64_t)v10)
  {
    while (1)
    {
      long long v71 = xmmword_101175160;
      long long v72 = xmmword_101175160;
      long long v73 = xmmword_101175160;
      long long v74 = xmmword_101175160;
      unint64_t v16 = (unint64_t)[v6 elementAtIndex:v15 allPoints:&v71];
      if (v16 == 2)
      {
        unsigned int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5D20);
        }
        BOOL v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]";
          *(_WORD *)&buf[18] = 2082;
          *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1301;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We don't expect curve elements in a flattened path.", buf, 0x22u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5D40);
        }
        unint64_t v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          id v33 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v33;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        unint64_t v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]");
        unsigned int v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:1301 isFatal:0 description:"We don't expect curve elements in a flattened path."];

LABEL_25:
        double v24 = v14;
        goto LABEL_55;
      }
      if ((v16 | 2) != 3) {
        goto LABEL_25;
      }
      if (v16 == 1) {
        break;
      }
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      if (v15 && v16 == 3)
      {
        *(_OWORD *)buf = xmmword_101175160;
        *(_OWORD *)&buf[16] = xmmword_101175160;
        *(_OWORD *)&buf[32] = xmmword_101175160;
        long long v70 = xmmword_101175160;
        id v27 = [v6 elementAtIndex:v15 - 1 allPoints:buf];
        if (v27 == (id)1)
        {
          double y = *(double *)&buf[24];
          double x = *(double *)&buf[16];
        }
        else if (v27)
        {
          unsigned int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D5D60);
          }
          int v35 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)double v61 = 67109890;
            unsigned int v62 = v34;
            __int16 v63 = 2082;
            char v64 = "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]";
            __int16 v65 = 2082;
            double v66 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
            __int16 v67 = 1024;
            int v68 = 1323;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We expect the node before a close path to be either a move or lineto.", v61, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D5D80);
          }
          double v36 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            unint64_t v41 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)double v61 = 67109378;
            unsigned int v62 = v34;
            __int16 v63 = 2114;
            char v64 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v61, 0x12u);
          }
          double v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]");
          double v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:1323 isFatal:0 description:"We expect the node before a close path to be either a move or lineto."];
        }
        else
        {
          double x = *(double *)buf;
          double y = *(double *)&buf[8];
        }
        double v23 = y;
        double v22 = x;
        goto LABEL_53;
      }
      if (v16 == 3)
      {
        unsigned int v28 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5DA0);
        }
        float v29 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]";
          *(_WORD *)&buf[18] = 2082;
          *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1329;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Can't begin a path with a close element.", buf, 0x22u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5DC0);
        }
        id v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          unint64_t v40 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v40;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        unint64_t v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]");
        int64_t v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:1329 isFatal:0 description:"Can't begin a path with a close element."];
      }
      double v22 = CGPointZero.x;
      double v23 = y;
LABEL_54:
      double v39 = sub_1000653B4(v22, v23, x, y);
      double v24 = v14 + v39;
      if (v14 + v39 >= v13)
      {
        double v53 = sub_100064680(x, y, v22);
        if (v39 > 0.0)
        {
          float v54 = (v13 - v14) / v39;
          double v53 = sub_1000646A4(v53, v52, v54);
        }
        double v48 = sub_100064698(v22, v23, v53);
        CGFloat v47 = v55;
        *a5 = v14;
        *a6 = v15;
        goto LABEL_77;
      }
LABEL_55:
      ++v15;
      double v14 = v24;
      if (v10 == (char *)v15) {
        goto LABEL_58;
      }
    }
    double v23 = *((double *)&v71 + 1);
    double v22 = *(double *)&v71;
LABEL_53:
    double y = *((double *)&v72 + 1);
    double x = *(double *)&v72;
    goto LABEL_54;
  }
  double v24 = *a5;
LABEL_58:
  if (v24 == v13 || vabdd_f64(v24, v13) < 0.00999999978)
  {
    long long v71 = xmmword_101175160;
    long long v72 = xmmword_101175160;
    long long v73 = xmmword_101175160;
    long long v74 = xmmword_101175160;
    id v49 = [v6 elementAtIndex:v10 - 1 allPoints:&v71];
    int v50 = &v72;
    __int16 v51 = (double *)&v72 + 1;
    if (v49 != (id)1) {
      __int16 v51 = (double *)&v71 + 1;
    }
    CGFloat v47 = *v51;
    if (v49 != (id)1) {
      int v50 = &v71;
    }
    double v48 = *(double *)v50;
    *a5 = v12;
    *a6 = (unint64_t)(v10 - 1);
  }
  else
  {
    *a5 = 0.0;
    *a6 = 0;
    int v42 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5DE0);
    }
    double v43 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010791F8(v42, v43, a3);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5E00);
    }
    unsigned int v44 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    __int16 v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]");
    double v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 1374, 0, "Failed to find point at percentage: %f", *(void *)&a3);

    double v48 = CGPointZero.x;
    CGFloat v47 = CGPointZero.y;
  }
LABEL_77:

  double v56 = v48;
  double v57 = v47;
  result.double y = v57;
  result.double x = v56;
  return result;
}

- (void)iterateOverPathWithPointDistancePerIteration:(double)a3 usingBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ([(CRLBezierPath *)self elementCount] >= 1)
  {
    [(CRLBezierPath *)self length];
    double v8 = v7;
    if (v7 == 0.0 || fabs(v7) < 0.00999999978)
    {
      [(CRLBezierPath *)self currentPoint];
      v6[2](v6);
      [(CRLBezierPath *)self currentPoint];
      v6[2](v6);
    }
    else
    {
      double v9 = [(CRLBezierPath *)self bezierPathByFlatteningPath];
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      double v10 = 0.0;
      double v11 = a3 / v8;
      do
      {
        [(CRLBezierPath *)self pointAlongPathAtPercentage:v9 withFlattenedPath:&v13 andLength:&v12 atStartIndex:v10];
        v6[2](v6);
        double v10 = v11 + v10;
      }
      while (v10 < 1.0);
      [(CRLBezierPath *)self pointAlongPathAtPercentage:v9 withFlattenedPath:&v13 andLength:&v12 atStartIndex:1.0];
      v6[2](v6);
    }
  }
}

- (BOOL)intersectsRect:(CGRect)a3 hasFill:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CRLBezierPath *)self elementCount] < 2
    || ([(CRLBezierPath *)self bounds], !sub_10006525C(v10, v11, v12, v13, x, y, width, height)))
  {
    BOOL v18 = 0;
LABEL_19:
    BOOL v33 = 0;
    goto LABEL_20;
  }
  if (!v4)
  {
LABEL_7:
    BOOL v18 = [(CRLBezierPath *)self bezierPathByFlatteningPath];
    double v19 = CGPointZero.x;
    double v20 = CGPointZero.y;
    uint64_t v21 = (uint64_t)[v18 elementCount];
    if (v21 >= 1)
    {
      uint64_t v22 = 0;
      CGFloat v23 = v20;
      CGFloat v24 = CGPointZero.x;
      do
      {
        id v25 = [v18 elementAtIndex:v22 associatedPoints:&v38];
        if (v25 == (id)3)
        {
          if (sub_100064C24(v24, v23, v19, v20, x, y, width, height)) {
            goto LABEL_22;
          }
        }
        else if (v25 == (id)1)
        {
          double v35 = v20;
          double v36 = v19;
          CGFloat v26 = x;
          CGFloat v27 = y;
          CGFloat v28 = width;
          CGFloat v29 = height;
          double v30 = v38;
          double v31 = v39;
          char v32 = sub_100064C24(v24, v23, v38, v39, v26, v27, v28, v29);
          CGFloat v24 = v30;
          double height = v29;
          double width = v28;
          double y = v27;
          double x = v26;
          CGFloat v23 = v31;
          double v20 = v35;
          double v19 = v36;
          if (v32) {
            goto LABEL_22;
          }
        }
        else if (!v25)
        {
          CGFloat v24 = v38;
          CGFloat v23 = v39;
          double v19 = v38;
          double v20 = v39;
        }
        ++v22;
      }
      while (v21 != v22);
    }
    goto LABEL_19;
  }
  *(double *)double v37 = x;
  *(double *)&v37[1] = y;
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v40);
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  *(CGFloat *)&v37[2] = MaxX;
  v37[3] = CGRectGetMinY(v41);
  v42.origin.double x = x;
  v42.origin.double y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  CGFloat v15 = CGRectGetMaxX(v42);
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  *(CGFloat *)&v37[4] = v15;
  v37[5] = CGRectGetMaxY(v43);
  v44.origin.double x = x;
  v44.origin.double y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v44);
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  uint64_t v17 = 0;
  *(CGFloat *)&v37[6] = MinX;
  v37[7] = CGRectGetMaxY(v45);
  while (!-[CRLBezierPath containsPoint:](self, "containsPoint:", *(double *)&v37[v17], *(double *)&v37[v17 + 1]))
  {
    v17 += 2;
    if (v17 == 8) {
      goto LABEL_7;
    }
  }
  BOOL v18 = 0;
LABEL_22:
  BOOL v33 = 1;
LABEL_20:

  return v33;
}

- (CGRect)boundsIncludingStrokeWidth:(double)a3 joinStyle:(unint64_t)a4 capStyle:(unint64_t)a5 miterLimit:(double)a6 needsToExtendJoins:(BOOL)a7
{
  if (a3 < 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5E20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010793C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5E40);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1476 isFatal:0 description:"lineWidth should not be negative."];

    if (![(CRLBezierPath *)self isEmpty]) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  BOOL v11 = a7;
  if ([(CRLBezierPath *)self isEmpty])
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5E60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079338();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5E80);
    }
    unint64_t v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:]");
    BOOL v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:1481 isFatal:0 description:"Can not calculate the stroked bounds of an empty path."];

    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
    goto LABEL_24;
  }
  if (a3 == 0.0)
  {
LABEL_23:
    [(CRLBezierPath *)self bounds];
    CGFloat x = v23;
    CGFloat y = v24;
    CGFloat width = v25;
    CGFloat height = v26;
    goto LABEL_24;
  }
  double v31 = self;
  char v32 = [(CRLBezierPath *)v31 CGPath];
  unsigned int v33 = sub_1000E57B8(a5);
  int v34 = sub_1000E57B8(a4);
  sub_1000D58E4(v32, v33, v34, a3, a6);
  CGFloat x = v35;
  CGFloat y = v36;
  CGFloat width = v37;
  CGFloat height = v38;
  if (v11)
  {
    uint64_t v39 = [(CRLBezierPath *)v31 elementCount];
    if (v39 >= 1)
    {
      uint64_t v40 = v39;
      uint64_t v41 = 0;
      double v42 = sqrt(a3 * 0.5 * a3);
      while (1)
      {
        id v43 = [(CRLBezierPath *)v31 elementAtIndex:v41 associatedPoints:v44];
        if ((unint64_t)v43 < 2) {
          break;
        }
        if (v43 == (id)2)
        {
          v50.origin.CGFloat x = v44[4] - v42;
          v50.origin.CGFloat y = v44[5] - v42;
          v47.origin.CGFloat x = x;
          v47.origin.CGFloat y = y;
          v47.size.CGFloat width = width;
          v47.size.CGFloat height = height;
          v50.size.CGFloat width = v42 + v42;
          v50.size.CGFloat height = v42 + v42;
          CGRect v46 = CGRectUnion(v47, v50);
          goto LABEL_32;
        }
LABEL_33:
        if (v40 == ++v41) {
          goto LABEL_24;
        }
      }
      v49.origin.CGFloat x = v44[0] - v42;
      v49.origin.CGFloat y = v44[1] - v42;
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      v49.size.CGFloat width = v42 + v42;
      v49.size.CGFloat height = v42 + v42;
      CGRect v46 = CGRectUnion(v45, v49);
LABEL_32:
      CGFloat x = v46.origin.x;
      CGFloat y = v46.origin.y;
      CGFloat width = v46.size.width;
      CGFloat height = v46.size.height;
      goto LABEL_33;
    }
  }
LABEL_24:
  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6 findClosestMatch:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a3.y;
  double x = a3.x;
  if (a6 >= 1.79769313e308 && !a7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5EA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079448();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5EC0);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    CGFloat v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:]");
    unint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:1543 isFatal:0 description:"Should provide a threshold if not looking for the closest match."];
  }
  if (![(CRLBezierPath *)self containsElementsOtherThanMoveAndClose]) {
    return 1.79769313e308;
  }
  [(CRLBezierPath *)self controlPointBounds];
  double v21 = x + a6;
  if (x + a6 < v17) {
    return 1.79769313e308;
  }
  double v22 = x - a6;
  if (x - a6 > v17 + v19) {
    return 1.79769313e308;
  }
  double v23 = y - a6;
  double v66 = y + a6;
  if (y + a6 < v18 || v23 > v18 + v20) {
    return 1.79769313e308;
  }
  int64_t v25 = [(CRLBezierPath *)self elementCount];
  unint64_t v26 = v25;
  unint64_t v27 = 0;
  long long v68 = xmmword_101175160;
  v69[0] = xmmword_101175160;
  v69[1] = xmmword_101175160;
  v69[2] = xmmword_101175160;
  CGPoint v67 = CGPointZero;
  double v28 = a6 * a6;
  double v29 = 1.79769313e308;
  BOOL v30 = a6 * a6 < 1.79769313e308;
  int v31 = a6 * a6 < 1.79769313e308 || v7;
  double v65 = 0.0;
  if (v25 && v31)
  {
    unint64_t v27 = 0;
    unint64_t v32 = 0;
    double v65 = 0.0;
    double v29 = 1.79769313e308;
    do
    {
      switch(-[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v32, &v68, *(void *)&v65))
      {
        case 0:
          CGPoint v67 = (CGPoint)v68;
          goto LABEL_68;
        case 1:
          goto LABEL_58;
        case 2:
          uint64_t v33 = 0;
          double v34 = *((double *)&v68 + 1);
          double v36 = *((double *)&v68 + 1);
          double v35 = *(double *)&v68;
          double v37 = *(double *)&v68;
          do
          {
            double v39 = *(double *)&v69[v33];
            double v38 = *((double *)&v69[v33] + 1);
            if (v39 > v35) {
              double v40 = *(double *)&v69[v33];
            }
            else {
              double v40 = v35;
            }
            if (v39 >= v37) {
              double v35 = v40;
            }
            else {
              double v37 = *(double *)&v69[v33];
            }
            if (v38 >= v36)
            {
              if (v38 > v34) {
                double v34 = *((double *)&v69[v33] + 1);
              }
            }
            else
            {
              double v36 = *((double *)&v69[v33] + 1);
            }
            ++v33;
          }
          while (v33 != 3);
          double v41 = v35 - v37;
          double v42 = v34 - v36;
          double v43 = v37 + v35 - v37;
          if (v21 < v37 || v22 > v43 || v66 < v36 || v23 > v36 + v42) {
            goto LABEL_68;
          }
          sub_1000653E8(x, y, v37, v36, v41, v42);
          if (v47 > v28 || v47 >= v29) {
            goto LABEL_68;
          }
          double v49 = sub_100347FD4((float64x2_t *)&v68, x, y, 1.0);
          double v50 = sub_100064570((float64x2_t *)&v68, v49);
          break;
        case 3:
          v69[0] = v67;
LABEL_58:
          double v55 = sub_100064044(*(double *)&v68, *((double *)&v68 + 1), *(double *)v69);
          if (v21 < v55 || v22 > v55 + v53 || v66 < v52 || v23 > v52 + v54) {
            goto LABEL_68;
          }
          sub_1000653E8(x, y, v55, v52, v53, v54);
          if (v60 > v28 || v60 >= v29) {
            goto LABEL_68;
          }
          double v49 = sub_100347F0C((double *)&v68, x, y);
          double v50 = sub_100065E00(*(double *)&v68, *((double *)&v68 + 1), *(double *)v69, *((double *)v69 + 1), v49);
          break;
        default:
          goto LABEL_68;
      }
      double v62 = sub_1000643CC(v50, v51, x, y);
      double v63 = v65;
      if (v62 < v29) {
        double v63 = v49;
      }
      double v65 = v63;
      if (v62 < v29)
      {
        unint64_t v27 = v32;
        double v29 = v62;
      }
LABEL_68:
      ++v32;
      BOOL v30 = v29 > v28;
      char v59 = v29 > v28 || v7;
    }
    while (v32 < v26 && (v59 & 1) != 0);
  }
  if (v30) {
    return 1.79769313e308;
  }
  if (a4) {
    *a4 = v27;
  }
  if (a5) {
    *a5 = v65;
  }
  return sqrt(v29);
}

- (double)yValueFromXValue:(double)a3
{
  [(CRLBezierPath *)self p_yValueFromXValue:0 elementIndex:0 parametricValue:a3];
  return result;
}

- (double)p_yValueFromXValue:(double)a3 elementIndex:(int64_t *)a4 parametricValue:(double *)a5
{
  uint64_t v9 = [(CRLBezierPath *)self elementCount];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  long long v51 = xmmword_101175160;
  long long v52 = xmmword_101175160;
  long long v53 = xmmword_101175160;
  int64_t v12 = v9 - 1;
  if (v9 < 1) {
    goto LABEL_5;
  }
  uint64_t v13 = v9;
  if (![(CRLBezierPath *)self elementAtIndex:0 associatedPoints:&v51])
  {
    double x = *(double *)&v51;
    double y = *((double *)&v51 + 1);
  }
  if (v13 == 1)
  {
LABEL_5:
    uint64_t v14 = 1;
    double v15 = x;
    double v16 = y;
  }
  else
  {
    uint64_t v14 = 1;
    while (1)
    {
      double v15 = x;
      double v16 = y;
      unint64_t v35 = [(CRLBezierPath *)self elementAtIndex:v14 associatedPoints:&v51];
      if (v35 == 2)
      {
        double y = *((double *)&v53 + 1);
        double x = *(double *)&v53;
      }
      else if (v35 <= 1)
      {
        double y = *((double *)&v51 + 1);
        double x = *(double *)&v51;
      }
      if (v15 <= a3 && x >= a3) {
        break;
      }
      if (v13 == ++v14)
      {
        uint64_t v14 = v13;
        break;
      }
    }
  }
  if (v15 == x) {
    return y;
  }
  if (v15 >= a3)
  {
    if (a4) {
      *a4 = v14 - 1;
    }
    if (a5) {
      *a5 = 0.0;
    }
  }
  else
  {
    if (x <= a3)
    {
      if (a4)
      {
        if (v12 >= v14) {
          int64_t v37 = v14;
        }
        else {
          int64_t v37 = v12;
        }
        *a4 = v37;
      }
      if (a5) {
        *a5 = 1.0;
      }
      return y;
    }
    if (a4)
    {
      if (v12 >= v14) {
        int64_t v18 = v14;
      }
      else {
        int64_t v18 = v12;
      }
      *a4 = v18;
    }
    double v19 = *((double *)&v51 + 1);
    double v50 = *((double *)&v52 + 1);
    double v20 = x + *(double *)&v51 * 3.0 - v15 + *(double *)&v52 * -3.0;
    double v21 = (*(double *)&v51 * -6.0 + v15 * 3.0 + *(double *)&v52 * 3.0) / v20;
    double v22 = (*(double *)&v51 * 3.0 + v15 * -3.0) / v20;
    double v23 = (v15 - a3) / v20;
    double v24 = v23 + v21 * (v21 * (v21 + v21)) / 27.0 + v21 * v22 / -3.0;
    double v25 = v24 * v24 * 0.25;
    double v26 = (v22 + v21 * v21 / -3.0) * ((v22 + v21 * v21 / -3.0) * (v22 + v21 * v21 / -3.0)) / 27.0 + v25;
    if (v26 == 0.0 || fabs(v26) < 1.0e-12)
    {
      if (v23 >= 0.0) {
        long double v34 = -pow(v23, 0.333333333);
      }
      else {
        long double v34 = pow(fabs(v23), 0.333333333);
      }
    }
    else if (v26 <= 0.0)
    {
      long double v38 = sqrt(v25 - v26);
      double v39 = pow(v38, 0.333333333);
      long double v40 = acos(-v24 / (v38 + v38));
      __double2 v41 = __sincos_stret(v40 / 3.0);
      double v42 = v21 / -3.0;
      long double v34 = v21 / -3.0 + (v39 + v39) * v41.__cosval;
      if (v34 < 0.0 && vabdd_f64(0.0, v34) >= 1.0e-12
        || (v34 >= 1.0 ? (BOOL v43 = v34 == 1.0) : (BOOL v43 = 1), !v43 && fabs(v34 + -1.0) >= 1.0e-12))
      {
        if ((long double v34 = v42 - v39 * (v41.__cosval + v41.__sinval * 1.73205081), v34 < 0.0) && vabdd_f64(0.0, v34) >= 1.0e-12
          || (v34 >= 1.0 ? (BOOL v44 = v34 == 1.0) : (BOOL v44 = 1), !v44 && fabs(v34 + -1.0) >= 1.0e-12))
        {
          if ((long double v34 = v42 - v39 * (v41.__cosval - v41.__sinval * 1.73205081), v34 < 0.0)
            && vabdd_f64(0.0, v34) >= 1.0e-12
            || (v34 >= 1.0 ? (BOOL v45 = v34 == 1.0) : (BOOL v45 = 1), !v45 && fabs(v34 + -1.0) >= 1.0e-12))
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D5EE0);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101079558();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D5F00);
            }
            CGRect v46 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
            {
              +[CRLAssertionHandler packedBacktraceString];
              objc_claimAutoreleasedReturnValue();
              sub_1010663B0();
            }

            double v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) p_yValueFromXValue:elementIndex:parametricValue:]");
            double v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
            +[CRLAssertionHandler handleFailureInFunction:v47 file:v48 lineNumber:1789 isFatal:0 description:"No valid roots!"];

            long double v34 = 0.0;
          }
        }
      }
    }
    else
    {
      double v27 = v24 * -0.5;
      double v28 = sqrt(v26);
      double v49 = *((double *)&v51 + 1);
      double v29 = v24 * -0.5 + v28;
      double v30 = pow(fabs(v29), 0.333333333);
      if (v29 <= 0.0) {
        double v31 = -v30;
      }
      else {
        double v31 = v30;
      }
      double v32 = pow(vabdd_f64(v27, v28), 0.333333333);
      if (v27 - v28 <= 0.0) {
        double v32 = -v32;
      }
      double v33 = v31 + v32;
      double v19 = v49;
      long double v34 = v33 + v21 / -3.0;
    }
    if (a5) {
      *a5 = v34;
    }
    return v16
         + (v19 * -6.0 + v16 * 3.0 + v50 * 3.0) * (v34 * v34)
         + v34 * (v34 * v34) * (y + v19 * 3.0 - v16 + v50 * -3.0)
         + v34 * (v19 * 3.0 + v16 * -3.0);
  }
  return v16;
}

- (void)addPathToContext:(CGContext *)a3
{
  uint64_t v5 = [(CRLBezierPath *)self elementCount];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      switch([(CRLBezierPath *)self elementAtIndex:i associatedPoints:&v8])
      {
        case 0:
          CGContextMoveToPoint(a3, v8, v9);
          break;
        case 1:
          CGContextAddLineToPoint(a3, v8, v9);
          break;
        case 2:
          CGContextAddCurveToPoint(a3, v8, v9, v10, v11, v12, v13);
          break;
        case 3:
          CGContextClosePath(a3);
          break;
        default:
          continue;
      }
    }
  }
}

- (void)clearStroke:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(CRLBezierPath *)self flatness];
  CGContextSetFlatness(a3, v5);
  CGContextBeginPath(a3);
  [(CRLBezierPath *)self addPathToContext:a3];
  [(CRLBezierPath *)self lineWidth];
  CGContextSetLineWidth(a3, v6);
  CGContextReplacePathWithStrokedPath(a3);
  CGContextClip(a3);
  CGContextBeginPath(a3);
  [(CRLBezierPath *)self lineWidth];
  double v8 = v7;
  [(CRLBezierPath *)self bounds];
  CGRect v11 = CGRectInset(v10, -(v8 + 10.0), -(v8 + 10.0));
  CGContextClearRect(a3, v11);

  CGContextRestoreGState(a3);
}

- (id)aliasedPathInContext:(CGContext *)a3 effectiveStrokeWidth:(float)a4
{
  *(float *)&double v4 = a4;
  LODWORD(v5) = 1.0;
  return [(CRLBezierPath *)self p_aliasedPathInContext:a3 viewScale:v5 effectiveStrokeWidth:v4];
}

- (id)aliasedPathWithViewScale:(float)a3 effectiveStrokeWidth:(float)a4
{
  return -[CRLBezierPath p_aliasedPathInContext:viewScale:effectiveStrokeWidth:](self, "p_aliasedPathInContext:viewScale:effectiveStrokeWidth:", 0);
}

- (id)p_aliasedPathInContext:(CGContext *)a3 viewScale:(float)a4 effectiveStrokeWidth:(float)a5
{
  uint64_t v9 = [(CRLBezierPath *)self elementCount];
  double v10 = sub_100407DFC(a5);
  if (!v9) {
    goto LABEL_6;
  }
  int v67 = (int)v10;
  if (vabds_f32((float)(int)v10, a5) > 0.1) {
    goto LABEL_6;
  }
  CGContextRef c = a3;
  if (a3)
  {
    memset(&v82, 0, sizeof(v82));
    CGContextGetUserSpaceToDeviceSpaceTransform(&v82, a3);
    CGAffineTransform v75 = v82;
    if (sub_10007F964(&v75.a))
    {
      BOOL v66 = fabs(v82.a) < fabs(v82.b);
      goto LABEL_11;
    }
LABEL_6:
    CGRect v11 = self;
    goto LABEL_7;
  }
  BOOL v66 = 0;
LABEL_11:
  CGRect v11 = +[CRLBezierPath bezierPath];
  if (v9 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v73 = 0;
    int v14 = 0;
    int v70 = 0;
    int v15 = 0;
    double v69 = 0;
    uint64_t v71 = 0;
    double v65 = a4;
    double v16 = (float)(1.0 / a4);
    double v17 = 0.5;
    do
    {
      int v18 = 0;
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, &v82.c, *(void *)&v65))
      {
        case 0:
          -[CRLBezierPath moveToPoint:](v11, "moveToPoint:", v82.c, v82.d);
          int v70 = 0;
          int v14 = 0;
          uint64_t v73 = 0;
          double v69 = (char *)[(CRLBezierPath *)v11 elementCount] - 1;
          int v15 = 1;
          p_CGContextRef c = &v82.c;
          uint64_t v71 = v13;
          goto LABEL_46;
        case 1:
          goto LABEL_20;
        case 2:
          double a = v82.a;
          double b = v82.b;
          double v22 = v82.c;
          double d = v82.d;
          if (sub_100064084(v82.a, v82.b, v82.c, v82.d)
            && sub_100064084(a, b, v82.tx, v82.ty)
            && sub_100064084(a, b, *(double *)&v83, *((double *)&v83 + 1)))
          {
            break;
          }
          [(CRLBezierPath *)v11 currentPoint];
          double v26 = sub_100064680(v24, v25, v82.a);
          v82.CGContextRef c = sub_100064698(v22, d, v26);
          v82.double d = v27;
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](v11, "curveToPoint:controlPoint1:controlPoint2:", v83, v82.c, v27, v82.tx, v82.ty);
          int v15 = 0;
          uint64_t v73 = 0;
          p_CGContextRef c = (CGFloat *)&v83;
          goto LABEL_46;
        case 3:
          [(CRLBezierPath *)self elementAtIndex:v71 associatedPoints:&v82.c];
          int v18 = 1;
LABEL_20:
          int v72 = v15;
          double v29 = v82.a;
          double v28 = v82.b;
          double v31 = v82.c;
          double v30 = v82.d;
          double v32 = fabs(sub_100064680(v82.a, v82.b, v82.c));
          double v34 = fabs(v33);
          BOOL v35 = v34 > v32 + v16 * -0.01 && v32 < v16;
          BOOL v36 = v32 > v34 + v16 * -0.01 && v34 < v16;
          if (v36 || v35)
          {
            if (v36 && v35)
            {
              if ((v18 & (v14 | v70)) == 1)
              {
                [(CRLBezierPath *)v11 elementAtIndex:v69 associatedPoints:&v82.c];
              }
              else if ((id)[(CRLBezierPath *)v11 elementAtIndex:(char *)[(CRLBezierPath *)v11 elementCount] - 1 associatedPoints:&v82.c] == (id)2)
              {
                *(_OWORD *)&v82.CGContextRef c = v83;
              }
              CGPoint v74 = *(CGPoint *)&v82.c;
              double y = v82.d;
              double x = v82.c;
            }
            else
            {
              if (c)
              {
                v85.double x = v29;
                v85.double y = v28;
                *(void *)&double v37 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(c, v85);
                *(void *)&double v38 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(c, *(CGPoint *)&v82.c);
              }
              else
              {
                double v37 = sub_1000646A4(v29, v28, v65);
                double v17 = 0.5;
                double v38 = sub_1000646A4(v31, v30, v65);
              }
              double v46 = v38;
              if (vabdd_f64(v37, v38) < 0.1) {
                double v46 = v37;
              }
              if (v66) {
                BOOL v47 = v35;
              }
              else {
                BOOL v47 = v36;
              }
              if (v67)
              {
                if (v66) {
                  BOOL v50 = v36;
                }
                else {
                  BOOL v50 = v35;
                }
                double v49 = v37 + v17;
                double v48 = v46 + v17;
                if (v50)
                {
                  BYTE4(v73) = 1;
                  int v51 = v72;
                }
                else
                {
                  if ((v73 & 0x100000000) == 0) {
                    double v49 = v37;
                  }
                  int v51 = v18 & v14;
                  if ((v18 & v14) == 0) {
                    double v48 = v46;
                  }
                }
                v14 |= v51;
                if (v47)
                {
                  v70 |= v72;
                  LOBYTE(v73) = 1;
                }
              }
              else
              {
                double v48 = v46;
                double v49 = v37;
              }
              double v52 = sub_100067484(v49);
              double v54 = v53;
              double v56 = sub_100067484(v48);
              double v57 = v55;
              v74.double x = v56;
              v74.double y = v55;
              if ((v73 & 0x100000000) != 0)
              {
                double v52 = v52 + -0.5;
                double v56 = v56 + -0.5;
                v74.double x = v56;
              }
              if (v73)
              {
                double v54 = v54 + -0.5;
                double v57 = v55 + -0.5;
                v74.double y = v55 + -0.5;
              }
              if (c)
              {
                v86.double x = v52;
                v86.double y = v54;
                CGPoint v58 = CGContextConvertPointToUserSpace(c, v86);
                double x = v58.x;
                double y = v58.y;
                CGPoint v61 = CGContextConvertPointToUserSpace(c, v74);
                CGFloat v60 = v61.y;
                double v59 = v61.x;
              }
              else
              {
                double x = sub_1000646A4(v52, v54, v16);
                double y = v62;
                double v59 = sub_1000646A4(v56, v57, v16);
              }
              double v17 = 0.5;
              v74.double x = v59;
              v74.double y = v60;
              if (v36)
              {
                if ((v72 & 1) == 0)
                {
                  [(CRLBezierPath *)v11 currentPoint];
                  double x = v63;
                }
                if (v13 + 1 < v9 && -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:")) {
                  v74.double x = v82.c;
                }
              }
              else if (v35)
              {
                if ((v72 & 1) == 0)
                {
                  [(CRLBezierPath *)v11 currentPoint];
                  double y = v64;
                }
                if (v13 + 1 < v9 && -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:")) {
                  v74.double y = v82.d;
                }
              }
            }
            if ((id)[(CRLBezierPath *)v11 elementAtIndex:(char *)[(CRLBezierPath *)v11 elementCount] - 1 associatedPoints:&v76] == (id)2)
            {
              double v41 = v78;
              double v42 = v79;
              double v43 = sub_100064680(x, y, v80);
              double v78 = sub_100064698(v41, v42, v43);
              double v79 = v44;
              double v80 = x;
              BOOL v45 = (double *)&v81;
            }
            else
            {
              double v76 = x;
              BOOL v45 = (double *)&v77;
            }
            *BOOL v45 = y;
            [(CRLBezierPath *)v11 setAssociatedPoints:&v76 atIndex:(char *)[(CRLBezierPath *)v11 elementCount] - 1];
            if (v18)
            {
              [(CRLBezierPath *)v11 setAssociatedPoints:&v74 atIndex:v69];
              [(CRLBezierPath *)v11 closePath];
            }
            else
            {
              [(CRLBezierPath *)v11 lineToPoint:v74];
            }
          }
          else if (v18)
          {
            [(CRLBezierPath *)v11 closePath];
          }
          else
          {
            -[CRLBezierPath lineToPoint:](v11, "lineToPoint:", v31, v30);
          }
          int v15 = 0;
          p_CGContextRef c = &v82.c;
LABEL_46:
          *(_OWORD *)&v82.double a = *(_OWORD *)p_c;
          break;
        default:
          break;
      }
      ++v13;
    }
    while (v9 != v13);
  }
LABEL_7:

  return v11;
}

- (void)alignBoundsToOrigin
{
  if ([(CRLBezierPath *)self elementCount] >= 1)
  {
    [(CRLBezierPath *)self bounds];
    double v4 = v3;
    double v6 = v5;
    if (!sub_100064084(CGPointZero.x, CGPointZero.y, v3, v5))
    {
      CGAffineTransformMakeTranslation(&v7, -v4, -v6);
      [(CRLBezierPath *)self transformUsingAffineTransform:&v7];
    }
  }
}

+ (id)appendBezierPaths:(id)a3
{
  id v3 = a3;
  double v4 = +[CRLBezierPath bezierPath];
  double v5 = [v3 objectEnumerator];
  double v6 = 0;
  while (1)
  {
    uint64_t v7 = [v5 nextObject];

    if (!v7) {
      break;
    }
    double v6 = (void *)v7;
    [v4 appendBezierPath:v7];
  }

  return v4;
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(unint64_t)a6 startNewPath:(BOOL)a7
{
  BOOL v43 = a7;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  tCGFloat x = CGRectGetMidX(a3);
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  tCGFloat y = CGRectGetMidY(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v61) * 0.5;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  double v15 = CGRectGetHeight(v62) * 0.5;
  if (a6 == 1)
  {
    sub_100066604(a4, v14, v15);
    double v17 = v18;
    sub_100066604(a4 + a5, v14, v15);
    double v16 = v19;
  }
  else
  {
    if (a6) {
      double v16 = 0.0;
    }
    else {
      double v16 = a4 + a5;
    }
    if (a6) {
      double v17 = 0.0;
    }
    else {
      double v17 = a4;
    }
  }
  double v20 = +[CRLBezierPath bezierPath];
  [v20 appendBezierPathWithArcWithCenter:CGPointZero.x, CGPointZero.y, 1.0, v17, v16];
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&t1, v14, v15);
  CGAffineTransformMakeTranslation(&t2, tx, tyb);
  CGAffineTransformConcat(&v48, &t1, &t2);
  CGAffineTransform v45 = v48;
  [v20 transformUsingAffineTransform:&v45];
  uint64_t v21 = (uint64_t)[v20 elementCount];
  if (v21 >= 1)
  {
    uint64_t v22 = 0;
    tydouble a = 67109378;
    do
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v57 = 0u;
      switch((unint64_t)objc_msgSend(v20, "elementAtIndex:associatedPoints:", v22, &v57, tya))
      {
        case 0uLL:
          if (v22)
          {
            unsigned int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D5F60);
            }
            double v24 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v50 = v23;
              __int16 v51 = 2082;
              double v52 = "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleTy"
                    "pe:startNewPath:]";
              __int16 v53 = 2082;
              double v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
              __int16 v55 = 1024;
              int v56 = 2120;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Only the first element of the arc should be a moveto", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D5F80);
            }
            double v25 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
            {
              double v38 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = tya;
              unsigned int v50 = v23;
              __int16 v51 = 2114;
              double v52 = v38;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            double v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
            double v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
            +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:2120 isFatal:0 description:"Only the first element of the arc should be a moveto"];
          }
          if (v43) {
            [(CRLBezierPath *)self moveToPoint:v57];
          }
          else {
            [(CRLBezierPath *)self lineToPoint:v57];
          }
          break;
        case 1uLL:
          unsigned int v28 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D5FA0);
          }
          double v29 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v50 = v28;
            __int16 v51 = 2082;
            double v52 = "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]";
            __int16 v53 = 2082;
            double v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
            __int16 v55 = 1024;
            int v56 = 2128;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The arc shouldn't contain lineto elements", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D5FC0);
          }
          double v30 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
          {
            BOOL v36 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = tya;
            unsigned int v50 = v28;
            __int16 v51 = 2114;
            double v52 = v36;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
          double v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:2128 isFatal:0 description:"The arc shouldn't contain lineto elements"];
          goto LABEL_43;
        case 2uLL:
          [(CRLBezierPath *)self curveToPoint:v59 controlPoint1:v57 controlPoint2:v58];
          break;
        case 3uLL:
          unsigned int v33 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D5FE0);
          }
          double v34 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v50 = v33;
            __int16 v51 = 2082;
            double v52 = "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]";
            __int16 v53 = 2082;
            double v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
            __int16 v55 = 1024;
            int v56 = 2134;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The arc shouldn't contain close_subpath elements", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6000);
          }
          BOOL v35 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
          {
            double v37 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = tya;
            unsigned int v50 = v33;
            __int16 v51 = 2114;
            double v52 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
          double v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:2134 isFatal:0 description:"The arc shouldn't contain close_subpath elements"];
LABEL_43:

          break;
        default:
          break;
      }
      ++v22;
    }
    while (v21 != v22);
  }
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(unint64_t)a6 startNewPath:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a5.y;
  double x = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double v14 = a3.origin.y;
  double v15 = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v26.origin.double x = v15;
  v26.origin.double y = v14;
  double v24 = height;
  v26.size.double width = width;
  v26.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v26);
  double v19 = atan2(v10 - MidY, v11 - MidX) * 180.0 / 3.14159265;
  double v20 = atan2(y - MidY, x - MidX) * 180.0 / 3.14159265;
  if (a6)
  {
    if (a6 == 1)
    {
      for (; v19 < v20; double v19 = v19 + 360.0)
        ;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6020);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010795E0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6040);
      }
      uint64_t v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:]");
      unsigned int v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:2157 isFatal:0 description:"Unexpected angle sign"];
    }
  }
  else
  {
    for (; v20 < v19; double v20 = v20 + 360.0)
      ;
  }
  -[CRLBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](self, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, v7, v15, v14, width, v24, v19, v20 - v19);
}

- (void)takeAttributesFromStroke:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [v7 supportsWidth];
  double v5 = 0.0;
  if (v4) {
    [v7 width];
  }
  [(CRLBezierPath *)self setLineWidth:v5];
  if ([v7 supportsLineOptions])
  {
    [v7 miterLimit];
    -[CRLBezierPath setMiterLimit:](self, "setMiterLimit:");
    -[CRLBezierPath setLineCapStyle:](self, "setLineCapStyle:", [v7 cap]);
    uint64_t v6 = (uint64_t)[v7 join];
  }
  else
  {
    uint64_t v6 = 1;
  }
  [(CRLBezierPath *)self setLineJoinStyle:v6];
}

- (CGRect)boundsIncludingCRLStroke:(id)a3
{
  id v4 = a3;
  if ([(CRLBezierPath *)self isEmpty])
  {
LABEL_2:
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    goto LABEL_10;
  }
  if (!v4 || ([v4 shouldRender] & 1) == 0)
  {
    [(CRLBezierPath *)self bounds];
    CGFloat x = v9;
    CGFloat y = v10;
    CGFloat width = v11;
    CGFloat height = v12;
    goto LABEL_10;
  }
  if ([(id)objc_opt_class() requiresCustomBoundsMeasurement])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002323D0;
    block[3] = &unk_1014CC280;
    BOOL v35 = &stru_1014E3CF8;
    if (qword_1016A9358 != -1) {
      dispatch_once(&qword_1016A9358, block);
    }

    goto LABEL_2;
  }
  double v17 = 0.0;
  if ([v4 supportsWidth])
  {
    [v4 width];
    double v17 = v18;
  }
  if ([v4 supportsLineOptions])
  {
    id v19 = [v4 join];
    id v20 = [v4 cap];
    [v4 miterLimit];
  }
  else
  {
    id v19 = +[CRLBezierPath defaultLineJoinStyle];
    id v20 = +[CRLBezierPath defaultLineCapStyle];
    +[CRLBezierPath defaultMiterLimit];
  }
  double v22 = v21;
  unsigned int v23 = [v4 pattern];
  id v24 = [v23 count];

  unsigned __int8 v25 = [v4 needsToExtendJoinsForBoundsCalculation];
  if (v24) {
    BOOL v26 = v20 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  unsigned int v27 = !v26;
  if (v25) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v27;
  }
  double v29 = [v4 pathToStrokeFromCRLBezierPath:self];
  [v29 boundsIncludingStrokeWidth:v19 joinStyle:v20 capStyle:v28 miterLimit:v17 needsToExtendJoins:v22];
  CGFloat x = v30;
  CGFloat y = v31;
  CGFloat width = v32;
  CGFloat height = v33;

  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  if (CGRectIsNull(v36)) {
    goto LABEL_2;
  }
LABEL_10:

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

+ ($C03DF7238EFD9881545AA7BAA15E5874)p_makeDefaultPositioning
{
  retstr->var1 = CGPointZero;
  retstr->var0 = 1.57079633;
  retstr->var2 = -1;
  retstr->var3 = 0.0;
  return result;
}

+ (id)createClippedPath:(id)a3 headPositioning:(id *)a4 tailPositioning:(id *)a5 stroke:(id)a6
{
  double v9 = (CRLBezierPath *)a3;
  double v10 = v9;
  double x = a5->var1.x;
  double y = a5->var1.y;
  int64_t var2 = a4->var2;
  int64_t v14 = a5->var2;
  if ((var2 & 0x8000000000000000) == 0 || (double v15 = v9, (v14 & 0x8000000000000000) == 0))
  {
    double var3 = a5->var3;
    double v44 = a4->var3;
    double var0 = a5->var0;
    double v17 = a4->var1.x;
    double v45 = a4->var1.y;
    double v18 = a4->var0;
    id v19 = a6;
    [v19 width];
    double v21 = v20;
    double v15 = objc_alloc_init(CRLBezierPath);

    [v19 lineEndInsetAdjustment];
    double v23 = v22;

    double v24 = sub_1000662E0(var0 + 1.57079633);
    double v41 = v23;
    double v25 = v21 * v23;
    double v27 = sub_1000646A4(v24, v26, v21 * v23);
    double v28 = sub_100064698(x, y, v27);
    double v30 = v29;
    double v31 = sub_1000662E0(v18 + 1.57079633);
    double v33 = sub_1000646A4(v31, v32, v25);
    double v34 = sub_100064698(v17, v45, v33);
    double v36 = v35;
    if ((var2 < 0 || var2 >= v14) && (var2 != v14 || v44 >= var3))
    {
      if (v14 < 0)
      {
        -[CRLBezierPath moveToPoint:](v15, "moveToPoint:", x, y);
        double v40 = var3;
        double v39 = v44;
      }
      else
      {
        -[CRLBezierPath moveToPoint:](v15, "moveToPoint:", v28, v30);
        BOOL v38 = x == v28 && y == v30;
        double v40 = var3;
        double v39 = v44;
        if (!v38) {
          -[CRLBezierPath lineToPoint:](v15, "lineToPoint:", x, y);
        }
      }
      -[CRLBezierPath appendBezierPath:fromSegment:t:toSegment:t:withoutMove:](v15, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v10, v14, var2, 1, v40, v39, *(void *)&v41);
      if (var2 < 0 || v42 <= 0.0) {
        goto LABEL_9;
      }
    }
    else
    {
      -[CRLBezierPath moveToPoint:](v15, "moveToPoint:", v28, v30, *(void *)&v41);
    }
    -[CRLBezierPath lineToPoint:](v15, "lineToPoint:", v34, v36);
LABEL_9:
  }

  return v15;
}

+ ($C03DF7238EFD9881545AA7BAA15E5874)lineEndPositioningOnPath:(SEL)a3 atHead:(id)a4 headPoint:(BOOL)a5 tailPoint:(CGPoint)a6 headLineEnd:(CGPoint)a7 tailLineEnd:(id)a8 stroke:(id)a9
{
  double y = a7.y;
  double x = a7.x;
  double v15 = a6.y;
  double v16 = a6.x;
  BOOL v17 = a5;
  id v48 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  *(_OWORD *)&retstr->double var0 = 0u;
  *(_OWORD *)&retstr->var1.double y = 0u;
  retstr->double var3 = 0.0;
  +[CRLBezierPath p_makeDefaultPositioning];
  if (v17) {
    double v22 = v15;
  }
  else {
    double v22 = y;
  }
  if (v17) {
    double v23 = v16;
  }
  else {
    double v23 = x;
  }
  if (v17)
  {
    id v24 = v19;
    if (!v19)
    {
LABEL_9:
      double v25 = 0;
LABEL_13:
      retstr->double var0 = 1.57079633;
      retstr->var1.double x = v23;
      retstr->var1.double y = v22;
      retstr->int64_t var2 = -1;
      retstr->double var3 = 0.0;
      goto LABEL_14;
    }
  }
  else
  {
    id v24 = v20;
    if (!v20) {
      goto LABEL_9;
    }
  }
  double v26 = [v21 strokeLineEnd:v24];
  double v25 = v26;
  if (!v26 || ([v26 isNone] & 1) != 0) {
    goto LABEL_13;
  }
  id v28 = [v25 path];
  BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v28 CGPath]);
  double MaxY = CGRectGetMaxY(BoundingBox);
  [v25 endPoint];
  double v31 = MaxY - v30;

  if (![v25 isFilled]) {
    double v31 = v31 + 0.75;
  }
  [v21 width];
  [v25 scaleForStrokeWidth];
  double v33 = v32 * v31;
  double v34 = +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v23 - v33, v22 - v33, v33 + v33, v33 + v33);
  id v35 = objc_alloc_init((Class)NSMutableArray);
  [v48 addIntersectionsWithPath:v34 to:v35 allIntersections:0 reversed:v17];
  if ([v35 count])
  {
    [v35 sortUsingSelector:"compareSegmentAndT:"];
    if (v17) {
      [v35 lastObject];
    }
    else {
    double v36 = [v35 objectAtIndex:0];
    }
    [v36 point];
    double x = v37;
    double y = v38;
  }
  else
  {
    double v36 = 0;
    if (!v17)
    {
      double x = v16;
      double y = v15;
    }
  }
  double v39 = sub_100064680(v23, v22, x);
  retstr->double var0 = sub_100065C1C(v39, v40) + -1.57079633;
  double v41 = sub_100064680(x, y, v23);
  double v43 = CGPointZero.x;
  if (v41 != CGPointZero.x || v42 != CGPointZero.y)
  {
    double v44 = sub_100064660(v41, v42);
    double v43 = sub_1000646A4(v44, v45, v33);
  }
  retstr->var1.double x = sub_100064698(v23, v22, v43);
  retstr->var1.double y = v46;
  if (v36)
  {
    retstr->int64_t var2 = (int64_t)[v36 segment];
    [v36 t];
  }
  else
  {
    retstr->int64_t var2 = 0;
    double v47 = 0.0;
  }
  retstr->double var3 = v47;

LABEL_14:

  return result;
}

- (id)labelForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(CRLBezierPath *)self isOpen] || (id)[(CRLBezierPath *)self elementCount] == (id)1)
  {
    uint64_t v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Line";
LABEL_15:
    double v11 = [v6 localizedStringForKey:v8 value:0 table:0];

    goto LABEL_16;
  }
  if ([(CRLBezierPath *)self isRectangular])
  {
    unsigned int v9 = -[CRLBezierPath p_equalWidthAndHeightForSize:](self, "p_equalWidthAndHeightForSize:", width, height);
    id v7 = +[NSBundle mainBundle];
    if (v9) {
      CFStringRef v8 = @"Square";
    }
    else {
      CFStringRef v8 = @"Rectangle";
    }
LABEL_14:
    uint64_t v6 = v7;
    goto LABEL_15;
  }
  if ([(CRLBezierPath *)self isCircular])
  {
    unsigned int v10 = -[CRLBezierPath p_equalWidthAndHeightForSize:](self, "p_equalWidthAndHeightForSize:", width, height);
    id v7 = +[NSBundle mainBundle];
    if (v10) {
      CFStringRef v8 = @"Circle";
    }
    else {
      CFStringRef v8 = @"Oval";
    }
    goto LABEL_14;
  }
  if ([(CRLBezierPath *)self isTriangular])
  {
    uint64_t v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Triangle";
    goto LABEL_15;
  }
  if ([(CRLBezierPath *)self isDiamond])
  {
    uint64_t v6 = +[NSBundle mainBundle];
    id v7 = v6;
    CFStringRef v8 = @"Diamond";
    goto LABEL_15;
  }
  double v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)p_equalWidthAndHeightForSize:(CGSize)a3
{
  return vabdd_f64(a3.width, a3.height) < 0.00999999978 || a3.width == a3.height;
}

- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4
{
  [(CRLBezierPath *)self elementAtIndex:0 associatedPoints:a3];
  int64_t v7 = [(CRLBezierPath *)self elementAtIndex:(char *)[(CRLBezierPath *)self elementCount] - 1 associatedPoints:v9];
  CFStringRef v8 = (CGPoint *)v9;
  if (v7 == 2) {
    CFStringRef v8 = (CGPoint *)&v10;
  }
  if (v7 == 3) {
    CFStringRef v8 = a3;
  }
  *a4 = *v8;
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v55 = [v10 count];
  long long v59 = self;
  uint64_t v11 = [(CRLBezierPath *)self elementCount];
  uint64_t v12 = (uint64_t)[v9 elementCount];
  if (v11 < 2) {
    goto LABEL_44;
  }
  uint64_t v13 = v12;
  if (v12 < 2) {
    goto LABEL_44;
  }
  if (v6) {
    uint64_t v14 = v11 - 1;
  }
  else {
    uint64_t v14 = 0;
  }
  if (v6) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = v11;
  }
  uint64_t v16 = -1;
  if (!v6) {
    uint64_t v16 = 1;
  }
  uint64_t v57 = v16;
  uint64_t v58 = v15;
  while (2)
  {
    id v17 = [(CRLBezierPath *)v59 elementAtIndex:v14 allPoints:&v64];
    if (!v17) {
      goto LABEL_43;
    }
    uint64_t v18 = (uint64_t)v17;
    if (v17 == (id)2)
    {
      float64x2_t v19 = v64;
      float64x2_t v20 = v65;
      float64x2_t v21 = v66;
      if (sub_100064374(v64.f64[0], v64.f64[1], v65.f64[0], v65.f64[1], v66.f64[0], v66.f64[1])
        && (float64x2_t v22 = v67, sub_100064374(v20.f64[0], v20.f64[1], v21.f64[0], v21.f64[1], v67.f64[0], v67.f64[1]))
        && (double v23 = sub_100064044(v19.f64[0], v19.f64[1], v22.f64[0]),
            double v25 = v24,
            double v27 = v26,
            double v29 = v28,
            sub_1000652B0(v20.f64[0], v20.f64[1], v23, v24, v26, v28))
        && sub_1000652B0(v21.f64[0], v21.f64[1], v23, v25, v27, v29))
      {
        float64x2_t v65 = v67;
        uint64_t v18 = 1;
      }
      else
      {
        uint64_t v18 = 2;
      }
    }
    uint64_t v30 = 0;
    do
    {
      id v31 = [v9 elementAtIndex:v30 allPoints:&v60];
      if (!v31) {
        goto LABEL_40;
      }
      id v32 = v31;
      if (v31 == (id)2)
      {
        long long v33 = v60;
        long long v34 = v61;
        long long v35 = v62;
        if (sub_100064374(*(double *)&v60, *((double *)&v60 + 1), *(double *)&v61, *((double *)&v61 + 1), *(double *)&v62, *((double *)&v62 + 1)))
        {
          long long v36 = v63;
          if (sub_100064374(*(double *)&v34, *((double *)&v34 + 1), *(double *)&v35, *((double *)&v35 + 1), *(double *)&v63, *((double *)&v63 + 1)))
          {
            double v37 = sub_100064044(*(double *)&v33, *((double *)&v33 + 1), *(double *)&v36);
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            if (sub_1000652B0(*(double *)&v34, *((double *)&v34 + 1), v37, v38, v40, v42)
              && sub_1000652B0(*(double *)&v35, *((double *)&v35 + 1), v37, v39, v41, v43))
            {
              long long v61 = v63;
              if (v18 == 2) {
                goto LABEL_37;
              }
              goto LABEL_39;
            }
          }
        }
      }
      if (v18 != 2)
      {
        if (v32 != (id)2)
        {
LABEL_39:
          sub_100348C30(v64.f64, (double *)&v60, v14, v30, v10);
          goto LABEL_40;
        }
        unsigned int v50 = (float64x2_t *)&v60;
        __int16 v51 = &v64;
        uint64_t v52 = v30;
        uint64_t v53 = v14;
        int v54 = 1;
LABEL_38:
        sub_100348910(v50->f64, v51->f64, v52, v53, v54, v10);
        goto LABEL_40;
      }
      if (v32 != (id)2)
      {
LABEL_37:
        unsigned int v50 = &v64;
        __int16 v51 = (float64x2_t *)&v60;
        uint64_t v52 = v14;
        uint64_t v53 = v30;
        int v54 = 0;
        goto LABEL_38;
      }
      id v44 = v10;
      double v45 = (char *)[v44 count];
      v69[0] = v64;
      v69[1] = v65;
      v69[2] = v66;
      _OWORD v69[3] = v67;
      v68[0] = v60;
      v68[1] = v61;
      v68[2] = v62;
      v68[3] = v63;
      sub_10034C8E4(v69, (double *)v68, v14, v30, 0, v44, 1.0, 0.0, 1.0, 0.0);
      CGFloat v46 = (char *)[v44 count];
      if ((uint64_t)v45 < (uint64_t)v46)
      {
        double v47 = v46;
        do
        {
          id v48 = [v44 objectAtIndex:v45];
          [v48 t];
          [v48 setPoint:sub_100064570(&v64, v49)];

          ++v45;
        }
        while (v47 != v45);
      }

LABEL_40:
      ++v30;
    }
    while (v30 != v13);
    if (a5 || v55 >= [v10 count])
    {
LABEL_43:
      v14 += v57;
      if (v14 == v58) {
        break;
      }
      continue;
    }
    break;
  }
LABEL_44:
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4
{
}

- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4
{
  id v6 = a4;
  CGPoint v11 = CGPointZero;
  int64_t v7 = [(CRLBezierPath *)self elementCount];
  if (v7)
  {
    int64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v13, v11, v12))
      {
        case 0:
          CGPoint v11 = (CGPoint)v13[0];
          long long v12 = v13[0];
          continue;
        case 1:
          goto LABEL_7;
        case 2:
          sub_100348910((double *)&v12, &a3->x, i, -1, 0, v6);
          long long v10 = v13[2];
          goto LABEL_8;
        case 3:
          v13[0] = v11;
LABEL_7:
          sub_100348C30((double *)&v12, &a3->x, i, -1, v6);
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
  if (a4 < a5)
  {
    int64_t v6 = a4;
    do
    {
      switch((unint64_t)[a3 elementAtIndex:v6 associatedPoints:&v9])
      {
        case 0uLL:
          -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
          break;
        case 1uLL:
          -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
          break;
        case 2uLL:
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
          break;
        case 3uLL:
          [(CRLBezierPath *)self closePath];
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
  id v14 = a3;
  id v15 = [v14 elementCount];
  int64_t v16 = (int64_t)v15;
  BOOL v18 = a4 < 1 || (uint64_t)v15 <= a4;
  if (v18) {
    int64_t v19 = -1;
  }
  else {
    int64_t v19 = a4;
  }
  if (a6 <= 0) {
    a6 = (int64_t)v15 + 1;
  }
  if (v19 != a6)
  {
    if (!v18)
    {
      switch((unint64_t)[v14 elementAtIndex:a4 allPoints:&v34])
      {
        case 0uLL:
          if (!a8) {
            [(CRLBezierPath *)self moveToPoint:*(_OWORD *)&v34];
          }
          break;
        case 1uLL:
        case 3uLL:
          if (!a8) {
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
          }
          -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v35, v36);
          break;
        case 2uLL:
          sub_100347D40(&v34, (uint64_t)&v26, a5, 1.0);
          if (!a8) {
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
          }
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
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
        switch((unint64_t)[v14 elementAtIndex:v23 associatedPoints:&v34])
        {
          case 0uLL:
            [(CRLBezierPath *)self moveToPoint:*(_OWORD *)&v34];
            goto LABEL_47;
          case 1uLL:
            [(CRLBezierPath *)self lineToPoint:*(_OWORD *)&v34];
            break;
          case 2uLL:
            -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v37, v38, *(_OWORD *)&v34, v35, v36);
            break;
          case 3uLL:
            if (v24)
            {
              [(CRLBezierPath *)self closePath];
LABEL_47:
              char v24 = 1;
            }
            else
            {
              [(CRLBezierPath *)self lineToPoint:*(_OWORD *)&v34];
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
    if (a6 < 1 || a6 >= v16) {
      goto LABEL_58;
    }
    id v25 = [v14 elementAtIndex:a6 allPoints:&v34];
    if (v25 != (id)3)
    {
      if (v25 == (id)2)
      {
        sub_100347D40(&v34, (uint64_t)&v26, 0.0, a7);
LABEL_57:
        -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
        goto LABEL_58;
      }
      if (v25 != (id)1) {
        goto LABEL_58;
      }
    }
LABEL_55:
    -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v35 * a7 + v34.f64[0] * (1.0 - a7), v36 * a7 + v34.f64[1] * (1.0 - a7));
    goto LABEL_58;
  }
  if (a7 < a5 || v19 >= (uint64_t)v15) {
    LOBYTE(v18) = 1;
  }
  if (v18) {
    goto LABEL_58;
  }
  id v21 = [v14 elementAtIndex:v19 allPoints:&v34];
  if (v21 == (id)3) {
    goto LABEL_22;
  }
  if (v21 == (id)2)
  {
    sub_100347D40(&v34, (uint64_t)&v26, a5, a7);
    if (!a8) {
      -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
    }
    goto LABEL_57;
  }
  if (v21 == (id)1)
  {
LABEL_22:
    if (!a8) {
      -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
    }
    goto LABEL_55;
  }
LABEL_58:
}

- (id)copyFromSegment:(int)a3 t:(double)a4 toSegment:(int)a5 t:(double)a6
{
  id v11 = objc_alloc_init((Class)objc_opt_class());
  [v11 appendBezierPath:self fromSegment:a3 t:a5 toSegment:0 t:a4 withoutMove:a6];
  [v11 setWindingRule:[self windingRule]];
  [v11 setLineCapStyle:[self lineCapStyle]];
  [v11 setLineJoinStyle:[self lineJoinStyle]];
  [(CRLBezierPath *)self lineWidth];
  [v11 setLineWidth:];
  return v11;
}

- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2]
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  CGPoint v25 = CGPointZero;
  int64_t v7 = [(CRLBezierPath *)self elementCount];
  if (v7)
  {
    int64_t v8 = v7;
    uint64_t v9 = 0;
    double v10 = 3.40282347e38;
    while (1)
    {
      int64_t v11 = [(CRLBezierPath *)self elementAtIndex:v9 associatedPoints:v27];
      if (v11 == 2) {
        break;
      }
      if (v11 == 3)
      {
        CGPoint v12 = v25;
LABEL_9:
        v27[0] = v12;
        int64_t v11 = 2;
      }
      double v15 = a3[1].x;
      double v14 = a3[1].y;
      double v16 = v14 - a3->y;
      double v17 = v15 - a3->x;
      float v18 = v17 * v17 + v16 * v16;
      double v19 = (float)(1.0 / sqrtf(v18));
      double v20 = vabdd_f64(*((double *)v27 + 1) * -(v17 * v19) + v16 * v19 * *(double *)v27, v14 * -(v17 * v19) + v16 * v19 * v15);
      if (v20 < v10)
      {
        double y = *((double *)v27 + 1);
        double x = *(double *)v27;
        double v10 = v20;
      }
      float64x2_t v26 = (float64x2_t)v27[0];
      if (!v11) {
        CGPoint v25 = (CGPoint)v27[0];
      }
      if (v8 == ++v9) {
        goto LABEL_15;
      }
    }
    double v23 = 0.0;
    double v24 = 0.0;
    double v13 = sub_1003480F4(&v26, &a3->x, (uint64_t)&v23);
    if (v13 < v10)
    {
      double y = v24;
      double x = v23;
      double v10 = v13;
    }
    CGPoint v12 = (CGPoint)v27[2];
    goto LABEL_9;
  }
LABEL_15:
  double v21 = x;
  double v22 = y;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2]
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  double v7 = a3[1].x;
  double v8 = a3[1].y;
  double v9 = a3->x;
  CGPoint v32 = CGPointZero;
  int64_t v10 = [(CRLBezierPath *)self elementCount];
  if (v10)
  {
    int64_t v11 = v10;
    double v12 = sub_100064680(v7, v8, v9);
    double v14 = sub_100064660(v12, v13);
    double v16 = v15;
    uint64_t v17 = 0;
    double v18 = -2.0;
    do
    {
      int64_t v19 = [(CRLBezierPath *)self elementAtIndex:v17 associatedPoints:v34];
      uint64_t v20 = v19;
      if (v19 == 2)
      {
        double v30 = 0.0;
        double v31 = 0.0;
        double v21 = sub_1003496E4(&v33, &a3->x, (uint64_t)&v30);
        if (v21 > v18)
        {
          double v18 = v21;
          double y = v31;
          double x = v30;
        }
        v34[0] = v34[2];
      }
      else if (v19 == 3)
      {
        v34[0] = v32;
        uint64_t v20 = 2;
      }
      long long v22 = v34[0];
      double v23 = sub_100064680(*(double *)v34, *((double *)v34 + 1), a3->x);
      double v25 = sub_100064660(v23, v24);
      double v27 = sub_10006468C(v14, v16, v25, v26);
      if (v27 > v18)
      {
        double v18 = v27;
        double y = *((double *)&v22 + 1);
        double x = *(double *)&v22;
      }
      float64x2_t v33 = (float64x2_t)v34[0];
      if (!v20) {
        CGPoint v32 = (CGPoint)v34[0];
      }
      ++v17;
    }
    while (v11 != v17);
  }
  double v28 = x;
  double v29 = y;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4
{
  return [(CRLBezierPath *)self elementPercentage:a3 forOverallPercentage:0 startingElementIndex:a4 lengthToStartingElement:0.0];
}

- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4 startingElementIndex:(int64_t)a5 lengthToStartingElement:(double)a6
{
  [(CRLBezierPath *)self length];
  if (v11 <= 0.0 || (double v12 = v11, [(CRLBezierPath *)self elementCount] <= 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFFB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1FB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFFD0);
    }
    uint64_t v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:]");
    long long v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1254 isFatal:0 description:"Can't calculate a percentage of a path with no length or elements."];

    a5 = 0;
    double v23 = 0.0;
  }
  else
  {
    double v13 = v12 * a4;
    if (a4 <= 0.0)
    {
      if ([(CRLBezierPath *)self elementCount] < 1)
      {
        a5 = 0;
      }
      else
      {
        a5 = 0;
        do
        {
          [(CRLBezierPath *)self lengthOfElement:a5];
          if (v25 > 0.0) {
            break;
          }
          ++a5;
        }
        while (a5 < [(CRLBezierPath *)self elementCount]);
      }
      [(CRLBezierPath *)self lengthOfElement:a5];
      double v23 = v13 / v26;
    }
    else
    {
      double v14 = v13 - a6;
      int64_t v15 = [(CRLBezierPath *)self elementCount];
      if (v15 <= a5)
      {
        do
        {
LABEL_7:
          if (v15-- < 1) {
            break;
          }
          [(CRLBezierPath *)self lengthOfElement:v15];
        }
        while (v18 <= 0.0);
        [(CRLBezierPath *)self lengthOfElement:v15];
        double v19 = v14 + v16;
        a5 = v15;
      }
      else
      {
        while (1)
        {
          [(CRLBezierPath *)self lengthOfElement:a5];
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
      double v23 = v19 / v16;
    }
  }
  *a3 = v23;
  return a5;
}

- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4
{
  switch([(CRLBezierPath *)self elementAtIndex:a4 allPoints:&v22])
  {
    case 0:
      CGPoint v6 = (CGPoint)v22;
      break;
    case 1:
    case 3:
      CGPoint v6 = (CGPoint)vmlaq_n_f64(vmulq_n_f64(v23, a3), v22, 1.0 - a3);
      break;
    case 2:
      if (a3 >= 0.0)
      {
        if (a3 <= 1.0)
        {
          __asm { FMOV            V4.2D, #3.0 }
          CGPoint v6 = (CGPoint)vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(v23, _Q4), a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v22, 1.0 - a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(vmulq_f64(v24, _Q4), a3), a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v25, a3), a3), a3);
          break;
        }
        [(CRLBezierPath *)self rawGradientAt:a4 fromElement:a3];
        double v9 = sub_1000646A4(v12, v13, a3 + -1.0);
        double v11 = v25.f64[1];
        double v10 = v25.f64[0];
      }
      else
      {
        [(CRLBezierPath *)self rawGradientAt:a4 fromElement:a3];
        double v9 = sub_1000646A4(v7, v8, a3);
        double v11 = v22.f64[1];
        double v10 = v22.f64[0];
      }
      v6.double x = sub_100064698(v10, v11, v9);
      v6.double y = v14;
      break;
    default:
      CGPoint v6 = CGPointZero;
      break;
  }
  double y = v6.y;
  result.double x = v6.x;
  result.double y = y;
  return result;
}

- (CGPoint)pointAt:(double)a3
{
  [(CRLBezierPath *)self length];
  if (v5 <= 0.0)
  {
    if ([(CRLBezierPath *)self isEmpty])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0030);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A20C8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0050);
      }
      double v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) pointAt:]");
      double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:1343 isFatal:0 description:"Can't get a point on an empty path."];

      double v7 = INFINITY;
      double v8 = INFINITY;
    }
    else
    {
      [(CRLBezierPath *)self currentPoint];
    }
  }
  else
  {
    double v12 = 0.0;
    int64_t v6 = [(CRLBezierPath *)self elementPercentage:&v12 forOverallPercentage:a3];
    [(CRLBezierPath *)self pointAt:v6 fromElement:v12];
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4
{
  [(CRLBezierPath *)self rawGradientAt:a4 fromElement:a3];

  double v6 = sub_100064660(v4, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)gradientAt:(double)a3
{
  double v7 = 0.0;
  int64_t v4 = [(CRLBezierPath *)self elementPercentage:&v7 forOverallPercentage:a3];
  [(CRLBezierPath *)self gradientAt:v4 fromElement:v7];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 getElement:(int64_t *)a6 getPercentage:(double *)a7
{
  double y = a3.y;
  double x = a3.x;
  double v29 = 0.0;
  int64_t v14 = -[CRLBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v29);
  if (v14 >= a4)
  {
    if (v14 <= a5)
    {
      a4 = v14;
    }
    else
    {
      [(CRLBezierPath *)self elementPercentageFromElement:a5 forOverallPercentage:x];
      double v29 = v16;
      a4 = a5;
    }
  }
  else
  {
    [(CRLBezierPath *)self elementPercentageFromElement:a4 forOverallPercentage:x];
    double v29 = v15;
  }
  -[CRLBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", a4);
  double v18 = v17;
  double v20 = v19;
  [(CRLBezierPath *)self gradientAt:a4 fromElement:v29];
  double v22 = v21;
  double v24 = v23;
  [(CRLBezierPath *)self lineWidth];
  double v26 = y * v25;
  double v27 = v18 - v24 * (y * v25);
  double v28 = v20 + v22 * v26;
  *a6 = a4;
  *a7 = v29;
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (double)elementPercentageFromElement:(int64_t)a3 forOverallPercentage:(double)a4
{
  [(CRLBezierPath *)self length];
  double v8 = v7;
  if (a3 < 1)
  {
    double v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      [(CRLBezierPath *)self lengthOfElement:v9];
      double v10 = v10 + v11;
      ++v9;
    }
    while (a3 != v9);
  }
  [(CRLBezierPath *)self lengthOfElement:a3];
  return (v8 * a4 - v10) / v12;
}

- (CGPoint)rawGradientAt:(double)a3 fromElement:(int64_t)a4
{
  CGPoint v18 = CGPointZero;
  switch([(CRLBezierPath *)self elementAtIndex:a4 allPoints:&v19])
  {
    case 0:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0070);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A2150();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0090);
      }
      double v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) rawGradientAt:fromElement:]");
      double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1428 isFatal:0 description:"-rawGradientAt:fromElement: can't handle move to."];

      goto LABEL_12;
    case 1:
    case 3:
      float64x2_t v5 = vsubq_f64(v20, v19);
      break;
    case 2:
      double v9 = 0.0001;
      if (a3 >= 0.0001) {
        double v9 = a3;
      }
      if (v9 <= 0.9999) {
        double v10 = v9;
      }
      else {
        double v10 = 0.9999;
      }
      __asm
      {
        FMOV            V4.2D, #-3.0
        FMOV            V5.2D, #3.0
      }
      float64x2_t v5 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_f64(v20, _Q5), v10 * -4.0 + 1.0 + v10 * 3.0 * v10), vmulq_n_f64(vmulq_f64(v19, _Q4), v10 + -1.0), v10 + -1.0), vmulq_n_f64(vmulq_f64(v21, _Q5), v10), v10 * -3.0 + 2.0), vmulq_n_f64(vmulq_f64(v22, _Q5), v10), v10);
      break;
    default:
LABEL_12:
      float64x2_t v5 = (float64x2_t)v18;
      break;
  }
  double v17 = v5.f64[1];
  result.double x = v5.f64[0];
  result.double y = v17;
  return result;
}

- (CGPoint)myGradientAt:(double)a3
{
  double v14 = 0.0;
  int64_t v4 = [(CRLBezierPath *)self elementPercentage:&v14 forOverallPercentage:a3];
  [(CRLBezierPath *)self rawGradientAt:v4 fromElement:v14];
  double v6 = v5;
  double v8 = v7;
  [(CRLBezierPath *)self length];
  double v10 = v9;
  [(CRLBezierPath *)self lengthOfElement:v4];
  double v12 = sub_1000646A4(v6, v8, v10 / v11);
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)myGradientAt:(double)a3 fromElement:(int64_t)a4
{
  -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a3);
  double v7 = v6;
  double v9 = v8;
  [(CRLBezierPath *)self length];
  double v11 = v10;
  [(CRLBezierPath *)self lengthOfElement:a4];

  double v13 = sub_1000646A4(v7, v9, v11 / v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (double)curvatureAt:(double)a3
{
  double v8 = 0.0;
  int64_t v4 = [(CRLBezierPath *)self elementPercentage:&v8 forOverallPercentage:a3];
  [(CRLBezierPath *)self curvatureAt:v4 fromElement:v8];
  double v6 = -0.5;
  if (v5 >= -0.5) {
    double v6 = v5;
  }
  if (v5 <= 0.5) {
    return v6;
  }
  else {
    return 0.5;
  }
}

- (double)curvatureAt:(double)a3 fromElement:(int64_t)a4
{
  int64_t v5 = [(CRLBezierPath *)self elementAtIndex:a4 allPoints:&v15];
  if (v5 == 2)
  {
    double v10 = 0.01;
    if (a3 >= 0.01) {
      double v10 = a3;
    }
    if (v10 > 0.99) {
      double v10 = 0.99;
    }
    double v11 = (v10 * (v10 * (v21 - v19) + (1.0 - v10) * (v19 - v17))
         + (1.0 - v10) * (v10 * (v19 - v17) + (1.0 - v10) * (v17 - v15)))
        * 3.0;
    double v12 = (v10 * (v10 * (v22 - v20) + (1.0 - v10) * (v20 - v18))
         + (1.0 - v10) * (v10 * (v20 - v18) + (1.0 - v10) * (v18 - v16)))
        * 3.0;
    double v13 = v11 * ((v10 * (v22 - v20 - (v20 - v18)) + (1.0 - v10) * (v20 - v18 - (v18 - v16))) * 6.0)
        - v12 * ((v10 * (v21 - v19 - (v19 - v17)) + (1.0 - v10) * (v19 - v17 - (v17 - v15))) * 6.0);
    return v13 / pow(v12 * v12 + v11 * v11, 1.5);
  }
  else
  {
    double v6 = 0.0;
    if (!v5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F00B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A21D8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F00D0);
      }
      double v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) curvatureAt:fromElement:]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1479 isFatal:0 description:"-curvatureAt:fromElement: can't handle move to."];
    }
  }
  return v6;
}

- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[CRLBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v7, 0, (char *)[v7 elementCount] - 1, v6, 0.0, 1.0);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  -[CRLBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v10, 0, (char *)[v10 elementCount] - 1, v9, var0, var1);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v12 = a3;
  id v13 = a6;
  if (([v12 isEmpty] & 1) == 0 && length)
  {
    uint64_t v14 = location + length;
    if (location + length <= (unint64_t)[v12 elementCount])
    {
      double v90 = var0;
      double v91 = var1;
      id v18 = objc_alloc_init((Class)NSMutableArray);
      double v21 = [CRLPathCut alloc];
      [v12 lengthToElement:location];
      double v23 = v22;
      [v12 length];
      double v25 = [(CRLPathCut *)v21 initWithSegment:location atT:v23 / v24 withSkew:0.0];
      [v18 addObject:v25];

      [v12 miterLimit];
      NSUInteger v27 = location + 1;
      if (v27 < v14)
      {
        double v89 = v26 * 0.995;
        NSUInteger v28 = length - 1;
        do
        {
          unint64_t v29 = v27 + 1;
          [v12 lengthOfElement:v27 + 1];
          if (v30 >= 0.1)
          {
            [v12 lengthOfElement:v27];
            if (v31 >= 0.1)
            {
              [v12 gradientAt:v27 fromElement:1.0];
              double v34 = sub_100064660(v32, v33);
              double v36 = v35;
              [v12 gradientAt:v27 + 1 fromElement:0.0];
              double v39 = sub_100064660(v37, v38);
              double v41 = v40;
              double v42 = sub_10006468C(v34, v36, v39, v40);
              if (v42 < 0.99)
              {
                double v43 = v42;
                [v12 lengthToElement:v27 + 1];
                double v92 = v44;
                [v12 length];
                double v46 = v45;
                double v47 = 0.0;
                if (v29 < v14)
                {
                  double v48 = sub_1000646A4(v39, v41, -1.0);
                  double v49 = sub_100064698(v34, v36, v48);
                  double v51 = v50;
                  double v52 = -sub_10006468C(v34, v36, v49, v50);
                  double v53 = sub_100066394(0, v34, v36);
                  double v55 = v52 / sub_10006468C(v49, v51, v53, v54);
                  long double v56 = acos(fmin(fmax(-v43, -1.0), 1.0));
                  if (1.0 / sin(v56 * 0.5) <= v89) {
                    double v47 = v55;
                  }
                  else {
                    double v47 = 0.0;
                  }
                }
                uint64_t v57 = [[CRLPathCut alloc] initWithSegment:v27 atT:v92 / v46 withSkew:v47];
                [v18 addObject:v57];
              }
            }
          }
          NSUInteger v27 = v29;
          --v28;
        }
        while (v28);
      }
      if (v14 < 1)
      {
LABEL_29:
        [v12 lengthToElement:v14];
        double v61 = v60;
        [v12 lengthOfElement:v14];
        double v63 = v61 + v62;
        [v12 length];
        float64x2_t v65 = [[CRLPathCut alloc] initWithSegment:v14 atT:v63 / v64 withSkew:0.0];
        [v18 addObject:v65];
      }
      else
      {
        while (1)
        {
          [v12 lengthOfElement:v14];
          if (v58 >= 0.1) {
            break;
          }
          if (v14-- <= 1)
          {
            uint64_t v14 = 0;
            goto LABEL_29;
          }
        }
        [v12 lengthToElement:v14];
        double v67 = v66;
        [v12 lengthOfElement:v14];
        double v69 = v67 + v68;
        [v12 length];
        uint64_t v71 = [[CRLPathCut alloc] initWithSegment:v14 atT:v69 / v70 withSkew:0.0];
        [v18 addObject:v71];

        *(_OWORD *)buf = xmmword_101175160;
        *(_OWORD *)&buf[16] = xmmword_101175160;
        *(_OWORD *)&buf[32] = xmmword_101175160;
        *(_OWORD *)&unsigned char buf[48] = xmmword_101175160;
        CGPoint v95 = CGPointZero;
        if ([(CRLBezierPath *)self elementCount] >= 1)
        {
          uint64_t v72 = 0;
          BOOL v73 = 0;
          do
          {
            int64_t v74 = [(CRLBezierPath *)self elementAtIndex:v72 associatedPoints:&buf[16]];
            BOOL v75 = v74 == 0;
            if (v74)
            {
              int64_t v76 = v74;
              if (v74 == 2)
              {
                *(double *)&buf[16] = v90 + *(double *)&buf[16] * v91;
                *(double *)&buf[32] = v90 + *(double *)&buf[32] * v91;
                *(double *)&unsigned char buf[48] = v90 + *(double *)&buf[48] * v91;
                long long v93 = *(_OWORD *)&buf[48];
                sub_10034AFCC((float64x2_t *)buf, v12, v13, v73, v18);
                *(_OWORD *)buf = v93;
              }
              else
              {
                if (v74 == 3)
                {
                  *(CGPoint *)&buf[16] = v95;
                  CGPoint v77 = v95;
                }
                else
                {
                  v77.double x = v90 + *(double *)&buf[16] * v91;
                  *(double *)&buf[16] = v77.x;
                }
                double v78 = *(double *)buf;
                double v79 = *(double *)&buf[8];
                double v80 = sub_100064680(v77.x, *(double *)&buf[24], *(double *)buf);
                double v82 = v81;
                *(_OWORD *)&unsigned char buf[48] = *(_OWORD *)&buf[16];
                double v83 = sub_1000646A4(v80, v81, 0.33);
                *(void *)&buf[16] = sub_100064698(v78, v79, v83);
                *(void *)&buf[24] = v84;
                double v85 = sub_1000646A4(v80, v82, 0.66);
                *(void *)&buf[32] = sub_100064698(v78, v79, v85);
                *(void *)&buf[40] = v86;
                long long v94 = *(_OWORD *)&buf[48];
                sub_10034AFCC((float64x2_t *)buf, v12, v13, v73, v18);
                *(_OWORD *)buf = v94;
                if (v76 == 3) {
                  [v13 closePath];
                }
              }
            }
            else
            {
              *(double *)&buf[16] = v90 + *(double *)&buf[16] * v91;
              CGPoint v95 = *(CGPoint *)&buf[16];
              *(_OWORD *)buf = *(_OWORD *)&buf[16];
            }
            ++v72;
            BOOL v73 = v75;
          }
          while (v72 < [(CRLBezierPath *)self elementCount]);
        }
      }
    }
    else
    {
      unsigned int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F00F0);
      }
      double v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        double v87 = v16;
        v98.NSUInteger location = location;
        v98.NSUInteger length = length;
        double v88 = NSStringFromRange(v98);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "-[CRLBezierPath(Distortion) recursiveSubdivideOntoPath:withScaling:inElementRange:into:]";
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 1717;
        *(_WORD *)&buf[34] = 2112;
        *(void *)&buf[36] = v88;
        *(_WORD *)&buf[44] = 2048;
        *(void *)&buf[46] = [v12 elementCount];
        _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Asked to recursively subdivide using a range (%@) beyond the end of a path with element count %zd", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0110);
      }
      double v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) recursiveSubdivideOntoPath:withScaling:inElementRange:into:]");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      double v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"];
      v97.NSUInteger location = location;
      v97.NSUInteger length = length;
      double v20 = NSStringFromRange(v97);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1717, 0, "Asked to recursively subdivide using a range (%@) beyond the end of a path with element count %zd", v20, [v12 elementCount]);
    }
  }
}

- (id)chisel
{
  id v3 = +[CRLBezierPath bezierPath];
  [(CRLBezierPath *)self lineWidth];
  double v5 = v4 * 0.5;
  int64_t v6 = [(CRLBezierPath *)self elementCount];
  if (!v6)
  {
    BOOL v9 = 1;
    uint64_t v43 = -1;
    goto LABEL_60;
  }
  int64_t v7 = v6;
  uint64_t v8 = 0;
  BOOL v9 = 1;
  double v10 = 9.0;
  double v11 = -9.0;
  do
  {
    BOOL v12 = v9;
    int64_t v13 = [(CRLBezierPath *)self elementAtIndex:v8 allPoints:&v89];
    BOOL v9 = v13 == 0;
    if (!v13) {
      goto LABEL_56;
    }
    int64_t v14 = v13;
    [(CRLBezierPath *)self rawGradientAt:v8 fromElement:0.0];
    if (v15 <= 0.0) {
      double v16 = -v5;
    }
    else {
      double v16 = v5;
    }
    if (v14 == 2)
    {
      double v17 = v90 * v10 + v89.f64[0] * -3.0 + v92 * v11 + v94 * 3.0;
      double v18 = v90 * -12.0 + v89.f64[0] * 6.0 + v92 * 6.0;
      double v19 = v90 * 3.0 + v89.f64[0] * -3.0;
      double v20 = v19 * (v17 * -4.0) + v18 * v18;
      if (v20 <= 0.0)
      {
        double v31 = v16 + v89.f64[1];
        if (v12) {
          [v3 moveToPoint:v89.f64[0], v31];
        }
        else {
          [v3 lineToPoint:v89.f64[0], v31];
        }
        double v33 = v94;
        double v34 = v16 + v95;
        double v35 = v90;
        double v36 = v16 + v91;
        double v37 = v92;
        double v38 = v93;
        goto LABEL_55;
      }
      float v21 = v20;
      double v22 = sqrtf(v21);
      double v23 = (-v18 - v22) / (v17 + v17);
      double v24 = (v22 - v18) / (v17 + v17);
      if (v24 >= v23) {
        double v25 = v24;
      }
      else {
        double v25 = v23;
      }
      if (v24 < v23) {
        double v23 = v24;
      }
      double v26 = fabs(v17);
      if (v26 <= 0.001) {
        double v27 = 10.0;
      }
      else {
        double v27 = v25;
      }
      if (v26 <= 0.001) {
        double v28 = -v19 / v18;
      }
      else {
        double v28 = v23;
      }
      if (v28 > 0.0 && v28 < 1.0)
      {
        sub_100347D40(&v89, (uint64_t)&v81, 0.0, v28);
        double v32 = v16 + v82;
        if (v12) {
          [v3 moveToPoint:v81, v32];
        }
        else {
          [v3 lineToPoint:v81, v32];
        }
        [v3 curveToPoint:v87 controlPoint1:v16 + v88 controlPoint2:v83, v16 + v84];
        [(CRLBezierPath *)self rawGradientAt:v8 fromElement:v28 + 0.01];
        BOOL v12 = 0;
        if (v39 <= 0.0) {
          double v16 = -v5;
        }
        else {
          double v16 = v5;
        }
      }
      else
      {
        double v28 = 0.0;
      }
      if (v27 > 0.0 && v27 < 1.0)
      {
        sub_100347D40(&v89, (uint64_t)&v81, v28, v27);
        double v41 = v16 + v82;
        if (v12) {
          [v3 moveToPoint:v81, v41];
        }
        else {
          [v3 lineToPoint:v81, v41];
        }
        double v10 = 9.0;
        [v3 curveToPoint:v87 controlPoint1:v16 + v88 controlPoint2:v83, v16 + v84, v85, v16 + v86];
        [(CRLBezierPath *)self rawGradientAt:v8 fromElement:v27 + 0.01];
        if (v42 <= 0.0) {
          double v16 = -v5;
        }
        else {
          double v16 = v5;
        }
        sub_100347D40(&v89, (uint64_t)&v81, v27, 1.0);
      }
      else
      {
        sub_100347D40(&v89, (uint64_t)&v81, v28, 1.0);
        if (v12)
        {
          [v3 moveToPoint:v81, v16 + v82];
          double v10 = 9.0;
          double v11 = -9.0;
LABEL_54:
          double v33 = v87;
          double v34 = v16 + v88;
          double v35 = v83;
          double v36 = v16 + v84;
          double v37 = v85;
          double v38 = v86;
LABEL_55:
          [v3 curveToPoint:v33 controlPoint1:v34 controlPoint2:v35];
          goto LABEL_56;
        }
        double v10 = 9.0;
      }
      double v11 = -9.0;
      [v3 lineToPoint:v81, v16 + v82];
      goto LABEL_54;
    }
    double v30 = v16 + v89.f64[1];
    if (v12) {
      [v3 moveToPoint:v89.f64[0] v30];
    }
    else {
      [v3 lineToPoint:v89.f64[0], v30];
    }
    [v3 lineToPoint:v90, v16 + v91];
LABEL_56:
    ++v8;
  }
  while (v7 != v8);
  uint64_t v43 = v7 - 1;
  if (v43)
  {
LABEL_60:
    if (CGPointZero.x >= 0.0) {
      double v44 = -v5;
    }
    else {
      double v44 = v5;
    }
    double v45 = 9.0;
    double v46 = -3.0;
    do
    {
      int64_t v47 = [(CRLBezierPath *)self elementAtIndex:v43 allPoints:&v89];
      BOOL v48 = v47 == 0;
      if (v47)
      {
        int64_t v49 = v47;
        [(CRLBezierPath *)self rawGradientAt:v43 fromElement:1.0];
        if (v50 >= 0.0) {
          double v51 = -v5;
        }
        else {
          double v51 = v5;
        }
        if (v49 == 2)
        {
          double v52 = v90 * v45 + v89.f64[0] * v46 + v92 * -9.0 + v94 * 3.0;
          double v53 = v90 * -12.0 + v89.f64[0] * 6.0 + v92 * 6.0;
          double v54 = v90 * 3.0 + v89.f64[0] * v46;
          double v55 = v54 * (v52 * -4.0) + v53 * v53;
          if (v55 <= 0.0)
          {
            double v68 = v51 + v95;
            if (v9) {
              [v3 moveToPoint:v94, v68];
            }
            else {
              [v3 lineToPoint:v94, v68];
            }
            double v70 = v89.f64[0];
            double v71 = v51 + v89.f64[1];
            double v72 = v92;
            double v73 = v51 + v93;
            double v74 = v90;
            double v75 = v91;
          }
          else
          {
            float v56 = v55;
            double v57 = sqrtf(v56);
            double v58 = (-v53 - v57) / (v52 + v52);
            double v59 = (v57 - v53) / (v52 + v52);
            if (v59 <= v58) {
              double v60 = v59;
            }
            else {
              double v60 = v58;
            }
            if (v59 > v58) {
              double v58 = v59;
            }
            double v61 = fabs(v52);
            if (v61 <= 0.001) {
              double v62 = 10.0;
            }
            else {
              double v62 = v60;
            }
            if (v61 <= 0.001) {
              double v63 = -v54 / v53;
            }
            else {
              double v63 = v58;
            }
            if (v63 > 0.0 && v63 < 1.0)
            {
              sub_100347D40(&v89, (uint64_t)&v81, v63, 1.0);
              double v69 = v51 + v88;
              if (v9) {
                [v3 moveToPoint:v87, v69];
              }
              else {
                [v3 lineToPoint:v87, v69];
              }
              [v3 curveToPoint:v81 controlPoint1:v51 + v82 controlPoint2:v83, v51 + v84];
              [(CRLBezierPath *)self rawGradientAt:v43 fromElement:v63 + -0.01];
              BOOL v9 = 0;
              if (v76 >= 0.0) {
                double v51 = -v5;
              }
              else {
                double v51 = v5;
              }
            }
            else
            {
              double v63 = 1.0;
            }
            if (v62 > 0.0 && v62 < 1.0)
            {
              sub_100347D40(&v89, (uint64_t)&v81, v62, v63);
              double v78 = v51 + v88;
              if (v9) {
                [v3 moveToPoint:v87, v78];
              }
              else {
                [v3 lineToPoint:v87, v78];
              }
              double v45 = 9.0;
              [v3 curveToPoint:v81 controlPoint1:v51 + v82 controlPoint2:v83, v51 + v84];
              [(CRLBezierPath *)self rawGradientAt:v43 fromElement:v62 + -0.01];
              if (v79 >= 0.0) {
                double v51 = -v5;
              }
              else {
                double v51 = v5;
              }
              sub_100347D40(&v89, (uint64_t)&v81, 0.0, v62);
            }
            else
            {
              sub_100347D40(&v89, (uint64_t)&v81, 0.0, v63);
              if (v9)
              {
                [v3 moveToPoint:v87, v51 + v88];
                double v45 = 9.0;
                double v46 = -3.0;
                goto LABEL_117;
              }
              double v45 = 9.0;
            }
            double v46 = -3.0;
            [v3 lineToPoint:v87, v51 + v88];
LABEL_117:
            double v70 = v81;
            double v71 = v51 + v82;
            double v72 = v85;
            double v73 = v51 + v86;
            double v74 = v83;
            double v75 = v84;
          }
          [v3 curveToPoint:v70 controlPoint1:v71 controlPoint2:v72];
          goto LABEL_119;
        }
        double v67 = v51 + v91;
        if (v9) {
          [v3 moveToPoint:v90, v67];
        }
        else {
          [v3 lineToPoint:v90, v67];
        }
        double v65 = v89.f64[0];
        double v66 = v51 + v89.f64[1];
      }
      else
      {
        double v65 = v89.f64[0];
        double v66 = v89.f64[1] - v44;
      }
      [v3 lineToPoint:v65, v66];
LABEL_119:
      BOOL v9 = v48;
      --v43;
    }
    while (v43);
  }

  return v3;
}

+ (CRLBezierPath)bezierPathWithContinuousCornerRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (CRLBezierPath *)[a1 bezierPathWithRoundedRect:0 upperRightRadius:0 lowerRightRadius:a3.origin.x lowerLeftRadius:a3.origin.y upperLeftRadius:a3.size.width keepNoOpElements:a4];
}

+ (CRLBezierPath)bezierPathWithLegacyRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (CRLBezierPath *)[a1 bezierPathWithRoundedRect:1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4, a4, a4];
}

+ (CRLBezierPath)bezierPathWithRoundedRect:(CGRect)a3 upperRightRadius:(double)a4 lowerRightRadius:(double)a5 lowerLeftRadius:(double)a6 upperLeftRadius:(double)a7 useLegacyCorners:(BOOL)a8 keepNoOpElements:(BOOL)a9
{
  BOOL v10 = a8;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v19 = +[CRLBezierPath bezierPath];
  if (v10)
  {
    double v30 = sub_1003A9F9C(a4, x, y, width, height, a7, a5);
    double v32 = sub_1003A9F9C(a5, x, y, width, height, a6, a4);
    double v34 = sub_1003A9F9C(a6, x, y, width, height, a5, a7);
    double v20 = sub_1003A9F9C(a7, x, y, width, height, a4, a6);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    [v19 moveToPoint:v20 + MinX, CGRectGetMinY(v38)];
    sub_1003AA7D4(v19, 0, a9, x, y, width, height, v30);
    sub_1003AA7D4(v19, 1, a9, x, y, width, height, v32);
    sub_1003AA7D4(v19, 2, a9, x, y, width, height, v34);
    sub_1003AA7D4(v19, 3, a9, x, y, width, height, v20);
  }
  else
  {
    double v31 = sub_1003A9F9C(a4, x, y, width, height, a7 * 1.528665, a5 * 1.528665);
    double v22 = a4 * 1.528665;
    double v33 = sub_1003A9F9C(a5, x, y, width, height, a6 * 1.528665, v22);
    double v35 = sub_1003A9F9C(a6, x, y, width, height, a5 * 1.528665, a7 * 1.528665);
    double v23 = sub_1003A9F9C(a7, x, y, width, height, v22, a6 * 1.528665);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGFloat v24 = CGRectGetWidth(v39);
    double v25 = v24 * 0.5;
    double v26 = v24 - v31 * 1.528665;
    if (v25 >= v26) {
      double v26 = v25;
    }
    if (v26 >= v23 * 1.528665) {
      double v27 = v23 * 1.528665;
    }
    else {
      double v27 = v26;
    }
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v28 = CGRectGetMinX(v40);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    [v19 moveToPoint:v28 + v27, CGRectGetMinY(v41)];
    sub_1003AA170(v19, 0, a9, x, y, width, height, v31, v23, v33);
    sub_1003AA170(v19, 1, a9, x, y, width, height, v33, v35, v31);
    sub_1003AA170(v19, 2, a9, x, y, width, height, v35, v33, v23);
    sub_1003AA170(v19, 3, a9, x, y, width, height, v23, v31, v35);
  }
  [v19 closePath];

  return (CRLBezierPath *)v19;
}

+ (double)minimumLengthForSideToHaveFullContinuityWithCornerRadius1:(double)a3 cornerRadius2:(double)a4
{
  return a4 * 1.528665 + a3 * 1.528665;
}

+ (id)pathForObjectEraserWithPoint:(CGPoint)a3
{
  sub_100B75408(a3.x, a3.y);

  return v3;
}

@end