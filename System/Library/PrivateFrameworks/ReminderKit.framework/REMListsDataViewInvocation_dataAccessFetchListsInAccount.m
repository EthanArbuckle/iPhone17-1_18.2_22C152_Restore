@interface REMListsDataViewInvocation_dataAccessFetchListsInAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMListsDataViewInvocation_dataAccessFetchListsInAccount)initWithCoder:(id)a3;
- (REMListsDataViewInvocation_dataAccessFetchListsInAccount)initWithParentAccountObjectID:(id)a3;
- (REMObjectID)accountObjectID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListsDataViewInvocation_dataAccessFetchListsInAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_dataAccessFetchListsInAccount)initWithParentAccountObjectID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListsDataViewInvocation_dataAccessFetchListsInAccount;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountObjectID, a3);
  }

  return v7;
}

- (REMListsDataViewInvocation_dataAccessFetchListsInAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountObjectID"];

  if (v5)
  {
    self = [(REMListsDataViewInvocation_dataAccessFetchListsInAccount *)self initWithParentAccountObjectID:v5];
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
  id v5 = [(REMListsDataViewInvocation_dataAccessFetchListsInAccount *)self accountObjectID];
  [v4 encodeObject:v5 forKey:@"accountObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMListsDataViewInvocation_dataAccessFetchListsInAccount *)self accountObjectID];
    uint64_t v6 = [v4 accountObjectID];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMListsDataViewInvocation_dataAccessFetchListsInAccount *)self accountObjectID];
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
  v2 = [(REMListsDataViewInvocation_dataAccessFetchListsInAccount *)self accountObjectID];
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