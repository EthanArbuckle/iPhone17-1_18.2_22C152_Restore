@interface PKPaymentTransactionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)disputesOnly;
- (NSArray)fundingSourceTypes;
- (NSArray)regions;
- (NSArray)transactionSources;
- (NSArray)transactionStatuses;
- (NSArray)transactionTypes;
- (NSDate)endDate;
- (NSDate)endStatusChangeDate;
- (NSDate)startDate;
- (NSDate)startStatusChangeDate;
- (NSDecimalNumber)rewardsValue;
- (NSSet)tags;
- (NSSet)transactionSourceIdentifiers;
- (NSString)currencyCode;
- (NSString)panIdentifier;
- (PKCurrencyAmount)amount;
- (PKMerchant)merchant;
- (PKPaymentTransactionRequest)initWithCoder:(id)a3;
- (int64_t)amountComparison;
- (int64_t)dateOrder;
- (int64_t)limit;
- (int64_t)merchantCategory;
- (int64_t)peerPaymentSubType;
- (int64_t)topUpSubtype;
- (unint64_t)peerPaymentPaymentMode;
- (unint64_t)rewardsValueUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setAmountComparison:(int64_t)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDateOrder:(int64_t)a3;
- (void)setDisputesOnly:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setEndStatusChangeDate:(id)a3;
- (void)setFundingSourceTypes:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setMerchant:(id)a3;
- (void)setMerchantCategory:(int64_t)a3;
- (void)setPanIdentifier:(id)a3;
- (void)setPeerPaymentPaymentMode:(unint64_t)a3;
- (void)setPeerPaymentSubType:(int64_t)a3;
- (void)setRegions:(id)a3;
- (void)setRewardsValue:(id)a3;
- (void)setRewardsValueUnit:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStartStatusChangeDate:(id)a3;
- (void)setTags:(id)a3;
- (void)setTopUpSubtype:(int64_t)a3;
- (void)setTransactionSourceIdentifiers:(id)a3;
- (void)setTransactionSources:(id)a3;
- (void)setTransactionStatuses:(id)a3;
- (void)setTransactionTypes:(id)a3;
@end

@implementation PKPaymentTransactionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)PKPaymentTransactionRequest;
  v5 = [(PKPaymentTransactionRequest *)&v58 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transactionSourceIdentifiers"];
    transactionSourceIdentifiers = v5->_transactionSourceIdentifiers;
    v5->_transactionSourceIdentifiers = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"transactionTypes"];
    transactionTypes = v5->_transactionTypes;
    v5->_transactionTypes = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"transactionSources"];
    transactionSources = v5->_transactionSources;
    v5->_transactionSources = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"transactionStatuses"];
    transactionStatuses = v5->_transactionStatuses;
    v5->_transactionStatuses = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsValue"];
    rewardsValue = v5->_rewardsValue;
    v5->_rewardsValue = (NSDecimalNumber *)v26;

    v5->_rewardsValueUnit = [v4 decodeIntegerForKey:@"rewardsValueUnit"];
    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"regions"];
    regions = v5->_regions;
    v5->_regions = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"tags"];
    tags = v5->_tags;
    v5->_tags = (NSSet *)v36;

    v5->_disputesOnly = [v4 decodeIntegerForKey:@"disputesOnly"] != 0;
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchant"];
    merchant = v5->_merchant;
    v5->_merchant = (PKMerchant *)v38;

    v5->_merchantCategory = [v4 decodeIntegerForKey:@"merchantCategory"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v42;

    v5->_dateOrder = [v4 decodeIntegerForKey:@"dateOrder"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startStatusChangeDate"];
    startStatusChangeDate = v5->_startStatusChangeDate;
    v5->_startStatusChangeDate = (NSDate *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endStatusChangeDate"];
    endStatusChangeDate = v5->_endStatusChangeDate;
    v5->_endStatusChangeDate = (NSDate *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v50;

    v5->_amountComparison = [v4 decodeIntegerForKey:@"amountComparison"];
    v5->_peerPaymentSubType = [v4 decodeIntegerForKey:@"peerPaymentSubType"];
    v5->_topUpSubtype = [v4 decodeIntegerForKey:@"topUpSubtype"];
    v5->_peerPaymentPaymentMode = [v4 decodeIntegerForKey:@"peerPaymentPaymentMode"];
    v52 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v53 = objc_opt_class();
    v54 = objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"fundingSourceTypes"];
    fundingSourceTypes = v5->_fundingSourceTypes;
    v5->_fundingSourceTypes = (NSArray *)v55;

    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  transactionSourceIdentifiers = self->_transactionSourceIdentifiers;
  id v5 = a3;
  [v5 encodeObject:transactionSourceIdentifiers forKey:@"transactionSourceIdentifiers"];
  [v5 encodeObject:self->_transactionTypes forKey:@"transactionTypes"];
  [v5 encodeObject:self->_transactionSources forKey:@"transactionSources"];
  [v5 encodeObject:self->_transactionStatuses forKey:@"transactionStatuses"];
  [v5 encodeObject:self->_rewardsValue forKey:@"rewardsValue"];
  [v5 encodeInteger:self->_rewardsValueUnit forKey:@"rewardsValueUnit"];
  [v5 encodeObject:self->_regions forKey:@"regions"];
  [v5 encodeObject:self->_tags forKey:@"tags"];
  [v5 encodeInteger:self->_disputesOnly forKey:@"disputesOnly"];
  [v5 encodeObject:self->_merchant forKey:@"merchant"];
  [v5 encodeInteger:self->_merchantCategory forKey:@"merchantCategory"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_dateOrder forKey:@"dateOrder"];
  [v5 encodeObject:self->_startStatusChangeDate forKey:@"startStatusChangeDate"];
  [v5 encodeObject:self->_endStatusChangeDate forKey:@"endStatusChangeDate"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeInteger:self->_amountComparison forKey:@"amountComparison"];
  [v5 encodeInteger:self->_peerPaymentSubType forKey:@"peerPaymentSubType"];
  [v5 encodeInteger:self->_topUpSubtype forKey:@"topUpSubtype"];
  [v5 encodeInteger:self->_peerPaymentPaymentMode forKey:@"peerPaymentPaymentMode"];
  [v5 encodeObject:self->_fundingSourceTypes forKey:@"fundingSourceTypes"];
  [v5 encodeInteger:self->_limit forKey:@"limit"];
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
}

- (NSArray)transactionTypes
{
  return self->_transactionTypes;
}

- (void)setTransactionTypes:(id)a3
{
}

- (NSArray)transactionSources
{
  return self->_transactionSources;
}

- (void)setTransactionSources:(id)a3
{
}

- (NSArray)transactionStatuses
{
  return self->_transactionStatuses;
}

- (void)setTransactionStatuses:(id)a3
{
}

- (int64_t)peerPaymentSubType
{
  return self->_peerPaymentSubType;
}

- (void)setPeerPaymentSubType:(int64_t)a3
{
  self->_peerPaymentSubType = a3;
}

- (int64_t)topUpSubtype
{
  return self->_topUpSubtype;
}

- (void)setTopUpSubtype:(int64_t)a3
{
  self->_topUpSubtype = a3;
}

- (unint64_t)peerPaymentPaymentMode
{
  return self->_peerPaymentPaymentMode;
}

- (void)setPeerPaymentPaymentMode:(unint64_t)a3
{
  self->_peerPaymentPaymentMode = a3;
}

- (NSDecimalNumber)rewardsValue
{
  return self->_rewardsValue;
}

- (void)setRewardsValue:(id)a3
{
}

- (unint64_t)rewardsValueUnit
{
  return self->_rewardsValueUnit;
}

- (void)setRewardsValueUnit:(unint64_t)a3
{
  self->_rewardsValueUnit = a3;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (NSArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)dateOrder
{
  return self->_dateOrder;
}

- (void)setDateOrder:(int64_t)a3
{
  self->_dateOrder = a3;
}

- (NSDate)startStatusChangeDate
{
  return self->_startStatusChangeDate;
}

- (void)setStartStatusChangeDate:(id)a3
{
}

- (NSDate)endStatusChangeDate
{
  return self->_endStatusChangeDate;
}

- (void)setEndStatusChangeDate:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (int64_t)amountComparison
{
  return self->_amountComparison;
}

- (void)setAmountComparison:(int64_t)a3
{
  self->_amountComparison = a3;
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (BOOL)disputesOnly
{
  return self->_disputesOnly;
}

- (void)setDisputesOnly:(BOOL)a3
{
  self->_disputesOnly = a3;
}

- (NSString)panIdentifier
{
  return self->_panIdentifier;
}

- (void)setPanIdentifier:(id)a3
{
}

- (NSArray)fundingSourceTypes
{
  return self->_fundingSourceTypes;
}

- (void)setFundingSourceTypes:(id)a3
{
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSourceTypes, 0);
  objc_storeStrong((id *)&self->_panIdentifier, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_endStatusChangeDate, 0);
  objc_storeStrong((id *)&self->_startStatusChangeDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_rewardsValue, 0);
  objc_storeStrong((id *)&self->_transactionStatuses, 0);
  objc_storeStrong((id *)&self->_transactionSources, 0);
  objc_storeStrong((id *)&self->_transactionTypes, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
}

@end