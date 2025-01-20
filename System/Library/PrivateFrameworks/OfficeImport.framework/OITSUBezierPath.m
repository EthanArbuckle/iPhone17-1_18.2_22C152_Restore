@interface OITSUBezierPath
+ (double)defaultFlatness;
+ (double)defaultLineWidth;
+ (double)defaultMiterLimit;
+ (id)bezierPath;
+ (id)bezierPathWithCGPath:(CGPath *)a3;
+ (id)bezierPathWithOvalInRect:(CGRect)a3;
+ (id)bezierPathWithRect:(CGRect)a3;
+ (id)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
+ (id)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4;
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
- (BOOL)_isValid:(double)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isCircular;
- (BOOL)isClockwise;
- (BOOL)isDiamond;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlat;
- (BOOL)isRectangular;
- (BOOL)isTriangular;
- (CGPath)CGPath;
- (CGPoint)_checkPointForValidity:(CGPoint)a3;
- (CGPoint)currentPoint;
- (CGRect)bounds;
- (CGRect)controlPointBounds;
- (OITSUBezierPath)init;
- (OITSUBezierPath)initWithCString:(const char *)a3;
- (OITSUBezierPath)initWithCoder:(id)a3;
- (const)cString;
- (double)calculateLengthOfElement:(int64_t)a3;
- (double)flatness;
- (double)length;
- (double)lengthOfElement:(int64_t)a3;
- (double)lengthToElement:(int64_t)a3;
- (double)lineWidth;
- (double)miterLimit;
- (id)_copyFlattenedPath;
- (id)bezierPathByFlatteningPath;
- (id)bezierPathByFlatteningPathWithFlatness:(double)a3;
- (id)bezierPathByRemovingRedundantElements;
- (id)bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:(double)a3;
- (id)bezierPathByReversingPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:(double)a3;
- (int64_t)elementAtIndex:(int64_t)a3;
- (int64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4;
- (int64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4;
- (int64_t)elementCount;
- (unint64_t)lineCapStyle;
- (unint64_t)lineJoinStyle;
- (unint64_t)windingRule;
- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4;
- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6;
- (void)_appendToPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4;
- (void)_deviceClosePath;
- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)_deviceLineToPoint:(CGPoint)a3;
- (void)_deviceMoveToPoint:(CGPoint)a3;
- (void)_doPath;
- (void)addClip;
- (void)appendBezierPath:(id)a3;
- (void)appendBezierPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4;
- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7;
- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(int)a6 startNewPath:(BOOL)a7;
- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(int)a6 startNewPath:(BOOL)a7;
- (void)appendBezierPathWithOvalInRect:(CGRect)a3;
- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4;
- (void)appendBezierPathWithRect:(CGRect)a3;
- (void)attachBezierPath:(id)a3;
- (void)calculateLengths;
- (void)copyPathAttributesTo:(id)a3;
- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fill;
- (void)flattenIntoPath:(id)a3;
- (void)flattenIntoPath:(id)a3 flatness:(double)a4;
- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5;
- (void)lineToPoint:(CGPoint)a3;
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
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation OITSUBezierPath

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[OITSUBezierPath setVersion:524];
  }
}

+ (id)bezierPath
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = (void *)[a1 bezierPath];
  objc_msgSend(v8, "moveToPoint:", v7, v6);
  objc_msgSend(v8, "lineToPoint:", x, y);
  return v8;
}

+ (id)bezierPathWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (void *)[a1 bezierPath];
  objc_msgSend(v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (id)bezierPathWithOvalInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (void *)[a1 bezierPath];
  objc_msgSend(v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (id)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  v4 = TSUCreateRoundRectPathForRectWithRadius(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v5 = +[OITSUBezierPath bezierPathWithCGPath:v4];
  CGPathRelease(v4);
  return v5;
}

+ (id)bezierPathWithCGPath:(CGPath *)a3
{
  v4 = (void *)[a1 bezierPath];
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

- (OITSUBezierPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUBezierPath;
  result = [(OITSUBezierPath *)&v6 init];
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
  result->sfr_dashedLinePhase = 0.0;
  result->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = v4;
  return result;
}

- (void)dealloc
{
  v3 = (NSZone *)[(OITSUBezierPath *)self zone];
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
  v7.super_class = (Class)OITSUBezierPath;
  [(OITSUBezierPath *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v14[6] = *(double *)MEMORY[0x263EF8340];
  if (self == a3)
  {
LABEL_16:
    LOBYTE(v5) = 1;
    return v5;
  }
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    objc_super v7 = (void *)TSUCheckedDynamicCast(v6, (uint64_t)a3);
    uint64_t v8 = [(OITSUBezierPath *)self elementCount];
    if (v8 != [v7 elementCount])
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
        unint64_t v10 = [(OITSUBezierPath *)self elementAtIndex:v9 associatedPoints:v14];
        if (v10 != [v7 elementAtIndex:v9 associatedPoints:v13]) {
          goto LABEL_17;
        }
        if (v10 >= 2)
        {
          if (v10 == 2)
          {
            uint64_t v11 = 0;
            while (TSUNearlyEqualPoints(v14[v11], v14[v11 + 1], v13[v11], v13[v11 + 1]))
            {
              v11 += 2;
              if (v11 == 6) {
                goto LABEL_14;
              }
            }
            goto LABEL_17;
          }
        }
        else if (!TSUNearlyEqualPoints(v14[0], v14[1], v13[0], v13[1]))
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
  objc_msgSend(a3, "setWindingRule:", -[OITSUBezierPath windingRule](self, "windingRule"));
  objc_msgSend(a3, "setLineCapStyle:", -[OITSUBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(a3, "setLineJoinStyle:", -[OITSUBezierPath lineJoinStyle](self, "lineJoinStyle"));
  [(OITSUBezierPath *)self lineWidth];
  objc_msgSend(a3, "setLineWidth:");
  [(OITSUBezierPath *)self miterLimit];
  objc_msgSend(a3, "setMiterLimit:");
  [(OITSUBezierPath *)self flatness];
  objc_msgSend(a3, "setFlatness:");
  if (self->sfr_dashedLinePattern)
  {
    double sfr_dashedLinePhase = self->sfr_dashedLinePhase;
    objc_msgSend(a3, "setLineDash:count:phase:", sfr_dashedLinePhase);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(OITSUBezierPath *)self copyPathAttributesTo:v4];
  [v4 appendBezierPath:self];
  return v4;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(OITSUBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for line"];
  }
  -[OITSUBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  if ([(OITSUBezierPath *)self isEmpty]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"No current point for curve"];
  }
  -[OITSUBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v10, v9, v8, v7, x, y);
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
  [(OITSUBezierPath *)self currentPoint];
  double v7 = x + v6;
  double v9 = y + v8;
  -[OITSUBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v7, v9);
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(OITSUBezierPath *)self currentPoint];
  double v7 = x + v6;
  double v9 = y + v8;
  -[OITSUBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v7, v9);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  [(OITSUBezierPath *)self currentPoint];
  double v13 = v8 + v12;
  double v15 = v7 + v14;
  double v16 = x + v12;
  double v17 = y + v14;
  double v18 = v10 + v12;
  double v19 = v9 + v14;
  -[OITSUBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v18, v19, v13, v15, v16, v17);
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
    uint64_t v11 = (NSZone *)[(OITSUBezierPath *)self zone];
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
    NSZoneFree((NSZone *)[(OITSUBezierPath *)self zone], self->sfr_dashedLinePattern);
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
  if (!-[OITSUBezierPath _isValid:](self, "_isValid:")) {
    double x = 0.0;
  }
  if ([(OITSUBezierPath *)self _isValid:y]) {
    double v6 = y;
  }
  else {
    double v6 = 0.0;
  }
  double v7 = x;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)_doPath
{
  if (!self->sfr_path && ![(OITSUBezierPath *)self isEmpty])
  {
    Mutable = CGPathCreateMutable();
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      double v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      do
      {
        switch(*(void *)sfr_head & 0xFLL)
        {
          case 0:
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathMoveToPoint(Mutable, 0, v8, v9);
            break;
          case 1:
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathAddLineToPoint(Mutable, 0, v10, v11);
            break;
          case 2:
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGFloat v13 = v12;
            CGFloat v15 = v14;
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *sfr_extraSegments, sfr_extraSegments[1]);
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", sfr_extraSegments[2], sfr_extraSegments[3]);
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
  CGContextSetLineCap(CurrentContext, (CGLineCap)[(OITSUBezierPath *)self lineCapStyle]);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)[(OITSUBezierPath *)self lineJoinStyle]);
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
    double v7 = &sfr_head[6 * sfr_elementCount];
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
  if ([(OITSUBezierPath *)self windingRule]) {
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
  if ([(OITSUBezierPath *)self windingRule]) {
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
        -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v43, v38, v39);
        float64x2_t v30 = v40;
        float64x2_t v31 = v41;
        float64x2_t v29 = v42;
        float64x2_t v8 = v43;
        --v37;
      }
      while (v37 > 2);
    }
  }
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v38.x, *(double *)&v39);
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
  return [(OITSUBezierPath *)self bezierPathByFlatteningPathWithFlatness:*(double *)&sfrdefaultFlatness];
}

- (id)bezierPathByFlatteningPathWithFlatness:(double)a3
{
  if ([(OITSUBezierPath *)self isFlat])
  {
    id v5 = (id)[(OITSUBezierPath *)self copy];
  }
  else
  {
    id v5 = objc_alloc_init((Class)objc_opt_class());
    [(OITSUBezierPath *)self flattenIntoPath:v5 flatness:a3];
  }
  return v5;
}

- (id)_copyFlattenedPath
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [(OITSUBezierPath *)self flattenIntoPath:v3];
  return v3;
}

- (id)bezierPathByReversingPath
{
  if (self->sfr_elementCount <= 1)
  {
    id v3 = (id)[(OITSUBezierPath *)self copy];
    goto LABEL_29;
  }
  id v3 = objc_alloc_init((Class)objc_opt_class());
  int64_t sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 2)
  {
    sfr_head = self->sfr_head;
    unint64_t v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    float64x2_t v8 = sfr_head + 6;
    while (1)
    {
      CGFloat v9 = sfr_head;
      sfr_head = v8;
      uint64_t v10 = *(void *)&v9[6] & 0xFLL;
      if (!v10 || (unint64_t)&v9[12] >= v6)
      {
        CGFloat v12 = v10 ? sfr_head : v9;
        objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
        unint64_t v13 = *(void *)v12;
        if ((*(void *)v12 & 0xFLL) != 0) {
          break;
        }
      }
LABEL_28:
      float64x2_t v8 = sfr_head + 6;
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
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v15 - 1), *v15, sfr_extraSegments[4 * (v13 >> 4) + 2], sfr_extraSegments[4 * (v13 >> 4) + 3], sfr_extraSegments[4 * (v13 >> 4)], sfr_extraSegments[4 * (v13 >> 4) + 1]);
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
        objc_msgSend(v3, "lineToPoint:", *(v15 - 1), *v15);
      }
LABEL_27:
      unint64_t v13 = *((void *)v15 - 2);
      v15 -= 3;
      if ((v13 & 0xF) == 0) {
        goto LABEL_28;
      }
    }
    objc_msgSend(v3, "lineToPoint:", *(v15 - 1), *v15);
    goto LABEL_25;
  }
LABEL_29:
  return v3;
}

- (id)bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:(double)a3
{
  return [(OITSUBezierPath *)self p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:a3 + a3];
}

- (id)bezierPathByRemovingRedundantElements
{
  return [(OITSUBezierPath *)self p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:0.0];
}

- (id)p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:(double)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = +[OITSUBezierPath bezierPath];
  id v6 = +[OITSUBezierPath bezierPath];
  uint64_t v7 = [(OITSUBezierPath *)self elementCount];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    char v10 = 0;
    double v11 = *MEMORY[0x263F00148];
    double v12 = *(double *)(MEMORY[0x263F00148] + 8);
    double v13 = *MEMORY[0x263F00148];
    double v14 = v12;
    double v15 = *MEMORY[0x263F00148];
    double v16 = v12;
    while (2)
    {
      switch(-[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, &v36, *(void *)&v33, *(void *)&v34))
      {
        case 0:
          objc_msgSend(v6, "moveToPoint:", v36, v37);
          char v10 = 0;
          double v11 = v36;
          double v12 = v37;
          goto LABEL_13;
        case 1:
          double v35 = v11;
          double v17 = a3;
          double v18 = v36;
          double v19 = v37;
          if (TSUNearlyEqualPoints(v13, v14, v36, v37)) {
            goto LABEL_6;
          }
          if ((v10 & 1) != 0
            && TSUCollinearPoints(v15, v16, v13, v14, v18, v19)
            && (double v24 = TSUSubtractPoints(v13, v14, v15),
                double v33 = v25,
                double v34 = v24,
                double v26 = TSUSubtractPoints(v18, v19, v15),
                TSUDotPoints(v34, v33, v26, v27) > 0.0))
          {
            objc_msgSend(v6, "setAssociatedPoints:atIndex:", &v36, objc_msgSend(v6, "elementCount") - 1);
            char v10 = 1;
LABEL_6:
            double v14 = v16;
            double v13 = v15;
          }
          else
          {
            objc_msgSend(v6, "lineToPoint:", v18, v19, *(void *)&v33, *(void *)&v34);
            char v10 = 1;
          }
          a3 = v17;
          double v16 = v14;
          double v15 = v13;
          double v13 = v36;
          double v14 = v37;
          double v11 = v35;
LABEL_20:
          if (v8 == ++v9) {
            break;
          }
          continue;
        case 2:
          objc_msgSend(v6, "curveToPoint:controlPoint1:controlPoint2:", v40, v41, v36, v37, v38, v39);
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
            id v6 = +[OITSUBezierPath bezierPath];
          }
          char v10 = 0;
LABEL_13:
          double v16 = v14;
          double v15 = v13;
          double v14 = v12;
          double v13 = v11;
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

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v14.c = v6;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (!CGAffineTransformEqualToTransform(&t1, &v14))
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
      CFRelease(sfr_path);
      self->sfr_path = 0;
    }
    *(_DWORD *)&self->sfr_bpFlags |= 1u;
  }
}

- (CGPath)CGPath
{
  [(OITSUBezierPath *)self _doPath];
  CGPoint result = (CGPath *)self->sfr_path;
  if (result)
  {
    CGPathRef v4 = CGPathRetain(result);
    return (CGPath *)CFAutorelease(v4);
  }
  return result;
}

- (BOOL)isTriangular
{
  int64_t v3 = [(OITSUBezierPath *)self elementCount];
  if (v3)
  {
    int64_t v4 = v3;
    int64_t v5 = v3 - 1;
    if ([(OITSUBezierPath *)self elementAtIndex:v3 - 1]) {
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
  BOOL v7 = [(OITSUBezierPath *)self isFlat];
  BOOL result = 0;
  if (v7 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v9 = 1;
    while ([(OITSUBezierPath *)self elementAtIndex:v9] == 1)
    {
      if (v6 == ++v9)
      {
        unint64_t v10 = v6 - 1;
        goto LABEL_13;
      }
    }
    unint64_t v10 = v9 - 1;
LABEL_13:
    if ([(OITSUBezierPath *)self elementAtIndex:v6 - 1] == 3) {
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
      [(OITSUBezierPath *)self elementAtIndex:0 associatedPoints:&v16];
      [(OITSUBezierPath *)self elementAtIndex:3 associatedPoints:&v14];
      if (v16 == v14 && v17 == v15) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)isDiamond
{
  int64_t v3 = [(OITSUBezierPath *)self elementCount];
  if (!v3)
  {
    [(OITSUBezierPath *)self isFlat];
    return 0;
  }
  int64_t v4 = v3;
  int64_t v5 = v3 - 1;
  if (![(OITSUBezierPath *)self elementAtIndex:v3 - 1]) {
    int64_t v4 = v5;
  }
  BOOL v6 = [(OITSUBezierPath *)self isFlat];
  BOOL result = 0;
  if (v6 && v4 == 5)
  {
    unint64_t v8 = -5;
    uint64_t v9 = 4;
    while ([(OITSUBezierPath *)self elementAtIndex:v8 + 6] == 1)
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
    int64_t v10 = [(OITSUBezierPath *)self elementAtIndex:4];
    if (v9 != 3 || v10 == 3)
    {
      [(OITSUBezierPath *)self bounds];
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
        -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v16, &v20, v19);
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
  LODWORD(v3) = [(OITSUBezierPath *)self isFlat];
  if (v3)
  {
    int64_t v3 = [(OITSUBezierPath *)self elementCount];
    if (v3)
    {
      unint64_t v4 = v3;
      unint64_t v5 = v3 - 1;
      if ([(OITSUBezierPath *)self elementAtIndex:v3 - 1]) {
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
        while ([(OITSUBezierPath *)self elementAtIndex:v9] == 1)
        {
          if (v6 == ++v9)
          {
            unint64_t v10 = v6 - 1;
            goto LABEL_19;
          }
        }
        unint64_t v10 = v9 - 1;
LABEL_19:
        int64_t v11 = [(OITSUBezierPath *)self elementAtIndex:v6 - 1];
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
          [(OITSUBezierPath *)self bounds];
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
            [(OITSUBezierPath *)self elementAtIndex:v20 associatedPoints:v21];
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
        id v7 = [(OITSUBezierPath *)self bezierPathByRemovingRedundantElements];
        uint64_t v8 = [v7 elementCount];
        if (v8 >= [(OITSUBezierPath *)self elementCount])
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
  v26[3] = *(double *)MEMORY[0x263EF8340];
  [(OITSUBezierPath *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(OITSUBezierPath *)self elementCount];
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
      int64_t v18 = -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, v25, *(_OWORD *)&v24);
      if (v18 == 2)
      {
        if (fabs(TSUPointLength((v26[0] - v16) / v8, (v26[1] - v17) / v10) + -0.5) > 0.0001) {
          return v14;
        }
        double v20 = TSUPointOnCurve(&v24, 0.5);
        double v22 = TSUPointLength((v20 - v16) / v8, (v21 - v17) / v10);
        long long v19 = (float64x2_t *)v26;
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
        long long v19 = (float64x2_t *)v25;
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
  if ([(OITSUBezierPath *)self isEmpty]) {
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
  if ([(OITSUBezierPath *)self isEmpty]) {
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
  double v22 = size.f64[1];
  result.size.CGFloat width = size.f64[0];
  result.origin.double x = v4.x;
  result.size.CGFloat height = v22;
  result.origin.double y = y;
  return result;
}

- (CGRect)bounds
{
  if ([(OITSUBezierPath *)self isFlat])
  {
    [(OITSUBezierPath *)self controlPointBounds];
  }
  else
  {
    [(OITSUBezierPath *)self _doPath];
    sfr_path = (const CGPath *)self->sfr_path;
    if (sfr_path)
    {
      *(CGRect *)&CGFloat v3 = CGPathGetPathBoundingBox(sfr_path);
    }
    else
    {
      CGFloat v3 = *MEMORY[0x263F001A8];
      double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)isFlat
{
  return (*(unsigned char *)&self->sfr_bpFlags >> 2) & 1;
}

- (BOOL)isClockwise
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(OITSUBezierPath *)self elementCount];
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
      switch([(OITSUBezierPath *)self elementAtIndex:v5 associatedPoints:&v15])
      {
        case 0:
          double v11 = v15;
          double v10 = v16;
          double v7 = v15;
          double v8 = v16;
          break;
        case 1:
          if (v7 != v15 || v8 != v16) {
            float v9 = v7 * v16 - v8 * v15 + v9;
          }
          char v6 = 1;
          double v7 = v15;
          double v8 = v16;
          break;
        case 2:
          NSLog((NSString *)@"Warning: Path should be flat. Illegal TSUCurveToBezierPathElement.");
          break;
        case 3:
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
    int64_t v4 = [(OITSUBezierPath *)self elementAtIndex:a3 allPoints:&v9];
    switch(v4)
    {
      case 3:
        goto LABEL_5;
      case 2:
        float v8 = 0.0;
        addifclose((uint64_t)&v9, &v8);
        return v8;
      case 1:
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
  uint64_t v3 = [(OITSUBezierPath *)self elementCount];
  self->sfr_elementLength = (double *)NSZoneRealloc((NSZone *)[(OITSUBezierPath *)self zone], self->sfr_elementLength, 8 * self->sfr_elementMax);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      [(OITSUBezierPath *)self calculateLengthOfElement:i];
      self->sfr_elementLength[i] = v5;
      self->sfr_totalLength = v5 + self->sfr_totalLength;
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(OITSUBezierPath *)self calculateLengths];
  }
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(OITSUBezierPath *)self calculateLengths];
  }
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) == 0) {
    [(OITSUBezierPath *)self calculateLengths];
  }
  if (self->sfr_elementCount < a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TSUBezierPath.m", 1582, @"Invalid parameter not satisfying: %@", @"e <= sfr_elementCount");
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

- (int64_t)elementAtIndex:(int64_t)a3
{
  return [(OITSUBezierPath *)self elementAtIndex:a3 associatedPoints:0];
}

- (int64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
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

- (int64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
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

- (void)_appendToPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  sfr_head = self->sfr_head;
  int64_t sfr_elementCount = self->sfr_elementCount;
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  BOOL v8 = a4 && [a3 elementCount] > 0;
  if (sfr_elementCount >= 1)
  {
    CGPoint v9 = &sfr_head[6 * sfr_elementCount];
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          if (!v8) {
            objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          }
          BOOL v8 = 0;
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
    while (sfr_head < v9);
  }
}

- (void)appendBezierPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    [a3 _appendToPath:self skippingInitialMoveIfPossible:v4];
  }
  else
  {
    BOOL v8 = v4 && [(OITSUBezierPath *)self elementCount] > 0;
    uint64_t v9 = [a3 elementCount];
    if (v9 >= 1)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        switch([a3 elementAtIndex:i associatedPoints:&v12])
        {
          case 0:
            if (!v8) {
              -[OITSUBezierPath moveToPoint:](self, "moveToPoint:", v12, v13);
            }
            BOOL v8 = 0;
            break;
          case 1:
            -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v12, v13);
            break;
          case 2:
            -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v16, v17, v12, v13, v14, v15);
            break;
          case 3:
            [(OITSUBezierPath *)self closePath];
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

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[OITSUBezierPath moveToPoint:](self, "moveToPoint:");
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v13));
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetMaxX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v15));
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v17));
  [(OITSUBezierPath *)self closePath];
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4 = a4 - 1;
  if (a4 >= 1)
  {
    if ([(OITSUBezierPath *)self isEmpty] || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100) {
      -[OITSUBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    }
    else {
      -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    }
    if ((unint64_t)a4 >= 2)
    {
      p_CGFloat y = &a3[1].y;
      do
      {
        -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
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
  BOOL v8 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0, -45.0, 315.0);
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
  [(OITSUBezierPath *)v8 transformUsingAffineTransform:&v15];
  [(OITSUBezierPath *)self appendBezierPath:v8];
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
  -[OITSUBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", x + a4 * v18.__cosval, y + a4 * v18.__sinval, v16, v17, x + a4 * v18.__cosval + v15 * v18.__sinval, y + a4 * v18.__sinval - v15 * v18.__cosval);
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
  if ([(OITSUBezierPath *)self isEmpty]) {
    -[OITSUBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v18, v19);
  }
  else {
    -[OITSUBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v18, v19);
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
        -[OITSUBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + -1.57079633);
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
    -[OITSUBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + 1.57079633);
    double v21 = v20 - v22;
    double v15 = v15 + 1.57079633;
  }
  while (v20 - v22 > 1.57079633);
LABEL_19:
  if (v21 > 0.0)
  {
    -[OITSUBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v22, v20);
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
  [(OITSUBezierPath *)self currentPoint];
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
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v40.tx + v27 * v40.c + v40.a * v19, v32 + v40.ty + v27 * v40.d + v40.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ((containsPoint__doWindingRule & 1) == 0) {
    containsPoint__doWindingRule = 1;
  }
  [(OITSUBezierPath *)self _doPath];
  sfr_path = (const CGPath *)self->sfr_path;
  if (!sfr_path) {
    return 0;
  }
  BOOL v7 = [(OITSUBezierPath *)self windingRule] == 1;
  CGFloat v8 = x;
  CGFloat v9 = y;
  return CGPathContainsPoint(sfr_path, 0, *(CGPoint *)&v8, v7);
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    unint64_t v5 = [(OITSUBezierPath *)self windingRule];
    unint64_t v6 = [(OITSUBezierPath *)self lineCapStyle];
    unint64_t v7 = [(OITSUBezierPath *)self lineJoinStyle];
    int64_t sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      double v11 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
      NSUInteger v13 = 9 * (sfr_elementCount + 2 * self->sfr_extraSegmentCount);
      double v14 = (char *)NSZoneMalloc((NSZone *)[(OITSUBezierPath *)self zone], v13);
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
      [a3 encodeBytes:v14 length:v13 forKey:@"TSUSegments"];
      NSZoneFree((NSZone *)[(OITSUBezierPath *)self zone], v14);
    }
    if (v5)
    {
      *(float *)&double v8 = (float)v5;
      [a3 encodeFloat:@"TSUWindingRule" forKey:v8];
    }
    if (v6)
    {
      *(float *)&double v8 = (float)v6;
      [a3 encodeFloat:@"TSUCapStyle" forKey:v8];
    }
    if (v7)
    {
      *(float *)&double v8 = (float)v7;
      [a3 encodeFloat:@"TSUJoinStyle" forKey:v8];
    }
    if (self->sfr_lineWidth != 1.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"TSULineWidth");
    }
    if (self->sfr_miterLimit != 10.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"TSUMiterLimit");
    }
    if (self->sfr_flatness != 0.6) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"TSUFlatness");
    }
    if (self->sfr_dashedLineCount)
    {
      [a3 encodeDouble:@"TSUDashPhase" forKey:self->sfr_dashedLinePhase];
      NSUInteger v17 = 4 * self->sfr_dashedLineCount;
      double v18 = NSZoneMalloc((NSZone *)[(OITSUBezierPath *)self zone], v17);
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
      [a3 encodeBytes:v18 length:v17 forKey:@"TSUDashPatterns"];
      double v25 = (NSZone *)[(OITSUBezierPath *)self zone];
      NSZoneFree(v25, v19);
    }
  }
  else
  {
    float v54 = (float)(self->sfr_elementCount + 2 * self->sfr_extraSegmentCount);
    int v53 = [(OITSUBezierPath *)self windingRule];
    int v52 = [(OITSUBezierPath *)self lineCapStyle];
    int v51 = [(OITSUBezierPath *)self lineJoinStyle];
    float sfr_lineWidth = self->sfr_lineWidth;
    double sfr_flatness = self->sfr_flatness;
    float sfr_miterLimit = self->sfr_miterLimit;
    float v49 = sfr_miterLimit;
    float v50 = sfr_lineWidth;
    float v29 = sfr_flatness;
    float v47 = (float)self->sfr_dashedLineCount;
    float v48 = v29;
    [a3 encodeValueOfObjCType:"i" at:&v54];
    int64_t v30 = self->sfr_elementCount;
    if (v30 >= 1)
    {
      double v31 = self->sfr_head;
      double v32 = &v31[6 * v30];
      CGFloat v33 = (double *)self->sfr_extraSegments;
      do
      {
        uint64_t v34 = *(void *)v31;
        char v46 = *(unsigned char *)v31 & 0xF;
        if ((v34 & 0xF) == 2)
        {
          float v35 = *v33;
          float v36 = v33[1];
          float v44 = v36;
          float v45 = v35;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v46, &v45, &v44);
          float v37 = v33[2];
          float v38 = v33[3];
          float v44 = v38;
          float v45 = v37;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v46, &v45, &v44);
          v33 += 4;
        }
        float v39 = *(double *)&v31[2];
        float v40 = *(double *)&v31[4];
        float v44 = v40;
        float v45 = v39;
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v46, &v45, &v44);
        v31 += 6;
      }
      while (v31 < v32);
    }
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iiifffi", &v53, &v52, &v51, &v50, &v49, &v48, &v47);
    if (self->sfr_dashedLineCount)
    {
      float sfr_dashedLinePhase = self->sfr_dashedLinePhase;
      float v45 = sfr_dashedLinePhase;
      [a3 encodeValueOfObjCType:"f" at:&v45];
      if ((uint64_t)self->sfr_dashedLineCount >= 1)
      {
        int64_t v42 = 0;
        do
        {
          float v43 = self->sfr_dashedLinePattern[v42];
          float v45 = v43;
          [a3 encodeValueOfObjCType:"f" at:&v45];
          ++v42;
        }
        while (v42 < (int64_t)self->sfr_dashedLineCount);
      }
    }
  }
}

- (OITSUBezierPath)initWithCoder:(id)a3
{
  int64_t v4 = [(OITSUBezierPath *)self init];
  if ([a3 allowsKeyedCoding])
  {
    unint64_t v43 = 0;
    unint64_t v5 = [a3 decodeBytesForKey:@"TSUSegments" returnedLength:&v43];
    if (v5)
    {
      if (v43)
      {
        unint64_t v6 = v5 + v43;
        if (v5 < v5 + v43)
        {
          do
          {
            unint64_t v7 = v5 + 9;
            float64x2_t v8 = vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v5 + 1)));
            switch(*(unsigned char *)v5)
            {
              case 0:
                [(OITSUBezierPath *)v4 moveToPoint:*(_OWORD *)&v8];
                break;
              case 1:
                [(OITSUBezierPath *)v4 lineToPoint:*(_OWORD *)&v8];
                break;
              case 2:
                unint64_t v7 = v5 + 27;
                [(OITSUBezierPath *)v4 curveToPoint:vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v5 + 19))) controlPoint1:*(_OWORD *)&v8 controlPoint2:vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v5 + 10)))];
                break;
              case 3:
                [(OITSUBezierPath *)v4 closePath];
                break;
              default:
                break;
            }
            unint64_t v5 = v7;
          }
          while (v7 < v6);
        }
      }
    }
    -[OITSUBezierPath setWindingRule:](v4, "setWindingRule:", (int)[a3 decodeInt32ForKey:@"TSUWindingRule"]);
    -[OITSUBezierPath setLineCapStyle:](v4, "setLineCapStyle:", (int)[a3 decodeInt32ForKey:@"TSUCapStyle"]);
    -[OITSUBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", (int)[a3 decodeInt32ForKey:@"TSUJoinStyle"]);
    int v9 = [a3 containsValueForKey:@"TSULineWidth"];
    double v10 = 1.0;
    if (v9) {
      objc_msgSend(a3, "decodeDoubleForKey:", @"TSULineWidth", 1.0);
    }
    v4->float sfr_lineWidth = v10;
    int v11 = [a3 containsValueForKey:@"TSUMiterLimit"];
    double v12 = 10.0;
    if (v11) {
      objc_msgSend(a3, "decodeDoubleForKey:", @"TSUMiterLimit", 10.0);
    }
    v4->float sfr_miterLimit = v12;
    if ([a3 containsValueForKey:@"TSUFlatness"]) {
      [a3 decodeDoubleForKey:@"TSUFlatness"];
    }
    else {
      uint64_t v13 = 0x3FE3333333333333;
    }
    *(void *)&v4->double sfr_flatness = v13;
    uint64_t v20 = [a3 decodeBytesForKey:@"TSUDashPatterns" returnedLength:&v43];
    if (v20 && v43)
    {
      double v21 = (unsigned int *)v20;
      unint64_t v22 = v20 + v43;
      v4->float sfr_dashedLineCount = v43 >> 2;
      [a3 decodeDoubleForKey:@"TSUDashPhase"];
      v4->float sfr_dashedLinePhase = v23;
      unsigned int v24 = (double *)NSZoneMalloc((NSZone *)[(OITSUBezierPath *)v4 zone], 8 * v4->sfr_dashedLineCount);
      v4->sfr_dashedLinePattern = v24;
      while ((unint64_t)v21 < v22)
      {
        unsigned int v25 = *v21++;
        *v24++ = COERCE_FLOAT(bswap32(v25));
      }
    }
  }
  else
  {
    LODWORD(v43) = 0;
    char v42 = 0;
    float v41 = 0.0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v14 = [a3 versionForClassName:@"TSUBezierPath"];
    [a3 decodeValueOfObjCType:"i" at:&v43];
    if (v43)
    {
      unsigned int v15 = 0;
      do
      {
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v42, &v41, (char *)&v40 + 4);
        double v16 = v41;
        double v17 = *((float *)&v40 + 1);
        switch(v42)
        {
          case 0:
            -[OITSUBezierPath moveToPoint:](v4, "moveToPoint:", v41, *((float *)&v40 + 1));
            break;
          case 1:
            -[OITSUBezierPath lineToPoint:](v4, "lineToPoint:", v41, *((float *)&v40 + 1));
            break;
          case 2:
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v42, &v41, (char *)&v40 + 4);
            double v18 = v41;
            double v19 = *((float *)&v40 + 1);
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v42, &v41, (char *)&v40 + 4);
            v15 += 2;
            -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", v41, *((float *)&v40 + 1), v16, v17, v18, v19);
            break;
          case 3:
            [(OITSUBezierPath *)v4 closePath];
            break;
          default:
            break;
        }
        ++v15;
      }
      while (v15 < v43);
    }
    if (v14 > 523)
    {
      float sfr_lineWidth = v4->sfr_lineWidth;
      double sfr_flatness = v4->sfr_flatness;
      float sfr_miterLimit = v4->sfr_miterLimit;
      float v37 = sfr_miterLimit;
      float v38 = sfr_lineWidth;
      float v29 = sfr_flatness;
      float sfr_dashedLineCount = (float)v4->sfr_dashedLineCount;
      float v36 = v29;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifffi", &v40, &v39, (char *)&v39 + 4, &v38, &v37, &v36, &sfr_dashedLineCount);
      [(OITSUBezierPath *)v4 setWindingRule:v40];
      [(OITSUBezierPath *)v4 setLineCapStyle:v39];
      [(OITSUBezierPath *)v4 setLineJoinStyle:HIDWORD(v39)];
      v4->float sfr_lineWidth = v38;
      double v30 = v36;
      v4->float sfr_miterLimit = v37;
      v4->double sfr_flatness = v30;
      unint64_t v31 = (unint64_t)sfr_dashedLineCount;
      v4->float sfr_dashedLineCount = (unint64_t)sfr_dashedLineCount;
      if (v31)
      {
        float v34 = 0.0;
        [a3 decodeValueOfObjCType:"f" at:&v34];
        v4->float sfr_dashedLinePhase = v34;
        v4->sfr_dashedLinePattern = (double *)NSZoneMalloc((NSZone *)[(OITSUBezierPath *)v4 zone], 8 * v4->sfr_dashedLineCount);
        if (v4->sfr_dashedLineCount)
        {
          unint64_t v32 = 0;
          do
          {
            [a3 decodeValueOfObjCType:"f" at:&v34];
            v4->sfr_dashedLinePattern[v32++] = v34;
          }
          while (v32 < v4->sfr_dashedLineCount);
        }
      }
    }
    else
    {
      float v38 = 0.0;
      LOBYTE(v37) = 0;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifc", &v40, &v39, (char *)&v39 + 4, &v38, &v37);
      v4->float sfr_lineWidth = v38;
      [(OITSUBezierPath *)v4 setWindingRule:v40];
      [(OITSUBezierPath *)v4 setLineCapStyle:v39];
      [(OITSUBezierPath *)v4 setLineJoinStyle:HIDWORD(v39)];
    }
  }
  return v4;
}

- (const)cString
{
  *(void *)&v15[255] = *MEMORY[0x263EF8340];
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
        float64x2_t v8 = &v14;
        size_t v9 = 256;
      }
      else
      {
        char v14 = 32;
        float64x2_t v8 = v15;
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
          [v3 appendBytes:&v14 length:&v8[v10] - &v14];
          sfr_head += 6;
          if (sfr_head >= v6) {
            break;
          }
          continue;
        default:
          uint64_t v11 = [NSString stringWithUTF8String:"-[OITSUBezierPath cString]"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"], 2364, 0, "Unhandled path element type");
          +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_17:
          uint64_t v12 = [NSString stringWithUTF8String:"-[OITSUBezierPath cString]"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"], 2372, 0, "buffer too small for path element string");
          +[OITSUAssertionHandler logBacktraceThrottled];
          goto LABEL_18;
      }
      break;
    }
  }
LABEL_18:
  char v14 = 0;
  [v3 appendBytes:&v14 length:1];
  return (const char *)[v3 bytes];
}

- (OITSUBezierPath)initWithCString:(const char *)a3
{
  int64_t v4 = [(OITSUBezierPath *)self init];
  unint64_t v5 = v4;
  if (a3 && v4 && *a3)
  {
    int v39 = 0;
    char v38 = 0;
    while (1)
    {
      int v6 = v39;
      int v7 = a3[v39];
      if (v7 == 32)
      {
        float64x2_t v8 = &a3[v39 + 1];
        do
        {
          ++v6;
          int v9 = *(unsigned __int8 *)v8++;
          int v7 = v9;
        }
        while (v9 == 32);
      }
      int v39 = v6 + 1;
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
            uint64_t v30 = [NSString stringWithUTF8String:"-[OITSUBezierPath initWithCString:]"];
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"], 2416, 0, "kCGPathElementAddQuadCurveToPoint not supported yet");
            +[OITSUAssertionHandler logBacktraceThrottled];
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            float v32 = v31;
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            float v34 = v33;
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            double v15 = v32;
            double v13 = v34;
            char v14 = v5;
            goto LABEL_31;
          }
          if ((char)v7 != 109)
          {
LABEL_35:
            uint64_t v37 = [NSString stringWithUTF8String:"-[OITSUBezierPath initWithCString:]"];
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"], 2446, 0, "Bezier path string contained unknown elmt.");
            +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_33:
            uint64_t v35 = [NSString stringWithUTF8String:"-[OITSUBezierPath initWithCString:]"];
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"], 2452, 0, "Something is wrong with this bezier path!");
            +[OITSUAssertionHandler logBacktraceThrottled];
            return v5;
          }
LABEL_27:
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v17 = v16;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          -[OITSUBezierPath moveToPoint:](v5, "moveToPoint:", v17, v18);
          goto LABEL_32;
        }
        if ((char)v7 == 99)
        {
LABEL_28:
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v20 = v19;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v22 = v21;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v24 = v23;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v26 = v25;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v28 = v27;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", v28, v29, v20, v22, v24, v26);
          goto LABEL_32;
        }
        if ((char)v7 != 101)
        {
          if ((char)v7 != 108) {
            goto LABEL_35;
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
              goto LABEL_35;
            }
LABEL_29:
            [(OITSUBezierPath *)v5 closePath];
            goto LABEL_32;
          }
          goto LABEL_27;
        }
        if ((char)v7 == 67) {
          goto LABEL_28;
        }
        if ((char)v7 != 69)
        {
          if ((char)v7 != 76) {
            goto LABEL_35;
          }
LABEL_19:
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          float v11 = v10;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          double v13 = v12;
          char v14 = v5;
          double v15 = v11;
LABEL_31:
          -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", v15, v13);
        }
      }
LABEL_32:
      if (v38) {
        goto LABEL_33;
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
    int v9 = (PATHSEGMENT *)NSZoneRealloc((NSZone *)[(OITSUBezierPath *)self zone], self->sfr_head, 24 * self->sfr_elementMax);
    if (v9) {
      self->sfr_head = v9;
    }
    else {
      NSLog((NSString *)@"ERROR: TSUBezierPath _addPathSegment. sfr_head could not NSZoneRealloc. No memory");
    }
    if ((*((unsigned char *)&self->sfr_bpFlags + 1) & 4) != 0)
    {
      float v10 = (double *)NSZoneRealloc((NSZone *)[(OITSUBezierPath *)self zone], self->sfr_elementLength, 8 * self->sfr_elementMax);
      if (v10) {
        self->sfr_elementLength = v10;
      }
      else {
        NSLog((NSString *)@"ERROR: TSUBezierPath _addPathSegment. sfr_elementLength could not NSZoneRealloc. No memory");
      }
    }
  }
  *(void *)&self->sfr_head[6 * self->sfr_elementCount] = *(void *)&self->sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
  *(void *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
  int64_t v11 = self->sfr_elementCount;
  float v12 = &self->sfr_head[6 * v11];
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
    [(OITSUBezierPath *)self lengthOfElement:self->sfr_elementCount - 1];
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
  -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
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
  -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  int64_t sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    self->sfr_extraSegmentMaCGFloat x = 2 * sfr_extraSegmentCount + 10;
    int64_t v11 = NSZoneRealloc((NSZone *)[(OITSUBezierPath *)self zone], self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
    if (v11) {
      self->sfr_extraSegments = v11;
    }
    else {
      NSLog((NSString *)@"ERROR: TSUBezierPath _deviceCurveToPoint sfr_extraSegments could not NSZoneRealloc. No memory");
    }
  }
  int64_t v12 = self->sfr_extraSegmentCount;
  double v13 = (CGFloat *)((char *)self->sfr_extraSegments + 32 * v12);
  *double v13 = v8;
  v13[1] = v7;
  v13[2] = x;
  v13[3] = y;
  self->int64_t sfr_extraSegmentCount = v12 + 1;
  char v14 = &self->sfr_head[6 * self->sfr_elementCount];
  *(void *)&v14[-6] = *(void *)&v14[-6] & 0xFLL | (16 * v12);
  LODWORD(v14) = self->sfr_bpFlags;
  self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(v14 & 0xFFFFFCFB | 0x200);
  if (((unsigned __int16)v14 & 0x400) != 0)
  {
    [(OITSUBezierPath *)self lengthOfElement:self->sfr_elementCount - 1];
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
      uint64_t v4 = [NSString stringWithUTF8String:"-[OITSUBezierPath(TSUBezierPathDevicePrimitives) _deviceClosePath]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"], 2614, 0, "Invalid parameter not satisfying: %{public}s", "sfr_lastSubpathIndex >= 0");
      +[OITSUAssertionHandler logBacktraceThrottled];
      sfr_lastSubpathIndeCGFloat x = self->sfr_lastSubpathIndex;
    }
    -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 2], *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 4]);
    unint64_t v5 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v5[2], *(double *)&v5[4]);
    self->sfr_lastSubpathIndeCGFloat x = self->sfr_elementCount - 1;
    self->$7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"TSUBezierPath <%p>", self);
  if (![(OITSUBezierPath *)self isEmpty])
  {
    [(OITSUBezierPath *)self bounds];
    [v3 appendFormat:@"\n  Bounds: %@", NSStringFromCGRect(v16)];
    [(OITSUBezierPath *)self controlPointBounds];
    [v3 appendFormat:@"\n  Control point bounds: %@", NSStringFromCGRect(v17)];
    uint64_t v4 = [(OITSUBezierPath *)self elementCount];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        switch([(OITSUBezierPath *)self elementAtIndex:i associatedPoints:v12])
        {
          case 0:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f moveto", v12[0], v8, v9, v10, v11);
            break;
          case 1:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f lineto", v12[0], v8, v9, v10, v11);
            break;
          case 2:
            objc_msgSend(v3, "appendFormat:", @"\n    %f %f %f %f %f %f curveto", v12[0], v12[1], v13, v14);
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

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(int)a6 startNewPath:(BOOL)a7
{
  BOOL v34 = a7;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v39 = *MEMORY[0x263EF8340];
  CGFloat MidX = CGRectGetMidX(a3);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v15 = CGRectGetWidth(v41) * 0.5;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v42) * 0.5;
  if (a6 == 1)
  {
    TSUEllipseParametricAngleWithPolarAngle(a4, v15, v16);
    double v17 = v19;
    TSUEllipseParametricAngleWithPolarAngle(a4 + a5, v15, v16);
    double v18 = v20;
  }
  else
  {
    if (a6) {
      double v17 = 0.0;
    }
    else {
      double v17 = a4;
    }
    if (a6) {
      double v18 = 0.0;
    }
    else {
      double v18 = a4 + a5;
    }
  }
  id v21 = +[OITSUBezierPath bezierPath];
  objc_msgSend(v21, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v17 > v18, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0, v17, v18);
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformMakeScale(&t1, v15, v16);
  CGAffineTransformMakeTranslation(&t2, MidX, MidY);
  CGAffineTransformConcat(&v37, &t1, &t2);
  CGAffineTransform v38 = v37;
  [v21 transformUsingAffineTransform:&v38];
  uint64_t v22 = [v21 elementCount];
  if (v22 >= 1)
  {
    uint64_t v23 = v22;
    for (uint64_t i = 0; i != v23; ++i)
    {
      memset(&v38, 0, sizeof(v38));
      switch([v21 elementAtIndex:i associatedPoints:&v38])
      {
        case 0:
          if (i)
          {
            uint64_t v25 = [NSString stringWithUTF8String:"-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"];
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m"], 104, 0, "Only the first element of the arc should be a moveto");
            +[OITSUAssertionHandler logBacktraceThrottled];
          }
          if (v34) {
            [(OITSUBezierPath *)self moveToPoint:*(_OWORD *)&v38.a];
          }
          else {
            [(OITSUBezierPath *)self lineToPoint:*(_OWORD *)&v38.a];
          }
          break;
        case 1:
          uint64_t v26 = [NSString stringWithUTF8String:"-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"];
          uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m"];
          uint64_t v28 = v26;
          uint64_t v29 = 112;
          uint64_t v30 = "The arc shouldn't contain lineto elements";
          goto LABEL_19;
        case 2:
          [(OITSUBezierPath *)self curveToPoint:*(_OWORD *)&v38.tx controlPoint1:*(_OWORD *)&v38.a controlPoint2:*(_OWORD *)&v38.c];
          break;
        case 3:
          uint64_t v31 = [NSString stringWithUTF8String:"-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"];
          uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m"];
          uint64_t v28 = v31;
          uint64_t v29 = 118;
          uint64_t v30 = "The arc shouldn't contain close_subpath elements";
LABEL_19:
          +[OITSUAssertionHandler handleFailureInFunction:v28 file:v27 lineNumber:v29 isFatal:0 description:v30];
          +[OITSUAssertionHandler logBacktraceThrottled];
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
  v29.origin.double x = v15;
  v29.origin.double y = v14;
  CGFloat v26 = height;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v29);
  double v19 = atan2(v10 - MidY, v11 - MidX) * 180.0 / 3.14159265;
  double v20 = atan2(y - MidY, x - MidX) * 180.0 / 3.14159265;
  if (a6)
  {
    if (a6 == 1)
    {
      if (v19 < v20)
      {
        double v21 = width;
        double v22 = v26;
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
      uint64_t v25 = [NSString stringWithUTF8String:"-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m"], 141, 0, "Unexpected angle sign");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    double v21 = width;
    double v22 = v26;
    double v23 = v15;
    double i = v14;
    goto LABEL_12;
  }
  double v21 = width;
  double v22 = v26;
  double v23 = v15;
  for (i = v14; v20 < v19; double v20 = v20 + 360.0)
    ;
LABEL_12:
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](self, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, v7, v23, i, v21, v22, v19, v20 - v19);
}

- (void)attachBezierPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 elementCount];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    BOOL v7 = (long long *)MEMORY[0x263F00148];
    do
    {
      long long v10 = *v7;
      long long v11 = v10;
      long long v12 = v10;
      switch([v4 elementAtIndex:v6 associatedPoints:&v10])
      {
        case 0:
          if (v6
            || [(OITSUBezierPath *)self isEmpty]
            || ([(OITSUBezierPath *)self currentPoint], vabdd_f64(v9, *(double *)&v10) >= 0.001)
            || vabdd_f64(v8, *((double *)&v10 + 1)) >= 0.001)
          {
            [(OITSUBezierPath *)self moveToPoint:v10];
          }
          break;
        case 1:
          [(OITSUBezierPath *)self lineToPoint:v10];
          break;
        case 2:
          [(OITSUBezierPath *)self curveToPoint:v12 controlPoint1:v10 controlPoint2:v11];
          break;
        case 3:
          [(OITSUBezierPath *)self closePath];
          break;
        default:
          break;
      }
      ++v6;
    }
    while (v5 != v6);
  }
}

@end