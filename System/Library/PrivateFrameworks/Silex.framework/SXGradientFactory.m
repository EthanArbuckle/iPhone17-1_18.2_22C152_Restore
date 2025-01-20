@interface SXGradientFactory
- (id)colorsFromColorStops:(id)a3;
- (id)gradientForColorStops:(id)a3 angle:(double)a4;
- (id)locationsFromColorStops:(id)a3;
@end

@implementation SXGradientFactory

- (id)gradientForColorStops:(id)a3 angle:(double)a4
{
  if (a3)
  {
    id v6 = a3;
    v7 = [(SXGradientFactory *)self colorsFromColorStops:v6];
    v8 = [(SXGradientFactory *)self locationsFromColorStops:v6];

    if (a4 == 1.79769313e308)
    {
      double v11 = 0.0;
      double v12 = 1.0;
      double v13 = 0.0;
      double v14 = 0.0;
    }
    else
    {
      float v9 = a4 / 180.0 * 3.14159265 + -1.57079633;
      __float2 v10 = __sincosf_stret(v9);
      double v11 = (float)((float)(v10.__cosval + 1.0) * 0.5);
      double v12 = (float)((float)(v10.__sinval + 1.0) * 0.5);
      double v13 = 1.0 - v11;
      double v14 = 1.0 - v12;
    }
    v15 = -[SXGradient initWithStartPoint:endPoint:colors:locations:]([SXGradient alloc], "initWithStartPoint:endPoint:colors:locations:", v7, v8, v13, v14, v11, v12);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)colorsFromColorStops:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        __float2 v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "color", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)locationsFromColorStops:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F089C8] indexSet];
  id v5 = [MEMORY[0x263EFF980] array];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      uint64_t v8 = [v3 objectAtIndex:v6];
      [v8 location];
      if (v9 == 1.79769313e308)
      {
        if (v6)
        {
          if (v6 == [v3 count] - 1)
          {
            __float2 v10 = v5;
            double v11 = &unk_26D593CE0;
          }
          else
          {
            [v4 addIndex:v6];
            double v11 = objc_opt_class();
            __float2 v10 = v5;
          }
        }
        else
        {
          __float2 v10 = v5;
          double v11 = &unk_26D593CC8;
        }
        [v10 addObject:v11];
      }
      else
      {
        [v8 location];
        double v13 = fmin(v12 / 100.0, 1.0);
        if (v13 >= 0.0) {
          double v14 = v13;
        }
        else {
          double v14 = 0.0;
        }
        if (v14 >= v7)
        {
          v16 = [NSNumber numberWithDouble:v14];
          [v5 addObject:v16];

          double v7 = v14;
        }
        else
        {
          long long v15 = [NSNumber numberWithDouble:v7];
          [v5 addObject:v15];
        }
      }

      ++v6;
    }
    while (v6 < [v3 count]);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__SXGradientFactory_locationsFromColorStops___block_invoke;
  v19[3] = &unk_264653738;
  id v17 = v5;
  id v20 = v17;
  [v4 enumerateRangesUsingBlock:v19];

  return v17;
}

void __45__SXGradientFactory_locationsFromColorStops___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = [*(id *)(a1 + 32) objectAtIndex:a2 - 1];
  [v6 floatValue];
  float v8 = v7;

  double v9 = [*(id *)(a1 + 32) objectAtIndex:a2 + a3];
  [v9 floatValue];
  float v11 = v10;

  if (a3)
  {
    uint64_t v12 = 0;
    double v13 = v8;
    double v14 = (v11 - v13) / (double)(unint64_t)(a3 + 1);
    do
    {
      uint64_t v15 = v12 + 1;
      v16 = *(void **)(a1 + 32);
      uint64_t v17 = a2 + v12;
      v18 = [NSNumber numberWithDouble:v13 + v14 * (double)(unint64_t)(v12 + 1)];
      [v16 replaceObjectAtIndex:v17 withObject:v18];

      uint64_t v12 = v15;
    }
    while (a3 != v15);
  }
}

@end