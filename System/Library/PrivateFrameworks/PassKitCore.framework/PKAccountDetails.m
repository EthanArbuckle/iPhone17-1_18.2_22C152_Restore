@interface PKAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKAccountDetails)initWithAppleBalanceDetails:(id)a3;
- (PKAccountDetails)initWithCloudRecord:(id)a3 type:(unint64_t)a4;
- (PKAccountDetails)initWithCoder:(id)a3;
- (PKAccountDetails)initWithCreditDetails:(id)a3;
- (PKAccountDetails)initWithDictionary:(id)a3 type:(unint64_t)a4;
- (PKAccountDetails)initWithPayLaterDetails:(id)a3;
- (PKAccountDetails)initWithSavingsDetails:(id)a3;
- (PKAppleBalanceAccountDetails)appleBalanceDetails;
- (PKCreditAccountDetails)creditDetails;
- (PKPayLaterAccountDetails)payLaterDetails;
- (PKSavingsAccountDetails)savingsDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCloudRecord:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)ingestExtendedAccountDetails:(id)a3;
@end

@implementation PKAccountDetails

- (PKAccountDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountDetails;
  v7 = [(PKAccountDetails *)&v14 init];
  if (v7)
  {
    switch(a4)
    {
      case 1uLL:
        v8 = [[PKCreditAccountDetails alloc] initWithDictionary:v6];
        creditDetails = v7->_creditDetails;
        v7->_creditDetails = v8;
        goto LABEL_7;
      case 2uLL:
        v10 = [[PKPayLaterAccountDetails alloc] initWithDictionary:v6];
        creditDetails = v7->_payLaterDetails;
        v7->_payLaterDetails = v10;
        goto LABEL_7;
      case 3uLL:
        v11 = [[PKAppleBalanceAccountDetails alloc] initWithDictionary:v6];
        creditDetails = v7->_appleBalanceDetails;
        v7->_appleBalanceDetails = v11;
        goto LABEL_7;
      case 4uLL:
        v12 = [[PKSavingsAccountDetails alloc] initWithDictionary:v6];
        creditDetails = v7->_savingsDetails;
        v7->_savingsDetails = v12;
LABEL_7:

        break;
      default:
        break;
    }
    v7->_type = a4;
  }

  return v7;
}

- (PKAccountDetails)initWithCreditDetails:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  id v6 = [(PKAccountDetails *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_creditDetails, a3);
    v7->_type = 1;
  }

  return v7;
}

- (PKAccountDetails)initWithPayLaterDetails:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  id v6 = [(PKAccountDetails *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterDetails, a3);
    v7->_type = 2;
  }

  return v7;
}

- (PKAccountDetails)initWithAppleBalanceDetails:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  id v6 = [(PKAccountDetails *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleBalanceDetails, a3);
    v7->_type = 3;
  }

  return v7;
}

- (PKAccountDetails)initWithSavingsDetails:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  id v6 = [(PKAccountDetails *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_savingsDetails, a3);
    v7->_type = 4;
  }

  return v7;
}

- (PKAccountDetails)initWithCloudRecord:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountDetails;
  v7 = [(PKAccountDetails *)&v11 init];
  if (v7)
  {
    if (a4 == 3)
    {
      v8 = [[PKAppleBalanceAccountDetails alloc] initWithCloudRecord:v6];
      appleBalanceDetails = v7->_appleBalanceDetails;
      v7->_appleBalanceDetails = v8;
    }
    v7->_type = a4;
  }

  return v7;
}

- (void)ingestExtendedAccountDetails:(id)a3
{
  if (self->_type == 1) {
    [(PKCreditAccountDetails *)self->_creditDetails ingestExtendedAccountDetails:a3];
  }
}

- (void)encodeWithCloudRecord:(id)a3 codingType:(unint64_t)a4
{
  if (self->_type == 3) {
    [(PKAppleBalanceAccountDetails *)self->_appleBalanceDetails encodeWithCloudRecord:a3 codingType:a4];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountDetails;
  id v5 = [(PKAccountDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditDetails"];
    creditDetails = v5->_creditDetails;
    v5->_creditDetails = (PKCreditAccountDetails *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payLaterDetails"];
    payLaterDetails = v5->_payLaterDetails;
    v5->_payLaterDetails = (PKPayLaterAccountDetails *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleBalanceDetails"];
    appleBalanceDetails = v5->_appleBalanceDetails;
    v5->_appleBalanceDetails = (PKAppleBalanceAccountDetails *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savingsDetails"];
    savingsDetails = v5->_savingsDetails;
    v5->_savingsDetails = (PKSavingsAccountDetails *)v12;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  creditDetails = self->_creditDetails;
  id v5 = a3;
  [v5 encodeObject:creditDetails forKey:@"creditDetails"];
  [v5 encodeObject:self->_payLaterDetails forKey:@"payLaterDetails"];
  [v5 encodeObject:self->_appleBalanceDetails forKey:@"appleBalanceDetails"];
  [v5 encodeObject:self->_savingsDetails forKey:@"savingsDetails"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)description
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [*((id *)&self->_creditDetails + v2) description];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  creditDetails = self->_creditDetails;
  uint64_t v6 = (PKCreditAccountDetails *)v4[1];
  if (creditDetails && v6)
  {
    if (!-[PKCreditAccountDetails isEqual:](creditDetails, "isEqual:")) {
      goto LABEL_22;
    }
  }
  else if (creditDetails != v6)
  {
    goto LABEL_22;
  }
  payLaterDetails = self->_payLaterDetails;
  uint64_t v8 = (PKPayLaterAccountDetails *)v4[2];
  if (payLaterDetails && v8)
  {
    if (!-[PKPayLaterAccountDetails isEqual:](payLaterDetails, "isEqual:")) {
      goto LABEL_22;
    }
  }
  else if (payLaterDetails != v8)
  {
    goto LABEL_22;
  }
  appleBalanceDetails = self->_appleBalanceDetails;
  uint64_t v10 = (PKAppleBalanceAccountDetails *)v4[3];
  if (appleBalanceDetails && v10)
  {
    if (!-[PKAppleBalanceAccountDetails isEqual:](appleBalanceDetails, "isEqual:")) {
      goto LABEL_22;
    }
  }
  else if (appleBalanceDetails != v10)
  {
    goto LABEL_22;
  }
  savingsDetails = self->_savingsDetails;
  uint64_t v12 = (PKSavingsAccountDetails *)v4[4];
  if (!savingsDetails || !v12)
  {
    if (savingsDetails == v12) {
      goto LABEL_20;
    }
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  if (!-[PKSavingsAccountDetails isEqual:](savingsDetails, "isEqual:")) {
    goto LABEL_22;
  }
LABEL_20:
  BOOL v13 = self->_type == v4[5];
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_creditDetails];
  [v3 safelyAddObject:self->_payLaterDetails];
  [v3 safelyAddObject:self->_appleBalanceDetails];
  [v3 safelyAddObject:self->_savingsDetails];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(PKCreditAccountDetails *)self->_creditDetails copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKPayLaterAccountDetails *)self->_payLaterDetails copyWithZone:a3];
  objc_super v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(PKAppleBalanceAccountDetails *)self->_appleBalanceDetails copyWithZone:a3];
  objc_super v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(PKSavingsAccountDetails *)self->_savingsDetails copyWithZone:a3];
  BOOL v13 = (void *)v5[4];
  v5[4] = v12;

  v5[5] = self->_type;
  return v5;
}

- (PKCreditAccountDetails)creditDetails
{
  return self->_creditDetails;
}

- (PKPayLaterAccountDetails)payLaterDetails
{
  return self->_payLaterDetails;
}

- (PKAppleBalanceAccountDetails)appleBalanceDetails
{
  return self->_appleBalanceDetails;
}

- (PKSavingsAccountDetails)savingsDetails
{
  return self->_savingsDetails;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingsDetails, 0);
  objc_storeStrong((id *)&self->_appleBalanceDetails, 0);
  objc_storeStrong((id *)&self->_payLaterDetails, 0);
  objc_storeStrong((id *)&self->_creditDetails, 0);
}

@end