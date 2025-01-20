@interface PKPeerPaymentQuote
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExpired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewRecurringPayment;
- (BOOL)isRecurringPayment;
- (BOOL)preservesCurrentBalance;
- (NSArray)items;
- (NSData)appleHash;
- (NSData)externalHash;
- (NSDate)nextPaymentDate;
- (NSDate)startDate;
- (NSDate)validUntil;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)threshold;
- (NSDecimalNumber)totalFees;
- (NSDecimalNumber)totalReceiveAmount;
- (NSString)accountNumber;
- (NSString)bankName;
- (NSString)currentBalanceCurrency;
- (NSString)disclosureText;
- (NSString)identifier;
- (NSString)recurringPaymentIdentifier;
- (NSString)routingNumber;
- (NSString)totalFeesCurrency;
- (NSString)totalReceiveAmountCurrency;
- (NSString)transactionIdentifier;
- (NSURL)disclosureURL;
- (PKCurrencyAmount)calculatedTotalAmount;
- (PKPeerPaymentQuote)initWithCoder:(id)a3;
- (PKPeerPaymentQuote)initWithDictionary:(id)a3;
- (PKPeerPaymentQuote)initWithDictionary:(id)a3 productTimeZone:(id)a4;
- (PKPeerPaymentQuoteDynamicFraudContent)dynamicFraudContent;
- (PKPeerPaymentRecipient)recipient;
- (double)validityDuration;
- (id)description;
- (id)firstQuoteItemOfType:(unint64_t)a3;
- (unint64_t)destinationType;
- (unint64_t)frequency;
- (unint64_t)hash;
- (unint64_t)riskLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setBankName:(id)a3;
- (void)setDestinationType:(unint64_t)a3;
- (void)setFrequency:(unint64_t)a3;
- (void)setIsNewRecurringPayment:(BOOL)a3;
- (void)setNextPaymentDate:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setRecurringPaymentIdentifier:(id)a3;
- (void)setRoutingNumber:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setThreshold:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation PKPeerPaymentQuote

- (PKPeerPaymentQuote)initWithDictionary:(id)a3
{
  return [(PKPeerPaymentQuote *)self initWithDictionary:a3 productTimeZone:0];
}

- (PKPeerPaymentQuote)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v81.receiver = self;
  v81.super_class = (Class)PKPeerPaymentQuote;
  v8 = [(PKPeerPaymentQuote *)&v81 init];
  if (v8)
  {
    v9 = [v6 PKStringForKey:@"quoteIdentifier"];
    uint64_t v10 = [v9 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    v12 = [v6 PKArrayForKey:@"quoteItems"];
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v78;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v78 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = +[PKPeerPaymentQuoteItem quoteItemWithDictionary:*(void *)(*((void *)&v77 + 1) + 8 * v18)];
          [v13 safelyAddObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v77 objects:v82 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [v13 copy];
    items = v8->_items;
    v8->_items = (NSArray *)v20;

    v22 = [v6 PKStringForKey:@"disclosureText"];
    uint64_t v23 = [v22 copy];
    disclosureText = v8->_disclosureText;
    v8->_disclosureText = (NSString *)v23;

    v25 = [v6 PKURLForKey:@"disclosureURL"];
    uint64_t v26 = [v25 copy];
    disclosureURL = v8->_disclosureURL;
    v8->_disclosureURL = (NSURL *)v26;

    uint64_t v28 = [v6 PKDecimalNumberFromStringForKey:@"currentBalance"];
    currentBalance = v8->_currentBalance;
    v8->_currentBalance = (NSDecimalNumber *)v28;

    v30 = [v6 PKStringForKey:@"currentBalanceCurrency"];
    uint64_t v31 = [v30 copy];
    currentBalanceCurrency = v8->_currentBalanceCurrency;
    v8->_currentBalanceCurrency = (NSString *)v31;

    uint64_t v33 = [v6 PKDecimalNumberFromStringForKey:@"totalFees"];
    totalFees = v8->_totalFees;
    v8->_totalFees = (NSDecimalNumber *)v33;

    v35 = [v6 PKStringForKey:@"totalFeesCurrency"];
    uint64_t v36 = [v35 copy];
    totalFeesCurrency = v8->_totalFeesCurrency;
    v8->_totalFeesCurrency = (NSString *)v36;

    uint64_t v38 = [v6 PKDecimalNumberFromStringForKey:@"totalReceiveAmount"];
    totalReceiveAmount = v8->_totalReceiveAmount;
    v8->_totalReceiveAmount = (NSDecimalNumber *)v38;

    v40 = [v6 PKStringForKey:@"totalReceiveAmountCurrency"];
    uint64_t v41 = [v40 copy];
    totalReceiveAmountCurrency = v8->_totalReceiveAmountCurrency;
    v8->_totalReceiveAmountCurrency = (NSString *)v41;

    v43 = [v6 PKStringForKey:@"appleHash"];
    uint64_t v44 = objc_msgSend(v43, "pk_decodeHexadecimal");
    appleHash = v8->_appleHash;
    v8->_appleHash = (NSData *)v44;

    v46 = [v6 PKStringForKey:@"externalHash"];
    uint64_t v47 = objc_msgSend(v46, "pk_decodeHexadecimal");
    externalHash = v8->_externalHash;
    v8->_externalHash = (NSData *)v47;

    uint64_t v49 = [v6 PKDateForKey:@"validUntil"];
    validUntil = v8->_validUntil;
    v8->_validUntil = (NSDate *)v49;

    v51 = [v6 PKStringForKey:@"riskLevel"];
    v8->_riskLevel = PKPeerPaymentQuoteRiskLevelFromString(v51);

    v52 = [v6 PKDictionaryForKey:@"dynamicFraudContent"];
    uint64_t v53 = +[PKPeerPaymentQuoteDynamicFraudContent dynamicFraudContentWithDictionary:v52];
    dynamicFraudContent = v8->_dynamicFraudContent;
    v8->_dynamicFraudContent = (PKPeerPaymentQuoteDynamicFraudContent *)v53;

    v55 = [v6 PKStringForKey:@"recurringPaymentIdentifier"];
    uint64_t v56 = [v55 copy];
    recurringPaymentIdentifier = v8->_recurringPaymentIdentifier;
    v8->_recurringPaymentIdentifier = (NSString *)v56;

    v58 = [v6 PKStringForKey:@"frequency"];
    v8->_frequency = PKPeerPaymentRecurringPaymentFrequencyFromString(v58);

    uint64_t v59 = [v6 PKDecimalNumberFromStringForKey:@"threshold"];
    threshold = v8->_threshold;
    v8->_threshold = (NSDecimalNumber *)v59;

    v8->_isNewRecurringPayment = [v6 PKBoolForKey:@"isNewRecurringPayment"];
    if (!v7)
    {
      v61 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_190E10000, v61, OS_LOG_TYPE_DEFAULT, "nil productTimeZone, using default time zone.", v76, 2u);
      }

      id v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Los_Angeles"];
    }
    v62 = [v6 PKStringForKey:@"startDate"];
    uint64_t v63 = PKPaymentDateFromDateStringWithTimeZone(v62, v7);
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v63;

    v65 = [v6 PKStringForKey:@"nextPaymentDate"];
    uint64_t v66 = PKPaymentDateFromDateStringWithTimeZone(v65, v7);
    nextPaymentDate = v8->_nextPaymentDate;
    v8->_nextPaymentDate = (NSDate *)v66;

    v68 = [v6 PKStringForKey:@"transactionIdentifier"];
    uint64_t v69 = [v68 copy];
    transactionIdentifier = v8->_transactionIdentifier;
    v8->_transactionIdentifier = (NSString *)v69;

    if (!v8->_validUntil)
    {
      v71 = (void *)MEMORY[0x1E4F1C9C8];
      v72 = [v6 PKNumberForKey:@"validityDuration"];
      [v72 doubleValue];
      uint64_t v73 = objc_msgSend(v71, "dateWithTimeIntervalSinceNow:");
      v74 = v8->_validUntil;
      v8->_validUntil = (NSDate *)v73;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuote)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKPeerPaymentQuote;
  v5 = [(PKPeerPaymentQuote *)&v61 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quoteIdentifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"quoteItems"];
    items = v5->_items;
    v5->_items = (NSArray *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disclosureText"];
    uint64_t v15 = [v14 copy];
    disclosureText = v5->_disclosureText;
    v5->_disclosureText = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disclosureURL"];
    uint64_t v18 = [v17 copy];
    disclosureURL = v5->_disclosureURL;
    v5->_disclosureURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalanceCurrency"];
    currentBalanceCurrency = v5->_currentBalanceCurrency;
    v5->_currentBalanceCurrency = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFees"];
    totalFees = v5->_totalFees;
    v5->_totalFees = (NSDecimalNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFeesCurrency"];
    totalFeesCurrency = v5->_totalFeesCurrency;
    v5->_totalFeesCurrency = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalReceiveAmount"];
    totalReceiveAmount = v5->_totalReceiveAmount;
    v5->_totalReceiveAmount = (NSDecimalNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalReceiveAmountCurrency"];
    totalReceiveAmountCurrency = v5->_totalReceiveAmountCurrency;
    v5->_totalReceiveAmountCurrency = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleHash"];
    appleHash = v5->_appleHash;
    v5->_appleHash = (NSData *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalHash"];
    externalHash = v5->_externalHash;
    v5->_externalHash = (NSData *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validUntil"];
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSDate *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipient"];
    recipient = v5->_recipient;
    v5->_recipient = (PKPeerPaymentRecipient *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankName"];
    bankName = v5->_bankName;
    v5->_bankName = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumber"];
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingNumber"];
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v44;

    v5->_riskLevel = [v4 decodeIntegerForKey:@"riskLevel"];
    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicFraudContent"];
    dynamicFraudContent = v5->_dynamicFraudContent;
    v5->_dynamicFraudContent = (PKPeerPaymentQuoteDynamicFraudContent *)v46;

    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPaymentIdentifier"];
    uint64_t v49 = [v48 copy];
    recurringPaymentIdentifier = v5->_recurringPaymentIdentifier;
    v5->_recurringPaymentIdentifier = (NSString *)v49;

    v5->_frequency = [v4 decodeIntegerForKey:@"frequency"];
    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextPaymentDate"];
    nextPaymentDate = v5->_nextPaymentDate;
    v5->_nextPaymentDate = (NSDate *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threshold"];
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v55;

    v5->_isNewRecurringPayment = [v4 decodeBoolForKey:@"isNewRecurringPayment"];
    v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    uint64_t v58 = [v57 copy];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v58;

    v5->_destinationType = [v4 decodeIntegerForKey:@"destinationType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"quoteIdentifier"];
  [v5 encodeObject:self->_items forKey:@"quoteItems"];
  [v5 encodeObject:self->_disclosureText forKey:@"disclosureText"];
  [v5 encodeObject:self->_disclosureURL forKey:@"disclosureURL"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_currentBalanceCurrency forKey:@"currentBalanceCurrency"];
  [v5 encodeObject:self->_totalFees forKey:@"totalFees"];
  [v5 encodeObject:self->_totalFeesCurrency forKey:@"totalFeesCurrency"];
  [v5 encodeObject:self->_totalReceiveAmount forKey:@"totalReceiveAmount"];
  [v5 encodeObject:self->_totalReceiveAmountCurrency forKey:@"totalReceiveAmountCurrency"];
  [v5 encodeObject:self->_appleHash forKey:@"appleHash"];
  [v5 encodeObject:self->_externalHash forKey:@"externalHash"];
  [v5 encodeObject:self->_validUntil forKey:@"validUntil"];
  [v5 encodeObject:self->_recipient forKey:@"recipient"];
  [v5 encodeObject:self->_bankName forKey:@"bankName"];
  [v5 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v5 encodeObject:self->_routingNumber forKey:@"routingNumber"];
  [v5 encodeInteger:self->_riskLevel forKey:@"riskLevel"];
  [v5 encodeObject:self->_dynamicFraudContent forKey:@"dynamicFraudContent"];
  [v5 encodeObject:self->_recurringPaymentIdentifier forKey:@"recurringPaymentIdentifier"];
  [v5 encodeInteger:self->_frequency forKey:@"frequency"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_nextPaymentDate forKey:@"nextPaymentDate"];
  [v5 encodeObject:self->_threshold forKey:@"threshold"];
  [v5 encodeBool:self->_isNewRecurringPayment forKey:@"isNewRecurringPayment"];
  [v5 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
  [v5 encodeInteger:self->_destinationType forKey:@"destinationType"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_120;
  }
  identifier = self->_identifier;
  id v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_120;
  }
  items = self->_items;
  v8 = (NSArray *)v4[3];
  if (items && v8)
  {
    if ((-[NSArray isEqual:](items, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (items != v8)
  {
    goto LABEL_120;
  }
  disclosureText = self->_disclosureText;
  uint64_t v10 = (NSString *)v4[4];
  if (disclosureText && v10)
  {
    if ((-[NSString isEqual:](disclosureText, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (disclosureText != v10)
  {
    goto LABEL_120;
  }
  disclosureURL = self->_disclosureURL;
  uint64_t v12 = (NSURL *)v4[5];
  if (disclosureURL && v12)
  {
    if ((-[NSURL isEqual:](disclosureURL, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (disclosureURL != v12)
  {
    goto LABEL_120;
  }
  currentBalance = self->_currentBalance;
  id v14 = (NSDecimalNumber *)v4[6];
  if (currentBalance && v14)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (currentBalance != v14)
  {
    goto LABEL_120;
  }
  currentBalanceCurrency = self->_currentBalanceCurrency;
  uint64_t v16 = (NSString *)v4[7];
  if (currentBalanceCurrency && v16)
  {
    if ((-[NSString isEqual:](currentBalanceCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (currentBalanceCurrency != v16)
  {
    goto LABEL_120;
  }
  totalFees = self->_totalFees;
  uint64_t v18 = (NSDecimalNumber *)v4[12];
  if (totalFees && v18)
  {
    if ((-[NSDecimalNumber isEqual:](totalFees, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (totalFees != v18)
  {
    goto LABEL_120;
  }
  totalFeesCurrency = self->_totalFeesCurrency;
  uint64_t v20 = (NSString *)v4[13];
  if (totalFeesCurrency && v20)
  {
    if ((-[NSString isEqual:](totalFeesCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (totalFeesCurrency != v20)
  {
    goto LABEL_120;
  }
  totalReceiveAmount = self->_totalReceiveAmount;
  uint64_t v22 = (NSDecimalNumber *)v4[10];
  if (totalReceiveAmount && v22)
  {
    if ((-[NSDecimalNumber isEqual:](totalReceiveAmount, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (totalReceiveAmount != v22)
  {
    goto LABEL_120;
  }
  totalReceiveAmountCurrency = self->_totalReceiveAmountCurrency;
  uint64_t v24 = (NSString *)v4[11];
  if (totalReceiveAmountCurrency && v24)
  {
    if ((-[NSString isEqual:](totalReceiveAmountCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (totalReceiveAmountCurrency != v24)
  {
    goto LABEL_120;
  }
  appleHash = self->_appleHash;
  uint64_t v26 = (NSData *)v4[8];
  if (appleHash && v26)
  {
    if ((-[NSData isEqual:](appleHash, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (appleHash != v26)
  {
    goto LABEL_120;
  }
  externalHash = self->_externalHash;
  uint64_t v28 = (NSData *)v4[9];
  if (externalHash && v28)
  {
    if ((-[NSData isEqual:](externalHash, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (externalHash != v28)
  {
    goto LABEL_120;
  }
  validUntil = self->_validUntil;
  uint64_t v30 = (NSDate *)v4[14];
  if (validUntil && v30)
  {
    if ((-[NSDate isEqual:](validUntil, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (validUntil != v30)
  {
    goto LABEL_120;
  }
  recipient = self->_recipient;
  uint64_t v32 = (PKPeerPaymentRecipient *)v4[23];
  if (recipient && v32)
  {
    if (!-[PKPeerPaymentRecipient isEqual:](recipient, "isEqual:")) {
      goto LABEL_120;
    }
  }
  else if (recipient != v32)
  {
    goto LABEL_120;
  }
  bankName = self->_bankName;
  uint64_t v34 = (NSString *)v4[25];
  if (bankName && v34)
  {
    if ((-[NSString isEqual:](bankName, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (bankName != v34)
  {
    goto LABEL_120;
  }
  accountNumber = self->_accountNumber;
  uint64_t v36 = (NSString *)v4[27];
  if (accountNumber && v36)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (accountNumber != v36)
  {
    goto LABEL_120;
  }
  routingNumber = self->_routingNumber;
  uint64_t v38 = (NSString *)v4[26];
  if (routingNumber && v38)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (routingNumber != v38)
  {
    goto LABEL_120;
  }
  if (self->_riskLevel != v4[15]) {
    goto LABEL_120;
  }
  dynamicFraudContent = self->_dynamicFraudContent;
  uint64_t v40 = (PKPeerPaymentQuoteDynamicFraudContent *)v4[16];
  if (dynamicFraudContent && v40)
  {
    if (!-[PKPeerPaymentQuoteDynamicFraudContent isEqual:](dynamicFraudContent, "isEqual:")) {
      goto LABEL_120;
    }
  }
  else if (dynamicFraudContent != v40)
  {
    goto LABEL_120;
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  uint64_t v42 = (NSString *)v4[17];
  if (recurringPaymentIdentifier && v42)
  {
    if ((-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (recurringPaymentIdentifier != v42)
  {
    goto LABEL_120;
  }
  if (self->_frequency != v4[20]) {
    goto LABEL_120;
  }
  threshold = self->_threshold;
  uint64_t v44 = (NSDecimalNumber *)v4[21];
  if (threshold && v44)
  {
    if ((-[NSDecimalNumber isEqual:](threshold, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (threshold != v44)
  {
    goto LABEL_120;
  }
  startDate = self->_startDate;
  uint64_t v46 = (NSDate *)v4[18];
  if (startDate && v46)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (startDate != v46)
  {
    goto LABEL_120;
  }
  nextPaymentDate = self->_nextPaymentDate;
  v48 = (NSDate *)v4[19];
  if (nextPaymentDate && v48)
  {
    if ((-[NSDate isEqual:](nextPaymentDate, "isEqual:") & 1) == 0) {
      goto LABEL_120;
    }
  }
  else if (nextPaymentDate != v48)
  {
    goto LABEL_120;
  }
  if (self->_isNewRecurringPayment != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_120;
  }
  transactionIdentifier = self->_transactionIdentifier;
  v50 = (NSString *)v4[22];
  if (!transactionIdentifier || !v50)
  {
    if (transactionIdentifier == v50) {
      goto LABEL_118;
    }
LABEL_120:
    BOOL v51 = 0;
    goto LABEL_121;
  }
  if ((-[NSString isEqual:](transactionIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_120;
  }
LABEL_118:
  BOOL v51 = self->_destinationType == v4[24];
LABEL_121:

  return v51;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_items];
  [v3 safelyAddObject:self->_disclosureText];
  [v3 safelyAddObject:self->_disclosureURL];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_currentBalanceCurrency];
  [v3 safelyAddObject:self->_totalFees];
  [v3 safelyAddObject:self->_totalFeesCurrency];
  [v3 safelyAddObject:self->_totalReceiveAmount];
  [v3 safelyAddObject:self->_totalReceiveAmountCurrency];
  [v3 safelyAddObject:self->_appleHash];
  [v3 safelyAddObject:self->_externalHash];
  [v3 safelyAddObject:self->_validUntil];
  [v3 safelyAddObject:self->_recipient];
  [v3 safelyAddObject:self->_bankName];
  [v3 safelyAddObject:self->_accountNumber];
  [v3 safelyAddObject:self->_routingNumber];
  [v3 safelyAddObject:self->_dynamicFraudContent];
  [v3 safelyAddObject:self->_recurringPaymentIdentifier];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_nextPaymentDate];
  [v3 safelyAddObject:self->_threshold];
  [v3 safelyAddObject:self->_transactionIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_riskLevel - v4 + 32 * v4;
  unint64_t v6 = self->_frequency - v5 + 32 * v5;
  uint64_t v7 = self->_isNewRecurringPayment - v6 + 32 * v6;
  unint64_t v8 = self->_destinationType - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"items: '%@'; ", self->_items];
  [v3 appendFormat:@"disclosureText: '%@'; ", self->_disclosureText];
  uint64_t v4 = [(NSURL *)self->_disclosureURL absoluteString];
  [v3 appendFormat:@"disclosureURL: '%@'; ", v4];

  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"currentBalanceCurrency: '%@'; ", self->_currentBalanceCurrency];
  [v3 appendFormat:@"totalFees: '%@'; ", self->_totalFees];
  [v3 appendFormat:@"totalFeesCurrency: '%@'; ", self->_totalFeesCurrency];
  [v3 appendFormat:@"totalReceiveAmount: '%@'; ", self->_totalReceiveAmount];
  [v3 appendFormat:@"totalReceiveAmountCurrency: '%@'; ", self->_totalReceiveAmountCurrency];
  [v3 appendFormat:@"appleHash: '%@'; ", self->_appleHash];
  [v3 appendFormat:@"externalHash: '%@'; ", self->_externalHash];
  [v3 appendFormat:@"validUntil: '%@'; ", self->_validUntil];
  [v3 appendFormat:@"recipient: '%@'; ", self->_recipient];
  objc_msgSend(v3, "appendFormat:", @"hasBankName: %d; ", -[NSString length](self->_bankName, "length") != 0);
  objc_msgSend(v3, "appendFormat:", @"hasRoutingNumber: %d; ",
    [(NSString *)self->_routingNumber length] != 0);
  objc_msgSend(v3, "appendFormat:", @"hasAccountNumber: %d; ",
    [(NSString *)self->_accountNumber length] != 0);
  unint64_t v5 = self->_riskLevel - 1;
  if (v5 > 2) {
    unint64_t v6 = @"none";
  }
  else {
    unint64_t v6 = off_1E56ED870[v5];
  }
  [v3 appendFormat:@"riskLevel: %@; ", v6];
  objc_msgSend(v3, "appendFormat:", @"preservesCurrentBalance: %d; ",
    [(PKPeerPaymentQuote *)self preservesCurrentBalance]);
  uint64_t v7 = [(PKPeerPaymentQuoteDynamicFraudContent *)self->_dynamicFraudContent description];
  [v3 appendFormat:@"dynamicFraudContent: %@; ", v7];

  objc_msgSend(v3, "appendFormat:", @"isRecurringPayment: %d; ",
    [(PKPeerPaymentQuote *)self isRecurringPayment]);
  [v3 appendFormat:@"recurringPaymentIdentifier: %@; ", self->_recurringPaymentIdentifier];
  unint64_t v8 = PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  [v3 appendFormat:@"frequency: %@; ", v8];

  [v3 appendFormat:@"startDate: %@; ", self->_startDate];
  [v3 appendFormat:@"nextPaymentDate: %@; ", self->_nextPaymentDate];
  [v3 appendFormat:@"threshold: %@; ", self->_threshold];
  objc_msgSend(v3, "appendFormat:", @"isNewRecurringPayment: %d; ", self->_isNewRecurringPayment);
  [v3 appendFormat:@"transactionIdentifier: %@; ", self->_transactionIdentifier];
  v9 = PKPeerPaymentQuoteRequestDestinationTypeToString(self->_destinationType);
  [v3 appendFormat:@"destinationType: %@; ", v9];

  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)hasExpired
{
  validUntil = self->_validUntil;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(validUntil) = [(NSDate *)validUntil compare:v3] == NSOrderedAscending;

  return (char)validUntil;
}

- (id)firstQuoteItemOfType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(PKPeerPaymentQuote *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 type] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)preservesCurrentBalance
{
  v3 = [(PKPeerPaymentQuote *)self recipient];
  if (v3 || [(PKPeerPaymentQuote *)self destinationType] == 5)
  {
    uint64_t v4 = [(PKPeerPaymentQuote *)self firstQuoteItemOfType:1];
    char v5 = [v4 preservesCurrentBalance];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isRecurringPayment
{
  return self->_startDate && self->_frequency || self->_threshold != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)disclosureText
{
  return self->_disclosureText;
}

- (NSURL)disclosureURL
{
  return self->_disclosureURL;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (NSString)currentBalanceCurrency
{
  return self->_currentBalanceCurrency;
}

- (NSData)appleHash
{
  return self->_appleHash;
}

- (NSData)externalHash
{
  return self->_externalHash;
}

- (NSDecimalNumber)totalReceiveAmount
{
  return self->_totalReceiveAmount;
}

- (NSString)totalReceiveAmountCurrency
{
  return self->_totalReceiveAmountCurrency;
}

- (NSDecimalNumber)totalFees
{
  return self->_totalFees;
}

- (NSString)totalFeesCurrency
{
  return self->_totalFeesCurrency;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (unint64_t)riskLevel
{
  return self->_riskLevel;
}

- (PKPeerPaymentQuoteDynamicFraudContent)dynamicFraudContent
{
  return self->_dynamicFraudContent;
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)nextPaymentDate
{
  return self->_nextPaymentDate;
}

- (void)setNextPaymentDate:(id)a3
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

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
}

- (BOOL)isNewRecurringPayment
{
  return self->_isNewRecurringPayment;
}

- (void)setIsNewRecurringPayment:(BOOL)a3
{
  self->_isNewRecurringPayment = a3;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (PKPeerPaymentRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(unint64_t)a3
{
  self->_destinationType = a3;
}

- (NSString)bankName
{
  return self->_bankName;
}

- (void)setBankName:(id)a3
{
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_nextPaymentDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicFraudContent, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_totalFeesCurrency, 0);
  objc_storeStrong((id *)&self->_totalFees, 0);
  objc_storeStrong((id *)&self->_totalReceiveAmountCurrency, 0);
  objc_storeStrong((id *)&self->_totalReceiveAmount, 0);
  objc_storeStrong((id *)&self->_externalHash, 0);
  objc_storeStrong((id *)&self->_appleHash, 0);
  objc_storeStrong((id *)&self->_currentBalanceCurrency, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_disclosureURL, 0);
  objc_storeStrong((id *)&self->_disclosureText, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PKCurrencyAmount)calculatedTotalAmount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v4 = [(NSArray *)self->_items firstObject];
  char v5 = [v4 totalAmountCurrency];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "totalAmount", (void)v17);
        if (v11)
        {
          long long v12 = [MEMORY[0x1E4F28C28] zero];
          char v13 = [v11 isEqualToNumber:v12];

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [v3 decimalNumberByAdding:v11];

            v3 = (void *)v14;
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [[PKCurrencyAmount alloc] initWithAmount:v3 currency:v5 exponent:0];
  return v15;
}

- (double)validityDuration
{
  return 360.0;
}

@end