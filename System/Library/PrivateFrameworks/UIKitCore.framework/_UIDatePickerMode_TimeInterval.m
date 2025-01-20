@interface _UIDatePickerMode_TimeInterval
+ (int64_t)datePickerMode;
+ (unint64_t)extractableCalendarUnits;
- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5;
- (BOOL)areValidDateComponents:(id)a3 comparingUnits:(int64_t)a4;
- (BOOL)isTimeIntervalMode;
- (_NSRange)rangeForCalendarUnit:(unint64_t)a3;
- (double)rowHeight;
- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5;
- (id)dateComponentsByRestrictingSelectedComponents:(id)a3 withLastManipulatedColumn:(int64_t)a4;
- (id)localizedFormatString;
- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4;
- (int64_t)hourForRow:(int64_t)a3;
- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3;
- (int64_t)valueForDate:(id)a3 dateComponents:(id)a4 calendarUnit:(unint64_t)a5;
- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3;
- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3;
- (void)resetComponentWidths;
@end

@implementation _UIDatePickerMode_TimeInterval

+ (int64_t)datePickerMode
{
  return 3;
}

+ (unint64_t)extractableCalendarUnits
{
  return 96;
}

- (BOOL)isTimeIntervalMode
{
  return 1;
}

- (id)localizedFormatString
{
  localizedFormatString = self->super._localizedFormatString;
  if (!localizedFormatString)
  {
    [(_UIDatePickerMode *)self setLocalizedFormatString:@"HH:mm"];
    localizedFormatString = self->super._localizedFormatString;
  }
  return localizedFormatString;
}

- (double)rowHeight
{
  return 32.0;
}

- (void)resetComponentWidths
{
  self->_componentWidth = 0.0;
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  if (a3 == 32) {
    return 24;
  }
  else {
    return 10000;
  }
}

- (int64_t)hourForRow:(int64_t)a3
{
  return a3;
}

- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  unint64_t v7 = [(_UIDatePickerMode *)self calendarUnitForComponent:a4];
  unint64_t v8 = v7;
  if (v7 == 64 || v7 == 32)
  {
    formatter = self->super._formatter;
    if (!formatter)
    {
      v10 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
      v11 = self->super._formatter;
      self->super._formatter = v10;

      [(NSNumberFormatter *)self->super._formatter setFormatterBehavior:1040];
      [(NSNumberFormatter *)self->super._formatter setNumberStyle:0];
      formatter = self->super._formatter;
    }
    v12 = [(_UIDatePickerMode *)self locale];
    [(NSNumberFormatter *)formatter setLocale:v12];

    int64_t v13 = [(_UIDatePickerMode *)self valueForRow:a3 inCalendarUnit:v8];
    v14 = [NSNumber numberWithInteger:v13];
    v15 = [(NSNumberFormatter *)self->super._formatter stringFromNumber:v14];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_UIDatePickerMode_TimeInterval;
    v15 = [(_UIDatePickerMode *)&v17 titleForRow:a3 inComponent:a4];
  }
  return v15;
}

- (_NSRange)rangeForCalendarUnit:(unint64_t)a3
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 64) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 == 64) {
    uint64_t v3 = 60;
  }
  if (a3 == 32) {
    NSUInteger v5 = 0;
  }
  else {
    NSUInteger v5 = v4;
  }
  if (a3 == 32) {
    NSUInteger v6 = 24;
  }
  else {
    NSUInteger v6 = v3;
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  v48[1] = *MEMORY[0x1E4F143B8];
  double result = self->_componentWidth;
  if (result == 0.0)
  {
    uint64_t v8 = *(void *)off_1E52D2040;
    uint64_t v47 = *(void *)off_1E52D2040;
    v9 = -[_UIDatePickerMode fontForCalendarUnit:](self, "fontForCalendarUnit:", 32, a4);
    v48[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    [@"00" sizeWithAttributes:v10];
    double v12 = v11;

    int64_t v13 = [(_UIDatePickerMode *)self datePickerView];
    v38 = [v13 _minutesStringForHour:1 minutes:0];
    v46[0] = v38;
    v14 = [(_UIDatePickerMode *)self datePickerView];
    v15 = [v14 _minutesStringForHour:0 minutes:1];
    v46[1] = v15;
    v16 = [(_UIDatePickerMode *)self datePickerView];
    objc_super v17 = [v16 _hoursStringForHour:0];
    v46[2] = v17;
    v18 = [(_UIDatePickerMode *)self datePickerView];
    v19 = [v18 _hoursStringForHour:1];
    v46[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      double v25 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v43 = v8;
          v28 = [(_UIDatePickerMode *)self datePickerView];
          v29 = [v28 _hrMinFont];
          v44 = v29;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          [v27 sizeWithAttributes:v30];
          double v32 = v31;

          if (v25 < v32) {
            double v25 = v32;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v23);
    }
    else
    {
      double v25 = 0.0;
    }

    v33 = [(_UIDatePickerMode *)self datePickerView];
    v34 = [v33 traitCollection];
    v35 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v34 userInterfaceIdiom]);

    [v35 pickerHorizontalEdgeInset];
    double v37 = v12 + 6.0 + v25 + v36 + v36;
    self->_componentWidth = v37;
    if (v37 * (double)[(_UIDatePickerMode *)self numberOfComponents] > a5) {
      self->_componentWidth = floor(a5 / (double)[(_UIDatePickerMode *)self numberOfComponents]);
    }

    return self->_componentWidth;
  }
  return result;
}

- (BOOL)areValidDateComponents:(id)a3 comparingUnits:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 hour];
  unint64_t v8 = [v6 minute];

  BOOL v10 = (v4 & 0x20) == 0 || v7 < 0x18;
  if ((v4 & 0x40) != 0)
  {
    if (v8 >= 0x3C) {
      LOBYTE(v10) = 0;
    }
    if (!v10) {
      return 0;
    }
  }
  else if (!v10)
  {
    return 0;
  }
  double v12 = [(_UIDatePickerMode *)self datePickerView];
  char v13 = [v12 _allowsZeroTimeInterval];

  BOOL result = 1;
  if ((~v4 & 0x60) == 0) {
    return (v13 & 1) != 0 || (v7 | v8) != 0;
  }
  return result;
}

- (id)dateComponentsByRestrictingSelectedComponents:(id)a3 withLastManipulatedColumn:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(_UIDatePickerMode *)self datePickerView];
  if (([v6 _allowsZeroTimeInterval] & 1) != 0 || objc_msgSend(v5, "hour"))
  {
  }
  else
  {
    uint64_t v8 = [v5 minute];

    if (!v8)
    {
      v9 = (void *)[v5 copy];

      objc_msgSend(v9, "setMinute:", -[_UIDatePickerMode _incrementForStaggeredTimeIntervals](self, "_incrementForStaggeredTimeIntervals"));
      id v5 = v9;
    }
  }
  return v5;
}

- (int64_t)valueForDate:(id)a3 dateComponents:(id)a4 calendarUnit:(unint64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerMode_TimeInterval;
  id v9 = [(_UIDatePickerMode *)&v14 valueForDate:a3 dateComponents:v8 calendarUnit:a5];
  uint64_t v10 = [(id)objc_opt_class() datePickerMode];
  if (a5 == 64 && v10 == 3)
  {
    double v11 = [(_UIDatePickerMode *)self datePickerView];
    if (([v11 _allowsZeroTimeInterval] & 1) != 0 || objc_msgSend(v8, "hour"))
    {
    }
    else
    {
      int64_t v13 = [(_UIDatePickerMode *)self _incrementForStaggeredTimeIntervals];

      if ((uint64_t)v9 < v13) {
        id v9 = [(_UIDatePickerMode *)self _incrementForStaggeredTimeIntervals];
      }
    }
  }

  return (int64_t)v9;
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  if (a5 == 32)
  {
    LOBYTE(v12) = 1;
  }
  else if (a5 == 64)
  {
    unint64_t v7 = [(_UIDatePickerMode *)self datePickerView];
    char v8 = [v7 _allowsZeroTimeInterval];

    if ((v8 & 1) != 0
      || [(_UIDatePickerMode *)self minuteForRow:a3]
      || (int64_t v9 = [(_UIDatePickerMode *)self componentForCalendarUnit:32],
          [(_UIDatePickerMode *)self datePickerView],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 selectedRowInComponent:v9],
          v10,
          (int64_t v12 = [(_UIDatePickerMode_TimeInterval *)self hourForRow:v11]) != 0))
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  if (a3 == 64) {
    return 32;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
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

@end