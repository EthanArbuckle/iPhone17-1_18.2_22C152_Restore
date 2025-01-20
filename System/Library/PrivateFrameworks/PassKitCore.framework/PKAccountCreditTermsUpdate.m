@interface PKAccountCreditTermsUpdate
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSString)adverseActionContentIdentifier;
- (NSString)description;
- (NSString)requestIdentifier;
- (PKAccountCreditTermsUpdate)initWithCoder:(id)a3;
- (PKAccountCreditTermsUpdate)initWithRecord:(id)a3;
- (PKCreditAccountRates)rates;
- (PKCurrencyAmount)creditLimit;
- (int64_t)initiator;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setAdverseActionContentIdentifier:(id)a3;
- (void)setCreditLimit:(id)a3;
- (void)setInitiator:(int64_t)a3;
- (void)setRates:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKAccountCreditTermsUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountCreditTermsUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountCreditTermsUpdate;
  v5 = [(PKAccountCreditTermsUpdate *)&v15 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_initiator = [v4 decodeIntegerForKey:@"initiator"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adverseActionContentIdentifier"];
    adverseActionContentIdentifier = v5->_adverseActionContentIdentifier;
    v5->_adverseActionContentIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditLimit"];
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rates"];
    rates = v5->_rates;
    v5->_rates = (PKCreditAccountRates *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_initiator forKey:@"initiator"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeObject:self->_adverseActionContentIdentifier forKey:@"adverseActionContentIdentifier"];
  [v5 encodeObject:self->_creditLimit forKey:@"creditLimit"];
  [v5 encodeObject:self->_rates forKey:@"rates"];
}

- (PKAccountCreditTermsUpdate)initWithRecord:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKAccountCreditTermsUpdate;
  id v5 = [(PKAccountCreditTermsUpdate *)&v41 init];
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"creditLimit");
    v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v6 && v7)
    {
      uint64_t v9 = PKCurrencyAmountCreate(v7, v6, 0);
      creditLimit = v5->_creditLimit;
      v5->_creditLimit = (PKCurrencyAmount *)v9;
    }
    v11 = objc_msgSend(v4, "pk_encryptedDictionaryForKey:", @"rates");
    uint64_t v12 = [[PKCreditAccountRates alloc] initWithDictionary:v11];
    rates = v5->_rates;
    v5->_rates = v12;

    uint64_t v14 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"requestIdentifier");
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"adverseActionContentIdentifier");
    adverseActionContentIdentifier = v5->_adverseActionContentIdentifier;
    v5->_adverseActionContentIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"initiator");
    v19 = [v18 lowercaseString];
    v20 = v19;
    if (v19 == @"system") {
      goto LABEL_8;
    }
    if (!v19) {
      goto LABEL_12;
    }
    char v21 = [(__CFString *)v19 isEqualToString:@"system"];

    if (v21)
    {
LABEL_8:
      uint64_t v22 = 1;
      goto LABEL_13;
    }
    v23 = v20;
    if (v23 == @"customer"
      || (v24 = v23,
          int v25 = [(__CFString *)v23 isEqualToString:@"customer"],
          v24,
          v25))
    {
      uint64_t v22 = 2;
    }
    else
    {
LABEL_12:
      uint64_t v22 = 0;
    }
LABEL_13:

    v5->_initiator = v22;
    v26 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"type");
    v27 = [v26 lowercaseString];
    v28 = v27;
    if (v27 != @"creditlimitincreased")
    {
      if (v27)
      {
        char v29 = [(__CFString *)v27 isEqualToString:@"creditlimitincreased"];

        if (v29) {
          goto LABEL_16;
        }
        v31 = v28;
        if (v31 == @"creditlimitdecreased"
          || (v32 = v31,
              char v33 = [(__CFString *)v31 isEqualToString:@"creditlimitdecreased"],
              v32,
              (v33 & 1) != 0))
        {
          uint64_t v30 = 2;
          goto LABEL_27;
        }
        v34 = v32;
        if (v34 == @"creditlimitincreaserequest"
          || (v35 = v34,
              char v36 = [(__CFString *)v34 isEqualToString:@"creditlimitincreaserequest"],
              v35,
              (v36 & 1) != 0))
        {
          uint64_t v30 = 3;
          goto LABEL_27;
        }
        v37 = v35;
        if (v37 == @"creditlimitdecreaserequest"
          || (v38 = v37,
              int v39 = [(__CFString *)v37 isEqualToString:@"creditlimitdecreaserequest"],
              v38,
              v39))
        {
          uint64_t v30 = 4;
          goto LABEL_27;
        }
      }
      uint64_t v30 = 0;
      goto LABEL_27;
    }
LABEL_16:
    uint64_t v30 = 1;
LABEL_27:

    v5->_int64_t type = v30;
  }

  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v12 = [a3 encryptedValues];
  id v4 = [(PKCurrencyAmount *)self->_creditLimit currency];
  [v12 setObject:v4 forKey:@"currencyCode"];

  id v5 = [(PKCurrencyAmount *)self->_creditLimit amount];
  uint64_t v6 = [v5 stringValue];
  [v12 setObject:v6 forKey:@"creditLimit"];

  v7 = [(PKCreditAccountRates *)self->_rates jsonString];
  [v12 setObject:v7 forKey:@"rates"];

  [v12 setObject:self->_requestIdentifier forKey:@"requestIdentifier"];
  [v12 setObject:self->_adverseActionContentIdentifier forKey:@"adverseActionContentIdentifier"];
  unint64_t initiator = self->_initiator;
  if (initiator > 2) {
    uint64_t v9 = @"unknown";
  }
  else {
    uint64_t v9 = off_1E56DC910[initiator];
  }
  [v12 setObject:v9 forKey:@"initiator"];
  unint64_t type = self->_type;
  if (type > 4) {
    v11 = @"unknown";
  }
  else {
    v11 = off_1E56DC8E8[type];
  }
  [v12 setObject:v11 forKey:@"type"];
}

+ (id)recordType
{
  return @"CreditTermsUpdate";
}

+ (id)recordNamePrefix
{
  return @"rewards-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  creditLimit = self->_creditLimit;
  uint64_t v6 = (PKCurrencyAmount *)v4[5];
  if (creditLimit && v6)
  {
    if (!-[PKCurrencyAmount isEqual:](creditLimit, "isEqual:")) {
      goto LABEL_24;
    }
  }
  else if (creditLimit != v6)
  {
    goto LABEL_24;
  }
  rates = self->_rates;
  uint64_t v8 = (PKCreditAccountRates *)v4[6];
  if (rates && v8)
  {
    if (!-[PKCreditAccountRates isEqual:](rates, "isEqual:")) {
      goto LABEL_24;
    }
  }
  else if (rates != v8)
  {
    goto LABEL_24;
  }
  requestIdentifier = self->_requestIdentifier;
  uint64_t v10 = (NSString *)v4[3];
  if (requestIdentifier && v10)
  {
    if ((-[NSString isEqual:](requestIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (requestIdentifier != v10)
  {
    goto LABEL_24;
  }
  adverseActionContentIdentifier = self->_adverseActionContentIdentifier;
  id v12 = (NSString *)v4[4];
  if (!adverseActionContentIdentifier || !v12)
  {
    if (adverseActionContentIdentifier == v12) {
      goto LABEL_22;
    }
LABEL_24:
    BOOL v13 = 0;
    goto LABEL_25;
  }
  if ((-[NSString isEqual:](adverseActionContentIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  if (self->_type != v4[1]) {
    goto LABEL_24;
  }
  BOOL v13 = self->_initiator == v4[2];
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_creditLimit];
  [v3 safelyAddObject:self->_requestIdentifier];
  [v3 safelyAddObject:self->_adverseActionContentIdentifier];
  [v3 safelyAddObject:self->_rates];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_initiator - v5 + 32 * v5;

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t type = self->_type;
  if (type > 4) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56DC8E8[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  unint64_t initiator = self->_initiator;
  if (initiator > 2) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = off_1E56DC910[initiator];
  }
  [v4 appendFormat:@"initiator: '%@'; ", v8];
  [v4 appendFormat:@"creditLimit: '%@'; ", self->_creditLimit];
  [v4 appendFormat:@"requestIdentifier: '%@'; ", self->_requestIdentifier];
  [v4 appendFormat:@"adverseIdentifier: '%@'; ", self->_adverseActionContentIdentifier];
  [v4 appendFormat:@"rates: '%@'; ", self->_rates];
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (int64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(int64_t)a3
{
  self->_unint64_t initiator = a3;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)adverseActionContentIdentifier
{
  return self->_adverseActionContentIdentifier;
}

- (void)setAdverseActionContentIdentifier:(id)a3
{
}

- (PKCurrencyAmount)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
}

- (PKCreditAccountRates)rates
{
  return self->_rates;
}

- (void)setRates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rates, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_adverseActionContentIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end