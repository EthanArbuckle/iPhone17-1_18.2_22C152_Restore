@interface REMAlarmVehicleTrigger
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporal;
- (REMAlarmVehicleTrigger)initWithCoder:(id)a3;
- (REMAlarmVehicleTrigger)initWithEvent:(int64_t)a3;
- (REMAlarmVehicleTrigger)initWithObjectID:(id)a3 event:(int64_t)a4;
- (id)_deepCopy;
- (id)description;
- (int64_t)event;
- (void)encodeWithCoder:(id)a3;
- (void)setEvent:(int64_t)a3;
@end

@implementation REMAlarmVehicleTrigger

+ (id)cdEntityName
{
  return @"REMCDAlarmVehicleTrigger";
}

- (REMAlarmVehicleTrigger)initWithObjectID:(id)a3 event:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmVehicleTrigger;
  v5 = [(REMAlarmTrigger *)&v8 initWithObjectID:a3];
  v6 = v5;
  if (v5) {
    [(REMAlarmVehicleTrigger *)v5 setEvent:a4];
  }
  return v6;
}

- (REMAlarmVehicleTrigger)initWithEvent:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMAlarmVehicleTrigger;
  v4 = [(REMAlarmTrigger *)&v7 init];
  v5 = v4;
  if (v4) {
    [(REMAlarmVehicleTrigger *)v4 setEvent:a3];
  }
  return v5;
}

- (REMAlarmVehicleTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmVehicleTrigger;
  v5 = [(REMAlarmTrigger *)&v9 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = [v4 decodeIntegerForKey:@"event"];
    if (v6 >= 3)
    {
      objc_super v7 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[REMAlarmVehicleTrigger initWithCoder:](v6, v7);
      }

      unint64_t v6 = 0;
    }
    [(REMAlarmVehicleTrigger *)v5 setEvent:v6];
  }

  return v5;
}

- (id)_deepCopy
{
  v2 = [[REMAlarmVehicleTrigger alloc] initWithEvent:[(REMAlarmVehicleTrigger *)self event]];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMAlarmVehicleTrigger *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(REMAlarmVehicleTrigger *)v4 event];
      BOOL v6 = v5 == [(REMAlarmVehicleTrigger *)self event];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isTemporal
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmVehicleTrigger;
  id v4 = [(REMAlarmVehicleTrigger *)&v9 description];
  unint64_t v5 = [(REMAlarmVehicleTrigger *)self event];
  if (v5 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown REMAlarmVehicleTriggerEvent %ld", v5);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v6 = off_1E61DCAA8[v5];
  }
  objc_super v7 = [v3 stringWithFormat:@"%@ {event = %@}", v4, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAlarmVehicleTrigger;
  id v4 = a3;
  [(REMAlarmTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAlarmVehicleTrigger event](self, "event", v5.receiver, v5.super_class), @"event");
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAlarmVehicleTriggerEvent %ld", (uint8_t *)&v2, 0xCu);
}

@end