@interface STDowntimeOverrideBuilder
+ (id)createAutomaticOverrideWithState:(int64_t)a3 schedule:(id)a4 creationDate:(id)a5 calendar:(id)a6;
+ (id)createFixedDurationOverrideWithInterval:(double)a3 state:(int64_t)a4 creationDate:(id)a5 calendar:(id)a6;
@end

@implementation STDowntimeOverrideBuilder

+ (id)createFixedDurationOverrideWithInterval:(double)a3 state:(int64_t)a4 creationDate:(id)a5 calendar:(id)a6
{
  v9 = NSNumber;
  id v10 = a6;
  id v11 = a5;
  v12 = [v9 numberWithDouble:a3];
  v13 = +[STDowntimeOverride overrideWithState:a4 creationDate:v11 calendar:v10 fixedDuration:v12];

  return v13;
}

+ (id)createAutomaticOverrideWithState:(int64_t)a3 schedule:(id)a4 creationDate:(id)a5 calendar:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![v9 enabled]
    || ([v9 computeNextOverrideEndDateForState:a3 creationDate:v10 inCalendar:v11],
        (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = [v11 startOfDayForDate:v10];
    v14 = [v11 components:96 fromDate:v13];
    v12 = [v11 nextDateAfterDate:v13 matchingComponents:v14 options:1024];
  }
  v15 = +[STDowntimeOverride overrideWithState:a3 creationDate:v10 calendar:v11 endDate:v12];

  return v15;
}

@end