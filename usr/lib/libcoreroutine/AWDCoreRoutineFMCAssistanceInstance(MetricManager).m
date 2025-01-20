@interface AWDCoreRoutineFMCAssistanceInstance(MetricManager)
- (BOOL)valid:()MetricManager;
- (char)_init;
- (id)description;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineFMCAssistanceInstance(MetricManager)

- (uint64_t)metricId
{
  return 2883611;
}

- (char)_init
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F34C0D88;
  v1 = (char *)[super init];
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = (int)*MEMORY[0x1E4FB8D10];
    v4 = *(void **)&v1[v3];
    *(void *)&v1[v3] = 0;

    *(_DWORD *)&v2[*MEMORY[0x1E4FB8D00]] = 0;
    *(_DWORD *)&v2[*MEMORY[0x1E4FB8D08]] = 0;
    *(_DWORD *)&v2[*MEMORY[0x1E4FB8D18]] = 0;
  }
  return v2;
}

- (BOOL)valid:()MetricManager
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([a1 conformsToProtocol:&unk_1F34BFDD8])
  {
    if (objc_opt_respondsToSelector())
    {
      v4 = 0;
      goto LABEL_9;
    }
    v4 = @"Failed metric submission because the metric does not have an ID.";
    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    v5 = NSString;
    objc_super v6 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    v4 = [v5 stringWithFormat:@"Failed metric submission because the metric does not conform to the %@ protocol.", v6];

    if (!a3) {
      goto LABEL_9;
    }
  }
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v4;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [v7 errorWithDomain:@"RTMetricManagerErrorDomain" code:1 userInfo:v8];
  }
LABEL_9:

  return v4 == 0;
}

- (id)description
{
  v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@, assistanceType %d, assistanceValue %d, uiPlacement %d", v4, a1.assistanceType, a1.assistanceValue, a1.uiPlacement];

  return v5;
}

@end