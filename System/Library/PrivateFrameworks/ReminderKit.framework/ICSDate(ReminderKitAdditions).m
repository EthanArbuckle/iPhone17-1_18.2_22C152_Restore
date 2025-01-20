@interface ICSDate(ReminderKitAdditions)
- (id)rem_dateAsUTC;
- (id)rem_dateWithICSCalendar:()ReminderKitAdditions;
@end

@implementation ICSDate(ReminderKitAdditions)

- (id)rem_dateAsUTC
{
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  v3 = (void *)MEMORY[0x1E4F1C9D8];
  v4 = [a1 components];
  v5 = objc_msgSend(v3, "rem_dateWithDateComponents:timeZone:", v4, v2);

  return v5;
}

- (id)rem_dateWithICSCalendar:()ReminderKitAdditions
{
  v4 = [a3 systemTimeZoneForDate:a1];
  v5 = (void *)MEMORY[0x1E4F1C9D8];
  v6 = [a1 components];
  if (v4) {
    objc_msgSend(v5, "rem_dateWithDateComponents:timeZone:", v6, v4);
  }
  else {
  v7 = objc_msgSend(v5, "rem_dateWithDateComponentsUsingArchivingTimeZone:", v6);
  }

  return v7;
}

@end