@interface PKCreditInstallmentPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentPlan:(id)a3;
- (BOOL)userViewedIntroduction;
- (NSArray)lineItems;
- (NSArray)payments;
- (NSDate)lastUpdated;
- (NSDecimalNumber)apr;
- (NSDecimalNumber)remainingAmount;
- (NSDecimalNumber)totalAmount;
- (NSDecimalNumber)totalBilled;
- (NSDecimalNumber)totalInterestAmount;
- (NSDecimalNumber)totalProductAmount;
- (NSString)accountUserAltDSID;
- (NSString)currencyCode;
- (NSString)identifier;
- (NSString)transactionReferenceIdentifier;
- (PKCreditInstallmentPlan)initWithCoder:(id)a3;
- (PKCreditInstallmentPlan)initWithDictionary:(id)a3;
- (PKCreditInstallmentPlanPayment)nextPaymentDue;
- (PKCreditInstallmentPlanProduct)product;
- (PKInstallmentPlanMerchant)merchant;
- (PKInstallmentPlanSummary)summary;
- (PKPaymentTransactionRewards)rewards;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)periodType;
- (int64_t)state;
- (unint64_t)duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setApr:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setLineItems:(id)a3;
- (void)setMerchant:(id)a3;
- (void)setPayments:(id)a3;
- (void)setPeriodType:(int64_t)a3;
- (void)setProduct:(id)a3;
- (void)setRewards:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSummary:(id)a3;
- (void)setTotalAmount:(id)a3;
- (void)setTotalInterestAmount:(id)a3;
- (void)setTotalProductAmount:(id)a3;
- (void)setTransactionReferenceIdentifier:(id)a3;
- (void)setUserViewedIntroduction:(BOOL)a3;
@end

@implementation PKCreditInstallmentPlan

- (PKCreditInstallmentPlan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PKCreditInstallmentPlan;
  v5 = [(PKCreditInstallmentPlan *)&v52 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"state"];
    v5->_state = PKInstallmentPlanStateFromString(v8);

    uint64_t v9 = [v4 PKDateForKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v9;

    uint64_t v11 = [v4 PKDecimalNumberFromStringForKey:@"apr"];
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v11;

    v5->_duration = [v4 PKIntegerForKey:@"duration"];
    uint64_t v13 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v13;

    uint64_t v15 = [v4 PKDecimalNumberFromStringForKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v15;

    uint64_t v17 = [v4 PKDecimalNumberFromStringForKey:@"totalProduct"];
    totalProductAmount = v5->_totalProductAmount;
    v5->_totalProductAmount = (NSDecimalNumber *)v17;

    uint64_t v19 = [v4 PKDecimalNumberFromStringForKey:@"totalInterest"];
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (NSDecimalNumber *)v19;

    v21 = [v4 PKStringForKey:@"periodType"];
    v22 = v21;
    BOOL v24 = 1;
    if (v21 != @"monthly")
    {
      if (!v21
        || (int v23 = [(__CFString *)v21 isEqualToString:@"monthly"], v22, !v23))
      {
        BOOL v24 = 0;
      }
    }

    v5->_periodType = v24;
    uint64_t v25 = [v4 PKStringForKey:@"transactionReferenceIdentifier"];
    transactionReferenceIdentifier = v5->_transactionReferenceIdentifier;
    v5->_transactionReferenceIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 PKStringForKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v27;

    v29 = [v4 PKDictionaryForKey:@"summary"];
    if (v29)
    {
      v30 = [[PKInstallmentPlanSummary alloc] initWithDictionary:v29];
      summary = v5->_summary;
      v5->_summary = v30;
    }
    v32 = [v4 PKArrayContaining:objc_opt_class() forKey:@"lineItems"];
    v33 = v32;
    if (v32)
    {
      uint64_t v34 = objc_msgSend(v32, "pk_arrayByApplyingBlock:", &__block_literal_global_178);
      lineItems = v5->_lineItems;
      v5->_lineItems = (NSArray *)v34;
    }
    v36 = [v4 PKDictionaryForKey:@"product"];
    if (v36)
    {
      v37 = [[PKCreditInstallmentPlanProduct alloc] initWithDictionary:v36];
      product = v5->_product;
      v5->_product = v37;
    }
    v39 = [v4 PKArrayContaining:objc_opt_class() forKey:@"payments"];
    v40 = v39;
    if (v39)
    {
      uint64_t v41 = objc_msgSend(v39, "pk_arrayByApplyingBlock:", &__block_literal_global_85_0);
      payments = v5->_payments;
      v5->_payments = (NSArray *)v41;
    }
    v43 = [v4 PKDictionaryForKey:@"merchant"];
    if (v43)
    {
      v44 = [[PKInstallmentPlanMerchant alloc] initWithDictionary:v43];
      merchant = v5->_merchant;
      v5->_merchant = v44;
    }
    v46 = [v4 PKArrayContaining:objc_opt_class() forKey:@"rewards"];
    v47 = v46;
    if (v46)
    {
      v48 = objc_msgSend(v46, "pk_arrayByApplyingBlock:", &__block_literal_global_90);
      v49 = [[PKPaymentTransactionRewards alloc] initWithRewardsItems:v48];
      rewards = v5->_rewards;
      v5->_rewards = v49;
    }
    v5->_userViewedIntroduction = [v4 PKBoolForKey:@"userViewedIntroduction"];
  }
  return v5;
}

PKCreditInstallmentPlanLineItem *__46__PKCreditInstallmentPlan_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditInstallmentPlanLineItem alloc] initWithDictionary:v2];

  return v3;
}

PKCreditInstallmentPlanPayment *__46__PKCreditInstallmentPlan_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditInstallmentPlanPayment alloc] initWithDictionary:v2];

  return v3;
}

PKPaymentTransactionRewardsItem *__46__PKCreditInstallmentPlan_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPaymentTransactionRewardsItem alloc] initWithDictionary:v2];

  return v3;
}

- (NSDecimalNumber)remainingAmount
{
  v3 = self->_totalAmount;
  uint64_t v4 = [(PKInstallmentPlanSummary *)self->_summary paymentsToDateAmount];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [(NSDecimalNumber *)v3 decimalNumberBySubtracting:v4];

    v3 = (NSDecimalNumber *)v7;
  }

  return v3;
}

- (NSDecimalNumber)totalBilled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28C28] zero];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_payments;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "originalAmountDue", (void)v14);
        if (v10 || ([v9 amountDue], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v11 = [v9 statementIdentifier];

          if (v11)
          {
            uint64_t v12 = [v3 decimalNumberByAdding:v10];

            v3 = (void *)v12;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDecimalNumber *)v3;
}

- (PKCreditInstallmentPlanPayment)nextPaymentDue
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(NSArray *)self->_payments reverseObjectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      v8 = v5;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        v10 = [v9 statementIdentifier];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_12;
        }
        id v5 = v9;

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }
LABEL_12:

  return (PKCreditInstallmentPlanPayment *)v5;
}

- (BOOL)isComplete
{
  unint64_t state = self->_state;
  BOOL v3 = state >= 3;
  unint64_t v4 = state - 3;
  if (v3) {
    return v4 < 2;
  }
  uint64_t v6 = [(PKInstallmentPlanSummary *)self->_summary paymentsToDateAmount];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C28] zero];
  }
  v10 = v8;

  BOOL v9 = [(NSDecimalNumber *)self->_totalAmount compare:v10] != NSOrderedDescending;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKCreditInstallmentPlan *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditInstallmentPlan *)self isEqualToInstallmentPlan:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentPlan:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_84;
  }
  BOOL v6 = (void *)*((void *)v4 + 2);
  uint64_t v7 = self->_identifier;
  id v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    BOOL v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_83;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_84;
    }
  }
  if (self->_state != *((void *)v5 + 3)) {
    goto LABEL_84;
  }
  lastUpdated = self->_lastUpdated;
  long long v12 = (NSDate *)*((void *)v5 + 4);
  if (lastUpdated && v12)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (lastUpdated != v12)
  {
    goto LABEL_84;
  }
  apr = self->_apr;
  long long v14 = (NSDecimalNumber *)*((void *)v5 + 5);
  if (apr && v14)
  {
    if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (apr != v14)
  {
    goto LABEL_84;
  }
  if (self->_duration != *((void *)v5 + 6)) {
    goto LABEL_84;
  }
  long long v15 = (void *)*((void *)v5 + 7);
  uint64_t v7 = self->_currencyCode;
  long long v16 = v15;
  if (v7 == v16)
  {
  }
  else
  {
    BOOL v9 = v16;
    if (!v7 || !v16) {
      goto LABEL_83;
    }
    BOOL v17 = [(NSString *)v7 isEqualToString:v16];

    if (!v17) {
      goto LABEL_84;
    }
  }
  totalAmount = self->_totalAmount;
  uint64_t v19 = (NSDecimalNumber *)*((void *)v5 + 8);
  if (totalAmount && v19)
  {
    if ((-[NSDecimalNumber isEqual:](totalAmount, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (totalAmount != v19)
  {
    goto LABEL_84;
  }
  totalProductAmount = self->_totalProductAmount;
  v21 = (NSDecimalNumber *)*((void *)v5 + 9);
  if (totalProductAmount && v21)
  {
    if ((-[NSDecimalNumber isEqual:](totalProductAmount, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (totalProductAmount != v21)
  {
    goto LABEL_84;
  }
  totalInterestAmount = self->_totalInterestAmount;
  int v23 = (NSDecimalNumber *)*((void *)v5 + 10);
  if (totalInterestAmount && v23)
  {
    if ((-[NSDecimalNumber isEqual:](totalInterestAmount, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (totalInterestAmount != v23)
  {
    goto LABEL_84;
  }
  if (self->_periodType != *((void *)v5 + 11)) {
    goto LABEL_84;
  }
  summary = self->_summary;
  uint64_t v25 = (PKInstallmentPlanSummary *)*((void *)v5 + 14);
  if (summary && v25)
  {
    if (!-[PKInstallmentPlanSummary isEqual:](summary, "isEqual:")) {
      goto LABEL_84;
    }
  }
  else if (summary != v25)
  {
    goto LABEL_84;
  }
  lineItems = self->_lineItems;
  uint64_t v27 = (NSArray *)*((void *)v5 + 17);
  if (lineItems && v27)
  {
    if ((-[NSArray isEqual:](lineItems, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (lineItems != v27)
  {
    goto LABEL_84;
  }
  product = self->_product;
  v29 = (PKCreditInstallmentPlanProduct *)*((void *)v5 + 16);
  if (product && v29)
  {
    if (!-[PKCreditInstallmentPlanProduct isEqual:](product, "isEqual:")) {
      goto LABEL_84;
    }
  }
  else if (product != v29)
  {
    goto LABEL_84;
  }
  payments = self->_payments;
  v31 = (NSArray *)*((void *)v5 + 18);
  if (payments && v31)
  {
    if ((-[NSArray isEqual:](payments, "isEqual:") & 1) == 0) {
      goto LABEL_84;
    }
  }
  else if (payments != v31)
  {
    goto LABEL_84;
  }
  merchant = self->_merchant;
  v33 = (PKInstallmentPlanMerchant *)*((void *)v5 + 15);
  if (merchant && v33)
  {
    if (!-[PKInstallmentPlanMerchant isEqual:](merchant, "isEqual:")) {
      goto LABEL_84;
    }
  }
  else if (merchant != v33)
  {
    goto LABEL_84;
  }
  rewards = self->_rewards;
  v35 = (PKPaymentTransactionRewards *)*((void *)v5 + 19);
  if (rewards && v35)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewards, "isEqual:")) {
      goto LABEL_84;
    }
  }
  else if (rewards != v35)
  {
    goto LABEL_84;
  }
  v36 = (void *)*((void *)v5 + 12);
  uint64_t v7 = self->_transactionReferenceIdentifier;
  v37 = v36;
  if (v7 == v37)
  {

    goto LABEL_78;
  }
  BOOL v9 = v37;
  if (!v7 || !v37)
  {
LABEL_83:

    goto LABEL_84;
  }
  BOOL v38 = [(NSString *)v7 isEqualToString:v37];

  if (!v38) {
    goto LABEL_84;
  }
LABEL_78:
  v39 = (void *)*((void *)v5 + 13);
  uint64_t v7 = self->_accountUserAltDSID;
  v40 = v39;
  if (v7 == v40)
  {

LABEL_87:
    BOOL v42 = self->_userViewedIntroduction == v5[8];
    goto LABEL_85;
  }
  BOOL v9 = v40;
  if (!v7 || !v40) {
    goto LABEL_83;
  }
  BOOL v41 = [(NSString *)v7 isEqualToString:v40];

  if (v41) {
    goto LABEL_87;
  }
LABEL_84:
  BOOL v42 = 0;
LABEL_85:

  return v42;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_apr];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_totalAmount];
  [v3 safelyAddObject:self->_totalProductAmount];
  [v3 safelyAddObject:self->_totalInterestAmount];
  [v3 safelyAddObject:self->_summary];
  [v3 safelyAddObject:self->_lineItems];
  [v3 safelyAddObject:self->_product];
  [v3 safelyAddObject:self->_payments];
  [v3 safelyAddObject:self->_merchant];
  [v3 safelyAddObject:self->_rewards];
  [v3 safelyAddObject:self->_transactionReferenceIdentifier];
  [v3 safelyAddObject:self->_accountUserAltDSID];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_state - v4 + 32 * v4;
  unint64_t v6 = self->_duration - v5 + 32 * v5;
  int64_t v7 = self->_periodType - v6 + 32 * v6;
  unint64_t v8 = self->_userViewedIntroduction - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  objc_msgSend(v3, "appendFormat:", @"state: '%ld'; ", self->_state);
  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  [v3 appendFormat:@"apr: '%@'; ", self->_apr];
  objc_msgSend(v3, "appendFormat:", @"duration: '%lu'; ", self->_duration);
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [v3 appendFormat:@"totalAmount: '%@'; ", self->_totalAmount];
  [v3 appendFormat:@"totalProductAmount: '%@'; ", self->_totalProductAmount];
  [v3 appendFormat:@"totalInterestAmount: '%@'; ", self->_totalInterestAmount];
  objc_msgSend(v3, "appendFormat:", @"periodType: '%ld'; ", self->_periodType);
  uint64_t v4 = [(PKInstallmentPlanSummary *)self->_summary description];
  [v3 appendFormat:@"summary: '%@'; ", v4];

  [v3 appendFormat:@"lineItems: '%@'; ", self->_lineItems];
  int64_t v5 = [(PKCreditInstallmentPlanProduct *)self->_product description];
  [v3 appendFormat:@"product: '%@'; ", v5];

  [v3 appendFormat:@"payments: '%@'; ", self->_payments];
  unint64_t v6 = [(PKInstallmentPlanMerchant *)self->_merchant description];
  [v3 appendFormat:@"merchant: '%@'; ", v6];

  int64_t v7 = [(PKPaymentTransactionRewards *)self->_rewards description];
  [v3 appendFormat:@"rewards: '%@'; ", v7];

  objc_msgSend(v3, "appendFormat:", @"transactionReferenceIdentifier: '%@'; ",
    self->_transactionReferenceIdentifier);
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKCreditInstallmentPlan;
  int64_t v5 = [(PKCreditInstallmentPlan *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apr"];
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v10;

    v5->_duration = [v4 decodeIntegerForKey:@"duration"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalProduct"];
    totalProductAmount = v5->_totalProductAmount;
    v5->_totalProductAmount = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalInterest"];
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (NSDecimalNumber *)v18;

    v5->_periodType = [v4 decodeIntegerForKey:@"periodType"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summary"];
    summary = v5->_summary;
    v5->_summary = (PKInstallmentPlanSummary *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    BOOL v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"lineItems"];
    lineItems = v5->_lineItems;
    v5->_lineItems = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"product"];
    product = v5->_product;
    v5->_product = (PKCreditInstallmentPlanProduct *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSArray *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchant"];
    merchant = v5->_merchant;
    v5->_merchant = (PKInstallmentPlanMerchant *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewards"];
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionReferenceIdentifier"];
    transactionReferenceIdentifier = v5->_transactionReferenceIdentifier;
    v5->_transactionReferenceIdentifier = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v40;

    v5->_userViewedIntroduction = [v4 decodeBoolForKey:@"userViewedIntroduction"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeObject:self->_apr forKey:@"apr"];
  [v5 encodeInteger:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_totalAmount forKey:@"totalAmount"];
  [v5 encodeObject:self->_totalProductAmount forKey:@"totalProduct"];
  [v5 encodeObject:self->_totalInterestAmount forKey:@"totalInterest"];
  [v5 encodeInteger:self->_periodType forKey:@"periodType"];
  [v5 encodeObject:self->_summary forKey:@"summary"];
  [v5 encodeObject:self->_lineItems forKey:@"lineItems"];
  [v5 encodeObject:self->_product forKey:@"product"];
  [v5 encodeObject:self->_payments forKey:@"payments"];
  [v5 encodeObject:self->_merchant forKey:@"merchant"];
  [v5 encodeObject:self->_rewards forKey:@"rewards"];
  [v5 encodeObject:self->_transactionReferenceIdentifier forKey:@"transactionReferenceIdentifier"];
  [v5 encodeObject:self->_accountUserAltDSID forKey:@"accountUserAltDSID"];
  [v5 encodeBool:self->_userViewedIntroduction forKey:@"userViewedIntroduction"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  int64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 24) = self->_state;
  uint64_t v8 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_apr copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(void *)(v5 + 48) = self->_duration;
  uint64_t v12 = [(NSString *)self->_currencyCode copyWithZone:a3];
  long long v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_totalAmount copyWithZone:a3];
  long long v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_totalProductAmount copyWithZone:a3];
  BOOL v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_totalInterestAmount copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  *(void *)(v5 + 88) = self->_periodType;
  id v20 = [(PKInstallmentPlanSummary *)self->_summary copyWithZone:a3];
  v21 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v20;

  id v22 = [(PKPaymentTransactionRewards *)self->_rewards copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v22;

  uint64_t v24 = [(NSString *)self->_transactionReferenceIdentifier copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v24;

  uint64_t v26 = [(NSString *)self->_accountUserAltDSID copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v29 = self->_lineItems;
  uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v33) copyWithZone:a3];
        [v28 addObject:v34];

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v31);
  }

  if ([v28 count])
  {
    uint64_t v35 = [v28 copy];
    uint64_t v36 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v35;
  }
  id v37 = [(PKCreditInstallmentPlanProduct *)self->_product copyWithZone:a3];
  uint64_t v38 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v37;

  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v40 = self->_payments;
  uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v52;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v44), "copyWithZone:", a3, (void)v51);
        [v39 addObject:v45];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v42);
  }

  if ([v39 count])
  {
    uint64_t v46 = [v39 copy];
    v47 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v46;
  }
  id v48 = -[PKInstallmentPlanMerchant copyWithZone:](self->_merchant, "copyWithZone:", a3, (void)v51);
  v49 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v48;

  *(unsigned char *)(v5 + 8) = self->_userViewedIntroduction;
  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
}

- (NSDecimalNumber)totalProductAmount
{
  return self->_totalProductAmount;
}

- (void)setTotalProductAmount:(id)a3
{
}

- (NSDecimalNumber)totalInterestAmount
{
  return self->_totalInterestAmount;
}

- (void)setTotalInterestAmount:(id)a3
{
}

- (int64_t)periodType
{
  return self->_periodType;
}

- (void)setPeriodType:(int64_t)a3
{
  self->_periodType = a3;
}

- (NSString)transactionReferenceIdentifier
{
  return self->_transactionReferenceIdentifier;
}

- (void)setTransactionReferenceIdentifier:(id)a3
{
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
}

- (PKInstallmentPlanSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (PKInstallmentPlanMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (PKCreditInstallmentPlanProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (void)setLineItems:(id)a3
{
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (PKPaymentTransactionRewards)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
}

- (BOOL)userViewedIntroduction
{
  return self->_userViewedIntroduction;
}

- (void)setUserViewedIntroduction:(BOOL)a3
{
  self->_userViewedIntroduction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_transactionReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_totalInterestAmount, 0);
  objc_storeStrong((id *)&self->_totalProductAmount, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end