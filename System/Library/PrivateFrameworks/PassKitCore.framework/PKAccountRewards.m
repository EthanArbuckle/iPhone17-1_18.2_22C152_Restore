@interface PKAccountRewards
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountEvent:(id)a3;
- (NSSet)rewardsAddedIdentifiers;
- (NSSet)transactionIdentifiers;
- (NSString)description;
- (NSString)identifier;
- (NSString)status;
- (PKAccountRewards)initWithCoder:(id)a3;
- (PKAccountRewards)initWithRecord:(id)a3;
- (PKCurrencyAmount)currencyAmount;
- (PKPaymentTransactionRewards)rewards;
- (int64_t)statusCode;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRewards:(id)a3;
- (void)setRewardsAddedIdentifiers:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setTransactionIdentifiers:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountRewards

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountRewards)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKAccountRewards;
  v5 = [(PKAccountRewards *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v10;

    v5->_statusCode = [v4 decodeIntegerForKey:@"statusCode"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewards"];
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"transactionIdentifiers"];
    transactionIdentifiers = v5->_transactionIdentifiers;
    v5->_transactionIdentifiers = (NSSet *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v16 forKey:@"rewardsAddedIdentifiers"];
    rewardsAddedIdentifiers = v5->_rewardsAddedIdentifiers;
    v5->_rewardsAddedIdentifiers = (NSSet *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_status forKey:@"status"];
  [v5 encodeInteger:self->_statusCode forKey:@"statusCode"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_rewards forKey:@"rewards"];
  [v5 encodeObject:self->_transactionIdentifiers forKey:@"transactionIdentifiers"];
  [v5 encodeObject:self->_rewardsAddedIdentifiers forKey:@"rewardsAddedIdentifiers"];
}

- (PKAccountRewards)initWithRecord:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountRewards;
  id v5 = [(PKAccountRewards *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"amount");
    v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    if (v9 && v8)
    {
      uint64_t v11 = PKCurrencyAmountCreate(v9, v8, 0);
      currencyAmount = v5->_currencyAmount;
      v5->_currencyAmount = (PKCurrencyAmount *)v11;
    }
    uint64_t v13 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"status");
    status = v5->_status;
    v5->_status = (NSString *)v13;

    v5->_statusCode = (int)objc_msgSend(v4, "pk_encryptedIntForKey:", @"statusCode");
    uint64_t v15 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"type");
    v5->_type = PKAccountRewardRedemptionTypeFromString(v15);

    v16 = [PKPaymentTransactionRewards alloc];
    uint64_t v17 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"rewards");
    uint64_t v18 = [(PKPaymentTransactionRewards *)v16 initWithJsonString:v17];
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    objc_super v22 = objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v21, @"transactionIdentifiers");
    uint64_t v23 = [v20 setWithArray:v22];
    transactionIdentifiers = v5->_transactionIdentifiers;
    v5->_transactionIdentifiers = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    v26 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v27 = objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v26, @"rewardsAddedIdentifiers");
    uint64_t v28 = [v25 setWithArray:v27];
    rewardsAddedIdentifiers = v5->_rewardsAddedIdentifiers;
    v5->_rewardsAddedIdentifiers = (NSSet *)v28;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v20 = [a3 encryptedValues];
  [v20 setObject:self->_identifier forKey:@"identifier"];
  id v4 = [(PKCurrencyAmount *)self->_currencyAmount amount];
  id v5 = [v4 stringValue];
  [v20 setObject:v5 forKey:@"amount"];

  uint64_t v6 = [(PKCurrencyAmount *)self->_currencyAmount currency];
  [v20 setObject:v6 forKey:@"currencyCode"];

  [v20 setObject:self->_status forKey:@"status"];
  v7 = [NSNumber numberWithInteger:self->_statusCode];
  [v20 setObject:v7 forKey:@"statusCode"];

  uint64_t v8 = PKAccountRewardRedemptionTypeToString(self->_type);
  [v20 setObject:v8 forKey:@"type"];

  v9 = [(PKPaymentTransactionRewards *)self->_rewards jsonString];
  [v20 setObject:v9 forKey:@"rewards"];

  if (self->_transactionIdentifiers)
  {
    id v10 = [NSString alloc];
    uint64_t v11 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v12 = [(NSSet *)self->_transactionIdentifiers allObjects];
    uint64_t v13 = [v11 dataWithJSONObject:v12 options:0 error:0];
    v14 = (void *)[v10 initWithData:v13 encoding:4];

    [v20 setObject:v14 forKey:@"transactionIdentifiers"];
  }
  if (self->_rewardsAddedIdentifiers)
  {
    id v15 = [NSString alloc];
    v16 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v17 = [(NSSet *)self->_rewardsAddedIdentifiers allObjects];
    uint64_t v18 = [v16 dataWithJSONObject:v17 options:0 error:0];
    uint64_t v19 = (void *)[v15 initWithData:v18 encoding:4];

    [v20 setObject:v19 forKey:@"rewardsAddedIdentifiers"];
  }
}

+ (id)recordType
{
  return @"Rewards";
}

+ (id)recordNamePrefix
{
  return @"rewardsRedeemed-";
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_status];
  [v3 safelyAddObject:self->_rewards];
  [v3 safelyAddObject:self->_transactionIdentifiers];
  [v3 safelyAddObject:self->_rewardsAddedIdentifiers];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_statusCode - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKAccountRewards *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountRewards *)self isEqualToAccountEvent:v5];

  return v6;
}

- (BOOL)isEqualToAccountEvent:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[1];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_36;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_36;
  }
  currencyAmount = self->_currencyAmount;
  v9 = (PKCurrencyAmount *)v4[2];
  if (currencyAmount && v9)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_36;
    }
  }
  else if (currencyAmount != v9)
  {
    goto LABEL_36;
  }
  status = self->_status;
  uint64_t v11 = (NSString *)v4[3];
  if (status && v11)
  {
    if ((-[NSString isEqual:](status, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (status != v11)
  {
    goto LABEL_36;
  }
  rewards = self->_rewards;
  uint64_t v13 = (PKPaymentTransactionRewards *)v4[5];
  if (rewards && v13)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewards, "isEqual:")) {
      goto LABEL_36;
    }
  }
  else if (rewards != v13)
  {
    goto LABEL_36;
  }
  transactionIdentifiers = self->_transactionIdentifiers;
  id v15 = (NSSet *)v4[7];
  if (transactionIdentifiers && v15)
  {
    if ((-[NSSet isEqual:](transactionIdentifiers, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (transactionIdentifiers != v15)
  {
    goto LABEL_36;
  }
  rewardsAddedIdentifiers = self->_rewardsAddedIdentifiers;
  uint64_t v17 = (NSSet *)v4[8];
  if (!rewardsAddedIdentifiers || !v17)
  {
    if (rewardsAddedIdentifiers == v17) {
      goto LABEL_34;
    }
LABEL_36:
    BOOL v18 = 0;
    goto LABEL_37;
  }
  if ((-[NSSet isEqual:](rewardsAddedIdentifiers, "isEqual:") & 1) == 0) {
    goto LABEL_36;
  }
LABEL_34:
  if (self->_statusCode != v4[4]) {
    goto LABEL_36;
  }
  BOOL v18 = self->_type == v4[6];
LABEL_37:

  return v18;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  uint64_t v4 = [(PKCurrencyAmount *)self->_currencyAmount description];
  [v3 appendFormat:@"currencyAmount: '%@'; ", v4];

  unint64_t v5 = PKAccountRewardRedemptionTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v5];

  BOOL v6 = [(NSString *)self->_status description];
  [v3 appendFormat:@"status: '%@'; ", v6];

  objc_msgSend(v3, "appendFormat:", @"statusCode: '%lu'; ", self->_statusCode);
  BOOL v7 = [(PKPaymentTransactionRewards *)self->_rewards description];
  [v3 appendFormat:@"rewards: '%@'; ", v7];

  uint64_t v8 = [(NSSet *)self->_rewardsAddedIdentifiers description];
  [v3 appendFormat:@"rewardsAddedIdentifier: '%@'; ", v8];

  v9 = [(NSSet *)self->_transactionIdentifiers description];
  [v3 appendFormat:@"transactionIdentifiers: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (PKPaymentTransactionRewards)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSSet)transactionIdentifiers
{
  return self->_transactionIdentifiers;
}

- (void)setTransactionIdentifiers:(id)a3
{
}

- (NSSet)rewardsAddedIdentifiers
{
  return self->_rewardsAddedIdentifiers;
}

- (void)setRewardsAddedIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsAddedIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionIdentifiers, 0);
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end