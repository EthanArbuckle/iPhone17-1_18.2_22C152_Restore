@interface REMAlarm
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isAcknowledged;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOriginal;
- (BOOL)isSnooze;
- (NSDate)acknowledgedDate;
- (NSString)alarmUID;
- (NSString)originalAlarmUID;
- (REMAlarm)initWithAlarm:(id)a3 objectID:(id)a4;
- (REMAlarm)initWithCoder:(id)a3;
- (REMAlarm)initWithTrigger:(id)a3;
- (REMAlarm)initWithTrigger:(id)a3 objectID:(id)a4;
- (REMAlarmTrigger)trigger;
- (REMObjectID)objectID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAcknowledgedDate:(id)a3;
- (void)setAlarmUID:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setOriginalAlarmUID:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation REMAlarm

+ (id)newObjectID
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDAlarm";
}

- (REMAlarm)initWithTrigger:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)REMAlarm;
  v8 = [(REMAlarm *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(REMAlarm *)v8 setTrigger:v6];
    [(REMAlarm *)v9 setObjectID:v7];
    v10 = [v7 uuid];
    v11 = [v10 UUIDString];
    [(REMAlarm *)v9 setAlarmUID:v11];
  }
  return v9;
}

- (REMAlarm)initWithTrigger:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(id)objc_opt_class() newObjectID];
  id v6 = [(REMAlarm *)self initWithTrigger:v4 objectID:v5];

  return v6;
}

- (REMAlarm)initWithAlarm:(id)a3 objectID:(id)a4
{
  id v5 = a3;
  id v6 = [REMAlarmTrigger alloc];
  id v7 = [v5 trigger];
  v8 = [v5 trigger];
  v9 = (void *)[(id)objc_opt_class() newObjectID];
  v10 = [(REMAlarmTrigger *)v6 initWithAlarmTrigger:v7 objectID:v9];

  v11 = [(REMAlarm *)self initWithTrigger:v10];
  v12 = [v5 acknowledgedDate];

  [(REMAlarm *)v11 setAcknowledgedDate:v12];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAlarm)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trigger"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  id v7 = [(REMAlarm *)self initWithTrigger:v5 objectID:v6];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acknowledgedDate"];
  [(REMAlarm *)v7 setAcknowledgedDate:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarmUID"];
  [(REMAlarm *)v7 setAlarmUID:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalAlarmUID"];

  [(REMAlarm *)v7 setOriginalAlarmUID:v10];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMAlarm *)self trigger];
  [v4 encodeObject:v5 forKey:@"trigger"];

  id v6 = [(REMAlarm *)self objectID];
  [v4 encodeObject:v6 forKey:@"objectID"];

  id v7 = [(REMAlarm *)self acknowledgedDate];
  [v4 encodeObject:v7 forKey:@"acknowledgedDate"];

  v8 = [(REMAlarm *)self alarmUID];
  [v4 encodeObject:v8 forKey:@"alarmUID"];

  id v9 = [(REMAlarm *)self originalAlarmUID];
  [v4 encodeObject:v9 forKey:@"originalAlarmUID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMAlarm *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMAlarm *)self objectID];
      uint64_t v8 = [(REMAlarm *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        v10 = [(REMAlarm *)self objectID];
        v11 = [(REMAlarm *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_18;
        }
      }
      v14 = [(REMAlarm *)self trigger];
      uint64_t v15 = [(REMAlarm *)v6 trigger];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMAlarm *)self trigger];
        v18 = [(REMAlarm *)v6 trigger];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_18;
        }
      }
      v20 = [(REMAlarm *)self acknowledgedDate];
      uint64_t v21 = [(REMAlarm *)v6 acknowledgedDate];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(REMAlarm *)self acknowledgedDate];
        v24 = [(REMAlarm *)v6 acknowledgedDate];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_18;
        }
      }
      v26 = [(REMAlarm *)self alarmUID];
      uint64_t v27 = [(REMAlarm *)v6 alarmUID];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(REMAlarm *)self alarmUID];
        v30 = [(REMAlarm *)v6 alarmUID];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_18;
        }
      }
      v33 = [(REMAlarm *)self originalAlarmUID];
      uint64_t v34 = [(REMAlarm *)v6 originalAlarmUID];
      if (v33 == (void *)v34)
      {
        char v13 = 1;
        v35 = v33;
      }
      else
      {
        v35 = (void *)v34;
        v36 = [(REMAlarm *)self originalAlarmUID];
        v37 = [(REMAlarm *)v6 originalAlarmUID];
        char v13 = [v36 isEqual:v37];
      }
      goto LABEL_19;
    }
LABEL_18:
    char v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v13 = 1;
LABEL_20:

  return v13;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = (REMAlarm *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMAlarm *)self trigger];
      uint64_t v8 = [(REMAlarm *)v6 trigger];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        v10 = [(REMAlarm *)self trigger];
        v11 = [(REMAlarm *)v6 trigger];
        int v12 = [v10 isContentEqual:v11];

        if (!v12) {
          goto LABEL_14;
        }
      }
      v14 = [(REMAlarm *)self acknowledgedDate];
      uint64_t v15 = [(REMAlarm *)v6 acknowledgedDate];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMAlarm *)self acknowledgedDate];
        v18 = [(REMAlarm *)v6 acknowledgedDate];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_14;
        }
      }
      v20 = [(REMAlarm *)self alarmUID];
      uint64_t v21 = [(REMAlarm *)v6 alarmUID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(REMAlarm *)self alarmUID];
        v24 = [(REMAlarm *)v6 alarmUID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_14;
        }
      }
      uint64_t v27 = [(REMAlarm *)self originalAlarmUID];
      uint64_t v28 = [(REMAlarm *)v6 originalAlarmUID];
      if (v27 == (void *)v28)
      {
        char v13 = 1;
        v29 = v27;
      }
      else
      {
        v29 = (void *)v28;
        v30 = [(REMAlarm *)self originalAlarmUID];
        int v31 = [(REMAlarm *)v6 originalAlarmUID];
        char v13 = [v30 isEqual:v31];
      }
      goto LABEL_15;
    }
LABEL_14:
    char v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  char v13 = 1;
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMAlarm *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = [(REMAlarm *)self originalAlarmUID];
  id v4 = NSString;
  if (v3)
  {
    id v5 = [(REMAlarm *)self originalAlarmUID];
    [v4 stringWithFormat:@" (original-uid: %@)", v5];
  }
  else
  {
    id v5 = [(REMAlarm *)self alarmUID];
    [v4 stringWithFormat:@" (uid: %@)", v5];
  id v6 = };

  id v7 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)REMAlarm;
  uint64_t v8 = [(REMAlarm *)&v13 description];
  id v9 = [(REMAlarm *)self objectID];
  v10 = [(REMAlarm *)self trigger];
  v11 = [v7 stringWithFormat:@"%@ %@ %@%@", v8, v9, v10, v6];

  return v11;
}

- (BOOL)isAcknowledged
{
  v2 = [(REMAlarm *)self acknowledgedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isOriginal
{
  v2 = [(REMAlarm *)self originalAlarmUID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isSnooze
{
  v2 = [(REMAlarm *)self originalAlarmUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (REMAlarmTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (void)setAcknowledgedDate:(id)a3
{
}

- (NSString)alarmUID
{
  return self->_alarmUID;
}

- (void)setAlarmUID:(id)a3
{
}

- (NSString)originalAlarmUID
{
  return self->_originalAlarmUID;
}

- (void)setOriginalAlarmUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAlarmUID, 0);
  objc_storeStrong((id *)&self->_alarmUID, 0);
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_trigger, 0);
}

@end