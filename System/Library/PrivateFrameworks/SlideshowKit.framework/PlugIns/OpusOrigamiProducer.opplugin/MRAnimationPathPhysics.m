@interface MRAnimationPathPhysics
- (MRAnimationPathPhysics)initWithMCAnimationPath:(id)a3;
- (float)baseValue;
- (float)computeValueForTime:(double)a3 withContext:(id)a4;
- (float)velocity;
- (void)setBaseValue:(float)a3;
- (void)setVelocity:(float)a3;
@end

@implementation MRAnimationPathPhysics

- (MRAnimationPathPhysics)initWithMCAnimationPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRAnimationPathPhysics;
  v4 = [(MRAnimationPathPhysics *)&v6 init];
  if (v4)
  {
    -[MCAnimationPath setKey:](v4, "setKey:", [a3 key]);
    [a3 staticFriction];
    -[MCAnimationPathPhysics setStaticFriction:](v4, "setStaticFriction:");
    [a3 kineticFriction];
    -[MCAnimationPathPhysics setKineticFriction:](v4, "setKineticFriction:");
    [a3 skinFriction];
    -[MCAnimationPathPhysics setSkinFriction:](v4, "setSkinFriction:");
  }
  return v4;
}

- (float)computeValueForTime:(double)a3 withContext:(id)a4
{
  float v5 = a3 - *(double *)(&self->mVelocity + 1);
  float result = *(&self->super._skinFriction + 1) + self->mBaseValue;
  if (v5 > 0.0)
  {
    double v8 = result;
    float v9 = -0.7 - result;
    double v10 = 1.0;
    if (v9 <= 0.0)
    {
      float v11 = v8 + -0.7;
      double v10 = 0.0;
      float v9 = 0.0;
      if (v11 > 0.0)
      {
        double v10 = -1.0;
        float v9 = v11;
      }
    }
    float v12 = (float)(v5 * 0.0) + v10 * v9 * v9;
    if (self->mDeltaValue == 0.0)
    {
      [(MCAnimationPathPhysics *)self staticFriction];
      BOOL v14 = fabsf(v12) < (float)(v13 * v5);
      float v15 = 0.0;
      if (!v14) {
        float v15 = v12;
      }
    }
    else
    {
      [(MCAnimationPathPhysics *)self kineticFriction];
      double v17 = 1.0;
      float mDeltaValue = self->mDeltaValue;
      float v19 = fmin((float)(v16 * v5), 1.0) * fabsf(mDeltaValue);
      if (mDeltaValue <= 0.0) {
        double v17 = -1.0;
      }
      float v20 = v12 - v17 * v19;
      [(MCAnimationPathPhysics *)self skinFriction];
      float v15 = v20 - (float)((float)(v21 * self->mDeltaValue) * v5);
    }
    float v22 = v15 + self->mDeltaValue;
    float mBaseValue = self->mBaseValue;
    *(double *)(&self->mVelocity + 1) = a3;
    self->float mDeltaValue = v22;
    float v24 = mBaseValue + (float)(v22 * v5);
    self->float mBaseValue = v24;
    return v24 + *(&self->super._skinFriction + 1);
  }
  return result;
}

- (float)baseValue
{
  return *(&self->super._skinFriction + 1);
}

- (void)setBaseValue:(float)a3
{
  *(&self->super._skinFriction + 1) = a3;
}

- (float)velocity
{
  return self->mDeltaValue;
}

- (void)setVelocity:(float)a3
{
  self->float mDeltaValue = a3;
}

@end