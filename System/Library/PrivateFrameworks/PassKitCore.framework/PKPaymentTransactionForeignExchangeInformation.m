@interface PKPaymentTransactionForeignExchangeInformation
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToForeignExchangeInformation:(id)a3;
- (BOOL)isValid;
- (NSDecimalNumber)exchangeRate;
- (PKCurrencyAmount)destinationCurrencyAmount;
- (PKPaymentTransactionForeignExchangeInformation)initWithCloudStoreCoder:(id)a3;
- (PKPaymentTransactionForeignExchangeInformation)initWithCoder:(id)a3;
- (id)fkForeignAmount;
- (id)jsonDictionaryRepresentation;
- (id)jsonString;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)_encodeServerDataWithCloudStoreCoder:(id)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationCurrencyAmount:(id)a3;
- (void)setExchangeRate:(id)a3;
@end

@implementation PKPaymentTransactionForeignExchangeInformation

- (id)jsonDictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PKCurrencyAmount *)self->_destinationCurrencyAmount currency];

  if (v4)
  {
    v5 = [(PKCurrencyAmount *)self->_destinationCurrencyAmount currency];
    [v3 setObject:v5 forKey:@"destinationCurrencyCode"];
  }
  v6 = [(PKCurrencyAmount *)self->_destinationCurrencyAmount amount];

  if (v6)
  {
    v7 = [(PKCurrencyAmount *)self->_destinationCurrencyAmount amount];
    v8 = [v7 stringValue];
    [v3 setObject:v8 forKey:@"destinationAmount"];
  }
  exchangeRate = self->_exchangeRate;
  if (exchangeRate)
  {
    v10 = [(NSDecimalNumber *)exchangeRate stringValue];
    [v3 setObject:v10 forKey:@"exchangeRate"];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

- (id)jsonString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentTransactionForeignExchangeInformation *)self jsonDictionaryRepresentation];
  id v8 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:2 error:&v8];
  id v4 = v8;
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error forming foreign exchange dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
LABEL_8:

  return v6;
}

- (BOOL)isValid
{
  return self->_destinationCurrencyAmount != 0;
}

- (PKPaymentTransactionForeignExchangeInformation)initWithCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  v5 = [v4 firstObject];

  v6 = objc_msgSend(v5, "pk_encryptedDictionaryForKey:", @"foreignExchangeInformation");
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaymentTransactionForeignExchangeInformation;
    v7 = [(PKPaymentTransactionForeignExchangeInformation *)&v18 init];
    if (v7)
    {
      id v8 = [v6 objectForKey:@"destinationCurrencyCode"];
      v9 = [v6 PKDecimalNumberFromStringForKey:@"destinationAmount"];
      if (v9)
      {
        id v10 = [MEMORY[0x1E4F28C28] notANumber];
        char v11 = [v9 isEqualToNumber:v10];

        if ((v11 & 1) == 0)
        {
          if (v8)
          {
            v12 = [[PKCurrencyAmount alloc] initWithAmount:v9 currency:v8 exponent:0];
            destinationCurrencyAmount = v7->_destinationCurrencyAmount;
            v7->_destinationCurrencyAmount = v12;
          }
        }
      }
      uint64_t v14 = [v6 PKDecimalNumberFromStringForKey:@"exchangeRate"];
      exchangeRate = v7->_exchangeRate;
      v7->_exchangeRate = (NSDecimalNumber *)v14;
    }
    if (![(PKPaymentTransactionForeignExchangeInformation *)v7 isValid])
    {

      v7 = 0;
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  id v15 = [v4 firstObject];

  v5 = objc_msgSend(v15, "pk_encryptedDictionaryForKey:", @"foreignExchangeInformation");
  if (v15) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7 = [v5 objectForKey:@"destinationCurrencyCode"];
    id v8 = [v5 PKDecimalNumberFromStringForKey:@"destinationAmount"];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F28C28] notANumber];
      char v10 = [v8 isEqualToNumber:v9];

      if ((v10 & 1) == 0)
      {
        if (v7)
        {
          char v11 = [[PKCurrencyAmount alloc] initWithAmount:v8 currency:v7 exponent:0];
          destinationCurrencyAmount = self->_destinationCurrencyAmount;
          self->_destinationCurrencyAmount = v11;
        }
      }
    }
    v13 = [v5 PKDecimalNumberFromStringForKey:@"exchangeRate"];
    exchangeRate = self->_exchangeRate;
    self->_exchangeRate = v13;
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if (a4 - 1 <= 1) {
    [(PKPaymentTransactionForeignExchangeInformation *)self _encodeServerDataWithCloudStoreCoder:a3];
  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  id v7 = [v4 firstObject];

  v5 = [v7 encryptedValues];
  BOOL v6 = [(PKPaymentTransactionForeignExchangeInformation *)self jsonString];
  [v5 setObject:v6 forKey:@"foreignExchangeInformation"];
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionForeignExchangeInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTransactionForeignExchangeInformation;
  v5 = [(PKPaymentTransactionForeignExchangeInformation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationCurrencyAmount"];
    destinationCurrencyAmount = v5->_destinationCurrencyAmount;
    v5->_destinationCurrencyAmount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exchangeRate"];
    exchangeRate = v5->_exchangeRate;
    v5->_exchangeRate = (NSDecimalNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  destinationCurrencyAmount = self->_destinationCurrencyAmount;
  id v5 = a3;
  [v5 encodeObject:destinationCurrencyAmount forKey:@"destinationCurrencyAmount"];
  [v5 encodeObject:self->_exchangeRate forKey:@"exchangeRate"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_destinationCurrencyAmount];
  [v3 safelyAddObject:self->_exchangeRate];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentTransactionForeignExchangeInformation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionForeignExchangeInformation *)self isEqualToForeignExchangeInformation:v5];

  return v6;
}

- (BOOL)isEqualToForeignExchangeInformation:(id)a3
{
  unint64_t v4 = a3;
  destinationCurrencyAmount = self->_destinationCurrencyAmount;
  BOOL v6 = (PKCurrencyAmount *)v4[1];
  if (destinationCurrencyAmount) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PKCurrencyAmount isEqual:](destinationCurrencyAmount, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    char v8 = 0;
    goto LABEL_13;
  }
  if (destinationCurrencyAmount != v6) {
    goto LABEL_7;
  }
LABEL_9:
  exchangeRate = self->_exchangeRate;
  char v10 = (NSDecimalNumber *)v4[2];
  if (exchangeRate && v10) {
    char v8 = -[NSDecimalNumber isEqual:](exchangeRate, "isEqual:");
  }
  else {
    char v8 = exchangeRate == v10;
  }
LABEL_13:

  return v8;
}

- (PKCurrencyAmount)destinationCurrencyAmount
{
  return self->_destinationCurrencyAmount;
}

- (void)setDestinationCurrencyAmount:(id)a3
{
}

- (NSDecimalNumber)exchangeRate
{
  return self->_exchangeRate;
}

- (void)setExchangeRate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchangeRate, 0);
  objc_storeStrong((id *)&self->_destinationCurrencyAmount, 0);
}

- (id)fkForeignAmount
{
  v3 = [(PKPaymentTransactionForeignExchangeInformation *)self destinationCurrencyAmount];

  if (v3)
  {
    id v4 = objc_alloc((Class)getFKAmountClass[0]());
    id v5 = [(PKPaymentTransactionForeignExchangeInformation *)self destinationCurrencyAmount];
    BOOL v6 = [v5 amount];
    BOOL v7 = objc_msgSend(v6, "pk_absoluteValue");
    char v8 = [(PKPaymentTransactionForeignExchangeInformation *)self destinationCurrencyAmount];
    v9 = [v8 currency];
    char v10 = (void *)[v4 initWithDecimalNumber:v7 currency:v9];
  }
  else
  {
    char v10 = 0;
  }
  return v10;
}

@end