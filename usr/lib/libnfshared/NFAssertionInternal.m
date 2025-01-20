@interface NFAssertionInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NFAssertionInternal)initWithCoder:(id)a3;
- (NFAssertionInternal)initWithDictionary:(id)a3;
- (NSDate)assertionTime;
- (id)description;
- (id)sessionID;
- (int)pid;
- (unint64_t)assertionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFAssertionInternal

- (NFAssertionInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFAssertionInternal;
  v5 = [(NFAssertionInternal *)&v9 init];
  if (v5)
  {
    v5->_assertionType = [v4 decodeIntegerForKey:@"NFAssertionType"];
    v5->_pid = [v4 decodeInt32ForKey:@"NFAssertionPID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NFAssertionTime"];
    assertionTime = v5->_assertionTime;
    v5->_assertionTime = (NSDate *)v6;
  }
  return v5;
}

- (NFAssertionInternal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFAssertionInternal;
  v5 = [(NFAssertionInternal *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"NFAssertionType"];
    v5->_assertionType = [v6 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:@"NFAssertionPID"];
    v5->_pid = [v7 intValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"NFAssertionTime"];
    assertionTime = v5->_assertionTime;
    v5->_assertionTime = (NSDate *)v8;
  }
  return v5;
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)assertionType
{
  return self->_assertionType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)assertionTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t assertionType = self->_assertionType;
  id v5 = a3;
  [v5 encodeInteger:assertionType forKey:@"NFAssertionType"];
  [v5 encodeInt32:self->_pid forKey:@"NFAssertionPID"];
  [v5 encodeObject:self->_assertionTime forKey:@"NFAssertionTime"];
}

- (id)description
{
  unint64_t assertionType = self->_assertionType;
  if (assertionType > 6) {
    v3 = @"Unknown";
  }
  else {
    v3 = (__CFString *)*((void *)&off_1E65ABC50 + assertionType);
  }
  return (id)[NSString stringWithFormat:@"Assertion Type = %@ for PID %d, taken at %@", v3, self->_pid, self->_assertionTime];
}

- (id)sessionID
{
  if (self->_assertionType)
  {
    v2 = 0;
  }
  else
  {
    v3 = NSString;
    uint64_t pid = self->_pid;
    [(NSDate *)self->_assertionTime timeIntervalSinceReferenceDate];
    v2 = [v3 stringWithFormat:@"Assertion-PowerUp-%d-%lf", pid, v5];
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NFAssertionInternal *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t assertionType = self->_assertionType,
          assertionType == [(NFAssertionInternal *)v4 assertionType])
      && (int pid = self->_pid, pid == [(NFAssertionInternal *)v4 pid]))
    {
      assertionTime = self->_assertionTime;
      uint64_t v8 = [(NFAssertionInternal *)v4 assertionTime];
      char v9 = [(NSDate *)assertionTime isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_assertionType];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_pid];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(NSDate *)self->_assertionTime hash];

  return v7;
}

@end