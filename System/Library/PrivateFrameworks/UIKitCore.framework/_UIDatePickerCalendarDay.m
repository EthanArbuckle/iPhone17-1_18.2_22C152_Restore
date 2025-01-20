@interface _UIDatePickerCalendarDay
+ (unint64_t)representedCalendarUnits;
- (BOOL)isEqual:(id)a3;
- (BOOL)isToday;
- (_UIDatePickerCalendarDay)initWithDate:(id)a3 calendar:(id)a4;
- (_UIDatePickerCalendarDay)initWithDate:(id)a3 calendar:(id)a4 month:(id)a5 assignedMonth:(id)a6;
- (_UIDatePickerCalendarMonth)assignedMonth;
- (_UIDatePickerCalendarMonth)month;
- (id)copyWithAssignedMonth:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIDatePickerCalendarDay

+ (unint64_t)representedCalendarUnits
{
  return 30;
}

- (_UIDatePickerCalendarDay)initWithDate:(id)a3 calendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_UIDatePickerCalendarDateComponent *)[_UIDatePickerCalendarMonth alloc] initWithDate:v7 calendar:v6];
  v9 = [(_UIDatePickerCalendarDay *)self initWithDate:v7 calendar:v6 month:v8 assignedMonth:0];

  return v9;
}

- (_UIDatePickerCalendarDay)initWithDate:(id)a3 calendar:(id)a4 month:(id)a5 assignedMonth:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_UIDatePickerCalendarDay;
  v13 = [(_UIDatePickerCalendarDateComponent *)&v16 initWithDate:a3 calendar:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_month, a5);
    objc_storeStrong((id *)&v14->_assignedMonth, a6);
  }

  return v14;
}

- (id)copyWithAssignedMonth:(id)a3
{
  v4 = (_UIDatePickerCalendarMonth *)a3;
  if (self->_assignedMonth != v4)
  {
    v5 = (_UIDatePickerCalendarDay *)[(_UIDatePickerCalendarDay *)self copy];
    id v6 = self->_month;
    id v7 = v4;
    v8 = v7;
    if (v6 == v7)
    {
    }
    else
    {
      if (!v7 || !v6)
      {

        goto LABEL_11;
      }
      BOOL v9 = [(_UIDatePickerCalendarDateComponent *)v6 isEqual:v7];

      if (!v9) {
        goto LABEL_11;
      }
    }
    v8 = 0;
LABEL_11:
    objc_storeStrong((id *)&v5->_assignedMonth, v8);
    goto LABEL_12;
  }
  v5 = self;
LABEL_12:

  return v5;
}

- (BOOL)isToday
{
  v3 = [(NSDateComponents *)self->super._components calendar];
  v4 = [(_UIDatePickerCalendarDateComponent *)self date];
  char v5 = [v3 isDateInToday:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerCalendarDay;
  v4 = [(_UIDatePickerCalendarDateComponent *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_month);
  objc_storeStrong(v4 + 4, self->_assignedMonth);
  return v4;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarDay;
  unint64_t v3 = [(_UIDatePickerCalendarDateComponent *)&v7 hash];
  unint64_t v4 = [(_UIDatePickerCalendarDateComponent *)self->_month hash] ^ v3;
  assignedMonth = self->_assignedMonth;
  if (assignedMonth) {
    v4 ^= [(_UIDatePickerCalendarDateComponent *)assignedMonth hash];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerCalendarDay;
  if ([(_UIDatePickerCalendarDateComponent *)&v13 isEqual:v4])
  {
    char v5 = v4;
    if ([(_UIDatePickerCalendarDateComponent *)self->_month isEqual:v5[3]])
    {
      objc_super v6 = (void *)v5[4];
      objc_super v7 = self->_assignedMonth;
      v8 = v6;
      BOOL v9 = v8;
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else
      {
        if (v7) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          char v11 = 0;
        }
        else {
          char v11 = [(_UIDatePickerCalendarDateComponent *)v7 isEqual:v8];
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  objc_super v6 = [(id)objc_opt_class() inlineDescriptionForComponents:self->super._components];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; components: %@; month: %@; assignedMonth: %@>",
    v5,
    self,
    v6,
    self->_month,
  objc_super v7 = self->_assignedMonth);

  return v7;
}

- (_UIDatePickerCalendarMonth)month
{
  return self->_month;
}

- (_UIDatePickerCalendarMonth)assignedMonth
{
  return self->_assignedMonth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignedMonth, 0);
  objc_storeStrong((id *)&self->_month, 0);
}

@end