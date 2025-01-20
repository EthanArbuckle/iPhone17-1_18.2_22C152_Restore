@interface SOAlarmsSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDictionary)alarmsByID;
- (NSOrderedSet)dismissedAlarmIDs;
- (NSOrderedSet)firingAlarmIDs;
- (SOAlarmsSnapshot)init;
- (SOAlarmsSnapshot)initWithBuilder:(id)a3;
- (SOAlarmsSnapshot)initWithCoder:(id)a3;
- (SOAlarmsSnapshot)initWithDate:(id)a3 alarmsByID:(id)a4 firingAlarmIDs:(id)a5 dismissedAlarmIDs:(id)a6;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOAlarmsSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedAlarmIDs, 0);
  objc_storeStrong((id *)&self->_firingAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSOrderedSet)dismissedAlarmIDs
{
  return self->_dismissedAlarmIDs;
}

- (NSOrderedSet)firingAlarmIDs
{
  return self->_firingAlarmIDs;
}

- (NSDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (NSDate)date
{
  return self->_date;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"SOAlarmsSnapshot::date"];
  [v5 encodeObject:self->_alarmsByID forKey:@"SOAlarmsSnapshot::alarmsByID"];
  [v5 encodeObject:self->_firingAlarmIDs forKey:@"SOAlarmsSnapshot::firingAlarmIDs"];
  [v5 encodeObject:self->_dismissedAlarmIDs forKey:@"SOAlarmsSnapshot::dismissedAlarmIDs"];
}

- (SOAlarmsSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarmsSnapshot::date"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SOAlarmsSnapshot::alarmsByID"];

  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SOAlarmsSnapshot::firingAlarmIDs"];

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"SOAlarmsSnapshot::dismissedAlarmIDs"];

  v19 = [(SOAlarmsSnapshot *)self initWithDate:v5 alarmsByID:v10 firingAlarmIDs:v14 dismissedAlarmIDs:v18];
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SOAlarmsSnapshot *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SOAlarmsSnapshot *)v5 date];
      date = self->_date;
      if (date == v6 || [(NSDate *)date isEqual:v6])
      {
        uint64_t v8 = [(SOAlarmsSnapshot *)v5 alarmsByID];
        alarmsByID = self->_alarmsByID;
        if (alarmsByID == v8 || [(NSDictionary *)alarmsByID isEqual:v8])
        {
          v10 = [(SOAlarmsSnapshot *)v5 firingAlarmIDs];
          firingAlarmIDs = self->_firingAlarmIDs;
          if (firingAlarmIDs == v10 || [(NSOrderedSet *)firingAlarmIDs isEqual:v10])
          {
            uint64_t v12 = [(SOAlarmsSnapshot *)v5 dismissedAlarmIDs];
            dismissedAlarmIDs = self->_dismissedAlarmIDs;
            BOOL v14 = dismissedAlarmIDs == v12 || [(NSOrderedSet *)dismissedAlarmIDs isEqual:v12];
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  uint64_t v4 = [(NSDictionary *)self->_alarmsByID hash] ^ v3;
  uint64_t v5 = [(NSOrderedSet *)self->_firingAlarmIDs hash];
  return v4 ^ v5 ^ [(NSOrderedSet *)self->_dismissedAlarmIDs hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SOAlarmsSnapshot;
  uint64_t v5 = [(SOAlarmsSnapshot *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {date = %@, alarmsByID = %@, firingAlarmIDs = %@, dismissedAlarmIDs = %@}", v5, self->_date, self->_alarmsByID, self->_firingAlarmIDs, self->_dismissedAlarmIDs];

  return v6;
}

- (id)description
{
  return [(SOAlarmsSnapshot *)self _descriptionWithIndent:0];
}

- (SOAlarmsSnapshot)initWithDate:(id)a3 alarmsByID:(id)a4 firingAlarmIDs:(id)a5 dismissedAlarmIDs:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__SOAlarmsSnapshot_initWithDate_alarmsByID_firingAlarmIDs_dismissedAlarmIDs___block_invoke;
  v20[3] = &unk_264486D38;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  v18 = [(SOAlarmsSnapshot *)self initWithBuilder:v20];

  return v18;
}

void __77__SOAlarmsSnapshot_initWithDate_alarmsByID_firingAlarmIDs_dismissedAlarmIDs___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setDate:v3];
  [v4 setAlarmsByID:a1[5]];
  [v4 setFiringAlarmIDs:a1[6]];
  [v4 setDismissedAlarmIDs:a1[7]];
}

- (SOAlarmsSnapshot)init
{
  return [(SOAlarmsSnapshot *)self initWithBuilder:0];
}

- (SOAlarmsSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SOAlarmsSnapshotMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)SOAlarmsSnapshot;
  uint64_t v5 = [(SOAlarmsSnapshot *)&v21 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_SOAlarmsSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SOAlarmsSnapshotMutation *)v7 isDirty])
    {
      objc_super v8 = [(_SOAlarmsSnapshotMutation *)v7 getDate];
      uint64_t v9 = [v8 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      id v11 = [(_SOAlarmsSnapshotMutation *)v7 getAlarmsByID];
      uint64_t v12 = [v11 copy];
      alarmsByID = v6->_alarmsByID;
      v6->_alarmsByID = (NSDictionary *)v12;

      id v14 = [(_SOAlarmsSnapshotMutation *)v7 getFiringAlarmIDs];
      uint64_t v15 = [v14 copy];
      firingAlarmIDs = v6->_firingAlarmIDs;
      v6->_firingAlarmIDs = (NSOrderedSet *)v15;

      id v17 = [(_SOAlarmsSnapshotMutation *)v7 getDismissedAlarmIDs];
      uint64_t v18 = [v17 copy];
      dismissedAlarmIDs = v6->_dismissedAlarmIDs;
      v6->_dismissedAlarmIDs = (NSOrderedSet *)v18;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SOAlarmsSnapshotMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SOAlarmsSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SOAlarmsSnapshotMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(SOAlarmsSnapshot);
      uint64_t v7 = [(_SOAlarmsSnapshotMutation *)v5 getDate];
      uint64_t v8 = [v7 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      id v10 = [(_SOAlarmsSnapshotMutation *)v5 getAlarmsByID];
      uint64_t v11 = [v10 copy];
      alarmsByID = v6->_alarmsByID;
      v6->_alarmsByID = (NSDictionary *)v11;

      id v13 = [(_SOAlarmsSnapshotMutation *)v5 getFiringAlarmIDs];
      uint64_t v14 = [v13 copy];
      firingAlarmIDs = v6->_firingAlarmIDs;
      v6->_firingAlarmIDs = (NSOrderedSet *)v14;

      id v16 = [(_SOAlarmsSnapshotMutation *)v5 getDismissedAlarmIDs];
      uint64_t v17 = [v16 copy];
      dismissedAlarmIDs = v6->_dismissedAlarmIDs;
      v6->_dismissedAlarmIDs = (NSOrderedSet *)v17;
    }
    else
    {
      v6 = (SOAlarmsSnapshot *)[(SOAlarmsSnapshot *)self copy];
    }
  }
  else
  {
    v6 = (SOAlarmsSnapshot *)[(SOAlarmsSnapshot *)self copy];
  }

  return v6;
}

@end