@interface PTCinematographyFocusPuller
+ (float)defaultEMASampleCount;
+ (float)defaultMaximumVelocity;
+ (float)defaultResistance;
+ (unint64_t)defaultStrategy;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (PTCinematographyFocusPuller)init;
- (PTCinematographyFocusPuller)initWithExponentialMovingAverageAlpha:(float)a3;
- (PTCinematographyFocusPuller)initWithExponentialMovingAverageSampleCount:(unint64_t)a3;
- (PTCinematographyFocusPuller)initWithMaximumVelocity:(float)a3 resistance:(float)a4;
- (float)_emaDelta:(float)a3;
- (float)_minimumTimestepsToMoveBy:(float)a3 maxddx:(float)a4;
- (float)_weightedDialDelta:(float)a3 timeDelta:(float)a4;
- (float)alpha;
- (float)focusDistance;
- (float)maximumAcceleration;
- (float)maximumVelocity;
- (float)pullTowardFocusDistance:(float)a3 time:(id *)a4;
- (float)pullTowardFocusDistance:(float)a3 time:(id *)a4 missing:(BOOL)a5;
- (float)resistance;
- (float)targetDistance;
- (float)velocity;
- (id)_asCinematographyDictionary;
- (id)_initWithCinematographyDictionary:(id)a3;
- (unint64_t)sampleCount;
- (unint64_t)strategy;
- (void)reset;
- (void)setAlpha:(float)a3;
- (void)setFocusDistance:(float)a3;
- (void)setFocusDistance:(float)a3 time:(id *)a4;
- (void)setSampleCount:(unint64_t)a3;
- (void)setTargetDistance:(float)a3;
- (void)setTime:(id *)a3;
- (void)setVelocity:(float)a3;
@end

@implementation PTCinematographyFocusPuller

+ (unint64_t)defaultStrategy
{
  if (defaultStrategy_onceToken != -1) {
    dispatch_once(&defaultStrategy_onceToken, &__block_literal_global);
  }
  return 0;
}

+ (float)defaultEMASampleCount
{
  if (defaultEMASampleCount_onceToken != -1) {
    dispatch_once(&defaultEMASampleCount_onceToken, &__block_literal_global_9);
  }
  return *(float *)&defaultEMASampleCount_sDefaultEMASampleCount;
}

void __52__PTCinematographyFocusPuller_defaultEMASampleCount__block_invoke()
{
  defaultEMASampleCount_sDefaultEMASampleCount = 1088421888;
}

+ (float)defaultMaximumVelocity
{
  if (defaultMaximumVelocity_onceToken != -1) {
    dispatch_once(&defaultMaximumVelocity_onceToken, &__block_literal_global_11);
  }
  return *(float *)&defaultMaximumVelocity_sDefaultMaximumVelocity;
}

void __53__PTCinematographyFocusPuller_defaultMaximumVelocity__block_invoke()
{
  defaultMaximumVelocity_sDefaultMaximumVelocity = 1091567616;
}

+ (float)defaultResistance
{
  if (defaultResistance_onceToken != -1) {
    dispatch_once(&defaultResistance_onceToken, &__block_literal_global_13);
  }
  return *(float *)&defaultResistance_sDefaultResistance;
}

void __48__PTCinematographyFocusPuller_defaultResistance__block_invoke()
{
  defaultResistance_sDefaultResistance = 1036831949;
}

- (PTCinematographyFocusPuller)init
{
  uint64_t v3 = [(id)objc_opt_class() defaultStrategy];
  v4 = objc_opt_class();
  if (v3 == 1)
  {
    [v4 defaultMaximumVelocity];
    int v6 = v5;
    [(id)objc_opt_class() defaultResistance];
    LODWORD(v8) = v7;
    LODWORD(v9) = v6;
    v10 = [(PTCinematographyFocusPuller *)self initWithMaximumVelocity:v9 resistance:v8];
  }
  else
  {
    [v4 defaultEMASampleCount];
    v10 = [(PTCinematographyFocusPuller *)self initWithExponentialMovingAverageSampleCount:(unint64_t)v11];
  }
  v12 = v10;

  return v12;
}

- (PTCinematographyFocusPuller)initWithExponentialMovingAverageAlpha:(float)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyFocusPuller;
  v4 = [(PTCinematographyFocusPuller *)&v9 init];
  int v6 = v4;
  if (v4)
  {
    v4->_strategy = 0;
    *(float *)&double v5 = a3;
    [(PTCinematographyFocusPuller *)v4 setAlpha:v5];
    int v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyFocusPuller initWithExponentialMovingAverageAlpha:]((uint64_t)v6, v7);
    }
  }
  return v6;
}

- (PTCinematographyFocusPuller)initWithExponentialMovingAverageSampleCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyFocusPuller;
  v4 = [(PTCinematographyFocusPuller *)&v8 init];
  double v5 = v4;
  if (v4)
  {
    v4->_strategy = 0;
    [(PTCinematographyFocusPuller *)v4 setSampleCount:a3];
    int v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyFocusPuller initWithExponentialMovingAverageSampleCount:]((uint64_t)v5, v6);
    }
  }
  return v5;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  float v3 = fminf(a3, 1.0);
  self->_alpha = v3;
  if (v3 <= 0.0) {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v4 = llroundf((float)(2.0 / v3) + -1.0);
  }
  self->_sampleCount = v4;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  self->_sampleCount = v3;
  self->_alpha = 2.0 / (float)((float)v3 + 1.0);
}

- (PTCinematographyFocusPuller)initWithMaximumVelocity:(float)a3 resistance:(float)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PTCinematographyFocusPuller;
  int v6 = [(PTCinematographyFocusPuller *)&v13 init];
  int v7 = v6;
  if (v6)
  {
    float v8 = fabsf(a4);
    v6->_resistance = v8;
    v6->_strategy = 1;
    float v9 = fabsf(a3);
    v6->_maximumVelocity = v9;
    float v10 = v9 / v8;
    if (a4 == 0.0) {
      float v10 = INFINITY;
    }
    v6->_maximumAcceleration = v10;
    float v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyFocusPuller initWithMaximumVelocity:resistance:](&v7->_maximumVelocity, &v7->_resistance, v11);
    }
  }
  return v7;
}

- (void)reset
{
  self->_time = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
}

- (void)setFocusDistance:(float)a3 time:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var0;
  self->_time.epoch = a4->var3;
  *(_OWORD *)&self->_time.value = v4;
  self->_velocity = 0.0;
  self->_focusDistance = a3;
  self->_targetDistance = a3;
}

- (float)_emaDelta:(float)a3
{
  return self->_alpha * a3;
}

- (float)_weightedDialDelta:(float)a3 timeDelta:(float)a4
{
  v21.i64[0] = *(void *)&a3;
  [(PTCinematographyFocusPuller *)self maximumVelocity];
  float v7 = v6;
  [(PTCinematographyFocusPuller *)self maximumAcceleration];
  int8x16_t v8 = v21;
  *(float *)v9.i32 = (float)(*(float *)v10.i32 * a4) * a4;
  *(float *)v10.i32 = fabsf(*(float *)v21.i32);
  int8x16_t v20 = v9;
  if (*(float *)v10.i32 > *(float *)v9.i32)
  {
    v10.i32[0] = v21.i32[0];
    -[PTCinematographyFocusPuller _minimumTimestepsToMoveBy:maxddx:](self, "_minimumTimestepsToMoveBy:maxddx:", *(double *)v10.i64);
    *(float *)v10.i32 = *(float *)v20.i32 * *(float *)v10.i32;
    v9.i64[0] = 0x8000000080000000;
    v9.i64[1] = 0x8000000080000000;
    int8x16_t v8 = vbslq_s8(v9, v10, v21);
    *(float *)v10.i32 = fabsf(*(float *)v10.i32);
  }
  *(float *)v9.i32 = v7 * a4;
  v11.i64[0] = 0x8000000080000000;
  v11.i64[1] = 0x8000000080000000;
  unsigned __int32 v12 = vbslq_s8(v11, v9, v8).u32[0];
  if (*(float *)v10.i32 <= (float)(v7 * a4)) {
    float v13 = *(float *)v8.i32;
  }
  else {
    float v13 = *(float *)&v12;
  }
  [(PTCinematographyFocusPuller *)self velocity];
  float v15 = v14 * a4;
  *(float *)v16.i32 = v13 - v15;
  float v17 = vabds_f32(v13, v15);
  v18.i64[0] = 0x8000000080000000;
  v18.i64[1] = 0x8000000080000000;
  float result = v15 + *(float *)vbslq_s8(v18, v20, v16).i32;
  if (v17 <= *(float *)v20.i32) {
    return v13;
  }
  return result;
}

- (float)pullTowardFocusDistance:(float)a3 time:(id *)a4
{
  [(PTCinematographyFocusPuller *)self time];
  if (v22)
  {
    self->_targetDistance = a3;
    [(PTCinematographyFocusPuller *)self time];
    CMTime lhs = (CMTime)*a4;
    CMTimeSubtract(&time, &lhs, &v19);
    float Seconds = CMTimeGetSeconds(&time);
    int v9 = LODWORD(Seconds) & 0x7FFFFFFF;
    [(PTCinematographyFocusPuller *)self focusDistance];
    if ((LODWORD(Seconds) & 0x7FFFFFFFu) <= 0x7F800000 && v9 != 2139095040 && v9 != 0)
    {
      float v12 = fabsf(Seconds);
      float v13 = a3 - result;
      if ([(PTCinematographyFocusPuller *)self strategy])
      {
        *(float *)&double v14 = v13;
        *(float *)&double v15 = v12;
        [(PTCinematographyFocusPuller *)self _weightedDialDelta:v14 timeDelta:v15];
      }
      else
      {
        *(float *)&double v14 = v13;
        [(PTCinematographyFocusPuller *)self _emaDelta:v14];
      }
      float v17 = v16;
      long long v18 = *(_OWORD *)&a4->var0;
      self->_time.epoch = a4->var3;
      *(_OWORD *)&self->_time.value = v18;
      float result = v17 + self->_focusDistance;
      self->_focusDistance = result;
      self->_velocity = v17 / v12;
    }
  }
  else
  {
    [(PTCinematographyFocusPuller *)self setFocusDistance:&lhs time:COERCE_DOUBLE(__PAIR64__(HIDWORD(a4->var0), LODWORD(a3)))];
    return a3;
  }
  return result;
}

- (float)pullTowardFocusDistance:(float)a3 time:(id *)a4 missing:(BOOL)a5
{
  float v7 = self;
  if (!a5)
  {
    long long v8 = *(_OWORD *)&a4->var0;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
    *(float *)&long long v8 = a3;
    goto LABEL_5;
  }
  [(PTCinematographyFocusPuller *)self time];
  if (v12)
  {
    *(float *)&long long v8 = v7->_targetDistance;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
    self = v7;
LABEL_5:
    -[PTCinematographyFocusPuller pullTowardFocusDistance:time:](self, "pullTowardFocusDistance:time:", &v11, *(double *)&v8, *(_OWORD *)&v11.var0, v11.var3);
    return v9;
  }
  return a3;
}

- (float)_minimumTimestepsToMoveBy:(float)a3 maxddx:(float)a4
{
  return (float)(sqrtf((float)((float)(fabsf(a3) * 8.0) / a4) + 1.0) + -1.0) * 0.5;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"_alpha"];
  [v5 floatValue];
  float v7 = v6;

  long long v8 = [v4 objectForKeyedSubscript:@"_maxv"];
  [v8 floatValue];
  float v10 = v9;

  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = [v4 objectForKeyedSubscript:@"_resistance"];

  [v11 floatValue];
  int v13 = v12;

  if (v7 > 0.0)
  {
    float v16 = self;
    *(float *)&double v14 = v7;
LABEL_6:
    float v17 = [(PTCinematographyFocusPuller *)v16 initWithExponentialMovingAverageAlpha:v14];
    goto LABEL_7;
  }
  if (v10 <= 0.0)
  {
    LODWORD(v14) = 1.0;
    float v16 = self;
    goto LABEL_6;
  }
  *(float *)&double v14 = v10;
  LODWORD(v15) = v13;
  float v17 = [(PTCinematographyFocusPuller *)self initWithMaximumVelocity:v14 resistance:v15];
LABEL_7:
  long long v18 = v17;

  return v18;
}

- (id)_asCinematographyDictionary
{
  unint64_t v3 = objc_opt_new();
  id v4 = NSNumber;
  [(PTCinematographyFocusPuller *)self alpha];
  double v5 = objc_msgSend(v4, "numberWithFloat:");
  [v3 setObject:v5 forKeyedSubscript:@"_alpha"];

  float v6 = NSNumber;
  [(PTCinematographyFocusPuller *)self maximumVelocity];
  float v7 = objc_msgSend(v6, "numberWithFloat:");
  [v3 setObject:v7 forKeyedSubscript:@"_maxv"];

  long long v8 = NSNumber;
  [(PTCinematographyFocusPuller *)self resistance];
  float v9 = objc_msgSend(v8, "numberWithFloat:");
  [v3 setObject:v9 forKeyedSubscript:@"_resistance"];

  float v10 = (void *)[v3 copy];

  return v10;
}

- (unint64_t)strategy
{
  return self->_strategy;
}

- (float)maximumVelocity
{
  return self->_maximumVelocity;
}

- (float)resistance
{
  return self->_resistance;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (float)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(float)a3
{
  self->_velocity = a3;
}

- (float)maximumAcceleration
{
  return self->_maximumAcceleration;
}

- (float)targetDistance
{
  return self->_targetDistance;
}

- (void)setTargetDistance:(float)a3
{
  self->_targetDistance = a3;
}

- (double)initWithExponentialMovingAverageAlpha:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = *(float *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = 134218240;
  double v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "focus puller: EMA (alpha: %g, sampleCount: %lu)", (uint8_t *)&v5, 0x16u);
  return result;
}

- (double)initWithExponentialMovingAverageSampleCount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(float *)(a1 + 8);
  int v5 = 134218240;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  double v8 = v3;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "focus puller: EMA (sampleCount: %lu, alpha: %g)", (uint8_t *)&v5, 0x16u);
  return result;
}

- (double)initWithMaximumVelocity:(os_log_t)log resistance:.cold.1(float *a1, float *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v3 = *a1;
  double v4 = *a2;
  int v6 = 134218240;
  double v7 = v3;
  __int16 v8 = 2048;
  double v9 = v4;
  _os_log_debug_impl(&dword_1D0778000, log, OS_LOG_TYPE_DEBUG, "focus puller: weighted dial (maxv: %g, resistance: %g)", (uint8_t *)&v6, 0x16u);
  return result;
}

@end