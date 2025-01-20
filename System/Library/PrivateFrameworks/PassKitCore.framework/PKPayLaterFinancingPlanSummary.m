@interface PKPayLaterFinancingPlanSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAPR;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterFinancingPlanSummary:(id)a3;
- (BOOL)isNextInstallmentPastDue;
- (NSDate)cancellationDate;
- (NSDate)endInstallmentDate;
- (NSDate)nextInstallmentDueDate;
- (NSDate)startInstallmentDate;
- (NSDate)transactionDate;
- (NSDecimalNumber)apr;
- (NSString)panSuffix;
- (PKCurrencyAmount)currentBalance;
- (PKCurrencyAmount)initialAmount;
- (PKCurrencyAmount)installmentAmount;
- (PKCurrencyAmount)interestPaidToDate;
- (PKCurrencyAmount)pastDueAmount;
- (PKCurrencyAmount)paymentAmountToDate;
- (PKCurrencyAmount)payoffAmount;
- (PKCurrencyAmount)principalPaidToDate;
- (PKCurrencyAmount)totalAdjustments;
- (PKCurrencyAmount)totalAmount;
- (PKCurrencyAmount)totalInterest;
- (PKCurrencyAmount)totalPrincipal;
- (PKPayLaterFinancingPlanSummary)initWithCoder:(id)a3;
- (PKPayLaterFinancingPlanSummary)initWithDictionary:(id)a3;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)daysPastDue;
- (unint64_t)cancellationReason;
- (unint64_t)hash;
- (unint64_t)installmentCount;
- (void)encodeWithCoder:(id)a3;
- (void)setApr:(id)a3;
- (void)setCancellationDate:(id)a3;
- (void)setCancellationReason:(unint64_t)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setDaysPastDue:(int64_t)a3;
- (void)setEndInstallmentDate:(id)a3;
- (void)setHasAPR:(BOOL)a3;
- (void)setInitialAmount:(id)a3;
- (void)setInstallmentAmount:(id)a3;
- (void)setInstallmentCount:(unint64_t)a3;
- (void)setInterestPaidToDate:(id)a3;
- (void)setNextInstallmentDueDate:(id)a3;
- (void)setPanSuffix:(id)a3;
- (void)setPastDueAmount:(id)a3;
- (void)setPaymentAmountToDate:(id)a3;
- (void)setPayoffAmount:(id)a3;
- (void)setPrincipalPaidToDate:(id)a3;
- (void)setStartInstallmentDate:(id)a3;
- (void)setTotalAdjustments:(id)a3;
- (void)setTotalAmount:(id)a3;
- (void)setTotalInterest:(id)a3;
- (void)setTotalPrincipal:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation PKPayLaterFinancingPlanSummary

- (PKPayLaterFinancingPlanSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPayLaterFinancingPlanSummary;
  v5 = [(PKPayLaterFinancingPlanSummary *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"apr"];
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v6;

    v5->_hasAPR = [v4 PKBoolForKey:@"hasAPR"];
    v5->_daysPastDue = [v4 PKIntegerForKey:@"daysPastDue"];
    uint64_t v8 = [v4 PKCurrencyAmountForKey:@"pastDueAmount"];
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (PKCurrencyAmount *)v8;

    v5->_installmentCount = [v4 PKIntegerForKey:@"installmentCount"];
    uint64_t v10 = [v4 PKCurrencyAmountForKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 PKCurrencyAmountForKey:@"initialAmount"];
    initialAmount = v5->_initialAmount;
    v5->_initialAmount = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 PKCurrencyAmountForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 PKCurrencyAmountForKey:@"installmentAmount"];
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v16;

    uint64_t v18 = [v4 PKCurrencyAmountForKey:@"totalAdjustments"];
    totalAdjustments = v5->_totalAdjustments;
    v5->_totalAdjustments = (PKCurrencyAmount *)v18;

    uint64_t v20 = [v4 PKCurrencyAmountForKey:@"totalPrincipal"];
    totalPrincipal = v5->_totalPrincipal;
    v5->_totalPrincipal = (PKCurrencyAmount *)v20;

    uint64_t v22 = [v4 PKCurrencyAmountForKey:@"paymentAmountToDate"];
    paymentAmountToDate = v5->_paymentAmountToDate;
    v5->_paymentAmountToDate = (PKCurrencyAmount *)v22;

    uint64_t v24 = [v4 PKCurrencyAmountForKey:@"totalInterest"];
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v24;

    uint64_t v26 = [v4 PKCurrencyAmountForKey:@"interestPaidToDate"];
    interestPaidToDate = v5->_interestPaidToDate;
    v5->_interestPaidToDate = (PKCurrencyAmount *)v26;

    uint64_t v28 = [v4 PKCurrencyAmountForKey:@"principalPaidToDate"];
    principalPaidToDate = v5->_principalPaidToDate;
    v5->_principalPaidToDate = (PKCurrencyAmount *)v28;

    uint64_t v30 = [v4 PKCurrencyAmountForKey:@"payoffAmount"];
    payoffAmount = v5->_payoffAmount;
    v5->_payoffAmount = (PKCurrencyAmount *)v30;

    uint64_t v32 = [v4 PKDateForKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v32;

    uint64_t v34 = [v4 PKDateForKey:@"startInstallmentDate"];
    startInstallmentDate = v5->_startInstallmentDate;
    v5->_startInstallmentDate = (NSDate *)v34;

    uint64_t v36 = [v4 PKDateForKey:@"nextInstallmentDueDate"];
    nextInstallmentDueDate = v5->_nextInstallmentDueDate;
    v5->_nextInstallmentDueDate = (NSDate *)v36;

    uint64_t v38 = [v4 PKDateForKey:@"endInstallmentDate"];
    endInstallmentDate = v5->_endInstallmentDate;
    v5->_endInstallmentDate = (NSDate *)v38;

    uint64_t v40 = [v4 PKDateForKey:@"cancellationDate"];
    cancellationDate = v5->_cancellationDate;
    v5->_cancellationDate = (NSDate *)v40;

    v42 = [v4 PKStringForKey:@"cancellationReason"];
    v5->_cancellationReason = PKPayLaterFinancingPlanCancellationReasonFromString(v42);

    uint64_t v43 = [v4 PKStringForKey:@"panSuffix"];
    panSuffix = v5->_panSuffix;
    v5->_panSuffix = (NSString *)v43;
  }
  return v5;
}

- (double)progress
{
  paymentAmountToDate = self->_paymentAmountToDate;
  double v4 = 0.0;
  if (paymentAmountToDate && self->_totalAmount)
  {
    v5 = [(PKCurrencyAmount *)paymentAmountToDate currency];
    uint64_t v6 = [(PKCurrencyAmount *)self->_totalAmount currency];
    id v7 = v5;
    id v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
      {

        v11 = v7;
        goto LABEL_15;
      }
      char v10 = [v7 isEqualToString:v8];

      if ((v10 & 1) == 0) {
        return v4;
      }
    }
    v11 = [(PKCurrencyAmount *)self->_paymentAmountToDate amount];
    uint64_t v12 = [(PKCurrencyAmount *)self->_totalAmount amount];
    v9 = (void *)v12;
    if (!v11 || !v12) {
      goto LABEL_16;
    }
    id v7 = [MEMORY[0x1E4F28C28] zero];
    if (([v11 isEqualToNumber:v7] & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28C28] zero];
      char v14 = [v9 isEqualToNumber:v13];

      if (v14)
      {
LABEL_16:

        return v4;
      }
      id v7 = [v11 decimalNumberByDividingBy:v9];
      [v7 floatValue];
      double v4 = v15;
    }
LABEL_15:

    goto LABEL_16;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PKPayLaterFinancingPlanSummary *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFinancingPlanSummary *)self isEqualToPayLaterFinancingPlanSummary:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterFinancingPlanSummary:(id)a3
{
  double v4 = a3;
  if (!v4) {
    goto LABEL_102;
  }
  apr = self->_apr;
  BOOL v6 = (NSDecimalNumber *)v4[2];
  if (apr) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (apr != v6) {
      goto LABEL_102;
    }
  }
  else
  {
    char v8 = -[NSDecimalNumber isEqual:](apr, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_102;
    }
  }
  if (self->_hasAPR != *((unsigned __int8 *)v4 + 8)
    || self->_installmentCount != v4[5]
    || self->_daysPastDue != v4[3]
    || self->_cancellationReason != v4[22])
  {
    goto LABEL_102;
  }
  pastDueAmount = self->_pastDueAmount;
  char v10 = (PKCurrencyAmount *)v4[4];
  if (pastDueAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](pastDueAmount, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (pastDueAmount != v10)
  {
    goto LABEL_102;
  }
  totalAmount = self->_totalAmount;
  uint64_t v12 = (PKCurrencyAmount *)v4[6];
  if (totalAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAmount, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (totalAmount != v12)
  {
    goto LABEL_102;
  }
  initialAmount = self->_initialAmount;
  char v14 = (PKCurrencyAmount *)v4[7];
  if (initialAmount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](initialAmount, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (initialAmount != v14)
  {
    goto LABEL_102;
  }
  currentBalance = self->_currentBalance;
  uint64_t v16 = (PKCurrencyAmount *)v4[8];
  if (currentBalance && v16)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (currentBalance != v16)
  {
    goto LABEL_102;
  }
  installmentAmount = self->_installmentAmount;
  uint64_t v18 = (PKCurrencyAmount *)v4[9];
  if (installmentAmount && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](installmentAmount, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (installmentAmount != v18)
  {
    goto LABEL_102;
  }
  totalAdjustments = self->_totalAdjustments;
  uint64_t v20 = (PKCurrencyAmount *)v4[10];
  if (totalAdjustments && v20)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAdjustments, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (totalAdjustments != v20)
  {
    goto LABEL_102;
  }
  totalPrincipal = self->_totalPrincipal;
  uint64_t v22 = (PKCurrencyAmount *)v4[11];
  if (totalPrincipal && v22)
  {
    if (!-[PKCurrencyAmount isEqual:](totalPrincipal, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (totalPrincipal != v22)
  {
    goto LABEL_102;
  }
  paymentAmountToDate = self->_paymentAmountToDate;
  uint64_t v24 = (PKCurrencyAmount *)v4[12];
  if (paymentAmountToDate && v24)
  {
    if (!-[PKCurrencyAmount isEqual:](paymentAmountToDate, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (paymentAmountToDate != v24)
  {
    goto LABEL_102;
  }
  totalInterest = self->_totalInterest;
  uint64_t v26 = (PKCurrencyAmount *)v4[13];
  if (totalInterest && v26)
  {
    if (!-[PKCurrencyAmount isEqual:](totalInterest, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (totalInterest != v26)
  {
    goto LABEL_102;
  }
  interestPaidToDate = self->_interestPaidToDate;
  uint64_t v28 = (PKCurrencyAmount *)v4[15];
  if (interestPaidToDate && v28)
  {
    if (!-[PKCurrencyAmount isEqual:](interestPaidToDate, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (interestPaidToDate != v28)
  {
    goto LABEL_102;
  }
  principalPaidToDate = self->_principalPaidToDate;
  uint64_t v30 = (PKCurrencyAmount *)v4[14];
  if (principalPaidToDate && v30)
  {
    if (!-[PKCurrencyAmount isEqual:](principalPaidToDate, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (principalPaidToDate != v30)
  {
    goto LABEL_102;
  }
  payoffAmount = self->_payoffAmount;
  uint64_t v32 = (PKCurrencyAmount *)v4[16];
  if (payoffAmount && v32)
  {
    if (!-[PKCurrencyAmount isEqual:](payoffAmount, "isEqual:")) {
      goto LABEL_102;
    }
  }
  else if (payoffAmount != v32)
  {
    goto LABEL_102;
  }
  transactionDate = self->_transactionDate;
  uint64_t v34 = (NSDate *)v4[17];
  if (transactionDate && v34)
  {
    if ((-[NSDate isEqual:](transactionDate, "isEqual:") & 1) == 0) {
      goto LABEL_102;
    }
  }
  else if (transactionDate != v34)
  {
    goto LABEL_102;
  }
  startInstallmentDate = self->_startInstallmentDate;
  uint64_t v36 = (NSDate *)v4[18];
  if (startInstallmentDate && v36)
  {
    if ((-[NSDate isEqual:](startInstallmentDate, "isEqual:") & 1) == 0) {
      goto LABEL_102;
    }
  }
  else if (startInstallmentDate != v36)
  {
    goto LABEL_102;
  }
  nextInstallmentDueDate = self->_nextInstallmentDueDate;
  uint64_t v38 = (NSDate *)v4[19];
  if (nextInstallmentDueDate && v38)
  {
    if ((-[NSDate isEqual:](nextInstallmentDueDate, "isEqual:") & 1) == 0) {
      goto LABEL_102;
    }
  }
  else if (nextInstallmentDueDate != v38)
  {
    goto LABEL_102;
  }
  endInstallmentDate = self->_endInstallmentDate;
  uint64_t v40 = (NSDate *)v4[20];
  if (endInstallmentDate && v40)
  {
    if ((-[NSDate isEqual:](endInstallmentDate, "isEqual:") & 1) == 0) {
      goto LABEL_102;
    }
  }
  else if (endInstallmentDate != v40)
  {
    goto LABEL_102;
  }
  cancellationDate = self->_cancellationDate;
  v42 = (NSDate *)v4[21];
  if (!cancellationDate || !v42)
  {
    if (cancellationDate == v42) {
      goto LABEL_97;
    }
LABEL_102:
    char v48 = 0;
    goto LABEL_103;
  }
  if ((-[NSDate isEqual:](cancellationDate, "isEqual:") & 1) == 0) {
    goto LABEL_102;
  }
LABEL_97:
  panSuffix = self->_panSuffix;
  v44 = (void *)v4[23];
  v45 = panSuffix;
  objc_super v46 = v44;
  v47 = v46;
  if (v45 == v46)
  {
    char v48 = 1;
  }
  else
  {
    char v48 = 0;
    if (v45 && v46) {
      char v48 = [(NSString *)v45 isEqualToString:v46];
    }
  }

LABEL_103:
  return v48;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_apr];
  [v3 safelyAddObject:self->_totalAmount];
  [v3 safelyAddObject:self->_initialAmount];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_installmentAmount];
  [v3 safelyAddObject:self->_totalAdjustments];
  [v3 safelyAddObject:self->_totalPrincipal];
  [v3 safelyAddObject:self->_paymentAmountToDate];
  [v3 safelyAddObject:self->_interestPaidToDate];
  [v3 safelyAddObject:self->_principalPaidToDate];
  [v3 safelyAddObject:self->_payoffAmount];
  [v3 safelyAddObject:self->_totalInterest];
  [v3 safelyAddObject:self->_transactionDate];
  [v3 safelyAddObject:self->_startInstallmentDate];
  [v3 safelyAddObject:self->_nextInstallmentDueDate];
  [v3 safelyAddObject:self->_endInstallmentDate];
  [v3 safelyAddObject:self->_cancellationDate];
  [v3 safelyAddObject:self->_panSuffix];
  [v3 safelyAddObject:self->_pastDueAmount];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_hasAPR - v4 + 32 * v4;
  unint64_t v6 = self->_installmentCount - v5 + 32 * v5;
  int64_t v7 = self->_daysPastDue - v6 + 32 * v6;
  unint64_t v8 = self->_cancellationReason - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDecimalNumber *)self->_apr stringValue];
  [v3 appendFormat:@"apr: '%@'; ", v4];

  if (self->_hasAPR) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"hasAPR: '%@'; ", v5];
  objc_msgSend(v3, "appendFormat:", @"daysPastDue: %ld; ", self->_daysPastDue);
  [v3 appendFormat:@"pastDueAmount: '%@'; ", self->_pastDueAmount];
  objc_msgSend(v3, "appendFormat:", @"installmentCount: '%lu'; ", self->_installmentCount);
  [v3 appendFormat:@"totalAmount: '%@'; ", self->_totalAmount];
  [v3 appendFormat:@"initialAmount: '%@'; ", self->_initialAmount];
  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"installmentAmount: '%@'; ", self->_installmentAmount];
  [v3 appendFormat:@"totalAdjustments: '%@'; ", self->_totalAdjustments];
  [v3 appendFormat:@"totalPrincipal: '%@'; ", self->_totalPrincipal];
  [v3 appendFormat:@"totalInterest: '%@'; ", self->_totalInterest];
  [v3 appendFormat:@"interestPaidToDate: '%@'; ", self->_interestPaidToDate];
  [v3 appendFormat:@"principalPaidToDate: '%@'; ", self->_principalPaidToDate];
  [v3 appendFormat:@"payoffAmount: '%@'; ", self->_payoffAmount];
  [v3 appendFormat:@"paymentAmountToDate: '%@'; ", self->_paymentAmountToDate];
  unint64_t v6 = [(NSDate *)self->_transactionDate description];
  [v3 appendFormat:@"transactionDate: '%@'; ", v6];

  int64_t v7 = [(NSDate *)self->_startInstallmentDate description];
  [v3 appendFormat:@"startInstallmentDate: '%@'; ", v7];

  unint64_t v8 = [(NSDate *)self->_nextInstallmentDueDate description];
  [v3 appendFormat:@"nextInstallmentDueDate: '%@'; ", v8];

  v9 = [(NSDate *)self->_endInstallmentDate description];
  [v3 appendFormat:@"endInstallmentDate: '%@'; ", v9];

  char v10 = [(NSDate *)self->_cancellationDate description];
  [v3 appendFormat:@"cancellationDate: '%@'; ", v10];

  v11 = PKPayLaterFinancingPlanCancellationReasonToString(self->_cancellationReason);
  [v3 appendFormat:@"cancellationReason: '%@'; ", v11];

  [v3 appendFormat:@"panSuffix: '%@'; ", self->_panSuffix];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(NSDecimalNumber *)self->_apr stringValue];
  [v3 setObject:v4 forKeyedSubscript:@"apr"];

  uint64_t v5 = [NSNumber numberWithBool:self->_hasAPR];
  [v3 setObject:v5 forKeyedSubscript:@"hasAPR"];

  unint64_t v6 = [NSNumber numberWithInteger:self->_daysPastDue];
  [v3 setObject:v6 forKeyedSubscript:@"daysPastDue"];

  int64_t v7 = [(PKCurrencyAmount *)self->_pastDueAmount dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"pastDueAmount"];

  unint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_installmentCount];
  [v3 setObject:v8 forKeyedSubscript:@"installmentCount"];

  v9 = [(PKCurrencyAmount *)self->_totalAmount dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"totalAmount"];

  char v10 = [(PKCurrencyAmount *)self->_initialAmount dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"initialAmount"];

  v11 = [(PKCurrencyAmount *)self->_currentBalance dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"currentBalance"];

  uint64_t v12 = [(PKCurrencyAmount *)self->_installmentAmount dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"installmentAmount"];

  v13 = [(PKCurrencyAmount *)self->_totalAdjustments dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"totalAdjustments"];

  char v14 = [(PKCurrencyAmount *)self->_totalPrincipal dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"totalPrincipal"];

  float v15 = [(PKCurrencyAmount *)self->_paymentAmountToDate dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"paymentAmountToDate"];

  uint64_t v16 = [(PKCurrencyAmount *)self->_interestPaidToDate dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"interestPaidToDate"];

  v17 = [(PKCurrencyAmount *)self->_principalPaidToDate dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"principalPaidToDate"];

  uint64_t v18 = [(PKCurrencyAmount *)self->_payoffAmount dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"payoffAmount"];

  v19 = [(PKCurrencyAmount *)self->_totalInterest dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"totalInterest"];

  transactionDate = self->_transactionDate;
  if (transactionDate)
  {
    v21 = PKISO8601DateStringFromDate(transactionDate);
    [v3 setObject:v21 forKeyedSubscript:@"transactionDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"transactionDate"];
  }
  startInstallmentDate = self->_startInstallmentDate;
  if (startInstallmentDate)
  {
    v23 = PKISO8601DateStringFromDate(startInstallmentDate);
    [v3 setObject:v23 forKeyedSubscript:@"startInstallmentDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"startInstallmentDate"];
  }
  nextInstallmentDueDate = self->_nextInstallmentDueDate;
  if (nextInstallmentDueDate)
  {
    v25 = PKISO8601DateStringFromDate(nextInstallmentDueDate);
    [v3 setObject:v25 forKeyedSubscript:@"nextInstallmentDueDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"nextInstallmentDueDate"];
  }
  endInstallmentDate = self->_endInstallmentDate;
  if (endInstallmentDate)
  {
    v27 = PKISO8601DateStringFromDate(endInstallmentDate);
    [v3 setObject:v27 forKeyedSubscript:@"endInstallmentDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"endInstallmentDate"];
  }
  cancellationDate = self->_cancellationDate;
  if (cancellationDate)
  {
    v29 = PKISO8601DateStringFromDate(cancellationDate);
    [v3 setObject:v29 forKeyedSubscript:@"cancellationDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"cancellationDate"];
  }
  [v3 setObject:self->_panSuffix forKeyedSubscript:@"panSuffix"];
  uint64_t v30 = PKPayLaterFinancingPlanCancellationReasonToString(self->_cancellationReason);
  [v3 setObject:v30 forKeyedSubscript:@"cancellationReason"];

  v31 = (void *)[v3 copy];
  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKPayLaterFinancingPlanSummary;
  uint64_t v5 = [(PKPayLaterFinancingPlanSummary *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apr"];
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v6;

    v5->_hasAPR = [v4 decodeBoolForKey:@"hasAPR"];
    v5->_daysPastDue = [v4 decodeIntegerForKey:@"daysPastDue"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pastDueAmount"];
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (PKCurrencyAmount *)v8;

    v5->_installmentCount = [v4 decodeIntegerForKey:@"installmentCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialAmount"];
    initialAmount = v5->_initialAmount;
    v5->_initialAmount = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAmount"];
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAdjustments"];
    totalAdjustments = v5->_totalAdjustments;
    v5->_totalAdjustments = (PKCurrencyAmount *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalPrincipal"];
    totalPrincipal = v5->_totalPrincipal;
    v5->_totalPrincipal = (PKCurrencyAmount *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentAmountToDate"];
    paymentAmountToDate = v5->_paymentAmountToDate;
    v5->_paymentAmountToDate = (PKCurrencyAmount *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalInterest"];
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestPaidToDate"];
    interestPaidToDate = v5->_interestPaidToDate;
    v5->_interestPaidToDate = (PKCurrencyAmount *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"principalPaidToDate"];
    principalPaidToDate = v5->_principalPaidToDate;
    v5->_principalPaidToDate = (PKCurrencyAmount *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payoffAmount"];
    payoffAmount = v5->_payoffAmount;
    v5->_payoffAmount = (PKCurrencyAmount *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startInstallmentDate"];
    startInstallmentDate = v5->_startInstallmentDate;
    v5->_startInstallmentDate = (NSDate *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextInstallmentDueDate"];
    nextInstallmentDueDate = v5->_nextInstallmentDueDate;
    v5->_nextInstallmentDueDate = (NSDate *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endInstallmentDate"];
    endInstallmentDate = v5->_endInstallmentDate;
    v5->_endInstallmentDate = (NSDate *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancellationDate"];
    cancellationDate = v5->_cancellationDate;
    v5->_cancellationDate = (NSDate *)v40;

    v5->_cancellationReason = [v4 decodeIntegerForKey:@"cancellationReason"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"panSuffix"];
    panSuffix = v5->_panSuffix;
    v5->_panSuffix = (NSString *)v42;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  apr = self->_apr;
  id v5 = a3;
  [v5 encodeObject:apr forKey:@"apr"];
  [v5 encodeBool:self->_hasAPR forKey:@"hasAPR"];
  [v5 encodeInteger:self->_daysPastDue forKey:@"daysPastDue"];
  [v5 encodeObject:self->_pastDueAmount forKey:@"pastDueAmount"];
  [v5 encodeInteger:self->_installmentCount forKey:@"installmentCount"];
  [v5 encodeObject:self->_totalAmount forKey:@"totalAmount"];
  [v5 encodeObject:self->_initialAmount forKey:@"initialAmount"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_installmentAmount forKey:@"installmentAmount"];
  [v5 encodeObject:self->_totalAdjustments forKey:@"totalAdjustments"];
  [v5 encodeObject:self->_totalPrincipal forKey:@"totalPrincipal"];
  [v5 encodeObject:self->_paymentAmountToDate forKey:@"paymentAmountToDate"];
  [v5 encodeObject:self->_totalInterest forKey:@"totalInterest"];
  [v5 encodeObject:self->_interestPaidToDate forKey:@"interestPaidToDate"];
  [v5 encodeObject:self->_principalPaidToDate forKey:@"principalPaidToDate"];
  [v5 encodeObject:self->_payoffAmount forKey:@"payoffAmount"];
  [v5 encodeObject:self->_transactionDate forKey:@"transactionDate"];
  [v5 encodeObject:self->_startInstallmentDate forKey:@"startInstallmentDate"];
  [v5 encodeObject:self->_nextInstallmentDueDate forKey:@"nextInstallmentDueDate"];
  [v5 encodeObject:self->_endInstallmentDate forKey:@"endInstallmentDate"];
  [v5 encodeObject:self->_cancellationDate forKey:@"cancellationDate"];
  [v5 encodeInteger:self->_cancellationReason forKey:@"cancellationReason"];
  [v5 encodeObject:self->_panSuffix forKey:@"panSuffix"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFinancingPlanSummary allocWithZone:](PKPayLaterFinancingPlanSummary, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_apr copyWithZone:a3];
  apr = v5->_apr;
  v5->_apr = (NSDecimalNumber *)v6;

  v5->_hasAPR = self->_hasAPR;
  v5->_installmentCount = self->_installmentCount;
  v5->_daysPastDue = self->_daysPastDue;
  v5->_cancellationReason = self->_cancellationReason;
  uint64_t v8 = [(PKCurrencyAmount *)self->_pastDueAmount copyWithZone:a3];
  pastDueAmount = v5->_pastDueAmount;
  v5->_pastDueAmount = v8;

  uint64_t v10 = [(PKCurrencyAmount *)self->_totalAmount copyWithZone:a3];
  totalAmount = v5->_totalAmount;
  v5->_totalAmount = v10;

  uint64_t v12 = [(PKCurrencyAmount *)self->_initialAmount copyWithZone:a3];
  initialAmount = v5->_initialAmount;
  v5->_initialAmount = v12;

  uint64_t v14 = [(PKCurrencyAmount *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v14;

  uint64_t v16 = [(PKCurrencyAmount *)self->_installmentAmount copyWithZone:a3];
  installmentAmount = v5->_installmentAmount;
  v5->_installmentAmount = v16;

  uint64_t v18 = [(PKCurrencyAmount *)self->_totalAdjustments copyWithZone:a3];
  totalAdjustments = v5->_totalAdjustments;
  v5->_totalAdjustments = v18;

  uint64_t v20 = [(PKCurrencyAmount *)self->_totalPrincipal copyWithZone:a3];
  totalPrincipal = v5->_totalPrincipal;
  v5->_totalPrincipal = v20;

  uint64_t v22 = [(PKCurrencyAmount *)self->_paymentAmountToDate copyWithZone:a3];
  paymentAmountToDate = v5->_paymentAmountToDate;
  v5->_paymentAmountToDate = v22;

  uint64_t v24 = [(PKCurrencyAmount *)self->_totalInterest copyWithZone:a3];
  totalInterest = v5->_totalInterest;
  v5->_totalInterest = v24;

  uint64_t v26 = [(PKCurrencyAmount *)self->_interestPaidToDate copyWithZone:a3];
  interestPaidToDate = v5->_interestPaidToDate;
  v5->_interestPaidToDate = v26;

  uint64_t v28 = [(PKCurrencyAmount *)self->_principalPaidToDate copyWithZone:a3];
  principalPaidToDate = v5->_principalPaidToDate;
  v5->_principalPaidToDate = v28;

  uint64_t v30 = [(PKCurrencyAmount *)self->_payoffAmount copyWithZone:a3];
  payoffAmount = v5->_payoffAmount;
  v5->_payoffAmount = v30;

  uint64_t v32 = [(NSDate *)self->_transactionDate copyWithZone:a3];
  transactionDate = v5->_transactionDate;
  v5->_transactionDate = (NSDate *)v32;

  uint64_t v34 = [(NSDate *)self->_startInstallmentDate copyWithZone:a3];
  startInstallmentDate = v5->_startInstallmentDate;
  v5->_startInstallmentDate = (NSDate *)v34;

  uint64_t v36 = [(NSDate *)self->_nextInstallmentDueDate copyWithZone:a3];
  nextInstallmentDueDate = v5->_nextInstallmentDueDate;
  v5->_nextInstallmentDueDate = (NSDate *)v36;

  uint64_t v38 = [(NSDate *)self->_endInstallmentDate copyWithZone:a3];
  endInstallmentDate = v5->_endInstallmentDate;
  v5->_endInstallmentDate = (NSDate *)v38;

  uint64_t v40 = [(NSDate *)self->_cancellationDate copyWithZone:a3];
  cancellationDate = v5->_cancellationDate;
  v5->_cancellationDate = (NSDate *)v40;

  uint64_t v42 = [(NSString *)self->_panSuffix copyWithZone:a3];
  panSuffix = v5->_panSuffix;
  v5->_panSuffix = (NSString *)v42;

  return v5;
}

- (BOOL)isNextInstallmentPastDue
{
  nextInstallmentDueDate = self->_nextInstallmentDueDate;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(nextInstallmentDueDate) = [(NSDate *)nextInstallmentDueDate compare:v3] == NSOrderedAscending;

  return (char)nextInstallmentDueDate;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
}

- (BOOL)hasAPR
{
  return self->_hasAPR;
}

- (void)setHasAPR:(BOOL)a3
{
  self->_hasAPR = a3;
}

- (int64_t)daysPastDue
{
  return self->_daysPastDue;
}

- (void)setDaysPastDue:(int64_t)a3
{
  self->_daysPastDue = a3;
}

- (PKCurrencyAmount)pastDueAmount
{
  return self->_pastDueAmount;
}

- (void)setPastDueAmount:(id)a3
{
}

- (unint64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(unint64_t)a3
{
  self->_installmentCount = a3;
}

- (PKCurrencyAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
}

- (PKCurrencyAmount)initialAmount
{
  return self->_initialAmount;
}

- (void)setInitialAmount:(id)a3
{
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (PKCurrencyAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (void)setInstallmentAmount:(id)a3
{
}

- (PKCurrencyAmount)totalAdjustments
{
  return self->_totalAdjustments;
}

- (void)setTotalAdjustments:(id)a3
{
}

- (PKCurrencyAmount)totalPrincipal
{
  return self->_totalPrincipal;
}

- (void)setTotalPrincipal:(id)a3
{
}

- (PKCurrencyAmount)paymentAmountToDate
{
  return self->_paymentAmountToDate;
}

- (void)setPaymentAmountToDate:(id)a3
{
}

- (PKCurrencyAmount)totalInterest
{
  return self->_totalInterest;
}

- (void)setTotalInterest:(id)a3
{
}

- (PKCurrencyAmount)principalPaidToDate
{
  return self->_principalPaidToDate;
}

- (void)setPrincipalPaidToDate:(id)a3
{
}

- (PKCurrencyAmount)interestPaidToDate
{
  return self->_interestPaidToDate;
}

- (void)setInterestPaidToDate:(id)a3
{
}

- (PKCurrencyAmount)payoffAmount
{
  return self->_payoffAmount;
}

- (void)setPayoffAmount:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSDate)startInstallmentDate
{
  return self->_startInstallmentDate;
}

- (void)setStartInstallmentDate:(id)a3
{
}

- (NSDate)nextInstallmentDueDate
{
  return self->_nextInstallmentDueDate;
}

- (void)setNextInstallmentDueDate:(id)a3
{
}

- (NSDate)endInstallmentDate
{
  return self->_endInstallmentDate;
}

- (void)setEndInstallmentDate:(id)a3
{
}

- (NSDate)cancellationDate
{
  return self->_cancellationDate;
}

- (void)setCancellationDate:(id)a3
{
}

- (unint64_t)cancellationReason
{
  return self->_cancellationReason;
}

- (void)setCancellationReason:(unint64_t)a3
{
  self->_cancellationReason = a3;
}

- (NSString)panSuffix
{
  return self->_panSuffix;
}

- (void)setPanSuffix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panSuffix, 0);
  objc_storeStrong((id *)&self->_cancellationDate, 0);
  objc_storeStrong((id *)&self->_endInstallmentDate, 0);
  objc_storeStrong((id *)&self->_nextInstallmentDueDate, 0);
  objc_storeStrong((id *)&self->_startInstallmentDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_payoffAmount, 0);
  objc_storeStrong((id *)&self->_interestPaidToDate, 0);
  objc_storeStrong((id *)&self->_principalPaidToDate, 0);
  objc_storeStrong((id *)&self->_totalInterest, 0);
  objc_storeStrong((id *)&self->_paymentAmountToDate, 0);
  objc_storeStrong((id *)&self->_totalPrincipal, 0);
  objc_storeStrong((id *)&self->_totalAdjustments, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_initialAmount, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_pastDueAmount, 0);
  objc_storeStrong((id *)&self->_apr, 0);
}

@end