@interface AWDCoreRoutineFMCDailyAssessment(MetricManager)
- (BOOL)valid:()MetricManager;
- (char)_init;
- (id)description;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineFMCDailyAssessment(MetricManager)

- (uint64_t)metricId
{
  return 2883616;
}

- (char)_init
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_1F34C2540;
  result = (char *)[super init];
  if (result)
  {
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D48]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D50]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D58]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D60]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D68]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D78]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D80]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E4FB8D70]] = 0;
  }
  return result;
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
    v6 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
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
  objc_super v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@, duration %d, parking events %d, suppressedParkingEvents %d, assistances %d, assistedParkingEvents %d, engagements %d, engagedParkingEvents %d, locationType %d", v4, [a1 duration], [a1 parkingEvents], [a1 suppressedParkingEvents], [a1 assistances], [a1 assistedParkingEvents], [a1 engagements], [a1 engagedParkingEvents], [a1 locationType]];

  return v5;
}

@end