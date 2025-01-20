@interface PKDatePickerImpl_PickerView
- (NSDate)date;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)_dateComponentsForCalendarUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)_dateForIndex:(unint64_t)a3;
- (id)_dateFormatForCalendarUnit:(unint64_t)a3;
- (id)_stringForIndex:(unint64_t)a3;
- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (unint64_t)_defaultIndex;
- (unint64_t)_numberOfItems;
- (void)dealloc;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)prepareToDie;
- (void)setDate:(id)a3;
- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4;
@end

@implementation PKDatePickerImpl_PickerView

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a7;
  id v16 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PKDatePickerImpl_PickerView;
  v17 = [(PKDatePickerImpl_PickerView *)&v32 init];
  if (v17)
  {
    if (v10)
    {
      v18 = [MEMORY[0x1E4FB1618] colorWithRed:0.366 green:0.366 blue:0.366 alpha:1.0];
      [(PKDatePickerImpl_PickerView *)v17 setBackgroundColor:v18];

      v19 = [MEMORY[0x1E4FB1618] whiteColor];
      [(PKDatePickerImpl_PickerView *)v17 _setTextColor:v19];
    }
    [(PKDatePickerImpl_PickerView *)v17 setDelegate:v17];
    p_calendar = (id *)&v17->_calendar;
    objc_storeStrong((id *)&v17->_calendar, a8);
    objc_storeStrong((id *)&v17->_locale, a7);
    if (!v13 || v12 || v11)
    {
      if (!v12 || v13 || v11)
      {
        if (!v11 || v12 || v13)
        {
          v28 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v29 = *MEMORY[0x1E4F1C3B8];
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          [v28 raise:v29, @"%@ does not support the specified flags.", v31 format];

          goto LABEL_17;
        }
        uint64_t v21 = 4;
      }
      else
      {
        uint64_t v21 = 8;
      }
    }
    else
    {
      uint64_t v21 = 16;
    }
    v17->_calendarUnit = v21;
LABEL_17:
    v17->_possibleRange.location = objc_msgSend(*p_calendar, "maximumRangeOfUnit:");
    v17->_possibleRange.length = v22;
    v23 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v17->_dateFormatter;
    v17->_dateFormatter = v23;

    [(NSDateFormatter *)v17->_dateFormatter setDateStyle:3];
    [(NSDateFormatter *)v17->_dateFormatter setCalendar:*p_calendar];
    v25 = v17->_dateFormatter;
    v26 = [(PKDatePickerImpl_PickerView *)v17 _dateFormatForCalendarUnit:v17->_calendarUnit];
    [(NSDateFormatter *)v25 setDateFormat:v26];

    [(NSDateFormatter *)v17->_dateFormatter setFormattingContext:3];
    [(PKDatePickerImpl_PickerView *)v17 reloadAllComponents];
    [(PKDatePickerImpl_PickerView *)v17 selectRow:[(PKDatePickerImpl_PickerView *)v17 _defaultIndex] inComponent:0 animated:0];
  }

  return v17;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKDatePickerImpl_PickerView;
  [(PKDatePickerImpl_PickerView *)&v2 dealloc];
}

- (NSDate)date
{
  uint64_t v3 = [(PKDatePickerImpl_PickerView *)self selectedRowInComponent:0];

  return (NSDate *)[(PKDatePickerImpl_PickerView *)self _dateForIndex:v3];
}

- (void)setDate:(id)a3
{
  id v5 = [(NSCalendar *)self->_calendar components:self->_calendarUnit fromDate:a3];
  NSUInteger v4 = [v5 valueForComponent:self->_calendarUnit] - self->_possibleRange.location;
  if (v4 < [(PKDatePickerImpl_PickerView *)self _numberOfItems]) {
    [(PKDatePickerImpl_PickerView *)self selectRow:v4 inComponent:0 animated:0];
  }
}

- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4
{
  objc_storeStrong(&self->_changeTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_changeAction = v6;
}

- (void)prepareToDie
{
}

- (id)_dateFormatForCalendarUnit:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      uint64_t v3 = @"yyyy";
      break;
    case 0x10uLL:
      uint64_t v3 = @"dd";
      break;
    case 8uLL:
      uint64_t v3 = @"LLLL";
      break;
    default:
      NSUInteger v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3B8];
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      [v4 raise:v5, @"%@ does not support the specified calendar unit.", v7 format];

      uint64_t v3 = &stru_1EF1B5B50;
      break;
  }
  v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  v9 = PKLocaleWithOverriddenCalendar();

  BOOL v10 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v3 options:0 locale:v9];

  return v10;
}

- (id)_dateComponentsForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v7 setCalendar:self->_calendar];
  [v7 setValue:a4 forComponent:a3];

  return v7;
}

- (unint64_t)_defaultIndex
{
  calendar = self->_calendar;
  unint64_t calendarUnit = self->_calendarUnit;
  NSUInteger v4 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v5 = [(NSCalendar *)calendar component:calendarUnit fromDate:v4];

  return v5;
}

- (unint64_t)_numberOfItems
{
  return self->_possibleRange.length;
}

- (id)_dateForIndex:(unint64_t)a3
{
  NSUInteger v4 = [(PKDatePickerImpl_PickerView *)self _dateComponentsForCalendarUnit:self->_calendarUnit value:self->_possibleRange.location + a3];
  unint64_t v5 = [(NSCalendar *)self->_calendar dateFromComponents:v4];

  return v5;
}

- (id)_stringForIndex:(unint64_t)a3
{
  NSUInteger v4 = [(PKDatePickerImpl_PickerView *)self _dateForIndex:a3];
  if (v4)
  {
    unint64_t v5 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v4];
  }
  else
  {
    unint64_t v5 = @"-";
  }

  return v5;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  [(PKDatePickerImpl_PickerView *)self bounds];
  return v4;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return [(PKDatePickerImpl_PickerView *)self _stringForIndex:a4];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = a3;
  if (self->_changeTarget)
  {
    p_changeAction = &self->_changeAction;
    if (self->_changeAction)
    {
      id v10 = v6;
      char v8 = objc_opt_respondsToSelector();
      id v6 = v10;
      if (v8)
      {
        if (*p_changeAction) {
          SEL v9 = *p_changeAction;
        }
        else {
          SEL v9 = 0;
        }
        [self->_changeTarget performSelector:v9 withObject:self];
        id v6 = v10;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeTarget, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end