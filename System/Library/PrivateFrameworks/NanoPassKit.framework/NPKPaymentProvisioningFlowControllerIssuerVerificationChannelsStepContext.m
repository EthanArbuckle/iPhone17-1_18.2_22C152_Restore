@interface NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext
- (NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext)initWithRequestContext:(id)a3;
- (NSArray)verificationChannels;
- (PKPaymentPass)paymentPass;
- (id)description;
- (void)setPaymentPass:(id)a3;
- (void)setVerificationChannels:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext

- (NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext *)self paymentPass];
  v6 = [v5 uniqueID];
  v7 = [(NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext *)self verificationChannels];
  v8 = [v3 stringWithFormat:@"<%@ pass unique ID %@ channels %@>", v4, v6, v7];

  return v8;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (NSArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end