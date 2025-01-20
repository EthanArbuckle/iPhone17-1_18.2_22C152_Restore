@interface REMAccountsDataViewInvocation_fetchByExternalIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)externalIdentifiers;
- (REMAccountsDataViewInvocation_fetchByExternalIdentifier)initWithCoder:(id)a3;
- (REMAccountsDataViewInvocation_fetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAccountsDataViewInvocation_fetchByExternalIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchByExternalIdentifier)initWithExternalIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataViewInvocation_fetchByExternalIdentifier;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_externalIdentifiers, a3);
  }

  return v7;
}

- (REMAccountsDataViewInvocation_fetchByExternalIdentifier)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"externalIdentifiers"];

  if (v8)
  {
    self = [(REMAccountsDataViewInvocation_fetchByExternalIdentifier *)self initWithExternalIdentifiers:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMAccountsDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
  [v4 encodeObject:v5 forKey:@"externalIdentifiers"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMAccountsDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
    uint64_t v6 = [v4 externalIdentifiers];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMAccountsDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
      objc_super v9 = [v4 externalIdentifiers];
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
  v2 = [(REMAccountsDataViewInvocation_fetchByExternalIdentifier *)self externalIdentifiers];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)externalIdentifiers
{
  return self->_externalIdentifiers;
}

- (void).cxx_destruct
{
}

@end