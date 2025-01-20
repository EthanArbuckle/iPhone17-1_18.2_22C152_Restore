@interface PKPeerPaymentRecurringPayment
+ (BOOL)supportsSecureCoding;
+ (id)recordNameForRecurringPaymentIdentifier:(id)a3;
+ (id)recordNamePrefix;
+ (id)recurringPaymentIdentifierFromRecordName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastExecutedTransactionAppearsInHistory;
- (BOOL)sentByMe;
- (BOOL)usesAppleCashBalance;
- (NSArray)upcomingPaymentDates;
- (NSDate)createdDate;
- (NSDate)startDate;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)threshold;
- (NSString)currency;
- (NSString)identifier;
- (NSString)recipientAddress;
- (NSString)recipientAltDSID;
- (NSString)senderAddress;
- (PKCurrencyAmount)currencyAmount;
- (PKCurrencyAmount)currencyThreshold;
- (PKPeerPaymentRecurringPayment)initWithCloudStoreCoder:(id)a3;
- (PKPeerPaymentRecurringPayment)initWithCoder:(id)a3;
- (PKPeerPaymentRecurringPayment)initWithDictionary:(id)a3 productTimeZone:(id)a4;
- (PKPeerPaymentRecurringPaymentFundingSource)fundingSource;
- (PKPeerPaymentRecurringPaymentMemo)memo;
- (PKPeerPaymentRecurringPaymentTransaction)lastExecutedTransaction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (unint64_t)_actionsForStrings:(id)a3;
- (unint64_t)actions;
- (unint64_t)frequency;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)status;
- (unint64_t)type;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(unint64_t)a3;
- (void)setAmount:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setFrequency:(unint64_t)a3;
- (void)setFundingSource:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastExecutedTransaction:(id)a3;
- (void)setMemo:(id)a3;
- (void)setRecipientAddress:(id)a3;
- (void)setRecipientAltDSID:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSentByMe:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setThreshold:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUpcomingPaymentDates:(id)a3;
- (void)setUsesAppleCashBalance:(BOOL)a3;
@end

@implementation PKPeerPaymentRecurringPayment

- (PKPeerPaymentRecurringPayment)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)PKPeerPaymentRecurringPayment;
  v8 = [(PKPeerPaymentRecurringPayment *)&v56 init];
  if (v8)
  {
    uint64_t v9 = [v6 PKStringForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = [v6 PKStringForKey:@"type"];
    v8->_type = PKPeerPaymentRecurringPaymentTypeFromString(v11);

    uint64_t v12 = [v6 PKStringForKey:@"senderAddress"];
    senderAddress = v8->_senderAddress;
    v8->_senderAddress = (NSString *)v12;

    uint64_t v14 = [v6 PKStringForKey:@"recipientAddress"];
    recipientAddress = v8->_recipientAddress;
    v8->_recipientAddress = (NSString *)v14;

    uint64_t v16 = [v6 PKStringForKey:@"recipientAltDSID"];
    recipientAltDSID = v8->_recipientAltDSID;
    v8->_recipientAltDSID = (NSString *)v16;

    v8->_sentByMe = [v6 PKBoolForKey:@"sentByMe"];
    uint64_t v18 = [v6 PKDecimalNumberFromStringForKey:@"amount"];
    amount = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v18;

    uint64_t v20 = [v6 PKDecimalNumberFromStringForKey:@"threshold"];
    threshold = v8->_threshold;
    v8->_threshold = (NSDecimalNumber *)v20;

    uint64_t v22 = [v6 PKStringForKey:@"currency"];
    currency = v8->_currency;
    v8->_currency = (NSString *)v22;

    v24 = [v6 PKStringForKey:@"frequency"];
    v8->_frequency = PKPeerPaymentRecurringPaymentFrequencyFromString(v24);

    v25 = [v6 PKDictionaryForKey:@"fundingSource"];
    uint64_t v26 = +[PKPeerPaymentRecurringPaymentFundingSource fundingSourceWithDictionary:v25];
    fundingSource = v8->_fundingSource;
    v8->_fundingSource = (PKPeerPaymentRecurringPaymentFundingSource *)v26;

    v28 = [v6 PKStringForKey:@"status"];
    v8->_status = PKPeerPaymentRecurringPaymentStatusFromString(v28);

    v29 = [v6 PKArrayForKey:@"actions"];
    v8->_actions = [(PKPeerPaymentRecurringPayment *)v8 _actionsForStrings:v29];

    v8->_usesAppleCashBalance = [v6 PKBoolForKey:@"usesAppleCashBalance"];
    v30 = [v6 PKStringForKey:@"createdDate"];
    uint64_t v31 = PKISO8601DateFromDateStringContainingFractionalSeconds(v30);
    createdDate = v8->_createdDate;
    v8->_createdDate = (NSDate *)v31;

    if (!v7)
    {
      v33 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "nil productTimeZone, using default time zone.", buf, 2u);
      }

      id v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Los_Angeles"];
    }
    v34 = [v6 PKStringForKey:@"startDate"];
    uint64_t v35 = PKPaymentDateFromDateStringWithTimeZone(v34, v7);
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v35;

    v37 = [v6 PKArrayForKey:@"upcomingPaymentDates"];
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v39 = v37;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v52;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v52 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = PKPaymentDateFromDateStringWithTimeZone(*(void **)(*((void *)&v51 + 1) + 8 * v43), v7);
          objc_msgSend(v38, "safelyAddObject:", v44, (void)v51);

          ++v43;
        }
        while (v41 != v43);
        uint64_t v41 = [v39 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v41);
    }

    uint64_t v45 = [v38 copy];
    upcomingPaymentDates = v8->_upcomingPaymentDates;
    v8->_upcomingPaymentDates = (NSArray *)v45;

    v47 = [v6 PKDictionaryForKey:@"lastExecutedTransaction"];
    if (v47)
    {
      uint64_t v48 = +[PKPeerPaymentRecurringPaymentTransaction transactionWithDictionary:v47];
      lastExecutedTransaction = v8->_lastExecutedTransaction;
      v8->_lastExecutedTransaction = (PKPeerPaymentRecurringPaymentTransaction *)v48;
    }
  }

  return v8;
}

- (PKCurrencyAmount)currencyAmount
{
  if (!self->_amount) {
    goto LABEL_4;
  }
  v3 = [(NSString *)self->_currency length];
  if (!v3) {
    goto LABEL_6;
  }
  amount = self->_amount;
  v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(amount) = [(NSDecimalNumber *)amount isEqualToNumber:v5];

  if ((amount & 1) == 0) {
    v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_amount currency:self->_currency exponent:0];
  }
  else {
LABEL_4:
  }
    v3 = 0;
LABEL_6:
  return v3;
}

- (PKCurrencyAmount)currencyThreshold
{
  if (!self->_threshold) {
    goto LABEL_4;
  }
  v3 = [(NSString *)self->_currency length];
  if (!v3) {
    goto LABEL_6;
  }
  threshold = self->_threshold;
  v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(threshold) = [(NSDecimalNumber *)threshold isEqualToNumber:v5];

  if ((threshold & 1) == 0) {
    v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_threshold currency:self->_currency exponent:0];
  }
  else {
LABEL_4:
  }
    v3 = 0;
LABEL_6:
  return v3;
}

- (BOOL)lastExecutedTransactionAppearsInHistory
{
  int64_t v2 = [(PKPeerPaymentRecurringPaymentTransaction *)self->_lastExecutedTransaction errorCode];
  return (unint64_t)(v2 - 40346) < 3 || v2 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPayment)initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKPeerPaymentRecurringPayment;
  v5 = [(PKPeerPaymentRecurringPayment *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = PKPeerPaymentRecurringPaymentTypeFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderAddress"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientAddress"];
    recipientAddress = v5->_recipientAddress;
    v5->_recipientAddress = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientAltDSID"];
    recipientAltDSID = v5->_recipientAltDSID;
    v5->_recipientAltDSID = (NSString *)v13;

    v5->_sentByMe = [v4 decodeBoolForKey:@"sentByMe"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threshold"];
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSource"];
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKPeerPaymentRecurringPaymentFundingSource *)v21;

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frequency"];
    v5->_frequency = PKPeerPaymentRecurringPaymentFrequencyFromString(v23);

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v26;

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = PKPeerPaymentRecurringPaymentStatusFromString(v28);

    v5->_actions = [v4 decodeIntegerForKey:@"actions"];
    id v29 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v31 = (void *)[v29 initWithArray:v30];
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"upcomingPaymentDates"];
    upcomingPaymentDates = v5->_upcomingPaymentDates;
    v5->_upcomingPaymentDates = (NSArray *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memo"];
    memo = v5->_memo;
    v5->_memo = (PKPeerPaymentRecurringPaymentMemo *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastExecutedTransaction"];
    lastExecutedTransaction = v5->_lastExecutedTransaction;
    v5->_lastExecutedTransaction = (PKPeerPaymentRecurringPaymentTransaction *)v36;

    v5->_usesAppleCashBalance = [v4 decodeBoolForKey:@"usesAppleCashBalance"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v9 = a3;
  [v9 encodeObject:identifier forKey:@"identifier"];
  unint64_t v5 = self->_type - 1;
  if (v5 > 2) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56E4148[v5];
  }
  [v9 encodeObject:v6 forKey:@"type"];
  [v9 encodeObject:self->_senderAddress forKey:@"senderAddress"];
  [v9 encodeObject:self->_recipientAddress forKey:@"recipientAddress"];
  [v9 encodeObject:self->_recipientAltDSID forKey:@"recipientAltDSID"];
  [v9 encodeBool:self->_sentByMe forKey:@"sentByMe"];
  [v9 encodeObject:self->_amount forKey:@"amount"];
  [v9 encodeObject:self->_threshold forKey:@"threshold"];
  [v9 encodeObject:self->_currency forKey:@"currency"];
  [v9 encodeObject:self->_fundingSource forKey:@"fundingSource"];
  id v7 = PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  [v9 encodeObject:v7 forKey:@"frequency"];

  [v9 encodeObject:self->_createdDate forKey:@"createdDate"];
  [v9 encodeObject:self->_startDate forKey:@"startDate"];
  v8 = PKPeerPaymentRecurringPaymentStatusToString(self->_status);
  [v9 encodeObject:v8 forKey:@"status"];

  [v9 encodeInteger:self->_actions forKey:@"actions"];
  [v9 encodeObject:self->_upcomingPaymentDates forKey:@"upcomingPaymentDates"];
  [v9 encodeObject:self->_memo forKey:@"memo"];
  [v9 encodeObject:self->_lastExecutedTransaction forKey:@"lastExecutedTransaction"];
  [v9 encodeBool:self->_usesAppleCashBalance forKey:@"usesAppleCashBalance"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_senderAddress];
  [v3 safelyAddObject:self->_recipientAddress];
  [v3 safelyAddObject:self->_recipientAltDSID];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_threshold];
  [v3 safelyAddObject:self->_currency];
  [v3 safelyAddObject:self->_fundingSource];
  [v3 safelyAddObject:self->_createdDate];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_upcomingPaymentDates];
  [v3 safelyAddObject:self->_memo];
  [v3 safelyAddObject:self->_lastExecutedTransaction];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_sentByMe - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;
  unint64_t v7 = self->_frequency - v6 + 32 * v6;
  unint64_t v8 = self->_status - v7 + 32 * v7;
  unint64_t v9 = self->_actions - v8 + 32 * v8;
  unint64_t v10 = self->_usesAppleCashBalance - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_73;
  }
  identifier = self->_identifier;
  unint64_t v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_73;
  }
  senderAddress = self->_senderAddress;
  unint64_t v8 = (NSString *)v4[4];
  if (senderAddress && v8)
  {
    if ((-[NSString isEqual:](senderAddress, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (senderAddress != v8)
  {
    goto LABEL_73;
  }
  recipientAddress = self->_recipientAddress;
  unint64_t v10 = (NSString *)v4[5];
  if (recipientAddress && v10)
  {
    if ((-[NSString isEqual:](recipientAddress, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (recipientAddress != v10)
  {
    goto LABEL_73;
  }
  recipientAltDSID = self->_recipientAltDSID;
  uint64_t v12 = (NSString *)v4[6];
  if (recipientAltDSID && v12)
  {
    if ((-[NSString isEqual:](recipientAltDSID, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (recipientAltDSID != v12)
  {
    goto LABEL_73;
  }
  amount = self->_amount;
  uint64_t v14 = (NSDecimalNumber *)v4[7];
  if (amount && v14)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (amount != v14)
  {
    goto LABEL_73;
  }
  threshold = self->_threshold;
  uint64_t v16 = (NSDecimalNumber *)v4[8];
  if (threshold && v16)
  {
    if ((-[NSDecimalNumber isEqual:](threshold, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (threshold != v16)
  {
    goto LABEL_73;
  }
  currency = self->_currency;
  uint64_t v18 = (NSString *)v4[9];
  if (currency && v18)
  {
    if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (currency != v18)
  {
    goto LABEL_73;
  }
  fundingSource = self->_fundingSource;
  uint64_t v20 = (PKPeerPaymentRecurringPaymentFundingSource *)v4[10];
  if (fundingSource && v20)
  {
    if (!-[PKPeerPaymentRecurringPaymentFundingSource isEqual:](fundingSource, "isEqual:")) {
      goto LABEL_73;
    }
  }
  else if (fundingSource != v20)
  {
    goto LABEL_73;
  }
  createdDate = self->_createdDate;
  uint64_t v22 = (NSDate *)v4[12];
  if (createdDate && v22)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (createdDate != v22)
  {
    goto LABEL_73;
  }
  startDate = self->_startDate;
  uint64_t v24 = (NSDate *)v4[13];
  if (startDate && v24)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (startDate != v24)
  {
    goto LABEL_73;
  }
  upcomingPaymentDates = self->_upcomingPaymentDates;
  uint64_t v26 = (NSArray *)v4[16];
  if (upcomingPaymentDates && v26)
  {
    if ((-[NSArray isEqual:](upcomingPaymentDates, "isEqual:") & 1) == 0) {
      goto LABEL_73;
    }
  }
  else if (upcomingPaymentDates != v26)
  {
    goto LABEL_73;
  }
  memo = self->_memo;
  v28 = (PKPeerPaymentRecurringPaymentMemo *)v4[17];
  if (memo && v28)
  {
    if (!-[PKPeerPaymentRecurringPaymentMemo isEqual:](memo, "isEqual:")) {
      goto LABEL_73;
    }
  }
  else if (memo != v28)
  {
    goto LABEL_73;
  }
  lastExecutedTransaction = self->_lastExecutedTransaction;
  v30 = (PKPeerPaymentRecurringPaymentTransaction *)v4[18];
  if (!lastExecutedTransaction || !v30)
  {
    if (lastExecutedTransaction == v30) {
      goto LABEL_67;
    }
LABEL_73:
    BOOL v31 = 0;
    goto LABEL_74;
  }
  if (!-[PKPeerPaymentRecurringPaymentTransaction isEqual:](lastExecutedTransaction, "isEqual:")) {
    goto LABEL_73;
  }
LABEL_67:
  if (self->_sentByMe != *((unsigned __int8 *)v4 + 8)
    || self->_type != v4[3]
    || self->_frequency != v4[11]
    || self->_status != v4[14]
    || self->_actions != v4[15])
  {
    goto LABEL_73;
  }
  BOOL v31 = self->_usesAppleCashBalance == *((unsigned __int8 *)v4 + 9);
LABEL_74:

  return v31;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  if (self->_sentByMe) {
    uint64_t v4 = @"true";
  }
  else {
    uint64_t v4 = @"false";
  }
  [v3 appendFormat:@"sentByMe: '%@'; ", v4];
  unint64_t v5 = self->_type - 1;
  if (v5 > 2) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56E4148[v5];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  [v3 appendFormat:@"threshold: '%@'; ", self->_threshold];
  [v3 appendFormat:@"currency: '%@'; ", self->_currency];
  [v3 appendFormat:@"fundingSource: '%@'; ", self->_fundingSource];
  unint64_t v7 = PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  [v3 appendFormat:@"frequency: '%@'; ", v7];

  [v3 appendFormat:@"createdDate: '%@'; ", self->_createdDate];
  [v3 appendFormat:@"startDate: '%@'; ", self->_startDate];
  unint64_t v8 = PKPeerPaymentRecurringPaymentStatusToString(self->_status);
  [v3 appendFormat:@"status: '%@'; ", v8];

  objc_msgSend(v3, "appendFormat:", @"actions: '%ld'; ", self->_actions);
  [v3 appendFormat:@"upcomingPaymentDates: '%@'; ", self->_upcomingPaymentDates];
  [v3 appendFormat:@"memo: '%@'; ", self->_memo];
  [v3 appendFormat:@"lastExecutedTransaction: '%@'; ", self->_lastExecutedTransaction];
  if (self->_usesAppleCashBalance) {
    unint64_t v9 = @"true";
  }
  else {
    unint64_t v9 = @"false";
  }
  [v3 appendFormat:@"usesAppleCashBalance: '%@'; ", v9];
  [v3 appendFormat:@">"];
  return v3;
}

- (PKPeerPaymentRecurringPayment)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentRecurringPayment;
  unint64_t v5 = [(PKPeerPaymentRecurringPayment *)&v8 init];
  unint64_t v6 = v5;
  if (v5) {
    [(PKPeerPaymentRecurringPayment *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"RecurringPaymentMemo"];
  unint64_t v5 = [v4 firstObject];

  unint64_t v6 = objc_msgSend(v5, "pk_encryptedStringForKey:", @"text");
  unint64_t v7 = objc_msgSend(v5, "pk_encryptedStringForKey:", @"emoji");
  objc_super v8 = objc_msgSend(v5, "pk_encryptedStringForKey:", @"color");
  if (![(NSString *)self->_identifier length])
  {
    objc_msgSend(v5, "pk_encryptedStringForKey:", @"identifier");
    unint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v9;
  }
  memo = self->_memo;
  if (!memo)
  {
    uint64_t v12 = objc_alloc_init(PKPeerPaymentRecurringPaymentMemo);
    uint64_t v13 = self->_memo;
    self->_memo = v12;

    memo = self->_memo;
  }
  [(PKPeerPaymentRecurringPaymentMemo *)memo setText:v6];
  [(PKPeerPaymentRecurringPaymentMemo *)self->_memo setEmoji:v7];
  uint64_t v14 = 0;
  PKSemanticColorFromString(v8, &v14);
  [(PKPeerPaymentRecurringPaymentMemo *)self->_memo setColor:v14];
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  unint64_t v5 = objc_msgSend(a3, "recordsWithRecordType:", @"RecurringPaymentMemo", a4);
  id v10 = [v5 firstObject];

  unint64_t v6 = [v10 encryptedValues];
  [v6 setObject:self->_identifier forKey:@"identifier"];
  unint64_t v7 = [(PKPeerPaymentRecurringPaymentMemo *)self->_memo text];
  [v6 setObject:v7 forKey:@"text"];

  objc_super v8 = [(PKPeerPaymentRecurringPaymentMemo *)self->_memo emoji];
  [v6 setObject:v8 forKey:@"emoji"];

  unint64_t v9 = PKSemanticColorToString([(PKPeerPaymentRecurringPaymentMemo *)self->_memo color]);
  [v6 setObject:v9 forKey:@"color"];
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = @"RecurringPaymentMemo";
  v3 = objc_msgSend((id)objc_opt_class(), "recordNameForRecurringPaymentIdentifier:", self->_identifier, @"RecurringPaymentMemo");
  objc_super v8 = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v9[0] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v5;
}

- (unint64_t)itemType
{
  return 9;
}

- (id)primaryIdentifier
{
  return self->_identifier;
}

+ (id)recordNamePrefix
{
  return @"recurringPaymentMemo-";
}

+ (id)recordNameForRecurringPaymentIdentifier:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  unint64_t v7 = [a1 recordNamePrefix];
  objc_super v8 = (void *)[v6 initWithFormat:@"%@%@", v7, v5];

  return v8;
}

+ (id)recurringPaymentIdentifierFromRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 recordNamePrefix];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    unint64_t v7 = [a1 recordNamePrefix];
    objc_super v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPeerPaymentRecurringPayment allocWithZone:](PKPeerPaymentRecurringPayment, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_type = self->_type;
  uint64_t v8 = [(NSString *)self->_senderAddress copyWithZone:a3];
  senderAddress = v5->_senderAddress;
  v5->_senderAddress = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_recipientAddress copyWithZone:a3];
  recipientAddress = v5->_recipientAddress;
  v5->_recipientAddress = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_senderAddress copyWithZone:a3];
  recipientAltDSID = v5->_recipientAltDSID;
  v5->_recipientAltDSID = (NSString *)v12;

  v5->_sentByMe = self->_sentByMe;
  uint64_t v14 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = (NSDecimalNumber *)v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_threshold copyWithZone:a3];
  threshold = v5->_threshold;
  v5->_threshold = (NSDecimalNumber *)v16;

  uint64_t v18 = [(NSString *)self->_currency copyWithZone:a3];
  currency = v5->_currency;
  v5->_currency = (NSString *)v18;

  uint64_t v20 = [(PKPeerPaymentRecurringPaymentFundingSource *)self->_fundingSource copyWithZone:a3];
  fundingSource = v5->_fundingSource;
  v5->_fundingSource = v20;

  v5->_frequency = self->_frequency;
  uint64_t v22 = [(NSDate *)self->_createdDate copyWithZone:a3];
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v22;

  uint64_t v24 = [(NSDate *)self->_startDate copyWithZone:a3];
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v24;

  v5->_status = self->_status;
  v5->_actions = self->_actions;
  uint64_t v26 = [(NSArray *)self->_upcomingPaymentDates copyWithZone:a3];
  upcomingPaymentDates = v5->_upcomingPaymentDates;
  v5->_upcomingPaymentDates = (NSArray *)v26;

  v28 = [(PKPeerPaymentRecurringPaymentMemo *)self->_memo copyWithZone:a3];
  memo = v5->_memo;
  v5->_memo = v28;

  v30 = [(PKPeerPaymentRecurringPaymentTransaction *)self->_lastExecutedTransaction copyWithZone:a3];
  lastExecutedTransaction = v5->_lastExecutedTransaction;
  v5->_lastExecutedTransaction = v30;

  v5->_usesAppleCashBalance = self->_usesAppleCashBalance;
  return v5;
}

- (unint64_t)_actionsForStrings:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 containsObject:@"pause"];
  int v5 = [v3 containsObject:@"cancel"];

  if (v5) {
    return v4 | 2;
  }
  else {
    return v4;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
}

- (NSString)recipientAltDSID
{
  return self->_recipientAltDSID;
}

- (void)setRecipientAltDSID:(id)a3
{
}

- (BOOL)sentByMe
{
  return self->_sentByMe;
}

- (void)setSentByMe:(BOOL)a3
{
  self->_sentByMe = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (PKPeerPaymentRecurringPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
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

- (unint64_t)actions
{
  return self->_actions;
}

- (void)setActions:(unint64_t)a3
{
  self->_actions = a3;
}

- (NSArray)upcomingPaymentDates
{
  return self->_upcomingPaymentDates;
}

- (void)setUpcomingPaymentDates:(id)a3
{
}

- (PKPeerPaymentRecurringPaymentMemo)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (PKPeerPaymentRecurringPaymentTransaction)lastExecutedTransaction
{
  return self->_lastExecutedTransaction;
}

- (void)setLastExecutedTransaction:(id)a3
{
}

- (BOOL)usesAppleCashBalance
{
  return self->_usesAppleCashBalance;
}

- (void)setUsesAppleCashBalance:(BOOL)a3
{
  self->_usesAppleCashBalance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExecutedTransaction, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_upcomingPaymentDates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_recipientAltDSID, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end