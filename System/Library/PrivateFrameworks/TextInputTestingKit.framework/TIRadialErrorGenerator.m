@interface TIRadialErrorGenerator
- (CGPoint)randomBiasForKeyString:(id)a3 rect:(CGRect)a4;
- (TIRadialErrorGenerator)initWithAttributes:(id)a3;
@end

@implementation TIRadialErrorGenerator

- (CGPoint)randomBiasForKeyString:(id)a3 rect:(CGRect)a4
{
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v6 = v5;
  unint64_t letterErrorProbability = self->_letterErrorProbability;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v9 = v8;
  v10 = &OBJC_IVAR___TIRadialErrorGenerator__defaultDistanceMin;
  if (v6 < (double)letterErrorProbability) {
    v10 = &OBJC_IVAR___TIRadialErrorGenerator__letterDistanceMin;
  }
  unint64_t v11 = *(unint64_t *)((char *)&self->super.super.isa + *v10);
  v12 = &OBJC_IVAR___TIRadialErrorGenerator__defaultDistanceMax;
  if (v6 < (double)letterErrorProbability) {
    v12 = &OBJC_IVAR___TIRadialErrorGenerator__letterDistanceMax;
  }
  unint64_t v13 = *(unint64_t *)((char *)&self->super.super.isa + *v12);
  uint32_t v14 = arc4random();
  float v15 = (v9 + v9) * 3.14159265;
  float v16 = (float)v11 + (double)v14 / 4294967300.0 * (float)((float)v13 - (float)v11);
  __float2 v17 = __sincosf_stret(v15);
  double v18 = (float)(v17.__sinval * v16);
  double v19 = (float)(v17.__cosval * v16);
  result.y = v18;
  result.x = v19;
  return result;
}

- (TIRadialErrorGenerator)initWithAttributes:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIRadialErrorGenerator;
  double v5 = [(TIErrorGenerator *)&v19 initWithAttributes:v4];
  double v6 = v5;
  if (v5)
  {
    v5->_unint64_t letterErrorProbability = 0;
    v5->_defaultDistanceMax = 0;
    v5->_defaultDistanceMin = 0;
    v5->_letterDistanceMax = 0;
    v5->_letterDistanceMin = 0;
    v7 = [v4 valueForKey:@"LETTER_ERROR_PROBABILITY"];

    if (v7)
    {
      double v8 = [v4 objectForKey:@"LETTER_ERROR_PROBABILITY"];
      [v8 doubleValue];
      v6->_unint64_t letterErrorProbability = (unint64_t)v9;
    }
    v10 = [v4 valueForKey:@"DEFAULT_ERROR_RADIAL_MIN_DISTANCE"];

    if (v10)
    {
      unint64_t v11 = [v4 objectForKey:@"DEFAULT_ERROR_RADIAL_MIN_DISTANCE"];
      v6->_defaultDistanceMin = (int)[v11 intValue];
    }
    v12 = [v4 valueForKey:@"DEFAULT_ERROR_RADIAL_MAX_DISTANCE"];

    if (v12)
    {
      unint64_t v13 = [v4 objectForKey:@"DEFAULT_ERROR_RADIAL_MAX_DISTANCE"];
      v6->_defaultDistanceMax = (int)[v13 intValue];
    }
    uint32_t v14 = [v4 valueForKey:@"LETTER_ERROR_RADIAL_MIN_DISTANCE"];

    if (v14)
    {
      float v15 = [v4 objectForKey:@"LETTER_ERROR_RADIAL_MIN_DISTANCE"];
      v6->_letterDistanceMin = (int)[v15 intValue];
    }
    float v16 = [v4 valueForKey:@"LETTER_ERROR_RADIAL_MAX_DISTANCE"];

    if (v16)
    {
      __float2 v17 = [v4 objectForKey:@"LETTER_ERROR_RADIAL_MAX_DISTANCE"];
      v6->_letterDistanceMax = (int)[v17 intValue];
    }
  }

  return v6;
}

@end