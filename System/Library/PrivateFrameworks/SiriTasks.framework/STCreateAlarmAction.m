@interface STCreateAlarmAction
+ (BOOL)supportsSecureCoding;
- (STCreateAlarmAction)initWithCoder:(id)a3;
- (id)_initWithAlarm:(id)a3;
- (id)alarm;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STCreateAlarmAction

- (void).cxx_destruct
{
}

- (STCreateAlarmAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STCreateAlarmAction;
  v5 = [(STSiriModelObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alarm"];
    alarm = v5->_alarm;
    v5->_alarm = (STAlarm *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STCreateAlarmAction;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarm, @"_alarm", v5.receiver, v5.super_class);
}

- (id)alarm
{
  return self->_alarm;
}

- (id)_initWithAlarm:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STCreateAlarmAction.m", 19, @"Invalid parameter not satisfying: %@", @"alarm" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)STCreateAlarmAction;
  v7 = [(STCreateAlarmAction *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_alarm, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end