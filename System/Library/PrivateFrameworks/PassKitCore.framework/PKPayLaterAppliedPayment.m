@interface PKPayLaterAppliedPayment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterAppliedPayment:(id)a3;
- (NSString)paymentIdentifier;
- (PKCurrencyAmount)amountApplied;
- (PKPayLaterAppliedPayment)initWithCoder:(id)a3;
- (PKPayLaterAppliedPayment)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountApplied:(id)a3;
- (void)setPaymentIdentifier:(id)a3;
@end

@implementation PKPayLaterAppliedPayment

- (PKPayLaterAppliedPayment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterAppliedPayment;
  v5 = [(PKPayLaterAppliedPayment *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"paymentIdentifier"];
    paymentIdentifier = v5->_paymentIdentifier;
    v5->_paymentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 PKCurrencyAmountForKey:@"amountApplied"];
    amountApplied = v5->_amountApplied;
    v5->_amountApplied = (PKCurrencyAmount *)v8;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_paymentIdentifier forKeyedSubscript:@"paymentIdentifier"];
  id v4 = [(PKCurrencyAmount *)self->_amountApplied dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"amountApplied"];

  v5 = (void *)[v3 copy];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterAppliedPayment *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterAppliedPayment *)self isEqualToPayLaterAppliedPayment:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterAppliedPayment:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_paymentIdentifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_12:
      BOOL v13 = 0;
      goto LABEL_14;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_12;
    }
  }
  amountApplied = self->_amountApplied;
  v12 = (PKCurrencyAmount *)v5[2];
  if (amountApplied && v12) {
    BOOL v13 = -[PKCurrencyAmount isEqual:](amountApplied, "isEqual:");
  }
  else {
    BOOL v13 = amountApplied == v12;
  }
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_paymentIdentifier];
  [v3 safelyAddObject:self->_amountApplied];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"paymentIdentifier: '%@'; ", self->_paymentIdentifier];
  [v3 appendFormat:@"amountApplied: '%@'; ", self->_amountApplied];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAppliedPayment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterAppliedPayment;
  v5 = [(PKPayLaterAppliedPayment *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentIdentifier"];
    paymentIdentifier = v5->_paymentIdentifier;
    v5->_paymentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountApplied"];
    amountApplied = v5->_amountApplied;
    v5->_amountApplied = (PKCurrencyAmount *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentIdentifier = self->_paymentIdentifier;
  id v5 = a3;
  [v5 encodeObject:paymentIdentifier forKey:@"paymentIdentifier"];
  [v5 encodeObject:self->_amountApplied forKey:@"amountApplied"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterAppliedPayment allocWithZone:](PKPayLaterAppliedPayment, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_paymentIdentifier copyWithZone:a3];
  paymentIdentifier = v5->_paymentIdentifier;
  v5->_paymentIdentifier = (NSString *)v6;

  uint64_t v8 = [(PKCurrencyAmount *)self->_amountApplied copyWithZone:a3];
  amountApplied = v5->_amountApplied;
  v5->_amountApplied = v8;

  return v5;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
}

- (PKCurrencyAmount)amountApplied
{
  return self->_amountApplied;
}

- (void)setAmountApplied:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountApplied, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end