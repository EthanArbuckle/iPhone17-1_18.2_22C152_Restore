@interface NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext
- (NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext)initWithRequestContext:(id)a3;
- (NSArray)verificationFields;
- (PKPaymentPass)paymentPass;
- (id)description;
- (void)setPaymentPass:(id)a3;
- (void)setVerificationFields:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext

- (NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext *)self paymentPass];
  v6 = [v5 uniqueID];
  v7 = [(NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext *)self verificationFields];
  v8 = [v3 stringWithFormat:@"<%@ pass unique ID %@ fields %@>", v4, v6, v7];

  return v8;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (NSArray)verificationFields
{
  return self->_verificationFields;
}

- (void)setVerificationFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationFields, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end