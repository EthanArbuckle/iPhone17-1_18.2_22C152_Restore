@interface HDSPSleepAlarmSnoozedIDSMessage
- (id)dateDescription;
- (unint64_t)destinations;
@end

@implementation HDSPSleepAlarmSnoozedIDSMessage

- (unint64_t)destinations
{
  return 2;
}

- (id)dateDescription
{
  return @"snoozedUntilDate";
}

@end