@interface PKAccountTransfer
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)cancellable;
- (BOOL)fundsAreAvailable;
- (BOOL)isCurrentlyCancellable;
- (BOOL)isEqual:(id)a3;
- (NSDate)cancellationExpiryDate;
- (NSDate)expectedCompletionDate;
- (NSDate)transferDate;
- (NSDate)transferStatusDate;
- (NSString)clientReferenceIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)referenceIdentifier;
- (PKAccountTransfer)initWithCoder:(id)a3;
- (PKAccountTransfer)initWithDictionary:(id)a3 productTimeZone:(id)a4;
- (PKAccountTransfer)initWithRecord:(id)a3;
- (PKAccountTransferExternalAccount)externalAccount;
- (PKAccountTransferScheduleDetails)scheduleDetails;
- (PKCurrencyAmount)currencyAmount;
- (PKCurrencyAmount)holdAmount;
- (int64_t)statusCode;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)setCancellationExpiryDate:(id)a3;
- (void)setClientReferenceIdentifier:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setExpectedCompletionDate:(id)a3;
- (void)setExternalAccount:(id)a3;
- (void)setHoldAmount:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setScheduleDetails:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setTransferDate:(id)a3;
- (void)setTransferStatusDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountTransfer

- (PKAccountTransfer)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)PKAccountTransfer;
  v8 = [(PKAccountTransfer *)&v47 init];
  if (!v8)
  {
LABEL_24:
    v36 = v8;
    goto LABEL_28;
  }
  if (v7)
  {
    v9 = [v6 PKStringForKey:@"transferIdentifier"];
    v44 = [v6 PKStringForKey:@"transferDate"];
    v43 = [v6 PKStringForKey:@"transferStatusDate"];
    v42 = [v6 PKStringForKey:@"state"];
    v45 = [v6 PKDecimalNumberFromStringForKey:@"amount"];
    v10 = [v6 PKStringForKey:@"currencyCode"];
    v41 = [v6 PKDictionaryForKey:@"externalAccount"];
    v11 = [v6 PKDictionaryForKey:@"scheduleDetails"];
    v12 = [v6 PKStringForKey:@"cancellationExpiryDate"];
    v39 = [v6 PKStringForKey:@"expectedCompletionDate"];
    v13 = [v6 PKStringForKey:@"type"];
    v14 = PKPaymentDateFormatterWithTimeZone(v7);
    if (v9) {
      objc_storeStrong((id *)&v8->_identifier, v9);
    }
    if (v45 && v10)
    {
      v15 = [[PKCurrencyAmount alloc] initWithAmount:v45 currency:v10 exponent:0];
      currencyAmount = v8->_currencyAmount;
      v8->_currencyAmount = v15;
    }
    if (v41)
    {
      v17 = [(PKAccountPaymentFundingSource *)[PKAccountTransferExternalAccount alloc] initWithDictionary:v41];
      externalAccount = v8->_externalAccount;
      v8->_externalAccount = v17;
    }
    if (v11)
    {
      v19 = [[PKAccountTransferScheduleDetails alloc] initWithDictionary:v11 productTimeZone:v7];
      scheduleDetails = v8->_scheduleDetails;
      v8->_scheduleDetails = v19;
    }
    if (v44)
    {
      uint64_t v21 = objc_msgSend(v14, "dateFromString:");
      transferDate = v8->_transferDate;
      v8->_transferDate = (NSDate *)v21;
    }
    if (v43)
    {
      uint64_t v23 = objc_msgSend(v14, "dateFromString:");
      transferStatusDate = v8->_transferStatusDate;
      v8->_transferStatusDate = (NSDate *)v23;
    }
    if (v12)
    {
      uint64_t v25 = [v14 dateFromString:v12];
      cancellationExpiryDate = v8->_cancellationExpiryDate;
      v8->_cancellationExpiryDate = (NSDate *)v25;
    }
    v40 = v9;
    if (v39)
    {
      uint64_t v27 = [v14 dateFromString:v39];
      expectedCompletionDate = v8->_expectedCompletionDate;
      v8->_expectedCompletionDate = (NSDate *)v27;
    }
    uint64_t v29 = [v6 PKStringForKey:@"transferReferenceIdentifier"];
    referenceIdentifier = v8->_referenceIdentifier;
    v8->_referenceIdentifier = (NSString *)v29;

    uint64_t v31 = [v6 PKStringForKey:@"clientReferenceIdentifier"];
    clientReferenceIdentifier = v8->_clientReferenceIdentifier;
    v8->_clientReferenceIdentifier = (NSString *)v31;

    v8->_statusCode = [v6 PKIntegerForKey:@"statusCode"];
    v8->_state = PKAccountTransferStateFromString(v42);
    v8->_cancellable = [v6 PKBoolForKey:@"cancellable"];
    v8->_type = PKAccountTransferTypeFromString(v13);
    v33 = [v6 PKDecimalNumberFromStringForKey:@"holdAmount"];
    if (v33 && v10)
    {
      v34 = [[PKCurrencyAmount alloc] initWithAmount:v45 currency:v10 exponent:0];
      v35 = v8->_currencyAmount;
      v8->_currencyAmount = v34;
    }
    goto LABEL_24;
  }
  v37 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Warning: Initializing transfer without a product time zone means the dates may be incorrect.", buf, 2u);
  }

  v36 = 0;
LABEL_28:

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransfer)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountTransfer;
  v5 = [(PKAccountTransfer *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferReferenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientReferenceIdentifier"];
    clientReferenceIdentifier = v5->_clientReferenceIdentifier;
    v5->_clientReferenceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"holdAmount"];
    holdAmount = v5->_holdAmount;
    v5->_holdAmount = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalAccount"];
    externalAccount = v5->_externalAccount;
    v5->_externalAccount = (PKAccountTransferExternalAccount *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleDetails"];
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountTransferScheduleDetails *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferDate"];
    transferDate = v5->_transferDate;
    v5->_transferDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferStatusDate"];
    transferStatusDate = v5->_transferStatusDate;
    v5->_transferStatusDate = (NSDate *)v22;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_statusCode = [v4 decodeIntegerForKey:@"statusCode"];
    v5->_cancellable = [v4 decodeBoolForKey:@"cancellable"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancellationExpiryDate"];
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedCompletionDate"];
    expectedCompletionDate = v5->_expectedCompletionDate;
    v5->_expectedCompletionDate = (NSDate *)v26;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"transferIdentifier"];
  [v5 encodeObject:self->_referenceIdentifier forKey:@"transferReferenceIdentifier"];
  [v5 encodeObject:self->_clientReferenceIdentifier forKey:@"clientReferenceIdentifier"];
  [v5 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_holdAmount forKey:@"holdAmount"];
  [v5 encodeObject:self->_externalAccount forKey:@"externalAccount"];
  [v5 encodeObject:self->_scheduleDetails forKey:@"scheduleDetails"];
  [v5 encodeObject:self->_transferDate forKey:@"transferDate"];
  [v5 encodeObject:self->_transferStatusDate forKey:@"transferStatusDate"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_statusCode forKey:@"statusCode"];
  [v5 encodeBool:self->_cancellable forKey:@"cancellable"];
  [v5 encodeObject:self->_cancellationExpiryDate forKey:@"cancellationExpiryDate"];
  [v5 encodeObject:self->_expectedCompletionDate forKey:@"expectedCompletionDate"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (PKAccountTransfer)initWithRecord:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKAccountTransfer;
  id v5 = [(PKAccountTransfer *)&v43 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"transferIdentifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"transferReferenceIdentifier");
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
    v19 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"holdAmount");
    if (v19 && v14)
    {
      uint64_t v20 = [PKCurrencyAmount alloc];
      uint64_t v21 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v12];
      uint64_t v22 = [(PKCurrencyAmount *)v20 initWithAmount:v21 currency:v14 exponent:0];
      holdAmount = v5->_holdAmount;
      v5->_holdAmount = (PKCurrencyAmount *)v22;
    }
    uint64_t v24 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"transferScheduledDate");
    transferDate = v5->_transferDate;
    v5->_transferDate = (NSDate *)v24;

    uint64_t v26 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"transferStatusDate");
    transferStatusDate = v5->_transferStatusDate;
    v5->_transferStatusDate = (NSDate *)v26;

    v28 = [PKAccountTransferExternalAccount alloc];
    objc_super v29 = objc_msgSend(v4, "pk_encryptedDictionaryForKey:", @"externalAccount");
    uint64_t v30 = [(PKAccountPaymentFundingSource *)v28 initWithDictionary:v29];
    externalAccount = v5->_externalAccount;
    v5->_externalAccount = (PKAccountTransferExternalAccount *)v30;

    v32 = [PKAccountTransferScheduleDetails alloc];
    v33 = objc_msgSend(v4, "pk_encryptedDictionaryForKey:", @"scheduleDetails");
    uint64_t v34 = [(PKAccountTransferScheduleDetails *)v32 initWithDictionary:v33];
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountTransferScheduleDetails *)v34;

    v36 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"state");
    v5->_state = PKAccountTransferStateFromString(v36);

    v5->_statusCode = objc_msgSend(v4, "pk_encryptedIntegerForKey:", @"statusCode");
    v5->_cancellable = objc_msgSend(v4, "pk_BOOLForKey:", @"cancellable");
    uint64_t v37 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"cancellationExpiryDate");
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v37;

    uint64_t v39 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"expectedCompletionDate");
    expectedCompletionDate = v5->_expectedCompletionDate;
    v5->_expectedCompletionDate = (NSDate *)v39;

    v41 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"type");
    v5->_type = PKAccountTransferTypeFromString(v41);
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4 = a3;
  id v17 = [v4 encryptedValues];
  id v5 = [v4 valuesByKey];

  if (PKApplePayContainerEnvironment() == 2)
  {
    [v17 setObject:self->_identifier forKey:@"transferIdentifier"];
    [v17 setObject:self->_referenceIdentifier forKey:@"transferReferenceIdentifier"];
    [v17 setObject:self->_clientReferenceIdentifier forKey:@"clientReferenceIdentifier"];
    uint64_t v6 = [(PKAccountPaymentFundingSource *)self->_externalAccount jsonString];
    [v17 setObject:v6 forKey:@"externalAccount"];

    id v7 = [(PKAccountTransferScheduleDetails *)self->_scheduleDetails jsonString];
    [v17 setObject:v7 forKey:@"scheduleDetails"];

    uint64_t v8 = [(PKCurrencyAmount *)self->_currencyAmount currency];
    [v17 setObject:v8 forKey:@"currencyCode"];

    v9 = [(PKCurrencyAmount *)self->_currencyAmount amount];
    uint64_t v10 = [v9 stringValue];
    [v17 setObject:v10 forKey:@"amount"];

    v11 = [(PKCurrencyAmount *)self->_holdAmount amount];
    uint64_t v12 = [v11 stringValue];
    [v17 setObject:v12 forKey:@"holdAmount"];

    [v17 setObject:self->_transferDate forKey:@"transferScheduledDate"];
    [v17 setObject:self->_transferStatusDate forKey:@"transferStatusDate"];
    uint64_t v13 = [NSNumber numberWithInteger:self->_statusCode];
    [v17 setObject:v13 forKey:@"statusCode"];

    uint64_t v14 = PKAccountTransferStateStringForState(self->_state);
    [v17 setObject:v14 forKey:@"state"];

    v15 = [NSNumber numberWithBool:self->_cancellable];
    [v5 setObject:v15 forKey:@"cancellable"];

    [v17 setObject:self->_cancellationExpiryDate forKey:@"cancellationExpiryDate"];
    [v17 setObject:self->_expectedCompletionDate forKey:@"expectedCompletionDate"];
    uint64_t v16 = PKAccountTransferTypeToString(self->_type);
    [v17 setObject:v16 forKey:@"type"];
  }
}

+ (id)recordType
{
  return @"Transfer";
}

+ (id)recordNamePrefix
{
  return @"transfer-";
}

- (BOOL)fundsAreAvailable
{
  unint64_t state = self->_state;
  v3 = [(PKCurrencyAmount *)self->_holdAmount amount];
  id v4 = v3;
  if (state == 6)
  {
    if (v3 && (objc_msgSend(v3, "pk_isNotANumber") & 1) == 0) {
      char v5 = objc_msgSend(v4, "pk_isZeroNumber");
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_60;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_60;
  }
  referenceIdentifier = self->_referenceIdentifier;
  uint64_t v8 = (NSString *)v4[3];
  if (referenceIdentifier && v8)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (referenceIdentifier != v8)
  {
    goto LABEL_60;
  }
  clientReferenceIdentifier = self->_clientReferenceIdentifier;
  uint64_t v10 = (NSString *)v4[4];
  if (clientReferenceIdentifier && v10)
  {
    if ((-[NSString isEqual:](clientReferenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (clientReferenceIdentifier != v10)
  {
    goto LABEL_60;
  }
  currencyAmount = self->_currencyAmount;
  uint64_t v12 = (PKCurrencyAmount *)v4[5];
  if (currencyAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_60;
    }
  }
  else if (currencyAmount != v12)
  {
    goto LABEL_60;
  }
  holdAmount = self->_holdAmount;
  uint64_t v14 = (PKCurrencyAmount *)v4[6];
  if (holdAmount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](holdAmount, "isEqual:")) {
      goto LABEL_60;
    }
  }
  else if (holdAmount != v14)
  {
    goto LABEL_60;
  }
  externalAccount = self->_externalAccount;
  uint64_t v16 = (PKAccountTransferExternalAccount *)v4[13];
  if (externalAccount && v16)
  {
    if (!-[PKAccountPaymentFundingSource isEqual:](externalAccount, "isEqual:")) {
      goto LABEL_60;
    }
  }
  else if (externalAccount != v16)
  {
    goto LABEL_60;
  }
  scheduleDetails = self->_scheduleDetails;
  uint64_t v18 = (PKAccountTransferScheduleDetails *)v4[14];
  if (scheduleDetails && v18)
  {
    if (!-[PKAccountTransferScheduleDetails isEqual:](scheduleDetails, "isEqual:")) {
      goto LABEL_60;
    }
  }
  else if (scheduleDetails != v18)
  {
    goto LABEL_60;
  }
  transferDate = self->_transferDate;
  uint64_t v20 = (NSDate *)v4[7];
  if (transferDate && v20)
  {
    if ((-[NSDate isEqual:](transferDate, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (transferDate != v20)
  {
    goto LABEL_60;
  }
  transferStatusDate = self->_transferStatusDate;
  uint64_t v22 = (NSDate *)v4[8];
  if (transferStatusDate && v22)
  {
    if ((-[NSDate isEqual:](transferStatusDate, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (transferStatusDate != v22)
  {
    goto LABEL_60;
  }
  if (self->_state != v4[11] || self->_statusCode != v4[12] || self->_cancellable != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_60;
  }
  cancellationExpiryDate = self->_cancellationExpiryDate;
  uint64_t v24 = (NSDate *)v4[9];
  if (cancellationExpiryDate && v24)
  {
    if ((-[NSDate isEqual:](cancellationExpiryDate, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (cancellationExpiryDate != v24)
  {
    goto LABEL_60;
  }
  expectedCompletionDate = self->_expectedCompletionDate;
  uint64_t v26 = (NSDate *)v4[10];
  if (!expectedCompletionDate || !v26)
  {
    if (expectedCompletionDate == v26) {
      goto LABEL_58;
    }
LABEL_60:
    BOOL v27 = 0;
    goto LABEL_61;
  }
  if ((-[NSDate isEqual:](expectedCompletionDate, "isEqual:") & 1) == 0) {
    goto LABEL_60;
  }
LABEL_58:
  BOOL v27 = self->_type == v4[15];
LABEL_61:

  return v27;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_referenceIdentifier];
  [v3 safelyAddObject:self->_clientReferenceIdentifier];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_holdAmount];
  [v3 safelyAddObject:self->_externalAccount];
  [v3 safelyAddObject:self->_scheduleDetails];
  [v3 safelyAddObject:self->_transferDate];
  [v3 safelyAddObject:self->_transferStatusDate];
  [v3 safelyAddObject:self->_cancellationExpiryDate];
  [v3 safelyAddObject:self->_expectedCompletionDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_state - v4 + 32 * v4;
  int64_t v6 = self->_statusCode - v5 + 32 * v5;
  uint64_t v7 = self->_cancellable - v6 + 32 * v6;
  unint64_t v8 = self->_type - v7 + 32 * v7;

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"referenceIdentifier: '%@'; ", self->_referenceIdentifier];
  [v3 appendFormat:@"clientReferenceIdentifier: '%@'; ", self->_clientReferenceIdentifier];
  [v3 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  [v3 appendFormat:@"holdAmount: '%@'; ", self->_holdAmount];
  [v3 appendFormat:@"externalAccount: %@", self->_externalAccount];
  [v3 appendFormat:@"scheduleDetails: %@", self->_scheduleDetails];
  uint64_t v4 = [(NSDate *)self->_transferDate description];
  [v3 appendFormat:@"transferDate: '%@'; ", v4];

  unint64_t v5 = [(NSDate *)self->_transferStatusDate description];
  [v3 appendFormat:@"transferStatusDate: '%@'; ", v5];

  int64_t v6 = PKAccountTransferStateStringForState(self->_state);
  [v3 appendFormat:@"state: '%@'; ", v6];

  objc_msgSend(v3, "appendFormat:", @"statusCode: '%ld'; ", self->_statusCode);
  objc_msgSend(v3, "appendFormat:", @"cancellable: '%d'; ", self->_cancellable);
  uint64_t v7 = [(NSDate *)self->_cancellationExpiryDate description];
  [v3 appendFormat:@"cancellationExpiryDate: '%@'; ", v7];

  unint64_t v8 = [(NSDate *)self->_expectedCompletionDate description];
  [v3 appendFormat:@"expectedCompletionDate: '%@'; ", v8];

  v9 = PKAccountTransferTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (BOOL)isCurrentlyCancellable
{
  if (!self->_cancellable) {
    return 0;
  }
  externalAccount = self->_externalAccount;
  if (!externalAccount
    || [(PKAccountPaymentFundingSource *)externalAccount type] != 1
    || self->_state - 1 > 1
    || !self->_cancellationExpiryDate)
  {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = [v4 compare:self->_cancellationExpiryDate] == -1;

  return v5;
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

- (PKCurrencyAmount)holdAmount
{
  return self->_holdAmount;
}

- (void)setHoldAmount:(id)a3
{
}

- (NSDate)transferDate
{
  return self->_transferDate;
}

- (void)setTransferDate:(id)a3
{
}

- (NSDate)transferStatusDate
{
  return self->_transferStatusDate;
}

- (void)setTransferStatusDate:(id)a3
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

- (NSDate)expectedCompletionDate
{
  return self->_expectedCompletionDate;
}

- (void)setExpectedCompletionDate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (PKAccountTransferExternalAccount)externalAccount
{
  return self->_externalAccount;
}

- (void)setExternalAccount:(id)a3
{
}

- (PKAccountTransferScheduleDetails)scheduleDetails
{
  return self->_scheduleDetails;
}

- (void)setScheduleDetails:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_externalAccount, 0);
  objc_storeStrong((id *)&self->_expectedCompletionDate, 0);
  objc_storeStrong((id *)&self->_cancellationExpiryDate, 0);
  objc_storeStrong((id *)&self->_transferStatusDate, 0);
  objc_storeStrong((id *)&self->_transferDate, 0);
  objc_storeStrong((id *)&self->_holdAmount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_clientReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end