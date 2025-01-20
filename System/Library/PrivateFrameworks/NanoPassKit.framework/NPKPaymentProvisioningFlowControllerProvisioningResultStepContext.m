@interface NPKPaymentProvisioningFlowControllerProvisioningResultStepContext
- (BOOL)cardAdded;
- (NPKPaymentProvisioningFlowControllerProvisioningResultStepContext)initWithRequestContext:(id)a3;
- (NSError)error;
- (PKPaymentPass)provisionedPass;
- (id)description;
- (void)setCardAdded:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setProvisionedPass:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerProvisioningResultStepContext

- (NPKPaymentProvisioningFlowControllerProvisioningResultStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerProvisioningResultStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  BOOL v5 = [(NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *)self cardAdded];
  v6 = [(NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *)self error];
  v7 = [v3 stringWithFormat:@"<%@ card added %d error %@>", v4, v5, v6];

  return v7;
}

- (BOOL)cardAdded
{
  return self->_cardAdded;
}

- (void)setCardAdded:(BOOL)a3
{
  self->_cardAdded = a3;
}

- (PKPaymentPass)provisionedPass
{
  return self->_provisionedPass;
}

- (void)setProvisionedPass:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_provisionedPass, 0);
}

@end