@interface PKPassBalance
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (PKAutoReloadPaymentMethod)paymentMethod;
- (PKPassBalance)initWithCoder:(id)a3;
- (PKPassBalance)initWithDictionary:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPaymentMethod:(id)a3;
@end

@implementation PKPassBalance

- (PKPassBalance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassBalance;
  v5 = [(PKPassBalance *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKDictionaryForKey:@"paymentMethodMetadata"];
    if (v8)
    {
      v9 = [[PKAutoReloadPaymentMethod alloc] initWithDictionary:v8];
      paymentMethod = v5->_paymentMethod;
      v5->_paymentMethod = v9;
    }
  }

  return v5;
}

- (PKPassBalance)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassBalance;
  v5 = [(PKPassBalance *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethod"];
    paymentMethod = v5->_paymentMethod;
    v5->_paymentMethod = (PKAutoReloadPaymentMethod *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_paymentMethod forKey:@"paymentMethod"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: %@; ", self->_identifier];
  [v3 appendFormat:@"paymentMethod: %@; ", self->_paymentMethod];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PKAutoReloadPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end