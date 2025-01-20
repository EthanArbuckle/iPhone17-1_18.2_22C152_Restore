@interface NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext
- (NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext)initWithRequestContext:(id)a3;
- (NSString)localizedProgressDescription;
- (PKPaymentSetupProduct)product;
- (void)setLocalizedProgressDescription:(id)a3;
- (void)setProduct:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext

- (NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (NSString)localizedProgressDescription
{
  return self->_localizedProgressDescription;
}

- (void)setLocalizedProgressDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedProgressDescription, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end