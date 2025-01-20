@interface PKCreditAccountSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)autoPayEnabled;
- (BOOL)inGrace;
- (BOOL)isEqual:(id)a3;
- (BOOL)recoveryPaymentPlansSupported;
- (BOOL)requiresDebtCollectionNotices;
- (NSDate)lastPaymentDate;
- (NSDate)paymentDueDate;
- (NSDate)unpostedInterestTimestamp;
- (NSDecimalNumber)adjustedBalance;
- (NSDecimalNumber)availableCredit;
- (NSDecimalNumber)chargeOffPreventionAmount;
- (NSDecimalNumber)creditLimit;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)installmentBalance;
- (NSDecimalNumber)pastDueAmount;
- (NSDecimalNumber)remainingMinimumPayment;
- (NSDecimalNumber)remainingMinimumPaymentExcludedFromInterestCalculation;
- (NSDecimalNumber)remainingStatementBalance;
- (NSDecimalNumber)remainingStatementBalanceForInterestCalculation;
- (NSDecimalNumber)rewardsBalance;
- (NSDecimalNumber)unpostedInterest;
- (NSSet)accountUserActivity;
- (PKCreditAccountBalanceSummary)balanceSummary;
- (PKCreditAccountMergeSummary)mergeSummary;
- (PKCreditAccountStatement)currentStatement;
- (PKCreditAccountSummary)initWithCoder:(id)a3;
- (PKCreditAccountSummary)initWithDictionary:(id)a3;
- (id)accountUserActivityForAccountUserAltDSID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cyclesPastDue;
- (unint64_t)balanceStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)ingestExtendedAccountDetails:(id)a3;
- (void)setAccountUserActivity:(id)a3;
- (void)setAdjustedBalance:(id)a3;
- (void)setAutoPayEnabled:(BOOL)a3;
- (void)setAvailableCredit:(id)a3;
- (void)setBalanceStatus:(unint64_t)a3;
- (void)setBalanceSummary:(id)a3;
- (void)setChargeOffPreventionAmount:(id)a3;
- (void)setCreditLimit:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setCurrentStatement:(id)a3;
- (void)setCyclesPastDue:(int64_t)a3;
- (void)setInGrace:(BOOL)a3;
- (void)setInstallmentBalance:(id)a3;
- (void)setLastPaymentDate:(id)a3;
- (void)setMergeSummary:(id)a3;
- (void)setPastDueAmount:(id)a3;
- (void)setPaymentDueDate:(id)a3;
- (void)setRecoveryPaymentPlansSupported:(BOOL)a3;
- (void)setRemainingMinimumPayment:(id)a3;
- (void)setRemainingMinimumPaymentExcludedFromInterestCalculation:(id)a3;
- (void)setRemainingStatementBalance:(id)a3;
- (void)setRemainingStatementBalanceForInterestCalculation:(id)a3;
- (void)setRequiresDebtCollectionNotices:(BOOL)a3;
- (void)setRewardsBalance:(id)a3;
- (void)setUnpostedInterest:(id)a3;
- (void)setUnpostedInterestTimestamp:(id)a3;
@end

@implementation PKCreditAccountSummary

- (PKCreditAccountSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKCreditAccountSummary;
  v5 = [(PKCreditAccountSummary *)&v61 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"creditLimit"];
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"availableCredit"];
    availableCredit = v5->_availableCredit;
    v5->_availableCredit = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 PKDecimalNumberFromStringForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"adjustedBalance"];
    adjustedBalance = v5->_adjustedBalance;
    v5->_adjustedBalance = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"remainingMinimumPayment"];
    remainingMinimumPayment = v5->_remainingMinimumPayment;
    v5->_remainingMinimumPayment = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKDecimalNumberFromStringForKey:@"remainingStatementBalance"];
    remainingStatementBalance = v5->_remainingStatementBalance;
    v5->_remainingStatementBalance = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 PKDecimalNumberFromStringForKey:@"remainingStatementBalanceForInterestCalculation"];
    remainingStatementBalanceForInterestCalculation = v5->_remainingStatementBalanceForInterestCalculation;
    v5->_remainingStatementBalanceForInterestCalculation = (NSDecimalNumber *)v20;

    v5->_autoPayEnabled = [v4 PKBoolForKey:@"autopayStatus"];
    v5->_requiresDebtCollectionNotices = [v4 PKBoolForKey:@"requiresDebtCollectionNotices"];
    v22 = [v4 PKStringForKey:@"balanceStatus"];
    v23 = [v22 lowercaseString];
    if ([v23 isEqualToString:@"current"])
    {
      uint64_t v24 = 1;
    }
    else if ([v23 isEqualToString:@"pastdue"])
    {
      uint64_t v24 = 2;
    }
    else
    {
      uint64_t v24 = 0;
    }

    v5->_balanceStatus = v24;
    v5->_cyclesPastDue = [v4 PKIntegerForKey:@"cyclesPastDue"];
    uint64_t v25 = [v4 PKDecimalNumberFromStringForKey:@"pastDueAmount"];
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v25;

    uint64_t v27 = [v4 PKDateForKey:@"lastPaymentDate"];
    lastPaymentDate = v5->_lastPaymentDate;
    v5->_lastPaymentDate = (NSDate *)v27;

    uint64_t v29 = [v4 PKDateForKey:@"paymentDueDate"];
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v29;

    uint64_t v31 = [v4 PKDecimalNumberFromStringForKey:@"unpostedInterest"];
    unpostedInterest = v5->_unpostedInterest;
    v5->_unpostedInterest = (NSDecimalNumber *)v31;

    uint64_t v33 = [v4 PKDateForKey:@"unpostedInterestTimestamp"];
    unpostedInterestTimestamp = v5->_unpostedInterestTimestamp;
    v5->_unpostedInterestTimestamp = (NSDate *)v33;

    v5->_inGrace = [v4 PKBoolForKey:@"inGrace"];
    uint64_t v35 = [v4 PKDecimalNumberFromStringForKey:@"remainingMinimumPaymentExcludedFromInterestCalculation"];
    remainingMinimumPaymentExcludedFromInterestCalculation = v5->_remainingMinimumPaymentExcludedFromInterestCalculation;
    v5->_remainingMinimumPaymentExcludedFromInterestCalculation = (NSDecimalNumber *)v35;

    uint64_t v37 = [v4 PKDecimalNumberFromStringForKey:@"installmentBalance"];
    installmentBalance = v5->_installmentBalance;
    v5->_installmentBalance = (NSDecimalNumber *)v37;

    v5->_recoveryPaymentPlansSupported = [v4 PKBoolForKey:@"recoveryPaymentPlansSupported"];
    v39 = [v4 objectForKey:@"inGrace"];

    if (v39)
    {
      v5->_inGrace = [v4 PKBoolForKey:@"inGrace"];
    }
    else
    {
      v40 = v5->_unpostedInterest;
      if (v40)
      {
        v41 = [MEMORY[0x1E4F28C28] zero];
        v5->_inGrace = [(NSDecimalNumber *)v40 compare:v41] != NSOrderedDescending;
      }
      else
      {
        v5->_inGrace = 1;
      }
    }
    uint64_t v42 = [v4 PKDecimalNumberFromStringForKey:@"chargeOffPreventionAmount"];
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v42;

    uint64_t v44 = [v4 PKDecimalNumberFromStringForKey:@"pastDueAmount"];
    v45 = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v44;

    v46 = [PKCreditAccountBalanceSummary alloc];
    v47 = [v4 PKDictionaryForKey:@"balanceSummary"];
    uint64_t v48 = [(PKCreditAccountBalanceSummary *)v46 initWithDictionary:v47];
    balanceSummary = v5->_balanceSummary;
    v5->_balanceSummary = (PKCreditAccountBalanceSummary *)v48;

    v50 = [PKCreditAccountStatement alloc];
    v51 = [v4 PKDictionaryForKey:@"currentStatement"];
    uint64_t v52 = [(PKCreditAccountStatement *)v50 initWithDictionary:v51];
    currentStatement = v5->_currentStatement;
    v5->_currentStatement = (PKCreditAccountStatement *)v52;

    v54 = [v4 PKSetContaining:objc_opt_class() forKey:@"accountUserActivity"];
    uint64_t v55 = objc_msgSend(v54, "pk_setByApplyingBlock:", &__block_literal_global_16);
    accountUserActivity = v5->_accountUserActivity;
    v5->_accountUserActivity = (NSSet *)v55;

    v57 = [v4 PKDictionaryForKey:@"mergeSummary"];
    if (v57)
    {
      v58 = [[PKCreditAccountMergeSummary alloc] initWithDictionary:v57];
      mergeSummary = v5->_mergeSummary;
      v5->_mergeSummary = v58;
    }
  }

  return v5;
}

PKCreditAccountUserActivity *__45__PKCreditAccountSummary_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditAccountUserActivity alloc] initWithDictionary:v2];

  return v3;
}

- (NSDate)paymentDueDate
{
  v3 = PKForceAccountDueDateNumberDaysFromNow();
  id v4 = v3;
  if (!v3) {
    goto LABEL_3;
  }
  uint64_t v5 = [v3 integerValue];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:v5];
  v7 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = [v7 dateByAddingComponents:v6 toDate:v8 options:0];

  if (!v9) {
LABEL_3:
  }
    v9 = self->_paymentDueDate;

  return v9;
}

- (void)ingestExtendedAccountDetails:(id)a3
{
  id v4 = a3;
  self->_autoPayEnabled = [v4 PKBoolForKey:@"autopayStatus"];
  uint64_t v5 = [PKCreditAccountStatement alloc];
  id v8 = [v4 PKDictionaryForKey:@"currentStatement"];

  id v6 = [(PKCreditAccountStatement *)v5 initWithDictionary:v8];
  currentStatement = self->_currentStatement;
  self->_currentStatement = v6;
}

- (NSDecimalNumber)adjustedBalance
{
  adjustedBalance = self->_adjustedBalance;
  if (!adjustedBalance) {
    adjustedBalance = self->_currentBalance;
  }
  return adjustedBalance;
}

- (id)accountUserActivityForAccountUserAltDSID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = self->_accountUserActivity;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "accountUserAltDSID", (void)v17);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          id v12 = v4;
          v13 = v12;
          if (v11 == v12)
          {

LABEL_17:
            id v15 = v10;
            goto LABEL_19;
          }
          if (v11)
          {
            char v14 = [v11 isEqualToString:v12];

            if (v14) {
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v15 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v15 = 0;
    }
LABEL_19:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PKCreditAccountSummary;
  uint64_t v5 = [(PKCreditAccountSummary *)&v52 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditLimit"];
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableCredit"];
    availableCredit = v5->_availableCredit;
    v5->_availableCredit = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adjustedBalance"];
    adjustedBalance = v5->_adjustedBalance;
    v5->_adjustedBalance = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingMinimumPayment"];
    remainingMinimumPayment = v5->_remainingMinimumPayment;
    v5->_remainingMinimumPayment = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingStatementBalance"];
    remainingStatementBalance = v5->_remainingStatementBalance;
    v5->_remainingStatementBalance = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingStatementBalanceForInterestCalculation"];
    remainingStatementBalanceForInterestCalculation = v5->_remainingStatementBalanceForInterestCalculation;
    v5->_remainingStatementBalanceForInterestCalculation = (NSDecimalNumber *)v20;

    v5->_autoPayEnabled = [v4 decodeBoolForKey:@"autopayStatus"];
    v5->_requiresDebtCollectionNotices = [v4 decodeBoolForKey:@"requiresDebtCollectionNotices"];
    v5->_balanceStatus = [v4 decodeIntegerForKey:@"balanceStatus"];
    v5->_cyclesPastDue = [v4 decodeIntegerForKey:@"cyclesPastDue"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pastDueAmount"];
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastPaymentDate"];
    lastPaymentDate = v5->_lastPaymentDate;
    v5->_lastPaymentDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDueDate"];
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balanceSummary"];
    balanceSummary = v5->_balanceSummary;
    v5->_balanceSummary = (PKCreditAccountBalanceSummary *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentStatement"];
    currentStatement = v5->_currentStatement;
    v5->_currentStatement = (PKCreditAccountStatement *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"accountUserActivity"];
    accountUserActivity = v5->_accountUserActivity;
    v5->_accountUserActivity = (NSSet *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mergeSummary"];
    mergeSummary = v5->_mergeSummary;
    v5->_mergeSummary = (PKCreditAccountMergeSummary *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unpostedInterest"];
    unpostedInterest = v5->_unpostedInterest;
    v5->_unpostedInterest = (NSDecimalNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unpostedInterestTimestamp"];
    unpostedInterestTimestamp = v5->_unpostedInterestTimestamp;
    v5->_unpostedInterestTimestamp = (NSDate *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chargeOffPreventionAmount"];
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pastDueAmount"];
    v46 = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v45;

    v5->_inGrace = [v4 decodeBoolForKey:@"inGrace"];
    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remainingMinimumPaymentExcludedFromInterestCalculation"];
    remainingMinimumPaymentExcludedFromInterestCalculation = v5->_remainingMinimumPaymentExcludedFromInterestCalculation;
    v5->_remainingMinimumPaymentExcludedFromInterestCalculation = (NSDecimalNumber *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentBalance"];
    installmentBalance = v5->_installmentBalance;
    v5->_installmentBalance = (NSDecimalNumber *)v49;

    v5->_recoveryPaymentPlansSupported = [v4 decodeBoolForKey:@"recoveryPaymentPlansSupported"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  creditLimit = self->_creditLimit;
  id v5 = a3;
  [v5 encodeObject:creditLimit forKey:@"creditLimit"];
  [v5 encodeObject:self->_availableCredit forKey:@"availableCredit"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_adjustedBalance forKey:@"adjustedBalance"];
  [v5 encodeObject:self->_rewardsBalance forKey:@"rewardsBalance"];
  [v5 encodeObject:self->_remainingMinimumPayment forKey:@"remainingMinimumPayment"];
  [v5 encodeObject:self->_remainingStatementBalance forKey:@"remainingStatementBalance"];
  [v5 encodeObject:self->_remainingStatementBalanceForInterestCalculation forKey:@"remainingStatementBalanceForInterestCalculation"];
  [v5 encodeBool:self->_autoPayEnabled forKey:@"autopayStatus"];
  [v5 encodeBool:self->_requiresDebtCollectionNotices forKey:@"requiresDebtCollectionNotices"];
  [v5 encodeInteger:self->_balanceStatus forKey:@"balanceStatus"];
  [v5 encodeInteger:self->_cyclesPastDue forKey:@"cyclesPastDue"];
  [v5 encodeObject:self->_pastDueAmount forKey:@"pastDueAmount"];
  [v5 encodeObject:self->_lastPaymentDate forKey:@"lastPaymentDate"];
  [v5 encodeObject:self->_paymentDueDate forKey:@"paymentDueDate"];
  [v5 encodeObject:self->_balanceSummary forKey:@"balanceSummary"];
  [v5 encodeObject:self->_accountUserActivity forKey:@"accountUserActivity"];
  [v5 encodeObject:self->_mergeSummary forKey:@"mergeSummary"];
  [v5 encodeObject:self->_currentStatement forKey:@"currentStatement"];
  [v5 encodeObject:self->_unpostedInterest forKey:@"unpostedInterest"];
  [v5 encodeObject:self->_unpostedInterestTimestamp forKey:@"unpostedInterestTimestamp"];
  [v5 encodeObject:self->_chargeOffPreventionAmount forKey:@"chargeOffPreventionAmount"];
  [v5 encodeObject:self->_pastDueAmount forKey:@"pastDueAmount"];
  [v5 encodeBool:self->_inGrace forKey:@"inGrace"];
  [v5 encodeObject:self->_remainingMinimumPaymentExcludedFromInterestCalculation forKey:@"remainingMinimumPaymentExcludedFromInterestCalculation"];
  [v5 encodeObject:self->_installmentBalance forKey:@"installmentBalance"];
  [v5 encodeBool:self->_recoveryPaymentPlansSupported forKey:@"recoveryPaymentPlansSupported"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_107;
  }
  creditLimit = self->_creditLimit;
  uint64_t v6 = (NSDecimalNumber *)v4[2];
  if (creditLimit && v6)
  {
    if ((-[NSDecimalNumber isEqual:](creditLimit, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (creditLimit != v6)
  {
    goto LABEL_107;
  }
  availableCredit = self->_availableCredit;
  uint64_t v8 = (NSDecimalNumber *)v4[3];
  if (availableCredit && v8)
  {
    if ((-[NSDecimalNumber isEqual:](availableCredit, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (availableCredit != v8)
  {
    goto LABEL_107;
  }
  currentBalance = self->_currentBalance;
  uint64_t v10 = (NSDecimalNumber *)v4[4];
  if (currentBalance && v10)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (currentBalance != v10)
  {
    goto LABEL_107;
  }
  adjustedBalance = self->_adjustedBalance;
  uint64_t v12 = (NSDecimalNumber *)v4[5];
  if (adjustedBalance && v12)
  {
    if ((-[NSDecimalNumber isEqual:](adjustedBalance, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (adjustedBalance != v12)
  {
    goto LABEL_107;
  }
  remainingMinimumPayment = self->_remainingMinimumPayment;
  uint64_t v14 = (NSDecimalNumber *)v4[9];
  if (remainingMinimumPayment && v14)
  {
    if ((-[NSDecimalNumber isEqual:](remainingMinimumPayment, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (remainingMinimumPayment != v14)
  {
    goto LABEL_107;
  }
  remainingStatementBalance = self->_remainingStatementBalance;
  uint64_t v16 = (NSDecimalNumber *)v4[7];
  if (remainingStatementBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](remainingStatementBalance, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (remainingStatementBalance != v16)
  {
    goto LABEL_107;
  }
  remainingStatementBalanceForInterestCalculation = self->_remainingStatementBalanceForInterestCalculation;
  uint64_t v18 = (NSDecimalNumber *)v4[8];
  if (remainingStatementBalanceForInterestCalculation && v18)
  {
    if ((-[NSDecimalNumber isEqual:](remainingStatementBalanceForInterestCalculation, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (remainingStatementBalanceForInterestCalculation != v18)
  {
    goto LABEL_107;
  }
  pastDueAmount = self->_pastDueAmount;
  uint64_t v20 = (NSDecimalNumber *)v4[22];
  if (pastDueAmount && v20)
  {
    if ((-[NSDecimalNumber isEqual:](pastDueAmount, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (pastDueAmount != v20)
  {
    goto LABEL_107;
  }
  if (self->_autoPayEnabled != *((unsigned __int8 *)v4 + 10)
    || self->_requiresDebtCollectionNotices != *((unsigned __int8 *)v4 + 8)
    || self->_balanceStatus != v4[15]
    || self->_cyclesPastDue != v4[14]
    || self->_inGrace != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_107;
  }
  lastPaymentDate = self->_lastPaymentDate;
  uint64_t v22 = (NSDate *)v4[13];
  if (lastPaymentDate && v22)
  {
    if ((-[NSDate isEqual:](lastPaymentDate, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (lastPaymentDate != v22)
  {
    goto LABEL_107;
  }
  balanceSummary = self->_balanceSummary;
  uint64_t v24 = (PKCreditAccountBalanceSummary *)v4[16];
  if (balanceSummary && v24)
  {
    if (!-[PKCreditAccountBalanceSummary isEqual:](balanceSummary, "isEqual:")) {
      goto LABEL_107;
    }
  }
  else if (balanceSummary != v24)
  {
    goto LABEL_107;
  }
  accountUserActivity = self->_accountUserActivity;
  uint64_t v26 = (NSSet *)v4[17];
  if (accountUserActivity && v26)
  {
    if ((-[NSSet isEqual:](accountUserActivity, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (accountUserActivity != v26)
  {
    goto LABEL_107;
  }
  mergeSummary = self->_mergeSummary;
  uint64_t v28 = (PKCreditAccountMergeSummary *)v4[18];
  if (mergeSummary && v28)
  {
    if (!-[PKCreditAccountMergeSummary isEqual:](mergeSummary, "isEqual:")) {
      goto LABEL_107;
    }
  }
  else if (mergeSummary != v28)
  {
    goto LABEL_107;
  }
  currentStatement = self->_currentStatement;
  uint64_t v30 = (PKCreditAccountStatement *)v4[23];
  if (currentStatement && v30)
  {
    if (!-[PKCreditAccountStatement isEqual:](currentStatement, "isEqual:")) {
      goto LABEL_107;
    }
  }
  else if (currentStatement != v30)
  {
    goto LABEL_107;
  }
  unpostedInterest = self->_unpostedInterest;
  v32 = (NSDecimalNumber *)v4[19];
  if (unpostedInterest && v32)
  {
    if ((-[NSDecimalNumber isEqual:](unpostedInterest, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (unpostedInterest != v32)
  {
    goto LABEL_107;
  }
  unpostedInterestTimestamp = self->_unpostedInterestTimestamp;
  v34 = (NSDate *)v4[20];
  if (unpostedInterestTimestamp && v34)
  {
    if ((-[NSDate isEqual:](unpostedInterestTimestamp, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (unpostedInterestTimestamp != v34)
  {
    goto LABEL_107;
  }
  chargeOffPreventionAmount = self->_chargeOffPreventionAmount;
  v36 = (NSDecimalNumber *)v4[21];
  if (chargeOffPreventionAmount && v36)
  {
    if ((-[NSDecimalNumber isEqual:](chargeOffPreventionAmount, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (chargeOffPreventionAmount != v36)
  {
    goto LABEL_107;
  }
  uint64_t v37 = self->_pastDueAmount;
  v38 = (NSDecimalNumber *)v4[22];
  if (v37 && v38)
  {
    if ((-[NSDecimalNumber isEqual:](v37, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (v37 != v38)
  {
    goto LABEL_107;
  }
  remainingMinimumPaymentExcludedFromInterestCalculation = self->_remainingMinimumPaymentExcludedFromInterestCalculation;
  v40 = (NSDecimalNumber *)v4[10];
  if (remainingMinimumPaymentExcludedFromInterestCalculation && v40)
  {
    if ((-[NSDecimalNumber isEqual:](remainingMinimumPaymentExcludedFromInterestCalculation, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (remainingMinimumPaymentExcludedFromInterestCalculation != v40)
  {
    goto LABEL_107;
  }
  installmentBalance = self->_installmentBalance;
  uint64_t v42 = (NSDecimalNumber *)v4[11];
  if (installmentBalance && v42)
  {
    if ((-[NSDecimalNumber isEqual:](installmentBalance, "isEqual:") & 1) == 0) {
      goto LABEL_107;
    }
  }
  else if (installmentBalance != v42)
  {
    goto LABEL_107;
  }
  paymentDueDate = self->_paymentDueDate;
  uint64_t v44 = (NSDate *)v4[12];
  if (!paymentDueDate || !v44)
  {
    if (paymentDueDate == v44) {
      goto LABEL_105;
    }
LABEL_107:
    BOOL v45 = 0;
    goto LABEL_108;
  }
  if ((-[NSDate isEqual:](paymentDueDate, "isEqual:") & 1) == 0) {
    goto LABEL_107;
  }
LABEL_105:
  BOOL v45 = self->_recoveryPaymentPlansSupported == *((unsigned __int8 *)v4 + 11);
LABEL_108:

  return v45;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_creditLimit];
  [v3 safelyAddObject:self->_availableCredit];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_adjustedBalance];
  [v3 safelyAddObject:self->_remainingMinimumPayment];
  [v3 safelyAddObject:self->_remainingStatementBalance];
  [v3 safelyAddObject:self->_remainingStatementBalanceForInterestCalculation];
  [v3 safelyAddObject:self->_lastPaymentDate];
  [v3 safelyAddObject:self->_balanceSummary];
  [v3 safelyAddObject:self->_accountUserActivity];
  [v3 safelyAddObject:self->_mergeSummary];
  [v3 safelyAddObject:self->_currentStatement];
  [v3 safelyAddObject:self->_unpostedInterest];
  [v3 safelyAddObject:self->_unpostedInterestTimestamp];
  [v3 safelyAddObject:self->_chargeOffPreventionAmount];
  [v3 safelyAddObject:self->_pastDueAmount];
  [v3 safelyAddObject:self->_paymentDueDate];
  [v3 safelyAddObject:self->_remainingMinimumPaymentExcludedFromInterestCalculation];
  [v3 safelyAddObject:self->_installmentBalance];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_autoPayEnabled - v4 + 32 * v4;
  uint64_t v6 = self->_requiresDebtCollectionNotices - v5 + 32 * v5;
  unint64_t v7 = self->_balanceStatus - v6 + 32 * v6;
  int64_t v8 = self->_cyclesPastDue - v7 + 32 * v7;
  uint64_t v9 = self->_inGrace - v8 + 32 * v8;
  unint64_t v10 = self->_recoveryPaymentPlansSupported - v9 + 32 * v9;

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDecimalNumber *)self->_creditLimit stringValue];
  [v3 appendFormat:@"creditLimit: '%@'; ", v4];

  uint64_t v5 = [(NSDecimalNumber *)self->_availableCredit stringValue];
  [v3 appendFormat:@"availableCredit: '%@'; ", v5];

  uint64_t v6 = [(NSDecimalNumber *)self->_currentBalance stringValue];
  [v3 appendFormat:@"currentBalance: '%@'; ", v6];

  unint64_t v7 = [(NSDecimalNumber *)self->_rewardsBalance stringValue];
  [v3 appendFormat:@"rewardsBalance: '%@'; ", v7];

  int64_t v8 = [(NSDecimalNumber *)self->_remainingMinimumPayment stringValue];
  [v3 appendFormat:@"remainingMinimumPayment: '%@'; ", v8];

  uint64_t v9 = [(NSDecimalNumber *)self->_remainingStatementBalance stringValue];
  [v3 appendFormat:@"remainingStatementBalance: '%@'; ", v9];

  unint64_t v10 = [(NSDecimalNumber *)self->_remainingStatementBalanceForInterestCalculation stringValue];
  [v3 appendFormat:@"remainingStatementBalanceForInterestCalculation: '%@'; ", v10];

  id v11 = [(NSDecimalNumber *)self->_pastDueAmount stringValue];
  [v3 appendFormat:@"pastDueAmount: '%@'; ", v11];

  if (self->_autoPayEnabled) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  [v3 appendFormat:@"autoPayEnabled: '%@'; ", v12];
  if (self->_requiresDebtCollectionNotices) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 appendFormat:@"requiresDebtCollectionNotices: '%@'; ", v13];
  unint64_t balanceStatus = self->_balanceStatus;
  if (balanceStatus > 2) {
    id v15 = @"unknown";
  }
  else {
    id v15 = off_1E56DC8D0[balanceStatus];
  }
  [v3 appendFormat:@"balanceStatus: '%@'; ", v15];
  objc_msgSend(v3, "appendFormat:", @"cyclesPastDue: '%ld'; ", self->_cyclesPastDue);
  uint64_t v16 = [(NSDate *)self->_lastPaymentDate description];
  [v3 appendFormat:@"lastPaymentDate: '%@'; ", v16];

  long long v17 = [(NSDate *)self->_paymentDueDate description];
  [v3 appendFormat:@"paymentDueDate: '%@'; ", v17];

  uint64_t v18 = [(NSDecimalNumber *)self->_unpostedInterest stringValue];
  [v3 appendFormat:@"unpostedInterest: '%@'; ", v18];

  long long v19 = [(NSDate *)self->_unpostedInterestTimestamp description];
  [v3 appendFormat:@"unpostedInterestTimestamp: '%@'; ", v19];

  uint64_t v20 = [(NSDecimalNumber *)self->_chargeOffPreventionAmount stringValue];
  [v3 appendFormat:@"chargeOffPreventionAmount: '%@'; ", v20];

  v21 = [(NSDecimalNumber *)self->_pastDueAmount stringValue];
  [v3 appendFormat:@"pastDueAmount: '%@'; ", v21];

  if (self->_inGrace) {
    uint64_t v22 = @"YES";
  }
  else {
    uint64_t v22 = @"NO";
  }
  [v3 appendFormat:@"inGrace: '%@'; ", v22];
  v23 = [(PKCreditAccountBalanceSummary *)self->_balanceSummary description];
  [v3 appendFormat:@"balanceSummary: '%@'; ", v23];

  uint64_t v24 = [(NSSet *)self->_accountUserActivity description];
  [v3 appendFormat:@"accountUserActivity: '%@'; ", v24];

  uint64_t v25 = [(PKCreditAccountMergeSummary *)self->_mergeSummary description];
  [v3 appendFormat:@"mergeSummary: '%@'; ", v25];

  uint64_t v26 = [(PKCreditAccountStatement *)self->_currentStatement description];
  [v3 appendFormat:@"currentStatement: '%@'; ", v26];

  uint64_t v27 = [(NSDecimalNumber *)self->_installmentBalance description];
  [v3 appendFormat:@"installmentBalance: '%@'; ", v27];

  uint64_t v28 = [(PKCreditAccountSummary *)self adjustedBalance];
  [v3 appendFormat:@"adjustedBalance: '%@'; ", v28];

  if (self->_recoveryPaymentPlansSupported) {
    uint64_t v29 = @"YES";
  }
  else {
    uint64_t v29 = @"NO";
  }
  [v3 appendFormat:@"recoveryPaymentPlansSupported: '%@'; ", v29];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKCreditAccountSummary allocWithZone:](PKCreditAccountSummary, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_creditLimit copyWithZone:a3];
  creditLimit = v5->_creditLimit;
  v5->_creditLimit = (NSDecimalNumber *)v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_availableCredit copyWithZone:a3];
  availableCredit = v5->_availableCredit;
  v5->_availableCredit = (NSDecimalNumber *)v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = (NSDecimalNumber *)v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_adjustedBalance copyWithZone:a3];
  adjustedBalance = v5->_adjustedBalance;
  v5->_adjustedBalance = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_rewardsBalance copyWithZone:a3];
  rewardsBalance = v5->_rewardsBalance;
  v5->_rewardsBalance = (NSDecimalNumber *)v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_remainingMinimumPayment copyWithZone:a3];
  remainingMinimumPayment = v5->_remainingMinimumPayment;
  v5->_remainingMinimumPayment = (NSDecimalNumber *)v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_remainingStatementBalance copyWithZone:a3];
  remainingStatementBalance = v5->_remainingStatementBalance;
  v5->_remainingStatementBalance = (NSDecimalNumber *)v18;

  uint64_t v20 = [(NSDecimalNumber *)self->_remainingStatementBalanceForInterestCalculation copyWithZone:a3];
  remainingStatementBalanceForInterestCalculation = v5->_remainingStatementBalanceForInterestCalculation;
  v5->_remainingStatementBalanceForInterestCalculation = (NSDecimalNumber *)v20;

  v5->_autoPayEnabled = self->_autoPayEnabled;
  v5->_requiresDebtCollectionNotices = self->_requiresDebtCollectionNotices;
  v5->_unint64_t balanceStatus = self->_balanceStatus;
  v5->_cyclesPastDue = self->_cyclesPastDue;
  objc_storeStrong((id *)&v5->_pastDueAmount, self->_pastDueAmount);
  uint64_t v22 = [(NSDate *)self->_lastPaymentDate copyWithZone:a3];
  lastPaymentDate = v5->_lastPaymentDate;
  v5->_lastPaymentDate = (NSDate *)v22;

  uint64_t v24 = [(NSDate *)self->_paymentDueDate copyWithZone:a3];
  paymentDueDate = v5->_paymentDueDate;
  v5->_paymentDueDate = (NSDate *)v24;

  uint64_t v26 = [(PKCreditAccountBalanceSummary *)self->_balanceSummary copyWithZone:a3];
  balanceSummary = v5->_balanceSummary;
  v5->_balanceSummary = v26;

  uint64_t v28 = [(NSSet *)self->_accountUserActivity copyWithZone:a3];
  accountUserActivity = v5->_accountUserActivity;
  v5->_accountUserActivity = (NSSet *)v28;

  uint64_t v30 = [(PKCreditAccountMergeSummary *)self->_mergeSummary copyWithZone:a3];
  mergeSummary = v5->_mergeSummary;
  v5->_mergeSummary = v30;

  v32 = [(PKCreditAccountStatement *)self->_currentStatement copyWithZone:a3];
  currentStatement = v5->_currentStatement;
  v5->_currentStatement = v32;

  uint64_t v34 = [(NSDecimalNumber *)self->_unpostedInterest copyWithZone:a3];
  unpostedInterest = v5->_unpostedInterest;
  v5->_unpostedInterest = (NSDecimalNumber *)v34;

  uint64_t v36 = [(NSDate *)self->_unpostedInterestTimestamp copyWithZone:a3];
  unpostedInterestTimestamp = v5->_unpostedInterestTimestamp;
  v5->_unpostedInterestTimestamp = (NSDate *)v36;

  uint64_t v38 = [(NSDecimalNumber *)self->_chargeOffPreventionAmount copyWithZone:a3];
  chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
  v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v38;

  uint64_t v40 = [(NSDecimalNumber *)self->_pastDueAmount copyWithZone:a3];
  pastDueAmount = v5->_pastDueAmount;
  v5->_pastDueAmount = (NSDecimalNumber *)v40;

  v5->_inGrace = self->_inGrace;
  uint64_t v42 = [(NSDecimalNumber *)self->_remainingMinimumPaymentExcludedFromInterestCalculation copyWithZone:a3];
  remainingMinimumPaymentExcludedFromInterestCalculation = v5->_remainingMinimumPaymentExcludedFromInterestCalculation;
  v5->_remainingMinimumPaymentExcludedFromInterestCalculation = (NSDecimalNumber *)v42;

  uint64_t v44 = [(NSDecimalNumber *)self->_installmentBalance copyWithZone:a3];
  installmentBalance = v5->_installmentBalance;
  v5->_installmentBalance = (NSDecimalNumber *)v44;

  v5->_recoveryPaymentPlansSupported = self->_recoveryPaymentPlansSupported;
  return v5;
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
}

- (NSDecimalNumber)availableCredit
{
  return self->_availableCredit;
}

- (void)setAvailableCredit:(id)a3
{
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (void)setAdjustedBalance:(id)a3
{
}

- (NSDecimalNumber)rewardsBalance
{
  return self->_rewardsBalance;
}

- (void)setRewardsBalance:(id)a3
{
}

- (NSDecimalNumber)remainingStatementBalance
{
  return self->_remainingStatementBalance;
}

- (void)setRemainingStatementBalance:(id)a3
{
}

- (NSDecimalNumber)remainingStatementBalanceForInterestCalculation
{
  return self->_remainingStatementBalanceForInterestCalculation;
}

- (void)setRemainingStatementBalanceForInterestCalculation:(id)a3
{
}

- (NSDecimalNumber)remainingMinimumPayment
{
  return self->_remainingMinimumPayment;
}

- (void)setRemainingMinimumPayment:(id)a3
{
}

- (NSDecimalNumber)remainingMinimumPaymentExcludedFromInterestCalculation
{
  return self->_remainingMinimumPaymentExcludedFromInterestCalculation;
}

- (void)setRemainingMinimumPaymentExcludedFromInterestCalculation:(id)a3
{
}

- (NSDecimalNumber)installmentBalance
{
  return self->_installmentBalance;
}

- (void)setInstallmentBalance:(id)a3
{
}

- (void)setPaymentDueDate:(id)a3
{
}

- (NSDate)lastPaymentDate
{
  return self->_lastPaymentDate;
}

- (void)setLastPaymentDate:(id)a3
{
}

- (int64_t)cyclesPastDue
{
  return self->_cyclesPastDue;
}

- (void)setCyclesPastDue:(int64_t)a3
{
  self->_cyclesPastDue = a3;
}

- (unint64_t)balanceStatus
{
  return self->_balanceStatus;
}

- (void)setBalanceStatus:(unint64_t)a3
{
  self->_unint64_t balanceStatus = a3;
}

- (PKCreditAccountBalanceSummary)balanceSummary
{
  return self->_balanceSummary;
}

- (void)setBalanceSummary:(id)a3
{
}

- (NSSet)accountUserActivity
{
  return self->_accountUserActivity;
}

- (void)setAccountUserActivity:(id)a3
{
}

- (PKCreditAccountMergeSummary)mergeSummary
{
  return self->_mergeSummary;
}

- (void)setMergeSummary:(id)a3
{
}

- (BOOL)requiresDebtCollectionNotices
{
  return self->_requiresDebtCollectionNotices;
}

- (void)setRequiresDebtCollectionNotices:(BOOL)a3
{
  self->_requiresDebtCollectionNotices = a3;
}

- (NSDecimalNumber)unpostedInterest
{
  return self->_unpostedInterest;
}

- (void)setUnpostedInterest:(id)a3
{
}

- (NSDate)unpostedInterestTimestamp
{
  return self->_unpostedInterestTimestamp;
}

- (void)setUnpostedInterestTimestamp:(id)a3
{
}

- (BOOL)inGrace
{
  return self->_inGrace;
}

- (void)setInGrace:(BOOL)a3
{
  self->_inGrace = a3;
}

- (NSDecimalNumber)chargeOffPreventionAmount
{
  return self->_chargeOffPreventionAmount;
}

- (void)setChargeOffPreventionAmount:(id)a3
{
}

- (NSDecimalNumber)pastDueAmount
{
  return self->_pastDueAmount;
}

- (void)setPastDueAmount:(id)a3
{
}

- (BOOL)autoPayEnabled
{
  return self->_autoPayEnabled;
}

- (void)setAutoPayEnabled:(BOOL)a3
{
  self->_autoPayEnabled = a3;
}

- (PKCreditAccountStatement)currentStatement
{
  return self->_currentStatement;
}

- (void)setCurrentStatement:(id)a3
{
}

- (BOOL)recoveryPaymentPlansSupported
{
  return self->_recoveryPaymentPlansSupported;
}

- (void)setRecoveryPaymentPlansSupported:(BOOL)a3
{
  self->_recoveryPaymentPlansSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatement, 0);
  objc_storeStrong((id *)&self->_pastDueAmount, 0);
  objc_storeStrong((id *)&self->_chargeOffPreventionAmount, 0);
  objc_storeStrong((id *)&self->_unpostedInterestTimestamp, 0);
  objc_storeStrong((id *)&self->_unpostedInterest, 0);
  objc_storeStrong((id *)&self->_mergeSummary, 0);
  objc_storeStrong((id *)&self->_accountUserActivity, 0);
  objc_storeStrong((id *)&self->_balanceSummary, 0);
  objc_storeStrong((id *)&self->_lastPaymentDate, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_installmentBalance, 0);
  objc_storeStrong((id *)&self->_remainingMinimumPaymentExcludedFromInterestCalculation, 0);
  objc_storeStrong((id *)&self->_remainingMinimumPayment, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalanceForInterestCalculation, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalance, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
  objc_storeStrong((id *)&self->_adjustedBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_availableCredit, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
}

@end