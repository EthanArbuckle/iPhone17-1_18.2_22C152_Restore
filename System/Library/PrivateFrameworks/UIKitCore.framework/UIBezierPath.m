@interface UIBezierPath
+ (BOOL)supportsSecureCoding;
+ (UIBezierPath)bezierPath;
+ (UIBezierPath)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
+ (UIBezierPath)bezierPathWithCGPath:(CGPathRef)CGPath;
+ (UIBezierPath)bezierPathWithOvalInRect:(CGRect)rect;
+ (UIBezierPath)bezierPathWithRect:(CGRect)rect;
+ (UIBezierPath)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
+ (id)_bezierPathWithArcRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
+ (id)_bezierPathWithPillRect:(CGRect)a3 cornerRadius:(double)a4;
+ (id)_bezierPathWithRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadius:(double)a5;
+ (id)_continuousRoundedCARectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(CGSize)a5 segments:(int)a6;
+ (id)_continuousRoundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadii:(id)a5 segments:(int)a6 smoothPillShapes:(BOOL)a7 clampCornerRadii:(BOOL)a8;
+ (id)_continuousRoundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(CGSize)a5 segments:(int)a6;
+ (id)_roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(double)a5 segments:(int)a6;
+ (id)_roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(double)a5 segments:(int)a6 legacyCorners:(BOOL)a7;
+ (id)roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 withCornerRadii:(id)a5;
+ (id)roundedRectBezierPath:(CGRect)a3 withRoundedEdges:(unint64_t)a4;
+ (id)roundedRectBezierPath:(CGRect)a3 withTopCornerRadius:(double)a4 withBottomCornerRadius:(double)a5;
+ (id)shadowBezierPath:(CGRect)a3 withRoundedEdges:(unint64_t)a4;
- (BOOL)_hasContinuousCorners;
- (BOOL)_isRoundedRect;
- (BOOL)containsPoint:(CGPoint)point;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesEvenOddFillRule;
- (CGFloat)flatness;
- (CGFloat)lineWidth;
- (CGFloat)miterLimit;
- (CGLineCap)lineCapStyle;
- (CGLineJoin)lineJoinStyle;
- (CGPath)_createMutablePathByDecodingData:(id)a3;
- (CGPath)_mutablePath;
- (CGPath)_pathRef;
- (CGPathRef)CGPath;
- (CGPoint)currentPoint;
- (CGRect)bounds;
- (UIBezierPath)bezierPathByReversingPath;
- (UIBezierPath)init;
- (UIBezierPath)initWithCoder:(NSCoder *)coder;
- (double)_cornerRadius;
- (id)_bezierPathConvertedFromCoordinateSpace:(id)a3 toCoordinateSpace:(id)a4;
- (id)_initWithCGMutablePath:(CGPath *)a3;
- (id)_objcCodeDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_cornerMask;
- (void)_addRoundedCornerWithTrueCorner:(CGPoint)a3 radius:(CGSize)a4 corner:(unint64_t)a5 clockwise:(BOOL)a6;
- (void)_addRoundedCornerWithTrueCorner:(CGPoint)a3 radius:(CGSize)a4 corner:(unint64_t)a5 clockwise:(BOOL)a6 leadInIsContinuous:(BOOL)a7 leadOutIsContinuous:(BOOL)a8;
- (void)_invalidatePathMetadata;
- (void)_invalidatePathMetadataIncludingCornerRadius:(BOOL)a3;
- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
- (void)addClip;
- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
- (void)addLineToPoint:(CGPoint)point;
- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
- (void)appendBezierPath:(id)a3;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7;
- (void)appendBezierPathWithOvalInRect:(CGRect)a3;
- (void)appendBezierPathWithOvalInRect:(CGRect)a3 transform:(CGAffineTransform *)a4;
- (void)appendBezierPathWithRect:(CGRect)a3;
- (void)appendPath:(UIBezierPath *)bezierPath;
- (void)applyTransform:(CGAffineTransform *)transform;
- (void)closePath;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fill;
- (void)fillWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void)getLineDash:(CGFloat *)pattern count:(NSInteger *)count phase:(CGFloat *)phase;
- (void)moveToPoint:(CGPoint)point;
- (void)removeAllPoints;
- (void)setCGPath:(CGPathRef)CGPath;
- (void)setFlatness:(CGFloat)flatness;
- (void)setLineCapStyle:(CGLineCap)lineCapStyle;
- (void)setLineDash:(const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;
- (void)setLineJoinStyle:(CGLineJoin)lineJoinStyle;
- (void)setLineWidth:(CGFloat)lineWidth;
- (void)setMiterLimit:(CGFloat)miterLimit;
- (void)setUsesEvenOddFillRule:(BOOL)usesEvenOddFillRule;
- (void)stroke;
- (void)strokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
@end

@implementation UIBezierPath

- (void)setLineWidth:(CGFloat)lineWidth
{
  self->_lineWidth = lineWidth;
}

+ (id)_continuousRoundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadii:(id)a5 segments:(int)a6 smoothPillShapes:(BOOL)a7 clampCornerRadii:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double v14 = a3.origin.x;
  id v16 = a5;
  Mutable = CGPathCreateMutable();
  unsigned int v18 = (a6 >> 1) & 1;
  if ((~a6 & 0xD) != 0) {
    unsigned int v18 = 0;
  }
  if ((a6 & 0x10) != 0) {
    int v19 = 1;
  }
  else {
    int v19 = v18;
  }
  v101 = (objc_class *)a1;
  BOOL v104 = v9;
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v20 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    goto LABEL_9;
  }
  int v71 = _UIInternalPreference_EnableCGPathContinuousRoundedRect;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableCGPathContinuousRoundedRect) {
    goto LABEL_9;
  }
  while (1)
  {
    double v72 = height;
    int v73 = v19;
    if (v20 < v71) {
      break;
    }
    _UIInternalPreferenceSync(v20, &_UIInternalPreference_EnableCGPathContinuousRoundedRect, @"EnableCGPathContinuousRoundedRect", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    int v71 = _UIInternalPreference_EnableCGPathContinuousRoundedRect;
    if (v20 == _UIInternalPreference_EnableCGPathContinuousRoundedRect) {
      goto LABEL_9;
    }
  }
  if (!byte_1EB25757C) {
    goto LABEL_9;
  }
  v74 = [v16 objectAtIndex:0];
  [v74 CGSizeValue];
  double v76 = v75;

  v77 = [v16 objectAtIndex:0];
  [v77 CGSizeValue];
  double v112 = v78;

  char v79 = v19 ^ 1;
  if (a4 != -1) {
    char v79 = 1;
  }
  if ((v79 & 1) != 0 || v76 != v112)
  {
LABEL_9:
    char v100 = v19;
    int v21 = v19 ^ 1;
    if ((a6 & 4) != 0) {
      int v22 = 0;
    }
    else {
      int v22 = v21;
    }
    char v98 = v22;
    if (a6) {
      int v22 = 0;
    }
    v23 = (double *)MEMORY[0x1E4F1DB30];
    if ((a4 & 1) == 0 || v22)
    {
      double v26 = *MEMORY[0x1E4F1DB30];
      double v29 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      v24 = [v16 objectAtIndex:0];
      [v24 CGSizeValue];
      double v26 = v25 * 1.528665;
      v27 = [v16 objectAtIndex:0];
      [v27 CGSizeValue];
      double v29 = v28 * 1.528665;
    }
    if (a6) {
      int v30 = 0;
    }
    else {
      int v30 = v21;
    }
    if ((a6 & 8) != 0) {
      int v31 = 0;
    }
    else {
      int v31 = v30;
    }
    if ((a4 & 2) == 0 || v31)
    {
      double v109 = *v23;
      double v106 = v23[1];
    }
    else
    {
      v32 = [v16 objectAtIndex:1];
      [v32 CGSizeValue];
      double v109 = v33 * 1.528665;
      v34 = [v16 objectAtIndex:1];
      [v34 CGSizeValue];
      double v106 = v35 * 1.528665;
    }
    if ((a6 & 8) != 0) {
      int v36 = 0;
    }
    else {
      int v36 = v21;
    }
    if ((a6 & 2) != 0) {
      int v37 = 0;
    }
    else {
      int v37 = v36;
    }
    if ((a4 & 8) == 0 || v37)
    {
      double v107 = v23[1];
      double v108 = *v23;
    }
    else
    {
      v38 = [v16 objectAtIndex:3];
      [v38 CGSizeValue];
      double v108 = v39 * 1.528665;
      v40 = [v16 objectAtIndex:3];
      [v40 CGSizeValue];
      double v107 = v41 * 1.528665;
    }
    if ((a6 & 2) != 0) {
      int v21 = 0;
    }
    if ((a6 & 4) != 0) {
      int v42 = 0;
    }
    else {
      int v42 = v21;
    }
    if ((a4 & 4) == 0 || v42)
    {
      double v47 = v23[1];
      double v111 = *v23;
      if (!v8) {
        goto LABEL_46;
      }
    }
    else
    {
      v43 = [v16 objectAtIndex:2];
      [v43 CGSizeValue];
      double v111 = v44 * 1.528665;
      v45 = [v16 objectAtIndex:2];
      [v45 CGSizeValue];
      double v47 = v46 * 1.528665;

      if (!v8)
      {
LABEL_46:
        double v102 = v29;
        BOOL v48 = 0;
        BOOL v49 = 0;
        int v50 = 3;
        int v51 = 3;
        int v52 = 3;
        int v53 = 3;
        goto LABEL_58;
      }
    }
    if (v26 + v109 >= width)
    {
      double v26 = width * 0.5;
      int v51 = 2;
      int v50 = 1;
      double v109 = width * 0.5;
      int v54 = 1;
    }
    else
    {
      int v54 = 0;
      int v50 = 3;
      int v51 = 3;
    }
    if (v108 + v111 >= width)
    {
      int v53 = 2;
      int v52 = 1;
      double v108 = width * 0.5;
      double v111 = width * 0.5;
      int v54 = 1;
    }
    else
    {
      int v52 = 3;
      int v53 = 3;
    }
    BOOL v49 = v29 + v47 >= height;
    if (v29 + v47 >= height)
    {
      double v29 = height * 0.5;
      v50 &= 2u;
      v53 &= 1u;
      double v47 = height * 0.5;
    }
    double v102 = v29;
    BOOL v48 = v54 != 0;
    if (v106 + v107 >= height)
    {
      v51 &= 1u;
      v52 &= 2u;
      BOOL v49 = 1;
      double v106 = height * 0.5;
      double v107 = height * 0.5;
    }
LABEL_58:
    int v96 = v50;
    int v55 = v51 | v53 | v50 | v52;
    BOOL v56 = v104;
    if (!v55) {
      BOOL v56 = 0;
    }
    double v57 = v14 + width;
    double v58 = y + height;
    double v97 = v47;
    if (v48 && v56)
    {
      double x = v14 + v111 * 0.05;
      double v59 = v14 + v26 * 0.05;
      double v60 = v57 - v108 * 0.05;
      double v57 = v57 - v109 * 0.05;
      double v61 = y;
    }
    else
    {
      if (v49 && v56)
      {
        double v61 = y + v106 * 0.05;
        double y = y + v102 * 0.05;
        double v62 = v47 * 0.05;
        double v63 = v58 - v107 * 0.05;
        double v58 = v58 - v62;
        double v59 = v14;
        double x = v14;
        double v60 = v57;
        if (v30)
        {
LABEL_69:
          double v99 = v26;
          double v105 = y;
          double v65 = *v23;
          double v64 = v23[1];
          if (v109 != *v23 || v106 != v64)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, v57 - v109, v61);
            }
            _addContinuousCornerToPath(Mutable, 2, v51, 0, v55 == 0, v57, v61, v109, v106);
          }
          if ((v36 & 1) == 0)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, v57, v106 + v61);
            }
            CGPathAddLineToPoint(Mutable, 0, v60, v63 - v107);
          }
          if (v108 != v65 || v107 != v64)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, v60 - v108, v63);
            }
            _addContinuousCornerToPath(Mutable, 8, v52, 0, v55 == 0, v60, v63, v108, v107);
          }
          if ((v21 & 1) == 0)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, v60 - v108, v63);
            }
            CGPathAddLineToPoint(Mutable, 0, v111 + x, v58);
          }
          if (v111 != v65 || v97 != v64)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, v111 + x, v58);
            }
            _addContinuousCornerToPath(Mutable, 4, v53, 0, v55 == 0, x, v58, v111, v97);
          }
          if ((v98 & 1) == 0)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, x, v58 - v97);
            }
            CGPathAddLineToPoint(Mutable, 0, v59, v102 + v105);
          }
          if (v99 != v65 || v102 != v64)
          {
            if ((v100 & 1) == 0) {
              CGPathMoveToPoint(Mutable, 0, v59, v102 + v105);
            }
            _addContinuousCornerToPath(Mutable, 1, v96, 0, v55 == 0, v59, v105, v99, v102);
          }
          CGPathAddLineToPoint(Mutable, 0, v99 + v59, v105);
          uint64_t v66 = [[v101 alloc] _initWithCGMutablePath:Mutable];
          CFRelease(Mutable);
          *(unsigned char *)(v66 + 89) = 1;
          v67 = [v16 objectAtIndex:0];
          [v67 CGSizeValue];
          *(void *)(v66 + 96) = v68;

          *(unsigned char *)(v66 + 104) = v55 != 0;
          unint64_t v69 = a4 & 0xF;
          goto LABEL_102;
        }
LABEL_68:
        CGPathMoveToPoint(Mutable, 0, v26 + v59, y);
        CGPathAddLineToPoint(Mutable, 0, v57 - v109, v61);
        goto LABEL_69;
      }
      double v61 = y;
      double v59 = v14;
      double x = v14;
      double v60 = v57;
    }
    double v63 = v58;
    if (v30) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
  v80 = [v16 objectAtIndex:1];
  [v80 CGSizeValue];
  if (v76 != v81)
  {
LABEL_128:

    int v19 = v73;
    goto LABEL_9;
  }
  v82 = [v16 objectAtIndex:1];
  [v82 CGSizeValue];
  if (v112 != v83)
  {
LABEL_127:

    goto LABEL_128;
  }
  v84 = objc_msgSend(v16, "objectAtIndex:", 2, v112);
  [v84 CGSizeValue];
  if (v76 != v85)
  {
LABEL_126:

    goto LABEL_127;
  }
  v86 = [v16 objectAtIndex:2];
  [v86 CGSizeValue];
  if (v112 != v87)
  {
LABEL_125:

    goto LABEL_126;
  }
  v88 = objc_msgSend(v16, "objectAtIndex:", 3, v112);
  [v88 CGSizeValue];
  if (v76 != v89)
  {

    goto LABEL_125;
  }
  v110 = [v16 objectAtIndex:3];
  [v110 CGSizeValue];
  double v91 = v90;

  BOOL v92 = v112 == v91;
  int v19 = v73;
  double height = v72;
  if (!v92) {
    goto LABEL_9;
  }
  double v93 = width * 0.5;
  double v94 = fmin(v76, fmin(width * 0.5, v72 * 0.5));
  CGPathAddContinuousRoundedRect();
  uint64_t v66 = [[v101 alloc] _initWithCGMutablePath:Mutable];
  CFRelease(Mutable);
  *(unsigned char *)(v66 + 89) = 1;
  *(double *)(v66 + 96) = v76;
  BOOL v95 = v94 > v93;
  if (v94 > v72 * 0.5) {
    BOOL v95 = 1;
  }
  *(unsigned char *)(v66 + 104) = v95;
  unint64_t v69 = 15;
LABEL_102:
  *(void *)(v66 + 112) = v69;

  return (id)v66;
}

+ (UIBezierPath)bezierPath
{
  CGMutablePathRef Mutable = CGPathCreateMutable();
  v4 = (void *)[objc_alloc((Class)a1) _initWithCGMutablePath:Mutable];
  CFRelease(Mutable);
  return (UIBezierPath *)v4;
}

- (id)_initWithCGMutablePath:(CGPath *)a3
{
  v4 = [(UIBezierPath *)self init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      path = v4->_path;
      if (path) {
        CFRelease(path);
      }
      v5->_path = (CGPath *)CFRetain(a3);
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"CGPath must be non-nil"];

      return 0;
    }
  }
  return v5;
}

- (UIBezierPath)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIBezierPath;
  v2 = [(UIBezierPath *)&v5 init];
  if (v2)
  {
    CGMutablePathRef Mutable = CGPathCreateMutable();
    UIBezierPathCommonInit(v2, Mutable);
    CFRelease(Mutable);
  }
  return v2;
}

- (void)fillWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v8);
  CGContextSetBlendMode(v8, blendMode);
  CGContextSetAlpha(v8, alpha);
  CGContextSetFlatness(v8, self->_flatness);
  CGContextAddPath(v8, self->_path);
  if (self->_usesEvenOddFillRule) {
    CGContextEOFillPath(v8);
  }
  else {
    CGContextFillPath(v8);
  }
  CGContextRestoreGState(v8);
}

- (void)dealloc
{
  lineDashPattern = self->_lineDashPattern;
  if (lineDashPattern) {
    free(lineDashPattern);
  }
  path = self->_path;
  if (path) {
    CFRelease(path);
  }
  immutablePath = self->_immutablePath;
  if (immutablePath) {
    CGPathRelease(immutablePath);
  }
  v6.receiver = self;
  v6.super_class = (Class)UIBezierPath;
  [(UIBezierPath *)&v6 dealloc];
}

+ (id)_roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(double)a5 segments:(int)a6 legacyCorners:(BOOL)a7
{
  double v8 = a5;
  char v9 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a7)
  {
    if ((~(_BYTE)a4 & 5) == 0 || (a4 & 0xA) == 0xA)
    {
      double v15 = CGRectGetHeight(a3) * 0.5;
      if (v15 <= v8) {
        double v8 = v15;
      }
    }
    if ((~v9 & 3) == 0 || (v9 & 0xC) == 0xCLL)
    {
      v47.origin.double x = x;
      v47.origin.double y = y;
      v47.size.double width = width;
      v47.size.double height = height;
      double v16 = CGRectGetWidth(v47) * 0.5;
      if (v8 >= v16) {
        double v8 = v16;
      }
    }
    v48.origin.double x = x;
    v48.origin.double y = y;
    v48.size.double width = width;
    v48.size.double height = height;
    double v17 = CGRectGetWidth(v48);
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double width = width;
    v49.size.double height = height;
    double v18 = CGRectGetHeight(v49);
    if (v17 < v18) {
      double v18 = v17;
    }
    if (v8 >= v18) {
      double v8 = v18;
    }
    CGMutablePathRef Mutable = CGPathCreateMutable();
    int v20 = Mutable;
    if ((a6 & 0x10) != 0)
    {
      unsigned int v21 = 1;
    }
    else if ((~a6 & 0xD) != 0)
    {
      unsigned int v21 = 0;
    }
    else
    {
      unsigned int v21 = (a6 >> 1) & 1;
    }
    BOOL v23 = (a6 & 4) == 0;
    if ((a6 & 4) != 0) {
      unsigned __int8 v24 = 0;
    }
    else {
      unsigned __int8 v24 = v21 ^ 1;
    }
    double v25 = 0.0;
    if (v9) {
      double v26 = v8;
    }
    else {
      double v26 = 0.0;
    }
    if (a6) {
      unsigned __int8 v27 = 0;
    }
    else {
      unsigned __int8 v27 = v21 ^ 1;
    }
    double v42 = v26;
    if ((((a6 & 1) == 0) & v24) != 0) {
      double v26 = 0.0;
    }
    double v45 = v26;
    if ((v9 & 2) != 0) {
      double v28 = v8;
    }
    else {
      double v28 = 0.0;
    }
    if ((a6 & 8) != 0) {
      int v29 = 0;
    }
    else {
      int v29 = v21 ^ 1;
    }
    if ((((a6 & 8) == 0) & v27) != 0) {
      double v30 = 0.0;
    }
    else {
      double v30 = v28;
    }
    if ((v9 & 8) != 0) {
      double v31 = v8;
    }
    else {
      double v31 = 0.0;
    }
    BOOL v32 = (a6 & 2) == 0;
    if ((a6 & 2) != 0) {
      int v33 = 0;
    }
    else {
      int v33 = v21 ^ 1;
    }
    if ((v32 & v29) != 0) {
      double v34 = 0.0;
    }
    else {
      double v34 = v31;
    }
    if ((v9 & 4) != 0) {
      double v35 = v8;
    }
    else {
      double v35 = 0.0;
    }
    double v41 = v35;
    if ((v23 & v33) == 0) {
      double v25 = v35;
    }
    double v43 = v34;
    double v44 = v25;
    if ((v27 & 1) == 0)
    {
      CGPathMoveToPoint(Mutable, 0, x + v45, y);
      CGPathAddLineToPoint(v20, 0, x + width - v28, y);
    }
    if (v30 > 0.0)
    {
      double v36 = y + v8;
      if ((v21 & 1) == 0)
      {
        CGPathMoveToPoint(v20, 0, x + width - v8, y);
        double v36 = y + v8;
      }
      CGPathAddArc(v20, 0, x + width - v8, v36, v8, 4.71238898, 6.28318531, 0);
    }
    if ((v29 & 1) == 0)
    {
      if ((v21 & 1) == 0) {
        CGPathMoveToPoint(v20, 0, x + width, y + v30);
      }
      CGPathAddLineToPoint(v20, 0, x + width, y + height - v31);
    }
    if (v43 > 0.0)
    {
      if ((v21 & 1) == 0) {
        CGPathMoveToPoint(v20, 0, x + width - v8, y + height);
      }
      CGPathAddArc(v20, 0, x + width - v8, y + height - v8, v8, 0.0, 1.57079633, 0);
    }
    if ((v33 & 1) == 0)
    {
      if (v21)
      {
        double v37 = y + height;
      }
      else
      {
        CGFloat v38 = x + width - v43;
        double v37 = y + height;
        CGPathMoveToPoint(v20, 0, v38, y + height);
      }
      CGPathAddLineToPoint(v20, 0, x + v41, v37);
    }
    if (v44 > 0.0)
    {
      if ((v21 & 1) == 0) {
        CGPathMoveToPoint(v20, 0, x + v8, y + height);
      }
      CGPathAddArc(v20, 0, x + v8, y + height - v8, v8, 1.57079633, 3.14159265, 0);
    }
    if ((v24 & 1) == 0)
    {
      if ((v21 & 1) == 0) {
        CGPathMoveToPoint(v20, 0, x, y + height - v44);
      }
      CGPathAddLineToPoint(v20, 0, x, y + v42);
    }
    if (v45 > 0.0)
    {
      double v39 = y + v8;
      if ((v21 & 1) == 0) {
        CGPathMoveToPoint(v20, 0, x, v39);
      }
      CGPathAddArc(v20, 0, x + v8, v39, v8, 3.14159265, 4.71238898, 0);
    }
    uint64_t v22 = [objc_alloc((Class)a1) _initWithCGMutablePath:v20];
    CFRelease(v20);
    *(unsigned char *)(v22 + 89) = 1;
    *(double *)(v22 + 96) = v8;
    *(unsigned char *)(v22 + 104) = 0;
    *(void *)(v22 + 112) = v9 & 0xF;
  }
  else
  {
    uint64_t v22 = objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", a4, *(void *)&a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5, a5);
  }
  return (id)v22;
}

+ (id)_continuousRoundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(CGSize)a5 segments:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17[4] = *MEMORY[0x1E4F143B8];
  v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", a5.width, a5.height);
  v17[0] = v13;
  v17[1] = v13;
  v17[2] = v13;
  v17[3] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  double v15 = objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", a4, v14, v6, 0, 1, x, y, width, height);

  return v15;
}

+ (id)_bezierPathWithRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadius:(double)a5
{
  return (id)objc_msgSend(a1, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, 16, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

+ (UIBezierPath)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  return (UIBezierPath *)objc_msgSend(a1, "_bezierPathWithRoundedRect:byRoundingCorners:cornerRadius:", -1, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, cornerRadius);
}

- (void)stroke
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v4 = 0;
  }
  else {
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v4);
  CGContextSetLineWidth(v4, self->_lineWidth);
  CGContextSetLineJoin(v4, (CGLineJoin)self->_lineJoinStyle);
  CGContextSetLineCap(v4, (CGLineCap)self->_lineCapStyle);
  CGContextSetMiterLimit(v4, self->_miterLimit);
  CGContextSetFlatness(v4, self->_flatness);
  size_t lineDashPatternCount = self->_lineDashPatternCount;
  if (lineDashPatternCount) {
    CGContextSetLineDash(v4, self->_lineDashPhase, self->_lineDashPattern, lineDashPatternCount);
  }
  CGContextAddPath(v4, self->_path);
  CGContextStrokePath(v4);
  CGContextRestoreGState(v4);
}

- (void)fill
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v4 = 0;
  }
  else {
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v4);
  CGContextSetFlatness(v4, self->_flatness);
  CGContextAddPath(v4, self->_path);
  if (self->_usesEvenOddFillRule) {
    CGContextEOFillPath(v4);
  }
  else {
    CGContextFillPath(v4);
  }
  CGContextRestoreGState(v4);
}

- (CGPathRef)CGPath
{
  BOOL immutablePathIsValid = self->_immutablePathIsValid;
  CGPathRef result = self->_immutablePath;
  if (!immutablePathIsValid)
  {
    CGPathRelease(result);
    CGPathRef result = CGPathCreateMutableCopy(self->_path);
    self->_immutablePath = result;
    self->_BOOL immutablePathIsValid = 1;
  }
  return result;
}

+ (UIBezierPath)bezierPathWithRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  uint64_t v7 = [a1 bezierPath];
  double v8 = (CGPath *)[(id)v7 _mutablePath];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGPathAddRect(v8, 0, v11);
  *(unsigned char *)(v7 + 89) = 1;
  *(void *)(v7 + 112) = 15;
  return (UIBezierPath *)(id)v7;
}

+ (UIBezierPath)bezierPathWithOvalInRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  uint64_t v7 = [a1 bezierPath];
  double v8 = (CGPath *)[(id)v7 _mutablePath];
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddEllipseInRect(v8, 0, v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (vabdd_f64(v9, CGRectGetHeight(v14)) <= 2.22044605e-16)
  {
    *(unsigned char *)(v7 + 89) = 1;
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    *(CGFloat *)(v7 + 96) = CGRectGetHeight(v15) * 0.5;
    *(unsigned char *)(v7 + 104) = 0;
    *(void *)(v7 + 112) = 15;
  }
  return (UIBezierPath *)(id)v7;
}

- (CGPath)_mutablePath
{
  return self->_path;
}

- (void)moveToPoint:(CGPoint)point
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)addLineToPoint:(CGPoint)point
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)closePath
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)addClip
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v4 = 0;
  }
  else {
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextAddPath(v4, self->_path);
  if (self->_usesEvenOddFillRule)
  {
    CGContextEOClip(v4);
  }
  else
  {
    CGContextClip(v4);
  }
}

- (CGPoint)currentPoint
{
  CGPoint CurrentPoint = CGPathGetCurrentPoint(self->_path);
  double y = CurrentPoint.y;
  double x = CurrentPoint.x;
  result.double y = y;
  result.double x = x;
  return result;
}

+ (UIBezierPath)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
{
  CGFloat y = center.y;
  CGFloat x = center.x;
  CGMutablePathRef Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, x, y, radius, startAngle, endAngle, !clockwise);
  CGRect v15 = (void *)[objc_alloc((Class)a1) _initWithCGMutablePath:Mutable];
  CFRelease(Mutable);
  return (UIBezierPath *)v15;
}

+ (id)_bezierPathWithPillRect:(CGRect)a3 cornerRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13[4] = *MEMORY[0x1E4F143B8];
  double v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", a4, a4);
  v13[0] = v9;
  v13[1] = v9;
  v13[2] = v9;
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  CGRect v11 = objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", -1, v10, 16, 1, 1, x, y, width, height);

  return v11;
}

+ (UIBezierPath)bezierPathWithCGPath:(CGPathRef)CGPath
{
  if (CGPath)
  {
    MutableCopdouble y = CGPathCreateMutableCopy(CGPath);
    objc_super v5 = (void *)[objc_alloc((Class)a1) _initWithCGMutablePath:MutableCopy];
    CFRelease(MutableCopy);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"CGPath must be non-nil"];
    objc_super v5 = 0;
  }
  return (UIBezierPath *)v5;
}

+ (id)_continuousRoundedCARectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(CGSize)a5 segments:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17[4] = *MEMORY[0x1E4F143B8];
  CGRect v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", a5.width, a5.height);
  v17[0] = v13;
  v17[1] = v13;
  v17[2] = v13;
  v17[3] = v13;
  CGRect v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  CGRect v15 = objc_msgSend(a1, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", a4, v14, v6, 0, 0, x, y, width, height);

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIBezierPath)initWithCoder:(NSCoder *)coder
{
  objc_super v5 = coder;
  if ([(NSCoder *)v5 allowsKeyedCoding])
  {
    uint64_t v6 = [(NSCoder *)v5 decodeObjectOfClass:objc_opt_class() forKey:@"UIBezierPathCGPathDataKey"];
    if ([v6 length])
    {
      CGMutablePathRef Mutable = [(UIBezierPath *)self _createMutablePathByDecodingData:v6];
      if (!Mutable)
      {

        self = 0;
LABEL_13:

        double v8 = self;
        goto LABEL_14;
      }
    }
    else
    {
      CGMutablePathRef Mutable = CGPathCreateMutable();
    }
    double v9 = Mutable;
    UIBezierPathCommonInit(self, Mutable);
    CFRelease(v9);
    unint64_t v10 = [(NSCoder *)v5 decodeIntegerForKey:@"UIBezierPathLineDashPatternCountKey"];
    self->_unint64_t lineDashPatternCount = v10;
    if (v10)
    {
      uint64_t v23 = 0;
      CGRect v11 = [(NSCoder *)v5 decodeBytesForKey:@"UIBezierPathLineDashPatternKey" returnedLength:&v23];
      unint64_t lineDashPatternCount = self->_lineDashPatternCount;
      if (v23 != 4 * lineDashPatternCount)
      {
        uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2 object:self file:@"UIBezierPath.m" lineNumber:151 description:@"decoded line dash pattern length mismatch"];

        unint64_t lineDashPatternCount = self->_lineDashPatternCount;
      }
      CGRect v13 = (double *)malloc_type_malloc(8 * lineDashPatternCount, 0x100004000313F17uLL);
      self->_lineDashPattern = v13;
      for (unint64_t i = self->_lineDashPatternCount; i; --i)
      {
        float v15 = *v11++;
        *v13++ = v15;
      }
    }
    [(NSCoder *)v5 decodeFloatForKey:@"UIBezierPathLineWidthKey"];
    self->_lineWidth = v16;
    [(NSCoder *)v5 decodeFloatForKey:@"UIBezierPathMiterLimitKey"];
    self->_miterLimit = v17;
    [(NSCoder *)v5 decodeFloatForKey:@"UIBezierPathFlatnessKey"];
    self->_flatness = v18;
    [(NSCoder *)v5 decodeFloatForKey:@"UIBezierPathLineDashPhaseKey"];
    self->_lineDashPhase = v19;
    self->_lineCapStyle = [(NSCoder *)v5 decodeIntegerForKey:@"UIBezierPathLineCapStyleKey"];
    self->_lineJoinStyle = [(NSCoder *)v5 decodeIntegerForKey:@"UIBezierPathLineJoinStyleKey"];
    self->_usesEvenOddFillRule = [(NSCoder *)v5 decodeBoolForKey:@"UIBezierPathUsesEvenOddFillRuleKey"];
    self->_isRoundedRect = [(NSCoder *)v5 decodeBoolForKey:@"UIBezierPathIsRoundedRectKey"];
    [(NSCoder *)v5 decodeFloatForKey:@"UIBezierPathCornerRadiusKey"];
    self->_cornerRadius = v20;
    self->_cornerMask = [(NSCoder *)v5 decodeIntegerForKey:@"UIBezierPathCornerMaskKey"];
    self->_hasContinuousCorners = [(NSCoder *)v5 decodeBoolForKey:@"UIBezierPathHasContinuousCornersKey"];
    self = self;
    goto LABEL_13;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498] format:@"UIBezierPath only supports keyed coding."];
  double v8 = 0;
LABEL_14:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    CGPathApply(self->_path, v5, (CGPathApplierFunction)__encodePathElementIntoData);
    [v4 encodeObject:v5 forKey:@"UIBezierPathCGPathDataKey"];
    [v4 encodeInteger:self->_lineDashPatternCount forKey:@"UIBezierPathLineDashPatternCountKey"];
    unint64_t lineDashPatternCount = self->_lineDashPatternCount;
    if (lineDashPatternCount)
    {
      uint64_t v7 = (float *)((char *)v18 - ((4 * lineDashPatternCount + 15) & 0xFFFFFFFFFFFFFFF0));
      unint64_t v8 = self->_lineDashPatternCount;
      if (v8)
      {
        lineDashPattern = self->_lineDashPattern;
        unint64_t v10 = v7;
        do
        {
          double v11 = *lineDashPattern++;
          float v12 = v11;
          *v10++ = v12;
          --v8;
        }
        while (v8);
      }
      objc_msgSend(v4, "encodeBytes:length:forKey:");
    }
    double lineWidth = self->_lineWidth;
    *(float *)&double lineWidth = lineWidth;
    [v4 encodeFloat:@"UIBezierPathLineWidthKey" forKey:lineWidth];
    double miterLimit = self->_miterLimit;
    *(float *)&double miterLimit = miterLimit;
    [v4 encodeFloat:@"UIBezierPathMiterLimitKey" forKey:miterLimit];
    double flatness = self->_flatness;
    *(float *)&double flatness = flatness;
    [v4 encodeFloat:@"UIBezierPathFlatnessKey" forKey:flatness];
    double lineDashPhase = self->_lineDashPhase;
    *(float *)&double lineDashPhase = lineDashPhase;
    [v4 encodeFloat:@"UIBezierPathLineDashPhaseKey" forKey:lineDashPhase];
    [v4 encodeInteger:self->_lineCapStyle forKey:@"UIBezierPathLineCapStyleKey"];
    [v4 encodeInteger:self->_lineJoinStyle forKey:@"UIBezierPathLineJoinStyleKey"];
    [v4 encodeBool:self->_usesEvenOddFillRule forKey:@"UIBezierPathUsesEvenOddFillRuleKey"];
    [v4 encodeBool:self->_isRoundedRect forKey:@"UIBezierPathIsRoundedRectKey"];
    double cornerRadius = self->_cornerRadius;
    *(float *)&double cornerRadius = cornerRadius;
    [v4 encodeFloat:@"UIBezierPathCornerRadiusKey" forKey:cornerRadius];
    [v4 encodeInteger:self->_cornerMask forKey:@"UIBezierPathCornerMaskKey"];
    [v4 encodeBool:self->_hasContinuousCorners forKey:@"UIBezierPathHasContinuousCornersKey"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28488] format:@"UIBezierPath only supports keyed coding."];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  MutableCopdouble y = CGPathCreateMutableCopy(self->_path);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithCGMutablePath:", MutableCopy);
  CGPathRelease(MutableCopy);
  *(double *)(v6 + 32) = self->_lineWidth;
  *(double *)(v6 + 40) = self->_miterLimit;
  *(double *)(v6 + 48) = self->_flatness;
  *(double *)(v6 + 56) = self->_lineDashPhase;
  *(void *)(v6 + 24) = self->_lineDashPatternCount;
  *(_DWORD *)(v6 + 64) = self->_lineCapStyle;
  *(_DWORD *)(v6 + 68) = self->_lineJoinStyle;
  *(unsigned char *)(v6 + 72) = self->_usesEvenOddFillRule;
  *(unsigned char *)(v6 + 89) = self->_isRoundedRect;
  *(double *)(v6 + 96) = self->_cornerRadius;
  *(unsigned char *)(v6 + 104) = self->_hasContinuousCorners;
  *(void *)(v6 + 112) = self->_cornerMask;
  unint64_t lineDashPatternCount = self->_lineDashPatternCount;
  if (lineDashPatternCount)
  {
    unint64_t v8 = malloc_type_malloc(8 * lineDashPatternCount, 0x100004000313F17uLL);
    *(void *)(v6 + 16) = v8;
    memcpy(v8, self->_lineDashPattern, 8 * self->_lineDashPatternCount);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIBezierPath *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = self;
      uint64_t v6 = [(UIBezierPath *)v5 CGPath];
      uint64_t v7 = v4;
      BOOL v8 = CGPathEqualToPath(v6, [(UIBezierPath *)v7 CGPath]);
      lineDashPattern = v5->_lineDashPattern;
      unint64_t v10 = v7->_lineDashPattern;
      if (lineDashPattern == v10)
      {
        LOBYTE(lineDashPatternCount) = 0;
      }
      else
      {
        unint64_t lineDashPatternCount = v5->_lineDashPatternCount;
        if (lineDashPatternCount == v7->_lineDashPatternCount)
        {
          if (lineDashPatternCount)
          {
            unint64_t v12 = lineDashPatternCount - 1;
            do
            {
              double v13 = *lineDashPattern++;
              double v14 = v13;
              double v15 = *v10++;
              double v16 = vabdd_f64(v14, v15);
              LOBYTE(lineDashPatternCount) = v16 > 0.00000011920929;
            }
            while (v16 <= 0.00000011920929 && v12-- != 0);
          }
        }
        else
        {
          LOBYTE(lineDashPatternCount) = 1;
        }
      }
      BOOL v18 = 0;
      float64x2_t v19 = (float64x2_t)vdupq_n_s64(0x3E80000000000000uLL);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v19, vabsq_f64(vsubq_f64(*(float64x2_t *)&v5->_lineWidth, *(float64x2_t *)&v7->_lineWidth))), (int32x4_t)vcgtq_f64(v19, vabsq_f64(vsubq_f64(*(float64x2_t *)&v5->_flatness, *(float64x2_t *)&v7->_flatness))))))) & 1) == 0&& v5->_lineCapStyle == v7->_lineCapStyle&& (lineDashPatternCount & 1) == 0&& v8)
      {
        BOOL v18 = v5->_usesEvenOddFillRule == v7->_usesEvenOddFillRule && v5->_lineJoinStyle == v7->_lineJoinStyle;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

+ (id)_bezierPathWithArcRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", -1, 16, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)appendPath:(UIBezierPath *)bezierPath
{
  CGPathAddPath(self->_path, 0, [(UIBezierPath *)bezierPath _mutablePath]);
  [(UIBezierPath *)self _invalidatePathMetadata];
}

- (void)applyTransform:(CGAffineTransform *)transform
{
  CGMutablePathRef Mutable = CGPathCreateMutable();
  CGPathAddPath(Mutable, transform, self->_path);
  CFRelease(self->_path);
  self->_path = Mutable;
  long long v6 = *(_OWORD *)&transform->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&transform->a;
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tdouble x = *(_OWORD *)&transform->tx;
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformDecompose(&v12, &v11);
  double rotation = v12.rotation;
  BOOL v9 = 1;
  if (v12.rotation == 0.0)
  {
    double width = v12.scale.width;
    double rotation = 1.0;
    if (v12.horizontalShear == 0.0 && v12.scale.width == 1.0)
    {
      double width = v12.scale.height;
      BOOL v9 = v12.scale.height != 1.0;
    }
  }
  -[UIBezierPath _invalidatePathMetadataIncludingCornerRadius:](self, "_invalidatePathMetadataIncludingCornerRadius:", v9, rotation, width);
}

- (void)removeAllPoints
{
  CFRelease(self->_path);
  self->_path = CGPathCreateMutable();
  [(UIBezierPath *)self _invalidatePathMetadata];
}

- (void)_invalidatePathMetadata
{
}

- (void)_invalidatePathMetadataIncludingCornerRadius:(BOOL)a3
{
  self->_BOOL immutablePathIsValid = 0;
  if (a3)
  {
    self->_isRoundedRect = 0;
    self->_double cornerRadius = 0.0;
    self->_hasContinuousCorners = 0;
    self->_cornerMask = 0;
  }
}

- (UIBezierPath)bezierPathByReversingPath
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t info = 0;
  CGPathApply(self->_path, &info, (CGPathApplierFunction)CountPathElements);
  if (info > 1)
  {
    uint64_t v14 = 0;
    if ((unint64_t)info < 0x41) {
      id v4 = v17;
    }
    else {
      id v4 = (char *)malloc_type_malloc(56 * info, 0x1000040577F94FBuLL);
    }
    double v15 = v4;
    CGPathApply(self->_path, &v14, (CGPathApplierFunction)RecordPathElements);
    id v3 = objc_alloc_init((Class)objc_opt_class());
    id v5 = v15;
    if (v14 >= 1)
    {
      unint64_t v6 = (unint64_t)&v15[56 * v14];
      uint64_t v7 = v15 + 56;
      BOOL v8 = v15 - 56;
      do
      {
        BOOL v9 = (double *)v5;
        id v5 = v7;
        if ((unint64_t)v7 >= v6 || !*((_DWORD *)v9 + 14))
        {
          int v10 = *(_DWORD *)v9;
          if (*(_DWORD *)v9 == 4 || (objc_msgSend(v3, "moveToPoint:", v9[1], v9[2]), (int v10 = *(_DWORD *)v9) != 0))
          {
            char v11 = 0;
            CGAffineTransformComponents v12 = (double *)v8;
            while (2)
            {
              switch(v10)
              {
                case 1:
                  objc_msgSend(v3, "addLineToPoint:", v12[1], v12[2]);
                  if ((v11 & 1) == 0) {
                    goto LABEL_18;
                  }
                  goto LABEL_15;
                case 2:
                  objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v12[1], v12[2], v12[10], v12[11]);
                  if ((v11 & 1) == 0) {
                    goto LABEL_18;
                  }
                  goto LABEL_15;
                case 3:
                  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", v12[1], v12[2], v12[12], v12[13], v12[10], v12[11]);
                  if (v11)
                  {
LABEL_15:
                    int v10 = *(_DWORD *)v12;
                    if (*(_DWORD *)v12)
                    {
                      char v11 = 1;
                      goto LABEL_25;
                    }
                    [v3 closePath];
LABEL_23:
                    char v11 = 1;
                  }
                  else
                  {
LABEL_18:
                    char v11 = 0;
                  }
LABEL_24:
                  int v10 = *(_DWORD *)v12;
LABEL_25:
                  v12 -= 7;
                  if (!v10) {
                    break;
                  }
                  continue;
                case 4:
                  objc_msgSend(v3, "moveToPoint:", v12[1], v12[2]);
                  goto LABEL_23;
                default:
                  goto LABEL_24;
              }
              break;
            }
          }
          if ((unint64_t)v5 < v6) {
            objc_msgSend(v3, "moveToPoint:", v9[8], v9[9]);
          }
        }
        uint64_t v7 = v5 + 56;
        v8 += 56;
      }
      while ((unint64_t)(v5 + 56) <= v6);
      id v5 = v15;
    }
    if (v5 != v17) {
      free(v5);
    }
  }
  else
  {
    id v3 = (id)[(UIBezierPath *)self copy];
  }
  return (UIBezierPath *)v3;
}

- (void)setCGPath:(CGPathRef)CGPath
{
  if (CGPath)
  {
    CFRelease(self->_path);
    self->_path = CGPathCreateMutableCopy(CGPath);
    [(UIBezierPath *)self _invalidatePathMetadata];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    [v5 raise:v6 format:@"CGPath must be non-nil"];
  }
}

- (BOOL)isEmpty
{
  return CGPathIsEmpty(self->_path);
}

- (CGRect)bounds
{
  return CGPathGetPathBoundingBox(self->_path);
}

- (BOOL)containsPoint:(CGPoint)point
{
  return CGPathContainsPoint(self->_path, 0, point, self->_usesEvenOddFillRule);
}

- (void)setLineDash:(const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase
{
  lineDashPattern = self->_lineDashPattern;
  if (lineDashPattern) {
    free(lineDashPattern);
  }
  if (pattern && count > 0)
  {
    int v10 = (double *)malloc_type_malloc(8 * count, 0x100004000313F17uLL);
    self->_lineDashPattern = v10;
    memcpy(v10, pattern, 8 * count);
  }
  else
  {
    count = 0;
    self->_lineDashPattern = 0;
    phase = 0.0;
  }
  self->_unint64_t lineDashPatternCount = count;
  self->_double lineDashPhase = phase;
}

- (void)getLineDash:(CGFloat *)pattern count:(NSInteger *)count phase:(CGFloat *)phase
{
  if (count) {
    *count = self->_lineDashPatternCount;
  }
  if (phase) {
    *phase = self->_lineDashPhase;
  }
  if (pattern)
  {
    lineDashPattern = self->_lineDashPattern;
    if (lineDashPattern)
    {
      for (unint64_t i = self->_lineDashPatternCount; i; --i)
      {
        uint64_t v7 = *(void *)lineDashPattern++;
        *(void *)pattern++ = v7;
      }
    }
  }
}

- (void)strokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v8);
  CGContextSetBlendMode(v8, blendMode);
  CGContextSetAlpha(v8, alpha);
  CGContextSetLineWidth(v8, self->_lineWidth);
  CGContextSetLineJoin(v8, (CGLineJoin)self->_lineJoinStyle);
  CGContextSetLineCap(v8, (CGLineCap)self->_lineCapStyle);
  CGContextSetMiterLimit(v8, self->_miterLimit);
  CGContextSetFlatness(v8, self->_flatness);
  size_t lineDashPatternCount = self->_lineDashPatternCount;
  if (lineDashPatternCount) {
    CGContextSetLineDash(v8, self->_lineDashPhase, self->_lineDashPattern, lineDashPatternCount);
  }
  CGContextAddPath(v8, self->_path);
  CGContextStrokePath(v8);
  CGContextRestoreGState(v8);
}

+ (id)roundedRectBezierPath:(CGRect)a3 withTopCornerRadius:(double)a4 withBottomCornerRadius:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGAffineTransformComponents v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  for (unsigned int i = 0; i != 4; ++i)
  {
    if (i >= 2) {
      double v14 = a5;
    }
    else {
      double v14 = a4;
    }
    double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v14, v14);
    [v12 addObject:v15];
  }
  double v16 = objc_msgSend(a1, "roundedRectBezierPath:withRoundedCorners:withCornerRadii:", -1, v12, x, y, width, height);

  return v16;
}

- (CGPath)_createMutablePathByDecodingData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (v6)
  {
    unint64_t v7 = v6;
    CGMutablePathRef Mutable = CGPathCreateMutable();
    uint64_t v9 = [v5 bytes];
    unint64_t v10 = 0;
    long long v24 = *MEMORY[0x1E4F1DAD8];
    do
    {
      uint64_t v11 = *(unsigned int *)(v9 + v10 + 4);
      uint64_t v12 = *(int *)(v9 + v10);
      long long v25 = v24;
      long long v26 = v24;
      long long v27 = v24;
      if (v12 > 3) {
        int v13 = 0;
      }
      else {
        int v13 = dword_186B96D90[v12];
      }
      unint64_t v14 = v10 + 8;
      if (v11) {
        BOOL v15 = v11 == v13;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        double v16 = (float64x2_t *)&v25;
        uint64_t v17 = v11;
        do
        {
          unint64_t v10 = v14 + 8;
          *v16++ = vcvtq_f64_f32(*(float32x2_t *)(v9 + v14));
          v14 += 8;
          --v17;
        }
        while (v17);
      }
      else
      {
        v10 += 8;
      }
      switch((int)v12)
      {
        case 0:
          if (v11 != v13)
          {
            float64x2_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
            [v19 handleFailureInMethod:a2 object:self file:@"UIBezierPath.m" lineNumber:853 description:@"incorrect number of points for path element type kCGPathElementMoveToPoint"];
          }
          CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1));
          break;
        case 1:
          if (v11 != v13)
          {
            float v20 = [MEMORY[0x1E4F28B00] currentHandler];
            [v20 handleFailureInMethod:a2 object:self file:@"UIBezierPath.m" lineNumber:857 description:@"incorrect number of points for path element type kCGPathElementAddLineToPoint"];
          }
          CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1));
          break;
        case 2:
          if (v11 != v13)
          {
            unsigned int v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:a2 object:self file:@"UIBezierPath.m" lineNumber:861 description:@"incorrect number of points for path element type kCGPathElementAddQuadCurveToPoint"];
          }
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), *(CGFloat *)&v26, *((CGFloat *)&v26 + 1));
          break;
        case 3:
          if (v11 != v13)
          {
            uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
            [v22 handleFailureInMethod:a2 object:self file:@"UIBezierPath.m" lineNumber:865 description:@"incorrect number of points for path element type kCGPathElementAddCurveToPoint"];
          }
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), *(CGFloat *)&v26, *((CGFloat *)&v26 + 1), *(CGFloat *)&v27, *((CGFloat *)&v27 + 1));
          break;
        case 4:
          if (v11 != v13)
          {
            uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
            [v23 handleFailureInMethod:a2 object:self file:@"UIBezierPath.m" lineNumber:869 description:@"incorrect number of points for path element type kCGPathElementCloseSubpath"];
          }
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
    }
    while (v10 < v7);
  }
  else
  {
    CGMutablePathRef Mutable = 0;
  }

  return Mutable;
}

- (void)_addRoundedCornerWithTrueCorner:(CGPoint)a3 radius:(CGSize)a4 corner:(unint64_t)a5 clockwise:(BOOL)a6
{
  self->_BOOL immutablePathIsValid = 0;
}

- (void)_addRoundedCornerWithTrueCorner:(CGPoint)a3 radius:(CGSize)a4 corner:(unint64_t)a5 clockwise:(BOOL)a6 leadInIsContinuous:(BOOL)a7 leadOutIsContinuous:(BOOL)a8
{
  BOOL v10 = a7;
  if (!a6)
  {
    if (a5 != 1 && a5 != 8) {
      goto LABEL_8;
    }
LABEL_7:
    BOOL v11 = a7;
    BOOL v10 = a8;
    goto LABEL_9;
  }
  if (a5 == 2 || a5 == 4) {
    goto LABEL_7;
  }
LABEL_8:
  BOOL v11 = a8;
LABEL_9:
  if (v11) {
    a4.double width = a4.width * 1.528665;
  }
  if (v10) {
    a4.double height = a4.height * 1.528665;
  }
  if (a8) {
    int v12 = a7 | 2;
  }
  else {
    int v12 = a7;
  }
  _addContinuousCornerToPath(self->_path, a5, v12, a6, 0, a3.x, a3.y, a4.width, a4.height);
  self->_BOOL immutablePathIsValid = 0;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p;", objc_opt_class(), self];
  uint64_t info = 0;
  id v4 = self;
  CGPathApply([(UIBezierPath *)v4 CGPath], &info, (CGPathApplierFunction)CountPathElements);
  uint64_t v17 = 0;
  if (info < 65) {
    id v5 = &v20;
  }
  else {
    id v5 = (char *)malloc_type_malloc(56 * info, 0x1000040577F94FBuLL);
  }
  uint64_t v18 = v5;
  CGPathApply([(UIBezierPath *)v4 CGPath], &v17, (CGPathApplierFunction)RecordPathElements);
  if (v17 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 48;
    do
    {
      [v3 appendString:@" <"];
      switch(*(_DWORD *)&v18[v7 - 48])
      {
        case 0:
          BOOL v8 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          [v3 appendFormat:@"MoveTo %@", v8];
          goto LABEL_12;
        case 1:
          BOOL v8 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          [v3 appendFormat:@"LineTo %@", v8];
          goto LABEL_12;
        case 2:
          BOOL v8 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          uint64_t v9 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 24]);
          [v3 appendFormat:@"QuadCurveTo %@ - %@", v8, v9];

LABEL_12:
          break;
        case 3:
          BOOL v10 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 40]);
          BOOL v11 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 24]);
          int v12 = NSStringFromCGPoint(*(CGPoint *)&v18[v7 - 8]);
          [v3 appendFormat:@"CurveTo %@ %@ %@", v10, v11, v12];

          break;
        case 4:
          objc_msgSend(v3, "appendFormat:", @"Close", v16);
          break;
        default:
          objc_msgSend(v3, "appendFormat:", @"Unknown %d", *(unsigned int *)&v18[v7 - 48]);
          break;
      }
      ++v6;
      uint64_t v13 = v17;
      if (v17 > v6)
      {
        [v3 appendString:@">,\n"];
        uint64_t v13 = v17;
      }
      v7 += 56;
    }
    while (v13 > v6);
  }
  [v3 appendString:@">"];
  unint64_t v14 = (void *)[v3 copy];

  return v14;
}

- (id)_objcCodeDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"UIBezierPath CGPath *path = [UIBezierPath new]\n"];;
  uint64_t info = 0;
  id v4 = self;
  CGPathApply([(UIBezierPath *)v4 CGPath], &info, (CGPathApplierFunction)CountPathElements);
  uint64_t v15 = 0;
  if (info < 65) {
    id v5 = &v18;
  }
  else {
    id v5 = (char *)malloc_type_malloc(56 * info, 0x1000040577F94FBuLL);
  }
  uint64_t v16 = v5;
  CGPathApply([(UIBezierPath *)v4 CGPath], &v15, (CGPathApplierFunction)RecordPathElements);
  if (v15 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 48;
    do
    {
      [v3 appendString:@"["];
      switch(*(_DWORD *)&v16[v7 - 48])
      {
        case 0:
          BOOL v8 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 40], *(void *)&v16[v7 - 32]];
          [v3 appendFormat:@"path moveToPoint:%@", v8];
          goto LABEL_14;
        case 1:
          BOOL v8 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 40], *(void *)&v16[v7 - 32]];
          [v3 appendFormat:@"path addLineToPoint:%@", v8];
          goto LABEL_14;
        case 2:
          BOOL v8 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 40], *(void *)&v16[v7 - 32]];
          uint64_t v9 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 24], *(void *)&v16[v7 - 16]];
          [v3 appendFormat:@"path addQuadCurveToPoint:%@ controlPoint:%@", v8, v9];
          goto LABEL_13;
        case 3:
          BOOL v8 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 40], *(void *)&v16[v7 - 32]];
          uint64_t v9 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 24], *(void *)&v16[v7 - 16]];
          BOOL v10 = [NSString stringWithFormat:@"CGPointMake(%f, %f)", *(void *)&v16[v7 - 8], *(void *)&v16[v7]];
          [v3 appendFormat:@"path addCurveToPoint:%@ controlPoint1:%@ controlPoint2:%@", v8, v9, v10];

LABEL_13:
LABEL_14:

          break;
        case 4:
          objc_msgSend(v3, "appendFormat:", @"path closePath];", v14);
          break;
        default:
          objc_msgSend(v3, "appendFormat:", @"Unknown %d", *(unsigned int *)&v16[v7 - 48]);
          break;
      }
      ++v6;
      uint64_t v11 = v15;
      if (v15 > v6)
      {
        [v3 appendString:@"];\n"];
        uint64_t v11 = v15;
      }
      v7 += 56;
    }
    while (v11 > v6);
  }
  int v12 = (void *)[v3 copy];

  return v12;
}

- (CGPath)_pathRef
{
  return self->_path;
}

- (void)appendBezierPath:(id)a3
{
  CGPathAddPath(self->_path, 0, (CGPathRef)[a3 _mutablePath]);
  [(UIBezierPath *)self _invalidatePathMetadata];
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGPathAddRect(self->_path, 0, a3);
  [(UIBezierPath *)self _invalidatePathMetadata];
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGPathAddEllipseInRect(self->_path, 0, a3);
  [(UIBezierPath *)self _invalidatePathMetadata];
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3 transform:(CGAffineTransform *)a4
{
  CGPathAddEllipseInRect(self->_path, a4, a3);
  [(UIBezierPath *)self _invalidatePathMetadata];
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  CGPathAddArc(self->_path, 0, a3.x, a3.y, a4, a5, a6, !a7);
  [(UIBezierPath *)self _invalidatePathMetadata];
}

+ (id)roundedRectBezierPath:(CGRect)a3 withRoundedEdges:(unint64_t)a4
{
  uint64_t v4 = ((uint64_t)(a4 << 62) >> 63) & 5;
  if ((a4 & 8) != 0) {
    v4 |= 0xAuLL;
  }
  if (a4) {
    v4 |= 3uLL;
  }
  if ((a4 & 4) != 0) {
    uint64_t v5 = v4 | 0xC;
  }
  else {
    uint64_t v5 = v4;
  }
  return +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", v5, 16, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.size.height * 0.5, a3.size.width * 0.5);
}

+ (id)roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 withCornerRadii:(id)a5
{
  return +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadii:segments:smoothPillShapes:clampCornerRadii:", a4, a5, 16, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)_roundedRectBezierPath:(CGRect)a3 withRoundedCorners:(unint64_t)a4 cornerRadius:(double)a5 segments:(int)a6
{
  return (id)objc_msgSend(a1, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, *(void *)&a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

- (id)_bezierPathConvertedFromCoordinateSpace:(id)a3 toCoordinateSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke;
  aBlock[3] = &unk_1E52F1478;
  id v23 = v6;
  id v24 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = _Block_copy(aBlock);
  path = self->_path;
  CGMutablePathRef Mutable = CGPathCreateMutable();
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke_2;
  uint64_t v19 = &unk_1E52F14A0;
  id v20 = v10;
  CGMutablePathRef v21 = Mutable;
  id v13 = v10;
  CGPathApplyWithBlock(path, &v16);
  uint64_t v14 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", Mutable, v16, v17, v18, v19);
  CFRelease(Mutable);

  return v14;
}

uint64_t __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertPoint:toCoordinateSpace:", *(void *)(a1 + 40));
}

void __74__UIBezierPath__bezierPathConvertedFromCoordinateSpace_toCoordinateSpace___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(double **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(*v3, v3[1]);
      id v6 = *(CGPath **)(a1 + 40);
      CGPathMoveToPoint(v6, 0, v4, v5);
      break;
    case 1:
      (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(*v3, v3[1]);
      id v9 = *(CGPath **)(a1 + 40);
      CGPathAddLineToPoint(v9, 0, v7, v8);
      break;
    case 2:
      CGFloat v10 = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(*v3, v3[1]);
      CGFloat v12 = v11;
      CGFloat v14 = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(v3[2], v3[3]);
      uint64_t v15 = *(CGPath **)(a1 + 40);
      CGPathAddQuadCurveToPoint(v15, 0, v10, v12, v14, v13);
      break;
    case 3:
      CGFloat v16 = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(*v3, v3[1]);
      CGFloat v18 = v17;
      CGFloat v19 = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(v3[2], v3[3]);
      CGFloat v21 = v20;
      CGFloat v23 = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(v3[4], v3[5]);
      id v24 = *(CGPath **)(a1 + 40);
      CGPathAddCurveToPoint(v24, 0, v16, v18, v19, v21, v23, v22);
      break;
    case 4:
      long long v25 = *(CGPath **)(a1 + 40);
      CGPathCloseSubpath(v25);
      break;
    default:
      return;
  }
}

- (BOOL)_isRoundedRect
{
  return self->_isRoundedRect;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)_hasContinuousCorners
{
  return self->_hasContinuousCorners;
}

- (unint64_t)_cornerMask
{
  return self->_cornerMask;
}

- (CGFloat)lineWidth
{
  return self->_lineWidth;
}

- (CGLineCap)lineCapStyle
{
  return self->_lineCapStyle;
}

- (void)setLineCapStyle:(CGLineCap)lineCapStyle
{
  self->_lineCapStyle = lineCapStyle;
}

- (CGLineJoin)lineJoinStyle
{
  return self->_lineJoinStyle;
}

- (void)setLineJoinStyle:(CGLineJoin)lineJoinStyle
{
  self->_lineJoinStyle = lineJoinStyle;
}

- (CGFloat)miterLimit
{
  return self->_miterLimit;
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  self->_double miterLimit = miterLimit;
}

- (CGFloat)flatness
{
  return self->_flatness;
}

- (void)setFlatness:(CGFloat)flatness
{
  self->_double flatness = flatness;
}

- (BOOL)usesEvenOddFillRule
{
  return self->_usesEvenOddFillRule;
}

- (void)setUsesEvenOddFillRule:(BOOL)usesEvenOddFillRule
{
  self->_usesEvenOddFillRule = usesEvenOddFillRule;
}

+ (id)shadowBezierPath:(CGRect)a3 withRoundedEdges:(unint64_t)a4
{
  char v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = a3.size.height * 0.5;
  if ((a4 & 2) != 0) {
    double v10 = a3.size.height * 0.5;
  }
  else {
    double v10 = 0.0;
  }
  if ((a4 & 8) != 0) {
    double v11 = a3.size.height * 0.5;
  }
  else {
    double v11 = 0.0;
  }
  CGFloat v12 = +[UIBezierPath bezierPath];
  CGFloat v13 = (CGPath *)[v12 _pathRef];
  double v14 = x + v10;
  CGPathMoveToPoint(v13, 0, v14, y);
  if ((v4 & 2) != 0)
  {
    CGPathAddArc(v13, 0, x + v9, y + v9, v9, 4.71238898, 1.57079633, 1);
    double v15 = y + height;
  }
  else
  {
    double v15 = y + height;
    CGPathAddLineToPoint(v13, 0, x, v15 + -4.0);
    objc_msgSend(v12, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + 4.0, v15 + -4.0, 4.0, 3.14159265, 1.57079633);
  }
  double v16 = x + width;
  CGPathAddLineToPoint(v13, 0, v16 - v11, v15);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(v12, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 - v9, y + v9, v9, 1.57079633, 4.71238898);
  }
  else
  {
    objc_msgSend(v12, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 + -4.0, v15 + -4.0, 4.0, 1.57079633, 0.0);
    CGPathAddLineToPoint(v13, 0, v16, y);
  }
  CGPathAddLineToPoint(v13, 0, v14, y);
  CGPathCloseSubpath(v13);
  return v12;
}

@end