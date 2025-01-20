@interface CMCoastedGravityEstimator
- (BOOL)isConverged;
- (CMCoastedGravityEstimator)init;
- (CMGravity)feedAccelAtTimestamp:(double)a3 X:(float)a4 Y:(float)a5 Z:(float)a6;
- (CMGravity)feedRotationRateAtTimestamp:(double)a3 X:(float)a4 Y:(float)a5 Z:(float)a6;
- (id).cxx_construct;
- (unint64_t)numSamples;
@end

@implementation CMCoastedGravityEstimator

- (CMCoastedGravityEstimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMCoastedGravityEstimator;
  v2 = [(CMCoastedGravityEstimator *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (CMGravity)feedAccelAtTimestamp:(double)a3 X:(float)a4 Y:(float)a5 Z:(float)a6
{
  float v6 = sub_1000D7990((uint64_t *)&self->_impl, a3, a4, a5, a6);
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (CMGravity)feedRotationRateAtTimestamp:(double)a3 X:(float)a4 Y:(float)a5 Z:(float)a6
{
  sub_1000D7AF4((uint64_t *)&self->_impl, a3, a4, a5, a6);
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (unint64_t)numSamples
{
  return sub_1000D7EFC((uint64_t)&self->_impl);
}

- (BOOL)isConverged
{
  return sub_1000D7F08((uint64_t)&self->_impl);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
}

@end