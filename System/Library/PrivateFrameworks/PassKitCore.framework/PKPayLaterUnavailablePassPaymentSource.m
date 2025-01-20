@interface PKPayLaterUnavailablePassPaymentSource
+ (BOOL)supportsSecureCoding;
- (PKPayLaterFinancingPlanFundingSource)fundingSource;
- (PKPayLaterUnavailablePassPaymentSource)initWithCoder:(id)a3;
- (PKPayLaterUnavailablePassPaymentSource)initWithFundingSource:(id)a3;
- (id)identifier;
- (id)name;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterUnavailablePassPaymentSource

- (PKPayLaterUnavailablePassPaymentSource)initWithFundingSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterUnavailablePassPaymentSource;
  v6 = [(PKPayLaterPaymentSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fundingSource, a3);
  }

  return v7;
}

- (unint64_t)type
{
  return 3;
}

- (id)identifier
{
  return [(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource identifier];
}

- (id)name
{
  return [(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource displayName];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterUnavailablePassPaymentSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterUnavailablePassPaymentSource;
  id v5 = [(PKPayLaterPaymentSource *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSource"];
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKPayLaterFinancingPlanFundingSource *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterUnavailablePassPaymentSource;
  id v4 = a3;
  [(PKPayLaterPaymentSource *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fundingSource, @"fundingSource", v5.receiver, v5.super_class);
}

- (PKPayLaterFinancingPlanFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void).cxx_destruct
{
}

@end