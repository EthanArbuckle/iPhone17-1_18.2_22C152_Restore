@interface UPSeededRandomizer
+ (id)randomizerWithSeedValue:(unint64_t)a3;
- (BOOL)BOOLValue;
- (BOOL)BOOLValueWithChance:(double)a3;
- (CGPoint)pointBetweenFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4;
- (double)floatValueBetweenFirstValue:(double)a3 secondValue:(double)a4;
- (double)fractionValue;
- (unint64_t)unsignedLongValue;
- (void)reset;
@end

@implementation UPSeededRandomizer

- (unint64_t)unsignedLongValue
{
  unint64_t v2 = 1103515245 * self->_nextValue + 12345;
  self->_nextValue = v2;
  return v2;
}

- (double)fractionValue
{
  return (double)([(UPSeededRandomizer *)self unsignedLongValue] % 0x3E8 + 1) / 1000.0;
}

- (BOOL)BOOLValue
{
  return [(UPSeededRandomizer *)self BOOLValueWithChance:0.5];
}

- (BOOL)BOOLValueWithChance:(double)a3
{
  double v3 = a3 * 100.0;
  unint64_t v4 = [(UPSeededRandomizer *)self unsignedLongValue];
  return v3 > (double)(v4 / 0x64
                     - 100 * ((unint64_t)((v4 / 0x64 * (unsigned __int128)0x51EB851EB851EB9uLL) >> 64) >> 1));
}

- (double)floatValueBetweenFirstValue:(double)a3 secondValue:(double)a4
{
  double v5 = a4 - a3;
  [(UPSeededRandomizer *)self fractionValue];
  return a3 + v6 * v5;
}

- (CGPoint)pointBetweenFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y = a4.y;
  double v5 = a3.y;
  [(UPSeededRandomizer *)self floatValueBetweenFirstValue:a3.x secondValue:a4.x];
  double v8 = v7;
  [(UPSeededRandomizer *)self floatValueBetweenFirstValue:v5 secondValue:y];
  double v10 = v9;
  double v11 = v8;
  result.double y = v10;
  result.x = v11;
  return result;
}

- (void)reset
{
  self->_nextValue = self->_seedValue;
}

+ (id)randomizerWithSeedValue:(unint64_t)a3
{
  unint64_t v4 = (void *)[a1 new];
  if (a3 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = a3;
  }
  v4[1] = v5;
  v4[2] = v5;
  return v4;
}

@end