@interface PKAccountPayment
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)cancellable;
- (BOOL)isBeforeNextCycleForAccount:(id)a3;
- (BOOL)isCurrentlyCancellable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnHoldForAccount:(id)a3;
- (BOOL)isRecurring;
- (BOOL)willSkipFirstPaymentForAccount:(id)a3;
- (NSDate)cancellationExpiryDate;
- (NSDate)expectedCreditReleaseDate;
- (NSDate)paymentDate;
- (NSDate)paymentStatusDate;
- (NSString)clientReferenceIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)referenceIdentifier;
- (PKAccountPayment)initWithCoder:(id)a3;
- (PKAccountPayment)initWithDictionary:(id)a3 productTimeZone:(id)a4;
- (PKAccountPayment)initWithRecord:(id)a3;
- (PKAccountPaymentFundingSource)fundingSource;
- (PKAccountPaymentScheduleDetails)scheduleDetails;
- (PKCurrencyAmount)currencyAmount;
- (int64_t)state;
- (int64_t)statusCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)setCancellationExpiryDate:(id)a3;
- (void)setClientReferenceIdentifier:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setExpectedCreditReleaseDate:(id)a3;
- (void)setFundingSource:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPaymentDate:(id)a3;
- (void)setPaymentStatusDate:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setScheduleDetails:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStatusCode:(int64_t)a3;
@end

@implementation PKAccountPayment

- (PKAccountPayment)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PKAccountPayment;
  v8 = [(PKAccountPayment *)&v45 init];
  if (v8)
  {
    if (!v7)
    {
      v9 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Initializing payment without a product time zone means the dates may be incorrect.", buf, 2u);
      }
    }
    v10 = [v6 PKStringForKey:@"paymentIdentifier"];
    v43 = [v6 PKStringForKey:@"paymentDate"];
    v11 = [v6 PKStringForKey:@"paymentStatusDate"];
    v41 = [v6 PKStringForKey:@"state"];
    v12 = [v6 PKStringForKey:@"amount"];
    v13 = [v6 PKStringForKey:@"currencyCode"];
    v14 = [v6 PKDictionaryForKey:@"fundingSource"];
    v15 = [v6 PKDictionaryForKey:@"scheduleDetails"];
    v40 = [v6 PKStringForKey:@"cancellationExpiryDate"];
    v16 = PKPaymentDateFormatterWithTimeZone(v7);
    id obj = v10;
    if (v10) {
      objc_storeStrong((id *)&v8->_identifier, v10);
    }
    if (v12 && v13)
    {
      v17 = [PKCurrencyAmount alloc];
      [MEMORY[0x1E4F28C28] decimalNumberWithString:v12];
      v39 = v12;
      v19 = v18 = v11;
      uint64_t v20 = [(PKCurrencyAmount *)v17 initWithAmount:v19 currency:v13 exponent:0];
      currencyAmount = v8->_currencyAmount;
      v8->_currencyAmount = (PKCurrencyAmount *)v20;

      v11 = v18;
      v12 = v39;
    }
    if (v14)
    {
      v22 = [[PKAccountPaymentFundingSource alloc] initWithDictionary:v14];
      fundingSource = v8->_fundingSource;
      v8->_fundingSource = v22;
    }
    if (v15)
    {
      v24 = [[PKAccountPaymentScheduleDetails alloc] initWithDictionary:v15 productTimeZone:v7];
      scheduleDetails = v8->_scheduleDetails;
      v8->_scheduleDetails = v24;
    }
    if (v43)
    {
      uint64_t v26 = [v16 dateFromString:v43];
      paymentDate = v8->_paymentDate;
      v8->_paymentDate = (NSDate *)v26;
    }
    if (v11)
    {
      uint64_t v28 = [v16 dateFromString:v11];
      paymentStatusDate = v8->_paymentStatusDate;
      v8->_paymentStatusDate = (NSDate *)v28;
    }
    if (v40)
    {
      uint64_t v30 = [v16 dateFromString:v40];
      cancellationExpiryDate = v8->_cancellationExpiryDate;
      v8->_cancellationExpiryDate = (NSDate *)v30;
    }
    uint64_t v32 = [v6 PKStringForKey:@"paymentReferenceIdentifier"];
    referenceIdentifier = v8->_referenceIdentifier;
    v8->_referenceIdentifier = (NSString *)v32;

    uint64_t v34 = [v6 PKStringForKey:@"clientReferenceIdentifier"];
    clientReferenceIdentifier = v8->_clientReferenceIdentifier;
    v8->_clientReferenceIdentifier = (NSString *)v34;

    v8->_statusCode = [v6 PKIntegerForKey:@"statusCode"];
    v8->_state = PKAccountPaymentStateFromString(v41);
    v8->_cancellable = [v6 PKBoolForKey:@"cancellable"];
    uint64_t v36 = [v6 PKDateForKey:@"expectedCreditReleaseDate"];
    expectedCreditReleaseDate = v8->_expectedCreditReleaseDate;
    v8->_expectedCreditReleaseDate = (NSDate *)v36;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPayment)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKAccountPayment;
  v5 = [(PKAccountPayment *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentReferenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientReferenceIdentifier"];
    clientReferenceIdentifier = v5->_clientReferenceIdentifier;
    v5->_clientReferenceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSource"];
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKAccountPaymentFundingSource *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleDetails"];
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountPaymentScheduleDetails *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDate"];
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentStatusDate"];
    paymentStatusDate = v5->_paymentStatusDate;
    v5->_paymentStatusDate = (NSDate *)v20;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_statusCode = [v4 decodeIntegerForKey:@"statusCode"];
    v5->_cancellable = [v4 decodeBoolForKey:@"cancellable"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancellationExpiryDate"];
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedCreditReleaseDate"];
    expectedCreditReleaseDate = v5->_expectedCreditReleaseDate;
    v5->_expectedCreditReleaseDate = (NSDate *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"paymentIdentifier"];
  [v5 encodeObject:self->_referenceIdentifier forKey:@"paymentReferenceIdentifier"];
  [v5 encodeObject:self->_clientReferenceIdentifier forKey:@"clientReferenceIdentifier"];
  [v5 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_fundingSource forKey:@"fundingSource"];
  [v5 encodeObject:self->_scheduleDetails forKey:@"scheduleDetails"];
  [v5 encodeObject:self->_paymentDate forKey:@"paymentDate"];
  [v5 encodeObject:self->_paymentStatusDate forKey:@"paymentStatusDate"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_statusCode forKey:@"statusCode"];
  [v5 encodeBool:self->_cancellable forKey:@"cancellable"];
  [v5 encodeObject:self->_cancellationExpiryDate forKey:@"cancellationExpiryDate"];
  [v5 encodeObject:self->_expectedCreditReleaseDate forKey:@"expectedCreditReleaseDate"];
}

- (PKAccountPayment)initWithRecord:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountPayment;
  id v5 = [(PKAccountPayment *)&v37 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"paymentIdentifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"paymentReferenceIdentifier");
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"clientReferenceIdentifier");
    clientReferenceIdentifier = v5->_clientReferenceIdentifier;
    v5->_clientReferenceIdentifier = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"amount");
    uint64_t v13 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
    uint64_t v14 = (void *)v13;
    if (v12 && v13)
    {
      v15 = [PKCurrencyAmount alloc];
      uint64_t v16 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v12];
      uint64_t v17 = [(PKCurrencyAmount *)v15 initWithAmount:v16 currency:v14 exponent:0];
      currencyAmount = v5->_currencyAmount;
      v5->_currencyAmount = (PKCurrencyAmount *)v17;
    }
    uint64_t v19 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"paymentScheduledDate");
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v19;

    uint64_t v21 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"paymentStatusDate");
    paymentStatusDate = v5->_paymentStatusDate;
    v5->_paymentStatusDate = (NSDate *)v21;

    v23 = [PKAccountPaymentFundingSource alloc];
    uint64_t v24 = objc_msgSend(v4, "pk_encryptedDictionaryForKey:", @"fundingSource");
    uint64_t v25 = [(PKAccountPaymentFundingSource *)v23 initWithDictionary:v24];
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKAccountPaymentFundingSource *)v25;

    objc_super v27 = [PKAccountPaymentScheduleDetails alloc];
    uint64_t v28 = objc_msgSend(v4, "pk_encryptedDictionaryForKey:", @"scheduleDetails");
    uint64_t v29 = [(PKAccountPaymentScheduleDetails *)v27 initWithDictionary:v28];
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountPaymentScheduleDetails *)v29;

    v31 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"state");
    v5->_state = PKAccountPaymentStateFromString(v31);

    v5->_statusCode = objc_msgSend(v4, "pk_encryptedIntegerForKey:", @"statusCode");
    v5->_cancellable = objc_msgSend(v4, "pk_BOOLForKey:", @"cancellable");
    uint64_t v32 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"cancellationExpiryDate");
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v32;

    uint64_t v34 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"expectedCreditReleaseDate");
    expectedCreditReleaseDate = v5->_expectedCreditReleaseDate;
    v5->_expectedCreditReleaseDate = (NSDate *)v34;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4 = a3;
  id v14 = [v4 encryptedValues];
  id v5 = [v4 valuesByKey];

  [v14 setObject:self->_identifier forKey:@"paymentIdentifier"];
  [v14 setObject:self->_referenceIdentifier forKey:@"paymentReferenceIdentifier"];
  [v14 setObject:self->_clientReferenceIdentifier forKey:@"clientReferenceIdentifier"];
  uint64_t v6 = [(PKAccountPaymentFundingSource *)self->_fundingSource jsonString];
  [v14 setObject:v6 forKey:@"fundingSource"];

  id v7 = [(PKAccountPaymentScheduleDetails *)self->_scheduleDetails jsonString];
  [v14 setObject:v7 forKey:@"scheduleDetails"];

  uint64_t v8 = [(PKCurrencyAmount *)self->_currencyAmount currency];
  [v14 setObject:v8 forKey:@"currencyCode"];

  v9 = [(PKCurrencyAmount *)self->_currencyAmount amount];
  uint64_t v10 = [v9 stringValue];
  [v14 setObject:v10 forKey:@"amount"];

  [v14 setObject:self->_paymentDate forKey:@"paymentScheduledDate"];
  [v14 setObject:self->_paymentStatusDate forKey:@"paymentStatusDate"];
  v11 = [NSNumber numberWithInteger:self->_statusCode];
  [v14 setObject:v11 forKey:@"statusCode"];

  uint64_t v12 = PKAccountPaymentStateStringForState(self->_state);
  [v14 setObject:v12 forKey:@"state"];

  uint64_t v13 = [NSNumber numberWithBool:self->_cancellable];
  [v5 setObject:v13 forKey:@"cancellable"];

  [v14 setObject:self->_cancellationExpiryDate forKey:@"cancellationExpiryDate"];
  [v14 setObject:self->_expectedCreditReleaseDate forKey:@"expectedCreditReleaseDate"];
}

+ (id)recordType
{
  return @"Payment";
}

+ (id)recordNamePrefix
{
  return @"payment-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_52;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_52;
  }
  referenceIdentifier = self->_referenceIdentifier;
  uint64_t v8 = (NSString *)v4[3];
  if (referenceIdentifier && v8)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (referenceIdentifier != v8)
  {
    goto LABEL_52;
  }
  clientReferenceIdentifier = self->_clientReferenceIdentifier;
  uint64_t v10 = (NSString *)v4[4];
  if (clientReferenceIdentifier && v10)
  {
    if ((-[NSString isEqual:](clientReferenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (clientReferenceIdentifier != v10)
  {
    goto LABEL_52;
  }
  currencyAmount = self->_currencyAmount;
  uint64_t v12 = (PKCurrencyAmount *)v4[5];
  if (currencyAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_52;
    }
  }
  else if (currencyAmount != v12)
  {
    goto LABEL_52;
  }
  fundingSource = self->_fundingSource;
  id v14 = (PKAccountPaymentFundingSource *)v4[12];
  if (fundingSource && v14)
  {
    if (!-[PKAccountPaymentFundingSource isEqual:](fundingSource, "isEqual:")) {
      goto LABEL_52;
    }
  }
  else if (fundingSource != v14)
  {
    goto LABEL_52;
  }
  scheduleDetails = self->_scheduleDetails;
  uint64_t v16 = (PKAccountPaymentScheduleDetails *)v4[13];
  if (scheduleDetails && v16)
  {
    if (!-[PKAccountPaymentScheduleDetails isEqual:](scheduleDetails, "isEqual:")) {
      goto LABEL_52;
    }
  }
  else if (scheduleDetails != v16)
  {
    goto LABEL_52;
  }
  paymentDate = self->_paymentDate;
  uint64_t v18 = (NSDate *)v4[6];
  if (paymentDate && v18)
  {
    if ((-[NSDate isEqual:](paymentDate, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (paymentDate != v18)
  {
    goto LABEL_52;
  }
  paymentStatusDate = self->_paymentStatusDate;
  uint64_t v20 = (NSDate *)v4[7];
  if (paymentStatusDate && v20)
  {
    if ((-[NSDate isEqual:](paymentStatusDate, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (paymentStatusDate != v20)
  {
    goto LABEL_52;
  }
  if (self->_state != v4[10] || self->_statusCode != v4[11] || self->_cancellable != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_52;
  }
  cancellationExpiryDate = self->_cancellationExpiryDate;
  uint64_t v22 = (NSDate *)v4[9];
  if (!cancellationExpiryDate || !v22)
  {
    if (cancellationExpiryDate == v22) {
      goto LABEL_48;
    }
LABEL_52:
    char v25 = 0;
    goto LABEL_53;
  }
  if ((-[NSDate isEqual:](cancellationExpiryDate, "isEqual:") & 1) == 0) {
    goto LABEL_52;
  }
LABEL_48:
  expectedCreditReleaseDate = self->_expectedCreditReleaseDate;
  uint64_t v24 = (NSDate *)v4[8];
  if (expectedCreditReleaseDate && v24) {
    char v25 = -[NSDate isEqual:](expectedCreditReleaseDate, "isEqual:");
  }
  else {
    char v25 = expectedCreditReleaseDate == v24;
  }
LABEL_53:

  return v25;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_referenceIdentifier];
  [v3 safelyAddObject:self->_clientReferenceIdentifier];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_fundingSource];
  [v3 safelyAddObject:self->_scheduleDetails];
  [v3 safelyAddObject:self->_paymentDate];
  [v3 safelyAddObject:self->_paymentStatusDate];
  [v3 safelyAddObject:self->_cancellationExpiryDate];
  [v3 safelyAddObject:self->_expectedCreditReleaseDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_state - v4 + 32 * v4;
  int64_t v6 = self->_statusCode - v5 + 32 * v5;
  unint64_t v7 = self->_cancellable - v6 + 32 * v6;

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"referenceIdentifier: '%@'; ", self->_referenceIdentifier];
  [v3 appendFormat:@"clientReferenceIdentifier: '%@'; ", self->_clientReferenceIdentifier];
  [v3 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  [v3 appendFormat:@"fundingSource: %@", self->_fundingSource];
  [v3 appendFormat:@"scheduleDetails: %@", self->_scheduleDetails];
  uint64_t v4 = [(NSDate *)self->_paymentDate description];
  [v3 appendFormat:@"paymentDate: '%@'; ", v4];

  int64_t v5 = [(NSDate *)self->_paymentStatusDate description];
  [v3 appendFormat:@"paymentStatusDate: '%@'; ", v5];

  int64_t v6 = PKAccountPaymentStateStringForState(self->_state);
  [v3 appendFormat:@"state: '%@'; ", v6];

  objc_msgSend(v3, "appendFormat:", @"statusCode: '%ld'; ", self->_statusCode);
  objc_msgSend(v3, "appendFormat:", @"cancellable: '%d'; ", self->_cancellable);
  unint64_t v7 = [(NSDate *)self->_cancellationExpiryDate description];
  [v3 appendFormat:@"cancellationExpiryDate: '%@'; ", v7];

  uint64_t v8 = [(NSDate *)self->_expectedCreditReleaseDate description];
  [v3 appendFormat:@"expectedCreditReleaseDate: '%@'; ", v8];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (BOOL)isRecurring
{
  v2 = [(PKAccountPayment *)self scheduleDetails];
  uint64_t v3 = [v2 frequency];

  return (unint64_t)(v3 - 3) < 5;
}

- (BOOL)isOnHoldForAccount:(id)a3
{
  id v4 = a3;
  if ([(PKAccountPayment *)self isRecurring])
  {
    int64_t v5 = [(PKAccountPayment *)self scheduleDetails];
    uint64_t v6 = [v5 preset];

    unint64_t v7 = [v4 creditDetails];
    uint64_t v8 = [v7 accountSummary];

    switch(v6)
    {
      case 1:
        uint64_t v9 = [v8 adjustedBalance];
        break;
      case 3:
        uint64_t v9 = [v8 remainingStatementBalance];
        break;
      case 2:
        uint64_t v9 = [v8 remainingMinimumPayment];
        break;
      default:
        goto LABEL_11;
    }
    v11 = (void *)v9;
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C28] zero];
      BOOL v10 = [v12 compare:v11] != -1;

LABEL_12:
      goto LABEL_13;
    }
LABEL_11:
    BOOL v10 = 0;
    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)isCurrentlyCancellable
{
  if (!self->_cancellable) {
    return 0;
  }
  fundingSource = self->_fundingSource;
  if (!fundingSource
    || [(PKAccountPaymentFundingSource *)fundingSource type] != 1
    || (unint64_t)(self->_state - 1) > 1
    || !self->_cancellationExpiryDate)
  {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = [v4 compare:self->_cancellationExpiryDate] == -1;

  return v5;
}

- (BOOL)isBeforeNextCycleForAccount:(id)a3
{
  id v4 = [a3 creditDetails];
  BOOL v5 = [v4 accountSummary];

  uint64_t v6 = [v5 balanceSummary];
  unint64_t v7 = [v6 closingDate];

  if (v7)
  {
    uint64_t v8 = [(PKAccountPayment *)self paymentDate];
    BOOL v9 = [v8 compare:v7] != 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)willSkipFirstPaymentForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKAccountPayment *)self scheduleDetails];
  uint64_t v6 = [v5 preset];

  if ([(PKAccountPayment *)self isRecurring])
  {
    BOOL v7 = 0;
    if ([(PKAccountPayment *)self isOnHoldForAccount:v4] && (v6 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      BOOL v7 = [(PKAccountPayment *)self isBeforeNextCycleForAccount:v4];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (NSString)clientReferenceIdentifier
{
  return self->_clientReferenceIdentifier;
}

- (void)setClientReferenceIdentifier:(id)a3
{
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
}

- (NSDate)paymentStatusDate
{
  return self->_paymentStatusDate;
}

- (void)setPaymentStatusDate:(id)a3
{
}

- (NSDate)expectedCreditReleaseDate
{
  return self->_expectedCreditReleaseDate;
}

- (void)setExpectedCreditReleaseDate:(id)a3
{
}

- (BOOL)cancellable
{
  return self->_cancellable;
}

- (void)setCancellable:(BOOL)a3
{
  self->_cancellable = a3;
}

- (NSDate)cancellationExpiryDate
{
  return self->_cancellationExpiryDate;
}

- (void)setCancellationExpiryDate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
}

- (PKAccountPaymentScheduleDetails)scheduleDetails
{
  return self->_scheduleDetails;
}

- (void)setScheduleDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_cancellationExpiryDate, 0);
  objc_storeStrong((id *)&self->_expectedCreditReleaseDate, 0);
  objc_storeStrong((id *)&self->_paymentStatusDate, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_clientReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end