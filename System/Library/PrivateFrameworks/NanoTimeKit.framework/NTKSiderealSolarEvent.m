@interface NTKSiderealSolarEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithType:(int64_t)a3 degree:(double)a4;
+ (id)eventWithType:(int64_t)a3 time:(id)a4 degree:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)time;
- (NTKSiderealSolarEvent)initWithCoder:(id)a3;
- (double)angle;
- (double)degree;
- (id)debugNameForType:(int64_t)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKSiderealSolarEvent

+ (id)eventWithType:(int64_t)a3 time:(id)a4 degree:(double)a5
{
  v7 = (NSDate *)a4;
  v8 = objc_alloc_init(NTKSiderealSolarEvent);
  time = v8->_time;
  v8->_time = v7;
  v8->_type = a3;

  v8->_degree = a5;
  return v8;
}

+ (id)eventWithType:(int64_t)a3 degree:(double)a4
{
  v6 = objc_alloc_init(NTKSiderealSolarEvent);
  v6->_type = a3;
  v6->_degree = a4;
  return v6;
}

- (NTKSiderealSolarEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKSiderealSolarEvent;
  v5 = [(NTKSiderealSolarEvent *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    time = v5->_time;
    v5->_time = (NSDate *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v8 integerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"degree"];
    [v9 doubleValue];
    v5->_degree = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  time = self->_time;
  id v5 = a3;
  [v5 encodeObject:time forKey:@"time"];
  uint64_t v6 = [NSNumber numberWithInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"type"];

  id v7 = [NSNumber numberWithDouble:self->_degree];
  [v5 encodeObject:v7 forKey:@"degree"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)angle
{
  [(NTKSiderealSolarEvent *)self degree];
  CLKDegreesToRadians();
  return result;
}

- (double)degree
{
  return self->_degree;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NTKSiderealSolarEvent *)self debugNameForType:self->_type];
  time = self->_time;
  [(NTKSiderealSolarEvent *)self angle];
  id v7 = [v3 stringWithFormat:@"type: %@, time: %@, angle: %f", v4, time, v6];

  return v7;
}

- (id)debugNameForType:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return @"Day";
  }
  else {
    return off_1E62C9270[a3];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t type = self->_type;
    if (type == [v5 type]
      && self->_time
      && ([v5 time], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      time = self->_time;
      double v10 = [v5 time];
      char v11 = [v8 isDate:time equalToDate:v10 toUnitGranularity:64];
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

- (unint64_t)hash
{
  return self->_type;
}

- (NSDate)time
{
  return self->_time;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end