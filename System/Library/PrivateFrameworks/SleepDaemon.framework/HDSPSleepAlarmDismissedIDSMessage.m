@interface HDSPSleepAlarmDismissedIDSMessage
- (id)dateDescription;
- (unint64_t)destinations;
@end

@implementation HDSPSleepAlarmDismissedIDSMessage

- (unint64_t)destinations
{
  return 2;
}

- (id)dateDescription
{
  return @"dismissedDate";
}

@end