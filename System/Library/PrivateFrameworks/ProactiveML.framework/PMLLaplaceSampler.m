@interface PMLLaplaceSampler
- (PMLLaplaceSampler)initWithMagnitude:(float)a3;
- (PMLLaplaceSampler)initWithMagnitude:(float)a3 seed:(unint64_t)a4;
- (float)sample;
@end

@implementation PMLLaplaceSampler

- (float)sample
{
  float magnitude = self->_magnitude;
  unint64_t v3 = self->_rng.s[0];
  unint64_t v4 = self->_rng.s[1];
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 ^ v3;
  self->_rng.s[0] = __ROR8__(v3, 9) ^ (v6 << 14) ^ v6;
  self->_rng.s[1] = __ROR8__(v6, 28);
  double v7 = COERCE_DOUBLE((v5 >> 12) | 0x3FF0000000000000) + -1.0 + -0.5;
  float v8 = v7;
  LODWORD(v3) = v8 > 0.0;
  LODWORD(v6) = v8 < 0.0;
  return log(fabs(v7) * -2.0 + 1.0) * (double)((int)v3 - (int)v6) * magnitude;
}

- (PMLLaplaceSampler)initWithMagnitude:(float)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PMLLaplaceSampler;
  unint64_t v4 = [(PMLLaplaceSampler *)&v7 init];
  unint64_t v5 = v4;
  if (v4)
  {
    arc4random_buf(&v4->_rng, 0x10uLL);
    v5->_float magnitude = a3;
  }
  return v5;
}

- (PMLLaplaceSampler)initWithMagnitude:(float)a3 seed:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PMLLaplaceSampler;
  unint64_t v5 = [(PMLLaplaceSampler *)&v7 init];
  if (v5)
  {
    _PASRngSeed64();
    v5->_float magnitude = a3;
  }
  return v5;
}

@end