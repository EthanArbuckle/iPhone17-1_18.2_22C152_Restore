@interface _UIDatePickerCalendarMonth
+ (unint64_t)representedCalendarUnits;
- (_UIDatePickerCalendarMonth)nextMonth;
- (_UIDatePickerCalendarMonth)previousMonth;
- (id)_monthWithOffset:(int64_t)a3;
- (id)dayMatchingOrdinalDay:(id)a3;
- (id)dayWithDate:(id)a3 assignedMonth:(id)a4;
@end

@implementation _UIDatePickerCalendarMonth

+ (unint64_t)representedCalendarUnits
{
  return 14;
}

- (id)dayWithDate:(id)a3 assignedMonth:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [_UIDatePickerCalendarDay alloc];
  v9 = [(NSDateComponents *)self->super._components calendar];
  v10 = [(_UIDatePickerCalendarDay *)v8 initWithDate:v7 calendar:v9 month:self assignedMonth:v6];

  return v10;
}

- (id)dayMatchingOrdinalDay:(id)a3
{
  v4 = [a3 components];
  v5 = [(_UIDatePickerCalendarDateComponent *)self components];
  id v6 = [(_UIDatePickerCalendarDateComponent *)self calendar];
  id v7 = [(_UIDatePickerCalendarDateComponent *)self date];
  unint64_t v8 = [v6 rangeOfUnit:16 inUnit:8 forDate:v7];
  uint64_t v10 = v9;

  unint64_t v11 = [v4 day];
  unint64_t v12 = v10 + v8 - 1;
  if (v11 < v12) {
    unint64_t v12 = v11;
  }
  if (v8 <= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v8;
  }
  [v5 setDay:v13];
  v14 = [(_UIDatePickerCalendarDateComponent *)self calendar];
  v15 = [v14 dateFromComponents:v5];

  v16 = [(_UIDatePickerCalendarMonth *)self dayWithDate:v15 assignedMonth:0];

  return v16;
}

- (id)_monthWithOffset:(int64_t)a3
{
  if (a3)
  {
    v5 = [(NSDateComponents *)self->super._components calendar];
    id v6 = objc_opt_new();
    [v6 setMonth:a3];
    id v7 = [(_UIDatePickerCalendarDateComponent *)self date];
    unint64_t v8 = [v5 dateByAddingComponents:v6 toDate:v7 options:0];

    uint64_t v9 = [(_UIDatePickerCalendarDateComponent *)[_UIDatePickerCalendarMonth alloc] initWithDate:v8 calendar:v5];
  }
  else
  {
    uint64_t v9 = self;
  }
  return v9;
}

- (_UIDatePickerCalendarMonth)previousMonth
{
  previousMonth = self->_previousMonth;
  if (!previousMonth)
  {
    v4 = [(_UIDatePickerCalendarMonth *)self _monthWithOffset:-1];
    v5 = self->_previousMonth;
    self->_previousMonth = v4;

    previousMonth = self->_previousMonth;
  }
  return previousMonth;
}

- (_UIDatePickerCalendarMonth)nextMonth
{
  nextMonth = self->_nextMonth;
  if (!nextMonth)
  {
    v4 = [(_UIDatePickerCalendarMonth *)self _monthWithOffset:1];
    v5 = self->_nextMonth;
    self->_nextMonth = v4;

    nextMonth = self->_nextMonth;
  }
  return nextMonth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextMonth, 0);
  objc_storeStrong((id *)&self->_previousMonth, 0);
}

@end