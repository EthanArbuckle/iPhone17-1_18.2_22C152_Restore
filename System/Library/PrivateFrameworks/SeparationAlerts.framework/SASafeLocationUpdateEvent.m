@interface SASafeLocationUpdateEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastEvent;
- (NSDate)date;
- (NSString)description;
- (SASafeLocation)safeLocation;
- (SASafeLocationUpdateEvent)initWithCoder:(id)a3;
- (SASafeLocationUpdateEvent)initWithSafeLocation:(id)a3 eventType:(unint64_t)a4 lastEvent:(BOOL)a5 date:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)eventType;
- (void)description;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SASafeLocationUpdateEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASafeLocationUpdateEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"SASafeLocationUpdateEventSafeLocation"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"SASafeLocationUpdateEventType"];
  uint64_t v7 = [v4 decodeBoolForKey:@"SASafeLocationUpdateEventLast"];
  v8 = [v4 decodeObjectForKey:@"SASafeLocationUpdateEventDate"];

  v9 = [(SASafeLocationUpdateEvent *)self initWithSafeLocation:v5 eventType:v6 lastEvent:v7 date:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SASafeLocationUpdateEvent *)self safeLocation];
  [v4 encodeObject:v5 forKey:@"SASafeLocationUpdateEventSafeLocation"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SASafeLocationUpdateEvent eventType](self, "eventType"), @"SASafeLocationUpdateEventType");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASafeLocationUpdateEvent lastEvent](self, "lastEvent"), @"SASafeLocationUpdateEventLast");
  id v6 = [(SASafeLocationUpdateEvent *)self date];
  [v4 encodeObject:v6 forKey:@"SASafeLocationUpdateEventDate"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  id v6 = (void *)MEMORY[0x1D25F7C90]();
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SASafeLocationUpdateEvent allocWithZone:a3];
  v5 = [(SASafeLocationUpdateEvent *)self safeLocation];
  unint64_t v6 = [(SASafeLocationUpdateEvent *)self eventType];
  BOOL v7 = [(SASafeLocationUpdateEvent *)self lastEvent];
  id v8 = [(SASafeLocationUpdateEvent *)self date];
  v9 = [(SASafeLocationUpdateEvent *)v4 initWithSafeLocation:v5 eventType:v6 lastEvent:v7 date:v8];

  return v9;
}

- (SASafeLocationUpdateEvent)initWithSafeLocation:(id)a3 eventType:(unint64_t)a4 lastEvent:(BOOL)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SASafeLocationUpdateEvent;
  v12 = [(SASafeLocationUpdateEvent *)&v19 init];
  if (v12)
  {
    if (!v11)
    {
      v17 = 0;
      goto LABEL_8;
    }
    if (v10)
    {
      uint64_t v13 = [v10 copy];
      safeLocation = v12->_safeLocation;
      v12->_safeLocation = (SASafeLocation *)v13;
    }
    v12->_eventType = a4;
    v12->_lastEvent = a5;
    uint64_t v15 = [v11 copy];
    date = v12->_date;
    v12->_date = (NSDate *)v15;
  }
  v17 = v12;
LABEL_8:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SASafeLocationUpdateEvent *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = v6;
      id v8 = [(SASafeLocationUpdateEvent *)self safeLocation];
      v9 = [(SASafeLocationUpdateEvent *)v7 safeLocation];
      if (v8 == v9
        || ([(SASafeLocationUpdateEvent *)self safeLocation],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SASafeLocationUpdateEvent *)v7 safeLocation],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v11 = [(SASafeLocationUpdateEvent *)self eventType];
        if (v11 == [(SASafeLocationUpdateEvent *)v7 eventType]
          && (BOOL v12 = [(SASafeLocationUpdateEvent *)self lastEvent],
              v12 == [(SASafeLocationUpdateEvent *)v7 lastEvent]))
        {
          v14 = [(SASafeLocationUpdateEvent *)self date];
          uint64_t v15 = [(SASafeLocationUpdateEvent *)v7 date];
          if (v14 == (void *)v15)
          {

            char v10 = 1;
          }
          else
          {
            v16 = (void *)v15;
            v18 = [(SASafeLocationUpdateEvent *)self date];
            v17 = [(SASafeLocationUpdateEvent *)v7 date];
            char v10 = [v18 isEqual:v17];
          }
        }
        else
        {
          char v10 = 0;
        }
        if (v8 == v9) {
          goto LABEL_13;
        }
      }
      else
      {
        char v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (id)descriptionDictionary
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"EventType";
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v15[0] = v5;
  v14[1] = @"SASafeLocationUpdateEventSafeLocation";
  unint64_t v6 = [(SASafeLocationUpdateEvent *)self safeLocation];
  if (v6)
  {
    v2 = [(SASafeLocationUpdateEvent *)self safeLocation];
    BOOL v7 = [v2 description];
  }
  else
  {
    BOOL v7 = &stru_1F27F45F0;
  }
  v15[1] = v7;
  v14[2] = @"SASafeLocationUpdateEventType";
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASafeLocationUpdateEvent eventType](self, "eventType"));
  v15[2] = v8;
  v14[3] = @"SASafeLocationUpdateEventLast";
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SASafeLocationUpdateEvent lastEvent](self, "lastEvent"));
  v15[3] = v9;
  v14[4] = @"SASafeLocationUpdateEventDate";
  char v10 = [(SASafeLocationUpdateEvent *)self date];
  unint64_t v11 = [v10 getDateString];
  v15[4] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  if (v6)
  {
  }
  return v12;
}

- (NSString)description
{
  v2 = [(SASafeLocationUpdateEvent *)self descriptionDictionary];
  id v9 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v9];
  id v4 = v9;
  if (v4)
  {
    v5 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      -[SASafeLocationUpdateEvent description](v5);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  BOOL v7 = v6;

  return (NSString *)v7;
}

- (id)getDate
{
  return self->_date;
}

- (SASafeLocation)safeLocation
{
  return self->_safeLocation;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (BOOL)lastEvent
{
  return self->_lastEvent;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_safeLocation, 0);
}

- (void)description
{
  id v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D15FC000, v4, v5, "%@ instance failed to create description:%@", v6, v7, v8, v9, v10);
}

@end