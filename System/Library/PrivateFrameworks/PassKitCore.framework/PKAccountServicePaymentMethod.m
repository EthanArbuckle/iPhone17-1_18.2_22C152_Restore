@interface PKAccountServicePaymentMethod
+ (BOOL)supportsSecureCoding;
- (BOOL)deviceSupportsPeerPaymentAccountPayment;
- (PKAccountServicePaymentMethod)initWithBankAccountInformation:(id)a3 peerPaymentBalance:(id)a4 deviceSupportsPeerPaymentAccountPayment:(BOOL)a5 selectedMethods:(unint64_t)a6;
- (PKAccountServicePaymentMethod)initWithCoder:(id)a3;
- (PKBankAccountInformation)bankAccountInformation;
- (PKCurrencyAmount)peerPaymentBalance;
- (unint64_t)selectedMethods;
- (void)encodeWithCoder:(id)a3;
- (void)setBankAccountInformation:(id)a3;
- (void)setDeviceSupportsPeerPaymentAccountPayment:(BOOL)a3;
- (void)setPeerPaymentBalance:(id)a3;
- (void)setSelectedMethods:(unint64_t)a3;
@end

@implementation PKAccountServicePaymentMethod

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePaymentMethod)initWithBankAccountInformation:(id)a3 peerPaymentBalance:(id)a4 deviceSupportsPeerPaymentAccountPayment:(BOOL)a5 selectedMethods:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountServicePaymentMethod;
  v12 = [(PKAccountServicePaymentMethod *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(PKAccountServicePaymentMethod *)v12 setBankAccountInformation:v10];
    [(PKAccountServicePaymentMethod *)v13 setPeerPaymentBalance:v11];
    [(PKAccountServicePaymentMethod *)v13 setDeviceSupportsPeerPaymentAccountPayment:v7];
    [(PKAccountServicePaymentMethod *)v13 setSelectedMethods:a6];
  }

  return v13;
}

- (PKAccountServicePaymentMethod)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountServicePaymentMethod;
  v5 = [(PKAccountServicePaymentMethod *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankAccountInformation"];
    bankAccountInformation = v5->_bankAccountInformation;
    v5->_bankAccountInformation = (PKBankAccountInformation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentBalance"];
    peerPaymentBalance = v5->_peerPaymentBalance;
    v5->_peerPaymentBalance = (PKCurrencyAmount *)v8;

    v5->_deviceSupportsPeerPaymentAccountPayment = [v4 decodeBoolForKey:@"deviceSupportsPeerPaymentAccountPayment"];
    v5->_selectedMethods = [v4 decodeIntegerForKey:@"selectedMethod"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(PKAccountServicePaymentMethod *)self bankAccountInformation];
  [v6 encodeObject:v4 forKey:@"bankAccountInformation"];

  v5 = [(PKAccountServicePaymentMethod *)self peerPaymentBalance];
  [v6 encodeObject:v5 forKey:@"peerPaymentBalance"];

  objc_msgSend(v6, "encodeBool:forKey:", -[PKAccountServicePaymentMethod deviceSupportsPeerPaymentAccountPayment](self, "deviceSupportsPeerPaymentAccountPayment"), @"deviceSupportsPeerPaymentAccountPayment");
  objc_msgSend(v6, "encodeInteger:forKey:", -[PKAccountServicePaymentMethod selectedMethods](self, "selectedMethods"), @"selectedMethod");
}

- (PKBankAccountInformation)bankAccountInformation
{
  return self->_bankAccountInformation;
}

- (void)setBankAccountInformation:(id)a3
{
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
}

- (BOOL)deviceSupportsPeerPaymentAccountPayment
{
  return self->_deviceSupportsPeerPaymentAccountPayment;
}

- (void)setDeviceSupportsPeerPaymentAccountPayment:(BOOL)a3
{
  self->_deviceSupportsPeerPaymentAccountPayment = a3;
}

- (unint64_t)selectedMethods
{
  return self->_selectedMethods;
}

- (void)setSelectedMethods:(unint64_t)a3
{
  self->_selectedMethods = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
  objc_storeStrong((id *)&self->_bankAccountInformation, 0);
}

@end