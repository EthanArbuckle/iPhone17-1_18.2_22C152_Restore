@interface SOTimersSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDictionary)timersByID;
- (SOTimersSnapshot)init;
- (SOTimersSnapshot)initWithBuilder:(id)a3;
- (SOTimersSnapshot)initWithCoder:(id)a3;
- (SOTimersSnapshot)initWithDate:(id)a3 timersByID:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOTimersSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSDictionary)timersByID
{
  return self->_timersByID;
}

- (NSDate)date
{
  return self->_date;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"SOTimersSnapshot::date"];
  [v5 encodeObject:self->_timersByID forKey:@"SOTimersSnapshot::timersByID"];
}

- (SOTimersSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimersSnapshot::date"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SOTimersSnapshot::timersByID"];

  v11 = [(SOTimersSnapshot *)self initWithDate:v5 timersByID:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SOTimersSnapshot *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SOTimersSnapshot *)v5 date];
      date = self->_date;
      if (date == v6 || [(NSDate *)date isEqual:v6])
      {
        uint64_t v8 = [(SOTimersSnapshot *)v5 timersByID];
        timersByID = self->_timersByID;
        BOOL v10 = timersByID == v8 || [(NSDictionary *)timersByID isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  return [(NSDictionary *)self->_timersByID hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SOTimersSnapshot;
  id v5 = [(SOTimersSnapshot *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {date = %@, timersByID = %@}", v5, self->_date, self->_timersByID];

  return v6;
}

- (id)description
{
  return [(SOTimersSnapshot *)self _descriptionWithIndent:0];
}

- (SOTimersSnapshot)initWithDate:(id)a3 timersByID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SOTimersSnapshot_initWithDate_timersByID___block_invoke;
  v12[3] = &unk_2644872C8;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(SOTimersSnapshot *)self initWithBuilder:v12];

  return v10;
}

void __44__SOTimersSnapshot_initWithDate_timersByID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDate:v3];
  [v4 setTimersByID:*(void *)(a1 + 40)];
}

- (SOTimersSnapshot)init
{
  return [(SOTimersSnapshot *)self initWithBuilder:0];
}

- (SOTimersSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SOTimersSnapshotMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SOTimersSnapshot;
  id v5 = [(SOTimersSnapshot *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_SOTimersSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SOTimersSnapshotMutation *)v7 isDirty])
    {
      id v8 = [(_SOTimersSnapshotMutation *)v7 getDate];
      uint64_t v9 = [v8 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      v11 = [(_SOTimersSnapshotMutation *)v7 getTimersByID];
      uint64_t v12 = [v11 copy];
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v12;
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
  id v4 = (void (**)(id, _SOTimersSnapshotMutation *))a3;
  if (v4)
  {
    id v5 = [[_SOTimersSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SOTimersSnapshotMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(SOTimersSnapshot);
      id v7 = [(_SOTimersSnapshotMutation *)v5 getDate];
      uint64_t v8 = [v7 copy];
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      BOOL v10 = [(_SOTimersSnapshotMutation *)v5 getTimersByID];
      uint64_t v11 = [v10 copy];
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v11;
    }
    else
    {
      id v6 = (SOTimersSnapshot *)[(SOTimersSnapshot *)self copy];
    }
  }
  else
  {
    id v6 = (SOTimersSnapshot *)[(SOTimersSnapshot *)self copy];
  }

  return v6;
}

@end