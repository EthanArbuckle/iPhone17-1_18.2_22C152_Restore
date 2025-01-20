@interface PDSafariCredentialEligibilityCredentialPassPair
- (PDSafariCredentialEligibilityCredentialPassPair)initWithCredential:(id)a3 paymentPass:(id)a4;
- (PKPaymentPass)paymentPass;
- (PKPaymentSafariCredential)credential;
- (void)setCredential:(id)a3;
- (void)setPaymentPass:(id)a3;
@end

@implementation PDSafariCredentialEligibilityCredentialPassPair

- (PDSafariCredentialEligibilityCredentialPassPair)initWithCredential:(id)a3 paymentPass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDSafariCredentialEligibilityCredentialPassPair;
  v9 = [(PDSafariCredentialEligibilityCredentialPassPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credential, a3);
    objc_storeStrong((id *)&v10->_paymentPass, a4);
  }

  return v10;
}

- (PKPaymentSafariCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end