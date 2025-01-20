@interface _UICalendarDataModel
- (NSCalendar)calendar;
- (NSCalendar)effectiveCalendar;
- (NSDateInterval)availableDateRange;
- (NSLocale)effectiveLocale;
- (NSLocale)locale;
- (NSString)fontDesign;
- (NSTimeZone)effectiveTimeZone;
- (NSTimeZone)timeZone;
- (_UICalendarDataModel)init;
- (_UIDatePickerCalendarMonth)visibleMonth;
- (void)_deriveEffectiveLocaleAndCalendarIfNeeded;
- (void)setAvailableDateRange:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setFontDesign:(id)a3;
- (void)setLocale:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setVisibleMonth:(id)a3;
@end

@implementation _UICalendarDataModel

- (_UICalendarDataModel)init
{
  v13.receiver = self;
  v13.super_class = (Class)_UICalendarDataModel;
  v2 = [(_UICalendarDataModel *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    objc_storeStrong((id *)&v2->_fontDesign, *(id *)off_1E52D6B80);
    id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
    v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v10 = [v7 initWithStartDate:v8 endDate:v9];
    availableDateRange = v2->_availableDateRange;
    v2->_availableDateRange = (NSDateInterval *)v10;
  }
  return v2;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
  id v7 = a3;
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;

  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  id v6 = a3;
  effectiveLocale = self->_effectiveLocale;
  self->_effectiveLocale = 0;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
  id v6 = a3;
  effectiveCalendar = self->_effectiveCalendar;
  self->_effectiveCalendar = 0;
}

- (NSCalendar)effectiveCalendar
{
  [(_UICalendarDataModel *)self _deriveEffectiveLocaleAndCalendarIfNeeded];
  effectiveCalendar = self->_effectiveCalendar;
  return effectiveCalendar;
}

- (NSLocale)effectiveLocale
{
  [(_UICalendarDataModel *)self _deriveEffectiveLocaleAndCalendarIfNeeded];
  effectiveLocale = self->_effectiveLocale;
  return effectiveLocale;
}

- (NSTimeZone)effectiveTimeZone
{
  v2 = [(_UICalendarDataModel *)self effectiveCalendar];
  uint64_t v3 = [v2 timeZone];

  return (NSTimeZone *)v3;
}

- (_UIDatePickerCalendarMonth)visibleMonth
{
  if (!self->_effectiveCalendar
    || (uint64_t v3 = self->_visibleMonth) == 0
    || ([(_UIDatePickerCalendarDateComponent *)v3 calendar],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqual:self->_effectiveCalendar],
        v4,
        (v5 & 1) == 0))
  {
    visibleMonth = self->_visibleMonth;
    if (visibleMonth)
    {
      id v7 = [(_UIDatePickerCalendarDateComponent *)visibleMonth calendar];
      v8 = [v7 timeZone];
      v9 = [(_UICalendarDataModel *)self effectiveTimeZone];
      id v10 = v8;
      id v11 = v9;
      if (v10 == v11)
      {
      }
      else
      {
        v12 = v11;
        if (v10 && v11)
        {
          char v13 = [v10 isEqual:v11];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        v14 = [(_UIDatePickerCalendarDateComponent *)self->_visibleMonth components];
        v15 = [(_UICalendarDataModel *)self effectiveTimeZone];
        [v14 setTimeZone:v15];

        v16 = [v14 date];

        if (v16)
        {
LABEL_17:
          v20 = [_UIDatePickerCalendarMonth alloc];
          v21 = [(_UICalendarDataModel *)self effectiveCalendar];
          v22 = [(_UIDatePickerCalendarDateComponent *)v20 initWithDate:v16 calendar:v21];
          v23 = self->_visibleMonth;
          self->_visibleMonth = v22;

          goto LABEL_18;
        }
      }
    }
LABEL_13:
    v17 = [(_UIDatePickerCalendarDateComponent *)self->_visibleMonth date];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1C9C8] now];
    }
    v16 = v19;

    goto LABEL_17;
  }
LABEL_18:
  v24 = self->_visibleMonth;
  return v24;
}

- (void)_deriveEffectiveLocaleAndCalendarIfNeeded
{
  if (!self->_effectiveLocale || !self->_effectiveCalendar)
  {
    uint64_t v3 = [(_UICalendarDataModel *)self locale];
    v4 = [(_UICalendarDataModel *)self calendar];
    char v5 = (NSCalendar *)[v4 copy];

    id v6 = [(NSCalendar *)v5 locale];
    char v7 = [v6 isEqual:v3];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(NSCalendar *)v5 firstWeekday];
      [(NSCalendar *)v5 setLocale:v3];
      [(NSCalendar *)v5 setFirstWeekday:v8];
    }
    if (self->_timeZone) {
      -[NSCalendar setTimeZone:](v5, "setTimeZone:");
    }
    effectiveCalendar = self->_effectiveCalendar;
    self->_effectiveCalendar = v5;
    id v11 = v5;

    effectiveLocale = self->_effectiveLocale;
    self->_effectiveLocale = v3;
  }
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

- (void)setVisibleMonth:(id)a3
{
}

- (NSDateInterval)availableDateRange
{
  return self->_availableDateRange;
}

- (void)setAvailableDateRange:(id)a3
{
}

- (NSString)fontDesign
{
  return self->_fontDesign;
}

- (void)setFontDesign:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDesign, 0);
  objc_storeStrong((id *)&self->_availableDateRange, 0);
  objc_storeStrong((id *)&self->_visibleMonth, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_effectiveLocale, 0);
  objc_storeStrong((id *)&self->_effectiveCalendar, 0);
}

@end