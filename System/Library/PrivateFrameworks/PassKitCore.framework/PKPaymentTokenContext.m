@interface PKPaymentTokenContext
+ (BOOL)supportsSecureCoding;
+ (PKPaymentTokenContext)contextWithProtobuf:(id)a3;
+ (int64_t)version;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentTokenContext:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)externalIdentifier;
- (NSString)merchantDomain;
- (NSString)merchantIdentifier;
- (NSString)merchantName;
- (PKPaymentTokenContext)initWithCoder:(id)a3;
- (PKPaymentTokenContext)initWithDictionary:(id)a3 error:(id *)a4;
- (PKPaymentTokenContext)initWithMerchantIdentifier:(NSString *)merchantIdentifier externalIdentifier:(NSString *)externalIdentifier merchantName:(NSString *)merchantName merchantDomain:(NSString *)merchantDomain amount:(NSDecimalNumber *)amount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(NSDecimalNumber *)amount;
- (void)setExternalIdentifier:(NSString *)externalIdentifier;
- (void)setMerchantDomain:(NSString *)merchantDomain;
- (void)setMerchantIdentifier:(NSString *)merchantIdentifier;
- (void)setMerchantName:(NSString *)merchantName;
@end

@implementation PKPaymentTokenContext

+ (PKPaymentTokenContext)contextWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentTokenContext);
  v5 = [v3 merchantIdentifier];
  [(PKPaymentTokenContext *)v4 setMerchantIdentifier:v5];

  v6 = [v3 externalIdentifier];
  [(PKPaymentTokenContext *)v4 setExternalIdentifier:v6];

  v7 = [v3 merchantName];
  [(PKPaymentTokenContext *)v4 setMerchantName:v7];

  v8 = [v3 merchantDomain];
  [(PKPaymentTokenContext *)v4 setMerchantDomain:v8];

  if ([v3 hasDecimalAmount])
  {
    v9 = [v3 decimalAmount];
    uint64_t v10 = PKProtoSupportDecimalNumberFromProtobuf(v9);
LABEL_5:
    v11 = (void *)v10;
    [(PKPaymentTokenContext *)v4 setAmount:v10];

    goto LABEL_7;
  }
  if ([v3 hasCustomPrecisionAmount])
  {
    v9 = [v3 customPrecisionAmount];
    uint64_t v10 = PKLegacyCurrencyStorageIntegerToDecimal([v9 amount], 1);
    goto LABEL_5;
  }
  v9 = PKLegacyCurrencyStorageIntegerToDecimal([v3 amount], 0);
  [(PKPaymentTokenContext *)v4 setAmount:v9];
LABEL_7:

  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentTokenContext);
  v4 = [(PKPaymentTokenContext *)self merchantIdentifier];
  [(PKProtobufPaymentTokenContext *)v3 setMerchantIdentifier:v4];

  v5 = [(PKPaymentTokenContext *)self externalIdentifier];
  [(PKProtobufPaymentTokenContext *)v3 setExternalIdentifier:v5];

  v6 = [(PKPaymentTokenContext *)self merchantName];
  [(PKProtobufPaymentTokenContext *)v3 setMerchantName:v6];

  v7 = [(PKPaymentTokenContext *)self merchantDomain];
  [(PKProtobufPaymentTokenContext *)v3 setMerchantDomain:v7];

  v8 = [(PKPaymentTokenContext *)self amount];
  [(PKProtobufPaymentTokenContext *)v3 setAmount:PKCurrencyDecimalToLegacyStorageInteger(v8, 0)];

  v9 = [(PKPaymentTokenContext *)self amount];
  uint64_t v10 = DecimalToCustomPrecisionProtobuf(v9);
  [(PKProtobufPaymentTokenContext *)v3 setCustomPrecisionAmount:v10];

  v11 = [(PKPaymentTokenContext *)self amount];
  v12 = PKProtoSupportProtoDecimalNumberFromDecimalNumber(v11);
  [(PKProtobufPaymentTokenContext *)v3 setDecimalAmount:v12];

  return v3;
}

- (PKPaymentTokenContext)initWithMerchantIdentifier:(NSString *)merchantIdentifier externalIdentifier:(NSString *)externalIdentifier merchantName:(NSString *)merchantName merchantDomain:(NSString *)merchantDomain amount:(NSDecimalNumber *)amount
{
  v12 = merchantIdentifier;
  v13 = externalIdentifier;
  v14 = merchantName;
  v15 = merchantDomain;
  v16 = amount;
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentTokenContext;
  v17 = [(PKPaymentTokenContext *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [(NSString *)v12 copy];
    v19 = v17->_merchantIdentifier;
    v17->_merchantIdentifier = (NSString *)v18;

    uint64_t v20 = [(NSString *)v13 copy];
    v21 = v17->_externalIdentifier;
    v17->_externalIdentifier = (NSString *)v20;

    uint64_t v22 = [(NSString *)v14 copy];
    v23 = v17->_merchantName;
    v17->_merchantName = (NSString *)v22;

    uint64_t v24 = [(NSString *)v15 copy];
    v25 = v17->_merchantDomain;
    v17->_merchantDomain = (NSString *)v24;

    uint64_t v26 = [(NSDecimalNumber *)v16 copy];
    v27 = v17->_amount;
    v17->_amount = (NSDecimalNumber *)v26;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPaymentTokenContext *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTokenContext *)self isEqualToPaymentTokenContext:v5];

  return v6;
}

- (BOOL)isEqualToPaymentTokenContext:(id)a3
{
  v4 = a3;
  merchantIdentifier = self->_merchantIdentifier;
  BOOL v6 = (NSString *)v4[1];
  if (merchantIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (merchantIdentifier != v6) {
      goto LABEL_26;
    }
  }
  else if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  externalIdentifier = self->_externalIdentifier;
  v9 = (NSString *)v4[2];
  if (externalIdentifier && v9)
  {
    if ((-[NSString isEqual:](externalIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (externalIdentifier != v9)
  {
    goto LABEL_26;
  }
  merchantName = self->_merchantName;
  v11 = (NSString *)v4[3];
  if (merchantName && v11)
  {
    if ((-[NSString isEqual:](merchantName, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (merchantName != v11)
  {
    goto LABEL_26;
  }
  merchantDomain = self->_merchantDomain;
  v13 = (NSString *)v4[4];
  if (!merchantDomain || !v13)
  {
    if (merchantDomain == v13) {
      goto LABEL_22;
    }
LABEL_26:
    char v16 = 0;
    goto LABEL_27;
  }
  if ((-[NSString isEqual:](merchantDomain, "isEqual:") & 1) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  amount = self->_amount;
  v15 = (NSDecimalNumber *)v4[5];
  if (amount && v15) {
    char v16 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
  }
  else {
    char v16 = amount == v15;
  }
LABEL_27:

  return v16;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_externalIdentifier];
  [v3 safelyAddObject:self->_merchantName];
  [v3 safelyAddObject:self->_merchantDomain];
  [v3 safelyAddObject:self->_amount];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  BOOL v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_externalIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_merchantName copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_merchantDomain copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"merchantIdentifier: %@, ", self->_merchantIdentifier];
  [v3 appendFormat:@"externalIdentifier: %@, ", self->_externalIdentifier];
  [v3 appendFormat:@"merchantName: %@, ", self->_merchantName];
  if (self->_merchantDomain) {
    [v3 appendFormat:@"merchantDomain: %@, ", self->_merchantDomain];
  }
  [v3 appendFormat:@"amount: %@, ", self->_amount];
  [v3 appendFormat:@">"];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTokenContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTokenContext;
  v5 = [(PKPaymentTokenContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantName"];
    merchantName = v5->_merchantName;
    v5->_merchantName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantDomain"];
    merchantDomain = v5->_merchantDomain;
    v5->_merchantDomain = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  merchantIdentifier = self->_merchantIdentifier;
  id v5 = a3;
  [v5 encodeObject:merchantIdentifier forKey:@"merchantIdentifier"];
  [v5 encodeObject:self->_externalIdentifier forKey:@"externalIdentifier"];
  [v5 encodeObject:self->_merchantName forKey:@"merchantName"];
  [v5 encodeObject:self->_merchantDomain forKey:@"merchantDomain"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
}

+ (int64_t)version
{
  return 4;
}

- (PKPaymentTokenContext)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentTokenContext;
  uint64_t v6 = [(PKPaymentTokenContext *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 PKStringForKey:@"merchantIdentifier"];
    merchantIdentifier = v6->_merchantIdentifier;
    v6->_merchantIdentifier = (NSString *)v7;

    uint64_t v9 = [v5 PKStringForKey:@"externalIdentifier"];
    externalIdentifier = v6->_externalIdentifier;
    v6->_externalIdentifier = (NSString *)v9;

    uint64_t v11 = [v5 PKStringForKey:@"merchantName"];
    merchantName = v6->_merchantName;
    v6->_merchantName = (NSString *)v11;

    uint64_t v13 = [v5 PKStringForKey:@"merchantDomain"];
    merchantDomain = v6->_merchantDomain;
    v6->_merchantDomain = (NSString *)v13;

    uint64_t v15 = [v5 PKDecimalNumberFromStringForKey:@"amount"];
    amount = v6->_amount;
    v6->_amount = (NSDecimalNumber *)v15;
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_merchantIdentifier forKeyedSubscript:@"merchantIdentifier"];
  [v3 setObject:self->_externalIdentifier forKeyedSubscript:@"externalIdentifier"];
  [v3 setObject:self->_merchantName forKeyedSubscript:@"merchantName"];
  [v3 setObject:self->_merchantDomain forKeyedSubscript:@"merchantDomain"];
  [v3 setObject:self->_amount forKeyedSubscript:@"amount"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(NSString *)externalIdentifier
{
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(NSString *)merchantName
{
}

- (NSString)merchantDomain
{
  return self->_merchantDomain;
}

- (void)setMerchantDomain:(NSString *)merchantDomain
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(NSDecimalNumber *)amount
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_merchantDomain, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end