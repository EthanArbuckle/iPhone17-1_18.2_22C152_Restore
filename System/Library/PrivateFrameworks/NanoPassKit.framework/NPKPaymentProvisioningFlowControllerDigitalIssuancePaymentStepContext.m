@interface NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext
+ (BOOL)supportsSecureCoding;
- (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext)initWithRequestContext:(id)a3;
- (PKPaymentSetupProduct)product;
- (void)encodeWithCoder:(id)a3;
- (void)setProduct:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext;
  v5 = [(NPKPaymentProvisioningFlowStepContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"product"];
    product = v5->_product;
    v5->_product = (PKPaymentSetupProduct *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_product, @"product", v5.receiver, v5.super_class);
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (void).cxx_destruct
{
}

@end