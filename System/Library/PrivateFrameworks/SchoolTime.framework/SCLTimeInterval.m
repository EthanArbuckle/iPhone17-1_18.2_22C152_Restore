@interface SCLTimeInterval
+ (BOOL)supportsSecureCoding;
- (BOOL)containsScheduleTime:(id)a3;
- (BOOL)crossesDayBoundary;
- (BOOL)intersectsTimeInterval:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SCLScheduleTime)endTime;
- (SCLScheduleTime)startTime;
- (SCLTimeInterval)initWithCoder:(id)a3;
- (SCLTimeInterval)initWithStartTime:(id)a3 endTime:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLTimeInterval

- (SCLTimeInterval)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCLTimeInterval;
  v8 = [(SCLTimeInterval *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    startTime = v8->_startTime;
    v8->_startTime = (SCLScheduleTime *)v9;

    uint64_t v11 = [v7 copy];
    endTime = v8->_endTime;
    v8->_endTime = (SCLScheduleTime *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLTimeInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLTimeInterval;
  v5 = [(SCLTimeInterval *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    startTime = v5->_startTime;
    v5->_startTime = (SCLScheduleTime *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
    endTime = v5->_endTime;
    v5->_endTime = (SCLScheduleTime *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startTime = self->_startTime;
  id v5 = a3;
  [v5 encodeObject:startTime forKey:@"startTime"];
  [v5 encodeObject:self->_endTime forKey:@"endTime"];
}

- (BOOL)crossesDayBoundary
{
  v3 = [(SCLTimeInterval *)self endTime];
  if ([v3 hour])
  {
  }
  else
  {
    id v4 = [(SCLTimeInterval *)self endTime];
    uint64_t v5 = [v4 minute];

    if (!v5) {
      return 0;
    }
  }
  uint64_t v6 = [(SCLTimeInterval *)self startTime];
  id v7 = [(SCLTimeInterval *)self endTime];
  BOOL v8 = [v6 compare:v7] == 1;

  return v8;
}

- (BOOL)containsScheduleTime:(id)a3
{
  id v4 = a3;
  if ([(SCLTimeInterval *)self crossesDayBoundary])
  {
    BOOL v5 = [(SCLScheduleTime *)self->_endTime compare:v4] == 1
      || [(SCLScheduleTime *)self->_startTime compare:v4] != 1;
  }
  else
  {
    uint64_t v6 = [(SCLTimeInterval *)self startTime];
    if ([v6 compare:v4] == 1)
    {
      BOOL v5 = 0;
    }
    else
    {
      id v7 = [(SCLTimeInterval *)self endTime];
      BOOL v5 = [v7 compare:v4] == 1;
    }
  }

  return v5;
}

- (BOOL)intersectsTimeInterval:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 startTime];
  BOOL v6 = [(SCLTimeInterval *)self containsScheduleTime:v5];

  if (!v6)
  {
    id v7 = [v4 endTime];
    BOOL v8 = [(SCLTimeInterval *)self containsScheduleTime:v7];

    uint64_t v9 = [(SCLTimeInterval *)self startTime];
    if (v8)
    {
      uint64_t v10 = [v4 endTime];
LABEL_8:
      v15 = (void *)v10;
      char v16 = [v9 isEqual:v10];

      char v12 = v16 ^ 1;
      goto LABEL_9;
    }
    int v11 = [v4 containsScheduleTime:v9];

    if ((v11 & 1) == 0)
    {
      v13 = [(SCLTimeInterval *)self endTime];
      int v14 = [v4 containsScheduleTime:v13];

      if (!v14)
      {
        char v12 = 0;
        goto LABEL_9;
      }
      uint64_t v9 = [(SCLTimeInterval *)self endTime];
      uint64_t v10 = [v4 startTime];
      goto LABEL_8;
    }
  }
  char v12 = 1;
LABEL_9:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCLTimeInterval *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      BOOL v6 = [(SCLTimeInterval *)self startTime];
      id v7 = [(SCLTimeInterval *)v5 startTime];
      if ([v6 isEqual:v7])
      {
        BOOL v8 = [(SCLTimeInterval *)self endTime];
        uint64_t v9 = [(SCLTimeInterval *)v5 endTime];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(SCLTimeInterval *)self startTime];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(SCLTimeInterval *)self endTime];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unint64_t v6 = [(SCLTimeInterval *)self startTime];
  uint64_t v7 = [v6 hour];
  BOOL v8 = [(SCLTimeInterval *)self startTime];
  uint64_t v9 = [v8 minute];
  char v10 = [(SCLTimeInterval *)self endTime];
  uint64_t v11 = [v10 hour];
  char v12 = [(SCLTimeInterval *)self endTime];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; %02d:%02d - %02d:%02d>",
    v5,
    self,
    v7,
    v9,
    v11,
  v13 = [v12 minute]);

  return v13;
}

- (SCLScheduleTime)startTime
{
  return self->_startTime;
}

- (SCLScheduleTime)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end