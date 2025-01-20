@interface PKCloudRecordAccount
+ (BOOL)supportsSecureCoding;
- (PKAccount)account;
- (PKCloudRecordAccount)initWithCoder:(id)a3;
- (id)_descriptionWithIncludeItem:(BOOL)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)item;
- (int64_t)compare:(id)a3;
- (void)applyCloudRecordObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
@end

@implementation PKCloudRecordAccount

- (id)item
{
  return self->_account;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordAccount;
  v5 = [(PKCloudRecordObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (PKAccount *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordAccount;
  id v4 = a3;
  [(PKCloudRecordObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, @"account", v5.receiver, v5.super_class);
}

- (int64_t)compare:(id)a3
{
  account = self->_account;
  id v4 = a3;
  objc_super v5 = [(PKAccount *)account accountIdentifier];
  uint64_t v6 = [v4 account];

  v7 = [v6 accountIdentifier];
  int64_t v8 = [v5 compare:v7];

  return v8;
}

- (id)descriptionWithItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = -[PKCloudRecordAccount _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordAccount;
  uint64_t v6 = [(PKCloudRecordObject *)&v8 descriptionWithItem:v3];
  [v5 appendFormat:@"\n%@", v6];

  return v5;
}

- (id)description
{
  BOOL v3 = [(PKCloudRecordAccount *)self _descriptionWithIncludeItem:0];
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordAccount;
  id v4 = [(PKCloudRecordObject *)&v6 description];
  [v3 appendFormat:@"\n%@", v4];

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E78] string];
  account = self->_account;
  if (account)
  {
    if (v3)
    {
      v7 = [(PKAccount *)account accountIdentifier];
      objc_super v8 = PKFeatureIdentifierToString([(PKAccount *)self->_account feature]);
      [v5 appendFormat:@"account: id: %@, feature: %@\n", v7, v8];
    }
  }
  else
  {
    [v5 appendFormat:@"No associated account in database\n"];
  }
  return v5;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordAccount;
    [(PKCloudRecordObject *)&v10 applyCloudRecordObject:v4];
    id v5 = v4;
    objc_super v6 = v5;
    if (!self->_account)
    {
      v7 = [v5 account];

      if (v7)
      {
        objc_super v8 = [v6 account];
        account = self->_account;
        self->_account = v8;
      }
    }
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end