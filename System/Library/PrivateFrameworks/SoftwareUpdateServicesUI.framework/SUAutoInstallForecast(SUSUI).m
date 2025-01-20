@interface SUAutoInstallForecast(SUSUI)
- (BOOL)_uses24HourTimeForLocale;
- (__CFString)formatCardinalityForDate:()SUSUI;
- (id)_componentsFromDate:()SUSUI;
- (id)_susui_cardinalityForRoundedEndTime;
- (id)_susui_cardinalityForRoundedStartTime;
- (id)_susui_formattedRoundedEndTimeString;
- (id)_susui_formattedRoundedStartTimeString;
- (id)_timeFormatter;
@end

@implementation SUAutoInstallForecast(SUSUI)

- (id)_susui_formattedRoundedStartTimeString
{
  id v3 = (id)[a1 _timeFormatter];
  id v2 = (id)[a1 _roundedStartTime];
  id v4 = (id)objc_msgSend(v3, "stringFromDate:");

  return v4;
}

- (id)_susui_formattedRoundedEndTimeString
{
  id v3 = (id)[a1 _timeFormatter];
  id v2 = (id)[a1 _roundedEndTime];
  id v4 = (id)objc_msgSend(v3, "stringFromDate:");

  return v4;
}

- (id)_susui_cardinalityForRoundedStartTime
{
  id v3 = (id)[a1 _roundedStartTime];
  id v4 = (id)objc_msgSend(a1, "formatCardinalityForDate:");

  return v4;
}

- (id)_susui_cardinalityForRoundedEndTime
{
  id v3 = (id)[a1 _roundedEndTime];
  id v4 = (id)objc_msgSend(a1, "formatCardinalityForDate:");

  return v4;
}

- (id)_timeFormatter
{
  id v8 = a1;
  v7[1] = a2;
  v7[0] = objc_getAssociatedObject(a1, (const void *)_timeFormatter_KEY);
  if (!v7[0])
  {
    v7[0] = objc_alloc_init(MEMORY[0x263F08790]);

    id location = (id)[MEMORY[0x263EFF960] currentLocale];
    id v4 = (id)[location localeIdentifier];
    char v5 = [v4 isEqualToString:@"ja_JP"];

    if (v5)
    {
      [v7[0] setLocalizedDateFormatFromTemplate:@"j"];
    }
    else
    {
      [v7[0] setDateStyle:0];
      [v7[0] setTimeStyle:1];
    }
    objc_setAssociatedObject(v8, (const void *)_timeFormatter_KEY, v7[0], (void *)1);
    objc_storeStrong(&location, 0);
  }
  id v3 = v7[0];
  objc_storeStrong(v7, 0);

  return v3;
}

- (id)_componentsFromDate:()SUSUI
{
  id v8 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v6[1] = (id)254;
  id v4 = (id)[v8 _calendar];
  v6[0] = (id)[v4 components:254 fromDate:location[0]];

  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (BOOL)_uses24HourTimeForLocale
{
  id location[2] = a1;
  location[1] = a2;
  id v3 = (id)[a1 _timeFormatter];
  location[0] = (id)[v3 dateFormat];

  BOOL v4 = 1;
  if ([location[0] rangeOfString:@"H"] == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v4 = [location[0] rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (__CFString)formatCardinalityForDate:()SUSUI
{
  id v7 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v5 = (id)[v7 _componentsFromDate:location[0]];
  if ([v5 hour] == 1
    || [v5 hour] == 13 && (objc_msgSend(v7, "_uses24HourTimeForLocale") & 1) == 0)
  {
    id v8 = @"SINGULAR";
  }
  else
  {
    id v8 = @"PLURAL";
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  id v3 = v8;

  return v3;
}

@end