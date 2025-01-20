@interface AWDCoreRoutineModelAlgorithmSet(MetricManager)
- (BOOL)valid:()MetricManager;
- (id)_init;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineModelAlgorithmSet(MetricManager)

- (uint64_t)metricId
{
  return 2883587;
}

- (id)_init
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_1F34C05B0;
  return [super init];
}

- (BOOL)valid:()MetricManager
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([a1 conformsToProtocol:&unk_1F34BFDD8])
  {
    if (objc_opt_respondsToSelector())
    {
      if ([a1 instancesCount])
      {
        v5 = 0;
        goto LABEL_12;
      }
      v5 = @"Failed metric submission because the metric set contained no metrics.";
      if (!a3) {
        goto LABEL_12;
      }
    }
    else
    {
      v5 = @"Failed metric submission because the metric does not have an ID.";
      if (!a3) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    v6 = NSString;
    v7 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    v5 = [v6 stringWithFormat:@"Failed metric submission because the metric does not conform to the %@ protocol.", v7];

    if (!a3) {
      goto LABEL_12;
    }
  }
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v5;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a3 = [v8 errorWithDomain:@"RTMetricManagerErrorDomain" code:1 userInfo:v9];
  }
LABEL_12:

  return v5 == 0;
}

@end