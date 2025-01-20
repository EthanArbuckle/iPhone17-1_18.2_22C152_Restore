@interface NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext
- (NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext)initWithRequestContext:(id)a3;
- (PKPaymentPass)paymentPass;
- (PKVerificationChannel)verificationChannel;
- (id)description;
- (void)setPaymentPass:(id)a3;
- (void)setVerificationChannel:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext

- (NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext *)self paymentPass];
  v6 = [v5 uniqueID];
  v7 = [(NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext *)self verificationChannel];
  v8 = [v3 stringWithFormat:@"<%@ pass unique ID %@ channel %@>", v4, v6, v7];

  return v8;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (PKVerificationChannel)verificationChannel
{
  return self->_verificationChannel;
}

- (void)setVerificationChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationChannel, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end