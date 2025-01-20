@interface REMRemindersDataViewInvocation_fetchByExternalIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)externalIdentifiers;
- (REMObjectID)listObjectID;
- (REMRemindersDataViewInvocation_fetchByExternalIdentifier)initWithCoder:(id)a3;
- (REMRemindersDataViewInvocation_fetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3 listObjectID:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocation_fetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3 listObjectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMRemindersDataViewInvocation_fetchByExternalIdentifier;
  v9 = [(REMStoreInvocationValueStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_externalIdentifiers, a3);
    objc_storeStrong((id *)&v10->_listObjectID, a4);
  }

  return v10;
}

- (REMRemindersDataViewInvocation_fetchByExternalIdentifier)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"externalIdentifiers"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"listObjectID"];

  if (v8)
  {
    self = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self initWithExternalIdentifiers:v8 listObjectID:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
  [v4 encodeObject:v5 forKey:@"externalIdentifiers"];

  id v6 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self listObjectID];
  [v4 encodeObject:v6 forKey:@"listObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
  uint64_t v6 = [v4 externalIdentifiers];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
    v9 = [v4 externalIdentifiers];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self listObjectID];
  uint64_t v13 = [v4 listObjectID];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self listObjectID];
    v16 = [v4 listObjectID];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self listObjectID];
  id v4 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
  unint64_t v5 = [v4 hash];
  if (v3)
  {
    uint64_t v6 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)self listObjectID];
    v5 ^= [v6 hash];
  }
  return v5;
}

- (NSArray)externalIdentifiers
{
  return self->_externalIdentifiers;
}

- (REMObjectID)listObjectID
{
  return self->_listObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listObjectID, 0);

  objc_storeStrong((id *)&self->_externalIdentifiers, 0);
}

@end