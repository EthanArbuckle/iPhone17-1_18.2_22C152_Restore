@interface TRISysdiagnoseOutputFormatter
+ (id)formatRecords:(id)a3;
@end

@implementation TRISysdiagnoseOutputFormatter

+ (id)formatRecords:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v3 = [v28 sortedArrayUsingComparator:&__block_literal_global_2];
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  [v4 setTimeZone:v5];
  v31 = v4;
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];

  v6 = (void *)[&unk_1EEFCBDB0 mutableCopy];
  if (![v3 count]) {
    [v6 addObject:@"no experiments history"];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v38;
    int v7 = -1;
    v8 = &stru_1EEFB6D68;
    v9 = &stru_1EEFB6D68;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke_2;
        v33[3] = &unk_1E596A2F0;
        v33[4] = v11;
        v12 = v9;
        v34 = v12;
        int v36 = v7;
        v13 = v8;
        v35 = v13;
        if (__47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke_2((uint64_t)v33))
        {
          id v14 = [NSString alloc];
          v15 = [v11 experimentId];
          v16 = (void *)[v14 initWithFormat:@"    - experiment: %@.%d", v15, objc_msgSend(v11, "deploymentId")];

          id v17 = [NSString alloc];
          v18 = [v11 treatmentId];
          v19 = (void *)[v17 initWithFormat:@"      treatment : %@", v18];

          [v6 addObject:v16];
          [v6 addObject:v19];
          [v6 addObject:@"      states    :"];
        }
        v20 = (void *)MEMORY[0x19F3AD060]();
        id v21 = [NSString alloc];
        unsigned int v22 = [v11 eventType] - 1;
        v23 = @"unknown";
        if (v22 <= 8) {
          v23 = off_1E596A310[(char)v22];
        }
        v24 = [v11 eventDate];
        v25 = [v31 stringFromDate:v24];
        v26 = (void *)[v21 initWithFormat:@"        - %@ -> %@", v23, v25];

        [v6 addObject:v26];
        v9 = [v11 experimentId];

        int v7 = [v11 deploymentId];
        v8 = [v11 treatmentId];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v32);
  }
  else
  {
    v8 = &stru_1EEFB6D68;
    v9 = &stru_1EEFB6D68;
  }

  return v6;
}

uint64_t __47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 experimentId];
  int v7 = [v5 experimentId];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "deploymentId"));
    uint64_t v8 = [v9 compare:v10];

    if (!v8)
    {
      v11 = [v4 treatmentId];
      v12 = [v5 treatmentId];
      uint64_t v8 = [v11 compare:v12];

      if (!v8)
      {
        v13 = [v4 eventDate];
        id v14 = [v5 eventDate];
        uint64_t v8 = [v13 compare:v14];
      }
    }
  }

  return v8;
}

uint64_t __47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) experimentId];
  if ([v2 isEqualToString:*(void *)(a1 + 40)]
    && [*(id *)(a1 + 32) deploymentId] == *(_DWORD *)(a1 + 56))
  {
    v3 = [*(id *)(a1 + 32) treatmentId];
    int v4 = [v3 isEqualToString:*(void *)(a1 + 48)];

    uint64_t v5 = v4 ^ 1u;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

@end