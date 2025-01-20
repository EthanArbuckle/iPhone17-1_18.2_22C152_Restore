@interface AWDCoreRoutineLocationAwarenessLocationTimeHistograms(MetricManager)
- (BOOL)valid:()MetricManager;
- (char)_init;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineLocationAwarenessLocationTimeHistograms(MetricManager)

- (char)_init
{
  v19.receiver = a1;
  v19.super_class = (Class)&off_1F34C2E68;
  v1 = (char *)[super init];
  if (v1)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = (int)*MEMORY[0x1E4FB8EE8];
    v4 = *(void **)&v1[v3];
    *(void *)&v1[v3] = v2;

    uint64_t v5 = objc_opt_new();
    uint64_t v6 = (int)*MEMORY[0x1E4FB8EF0];
    v7 = *(void **)&v1[v6];
    *(void *)&v1[v6] = v5;

    uint64_t v8 = objc_opt_new();
    uint64_t v9 = (int)*MEMORY[0x1E4FB8F00];
    v10 = *(void **)&v1[v9];
    *(void *)&v1[v9] = v8;

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = (int)*MEMORY[0x1E4FB8F08];
    v13 = *(void **)&v1[v12];
    *(void *)&v1[v12] = v11;

    uint64_t v14 = objc_opt_new();
    uint64_t v15 = (int)*MEMORY[0x1E4FB8EF8];
    v16 = *(void **)&v1[v15];
    *(void *)&v1[v15] = v14;

    int v17 = 24;
    do
    {
      [*(id *)&v1[v3] addCount:0];
      [*(id *)&v1[v6] addCount:0];
      [*(id *)&v1[v9] addCount:0];
      [*(id *)&v1[v12] addCount:0];
      [*(id *)&v1[v15] addCount:0];
      --v17;
    }
    while (v17);
  }
  return v1;
}

- (uint64_t)metricId
{
  return 2883619;
}

- (BOOL)valid:()MetricManager
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (([a1 conformsToProtocol:&unk_1F34BFDD8] & 1) == 0)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    [v11 stringWithFormat:@"Invalid metric. metric does not conform to the %@ protocol.", v12];
LABEL_18:
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!a3) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = (int)*MEMORY[0x1E4FB8EE8];
    if ([*(id *)&a1[v5] countsCount] == 24)
    {
      uint64_t v6 = (int)*MEMORY[0x1E4FB8EF0];
      if ([*(id *)&a1[v6] countsCount] == 24)
      {
        uint64_t v7 = (int)*MEMORY[0x1E4FB8F00];
        if ([*(id *)&a1[v7] countsCount] == 24)
        {
          uint64_t v8 = (int)*MEMORY[0x1E4FB8F08];
          if ([*(id *)&a1[v8] countsCount] == 24)
          {
            uint64_t v9 = (int)*MEMORY[0x1E4FB8EF8];
            if ([*(id *)&a1[v9] countsCount] == 24)
            {
              v10 = 0;
              goto LABEL_21;
            }
            v13 = NSString;
            uint64_t v12 = [NSNumber numberWithUnsignedInteger:[*(id *)&a1[v9] countsCount]];
            v18 = v12;
            uint64_t v14 = @"Invalid metric. lessThan200mHistogram bin count, %@";
          }
          else
          {
            v13 = NSString;
            uint64_t v12 = [NSNumber numberWithUnsignedInteger:[*(id *)&a1[v8] countsCount]];
            v18 = v12;
            uint64_t v14 = @"Invalid metric. lessThan55mHistogram bin count, %@";
          }
        }
        else
        {
          v13 = NSString;
          uint64_t v12 = [NSNumber numberWithUnsignedInteger:[*(id *)&a1[v7] countsCount]];
          v18 = v12;
          uint64_t v14 = @"Invalid metric. lessThan20mHistogram bin count, %@";
        }
      }
      else
      {
        v13 = NSString;
        uint64_t v12 = [NSNumber numberWithUnsignedInteger:[*(id *)&a1[v6] countsCount]];
        v18 = v12;
        uint64_t v14 = @"Invalid metric. lessThan10mHistogram bin count, %@";
      }
    }
    else
    {
      v13 = NSString;
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:[*(id *)&a1[v5] countsCount]];
      v18 = v12;
      uint64_t v14 = @"Invalid metric. anyPositiveHistogram bin count, %@";
    }
    [v13 stringWithFormat:v14, v18];
    goto LABEL_18;
  }
  v10 = @"Invalid metric. the metric does not have an ID.";
  if (!a3) {
    goto LABEL_21;
  }
LABEL_19:
  if (v10)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = v10;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a3 = [v15 errorWithDomain:@"RTMetricManagerErrorDomain" code:1 userInfo:v16];
  }
LABEL_21:

  return v10 == 0;
}

@end