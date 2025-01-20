@interface REMRemindersDataViewInvocation_fetchByObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)objectIDs;
- (REMReminderFetchOptions)fetchOptions;
- (REMRemindersDataViewInvocation_fetchByObjectID)initWithCoder:(id)a3;
- (REMRemindersDataViewInvocation_fetchByObjectID)initWithObjectIDs:(id)a3 fetchOptions:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocation_fetchByObjectID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByObjectID)initWithObjectIDs:(id)a3 fetchOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMRemindersDataViewInvocation_fetchByObjectID;
  v9 = [(REMStoreInvocationValueStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectIDs, a3);
    objc_storeStrong((id *)&v10->_fetchOptions, a4);
  }

  return v10;
}

- (REMRemindersDataViewInvocation_fetchByObjectID)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"objectIDs"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"fetchOptions"];

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    self = [(REMRemindersDataViewInvocation_fetchByObjectID *)self initWithObjectIDs:v8 fetchOptions:v9];
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self objectIDs];
  [v4 encodeObject:v5 forKey:@"objectIDs"];

  id v6 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self fetchOptions];
  [v4 encodeObject:v6 forKey:@"fetchOptions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self objectIDs];
  uint64_t v6 = [v4 objectIDs];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self objectIDs];
    v9 = [v4 objectIDs];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self fetchOptions];
  uint64_t v13 = [v4 fetchOptions];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self fetchOptions];
    v16 = [v4 fetchOptions];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self objectIDs];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMRemindersDataViewInvocation_fetchByObjectID *)self fetchOptions];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (REMReminderFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOptions, 0);

  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end