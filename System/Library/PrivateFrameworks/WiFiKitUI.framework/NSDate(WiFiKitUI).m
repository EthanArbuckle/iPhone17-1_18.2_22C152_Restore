@interface NSDate(WiFiKitUI)
- (BOOL)isTodayWithCalendar:()WiFiKitUI;
- (id)stringFromDHCPLeaseExpirationDateWithFormatString:()WiFiKitUI;
@end

@implementation NSDate(WiFiKitUI)

- (id)stringFromDHCPLeaseExpirationDateWithFormatString:()WiFiKitUI
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v7 = [a1 isTodayWithCalendar:v6];

  if (v7)
  {
    [v5 setTimeStyle:1];
    [v5 setDateStyle:0];
  }
  else
  {
    v8 = [MEMORY[0x263EFF960] currentLocale];
    v9 = [v8 localeIdentifier];
    int v10 = [v9 isEqualToString:@"en_US"];

    [v5 setDoesRelativeDateFormatting:1];
    if (v4 && v10)
    {
      [v5 setDateStyle:1];
      id v11 = objc_alloc_init(MEMORY[0x263F08790]);
      [v11 setTimeStyle:1];
      v12 = NSString;
      v13 = [v5 stringFromDate:a1];
      v14 = [v11 stringFromDate:a1];
      v15 = objc_msgSend(v12, "stringWithFormat:", v4, v13, v14);

      goto LABEL_8;
    }
    [v5 setDateStyle:3];
    [v5 setTimeStyle:1];
  }
  v15 = [v5 stringFromDate:a1];
LABEL_8:

  return v15;
}

- (BOOL)isTodayWithCalendar:()WiFiKitUI
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  int v7 = [v5 components:30 fromDate:v6];

  v8 = [v5 components:30 fromDate:a1];

  uint64_t v9 = [v7 day];
  if (v9 == [v8 day]
    && (uint64_t v10 = [v7 month], v10 == objc_msgSend(v8, "month"))
    && (uint64_t v11 = [v7 year], v11 == objc_msgSend(v8, "year")))
  {
    uint64_t v12 = [v7 era];
    BOOL v13 = v12 == [v8 era];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end