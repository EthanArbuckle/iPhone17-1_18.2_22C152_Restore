@interface PKDashboardRewardsBalanceItem
+ (id)identifier;
- (BOOL)isRedeemable;
- (NSDate)lastFetchedAt;
- (NSSet)transactionSourceIdentifiers;
- (NSString)balanceIdentifier;
- (NSString)formattedMonetaryValue;
- (NSString)formattedQuantityValue;
- (NSString)passUniqueID;
- (NSString)programName;
- (NSURL)programURL;
- (PKDashboardRewardsBalanceItem)initWithPaymentRewardsBalance:(id)a3 passUniqueIdentifier:(id)a4 transactionSourceIdentifiers:(id)a5;
- (unint64_t)rewardsType;
- (void)setBalanceIdentifier:(id)a3;
- (void)setFormattedMonetaryValue:(id)a3;
- (void)setFormattedQuantityValue:(id)a3;
- (void)setIsRedeemable:(BOOL)a3;
- (void)setLastFetchedAt:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setProgramName:(id)a3;
- (void)setProgramURL:(id)a3;
- (void)setRewardsType:(unint64_t)a3;
- (void)setTransactionSourceIdentifiers:(id)a3;
@end

@implementation PKDashboardRewardsBalanceItem

+ (id)identifier
{
  return @"rewardsBalanceItem";
}

- (PKDashboardRewardsBalanceItem)initWithPaymentRewardsBalance:(id)a3 passUniqueIdentifier:(id)a4 transactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PKDashboardRewardsBalanceItem;
  v11 = [(PKDashboardRewardsBalanceItem *)&v29 init];
  if (v11)
  {
    uint64_t v12 = [v8 identifier];
    balanceIdentifier = v11->_balanceIdentifier;
    v11->_balanceIdentifier = (NSString *)v12;

    uint64_t v14 = [v8 programName];
    programName = v11->_programName;
    v11->_programName = (NSString *)v14;

    uint64_t v16 = [v8 programURL];
    programURL = v11->_programURL;
    v11->_programURL = (NSURL *)v16;

    v11->_rewardsType = [v8 type];
    uint64_t v18 = [v8 formattedQuantityValue];
    formattedQuantityValue = v11->_formattedQuantityValue;
    v11->_formattedQuantityValue = (NSString *)v18;

    uint64_t v20 = [v8 formattedMonetaryValue];
    formattedMonetaryValue = v11->_formattedMonetaryValue;
    v11->_formattedMonetaryValue = (NSString *)v20;

    v11->_isRedeemable = [v8 isRedeemable];
    uint64_t v22 = [v8 lastFetchedAt];
    lastFetchedAt = v11->_lastFetchedAt;
    v11->_lastFetchedAt = (NSDate *)v22;

    uint64_t v24 = [v9 copy];
    passUniqueID = v11->_passUniqueID;
    v11->_passUniqueID = (NSString *)v24;

    uint64_t v26 = [v10 copy];
    transactionSourceIdentifiers = v11->_transactionSourceIdentifiers;
    v11->_transactionSourceIdentifiers = (NSSet *)v26;
  }
  return v11;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
{
}

- (NSString)programName
{
  return self->_programName;
}

- (void)setProgramName:(id)a3
{
}

- (unint64_t)rewardsType
{
  return self->_rewardsType;
}

- (void)setRewardsType:(unint64_t)a3
{
  self->_rewardsType = a3;
}

- (NSURL)programURL
{
  return self->_programURL;
}

- (void)setProgramURL:(id)a3
{
}

- (NSString)formattedMonetaryValue
{
  return self->_formattedMonetaryValue;
}

- (void)setFormattedMonetaryValue:(id)a3
{
}

- (NSString)formattedQuantityValue
{
  return self->_formattedQuantityValue;
}

- (void)setFormattedQuantityValue:(id)a3
{
}

- (BOOL)isRedeemable
{
  return self->_isRedeemable;
}

- (void)setIsRedeemable:(BOOL)a3
{
  self->_isRedeemable = a3;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
}

- (NSDate)lastFetchedAt
{
  return self->_lastFetchedAt;
}

- (void)setLastFetchedAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedAt, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_formattedQuantityValue, 0);
  objc_storeStrong((id *)&self->_formattedMonetaryValue, 0);
  objc_storeStrong((id *)&self->_programURL, 0);
  objc_storeStrong((id *)&self->_programName, 0);

  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
}

@end