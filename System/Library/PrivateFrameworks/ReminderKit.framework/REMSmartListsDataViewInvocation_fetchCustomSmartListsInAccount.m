@interface REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMObjectID)accountObjectID;
- (REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount)initWithCoder:(id)a3;
- (REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount)initWithParentAccountObjectID:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount)initWithParentAccountObjectID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountObjectID, a3);
  }

  return v7;
}

- (REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountObjectID"];

  if (v5)
  {
    self = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *)self initWithParentAccountObjectID:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *)self accountObjectID];
  [v4 encodeObject:v5 forKey:@"accountObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *)self accountObjectID];
    uint64_t v6 = [v4 accountObjectID];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *)self accountObjectID];
      objc_super v9 = [v4 accountObjectID];
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
  v2 = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *)self accountObjectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void).cxx_destruct
{
}

@end