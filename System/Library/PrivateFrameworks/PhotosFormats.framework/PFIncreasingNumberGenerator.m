@interface PFIncreasingNumberGenerator
- (PFIncreasingNumberGenerator)init;
- (PFIncreasingNumberGenerator)initWithSeed:(unint64_t)a3;
- (unint64_t)nextUnsignedIntegerLessThan:(unint64_t)a3;
- (unint64_t)seed;
- (void)setSeed:(unint64_t)a3;
@end

@implementation PFIncreasingNumberGenerator

- (void)setSeed:(unint64_t)a3
{
  self->_seed = a3;
}

- (unint64_t)seed
{
  return self->_seed;
}

- (unint64_t)nextUnsignedIntegerLessThan:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t seed = self->_seed;
  self->_unint64_t seed = seed + 1;
  return seed % a3;
}

- (PFIncreasingNumberGenerator)initWithSeed:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFIncreasingNumberGenerator;
  v4 = [(PFIncreasingNumberGenerator *)&v6 init];
  [(PFIncreasingNumberGenerator *)v4 setSeed:a3];
  return v4;
}

- (PFIncreasingNumberGenerator)init
{
  return [(PFIncreasingNumberGenerator *)self initWithSeed:0];
}

@end