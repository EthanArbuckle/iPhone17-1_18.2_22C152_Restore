@interface MTSyncDismiss
+ (BOOL)supportsSecureCoding;
+ (id)deserialize:(id)a3;
+ (id)syncDismissOfObjectWithIdentifier:(id)a3 dismissDate:(id)a4 date:(id)a5;
+ (id)syncDismissOfObjectWithIdentifier:(id)a3 dismissDate:(id)a4 date:(id)a5 version:(float)a6;
- (BOOL)conflicts:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MTSyncDismiss)initWithDismissedObjectIdentifier:(id)a3 dismissDate:(id)a4 date:(id)a5 version:(float)a6;
- (NSDate)date;
- (NSDate)dismissDate;
- (NSDate)syncDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)sequencer;
- (NSString)syncIdentifier;
- (float)syncVersion;
- (id)initFromDeserializer:(id)a3;
- (id)preferred:(id)a3;
- (id)serialize;
- (int64_t)changeType;
- (unint64_t)syncType;
- (void)serializeWithSerializer:(id)a3;
- (void)setDate:(id)a3;
- (void)setDismissDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSyncVersion:(float)a3;
@end

@implementation MTSyncDismiss

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

+ (id)syncDismissOfObjectWithIdentifier:(id)a3 dismissDate:(id)a4 date:(id)a5
{
  LODWORD(v5) = 1.0;
  return (id)[a1 syncDismissOfObjectWithIdentifier:a3 dismissDate:a4 date:a5 version:v5];
}

+ (id)syncDismissOfObjectWithIdentifier:(id)a3 dismissDate:(id)a4 date:(id)a5 version:(float)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  *(float *)&double v14 = a6;
  v15 = (void *)[v13 initWithDismissedObjectIdentifier:v12 dismissDate:v11 date:v10 version:v14];

  return v15;
}

- (MTSyncDismiss)initWithDismissedObjectIdentifier:(id)a3 dismissDate:(id)a4 date:(id)a5 version:(float)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTSyncDismiss;
  double v14 = [(MTSyncDismiss *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_dismissDate, a4);
    objc_storeStrong((id *)&v15->_date, a5);
    v15->_syncVersion = a6;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MTSyncDismiss *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      v6 = [(MTSyncDismiss *)self date];
      v7 = [(MTSyncDismiss *)v5 date];
      if ([v6 isEqualToDate:v7])
      {
        v8 = [(MTSyncDismiss *)self dismissDate];
        v9 = [(MTSyncDismiss *)v5 dismissDate];
        if ([v8 isEqual:v9])
        {
          id v10 = [(MTSyncDismiss *)self identifier];
          id v11 = [(MTSyncDismiss *)v5 identifier];
          if ([v10 isEqualToString:v11])
          {
            [(MTSyncDismiss *)self syncVersion];
            float v13 = v12;
            [(MTSyncDismiss *)v5 syncVersion];
            BOOL v15 = v13 == v14;
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (NSString)syncIdentifier
{
  return self->_identifier;
}

- (NSDate)syncDate
{
  return self->_date;
}

- (unint64_t)syncType
{
  return 0;
}

- (BOOL)conflicts:(id)a3
{
  return [a3 syncType] == 0;
}

- (id)preferred:(id)a3
{
  v4 = (MTSyncDismiss *)a3;
  double v5 = [(MTSyncDismiss *)self syncDate];
  v6 = [(MTSyncDismiss *)v4 syncDate];
  if ([v5 mtIsAfterDate:v6]) {
    v7 = self;
  }
  else {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(MTSyncDismiss *)self identifier];
  v6 = [(MTSyncDismiss *)self syncIdentifier];
  v7 = [(MTSyncDismiss *)self dismissDate];
  v8 = [(MTSyncDismiss *)self date];
  v9 = [v3 stringWithFormat:@"<%@:%p %@ %@ dismissDate: %@ (%@)>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSDate)dismissDate
{
  return self->_dismissDate;
}

- (void)setDismissDate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (float)syncVersion
{
  return self->_syncVersion;
}

- (void)setSyncVersion:(float)a3
{
  self->_syncVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dismissDate, 0);
}

- (id)serialize
{
  v3 = objc_opt_new();
  uint64_t v4 = [(MTSyncDismiss *)self syncDate];
  [v4 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setSyncDate:");

  double v5 = [(MTSyncDismiss *)self syncIdentifier];
  [v3 setSyncID:v5];

  [(MTSyncDismiss *)self syncVersion];
  [v3 setSyncVersion:v6];
  v7 = objc_opt_new();
  v8 = [(MTSyncDismiss *)self dismissDate];
  [v8 timeIntervalSinceReferenceDate];
  objc_msgSend(v7, "setDismissDate:");

  [v3 setDismissAction:v7];
  return v3;
}

+ (id)deserialize:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"MTSyncDismiss+ProtoBuffer.m", 33, @"Unsupported class for action %@", objc_opt_class() object file lineNumber description];
  }
  id v6 = v5;
  if ([v6 hasDismissAction])
  {
    v7 = [v6 dismissAction];
    v8 = [v6 syncID];
    v9 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 dismissDate];
    id v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    id v11 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 syncDate];
    float v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    [v6 syncVersion];
    *(float *)&double v13 = v13;
    float v14 = +[MTSyncDismiss syncDismissOfObjectWithIdentifier:v8 dismissDate:v10 date:v12 version:v13];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"MTSyncDismiss+ProtoBuffer.m", 42, @"Unexpected codeable: %@", v6 object file lineNumber description];
    float v14 = 0;
  }

  return v14;
}

- (id)initFromDeserializer:(id)a3
{
  uint64_t v4 = [a3 mtCoder];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  id v6 = [[MTPBSyncMessage alloc] initWithData:v5];
  v7 = [(id)objc_opt_class() deserialize:v6];

  return v7;
}

- (void)serializeWithSerializer:(id)a3
{
  id v6 = [a3 mtCoder];
  uint64_t v4 = [(MTSyncDismiss *)self serialize];
  id v5 = [v4 data];

  [v6 encodeObject:v5 forKey:@"data"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end