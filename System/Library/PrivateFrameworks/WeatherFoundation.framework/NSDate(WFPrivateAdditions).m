@interface NSDate(WFPrivateAdditions)
+ (id)wf_allWeatherConditionsOnDate:()WFPrivateAdditions inCalendar:inArray:;
+ (id)wf_weatherConditionsClosestToDate:()WFPrivateAdditions inArray:;
+ (id)wf_weatherConditionsOnDate:()WFPrivateAdditions inCalendar:inArray:;
+ (uint64_t)wf_isDate:()WFPrivateAdditions inSameDayWithDate:inCalendar:;
+ (uint64_t)wf_minutesBetweenDate:()WFPrivateAdditions andDate:;
- (uint64_t)wf_allWeatherConditionsOnDate:()WFPrivateAdditions inCalendar:;
- (uint64_t)wf_isInSameDayWithDate:()WFPrivateAdditions inCalendar:;
- (uint64_t)wf_minutesDifferenceFromDate:()WFPrivateAdditions;
- (uint64_t)wf_weatherConditionsClosestToDate:()WFPrivateAdditions;
- (uint64_t)wf_weatherConditionsOnDate:()WFPrivateAdditions inCalendar:;
@end

@implementation NSDate(WFPrivateAdditions)

+ (uint64_t)wf_isDate:()WFPrivateAdditions inSameDayWithDate:inCalendar:
{
  return objc_msgSend(a5, "isDate:inSameDayAsDate:");
}

+ (uint64_t)wf_minutesBetweenDate:()WFPrivateAdditions andDate:
{
  if (!a3 || !a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = a4;
  id v6 = a3;
  v7 = +[WFWeatherConditions calendar];
  v8 = [v7 components:64 fromDate:v6 toDate:v5 options:0];

  uint64_t v9 = [v8 minute];
  return v9;
}

+ (id)wf_weatherConditionsClosestToDate:()WFPrivateAdditions inArray:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v20;
    unint64_t v10 = -1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:@"WFWeatherForecastDateComponent"];
        uint64_t v14 = objc_msgSend(MEMORY[0x263EFF910], "wf_minutesBetweenDate:andDate:", v5, v13);
        if (v14 >= 0) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = -v14;
        }
        if (v15 < v10)
        {
          id v16 = v12;

          v8 = v16;
          unint64_t v10 = v15;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)wf_weatherConditionsOnDate:()WFPrivateAdditions inCalendar:inArray:
{
  id v7 = a3;
  v8 = objc_msgSend(MEMORY[0x263EFF910], "wf_allWeatherConditionsOnDate:inCalendar:inArray:", v7, a4, a5);
  if ((unint64_t)[v8 count] < 2) {
    [v8 lastObject];
  }
  else {
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF910], "wf_weatherConditionsClosestToDate:inArray:", v7, v8);
  }

  return v9;
}

+ (id)wf_allWeatherConditionsOnDate:()WFPrivateAdditions inCalendar:inArray:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v18 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = [v15 objectForKeyedSubscript:@"WFWeatherForecastDateComponent"];
        if (objc_msgSend(MEMORY[0x263EFF910], "wf_isDate:inSameDayWithDate:inCalendar:", v7, v16, v8)) {
          [v18 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v18;
}

- (uint64_t)wf_isInSameDayWithDate:()WFPrivateAdditions inCalendar:
{
  return objc_msgSend(MEMORY[0x263EFF910], "wf_isDate:inSameDayWithDate:inCalendar:", a1, a3, a4);
}

- (uint64_t)wf_minutesDifferenceFromDate:()WFPrivateAdditions
{
  return objc_msgSend(MEMORY[0x263EFF910], "wf_minutesBetweenDate:andDate:", a1, a3);
}

- (uint64_t)wf_weatherConditionsClosestToDate:()WFPrivateAdditions
{
  return objc_msgSend(MEMORY[0x263EFF910], "wf_weatherConditionsClosestToDate:inArray:", a1, a3);
}

- (uint64_t)wf_weatherConditionsOnDate:()WFPrivateAdditions inCalendar:
{
  return objc_msgSend(MEMORY[0x263EFF910], "wf_weatherConditionsOnDate:inCalendar:inArray:", a1, a4, a3);
}

- (uint64_t)wf_allWeatherConditionsOnDate:()WFPrivateAdditions inCalendar:
{
  return objc_msgSend(MEMORY[0x263EFF910], "wf_allWeatherConditionsOnDate:inCalendar:inArray:", a1, a4, a3);
}

@end