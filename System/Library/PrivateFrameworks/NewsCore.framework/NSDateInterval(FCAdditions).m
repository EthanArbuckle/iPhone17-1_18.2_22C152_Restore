@interface NSDateInterval(FCAdditions)
+ (double)fc_durationOfDateIntervalsIgnoringOverlap:()FCAdditions;
+ (id)fc_safeDateIntervalWithStartDate:()FCAdditions endDate:;
- (id)fc_unionWithDateInterval:()FCAdditions;
@end

@implementation NSDateInterval(FCAdditions)

+ (id)fc_safeDateIntervalWithStartDate:()FCAdditions endDate:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke;
    v14[3] = &unk_1E5B4E868;
    id v15 = v5;
    id v16 = v7;
    v8 = __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke((uint64_t)v14);

    v9 = v15;
    goto LABEL_6;
  }
  if ([v5 compare:v6] == 1)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    id v12 = v7;
    id v13 = v5;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C18]), "initWithStartDate:endDate:", v12, v13, v11, 3221225472, __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke_2, &unk_1E5B4E868);

    v9 = v12;
LABEL_6:

    goto LABEL_8;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v7];
LABEL_8:

  return v8;
}

+ (double)fc_durationOfDateIntervalsIgnoringOverlap:()FCAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [a3 sortedArrayUsingSelector:sel_compare_];
  v4 = (void *)MEMORY[0x1E4F1C978];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__NSDateInterval_FCAdditions__fc_durationOfDateIntervalsIgnoringOverlap___block_invoke;
  v18[3] = &unk_1E5B4BF30;
  id v5 = v3;
  id v19 = v5;
  id v6 = objc_msgSend(v4, "fc_array:", v18);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) duration];
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (id)fc_unionWithDateInterval:()FCAdditions
{
  id v4 = a3;
  id v5 = [a1 startDate];
  id v6 = [v4 startDate];
  uint64_t v7 = [v5 earlierDate:v6];

  uint64_t v8 = [a1 endDate];
  uint64_t v9 = [v4 endDate];

  double v10 = [v8 laterDate:v9];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v10];
  return v11;
}

@end