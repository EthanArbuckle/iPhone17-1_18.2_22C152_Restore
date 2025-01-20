@interface STAlarmModification
+ (BOOL)supportsSecureCoding;
- (STAlarmModification)initWithCoder:(id)a3;
- (id)_initWithAddedFrequency:(int64_t)a3 alarmId:(id)a4 enabled:(id)a5 hour:(id)a6 label:(id)a7 minute:(id)a8 removedFrequency:(int64_t)a9;
- (id)alarmId;
- (id)enabled;
- (id)hour;
- (id)label;
- (id)minute;
- (int64_t)addedFrequency;
- (int64_t)removedFrequency;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAlarmModification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minute, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_hour, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_alarmId, 0);
}

- (STAlarmModification)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STAlarmModification;
  v5 = [(STSiriModelObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    v5->_addedFrequency = [v4 decodeIntegerForKey:@"_addedFrequency"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alarmId"];
    alarmId = v5->_alarmId;
    v5->_alarmId = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_enabled"];
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hour"];
    hour = v5->_hour;
    v5->_hour = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    label = v5->_label;
    v5->_label = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_minute"];
    minute = v5->_minute;
    v5->_minute = (NSNumber *)v14;

    v5->_removedFrequency = [v4 decodeIntegerForKey:@"_removedFrequency"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAlarmModification;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_addedFrequency, @"_addedFrequency", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_alarmId forKey:@"_alarmId"];
  [v4 encodeObject:self->_enabled forKey:@"_enabled"];
  [v4 encodeObject:self->_hour forKey:@"_hour"];
  [v4 encodeObject:self->_label forKey:@"_label"];
  [v4 encodeObject:self->_minute forKey:@"_minute"];
  [v4 encodeInteger:self->_removedFrequency forKey:@"_removedFrequency"];
}

- (int64_t)removedFrequency
{
  return self->_removedFrequency;
}

- (id)minute
{
  return self->_minute;
}

- (id)label
{
  return self->_label;
}

- (id)hour
{
  return self->_hour;
}

- (id)enabled
{
  return self->_enabled;
}

- (id)alarmId
{
  return self->_alarmId;
}

- (int64_t)addedFrequency
{
  return self->_addedFrequency;
}

- (id)_initWithAddedFrequency:(int64_t)a3 alarmId:(id)a4 enabled:(id)a5 hour:(id)a6 label:(id)a7 minute:(id)a8 removedFrequency:(int64_t)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v25 = a8;
  if (!v15)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"STAlarmModification.m", 31, @"Invalid parameter not satisfying: %@", @"alarmId" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)STAlarmModification;
  v19 = [(STAlarmModification *)&v26 init];
  v20 = v19;
  if (v19)
  {
    v19->_addedFrequency = a3;
    objc_storeStrong((id *)&v19->_alarmId, a4);
    objc_storeStrong((id *)&v20->_enabled, a5);
    objc_storeStrong((id *)&v20->_hour, a6);
    objc_storeStrong((id *)&v20->_label, a7);
    objc_storeStrong((id *)&v20->_minute, a8);
    v20->_removedFrequency = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end