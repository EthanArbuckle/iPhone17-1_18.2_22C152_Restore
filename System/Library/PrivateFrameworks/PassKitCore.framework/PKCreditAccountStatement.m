@interface PKCreditAccountStatement
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSDate)closingDate;
- (NSDate)openingDate;
- (NSDate)paymentDueDate;
- (NSDecimalNumber)balanceTransfers;
- (NSDecimalNumber)credits;
- (NSDecimalNumber)feesCharged;
- (NSDecimalNumber)interestCharged;
- (NSDecimalNumber)minimumDue;
- (NSDecimalNumber)payments;
- (NSDecimalNumber)paymentsAndCredits;
- (NSDecimalNumber)purchases;
- (NSDecimalNumber)rewardsBalance;
- (NSDecimalNumber)rewardsEarned;
- (NSDecimalNumber)rewardsLifetime;
- (NSDecimalNumber)rewardsRedeemed;
- (NSDecimalNumber)rewardsYTD;
- (NSDecimalNumber)statementBalance;
- (NSDecimalNumber)totalBalance;
- (NSString)accountIdentifier;
- (NSString)currencyCode;
- (NSString)description;
- (NSString)identifier;
- (PKCreditAccountStatement)initWithCoder:(id)a3;
- (PKCreditAccountStatement)initWithDictionary:(id)a3;
- (PKCreditAccountStatement)initWithRecord:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)monthNumber;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBalanceTransfers:(id)a3;
- (void)setClosingDate:(id)a3;
- (void)setCredits:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setFeesCharged:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterestCharged:(id)a3;
- (void)setMinimumDue:(id)a3;
- (void)setOpeningDate:(id)a3;
- (void)setPaymentDueDate:(id)a3;
- (void)setPayments:(id)a3;
- (void)setPaymentsAndCredits:(id)a3;
- (void)setPurchases:(id)a3;
- (void)setRewardsBalance:(id)a3;
- (void)setRewardsEarned:(id)a3;
- (void)setRewardsLifetime:(id)a3;
- (void)setRewardsRedeemed:(id)a3;
- (void)setRewardsYTD:(id)a3;
- (void)setStatementBalance:(id)a3;
- (void)setTotalBalance:(id)a3;
@end

@implementation PKCreditAccountStatement

- (PKCreditAccountStatement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKCreditAccountStatement;
  v5 = [(PKCreditAccountStatement *)&v47 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

    uint64_t v12 = [v4 PKDateForKey:@"paymentDueDate"];
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"statementBalance"];
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKDecimalNumberFromStringForKey:@"totalBalance"];
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 PKDecimalNumberFromStringForKey:@"minimumDue"];
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 PKDecimalNumberFromStringForKey:@"purchases"];
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v22;

    uint64_t v24 = [v4 PKDecimalNumberFromStringForKey:@"feesCharged"];
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v24;

    uint64_t v26 = [v4 PKDecimalNumberFromStringForKey:@"interestCharged"];
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v26;

    uint64_t v28 = [v4 PKDecimalNumberFromStringForKey:@"balanceTransfers"];
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v28;

    uint64_t v30 = [v4 PKDecimalNumberFromStringForKey:@"paymentsAndCredits"];
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v30;

    uint64_t v32 = [v4 PKDecimalNumberFromStringForKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v32;

    uint64_t v34 = [v4 PKDecimalNumberFromStringForKey:@"credits"];
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v34;

    uint64_t v36 = [v4 PKDecimalNumberFromStringForKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v36;

    uint64_t v38 = [v4 PKDecimalNumberFromStringForKey:@"rewardsEarned"];
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v38;

    uint64_t v40 = [v4 PKDecimalNumberFromStringForKey:@"rewardsRedeemed"];
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v40;

    uint64_t v42 = [v4 PKDecimalNumberFromStringForKey:@"rewardsYTD"];
    rewardsYTD = v5->_rewardsYTD;
    v5->_rewardsYTD = (NSDecimalNumber *)v42;

    uint64_t v44 = [v4 PKDecimalNumberFromStringForKey:@"rewardsLifetime"];
    rewardsLifetime = v5->_rewardsLifetime;
    v5->_rewardsLifetime = (NSDecimalNumber *)v44;
  }
  return v5;
}

- (unint64_t)monthNumber
{
  [(NSDate *)self->_closingDate timeIntervalSinceDate:self->_openingDate];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:self->_openingDate sinceDate:v3 * 0.5];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v7 = [v6 dateByAddingComponents:v5 toDate:v4 options:0];
  uint64_t v8 = [v6 components:8 fromDate:v7];
  unint64_t v9 = [v8 month];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountStatement)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PKCreditAccountStatement;
  id v5 = [(PKCreditAccountStatement *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDueDate"];
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementBalance"];
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBalance"];
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumDue"];
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchases"];
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feesCharged"];
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestCharged"];
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balanceTransfers"];
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentsAndCredits"];
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credits"];
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsEarned"];
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsRedeemed"];
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsYTD"];
    rewardsYTD = v5->_rewardsYTD;
    v5->_rewardsYTD = (NSDecimalNumber *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsLifetime"];
    rewardsLifetime = v5->_rewardsLifetime;
    v5->_rewardsLifetime = (NSDecimalNumber *)v46;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_openingDate forKey:@"openingDate"];
  [v5 encodeObject:self->_closingDate forKey:@"closingDate"];
  [v5 encodeObject:self->_paymentDueDate forKey:@"paymentDueDate"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_statementBalance forKey:@"statementBalance"];
  [v5 encodeObject:self->_totalBalance forKey:@"totalBalance"];
  [v5 encodeObject:self->_minimumDue forKey:@"minimumDue"];
  [v5 encodeObject:self->_purchases forKey:@"purchases"];
  [v5 encodeObject:self->_feesCharged forKey:@"feesCharged"];
  [v5 encodeObject:self->_interestCharged forKey:@"interestCharged"];
  [v5 encodeObject:self->_balanceTransfers forKey:@"balanceTransfers"];
  [v5 encodeObject:self->_paymentsAndCredits forKey:@"paymentsAndCredits"];
  [v5 encodeObject:self->_payments forKey:@"payments"];
  [v5 encodeObject:self->_credits forKey:@"credits"];
  [v5 encodeObject:self->_rewardsBalance forKey:@"rewardsBalance"];
  [v5 encodeObject:self->_rewardsEarned forKey:@"rewardsEarned"];
  [v5 encodeObject:self->_rewardsRedeemed forKey:@"rewardsRedeemed"];
  [v5 encodeObject:self->_rewardsYTD forKey:@"rewardsYTD"];
  [v5 encodeObject:self->_rewardsLifetime forKey:@"rewardsLifetime"];
}

- (PKCreditAccountStatement)initWithRecord:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKCreditAccountStatement;
  id v5 = [(PKCreditAccountStatement *)&v47 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"openingDate");
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"closingDate");
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

    uint64_t v12 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"paymentDueDate");
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v12;

    uint64_t v14 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"statementBalance");
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v16;

    uint64_t v18 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"totalBalance");
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v18;

    uint64_t v20 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"minimumDue");
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v20;

    uint64_t v22 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"rewardsBalance");
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v22;

    uint64_t v24 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"rewardsEarned");
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v24;

    uint64_t v26 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"rewardsRedeemed");
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v26;

    uint64_t v28 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"rewardsYTD");
    rewardsYTD = v5->_rewardsYTD;
    v5->_rewardsYTD = (NSDecimalNumber *)v28;

    uint64_t v30 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"rewardsLifetime");
    rewardsLifetime = v5->_rewardsLifetime;
    v5->_rewardsLifetime = (NSDecimalNumber *)v30;

    uint64_t v32 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"purchases");
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v32;

    uint64_t v34 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"feesCharged");
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v34;

    uint64_t v36 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"interestCharged");
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v36;

    uint64_t v38 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"balanceTransfers");
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v38;

    uint64_t v40 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"paymentsAndCredits");
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v40;

    uint64_t v42 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"payments");
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v42;

    uint64_t v44 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"credits");
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v44;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v19 = [a3 encryptedValues];
  [v19 setObject:self->_identifier forKey:@"identifier"];
  [v19 setObject:self->_openingDate forKey:@"openingDate"];
  [v19 setObject:self->_closingDate forKey:@"closingDate"];
  [v19 setObject:self->_paymentDueDate forKey:@"paymentDueDate"];
  [v19 setObject:self->_currencyCode forKey:@"currencyCode"];
  id v4 = [(NSDecimalNumber *)self->_statementBalance stringValue];
  [v19 setObject:v4 forKey:@"statementBalance"];

  id v5 = [(NSDecimalNumber *)self->_totalBalance stringValue];
  [v19 setObject:v5 forKey:@"totalBalance"];

  uint64_t v6 = [(NSDecimalNumber *)self->_minimumDue stringValue];
  [v19 setObject:v6 forKey:@"minimumDue"];

  v7 = [(NSDecimalNumber *)self->_rewardsBalance stringValue];
  [v19 setObject:v7 forKey:@"rewardsBalance"];

  uint64_t v8 = [(NSDecimalNumber *)self->_rewardsEarned stringValue];
  [v19 setObject:v8 forKey:@"rewardsEarned"];

  unint64_t v9 = [(NSDecimalNumber *)self->_rewardsRedeemed stringValue];
  [v19 setObject:v9 forKey:@"rewardsRedeemed"];

  uint64_t v10 = [(NSDecimalNumber *)self->_rewardsYTD stringValue];
  [v19 setObject:v10 forKey:@"rewardsYTD"];

  v11 = [(NSDecimalNumber *)self->_rewardsLifetime stringValue];
  [v19 setObject:v11 forKey:@"rewardsLifetime"];

  uint64_t v12 = [(NSDecimalNumber *)self->_purchases stringValue];
  [v19 setObject:v12 forKey:@"purchases"];

  v13 = [(NSDecimalNumber *)self->_feesCharged stringValue];
  [v19 setObject:v13 forKey:@"feesCharged"];

  uint64_t v14 = [(NSDecimalNumber *)self->_interestCharged stringValue];
  [v19 setObject:v14 forKey:@"interestCharged"];

  v15 = [(NSDecimalNumber *)self->_balanceTransfers stringValue];
  [v19 setObject:v15 forKey:@"balanceTransfers"];

  uint64_t v16 = [(NSDecimalNumber *)self->_paymentsAndCredits stringValue];
  [v19 setObject:v16 forKey:@"paymentsAndCredits"];

  v17 = [(NSDecimalNumber *)self->_payments stringValue];
  [v19 setObject:v17 forKey:@"payments"];

  uint64_t v18 = [(NSDecimalNumber *)self->_credits stringValue];
  [v19 setObject:v18 forKey:@"credits"];
}

+ (id)recordType
{
  return @"Statement";
}

+ (id)recordNamePrefix
{
  return @"statementAvailable-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_99;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_99;
  }
  openingDate = self->_openingDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (openingDate && v8)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (openingDate != v8)
  {
    goto LABEL_99;
  }
  closingDate = self->_closingDate;
  uint64_t v10 = (NSDate *)v4[4];
  if (closingDate && v10)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (closingDate != v10)
  {
    goto LABEL_99;
  }
  paymentDueDate = self->_paymentDueDate;
  uint64_t v12 = (NSDate *)v4[5];
  if (paymentDueDate && v12)
  {
    if ((-[NSDate isEqual:](paymentDueDate, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (paymentDueDate != v12)
  {
    goto LABEL_99;
  }
  currencyCode = self->_currencyCode;
  uint64_t v14 = (NSString *)v4[6];
  if (currencyCode && v14)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (currencyCode != v14)
  {
    goto LABEL_99;
  }
  statementBalance = self->_statementBalance;
  uint64_t v16 = (NSDecimalNumber *)v4[7];
  if (statementBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](statementBalance, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (statementBalance != v16)
  {
    goto LABEL_99;
  }
  totalBalance = self->_totalBalance;
  uint64_t v18 = (NSDecimalNumber *)v4[8];
  if (totalBalance && v18)
  {
    if ((-[NSDecimalNumber isEqual:](totalBalance, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (totalBalance != v18)
  {
    goto LABEL_99;
  }
  minimumDue = self->_minimumDue;
  uint64_t v20 = (NSDecimalNumber *)v4[9];
  if (minimumDue && v20)
  {
    if ((-[NSDecimalNumber isEqual:](minimumDue, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (minimumDue != v20)
  {
    goto LABEL_99;
  }
  purchases = self->_purchases;
  uint64_t v22 = (NSDecimalNumber *)v4[10];
  if (purchases && v22)
  {
    if ((-[NSDecimalNumber isEqual:](purchases, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (purchases != v22)
  {
    goto LABEL_99;
  }
  feesCharged = self->_feesCharged;
  uint64_t v24 = (NSDecimalNumber *)v4[11];
  if (feesCharged && v24)
  {
    if ((-[NSDecimalNumber isEqual:](feesCharged, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (feesCharged != v24)
  {
    goto LABEL_99;
  }
  interestCharged = self->_interestCharged;
  uint64_t v26 = (NSDecimalNumber *)v4[12];
  if (interestCharged && v26)
  {
    if ((-[NSDecimalNumber isEqual:](interestCharged, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (interestCharged != v26)
  {
    goto LABEL_99;
  }
  balanceTransfers = self->_balanceTransfers;
  uint64_t v28 = (NSDecimalNumber *)v4[13];
  if (balanceTransfers && v28)
  {
    if ((-[NSDecimalNumber isEqual:](balanceTransfers, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (balanceTransfers != v28)
  {
    goto LABEL_99;
  }
  paymentsAndCredits = self->_paymentsAndCredits;
  uint64_t v30 = (NSDecimalNumber *)v4[14];
  if (paymentsAndCredits && v30)
  {
    if ((-[NSDecimalNumber isEqual:](paymentsAndCredits, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (paymentsAndCredits != v30)
  {
    goto LABEL_99;
  }
  payments = self->_payments;
  uint64_t v32 = (NSDecimalNumber *)v4[15];
  if (payments && v32)
  {
    if ((-[NSDecimalNumber isEqual:](payments, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (payments != v32)
  {
    goto LABEL_99;
  }
  credits = self->_credits;
  uint64_t v34 = (NSDecimalNumber *)v4[16];
  if (credits && v34)
  {
    if ((-[NSDecimalNumber isEqual:](credits, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (credits != v34)
  {
    goto LABEL_99;
  }
  rewardsBalance = self->_rewardsBalance;
  uint64_t v36 = (NSDecimalNumber *)v4[17];
  if (rewardsBalance && v36)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsBalance, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (rewardsBalance != v36)
  {
    goto LABEL_99;
  }
  rewardsEarned = self->_rewardsEarned;
  uint64_t v38 = (NSDecimalNumber *)v4[18];
  if (rewardsEarned && v38)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsEarned, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (rewardsEarned != v38)
  {
    goto LABEL_99;
  }
  rewardsRedeemed = self->_rewardsRedeemed;
  uint64_t v40 = (NSDecimalNumber *)v4[19];
  if (rewardsRedeemed && v40)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsRedeemed, "isEqual:") & 1) == 0) {
      goto LABEL_99;
    }
  }
  else if (rewardsRedeemed != v40)
  {
    goto LABEL_99;
  }
  rewardsYTD = self->_rewardsYTD;
  uint64_t v42 = (NSDecimalNumber *)v4[20];
  if (!rewardsYTD || !v42)
  {
    if (rewardsYTD == v42) {
      goto LABEL_95;
    }
LABEL_99:
    char v45 = 0;
    goto LABEL_100;
  }
  if ((-[NSDecimalNumber isEqual:](rewardsYTD, "isEqual:") & 1) == 0) {
    goto LABEL_99;
  }
LABEL_95:
  rewardsLifetime = self->_rewardsLifetime;
  uint64_t v44 = (NSDecimalNumber *)v4[21];
  if (rewardsLifetime && v44) {
    char v45 = -[NSDecimalNumber isEqual:](rewardsLifetime, "isEqual:");
  }
  else {
    char v45 = rewardsLifetime == v44;
  }
LABEL_100:

  return v45;
}

- (unint64_t)hash
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_openingDate];
  [v3 safelyAddObject:self->_closingDate];
  [v3 safelyAddObject:self->_paymentDueDate];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_statementBalance];
  [v3 safelyAddObject:self->_totalBalance];
  [v3 safelyAddObject:self->_minimumDue];
  [v3 safelyAddObject:self->_purchases];
  [v3 safelyAddObject:self->_feesCharged];
  [v3 safelyAddObject:self->_interestCharged];
  [v3 safelyAddObject:self->_balanceTransfers];
  [v3 safelyAddObject:self->_paymentsAndCredits];
  [v3 safelyAddObject:self->_payments];
  [v3 safelyAddObject:self->_credits];
  [v3 safelyAddObject:self->_rewardsBalance];
  [v3 safelyAddObject:self->_rewardsEarned];
  [v3 safelyAddObject:self->_rewardsRedeemed];
  [v3 safelyAddObject:self->_rewardsYTD];
  [v3 safelyAddObject:self->_rewardsLifetime];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  double v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t v4 = [(NSDate *)self->_openingDate description];
  [v3 appendFormat:@"openingDate: '%@'; ", v4];

  id v5 = [(NSDate *)self->_closingDate description];
  [v3 appendFormat:@"closingDate: '%@'; ", v5];

  uint64_t v6 = [(NSDate *)self->_paymentDueDate description];
  [v3 appendFormat:@"paymentDueDate: '%@'; ", v6];

  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  v7 = [(NSDecimalNumber *)self->_statementBalance stringValue];
  [v3 appendFormat:@"statementBalance: '%@'; ", v7];

  uint64_t v8 = [(NSDecimalNumber *)self->_totalBalance stringValue];
  [v3 appendFormat:@"totalBalance: '%@'; ", v8];

  unint64_t v9 = [(NSDecimalNumber *)self->_minimumDue stringValue];
  [v3 appendFormat:@"minimumDue: '%@'; ", v9];

  uint64_t v10 = [(NSDecimalNumber *)self->_purchases stringValue];
  [v3 appendFormat:@"purchases: '%@'; ", v10];

  v11 = [(NSDecimalNumber *)self->_feesCharged stringValue];
  [v3 appendFormat:@"feesCharged: '%@'; ", v11];

  uint64_t v12 = [(NSDecimalNumber *)self->_interestCharged stringValue];
  [v3 appendFormat:@"interestCharged: '%@'; ", v12];

  v13 = [(NSDecimalNumber *)self->_balanceTransfers stringValue];
  [v3 appendFormat:@"balanceTransfers: '%@'; ", v13];

  uint64_t v14 = [(NSDecimalNumber *)self->_paymentsAndCredits stringValue];
  [v3 appendFormat:@"paymentsAndCredits: '%@'; ", v14];

  v15 = [(NSDecimalNumber *)self->_payments stringValue];
  [v3 appendFormat:@"payments: '%@'; ", v15];

  uint64_t v16 = [(NSDecimalNumber *)self->_credits stringValue];
  [v3 appendFormat:@"credits: '%@'; ", v16];

  v17 = [(NSDecimalNumber *)self->_rewardsBalance stringValue];
  [v3 appendFormat:@"rewardsBalance: '%@'; ", v17];

  uint64_t v18 = [(NSDecimalNumber *)self->_rewardsEarned stringValue];
  [v3 appendFormat:@"rewardsEarned: '%@'; ", v18];

  id v19 = [(NSDecimalNumber *)self->_rewardsRedeemed stringValue];
  [v3 appendFormat:@"rewardsRedeemed: '%@'; ", v19];

  uint64_t v20 = [(NSDecimalNumber *)self->_rewardsYTD stringValue];
  [v3 appendFormat:@"rewardsYTD: '%@'; ", v20];

  v21 = [(NSDecimalNumber *)self->_rewardsLifetime stringValue];
  [v3 appendFormat:@"rewardsLifetime: '%@'; ", v21];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCreditAccountStatement allocWithZone:](PKCreditAccountStatement, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSDate *)self->_openingDate copyWithZone:a3];
  openingDate = v5->_openingDate;
  v5->_openingDate = (NSDate *)v10;

  uint64_t v12 = [(NSDate *)self->_closingDate copyWithZone:a3];
  closingDate = v5->_closingDate;
  v5->_closingDate = (NSDate *)v12;

  uint64_t v14 = [(NSDate *)self->_paymentDueDate copyWithZone:a3];
  paymentDueDate = v5->_paymentDueDate;
  v5->_paymentDueDate = (NSDate *)v14;

  uint64_t v16 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_statementBalance copyWithZone:a3];
  statementBalance = v5->_statementBalance;
  v5->_statementBalance = (NSDecimalNumber *)v18;

  uint64_t v20 = [(NSDecimalNumber *)self->_totalBalance copyWithZone:a3];
  totalBalance = v5->_totalBalance;
  v5->_totalBalance = (NSDecimalNumber *)v20;

  uint64_t v22 = [(NSDecimalNumber *)self->_minimumDue copyWithZone:a3];
  minimumDue = v5->_minimumDue;
  v5->_minimumDue = (NSDecimalNumber *)v22;

  uint64_t v24 = [(NSDecimalNumber *)self->_purchases copyWithZone:a3];
  purchases = v5->_purchases;
  v5->_purchases = (NSDecimalNumber *)v24;

  uint64_t v26 = [(NSDecimalNumber *)self->_feesCharged copyWithZone:a3];
  feesCharged = v5->_feesCharged;
  v5->_feesCharged = (NSDecimalNumber *)v26;

  uint64_t v28 = [(NSDecimalNumber *)self->_interestCharged copyWithZone:a3];
  interestCharged = v5->_interestCharged;
  v5->_interestCharged = (NSDecimalNumber *)v28;

  uint64_t v30 = [(NSDecimalNumber *)self->_balanceTransfers copyWithZone:a3];
  balanceTransfers = v5->_balanceTransfers;
  v5->_balanceTransfers = (NSDecimalNumber *)v30;

  uint64_t v32 = [(NSDecimalNumber *)self->_paymentsAndCredits copyWithZone:a3];
  paymentsAndCredits = v5->_paymentsAndCredits;
  v5->_paymentsAndCredits = (NSDecimalNumber *)v32;

  uint64_t v34 = [(NSDecimalNumber *)self->_payments copyWithZone:a3];
  payments = v5->_payments;
  v5->_payments = (NSDecimalNumber *)v34;

  uint64_t v36 = [(NSDecimalNumber *)self->_credits copyWithZone:a3];
  credits = v5->_credits;
  v5->_credits = (NSDecimalNumber *)v36;

  uint64_t v38 = [(NSDecimalNumber *)self->_rewardsBalance copyWithZone:a3];
  rewardsBalance = v5->_rewardsBalance;
  v5->_rewardsBalance = (NSDecimalNumber *)v38;

  uint64_t v40 = [(NSDecimalNumber *)self->_rewardsEarned copyWithZone:a3];
  rewardsEarned = v5->_rewardsEarned;
  v5->_rewardsEarned = (NSDecimalNumber *)v40;

  uint64_t v42 = [(NSDecimalNumber *)self->_rewardsRedeemed copyWithZone:a3];
  rewardsRedeemed = v5->_rewardsRedeemed;
  v5->_rewardsRedeemed = (NSDecimalNumber *)v42;

  uint64_t v44 = [(NSDecimalNumber *)self->_rewardsYTD copyWithZone:a3];
  rewardsYTD = v5->_rewardsYTD;
  v5->_rewardsYTD = (NSDecimalNumber *)v44;

  uint64_t v46 = [(NSDecimalNumber *)self->_rewardsLifetime copyWithZone:a3];
  rewardsLifetime = v5->_rewardsLifetime;
  v5->_rewardsLifetime = (NSDecimalNumber *)v46;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
}

- (NSDate)paymentDueDate
{
  return self->_paymentDueDate;
}

- (void)setPaymentDueDate:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)statementBalance
{
  return self->_statementBalance;
}

- (void)setStatementBalance:(id)a3
{
}

- (NSDecimalNumber)totalBalance
{
  return self->_totalBalance;
}

- (void)setTotalBalance:(id)a3
{
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
}

- (NSDecimalNumber)purchases
{
  return self->_purchases;
}

- (void)setPurchases:(id)a3
{
}

- (NSDecimalNumber)feesCharged
{
  return self->_feesCharged;
}

- (void)setFeesCharged:(id)a3
{
}

- (NSDecimalNumber)interestCharged
{
  return self->_interestCharged;
}

- (void)setInterestCharged:(id)a3
{
}

- (NSDecimalNumber)balanceTransfers
{
  return self->_balanceTransfers;
}

- (void)setBalanceTransfers:(id)a3
{
}

- (NSDecimalNumber)paymentsAndCredits
{
  return self->_paymentsAndCredits;
}

- (void)setPaymentsAndCredits:(id)a3
{
}

- (NSDecimalNumber)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (NSDecimalNumber)credits
{
  return self->_credits;
}

- (void)setCredits:(id)a3
{
}

- (NSDecimalNumber)rewardsBalance
{
  return self->_rewardsBalance;
}

- (void)setRewardsBalance:(id)a3
{
}

- (NSDecimalNumber)rewardsEarned
{
  return self->_rewardsEarned;
}

- (void)setRewardsEarned:(id)a3
{
}

- (NSDecimalNumber)rewardsRedeemed
{
  return self->_rewardsRedeemed;
}

- (void)setRewardsRedeemed:(id)a3
{
}

- (NSDecimalNumber)rewardsYTD
{
  return self->_rewardsYTD;
}

- (void)setRewardsYTD:(id)a3
{
}

- (NSDecimalNumber)rewardsLifetime
{
  return self->_rewardsLifetime;
}

- (void)setRewardsLifetime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsLifetime, 0);
  objc_storeStrong((id *)&self->_rewardsYTD, 0);
  objc_storeStrong((id *)&self->_rewardsRedeemed, 0);
  objc_storeStrong((id *)&self->_rewardsEarned, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
  objc_storeStrong((id *)&self->_credits, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_paymentsAndCredits, 0);
  objc_storeStrong((id *)&self->_balanceTransfers, 0);
  objc_storeStrong((id *)&self->_interestCharged, 0);
  objc_storeStrong((id *)&self->_feesCharged, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_totalBalance, 0);
  objc_storeStrong((id *)&self->_statementBalance, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end