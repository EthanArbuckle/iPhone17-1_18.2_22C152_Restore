@interface PKSpendingSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentPeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilySummary;
- (BOOL)isLoading;
- (NSArray)orderedSpendingCategories;
- (NSArray)orderedSpendingPerMerchants;
- (NSArray)spendingsPerCalendarUnit;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)spendingsPerAltDSID;
- (NSString)altDSID;
- (PKCurrencyAmount)previousMaxAmount;
- (PKCurrencyAmount)previousTotalSpending;
- (PKCurrencyAmount)totalSpending;
- (PKPaymentTransactionGroup)adjustments;
- (PKPaymentTransactionGroup)interest;
- (PKPaymentTransactionGroup)payments;
- (PKPaymentTransactionGroup)refunds;
- (PKPaymentTransactionGroup)rewards;
- (PKSpendingInsightTrendCollection)insights;
- (PKSpendingSummary)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)summaryType;
- (unint64_t)summaryUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustments:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setInsights:(id)a3;
- (void)setInterest:(id)a3;
- (void)setIsFamilySummary:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setOrderedSpendingCategories:(id)a3;
- (void)setOrderedSpendingPerMerchants:(id)a3;
- (void)setPayments:(id)a3;
- (void)setPreviousMaxAmount:(id)a3;
- (void)setPreviousTotalSpending:(id)a3;
- (void)setRefunds:(id)a3;
- (void)setRewards:(id)a3;
- (void)setSpendingsPerAltDSID:(id)a3;
- (void)setSpendingsPerCalendarUnit:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSummaryType:(unint64_t)a3;
- (void)setSummaryUnit:(unint64_t)a3;
- (void)setTotalSpending:(id)a3;
@end

@implementation PKSpendingSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSpendingSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKSpendingSummary;
  v5 = [(PKSpendingSummary *)&v41 init];
  if (v5)
  {
    v5->_summaryType = [v4 decodeIntegerForKey:@"summaryType"];
    v5->_summaryUnit = [v4 decodeIntegerForKey:@"summaryUnit"];
    v5->_isLoading = [v4 decodeBoolForKey:@"isLoading"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalSpending"];
    totalSpending = v5->_totalSpending;
    v5->_totalSpending = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousTotalSpending"];
    previousTotalSpending = v5->_previousTotalSpending;
    v5->_previousTotalSpending = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousMaxAmount"];
    previousMaxAmount = v5->_previousMaxAmount;
    v5->_previousMaxAmount = (PKCurrencyAmount *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"orderedSpendingCategories"];
    orderedSpendingCategories = v5->_orderedSpendingCategories;
    v5->_orderedSpendingCategories = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"orderedSpendingPerMerchants"];
    orderedSpendingPerMerchants = v5->_orderedSpendingPerMerchants;
    v5->_orderedSpendingPerMerchants = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"insights"];
    insights = v5->_insights;
    v5->_insights = (PKSpendingInsightTrendCollection *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewards"];
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionGroup *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"spendingsPerCalendarUnit"];
    spendingsPerCalendarUnit = v5->_spendingsPerCalendarUnit;
    v5->_spendingsPerCalendarUnit = (NSArray *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestCharged"];
    interest = v5->_interest;
    v5->_interest = (PKPaymentTransactionGroup *)v38;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t summaryType = self->_summaryType;
  id v5 = a3;
  [v5 encodeInteger:summaryType forKey:@"summaryType"];
  [v5 encodeInteger:self->_summaryUnit forKey:@"summaryUnit"];
  [v5 encodeBool:self->_isLoading forKey:@"isLoading"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_totalSpending forKey:@"totalSpending"];
  [v5 encodeObject:self->_previousTotalSpending forKey:@"previousTotalSpending"];
  [v5 encodeObject:self->_previousMaxAmount forKey:@"previousMaxAmount"];
  [v5 encodeObject:self->_orderedSpendingCategories forKey:@"orderedSpendingCategories"];
  [v5 encodeObject:self->_orderedSpendingPerMerchants forKey:@"orderedSpendingPerMerchants"];
  [v5 encodeObject:self->_insights forKey:@"insights"];
  [v5 encodeObject:self->_rewards forKey:@"rewards"];
  [v5 encodeObject:self->_spendingsPerCalendarUnit forKey:@"spendingsPerCalendarUnit"];
  [v5 encodeObject:self->_interest forKey:@"interestCharged"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_44;
  }
  startDate = self->_startDate;
  uint64_t v6 = (NSDate *)v4[4];
  if (startDate && v6)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_44;
    }
  }
  else if (startDate != v6)
  {
    goto LABEL_44;
  }
  endDate = self->_endDate;
  uint64_t v8 = (NSDate *)v4[5];
  if (endDate && v8)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0) {
      goto LABEL_44;
    }
  }
  else if (endDate != v8)
  {
    goto LABEL_44;
  }
  totalSpending = self->_totalSpending;
  uint64_t v10 = (PKCurrencyAmount *)v4[6];
  if (totalSpending && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](totalSpending, "isEqual:")) {
      goto LABEL_44;
    }
  }
  else if (totalSpending != v10)
  {
    goto LABEL_44;
  }
  rewards = self->_rewards;
  uint64_t v12 = (PKPaymentTransactionGroup *)v4[12];
  if (rewards && v12)
  {
    if (!-[PKPaymentTransactionGroup isEqual:](rewards, "isEqual:")) {
      goto LABEL_44;
    }
  }
  else if (rewards != v12)
  {
    goto LABEL_44;
  }
  v13 = self->_totalSpending;
  uint64_t v14 = (PKCurrencyAmount *)v4[6];
  if (v13 && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](v13, "isEqual:")) {
      goto LABEL_44;
    }
  }
  else if (v13 != v14)
  {
    goto LABEL_44;
  }
  previousMaxAmount = self->_previousMaxAmount;
  v16 = (PKCurrencyAmount *)v4[11];
  if (previousMaxAmount && v16)
  {
    if (!-[PKCurrencyAmount isEqual:](previousMaxAmount, "isEqual:")) {
      goto LABEL_44;
    }
  }
  else if (previousMaxAmount != v16)
  {
    goto LABEL_44;
  }
  interest = self->_interest;
  v18 = (PKPaymentTransactionGroup *)v4[13];
  if (interest && v18)
  {
    if (!-[PKPaymentTransactionGroup isEqual:](interest, "isEqual:")) {
      goto LABEL_44;
    }
  }
  else if (interest != v18)
  {
    goto LABEL_44;
  }
  insights = self->_insights;
  v20 = (PKSpendingInsightTrendCollection *)v4[9];
  if (!insights || !v20)
  {
    if (insights == v20) {
      goto LABEL_42;
    }
LABEL_44:
    BOOL v21 = 0;
    goto LABEL_45;
  }
  if (!-[PKSpendingInsightTrendCollection isEqual:](insights, "isEqual:")) {
    goto LABEL_44;
  }
LABEL_42:
  if (self->_isLoading != *((unsigned __int8 *)v4 + 9)) {
    goto LABEL_44;
  }
  BOOL v21 = self->_summaryType == v4[2];
LABEL_45:

  return v21;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_totalSpending];
  [v3 safelyAddObject:self->_rewards];
  [v3 safelyAddObject:self->_previousTotalSpending];
  [v3 safelyAddObject:self->_previousMaxAmount];
  [v3 safelyAddObject:self->_interest];
  [v3 safelyAddObject:self->_insights];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_isLoading - v4 + 32 * v4;
  unint64_t v6 = self->_summaryType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDate *)self->_startDate description];
  [v3 appendFormat:@"startDate: '%@'; ", v4];

  uint64_t v5 = [(NSDate *)self->_endDate description];
  [v3 appendFormat:@"endDate: '%@'; ", v5];

  [v3 appendFormat:@"totalSpending: '%@'; ", self->_totalSpending];
  [v3 appendFormat:@"previousTotalSpending: '%@'; ", self->_previousTotalSpending];
  [v3 appendFormat:@"previousMaxAmount: '%@'; ", self->_previousMaxAmount];
  objc_msgSend(v3, "appendFormat:", @"type: '%lu'; ", self->_summaryType);
  objc_msgSend(v3, "appendFormat:", @"unit: '%lu'; ", self->_summaryUnit);
  [v3 appendFormat:@"categories: '%@'; ", self->_orderedSpendingCategories];
  [v3 appendFormat:@"merchants: '%@'; ", self->_orderedSpendingPerMerchants];
  [v3 appendFormat:@"insights: '%@'; ", self->_insights];
  [v3 appendFormat:@">"];
  unint64_t v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isCurrentPeriod
{
  endDate = self->_endDate;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(endDate) = [(NSDate *)endDate compare:v3] == NSOrderedDescending;

  return (char)endDate;
}

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (void)setSummaryType:(unint64_t)a3
{
  self->_unint64_t summaryType = a3;
}

- (BOOL)isFamilySummary
{
  return self->_isFamilySummary;
}

- (void)setIsFamilySummary:(BOOL)a3
{
  self->_isFamilySummary = a3;
}

- (unint64_t)summaryUnit
{
  return self->_summaryUnit;
}

- (void)setSummaryUnit:(unint64_t)a3
{
  self->_summaryUnit = a3;
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

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (PKCurrencyAmount)totalSpending
{
  return self->_totalSpending;
}

- (void)setTotalSpending:(id)a3
{
}

- (NSArray)orderedSpendingCategories
{
  return self->_orderedSpendingCategories;
}

- (void)setOrderedSpendingCategories:(id)a3
{
}

- (NSArray)orderedSpendingPerMerchants
{
  return self->_orderedSpendingPerMerchants;
}

- (void)setOrderedSpendingPerMerchants:(id)a3
{
}

- (PKSpendingInsightTrendCollection)insights
{
  return self->_insights;
}

- (void)setInsights:(id)a3
{
}

- (PKCurrencyAmount)previousTotalSpending
{
  return self->_previousTotalSpending;
}

- (void)setPreviousTotalSpending:(id)a3
{
}

- (PKCurrencyAmount)previousMaxAmount
{
  return self->_previousMaxAmount;
}

- (void)setPreviousMaxAmount:(id)a3
{
}

- (PKPaymentTransactionGroup)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
}

- (PKPaymentTransactionGroup)interest
{
  return self->_interest;
}

- (void)setInterest:(id)a3
{
}

- (PKPaymentTransactionGroup)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (PKPaymentTransactionGroup)refunds
{
  return self->_refunds;
}

- (void)setRefunds:(id)a3
{
}

- (PKPaymentTransactionGroup)adjustments
{
  return self->_adjustments;
}

- (void)setAdjustments:(id)a3
{
}

- (NSDictionary)spendingsPerAltDSID
{
  return self->_spendingsPerAltDSID;
}

- (void)setSpendingsPerAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSArray)spendingsPerCalendarUnit
{
  return self->_spendingsPerCalendarUnit;
}

- (void)setSpendingsPerCalendarUnit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spendingsPerCalendarUnit, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_spendingsPerAltDSID, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_refunds, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_interest, 0);
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_previousMaxAmount, 0);
  objc_storeStrong((id *)&self->_previousTotalSpending, 0);
  objc_storeStrong((id *)&self->_insights, 0);
  objc_storeStrong((id *)&self->_orderedSpendingPerMerchants, 0);
  objc_storeStrong((id *)&self->_orderedSpendingCategories, 0);
  objc_storeStrong((id *)&self->_totalSpending, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end