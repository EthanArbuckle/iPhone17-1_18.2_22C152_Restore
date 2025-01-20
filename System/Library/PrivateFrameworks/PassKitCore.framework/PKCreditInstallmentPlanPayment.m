@interface PKCreditInstallmentPlanPayment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentPlanPayment:(id)a3;
- (BOOL)isPaid;
- (NSArray)lineItems;
- (NSDate)dueDate;
- (NSDate)statementDate;
- (NSDecimalNumber)amountDue;
- (NSDecimalNumber)amountPaid;
- (NSDecimalNumber)originalAmountDue;
- (NSString)currencyCode;
- (NSString)identifier;
- (NSString)localizedDisplay;
- (NSString)statementIdentifier;
- (PKCreditAccountStatement)statement;
- (PKCreditInstallmentPlanPayment)initWithCoder:(id)a3;
- (PKCreditInstallmentPlanPayment)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)paymentCount;
- (unint64_t)paymentNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountDue:(id)a3;
- (void)setAmountPaid:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDueDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLineItems:(id)a3;
- (void)setOriginalAmountDue:(id)a3;
- (void)setPaymentCount:(unint64_t)a3;
- (void)setPaymentNumber:(unint64_t)a3;
- (void)setStatement:(id)a3;
- (void)setStatementDate:(id)a3;
- (void)setStatementIdentifier:(id)a3;
@end

@implementation PKCreditInstallmentPlanPayment

- (PKCreditInstallmentPlanPayment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKCreditInstallmentPlanPayment;
  v5 = [(PKCreditInstallmentPlanPayment *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"statementIdentifier"];
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"originalAmountDue"];
    originalAmountDue = v5->_originalAmountDue;
    v5->_originalAmountDue = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"amountDue"];
    amountDue = v5->_amountDue;
    v5->_amountDue = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"amountPaid"];
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKDateForKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v18;

    uint64_t v20 = [v4 PKDateForKey:@"statementDate"];
    statementDate = v5->_statementDate;
    v5->_statementDate = (NSDate *)v20;

    v22 = [v4 PKArrayContaining:objc_opt_class() forKey:@"lineItems"];
    v23 = v22;
    if (v22)
    {
      uint64_t v24 = objc_msgSend(v22, "pk_arrayByApplyingBlock:", &__block_literal_global_62);
      lineItems = v5->_lineItems;
      v5->_lineItems = (NSArray *)v24;
    }
  }

  return v5;
}

PKCreditInstallmentPlanLineItem *__53__PKCreditInstallmentPlanPayment_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditInstallmentPlanLineItem alloc] initWithDictionary:v2];

  return v3;
}

- (BOOL)isPaid
{
  amountPaid = self->_amountPaid;
  if (amountPaid)
  {
    if (self->_amountDue)
    {
      v3 = [MEMORY[0x1E4F28C28] zero];
      LOBYTE(amountPaid) = [(NSDecimalNumber *)amountPaid compare:v3] == NSOrderedDescending;
    }
    else
    {
      LOBYTE(amountPaid) = 0;
    }
  }
  return (char)amountPaid;
}

- (NSString)localizedDisplay
{
  if (self->_paymentCount && self->_paymentNumber)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v4 = [NSNumber numberWithUnsignedInteger:self->_paymentNumber];
    v5 = [v3 stringFromNumber:v4];
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_paymentCount];
    v7 = [v3 stringFromNumber:v6];
    uint64_t v8 = PKLocalizedBeekmanString(&cfstr_InstallmentCou.isa, &stru_1EE105568.isa, v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCreditInstallmentPlanPayment *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditInstallmentPlanPayment *)self isEqualToInstallmentPlanPayment:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentPlanPayment:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_identifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_19;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_20;
    }
  }
  v11 = (void *)v5[2];
  v7 = self->_statementIdentifier;
  uint64_t v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_19;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = (void *)v5[3];
  v7 = self->_currencyCode;
  v15 = v14;
  if (v7 != v15)
  {
    v9 = v15;
    if (v7 && v15)
    {
      BOOL v16 = [(NSString *)v7 isEqualToString:v15];

      if (!v16) {
        goto LABEL_20;
      }
      goto LABEL_23;
    }
LABEL_19:

    goto LABEL_20;
  }

LABEL_23:
  originalAmountDue = self->_originalAmountDue;
  uint64_t v20 = (NSDecimalNumber *)v5[4];
  if (originalAmountDue && v20)
  {
    if ((-[NSDecimalNumber isEqual:](originalAmountDue, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (originalAmountDue != v20)
  {
    goto LABEL_20;
  }
  amountDue = self->_amountDue;
  v22 = (NSDecimalNumber *)v5[5];
  if (amountDue && v22)
  {
    if ((-[NSDecimalNumber isEqual:](amountDue, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (amountDue != v22)
  {
    goto LABEL_20;
  }
  amountPaid = self->_amountPaid;
  uint64_t v24 = (NSDecimalNumber *)v5[6];
  if (amountPaid && v24)
  {
    if ((-[NSDecimalNumber isEqual:](amountPaid, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (amountPaid != v24)
  {
    goto LABEL_20;
  }
  dueDate = self->_dueDate;
  v26 = (NSDate *)v5[7];
  if (dueDate && v26)
  {
    if ((-[NSDate isEqual:](dueDate, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (dueDate != v26)
  {
    goto LABEL_20;
  }
  statementDate = self->_statementDate;
  v28 = (NSDate *)v5[8];
  if (statementDate && v28)
  {
    if ((-[NSDate isEqual:](statementDate, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (statementDate != v28)
  {
    goto LABEL_20;
  }
  lineItems = self->_lineItems;
  v30 = (NSArray *)v5[9];
  if (lineItems && v30)
  {
    if ((-[NSArray isEqual:](lineItems, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (lineItems != v30)
  {
    goto LABEL_20;
  }
  statement = self->_statement;
  v32 = (PKCreditAccountStatement *)v5[12];
  if (statement && v32)
  {
    if (!-[PKCreditAccountStatement isEqual:](statement, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (statement != v32)
  {
    goto LABEL_20;
  }
  if (self->_paymentNumber == v5[10])
  {
    BOOL v17 = self->_paymentCount == v5[11];
    goto LABEL_21;
  }
LABEL_20:
  BOOL v17 = 0;
LABEL_21:

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_statementIdentifier];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_originalAmountDue];
  [v3 safelyAddObject:self->_amountDue];
  [v3 safelyAddObject:self->_amountPaid];
  [v3 safelyAddObject:self->_dueDate];
  [v3 safelyAddObject:self->_statementDate];
  [v3 safelyAddObject:self->_lineItems];
  [v3 safelyAddObject:self->_statement];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_paymentNumber - v4 + 32 * v4;
  unint64_t v6 = self->_paymentCount - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlanPayment)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKCreditInstallmentPlanPayment;
  unint64_t v5 = [(PKCreditInstallmentPlanPayment *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementIdentifier"];
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalAmountDue"];
    originalAmountDue = v5->_originalAmountDue;
    v5->_originalAmountDue = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountDue"];
    amountDue = v5->_amountDue;
    v5->_amountDue = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountPaid"];
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementDate"];
    statementDate = v5->_statementDate;
    v5->_statementDate = (NSDate *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"lineItems"];
    lineItems = v5->_lineItems;
    v5->_lineItems = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statement"];
    statement = v5->_statement;
    v5->_statement = (PKCreditAccountStatement *)v27;

    v5->_paymentNumber = [v4 decodeIntegerForKey:@"paymentNumber"];
    v5->_paymentCount = [v4 decodeIntegerForKey:@"paymentCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_statementIdentifier forKey:@"statementIdentifier"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_originalAmountDue forKey:@"originalAmountDue"];
  [v5 encodeObject:self->_amountDue forKey:@"amountDue"];
  [v5 encodeObject:self->_amountPaid forKey:@"amountPaid"];
  [v5 encodeObject:self->_dueDate forKey:@"dueDate"];
  [v5 encodeObject:self->_statementDate forKey:@"statementDate"];
  [v5 encodeObject:self->_lineItems forKey:@"lineItems"];
  [v5 encodeObject:self->_statement forKey:@"statement"];
  [v5 encodeInteger:self->_paymentNumber forKey:@"paymentNumber"];
  [v5 encodeInteger:self->_paymentCount forKey:@"paymentCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_statementIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_currencyCode copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_originalAmountDue copyWithZone:a3];
  BOOL v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_amountDue copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_amountPaid copyWithZone:a3];
  BOOL v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSDate *)self->_dueDate copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  uint64_t v20 = [(NSDate *)self->_statementDate copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  id v22 = [(PKCreditAccountStatement *)self->_statement copyWithZone:a3];
  uint64_t v23 = (void *)v5[12];
  v5[12] = v22;

  v5[10] = self->_paymentNumber;
  v5[11] = self->_paymentCount;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v25 = self->_lineItems;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_super v30 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v29), "copyWithZone:", a3, (void)v34);
        [v24 addObject:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v27);
  }

  if ([v24 count])
  {
    uint64_t v31 = [v24 copy];
    v32 = (void *)v5[9];
    v5[9] = v31;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)originalAmountDue
{
  return self->_originalAmountDue;
}

- (void)setOriginalAmountDue:(id)a3
{
}

- (NSDecimalNumber)amountDue
{
  return self->_amountDue;
}

- (void)setAmountDue:(id)a3
{
}

- (NSDecimalNumber)amountPaid
{
  return self->_amountPaid;
}

- (void)setAmountPaid:(id)a3
{
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSDate)statementDate
{
  return self->_statementDate;
}

- (void)setStatementDate:(id)a3
{
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (void)setLineItems:(id)a3
{
}

- (unint64_t)paymentNumber
{
  return self->_paymentNumber;
}

- (void)setPaymentNumber:(unint64_t)a3
{
  self->_paymentNumber = a3;
}

- (unint64_t)paymentCount
{
  return self->_paymentCount;
}

- (void)setPaymentCount:(unint64_t)a3
{
  self->_paymentCount = a3;
}

- (PKCreditAccountStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_statementDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_amountPaid, 0);
  objc_storeStrong((id *)&self->_amountDue, 0);
  objc_storeStrong((id *)&self->_originalAmountDue, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end