@interface TAPersistenceStore
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TADeviceRecord)deviceRecord;
- (TAPersistenceStore)initWithCoder:(id)a3;
- (TAVisitState)visitState;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceRecord:(id)a3;
- (void)setVisitState:(id)a3;
@end

@implementation TAPersistenceStore

- (BOOL)isEqual:(id)a3
{
  v5 = (TAPersistenceStore *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(TAPersistenceStore *)self deviceRecord];
      v8 = [(TAPersistenceStore *)v6 deviceRecord];
      if (v7 != v8)
      {
        v9 = [(TAPersistenceStore *)self deviceRecord];
        v3 = [(TAPersistenceStore *)v6 deviceRecord];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(TAPersistenceStore *)self visitState];
      v12 = [(TAPersistenceStore *)v6 visitState];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(TAPersistenceStore *)self visitState];
        v14 = [(TAPersistenceStore *)v6 visitState];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPersistenceStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TAPersistenceStore;
  v5 = [(TAPersistenceStore *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceRecord"];
    deviceRecord = v5->_deviceRecord;
    v5->_deviceRecord = (TADeviceRecord *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VisitState"];
    visitState = v5->_visitState;
    v5->_visitState = (TAVisitState *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceRecord = self->_deviceRecord;
  id v5 = a3;
  [v5 encodeObject:deviceRecord forKey:@"DeviceRecord"];
  [v5 encodeObject:self->_visitState forKey:@"VisitState"];
}

- (TADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
}

- (TAVisitState)visitState
{
  return self->_visitState;
}

- (void)setVisitState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitState, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
}

@end