@interface TSDStroke
+ (BOOL)canMixWithNilObjects;
+ (Class)mutableClass;
+ (id)editedStrokeFromModelStroke:(id)a3 selectedStroke:(id)a4;
+ (id)emptyStroke;
+ (id)i_newEmptyStroke;
+ (id)i_newStroke;
+ (id)stroke;
+ (id)strokeWithColor:(id)a3 width:(double)a4;
+ (id)strokeWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7;
+ (int64_t)indexOfStroke:(id)a3 strokeArray:(id)a4;
- (BOOL)canApplyDirectlyToRepRenderable;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)dontClearBackground;
- (BOOL)drawsInOneStep;
- (BOOL)drawsOutsideStrokeBounds;
- (BOOL)empty;
- (BOOL)isDash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStroke:(id)a3;
- (BOOL)isFrame;
- (BOOL)isNearlyWhite;
- (BOOL)isNullStroke;
- (BOOL)isRoundDash;
- (BOOL)needsToExtendJoinsForBoundsCalculation;
- (BOOL)shouldAntialiasDefeat;
- (BOOL)shouldRender;
- (BOOL)solid;
- (BOOL)supportsColor;
- (BOOL)supportsLineOptions;
- (BOOL)supportsPattern;
- (BOOL)supportsWidth;
- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3;
- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7;
- (CGRect)boundsForPath:(id)a3;
- (NSString)description;
- (TSDStroke)init;
- (TSDStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7;
- (TSDStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7 miterLimit:(double)a8;
- (TSDStrokePattern)i_pattern;
- (TSUColor)i_color;
- (_TSDStrokeOutsets)outsets;
- (double)dashSpacing;
- (double)horizontalMarginForSwatch;
- (double)i_actualWidth;
- (double)i_miterLimit;
- (double)i_width;
- (double)lineEndInsetAdjustment;
- (double)renderedWidth;
- (double)suggestedMinimumLineWidth;
- (id)colorForCGContext:(CGContext *)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)pathForLineEnd:(id)a3 wrapPath:(BOOL)a4 atPoint:(CGPoint)a5 atAngle:(double)a6 withScale:(double)a7;
- (id)pathToStrokeFromTSDBezierPath:(id)a3;
- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3;
- (id)strokeLineEnd:(id)a3;
- (int)i_cap;
- (int)i_join;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)applyToContext:(CGContext *)a3;
- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4;
- (void)applyToRepRenderable:(id)a3 withScale:(double)a4;
- (void)applyToShapeRenderable:(id)a3 insideStroke:(BOOL)a4 withScale:(double)a5;
- (void)applyToShapeRenderable:(id)a3 withScale:(double)a4;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)i_setCap:(int)a3;
- (void)i_setPattern:(id)a3;
- (void)i_setPatternPropertiesFromStroke:(id)a3;
- (void)i_setPropertiesFromStroke:(id)a3;
- (void)p_strokePathChunk:(CGPath *)a3 inContext:(CGContext *)a4 wantsInteriorStroke:(BOOL)a5;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5;
- (void)setI_actualWidth:(double)a3;
- (void)setI_color:(id)a3;
- (void)setI_join:(int)a3;
- (void)setI_miterLimit:(double)a3;
- (void)setI_width:(double)a3;
@end

@implementation TSDStroke

- (TSDStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7 miterLimit:(double)a8
{
  id v14 = a3;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TSDStroke;
  v16 = [(TSDStroke *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    color = v16->_color;
    v16->_color = (TSUColor *)v17;

    v16->_width = a4;
    v16->_actualWidth = a4;
    v16->_cap = a5;
    v16->_join = a6;
    uint64_t v19 = [v15 copy];
    pattern = v16->_pattern;
    v16->_pattern = (TSDStrokePattern *)v19;

    v16->_miterLimit = a8;
    if ([v15 isRoundDash]) {
      v16->_cap = 1;
    }
  }

  return v16;
}

- (TSDStroke)init
{
  v3 = [MEMORY[0x263F7C808] blackColor];
  v4 = +[TSDStrokePattern solidPattern];
  v5 = [(TSDStroke *)self initWithColor:v3 width:0 cap:0 join:v4 pattern:1.0];

  return v5;
}

- (TSDStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7
{
  return [(TSDStroke *)self initWithColor:a3 width:*(void *)&a5 cap:*(void *)&a6 join:a7 pattern:a4 miterLimit:4.0];
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TSDMutableStroke allocWithZone:a3];
  v5 = [(TSDStroke *)self color];
  [(TSDStroke *)self width];
  double v7 = v6;
  uint64_t v8 = [(TSDStroke *)self cap];
  uint64_t v9 = [(TSDStroke *)self join];
  v10 = [(TSDStroke *)self pattern];
  [(TSDStroke *)self miterLimit];
  v12 = [(TSDStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];

  [(TSDStroke *)self actualWidth];
  -[TSDStroke setI_actualWidth:](v12, "setI_actualWidth:");
  return v12;
}

- (void)i_setCap:(int)a3
{
  if (self->_cap != a3)
  {
    if ([(TSDStroke *)self isRoundDash])
    {
      id v7 = [MEMORY[0x263F7C7F0] currentHandler];
      v5 = [NSString stringWithUTF8String:"-[TSDStroke i_setCap:]"];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
      [v7 handleFailureInFunction:v5 file:v6 lineNumber:518 description:@"Cannot change cap style on a round-dash stroke."];
    }
    else
    {
      self->_cap = a3;
    }
  }
}

- (void)i_setPattern:(id)a3
{
  id v10 = a3;
  id v4 = [(TSDStroke *)self pattern];

  v5 = v10;
  if (v4 != v10)
  {
    BOOL v6 = [(TSDStroke *)self isRoundDash];
    id v7 = (TSDStrokePattern *)[v10 copy];
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
    [(TSDStroke *)self i_setCap:v9];
    v5 = v10;
  }
LABEL_8:
}

+ (id)i_newStroke
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263F7C808] blackColor];
  id v4 = +[TSDStrokePattern solidPattern];
  v5 = (void *)[v2 initWithColor:v3 width:0 cap:0 join:v4 pattern:1.0];

  return v5;
}

+ (id)i_newEmptyStroke
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263F7C808] blackColor];
  id v4 = +[TSDStrokePattern emptyPattern];
  v5 = (void *)[v2 initWithColor:v3 width:0 cap:0 join:v4 pattern:1.0];

  return v5;
}

+ (id)stroke
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__TSDStroke_stroke__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stroke_pred != -1) {
    dispatch_once(&stroke_pred, block);
  }
  id v2 = (void *)stroke_sDefaultStroke;

  return v2;
}

uint64_t __19__TSDStroke_stroke__block_invoke(uint64_t a1)
{
  stroke_sDefaultStroke = objc_msgSend(*(id *)(a1 + 32), "i_newStroke");

  return MEMORY[0x270F9A758]();
}

+ (id)emptyStroke
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__TSDStroke_emptyStroke__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyStroke_pred != -1) {
    dispatch_once(&emptyStroke_pred, block);
  }
  id v2 = (void *)emptyStroke_sEmptyStroke;

  return v2;
}

uint64_t __24__TSDStroke_emptyStroke__block_invoke(uint64_t a1)
{
  emptyStroke_sEmptyStroke = objc_msgSend(*(id *)(a1 + 32), "i_newEmptyStroke");

  return MEMORY[0x270F9A758]();
}

+ (id)strokeWithColor:(id)a3 width:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = +[TSDStrokePattern solidPattern];
  uint64_t v8 = (void *)[v6 initWithColor:v5 width:0 cap:0 join:v7 pattern:a4];

  return v8;
}

+ (id)strokeWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  id v11 = a7;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithColor:v12 width:v8 cap:v7 join:v11 pattern:a4];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TSDStroke *)a3;
  if (v4 == self) {
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = [(id)objc_opt_class() mutableClass];
  if (v5 != [(id)objc_opt_class() mutableClass]) {
    goto LABEL_5;
  }
  BOOL v7 = [(TSDStroke *)self supportsWidth];
  BOOL v8 = [(TSDStroke *)v4 supportsWidth];
  if (v7)
  {
    if (!v8) {
      goto LABEL_5;
    }
    [(TSDStroke *)self width];
    double v10 = v9;
    [(TSDStroke *)v4 width];
    if (vabdd_f64(v10, v11) >= 0.00999999978) {
      goto LABEL_5;
    }
  }
  else if (v8)
  {
    goto LABEL_5;
  }
  BOOL v12 = [(TSDStroke *)self supportsLineOptions];
  BOOL v13 = [(TSDStroke *)v4 supportsLineOptions];
  if (v12)
  {
    if (!v13) {
      goto LABEL_5;
    }
    int v14 = [(TSDStroke *)self cap];
    if (v14 != [(TSDStroke *)v4 cap]) {
      goto LABEL_5;
    }
    int v15 = [(TSDStroke *)self join];
    if (v15 != [(TSDStroke *)v4 join]) {
      goto LABEL_5;
    }
    [(TSDStroke *)self miterLimit];
    double v17 = v16;
    [(TSDStroke *)v4 miterLimit];
    if (v17 != v18) {
      goto LABEL_5;
    }
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  BOOL v19 = [(TSDStroke *)self supportsPattern];
  BOOL v20 = [(TSDStroke *)v4 supportsPattern];
  if (v19)
  {
    if (!v20) {
      goto LABEL_5;
    }
    v21 = [(TSDStroke *)self pattern];
    objc_super v22 = [(TSDStroke *)v4 pattern];
    char v23 = [v21 isEqual:v22];

    if ((v23 & 1) == 0) {
      goto LABEL_5;
    }
  }
  else if (v20)
  {
    goto LABEL_5;
  }
  BOOL v24 = [(TSDStroke *)self supportsColor];
  BOOL v25 = [(TSDStroke *)v4 supportsColor];
  if (v24)
  {
    if (v25)
    {
      color = self->_color;
      uint64_t v27 = [(TSDStroke *)v4 color];
      if (!((unint64_t)color | v27)) {
        goto LABEL_29;
      }
      v28 = (void *)v27;
      char v29 = [(TSUColor *)color isEqual:v27];

      if (v29) {
        goto LABEL_29;
      }
    }
  }
  else if (!v25)
  {
LABEL_29:
    BOOL v6 = 1;
    goto LABEL_30;
  }
LABEL_5:
  BOOL v6 = 0;
LABEL_30:

  return v6;
}

- (unint64_t)hash
{
  if ([(TSDStroke *)self supportsColor]) {
    unint64_t v3 = [(TSUColor *)self->_color hash];
  }
  else {
    unint64_t v3 = *MEMORY[0x263F7C910];
  }
  if ([(TSDStroke *)self supportsLineOptions])
  {
    TSUHashWithSeed();
    TSUHashWithSeed();
    unint64_t v3 = TSUHashWithSeed();
  }
  if ([(TSDStroke *)self supportsPattern]) {
    v3 ^= [(TSDStrokePattern *)self->_pattern hash];
  }
  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [(TSDStroke *)self pattern];
  [(TSDStroke *)self width];
  uint64_t v8 = v7;
  double v9 = [(TSDStroke *)self color];
  double v10 = NSStringFromCGLineCap([(TSDStroke *)self cap]);
  double v11 = NSStringFromCGLineJoin([(TSDStroke *)self join]);
  BOOL v12 = [v3 stringWithFormat:@"<%@ %p pattern=<%@>' width=%f color=<%@> cap=%@ join=%@>", v5, self, v6, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (double)renderedWidth
{
  return self->_width;
}

- (double)dashSpacing
{
  pattern = self->_pattern;
  double v4 = 0.0;
  if (pattern && [(TSDStrokePattern *)pattern count] == 2) {
    return [(TSDStrokePattern *)self->_pattern pattern][8];
  }
  return v4;
}

- (BOOL)isDash
{
  BOOL v3 = [(TSDStrokePattern *)self->_pattern isDash];
  if (v3) {
    LOBYTE(v3) = self->_cap != 1;
  }
  return v3;
}

- (BOOL)isRoundDash
{
  BOOL v3 = [(TSDStrokePattern *)self->_pattern isRoundDash];
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

- (id)pathToStrokeFromTSDBezierPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[TSDStroke pathToStrokeFromCGPath:](self, "pathToStrokeFromCGPath:", [v4 CGPath]);
  if (v5 == (CGPath *)[v4 CGPath])
  {
    BOOL v6 = (TSDBezierPath *)v4;
  }
  else
  {
    BOOL v6 = objc_alloc_init(TSDBezierPath);
    [v4 copyPathAttributesTo:v6];
    uint64_t v7 = +[TSDBezierPath bezierPathWithCGPath:v5];
    [(TSDBezierPath *)v6 appendBezierPath:v7];
  }

  return v6;
}

- (CGRect)boundsForPath:(id)a3
{
  [a3 boundsIncludingTSDStroke:self];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TSDStrokeOutsets)outsets
{
  BOOL v3 = [(TSDStroke *)self supportsWidth];
  double v4 = 0.0;
  if (v3)
  {
    [(TSDStroke *)self width];
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
  if ([v4 isFrame])
  {
    double v5 = [MEMORY[0x263F7C7F0] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[TSDStroke i_setPropertiesFromStroke:]"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:791 description:@"Setting properties for a TSDStroke from a TSDFrame"];
  }
  double v8 = [v4 color];
  [(TSDStroke *)self setI_color:v8];

  [v4 width];
  -[TSDStroke setI_width:](self, "setI_width:");
  -[TSDStroke setI_join:](self, "setI_join:", [v4 join]);
  [v4 miterLimit];
  -[TSDStroke setI_miterLimit:](self, "setI_miterLimit:");
  [v4 actualWidth];
  -[TSDStroke setI_actualWidth:](self, "setI_actualWidth:");
  double v9 = [v4 pattern];
  [(TSDStroke *)self i_setPattern:v9];

  uint64_t v10 = [v4 cap];

  [(TSDStroke *)self i_setCap:v10];
}

- (void)i_setPatternPropertiesFromStroke:(id)a3
{
  id v4 = a3;
  if ([v4 isFrame])
  {
    double v5 = [MEMORY[0x263F7C7F0] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[TSDStroke i_setPatternPropertiesFromStroke:]"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:802 description:@"Setting properties for a TSDStroke from a TSDFrame"];
  }
  -[TSDStroke setI_join:](self, "setI_join:", [v4 join]);
  [v4 miterLimit];
  -[TSDStroke setI_miterLimit:](self, "setI_miterLimit:");
  double v8 = [v4 pattern];
  [(TSDStroke *)self i_setPattern:v8];

  uint64_t v9 = [v4 cap];

  [(TSDStroke *)self i_setCap:v9];
}

- (void)applyToContext:(CGContext *)a3
{
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = -[TSDStroke colorForCGContext:](self, "colorForCGContext:");
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v7 CGColor]);
  double width = self->_width;
  if (v4) {
    double width = width + width;
  }
  CGContextSetLineWidth(a3, width);
  CGContextSetLineJoin(a3, (CGLineJoin)self->_join);
  CGContextSetMiterLimit(a3, self->_miterLimit);
  *(void *)cap = self->_cap;
  [(TSDStrokePattern *)self->_pattern i_applyToContext:a3 lineWidth:cap capStyle:self->_width * (self->_actualWidth / self->_width)];
  CGContextSetLineCap(a3, cap[0]);
}

- (BOOL)isNullStroke
{
  return [(TSDStrokePattern *)self->_pattern patternType] == 2;
}

- (BOOL)shouldRender
{
  return self->_width > 0.0 && [(TSDStrokePattern *)self->_pattern patternType] != 2;
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
  if (v4 && [v4 rangeOfString:@":"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", @":") + 1);
    id v6 = +[TSDLineEnd lineEndWithIdentifier:v7];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)colorForCGContext:(CGContext *)a3
{
  if (TSDCGContextHasBackgroundsSuppressed((uint64_t)a3)) {
    [MEMORY[0x263F7C808] blackColor];
  }
  else {
  BOOL v4 = [(TSDStroke *)self color];
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
  [(TSDStroke *)self paintPath:Mutable wantsInteriorStroke:v6 inContext:a5];

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
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(TSDStroke *)self shouldRender])
  {
    CGContextSaveGState(a5);
    if ((unint64_t)TSDPathGetSegmentCount(a3) > 0x9C40)
    {
      BOOL v12 = +[TSDBezierPath bezierPathWithCGPath:a3];
      BOOL v13 = [v12 pathSplitAtSubpathBoundariesWithSoftElementLimit:40000 hardElementLimit:50000];
      CGRect v14 = [(TSDStroke *)self color];
      [v14 alphaComponent];
      double v16 = v15;

      if (v16 >= 1.0)
      {
        [(TSDStroke *)self applyToContext:a5 insideStroke:v9];
      }
      else
      {
        double v17 = [(TSDStroke *)self color];
        [v17 alphaComponent];
        CGContextSetAlpha(a5, v18);

        CGContextBeginTransparencyLayer(a5, 0);
        BOOL v19 = (void *)[(TSDStroke *)self mutableCopy];
        BOOL v20 = [v19 color];
        v21 = [v20 colorWithAlphaComponent:1.0];
        [v19 setColor:v21];

        [v19 applyToContext:a5 insideStroke:v9];
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v28 != v25) {
              objc_enumerationMutation(v22);
            }
            -[TSDStroke p_strokePathChunk:inContext:wantsInteriorStroke:](self, "p_strokePathChunk:inContext:wantsInteriorStroke:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "CGPath", (void)v27), a5, v9);
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v24);
      }

      if (v16 < 1.0) {
        CGContextEndTransparencyLayer(a5);
      }
    }
    else
    {
      [(TSDStroke *)self applyToContext:a5 insideStroke:v9];
      [(TSDStroke *)self p_strokePathChunk:a3 inContext:a5 wantsInteriorStroke:v9];
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
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeTranslation(&v21, x, y);
  CGAffineTransform v19 = v21;
  CGAffineTransformScale(&transform, &v19, a6, a6);
  CGAffineTransform v21 = transform;
  CGAffineTransform v19 = transform;
  CGAffineTransformRotate(&transform, &v19, a5);
  CGAffineTransform v21 = transform;
  [v14 endPoint];
  CGFloat v16 = -v15;
  [v14 endPoint];
  CGAffineTransform v19 = v21;
  CGAffineTransformTranslate(&transform, &v19, v16, -v17);
  CGAffineTransform v21 = transform;
  CGContextConcatCTM(a7, &transform);
  CGContextAddPath(a7, (CGPathRef)[v14 path]);
  if ([v14 isFilled])
  {
    CGContextFillPath(a7);
  }
  else
  {
    [(TSDStroke *)self width];
    CGContextSetLineWidth(a7, v18 / a6);
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
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, x, y);
  CGAffineTransform t1 = v34;
  CGAffineTransformScale(&v33, &t1, a6, a6);
  CGAffineTransform v34 = v33;
  CGAffineTransform t1 = v33;
  CGAffineTransformRotate(&v33, &t1, a5);
  CGAffineTransform v34 = v33;
  [v13 endPoint];
  CGFloat v15 = -v14;
  [v13 endPoint];
  CGAffineTransform t1 = v34;
  CGAffineTransformTranslate(&v33, &t1, v15, -v16);
  CGAffineTransform v34 = v33;
  CGAffineTransform t1 = v33;
  long long v17 = *(_OWORD *)&a7->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&v31.c = v17;
  *(_OWORD *)&v31.tCGFloat x = *(_OWORD *)&a7->tx;
  CGAffineTransformConcat(&v33, &t1, &v31);
  CGAffineTransform v34 = v33;
  double v18 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", [v13 path]);
  CGAffineTransform v33 = v34;
  [v18 transformUsingAffineTransform:&v33];
  if ([v13 isFilled])
  {
    [v18 bounds];
  }
  else
  {
    [(TSDStroke *)self width];
    objc_msgSend(v18, "setLineWidth:");
    objc_msgSend(v18, "setLineJoinStyle:", (int)objc_msgSend(v13, "lineJoin"));
    [v18 boundsIncludingStroke];
  }
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;

  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (id)pathForLineEnd:(id)a3 wrapPath:(BOOL)a4 atPoint:(CGPoint)a5 atAngle:(double)a6 withScale:(double)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  BOOL v11 = a4;
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
  uint64_t v17 = [v13 path];
  if (v11) {
    uint64_t v17 = [v13 wrapPath];
  }
  double v18 = +[TSDBezierPath bezierPathWithCGPath:v17];
  CGAffineTransform v22 = v23;
  [v18 transformUsingAffineTransform:&v22];
  if ([v13 isFilled])
  {
    [v18 setLineWidth:0.0];
  }
  else
  {
    [(TSDStroke *)self width];
    objc_msgSend(v18, "setLineWidth:");
    objc_msgSend(v18, "setLineJoinStyle:", (int)objc_msgSend(v13, "lineJoin"));
    uint64_t v19 = [v18 outlineStroke];

    double v18 = (void *)v19;
  }

  return v18;
}

- (double)horizontalMarginForSwatch
{
  id v2 = [(TSDStroke *)self pattern];
  int v3 = [v2 isRoundDash];

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
  uint64_t v40 = *MEMORY[0x263EF8340];
  [(TSDStroke *)self horizontalMarginForSwatch];
  double v11 = v10;
  if ([(TSDStroke *)self isNullStroke])
  {
    CGContextSaveGState(a4);
    float v12 = (height + -35.0) * 0.5;
    CGFloat v13 = y + floorf(v12) + 0.5;
    CGFloat v14 = width + v11 * -2.0 + -1.0;
    CGFloat v15 = [(TSDStroke *)self color];
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v15 CGColor]);

    *(_OWORD *)lengths = xmmword_2238397D0;
    CGContextSetLineWidth(a4, 1.0);
    CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
    v42.origin.double x = x + v11 + 0.5;
    v42.origin.double y = v13;
    v42.size.double width = v14;
    v42.size.double height = 35.0;
    CGContextStrokeRect(a4, v42);
    CGContextRestoreGState(a4);
    double v16 = [(TSDStroke *)self color];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v16 CGColor]);

    uint64_t v17 = TSDBundle();
    double v18 = [v17 localizedStringForKey:@"None" value:&stru_26D688A48 table:@"TSDrawables"];

    UIGraphicsPushContext(a4);
    uint64_t v19 = [MEMORY[0x263F1C658] boldSystemFontOfSize:16.0];
    uint64_t v37 = *MEMORY[0x263F1C238];
    v38 = v19;
    double v20 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    [v18 sizeWithAttributes:v20];
    *(float *)&double v21 = (v14 - v21) * 0.5;
    *(float *)&double v22 = (35.0 - v22) * 0.5;
    objc_msgSend(v18, "drawAtPoint:withAttributes:", v20, x + v11 + 0.5 + floorf(*(float *)&v21), v13 + floorf(*(float *)&v22));
    UIGraphicsPopContext();
  }
  else
  {
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    *(void *)&CGFloat v23 = (unint64_t)CGRectInset(v43, v11, 0.0);
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    double MidY = CGRectGetMidY(v44);
    [(TSDStroke *)self width];
    CGFloat v26 = MidY + v25 * -0.5;
    [(TSDStroke *)self width];
    CGFloat v28 = v27;
    double v29 = [(TSDStroke *)self pattern];
    [(TSDStroke *)self width];
    objc_msgSend(v29, "p_renderableLengthForUnclippedPatternWithLineWidth:withinAvailableLength:");
    CGFloat v31 = v30;

    Mutable = CGPathCreateMutable();
    v45.origin.double x = v23;
    v45.origin.double y = v26;
    v45.size.double width = v31;
    v45.size.double height = v28;
    CGFloat MinX = CGRectGetMinX(v45);
    v46.origin.double x = v23;
    v46.origin.double y = v26;
    v46.size.double width = v31;
    v46.size.double height = v28;
    CGFloat v34 = CGRectGetMidY(v46);
    CGPathMoveToPoint(Mutable, 0, MinX, v34);
    v47.origin.double x = v23;
    v47.origin.double y = v26;
    v47.size.double width = v31;
    v47.size.double height = v28;
    CGFloat MaxX = CGRectGetMaxX(v47);
    v48.origin.double x = v23;
    v48.origin.double y = v26;
    v48.size.double width = v31;
    v48.size.double height = v28;
    CGFloat v36 = CGRectGetMidY(v48);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v36);
    [(TSDStroke *)self paintPath:Mutable inContext:a4];
    CGPathRelease(Mutable);
  }
}

- (BOOL)supportsPattern
{
  return 1;
}

- (BOOL)supportsWidth
{
  return [(TSDStrokePattern *)self->_pattern patternType] != 2;
}

- (BOOL)supportsColor
{
  return [(TSDStrokePattern *)self->_pattern patternType] != 2;
}

- (BOOL)supportsLineOptions
{
  return 1;
}

- (double)suggestedMinimumLineWidth
{
  return 0.0;
}

- (BOOL)isFrame
{
  return 0;
}

- (BOOL)isNearlyWhite
{
  if ([(TSDStroke *)self isNullStroke]) {
    return 0;
  }
  BOOL v4 = [(TSDStroke *)self color];
  char v5 = [v4 isNearlyWhite];

  return v5;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  if (![(TSDStroke *)self shouldRender]) {
    return 1;
  }
  int v3 = [(TSDStroke *)self color];
  int v4 = [v3 isOpaque];

  char v5 = [(TSDStroke *)self pattern];
  if ([v5 count]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = [v5 patternType] != 1;
  }
  int v8 = [(TSDStroke *)self cap];
  BOOL v9 = (v8 | [(TSDStroke *)self join]) == 0;
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
  id v12 = a3;
  if (![(TSDStroke *)self canApplyDirectlyToRepRenderable])
  {
    BOOL v6 = [MEMORY[0x263F7C7F0] currentHandler];
    BOOL v7 = [NSString stringWithUTF8String:"-[TSDStroke applyToRepRenderable:withScale:]"];
    int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:1115 description:@"Applying stroke with unsupported properties to renderable"];
  }
  if ([(TSDStroke *)self shouldRender])
  {
    BOOL v9 = [(TSDStroke *)self color];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    [(TSDStroke *)self width];
    double v11 = v10 * a4;
  }
  else
  {
    [v12 setBorderColor:0];
    double v11 = 0.0;
  }
  [v12 setBorderWidth:v11];
}

- (BOOL)canApplyToShapeRenderable
{
  if ([(TSDStroke *)self isMemberOfClass:objc_opt_class()]) {
    return 1;
  }
  uint64_t v4 = objc_opt_class();

  return [(TSDStroke *)self isMemberOfClass:v4];
}

- (void)applyToShapeRenderable:(id)a3 withScale:(double)a4
{
}

- (void)applyToShapeRenderable:(id)a3 insideStroke:(BOOL)a4 withScale:(double)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  if (![(TSDStroke *)self canApplyToShapeRenderable])
  {
    int v8 = [MEMORY[0x263F7C7F0] currentHandler];
    BOOL v9 = [NSString stringWithUTF8String:"-[TSDStroke applyToShapeRenderable:insideStroke:withScale:]"];
    double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:1141 description:@"don't try to apply this stroke to a shape renderable"];
  }
  if ([(TSDStroke *)self shouldRender])
  {
    [(TSDStroke *)self width];
    float v12 = v11 * a5;
    CGFloat v13 = [(TSDStroke *)self color];
    objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

    float v14 = v12 + v12;
    if (!v6) {
      float v14 = v12;
    }
    [v16 setLineWidth:v14];
    [(TSDStroke *)self miterLimit];
    objc_msgSend(v16, "setMiterLimit:");
    objc_msgSend(v16, "setCGLineCap:", -[TSDStroke cap](self, "cap"));
    objc_msgSend(v16, "setCGLineJoin:", -[TSDStroke join](self, "join"));
    if ([(TSDStroke *)self supportsPattern])
    {
      CGFloat v15 = [(TSDStroke *)self pattern];
      objc_msgSend(v15, "p_applyToShapeRenderable:lineWidth:", v16, v12);
    }
    else
    {
      [v16 setLineDashPattern:0];
    }
  }
  else
  {
    [v16 setStrokeColor:0];
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

- (int64_t)mixingTypeWithObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char v5 = TSUDynamicCast();

  if (v5)
  {
    BOOL v6 = [(TSDStroke *)self pattern];
    BOOL v7 = [v5 pattern];
    uint64_t v8 = TSDMixingTypeWithObjects((unint64_t)v6, (unint64_t)v7);
    uint64_t v9 = TSDMixingTypeBestFromMixingTypes(4, v8);

    LODWORD(v6) = [(TSDStroke *)self isNullStroke];
    if (v6 != [v5 isNullStroke]
      || (int v10 = -[TSDStroke shouldRender](self, "shouldRender"), v10 != [v5 shouldRender])
      || (int v11 = -[TSDStroke isFrame](self, "isFrame"), v11 != [v5 isFrame]))
    {
      uint64_t v9 = TSDMixingTypeBestFromMixingTypes(v9, 2);
    }
    [(TSDStroke *)self width];
    double v13 = v12;
    [v5 width];
    if (v13 != v14
      || (-[TSDStroke miterLimit](self, "miterLimit"), double v16 = v15, [v5 miterLimit], v16 != v17))
    {
      uint64_t v9 = TSDMixingTypeBestFromMixingTypes(v9, 3);
    }
  }
  else
  {
    uint64_t v9 = 3;
  }

  return v9;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v28[4] = *(double *)MEMORY[0x263EF8340];
  id v6 = a4;
  objc_opt_class();
  TSUDynamicCast();
  BOOL v7 = (TSDStroke *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v8 = objc_alloc((Class)objc_opt_class());
    uint64_t v9 = [(TSDStroke *)self color];
    int v10 = [(TSDStroke *)v7 color];
    double v27 = v9;
    int v11 = [v9 blendedColorWithFraction:v10 ofColor:a3];
    [(TSDStroke *)self width];
    [(TSDStroke *)v7 width];
    TSUMix();
    double v13 = v12;
    if (a3 >= 0.5)
    {
      uint64_t v14 = [(TSDStroke *)v7 cap];
      double v15 = v7;
    }
    else
    {
      uint64_t v14 = [(TSDStroke *)self cap];
      double v15 = self;
    }
    uint64_t v21 = [(TSDStroke *)v15 join];
    double v22 = [(TSDStroke *)self pattern];
    CGFloat v23 = [(TSDStroke *)v7 pattern];
    double v24 = TSDMixingMixedObjectWithFractionEx(v22, (unint64_t)v23, a3);
    [(TSDStroke *)self miterLimit];
    [(TSDStroke *)v7 miterLimit];
    TSUMix();
    double v16 = (void *)[v8 initWithColor:v11 width:v14 cap:v21 join:v24 pattern:v13 miterLimit:v25];
  }
  else
  {
    double v16 = (void *)[(TSDStroke *)self mutableCopy];
    double v17 = [(TSDStroke *)self color];
    [v17 getRGBAComponents:v28];

    double v18 = [MEMORY[0x263F7C808] colorWithRed:v28[0] green:v28[1] blue:v28[2] alpha:0.0];
    uint64_t v19 = [(TSDStroke *)self color];
    double v20 = [v18 blendedColorWithFraction:v19 ofColor:a3];
    objc_msgSend(v16, "setI_color:", v20);
  }

  return v16;
}

+ (BOOL)canMixWithNilObjects
{
  return 1;
}

- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3
{
  double v3 = fmin(a3->a, a3->d);
  id v4 = (void *)[(TSDStroke *)self mutableCopy];
  [v4 width];
  objc_msgSend(v4, "setWidth:", fmax(floor(v3 * v5), 0.25));

  return v4;
}

- (TSUColor)i_color
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

- (void)setI_width:(double)a3
{
  self->_double width = a3;
}

- (int)i_cap
{
  return self->_cap;
}

- (int)i_join
{
  return self->_join;
}

- (void)setI_join:(int)a3
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

- (TSDStrokePattern)i_pattern
{
  return self->_pattern;
}

- (double)i_actualWidth
{
  return self->_actualWidth;
}

- (void)setI_actualWidth:(double)a3
{
  self->_actualWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

+ (int64_t)indexOfStroke:(id)a3 strokeArray:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  BOOL v7 = TSUDynamicCast();
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 strokeName];
  }
  else
  {
    uint64_t v9 = 0;
  }
  double v27 = [v5 pattern];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v11)
  {
    int64_t v22 = -1;
    goto LABEL_21;
  }
  uint64_t v12 = v11;
  double v24 = v8;
  id v25 = v5;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v29;
  while (2)
  {
    uint64_t v15 = 0;
    uint64_t v26 = v13 + v12;
    do
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(v10);
      }
      double v16 = *(void **)(*((void *)&v28 + 1) + 8 * v15);
      objc_opt_class();
      double v17 = TSUDynamicCast();
      double v18 = v17;
      if (v9 && v17)
      {
        uint64_t v19 = [v17 strokeName];
        char v20 = [v9 isEqualToString:v19];
      }
      else
      {
        if (v9) {
          goto LABEL_15;
        }
        uint64_t v19 = [v16 pattern];
        char v20 = [v27 isEqual:v19];
      }
      char v21 = v20;

      if (v21)
      {

        int64_t v22 = v13 + v15;
        goto LABEL_19;
      }
LABEL_15:

      ++v15;
    }
    while (v12 != v15);
    uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    uint64_t v13 = v26;
    if (v12) {
      continue;
    }
    break;
  }
  int64_t v22 = -1;
LABEL_19:
  id v8 = v24;
  id v5 = v25;
LABEL_21:

  return v22;
}

+ (id)editedStrokeFromModelStroke:(id)a3 selectedStroke:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)[v6 mutableCopy];
  if (([v5 isFrame] & 1) == 0) {
    [v7 setPropertiesFromStroke:v5];
  }
  [v7 width];
  double v9 = v8;
  [v7 suggestedMinimumLineWidth];
  if (v9 < v10)
  {
    [v7 suggestedMinimumLineWidth];
    objc_msgSend(v7, "setWidth:");
  }
  [v7 setPatternPropertiesFromStroke:v6];

  return v7;
}

- (BOOL)dontClearBackground
{
  id AssociatedObject = objc_getAssociatedObject(self, "TSTStrokeAssociatedObject");

  return [AssociatedObject dontClearBackground];
}

- (BOOL)empty
{
  return ![(TSDStroke *)self pattern]
      || [(TSDStrokePattern *)[(TSDStroke *)self pattern] patternType] == 2;
}

- (BOOL)solid
{
  return ![(TSDStroke *)self pattern]
      || [(TSDStrokePattern *)[(TSDStroke *)self pattern] patternType] == 1;
}

- (BOOL)isEqualToStroke:(id)a3
{
  BOOL result = 0;
  if (-[TSDStroke isEqual:](self, "isEqual:"))
  {
    int v5 = [(TSDStroke *)self dontClearBackground];
    if (v5 == [a3 dontClearBackground]) {
      return 1;
    }
  }
  return result;
}

@end