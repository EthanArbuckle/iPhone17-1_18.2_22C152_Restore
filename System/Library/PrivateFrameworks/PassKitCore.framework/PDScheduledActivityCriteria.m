@interface PDScheduledActivityCriteria
+ (BOOL)supportsSecureCoding;
+ (id)maintenanceActivityCriteriaWithStartDate:(id)a3;
+ (id)priorityActivityCriteriaWithStartDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScheduledAcivityCriteria:(id)a3;
- (BOOL)isRepeating;
- (BOOL)requireMainsPower;
- (BOOL)requireNetworkConnectivity;
- (BOOL)requireScreenSleep;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)reason;
- (PDScheduledActivityCriteria)init;
- (PDScheduledActivityCriteria)initWithCoder:(id)a3;
- (PDScheduledActivityCriteria)initWithPriorityKey:(id)a3 gracePeriod:(int64_t)a4 startDate:(id)a5;
- (double)repeatInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)xpcActivityCriteria;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setReason:(id)a3;
- (void)setRepeatInterval:(double)a3;
- (void)setRepeating:(BOOL)a3;
- (void)setRequireMainsPower:(BOOL)a3;
- (void)setRequireNetworkConnectivity:(BOOL)a3;
- (void)setRequireScreenSleep:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PDScheduledActivityCriteria

+ (id)priorityActivityCriteriaWithStartDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142E0]];
  v7 = (void *)[v5 initWithPriorityKey:v6 gracePeriod:1 startDate:v4];

  return v7;
}

+ (id)maintenanceActivityCriteriaWithStartDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v7 = (void *)[v5 initWithPriorityKey:v6 gracePeriod:5 startDate:v4];

  return v7;
}

- (PDScheduledActivityCriteria)init
{
  v3 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  id v4 = [(PDScheduledActivityCriteria *)self initWithPriorityKey:v3 gracePeriod:5 startDate:0];

  return v4;
}

- (PDScheduledActivityCriteria)initWithPriorityKey:(id)a3 gracePeriod:(int64_t)a4 startDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PDScheduledActivityCriteria;
  v10 = [(PDScheduledActivityCriteria *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    priorityKey = v10->_priorityKey;
    v10->_priorityKey = (NSString *)v11;

    v10->_gracePeriod = a4;
    objc_storeStrong((id *)&v10->_startDate, a5);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDScheduledActivityCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDScheduledActivityCriteria;
  id v5 = [(PDScheduledActivityCriteria *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
    priorityKey = v5->_priorityKey;
    v5->_priorityKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v5->_requireMainsPower = [v4 decodeBoolForKey:@"requireMainsPower"];
    v5->_requireScreenSleep = [v4 decodeBoolForKey:@"requireScreenSleep"];
    v5->_requireNetworkConnectivity = [v4 decodeBoolForKey:@"requireNetworkConnectivity"];
    v5->_repeating = [v4 decodeBoolForKey:@"repeating"];
    v5->_repeatInterval = (double)[v4 decodeIntegerForKey:@"repeatInterval"];
    v5->_gracePeriod = [v4 decodeInt64ForKey:@"gracePeriod"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  priorityKey = self->_priorityKey;
  id v5 = a3;
  [v5 encodeObject:priorityKey forKey:@"priority"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeBool:self->_requireMainsPower forKey:@"requireMainsPower"];
  [v5 encodeBool:self->_requireScreenSleep forKey:@"requireScreenSleep"];
  [v5 encodeBool:self->_requireNetworkConnectivity forKey:@"requireNetworkConnectivity"];
  [v5 encodeBool:self->_repeating forKey:@"repeating"];
  [v5 encodeInteger:(uint64_t)self->_repeatInterval forKey:@"repeatInterval"];
  [v5 encodeInt64:self->_gracePeriod forKey:@"gracePeriod"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PDScheduledActivityCriteria allocWithZone:](PDScheduledActivityCriteria, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_priorityKey copyWithZone:a3];
  priorityKey = v5->_priorityKey;
  v5->_priorityKey = (NSString *)v6;

  uint64_t v8 = [(NSDate *)self->_startDate copyWithZone:a3];
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v8;

  uint64_t v10 = [(NSDate *)self->_endDate copyWithZone:a3];
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v10;

  v5->_requireMainsPower = self->_requireMainsPower;
  v5->_requireScreenSleep = self->_requireScreenSleep;
  v5->_requireNetworkConnectivity = self->_requireNetworkConnectivity;
  v5->_repeating = self->_repeating;
  v5->_repeatInterval = self->_repeatInterval;
  v5->_gracePeriod = self->_gracePeriod;
  uint64_t v12 = [(NSString *)self->_reason copyWithZone:a3];
  reason = v5->_reason;
  v5->_reason = (NSString *)v12;

  return v5;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; \n", objc_opt_class(), self];
  [v3 appendFormat:@"priorityKey: '%@'; ", self->_priorityKey];
  [v3 appendFormat:@"startDate: '%@'; ", self->_startDate];
  [v3 appendFormat:@"endDate: '%@'; ", self->_endDate];
  if (self->_requireMainsPower) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"requireMainsPower: '%@'; ", v4];
  if (self->_requireScreenSleep) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"requireScreenSleep: '%@'; ", v5];
  if (self->_requireNetworkConnectivity) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"requireNetworkConnectivity: '%@'; ", v6];
  if (self->_repeating) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"repeating: '%@'; ", v7];
  objc_msgSend(v3, "appendFormat:", @"repeatInterval: '%ld'; ", (uint64_t)self->_repeatInterval);
  objc_msgSend(v3, "appendFormat:", @"endDate: '%ld'; ", self->_gracePeriod);
  [v3 appendFormat:@"reason: '%@'; ", self->_reason];
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_priorityKey];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_reason];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_requireMainsPower - v4 + 32 * v4;
  uint64_t v6 = self->_requireScreenSleep - v5 + 32 * v5;
  uint64_t v7 = self->_requireNetworkConnectivity - v6 + 32 * v6;
  uint64_t v8 = self->_repeating - v7 + 32 * v7;
  unint64_t v9 = (unint64_t)self->_repeatInterval - v8 + 32 * v8;
  unint64_t v10 = self->_gracePeriod - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PDScheduledActivityCriteria *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PDScheduledActivityCriteria *)self isEqualToScheduledAcivityCriteria:v5];

  return v6;
}

- (BOOL)isEqualToScheduledAcivityCriteria:(id)a3
{
  uint64_t v4 = (double *)a3;
  priorityKey = self->_priorityKey;
  BOOL v6 = (NSString *)*((void *)v4 + 1);
  if (priorityKey) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (priorityKey != v6) {
      goto LABEL_28;
    }
  }
  else if ((-[NSString isEqual:](priorityKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_28;
  }
  startDate = self->_startDate;
  unint64_t v9 = (NSDate *)*((void *)v4 + 4);
  if (startDate && v9)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_28;
    }
  }
  else if (startDate != v9)
  {
    goto LABEL_28;
  }
  endDate = self->_endDate;
  uint64_t v11 = (NSDate *)*((void *)v4 + 5);
  if (!endDate || !v11)
  {
    if (endDate == v11) {
      goto LABEL_19;
    }
LABEL_28:
    char v14 = 0;
    goto LABEL_29;
  }
  if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0) {
    goto LABEL_28;
  }
LABEL_19:
  if (self->_requireMainsPower != *((unsigned __int8 *)v4 + 24)
    || self->_requireScreenSleep != *((unsigned __int8 *)v4 + 25)
    || self->_requireNetworkConnectivity != *((unsigned __int8 *)v4 + 26)
    || self->_repeating != *((unsigned __int8 *)v4 + 27)
    || self->_repeatInterval != v4[6]
    || self->_gracePeriod != *((void *)v4 + 2))
  {
    goto LABEL_28;
  }
  reason = self->_reason;
  v13 = (NSString *)*((void *)v4 + 7);
  if (reason && v13) {
    char v14 = -[NSString isEqual:](reason, "isEqual:");
  }
  else {
    char v14 = reason == v13;
  }
LABEL_29:

  return v14;
}

- (id)xpcActivityCriteria
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], !self->_requireMainsPower);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14340], self->_requireScreenSleep);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14338], self->_requireNetworkConnectivity);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8], self->_repeating);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], [(NSString *)self->_priorityKey UTF8String]);
    uint64_t v5 = (const char *)*MEMORY[0x1E4F14170];
    [(NSDate *)self->_startDate timeIntervalSinceNow];
    if (v6 <= 0.0)
    {
      int64_t v8 = 0;
    }
    else
    {
      [(NSDate *)self->_startDate timeIntervalSinceNow];
      int64_t v8 = (uint64_t)v7;
    }
    xpc_dictionary_set_int64(v4, v5, v8);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141A8], self->_gracePeriod);
    if (self->_repeating)
    {
      double repeatInterval = self->_repeatInterval;
      if (repeatInterval > 0.0) {
        xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], (uint64_t)repeatInterval);
      }
    }
  }
  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)requireMainsPower
{
  return self->_requireMainsPower;
}

- (void)setRequireMainsPower:(BOOL)a3
{
  self->_requireMainsPower = a3;
}

- (BOOL)requireScreenSleep
{
  return self->_requireScreenSleep;
}

- (void)setRequireScreenSleep:(BOOL)a3
{
  self->_requireScreenSleep = a3;
}

- (BOOL)requireNetworkConnectivity
{
  return self->_requireNetworkConnectivity;
}

- (void)setRequireNetworkConnectivity:(BOOL)a3
{
  self->_requireNetworkConnectivity = a3;
}

- (BOOL)isRepeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->_double repeatInterval = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_priorityKey, 0);
}

@end