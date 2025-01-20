@interface ICSByDayValue
+ (BOOL)supportsSecureCoding;
+ (id)byDayValueFromICSString:(id)a3;
+ (int64_t)weekdayFromICSString:(id)a3;
- (ICSByDayValue)initWithCoder:(id)a3;
- (ICSByDayValue)initWithWeekday:(int64_t)a3;
- (ICSByDayValue)initWithWeekday:(int64_t)a3 number:(id)a4;
- (NSNumber)number;
- (int64_t)compare:(id)a3;
- (int64_t)weekday;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setNumber:(id)a3;
- (void)setWeekday:(int64_t)a3;
@end

@implementation ICSByDayValue

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v9 = a4;
  v5 = [(ICSByDayValue *)self number];

  if (v5)
  {
    v6 = [(ICSByDayValue *)self number];
    objc_msgSend(v9, "appendFormat:", @"%d", objc_msgSend(v6, "integerValue"));
  }
  unint64_t v7 = [(ICSByDayValue *)self weekday] - 1;
  if (v7 > 6) {
    v8 = @"ERROR";
  }
  else {
    v8 = off_1E6C25938[v7];
  }
  [v9 appendString:v8];
}

- (int64_t)compare:(id)a3
{
  v4 = (ICSByDayValue *)a3;
  uint64_t v5 = [(ICSByDayValue *)self number];
  if (v5
    && (v6 = (void *)v5,
        [(ICSByDayValue *)v4 number],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [(ICSByDayValue *)self number];
    id v9 = [(ICSByDayValue *)v4 number];
    int64_t v10 = [v8 compare:v9];
  }
  else if ([(ICSByDayValue *)self weekday] && [(ICSByDayValue *)v4 weekday])
  {
    unint64_t v11 = [(ICSByDayValue *)self weekday] - 1;
    if (v11 > 6) {
      v12 = @"ERROR";
    }
    else {
      v12 = off_1E6C25938[v11];
    }
    unint64_t v14 = [(ICSByDayValue *)v4 weekday] - 1;
    if (v14 > 6) {
      v15 = @"ERROR";
    }
    else {
      v15 = off_1E6C25938[v14];
    }
    int64_t v10 = [(__CFString *)v12 compare:v15];
  }
  else
  {
    uint64_t v13 = -1;
    if (self >= v4) {
      uint64_t v13 = 1;
    }
    if (self == v4) {
      int64_t v10 = 0;
    }
    else {
      int64_t v10 = v13;
    }
  }

  return v10;
}

+ (int64_t)weekdayFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SU"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"MO"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"TU"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"WE"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"TH"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"FR"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"SA"])
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (id)byDayValueFromICSString:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 2)
  {
    uint64_t v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 2);
    v6 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 2);
    int64_t v7 = +[ICSByDayValue weekdayFromICSString:v5];
    uint64_t v8 = [v6 intValue];
    if (v7 == -1 || (int)v8 >= 54)
    {
      NSLog(&cfstr_IcsbydayvalueI.isa, v3);
      int64_t v4 = 0;
    }
    else
    {
      if (v8)
      {
        id v9 = [NSNumber numberWithInt:v8];
      }
      else
      {
        id v9 = 0;
      }
      int64_t v4 = [[ICSByDayValue alloc] initWithWeekday:v7 number:v9];
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (ICSByDayValue)initWithWeekday:(int64_t)a3
{
  return [(ICSByDayValue *)self initWithWeekday:a3 number:0];
}

- (ICSByDayValue)initWithWeekday:(int64_t)a3 number:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICSByDayValue;
  int64_t v7 = [(ICSByDayValue *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(ICSByDayValue *)v7 setWeekday:a3];
    [(ICSByDayValue *)v8 setNumber:v6];
  }

  return v8;
}

- (NSNumber)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  int64_t v7 = (NSNumber *)a3;
  if ([(NSNumber *)v7 integerValue])
  {
    int64_t v4 = v7;
  }
  else
  {

    int64_t v4 = 0;
  }
  number = self->_number;
  p_number = &self->_number;
  if (number != v4) {
    objc_storeStrong((id *)p_number, v4);
  }
  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  number = self->_number;
  id v5 = a3;
  [v5 encodeObject:number forKey:@"Number"];
  [v5 encodeInteger:self->_weekday forKey:@"Weekday"];
}

- (ICSByDayValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSByDayValue;
  id v5 = [(ICSByDayValue *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Number"];
    [(ICSByDayValue *)v5 setNumber:v6];

    -[ICSByDayValue setWeekday:](v5, "setWeekday:", [v4 decodeIntegerForKey:@"Weekday"]);
  }

  return v5;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (void)setWeekday:(int64_t)a3
{
  self->_weekday = a3;
}

- (void).cxx_destruct
{
}

@end