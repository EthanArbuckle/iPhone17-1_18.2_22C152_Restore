@interface NSISO8601DateFormatter(ReminderKitAdditions)
+ (id)rem_formatterWithTimeZone:()ReminderKitAdditions;
- (id)rem_dateComponentsFromString:()ReminderKitAdditions;
- (id)rem_stringFromDateComponents:()ReminderKitAdditions;
@end

@implementation NSISO8601DateFormatter(ReminderKitAdditions)

+ (id)rem_formatterWithTimeZone:()ReminderKitAdditions
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v5 = v4;
  if (v4)
  {
    [v4 setTimeZone:v3];
    objc_msgSend(v5, "setFormatOptions:", objc_msgSend(v5, "formatOptions") | 0x80);
  }

  return v5;
}

- (id)rem_dateComponentsFromString:()ReminderKitAdditions
{
  v2 = objc_msgSend(a1, "dateFromString:");
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F1C9D8];
    id v4 = [a1 timeZone];
    v5 = objc_msgSend(v3, "rem_dateComponentsWithDate:timeZone:isAllDay:", v2, v4, 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)rem_stringFromDateComponents:()ReminderKitAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  v6 = [a1 timeZone];
  v7 = objc_msgSend(v4, "rem_dateWithDateComponents:timeZone:", v5, v6);

  v8 = [a1 stringFromDate:v7];

  return v8;
}

@end