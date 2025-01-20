@interface PKCompoundInterestCalculatorConfiguration
+ (id)configurationWithCreditAccount:(id)a3;
- (BOOL)inGrace;
- (BOOL)isInDisasterRecovery;
- (NSArray)futurePayments;
- (NSArray)periodTransactions;
- (NSDate)periodEndDate;
- (NSDate)periodStartDate;
- (NSDate)unpostedInterestTimestamp;
- (NSDecimalNumber)apr;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)periodStartingBalance;
- (NSDecimalNumber)remainingPeriodMinimumPayment;
- (NSDecimalNumber)remainingPeriodMinimumPaymentExcludedFromInterestCalculation;
- (NSDecimalNumber)remainingPeriodStartingBalance;
- (NSDecimalNumber)remainingPeriodStartingBalanceForGracePurposes;
- (NSDecimalNumber)unpostedInterest;
- (NSTimeZone)productTimeZone;
- (PKCompoundInterestCalculatorConfiguration)init;
- (id)description;
- (int64_t)_daysInYearForDate:(id)a3 withTimeZone:(id)a4;
- (int64_t)compoundingPeriods;
- (unint64_t)calculationMethod;
- (void)setAPR:(id)a3;
- (void)setCalculationMethod:(unint64_t)a3;
- (void)setCompoundingPeriods:(int64_t)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setFuturePayments:(id)a3;
- (void)setInGrace:(BOOL)a3;
- (void)setIsInDisasterRecovery:(BOOL)a3;
- (void)setPeriodEndDate:(id)a3;
- (void)setPeriodStartDate:(id)a3;
- (void)setPeriodStartingBalance:(id)a3;
- (void)setPeriodTransactions:(id)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setRemainingPeriodMinimumPayment:(id)a3;
- (void)setRemainingPeriodMinimumPaymentExcludedFromInterestCalculation:(id)a3;
- (void)setRemainingPeriodStartingBalance:(id)a3;
- (void)setRemainingPeriodStartingBalanceForGracePurposes:(id)a3;
- (void)setUnpostedInterest:(id)a3;
- (void)setUnpostedInterestTimestamp:(id)a3;
- (void)updateWithCreditAccount:(id)a3;
@end

@implementation PKCompoundInterestCalculatorConfiguration

+ (id)configurationWithCreditAccount:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKCompoundInterestCalculatorConfiguration);
  [(PKCompoundInterestCalculatorConfiguration *)v4 updateWithCreditAccount:v3];

  return v4;
}

- (PKCompoundInterestCalculatorConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKCompoundInterestCalculatorConfiguration;
  v2 = [(PKCompoundInterestCalculatorConfiguration *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_calculationMethod = 0;
    v2->_compoundingPeriods = 365;
    uint64_t v4 = [MEMORY[0x1E4F28C28] zero];
    apr = v3->_apr;
    v3->_apr = (NSDecimalNumber *)v4;

    *(_WORD *)&v3->_inGrace = 1;
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v6;
  }
  return v3;
}

- (void)updateWithCreditAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v38 = v4;
    BOOL v5 = [v4 type] == 1;
    id v4 = v38;
    if (v5)
    {
      uint64_t v6 = [v38 creditDetails];
      v7 = [v6 accountSummary];
      v8 = [v6 accountSummary];
      objc_super v9 = [v8 currentStatement];

      v10 = [v7 balanceSummary];
      v11 = [v6 rates];
      v12 = [v11 aprForPurchases];
      apr = self->_apr;
      self->_apr = v12;

      v14 = [v10 openingDate];
      periodStartDate = self->_periodStartDate;
      self->_periodStartDate = v14;

      v16 = [v10 closingDate];
      periodEndDate = self->_periodEndDate;
      self->_periodEndDate = v16;

      v18 = [v9 statementBalance];
      periodStartingBalance = self->_periodStartingBalance;
      self->_periodStartingBalance = v18;

      v20 = [v7 remainingStatementBalanceForInterestCalculation];
      v21 = v20;
      if (v20)
      {
        v22 = v20;
      }
      else
      {
        v22 = [v7 remainingStatementBalance];
      }
      remainingPeriodStartingBalance = self->_remainingPeriodStartingBalance;
      self->_remainingPeriodStartingBalance = v22;

      v24 = [v7 remainingStatementBalance];
      remainingPeriodStartingBalanceForGracePurposes = self->_remainingPeriodStartingBalanceForGracePurposes;
      self->_remainingPeriodStartingBalanceForGracePurposes = v24;

      v26 = [v7 remainingMinimumPayment];
      remainingPeriodMinimumPayment = self->_remainingPeriodMinimumPayment;
      self->_remainingPeriodMinimumPayment = v26;

      v28 = [v7 remainingMinimumPaymentExcludedFromInterestCalculation];
      remainingPeriodMinimumPaymentExcludedFromInterestCalculation = self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation;
      self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation = v28;

      v30 = [v7 adjustedBalance];
      currentBalance = self->_currentBalance;
      self->_currentBalance = v30;

      self->_inGrace = [v7 inGrace];
      self->_isInDisasterRecovery = [v38 stateReason] == 2;
      v32 = [v7 unpostedInterest];
      unpostedInterest = self->_unpostedInterest;
      self->_unpostedInterest = v32;

      v34 = [v7 unpostedInterestTimestamp];
      unpostedInterestTimestamp = self->_unpostedInterestTimestamp;
      self->_unpostedInterestTimestamp = v34;

      v36 = [v6 productTimeZone];
      productTimeZone = self->_productTimeZone;
      self->_productTimeZone = v36;

      self->_compoundingPeriods = [(PKCompoundInterestCalculatorConfiguration *)self _daysInYearForDate:self->_periodStartDate withTimeZone:self->_productTimeZone];
      id v4 = v38;
    }
  }
}

- (int64_t)_daysInYearForDate:(id)a3 withTimeZone:(id)a4
{
  calendar = self->_calendar;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[(NSCalendar *)calendar copy];
  [v8 setTimeZone:v6];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v10 = [v8 component:4 fromDate:v7];

  [v9 setYear:v10];
  objc_msgSend(v9, "setMonth:", objc_msgSend(v8, "minimumRangeOfUnit:", 8));
  objc_msgSend(v9, "setDay:", objc_msgSend(v8, "minimumRangeOfUnit:", 16));
  v11 = [v8 dateFromComponents:v9];
  objc_msgSend(v9, "setYear:", objc_msgSend(v9, "year") + 1);
  v12 = [v8 dateFromComponents:v9];
  v13 = [v8 components:16 fromDate:v11 toDate:v12 options:0];
  int64_t v14 = [v13 day];

  return v14;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_calculationMethod];
  [v6 appendFormat:@"calculationMethod: '%@'; ", v7];

  [v6 appendFormat:@"apr: '%@'; ", self->_apr];
  v8 = [NSNumber numberWithInteger:self->_compoundingPeriods];
  [v6 appendFormat:@"compoundingPeriods: '%@'; ", v8];

  [v6 appendFormat:@"periodStartDate: '%@'; ", self->_periodStartDate];
  [v6 appendFormat:@"periodEndDate: '%@'; ", self->_periodEndDate];
  [v6 appendFormat:@"periodStartingBalance: '%@'; ", self->_periodStartingBalance];
  objc_msgSend(v6, "appendFormat:", @"remainingPeriodStartingBalance: '%@'; ",
    self->_remainingPeriodStartingBalance);
  objc_msgSend(v6, "appendFormat:", @"remainingPeriodStartingBalanceForGracePurposes: '%@'; ",
    self->_remainingPeriodStartingBalanceForGracePurposes);
  objc_msgSend(v6, "appendFormat:", @"remainingPeriodMinimumPayment: '%@'; ",
    self->_remainingPeriodMinimumPayment);
  objc_msgSend(v6, "appendFormat:", @"remainingPeriodMinimumPaymentExcludedFromInterestCalculation: '%@'; ",
    self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation);
  [v6 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  id v9 = [NSNumber numberWithBool:self->_inGrace];
  [v6 appendFormat:@"inGrace: '%@'; ", v9];

  uint64_t v10 = [NSNumber numberWithBool:self->_isInDisasterRecovery];
  [v6 appendFormat:@"isInDisasterRecovery: '%@'; ", v10];

  [v6 appendFormat:@"unpostedInterest: '%@'; ", self->_unpostedInterest];
  [v6 appendFormat:@"unpostedInterestTimestamp: '%@'; ", self->_unpostedInterestTimestamp];
  [v6 appendFormat:@"productTimeZone: '%@'; ", self->_productTimeZone];
  [v6 appendFormat:@"periodTransactions: '%@'; ", self->_periodTransactions];
  [v6 appendFormat:@"futurePayments: '%@'; ", self->_futurePayments];
  [v6 appendFormat:@">"];
  v11 = [NSString stringWithString:v6];

  return v11;
}

- (unint64_t)calculationMethod
{
  return self->_calculationMethod;
}

- (void)setCalculationMethod:(unint64_t)a3
{
  self->_calculationMethod = a3;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setAPR:(id)a3
{
}

- (int64_t)compoundingPeriods
{
  return self->_compoundingPeriods;
}

- (void)setCompoundingPeriods:(int64_t)a3
{
  self->_compoundingPeriods = a3;
}

- (NSDate)periodStartDate
{
  return self->_periodStartDate;
}

- (void)setPeriodStartDate:(id)a3
{
}

- (NSDate)periodEndDate
{
  return self->_periodEndDate;
}

- (void)setPeriodEndDate:(id)a3
{
}

- (NSDecimalNumber)periodStartingBalance
{
  return self->_periodStartingBalance;
}

- (void)setPeriodStartingBalance:(id)a3
{
}

- (NSDecimalNumber)remainingPeriodStartingBalance
{
  return self->_remainingPeriodStartingBalance;
}

- (void)setRemainingPeriodStartingBalance:(id)a3
{
}

- (NSDecimalNumber)remainingPeriodStartingBalanceForGracePurposes
{
  return self->_remainingPeriodStartingBalanceForGracePurposes;
}

- (void)setRemainingPeriodStartingBalanceForGracePurposes:(id)a3
{
}

- (NSDecimalNumber)remainingPeriodMinimumPayment
{
  return self->_remainingPeriodMinimumPayment;
}

- (void)setRemainingPeriodMinimumPayment:(id)a3
{
}

- (NSDecimalNumber)remainingPeriodMinimumPaymentExcludedFromInterestCalculation
{
  return self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation;
}

- (void)setRemainingPeriodMinimumPaymentExcludedFromInterestCalculation:(id)a3
{
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
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

- (BOOL)isInDisasterRecovery
{
  return self->_isInDisasterRecovery;
}

- (void)setIsInDisasterRecovery:(BOOL)a3
{
  self->_isInDisasterRecovery = a3;
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

- (NSArray)periodTransactions
{
  return self->_periodTransactions;
}

- (void)setPeriodTransactions:(id)a3
{
}

- (NSArray)futurePayments
{
  return self->_futurePayments;
}

- (void)setFuturePayments:(id)a3
{
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_futurePayments, 0);
  objc_storeStrong((id *)&self->_periodTransactions, 0);
  objc_storeStrong((id *)&self->_unpostedInterestTimestamp, 0);
  objc_storeStrong((id *)&self->_unpostedInterest, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation, 0);
  objc_storeStrong((id *)&self->_remainingPeriodMinimumPayment, 0);
  objc_storeStrong((id *)&self->_remainingPeriodStartingBalanceForGracePurposes, 0);
  objc_storeStrong((id *)&self->_remainingPeriodStartingBalance, 0);
  objc_storeStrong((id *)&self->_periodStartingBalance, 0);
  objc_storeStrong((id *)&self->_periodEndDate, 0);
  objc_storeStrong((id *)&self->_periodStartDate, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end