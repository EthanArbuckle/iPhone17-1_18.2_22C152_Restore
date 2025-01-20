@interface SMSessionTime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)timeBound;
- (SMSessionTime)initWithCoder:(id)a3;
- (SMSessionTime)initWithDictionary:(id)a3;
- (SMSessionTime)initWithTimeBound:(id)a3;
- (id)description;
- (id)outputToDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionTime

- (SMSessionTime)initWithTimeBound:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMSessionTime;
  v6 = [(SMSessionTime *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timeBound, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionTime)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimeBound"];

  v6 = [(SMSessionTime *)self initWithTimeBound:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  v2 = [(SMSessionTime *)self timeBound];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMSessionTime *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SMSessionTime *)self timeBound];
      [v6 timeIntervalSince1970];
      double v8 = v7;
      objc_super v9 = [(SMSessionTime *)v5 timeBound];

      [v9 timeIntervalSince1970];
      BOOL v11 = v8 == v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (SMSessionTime)initWithDictionary:(id)a3
{
  id v4 = [a3 valueForKey:@"TimeBound"];
  id v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x263EFF910];
    [v4 doubleValue];
    double v7 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    double v8 = [[SMSessionTime alloc] initWithTimeBound:v7];
  }
  else
  {
    double v7 = 0;
    double v8 = 0;
  }

  return v8;
}

- (id)outputToDictionary
{
  unint64_t v3 = objc_opt_new();
  id v4 = NSNumber;
  id v5 = [(SMSessionTime *)self timeBound];
  [v5 timeIntervalSince1970];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v6 forKey:@"TimeBound"];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(SMSessionTime *)self timeBound];
  id v4 = [v3 stringFromDate];
  id v5 = [v2 stringWithFormat:@"timeBound, %@,", v4];

  return v5;
}

- (NSDate)timeBound
{
  return self->_timeBound;
}

- (void).cxx_destruct
{
}

@end