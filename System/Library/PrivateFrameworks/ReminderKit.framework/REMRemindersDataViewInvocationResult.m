@interface REMRemindersDataViewInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)accountStorages;
- (NSArray)listStorages;
- (NSArray)objectIDs;
- (NSArray)reminderStorages;
- (REMRemindersDataViewInvocationResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 objectIDs:(id)a6;
- (REMRemindersDataViewInvocationResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocationResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 objectIDs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REMRemindersDataViewInvocationResult;
  v15 = [(REMStoreInvocationValueStorage *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStorages, a3);
    objc_storeStrong((id *)&v16->_listStorages, a4);
    objc_storeStrong((id *)&v16->_reminderStorages, a5);
    objc_storeStrong((id *)&v16->_objectIDs, a6);
  }

  return v16;
}

- (REMRemindersDataViewInvocationResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"accountStorages"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v5 decodeObjectOfClasses:v11 forKey:@"listStorages"];

  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"reminderStorages"];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v5 decodeObjectOfClasses:v19 forKey:@"objectIDs"];

  v21 = 0;
  if (v8 && v12 && v16 && v20)
  {
    self = [(REMRemindersDataViewInvocationResult *)self initWithAccountStorages:v8 listStorages:v12 reminderStorages:v16 objectIDs:v20];
    v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMRemindersDataViewInvocationResult *)self accountStorages];
  [v4 encodeObject:v5 forKey:@"accountStorages"];

  uint64_t v6 = [(REMRemindersDataViewInvocationResult *)self listStorages];
  [v4 encodeObject:v6 forKey:@"listStorages"];

  v7 = [(REMRemindersDataViewInvocationResult *)self reminderStorages];
  [v4 encodeObject:v7 forKey:@"reminderStorages"];

  id v8 = [(REMRemindersDataViewInvocationResult *)self objectIDs];
  [v4 encodeObject:v8 forKey:@"objectIDs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v5 = [(REMRemindersDataViewInvocationResult *)self accountStorages];
  uint64_t v6 = [v4 accountStorages];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    id v8 = [(REMRemindersDataViewInvocationResult *)self accountStorages];
    v9 = [v4 accountStorages];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_12;
    }
  }
  id v11 = [(REMRemindersDataViewInvocationResult *)self listStorages];
  uint64_t v12 = [v4 listStorages];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(REMRemindersDataViewInvocationResult *)self listStorages];
    v15 = [v4 listStorages];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  v17 = [(REMRemindersDataViewInvocationResult *)self reminderStorages];
  uint64_t v18 = [v4 reminderStorages];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    v20 = [(REMRemindersDataViewInvocationResult *)self reminderStorages];
    v21 = [v4 reminderStorages];
    int v22 = [v20 isEqual:v21];

    if (!v22)
    {
LABEL_12:
      char v23 = 0;
      goto LABEL_13;
    }
  }
  v25 = [(REMRemindersDataViewInvocationResult *)self objectIDs];
  uint64_t v26 = [v4 objectIDs];
  if (v25 == (void *)v26)
  {
    char v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    v28 = [(REMRemindersDataViewInvocationResult *)self objectIDs];
    v29 = [v4 objectIDs];
    char v23 = [v28 isEqual:v29];
  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  v3 = [(REMRemindersDataViewInvocationResult *)self accountStorages];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMRemindersDataViewInvocationResult *)self listStorages];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(REMRemindersDataViewInvocationResult *)self reminderStorages];
  uint64_t v8 = [v7 hash];
  v9 = [(REMRemindersDataViewInvocationResult *)self objectIDs];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (NSArray)accountStorages
{
  return self->_accountStorages;
}

- (NSArray)listStorages
{
  return self->_listStorages;
}

- (NSArray)reminderStorages
{
  return self->_reminderStorages;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_reminderStorages, 0);
  objc_storeStrong((id *)&self->_listStorages, 0);

  objc_storeStrong((id *)&self->_accountStorages, 0);
}

@end