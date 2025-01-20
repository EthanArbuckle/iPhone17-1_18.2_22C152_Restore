@interface AWDCoreRoutineLearnedLocationTrainingMetrics(MetricManager)
- (BOOL)valid:()MetricManager;
- (char)_init;
- (id)description;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineLearnedLocationTrainingMetrics(MetricManager)

- (uint64_t)metricId
{
  return 2883637;
}

- (char)_init
{
  v10.receiver = a1;
  v10.super_class = (Class)&off_1F34C38F0;
  v1 = (char *)[super init];
  v2 = v1;
  if (v1)
  {
    *(void *)&v1[*MEMORY[0x1E4FB8E60]] = -1;
    *(void *)&v1[*MEMORY[0x1E4FB8E68]] = -1;
    *(void *)&v1[*MEMORY[0x1E4FB8E78]] = -1;
    *(void *)&v1[*MEMORY[0x1E4FB8E98]] = -1;
    *(_DWORD *)&v1[*MEMORY[0x1E4FB8E70]] = -1;
    *(_DWORD *)&v1[*MEMORY[0x1E4FB8E80]] = -1;
    *(_DWORD *)&v1[*MEMORY[0x1E4FB8E88]] = -1;
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = (int)*MEMORY[0x1E4FB8E90];
    v5 = *(void **)&v2[v4];
    *(void *)&v2[v4] = v3;

    *(_DWORD *)&v2[*MEMORY[0x1E4FB8EA8]] = -1;
    *(_DWORD *)&v2[*MEMORY[0x1E4FB8EB0]] = -1;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = (int)*MEMORY[0x1E4FB8EB8];
    v8 = *(void **)&v2[v7];
    *(void *)&v2[v7] = v6;

    v2[*MEMORY[0x1E4FB8EA0]] = 0;
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
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    uint64_t v4 = @"Failed metric submission because the metric does not have an ID.";
    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    v5 = NSString;
    uint64_t v6 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    uint64_t v4 = [v5 stringWithFormat:@"Failed metric submission because the metric does not conform to the %@ protocol.", v6];

    if (!a3) {
      goto LABEL_9;
    }
  }
  if (v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
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
  v16 = NSString;
  v2 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v2);
  int v3 = [a1 trainedVisits];
  uint64_t v4 = @"NO";
  if (v3) {
    uint64_t v4 = @"YES";
  }
  v14 = v4;
  uint64_t v13 = [a1 latency];
  uint64_t v12 = [a1 intervalSinceLastAttempt];
  uint64_t v5 = [a1 locationsProcessed];
  uint64_t v6 = [a1 maxIntervalBetweenLocations];
  uint64_t v7 = [a1 visits];
  uint64_t v8 = [v7 count];
  v9 = [a1 places];
  uint64_t v10 = [v16 stringWithFormat:@"%@, trainedVisits, %@, latency, %llu, intervalSinceLastAttempt, %llu, locationsProcessed, %u, maxIntervalBetweenLocations, %llu, new visits, %lu, new places, %lu, visitCountDevice, %u, visitCountTotal, %u, placeCountDevice, %u, placeCountTotal, %u", v15, v14, v13, v12, v5, v6, v8, [v9 count], [a1 visitCountDevice], [a1 visitCountTotal], [a1 placeCountDevice], [a1 placeCountTotal]];

  return v10;
}

@end