@interface PCSMTT
+ (BOOL)supportsSecureCoding;
- (BOOL)returnedExistingIdentity;
- (NSDate)startTime;
- (NSMutableArray)completedPoints;
- (NSUUID)UUID;
- (NSUUID)parentUUID;
- (PCSMTT)init;
- (PCSMTT)initWithCoder:(id)a3;
- (PCSMTT)initWithMTT:(id)a3;
- (double)time;
- (id)description;
- (id)jsonDict;
- (id)measurePoint:(id)a3;
- (void)completePoint:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)measure:(id)a3 block:(id)a4;
- (void)measure:(id)a3 success:(BOOL)a4 time:(double)a5;
- (void)setCompletedPoints:(id)a3;
- (void)setReturnedExistingIdentity:(BOOL)a3;
- (void)setStartTime:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PCSMTT

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCSMTT)init
{
  v9.receiver = self;
  v9.super_class = (Class)PCSMTT;
  v2 = [(PCSMTT *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

    objc_storeStrong((id *)&v2->_parentUUID, v2->_UUID);
    uint64_t v5 = objc_opt_new();
    completedPoints = v2->_completedPoints;
    v2->_completedPoints = (NSMutableArray *)v5;

    [(PCSMTT *)v2 start];
    v7 = v2;
  }

  return v2;
}

- (PCSMTT)initWithMTT:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PCSMTT *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 UUID];
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v6;
  }
  return v5;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"[MTT:%@:%lf", self->_UUID, *(void *)&self->_time];
  if ([(NSMutableArray *)self->_completedPoints count])
  {
    [v3 appendString:@"<"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_completedPoints;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"%@", *(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [v3 appendString:@">"];
  }
  [v3 appendString:@"]"];
  return v3;
}

- (id)jsonDict
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(PCSMTT *)self completedPoints];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(PCSMTT *)self completedPoints];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) jsonDict];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }

  v23[0] = @"uuid";
  long long v12 = [(PCSMTT *)self UUID];
  long long v13 = [v12 UUIDString];
  v24[0] = v13;
  v23[1] = @"time";
  v14 = NSNumber;
  [(PCSMTT *)self time];
  uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  v24[1] = v15;
  v24[2] = v5;
  v23[2] = @"completedPoints";
  v23[3] = @"returnedExistingIdentity";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[PCSMTT returnedExistingIdentity](self, "returnedExistingIdentity"));
  v24[3] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v17;
}

- (void)start
{
  self->_startTime = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1F41817F8]();
}

- (void)stop
{
  if (self->_startTime)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_startTime];
    self->_time = v4 + self->_time;

    startTime = self->_startTime;
    self->_startTime = 0;
  }
}

- (void)measure:(id)a3 block:(id)a4
{
  uint64_t v6 = (uint64_t (**)(void))a4;
  id v8 = [(PCSMTT *)self measurePoint:a3];
  uint64_t v7 = v6[2](v6);

  [v8 complete:v7];
}

- (void)measure:(id)a3 success:(BOOL)a4 time:(double)a5
{
  BOOL v6 = a4;
  id v8 = [(PCSMTT *)self measurePoint:a3];
  [v8 complete:v6 time:a5];
  [(PCSMTT *)self completePoint:v8];
}

- (id)measurePoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PCSMTTPoint alloc] initWithMTT:self name:v4];

  return v5;
}

- (void)completePoint:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (completePoint__onceToken != -1) {
    dispatch_once(&completePoint__onceToken, &__block_literal_global_15);
  }
  uint64_t v5 = (void *)completePoint__log;
  if (os_log_type_enabled((os_log_t)completePoint__log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    uint64_t v7 = [(PCSMTT *)self UUID];
    id v8 = [(PCSMTT *)self parentUUID];
    uint64_t v9 = [v4 name];
    [v4 time];
    int v11 = 138413314;
    long long v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = [v4 success];
    _os_log_impl(&dword_1ACF98000, v6, OS_LOG_TYPE_DEFAULT, "measure:%@:%@:%@:%f:%d", (uint8_t *)&v11, 0x30u);
  }
  [(NSMutableArray *)self->_completedPoints addObject:v4];
}

uint64_t __24__PCSMTT_completePoint___block_invoke()
{
  completePoint__log = (uint64_t)os_log_create("PCSMTT", "PCSMTT");
  return MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_parentUUID forKey:@"parentUUID"];
  BOOL v6 = [NSNumber numberWithDouble:self->_time];
  [v5 encodeObject:v6 forKey:@"time"];

  [v5 encodeObject:self->_completedPoints forKey:@"points"];
  objc_msgSend(NSNumber, "numberWithBool:", -[PCSMTT returnedExistingIdentity](self, "returnedExistingIdentity"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"returnedExistingIdentity"];
}

- (PCSMTT)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PCSMTT *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentUUID"];
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    [v10 doubleValue];
    v5->_time = v11;

    long long v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"points"];
    completedPoints = v5->_completedPoints;
    v5->_completedPoints = (NSMutableArray *)v15;

    __int16 v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"returnedExistingIdentity"];
    -[PCSMTT setReturnedExistingIdentity:](v5, "setReturnedExistingIdentity:", [v17 BOOLValue]);

    uint64_t v18 = v5;
  }

  return v5;
}

- (BOOL)returnedExistingIdentity
{
  return self->_returnedExistingIdentity;
}

- (void)setReturnedExistingIdentity:(BOOL)a3
{
  self->_returnedExistingIdentity = a3;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSMutableArray)completedPoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletedPoints:(id)a3
{
}

- (NSUUID)parentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (double)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_completedPoints, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end