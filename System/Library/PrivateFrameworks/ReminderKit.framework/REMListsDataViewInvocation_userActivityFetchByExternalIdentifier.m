@interface REMListsDataViewInvocation_userActivityFetchByExternalIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)externalIdentifier;
- (REMListsDataViewInvocation_userActivityFetchByExternalIdentifier)initWithCoder:(id)a3;
- (REMListsDataViewInvocation_userActivityFetchByExternalIdentifier)initWithExternalIdentifier:(id)a3 accountObjectID:(id)a4;
- (REMObjectID)accountObjectID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListsDataViewInvocation_userActivityFetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_userActivityFetchByExternalIdentifier)initWithExternalIdentifier:(id)a3 accountObjectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMListsDataViewInvocation_userActivityFetchByExternalIdentifier;
  v9 = [(REMStoreInvocationValueStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_externalIdentifier, a3);
    objc_storeStrong((id *)&v10->_accountObjectID, a4);
  }

  return v10;
}

- (REMListsDataViewInvocation_userActivityFetchByExternalIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountObjectID"];

  if (v5)
  {
    self = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self initWithExternalIdentifier:v5 accountObjectID:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self externalIdentifier];
  [v4 encodeObject:v5 forKey:@"externalIdentifier"];

  id v6 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self accountObjectID];
  [v4 encodeObject:v6 forKey:@"accountObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self externalIdentifier];
  uint64_t v6 = [v4 externalIdentifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self externalIdentifier];
    v9 = [v4 externalIdentifier];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self accountObjectID];
  uint64_t v13 = [v4 accountObjectID];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self accountObjectID];
    v16 = [v4 accountObjectID];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self accountObjectID];
  id v4 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self externalIdentifier];
  unint64_t v5 = [v4 hash];
  if (v3)
  {
    uint64_t v6 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)self accountObjectID];
    v5 ^= [v6 hash];
  }
  return v5;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObjectID, 0);

  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

@end