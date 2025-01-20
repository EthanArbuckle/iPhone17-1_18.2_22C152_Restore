@interface ICSDateTimeValue
+ (BOOL)supportsSecureCoding;
- (ICSDateTimeValue)initWithCoder:(id)a3;
- (ICSDateTimeValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5;
- (ICSDateTimeValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8;
- (id)components;
- (int)dateType;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)second;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICSDateTimeValue

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "appendFormat:", @"%.4d%.2d%.2dT%.2d%.2d%.2d", -[ICSDateValue year](self, "year"), -[ICSDateValue month](self, "month"), -[ICSDateValue day](self, "day"), -[ICSDateTimeValue hour](self, "hour"), -[ICSDateTimeValue minute](self, "minute"), -[ICSDateTimeValue second](self, "second"));
}

- (ICSDateTimeValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  return [(ICSDateTimeValue *)self initWithYear:a3 month:a4 day:a5 hour:0 minute:0 second:0];
}

- (ICSDateTimeValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8
{
  v12.receiver = self;
  v12.super_class = (Class)ICSDateTimeValue;
  result = [(ICSDateValue *)&v12 initWithYear:a3 month:a4 day:a5];
  if (result)
  {
    result->_hour = a6;
    result->_minute = a7;
    result->_second = a8;
  }
  return result;
}

- (id)components
{
  v5.receiver = self;
  v5.super_class = (Class)ICSDateTimeValue;
  v3 = [(ICSDateValue *)&v5 components];
  [v3 setHour:self->_hour];
  [v3 setMinute:self->_minute];
  [v3 setSecond:self->_second];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICSDateTimeValue;
  id v4 = a3;
  [(ICSDateValue *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_hour, @"Hour", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_minute forKey:@"Minute"];
  [v4 encodeInteger:self->_second forKey:@"Second"];
}

- (ICSDateTimeValue)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSDateTimeValue;
  id v3 = a3;
  id v4 = [(ICSDateValue *)&v7 initWithCoder:v3];
  v4->_hour = objc_msgSend(v3, "decodeIntegerForKey:", @"Hour", v7.receiver, v7.super_class);
  v4->_minute = [v3 decodeIntegerForKey:@"Minute"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"Second"];

  v4->_second = v5;
  return v4;
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (int)dateType
{
  return 5016;
}

@end