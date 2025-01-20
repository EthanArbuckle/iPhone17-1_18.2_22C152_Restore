@interface PKPeerPaymentAccountResolutionControllerConfiguration
- (BOOL)isGraduation;
- (NSString)senderAddress;
- (PKCurrencyAmount)currencyAmount;
- (id)description;
- (int64_t)verificationContext;
- (unint64_t)paymentMode;
- (unint64_t)registrationFlowState;
- (void)setCurrencyAmount:(id)a3;
- (void)setGraduation:(BOOL)a3;
- (void)setPaymentMode:(unint64_t)a3;
- (void)setRegistrationFlowState:(unint64_t)a3;
- (void)setSenderAddress:(id)a3;
- (void)setVerificationContext:(int64_t)a3;
@end

@implementation PKPeerPaymentAccountResolutionControllerConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  v4 = PKPeerPaymentRegistrationFlowStateToString(self->_registrationFlowState);
  [v3 appendFormat:@"registrationFlowState: '%@'; ", v4];

  [v3 appendFormat:@"senderAddress: '%@'; ", self->_senderAddress];
  v5 = PKPeerPaymentIdentityVerificationContextToString(self->_verificationContext);
  [v3 appendFormat:@"verificationContext: '%@'; ", v5];

  if (self->_graduation) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"graduation: '%@'; ", v6];
  unint64_t paymentMode = self->_paymentMode;
  v8 = @"unknown";
  if (paymentMode == 1) {
    v8 = @"messages";
  }
  if (paymentMode == 2) {
    v9 = @"deviceTap";
  }
  else {
    v9 = v8;
  }
  [v3 appendFormat:@"peerPaymentPaymentMode: '%@'; ", v9];
  v10 = (void *)[v3 copy];

  return v10;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (unint64_t)registrationFlowState
{
  return self->_registrationFlowState;
}

- (void)setRegistrationFlowState:(unint64_t)a3
{
  self->_registrationFlowState = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (int64_t)verificationContext
{
  return self->_verificationContext;
}

- (void)setVerificationContext:(int64_t)a3
{
  self->_verificationContext = a3;
}

- (BOOL)isGraduation
{
  return self->_graduation;
}

- (void)setGraduation:(BOOL)a3
{
  self->_graduation = a3;
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_unint64_t paymentMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end