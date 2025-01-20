@interface PKPayLaterBankPaymentSource
+ (BOOL)supportsSecureCoding;
- (PKAccountPaymentFundingSource)accountPaymentFundingSource;
- (PKPayLaterBankPaymentSource)initWithAccountPaymentFundingSource:(id)a3;
- (PKPayLaterBankPaymentSource)initWithCoder:(id)a3;
- (id)identifier;
- (id)name;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterBankPaymentSource

- (PKPayLaterBankPaymentSource)initWithAccountPaymentFundingSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterBankPaymentSource;
  v6 = [(PKPayLaterPaymentSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountPaymentFundingSource, a3);
  }

  return v7;
}

- (unint64_t)type
{
  return 2;
}

- (id)identifier
{
  return [(PKAccountPaymentFundingSource *)self->_accountPaymentFundingSource identifier];
}

- (id)name
{
  if (([(PKAccountPaymentFundingSource *)self->_accountPaymentFundingSource type] | 4) == 5)
  {
    v3 = [(PKAccountPaymentFundingSource *)self->_accountPaymentFundingSource fundingDetails];
    v4 = [v3 name];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPayLaterBankPaymentSource;
    v4 = [(PKPayLaterPaymentSource *)&v6 name];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterBankPaymentSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterBankPaymentSource;
  id v5 = [(PKPayLaterPaymentSource *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountPaymentFundingSource"];
    accountPaymentFundingSource = v5->_accountPaymentFundingSource;
    v5->_accountPaymentFundingSource = (PKAccountPaymentFundingSource *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterBankPaymentSource;
  id v4 = a3;
  [(PKPayLaterPaymentSource *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountPaymentFundingSource, @"accountPaymentFundingSource", v5.receiver, v5.super_class);
}

- (PKAccountPaymentFundingSource)accountPaymentFundingSource
{
  return self->_accountPaymentFundingSource;
}

- (void).cxx_destruct
{
}

@end