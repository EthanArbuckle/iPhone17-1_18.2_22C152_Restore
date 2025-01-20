@interface PKCreditAccountUserActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCreditAccountUserActivity:(id)a3;
- (NSDecimalNumber)adjustedPurchases;
- (NSDecimalNumber)pendingPurchases;
- (NSDecimalNumber)purchases;
- (NSDecimalNumber)rewardsBalance;
- (NSDecimalNumber)rewardsEarned;
- (NSDecimalNumber)rewardsRedeemed;
- (NSDecimalNumber)totalSpending;
- (NSString)accountUserAltDSID;
- (PKCreditAccountUserActivity)initWithCoder:(id)a3;
- (PKCreditAccountUserActivity)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)remainingMonthlySpendWithLimit:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setAdjustedPurchases:(id)a3;
- (void)setPendingPurchases:(id)a3;
- (void)setPurchases:(id)a3;
- (void)setRewardsBalance:(id)a3;
- (void)setRewardsEarned:(id)a3;
- (void)setRewardsRedeemed:(id)a3;
@end

@implementation PKCreditAccountUserActivity

- (PKCreditAccountUserActivity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKCreditAccountUserActivity;
  v5 = [(PKCreditAccountUserActivity *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"purchases"];
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 PKDecimalNumberFromStringForKey:@"adjustedPurchases"];
    adjustedPurchases = v5->_adjustedPurchases;
    v5->_adjustedPurchases = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"pendingPurchases"];
    pendingPurchases = v5->_pendingPurchases;
    v5->_pendingPurchases = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"rewardsEarned"];
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKDecimalNumberFromStringForKey:@"rewardsRedeemed"];
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v18;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCreditAccountUserActivity *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditAccountUserActivity *)self isEqualToCreditAccountUserActivity:v5];

  return v6;
}

- (BOOL)isEqualToCreditAccountUserActivity:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_36;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_accountUserAltDSID;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_36;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_36;
    }
  }
  purchases = self->_purchases;
  uint64_t v12 = (NSDecimalNumber *)v5[2];
  if (purchases && v12)
  {
    if ((-[NSDecimalNumber isEqual:](purchases, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (purchases != v12)
  {
    goto LABEL_36;
  }
  adjustedPurchases = self->_adjustedPurchases;
  uint64_t v14 = (NSDecimalNumber *)v5[3];
  if (adjustedPurchases && v14)
  {
    if ((-[NSDecimalNumber isEqual:](adjustedPurchases, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (adjustedPurchases != v14)
  {
    goto LABEL_36;
  }
  pendingPurchases = self->_pendingPurchases;
  uint64_t v16 = (NSDecimalNumber *)v5[4];
  if (pendingPurchases && v16)
  {
    if ((-[NSDecimalNumber isEqual:](pendingPurchases, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (pendingPurchases != v16)
  {
    goto LABEL_36;
  }
  rewardsBalance = self->_rewardsBalance;
  uint64_t v18 = (NSDecimalNumber *)v5[5];
  if (rewardsBalance && v18)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsBalance, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (rewardsBalance != v18)
  {
    goto LABEL_36;
  }
  rewardsEarned = self->_rewardsEarned;
  v20 = (NSDecimalNumber *)v5[6];
  if (!rewardsEarned || !v20)
  {
    if (rewardsEarned == v20) {
      goto LABEL_32;
    }
LABEL_36:
    char v23 = 0;
    goto LABEL_37;
  }
  if ((-[NSDecimalNumber isEqual:](rewardsEarned, "isEqual:") & 1) == 0) {
    goto LABEL_36;
  }
LABEL_32:
  rewardsRedeemed = self->_rewardsRedeemed;
  v22 = (NSDecimalNumber *)v5[7];
  if (rewardsRedeemed && v22) {
    char v23 = -[NSDecimalNumber isEqual:](rewardsRedeemed, "isEqual:");
  }
  else {
    char v23 = rewardsRedeemed == v22;
  }
LABEL_37:

  return v23;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_accountUserAltDSID];
  [v3 safelyAddObject:self->_purchases];
  [v3 safelyAddObject:self->_adjustedPurchases];
  [v3 safelyAddObject:self->_pendingPurchases];
  [v3 safelyAddObject:self->_rewardsBalance];
  [v3 safelyAddObject:self->_rewardsEarned];
  [v3 safelyAddObject:self->_rewardsRedeemed];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountUserAltDSID: '%@'; ", self->_accountUserAltDSID];
  unint64_t v4 = [(NSDecimalNumber *)self->_purchases stringValue];
  [v3 appendFormat:@"purchases: '%@'; ", v4];

  v5 = [(NSDecimalNumber *)self->_adjustedPurchases stringValue];
  [v3 appendFormat:@"adjustedPurchases: '%@'; ", v5];

  BOOL v6 = [(NSDecimalNumber *)self->_pendingPurchases stringValue];
  [v3 appendFormat:@"pendingPurchases: '%@'; ", v6];

  v7 = [(NSDecimalNumber *)self->_rewardsBalance stringValue];
  [v3 appendFormat:@"rewardsBalance: '%@'; ", v7];

  uint64_t v8 = [(NSDecimalNumber *)self->_rewardsEarned stringValue];
  [v3 appendFormat:@"rewardsEarned: '%@'; ", v8];

  v9 = [(NSDecimalNumber *)self->_rewardsRedeemed stringValue];
  [v3 appendFormat:@"rewardsRedeemed: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountUserActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKCreditAccountUserActivity;
  v5 = [(PKCreditAccountUserActivity *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchases"];
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adjustedPurchases"];
    adjustedPurchases = v5->_adjustedPurchases;
    v5->_adjustedPurchases = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingPurchases"];
    pendingPurchases = v5->_pendingPurchases;
    v5->_pendingPurchases = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsEarned"];
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsRedeemed"];
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountUserAltDSID = self->_accountUserAltDSID;
  id v5 = a3;
  [v5 encodeObject:accountUserAltDSID forKey:@"accountUserAltDSID"];
  [v5 encodeObject:self->_purchases forKey:@"purchases"];
  [v5 encodeObject:self->_adjustedPurchases forKey:@"adjustedPurchases"];
  [v5 encodeObject:self->_pendingPurchases forKey:@"pendingPurchases"];
  [v5 encodeObject:self->_rewardsBalance forKey:@"rewardsBalance"];
  [v5 encodeObject:self->_rewardsEarned forKey:@"rewardsEarned"];
  [v5 encodeObject:self->_rewardsRedeemed forKey:@"rewardsRedeemed"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCreditAccountUserActivity allocWithZone:](PKCreditAccountUserActivity, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountUserAltDSID copyWithZone:a3];
  accountUserAltDSID = v5->_accountUserAltDSID;
  v5->_accountUserAltDSID = (NSString *)v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_purchases copyWithZone:a3];
  purchases = v5->_purchases;
  v5->_purchases = (NSDecimalNumber *)v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_adjustedPurchases copyWithZone:a3];
  adjustedPurchases = v5->_adjustedPurchases;
  v5->_adjustedPurchases = (NSDecimalNumber *)v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_pendingPurchases copyWithZone:a3];
  pendingPurchases = v5->_pendingPurchases;
  v5->_pendingPurchases = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_rewardsBalance copyWithZone:a3];
  rewardsBalance = v5->_rewardsBalance;
  v5->_rewardsBalance = (NSDecimalNumber *)v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_rewardsEarned copyWithZone:a3];
  rewardsEarned = v5->_rewardsEarned;
  v5->_rewardsEarned = (NSDecimalNumber *)v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_rewardsRedeemed copyWithZone:a3];
  rewardsRedeemed = v5->_rewardsRedeemed;
  v5->_rewardsRedeemed = (NSDecimalNumber *)v18;

  return v5;
}

- (NSDecimalNumber)totalSpending
{
  id v3 = [MEMORY[0x1E4F28C28] zero];
  p_adjustedPurchases = &self->_adjustedPurchases;
  adjustedPurchases = self->_adjustedPurchases;
  if (adjustedPurchases)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C28] notANumber];
    int v7 = [(NSDecimalNumber *)adjustedPurchases isEqualToNumber:v6];

    if (!v7) {
      goto LABEL_5;
    }
  }
  p_adjustedPurchases = &self->_purchases;
  purchases = self->_purchases;
  if (purchases)
  {
    v9 = [MEMORY[0x1E4F28C28] notANumber];
    char v10 = [(NSDecimalNumber *)purchases isEqualToNumber:v9];

    if ((v10 & 1) == 0)
    {
LABEL_5:
      uint64_t v11 = [v3 decimalNumberByAdding:*p_adjustedPurchases];

      id v3 = (void *)v11;
    }
  }
  pendingPurchases = self->_pendingPurchases;
  if (pendingPurchases)
  {
    v13 = [MEMORY[0x1E4F28C28] notANumber];
    char v14 = [(NSDecimalNumber *)pendingPurchases isEqualToNumber:v13];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [v3 decimalNumberByAdding:self->_pendingPurchases];

      id v3 = (void *)v15;
    }
  }
  return (NSDecimalNumber *)v3;
}

- (id)remainingMonthlySpendWithLimit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v6 = [(PKCreditAccountUserActivity *)self totalSpending];
    if ([v4 compare:v6] != -1)
    {
      uint64_t v7 = [v4 decimalNumberBySubtracting:v6];

      id v5 = (void *)v7;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
}

- (NSDecimalNumber)purchases
{
  return self->_purchases;
}

- (void)setPurchases:(id)a3
{
}

- (NSDecimalNumber)adjustedPurchases
{
  return self->_adjustedPurchases;
}

- (void)setAdjustedPurchases:(id)a3
{
}

- (NSDecimalNumber)pendingPurchases
{
  return self->_pendingPurchases;
}

- (void)setPendingPurchases:(id)a3
{
}

- (NSDecimalNumber)rewardsBalance
{
  return self->_rewardsBalance;
}

- (void)setRewardsBalance:(id)a3
{
}

- (NSDecimalNumber)rewardsEarned
{
  return self->_rewardsEarned;
}

- (void)setRewardsEarned:(id)a3
{
}

- (NSDecimalNumber)rewardsRedeemed
{
  return self->_rewardsRedeemed;
}

- (void)setRewardsRedeemed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsRedeemed, 0);
  objc_storeStrong((id *)&self->_rewardsEarned, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
  objc_storeStrong((id *)&self->_pendingPurchases, 0);
  objc_storeStrong((id *)&self->_adjustedPurchases, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
}

@end