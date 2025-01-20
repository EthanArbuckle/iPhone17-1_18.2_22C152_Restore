@interface REMAlarmTimeIntervalTrigger
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporal;
- (REMAlarmTimeIntervalTrigger)initWithCoder:(id)a3;
- (REMAlarmTimeIntervalTrigger)initWithObjectID:(id)a3 timeInterval:(double)a4;
- (REMAlarmTimeIntervalTrigger)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (id)_deepCopy;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation REMAlarmTimeIntervalTrigger

+ (id)cdEntityName
{
  return @"REMCDAlarmTimeIntervalTrigger";
}

- (REMAlarmTimeIntervalTrigger)initWithObjectID:(id)a3 timeInterval:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v5 = [(REMAlarmTrigger *)&v8 initWithObjectID:a3];
  v6 = v5;
  if (v5) {
    [(REMAlarmTimeIntervalTrigger *)v5 setTimeInterval:a4];
  }
  return v6;
}

- (REMAlarmTimeIntervalTrigger)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v4 = [(REMAlarmTrigger *)&v7 init];
  v5 = v4;
  if (v4) {
    [(REMAlarmTimeIntervalTrigger *)v4 setTimeInterval:a3];
  }
  return v5;
}

- (REMAlarmTimeIntervalTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REMAlarmTimeIntervalTrigger;
  v5 = [(REMAlarmTrigger *)&v7 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timeInterval"];
    -[REMAlarmTimeIntervalTrigger setTimeInterval:](v5, "setTimeInterval:");
  }

  return v5;
}

- (id)_deepCopy
{
  v3 = [REMAlarmTimeIntervalTrigger alloc];
  [(REMAlarmTimeIntervalTrigger *)self timeInterval];
  id v4 = -[REMAlarmTimeIntervalTrigger initWithTimeInterval:](v3, "initWithTimeInterval:");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(REMAlarmTimeIntervalTrigger *)self timeInterval];
    double v7 = v6;
    [v5 timeInterval];
    double v9 = v8;

    BOOL v10 = v7 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isTemporal
{
  return 1;
}

- (unint64_t)hash
{
  [(REMAlarmTimeIntervalTrigger *)self timeInterval];
  return (unint64_t)v2;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmTimeIntervalTrigger;
  id v4 = [(REMAlarmTimeIntervalTrigger *)&v8 description];
  [(REMAlarmTimeIntervalTrigger *)self timeInterval];
  double v6 = [v3 stringWithFormat:@"%@ %f", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAlarmTimeIntervalTrigger;
  id v4 = a3;
  [(REMAlarmTrigger *)&v5 encodeWithCoder:v4];
  [(REMAlarmTimeIntervalTrigger *)self timeInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeInterval");
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

@end