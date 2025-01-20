@interface SCLScheduleTime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDateComponents)dateComponents;
- (SCLScheduleTime)init;
- (SCLScheduleTime)initWithCoder:(id)a3;
- (SCLScheduleTime)initWithHour:(unint64_t)a3 minute:(unint64_t)a4;
- (SCLScheduleTime)initWithScheduleTime:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)hour;
- (unint64_t)minute;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLScheduleTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLScheduleTime)init
{
  return [(SCLScheduleTime *)self initWithHour:0 minute:0];
}

- (SCLScheduleTime)initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SCLScheduleTime;
  result = [(SCLScheduleTime *)&v7 init];
  if (result)
  {
    result->_hour = a3;
    result->_minute = a4;
  }
  return result;
}

- (SCLScheduleTime)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCLScheduleTime;
  v5 = [(SCLScheduleTime *)&v7 init];
  if (v5)
  {
    v5->_minute = [v4 decodeIntegerForKey:@"minute"];
    v5->_hour = [v4 decodeIntegerForKey:@"hour"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t minute = self->_minute;
  id v5 = a3;
  [v5 encodeInteger:minute forKey:@"minute"];
  [v5 encodeInteger:self->_hour forKey:@"hour"];
}

- (SCLScheduleTime)initWithScheduleTime:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCLScheduleTime;
  id v5 = [(SCLScheduleTime *)&v7 init];
  if (v5)
  {
    v5->_unint64_t minute = [v4 minute];
    v5->_hour = [v4 hour];
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SCLMutableScheduleTime alloc];
  return [(SCLScheduleTime *)v4 initWithScheduleTime:self];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCLScheduleTime hour](self, "hour"));
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCLScheduleTime minute](self, "minute"));
  v8 = [v3 stringWithFormat:@"<%@ %p; %@:%@>", v5, self, v6, v7];

  return v8;
}

- (NSDateComponents)dateComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  objc_msgSend(v3, "setHour:", -[SCLScheduleTime hour](self, "hour"));
  objc_msgSend(v3, "setMinute:", -[SCLScheduleTime minute](self, "minute"));
  return (NSDateComponents *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 hour];
    if (v6 == [(SCLScheduleTime *)self hour])
    {
      uint64_t v7 = [v5 minute];
      BOOL v8 = v7 == [(SCLScheduleTime *)self minute];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCLScheduleTime *)self hour];
  return [(SCLScheduleTime *)self minute] ^ v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SCLScheduleTime *)self hour];
  if (v5 == [v4 hour])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCLScheduleTime minute](self, "minute"));
    uint64_t v7 = NSNumber;
    uint64_t v8 = [v4 minute];
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCLScheduleTime hour](self, "hour"));
    uint64_t v7 = NSNumber;
    uint64_t v8 = [v4 hour];
  }
  v9 = [v7 numberWithUnsignedInteger:v8];
  int64_t v10 = [v6 compare:v9];

  return v10;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

@end