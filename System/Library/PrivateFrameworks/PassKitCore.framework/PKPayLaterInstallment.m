@interface PKPayLaterInstallment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterInstallment:(id)a3;
- (BOOL)paymentIdentitiferContributedToInstallment:(id)a3;
- (NSArray)appliedPayments;
- (NSArray)payments;
- (NSDate)dueDate;
- (NSDate)payoffDate;
- (NSString)installmentIdentifier;
- (NSString)planIdentifier;
- (PKCurrencyAmount)currentBalance;
- (PKCurrencyAmount)totalAmount;
- (PKPayLaterInstallment)initWithCoder:(id)a3;
- (PKPayLaterInstallment)initWithDictionary:(id)a3;
- (id)amountPaid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)interval;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setAppliedPayments:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setDueDate:(id)a3;
- (void)setInstallmentIdentifier:(id)a3;
- (void)setInterval:(int64_t)a3;
- (void)setPayments:(id)a3;
- (void)setPayoffDate:(id)a3;
- (void)setPlanIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTotalAmount:(id)a3;
@end

@implementation PKPayLaterInstallment

- (PKPayLaterInstallment)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PKPayLaterInstallment;
  v5 = [(PKPayLaterInstallment *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"installmentIdentifier"];
    installmentIdentifier = v5->_installmentIdentifier;
    v5->_installmentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"planIdentifier"];
    planIdentifier = v5->_planIdentifier;
    v5->_planIdentifier = (NSString *)v8;

    v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"appliedPayments"];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 8 * v16);
          v18 = [PKPayLaterAppliedPayment alloc];
          v19 = -[PKPayLaterAppliedPayment initWithDictionary:](v18, "initWithDictionary:", v17, (void)v45);
          [v11 safelyAddObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [v11 copy];
    appliedPayments = v5->_appliedPayments;
    v5->_appliedPayments = (NSArray *)v20;

    v22 = [v4 PKStringForKey:@"status"];
    v23 = v22;
    if (v22 == @"open") {
      goto LABEL_12;
    }
    if (v22)
    {
      char v24 = [(__CFString *)v22 isEqualToString:@"open"];

      if (v24)
      {
LABEL_12:
        uint64_t v25 = 1;
LABEL_26:

        v5->_status = v25;
        uint64_t v38 = [v4 PKCurrencyAmountForKey:@"totalAmount"];
        totalAmount = v5->_totalAmount;
        v5->_totalAmount = (PKCurrencyAmount *)v38;

        uint64_t v40 = [v4 PKCurrencyAmountForKey:@"currentBalance"];
        currentBalance = v5->_currentBalance;
        v5->_currentBalance = (PKCurrencyAmount *)v40;

        uint64_t v42 = [v4 PKDateForKey:@"dueDate"];
        dueDate = v5->_dueDate;
        v5->_dueDate = (NSDate *)v42;

        v5->_interval = [v4 PKIntegerForKey:@"interval"];
        goto LABEL_27;
      }
      v26 = v23;
      if (v26 == @"paid"
        || (v27 = v26,
            char v28 = [(__CFString *)v26 isEqualToString:@"paid"],
            v27,
            (v28 & 1) != 0))
      {
        uint64_t v25 = 3;
        goto LABEL_26;
      }
      v29 = v27;
      if (v29 == @"paused"
        || (v30 = v29,
            char v31 = [(__CFString *)v29 isEqualToString:@"paused"],
            v30,
            (v31 & 1) != 0))
      {
        uint64_t v25 = 2;
        goto LABEL_26;
      }
      v32 = v30;
      if (v32 == @"overdue"
        || (v33 = v32,
            char v34 = [(__CFString *)v32 isEqualToString:@"overdue"],
            v33,
            (v34 & 1) != 0))
      {
        uint64_t v25 = 4;
        goto LABEL_26;
      }
      v35 = v33;
      if (v35 == @"cancelled"
        || (v36 = v35,
            int v37 = [(__CFString *)v35 isEqualToString:@"cancelled"],
            v36,
            v37))
      {
        uint64_t v25 = 5;
        goto LABEL_26;
      }
    }
    uint64_t v25 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return v5;
}

- (id)amountPaid
{
  v2 = [(PKCurrencyAmount *)self->_totalAmount currencyAmountBySubtractingCurrencyAmount:self->_currentBalance];
  v3 = v2;
  if (v2
    && ([v2 amount],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_msgSend(v4, "pk_isNegativeNumber"),
        v4,
        (v5 & 1) != 0))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (BOOL)paymentIdentitiferContributedToInstallment:(id)a3
{
  id v4 = a3;
  payments = self->_payments;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PKPayLaterInstallment_paymentIdentitiferContributedToInstallment___block_invoke;
  v8[3] = &unk_1E56E3100;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(payments) = [(NSArray *)payments pk_containsObjectPassingTest:v8];

  return (char)payments;
}

uint64_t __68__PKPayLaterInstallment_paymentIdentitiferContributedToInstallment___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 paymentIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterInstallment *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterInstallment *)self isEqualToPayLaterInstallment:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterInstallment:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_installmentIdentifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    id v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_18;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_19;
    }
  }
  appliedPayments = self->_appliedPayments;
  id v12 = (NSArray *)v5[3];
  if (appliedPayments && v12)
  {
    if ((-[NSArray isEqual:](appliedPayments, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (appliedPayments != v12)
  {
    goto LABEL_19;
  }
  uint64_t v13 = (void *)v5[2];
  v7 = self->_planIdentifier;
  uint64_t v14 = v13;
  if (v7 != v14)
  {
    id v9 = v14;
    if (v7 && v14)
    {
      BOOL v15 = [(NSString *)v7 isEqualToString:v14];

      if (!v15) {
        goto LABEL_19;
      }
      goto LABEL_22;
    }
LABEL_18:

    goto LABEL_19;
  }

LABEL_22:
  totalAmount = self->_totalAmount;
  v19 = (PKCurrencyAmount *)v5[5];
  if (totalAmount && v19)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAmount, "isEqual:")) {
      goto LABEL_19;
    }
  }
  else if (totalAmount != v19)
  {
    goto LABEL_19;
  }
  currentBalance = self->_currentBalance;
  v21 = (PKCurrencyAmount *)v5[6];
  if (currentBalance && v21)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:")) {
      goto LABEL_19;
    }
  }
  else if (currentBalance != v21)
  {
    goto LABEL_19;
  }
  dueDate = self->_dueDate;
  v23 = (NSDate *)v5[7];
  if (dueDate && v23)
  {
    if ((-[NSDate isEqual:](dueDate, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (dueDate != v23)
  {
    goto LABEL_19;
  }
  payoffDate = self->_payoffDate;
  uint64_t v25 = (NSDate *)v5[8];
  if (payoffDate && v25)
  {
    if ((-[NSDate isEqual:](payoffDate, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (payoffDate != v25)
  {
    goto LABEL_19;
  }
  payments = self->_payments;
  v27 = (NSArray *)v5[10];
  if (payments && v27)
  {
    if ((-[NSArray isEqual:](payments, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (payments != v27)
  {
    goto LABEL_19;
  }
  if (self->_status == v5[4])
  {
    BOOL v16 = self->_interval == v5[9];
    goto LABEL_20;
  }
LABEL_19:
  BOOL v16 = 0;
LABEL_20:

  return v16;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_installmentIdentifier];
  [v3 safelyAddObject:self->_planIdentifier];
  [v3 safelyAddObject:self->_appliedPayments];
  [v3 safelyAddObject:self->_totalAmount];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_dueDate];
  [v3 safelyAddObject:self->_payoffDate];
  [v3 safelyAddObject:self->_payments];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;
  unint64_t v6 = self->_interval - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"installmentIdentifier: '%@'; ", self->_installmentIdentifier];
  [v3 appendFormat:@"planIdentifier: '%@'; ", self->_planIdentifier];
  [v3 appendFormat:@"appliedPayments: '%@'; ", self->_appliedPayments];
  unint64_t v4 = self->_status - 1;
  if (v4 > 4) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56ED0F0[v4];
  }
  [v3 appendFormat:@"status: '%@'; ", v5];
  [v3 appendFormat:@"totalAmount: '%@'; ", self->_totalAmount];
  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  unint64_t v6 = [(NSDate *)self->_dueDate description];
  [v3 appendFormat:@"dueDate: '%@'; ", v6];

  v7 = [(NSDate *)self->_payoffDate description];
  [v3 appendFormat:@"payoffDate: '%@'; ", v7];

  [v3 appendFormat:@"payments: '%@'; ", self->_payments];
  objc_msgSend(v3, "appendFormat:", @"interval: %ld; ", self->_interval);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_installmentIdentifier forKeyedSubscript:@"installmentIdentifier"];
  [v3 setObject:self->_planIdentifier forKeyedSubscript:@"planIdentifier"];
  unint64_t v4 = [(NSArray *)self->_appliedPayments pk_arrayBySafelyApplyingBlock:&__block_literal_global_145];
  [v3 setObject:v4 forKeyedSubscript:@"appliedPayments"];

  unint64_t v5 = self->_status - 1;
  if (v5 > 4) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56ED0F0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"status"];
  v7 = [(PKCurrencyAmount *)self->_totalAmount dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"totalAmount"];

  uint64_t v8 = [(PKCurrencyAmount *)self->_currentBalance dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"currentBalance"];

  dueDate = self->_dueDate;
  if (dueDate)
  {
    BOOL v10 = PKISO8601DateStringFromDate(dueDate);
    [v3 setObject:v10 forKeyedSubscript:@"dueDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"dueDate"];
  }
  payoffDate = self->_payoffDate;
  if (payoffDate)
  {
    id v12 = PKISO8601DateStringFromDate(payoffDate);
    [v3 setObject:v12 forKeyedSubscript:@"payOffDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"payOffDate"];
  }
  uint64_t v13 = [NSNumber numberWithInteger:self->_interval];
  [v3 setObject:v13 forKeyedSubscript:@"interval"];

  uint64_t v14 = (void *)[v3 copy];
  return v14;
}

uint64_t __49__PKPayLaterInstallment_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterInstallment)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterInstallment;
  unint64_t v5 = [(PKPayLaterInstallment *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentIdentifier"];
    installmentIdentifier = v5->_installmentIdentifier;
    v5->_installmentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planIdentifier"];
    planIdentifier = v5->_planIdentifier;
    v5->_planIdentifier = (NSString *)v8;

    BOOL v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"appliedPayments"];
    appliedPayments = v5->_appliedPayments;
    v5->_appliedPayments = (NSArray *)v13;

    BOOL v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSArray *)v18;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payOffDate"];
    payoffDate = v5->_payoffDate;
    v5->_payoffDate = (NSDate *)v26;

    v5->_interval = [v4 decodeIntegerForKey:@"interval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  installmentIdentifier = self->_installmentIdentifier;
  id v5 = a3;
  [v5 encodeObject:installmentIdentifier forKey:@"installmentIdentifier"];
  [v5 encodeObject:self->_planIdentifier forKey:@"planIdentifier"];
  [v5 encodeObject:self->_appliedPayments forKey:@"appliedPayments"];
  [v5 encodeObject:self->_payments forKey:@"payments"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_totalAmount forKey:@"totalAmount"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_dueDate forKey:@"dueDate"];
  [v5 encodeObject:self->_payoffDate forKey:@"payOffDate"];
  [v5 encodeInteger:self->_interval forKey:@"interval"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterInstallment allocWithZone:](PKPayLaterInstallment, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_installmentIdentifier copyWithZone:a3];
  installmentIdentifier = v5->_installmentIdentifier;
  v5->_installmentIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSArray *)self->_payments copyWithZone:a3];
  payments = v5->_payments;
  v5->_payments = (NSArray *)v8;

  uint64_t v10 = [(NSString *)self->_planIdentifier copyWithZone:a3];
  planIdentifier = v5->_planIdentifier;
  v5->_planIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSArray *)self->_appliedPayments copyWithZone:a3];
  appliedPayments = v5->_appliedPayments;
  v5->_appliedPayments = (NSArray *)v12;

  uint64_t v14 = [(PKCurrencyAmount *)self->_totalAmount copyWithZone:a3];
  totalAmount = v5->_totalAmount;
  v5->_totalAmount = v14;

  uint64_t v16 = [(PKCurrencyAmount *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v16;

  uint64_t v18 = [(NSDate *)self->_dueDate copyWithZone:a3];
  dueDate = v5->_dueDate;
  v5->_dueDate = (NSDate *)v18;

  uint64_t v20 = [(NSDate *)self->_payoffDate copyWithZone:a3];
  payoffDate = v5->_payoffDate;
  v5->_payoffDate = (NSDate *)v20;

  v5->_status = self->_status;
  v5->_interval = self->_interval;
  return v5;
}

- (NSString)installmentIdentifier
{
  return self->_installmentIdentifier;
}

- (void)setInstallmentIdentifier:(id)a3
{
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
}

- (NSArray)appliedPayments
{
  return self->_appliedPayments;
}

- (void)setAppliedPayments:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (PKCurrencyAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSDate)payoffDate
{
  return self->_payoffDate;
}

- (void)setPayoffDate:(id)a3
{
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_payoffDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_appliedPayments, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentIdentifier, 0);
}

@end