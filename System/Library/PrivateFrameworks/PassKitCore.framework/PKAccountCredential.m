@interface PKAccountCredential
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSuperEasyProvisioning;
- (NSString)ownershipTokenIdentifier;
- (NSString)sharingInstanceIdentifier;
- (PKAccount)account;
- (PKAccountCredential)initWithAccount:(id)a3;
- (PKAccountWebServicePassDetailsResponse)passDetailsResponse;
- (PKPaymentPass)paymentPass;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)longDescription;
- (unint64_t)hash;
- (void)setPassDetailsResponse:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
@end

@implementation PKAccountCredential

- (PKAccountCredential)initWithAccount:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAccountCredential;
    v6 = [(PKPaymentCredential *)&v10 init];
    v7 = v6;
    if (v6)
    {
      p_account = (id *)&v6->_account;
      objc_storeStrong((id *)&v6->_account, a3);
      [(PKPaymentCredential *)v7 setCardType:1];
      -[PKPaymentCredential setCredentialType:](v7, "setCredentialType:", PKAccountCredentialType([*p_account feature], *p_account));
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKAccountCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  account = self->_account;
  id v4 = a3;
  BOOL v5 = [(PKAccount *)account accountIdentifier];
  v6 = [v4 account];

  v7 = [v6 accountIdentifier];
  id v8 = v5;
  id v9 = v7;
  objc_super v10 = v9;
  if (v8 == v9)
  {
    char v12 = 1;
  }
  else
  {
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11) {
      char v12 = 0;
    }
    else {
      char v12 = [v8 isEqualToString:v9];
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PKAccount *)self->_account accountIdentifier];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash(17, v3);
  return v5;
}

- (id)longDescription
{
  uint64_t v2 = [(PKAccount *)self->_account feature];
  return PKLocalizedFeatureString(@"APPLY_FLOW_ACCOUNT_TITLE", v2, 0, v3, v4, v5, v6, v7, v10);
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  if ([(PKAccount *)self->_account type] == 1)
  {
    uint64_t v4 = [(PKAccount *)self->_account creditDetails];
    uint64_t v5 = [v4 accountSummary];
    uint64_t v6 = [v5 creditLimit];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28C28] notANumber];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        id v9 = 0;
      }
      else
      {
        uint64_t v10 = [v4 currencyCode];
        BOOL v11 = PKFormattedCurrencyStringFromNumber(v6, v10);

        id v9 = PKLocalizedFeatureString(@"APPLY_ON_FILE_SUBTITLE", 2, @"%@", v12, v13, v14, v15, v16, (uint64_t)v11);
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (NSString)ownershipTokenIdentifier
{
  return [(PKAccountWebServicePassDetailsResponse *)self->_passDetailsResponse ownershipTokenIdentifier];
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (PKAccountWebServicePassDetailsResponse)passDetailsResponse
{
  return self->_passDetailsResponse;
}

- (void)setPassDetailsResponse:(id)a3
{
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
  objc_storeStrong((id *)&self->_passDetailsResponse, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end