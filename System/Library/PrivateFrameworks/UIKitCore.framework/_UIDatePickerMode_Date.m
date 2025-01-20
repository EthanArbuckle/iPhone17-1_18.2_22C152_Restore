@interface _UIDatePickerMode_Date
+ (int64_t)datePickerMode;
+ (unint64_t)extractableCalendarUnits;
- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5;
- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5;
- (id)_dateForYearRow:(int64_t)a3;
- (id)dateFormatForCalendarUnit:(unint64_t)a3;
- (id)localizedFormatString;
- (int64_t)displayedCalendarUnits;
- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3;
- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6;
- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3;
- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3;
- (void)_shouldReset:(id)a3;
- (void)noteCalendarChanged;
- (void)resetComponentWidths;
@end

@implementation _UIDatePickerMode_Date

+ (int64_t)datePickerMode
{
  return 1;
}

+ (unint64_t)extractableCalendarUnits
{
  return 28;
}

- (int64_t)displayedCalendarUnits
{
  return 30;
}

- (void)_shouldReset:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerMode_Date;
  [(_UIDatePickerMode *)&v7 _shouldReset:a3];
  yearFormat = self->_yearFormat;
  self->_yearFormat = 0;

  monthFormat = self->_monthFormat;
  self->_monthFormat = 0;

  dayFormat = self->_dayFormat;
  self->_dayFormat = 0;
}

- (id)localizedFormatString
{
  localizedFormatString = self->super._localizedFormatString;
  if (!localizedFormatString)
  {
    v4 = [(_UIDatePickerMode *)self locale];
    v5 = _UIDatePickerDateFormatFromTemplate(@"dMMMMy", v4, [(_UIDatePickerMode *)self followsSystemHourCycle]);

    [(_UIDatePickerMode *)self setLocalizedFormatString:v5];
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_yearFormat = &self->_yearFormat;
  if (!self->_yearFormat)
  {
    v24 = &self->_yearFormat;
    unint64_t v25 = a3;
    v5 = [(_UIDatePickerMode_Date *)self localizedFormatString];
    v6 = [(_UIDatePickerMode *)self locale];
    objc_super v7 = +[_UIDatePickerComponent componentsFromDateFormatString:v5 locale:v6 followsSystemHourCycle:[(_UIDatePickerMode *)self followsSystemHourCycle]];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v9)
    {
      v11 = 0;
      goto LABEL_22;
    }
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v14 calendarUnit] == 4 || objc_msgSend(v14, "calendarUnit") == 2)
        {
          uint64_t v15 = [v14 formatString];
          v16 = (void *)v15;
          if (!v11)
          {
            v11 = (void *)v15;
            continue;
          }
          uint64_t v17 = [v11 stringByAppendingFormat:@" %@", v15];

          v11 = (void *)v17;
        }
        else
        {
          if ([v14 calendarUnit] == 8)
          {
            v18 = [v14 formatString];
            uint64_t v19 = 272;
          }
          else
          {
            if ([v14 calendarUnit] != 16) {
              continue;
            }
            v18 = [v14 formatString];
            uint64_t v19 = 280;
          }
          v16 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v10)
      {
LABEL_22:

        p_yearFormat = v24;
        v20 = *v24;
        *v24 = (NSString *)v11;

        a3 = v25;
        break;
      }
    }
  }
  switch(a3)
  {
    case 4uLL:
      goto LABEL_29;
    case 8uLL:
      v21 = &OBJC_IVAR____UIDatePickerMode_Date__monthFormat;
      goto LABEL_28;
    case 0x10uLL:
      v21 = &OBJC_IVAR____UIDatePickerMode_Date__dayFormat;
LABEL_28:
      p_yearFormat = (NSString **)((char *)self + *v21);
LABEL_29:
      v22 = *p_yearFormat;
      goto LABEL_31;
  }
  v22 = 0;
LABEL_31:
  return v22;
}

- (void)resetComponentWidths
{
  self->_dateYearWidth = 0.0;
  self->_dateMonthWidth = 0.0;
  self->_dateDayWidth = 0.0;
}

- (void)noteCalendarChanged
{
  yearFormat = self->_yearFormat;
  self->_yearFormat = 0;

  monthFormat = self->_monthFormat;
  self->_monthFormat = 0;

  dayFormat = self->_dayFormat;
  self->_dayFormat = 0;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerMode_Date;
  [(_UIDatePickerMode *)&v6 noteCalendarChanged];
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  return 10000;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  p_dateYearWidth = &self->_dateYearWidth;
  if (self->_dateYearWidth <= 0.0)
  {
    unint64_t v55 = a3;
    uint64_t v10 = [(_UIDatePickerMode *)self dateFormatterForCalendarUnit:4];
    v11 = (void *)[(id)objc_opt_class() newDateFromGregorianYear:2007 month:1 day:28 timeZone:0];
    uint64_t v12 = [v10 stringFromDate:v11];

    uint64_t v13 = *(void *)off_1E52D2040;
    uint64_t v60 = *(void *)off_1E52D2040;
    v61[0] = v8;
    unint64_t v14 = 0x1E4F1C000uLL;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    v53 = v12;
    [v12 sizeWithAttributes:v15];
    double v17 = ceil(v16);
    v18 = [(_UIDatePickerMode *)self _style];
    [v18 horizontalDatePadding];
    v54 = &self->_dateYearWidth;
    double *p_dateYearWidth = v17 + v19 + v19;

    v20 = [(_UIDatePickerMode *)self dateFormatterForCalendarUnit:16];

    v21 = [(_UIDatePickerMode *)self calendar];
    unint64_t v22 = [v21 maximumRangeOfUnit:16];
    uint64_t v24 = v23;

    if (v22 < v22 + v24)
    {
      do
      {
        unint64_t v25 = [(_UIDatePickerMode *)self _dateByEnsuringValue:v22 forCalendarUnit:16];
        long long v26 = [v20 stringFromDate:v25];
        uint64_t v58 = v13;
        id v59 = v8;
        long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        [v26 sizeWithAttributes:v27];
        double v29 = v28;
        v30 = [(_UIDatePickerMode *)self _style];
        [v30 horizontalDatePadding];
        double v32 = ceil(v29 + v31 + v31);

        unint64_t v14 = 0x1E4F1C000uLL;
        double dateDayWidth = self->_dateDayWidth;
        if (dateDayWidth < v32) {
          double dateDayWidth = v32;
        }
        self->_double dateDayWidth = dateDayWidth;

        ++v22;
        --v24;
      }
      while (v24);
    }
    v34 = [(_UIDatePickerMode *)self dateFormatterForCalendarUnit:8];

    v35 = [(_UIDatePickerMode *)self calendar];
    unint64_t v36 = [v35 maximumRangeOfUnit:8];
    uint64_t v38 = v37;

    if (v36 < v36 + v38)
    {
      do
      {
        v39 = [(_UIDatePickerMode *)self _dateByEnsuringValue:v36 forCalendarUnit:8];
        v40 = [v34 stringFromDate:v39];
        uint64_t v56 = v13;
        id v57 = v8;
        v41 = [*(id *)(v14 + 2536) dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        [v40 sizeWithAttributes:v41];
        double v43 = v42;
        v44 = [(_UIDatePickerMode *)self _style];
        [v44 horizontalDatePadding];
        double v46 = ceil(v43 + v45 + v45);

        unint64_t v14 = 0x1E4F1C000;
        double dateMonthWidth = self->_dateMonthWidth;
        if (dateMonthWidth < v46) {
          double dateMonthWidth = v46;
        }
        self->_double dateMonthWidth = dateMonthWidth;

        ++v36;
        --v38;
      }
      while (v38);
    }
    p_dateYearWidth = &self->_dateYearWidth;
    a3 = v55;
    double v48 = *v54 + self->_dateMonthWidth + self->_dateDayWidth;
    if (v48 > a5)
    {
      double v49 = round((v48 - a5) * 0.5);
      double *v54 = *v54 - v49;
      self->_double dateMonthWidth = self->_dateMonthWidth - v49;
    }
  }
  if (a3 == 4) {
    goto LABEL_19;
  }
  if (a3 == 8)
  {
    v51 = &OBJC_IVAR____UIDatePickerMode_Date__dateMonthWidth;
    goto LABEL_18;
  }
  double v50 = 0.0;
  if (a3 == 16)
  {
    v51 = &OBJC_IVAR____UIDatePickerMode_Date__dateDayWidth;
LABEL_18:
    p_dateYearWidth = (double *)((char *)self + *v51);
LABEL_19:
    double v50 = *p_dateYearWidth;
  }

  return v50;
}

- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([(_UIDatePickerMode *)self calendarUnitForComponent:a5] == 4)
  {
    uint64_t v12 = [(_UIDatePickerMode *)self baseDate];
    uint64_t v13 = [(_UIDatePickerMode *)self calendar];
    unint64_t v14 = [v13 components:6 fromDate:v10];

    uint64_t v15 = [(_UIDatePickerMode *)self baseDateComponents];
    double v16 = (void *)[v15 copy];

    objc_msgSend(v16, "setEra:", objc_msgSend(v14, "era"));
    objc_msgSend(v16, "setYear:", objc_msgSend(v14, "year"));
    double v17 = [(_UIDatePickerMode *)self calendar];
    v18 = [v17 dateFromComponents:v16];

    double v19 = [(_UIDatePickerMode *)self calendar];
    v20 = [v19 components:4 fromDate:v12 toDate:v18 options:0];

    id v21 = (id)[v20 year];
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIDatePickerMode_Date;
    id v21 = [(_UIDatePickerMode *)&v23 rowForDate:v10 dateComponents:v11 component:a5 currentRow:a6];
  }

  return (int64_t)v21;
}

- (id)_dateForYearRow:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)_UIDatePickerMode_Date;
  v4 = [(_UIDatePickerMode *)&v18 _dateForYearRow:a3];
  v5 = [(_UIDatePickerMode *)self calendar];
  objc_super v6 = objc_msgSend(v5, "components:fromDate:", -[_UIDatePickerMode_Date displayedCalendarUnits](self, "displayedCalendarUnits"), v4);

  int64_t v7 = [(_UIDatePickerMode *)self componentForCalendarUnit:8];
  id v8 = [(_UIDatePickerMode *)self datePickerView];
  uint64_t v9 = [v8 selectedRowInComponent:v7];

  objc_msgSend(v6, "setMonth:", -[_UIDatePickerMode valueForRow:inCalendarUnit:](self, "valueForRow:inCalendarUnit:", v9, 8));
  int64_t v10 = [(_UIDatePickerMode *)self componentForCalendarUnit:16];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = 1;
  }
  else
  {
    int64_t v12 = v10;
    uint64_t v13 = [(_UIDatePickerMode *)self datePickerView];
    uint64_t v14 = [v13 selectedRowInComponent:v12];

    int64_t v11 = [(_UIDatePickerMode *)self valueForRow:v14 inCalendarUnit:16];
  }
  [v6 setDay:v11];
  uint64_t v15 = [(_UIDatePickerMode *)self calendar];
  double v16 = [v15 dateFromComponents:v6];

  return v16;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  uint64_t v9 = [(_UIDatePickerMode *)self selectedDateComponents];
  switch(a5)
  {
    case 0x10uLL:
      int64_t v13 = [(_UIDatePickerMode *)self dayForRow:a3];
      uint64_t v14 = v9;
LABEL_7:
      [v14 setDay:v13];
      goto LABEL_10;
    case 8uLL:
      objc_msgSend(v9, "setMonth:", -[_UIDatePickerMode monthForRow:](self, "monthForRow:", a3));
      uint64_t v14 = v9;
      int64_t v13 = 1;
      goto LABEL_7;
    case 4uLL:
      int64_t v10 = [(_UIDatePickerMode_Date *)self _dateForYearRow:a3];
      int64_t v11 = [(_UIDatePickerMode *)self calendar];
      int64_t v12 = [v11 components:6 fromDate:v10];

      objc_msgSend(v9, "setEra:", objc_msgSend(v12, "era"));
      objc_msgSend(v9, "setYear:", objc_msgSend(v12, "year"));

      goto LABEL_10;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDatePickerMode.m", 1564, @"Unknown calendar unit: %lu", a5);

  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    uint64_t v16 = 0;
    do
    {
      v16 |= a5;
      a5 = [(_UIDatePickerMode_Date *)self nextUnitLargerThanUnit:a5];
    }
    while (a5 != 0x7FFFFFFFFFFFFFFFLL);
    goto LABEL_12;
  }
  uint64_t v16 = 0;
LABEL_12:
  if (self->super._isUsingJapaneseCalendar) {
    uint64_t v17 = v16 | 6;
  }
  else {
    uint64_t v17 = v16;
  }
  BOOL v18 = [(_UIDatePickerMode *)self areValidDateComponents:v9 comparingUnits:v17];

  return v18;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  unint64_t v3 = 4;
  if (a3 != 8) {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 == 16) {
    return 8;
  }
  else {
    return v3;
  }
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  unint64_t v3 = 16;
  if (a3 != 8) {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 == 4) {
    return 8;
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayFormat, 0);
  objc_storeStrong((id *)&self->_monthFormat, 0);
  objc_storeStrong((id *)&self->_yearFormat, 0);
}

@end