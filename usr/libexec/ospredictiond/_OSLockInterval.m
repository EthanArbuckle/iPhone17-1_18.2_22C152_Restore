@interface _OSLockInterval
- (BOOL)hasReasonableDuration;
- (BOOL)isLocked;
- (_OSLockInterval)initWithStartDate:(id)a3 andEndDate:(id)a4 andIsLocked:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIsLocked:(BOOL)a3;
@end

@implementation _OSLockInterval

- (_OSLockInterval)initWithStartDate:(id)a3 andEndDate:(id)a4 andIsLocked:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_OSLockInterval;
  v10 = [(_OSLockInterval *)&v17 init];
  v11 = v10;
  if (v10)
  {
    [(_OSIInterval *)v10 setStartDate:v8];
    [(_OSIInterval *)v11 setEndDate:v9];
    [(_OSLockInterval *)v11 setIsLocked:v5];
    v12 = [(_OSIInterval *)v11 endDate];
    v13 = [(_OSIInterval *)v11 startDate];
    [v12 timeIntervalSinceDate:v13];
    -[_OSIInterval setDuration:](v11, "setDuration:");
  }
  if ([(_OSIInterval *)v11 isValidInterval]) {
    v14 = v11;
  }
  else {
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

- (BOOL)hasReasonableDuration
{
  [(_OSIInterval *)self duration];
  if (v3 < 60.0) {
    return 0;
  }
  [(_OSIInterval *)self duration];
  return v5 <= 86400.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_OSLockInterval;
  id v4 = [(_OSIInterval *)&v6 copyWithZone:a3];
  [v4 setIsLocked:-[_OSLockInterval isLocked](self, "isLocked")];
  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_OSLockInterval;
  double v3 = [(_OSIInterval *)&v8 description];
  unsigned int v4 = [(_OSLockInterval *)self isLocked];
  CFStringRef v5 = @"N";
  if (v4) {
    CFStringRef v5 = @"Y";
  }
  objc_super v6 = +[NSString stringWithFormat:@"[Locked=%@] %@", v5, v3];

  return v6;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

@end