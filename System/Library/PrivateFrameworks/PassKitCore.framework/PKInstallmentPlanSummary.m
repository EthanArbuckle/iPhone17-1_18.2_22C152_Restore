@interface PKInstallmentPlanSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentPlanSummary:(id)a3;
- (NSDate)currentEndDate;
- (NSDate)minimumDueDate;
- (NSDate)originalEndDate;
- (NSDate)startDate;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)interestCharged;
- (NSDecimalNumber)minimumDue;
- (NSDecimalNumber)paymentsToDateAmount;
- (NSString)currencyCode;
- (PKInstallmentPlanSummary)initWithCoder:(id)a3;
- (PKInstallmentPlanSummary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setCurrentEndDate:(id)a3;
- (void)setInterestCharged:(id)a3;
- (void)setMinimumDue:(id)a3;
- (void)setMinimumDueDate:(id)a3;
- (void)setOriginalEndDate:(id)a3;
- (void)setPaymentsToDateAmount:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PKInstallmentPlanSummary

- (PKInstallmentPlanSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKInstallmentPlanSummary;
  v5 = [(PKInstallmentPlanSummary *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"originalEndDate"];
    originalEndDate = v5->_originalEndDate;
    v5->_originalEndDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"currentEndDate"];
    currentEndDate = v5->_currentEndDate;
    v5->_currentEndDate = (NSDate *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"minimumDue"];
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKDateForKey:@"minimumDueDate"];
    minimumDueDate = v5->_minimumDueDate;
    v5->_minimumDueDate = (NSDate *)v18;

    uint64_t v20 = [v4 PKDecimalNumberFromStringForKey:@"interestCharged"];
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 PKDecimalNumberFromStringForKey:@"paymentsToDateAmount"];
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v22;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKInstallmentPlanSummary *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKInstallmentPlanSummary *)self isEqualToInstallmentPlanSummary:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentPlanSummary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_47;
  }
  startDate = self->_startDate;
  BOOL v6 = (NSDate *)v4[1];
  if (startDate) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (startDate != v6) {
      goto LABEL_47;
    }
  }
  else if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_47;
  }
  originalEndDate = self->_originalEndDate;
  v9 = (NSDate *)v4[2];
  if (originalEndDate && v9)
  {
    if ((-[NSDate isEqual:](originalEndDate, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (originalEndDate != v9)
  {
    goto LABEL_47;
  }
  currentEndDate = self->_currentEndDate;
  v11 = (NSDate *)v4[3];
  if (currentEndDate && v11)
  {
    if ((-[NSDate isEqual:](currentEndDate, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (currentEndDate != v11)
  {
    goto LABEL_47;
  }
  currentBalance = self->_currentBalance;
  v13 = (NSDecimalNumber *)v4[4];
  if (currentBalance && v13)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (currentBalance != v13)
  {
    goto LABEL_47;
  }
  currencyCode = self->_currencyCode;
  v15 = (NSString *)v4[5];
  if (currencyCode && v15)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (currencyCode != v15)
  {
    goto LABEL_47;
  }
  minimumDue = self->_minimumDue;
  v17 = (NSDecimalNumber *)v4[6];
  if (minimumDue && v17)
  {
    if ((-[NSDecimalNumber isEqual:](minimumDue, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (minimumDue != v17)
  {
    goto LABEL_47;
  }
  minimumDueDate = self->_minimumDueDate;
  v19 = (NSDate *)v4[7];
  if (minimumDueDate && v19)
  {
    if ((-[NSDate isEqual:](minimumDueDate, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (minimumDueDate != v19)
  {
    goto LABEL_47;
  }
  interestCharged = self->_interestCharged;
  v21 = (NSDecimalNumber *)v4[8];
  if (!interestCharged || !v21)
  {
    if (interestCharged == v21) {
      goto LABEL_43;
    }
LABEL_47:
    char v24 = 0;
    goto LABEL_48;
  }
  if ((-[NSDecimalNumber isEqual:](interestCharged, "isEqual:") & 1) == 0) {
    goto LABEL_47;
  }
LABEL_43:
  paymentsToDateAmount = self->_paymentsToDateAmount;
  v23 = (NSDecimalNumber *)v4[9];
  if (paymentsToDateAmount && v23) {
    char v24 = -[NSDecimalNumber isEqual:](paymentsToDateAmount, "isEqual:");
  }
  else {
    char v24 = paymentsToDateAmount == v23;
  }
LABEL_48:

  return v24;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_originalEndDate];
  [v3 safelyAddObject:self->_currentEndDate];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_minimumDue];
  [v3 safelyAddObject:self->_minimumDueDate];
  [v3 safelyAddObject:self->_interestCharged];
  [v3 safelyAddObject:self->_paymentsToDateAmount];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKInstallmentPlanSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKInstallmentPlanSummary;
  v5 = [(PKInstallmentPlanSummary *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalEndDate"];
    originalEndDate = v5->_originalEndDate;
    v5->_originalEndDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentEndDate"];
    currentEndDate = v5->_currentEndDate;
    v5->_currentEndDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumDue"];
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumDueDate"];
    minimumDueDate = v5->_minimumDueDate;
    v5->_minimumDueDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestCharged"];
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentsToDateAmount"];
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_originalEndDate forKey:@"originalEndDate"];
  [v5 encodeObject:self->_currentEndDate forKey:@"currentEndDate"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_minimumDue forKey:@"minimumDue"];
  [v5 encodeObject:self->_minimumDueDate forKey:@"minimumDueDate"];
  [v5 encodeObject:self->_interestCharged forKey:@"interestCharged"];
  [v5 encodeObject:self->_paymentsToDateAmount forKey:@"paymentsToDateAmount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
  BOOL v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDate *)self->_originalEndDate copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDate *)self->_currentEndDate copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_currentBalance copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_currencyCode copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_minimumDue copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSDate *)self->_minimumDueDate copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  uint64_t v20 = [(NSDecimalNumber *)self->_interestCharged copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  uint64_t v22 = [(NSDecimalNumber *)self->_paymentsToDateAmount copyWithZone:a3];
  v23 = (void *)v5[9];
  v5[9] = v22;

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)originalEndDate
{
  return self->_originalEndDate;
}

- (void)setOriginalEndDate:(id)a3
{
}

- (NSDate)currentEndDate
{
  return self->_currentEndDate;
}

- (void)setCurrentEndDate:(id)a3
{
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
}

- (NSDate)minimumDueDate
{
  return self->_minimumDueDate;
}

- (void)setMinimumDueDate:(id)a3
{
}

- (NSDecimalNumber)interestCharged
{
  return self->_interestCharged;
}

- (void)setInterestCharged:(id)a3
{
}

- (NSDecimalNumber)paymentsToDateAmount
{
  return self->_paymentsToDateAmount;
}

- (void)setPaymentsToDateAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentsToDateAmount, 0);
  objc_storeStrong((id *)&self->_interestCharged, 0);
  objc_storeStrong((id *)&self->_minimumDueDate, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_currentEndDate, 0);
  objc_storeStrong((id *)&self->_originalEndDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end