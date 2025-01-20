@interface NSDate(UserNotificationsUIKitAdditions)
- (BOOL)nc_isAfternoon;
- (BOOL)nc_isEvening;
- (BOOL)nc_isMorning;
- (BOOL)nc_isNight;
- (uint64_t)_nc_hour;
@end

@implementation NSDate(UserNotificationsUIKitAdditions)

- (uint64_t)_nc_hour
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 components:32 fromDate:a1];

  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v3 setTimeZone:v4];

  uint64_t v5 = [v3 hour];
  return v5;
}

- (BOOL)nc_isMorning
{
  return (unint64_t)(objc_msgSend(a1, "_nc_hour") - 6) < 6;
}

- (BOOL)nc_isAfternoon
{
  return (unint64_t)(objc_msgSend(a1, "_nc_hour") - 12) < 5;
}

- (BOOL)nc_isEvening
{
  return (unint64_t)(objc_msgSend(a1, "_nc_hour") - 17) < 5;
}

- (BOOL)nc_isNight
{
  return (objc_msgSend(a1, "_nc_hour") & 0xFFFFFFFFFFFFFFFELL) == 22;
}

@end