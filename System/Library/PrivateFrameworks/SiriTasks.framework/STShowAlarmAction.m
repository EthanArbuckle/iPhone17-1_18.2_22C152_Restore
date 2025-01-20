@interface STShowAlarmAction
+ (BOOL)supportsSecureCoding;
- (STShowAlarmAction)initWithCoder:(id)a3;
- (id)_initWithAlarmIds:(id)a3;
- (id)alarmIds;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowAlarmAction

- (void).cxx_destruct
{
}

- (STShowAlarmAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowAlarmAction;
  v5 = [(STSiriModelObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alarmIds"];
    alarmIds = v5->_alarmIds;
    v5->_alarmIds = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowAlarmAction;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIds, @"_alarmIds", v5.receiver, v5.super_class);
}

- (id)alarmIds
{
  return self->_alarmIds;
}

- (id)_initWithAlarmIds:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STShowAlarmAction.m", 19, @"Invalid parameter not satisfying: %@", @"alarmIds" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)STShowAlarmAction;
  v7 = [(STShowAlarmAction *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_alarmIds, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end