@interface TISweepSource
+ (id)sharedInstance;
- (BOOL)finished;
- (NSMutableDictionary)debugValues;
- (id)sweepStateHeader;
- (id)sweepStateValues;
- (int)stepCount;
- (void)addValue:(id)a3 withMin:(float)a4 withMax:(float)a5;
- (void)addValue:(id)a3 withValue:(float)a4;
- (void)advanceSweep;
- (void)setStepCount:(int)a3;
@end

@implementation TISweepSource

- (void).cxx_destruct
{
}

- (NSMutableDictionary)debugValues
{
  return self->debugValues;
}

- (void)setStepCount:(int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  self->stepCount = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->debugValues;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    float v9 = (float)a3;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v10), (void)v16);
        [v11 sweepMax];
        float v13 = v12;
        [v11 sweepMin];
        *(float *)&double v15 = (float)(v13 - v14) / v9;
        [v11 setStepSize:v15];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (int)stepCount
{
  return self->stepCount;
}

- (BOOL)finished
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->debugValues;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v8 sweepMax];
        float v10 = v9;
        [v8 sweepValue];
        float v12 = v10 - v11;

        if (v12 > 0.00000011921)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)advanceSweep
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = self->debugValues;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKey:](self->debugValues, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v8 sweepMax];
        float v10 = v9;
        [v8 sweepValue];
        if ((float)(v10 - v11) > 0.00000011921)
        {
          [v8 stepSize];
          float v13 = v12;
          [v8 sweepValue];
          *(float *)&double v15 = v13 + v14;
          [v8 setSweepValue:v15];

          goto LABEL_11;
        }
        [v8 sweepMin];
        objc_msgSend(v8, "setSweepValue:");
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)sweepStateValues
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->debugValues;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        float v9 = [(NSMutableDictionary *)self->debugValues objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v9 sweepValue];
        objc_msgSend(v3, "appendFormat:", @"%f,", v10);
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)sweepStateHeader
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->debugValues;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@,", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)addValue:(id)a3 withValue:(float)a4
{
  id v14 = a3;
  uint64_t v6 = objc_alloc_init(TIDebugValue);
  *(float *)&double v7 = a4;
  [(TIDebugValue *)v6 setDefaultValue:v7];
  *(float *)&double v8 = a4;
  [(TIDebugValue *)v6 setSweepValue:v8];
  *(float *)&double v9 = a4;
  [(TIDebugValue *)v6 setSweepMin:v9];
  *(float *)&double v10 = a4;
  [(TIDebugValue *)v6 setSweepMax:v10];
  [(TIDebugValue *)v6 setStepSize:0.0];
  debugValues = self->debugValues;
  if (!debugValues)
  {
    long long v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v13 = self->debugValues;
    self->debugValues = v12;

    debugValues = self->debugValues;
  }
  [(NSMutableDictionary *)debugValues setObject:v6 forKey:v14];
}

- (void)addValue:(id)a3 withMin:(float)a4 withMax:(float)a5
{
  id v17 = a3;
  double v8 = objc_alloc_init(TIDebugValue);
  *(float *)&double v9 = (float)(a4 + a5) * 0.5;
  [(TIDebugValue *)v8 setDefaultValue:v9];
  *(float *)&double v10 = a4;
  [(TIDebugValue *)v8 setSweepValue:v10];
  *(float *)&double v11 = a4;
  [(TIDebugValue *)v8 setSweepMin:v11];
  *(float *)&double v12 = a5;
  [(TIDebugValue *)v8 setSweepMax:v12];
  *(float *)&double v13 = (float)(a5 - a4) / (float)self->stepCount;
  [(TIDebugValue *)v8 setStepSize:v13];
  debugValues = self->debugValues;
  if (!debugValues)
  {
    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v16 = self->debugValues;
    self->debugValues = v15;

    debugValues = self->debugValues;
  }
  [(NSMutableDictionary *)debugValues setObject:v8 forKey:v17];
}

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance_shared;
  if (!sharedInstance_shared)
  {
    v3 = objc_alloc_init(TISweepSource);
    uint64_t v4 = (void *)sharedInstance_shared;
    sharedInstance_shared = (uint64_t)v3;

    v2 = (void *)sharedInstance_shared;
  }
  return v2;
}

@end