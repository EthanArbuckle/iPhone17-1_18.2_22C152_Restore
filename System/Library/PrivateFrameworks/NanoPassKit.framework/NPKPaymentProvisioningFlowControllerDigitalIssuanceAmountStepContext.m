@interface NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsReaderModeEntry;
- (NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext)initWithRequestContext:(id)a3;
- (PKPaymentSetupProduct)product;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsReaderModeEntry:(BOOL)a3;
- (void)setProduct:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  BOOL v5 = [(NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext *)self allowsReaderModeEntry];
  v6 = [(NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext *)self product];
  v7 = [v3 stringWithFormat:@"<%@ allows reader mode entry %d product %@>", v4, v5, v6];

  return v7;
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext;
  BOOL v5 = [(NPKPaymentProvisioningFlowStepContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_allowsReaderModeEntry = [v4 decodeBoolForKey:@"allowsReaderModeEntry"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"product"];
    product = v5->_product;
    v5->_product = (PKPaymentSetupProduct *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsReaderModeEntry, @"allowsReaderModeEntry", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_product forKey:@"product"];
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (BOOL)allowsReaderModeEntry
{
  return self->_allowsReaderModeEntry;
}

- (void)setAllowsReaderModeEntry:(BOOL)a3
{
  self->_allowsReaderModeEntry = a3;
}

- (void).cxx_destruct
{
}

@end