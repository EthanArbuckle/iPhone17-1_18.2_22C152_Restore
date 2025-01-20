@interface NSDateInterval(SCLScheduling)
+ (id)SCL_dateIntervalForActiveScheduleOnOrAfterDate:()SCLScheduling calendar:startComponents:endComponents:;
@end

@implementation NSDateInterval(SCLScheduling)

+ (id)SCL_dateIntervalForActiveScheduleOnOrAfterDate:()SCLScheduling calendar:startComponents:endComponents:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 nextDateAfterDate:v9 matchingComponents:v11 options:5124];
  id v14 = [v10 nextDateAfterDate:v9 matchingComponents:v12 options:9220];
  id v15 = v14;
  while ([v9 compare:v15] != -1 || objc_msgSend(v13, "compare:", v15) != -1)
  {
    v16 = [v10 nextDateAfterDate:v15 matchingComponents:v11 options:9216];

    v17 = [v10 nextDateAfterDate:v15 matchingComponents:v12 options:5120];

    v18 = [v10 nextDateAfterDate:v16 matchingComponents:v12 options:5120];

    id v14 = v17;
    id v15 = v18;
    v13 = v16;
    if ([v17 compare:v18] == -1)
    {
      id v14 = v17;
      id v15 = v18;
      v13 = v16;
      if ([v17 compare:v16] == -1)
      {
        id v15 = v17;

        v13 = [v10 nextDateAfterDate:v15 matchingComponents:v11 options:9220];

        id v14 = v17;
      }
    }
  }
  v19 = [v10 nextDateAfterDate:v15 matchingComponents:v11 options:9220];
  v20 = [v10 nextDateAfterDate:v13 matchingComponents:v12 options:9216];
  v21 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v19 endDate:v20];

  return v21;
}

@end