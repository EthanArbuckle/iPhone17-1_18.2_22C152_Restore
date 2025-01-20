@interface NSDateComponents(HKSPSleep)
- (id)hksp_description;
- (id)hksp_timeComponents;
- (uint64_t)hksp_compareHourAndMinuteComponents:()HKSPSleep;
@end

@implementation NSDateComponents(HKSPSleep)

- (id)hksp_description
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([a1 year] != 0x7FFFFFFFFFFFFFFFLL
    || [a1 month] != 0x7FFFFFFFFFFFFFFFLL
    || [a1 day] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "appendFormat:", @"%04ld-%02ld-%02ld", objc_msgSend(a1, "year"), objc_msgSend(a1, "month"), objc_msgSend(a1, "day"));
  }
  if ([a1 hour] != 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @" %ld:%02ld", objc_msgSend(a1, "hour"), objc_msgSend(a1, "minute"));
  }
  v3 = objc_msgSend(v2, "hk_stripLeadingTrailingWhitespace");

  return v3;
}

- (uint64_t)hksp_compareHourAndMinuteComponents:()HKSPSleep
{
  id v5 = a3;
  if ([a1 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NSDateComponents+HKSPSleep.m", 34, @"Invalid parameter not satisfying: %@", @"self.hour != NSDateComponentUndefined" object file lineNumber description];
  }
  if ([a1 minute] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NSDateComponents+HKSPSleep.m", 35, @"Invalid parameter not satisfying: %@", @"self.minute != NSDateComponentUndefined" object file lineNumber description];
  }
  if ([v5 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"NSDateComponents+HKSPSleep.m", 36, @"Invalid parameter not satisfying: %@", @"otherDateComponents.hour != NSDateComponentUndefined" object file lineNumber description];
  }
  if ([v5 minute] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSDateComponents+HKSPSleep.m", 37, @"Invalid parameter not satisfying: %@", @"otherDateComponents.minute != NSDateComponentUndefined" object file lineNumber description];
  }
  v6 = objc_msgSend(a1, "hk_hourNumber");
  v7 = objc_msgSend(v5, "hk_hourNumber");
  uint64_t v8 = [v6 compare:v7];

  v9 = objc_msgSend(a1, "hk_minuteNumber");
  v10 = objc_msgSend(v5, "hk_minuteNumber");
  uint64_t v11 = [v9 compare:v10];

  if (v8) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = v11;
  }

  return v12;
}

- (id)hksp_timeComponents
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v2, "setHour:", objc_msgSend(a1, "hour"));
  objc_msgSend(v2, "setMinute:", objc_msgSend(a1, "minute"));
  return v2;
}

@end