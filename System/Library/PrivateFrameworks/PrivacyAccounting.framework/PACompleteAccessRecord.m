@interface PACompleteAccessRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccessRecord:(id)a3;
- (NSString)description;
- (PAAccess)access;
- (PACompleteAccessRecord)initWithAccess:(id)a3 startTime:(double)a4 endTime:(double)a5;
- (PACompleteAccessRecord)initWithCoder:(id)a3;
- (double)duration;
- (double)endTime;
- (double)startTime;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PACompleteAccessRecord

- (PACompleteAccessRecord)initWithAccess:(id)a3 startTime:(double)a4 endTime:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PACompleteAccessRecord;
  v10 = [(PACompleteAccessRecord *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_access, a3);
    v11->_startTime = a4;
    v11->_endTime = a5;
  }

  return v11;
}

- (double)duration
{
  return self->_endTime - self->_startTime;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  access = self->_access;
  v6 = [NSNumber numberWithDouble:self->_startTime];
  v7 = [NSNumber numberWithDouble:self->_endTime];
  v8 = [v3 stringWithFormat:@"<%@ access:<%@> startTime:%@ endTime:%@>", v4, access, v6, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PAAccess *)self->_access hash];
  uint64_t v4 = [NSNumber numberWithDouble:self->_startTime];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  v6 = [NSNumber numberWithDouble:self->_endTime];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PACompleteAccessRecord *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(PACompleteAccessRecord *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(PACompleteAccessRecord *)self isEqualToAccessRecord:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAccessRecord:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v6 = [v4 access];
  if ([(PAAccess *)access isEqual:v6]
    && (double startTime = self->_startTime, [v4 startTime], startTime == v8))
  {
    double endTime = self->_endTime;
    [v4 endTime];
    BOOL v11 = endTime == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  access = self->_access;
  id v5 = a3;
  [v5 encodeObject:access forKey:@"access"];
  [v5 encodeDouble:@"startTime" forKey:self->_startTime];
  [v5 encodeDouble:@"endTime" forKey:self->_endTime];
}

- (PACompleteAccessRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"access"];
  [v4 decodeDoubleForKey:@"startTime"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"endTime"];
  double v9 = v8;

  double v10 = [(PACompleteAccessRecord *)self initWithAccess:v5 startTime:v7 endTime:v9];
  return v10;
}

- (PAAccess)access
{
  return self->_access;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
}

@end