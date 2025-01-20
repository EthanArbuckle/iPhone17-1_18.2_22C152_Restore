@interface _UIDatePickerMode_DateAndTime
+ (int64_t)datePickerMode;
+ (unint64_t)extractableCalendarUnits;
- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5;
- (BOOL)_shouldEnableWeekMonthDayForRow:(int64_t)a3;
- (BOOL)isWeekdayLast;
- (double)componentWidthForDateTimeCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5;
- (double)weekdayWidth;
- (id)_dateForWeekMonthDayRow:(int64_t)a3;
- (id)baseDateComponents;
- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4;
- (id)dateFormatForCalendarUnit:(unint64_t)a3;
- (id)localizedFormatString;
- (id)relativeFormatter;
- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4;
- (id)viewForRow:(int64_t)a3 inComponent:(int64_t)a4 reusingView:(id)a5;
- (id)weekdayFormatter;
- (int64_t)displayedCalendarUnits;
- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3;
- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6;
- (unint64_t)elements;
- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3;
- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3;
- (void)_resetBaseDateComponentsIfNecessaryFromDate:(id)a3;
- (void)_shouldReset:(id)a3;
- (void)_takeBaseDateComponentsFromDate:(id)a3;
- (void)loadDate:(id)a3 animated:(BOOL)a4;
- (void)noteCalendarChanged;
- (void)resetComponentWidths;
- (void)updateEnabledStateOfViewForRow:(int64_t)a3 inComponent:(int64_t)a4;
@end

@implementation _UIDatePickerMode_DateAndTime

+ (int64_t)datePickerMode
{
  return 2;
}

+ (unint64_t)extractableCalendarUnits
{
  return 66168;
}

- (void)_shouldReset:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode_DateAndTime;
  [(_UIDatePickerMode *)&v10 _shouldReset:a3];
  relativeFormatter = self->_relativeFormatter;
  self->_relativeFormatter = 0;

  weekdayFormatter = self->_weekdayFormatter;
  self->_weekdayFormatter = 0;

  weekdayFormat = self->_weekdayFormat;
  self->_weekdayFormat = 0;

  monthDayFormat = self->_monthDayFormat;
  self->_monthDayFormat = 0;

  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;
}

- (void)resetComponentWidths
{
  self->_wmdWeekMonthDayWidth = 0.0;
  self->_wmdHourWidth = 0.0;
  self->_wmdMinuteWidth = 0.0;
  self->_wmdAMPMWidth = 0.0;
}

- (void)noteCalendarChanged
{
  weekdayFormat = self->_weekdayFormat;
  self->_weekdayFormat = 0;

  monthDayFormat = self->_monthDayFormat;
  self->_monthDayFormat = 0;

  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;

  weekdayFormatter = self->_weekdayFormatter;
  self->_weekdayFormatter = 0;

  relativeFormatter = self->_relativeFormatter;
  self->_relativeFormatter = 0;

  v9.receiver = self;
  v9.super_class = (Class)_UIDatePickerMode_DateAndTime;
  [(_UIDatePickerMode *)&v9 noteCalendarChanged];
}

- (id)relativeFormatter
{
  relativeFormatter = self->_relativeFormatter;
  if (!relativeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_relativeFormatter;
    self->_relativeFormatter = v4;

    v6 = self->_relativeFormatter;
    v7 = [(_UIDatePickerMode *)self calendarForFormatters];
    [(NSDateFormatter *)v6 setCalendar:v7];

    v8 = self->_relativeFormatter;
    objc_super v9 = [(_UIDatePickerMode *)self locale];
    [(NSDateFormatter *)v8 setLocale:v9];

    objc_super v10 = self->_relativeFormatter;
    v11 = [(_UIDatePickerMode *)self timeZone];
    [(NSDateFormatter *)v10 setTimeZone:v11];

    [(NSDateFormatter *)self->_relativeFormatter setFormattingContext:2];
    [(NSDateFormatter *)self->_relativeFormatter setDoesRelativeDateFormatting:1];
    [(NSDateFormatter *)self->_relativeFormatter setTimeStyle:0];
    [(NSDateFormatter *)self->_relativeFormatter setDateStyle:2];
    relativeFormatter = self->_relativeFormatter;
  }
  return relativeFormatter;
}

- (id)weekdayFormatter
{
  weekdayFormatter = self->_weekdayFormatter;
  if (!weekdayFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_weekdayFormatter;
    self->_weekdayFormatter = v4;

    v6 = self->_weekdayFormatter;
    v7 = [(_UIDatePickerMode *)self calendarForFormatters];
    [(NSDateFormatter *)v6 setCalendar:v7];

    v8 = self->_weekdayFormatter;
    objc_super v9 = [(_UIDatePickerMode *)self locale];
    [(NSDateFormatter *)v8 setLocale:v9];

    objc_super v10 = self->_weekdayFormatter;
    v11 = [(_UIDatePickerMode *)self timeZone];
    [(NSDateFormatter *)v10 setTimeZone:v11];

    [(NSDateFormatter *)self->_weekdayFormatter setFormattingContext:2];
    [(NSDateFormatter *)self->_weekdayFormatter setTimeStyle:0];
    [(NSDateFormatter *)self->_weekdayFormatter setDateStyle:0];
    v12 = self->_weekdayFormatter;
    v13 = [(_UIDatePickerMode_DateAndTime *)self dateFormatForCalendarUnit:512];
    [(NSDateFormatter *)v12 setDateFormat:v13];

    weekdayFormatter = self->_weekdayFormatter;
  }
  return weekdayFormatter;
}

- (id)localizedFormatString
{
  localizedFormatString = self->super._localizedFormatString;
  if (!localizedFormatString)
  {
    v4 = [(_UIDatePickerMode *)self locale];
    v5 = _UIDatePickerDateFormatFromTemplate(@"EEE, d MMM y j:m", v4, [(_UIDatePickerMode *)self followsSystemHourCycle]);

    [(_UIDatePickerMode *)self setLocalizedFormatString:v5];
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  p_weekdayFormat = (id *)&self->_weekdayFormat;
  if (!self->_weekdayFormat)
  {
    unint64_t v35 = a3;
    v5 = [(_UIDatePickerMode_DateAndTime *)self localizedFormatString];
    v6 = [(_UIDatePickerMode *)self locale];
    v7 = +[_UIDatePickerComponent componentsFromDateFormatString:v5 locale:v6 followsSystemHourCycle:[(_UIDatePickerMode *)self followsSystemHourCycle] desiredUnits:96];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v13 calendarUnit] != 32 || (p_minuteFormat = &self->_hourFormat, self->_hourFormat))
          {
            if ([v13 calendarUnit] != 64) {
              continue;
            }
            p_minuteFormat = &self->_minuteFormat;
            if (self->_minuteFormat) {
              continue;
            }
          }
          uint64_t v15 = [v13 formatString];
          v16 = *p_minuteFormat;
          *p_minuteFormat = (NSString *)v15;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v10);
    }

    v17 = [(_UIDatePickerMode *)self locale];
    v18 = _UIDatePickerDateFormatFromTemplate(@"EEE, d MMM", v17, [(_UIDatePickerMode *)self followsSystemHourCycle]);

    v19 = [(_UIDatePickerMode *)self locale];
    v20 = +[_UIDatePickerComponent componentsFromDateFormatString:v18 locale:v19 followsSystemHourCycle:[(_UIDatePickerMode *)self followsSystemHourCycle] desiredUnits:512];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          if ([v26 calendarUnit] == 512)
          {
            uint64_t v27 = [v26 formatString];
            id v28 = *p_weekdayFormat;
            id *p_weekdayFormat = (id)v27;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v23);
    }

    v29 = [(_UIDatePickerMode *)self locale];
    _UIDatePickerDateFormatFromTemplate(@"d MMM", v29, [(_UIDatePickerMode *)self followsSystemHourCycle]);
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    monthDayFormat = self->_monthDayFormat;
    self->_monthDayFormat = v30;

    a3 = v35;
  }
  id v32 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if (a3 == 32)
    {
      v33 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__hourFormat;
    }
    else
    {
      if (a3 != 64) {
        goto LABEL_34;
      }
      v33 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__minuteFormat;
    }
LABEL_32:
    p_weekdayFormat = (id *)((char *)&self->super.super.isa + *v33);
    goto LABEL_33;
  }
  if (a3 != 512)
  {
    if (a3 != 536) {
      goto LABEL_34;
    }
    v33 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__monthDayFormat;
    goto LABEL_32;
  }
LABEL_33:
  id v32 = *p_weekdayFormat;
LABEL_34:
  return v32;
}

- (int64_t)displayedCalendarUnits
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerMode_DateAndTime;
  return [(_UIDatePickerMode *)&v3 displayedCalendarUnits] & 0xFFFFFFFFFFFFFDE1 | 0x1E;
}

- (unint64_t)elements
{
  result = self->super._elements;
  if (!result)
  {
    unint64_t v19 = 0;
    v5 = [(_UIDatePickerMode_DateAndTime *)self localizedFormatString];
    uint64_t v6 = [(id)objc_opt_class() extractableCalendarUnits];
    v7 = _UICopyCalendarUnitsFromFormatString(v5, v6, &v19);
    unint64_t v8 = v19;
    if (v19 <= 4)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"_UIDatePickerMode.m", 1911, @"unexpected number of calendar units: %ld for format: %@ (expecting at least 5 elements)", v19, v5 object file lineNumber description];

      unint64_t v8 = v19;
    }
    unint64_t v9 = v8 - 2;
    uint64_t v10 = malloc_type_calloc(v8 - 2, 8uLL, 0x100004000313F17uLL);
    if (v19)
    {
      unint64_t v11 = 0;
      char v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = v7[v11];
        if ((v15 & v14) == 0)
        {
          if ((v15 & 0x218) != 0) {
            uint64_t v16 = 536;
          }
          else {
            uint64_t v16 = v7[v11];
          }
          v10[v13++] = v16;
          v14 |= v16;
        }
        if (v15 == 512 || v15 == 16)
        {
          if ((v12 & 1) == 0) {
            self->_weekdayLast = v15 == 16;
          }
          char v12 = 1;
        }
        ++v11;
      }
      while (v11 < v19);
    }
    [(_UIDatePickerMode *)self setElements:v10];
    [(_UIDatePickerMode *)self setNumberOfComponents:v9];
    [(_UIDatePickerMode *)self fixUpElementsForRTL];
    free(v7);

    return self->super._elements;
  }
  return result;
}

- (void)loadDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(_UIDatePickerMode_DateAndTime *)self _resetBaseDateComponentsIfNecessaryFromDate:v6];
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerMode_DateAndTime;
  [(_UIDatePickerMode *)&v7 loadDate:v6 animated:v4];
}

- (void)_resetBaseDateComponentsIfNecessaryFromDate:(id)a3
{
  id v13 = a3;
  uint64_t v4 = (uint64_t)(double)([(_UIDatePickerMode_DateAndTime *)self numberOfRowsForCalendarUnit:536]/ 4);
  v5 = [(_UIDatePickerMode *)self baseDate];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:v4];
  objc_super v7 = [(_UIDatePickerMode *)self calendar];
  unint64_t v8 = [v7 dateByAddingComponents:v6 toDate:v5 options:0];

  [v6 setDay:3 * v4];
  unint64_t v9 = [(_UIDatePickerMode *)self calendar];
  uint64_t v10 = [v9 dateByAddingComponents:v6 toDate:v5 options:0];

  id v11 = [v8 earlierDate:v13];
  if (v11 == v13)
  {
  }
  else
  {
    id v12 = [v10 laterDate:v13];

    if (v12 != v13) {
      goto LABEL_6;
    }
  }
  [(_UIDatePickerMode_DateAndTime *)self _takeBaseDateComponentsFromDate:v13];
LABEL_6:
}

- (void)_takeBaseDateComponentsFromDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIDatePickerMode_DateAndTime *)self numberOfRowsForCalendarUnit:536];
  if (v5 >= 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v5 + 1;
  }
  uint64_t v7 = (uint64_t)(double)(v6 >> 1);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v13 setDay:-v7];
  unint64_t v8 = [(_UIDatePickerMode *)self calendar];
  unint64_t v9 = [v8 dateByAddingComponents:v13 toDate:v4 options:0];

  int64_t v10 = [(_UIDatePickerMode_DateAndTime *)self displayedCalendarUnits];
  id v11 = [(_UIDatePickerMode *)self calendar];
  id v12 = [v11 components:v10 fromDate:v9];

  [v12 setHour:12];
  [v12 setMinute:0];
  [v12 setSecond:0];
  [(_UIDatePickerMode *)self setBaseDateComponents:v12];
}

- (id)baseDateComponents
{
  baseDateComponents = self->super._baseDateComponents;
  if (!baseDateComponents)
  {
    id v4 = [(_UIDatePickerMode *)self datePickerView];
    uint64_t v5 = [v4 data];
    uint64_t v6 = [v5 effectiveDate];
    [(_UIDatePickerMode_DateAndTime *)self _takeBaseDateComponentsFromDate:v6];

    baseDateComponents = self->super._baseDateComponents;
  }
  return baseDateComponents;
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  if (a3 == 0x10000) {
    return 2;
  }
  else {
    return 10000;
  }
}

- (double)componentWidthForDateTimeCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  p_wmdWeekMonthDayWidth = &self->_wmdWeekMonthDayWidth;
  if (self->_wmdWeekMonthDayWidth == 0.0)
  {
    v77 = &self->_wmdWeekMonthDayWidth;
    int64_t v10 = [(_UIDatePickerMode *)self amString];
    id v11 = [(_UIDatePickerMode *)self pmString];
    uint64_t v12 = [(_UIDatePickerMode *)self amPmFont];
    [(_UIDatePickerMode *)self componentWidthForTwoDigitCalendarUnit:32 font:v8 maxWidth:a5];
    double v14 = ceil(v13);
    uint64_t v15 = [(_UIDatePickerMode *)self _style];
    [v15 horizontalWeekdayTimePadding];
    self->_wmdHourWidth = v14 + v16 + v16;

    [(_UIDatePickerMode *)self componentWidthForTwoDigitCalendarUnit:64 font:v8 maxWidth:a5];
    double v18 = ceil(v17);
    unint64_t v19 = [(_UIDatePickerMode *)self _style];
    [v19 horizontalWeekdayTimePadding];
    self->_wmdMinuteWidth = v18 + v20 + v20;

    self->_double wmdAMPMWidth = 0.0;
    uint64_t v21 = *(void *)off_1E52D2040;
    if (v10)
    {
      uint64_t v87 = *(void *)off_1E52D2040;
      v88[0] = v12;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];
      [v10 sizeWithAttributes:v22];
      double v24 = v23;

      uint64_t v85 = v21;
      uint64_t v86 = v12;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      [v11 sizeWithAttributes:v25];
      double v27 = v26;

      if (v24 >= v27) {
        double v28 = v24;
      }
      else {
        double v28 = v27;
      }
      double v29 = ceil(v28);
      v30 = [(_UIDatePickerMode *)self _style];
      [v30 horizontalPaddingForAMPM];
      self->_double wmdAMPMWidth = v29 + v31 + v31;
    }
    v75 = (void *)v12;
    v76 = v10;
    self->_double wmdWeekdayWidth = 0.0;
    id v32 = [(_UIDatePickerMode_DateAndTime *)self weekdayFormatter];
    for (uint64_t i = 1; i != 8; ++i)
    {
      v34 = (void *)[(id)objc_opt_class() newDateFromGregorianYear:2007 month:1 day:i timeZone:0];
      unint64_t v35 = [v32 stringFromDate:v34];
      uint64_t v83 = v21;
      id v84 = v8;
      long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      [v35 sizeWithAttributes:v36];
      double v38 = v37;

      double wmdWeekdayWidth = self->_wmdWeekdayWidth;
      if (v38 >= wmdWeekdayWidth) {
        double wmdWeekdayWidth = v38;
      }
      self->_double wmdWeekdayWidth = ceil(wmdWeekdayWidth);
    }
    long long v40 = [(_UIDatePickerMode *)self dateFormatterForCalendarUnit:536];

    double v41 = 0.0;
    for (uint64_t j = 1; j != 13; ++j)
    {
      long long v43 = (void *)[(id)objc_opt_class() newDateFromGregorianYear:2007 month:j day:28 timeZone:0];
      v44 = [v40 stringFromDate:v43];
      uint64_t v81 = v21;
      id v82 = v8;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      [v44 sizeWithAttributes:v45];
      double v47 = v46;

      if (v47 >= v41) {
        double v41 = v47;
      }
    }
    double v48 = v41 + self->_wmdWeekdayWidth;
    v49 = [(_UIDatePickerMode *)self _style];
    [v49 horizontalWeekMonthDayPadding];
    double *v77 = v48 + v50;

    double *v77 = ceil(*v77);
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._datePickerView);
    v52 = [WeakRetained traitCollection];
    v78 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v52 userInterfaceIdiom]);

    v53 = _UINSLocalizedStringWithDefaultValue(@"Today", @"Today");
    uint64_t v79 = v21;
    id v80 = v8;
    p_wmdWeekMonthDayWidth = &self->_wmdWeekMonthDayWidth;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    [v53 sizeWithAttributes:v54];
    double v56 = v55;
    v57 = [(_UIDatePickerMode *)self _style];
    [v57 horizontalWeekMonthDayPadding];
    double v59 = v56 + v58;
    [v78 pickerHorizontalEdgeInset];
    double v61 = v59 + v60;

    double v62 = *v77;
    if (*v77 < v61) {
      double v62 = v61;
    }
    double *v77 = v62;
    double wmdAMPMWidth = self->_wmdAMPMWidth;
    double v64 = v62 + self->_wmdHourWidth + self->_wmdMinuteWidth + wmdAMPMWidth;
    if (v64 > a5)
    {
      double v65 = v64 - a5;
      if (self->_weekdayLast)
      {
        double v66 = fmin(v65, 10.0);
        self->_double wmdWeekdayWidth = self->_wmdWeekdayWidth - v66;
        double v65 = v65 - v66;
        double wmdAMPMWidth = self->_wmdAMPMWidth;
        double v62 = *v77;
      }
      BOOL v67 = wmdAMPMWidth <= 0.0;
      double v68 = 3.0;
      if (!v67) {
        double v68 = 4.0;
      }
      double v69 = round(fmin(v65 / v68, 16.0));
      double *v77 = v62 - v69;
      double v70 = round((v65 - v69) / (v68 + -1.0));
      self->_wmdHourWidth = self->_wmdHourWidth - v70;
      self->_wmdMinuteWidth = self->_wmdMinuteWidth - v70;
      double v71 = self->_wmdAMPMWidth;
      if (v71 > 0.0) {
        self->_double wmdAMPMWidth = v71 - v70;
      }
    }
  }
  double v72 = 0.0;
  if ((uint64_t)a3 > 535)
  {
    if (a3 == 536)
    {
LABEL_34:
      double v72 = *p_wmdWeekMonthDayWidth;
      goto LABEL_35;
    }
    if (a3 == 0x10000)
    {
      v73 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__wmdAMPMWidth;
      goto LABEL_33;
    }
  }
  else
  {
    if (a3 == 32)
    {
      v73 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__wmdHourWidth;
      goto LABEL_33;
    }
    if (a3 == 64)
    {
      v73 = &OBJC_IVAR____UIDatePickerMode_DateAndTime__wmdMinuteWidth;
LABEL_33:
      p_wmdWeekMonthDayWidth = (double *)((char *)self + *v73);
      goto LABEL_34;
    }
  }
LABEL_35:

  return v72;
}

- (double)weekdayWidth
{
  return self->_wmdWeekdayWidth;
}

- (BOOL)isWeekdayLast
{
  return self->_weekdayLast;
}

- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  if ([(_UIDatePickerMode *)self calendarUnitForComponent:a4] == 536)
  {
    uint64_t v7 = &stru_1ED0E84C0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIDatePickerMode_DateAndTime;
    uint64_t v7 = [(_UIDatePickerMode *)&v9 titleForRow:a3 inComponent:a4];
  }
  return v7;
}

- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  if (a4 == 536)
  {
    id v4 = [(_UIDatePickerMode_DateAndTime *)self _dateForWeekMonthDayRow:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIDatePickerMode_DateAndTime;
    id v4 = -[_UIDatePickerMode dateForRow:inCalendarUnit:](&v6, sel_dateForRow_inCalendarUnit_, a3);
  }
  return v4;
}

- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([(_UIDatePickerMode *)self calendarUnitForComponent:a5] == 536)
  {
    uint64_t v12 = [(_UIDatePickerMode *)self calendar];
    double v13 = [v12 components:30 fromDate:v10];

    [v13 setHour:12];
    [v13 setMinute:0];
    [v13 setSecond:0];
    double v14 = [(_UIDatePickerMode *)self calendar];
    uint64_t v15 = [v14 dateFromComponents:v13];

    double v16 = [(_UIDatePickerMode *)self calendar];
    double v17 = [(_UIDatePickerMode *)self baseDate];
    double v18 = [v16 components:16 fromDate:v15 toDate:v17 options:0];

    int64_t v19 = [v18 day];
    double v20 = [(_UIDatePickerMode *)self baseDate];
    uint64_t v21 = [v15 compare:v20];

    if (v21 == -1 && v19 > 0 || v21 == 1 && v19 < 0) {
      int64_t v19 = -v19;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIDatePickerMode_DateAndTime;
    int64_t v19 = [(_UIDatePickerMode *)&v23 rowForDate:v10 dateComponents:v11 component:a5 currentRow:a6];
  }

  return v19;
}

- (id)_dateForWeekMonthDayRow:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:a3];
  objc_super v6 = [(_UIDatePickerMode *)self calendar];
  uint64_t v7 = [(_UIDatePickerMode *)self baseDate];
  id v8 = [v6 dateByAddingComponents:v5 toDate:v7 options:0];

  return v8;
}

- (BOOL)_shouldEnableWeekMonthDayForRow:(int64_t)a3
{
  id v4 = [(_UIDatePickerMode_DateAndTime *)self _dateForWeekMonthDayRow:a3];
  id v5 = [(_UIDatePickerMode *)self calendar];
  objc_super v6 = [v5 components:30 fromDate:v4];

  uint64_t v7 = [(_UIDatePickerMode *)self minimumDateComponents];
  uint64_t v8 = [(_UIDatePickerMode *)self maximumDateComponents];
  objc_super v9 = (void *)v8;
  if (v7)
  {
    BOOL v10 = (unint64_t)(_UIDatePickerCompareDateComponents(v7, v6, 30) + 1) < 2;
    if (!v9) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL v10 = 1;
    if (!v8) {
      goto LABEL_5;
    }
  }
  if ((unint64_t)_UIDatePickerCompareDateComponents(v9, v6, 30) >= 2) {
    BOOL v10 = 0;
  }
LABEL_5:

  return v10;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  if (a5 != 536)
  {
    BOOL v10 = [(_UIDatePickerMode *)self selectedDateComponents];
    id v11 = v10;
    if (a5 != 0x10000)
    {
      if (a5 == 64)
      {
        objc_msgSend(v10, "setMinute:", -[_UIDatePickerMode minuteForRow:](self, "minuteForRow:", a3));
        unint64_t v17 = 64;
      }
      else
      {
        if (a5 == 32)
        {
          objc_msgSend(v10, "setHour:", -[_UIDatePickerMode hourForRow:](self, "hourForRow:", a3));
          [v11 setMinute:0];
          int64_t v12 = [(_UIDatePickerMode *)self componentForCalendarUnit:0x10000];
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_12:
            unint64_t v17 = 32;
            goto LABEL_15;
          }
          int64_t v13 = v12;
          double v14 = [(_UIDatePickerMode *)self datePickerView];
          uint64_t v15 = [v14 selectedRowInComponent:v13];

          BOOL v10 = v11;
          int64_t v16 = v15;
LABEL_11:
          _UIDateComponentsSetValue(v10, 0x10000, v16);
          goto LABEL_12;
        }
        double v18 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDatePickerMode.m", 2197, @"Unknown calendar unit: %lu", a5);

        unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v17 = a5;
        if (a5 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_17:
          BOOL v20 = [(_UIDatePickerMode *)self areValidDateComponents:v11 comparingUnits:v19];

          return v20;
        }
      }
LABEL_15:
      unint64_t v19 = a5;
      do
      {
        v19 |= v17;
        unint64_t v17 = -[_UIDatePickerMode_DateAndTime nextUnitLargerThanUnit:](self, "nextUnitLargerThanUnit:");
      }
      while (v17 != 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_17;
    }
    int64_t v16 = a3;
    goto LABEL_11;
  }
  return -[_UIDatePickerMode_DateAndTime _shouldEnableWeekMonthDayForRow:](self, "_shouldEnableWeekMonthDayForRow:", a3, a4);
}

- (id)viewForRow:(int64_t)a3 inComponent:(int64_t)a4 reusingView:(id)a5
{
  id v8 = a5;
  if ([(_UIDatePickerMode *)self calendarUnitForComponent:a4] != 536)
  {
    v56.receiver = self;
    v56.super_class = (Class)_UIDatePickerMode_DateAndTime;
    objc_super v9 = [(_UIDatePickerMode *)&v56 viewForRow:a3 inComponent:a4 reusingView:v8];

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = (UIDatePickerWeekMonthDayView *)v8;
  }
  else
  {
    BOOL v10 = [UIDatePickerWeekMonthDayView alloc];
    objc_super v9 = -[UIDatePickerWeekMonthDayView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v11 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
    int64_t v12 = [(_UIDatePickerMode *)self datePickerView];
    int64_t v13 = [v12 _textColor];
    [v11 setTextColor:v13];

    double v14 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
    uint64_t v15 = [(_UIDatePickerMode *)self datePickerView];
    int64_t v16 = [v15 _textShadowColor];
    [v14 setShadowColor:v16];

    unint64_t v17 = [(UIDatePickerWeekMonthDayView *)v9 weekdayLabel];
    double v18 = [(_UIDatePickerMode *)self datePickerView];
    unint64_t v19 = [v18 _textColor];
    [v17 setTextColor:v19];

    BOOL v20 = [(UIDatePickerWeekMonthDayView *)v9 weekdayLabel];
    uint64_t v21 = [(_UIDatePickerMode *)self datePickerView];
    uint64_t v22 = [v21 _textShadowColor];
    [v20 setShadowColor:v22];
  }
  objc_super v23 = [(_UIDatePickerMode_DateAndTime *)self _dateForWeekMonthDayRow:a3];
  double v24 = [(_UIDatePickerMode *)self dateFormatterForCalendarUnit:536];
  v25 = [(_UIDatePickerMode *)self calendar];
  double v26 = [v25 components:766 fromDate:v23];

  [v26 setHour:12];
  [v26 setMinute:0];
  [v26 setSecond:0];
  double v27 = [(_UIDatePickerMode *)self calendar];
  double v28 = [v27 dateFromComponents:v26];

  uint64_t v29 = [v24 stringFromDate:v28];
  v30 = [(_UIDatePickerMode *)self datePickerView];
  v54 = (void *)v29;
  int64_t v55 = a3;
  if (![v30 highlightsToday])
  {

LABEL_13:
    long long v39 = [(_UIDatePickerMode_DateAndTime *)self weekdayFormatter];
    long long v40 = [(UIDatePickerWeekMonthDayView *)v9 weekdayLabel];
    double v41 = [v39 stringFromDate:v28];
    [v40 setText:v41];

    long long v42 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
    long long v43 = [(_UIDatePickerMode *)self datePickerView];
    v44 = [v43 _textColor];
    [v42 setTextColor:v44];

    v45 = [(UIDatePickerWeekMonthDayView *)v9 weekdayLabel];
    double v46 = [(_UIDatePickerMode *)self datePickerView];
    double v47 = [v46 _textColor];
    [v45 setTextColor:v47];

    goto LABEL_14;
  }
  [v28 timeIntervalSinceReferenceDate];
  double v32 = v31;
  [(_UIDatePickerMode *)self todaySinceReferenceDate];
  double v34 = v32 - v33;
  if (v34 >= 0.0) {
    double v35 = v34;
  }
  else {
    double v35 = -v34;
  }

  if (v35 > 0.1) {
    goto LABEL_13;
  }
  uint64_t v36 = [(_UIDatePickerMode_DateAndTime *)self relativeFormatter];

  double v37 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
  double v38 = [(_UIDatePickerMode *)self todayTextColor];
  [v37 setTextColor:v38];

  long long v39 = [(UIDatePickerWeekMonthDayView *)v9 weekdayLabel];
  [v39 setText:0];
  double v24 = (void *)v36;
LABEL_14:

  double v48 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
  v49 = [v24 stringFromDate:v28];
  [v48 setText:v49];

  double v50 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
  v51 = [(_UIDatePickerMode *)self fontForCalendarUnit:536];
  [v50 setFont:v51];

  [(UIDatePickerWeekMonthDayView *)v9 setWeekdayLast:[(_UIDatePickerMode_DateAndTime *)self isWeekdayLast]];
  [(_UIDatePickerMode_DateAndTime *)self weekdayWidth];
  -[UIDatePickerWeekMonthDayView setWeekdayWidth:](v9, "setWeekdayWidth:");
  [(UIDatePickerWeekMonthDayView *)v9 setFormattedDateString:v54];
  v52 = [(UIDatePickerWeekMonthDayView *)v9 dateLabel];
  objc_msgSend(v52, "setEnabled:", -[_UIDatePickerMode_DateAndTime _shouldEnableWeekMonthDayForRow:](self, "_shouldEnableWeekMonthDayForRow:", v55));

LABEL_15:
  return v9;
}

- (void)updateEnabledStateOfViewForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  if ([(_UIDatePickerMode *)self calendarUnitForComponent:a4] == 536)
  {
    uint64_t v7 = [(_UIDatePickerMode *)self datePickerView];
    id v9 = [v7 viewForRow:a3 forComponent:a4];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v9 dateLabel];
        objc_msgSend(v8, "setEnabled:", -[_UIDatePickerMode_DateAndTime _shouldEnableWeekMonthDayForRow:](self, "_shouldEnableWeekMonthDayForRow:", a3));
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIDatePickerMode_DateAndTime;
    [(_UIDatePickerMode *)&v10 updateEnabledStateOfViewForRow:a3 inComponent:a4];
  }
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  if ((uint64_t)a3 <= 15)
  {
    if (a3 == 4) {
      return 2;
    }
    if (a3 == 8) {
      return 4;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x10uLL:
        return 8;
      case 0x40uLL:
        return 32;
      case 0x20uLL:
        return 16;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if ((uint64_t)a3 <= 7)
  {
    if (a3 == 2) {
      return 4;
    }
    if (a3 == 4) {
      return 8;
    }
  }
  else
  {
    switch(a3)
    {
      case 8uLL:
        return 16;
      case 0x10uLL:
        return 32;
      case 0x20uLL:
        return 64;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);
  objc_storeStrong((id *)&self->_relativeFormatter, 0);
  objc_storeStrong((id *)&self->_minuteFormat, 0);
  objc_storeStrong((id *)&self->_hourFormat, 0);
  objc_storeStrong((id *)&self->_monthDayFormat, 0);
  objc_storeStrong((id *)&self->_weekdayFormat, 0);
}

@end