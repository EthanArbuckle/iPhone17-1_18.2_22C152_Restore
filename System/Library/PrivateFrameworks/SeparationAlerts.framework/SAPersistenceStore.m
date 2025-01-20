@interface SAPersistenceStore
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)monitoringSessionRecord;
- (SAPersistenceStore)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMonitoringSessionRecord:(id)a3;
@end

@implementation SAPersistenceStore

- (BOOL)isEqual:(id)a3
{
  v4 = (SAPersistenceStore *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SAPersistenceStore *)self monitoringSessionRecord];
      v7 = [(SAPersistenceStore *)v5 monitoringSessionRecord];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(SAPersistenceStore *)self monitoringSessionRecord];
        v9 = [(SAPersistenceStore *)v5 monitoringSessionRecord];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAPersistenceStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAPersistenceStore;
  v5 = [(SAPersistenceStore *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    char v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"MonitoringSessionRecord"];
    monitoringSessionRecord = v5->_monitoringSessionRecord;
    v5->_monitoringSessionRecord = (NSMutableDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSMutableDictionary)monitoringSessionRecord
{
  return self->_monitoringSessionRecord;
}

- (void)setMonitoringSessionRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end