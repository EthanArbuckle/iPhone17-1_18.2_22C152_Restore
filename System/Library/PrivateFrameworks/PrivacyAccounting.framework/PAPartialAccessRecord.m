@interface PAPartialAccessRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PAAccess)access;
- (PAPartialAccessRecord)initWithAccess:(id)a3 endTime:(double)a4;
- (PAPartialAccessRecord)initWithCoder:(id)a3;
- (double)endTime;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PAPartialAccessRecord

- (PAPartialAccessRecord)initWithAccess:(id)a3 endTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAPartialAccessRecord;
  v8 = [(PAPartialAccessRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_access, a3);
    v9->_endTime = a4;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  access = self->_access;
  v6 = [NSNumber numberWithDouble:self->_endTime];
  id v7 = [v3 stringWithFormat:@"<%@ access:<%@> endTime:%@>", v4, access, v6];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PAAccess *)self->_access hash];
  uint64_t v4 = [NSNumber numberWithDouble:self->_endTime];
  unint64_t v5 = [v4 hash] - v3 + 32 * v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PAPartialAccessRecord *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if ([(PAPartialAccessRecord *)v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t v5 = v4;
    access = self->_access;
    id v7 = [(PAPartialAccessRecord *)v5 access];
    if ([(PAAccess *)access isEqual:v7])
    {
      double endTime = self->_endTime;
      [(PAPartialAccessRecord *)v5 endTime];
      BOOL v10 = endTime == v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
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
  [v5 encodeDouble:@"endTime" forKey:self->_endTime];
}

- (PAPartialAccessRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"access"];
  [v4 decodeDoubleForKey:@"endTime"];
  double v7 = v6;

  v8 = [(PAPartialAccessRecord *)self initWithAccess:v5 endTime:v7];
  return v8;
}

- (PAAccess)access
{
  return self->_access;
}

- (double)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
}

@end