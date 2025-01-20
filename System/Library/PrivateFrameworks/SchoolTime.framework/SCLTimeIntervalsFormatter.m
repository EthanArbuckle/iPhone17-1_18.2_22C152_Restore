@interface SCLTimeIntervalsFormatter
- (BOOL)prefersHoursOnly;
- (NSListFormatter)listFormatter;
- (NSLocale)locale;
- (SCLScheduleIntervalFormatter)intervalFormatter;
- (SCLTimeIntervalsFormatter)init;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromTimeIntervals:(id)a3;
- (unint64_t)intervalFormattingStyle;
- (void)setIntervalFormattingStyle:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setPrefersHoursOnly:(BOOL)a3;
@end

@implementation SCLTimeIntervalsFormatter

- (SCLTimeIntervalsFormatter)init
{
  v9.receiver = self;
  v9.super_class = (Class)SCLTimeIntervalsFormatter;
  v2 = [(SCLTimeIntervalsFormatter *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(SCLScheduleIntervalFormatter);
    intervalFormatter = v2->_intervalFormatter;
    v2->_intervalFormatter = v3;

    [(SCLScheduleIntervalFormatter *)v2->_intervalFormatter setFormattingStyle:1];
    v5 = (NSListFormatter *)objc_alloc_init(MEMORY[0x263F08950]);
    listFormatter = v2->_listFormatter;
    v2->_listFormatter = v5;

    [(NSListFormatter *)v2->_listFormatter setItemFormatter:v2->_intervalFormatter];
    v7 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(SCLTimeIntervalsFormatter *)v2 setLocale:v7];
  }
  return v2;
}

- (NSLocale)locale
{
  return [(SCLScheduleIntervalFormatter *)self->_intervalFormatter locale];
}

- (void)setLocale:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  }
  id v5 = v4;
  [(SCLScheduleIntervalFormatter *)self->_intervalFormatter setLocale:v4];
  [(NSListFormatter *)self->_listFormatter setLocale:v5];
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SCLTimeIntervalsFormatter *)self stringFromTimeIntervals:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)stringFromTimeIntervals:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [v4 count];
    v6 = [(SCLTimeIntervalsFormatter *)self intervalFormatter];
    v7 = v6;
    if (v5 == 1)
    {
      objc_msgSend(v6, "setPrefersHoursOnly:", -[SCLTimeIntervalsFormatter prefersHoursOnly](self, "prefersHoursOnly"));

      v8 = [(SCLTimeIntervalsFormatter *)self intervalFormatter];
      [v8 setCoalescesAMPMSymbols:0];

      objc_super v9 = [v4 firstObject];
      v10 = [(SCLTimeIntervalsFormatter *)self intervalFormatter];
      v11 = [v9 startTime];
      v12 = [v9 endTime];
      v13 = [v10 stringFromTime:v11 toTime:v12];

      goto LABEL_7;
    }
    [v6 setPrefersHoursOnly:1];

    v15 = [(SCLTimeIntervalsFormatter *)self intervalFormatter];
    [v15 setCoalescesAMPMSymbols:0];

    objc_super v9 = [(SCLTimeIntervalsFormatter *)self listFormatter];
    uint64_t v14 = [v9 stringFromItems:v4];
  }
  else
  {
    objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v9 localizedStringForKey:@"ScheduleOff" value:&stru_26DF07678 table:@"SchoolTimeFormatters"];
  }
  v13 = (void *)v14;
LABEL_7:

  return v13;
}

- (unint64_t)intervalFormattingStyle
{
  return [(SCLScheduleIntervalFormatter *)self->_intervalFormatter formattingStyle];
}

- (void)setIntervalFormattingStyle:(unint64_t)a3
{
}

- (BOOL)prefersHoursOnly
{
  return self->_prefersHoursOnly;
}

- (void)setPrefersHoursOnly:(BOOL)a3
{
  self->_prefersHoursOnly = a3;
}

- (SCLScheduleIntervalFormatter)intervalFormatter
{
  return self->_intervalFormatter;
}

- (NSListFormatter)listFormatter
{
  return self->_listFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listFormatter, 0);
  objc_storeStrong((id *)&self->_intervalFormatter, 0);
}

@end