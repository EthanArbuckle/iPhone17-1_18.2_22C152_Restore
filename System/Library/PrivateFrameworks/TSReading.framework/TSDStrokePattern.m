@interface TSDStrokePattern
+ (id)dashPatternWithSpacing:(double)a3;
+ (id)emptyPattern;
+ (id)longDashPattern;
+ (id)mediumDashPattern;
+ (id)roundDashPattern;
+ (id)roundDashPatternWithSpacing:(double)a3;
+ (id)shortDashPattern;
+ (id)solidPattern;
+ (id)strokePatternWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5;
- (BOOL)isDash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRoundDash;
- (TSDStrokePattern)initWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5;
- (TSDStrokePattern)initWithPatternType:(int64_t)a3 pattern:(const double *)a4 count:(unint64_t)a5 phase:(double)a6;
- (double)p_renderableLengthForUnclippedPatternWithLineWidth:(double)a3 withinAvailableLength:(double)a4;
- (double)pattern;
- (double)phase;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)p_patternString;
- (id)p_typeString;
- (int64_t)mixingTypeWithObject:(id)a3;
- (int64_t)patternType;
- (unint64_t)count;
- (unint64_t)hash;
- (void)applyToContext:(CGContext *)a3 lineWidth:(double)a4;
- (void)applyToShapeRenderable:(id)a3;
- (void)i_applyToContext:(CGContext *)a3 lineWidth:(double)a4 capStyle:(unint64_t *)a5;
- (void)p_applyToShapeRenderable:(id)a3 lineWidth:(double)a4;
@end

@implementation TSDStrokePattern

- (TSDStrokePattern)initWithPatternType:(int64_t)a3 pattern:(const double *)a4 count:(unint64_t)a5 phase:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)TSDStrokePattern;
  v9 = [(TSDStrokePattern *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_count = a5;
    if (a4)
    {
      pattern = v9->_pattern;
      unint64_t v12 = 6;
      if (a5 < 6) {
        unint64_t v12 = a5;
      }
      memcpy(pattern, a4, 8 * v12);
    }
  }
  return v10;
}

- (TSDStrokePattern)initWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  return [(TSDStrokePattern *)self initWithPatternType:0 pattern:a3 count:a4 phase:a5];
}

+ (id)solidPattern
{
  if (solidPattern_pred != -1) {
    dispatch_once(&solidPattern_pred, &__block_literal_global_26);
  }
  v2 = (void *)solidPattern_sPattern;

  return v2;
}

uint64_t __32__TSDStrokePattern_solidPattern__block_invoke()
{
  solidPattern_sPattern = [[TSDStrokePattern alloc] initWithPatternType:1 pattern:0 count:0 phase:0.0];

  return MEMORY[0x270F9A758]();
}

+ (id)emptyPattern
{
  if (emptyPattern_pred != -1) {
    dispatch_once(&emptyPattern_pred, &__block_literal_global_2_0);
  }
  v2 = (void *)emptyPattern_sPattern;

  return v2;
}

uint64_t __32__TSDStrokePattern_emptyPattern__block_invoke()
{
  emptyPattern_sPattern = [[TSDStrokePattern alloc] initWithPatternType:2 pattern:0 count:0 phase:0.0];

  return MEMORY[0x270F9A758]();
}

+ (id)shortDashPattern
{
  if (shortDashPattern_pred != -1) {
    dispatch_once(&shortDashPattern_pred, &__block_literal_global_4_0);
  }
  v2 = (void *)shortDashPattern_sPattern;

  return v2;
}

uint64_t __36__TSDStrokePattern_shortDashPattern__block_invoke()
{
  shortDashPattern_sPattern = [[TSDStrokePattern alloc] initWithPattern:&shortDashPattern_pattern1 count:2 phase:0.0];

  return MEMORY[0x270F9A758]();
}

+ (id)mediumDashPattern
{
  if (mediumDashPattern_pred != -1) {
    dispatch_once(&mediumDashPattern_pred, &__block_literal_global_6_0);
  }
  v2 = (void *)mediumDashPattern_sPattern;

  return v2;
}

uint64_t __37__TSDStrokePattern_mediumDashPattern__block_invoke()
{
  mediumDashPattern_sPattern = [[TSDStrokePattern alloc] initWithPattern:&mediumDashPattern_pattern3 count:2 phase:0.0];

  return MEMORY[0x270F9A758]();
}

+ (id)longDashPattern
{
  if (longDashPattern_pred != -1) {
    dispatch_once(&longDashPattern_pred, &__block_literal_global_8);
  }
  v2 = (void *)longDashPattern_sPattern;

  return v2;
}

uint64_t __35__TSDStrokePattern_longDashPattern__block_invoke()
{
  longDashPattern_sPattern = [[TSDStrokePattern alloc] initWithPattern:&longDashPattern_pattern6 count:2 phase:0.0];

  return MEMORY[0x270F9A758]();
}

+ (id)roundDashPattern
{
  if (roundDashPattern_pred != -1) {
    dispatch_once(&roundDashPattern_pred, &__block_literal_global_10);
  }
  v2 = (void *)roundDashPattern_sPattern;

  return v2;
}

uint64_t __36__TSDStrokePattern_roundDashPattern__block_invoke()
{
  roundDashPattern_sPattern = [[TSDStrokePattern alloc] initWithPattern:&roundDashPattern_roundPattern count:2 phase:0.0];

  return MEMORY[0x270F9A758]();
}

+ (id)roundDashPatternWithSpacing:(double)a3
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[0] = 0x3F50624DD2F1A9FCLL;
  *(double *)&v5[1] = a3;
  v3 = +[TSDStrokePattern strokePatternWithPattern:v5 count:2 phase:0.0];

  return v3;
}

+ (id)dashPatternWithSpacing:(double)a3
{
  v5[2] = *MEMORY[0x263EF8340];
  *(double *)v5 = a3;
  *(double *)&v5[1] = a3;
  v3 = +[TSDStrokePattern strokePatternWithPattern:v5 count:2 phase:0.0];

  return v3;
}

+ (id)strokePatternWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  v5 = [[TSDStrokePattern alloc] initWithPattern:a3 count:a4 phase:a5];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TSDStrokePattern *)a3;
  objc_opt_class();
  v5 = TSUDynamicCast();
  if (!v4) {
    goto LABEL_10;
  }
  if (v4 == self)
  {
LABEL_9:
    BOOL v13 = 1;
    goto LABEL_11;
  }
  if ([(TSDStrokePattern *)self patternType]
    && (int64_t v6 = -[TSDStrokePattern patternType](self, "patternType"), v6 != [v5 patternType])
    || (-[TSDStrokePattern phase](self, "phase"), double v8 = v7, [v5 phase], vabdd_f64(v8, v9) >= 0.00999999978)
    || (unint64_t v10 = -[TSDStrokePattern count](self, "count"), v10 != [v5 count]))
  {
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  if ([(TSDStrokePattern *)self count] >= 6)
  {
    unint64_t v12 = (double *)[v5 pattern];
    unint64_t v11 = 6;
  }
  else
  {
    unint64_t v11 = [(TSDStrokePattern *)self count];
    unint64_t v12 = (double *)[v5 pattern];
    if (!v11) {
      goto LABEL_9;
    }
  }
  pattern = self->_pattern;
  unint64_t v16 = v11 - 1;
  do
  {
    double v17 = *pattern++;
    double v18 = v17;
    double v19 = *v12++;
    double v20 = vabdd_f64(v18, v19);
    BOOL v22 = v16-- != 0;
    BOOL v13 = v20 < 0.00999999978;
  }
  while (v20 < 0.00999999978 && v22);
LABEL_11:

  return v13;
}

- (unint64_t)hash
{
  TSUHash();

  return TSUHashWithSeed();
}

- (id)description
{
  v3 = [(TSDStrokePattern *)self p_patternString];
  v4 = [(TSDStrokePattern *)self p_typeString];
  v5 = NSString;
  int64_t v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = [v5 stringWithFormat:@"%@ (%p) pattern: %@ count: %ld phase: %f type: %@", v7, self, v3, self->_count, *(void *)&self->_phase, v4];

  return v8;
}

- (id)p_patternString
{
  if (self->_count)
  {
    unint64_t v3 = 0;
    v4 = @"none";
    pattern = self->_pattern;
    do
    {
      if (v3) {
        [NSString stringWithFormat:@"%@, %f", v4, *(void *)&pattern[v3]];
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)pattern, v8);
      }
      int64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v3;
      v4 = v6;
    }
    while (v3 < self->_count);
  }
  else
  {
    int64_t v6 = @"none";
  }

  return v6;
}

- (id)p_typeString
{
  unint64_t type = self->_type;
  if (type > 2) {
    return @"unknown";
  }
  else {
    return off_2646B1800[type];
  }
}

- (double)pattern
{
  return self->_pattern;
}

- (BOOL)isDash
{
  BOOL result = self->_count == 2
        && (double v2 = self->_pattern[0], vabdd_f64(v2, self->_pattern[1]) < 0.0001)
        && fabs(v2 + -0.001) >= 0.0001;
  return result;
}

- (BOOL)isRoundDash
{
  BOOL result = self->_count == 2
        && (double v2 = self->_pattern[0], vabdd_f64(v2, self->_pattern[1]) >= 0.0001)
        && fabs(v2 + -0.001) < 0.0001;
  return result;
}

- (void)applyToContext:(CGContext *)a3 lineWidth:(double)a4
{
}

- (void)i_applyToContext:(CGContext *)a3 lineWidth:(double)a4 capStyle:(unint64_t *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)lengths = 0u;
  double v9 = [(TSDStrokePattern *)self pattern];
  unint64_t count = self->_count;
  if (count)
  {
    unint64_t v11 = lengths;
    do
    {
      double v12 = *v9++;
      *v11++ = v12 * a4;
      --count;
    }
    while (count);
  }
  double phase = self->_phase;
  if ([(TSDStrokePattern *)self isRoundDash])
  {
    memset(&v17, 0, sizeof(v17));
    CGContextGetCTM(&v17, a3);
    CGAffineTransform v16 = v17;
    double v14 = TSDTransformScale(&v16.a);
    if (a5 && *a5 == 1 && v14 * a4 <= 2.0)
    {
      lengths[0] = a4;
      *a5 = 0;
      float v15 = 0.0;
    }
    else
    {
      lengths[1] = lengths[1] + a4;
      float v15 = 0.5;
    }
  }
  else
  {
    float v15 = phase * a4;
  }
  CGContextSetLineDash(a3, v15, lengths, self->_count);
}

- (double)p_renderableLengthForUnclippedPatternWithLineWidth:(double)a3 withinAvailableLength:(double)a4
{
  if ([(TSDStrokePattern *)self count] == 2)
  {
    double v7 = *[(TSDStrokePattern *)self pattern] * a3;
    double v8 = [(TSDStrokePattern *)self pattern][8] * a3;
    [(TSDStrokePattern *)self phase];
    double v10 = v9 * a3;
    BOOL v11 = [(TSDStrokePattern *)self isRoundDash];
    double v12 = -0.0;
    if (v11) {
      double v12 = a3;
    }
    double v13 = v7 + v12;
    double v14 = 0.5;
    if (!v11) {
      double v14 = v10;
    }
    float v15 = a4 - (v8 + v13 - v14);
    float v16 = v8 + v13;
    float v17 = fmodf(v15, v16);
    double v18 = v17;
    if (v17 > 0.0 && v17 < 5.0 && v13 > v18)
    {
      a4 = a4 - v18;
      if ([(TSDStrokePattern *)self isRoundDash]) {
        return a4 + v8 * -0.5;
      }
    }
  }
  return a4;
}

- (void)applyToShapeRenderable:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x263F7C7F0] currentHandler];
    int64_t v6 = [NSString stringWithUTF8String:"-[TSDStrokePattern applyToShapeRenderable:]"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 342, @"invalid nil value for '%s'", "shapeRenderable");

    id v4 = 0;
  }
  [v4 lineWidth];
  -[TSDStrokePattern p_applyToShapeRenderable:lineWidth:](self, "p_applyToShapeRenderable:lineWidth:", v8);
}

- (void)p_applyToShapeRenderable:(id)a3 lineWidth:(double)a4
{
  id v12 = a3;
  if ([(TSDStrokePattern *)self patternType] == 1)
  {
    [v12 setLineDashPattern:0];
  }
  else if (![(TSDStrokePattern *)self patternType])
  {
    [v12 setLineDashPhase:self->_phase * a4];
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v7 = [(TSDStrokePattern *)self pattern];
    if (self->_count)
    {
      id v8 = v7;
      unint64_t v9 = 0;
      do
      {
        double v10 = v8[v9] * a4;
        if (v9 == 1 && [(TSDStrokePattern *)self isRoundDash])
        {
          [v12 setLineDashPhase:0.5];
          double v10 = v10 + a4;
        }
        BOOL v11 = [NSNumber numberWithDouble:v10];
        [v6 addObject:v11];

        ++v9;
      }
      while (v9 < self->_count);
    }
    [v12 setLineDashPattern:v6];
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = TSUDynamicCast();

  if (!v5)
  {
    id v6 = [MEMORY[0x263F7C7F0] currentHandler];
    double v7 = [NSString stringWithUTF8String:"-[TSDStrokePattern mixingTypeWithObject:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:377 description:@"nil object after cast"];
  }
  int64_t v9 = [(TSDStrokePattern *)self patternType];
  if (v9 == [v5 patternType]
    && (unint64_t v10 = -[TSDStrokePattern count](self, "count"), v10 == [v5 count])
    && (int v11 = -[TSDStrokePattern isDash](self, "isDash"), v11 == [v5 isDash])
    && (int v12 = -[TSDStrokePattern isRoundDash](self, "isRoundDash"), v12 == [v5 isRoundDash]))
  {
    int64_t v13 = 5;
  }
  else
  {
    int64_t v13 = TSDMixingTypeBestFromMixingTypes(5, 2);
  }

  return v13;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v19[6] = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_opt_class();
  double v7 = TSUDynamicCast();
  if (v7)
  {
    if ([(TSDStrokePattern *)self count])
    {
      unint64_t v8 = 0;
      do
      {
        *(double *)&v19[v8] = TSDMixFloats(-[TSDStrokePattern pattern](self, "pattern")[8 * v8], *(double *)([v7 pattern] + 8 * v8), a3);
        ++v8;
      }
      while (v8 < [(TSDStrokePattern *)self count]);
    }
    unint64_t v9 = [(TSDStrokePattern *)self count];
    [(TSDStrokePattern *)self phase];
    double v11 = v10;
    [v7 phase];
    uint64_t v13 = +[TSDStrokePattern strokePatternWithPattern:v19 count:v9 phase:TSDMixFloats(v11, v12, a3)];
  }
  else
  {
    double v14 = [MEMORY[0x263F7C7F0] currentHandler];
    float v15 = [NSString stringWithUTF8String:"-[TSDStrokePattern mixedObjectWithFraction:ofObject:]"];
    float v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStroke.m"];
    [v14 handleFailureInFunction:v15 file:v16 lineNumber:393 description:@"nil object after cast"];

    uint64_t v13 = +[TSDStrokePattern emptyPattern];
  }
  float v17 = (void *)v13;

  return v17;
}

- (int64_t)patternType
{
  return self->_type;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)phase
{
  return self->_phase;
}

@end