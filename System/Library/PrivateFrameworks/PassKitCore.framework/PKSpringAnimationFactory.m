@interface PKSpringAnimationFactory
+ (double)defaultDuration;
+ (id)createDefaultFactory;
+ (id)highFrameRateSpringAnimationWithKeyPath:(id)a3 reason:(unsigned __int16)a4;
+ (id)sharedDefaultFactory;
+ (id)springAnimationWithKeyPath:(id)a3;
- (CAMediaTimingFunction)timing;
- (PKSpringAnimationFactory)init;
- (PKSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5;
- (PKSpringAnimationFactory)initWithSpringState:(id)a3;
- (double)_durationWithReferenceSpring:(uint64_t)a1;
- (double)damping;
- (double)duration;
- (double)mass;
- (double)speed;
- (double)stiffness;
- (double)velocity;
- (id)_createSpringAnimationWithKeyPath:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)highFrameRateSpringAnimationWithKeyPath:(id)a3 reason:(unsigned __int16)a4;
- (id)springAnimationWithKeyPath:(id)a3;
- (void)_createReferenceSpringAnimationWithKeyPath:(double *)a1;
- (void)dealloc;
- (void)setDamping:(double)a3;
- (void)setMass:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setStiffness:(double)a3;
- (void)setTiming:(id)a3;
- (void)setTiming:(id)a3 withDynamicDurationProvider:(id)a4;
- (void)setVelocity:(double)a3;
@end

@implementation PKSpringAnimationFactory

- (double)duration
{
  return -[PKSpringAnimationFactory _durationWithReferenceSpring:]((uint64_t)self, 0);
}

+ (id)createDefaultFactory
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMass:2.0 stiffness:300.0 damping:400.0];
  v3 = PKMagicCurve();
  [v2 setTiming:v3];

  return v2;
}

- (void)setTiming:(id)a3 withDynamicDurationProvider:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v11 = v7;
    objc_storeStrong((id *)&self->_timing, a3);
    id v8 = a4;
    v9 = _Block_copy(v8);

    id dynamicDurationProvider = self->_dynamicDurationProvider;
    self->_id dynamicDurationProvider = v9;

    id v7 = v11;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setTiming:(id)a3
{
  if (a3)
  {
    -[PKSpringAnimationFactory setTiming:withDynamicDurationProvider:](self, "setTiming:withDynamicDurationProvider:");
  }
  else if (self)
  {
    timing = self->_timing;
    if (timing)
    {
      self->_timing = 0;

      id dynamicDurationProvider = self->_dynamicDurationProvider;
      self->_id dynamicDurationProvider = 0;

      self->_needsDurationUpdate = 1;
    }
  }
}

- (PKSpringAnimationFactory)initWithSpringState:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)PKSpringAnimationFactory;
  result = [(PKSpringAnimationFactory *)&v8 init];
  if (result)
  {
    result->_speed = 1.0;
    result->_state.mass = var0;
    result->_state.stiffness = var1;
    result->_state.damping = var2;
    result->_state.velocity = var3;
    result->_needsDurationUpdate = 1;
  }
  return result;
}

- (PKSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  return -[PKSpringAnimationFactory initWithSpringState:](self, "initWithSpringState:", a3, a4, a5, 0.0);
}

+ (id)highFrameRateSpringAnimationWithKeyPath:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = qword_1EB402C38;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_1EB402C38, &__block_literal_global_40);
  }
  id v7 = [(id)_MergedGlobals_206 highFrameRateSpringAnimationWithKeyPath:v6 reason:v4];

  return v7;
}

+ (id)springAnimationWithKeyPath:(id)a3
{
  uint64_t v3 = qword_1EB402C38;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB402C38, &__block_literal_global_40);
  }
  uint64_t v5 = [(id)_MergedGlobals_206 springAnimationWithKeyPath:v4];

  return v5;
}

- (id)highFrameRateSpringAnimationWithKeyPath:(id)a3 reason:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v5 = [(PKSpringAnimationFactory *)self springAnimationWithKeyPath:a3];
  [v5 setHighFrameRateReason:v4 | 0x210000u];
  LODWORD(v6) = 1117782016;
  LODWORD(v7) = 1123024896;
  LODWORD(v8) = 1123024896;
  objc_msgSend(v5, "setPreferredFrameRateRange:", v6, v7, v8);
  return v5;
}

- (id)springAnimationWithKeyPath:(id)a3
{
  id v3 = [(PKSpringAnimationFactory *)self _createSpringAnimationWithKeyPath:a3];
  [v3 setAdditive:1];
  return v3;
}

- (id)_createSpringAnimationWithKeyPath:(id)a3
{
  int v4 = -[PKSpringAnimationFactory _createReferenceSpringAnimationWithKeyPath:]((double *)self, (uint64_t)a3);
  double v5 = -[PKSpringAnimationFactory _durationWithReferenceSpring:]((uint64_t)self, v4);
  double speed = self->_speed;
  *(float *)&double speed = speed;
  [v4 setSpeed:speed];
  [v4 setTimingFunction:self->_timing];
  [v4 setDuration:v5];
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v4 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  return v4;
}

- (double)_durationWithReferenceSpring:(uint64_t)a1
{
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      *(unsigned char *)(a1 + 56) = 0;
      if (!v3) {
        int v4 = -[PKSpringAnimationFactory _createReferenceSpringAnimationWithKeyPath:]((double *)a1, 0);
      }
      [v4 durationForEpsilon:0.001];
      double v6 = v5;
      if (*(void *)(a1 + 72))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        if (v7) {
          double v6 = fmax((*(double (**)(double, double, double, double, double))(v7 + 16))(*(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), v5), v5);
        }
      }
      *(double *)(a1 + 40) = v6;
    }
    else
    {
      double v6 = *(double *)(a1 + 40);
    }
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)_createReferenceSpringAnimationWithKeyPath:(double *)a1
{
  if (!a1) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a2];
  [v3 setMass:a1[1]];
  [v3 setStiffness:a1[2]];
  [v3 setDamping:a1[3]];
  [v3 setVelocity:a1[4]];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKSpringAnimationFactory;
  [(PKSpringAnimationFactory *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong(&self->_dynamicDurationProvider, 0);
}

- (void)setVelocity:(double)a3
{
  if (self->_state.velocity != a3)
  {
    self->_state.velocity = a3;
    self->_needsDurationUpdate = 1;
  }
}

+ (id)sharedDefaultFactory
{
  if (qword_1EB402C38 != -1) {
    dispatch_once(&qword_1EB402C38, &__block_literal_global_40);
  }
  objc_super v2 = (void *)_MergedGlobals_206;
  return v2;
}

+ (double)defaultDuration
{
  if (qword_1EB402C38 != -1) {
    dispatch_once(&qword_1EB402C38, &__block_literal_global_40);
  }
  uint64_t v2 = _MergedGlobals_206;
  return -[PKSpringAnimationFactory _durationWithReferenceSpring:](v2, 0);
}

- (PKSpringAnimationFactory)init
{
  return 0;
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpringAnimationFactory;
  return [(PKSpringAnimationFactory *)&v3 copy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpringState:", self->_state.mass, self->_state.stiffness, self->_state.damping, self->_state.velocity);
  [v4 setSpeed:self->_speed];
  timing = self->_timing;
  if (timing) {
    [v4 setTiming:timing withDynamicDurationProvider:self->_dynamicDurationProvider];
  }
  return v4;
}

- (void)setSpeed:(double)a3
{
  if (self->_speed != a3) {
    self->_double speed = a3;
  }
}

- (double)mass
{
  return self->_state.mass;
}

- (void)setMass:(double)a3
{
  if (self->_state.mass != a3)
  {
    self->_state.mass = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (double)stiffness
{
  return self->_state.stiffness;
}

- (void)setStiffness:(double)a3
{
  if (self->_state.stiffness != a3)
  {
    self->_state.stiffness = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (double)damping
{
  return self->_state.damping;
}

- (void)setDamping:(double)a3
{
  if (self->_state.damping != a3)
  {
    self->_state.damping = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (double)velocity
{
  return self->_state.velocity;
}

- (double)speed
{
  return self->_speed;
}

- (CAMediaTimingFunction)timing
{
  return self->_timing;
}

@end