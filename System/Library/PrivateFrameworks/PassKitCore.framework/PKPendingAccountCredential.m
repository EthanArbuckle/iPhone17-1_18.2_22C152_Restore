@interface PKPendingAccountCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)representsCredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (NSString)accountIdentifier;
- (NSString)sharingInstanceIdentifier;
- (PKPendingAccountCredential)init;
- (PKPendingAccountCredential)initWithAccountCredential:(id)a3;
- (PKPendingAccountCredential)initWithAccountIdentifier:(id)a3 feature:(unint64_t)a4 sharingInstanceIdentifier:(id)a5;
- (PKPendingAccountCredential)initWithAccountReferenceCredential:(id)a3;
- (PKPendingAccountCredential)initWithCoder:(id)a3;
- (id)credential;
- (id)initForDatabase;
- (id)type;
- (unint64_t)feature;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setFeature:(unint64_t)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
@end

@implementation PKPendingAccountCredential

- (PKPendingAccountCredential)init
{
  return 0;
}

- (id)initForDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingAccountCredential;
  return [(PKPendingAccountCredential *)&v3 init];
}

- (PKPendingAccountCredential)initWithAccountCredential:(id)a3
{
  id v4 = a3;
  v5 = [v4 account];
  v6 = [v5 accountIdentifier];
  v12.receiver = self;
  v12.super_class = (Class)PKPendingAccountCredential;
  v7 = [(PKPendingProvisioning *)&v12 initWithUniqueIdentifier:v6 status:1];

  if (v7)
  {
    uint64_t v8 = [v5 accountIdentifier];
    accountIdentifier = v7->_accountIdentifier;
    v7->_accountIdentifier = (NSString *)v8;

    v7->_feature = [v5 feature];
    v10 = [v4 state];
    [(PKPendingProvisioning *)v7 setProvisioningState:v10];
  }
  return v7;
}

- (PKPendingAccountCredential)initWithAccountReferenceCredential:(id)a3
{
  id v4 = a3;
  v5 = [v4 accountIdentifier];
  v11.receiver = self;
  v11.super_class = (Class)PKPendingAccountCredential;
  v6 = [(PKPendingProvisioning *)&v11 initWithUniqueIdentifier:v5 status:1];

  if (v6)
  {
    uint64_t v7 = [v4 accountIdentifier];
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSString *)v7;

    v6->_feature = [v4 feature];
    v9 = [v4 state];
    [(PKPendingProvisioning *)v6 setProvisioningState:v9];
  }
  return v6;
}

- (PKPendingAccountCredential)initWithAccountIdentifier:(id)a3 feature:(unint64_t)a4 sharingInstanceIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPendingAccountCredential;
  objc_super v11 = [(PKPendingProvisioning *)&v15 initWithUniqueIdentifier:v9 status:1];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountIdentifier, a3);
    v12->_feature = a4;
    objc_storeStrong((id *)&v12->_sharingInstanceIdentifier, a5);
    v13 = objc_alloc_init(PKSecureElementProvisioningState);
    [(PKPendingProvisioning *)v12 setProvisioningState:v13];
  }
  return v12;
}

- (id)type
{
  return @"AccountCredential";
}

- (BOOL)representsCredential:(id)a3
{
  id v4 = a3;
  if ([v4 isAccountCredential])
  {
    v5 = [v4 accountCredential];
    v6 = [v5 account];
    uint64_t v7 = [(NSString *)v6 accountIdentifier];
    accountIdentifier = self->_accountIdentifier;
    id v9 = v7;
    id v10 = accountIdentifier;
    if (v9 == v10)
    {
    }
    else
    {
      objc_super v11 = v10;
      if (!v9 || !v10)
      {

LABEL_17:
        BOOL v18 = 0;
        goto LABEL_18;
      }
      BOOL v12 = [(NSString *)v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_17;
      }
    }
    BOOL v18 = [(NSString *)v6 feature] == self->_feature;
LABEL_18:

LABEL_23:
    goto LABEL_24;
  }
  if ([v4 isAccountReferenceCredential])
  {
    v5 = [v4 accountReferenceCredential];
    v13 = [v5 accountIdentifier];
    v14 = self->_accountIdentifier;
    v6 = v13;
    objc_super v15 = v14;
    if (v6 == v15)
    {
    }
    else
    {
      v16 = v15;
      if (!v6 || !v15)
      {

LABEL_22:
        BOOL v18 = 0;
        goto LABEL_23;
      }
      BOOL v17 = [(NSString *)v6 isEqualToString:v15];

      if (!v17) {
        goto LABEL_22;
      }
    }
    BOOL v18 = [v5 feature] == self->_feature;
    goto LABEL_23;
  }
  BOOL v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)representsPass:(id)a3
{
  id v4 = a3;
  if ([v4 associatedAccountFeatureIdentifier] == self->_feature)
  {
    v5 = [v4 associatedAccountServiceAccountIdentifier];
    v6 = v5;
    accountIdentifier = self->_accountIdentifier;
    if (v5 && accountIdentifier) {
      char v8 = -[NSString isEqual:](v5, "isEqual:");
    }
    else {
      char v8 = v5 == accountIdentifier;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)credential
{
  objc_super v3 = [[PKAccountReferenceCredential alloc] initWithAccountIdentifier:self->_accountIdentifier feature:self->_feature];
  [(PKAccountReferenceCredential *)v3 setSharingInstanceIdentifier:self->_sharingInstanceIdentifier];
  id v4 = [(PKPendingProvisioning *)self provisioningState];

  if (v4)
  {
    v5 = [(PKPendingProvisioning *)self provisioningState];
    [(PKPaymentCredential *)v3 setState:v5];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingAccountCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPendingAccountCredential;
  v5 = [(PKPendingProvisioning *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feature"];
    v5->_feature = PKFeatureIdentifierFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInstanceIdentifier"];
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPendingAccountCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, @"accountIdentifier", v6.receiver, v6.super_class);
  v5 = PKFeatureIdentifierToString(self->_feature);
  [v4 encodeObject:v5 forKey:@"feature"];

  [v4 encodeObject:self->_sharingInstanceIdentifier forKey:@"sharingInstanceIdentifier"];
}

- (void)_copyIntoPendingProvision:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPendingAccountCredential;
  id v4 = a3;
  [(PKPendingProvisioning *)&v9 _copyIntoPendingProvision:v4];
  uint64_t v5 = [(NSString *)self->_accountIdentifier copy];
  objc_super v6 = (void *)v4[7];
  v4[7] = v5;

  v4[8] = self->_feature;
  uint64_t v7 = [(NSString *)self->_sharingInstanceIdentifier copy];
  char v8 = (void *)v4[9];
  v4[9] = v7;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end