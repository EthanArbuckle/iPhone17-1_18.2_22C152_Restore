@interface NPKPaymentProvisioningFlowControllerMoreInformationStepContext
- (NPKPaymentProvisioningFlowControllerMoreInformationStepContext)initWithRequestContext:(id)a3;
- (NSArray)moreInfoItems;
- (PKPaymentPass)paymentPass;
- (id)description;
- (void)setMoreInfoItems:(id)a3;
- (void)setPaymentPass:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerMoreInformationStepContext

- (NPKPaymentProvisioningFlowControllerMoreInformationStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerMoreInformationStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerMoreInformationStepContext *)self moreInfoItems];
  v6 = [(NPKPaymentProvisioningFlowControllerMoreInformationStepContext *)self paymentPass];
  v7 = [v6 uniqueID];
  v8 = [v3 stringWithFormat:@"<%@ pass unique ID %@ more info items %@>", v4, v5, v7];

  return v8;
}

- (NSArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (void)setMoreInfoItems:(id)a3
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
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
}

@end