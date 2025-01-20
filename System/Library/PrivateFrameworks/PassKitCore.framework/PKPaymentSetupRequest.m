@interface PKPaymentSetupRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)paymentSetupFeatures;
- (PKPaymentSetupConfiguration)configuration;
- (PKPaymentSetupRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setPaymentSetupFeatures:(id)a3;
@end

@implementation PKPaymentSetupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupRequest;
  v5 = [(PKPaymentSetupRequest *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (PKPaymentSetupConfiguration *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"paymentSetupFeatures"];
    paymentSetupFeatures = v5->_paymentSetupFeatures;
    v5->_paymentSetupFeatures = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  [v5 encodeObject:configuration forKey:@"configuration"];
  [v5 encodeObject:self->_paymentSetupFeatures forKey:@"paymentSetupFeatures"];
}

- (PKPaymentSetupConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)paymentSetupFeatures
{
  return self->_paymentSetupFeatures;
}

- (void)setPaymentSetupFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSetupFeatures, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end