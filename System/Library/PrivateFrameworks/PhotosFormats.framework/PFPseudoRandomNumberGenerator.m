@interface PFPseudoRandomNumberGenerator
- (PFPseudoRandomNumberGenerator)init;
- (PFPseudoRandomNumberGenerator)initWithSeed:(unint64_t)a3;
- (double)_next;
- (unint64_t)nextUnsignedIntegerLessThan:(unint64_t)a3;
- (unint64_t)seed;
- (void)setSeed:(unint64_t)a3;
@end

@implementation PFPseudoRandomNumberGenerator

- (PFPseudoRandomNumberGenerator)initWithSeed:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFPseudoRandomNumberGenerator;
  v4 = [(PFPseudoRandomNumberGenerator *)&v6 init];
  [(PFPseudoRandomNumberGenerator *)v4 setSeed:a3];
  return v4;
}

- (void)setSeed:(unint64_t)a3
{
  *(void *)&self->_z = a3;
  if (a3)
  {
    if (HIDWORD(a3)) {
      return;
    }
LABEL_5:
    self->_w = 1;
    return;
  }
  self->_z = 1;
  if (!HIDWORD(a3)) {
    goto LABEL_5;
  }
}

- (unint64_t)seed
{
  return *(void *)&self->_z;
}

- (double)_next
{
  uint32x2_t v2 = vsra_n_u32((uint32x2_t)vmul_s32((int32x2_t)vand_s8(*(int8x8_t *)&self->_z, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0x465000009069), *(uint32x2_t *)&self->_z, 0x10uLL);
  *(uint32x2_t *)&self->_z = v2;
  return (double)(v2.i32[1] + (v2.i32[0] << 16)) * 2.32830644e-10;
}

- (unint64_t)nextUnsignedIntegerLessThan:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  double v4 = (double)a3;
  [(PFPseudoRandomNumberGenerator *)self _next];
  double v6 = v5 * v4;
  if (v6 >= (double)(a3 - 1)) {
    return (unint64_t)(double)(a3 - 1);
  }
  return (unint64_t)v6;
}

- (PFPseudoRandomNumberGenerator)init
{
  return [(PFPseudoRandomNumberGenerator *)self initWithSeed:0];
}

@end