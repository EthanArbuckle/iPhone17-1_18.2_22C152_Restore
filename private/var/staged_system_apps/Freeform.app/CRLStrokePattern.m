@interface CRLStrokePattern
+ (CRLStrokePattern)strokePatternWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5;
+ (id)dashPatternWithSpacing:(double)a3;
+ (id)emptyPattern;
+ (id)longDashPattern;
+ (id)mediumDashPattern;
+ (id)roundDashPattern;
+ (id)roundDashPatternWithSpacing:(double)a3;
+ (id)shortDashPattern;
+ (id)solidPattern;
- (BOOL)isDash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRoundDash;
- (CRLStrokePattern)initWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5;
- (CRLStrokePattern)initWithPatternType:(int64_t)a3 pattern:(const double *)a4 count:(unint64_t)a5 phase:(double)a6;
- (double)p_renderableLengthForUnclippedPatternWithLineWidth:(double)a3 withinAvailableLength:(double)a4;
- (double)pattern;
- (double)phase;
- (id)description;
- (id)p_patternString;
- (id)p_typeString;
- (int64_t)patternType;
- (unint64_t)count;
- (unint64_t)hash;
- (void)applyToContext:(CGContext *)a3 lineWidth:(double)a4;
- (void)applyToShapeRenderable:(id)a3;
- (void)i_applyToContext:(CGContext *)a3 lineWidth:(double)a4 capStyle:(unint64_t *)a5;
- (void)p_applyToShapeRenderable:(id)a3 lineWidth:(double)a4;
@end

@implementation CRLStrokePattern

- (CRLStrokePattern)initWithPatternType:(int64_t)a3 pattern:(const double *)a4 count:(unint64_t)a5 phase:(double)a6
{
  v16.receiver = self;
  v16.super_class = (Class)CRLStrokePattern;
  v9 = [(CRLStrokePattern *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    if (a5 >= 7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EEEF0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A0074();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EEF10);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStrokePattern initWithPatternType:pattern:count:phase:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 46, 0, "Pattern should have no more than CRL_MAX_STROKE_PATTERN (%d) elements", 6);
    }
    unint64_t v14 = 6;
    if (a5 < 6) {
      unint64_t v14 = a5;
    }
    v10->_count = v14;
    if (a4) {
      memcpy(v10->_pattern, a4, 8 * v14);
    }
  }
  return v10;
}

- (CRLStrokePattern)initWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  return [(CRLStrokePattern *)self initWithPatternType:0 pattern:a3 count:a4 phase:a5];
}

+ (id)solidPattern
{
  if (qword_1016A96A0 != -1) {
    dispatch_once(&qword_1016A96A0, &stru_1014EEF30);
  }
  v2 = (void *)qword_1016A96A8;

  return v2;
}

+ (id)emptyPattern
{
  if (qword_1016A96B0 != -1) {
    dispatch_once(&qword_1016A96B0, &stru_1014EEF50);
  }
  v2 = (void *)qword_1016A96B8;

  return v2;
}

+ (id)shortDashPattern
{
  if (qword_1016A96C0 != -1) {
    dispatch_once(&qword_1016A96C0, &stru_1014EEF70);
  }
  v2 = (void *)qword_1016A96C8;

  return v2;
}

+ (id)mediumDashPattern
{
  if (qword_1016A96D0 != -1) {
    dispatch_once(&qword_1016A96D0, &stru_1014EEF90);
  }
  v2 = (void *)qword_1016A96D8;

  return v2;
}

+ (id)longDashPattern
{
  if (qword_1016A96E0 != -1) {
    dispatch_once(&qword_1016A96E0, &stru_1014EEFB0);
  }
  v2 = (void *)qword_1016A96E8;

  return v2;
}

+ (id)roundDashPattern
{
  if (qword_1016A96F0 != -1) {
    dispatch_once(&qword_1016A96F0, &stru_1014EEFD0);
  }
  v2 = (void *)qword_1016A96F8;

  return v2;
}

+ (id)roundDashPatternWithSpacing:(double)a3
{
  v5[0] = 0x3F50624DD2F1A9FCLL;
  *(double *)&v5[1] = a3;
  v3 = +[CRLStrokePattern strokePatternWithPattern:v5 count:2 phase:0.0];

  return v3;
}

+ (id)dashPatternWithSpacing:(double)a3
{
  *(double *)v5 = a3;
  *(double *)&v5[1] = a3;
  v3 = +[CRLStrokePattern strokePatternWithPattern:v5 count:2 phase:0.0];

  return v3;
}

+ (CRLStrokePattern)strokePatternWithPattern:(const double *)a3 count:(unint64_t)a4 phase:(double)a5
{
  v5 = [[CRLStrokePattern alloc] initWithPattern:a3 count:a4 phase:a5];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRLStrokePattern *)a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);
  if (!v4) {
    goto LABEL_22;
  }
  if (v4 == self)
  {
LABEL_23:
    LOBYTE(v21) = 1;
    goto LABEL_24;
  }
  if ([(CRLStrokePattern *)self patternType]
    && (id v7 = -[CRLStrokePattern patternType](self, "patternType"), v7 != [v6 patternType])
    || (-[CRLStrokePattern phase](self, "phase"), double v9 = v8, [v6 phase], v9 != v10)
    && vabdd_f64(v9, v10) >= 0.00999999978
    || (id v11 = -[CRLStrokePattern count](self, "count"), v11 != [v6 count]))
  {
LABEL_22:
    LOBYTE(v21) = 0;
    goto LABEL_24;
  }
  unint64_t v12 = [(CRLStrokePattern *)self count];
  if (v12 >= 6) {
    uint64_t v13 = 6;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t v14 = (double *)[v6 pattern];
  if (!v13) {
    goto LABEL_23;
  }
  pattern = self->_pattern;
  uint64_t v16 = v13 - 1;
  do
  {
    double v17 = *pattern++;
    double v18 = v17;
    double v19 = *v14++;
    BOOL v20 = v18 == v19;
    BOOL v21 = vabdd_f64(v18, v19) < 0.00999999978 || v20;
    BOOL v23 = v16-- != 0;
  }
  while (v21 && v23);
LABEL_24:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3 = sub_1000C8048((char *)&self->_count, 8);

  return sub_1000C8080((char *)&self->_type, 8, v3);
}

- (id)description
{
  uint64_t v3 = [(CRLStrokePattern *)self p_patternString];
  v4 = [(CRLStrokePattern *)self p_typeString];
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = +[NSString stringWithFormat:@"%@ (%p) pattern: %@ count: %ld phase: %f type: %@", v6, self, v3, self->_count, *(void *)&self->_phase, v4];

  return v7;
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
        +[NSString stringWithFormat:@"%@, %f", v4, *(void *)&pattern[v3]];
      }
      else {
      v6 = +[NSString stringWithFormat:@"%f", *(void *)pattern, v8];
      }

      ++v3;
      v4 = v6;
    }
    while (v3 < self->_count);
  }
  else
  {
    v6 = @"none";
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
    return *(&off_1014EF1B0 + type);
  }
}

- (double)pattern
{
  return self->_pattern;
}

- (BOOL)isDash
{
  if (self->_count != 2) {
    return 0;
  }
  double v2 = self->_pattern[0];
  double v3 = self->_pattern[1];
  if (v2 != v3 && vabdd_f64(v2, v3) >= 0.0001) {
    return 0;
  }
  if (fabs(v2 + -0.001) >= 0.0001) {
    return v2 != 0.001;
  }
  return 0;
}

- (BOOL)isRoundDash
{
  if (self->_count != 2) {
    return 0;
  }
  BOOL result = 0;
  double v4 = self->_pattern[0];
  double v5 = self->_pattern[1];
  if (v4 != v5 && vabdd_f64(v4, v5) >= 0.0001) {
    return fabs(v4 + -0.001) < 0.0001 || v4 == 0.001;
  }
  return result;
}

- (void)applyToContext:(CGContext *)a3 lineWidth:(double)a4
{
}

- (void)i_applyToContext:(CGContext *)a3 lineWidth:(double)a4 capStyle:(unint64_t *)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)lengths = 0u;
  double v9 = [(CRLStrokePattern *)self pattern];
  unint64_t count = self->_count;
  if (count)
  {
    id v11 = lengths;
    do
    {
      double v12 = *v9++;
      *v11++ = v12 * a4;
      --count;
    }
    while (count);
  }
  double phase = self->_phase;
  if ([(CRLStrokePattern *)self isRoundDash])
  {
    memset(&v17, 0, sizeof(v17));
    CGContextGetCTM(&v17, a3);
    CGAffineTransform v16 = v17;
    double v14 = sub_10007F808(&v16.a);
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
  if ((id)[(CRLStrokePattern *)self count] == (id)2)
  {
    double v7 = *[(CRLStrokePattern *)self pattern] * a3;
    double v8 = [(CRLStrokePattern *)self pattern][1] * a3;
    [(CRLStrokePattern *)self phase];
    double v10 = v9 * a3;
    unsigned int v11 = [(CRLStrokePattern *)self isRoundDash];
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
      if ([(CRLStrokePattern *)self isRoundDash]) {
        return a4 + v8 * -0.5;
      }
    }
  }
  return a4;
}

- (void)applyToShapeRenderable:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEFF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A011C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF010);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStrokePattern applyToShapeRenderable:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLStroke.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 324, 0, "invalid nil value for '%{public}s'", "shapeRenderable");
  }
  [v4 lineWidth];
  -[CRLStrokePattern p_applyToShapeRenderable:lineWidth:](self, "p_applyToShapeRenderable:lineWidth:", v4);
}

- (void)p_applyToShapeRenderable:(id)a3 lineWidth:(double)a4
{
  id v12 = a3;
  if ((id)[(CRLStrokePattern *)self patternType] == (id)1)
  {
    [v12 setLineDashPattern:0];
  }
  else if (![(CRLStrokePattern *)self patternType])
  {
    [v12 setLineDashPhase:self->_phase * a4];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    double v7 = [(CRLStrokePattern *)self pattern];
    if (self->_count)
    {
      double v8 = v7;
      unint64_t v9 = 0;
      do
      {
        double v10 = v8[v9] * a4;
        if (v9 == 1 && [(CRLStrokePattern *)self isRoundDash])
        {
          [v12 setLineDashPhase:0.5];
          double v10 = v10 + a4;
        }
        unsigned int v11 = +[NSNumber numberWithDouble:v10];
        [v6 addObject:v11];

        ++v9;
      }
      while (v9 < self->_count);
    }
    [v12 setLineDashPattern:v6];
  }
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