@interface REMAlarmDueDateDeltaAlertTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporal;
- (NSDate)acknowledgedDate;
- (REMAlarmDueDateDeltaAlertTrigger)initWithCoder:(id)a3;
- (REMAlarmDueDateDeltaAlertTrigger)initWithDueDateDelta:(id)a3 acknowledgedDate:(id)a4;
- (REMAlarmDueDateDeltaAlertTrigger)initWithObjectID:(id)a3 dueDateDelta:(id)a4 acknowledgedDate:(id)a5;
- (REMDueDateDeltaInterval)dueDateDelta;
- (id)_deepCopy;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAlarmDueDateDeltaAlertTrigger

- (REMAlarmDueDateDeltaAlertTrigger)initWithObjectID:(id)a3 dueDateDelta:(id)a4 acknowledgedDate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  v11 = [(REMAlarmTrigger *)&v14 initWithObjectID:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dueDateDelta, a4);
    objc_storeStrong((id *)&v12->_acknowledgedDate, a5);
  }

  return v12;
}

- (REMAlarmDueDateDeltaAlertTrigger)initWithDueDateDelta:(id)a3 acknowledgedDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  id v9 = [(REMAlarmTrigger *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dueDateDelta, a3);
    objc_storeStrong((id *)&v10->_acknowledgedDate, a4);
  }

  return v10;
}

- (REMAlarmDueDateDeltaAlertTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  v5 = [(REMAlarmTrigger *)&v14 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 decodeObjectForKey:@"dueDateDelta"];
  if (v6)
  {
    dueDateDelta = v5->_dueDateDelta;
    v5->_dueDateDelta = v6;
    id v8 = v6;

    uint64_t v9 = [v4 decodeObjectForKey:@"acknowledgedDate"];
    acknowledgedDate = v5->_acknowledgedDate;
    v5->_acknowledgedDate = (NSDate *)v9;

LABEL_4:
    v11 = v5;
    goto LABEL_8;
  }
  objc_super v12 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[REMAlarmDueDateDeltaAlertTrigger initWithCoder:](v12);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)_deepCopy
{
  v3 = [REMAlarmDueDateDeltaAlertTrigger alloc];
  id v4 = [(REMAlarmDueDateDeltaAlertTrigger *)self dueDateDelta];
  v5 = [(REMAlarmDueDateDeltaAlertTrigger *)self acknowledgedDate];
  v6 = [(REMAlarmDueDateDeltaAlertTrigger *)v3 initWithDueDateDelta:v4 acknowledgedDate:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMAlarmDueDateDeltaAlertTrigger *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(REMAlarmDueDateDeltaAlertTrigger *)v6 dueDateDelta],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(REMAlarmDueDateDeltaAlertTrigger *)self dueDateDelta],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v7 == v8))
    {
      v11 = [(REMAlarmDueDateDeltaAlertTrigger *)v6 acknowledgedDate];
      uint64_t v12 = [(REMAlarmDueDateDeltaAlertTrigger *)self acknowledgedDate];
      if (v11 == (void *)v12)
      {
        char v9 = 1;
        v13 = v11;
      }
      else
      {
        v13 = (void *)v12;
        objc_super v14 = [(REMAlarmDueDateDeltaAlertTrigger *)v6 acknowledgedDate];
        v15 = [(REMAlarmDueDateDeltaAlertTrigger *)self acknowledgedDate];
        char v9 = [v14 isEqual:v15];
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (BOOL)isTemporal
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(REMAlarmDueDateDeltaAlertTrigger *)self dueDateDelta];
  id v4 = [(REMAlarmDueDateDeltaAlertTrigger *)self acknowledgedDate];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  id v4 = [(REMAlarmDueDateDeltaAlertTrigger *)&v9 description];
  unint64_t v5 = [(REMAlarmDueDateDeltaAlertTrigger *)self dueDateDelta];
  v6 = [(REMAlarmDueDateDeltaAlertTrigger *)self acknowledgedDate];
  id v7 = [v3 stringWithFormat:@"%@ {dueDateDelta = %@ acknowledgedDate = %@;}", v4, v5, v6];;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMAlarmDueDateDeltaAlertTrigger;
  id v4 = a3;
  [(REMAlarmTrigger *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [(REMAlarmDueDateDeltaAlertTrigger *)self dueDateDelta];
  [v4 encodeObject:v5 forKey:@"dueDateDelta"];

  v6 = [(REMAlarmDueDateDeltaAlertTrigger *)self acknowledgedDate];
  [v4 encodeObject:v6 forKey:@"acknowledgedDate"];
}

- (REMDueDateDeltaInterval)dueDateDelta
{
  return self->_dueDateDelta;
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);

  objc_storeStrong((id *)&self->_dueDateDelta, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "-[REMAlarmDueDateDeltaAlertTrigger initWithCoder:] failed decoding dueDateDelta", v1, 2u);
}

@end