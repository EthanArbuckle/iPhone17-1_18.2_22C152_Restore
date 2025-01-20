@interface NSDateInterval
@end

@implementation NSDateInterval

id __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28C18]);
  v3 = v2;
  if (*(void *)(a1 + 32) || *(void *)(a1 + 40))
  {
    v4 = objc_msgSend(v2, "initWithStartDate:duration:", 0.0);
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9C8] date];
    v4 = (void *)[v3 initWithStartDate:v6 duration:0.0];
  }
  return v4;
}

id __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 40)];
  return v1;
}

void __73__NSDateInterval_FCAdditions__fc_durationOfDateIntervalsIgnoringOverlap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      v10 = v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (v10
          && objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "intersectsDateInterval:", v10, (void)v13))
        {
          v12 = objc_msgSend(v11, "fc_unionWithDateInterval:", v10);
          [v3 addObject:v12];
        }
        else
        {
          objc_msgSend(v3, "addObject:", v11, (void)v13);
        }
        id v7 = v11;

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
}

@end