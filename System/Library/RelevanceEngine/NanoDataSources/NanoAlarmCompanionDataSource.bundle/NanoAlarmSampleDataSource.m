@interface NanoAlarmSampleDataSource
+ (id)relevanceProviderForDate:(id)a3;
- (id)todaysAlarms;
- (id)tomorrowAlarms;
@end

@implementation NanoAlarmSampleDataSource

+ (id)relevanceProviderForDate:(id)a3
{
  return (id)_REUISampleRelevanceProviderForSamplePosition(11, a2, a3);
}

- (id)todaysAlarms
{
  v2 = +[MTAlarm alarmWithHour:7 minute:0];
  v6 = v2;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = +[NAFuture futureWithResult:v3];

  return v4;
}

- (id)tomorrowAlarms
{
  v2 = +[MTAlarm alarmWithHour:7 minute:0];
  v6 = v2;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = +[NAFuture futureWithResult:v3];

  return v4;
}

@end