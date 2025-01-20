@interface _UIDatePickerDataModel
- (BOOL)followsSystemHourCycle;
- (BOOL)roundsToMinuteInterval;
- (NSCalendar)calendar;
- (NSCalendar)effectiveCalendar;
- (NSCalendar)formattingCalendar;
- (NSDate)date;
- (NSDate)effectiveDate;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (NSDateComponents)effectiveDateComponents;
- (NSDateComponents)lastSelectedDateComponents;
- (NSLocale)effectiveLocale;
- (NSLocale)locale;
- (NSString)customFontDesign;
- (NSTimeZone)timeZone;
- (UIColor)customTextColor;
- (_UIDatePickerDataModel)init;
- (_UIDatePickerDateRange)dateRange;
- (id)_dateForRoundingDateToMinuteInterval:(id)a3;
- (id)createDatePickerRepresentingDataModel;
- (id)createDatePickerRepresentingDataModelForMode:(int64_t)a3 style:(int64_t)a4;
- (int64_t)datePickerMode;
- (int64_t)datePickerStyle;
- (int64_t)minuteInterval;
- (void)_setupDerivedLocaleAndCalendars;
- (void)resetForCurrentLocaleOrCalendarChange;
- (void)setCalendar:(id)a3;
- (void)setCustomFontDesign:(id)a3;
- (void)setCustomTextColor:(id)a3;
- (void)setDate:(id)a3;
- (void)setDatePickerMode:(int64_t)a3;
- (void)setDatePickerStyle:(int64_t)a3;
- (void)setLastSelectedDateComponents:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMaximumDate:(id)a3;
- (void)setMinimumDate:(id)a3;
- (void)setMinuteInterval:(int64_t)a3;
- (void)setRoundsToMinuteInterval:(BOOL)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation _UIDatePickerDataModel

- (_UIDatePickerDataModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerDataModel;
  v2 = [(_UIDatePickerDataModel *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_datePickerStyle = xmmword_186B83A90;
    v2->_minuteInterval = 1;
    v2->_roundsToMinuteInterval = 1;
    v4 = objc_alloc_init(_UIDatePickerDateRange);
    dateRange = v3->_dateRange;
    v3->_dateRange = v4;
  }
  return v3;
}

- (void)_setupDerivedLocaleAndCalendars
{
  v29 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = (NSCalendar *)[(NSCalendar *)self->_calendar copy];
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = v29;
  }
  v5 = v4;

  locale = self->_locale;
  if (locale)
  {
    objc_super v7 = locale;
  }
  else
  {
    objc_super v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  v8 = v7;
  if (self->_calendar)
  {
    v9 = (void *)MEMORY[0x1E4F1CA20];
    v10 = [(NSLocale *)v7 localeIdentifier];
    v11 = [v9 componentsFromLocaleIdentifier:v10];
    v12 = (NSLocale *)[v11 mutableCopy];

    [(NSLocale *)v12 removeObjectForKey:@"calendar"];
    [(NSLocale *)v12 setObject:self->_calendar forKey:*MEMORY[0x1E4F1C3E0]];
    v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v12];
    v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
    effectiveLocale = self->_effectiveLocale;
    self->_effectiveLocale = v14;
  }
  else
  {
    v16 = v7;
    v12 = self->_effectiveLocale;
    self->_effectiveLocale = v16;
  }

  v17 = [(NSCalendar *)v5 calendarIdentifier];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F1C2F0]];

  if (v18)
  {
    uint64_t v19 = [(NSCalendar *)v5 firstWeekday];
    [(NSCalendar *)v5 setLocale:self->_effectiveLocale];
    [(NSCalendar *)v5 setFirstWeekday:v19];
    chineseWrapperCalendar = self->_chineseWrapperCalendar;
    if (chineseWrapperCalendar)
    {
      [(_UIDatePickerChineseCalendar *)chineseWrapperCalendar setRealCalendar:v5];
      goto LABEL_16;
    }
    v22 = [[_UIDatePickerChineseCalendar alloc] initWithCalendar:v5];
    v21 = self->_chineseWrapperCalendar;
    self->_chineseWrapperCalendar = v22;
  }
  else
  {
    v21 = self->_chineseWrapperCalendar;
    self->_chineseWrapperCalendar = 0;
  }

LABEL_16:
  calendar = self->_calendar;
  if (!calendar) {
    calendar = v29;
  }
  v24 = calendar;
  v25 = [(_UIDatePickerDataModel *)self timeZone];

  if (v25)
  {
    v26 = (NSCalendar *)[(NSCalendar *)v24 copy];

    v27 = [(_UIDatePickerDataModel *)self timeZone];
    [(NSCalendar *)v26 setTimeZone:v27];

    v24 = v26;
  }
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = v24;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  id v6 = a3;
  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;
}

- (void)setCalendar:(id)a3
{
  v4 = (NSCalendar *)[a3 copy];
  calendar = self->_calendar;
  self->_calendar = v4;

  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;

  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
  id v6 = a3;
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;
}

- (NSLocale)effectiveLocale
{
  effectiveLocale = self->_effectiveLocale;
  if (!effectiveLocale || !self->_effectiveCalendar)
  {
    [(_UIDatePickerDataModel *)self _setupDerivedLocaleAndCalendars];
    effectiveLocale = self->_effectiveLocale;
  }
  return effectiveLocale;
}

- (NSCalendar)effectiveCalendar
{
  if (!self->_effectiveLocale || !self->_effectiveCalendar) {
    [(_UIDatePickerDataModel *)self _setupDerivedLocaleAndCalendars];
  }
  v3 = self;
  if ([(_UIDatePickerDataModel *)v3 datePickerStyle] != 1
    || (effectiveCalendar = v3->_chineseWrapperCalendar) == 0)
  {
    effectiveCalendar = (_UIDatePickerChineseCalendar *)v3->_effectiveCalendar;
  }
  v5 = effectiveCalendar;

  return (NSCalendar *)v5;
}

- (NSCalendar)formattingCalendar
{
  v2 = self;
  if ([(_UIDatePickerDataModel *)v2 datePickerStyle] == 1
    && (chineseWrapperCalendar = v2->_chineseWrapperCalendar) != 0)
  {
    v4 = [(_UIDatePickerChineseCalendar *)chineseWrapperCalendar realCalendar];
  }
  else
  {
    v4 = v2->_effectiveCalendar;
  }
  v5 = v4;

  return v5;
}

- (void)setLastSelectedDateComponents:(id)a3
{
  v4 = (NSDateComponents *)a3;
  v5 = v4;
  if (v4
    && ([(NSDateComponents *)v4 calendar],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    v8 = [(_UIDatePickerDataModel *)self effectiveCalendar];
    lastSelectedDateComponentsCalendar = self->_lastSelectedDateComponentsCalendar;
    self->_lastSelectedDateComponentsCalendar = v8;
  }
  else
  {
    lastSelectedDateComponentsCalendar = self->_lastSelectedDateComponentsCalendar;
    self->_lastSelectedDateComponentsCalendar = 0;
  }

  lastSelectedDateComponents = self->_lastSelectedDateComponents;
  self->_lastSelectedDateComponents = v5;
}

- (void)resetForCurrentLocaleOrCalendarChange
{
  if (!self->_locale || !self->_calendar)
  {
    effectiveLocale = self->_effectiveLocale;
    self->_effectiveLocale = 0;

    effectiveCalendar = self->_effectiveCalendar;
    self->_effectiveCalendar = 0;
  }
}

- (void)setDate:(id)a3
{
  v4 = (NSDate *)a3;
  if ([(_UIDatePickerDataModel *)self roundsToMinuteInterval])
  {
    uint64_t v5 = [(_UIDatePickerDataModel *)self _dateForRoundingDateToMinuteInterval:v4];

    v4 = (NSDate *)v5;
  }
  date = self->_date;
  self->_date = v4;
}

- (NSDate)effectiveDate
{
  date = self->_date;
  if (date)
  {
    v4 = date;
LABEL_3:
    uint64_t v5 = v4;
    goto LABEL_4;
  }
  lastSelectedDateComponents = self->_lastSelectedDateComponents;
  if (!lastSelectedDateComponents)
  {
    v4 = (NSDate *)objc_opt_new();
    goto LABEL_3;
  }
  v11 = [(NSDateComponents *)lastSelectedDateComponents calendar];

  if (v11)
  {
    v4 = [(NSDateComponents *)self->_lastSelectedDateComponents date];
    goto LABEL_3;
  }
  lastSelectedDateComponentsCalendar = self->_lastSelectedDateComponentsCalendar;
  if (lastSelectedDateComponentsCalendar)
  {
    v13 = lastSelectedDateComponentsCalendar;
  }
  else
  {
    v13 = [(_UIDatePickerDataModel *)self effectiveCalendar];
  }
  v14 = v13;
  uint64_t v5 = [(NSCalendar *)v13 dateFromComponents:self->_lastSelectedDateComponents];

LABEL_4:
  if ([(_UIDatePickerDataModel *)self roundsToMinuteInterval])
  {
    uint64_t v6 = [(_UIDatePickerDataModel *)self _dateForRoundingDateToMinuteInterval:v5];

    uint64_t v5 = (void *)v6;
  }
  if (dyld_program_sdk_at_least())
  {
    dateRange = self->_dateRange;
    if (dateRange)
    {
      uint64_t v8 = [(_UIDatePickerDateRange *)dateRange dateInRangeForDate:v5];

      uint64_t v5 = (void *)v8;
    }
  }
  return (NSDate *)v5;
}

- (id)_dateForRoundingDateToMinuteInterval:(id)a3
{
  id v4 = a3;
  if (v4 && [(_UIDatePickerDataModel *)self minuteInterval] >= 2)
  {
    if (!self->_effectiveLocale || !self->_effectiveCalendar) {
      [(_UIDatePickerDataModel *)self _setupDerivedLocaleAndCalendars];
    }
    uint64_t v5 = self;
    if ([(_UIDatePickerDataModel *)v5 datePickerStyle] != 1
      || (effectiveCalendar = v5->_chineseWrapperCalendar) == 0)
    {
      effectiveCalendar = (_UIDatePickerChineseCalendar *)v5->_effectiveCalendar;
    }
    objc_super v7 = effectiveCalendar;

    uint64_t v8 = [(_UIDatePickerChineseCalendar *)v7 components:766 fromDate:v4];
    uint64_t v9 = [v8 minute];
    if (v9 % [(_UIDatePickerDataModel *)v5 minuteInterval])
    {
      uint64_t v10 = [v8 minute];
      uint64_t v11 = [(_UIDatePickerDataModel *)v5 minuteInterval];
      [v8 setMinute:(uint64_t)(floor((double)v10 / (double)v11) * (double)v11)];
      uint64_t v12 = [(_UIDatePickerChineseCalendar *)v7 dateFromComponents:v8];

      id v4 = (id)v12;
    }
  }
  return v4;
}

- (NSDateComponents)effectiveDateComponents
{
  if (!self->_effectiveLocale || !self->_effectiveCalendar) {
    [(_UIDatePickerDataModel *)self _setupDerivedLocaleAndCalendars];
  }
  if (!self->_date) {
    goto LABEL_9;
  }
  v3 = self;
  if ([(_UIDatePickerDataModel *)v3 datePickerStyle] != 1
    || (effectiveCalendar = v3->_chineseWrapperCalendar) == 0)
  {
    effectiveCalendar = (_UIDatePickerChineseCalendar *)v3->_effectiveCalendar;
  }
  uint64_t v5 = effectiveCalendar;

  uint64_t v6 = [(_UIDatePickerChineseCalendar *)v5 components:766 fromDate:self->_date];

  if (!v6)
  {
LABEL_9:
    lastSelectedDateComponents = self->_lastSelectedDateComponents;
    if (!lastSelectedDateComponents
      || (uint64_t v6 = (void *)[(NSDateComponents *)lastSelectedDateComponents copy]) == 0)
    {
      uint64_t v8 = self;
      if ([(_UIDatePickerDataModel *)v8 datePickerStyle] != 1
        || (chineseWrapperCalendar = v8->_chineseWrapperCalendar) == 0)
      {
        chineseWrapperCalendar = (_UIDatePickerChineseCalendar *)v8->_effectiveCalendar;
      }
      uint64_t v10 = chineseWrapperCalendar;

      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v6 = [(_UIDatePickerChineseCalendar *)v10 components:766 fromDate:v11];
    }
  }
  uint64_t v12 = [v6 calendar];

  if (!v12)
  {
    v13 = self;
    if ([(_UIDatePickerDataModel *)v13 datePickerStyle] != 1
      || (v14 = v13->_chineseWrapperCalendar) == 0)
    {
      v14 = (_UIDatePickerChineseCalendar *)v13->_effectiveCalendar;
    }
    v15 = v14;

    [v6 setCalendar:v15];
  }
  return (NSDateComponents *)v6;
}

- (void)setMinuteInterval:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x1E && ((1 << a3) & 0x4010947E) != 0) {
    self->_minuteInterval = a3;
  }
}

- (void)setMinimumDate:(id)a3
{
  dateRange = self->_dateRange;
  if ((unint64_t)a3 | (unint64_t)dateRange)
  {
    uint64_t v5 = -[_UIDatePickerDateRange copyWithStartDate:](dateRange, "copyWithStartDate:");
    uint64_t v6 = self->_dateRange;
    self->_dateRange = v5;
  }
}

- (NSDate)minimumDate
{
  return [(_UIDatePickerDateRange *)self->_dateRange startDate];
}

- (void)setMaximumDate:(id)a3
{
  dateRange = self->_dateRange;
  if ((unint64_t)a3 | (unint64_t)dateRange)
  {
    uint64_t v5 = -[_UIDatePickerDateRange copyWithEndDate:](dateRange, "copyWithEndDate:");
    uint64_t v6 = self->_dateRange;
    self->_dateRange = v5;
  }
}

- (NSDate)maximumDate
{
  return [(_UIDatePickerDateRange *)self->_dateRange endDate];
}

- (void)setDatePickerStyle:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIDatePickerDataModel.m" lineNumber:283 description:@"date picker style can not be .automatic after being resolved."];
  }
  self->_datePickerStyle = a3;
}

- (int64_t)datePickerMode
{
  if (self->_datePickerMode != 4272 || self->_datePickerStyle == 3) {
    return self->_datePickerMode;
  }
  else {
    return 2;
  }
}

- (BOOL)followsSystemHourCycle
{
  return self->_locale == 0;
}

- (id)createDatePickerRepresentingDataModel
{
  int64_t v3 = [(_UIDatePickerDataModel *)self datePickerMode];
  int64_t v4 = [(_UIDatePickerDataModel *)self datePickerStyle];
  return [(_UIDatePickerDataModel *)self createDatePickerRepresentingDataModelForMode:v3 style:v4];
}

- (id)createDatePickerRepresentingDataModelForMode:(int64_t)a3 style:(int64_t)a4
{
  objc_super v7 = objc_opt_new();
  [v7 setDatePickerMode:a3];
  [v7 setPreferredDatePickerStyle:a4];
  uint64_t v8 = [(_UIDatePickerDataModel *)self calendar];
  [v7 setCalendar:v8];

  uint64_t v9 = [(_UIDatePickerDataModel *)self locale];
  [v7 setLocale:v9];

  uint64_t v10 = [(_UIDatePickerDataModel *)self timeZone];
  [v7 setTimeZone:v10];

  uint64_t v11 = [(_UIDatePickerDataModel *)self minimumDate];
  [v7 setMinimumDate:v11];

  uint64_t v12 = [(_UIDatePickerDataModel *)self maximumDate];
  [v7 setMaximumDate:v12];

  v13 = [(_UIDatePickerDataModel *)self effectiveDate];
  [v7 setDate:v13];

  objc_msgSend(v7, "setMinuteInterval:", -[_UIDatePickerDataModel minuteInterval](self, "minuteInterval"));
  v14 = [(_UIDatePickerDataModel *)self customFontDesign];
  [v7 _setCustomFontDesign:v14];

  objc_msgSend(v7, "setRoundsToMinuteInterval:", -[_UIDatePickerDataModel roundsToMinuteInterval](self, "roundsToMinuteInterval"));
  return v7;
}

- (int64_t)datePickerStyle
{
  return self->_datePickerStyle;
}

- (void)setDatePickerMode:(int64_t)a3
{
  self->_datePickerMode = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDateComponents)lastSelectedDateComponents
{
  return self->_lastSelectedDateComponents;
}

- (_UIDatePickerDateRange)dateRange
{
  return self->_dateRange;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (BOOL)roundsToMinuteInterval
{
  return self->_roundsToMinuteInterval;
}

- (void)setRoundsToMinuteInterval:(BOOL)a3
{
  self->_roundsToMinuteInterval = a3;
}

- (NSString)customFontDesign
{
  return self->_customFontDesign;
}

- (void)setCustomFontDesign:(id)a3
{
}

- (UIColor)customTextColor
{
  return self->_customTextColor;
}

- (void)setCustomTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTextColor, 0);
  objc_storeStrong((id *)&self->_customFontDesign, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_lastSelectedDateComponents, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lastSelectedDateComponentsCalendar, 0);
  objc_storeStrong((id *)&self->_chineseWrapperCalendar, 0);
  objc_storeStrong((id *)&self->_effectiveCalendar, 0);
  objc_storeStrong((id *)&self->_effectiveLocale, 0);
}

@end