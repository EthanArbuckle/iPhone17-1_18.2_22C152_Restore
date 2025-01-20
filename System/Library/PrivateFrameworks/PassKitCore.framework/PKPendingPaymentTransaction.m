@interface PKPendingPaymentTransaction
- (PKPaymentApplication)paymentApplication;
- (PKPaymentPass)pass;
- (PKPaymentTransaction)transaction;
- (PKPendingPaymentTransaction)initWithTransaction:(id)a3 pass:(id)a4 paymentApplication:(id)a5;
- (void)setPass:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKPendingPaymentTransaction

- (PKPendingPaymentTransaction)initWithTransaction:(id)a3 pass:(id)a4 paymentApplication:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPendingPaymentTransaction;
  v12 = [(PKPendingPaymentTransaction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transaction, a3);
    objc_storeStrong((id *)&v13->_pass, a4);
    objc_storeStrong((id *)&v13->_paymentApplication, a5);
  }

  return v13;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end