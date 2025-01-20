@interface SCLScheduleFormatter
- (NSCalendar)calendar;
- (NSDateFormatter)standaloneWeekdayFormatter;
- (NSDateIntervalFormatter)weekdayIntervalFormatter;
- (NSListFormatter)listFormatter;
- (NSLocale)locale;
- (SCLScheduleFormatter)init;
- (SCLTimeIntervalsFormatter)timeIntervalsFormatter;
- (id)_formattedCustomDailyScheduleForLocale:(id)a3;
- (id)formatterItemsForSchedule:(id)a3;
- (id)stringForWeekdaysInItem:(id)a3;
- (id)stringFromSchedule:(id)a3;
- (void)_regenerateFormatters;
- (void)setCalendar:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation SCLScheduleFormatter

- (SCLScheduleFormatter)init
{
  v10.receiver = self;
  v10.super_class = (Class)SCLScheduleFormatter;
  v2 = [(SCLScheduleFormatter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    uint64_t v5 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    v7 = objc_alloc_init(SCLTimeIntervalsFormatter);
    timeIntervalsFormatter = v2->_timeIntervalsFormatter;
    v2->_timeIntervalsFormatter = v7;

    [(SCLScheduleFormatter *)v2 _regenerateFormatters];
  }
  return v2;
}

- (void)setLocale:(id)a3
{
  v4 = (NSLocale *)a3;
  if (!v4)
  {
    v4 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  }
  locale = self->_locale;
  self->_locale = v4;

  [(SCLScheduleFormatter *)self _regenerateFormatters];
}

- (void)setCalendar:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  }
  id v7 = v4;
  uint64_t v5 = (NSCalendar *)[v4 copy];
  calendar = self->_calendar;
  self->_calendar = v5;

  [(SCLScheduleFormatter *)self _regenerateFormatters];
}

- (void)_regenerateFormatters
{
  id v19 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  uint64_t v3 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  id v4 = [(SCLScheduleFormatter *)self locale];
  [v3 setLocale:v4];

  [v3 setTimeZone:v19];
  uint64_t v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
  standaloneWeekdayFormatter = self->_standaloneWeekdayFormatter;
  self->_standaloneWeekdayFormatter = v5;

  [(NSDateFormatter *)self->_standaloneWeekdayFormatter setCalendar:v3];
  id v7 = self->_standaloneWeekdayFormatter;
  v8 = [(SCLScheduleFormatter *)self locale];
  [(NSDateFormatter *)v7 setLocale:v8];

  [(NSDateFormatter *)self->_standaloneWeekdayFormatter setTimeZone:v19];
  [(NSDateFormatter *)self->_standaloneWeekdayFormatter setDateFormat:@"ccc\a"];
  v9 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x263F087A8]);
  weekdayIntervalFormatter = self->_weekdayIntervalFormatter;
  self->_weekdayIntervalFormatter = v9;

  [(NSDateIntervalFormatter *)self->_weekdayIntervalFormatter setTimeZone:v19];
  [(NSDateIntervalFormatter *)self->_weekdayIntervalFormatter setCalendar:v3];
  v11 = self->_weekdayIntervalFormatter;
  v12 = [(SCLScheduleFormatter *)self locale];
  [(NSDateIntervalFormatter *)v11 setLocale:v12];

  [(NSDateIntervalFormatter *)self->_weekdayIntervalFormatter setDateTemplate:@"ccc\a"];
  v13 = (NSListFormatter *)objc_alloc_init(MEMORY[0x263F08950]);
  listFormatter = self->_listFormatter;
  self->_listFormatter = v13;

  v15 = self->_listFormatter;
  v16 = [(SCLScheduleFormatter *)self locale];
  [(NSListFormatter *)v15 setLocale:v16];

  timeIntervalsFormatter = self->_timeIntervalsFormatter;
  v18 = [(SCLScheduleFormatter *)self locale];
  [(SCLTimeIntervalsFormatter *)timeIntervalsFormatter setLocale:v18];
}

- (id)stringFromSchedule:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [(SCLScheduleFormatter *)self formatterItemsForSchedule:v4];
  if ([v6 count])
  {
    if ([v6 count] == 1
      && ([v6 firstObject],
          id v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 days],
          v7,
          v8 == 127))
    {
      v9 = [v6 firstObject];
      objc_super v10 = [(SCLScheduleFormatter *)self timeIntervalsFormatter];
      [v10 setPrefersHoursOnly:0];

      v11 = [(SCLScheduleFormatter *)self timeIntervalsFormatter];
      v12 = [v9 timeIntervals];
      v13 = [v11 stringFromTimeIntervals:v12];
    }
    else
    {
      id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
      v14 = [(SCLScheduleFormatter *)self timeIntervalsFormatter];
      [v14 setPrefersHoursOnly:1];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v15 = v6;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v32 = v6;
        v33 = v5;
        id v34 = v4;
        id obj = v15;
        char v18 = 0;
        uint64_t v19 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v22 = [(SCLScheduleFormatter *)self stringForWeekdaysInItem:v21];
            uint64_t v23 = [(SCLScheduleFormatter *)self timeIntervalsFormatter];
            v24 = [v21 timeIntervals];
            v25 = [(id)v23 stringFromTimeIntervals:v24];

            v26 = [v21 timeIntervals];
            LOBYTE(v23) = (unint64_t)[v26 count] > 2;

            v18 |= v23;
            v27 = [(SCLScheduleFormatter *)self locale];
            v28 = -[SCLScheduleFormatter _formattedCustomDailyScheduleForLocale:](self, "_formattedCustomDailyScheduleForLocale:", v27, v22, v25);

            [v36 addObject:v28];
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v17);

        if (v18) {
          v29 = @"CustomScheduleDetailTextSemicolonSeparator";
        }
        else {
          v29 = @"CustomScheduleDetailTextCommaSeparator";
        }
        uint64_t v5 = v33;
        id v4 = v34;
        v6 = v32;
      }
      else
      {

        v29 = @"CustomScheduleDetailTextCommaSeparator";
      }
      v30 = [v5 localizedStringForKey:v29 value:&stru_26DF07678 table:@"SchoolTimeFormatters"];
      v9 = v36;
      v13 = [v36 componentsJoinedByString:v30];
    }
  }
  else
  {
    v13 = [v5 localizedStringForKey:@"ScheduleOff" value:&stru_26DF07678 table:@"SchoolTimeFormatters"];
  }

  return v13;
}

- (id)_formattedCustomDailyScheduleForLocale:(id)a3
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"CustomDailyScheduleFormat" value:&stru_26DF07678 table:@"SchoolTimeFormatters"];
  id v6 = [NSString alloc];
  id v7 = [(SCLScheduleFormatter *)self locale];
  uint64_t v8 = (void *)[v6 initWithValidatedFormat:v5 validFormatSpecifiers:@"%@%@" locale:v7 arguments:&v11 error:0];

  return v8;
}

- (id)stringForWeekdaysInItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = v4;
  id obj = [v4 dayRanges];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v9 count] == 1)
        {
          objc_super v10 = [(NSDateFormatter *)self->_standaloneWeekdayFormatter calendar];
          uint64_t v11 = [v9 firstObject];
          uint64_t v12 = [v11 integerValue];

          v13 = [MEMORY[0x263EFF910] date];
          v14 = [v10 nextDateAfterDate:v13 matchingUnit:512 value:v12 options:1024];
          id v15 = [(NSDateFormatter *)self->_standaloneWeekdayFormatter stringFromDate:v14];
          [v27 addObject:v15];
        }
        else
        {
          objc_super v10 = [(NSDateIntervalFormatter *)self->_weekdayIntervalFormatter calendar];
          uint64_t v16 = [v9 firstObject];
          uint64_t v17 = [v16 integerValue];

          char v18 = [v9 lastObject];
          uint64_t v19 = [v18 integerValue];

          v13 = [MEMORY[0x263EFF910] date];
          v14 = [v10 nextDateAfterDate:v13 matchingUnit:512 value:v17 options:1024];
          id v15 = [v10 nextDateAfterDate:v14 matchingUnit:512 value:v19 options:1024];
          v20 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v14 endDate:v15];
          v21 = [(NSDateIntervalFormatter *)self->_weekdayIntervalFormatter stringFromDateInterval:v20];
          [v27 addObject:v21];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  v22 = [(SCLScheduleFormatter *)self listFormatter];
  uint64_t v23 = [v22 stringFromItems:v27];

  return v23;
}

- (id)formatterItemsForSchedule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [(SCLScheduleFormatter *)self calendar];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke;
  v17[3] = &unk_2648AC438;
  id v18 = v4;
  id v19 = v5;
  v20 = self;
  id v7 = v5;
  id v8 = v4;
  objc_msgSend(v6, "SCL_enumerateWeekdaysUsingBlock:", v17);

  v9 = [v7 allValues];
  objc_super v10 = [(SCLScheduleFormatter *)self calendar];
  uint64_t v11 = objc_msgSend(v10, "SCL_orderedWeekdays");

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke_2;
  v15[3] = &unk_2648AC460;
  id v16 = v11;
  id v12 = v11;
  v13 = [v9 sortedArrayUsingComparator:v15];

  return v13;
}

uint64_t __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke(id *a1, uint64_t a2)
{
  id v8 = [a1[4] timeIntervalsForDay:a2];
  if ([v8 count])
  {
    id v4 = [a1[5] objectForKeyedSubscript:v8];
    if (!v4)
    {
      uint64_t v5 = [SCLScheduleFormatterItem alloc];
      uint64_t v6 = [a1[6] calendar];
      id v4 = [(SCLScheduleFormatterItem *)v5 initWithCalendar:v6 timeIntervals:v8];

      [a1[5] setObject:v4 forKeyedSubscript:v8];
    }
    [(SCLScheduleFormatterItem *)v4 addDay:a2];
  }
  return MEMORY[0x270F9A790]();
}

uint64_t __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 earliestWeekdayInCalendar];
  uint64_t v7 = [v5 earliestWeekdayInCalendar];

  id v8 = *(void **)(a1 + 32);
  v9 = [NSNumber numberWithInteger:v6];
  uint64_t v10 = [v8 indexOfObject:v9];

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [NSNumber numberWithInteger:v7];
  uint64_t v13 = [v11 indexOfObject:v12];

  v14 = [NSNumber numberWithUnsignedInteger:v10];
  id v15 = [NSNumber numberWithUnsignedInteger:v13];
  uint64_t v16 = [v14 compare:v15];

  return v16;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (SCLTimeIntervalsFormatter)timeIntervalsFormatter
{
  return self->_timeIntervalsFormatter;
}

- (NSListFormatter)listFormatter
{
  return self->_listFormatter;
}

- (NSDateFormatter)standaloneWeekdayFormatter
{
  return self->_standaloneWeekdayFormatter;
}

- (NSDateIntervalFormatter)weekdayIntervalFormatter
{
  return self->_weekdayIntervalFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_standaloneWeekdayFormatter, 0);
  objc_storeStrong((id *)&self->_listFormatter, 0);
  objc_storeStrong((id *)&self->_timeIntervalsFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end