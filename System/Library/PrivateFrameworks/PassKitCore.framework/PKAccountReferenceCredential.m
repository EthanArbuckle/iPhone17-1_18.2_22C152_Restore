@interface PKAccountReferenceCredential
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSuperEasyProvisioning;
- (NSString)accountIdentifier;
- (NSString)sharingInstanceIdentifier;
- (PKAccountReferenceCredential)initWithAccountIdentifier:(id)a3 feature:(unint64_t)a4;
- (unint64_t)feature;
- (unint64_t)hash;
- (void)setSharingInstanceIdentifier:(id)a3;
@end

@implementation PKAccountReferenceCredential

- (PKAccountReferenceCredential)initWithAccountIdentifier:(id)a3 feature:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountReferenceCredential;
  v8 = [(PKPaymentCredential *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_feature = a4;
    [(PKPaymentCredential *)v9 setCardType:1];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountReferenceCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKAccountReferenceCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  v6 = [v4 accountIdentifier];
  id v7 = accountIdentifier;
  v8 = v6;
  v9 = v8;
  if (v7 != v8)
  {
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
    }
    else
    {
      BOOL v11 = [(NSString *)v7 isEqualToString:v8];

      if (v11) {
        goto LABEL_10;
      }
    }
    BOOL v12 = 0;
    goto LABEL_12;
  }

LABEL_10:
  BOOL v12 = self->_feature == v4[14];
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_accountIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)feature
{
  return self->_feature;
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