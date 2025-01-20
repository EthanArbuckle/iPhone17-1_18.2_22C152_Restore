@interface SADeviceUpdateEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastEvent;
- (NSDate)date;
- (NSString)description;
- (SADevice)device;
- (SADeviceUpdateEvent)initWithCoder:(id)a3;
- (SADeviceUpdateEvent)initWithDevice:(id)a3 eventType:(unint64_t)a4 lastEvent:(BOOL)a5 date:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SADeviceUpdateEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADeviceUpdateEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"SADeviceUpdateEventDevice"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"SADeviceUpdateEventType"];
  uint64_t v7 = [v4 decodeBoolForKey:@"SADeviceUpdateEventLast"];
  v8 = [v4 decodeObjectForKey:@"SADeviceUpdateEventDate"];

  v9 = [(SADeviceUpdateEvent *)self initWithDevice:v5 eventType:v6 lastEvent:v7 date:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SADeviceUpdateEvent *)self device];
  [v4 encodeObject:v5 forKey:@"SADeviceUpdateEventDevice"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SADeviceUpdateEvent eventType](self, "eventType"), @"SADeviceUpdateEventType");
  objc_msgSend(v4, "encodeBool:forKey:", -[SADeviceUpdateEvent lastEvent](self, "lastEvent"), @"SADeviceUpdateEventLast");
  id v6 = [(SADeviceUpdateEvent *)self date];
  [v4 encodeObject:v6 forKey:@"SADeviceUpdateEventDate"];
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
  id v4 = +[SADeviceUpdateEvent allocWithZone:a3];
  v5 = [(SADeviceUpdateEvent *)self device];
  unint64_t v6 = [(SADeviceUpdateEvent *)self eventType];
  BOOL v7 = [(SADeviceUpdateEvent *)self lastEvent];
  id v8 = [(SADeviceUpdateEvent *)self date];
  v9 = [(SADeviceUpdateEvent *)v4 initWithDevice:v5 eventType:v6 lastEvent:v7 date:v8];

  return v9;
}

- (SADeviceUpdateEvent)initWithDevice:(id)a3 eventType:(unint64_t)a4 lastEvent:(BOOL)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SADeviceUpdateEvent;
  v12 = [(SADeviceUpdateEvent *)&v19 init];
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
      device = v12->_device;
      v12->_device = (SADevice *)v13;
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
  unint64_t v6 = (SADeviceUpdateEvent *)a3;
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
      id v8 = [(SADeviceUpdateEvent *)self device];
      v9 = [(SADeviceUpdateEvent *)v7 device];
      if (v8 == v9
        || ([(SADeviceUpdateEvent *)self device],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SADeviceUpdateEvent *)v7 device],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v11 = [(SADeviceUpdateEvent *)self eventType];
        if (v11 == [(SADeviceUpdateEvent *)v7 eventType]
          && (BOOL v12 = [(SADeviceUpdateEvent *)self lastEvent],
              v12 == [(SADeviceUpdateEvent *)v7 lastEvent]))
        {
          v14 = [(SADeviceUpdateEvent *)self date];
          uint64_t v15 = [(SADeviceUpdateEvent *)v7 date];
          if (v14 == (void *)v15)
          {

            char v10 = 1;
          }
          else
          {
            v16 = (void *)v15;
            v18 = [(SADeviceUpdateEvent *)self date];
            v17 = [(SADeviceUpdateEvent *)v7 date];
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
  v14[1] = @"SADeviceUpdateEventDevice";
  unint64_t v6 = [(SADeviceUpdateEvent *)self device];
  if (v6)
  {
    v2 = [(SADeviceUpdateEvent *)self device];
    BOOL v7 = [v2 description];
  }
  else
  {
    BOOL v7 = &stru_1F27F45F0;
  }
  v15[1] = v7;
  v14[2] = @"SADeviceUpdateEventType";
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SADeviceUpdateEvent eventType](self, "eventType"));
  v15[2] = v8;
  v14[3] = @"SADeviceUpdateEventLast";
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SADeviceUpdateEvent lastEvent](self, "lastEvent"));
  v15[3] = v9;
  v14[4] = @"SADeviceUpdateEventDate";
  char v10 = [(SADeviceUpdateEvent *)self date];
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
  v2 = [(SADeviceUpdateEvent *)self descriptionDictionary];
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

- (SADevice)device
{
  return self->_device;
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
  objc_storeStrong((id *)&self->_device, 0);
}

@end