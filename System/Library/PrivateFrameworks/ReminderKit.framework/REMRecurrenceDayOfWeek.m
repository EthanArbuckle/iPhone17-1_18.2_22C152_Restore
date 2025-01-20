@interface REMRecurrenceDayOfWeek
+ (BOOL)supportsSecureCoding;
+ (id)dayOfWeek:(int64_t)a3;
+ (id)dayOfWeek:(int64_t)a3 weekNumber:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (REMRecurrenceDayOfWeek)initWithCoder:(id)a3;
- (REMRecurrenceDayOfWeek)initWithDayOfTheWeek:(int64_t)a3 weekNumber:(int64_t)a4;
- (id)description;
- (id)iCalendarDescription;
- (id)iCalendarValueFromDayOfTheWeek:(int64_t)a3;
- (int64_t)dayOfTheWeek;
- (int64_t)weekNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRecurrenceDayOfWeek

+ (id)dayOfWeek:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDayOfTheWeek:a3 weekNumber:0];

  return v3;
}

+ (id)dayOfWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDayOfTheWeek:a3 weekNumber:a4];

  return v4;
}

- (REMRecurrenceDayOfWeek)initWithDayOfTheWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  if (a3 < 1 || (int)a3 >= 8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid day number"];
  }
  v8.receiver = self;
  v8.super_class = (Class)REMRecurrenceDayOfWeek;
  result = [(REMRecurrenceDayOfWeek *)&v8 init];
  if (result)
  {
    result->_dayOfTheWeek = a3;
    result->_weekNumber = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRecurrenceDayOfWeek)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRecurrenceDayOfWeek;
  v5 = [(REMRecurrenceDayOfWeek *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"dayOfTheWeek"];
    if ((unint64_t)(v6 - 1) >= 7)
    {
      v7 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[REMRecurrenceDayOfWeek initWithCoder:](v6, v7);
      }

      uint64_t v6 = 1;
    }
    v5->_dayOfTheWeek = v6;
    v5->_weekNumber = [v4 decodeIntegerForKey:@"weekNumber"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek"), @"dayOfTheWeek");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceDayOfWeek weekNumber](self, "weekNumber"), @"weekNumber");
}

- (id)iCalendarValueFromDayOfTheWeek:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return &stru_1F1339A18;
  }
  else {
    return off_1E61DBE28[a3 - 1];
  }
}

- (id)iCalendarDescription
{
  if ([(REMRecurrenceDayOfWeek *)self weekNumber])
  {
    v3 = NSString;
    int64_t v4 = [(REMRecurrenceDayOfWeek *)self weekNumber];
    v5 = [(REMRecurrenceDayOfWeek *)self iCalendarValueFromDayOfTheWeek:[(REMRecurrenceDayOfWeek *)self dayOfTheWeek]];
    uint64_t v6 = [v3 stringWithFormat:@"%ld%@", v4, v5];
  }
  else
  {
    uint64_t v6 = [(REMRecurrenceDayOfWeek *)self iCalendarValueFromDayOfTheWeek:[(REMRecurrenceDayOfWeek *)self dayOfTheWeek]];
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMRecurrenceDayOfWeek *)self iCalendarDescription];
  uint64_t v6 = [v3 stringWithFormat:@"%@ <0x%x> { %@ }", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = [(REMRecurrenceDayOfWeek *)self dayOfTheWeek];
  return [(REMRecurrenceDayOfWeek *)self weekNumber] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (REMRecurrenceDayOfWeek *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (int64_t v6 = [(REMRecurrenceDayOfWeek *)self dayOfTheWeek],
          v6 == [(REMRecurrenceDayOfWeek *)v4 dayOfTheWeek]))
    {
      int64_t v7 = [(REMRecurrenceDayOfWeek *)self weekNumber];
      BOOL v8 = v7 == [(REMRecurrenceDayOfWeek *)v4 weekNumber];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (int64_t)dayOfTheWeek
{
  return self->_dayOfTheWeek;
}

- (int64_t)weekNumber
{
  return self->_weekNumber;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMWeekday %ld", (uint8_t *)&v2, 0xCu);
}

@end