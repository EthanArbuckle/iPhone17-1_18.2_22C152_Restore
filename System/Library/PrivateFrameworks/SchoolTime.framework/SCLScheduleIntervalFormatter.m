@interface SCLScheduleIntervalFormatter
- (BOOL)coalescesAMPMSymbols;
- (BOOL)prefersHoursOnly;
- (NSBundle)bundle;
- (NSCalendar)referenceCalendar;
- (NSDateFormatter)shortFormatter;
- (NSDateIntervalFormatter)briefFormatter;
- (NSLocale)locale;
- (NSString)table;
- (NSTimeZone)referenceTimeZone;
- (SCLScheduleIntervalFormatter)init;
- (id)_shortIntervalStringWithStart:(id)a3 end:(id)a4;
- (id)_stringForCoalescedAMPMSymbolsWithDateInterval:(id)a3 locale:(id)a4 startTimeComponents:(id)a5 endTimeComponents:(id)a6;
- (id)_stringForDateInterval:(id)a3 startComponents:(id)a4 endComponents:(id)a5;
- (id)newDateFormatterWithLocale:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromTime:(id)a3 toTime:(id)a4;
- (id)stringFromTimeInterval:(id)a3;
- (unint64_t)formattingStyle;
- (void)setBriefFormatter:(id)a3;
- (void)setBundle:(id)a3;
- (void)setCoalescesAMPMSymbols:(BOOL)a3;
- (void)setFormattingStyle:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setPrefersHoursOnly:(BOOL)a3;
- (void)setReferenceCalendar:(id)a3;
- (void)setReferenceTimeZone:(id)a3;
- (void)setShortFormatter:(id)a3;
- (void)setTable:(id)a3;
@end

@implementation SCLScheduleIntervalFormatter

- (SCLScheduleIntervalFormatter)init
{
  v23.receiver = self;
  v23.super_class = (Class)SCLScheduleIntervalFormatter;
  v2 = [(SCLScheduleIntervalFormatter *)&v23 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    v4 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [(NSCalendar *)v3 setTimeZone:v4];
    uint64_t v5 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v5;

    referenceCalendar = v2->_referenceCalendar;
    v2->_referenceCalendar = v3;
    v8 = v3;

    referenceTimeZone = v2->_referenceTimeZone;
    v2->_referenceTimeZone = v4;
    v10 = v4;

    v11 = [(SCLScheduleIntervalFormatter *)v2 newDateFormatterWithLocale:v2->_locale];
    [(NSDateFormatter *)v11 setDateStyle:0];
    [(NSDateFormatter *)v11 setTimeStyle:1];
    shortFormatter = v2->_shortFormatter;
    v2->_shortFormatter = v11;
    v13 = v11;

    v14 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x263F087A8]);
    [(NSDateIntervalFormatter *)v14 setLocale:v2->_locale];
    v15 = [(SCLScheduleIntervalFormatter *)v2 referenceCalendar];
    [(NSDateIntervalFormatter *)v14 setCalendar:v15];

    v16 = [(SCLScheduleIntervalFormatter *)v2 referenceTimeZone];
    [(NSDateIntervalFormatter *)v14 setTimeZone:v16];

    [(NSDateIntervalFormatter *)v14 setDateStyle:0];
    [(NSDateIntervalFormatter *)v14 setTimeStyle:1];
    briefFormatter = v2->_briefFormatter;
    v2->_briefFormatter = v14;
    v18 = v14;

    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v19;

    table = v2->_table;
    v2->_table = (NSString *)@"SchoolTimeFormatters";
  }
  return v2;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  id v5 = a3;
  [(NSDateIntervalFormatter *)self->_briefFormatter setLocale:v5];
  [(NSDateFormatter *)self->_shortFormatter setLocale:v5];
}

- (id)newDateFormatterWithLocale:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08790];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setLocale:v5];

  v7 = [(SCLScheduleIntervalFormatter *)self referenceCalendar];
  [v6 setCalendar:v7];

  v8 = [(SCLScheduleIntervalFormatter *)self referenceTimeZone];
  [v6 setTimeZone:v8];

  return v6;
}

- (id)stringFromTimeInterval:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startTime];
  id v6 = [v4 endTime];

  v7 = [(SCLScheduleIntervalFormatter *)self stringFromTime:v5 toTime:v6];

  return v7;
}

- (id)stringFromTime:(id)a3 toTime:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    v8 = [a3 dateComponents];
    v9 = [v7 dateComponents];

    v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
    v11 = [(SCLScheduleIntervalFormatter *)self referenceCalendar];
    v12 = [v11 dateByAddingComponents:v8 toDate:v10 options:0];
    v13 = [v11 dateByAddingComponents:v9 toDate:v10 options:0];
    v14 = [v12 earlierDate:v13];

    if (v14 == v12)
    {
      v15 = v13;
    }
    else
    {
      v15 = [v11 dateByAddingUnit:16 value:1 toDate:v13 options:0];

      v16 = [v12 earlierDate:v15];

      id v4 = 0;
      v13 = v15;
      if (v16 != v12)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    v17 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v12 endDate:v13];
    id v4 = [(SCLScheduleIntervalFormatter *)self _stringForDateInterval:v17 startComponents:v8 endComponents:v9];

    goto LABEL_8;
  }
LABEL_9:
  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SCLScheduleIntervalFormatter *)self stringFromTimeInterval:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_stringForDateInterval:(id)a3 startComponents:(id)a4 endComponents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(SCLScheduleIntervalFormatter *)self formattingStyle])
  {
    v11 = [(SCLScheduleIntervalFormatter *)self briefFormatter];
    uint64_t v12 = [v11 stringFromDateInterval:v8];
    goto LABEL_10;
  }
  if ([(SCLScheduleIntervalFormatter *)self formattingStyle] == 1
    && ![(SCLScheduleIntervalFormatter *)self coalescesAMPMSymbols]
    && ![(SCLScheduleIntervalFormatter *)self prefersHoursOnly])
  {
    v11 = [(SCLScheduleIntervalFormatter *)self shortFormatter];
    v15 = [v8 startDate];
    v16 = [v11 stringFromDate:v15];
    v17 = [v8 endDate];
    v18 = [v11 stringFromDate:v17];
    v13 = [(SCLScheduleIntervalFormatter *)self _shortIntervalStringWithStart:v16 end:v18];

    goto LABEL_11;
  }
  if ([(SCLScheduleIntervalFormatter *)self formattingStyle] == 1
    && ([(SCLScheduleIntervalFormatter *)self coalescesAMPMSymbols]
     || [(SCLScheduleIntervalFormatter *)self prefersHoursOnly]))
  {
    v11 = [(SCLScheduleIntervalFormatter *)self locale];
    uint64_t v12 = [(SCLScheduleIntervalFormatter *)self _stringForCoalescedAMPMSymbolsWithDateInterval:v8 locale:v11 startTimeComponents:v9 endTimeComponents:v10];
LABEL_10:
    v13 = (void *)v12;
LABEL_11:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)_shortIntervalStringWithStart:(id)a3 end:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SCLScheduleIntervalFormatter *)self bundle];
  id v9 = [(SCLScheduleIntervalFormatter *)self table];
  id v10 = [v8 localizedStringForKey:@"SCHEDULE_TIME_INTERVAL_SHORT_FORMAT" value:&stru_26DF07678 table:v9];

  v11 = [NSString localizedStringWithValidatedFormat:v10, @"%@%@", 0, v7, v6 validFormatSpecifiers error];

  return v11;
}

- (id)_stringForCoalescedAMPMSymbolsWithDateInterval:(id)a3 locale:(id)a4 startTimeComponents:(id)a5 endTimeComponents:(id)a6
{
  id v10 = a4;
  id v32 = a5;
  id v34 = a6;
  id v11 = a3;
  id v12 = [(SCLScheduleIntervalFormatter *)self newDateFormatterWithLocale:v10];
  [v12 setTimeStyle:1];
  [v12 setDateStyle:0];
  [v12 setFormattingContext:1];
  id v13 = [(SCLScheduleIntervalFormatter *)self newDateFormatterWithLocale:v10];
  [v13 setFormattingContext:1];
  [v13 setLocalizedDateFormatFromTemplate:@"j"];
  v14 = [v11 startDate];
  v15 = [v11 endDate];

  id v16 = [(SCLScheduleIntervalFormatter *)self newDateFormatterWithLocale:v10];
  [v16 setLocalizedDateFormatFromTemplate:@"a"];
  v36 = [v16 stringFromDate:v14];
  v35 = [v16 stringFromDate:v15];
  v17 = (void *)MEMORY[0x263F08790];
  if (v10)
  {
    v18 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"j" options:0 locale:v10];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263EFF960] currentLocale];
    v18 = [v17 dateFormatFromTemplate:@"j" options:0 locale:v19];
  }
  if (objc_msgSend(v18, "containsString:", @"H", v32))
  {

LABEL_7:
    BOOL v21 = 0;
    char v22 = 1;
    goto LABEL_8;
  }
  char v20 = [v18 containsString:@"k"];

  if (v20) {
    goto LABEL_7;
  }
  if ([v33 minute])
  {
    char v22 = 0;
    BOOL v21 = 0;
  }
  else
  {
    BOOL v21 = [(SCLScheduleIntervalFormatter *)self prefersHoursOnly];
    char v22 = 0;
  }
LABEL_8:
  if ([v36 isEqualToString:v35]
    && [(SCLScheduleIntervalFormatter *)self coalescesAMPMSymbols])
  {
    id v23 = [(SCLScheduleIntervalFormatter *)self newDateFormatterWithLocale:v10];
    [v23 setFormattingContext:1];
    if (v21) {
      v24 = @"J";
    }
    else {
      v24 = @"Jmm";
    }
    [v23 setLocalizedDateFormatFromTemplate:v24];
    v25 = [v23 stringFromDate:v14];
  }
  else
  {
    if (v21) {
      v26 = v13;
    }
    else {
      v26 = v12;
    }
    v25 = [v26 stringFromDate:v14];
  }
  v27 = v12;
  if ((v22 & 1) == 0)
  {
    uint64_t v28 = [v34 minute];
    v27 = v12;
    if (!v28)
    {
      if ([(SCLScheduleIntervalFormatter *)self prefersHoursOnly]) {
        v27 = v13;
      }
      else {
        v27 = v12;
      }
    }
  }
  v29 = [v27 stringFromDate:v15];
  v30 = [(SCLScheduleIntervalFormatter *)self _shortIntervalStringWithStart:v25 end:v29];

  return v30;
}

- (unint64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(unint64_t)a3
{
  self->_formattingStyle = a3;
}

- (BOOL)coalescesAMPMSymbols
{
  return self->_coalescesAMPMSymbols;
}

- (void)setCoalescesAMPMSymbols:(BOOL)a3
{
  self->_coalescesAMPMSymbols = a3;
}

- (BOOL)prefersHoursOnly
{
  return self->_prefersHoursOnly;
}

- (void)setPrefersHoursOnly:(BOOL)a3
{
  self->_prefersHoursOnly = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSDateFormatter)shortFormatter
{
  return self->_shortFormatter;
}

- (void)setShortFormatter:(id)a3
{
}

- (NSDateIntervalFormatter)briefFormatter
{
  return self->_briefFormatter;
}

- (void)setBriefFormatter:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
}

- (NSCalendar)referenceCalendar
{
  return self->_referenceCalendar;
}

- (void)setReferenceCalendar:(id)a3
{
}

- (NSTimeZone)referenceTimeZone
{
  return self->_referenceTimeZone;
}

- (void)setReferenceTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimeZone, 0);
  objc_storeStrong((id *)&self->_referenceCalendar, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_briefFormatter, 0);
  objc_storeStrong((id *)&self->_shortFormatter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end