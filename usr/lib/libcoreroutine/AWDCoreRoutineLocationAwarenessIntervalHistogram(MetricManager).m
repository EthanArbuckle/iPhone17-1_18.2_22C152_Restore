@interface AWDCoreRoutineLocationAwarenessIntervalHistogram(MetricManager)
+ (id)_defaultIntervalHistogram;
+ (uint64_t)checkIntervalHistogramDimensions:()MetricManager;
- (BOOL)valid:()MetricManager;
- (char)_init;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineLocationAwarenessIntervalHistogram(MetricManager)

- (char)_init
{
  v18.receiver = a1;
  v18.super_class = (Class)&off_1F34C31D0;
  v1 = (char *)[super init];
  if (v1)
  {
    uint64_t v2 = [(id)objc_opt_class() _defaultIntervalHistogram];
    uint64_t v3 = (int)*MEMORY[0x1E4FB8EC0];
    v4 = *(void **)&v1[v3];
    *(void *)&v1[v3] = v2;

    uint64_t v5 = [(id)objc_opt_class() _defaultIntervalHistogram];
    uint64_t v6 = (int)*MEMORY[0x1E4FB8EC8];
    v7 = *(void **)&v1[v6];
    *(void *)&v1[v6] = v5;

    uint64_t v8 = [(id)objc_opt_class() _defaultIntervalHistogram];
    uint64_t v9 = (int)*MEMORY[0x1E4FB8ED8];
    v10 = *(void **)&v1[v9];
    *(void *)&v1[v9] = v8;

    uint64_t v11 = [(id)objc_opt_class() _defaultIntervalHistogram];
    uint64_t v12 = (int)*MEMORY[0x1E4FB8EE0];
    v13 = *(void **)&v1[v12];
    *(void *)&v1[v12] = v11;

    uint64_t v14 = [(id)objc_opt_class() _defaultIntervalHistogram];
    uint64_t v15 = (int)*MEMORY[0x1E4FB8ED0];
    v16 = *(void **)&v1[v15];
    *(void *)&v1[v15] = v14;
  }
  return v1;
}

- (uint64_t)metricId
{
  return 2883620;
}

- (BOOL)valid:()MetricManager
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([a1 conformsToProtocol:&unk_1F34BFDD8])
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(id)objc_opt_class() checkIntervalHistogramDimensions:*(void *)&a1[*MEMORY[0x1E4FB8EC0]]])
      {
        if ([(id)objc_opt_class() checkIntervalHistogramDimensions:*(void *)&a1[*MEMORY[0x1E4FB8EC8]]])
        {
          if ([(id)objc_opt_class() checkIntervalHistogramDimensions:*(void *)&a1[*MEMORY[0x1E4FB8ED8]]])
          {
            if ([(id)objc_opt_class() checkIntervalHistogramDimensions:*(void *)&a1[*MEMORY[0x1E4FB8EE0]]])
            {
              if ([(id)objc_opt_class() checkIntervalHistogramDimensions:*(void *)&a1[*MEMORY[0x1E4FB8ED0]]])
              {
                uint64_t v5 = 0;
                goto LABEL_21;
              }
              uint64_t v8 = NSString;
              uint64_t v9 = @"Invalid metric. Bad dimensions for lessThan200mIntervalHistograms.";
            }
            else
            {
              uint64_t v8 = NSString;
              uint64_t v9 = @"Invalid metric. Bad dimensions for lessThan55mIntervalHistograms.";
            }
          }
          else
          {
            uint64_t v8 = NSString;
            uint64_t v9 = @"Invalid metric. Bad dimensions for lessThan25mIntervalHistograms.";
          }
        }
        else
        {
          uint64_t v8 = NSString;
          uint64_t v9 = @"Invalid metric. Bad dimensions for lessThan10mIntervalHistograms.";
        }
      }
      else
      {
        uint64_t v8 = NSString;
        uint64_t v9 = @"Invalid metric. Bad dimensions for anyPositiveIntervalHistograms.";
      }
      uint64_t v5 = [v8 stringWithFormat:v9];
      if (!a3) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v5 = @"Invalid metric. the metric does not have an ID.";
      if (!a3) {
        goto LABEL_21;
      }
    }
  }
  else
  {
    uint64_t v6 = NSString;
    v7 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    uint64_t v5 = [v6 stringWithFormat:@"Invalid metric. metric does not conform to the %@ protocol.", v7];

    if (!a3) {
      goto LABEL_21;
    }
  }
  if (v5)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = v5;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a3 = [v10 errorWithDomain:@"RTMetricManagerErrorDomain" code:1 userInfo:v11];
  }
LABEL_21:

  return v5 == 0;
}

+ (id)_defaultIntervalHistogram
{
  v0 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  for (int i = 0; i != 8; ++i)
  {
    uint64_t v2 = objc_opt_new();
    int v3 = 24;
    do
    {
      [v2 addCount:0];
      --v3;
    }
    while (v3);
    [v0 addObject:v2];
  }

  return v0;
}

+ (uint64_t)checkIntervalHistogramDimensions:()MetricManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 count] == 8;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v4 = v4 & ([[*(id *)(*((void *)&v11 + 1) + 8 * v9++) countsCount] v11] == 24);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

@end