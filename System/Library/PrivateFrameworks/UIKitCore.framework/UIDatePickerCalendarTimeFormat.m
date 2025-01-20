@interface UIDatePickerCalendarTimeFormat
@end

@implementation UIDatePickerCalendarTimeFormat

id __121___UIDatePickerCalendarTimeFormat_initWithCalendar_locale_followsSystemHourCycle_forceDoubleDigitHours_displaysTimeZone___block_invoke(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = *MEMORY[0x1E4F1C390];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1C390]];
  v6 = (void *)[v5 mutableCopy];

  v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  if (a2)
  {
    while (![v6 rangeOfCharacterFromSet:v7 options:0])
      objc_msgSend(v6, "replaceCharactersInRange:withString:", 0, v8, &stru_1ED0E84C0);
  }
  else
  {
    uint64_t v9 = [v6 rangeOfCharacterFromSet:v7 options:4];
    uint64_t v11 = v10;
    if (v9 + v10 == [v6 length])
    {
      do
      {
        objc_msgSend(v6, "replaceCharactersInRange:withString:", v9, v11, &stru_1ED0E84C0);
        uint64_t v9 = [v6 rangeOfCharacterFromSet:v7 options:4];
        uint64_t v11 = v12;
      }
      while (v9 + v12 == [v6 length]);
    }
  }
  if ([v6 length])
  {
    v13 = (void *)[v3 mutableCopy];
    v14 = (void *)[v6 copy];
    [v13 setObject:v14 forKeyedSubscript:v4];

    v15 = (void *)[v13 copy];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end