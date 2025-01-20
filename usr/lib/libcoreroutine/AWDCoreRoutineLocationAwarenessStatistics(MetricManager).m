@interface AWDCoreRoutineLocationAwarenessStatistics(MetricManager)
- (BOOL)valid:()MetricManager;
- (char)_init;
- (uint64_t)metricId;
@end

@implementation AWDCoreRoutineLocationAwarenessStatistics(MetricManager)

- (char)_init
{
  v52.receiver = a1;
  v52.super_class = (Class)&off_1F34C2B80;
  v1 = (char *)[super init];
  if (v1)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = (int)*MEMORY[0x1E4FB8F58];
    v4 = *(void **)&v1[v3];
    uint64_t v51 = v3;
    *(void *)&v1[v3] = v2;

    uint64_t v5 = objc_opt_new();
    uint64_t v6 = (int)*MEMORY[0x1E4FB8F10];
    v7 = *(void **)&v1[v6];
    uint64_t v50 = v6;
    *(void *)&v1[v6] = v5;

    uint64_t v8 = objc_opt_new();
    uint64_t v9 = (int)*MEMORY[0x1E4FB8F78];
    v10 = *(void **)&v1[v9];
    uint64_t v49 = v9;
    *(void *)&v1[v9] = v8;

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = (int)*MEMORY[0x1E4FB8F60];
    v13 = *(void **)&v1[v12];
    uint64_t v48 = v12;
    *(void *)&v1[v12] = v11;

    uint64_t v14 = objc_opt_new();
    uint64_t v15 = (int)*MEMORY[0x1E4FB8F70];
    v16 = *(void **)&v1[v15];
    uint64_t v47 = v15;
    *(void *)&v1[v15] = v14;

    uint64_t v17 = objc_opt_new();
    uint64_t v18 = (int)*MEMORY[0x1E4FB8F68];
    v19 = *(void **)&v1[v18];
    uint64_t v46 = v18;
    *(void *)&v1[v18] = v17;

    uint64_t v20 = objc_opt_new();
    uint64_t v21 = (int)*MEMORY[0x1E4FB8F48];
    v22 = *(void **)&v1[v21];
    *(void *)&v1[v21] = v20;

    uint64_t v23 = objc_opt_new();
    uint64_t v24 = (int)*MEMORY[0x1E4FB8F50];
    v25 = *(void **)&v1[v24];
    *(void *)&v1[v24] = v23;

    uint64_t v26 = objc_opt_new();
    uint64_t v27 = (int)*MEMORY[0x1E4FB8F20];
    v28 = *(void **)&v1[v27];
    *(void *)&v1[v27] = v26;

    uint64_t v29 = objc_opt_new();
    uint64_t v30 = (int)*MEMORY[0x1E4FB8F28];
    v31 = *(void **)&v1[v30];
    *(void *)&v1[v30] = v29;

    uint64_t v32 = objc_opt_new();
    uint64_t v33 = (int)*MEMORY[0x1E4FB8F30];
    v34 = *(void **)&v1[v33];
    *(void *)&v1[v33] = v32;

    uint64_t v35 = objc_opt_new();
    uint64_t v36 = (int)*MEMORY[0x1E4FB8F38];
    v37 = *(void **)&v1[v36];
    *(void *)&v1[v36] = v35;

    uint64_t v38 = objc_opt_new();
    uint64_t v39 = (int)*MEMORY[0x1E4FB8F40];
    v40 = *(void **)&v1[v39];
    *(void *)&v1[v39] = v38;

    uint64_t v41 = objc_opt_new();
    uint64_t v42 = (int)*MEMORY[0x1E4FB8F18];
    v43 = *(void **)&v1[v42];
    *(void *)&v1[v42] = v41;

    int v44 = 24;
    do
    {
      [*(id *)&v1[v51] addCount:0, v46];
      [*(id *)&v1[v50] addCount:0];
      [*(id *)&v1[v49] addCount:0];
      [*(id *)&v1[v48] addCount:0];
      [*(id *)&v1[v47] addCount:0];
      [*(id *)&v1[v46] addCount:0];
      [*(id *)&v1[v21] addCount:0];
      [*(id *)&v1[v24] addCount:0];
      [*(id *)&v1[v27] addCount:0];
      [*(id *)&v1[v30] addCount:0];
      [*(id *)&v1[v33] addCount:0];
      [*(id *)&v1[v36] addCount:0];
      [*(id *)&v1[v39] addCount:0];
      [*(id *)&v1[v42] addCount:0];
      --v44;
    }
    while (v44);
  }
  return v1;
}

- (uint64_t)metricId
{
  return 2883622;
}

- (BOOL)valid:()MetricManager
{
  v25[14] = *MEMORY[0x1E4F143B8];
  if (([a1 conformsToProtocol:&unk_1F34BFDD8] & 1) == 0)
  {
    v16 = NSString;
    uint64_t v17 = NSStringFromProtocol((Protocol *)&unk_1F34BFDD8);
    uint64_t v15 = [v16 stringWithFormat:@"Invalid metric. metric does not conform to the %@ protocol.", v17];

    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v15 = @"Invalid metric. the metric does not have an ID.";
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&a1[*MEMORY[0x1E4FB8F10]];
  v25[0] = *(void *)&a1[*MEMORY[0x1E4FB8F58]];
  v25[1] = v5;
  uint64_t v6 = *(void *)&a1[*MEMORY[0x1E4FB8F60]];
  v25[2] = *(void *)&a1[*MEMORY[0x1E4FB8F78]];
  v25[3] = v6;
  uint64_t v7 = *(void *)&a1[*MEMORY[0x1E4FB8F68]];
  v25[4] = *(void *)&a1[*MEMORY[0x1E4FB8F70]];
  v25[5] = v7;
  uint64_t v8 = *(void *)&a1[*MEMORY[0x1E4FB8F50]];
  v25[6] = *(void *)&a1[*MEMORY[0x1E4FB8F48]];
  v25[7] = v8;
  uint64_t v9 = *(void *)&a1[*MEMORY[0x1E4FB8F28]];
  v25[8] = *(void *)&a1[*MEMORY[0x1E4FB8F20]];
  v25[9] = v9;
  uint64_t v10 = *(void *)&a1[*MEMORY[0x1E4FB8F38]];
  v25[10] = *(void *)&a1[*MEMORY[0x1E4FB8F30]];
  v25[11] = v10;
  uint64_t v11 = *(void *)&a1[*MEMORY[0x1E4FB8F18]];
  v25[12] = *(void *)&a1[*MEMORY[0x1E4FB8F40]];
  v25[13] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:14];
  if ([v12 count])
  {
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
      if ([v14 countsCount] != 24) {
        break;
      }

      if ([v12 count] <= (unint64_t)++v13) {
        goto LABEL_7;
      }
    }
    uint64_t v18 = NSString;
    v19 = [NSNumber numberWithUnsignedInteger:[v14 countsCount]];
    uint64_t v15 = [v18 stringWithFormat:@"Invalid metric. Incorrect bin count, %@, for histogram field at index %d.", v19, v13];
  }
  else
  {
LABEL_7:
    uint64_t v15 = 0;
  }

  if (a3)
  {
LABEL_14:
    if (v15)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v24 = v15;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      *a3 = [v20 errorWithDomain:@"RTMetricManagerErrorDomain" code:1 userInfo:v21];
    }
  }
LABEL_16:

  return v15 == 0;
}

@end