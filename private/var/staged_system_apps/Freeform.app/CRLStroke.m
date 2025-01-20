@interface CRLStroke
+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible;
+ (BOOL)requiresCustomBoundsMeasurement;
+ (CRLColor)colorOnSuppressedBackgrounds;
+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4;
+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7;
+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4 pattern:(id)a5;
+ (Class)mutableClass;
+ (id)emptyStroke;
+ (id)i_newEmptyStroke;
+ (id)i_newStroke;
+ (id)stroke;
- (BOOL)canApplyDirectlyToRepRenderable;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)drawsInOneStep;
- (BOOL)drawsOutsideStrokeBounds;
- (BOOL)isDash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearlyWhite;
- (BOOL)isNullStroke;
- (BOOL)isRoundDash;
- (BOOL)needsToExtendJoinsForBoundsCalculation;
- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3;
- (BOOL)shouldAntialiasDefeat;
- (BOOL)shouldRender;
- (BOOL)supportsColor;
- (BOOL)supportsLineOptions;
- (BOOL)supportsPattern;
- (BOOL)supportsWidth;
- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3;
- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7;
- (CRLColor)color;
- (CRLColor)i_color;
- (CRLStroke)init;
- (CRLStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7;
- (CRLStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7 miterLimit:(double)a8;
- (CRLStrokePattern)i_pattern;
- (CRLStrokePattern)pattern;
- (NSString)description;
- (_CRLStrokeOutsets)outsets;
- (double)actualWidth;
- (double)dashSpacing;
- (double)horizontalMarginForSwatch;
- (double)i_actualWidth;
- (double)i_miterLimit;
- (double)i_width;
- (double)lineEndInsetAdjustment;
- (double)miterLimit;
- (double)renderedWidth;
- (double)suggestedMinimumLineWidth;
- (id)colorForCGContext:(CGContext *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)pathForLineEnd:(id)a3 wrapPath:(BOOL)a4 atPoint:(CGPoint)a5 atAngle:(double)a6 withScale:(double)a7;
- (id)pathToStrokeFromCRLBezierPath:(id)a3;
- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3;
- (id)strokeLineEnd:(id)a3;
- (unint64_t)hash;
- (unint64_t)i_cap;
- (unint64_t)i_join;
- (unint64_t)join;
- (void)applyToContext:(CGContext *)a3;
- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4;
- (void)applyToRepRenderable:(id)a3 withScale:(double)a4;
- (void)applyToShapeRenderable:(id)a3 insideStroke:(BOOL)a4 withScale:(double)a5;
- (void)applyToShapeRenderable:(id)a3 withScale:(double)a4;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)i_setActualWidth:(double)a3;
- (void)i_setCap:(unint64_t)a3;
- (void)i_setPattern:(id)a3;
- (void)i_setPatternPropertiesFromStroke:(id)a3;
- (void)i_setPropertiesFromStroke:(id)a3;
- (void)i_setWidth:(double)a3;
- (void)p_strokePathChunk:(CGPath *)a3 inContext:(CGContext *)a4 wantsInteriorStroke:(BOOL)a5;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5;
- (void)setI_color:(id)a3;
- (void)setI_join:(unint64_t)a3;
- (void)setI_miterLimit:(double)a3;
@end

@implementation CRLStroke

- (CRLStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7 miterLimit:(double)a8
{
  id v14 = a3;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CRLStroke;
  v16 = [(CRLStroke *)&v25 init];
  if (v16)
  {
    if (a4 < 0.0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF030);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A01C0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF050);
      }
      v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:]");
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 371, 0, "Stroke width (%f) should not be negative.", *(void *)&a4);
    }
    if (a4 < 0.0) {
      a4 = 0.0;
    }
    v20 = (CRLColor *)[v14 copy];
    color = v16->_color;
    v16->_color = v20;

    v16->_width = a4;
    v16->_actualWidth = a4;
    v16->_cap = a5;
    v16->_join = a6;
    v22 = (CRLStrokePattern *)[v15 copy];
    pattern = v16->_pattern;
    v16->_pattern = v22;

    v16->_miterLimit = a8;
    if ([v15 isRoundDash]) {
      v16->_cap = 1;
    }
  }

  return v16;
}

- (CRLStroke)init
{
  v3 = +[CRLColor blackColor];
  v4 = +[CRLStrokePattern solidPattern];
  v5 = [(CRLStroke *)self initWithColor:v3 width:0 cap:0 join:v4 pattern:1.0];

  return v5;
}

- (CRLStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7
{
  return [(CRLStroke *)self initWithColor:a3 width:a5 cap:a6 join:a7 pattern:a4 miterLimit:4.0];
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[CRLMutableStroke allocWithZone:a3];
  v5 = [(CRLStroke *)self color];
  [(CRLStroke *)self width];
  double v7 = v6;
  unint64_t v8 = [(CRLStroke *)self cap];
  unint64_t v9 = [(CRLStroke *)self join];
  v10 = [(CRLStroke *)self pattern];
  [(CRLStroke *)self miterLimit];
  v12 = [(CRLStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];

  [(CRLStroke *)self actualWidth];
  -[CRLStroke i_setActualWidth:](v12, "i_setActualWidth:");
  return v12;
}

- (CRLColor)color
{
  return [(CRLStroke *)self i_color];
}

+ (CRLColor)colorOnSuppressedBackgrounds
{
  return +[CRLColor blackColor];
}

+ (BOOL)requiresCustomBoundsMeasurement
{
  return 0;
}

+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible
{
  return 0;
}

- (void)i_setWidth:(double)a3
{
  if (a3 < 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF070);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0250();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF090);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke i_setWidth:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 443, 0, "Stroke width (%f) should not be negative.", *(void *)&a3);
  }
  double v8 = 0.0;
  if (a3 >= 0.0) {
    double v8 = a3;
  }
  self->_width = v8;
}

- (void)i_setCap:(unint64_t)a3
{
  if (self->_cap != a3)
  {
    if ([(CRLStroke *)self isRoundDash])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF0B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A02E0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF0D0);
      }
      v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke i_setCap:]");
      double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:455 isFatal:0 description:"Cannot change cap style on a round-dash stroke."];
    }
    else
    {
      self->_cap = a3;
    }
  }
}

- (unint64_t)join
{
  return [(CRLStroke *)self i_join];
}

- (double)miterLimit
{
  [(CRLStroke *)self i_miterLimit];
  return result;
}

- (CRLStrokePattern)pattern
{
  return [(CRLStroke *)self i_pattern];
}

- (void)i_setPattern:(id)a3
{
  id v10 = a3;
  id v4 = [(CRLStroke *)self pattern];

  v5 = v10;
  if (v4 != v10)
  {
    unsigned int v6 = [(CRLStroke *)self isRoundDash];
    double v7 = (CRLStrokePattern *)[v10 copy];
    pattern = self->_pattern;
    self->_pattern = v7;

    if ([v10 isRoundDash])
    {
      v5 = v10;
      if (v6) {
        goto LABEL_8;
      }
      uint64_t v9 = 1;
    }
    else
    {
      v5 = v10;
      if (!v6) {
        goto LABEL_8;
      }
      uint64_t v9 = 0;
    }
    [(CRLStroke *)self i_setCap:v9];
    v5 = v10;
  }
LABEL_8:
}

- (double)actualWidth
{
  [(CRLStroke *)self i_actualWidth];
  return result;
}

- (void)i_setActualWidth:(double)a3
{
  if (a3 < 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF0F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A036C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF110);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    unsigned int v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke i_setActualWidth:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 497, 0, "Actual stroke width (%f) should not be negative.", *(void *)&a3);
  }
  double v8 = 0.0;
  if (a3 >= 0.0) {
    double v8 = a3;
  }
  self->_actualWidth = v8;
}

+ (id)i_newStroke
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CRLColor blackColor];
  id v4 = +[CRLStrokePattern solidPattern];
  id v5 = [v2 initWithColor:v3 width:0 cap:0 join:v4 pattern:1.0];

  return v5;
}

+ (id)i_newEmptyStroke
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CRLColor blackColor];
  id v4 = +[CRLStrokePattern emptyPattern];
  id v5 = [v2 initWithColor:v3 width:0 cap:0 join:v4 pattern:1.0];

  return v5;
}

+ (id)stroke
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100332834;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9700 != -1) {
    dispatch_once(&qword_1016A9700, block);
  }
  id v2 = (void *)qword_1016A9708;

  return v2;
}

+ (id)emptyStroke
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033290C;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9710 != -1) {
    dispatch_once(&qword_1016A9710, block);
  }
  id v2 = (void *)qword_1016A9718;

  return v2;
}

+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  double v7 = +[CRLStrokePattern solidPattern];
  id v8 = [v6 initWithColor:v5 width:0 cap:0 join:v7 pattern:a4];

  return (CRLStroke *)v8;
}

+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4 pattern:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithColor:v8 width:0 cap:0 join:v7 pattern:a4];

  return (CRLStroke *)v9;
}

+ (CRLStroke)strokeWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithColor:v12 width:a5 cap:a6 join:v11 pattern:a4];

  return (CRLStroke *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLStroke *)a3;
  if (v4 == self) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v5 = [(id)objc_opt_class() mutableClass];
  if (v5 != [(id)objc_opt_class() mutableClass]) {
    goto LABEL_5;
  }
  unsigned int v7 = [(CRLStroke *)self supportsWidth];
  unsigned int v8 = [(CRLStroke *)v4 supportsWidth];
  if (v7)
  {
    if (!v8) {
      goto LABEL_5;
    }
    [(CRLStroke *)self width];
    double v10 = v9;
    [(CRLStroke *)v4 width];
    if (v10 != v11 && vabdd_f64(v10, v11) >= 0.00999999978) {
      goto LABEL_5;
    }
  }
  else if (v8)
  {
    goto LABEL_5;
  }
  unsigned int v12 = [(CRLStroke *)self supportsLineOptions];
  unsigned int v13 = [(CRLStroke *)v4 supportsLineOptions];
  if (v12)
  {
    if (!v13) {
      goto LABEL_5;
    }
    id v14 = [(CRLStroke *)self cap];
    if (v14 != (void *)[(CRLStroke *)v4 cap]) {
      goto LABEL_5;
    }
    id v15 = [(CRLStroke *)self join];
    if (v15 != (void *)[(CRLStroke *)v4 join]) {
      goto LABEL_5;
    }
    [(CRLStroke *)self miterLimit];
    double v17 = v16;
    [(CRLStroke *)v4 miterLimit];
    if (v17 != v18) {
      goto LABEL_5;
    }
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  unsigned int v19 = [(CRLStroke *)self supportsPattern];
  unsigned int v20 = [(CRLStroke *)v4 supportsPattern];
  if (v19)
  {
    if (!v20) {
      goto LABEL_5;
    }
    v21 = [(CRLStroke *)self pattern];
    v22 = [(CRLStroke *)v4 pattern];
    unsigned __int8 v23 = [v21 isEqual:v22];

    if ((v23 & 1) == 0) {
      goto LABEL_5;
    }
  }
  else if (v20)
  {
    goto LABEL_5;
  }
  unsigned int v24 = [(CRLStroke *)self supportsColor];
  unsigned int v25 = [(CRLStroke *)v4 supportsColor];
  if (v24)
  {
    if (v25)
    {
      color = self->_color;
      uint64_t v27 = [(CRLStroke *)v4 color];
      if (!((unint64_t)color | v27)) {
        goto LABEL_30;
      }
      v28 = (void *)v27;
      unsigned __int8 v29 = [(CRLColor *)color isEqual:v27];

      if (v29) {
        goto LABEL_30;
      }
    }
  }
  else if ((v25 & 1) == 0)
  {
LABEL_30:
    BOOL v6 = 1;
    goto LABEL_31;
  }
LABEL_5:
  BOOL v6 = 0;
LABEL_31:

  return v6;
}

- (unint64_t)hash
{
  if ([(CRLStroke *)self supportsColor]) {
    uint64_t v3 = [(CRLColor *)self->_color hash];
  }
  else {
    uint64_t v3 = 0xCBF29CE484222325;
  }
  if ([(CRLStroke *)self supportsLineOptions])
  {
    uint64_t v4 = sub_1000C8080((char *)&self->_cap, 8, v3);
    uint64_t v5 = sub_1000C8080((char *)&self->_join, 8, v4);
    uint64_t v3 = sub_1000C8080((char *)&self->_miterLimit, 8, v5);
  }
  if ([(CRLStroke *)self supportsPattern]) {
    return [(CRLStrokePattern *)self->_pattern hash] ^ v3;
  }
  return v3;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [(CRLStroke *)self pattern];
  [(CRLStroke *)self width];
  uint64_t v7 = v6;
  unsigned int v8 = [(CRLStroke *)self color];
  double v9 = sub_100457818([(CRLStroke *)self cap]);
  double v10 = sub_10045783C([(CRLStroke *)self join]);
  double v11 = +[NSString stringWithFormat:@"<%@ %p pattern=<%@>' width=%f color=<%@> cap=%@ join=%@>", v4, self, v5, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (double)renderedWidth
{
  return self->_width;
}

- (double)dashSpacing
{
  pattern = self->_pattern;
  double v4 = 0.0;
  if (pattern && (id)[(CRLStrokePattern *)pattern count] == (id)2) {
    return [(CRLStrokePattern *)self->_pattern pattern][1];
  }
  return v4;
}

- (BOOL)isDash
{
  BOOL v3 = [(CRLStrokePattern *)self->_pattern isDash];
  if (v3) {
    LOBYTE(v3) = self->_cap != 1;
  }
  return v3;
}

- (BOOL)isRoundDash
{
  BOOL v3 = [(CRLStrokePattern *)self->_pattern isRoundDash];
  if (v3) {
    LOBYTE(v3) = self->_cap == 1;
  }
  return v3;
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 0;
}

- (BOOL)needsToExtendJoinsForBoundsCalculation
{
  return 0;
}

- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3
{
  return a3;
}

- (id)pathToStrokeFromCRLBezierPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CRLStroke pathToStrokeFromCGPath:](self, "pathToStrokeFromCGPath:", [v4 CGPath]);
  id v6 = v4;
  if (v5 == [v6 CGPath])
  {
    uint64_t v7 = (CRLBezierPath *)v6;
  }
  else
  {
    uint64_t v7 = objc_alloc_init(CRLBezierPath);
    [v6 copyPathAttributesTo:v7];
    unsigned int v8 = +[CRLBezierPath bezierPathWithCGPath:v5];
    [(CRLBezierPath *)v7 appendBezierPath:v8];
  }

  return v7;
}

- (_CRLStrokeOutsets)outsets
{
  unsigned int v3 = [(CRLStroke *)self supportsWidth];
  double v4 = 0.0;
  if (v3)
  {
    [(CRLStroke *)self width];
    double v4 = v5 * 0.5;
  }
  double v6 = v4;
  double v7 = v4;
  double v8 = v4;
  result.var3 = v8;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

- (void)i_setPropertiesFromStroke:(id)a3
{
  id v4 = a3;
  double v5 = [v4 color];
  [(CRLStroke *)self setI_color:v5];

  [v4 width];
  -[CRLStroke i_setWidth:](self, "i_setWidth:");
  -[CRLStroke setI_join:](self, "setI_join:", [v4 join]);
  [v4 miterLimit];
  -[CRLStroke setI_miterLimit:](self, "setI_miterLimit:");
  [v4 actualWidth];
  -[CRLStroke i_setActualWidth:](self, "i_setActualWidth:");
  double v6 = [v4 pattern];
  [(CRLStroke *)self i_setPattern:v6];

  id v7 = [v4 cap];

  [(CRLStroke *)self i_setCap:v7];
}

- (void)i_setPatternPropertiesFromStroke:(id)a3
{
  id v4 = a3;
  -[CRLStroke setI_join:](self, "setI_join:", [v4 join]);
  [v4 miterLimit];
  -[CRLStroke setI_miterLimit:](self, "setI_miterLimit:");
  double v5 = [v4 pattern];
  [(CRLStroke *)self i_setPattern:v5];

  id v6 = [v4 cap];

  [(CRLStroke *)self i_setCap:v6];
}

- (void)applyToContext:(CGContext *)a3
{
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[CRLStroke colorForCGContext:](self, "colorForCGContext:");
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v7 CGColor]);
  double width = self->_width;
  if (v4) {
    double width = width + width;
  }
  CGContextSetLineWidth(a3, width);
  CGLineJoin v9 = sub_1000E57B8(self->_join);
  CGContextSetLineJoin(a3, v9);
  CGContextSetMiterLimit(a3, self->_miterLimit);
  unint64_t cap = self->_cap;
  [(CRLStrokePattern *)self->_pattern i_applyToContext:a3 lineWidth:&cap capStyle:self->_width * (self->_actualWidth / self->_width)];
  CGLineCap v10 = sub_1000E57B8(cap);
  CGContextSetLineCap(a3, v10);
}

- (BOOL)isNullStroke
{
  return (id)[(CRLStrokePattern *)self->_pattern patternType] == (id)2;
}

- (BOOL)shouldRender
{
  return self->_width > 0.0 && (id)[(CRLStrokePattern *)self->_pattern patternType] != (id)2;
}

- (double)lineEndInsetAdjustment
{
  return 0.5;
}

- (id)strokeLineEnd:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 identifier];
  double v5 = v4;
  if (v4 && [v4 rangeOfString:@":"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v5 substringFromIndex:[v5 rangeOfString:@":"] + 1];
    id v6 = +[CRLLineEnd lineEndWithIdentifier:v7];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)colorForCGContext:(CGContext *)a3
{
  if (sub_1004582B0((uint64_t)a3)) {
    [(id)objc_opt_class() colorOnSuppressedBackgrounds];
  }
  else {
  BOOL v4 = [(CRLStroke *)self color];
  }

  return v4;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
}

- (void)paintRect:(CGRect)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5
{
  BOOL v6 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v14);
  [(CRLStroke *)self paintPath:Mutable wantsInteriorStroke:v6 inContext:a5];

  CGPathRelease(Mutable);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5
{
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  BOOL v9 = a4;
  if ([(CRLStroke *)self shouldRender])
  {
    CGContextSaveGState(a5);
    if ((unint64_t)sub_1000D661C(a3) > 0x9C40)
    {
      unsigned int v12 = +[CRLBezierPath bezierPathWithCGPath:a3];
      unsigned int v13 = [v12 pathSplitAtSubpathBoundariesWithSoftElementLimit:40000 hardElementLimit:50000];
      CGRect v14 = [(CRLStroke *)self color];
      [v14 alphaComponent];
      double v16 = v15;

      if (v16 >= 1.0)
      {
        [(CRLStroke *)self applyToContext:a5 insideStroke:v9];
      }
      else
      {
        double v17 = [(CRLStroke *)self color];
        [v17 alphaComponent];
        CGContextSetAlpha(a5, v18);

        CGContextBeginTransparencyLayer(a5, 0);
        id v19 = [(CRLStroke *)self mutableCopy];
        unsigned int v20 = [v19 color];
        v21 = [v20 colorWithAlphaComponent:1.0];
        [v19 setColor:v21];

        [v19 applyToContext:a5 insideStroke:v9];
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v22 = v13;
      id v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v29;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v29 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = *(id *)(*((void *)&v28 + 1) + 8 * i);
            [self p_strokePathChunk:[v27 CGPath] inContext:a5 wantsInteriorStroke:v9];
          }
          id v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v24);
      }

      if (v16 < 1.0) {
        CGContextEndTransparencyLayer(a5);
      }
    }
    else
    {
      [(CRLStroke *)self applyToContext:a5 insideStroke:v9];
      [(CRLStroke *)self p_strokePathChunk:a3 inContext:a5 wantsInteriorStroke:v9];
    }
    CGContextRestoreGState(a5);
  }
}

- (void)p_strokePathChunk:(CGPath *)a3 inContext:(CGContext *)a4 wantsInteriorStroke:(BOOL)a5
{
  BOOL v5 = a5;
  CGContextSaveGState(a4);
  if (v5)
  {
    CGContextAddPath(a4, a3);
    CGContextClip(a4);
  }
  CGContextAddPath(a4, a3);
  CGContextStrokePath(a4);

  CGContextRestoreGState(a4);
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7
{
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v14 = a3;
  CGContextSaveGState(a7);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, x, y);
  CGAffineTransform v20 = v22;
  CGAffineTransformScale(&transform, &v20, a6, a6);
  CGAffineTransform v22 = transform;
  CGAffineTransform v20 = transform;
  CGAffineTransformRotate(&transform, &v20, a5);
  CGAffineTransform v22 = transform;
  [v14 endPoint];
  CGFloat v16 = -v15;
  [v14 endPoint];
  CGAffineTransform v20 = v22;
  CGAffineTransformTranslate(&transform, &v20, v16, -v17);
  CGAffineTransform v22 = transform;
  CGContextConcatCTM(a7, &transform);
  id v18 = [v14 path];
  CGContextAddPath(a7, (CGPathRef)[v18 CGPath]);

  if ([v14 isFilled])
  {
    CGContextFillPath(a7);
  }
  else
  {
    [(CRLStroke *)self width];
    CGContextSetLineWidth(a7, v19 / a6);
    CGContextSetLineJoin(a7, (CGLineJoin)[v14 lineJoin]);
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);
}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = a3;
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, x, y);
  CGAffineTransform t1 = v35;
  CGAffineTransformScale(&v34, &t1, a6, a6);
  CGAffineTransform v35 = v34;
  CGAffineTransform t1 = v34;
  CGAffineTransformRotate(&v34, &t1, a5);
  CGAffineTransform v35 = v34;
  [v13 endPoint];
  CGFloat v15 = -v14;
  [v13 endPoint];
  CGAffineTransform t1 = v35;
  CGAffineTransformTranslate(&v34, &t1, v15, -v16);
  CGAffineTransform v35 = v34;
  CGAffineTransform t1 = v34;
  long long v17 = *(_OWORD *)&a7->c;
  *(_OWORD *)&v32.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&v32.c = v17;
  *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)&a7->tx;
  CGAffineTransformConcat(&v34, &t1, &v32);
  CGAffineTransform v35 = v34;
  id v18 = [v13 path];
  double v19 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v18 CGPath]);

  CGAffineTransform v34 = v35;
  [v19 transformUsingAffineTransform:&v34];
  if ([v13 isFilled])
  {
    [v19 bounds];
  }
  else
  {
    [(CRLStroke *)self width];
    [v19 setLineWidth:];
    objc_msgSend(v19, "setLineJoinStyle:", sub_1000E57D0((int)objc_msgSend(v13, "lineJoin")));
    [v19 boundsIncludingStroke];
  }
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;

  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (id)pathForLineEnd:(id)a3 wrapPath:(BOOL)a4 atPoint:(CGPoint)a5 atAngle:(double)a6 withScale:(double)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v13 = a3;
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&v23, x, y);
  CGAffineTransform v21 = v23;
  CGAffineTransformScale(&v22, &v21, a7, a7);
  CGAffineTransform v23 = v22;
  CGAffineTransform v21 = v22;
  CGAffineTransformRotate(&v22, &v21, a6);
  CGAffineTransform v23 = v22;
  [v13 endPoint];
  CGFloat v15 = -v14;
  [v13 endPoint];
  CGAffineTransform v21 = v23;
  CGAffineTransformTranslate(&v22, &v21, v15, -v16);
  CGAffineTransform v23 = v22;
  if (a4) {
    [v13 wrapPath];
  }
  else {
  long long v17 = [v13 path];
  }
  id v18 = [v17 copy];

  CGAffineTransform v22 = v23;
  [v18 transformUsingAffineTransform:&v22];
  if ([v13 isFilled])
  {
    [v18 setLineWidth:0.0];
  }
  else
  {
    [(CRLStroke *)self width];
    [v18 setLineWidth:];
    objc_msgSend(v18, "setLineJoinStyle:", sub_1000E57D0((int)objc_msgSend(v13, "lineJoin")));
    uint64_t v19 = [v18 strokedCopy];

    id v18 = (id)v19;
  }

  return v18;
}

- (double)horizontalMarginForSwatch
{
  id v2 = [(CRLStroke *)self pattern];
  unsigned int v3 = [v2 isRoundDash];

  double result = 0.0;
  if (v3) {
    return -3.0;
  }
  return result;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CRLStroke *)self horizontalMarginForSwatch];
  double v11 = v10;
  if ([(CRLStroke *)self isNullStroke])
  {
    CGContextSaveGState(a4);
    float v12 = (height + -35.0) * 0.5;
    CGFloat v13 = y + floorf(v12) + 0.5;
    CGFloat v14 = width + v11 * -2.0 + -1.0;
    CGFloat v15 = [(CRLStroke *)self color];
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v15 CGColor]);

    *(_OWORD *)lengths = xmmword_101177CE0;
    CGContextSetLineWidth(a4, 1.0);
    CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
    v41.origin.double x = x + v11 + 0.5;
    v41.origin.double y = v13;
    v41.size.double width = v14;
    v41.size.double height = 35.0;
    CGContextStrokeRect(a4, v41);
    CGContextRestoreGState(a4);
    double v16 = [(CRLStroke *)self color];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v16 CGColor]);

    long long v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"NONE_STROKE_LABEL" value:@"None" table:0];

    UIGraphicsPushContext(a4);
    uint64_t v19 = +[UIFont boldSystemFontOfSize:16.0];
    NSAttributedStringKey v37 = NSFontAttributeName;
    v38 = v19;
    double v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    [v18 sizeWithAttributes:v20];
    *(float *)&double v21 = (v14 - v21) * 0.5;
    *(float *)&double v22 = (35.0 - v22) * 0.5;
    [v18 drawAtPoint:v20 withAttributes:x + v11 + 0.5 + floorf(*(float *)&v21), v13 + floorf(*(float *)&v22)];
    UIGraphicsPopContext();
  }
  else
  {
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    *(void *)&CGFloat v23 = (unint64_t)CGRectInset(v42, v11, 0.0);
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    double MidY = CGRectGetMidY(v43);
    [(CRLStroke *)self width];
    CGFloat v26 = MidY + v25 * -0.5;
    [(CRLStroke *)self width];
    CGFloat v28 = v27;
    double v29 = [(CRLStroke *)self pattern];
    [(CRLStroke *)self width];
    [v29 p_renderableLengthForUnclippedPatternWithLineWidth:withinAvailableLength:];
    CGFloat v31 = v30;

    Mutable = CGPathCreateMutable();
    v44.origin.double x = v23;
    v44.origin.double y = v26;
    v44.size.double width = v31;
    v44.size.double height = v28;
    CGFloat MinX = CGRectGetMinX(v44);
    v45.origin.double x = v23;
    v45.origin.double y = v26;
    v45.size.double width = v31;
    v45.size.double height = v28;
    CGFloat v34 = CGRectGetMidY(v45);
    CGPathMoveToPoint(Mutable, 0, MinX, v34);
    v46.origin.double x = v23;
    v46.origin.double y = v26;
    v46.size.double width = v31;
    v46.size.double height = v28;
    CGFloat MaxX = CGRectGetMaxX(v46);
    v47.origin.double x = v23;
    v47.origin.double y = v26;
    v47.size.double width = v31;
    v47.size.double height = v28;
    CGFloat v36 = CGRectGetMidY(v47);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v36);
    [(CRLStroke *)self paintPath:Mutable inContext:a4];
    CGPathRelease(Mutable);
  }
}

- (BOOL)supportsPattern
{
  return 1;
}

- (BOOL)supportsWidth
{
  return (id)[(CRLStrokePattern *)self->_pattern patternType] != (id)2;
}

- (BOOL)supportsColor
{
  return (id)[(CRLStrokePattern *)self->_pattern patternType] != (id)2;
}

- (BOOL)supportsLineOptions
{
  return 1;
}

- (double)suggestedMinimumLineWidth
{
  return 0.0;
}

- (BOOL)isNearlyWhite
{
  if ([(CRLStroke *)self isNullStroke]) {
    return 0;
  }
  BOOL v4 = [(CRLStroke *)self color];
  unsigned __int8 v5 = [v4 isNearlyWhite];

  return v5;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  if ([(CRLStroke *)self isNullStroke]) {
    return 0;
  }
  BOOL v6 = [(CRLStroke *)self color];
  unsigned __int8 v7 = [v6 requiresOutlineOnBackgroundWithAppearance:a3];

  return v7;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  if (![(CRLStroke *)self shouldRender]) {
    return 1;
  }
  unsigned int v3 = [(CRLStroke *)self color];
  unsigned int v4 = [v3 isOpaque];

  unsigned __int8 v5 = [(CRLStroke *)self pattern];
  if ([v5 count]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = [v5 patternType] != (id)1;
  }
  unint64_t v8 = [(CRLStroke *)self cap];
  BOOL v9 = (v8 | [(CRLStroke *)self join]) == 0;
  if (v6) {
    BOOL v9 = 0;
  }
  if (v4) {
    BOOL v7 = v9;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)applyToRepRenderable:(id)a3 withScale:(double)a4
{
  id v6 = a3;
  if (![(CRLStroke *)self canApplyDirectlyToRepRenderable])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF130);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A03FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF150);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    unint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke applyToRepRenderable:withScale:]");
    BOOL v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1056 isFatal:0 description:"Applying stroke with unsupported properties to renderable"];
  }
  if ([(CRLStroke *)self shouldRender])
  {
    double v10 = [(CRLStroke *)self color];
    [v6 setBorderColor:[v10 CGColor]];

    [(CRLStroke *)self width];
    double v12 = v11 * a4;
  }
  else
  {
    [v6 setBorderColor:0];
    double v12 = 0.0;
  }
  [v6 setBorderWidth:v12];
}

- (BOOL)canApplyToShapeRenderable
{
  if ([(CRLStroke *)self isMemberOfClass:objc_opt_class()]) {
    return 1;
  }
  uint64_t v4 = objc_opt_class();

  return [(CRLStroke *)self isMemberOfClass:v4];
}

- (void)applyToShapeRenderable:(id)a3 withScale:(double)a4
{
}

- (void)applyToShapeRenderable:(id)a3 insideStroke:(BOOL)a4 withScale:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (![(CRLStroke *)self canApplyToShapeRenderable])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF170);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0488();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF190);
    }
    BOOL v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStroke applyToShapeRenderable:insideStroke:withScale:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:1082 isFatal:0 description:"don't try to apply this stroke to a shape renderable"];
  }
  if ([(CRLStroke *)self shouldRender])
  {
    [(CRLStroke *)self width];
    float v13 = v12 * a5;
    CGFloat v14 = [(CRLStroke *)self color];
    [v8 setStrokeColor:[v14 CGColor]];

    float v15 = v13 + v13;
    if (!v6) {
      float v15 = v13;
    }
    [v8 setLineWidth:v15];
    [(CRLStroke *)self miterLimit];
    [v8 setMiterLimit:];
    [v8 setCGLineCap:sub_1000E57B8([self cap])];
    [v8 setCGLineJoin:[self join]];
    if ([(CRLStroke *)self supportsPattern])
    {
      double v16 = [(CRLStroke *)self pattern];
      [v16 p_applyToShapeRenderable:v8 lineWidth:v13];
    }
    else
    {
      [v8 setLineDashPattern:0];
    }
  }
  else
  {
    [v8 setStrokeColor:0];
  }
}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (BOOL)shouldAntialiasDefeat
{
  return 1;
}

- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3
{
  double v3 = fmin(a3->a, a3->d);
  id v4 = [(CRLStroke *)self mutableCopy];
  [v4 width];
  [v4 setWidth:fmax(floor(v3 * v5), 0.25)];

  return v4;
}

- (CRLColor)i_color
{
  return self->_color;
}

- (void)setI_color:(id)a3
{
}

- (double)i_width
{
  return self->_width;
}

- (unint64_t)i_cap
{
  return self->_cap;
}

- (unint64_t)i_join
{
  return self->_join;
}

- (void)setI_join:(unint64_t)a3
{
  self->_join = a3;
}

- (double)i_miterLimit
{
  return self->_miterLimit;
}

- (void)setI_miterLimit:(double)a3
{
  self->_miterLimit = a3;
}

- (CRLStrokePattern)i_pattern
{
  return self->_pattern;
}

- (double)i_actualWidth
{
  return self->_actualWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end