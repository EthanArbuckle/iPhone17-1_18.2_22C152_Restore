@interface PAOngoingAccessRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PAAccess)access;
- (PAOngoingAccessRecord)initWithAccess:(id)a3 startTime:(double)a4;
- (PAOngoingAccessRecord)initWithCoder:(id)a3;
- (double)startTime;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PAOngoingAccessRecord

- (PAOngoingAccessRecord)initWithAccess:(id)a3 startTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAOngoingAccessRecord;
  v8 = [(PAOngoingAccessRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_access, a3);
    v9->_startTime = a4;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  access = self->_access;
  v6 = [NSNumber numberWithDouble:self->_startTime];
  id v7 = [v3 stringWithFormat:@"<%@ access:<%@> startTime:%@>", v4, access, v6];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PAAccess *)self->_access hash];
  uint64_t v4 = [NSNumber numberWithDouble:self->_startTime];
  unint64_t v5 = [v4 hash] - v3 + 32 * v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PAOngoingAccessRecord *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if ([(PAOngoingAccessRecord *)v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t v5 = v4;
    access = self->_access;
    id v7 = [(PAOngoingAccessRecord *)v5 access];
    if ([(PAAccess *)access isEqual:v7])
    {
      double startTime = self->_startTime;
      [(PAOngoingAccessRecord *)v5 startTime];
      BOOL v10 = startTime == v9;
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
  [v5 encodeDouble:@"startTime" forKey:self->_startTime];
}

- (PAOngoingAccessRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"access"];
  [v4 decodeDoubleForKey:@"startTime"];
  double v7 = v6;

  v8 = [(PAOngoingAccessRecord *)self initWithAccess:v5 startTime:v7];
  return v8;
}

- (PAAccess)access
{
  return self->_access;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
}

@end