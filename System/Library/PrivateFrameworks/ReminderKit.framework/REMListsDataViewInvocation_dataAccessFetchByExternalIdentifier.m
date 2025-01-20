@interface REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)externalIdentifiers;
- (REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier)initWithCoder:(id)a3;
- (REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3 accountObjectID:(id)a4;
- (REMObjectID)accountObjectID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3 accountObjectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier;
  v9 = [(REMStoreInvocationValueStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_externalIdentifiers, a3);
    objc_storeStrong((id *)&v10->_accountObjectID, a4);
  }

  return v10;
}

- (REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"externalIdentifiers"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"accountObjectID"];

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
    self = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self initWithExternalIdentifiers:v8 accountObjectID:v9];
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self externalIdentifiers];
  [v4 encodeObject:v5 forKey:@"externalIdentifiers"];

  id v6 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self accountObjectID];
  [v4 encodeObject:v6 forKey:@"accountObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self externalIdentifiers];
  uint64_t v6 = [v4 externalIdentifiers];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self externalIdentifiers];
    v9 = [v4 externalIdentifiers];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self accountObjectID];
  uint64_t v13 = [v4 accountObjectID];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self accountObjectID];
    v16 = [v4 accountObjectID];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self externalIdentifiers];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)self accountObjectID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSArray)externalIdentifiers
{
  return self->_externalIdentifiers;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);

  objc_storeStrong((id *)&self->_externalIdentifiers, 0);
}

@end