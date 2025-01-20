@interface PKPayLaterPassPaymentSource
+ (BOOL)supportsSecureCoding;
- (PKPayLaterPassPaymentSource)initWithCoder:(id)a3;
- (PKPayLaterPassPaymentSource)initWithPaymentPass:(id)a3 paymentApplication:(id)a4;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentPass)paymentPass;
- (id)identifier;
- (id)name;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterPassPaymentSource

- (PKPayLaterPassPaymentSource)initWithPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterPassPaymentSource;
  v9 = [(PKPayLaterPaymentSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v10->_paymentApplication, a4);
  }

  return v10;
}

- (unint64_t)type
{
  return 1;
}

- (id)identifier
{
  return [(PKObject *)self->_paymentPass uniqueID];
}

- (id)name
{
  return [(PKPass *)self->_paymentPass organizationName];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPassPaymentSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterPassPaymentSource;
  v5 = [(PKPayLaterPaymentSource *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentPass"];
    paymentPass = v5->_paymentPass;
    v5->_paymentPass = (PKPaymentPass *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentApplication"];
    paymentApplication = v5->_paymentApplication;
    v5->_paymentApplication = (PKPaymentApplication *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPassPaymentSource;
  id v4 = a3;
  [(PKPayLaterPaymentSource *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentPass, @"paymentPass", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_paymentApplication forKey:@"paymentApplication"];
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end