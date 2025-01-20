@interface PKAppleBalanceAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)createdDate;
- (NSDate)lastUpdatedDate;
- (NSString)associatedPassSerialNumber;
- (NSString)associatedPassTypeIdentifier;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)fpanIdentifier;
- (PKAppleBalanceAccountDetails)initWithCloudRecord:(id)a3;
- (PKAppleBalanceAccountDetails)initWithCoder:(id)a3;
- (PKAppleBalanceAccountDetails)initWithDictionary:(id)a3;
- (PKAppleBalanceAccountSummary)accountSummary;
- (PKCurrencyAmount)currentBalance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cardType;
- (unint64_t)hash;
- (void)encodeWithCloudRecord:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountSummary:(id)a3;
- (void)setAssociatedPassSerialNumber:(id)a3;
- (void)setAssociatedPassTypeIdentifier:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setFpanIdentifier:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
@end

@implementation PKAppleBalanceAccountDetails

- (PKAppleBalanceAccountDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKAppleBalanceAccountDetails;
  v5 = [(PKAppleBalanceAccountDetails *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"fpanId"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 PKStringForKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v18;

    v20 = [v4 PKStringForKey:@"cardType"];
    v5->_cardType = PKPaymentCredentialTypeForPaymentNetworkName(v20);

    v21 = [PKAppleBalanceAccountSummary alloc];
    v22 = [v4 PKDictionaryForKey:@"accountSummary"];
    uint64_t v23 = [(PKAppleBalanceAccountSummary *)v21 initWithDictionary:v22];
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKAppleBalanceAccountSummary *)v23;
  }
  return v5;
}

- (PKAppleBalanceAccountDetails)initWithCloudRecord:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKAppleBalanceAccountDetails;
  v5 = [(PKAppleBalanceAccountDetails *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_dateForKey:", @"lastUpdatedDate");
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_dateForKey:", @"createdDate");
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"fpanId");
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "pk_stringForKey:", @"associatedPassTypeIdentifier");
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v12;

    v5->_cardType = (int)objc_msgSend(v4, "pk_intForKey:", @"cardType");
    uint64_t v14 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"countryCode");
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"balanceCurrencyCode");
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "pk_encryptedObjectForKey:ofClass:", @"balanceAmount", objc_opt_class());
    v19 = v18;
    v20 = (void *)MEMORY[0x1E4F28C28];
    if (v18)
    {
      [v18 decimalValue];
    }
    else
    {
      v25[0] = 0;
      v25[1] = 0;
      int v26 = 0;
    }
    v21 = [v20 decimalNumberWithDecimal:v25];
    v22 = objc_alloc_init(PKAppleBalanceAccountSummary);
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = v22;

    [(PKAppleBalanceAccountSummary *)v5->_accountSummary setCurrentBalance:v21];
  }

  return v5;
}

- (PKCurrencyAmount)currentBalance
{
  v3 = [(PKAppleBalanceAccountSummary *)self->_accountSummary currentBalance];
  id v4 = PKCurrencyAmountCreate(v3, self->_currencyCode, 0);

  return (PKCurrencyAmount *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKAppleBalanceAccountDetails;
  v5 = [(PKAppleBalanceAccountDetails *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanId"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v18;

    v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountSummary"];
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKAppleBalanceAccountSummary *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lastUpdatedDate = self->_lastUpdatedDate;
  id v5 = a3;
  [v5 encodeObject:lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_createdDate forKey:@"createdDate"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_fpanIdentifier forKey:@"fpanId"];
  [v5 encodeObject:self->_associatedPassSerialNumber forKey:@"associatedPassSerialNumber"];
  [v5 encodeObject:self->_associatedPassTypeIdentifier forKey:@"associatedPassTypeIdentifier"];
  [v5 encodeInteger:self->_cardType forKey:@"cardType"];
  [v5 encodeObject:self->_accountSummary forKey:@"accountSummary"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_42;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  uint64_t v6 = (NSDate *)v4[1];
  if (lastUpdatedDate && v6)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0) {
      goto LABEL_42;
    }
  }
  else if (lastUpdatedDate != v6)
  {
    goto LABEL_42;
  }
  createdDate = self->_createdDate;
  uint64_t v8 = (NSDate *)v4[2];
  if (!createdDate || !v8)
  {
    if (createdDate == v8) {
      goto LABEL_12;
    }
LABEL_42:
    BOOL v26 = 0;
    goto LABEL_43;
  }
  if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0) {
    goto LABEL_42;
  }
LABEL_12:
  v9 = (void *)v4[7];
  uint64_t v10 = self->_countryCode;
  v11 = v9;
  if (v10 == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    if (!v10 || !v11) {
      goto LABEL_41;
    }
    BOOL v13 = [(NSString *)v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_42;
    }
  }
  uint64_t v14 = (void *)v4[8];
  uint64_t v10 = self->_currencyCode;
  v15 = v14;
  if (v10 == v15)
  {
  }
  else
  {
    uint64_t v12 = v15;
    if (!v10 || !v15) {
      goto LABEL_41;
    }
    BOOL v16 = [(NSString *)v10 isEqualToString:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  v17 = (void *)v4[3];
  uint64_t v10 = self->_fpanIdentifier;
  uint64_t v18 = v17;
  if (v10 == v18)
  {
  }
  else
  {
    uint64_t v12 = v18;
    if (!v10 || !v18) {
      goto LABEL_41;
    }
    BOOL v19 = [(NSString *)v10 isEqualToString:v18];

    if (!v19) {
      goto LABEL_42;
    }
  }
  uint64_t v20 = (void *)v4[5];
  uint64_t v10 = self->_associatedPassSerialNumber;
  v21 = v20;
  if (v10 == v21)
  {

    goto LABEL_36;
  }
  uint64_t v12 = v21;
  if (!v10 || !v21)
  {
LABEL_41:

    goto LABEL_42;
  }
  BOOL v22 = [(NSString *)v10 isEqualToString:v21];

  if (!v22) {
    goto LABEL_42;
  }
LABEL_36:
  objc_super v23 = (void *)v4[4];
  uint64_t v10 = self->_associatedPassTypeIdentifier;
  v24 = v23;
  if (v10 == v24)
  {

    goto LABEL_45;
  }
  uint64_t v12 = v24;
  if (!v10 || !v24) {
    goto LABEL_41;
  }
  BOOL v25 = [(NSString *)v10 isEqualToString:v24];

  if (!v25) {
    goto LABEL_42;
  }
LABEL_45:
  if (self->_cardType != v4[6]) {
    goto LABEL_42;
  }
  accountSummary = self->_accountSummary;
  v29 = (PKAppleBalanceAccountSummary *)v4[9];
  if (accountSummary && v29) {
    BOOL v26 = -[PKAppleBalanceAccountSummary isEqual:](accountSummary, "isEqual:");
  }
  else {
    BOOL v26 = accountSummary == v29;
  }
LABEL_43:

  return v26;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_lastUpdatedDate];
  [v3 safelyAddObject:self->_createdDate];
  [v3 safelyAddObject:self->_countryCode];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_fpanIdentifier];
  [v3 safelyAddObject:self->_associatedPassSerialNumber];
  [v3 safelyAddObject:self->_associatedPassTypeIdentifier];
  [v3 safelyAddObject:self->_accountSummary];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_cardType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDate *)self->_lastUpdatedDate description];
  [v3 appendFormat:@"lastUpdateDate: '%@'; ", v4];

  unint64_t v5 = [(NSDate *)self->_createdDate description];
  [v3 appendFormat:@"createdDate: '%@'; ", v5];

  [v3 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", self->_fpanIdentifier];
  [v3 appendFormat:@"associatedPassSerialNumber: '%@'; ", self->_associatedPassSerialNumber];
  [v3 appendFormat:@"associatedPassTypeIdentifier: '%@'; ", self->_associatedPassTypeIdentifier];
  uint64_t v6 = PKPaymentNetworkNameForPaymentCredentialType(self->_cardType);
  [v3 appendFormat:@"cardType: '%@'; ", v6];

  v7 = [(PKAppleBalanceAccountSummary *)self->_accountSummary description];
  [v3 appendFormat:@"summary: '%@'; ", v7];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKAppleBalanceAccountDetails allocWithZone:](PKAppleBalanceAccountDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_lastUpdatedDate copyWithZone:a3];
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_createdDate copyWithZone:a3];
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  uint64_t v10 = [(NSString *)self->_countryCode copyWithZone:a3];
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_fpanIdentifier copyWithZone:a3];
  fpanIdentifier = v5->_fpanIdentifier;
  v5->_fpanIdentifier = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_associatedPassSerialNumber copyWithZone:a3];
  associatedPassSerialNumber = v5->_associatedPassSerialNumber;
  v5->_associatedPassSerialNumber = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_associatedPassTypeIdentifier copyWithZone:a3];
  associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
  v5->_associatedPassTypeIdentifier = (NSString *)v18;

  v5->_cardType = self->_cardType;
  uint64_t v20 = [(PKAppleBalanceAccountSummary *)self->_accountSummary copyWithZone:a3];
  accountSummary = v5->_accountSummary;
  v5->_accountSummary = v20;

  return v5;
}

- (void)encodeWithCloudRecord:(id)a3 codingType:(unint64_t)a4
{
  lastUpdatedDate = self->_lastUpdatedDate;
  id v6 = a3;
  [v6 setObject:lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v6 setObject:self->_createdDate forKey:@"createdDate"];
  [v6 setObject:self->_associatedPassTypeIdentifier forKey:@"associatedPassTypeIdentifier"];
  v7 = [NSNumber numberWithInteger:self->_cardType];
  [v6 setObject:v7 forKey:@"cardType"];

  id v9 = [v6 encryptedValues];

  [v9 setObject:self->_countryCode forKey:@"countryCode"];
  [v9 setObject:self->_currencyCode forKey:@"balanceCurrencyCode"];
  [v9 setObject:self->_fpanIdentifier forKey:@"fpanId"];
  uint64_t v8 = [(PKAppleBalanceAccountSummary *)self->_accountSummary currentBalance];
  [v9 setObject:v8 forKey:@"balanceAmount"];
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
}

- (NSString)associatedPassTypeIdentifier
{
  return self->_associatedPassTypeIdentifier;
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
}

- (NSString)associatedPassSerialNumber
{
  return self->_associatedPassSerialNumber;
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKAppleBalanceAccountSummary)accountSummary
{
  return self->_accountSummary;
}

- (void)setAccountSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end