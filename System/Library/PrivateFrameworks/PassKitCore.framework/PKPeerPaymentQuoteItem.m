@interface PKPeerPaymentQuoteItem
+ (BOOL)supportsSecureCoding;
+ (id)quoteItemWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)preservesCurrentBalance;
- (NSArray)supportedNetworks;
- (NSData)nonce;
- (NSDecimalNumber)exchangeRate;
- (NSDecimalNumber)fees;
- (NSDecimalNumber)receiveAmount;
- (NSDecimalNumber)sendAmount;
- (NSDecimalNumber)totalAmount;
- (NSSet)supportedFundingSourceCountryCodes;
- (NSString)countryCode;
- (NSString)dpanIdentifier;
- (NSString)feesCurrency;
- (NSString)merchantIdentifier;
- (NSString)receiveAmountCurrency;
- (NSString)sendAmountCurrency;
- (NSString)totalAmountCurrency;
- (PKPeerPaymentQuoteItem)initWithCoder:(id)a3;
- (PKPeerPaymentQuoteItem)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)merchantCapabilities;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPeerPaymentQuoteItem

+ (id)quoteItemWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (PKPeerPaymentQuoteItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKPeerPaymentQuoteItem;
  v5 = [(PKPeerPaymentQuoteItem *)&v50 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_unint64_t type = PKPeerPaymentQuoteItemTypeFromString(v6);

    uint64_t v7 = [v4 PKDecimalNumberFromStringForKey:@"exchangeRate"];
    exchangeRate = v5->_exchangeRate;
    v5->_exchangeRate = (NSDecimalNumber *)v7;

    uint64_t v9 = [v4 PKDecimalNumberFromStringForKey:@"sendAmount"];
    sendAmount = v5->_sendAmount;
    v5->_sendAmount = (NSDecimalNumber *)v9;

    v11 = [v4 PKStringForKey:@"sendAmountCurrency"];
    uint64_t v12 = [v11 copy];
    sendAmountCurrency = v5->_sendAmountCurrency;
    v5->_sendAmountCurrency = (NSString *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"receiveAmount"];
    receiveAmount = v5->_receiveAmount;
    v5->_receiveAmount = (NSDecimalNumber *)v14;

    v16 = [v4 PKStringForKey:@"receiveAmountCurrency"];
    uint64_t v17 = [v16 copy];
    receiveAmountCurrency = v5->_receiveAmountCurrency;
    v5->_receiveAmountCurrency = (NSString *)v17;

    uint64_t v19 = [v4 PKDecimalNumberFromStringForKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v19;

    v21 = [v4 PKStringForKey:@"totalAmountCurrency"];
    uint64_t v22 = [v21 copy];
    totalAmountCurrency = v5->_totalAmountCurrency;
    v5->_totalAmountCurrency = (NSString *)v22;

    uint64_t v24 = [v4 PKDecimalNumberFromStringForKey:@"fees"];
    fees = v5->_fees;
    v5->_fees = (NSDecimalNumber *)v24;

    v26 = [v4 PKStringForKey:@"feesCurrency"];
    uint64_t v27 = [v26 copy];
    feesCurrency = v5->_feesCurrency;
    v5->_feesCurrency = (NSString *)v27;

    v29 = [v4 PKStringForKey:@"dpanIdentifier"];
    uint64_t v30 = [v29 copy];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v30;

    v32 = [v4 PKStringForKey:@"countryCode"];
    uint64_t v33 = [v32 copy];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v33;

    v35 = [v4 PKSetContaining:objc_opt_class() forKey:@"supportedFundingSourceCountryCodes"];
    uint64_t v36 = [v35 copy];
    supportedFundingSourceCountryCodes = v5->_supportedFundingSourceCountryCodes;
    v5->_supportedFundingSourceCountryCodes = (NSSet *)v36;

    unint64_t type = v5->_type;
    if (type == 4 || type == 1)
    {
      v39 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedNetworks"];
      uint64_t v40 = [v39 copy];
      supportedNetworks = v5->_supportedNetworks;
      v5->_supportedNetworks = (NSArray *)v40;

      v42 = [v4 PKStringForKey:@"merchantIdentifier"];
      uint64_t v43 = [v42 copy];
      merchantIdentifier = v5->_merchantIdentifier;
      v5->_merchantIdentifier = (NSString *)v43;

      v45 = [v4 PKArrayContaining:objc_opt_class() forKey:@"merchantCapabilities"];
      v5->_merchantCapabilities = PKMerchantCapabilityFromStrings(v45);
    }
    v46 = [v4 PKStringForKey:@"nonce"];
    uint64_t v47 = objc_msgSend(v46, "pk_decodeHexadecimal");
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v47;

    v5->_preservesCurrentBalance = [v4 PKBoolForKey:@"preservesCurrentBalance"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuoteItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKPeerPaymentQuoteItem;
  v5 = [(PKPeerPaymentQuoteItem *)&v45 init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exchangeRate"];
    exchangeRate = v5->_exchangeRate;
    v5->_exchangeRate = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendAmount"];
    sendAmount = v5->_sendAmount;
    v5->_sendAmount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendAmountCurrency"];
    sendAmountCurrency = v5->_sendAmountCurrency;
    v5->_sendAmountCurrency = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiveAmount"];
    receiveAmount = v5->_receiveAmount;
    v5->_receiveAmount = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiveAmountCurrency"];
    receiveAmountCurrency = v5->_receiveAmountCurrency;
    v5->_receiveAmountCurrency = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAmountCurrency"];
    totalAmountCurrency = v5->_totalAmountCurrency;
    v5->_totalAmountCurrency = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fees"];
    fees = v5->_fees;
    v5->_fees = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feesCurrency"];
    feesCurrency = v5->_feesCurrency;
    v5->_feesCurrency = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"supportedFundingSourceCountryCodes"];
    supportedFundingSourceCountryCodes = v5->_supportedFundingSourceCountryCodes;
    v5->_supportedFundingSourceCountryCodes = (NSSet *)v31;

    uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"supportedNetworks"];
    uint64_t v37 = [v36 copy];
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSArray *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v39;

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCapabilities"];
    v5->_merchantCapabilities = [v41 unsignedIntegerValue];

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v42;

    v5->_preservesCurrentBalance = [v4 decodeBoolForKey:@"preservesCurrentBalance"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v6 = a3;
  [v6 encodeInteger:type forKey:@"type"];
  [v6 encodeObject:self->_exchangeRate forKey:@"exchangeRate"];
  [v6 encodeObject:self->_sendAmount forKey:@"sendAmount"];
  [v6 encodeObject:self->_sendAmountCurrency forKey:@"sendAmountCurrency"];
  [v6 encodeObject:self->_receiveAmount forKey:@"receiveAmount"];
  [v6 encodeObject:self->_receiveAmountCurrency forKey:@"receiveAmountCurrency"];
  [v6 encodeObject:self->_totalAmount forKey:@"totalAmount"];
  [v6 encodeObject:self->_totalAmountCurrency forKey:@"totalAmountCurrency"];
  [v6 encodeObject:self->_fees forKey:@"fees"];
  [v6 encodeObject:self->_feesCurrency forKey:@"feesCurrency"];
  [v6 encodeObject:self->_dpanIdentifier forKey:@"dpanIdentifier"];
  [v6 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v6 encodeObject:self->_supportedFundingSourceCountryCodes forKey:@"supportedFundingSourceCountryCodes"];
  [v6 encodeObject:self->_supportedNetworks forKey:@"supportedNetworks"];
  [v6 encodeObject:self->_merchantIdentifier forKey:@"merchantIdentifier"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_merchantCapabilities];
  [v6 encodeObject:v5 forKey:@"merchantCapabilities"];

  [v6 encodeObject:self->_nonce forKey:@"nonce"];
  [v6 encodeBool:self->_preservesCurrentBalance forKey:@"preservesCurrentBalance"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_exchangeRate];
  [v3 safelyAddObject:self->_sendAmount];
  [v3 safelyAddObject:self->_sendAmountCurrency];
  [v3 safelyAddObject:self->_receiveAmount];
  [v3 safelyAddObject:self->_receiveAmountCurrency];
  [v3 safelyAddObject:self->_totalAmount];
  [v3 safelyAddObject:self->_totalAmountCurrency];
  [v3 safelyAddObject:self->_fees];
  [v3 safelyAddObject:self->_feesCurrency];
  [v3 safelyAddObject:self->_dpanIdentifier];
  [v3 safelyAddObject:self->_countryCode];
  [v3 safelyAddObject:self->_supportedFundingSourceCountryCodes];
  [v3 safelyAddObject:self->_supportedNetworks];
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_nonce];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_merchantCapabilities - v5 + 32 * v5;
  unint64_t v7 = self->_preservesCurrentBalance - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_65;
  }
  exchangeRate = self->_exchangeRate;
  unint64_t v6 = (NSDecimalNumber *)v4[3];
  if (exchangeRate && v6)
  {
    if ((-[NSDecimalNumber isEqual:](exchangeRate, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (exchangeRate != v6)
  {
    goto LABEL_65;
  }
  sendAmount = self->_sendAmount;
  uint64_t v8 = (NSDecimalNumber *)v4[4];
  if (sendAmount && v8)
  {
    if ((-[NSDecimalNumber isEqual:](sendAmount, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (sendAmount != v8)
  {
    goto LABEL_65;
  }
  sendAmountCurrency = self->_sendAmountCurrency;
  uint64_t v10 = (NSString *)v4[5];
  if (sendAmountCurrency && v10)
  {
    if ((-[NSString isEqual:](sendAmountCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (sendAmountCurrency != v10)
  {
    goto LABEL_65;
  }
  receiveAmount = self->_receiveAmount;
  uint64_t v12 = (NSDecimalNumber *)v4[6];
  if (receiveAmount && v12)
  {
    if ((-[NSDecimalNumber isEqual:](receiveAmount, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (receiveAmount != v12)
  {
    goto LABEL_65;
  }
  receiveAmountCurrency = self->_receiveAmountCurrency;
  uint64_t v14 = (NSString *)v4[7];
  if (receiveAmountCurrency && v14)
  {
    if ((-[NSString isEqual:](receiveAmountCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (receiveAmountCurrency != v14)
  {
    goto LABEL_65;
  }
  totalAmountCurrency = self->_totalAmountCurrency;
  uint64_t v16 = (NSString *)v4[9];
  if (totalAmountCurrency && v16)
  {
    if ((-[NSString isEqual:](totalAmountCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (totalAmountCurrency != v16)
  {
    goto LABEL_65;
  }
  fees = self->_fees;
  uint64_t v18 = (NSDecimalNumber *)v4[10];
  if (fees && v18)
  {
    if ((-[NSDecimalNumber isEqual:](fees, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (fees != v18)
  {
    goto LABEL_65;
  }
  dpanIdentifier = self->_dpanIdentifier;
  uint64_t v20 = (NSString *)v4[12];
  if (dpanIdentifier && v20)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (dpanIdentifier != v20)
  {
    goto LABEL_65;
  }
  countryCode = self->_countryCode;
  uint64_t v22 = (NSString *)v4[13];
  if (countryCode && v22)
  {
    if ((-[NSString isEqual:](countryCode, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (countryCode != v22)
  {
    goto LABEL_65;
  }
  supportedFundingSourceCountryCodes = self->_supportedFundingSourceCountryCodes;
  uint64_t v24 = (NSSet *)v4[14];
  if (supportedFundingSourceCountryCodes && v24)
  {
    if ((-[NSSet isEqual:](supportedFundingSourceCountryCodes, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (supportedFundingSourceCountryCodes != v24)
  {
    goto LABEL_65;
  }
  supportedNetworks = self->_supportedNetworks;
  uint64_t v26 = (NSArray *)v4[15];
  if (supportedNetworks && v26)
  {
    if ((-[NSArray isEqual:](supportedNetworks, "isEqual:") & 1) == 0) {
      goto LABEL_65;
    }
  }
  else if (supportedNetworks != v26)
  {
    goto LABEL_65;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v28 = (NSString *)v4[16];
  if (!merchantIdentifier || !v28)
  {
    if (merchantIdentifier == v28) {
      goto LABEL_62;
    }
LABEL_65:
    BOOL v29 = 0;
    goto LABEL_66;
  }
  if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_65;
  }
LABEL_62:
  if (self->_type != v4[2] || self->_merchantCapabilities != v4[17]) {
    goto LABEL_65;
  }
  BOOL v29 = self->_preservesCurrentBalance == *((unsigned __int8 *)v4 + 8);
LABEL_66:

  return v29;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t v5 = self->_type - 1;
  if (v5 > 3) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56ED850[v5];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  [v4 appendFormat:@"exchangeRate: '%@'; ", self->_exchangeRate];
  [v4 appendFormat:@"sendAmount: '%@'; ", self->_sendAmount];
  [v4 appendFormat:@"sendAmountCurrency: '%@'; ", self->_sendAmountCurrency];
  [v4 appendFormat:@"receiveAmount: '%@'; ", self->_receiveAmount];
  [v4 appendFormat:@"receiveAmountCurrency: '%@'; ", self->_receiveAmountCurrency];
  [v4 appendFormat:@"totalAmount: '%@'; ", self->_totalAmount];
  [v4 appendFormat:@"totalAmountCurrency: '%@'; ", self->_totalAmountCurrency];
  [v4 appendFormat:@"fees: '%@'; ", self->_fees];
  [v4 appendFormat:@"feesCurrency: '%@'; ", self->_feesCurrency];
  [v4 appendFormat:@"dpanIdentifier: '%@'; ", self->_dpanIdentifier];
  [v4 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  objc_msgSend(v4, "appendFormat:", @"supportedFundingSourceCountryCodes: '%@'; ",
    self->_supportedFundingSourceCountryCodes);
  if (self->_type == 1)
  {
    [v4 appendFormat:@"supportedNetworks: '%@'; ", self->_supportedNetworks];
    [v4 appendFormat:@"merchantIdentifier: '%@'; ", self->_merchantIdentifier];
    unint64_t v7 = PKMerchantCapabilityToStrings(self->_merchantCapabilities);
    [v4 appendFormat:@"merchantCapabilities: '%@'; ", v7];
  }
  [v4 appendFormat:@"nonce: '%@'; ", self->_nonce];
  objc_msgSend(v4, "appendFormat:", @"preservesCurrentBalance: %d", self->_preservesCurrentBalance);
  [v4 appendFormat:@">"];
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDecimalNumber)exchangeRate
{
  return self->_exchangeRate;
}

- (NSDecimalNumber)sendAmount
{
  return self->_sendAmount;
}

- (NSString)sendAmountCurrency
{
  return self->_sendAmountCurrency;
}

- (NSDecimalNumber)receiveAmount
{
  return self->_receiveAmount;
}

- (NSString)receiveAmountCurrency
{
  return self->_receiveAmountCurrency;
}

- (NSDecimalNumber)totalAmount
{
  return self->_totalAmount;
}

- (NSString)totalAmountCurrency
{
  return self->_totalAmountCurrency;
}

- (NSDecimalNumber)fees
{
  return self->_fees;
}

- (NSString)feesCurrency
{
  return self->_feesCurrency;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSSet)supportedFundingSourceCountryCodes
{
  return self->_supportedFundingSourceCountryCodes;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (BOOL)preservesCurrentBalance
{
  return self->_preservesCurrentBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_supportedFundingSourceCountryCodes, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_feesCurrency, 0);
  objc_storeStrong((id *)&self->_fees, 0);
  objc_storeStrong((id *)&self->_totalAmountCurrency, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_receiveAmountCurrency, 0);
  objc_storeStrong((id *)&self->_receiveAmount, 0);
  objc_storeStrong((id *)&self->_sendAmountCurrency, 0);
  objc_storeStrong((id *)&self->_sendAmount, 0);
  objc_storeStrong((id *)&self->_exchangeRate, 0);
}

@end