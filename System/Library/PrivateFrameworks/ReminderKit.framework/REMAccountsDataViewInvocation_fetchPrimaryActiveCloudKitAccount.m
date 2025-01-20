@interface REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchREMObjectIDOnly;
- (BOOL)isEqual:(id)a3;
- (REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount)initWithCoder:(id)a3;
- (REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount)initWithFetchREMObjectIDOnly:(BOOL)a3;
- (id)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount)initWithFetchREMObjectIDOnly:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount;
  result = [(REMStoreInvocationValueStorage *)&v5 init];
  if (result) {
    result->_fetchREMObjectIDOnly = a3;
  }
  return result;
}

- (REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"fetchREMObjectIDOnly"];

  return [(REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *)self initWithFetchREMObjectIDOnly:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount fetchREMObjectIDOnly](self, "fetchREMObjectIDOnly"), @"fetchREMObjectIDOnly");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *)self fetchREMObjectIDOnly];
    int v6 = v5 ^ [v4 fetchREMObjectIDOnly] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *)self fetchREMObjectIDOnly];
}

- (id)name
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount;
  id v4 = [(REMStoreInvocation *)&v9 name];
  BOOL v5 = [(REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *)self fetchREMObjectIDOnly];
  int v6 = &stru_1F1339A18;
  if (v5) {
    int v6 = @"(fetchREMObjectIDOnly)";
  }
  v7 = [v3 stringWithFormat:@"%@%@", v4, v6];

  return v7;
}

- (BOOL)fetchREMObjectIDOnly
{
  return self->_fetchREMObjectIDOnly;
}

@end