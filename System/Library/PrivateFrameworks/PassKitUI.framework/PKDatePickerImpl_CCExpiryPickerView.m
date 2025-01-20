@interface PKDatePickerImpl_CCExpiryPickerView
- (BOOL)_useDoubleMonthStyle;
- (NSDate)date;
- (double)_calculateWidthForComponent:(int64_t)a3 usingFont:(id)a4;
- (double)_widthForComponent:(int64_t)a3;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)_dateForComponent:(int64_t)a3 index:(unint64_t)a4;
- (id)_dateFormatForCalendarUnit:(unint64_t)a3;
- (id)_dateWithCalendarUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)_stringForComponent:(int64_t)a3 index:(unint64_t)a4;
- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)_numberOfItemsForComponent:(int64_t)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (unint64_t)_defaultIndexForComponent:(int64_t)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)prepareToDie;
- (void)setDate:(id)a3;
- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4;
@end

@implementation PKDatePickerImpl_CCExpiryPickerView

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a7;
  v52.receiver = self;
  v52.super_class = (Class)PKDatePickerImpl_CCExpiryPickerView;
  v15 = [(PKDatePickerImpl_CCExpiryPickerView *)&v52 init];
  if (v15)
  {
    id v49 = v14;
    if (v9)
    {
      v16 = [MEMORY[0x1E4FB1618] colorWithRed:0.366 green:0.366 blue:0.366 alpha:1.0];
      [(PKDatePickerImpl_CCExpiryPickerView *)v15 setBackgroundColor:v16];

      v17 = [MEMORY[0x1E4FB1618] whiteColor];
      [(PKDatePickerImpl_CCExpiryPickerView *)v15 _setTextColor:v17];
    }
    [(PKDatePickerImpl_CCExpiryPickerView *)v15 setDelegate:v15];
    uint64_t v18 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v19 = 632;
    calendar = v15->_calendar;
    v15->_calendar = (NSCalendar *)v18;

    objc_storeStrong((id *)&v15->_locale, a7);
    uint64_t v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:23.5];
    uint64_t v22 = 648;
    font = v15->_font;
    v15->_font = (UIFont *)v21;

    if (v11 && v10 && !a3)
    {
      *(_OWORD *)v15->_calendarUnit = xmmword_1A04452D0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3B8];
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      [v24 raise:v25, @"%@ does not support the specified flags.", v27 format];
    }
    uint64_t v28 = 0;
    calendarUnit = v15->_calendarUnit;
    possibleRange = v15->_possibleRange;
    char v31 = 1;
    unint64_t v32 = 0x1E4F28000uLL;
    v50 = v15;
    do
    {
      char v51 = v31;
      unint64_t v33 = calendarUnit[v28];
      v34 = (char *)&possibleRange[v28];
      *(void *)v34 = [*(id *)((char *)&v15->super.super.super.super.isa + v19) maximumRangeOfUnit:v33];
      *((void *)v34 + 1) = v35;
      if (v33 == 4)
      {
        v36 = *(Class *)((char *)&v15->super.super.super.super.isa + v19);
        [MEMORY[0x1E4F1C9C8] date];
        unint64_t v37 = v32;
        uint64_t v38 = v19;
        v39 = possibleRange;
        v40 = calendarUnit;
        v42 = uint64_t v41 = v22;
        *(void *)v34 = [v36 component:4 fromDate:v42] - 1;

        uint64_t v22 = v41;
        calendarUnit = v40;
        possibleRange = v39;
        uint64_t v19 = v38;
        unint64_t v32 = v37;
        v15 = v50;
        *((void *)v34 + 1) = 32;
      }
      v43 = (NSDateFormatter *)objc_alloc_init(*(Class *)(v32 + 3088));
      v44 = v15->_dateFormatter[v28];
      v15->_dateFormatter[v28] = v43;

      [(NSDateFormatter *)v15->_dateFormatter[v28] setDateStyle:4];
      [(NSDateFormatter *)v15->_dateFormatter[v28] setCalendar:*(Class *)((char *)&v15->super.super.super.super.isa + v19)];
      [(NSDateFormatter *)v15->_dateFormatter[v28] setFormattingContext:3];
      v45 = v15->_dateFormatter[v28];
      v46 = [(PKDatePickerImpl_CCExpiryPickerView *)v15 _dateFormatForCalendarUnit:v33];
      [(NSDateFormatter *)v45 setDateFormat:v46];

      [(PKDatePickerImpl_CCExpiryPickerView *)v15 _calculateWidthForComponent:v28 usingFont:*(Class *)((char *)&v15->super.super.super.super.isa + v22)];
      char v31 = 0;
      v15->_width[v28] = v47;
      uint64_t v28 = 1;
    }
    while ((v51 & 1) != 0);
    [(PKDatePickerImpl_CCExpiryPickerView *)v15 reloadAllComponents];
    [(PKDatePickerImpl_CCExpiryPickerView *)v15 selectRow:[(PKDatePickerImpl_CCExpiryPickerView *)v15 _defaultIndexForComponent:0] inComponent:0 animated:0];
    [(PKDatePickerImpl_CCExpiryPickerView *)v15 selectRow:[(PKDatePickerImpl_CCExpiryPickerView *)v15 _defaultIndexForComponent:1] inComponent:1 animated:0];
    id v14 = v49;
  }

  return v15;
}

- (NSDate)date
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setCalendar:self->_calendar];
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    objc_msgSend(v3, "setValue:forComponent:", self->_possibleRange[v4].location+ -[PKDatePickerImpl_CCExpiryPickerView selectedRowInComponent:](self, "selectedRowInComponent:", v4), self->_calendarUnit[v4]);
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  v7 = [(NSCalendar *)self->_calendar dateFromComponents:v3];

  return (NSDate *)v7;
}

- (void)setDate:(id)a3
{
  uint64_t v5 = 0;
  calendarUnit = self->_calendarUnit;
  char v7 = 1;
  do
  {
    char v8 = v7;
    unint64_t v9 = [(NSCalendar *)self->_calendar component:calendarUnit[v5] fromDate:a3];
    BOOL v10 = &self->_possibleRange[v5];
    BOOL v11 = v9 >= v10->location;
    uint64_t v12 = v9 - v10->location;
    if (v12 >= 0)
    {
      NSUInteger length = v10->length;
      if (v11
        && v12 < length
        && v12 < [(PKDatePickerImpl_CCExpiryPickerView *)self _numberOfItemsForComponent:v5])
      {
        uint64_t v15 = [(PKDatePickerImpl_CCExpiryPickerView *)self selectedRowInComponent:v5];
        if (v15 == -1 || v12 != v15) {
          [(PKDatePickerImpl_CCExpiryPickerView *)self selectRow:v12 inComponent:v5 animated:0];
        }
      }
    }
    char v7 = 0;
    uint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
}

- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4
{
  objc_storeStrong(&self->_changeTarget, a3);
  if (a4) {
    char v6 = a4;
  }
  else {
    char v6 = 0;
  }
  self->_changeAction = v6;
}

- (void)prepareToDie
{
}

- (id)_dateFormatForCalendarUnit:(unint64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v4 = @"yyyy";
  }
  else if (a3 == 8)
  {
    if ([(PKDatePickerImpl_CCExpiryPickerView *)self _useDoubleMonthStyle])
    {
      id v3 = @"LL '-' LLLL";
      goto LABEL_9;
    }
    uint64_t v4 = @"LLLL";
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    char v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@ does not support the specified calendar unit.", v8 format];

    uint64_t v4 = &stru_1EF1B5B50;
  }
  unint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v10 = PKLocaleWithOverriddenCalendar();

  id v3 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v4 options:0 locale:v10];

LABEL_9:

  return v3;
}

- (BOOL)_useDoubleMonthStyle
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  useDoubleMonthStyle = self->_useDoubleMonthStyle;
  if (!useDoubleMonthStyle)
  {
    uint64_t v4 = [(PKDatePickerImpl_CCExpiryPickerView *)self _dateWithCalendarUnit:8 value:1];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v5 setDateStyle:4];
    [v5 setCalendar:self->_calendar];
    [v5 setFormattingContext:3];
    [v5 setDateFormat:@"LLLL"];
    uint64_t v6 = [v5 stringFromDate:v4];
    [v5 setDateFormat:@"L"];
    char v7 = [v5 stringFromDate:v4];
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "containsString:", v7) ^ 1);
    char v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = self->_useDoubleMonthStyle;
    self->_useDoubleMonthStyle = v8;

    BOOL v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(NSNumber *)self->_useDoubleMonthStyle BOOLValue];
      v13[0] = 67109634;
      v13[1] = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKDatePicker: useDoubleMonthStyle: %i (long:'%@' short:'%@')", (uint8_t *)v13, 0x1Cu);
    }

    useDoubleMonthStyle = self->_useDoubleMonthStyle;
  }
  return [(NSNumber *)useDoubleMonthStyle BOOLValue];
}

- (id)_dateWithCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v7 setCalendar:self->_calendar];
  [v7 setValue:a4 forComponent:a3];
  char v8 = [(NSCalendar *)self->_calendar dateFromComponents:v7];

  return v8;
}

- (double)_calculateWidthForComponent:(int64_t)a3 usingFont:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = self->_calendarUnit[a3];
  char v8 = &self->_possibleRange[a3];
  NSUInteger location = v8->location;
  NSUInteger length = v8->length;
  BOOL v11 = self->_dateFormatter[a3];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  v13 = (void *)v12;
  double v14 = 0.0;
  if (location < length + location)
  {
    v26 = (void *)v12;
    uint64_t v27 = *MEMORY[0x1E4FB06F8];
    do
    {
      uint64_t v15 = -[NSCalendar dateBySettingUnit:value:ofDate:options:](self->_calendar, "dateBySettingUnit:value:ofDate:options:", v7, location, v13, 0, v26);
      if (v15)
      {
        __int16 v16 = [(NSDateFormatter *)v11 stringFromDate:v15];
        uint64_t v30 = v27;
        v31[0] = v6;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        [v16 sizeWithAttributes:v17];
        if (v18 > v14)
        {
          uint64_t v28 = v27;
          id v29 = v6;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          uint64_t v19 = v11;
          unint64_t v20 = v7;
          uint64_t v21 = self;
          v23 = id v22 = v6;
          [v16 sizeWithAttributes:v23];
          double v14 = v24;

          id v6 = v22;
          self = v21;
          unint64_t v7 = v20;
          BOOL v11 = v19;
          v13 = v26;
        }
      }
      ++location;
      --length;
    }
    while (length);
  }

  return ceil(v14) + 2.0;
}

- (int64_t)_numberOfItemsForComponent:(int64_t)a3
{
  return self->_possibleRange[a3].length;
}

- (unint64_t)_defaultIndexForComponent:(int64_t)a3
{
  unint64_t v5 = self->_calendarUnit[a3];
  calendar = self->_calendar;
  unint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v8 = [(NSCalendar *)calendar component:v5 fromDate:v7] - self->_possibleRange[a3].location;

  return v8;
}

- (id)_dateForComponent:(int64_t)a3 index:(unint64_t)a4
{
  return [(PKDatePickerImpl_CCExpiryPickerView *)self _dateWithCalendarUnit:self->_calendarUnit[a3] value:self->_possibleRange[a3].location + a4];
}

- (id)_stringForComponent:(int64_t)a3 index:(unint64_t)a4
{
  id v6 = [(PKDatePickerImpl_CCExpiryPickerView *)self _dateForComponent:a3 index:a4];
  if (v6)
  {
    unint64_t v7 = [(NSDateFormatter *)self->_dateFormatter[a3] stringFromDate:v6];
  }
  else
  {
    unint64_t v7 = @"-";
  }

  return v7;
}

- (double)_widthForComponent:(int64_t)a3
{
  return self->_width[a3] + 10.0 + 5.0;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(PKDatePickerImpl_CCExpiryPickerView *)self _numberOfItemsForComponent:a4];
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  [(PKDatePickerImpl_CCExpiryPickerView *)self _widthForComponent:a4];
  return result;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  unint64_t v9 = (PKDatePickerLabel *)a6;
  BOOL v10 = v9;
  if (!v9) {
    BOOL v10 = objc_alloc_init(PKDatePickerLabel);
  }
  BOOL v11 = [(PKDatePickerImpl_CCExpiryPickerView *)self _stringForComponent:a5 index:a4];
  [(PKDatePickerLabel *)v10 setText:v11];
  if (a5) {
    double v12 = 10.0;
  }
  else {
    double v12 = 5.0;
  }
  if (a5) {
    double v13 = 5.0;
  }
  else {
    double v13 = 10.0;
  }
  [(PKDatePickerLabel *)v10 setTextAlignment:2 * (a5 != 0)];
  [(PKDatePickerLabel *)v10 setFont:self->_font];
  double v14 = [(PKDatePickerImpl_CCExpiryPickerView *)self _textColor];
  [(PKDatePickerLabel *)v10 setTextColor:v14];

  -[PKDatePickerLabel setContentInset:](v10, "setContentInset:", 0.0, v12, 0.0, v13);

  return v10;
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
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_useDoubleMonthStyle, 0);
  dateFormatter = self->_dateFormatter;
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&dateFormatter[i], 0);
}

@end