@interface _UIDatePickerMode_Time
+ (int64_t)datePickerMode;
+ (unint64_t)extractableCalendarUnits;
- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5;
- (double)rowHeight;
- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5;
- (id)dateFormatForCalendarUnit:(unint64_t)a3;
- (id)localizedFormatString;
- (int64_t)displayedCalendarUnits;
- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3;
- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3;
- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3;
- (void)_shouldReset:(id)a3;
- (void)noteCalendarChanged;
- (void)resetComponentWidths;
@end

@implementation _UIDatePickerMode_Time

+ (int64_t)datePickerMode
{
  return 0;
}

+ (unint64_t)extractableCalendarUnits
{
  return 65632;
}

- (int64_t)displayedCalendarUnits
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerMode_Time;
  return (unint64_t)[(_UIDatePickerMode *)&v3 displayedCalendarUnits] | 0x1E;
}

- (void)_shouldReset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerMode_Time;
  [(_UIDatePickerMode *)&v6 _shouldReset:a3];
  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;
}

- (id)localizedFormatString
{
  localizedFormatString = self->super._localizedFormatString;
  if (!localizedFormatString)
  {
    v4 = [(_UIDatePickerMode *)self locale];
    v5 = _UIDatePickerDateFormatFromTemplate(@"j:m", v4, [(_UIDatePickerMode *)self followsSystemHourCycle]);

    [(_UIDatePickerMode *)self setLocalizedFormatString:v5];
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_hourFormat = (id *)&self->_hourFormat;
  if (!self->_hourFormat)
  {
    objc_super v6 = [(_UIDatePickerMode_Time *)self localizedFormatString];
    v7 = [(_UIDatePickerMode *)self locale];
    v8 = +[_UIDatePickerComponent componentsFromDateFormatString:v6 locale:v7 followsSystemHourCycle:[(_UIDatePickerMode *)self followsSystemHourCycle]];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "calendarUnit", (void)v20) == 32)
        {
          uint64_t v15 = [v14 formatString];
          minuteFormat = (NSString *)*p_hourFormat;
          id *p_hourFormat = (id)v15;
        }
        else
        {
          if ([v14 calendarUnit] != 64) {
            continue;
          }
          v17 = [v14 formatString];
          minuteFormat = self->_minuteFormat;
          self->_minuteFormat = v17;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
  if (a3 == 32) {
    goto LABEL_18;
  }
  if (a3 == 64)
  {
    p_hourFormat = (id *)&self->_minuteFormat;
LABEL_18:
    id v18 = *p_hourFormat;
    goto LABEL_20;
  }
  id v18 = 0;
LABEL_20:
  return v18;
}

- (double)rowHeight
{
  return 32.0;
}

- (void)resetComponentWidths
{
  self->_timeHourWidth = 0.0;
  self->_timeMinuteWidth = 0.0;
  self->_timeAMPMWidth = 0.0;
}

- (void)noteCalendarChanged
{
  hourFormat = self->_hourFormat;
  self->_hourFormat = 0;

  minuteFormat = self->_minuteFormat;
  self->_minuteFormat = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerMode_Time;
  [(_UIDatePickerMode *)&v5 noteCalendarChanged];
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

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  p_timeHourWidth = &self->_timeHourWidth;
  if (self->_timeHourWidth == 0.0)
  {
    uint64_t v10 = [(_UIDatePickerMode *)self amString];
    uint64_t v11 = [(_UIDatePickerMode *)self pmString];
    uint64_t v12 = [(_UIDatePickerMode *)self amPmFont];
    [(_UIDatePickerMode *)self componentWidthForTwoDigitCalendarUnit:32 font:v8 maxWidth:a5];
    double v14 = ceil(v13);
    uint64_t v15 = [(_UIDatePickerMode *)self _style];
    [v15 horizontalTimeColumnPadding];
    double *p_timeHourWidth = v14 + v16 + v16;

    [(_UIDatePickerMode *)self componentWidthForTwoDigitCalendarUnit:64 font:v8 maxWidth:a5];
    double v18 = ceil(v17);
    v19 = [(_UIDatePickerMode *)self _style];
    [v19 horizontalWeekdayTimePadding];
    self->_timeMinuteWidth = v18 + v20 + v20;

    v43 = v10;
    if (v10)
    {
      uint64_t v46 = *(void *)off_1E52D2040;
      uint64_t v21 = v46;
      v47[0] = v12;
      long long v22 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1, v10);
      [v10 sizeWithAttributes:v22];
      double v24 = v23;

      uint64_t v44 = v21;
      uint64_t v45 = v12;
      uint64_t v25 = (void *)v12;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      [v11 sizeWithAttributes:v26];
      double v28 = v27;

      if (v24 >= v28) {
        double v29 = v24;
      }
      else {
        double v29 = v28;
      }
      double v30 = ceil(v29);
      v31 = [(_UIDatePickerMode *)self _style];
      [v31 horizontalTimeColumnPadding];
      self->_double timeAMPMWidth = v30 + v32 + v32;
    }
    else
    {
      uint64_t v25 = (void *)v12;
    }
    double timeAMPMWidth = self->_timeAMPMWidth;
    double v34 = *p_timeHourWidth + self->_timeMinuteWidth + timeAMPMWidth;
    if (v34 > a5)
    {
      double v35 = v34 - a5;
      BOOL v36 = timeAMPMWidth <= 0.0;
      double v37 = 2.0;
      if (!v36) {
        double v37 = 3.0;
      }
      double v38 = round(v35 / v37);
      double *p_timeHourWidth = *p_timeHourWidth - v38;
      self->_timeMinuteWidth = self->_timeMinuteWidth - v38;
      double v39 = self->_timeAMPMWidth;
      if (v39 <= 0.0) {
        double v38 = 0.0;
      }
      self->_double timeAMPMWidth = v39 - v38;
    }
  }
  if (a3 == 32) {
    goto LABEL_21;
  }
  if (a3 == 64)
  {
    v41 = &OBJC_IVAR____UIDatePickerMode_Time__timeMinuteWidth;
    goto LABEL_20;
  }
  double v40 = 0.0;
  if (a3 == 0x10000)
  {
    v41 = &OBJC_IVAR____UIDatePickerMode_Time__timeAMPMWidth;
LABEL_20:
    p_timeHourWidth = (double *)((char *)self + *v41);
LABEL_21:
    double v40 = *p_timeHourWidth;
  }

  return v40;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  id v9 = [(_UIDatePickerMode *)self selectedDateComponents];
  int64_t v10 = [(_UIDatePickerMode_Time *)self displayedCalendarUnits];
  if (a5 == 0x10000)
  {
    uint64_t v15 = v9;
    int64_t v16 = a3;
    goto LABEL_7;
  }
  if (a5 == 64)
  {
    objc_msgSend(v9, "setMinute:", -[_UIDatePickerMode minuteForRow:](self, "minuteForRow:", a3));
    goto LABEL_11;
  }
  if (a5 != 32)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDatePickerMode.m", 1751, @"Unknown calendar unit: %lu", a5);

    goto LABEL_11;
  }
  objc_msgSend(v9, "setHour:", -[_UIDatePickerMode hourForRow:](self, "hourForRow:", a3));
  [v9 setMinute:0];
  int64_t v11 = [(_UIDatePickerMode *)self componentForCalendarUnit:0x10000];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = v11;
    double v13 = [(_UIDatePickerMode *)self datePickerView];
    uint64_t v14 = [v13 selectedRowInComponent:v12];

    uint64_t v15 = v9;
    int64_t v16 = v14;
LABEL_7:
    _UIDateComponentsSetValue(v15, 0x10000, v16);
  }
  v10 &= ~0x40uLL;
LABEL_11:
  BOOL v18 = [(_UIDatePickerMode *)self areValidDateComponents:v9 comparingUnits:v10];

  return v18;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  unint64_t v3 = 16;
  if (a3 != 32) {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 == 64) {
    return 32;
  }
  else {
    return v3;
  }
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if (a3 == 32) {
    return 64;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minuteFormat, 0);
  objc_storeStrong((id *)&self->_hourFormat, 0);
}

@end