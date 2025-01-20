@interface _SUICCheckGlyphSpringAnimationFactory
+ (double)defaultDuration;
+ (id)springAnimationWithKeyPath:(id)a3;
+ (id)springAnimationWithKeyPath:(id)a3 velocity:(double)a4;
- (CAMediaTimingFunction)timing;
- (_SUICCheckGlyphSpringAnimationFactory)init;
- (_SUICCheckGlyphSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6;
- (_SUICCheckGlyphSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6 timing:(id)a7;
- (_SUICCheckGlyphSpringAnimationFactory)initWithVelocity:(double)a3;
- (_SUICCheckGlyphSpringAnimationFactory)initWithVelocity:(double)a3 timing:(id)a4;
- (double)damping;
- (double)duration;
- (double)mass;
- (double)stiffness;
- (double)velocity;
- (id)_springAnimationWithKeyPath:(id)a3;
- (id)_timingFunctionForAnimation;
- (id)springAnimationWithKeyPath:(id)a3;
- (void)_updateDurationIfNecessary;
- (void)dealloc;
- (void)setDamping:(double)a3;
- (void)setMass:(double)a3;
- (void)setStiffness:(double)a3;
- (void)setTiming:(id)a3;
- (void)setVelocity:(double)a3;
@end

@implementation _SUICCheckGlyphSpringAnimationFactory

+ (double)defaultDuration
{
  if (_SUICInitializeStaticVariables_onceToken != -1) {
    dispatch_once(&_SUICInitializeStaticVariables_onceToken, &__block_literal_global_182);
  }
  return *(double *)&_SUICDefaultSpringAnimationDuration;
}

+ (id)springAnimationWithKeyPath:(id)a3
{
  return (id)[a1 springAnimationWithKeyPath:a3 velocity:0.0];
}

+ (id)springAnimationWithKeyPath:(id)a3 velocity:(double)a4
{
  id v5 = a3;
  if (_SUICInitializeStaticVariables_onceToken != -1) {
    dispatch_once(&_SUICInitializeStaticVariables_onceToken, &__block_literal_global_182);
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v6 = _SUICDefaultSpringAnimationFactoryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___SUICCheckGlyphSpringAnimationFactory_springAnimationWithKeyPath_velocity___block_invoke;
  block[3] = &unk_1E5C593C8;
  double v13 = a4;
  id v11 = v5;
  v12 = &v14;
  id v7 = v5;
  dispatch_sync(v6, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (_SUICCheckGlyphSpringAnimationFactory)init
{
  return [(_SUICCheckGlyphSpringAnimationFactory *)self initWithVelocity:0.0];
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithVelocity:(double)a3
{
  id v5 = [(id)objc_opt_class() defaultTimingFunction];
  v6 = [(_SUICCheckGlyphSpringAnimationFactory *)self initWithVelocity:v5 timing:a3];

  return v6;
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithVelocity:(double)a3 timing:(id)a4
{
  return [(_SUICCheckGlyphSpringAnimationFactory *)self initWithMass:a4 stiffness:2.0 damping:300.0 velocity:400.0 timing:a3];
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6
{
  id v11 = [(id)objc_opt_class() defaultTimingFunction];
  v12 = [(_SUICCheckGlyphSpringAnimationFactory *)self initWithMass:v11 stiffness:a3 damping:a4 velocity:a5 timing:a6];

  return v12;
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6 timing:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)_SUICCheckGlyphSpringAnimationFactory;
  uint64_t v14 = [(_SUICCheckGlyphSpringAnimationFactory *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_mass = a3;
    v14->_stiffness = a4;
    v14->_damping = a5;
    v14->_velocity = a6;
    objc_storeStrong((id *)&v14->_timing, a7);
    v15->_needsDurationUpdate = 1;
  }

  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_SUICCheckGlyphSpringAnimationFactory;
  [(_SUICCheckGlyphSpringAnimationFactory *)&v2 dealloc];
}

- (id)springAnimationWithKeyPath:(id)a3
{
  v3 = [(_SUICCheckGlyphSpringAnimationFactory *)self _springAnimationWithKeyPath:a3];
  [v3 setAdditive:1];

  return v3;
}

- (id)_springAnimationWithKeyPath:(id)a3
{
  v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a3];
  [v4 setMass:self->_mass];
  [v4 setStiffness:self->_stiffness];
  [v4 setDamping:self->_damping];
  [v4 setVelocity:self->_velocity];
  [v4 setTimingFunction:self->_timing];
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v4 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  [(_SUICCheckGlyphSpringAnimationFactory *)self duration];
  objc_msgSend(v4, "setDuration:");

  return v4;
}

- (id)_timingFunctionForAnimation
{
  return self->_timing;
}

- (void)_updateDurationIfNecessary
{
  if (self->_needsDurationUpdate)
  {
    self->_needsDurationUpdate = 0;
    id v4 = [(_SUICCheckGlyphSpringAnimationFactory *)self _springAnimationWithKeyPath:0];
    [v4 durationForEpsilon:0.001];
    self->_duration = v3;
  }
}

- (double)duration
{
  return self->_duration;
}

- (void)setMass:(double)a3
{
  if (self->_mass != a3)
  {
    self->_mass = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setStiffness:(double)a3
{
  if (self->_stiffness != a3)
  {
    self->_stiffness = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setDamping:(double)a3
{
  if (self->_damping != a3)
  {
    self->_damping = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setVelocity:(double)a3
{
  if (self->_velocity != a3)
  {
    self->_velocity = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setTiming:(id)a3
{
  self->_needsDurationUpdate = 1;
}

- (double)mass
{
  return self->_mass;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)damping
{
  return self->_damping;
}

- (double)velocity
{
  return self->_velocity;
}

- (CAMediaTimingFunction)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
}

@end