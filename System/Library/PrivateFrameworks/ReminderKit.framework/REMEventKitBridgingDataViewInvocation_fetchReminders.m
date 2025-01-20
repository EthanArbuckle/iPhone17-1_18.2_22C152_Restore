@interface REMEventKitBridgingDataViewInvocation_fetchReminders
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)listIDs;
- (REMEventKitBridgingDataViewInvocation_fetchReminders)initWithCoder:(id)a3;
- (REMEventKitBridgingDataViewInvocation_fetchReminders)initWithListIDs:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMEventKitBridgingDataViewInvocation_fetchReminders

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMEventKitBridgingDataViewInvocation_fetchReminders)initWithListIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMEventKitBridgingDataViewInvocation_fetchReminders;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listIDs, a3);
  }

  return v7;
}

- (REMEventKitBridgingDataViewInvocation_fetchReminders)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"listIDs"];

  objc_super v9 = [(REMEventKitBridgingDataViewInvocation_fetchReminders *)self initWithListIDs:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMEventKitBridgingDataViewInvocation_fetchReminders *)self listIDs];
  [v4 encodeObject:v5 forKey:@"listIDs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMEventKitBridgingDataViewInvocation_fetchReminders *)self listIDs];
    uint64_t v6 = [v4 listIDs];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMEventKitBridgingDataViewInvocation_fetchReminders *)self listIDs];
      objc_super v9 = [v4 listIDs];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(REMEventKitBridgingDataViewInvocation_fetchReminders *)self listIDs];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)listIDs
{
  return self->_listIDs;
}

- (void).cxx_destruct
{
}

@end