@interface _UIDatePickerCalendarDateComponent
+ (id)inlineDescriptionForComponents:(id)a3;
+ (unint64_t)representedCalendarUnits;
- (BOOL)isEqual:(id)a3;
- (NSCalendar)calendar;
- (NSDate)date;
- (NSDateComponents)components;
- (_UIDatePickerCalendarDateComponent)initWithDate:(id)a3 calendar:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIDatePickerCalendarDateComponent

+ (unint64_t)representedCalendarUnits
{
  return 2;
}

+ (id)inlineDescriptionForComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 representedCalendarUnits];
  v6 = objc_opt_new();
  for (uint64_t i = 1; i != 64; ++i)
  {
    if (((1 << i) & v5) != 0)
    {
      uint64_t v8 = objc_msgSend(v4, "valueForComponent:");
      v9 = [NSNumber numberWithInteger:v8];
      [v6 addObject:v9];
    }
  }
  v10 = [v6 componentsJoinedByString:@"-"];

  return v10;
}

- (_UIDatePickerCalendarDateComponent)initWithDate:(id)a3 calendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarDateComponent.m", 105, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarDateComponent.m", 106, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)_UIDatePickerCalendarDateComponent;
  v10 = [(_UIDatePickerCalendarDateComponent *)&v20 init];
  if (v10)
  {
    v11 = (void *)[v9 copy];

    uint64_t v12 = [(id)objc_opt_class() representedCalendarUnits];
    id v9 = v11;
    v13 = [v9 components:v12 fromDate:v7];
    v14 = [v9 dateFromComponents:v13];

    uint64_t v15 = [v9 components:v12 | 0x100000 fromDate:v14];
    components = v10->_components;
    v10->_components = (NSDateComponents *)v15;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  uint64_t v5 = [(NSDateComponents *)self->_components copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSDate *)self->_date copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (unint64_t)hash
{
  return [(NSDateComponents *)self->_components hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIDatePickerCalendarDateComponent *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 {
         && [(_UIDatePickerCalendarDateComponent *)self isMemberOfClass:objc_opt_class()])
  }
  {
    char v6 = [(NSDateComponents *)self->_components isEqual:v5->_components];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [(_UIDatePickerCalendarDateComponent *)self calendar];
  uint64_t v7 = [v6 description];
  id v8 = [(id)objc_opt_class() inlineDescriptionForComponents:self->_components];
  id v9 = [v3 stringWithFormat:@"<%@: %p; calendar: %@; components: %@>", v5, self, v7, v8];

  return v9;
}

- (NSDateComponents)components
{
  v2 = (void *)[(NSDateComponents *)self->_components copy];
  return (NSDateComponents *)v2;
}

- (NSDate)date
{
  date = self->_date;
  if (!date)
  {
    id v4 = [(NSDateComponents *)self->_components date];
    if (!v4)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[_UIDatePickerCalendarDateComponent date]"];
      [v7 handleFailureInFunction:v8, @"_UIDatePickerCalendarDateComponent.m", 164, @"Invalid parameter not satisfying: %@", @"date" file lineNumber description];
    }
    uint64_t v5 = self->_date;
    self->_date = v4;

    date = self->_date;
  }
  return date;
}

- (NSCalendar)calendar
{
  id v4 = [(NSDateComponents *)self->_components calendar];
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarDateComponent.m", 173, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];
  }
  uint64_t v5 = (void *)[v4 copy];

  return (NSCalendar *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end