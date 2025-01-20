@interface PGMoodVector
- (BOOL)isEqual:(id)a3;
- (PGMoodVector)init;
- (PGMoodVector)initWithArray:(id)a3;
- (double)sum;
- (double)valueForMood:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)moodArray;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)moodsWithThreshold:(double)a3;
- (unint64_t)weightedRandomMoodWithSeed:(unint64_t)a3;
- (void)addMoodVector:(id)a3;
- (void)addValue:(double)a3 forMood:(unint64_t)a4;
- (void)addValue:(double)a3 forMoods:(unint64_t)a4;
- (void)enumerateWithBlock:(id)a3;
- (void)filterWithMoods:(unint64_t)a3;
- (void)multiplyByWeight:(double)a3;
- (void)multiplyByWeight:(double)a3 forMood:(unint64_t)a4;
- (void)multiplyMoodVector:(id)a3;
- (void)normalize;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
- (void)setValue:(double)a3 forMood:(unint64_t)a4;
- (void)substractMoodVector:(id)a3;
@end

@implementation PGMoodVector

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  for (uint64_t i = 8; i != 88; i += 8)
  {
    v5 = [NSNumber numberWithDouble:*(double *)((char *)&self->super.isa + i)];
    v6 = [v5 description];

    unint64_t v7 = [v6 length];
    if (v7 >= 4) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = v7;
    }
    v9 = [v6 substringToIndex:v8];
    [v3 addObject:v9];
  }
  v10 = NSString;
  v11 = [v3 componentsJoinedByString:@", "];
  v12 = [v10 stringWithFormat:@"[%@]", v11];

  return v12;
}

- (id)moodArray
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  for (uint64_t i = 8; i != 88; i += 8)
  {
    v5 = [NSNumber numberWithDouble:*(double *)((char *)&self->super.isa + i)];
    [v3 addObject:v5];
  }
  return v3;
}

- (double)sum
{
  double result = 0.0;
  for (uint64_t i = 8; i != 88; i += 8)
    double result = result + *(double *)((char *)&self->super.isa + i);
  return result;
}

- (unint64_t)weightedRandomMoodWithSeed:(unint64_t)a3
{
  int v3 = a3;
  [(PGMoodVector *)self sum];
  if (v5 == 0.0) {
    return 0;
  }
  double v6 = v5;
  v12[0] = 13070;
  *(_DWORD *)&v12[1] = v3;
  double v7 = erand48(v12);
  uint64_t v8 = 0;
  double v9 = v6 * v7;
  double v10 = 0.0;
  while (1)
  {
    double v10 = v10 + self->_vector[v8];
    if (v10 >= v9) {
      break;
    }
    if (++v8 == 10) {
      return 0;
    }
  }
  return (1 << v8);
}

- (void)enumerateWithBlock:(id)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
    vector = self->_vector;
    do
    {
      (*((void (**)(id, void, double))a3 + 2))(a3, (1 << v4), vector[v4]);
      ++v4;
    }
    while (v4 != 10);
  }
}

- (unint64_t)moodsWithThreshold:(double)a3
{
  float64x2_t v3 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0);
  int32x2_t v4 = (int32x2_t)0x100000000;
  int8x16_t v5 = 0uLL;
  for (uint64_t i = 8; i != 88; i += 16)
  {
    uint32x2_t v7 = vshl_u32((uint32x2_t)0x100000001, (uint32x2_t)v4);
    v8.i64[0] = v7.u32[0];
    v8.i64[1] = v7.u32[1];
    int8x16_t v5 = vorrq_s8(vandq_s8(v8, (int8x16_t)vcgeq_f64(*(float64x2_t *)((char *)&self->super.isa + i), v3)), v5);
    int32x2_t v4 = vadd_s32(v4, (int32x2_t)0x200000002);
  }
  return (unint64_t)vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (void)normalize
{
  double v2 = -1.79769313e308;
  double v3 = 1.79769313e308;
  for (uint64_t i = 8; i != 88; i += 8)
  {
    double v5 = *(double *)((char *)&self->super.isa + i);
    if (v5 < v3) {
      double v3 = *(double *)((char *)&self->super.isa + i);
    }
    if (v5 > v2) {
      double v2 = *(double *)((char *)&self->super.isa + i);
    }
  }
  double v6 = v2 - v3;
  if (v6 != 0.0)
  {
    float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v3, 0);
    float64x2_t v8 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v6, 0);
    uint64_t v9 = 8;
    __asm { FMOV            V2.2D, #1.0 }
    do
    {
      float64x2_t v15 = vdivq_f64(vsubq_f64(*(float64x2_t *)((char *)&self->super.isa + v9), v7), v8);
      *(int8x16_t *)((char *)&self->super.isa + v9) = vbslq_s8((int8x16_t)vcgtq_f64(v15, _Q2), (int8x16_t)_Q2, vbicq_s8((int8x16_t)v15, (int8x16_t)vcltzq_f64(v15)));
      v9 += 16;
    }
    while (v9 != 88);
  }
}

- (void)filterWithMoods:(unint64_t)a3
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    if (((1 << i) & a3) == 0) {
      self->_vector[i] = 0.0;
    }
  }
}

- (void)multiplyByWeight:(double)a3
{
  for (uint64_t i = 8; i != 88; i += 16)
    *(float64x2_t *)((char *)&self->super.isa + i) = vmulq_n_f64(*(float64x2_t *)((char *)&self->super.isa + i), a3);
}

- (void)multiplyMoodVector:(id)a3
{
  if (a3)
  {
    for (uint64_t i = 8; i != 88; i += 8)
      *(double *)((char *)&self->super.isa + i) = *(double *)((char *)a3 + i)
                                                * *(double *)((char *)&self->super.isa + i);
  }
}

- (void)substractMoodVector:(id)a3
{
  if (a3)
  {
    for (uint64_t i = 8; i != 88; i += 8)
      *(double *)((char *)&self->super.isa + i) = *(double *)((char *)&self->super.isa + i)
                                                - *(double *)((char *)a3 + i);
  }
}

- (void)addMoodVector:(id)a3
{
  if (a3)
  {
    for (uint64_t i = 8; i != 88; i += 8)
      *(double *)((char *)&self->super.isa + i) = *(double *)((char *)a3 + i)
                                                + *(double *)((char *)&self->super.isa + i);
  }
}

- (void)multiplyByWeight:(double)a3 forMood:(unint64_t)a4
{
  if (a4 <= 0x3FF)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1)
    {
      double v5 = (double *)(&self->super.isa + __clz(__rbit32(a4)));
      v5[1] = v5[1] * a3;
    }
  }
}

- (void)addValue:(double)a3 forMoods:(unint64_t)a4
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    if (((1 << i) & a4) != 0) {
      self->_vector[i] = self->_vector[i] + a3;
    }
  }
}

- (void)addValue:(double)a3 forMood:(unint64_t)a4
{
  if (a4 <= 0x3FF)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1)
    {
      double v5 = (double *)(&self->super.isa + __clz(__rbit32(a4)));
      v5[1] = v5[1] + a3;
    }
  }
}

- (void)setValue:(double)a3 forMood:(unint64_t)a4
{
  if (a4 <= 0x3FF)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1) {
      self->_vector[__clz(__rbit32(a4))] = a3;
    }
  }
}

- (double)valueForMood:(unint64_t)a3
{
  double result = 9.22337204e18;
  if (a3 <= 0x3FF)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1) {
      return self->_vector[__clz(__rbit32(a3))];
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && memcmp(self->_vector, (char *)a3 + 8, 0x50uLL) == 0;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (a4 <= 0x3FF)
  {
    unsigned int v4 = a4;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.i32[0] == 1)
    {
      [a3 doubleValue];
      self->_vector[__clz(__rbit32(v4))] = v7;
    }
  }
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 > 0x3FF || (uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)a3), v3.i16[0] = vaddlv_u8(v3), v3.i32[0] != 1))
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Index %lu is out of bounds [0..%lu]", a3, 1023);
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }
  double v4 = self->_vector[__clz(__rbit32(a3))];
  uint8x8_t v5 = NSNumber;
  return (id)[v5 numberWithDouble:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)self->_vector;
  long long v5 = *(_OWORD *)&self->_vector[4];
  long long v6 = *(_OWORD *)&self->_vector[6];
  long long v7 = *(_OWORD *)&self->_vector[8];
  *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_vector[2];
  *(_OWORD *)((char *)result + 72) = v7;
  *(_OWORD *)((char *)result + 56) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  return result;
}

- (PGMoodVector)initWithArray:(id)a3
{
  id v4 = a3;
  long long v5 = [(PGMoodVector *)self init];
  if (v5 && [v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      long long v7 = [v4 objectAtIndexedSubscript:v6];
      [v7 doubleValue];
      v5->_vector[v6] = v8;

      ++v6;
    }
    while (v6 < [v4 count]);
  }

  return v5;
}

- (PGMoodVector)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGMoodVector;
  id result = [(PGMoodVector *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_vector[8] = 0u;
    *(_OWORD *)&result->_vector[6] = 0u;
    *(_OWORD *)&result->_vector[4] = 0u;
    *(_OWORD *)&result->_vector[2] = 0u;
    *(_OWORD *)result->_vector = 0u;
  }
  return result;
}

@end