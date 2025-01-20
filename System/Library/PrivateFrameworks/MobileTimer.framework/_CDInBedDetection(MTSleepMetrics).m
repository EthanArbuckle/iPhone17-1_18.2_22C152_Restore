@interface _CDInBedDetection(MTSleepMetrics)
- (id)_mt_dateInterval;
- (void)_mt_dateInterval;
@end

@implementation _CDInBedDetection(MTSleepMetrics)

- (id)_mt_dateInterval
{
  v2 = [a1 startDate];
  v3 = [a1 endDate];
  int v4 = [v2 mtIsAfterOrSameAsDate:v3];

  if (v4)
  {
    v5 = MTLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_CDInBedDetection(MTSleepMetrics) *)(uint64_t)a1 _mt_dateInterval];
    }

    NSLog(&cfstr_StartdateMustO.isa);
    v6 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
    v8 = [a1 startDate];
    v9 = [a1 endDate];
    v6 = (void *)[v7 initWithStartDate:v8 endDate:v9];
  }
  return v6;
}

- (void)_mt_dateInterval
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ startDate must occur before endDate.", (uint8_t *)&v2, 0xCu);
}

@end