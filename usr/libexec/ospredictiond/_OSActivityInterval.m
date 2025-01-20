@interface _OSActivityInterval
- (BOOL)hasReasonableDuration;
- (BOOL)isActive;
- (_OSActivityInterval)initWithStartDate:(id)a3 andEndDate:(id)a4 andActiveStatus:(BOOL)a5;
- (_OSActivityInterval)initWithStartTime:(double)a3 andEndTime:(double)a4 andActiveStatus:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIsActive:(BOOL)a3;
@end

@implementation _OSActivityInterval

- (_OSActivityInterval)initWithStartTime:(double)a3 andEndTime:(double)a4 andActiveStatus:(BOOL)a5
{
  BOOL v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_OSActivityInterval;
  v8 = [(_OSActivityInterval *)&v16 init];
  if (v8)
  {
    v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
    [(_OSIInterval *)v8 setStartDate:v9];

    v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
    [(_OSIInterval *)v8 setEndDate:v10];

    [(_OSActivityInterval *)v8 setIsActive:v5];
    v11 = [(_OSIInterval *)v8 endDate];
    v12 = [(_OSIInterval *)v8 startDate];
    [v11 timeIntervalSinceDate:v12];
    -[_OSIInterval setDuration:](v8, "setDuration:");
  }
  if ([(_OSIInterval *)v8 isValidInterval]) {
    v13 = v8;
  }
  else {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (_OSActivityInterval)initWithStartDate:(id)a3 andEndDate:(id)a4 andActiveStatus:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v8 timeIntervalSinceReferenceDate];
  double v12 = v11;

  return [(_OSActivityInterval *)self initWithStartTime:v5 andEndTime:v10 andActiveStatus:v12];
}

- (BOOL)hasReasonableDuration
{
  [(_OSIInterval *)self duration];
  if (v3 < 30.0) {
    return 0;
  }
  [(_OSIInterval *)self duration];
  return v5 <= 604800.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_OSActivityInterval;
  id v4 = [(_OSIInterval *)&v6 copyWithZone:a3];
  [v4 setIsActive:-[_OSActivityInterval isActive](self, "isActive")];
  return v4;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

@end