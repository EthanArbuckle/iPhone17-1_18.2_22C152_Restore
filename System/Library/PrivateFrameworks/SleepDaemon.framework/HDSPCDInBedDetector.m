@interface HDSPCDInBedDetector
+ (double)hoursOfSleepForResult:(id)a3;
+ (id)inBedDetector;
- (id)detectInBedTimesDuringInterval:(id)a3;
@end

@implementation HDSPCDInBedDetector

+ (id)inBedDetector
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (double)hoursOfSleepForResult:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) duration];
        double v7 = v7 + v9 / 3600.0;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)detectInBedTimesDuringInterval:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F34F90];
  id v4 = a3;
  uint64_t v5 = [v3 inBedDetector];
  uint64_t v6 = [v4 startDate];
  double v7 = [v4 endDate];

  id v18 = 0;
  v8 = [v5 detectInBedBetweenBedtimeDate:v6 wakupDate:v7 error:&v18];
  id v9 = v18;

  v10 = objc_msgSend(v8, "hk_map:", &__block_literal_global_9);
  if (v9)
  {
    uint64_t v11 = [MEMORY[0x263F58190] futureWithError:v9];
  }
  else
  {
    long long v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = objc_opt_class();
      id v14 = v13;
      [(id)objc_opt_class() hoursOfSleepForResult:v10];
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] calculated time in bed hours: %f", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x263F58190] futureWithResult:v10];
  }
  uint64_t v16 = (void *)v11;

  return v16;
}

id __54__HDSPCDInBedDetector_detectInBedTimesDuringInterval___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F08798];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 startDate];
  uint64_t v6 = [v3 endDate];

  double v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];

  return v7;
}

@end