@interface NanoBedtimeSampleDataSource
+ (id)relevanceProviderForDate:(id)a3;
- (id)upcomingEvents;
@end

@implementation NanoBedtimeSampleDataSource

+ (id)relevanceProviderForDate:(id)a3
{
  return (id)_REUISampleRelevanceProviderForSamplePosition(14, a2, a3);
}

- (id)upcomingEvents
{
  v2 = objc_opt_new();
  [v2 setHour:22];
  [v2 setMinute:0];
  uint64_t v3 = HKSPSleepEventIdentifierBedtime;
  v4 = +[NSCalendar currentCalendar];
  v5 = [v4 dateFromComponents:v2];
  v6 = +[HKSPSleepEvent sleepEventWithIdentifier:v3 dueDate:v5];

  v10 = v6;
  v7 = +[NSArray arrayWithObjects:&v10 count:1];
  v8 = +[NAFuture futureWithResult:v7];

  return v8;
}

@end