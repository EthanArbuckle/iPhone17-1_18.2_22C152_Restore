@interface NPKPaymentProvisioningFlowControllerManualEntryStepContext
+ (BOOL)supportsSecureCoding;
- (BOOL)cameraFirstProvisioningEnabled;
- (NPKPaymentProvisioningFlowControllerManualEntryStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerManualEntryStepContext)initWithRequestContext:(id)a3;
- (NSArray)setupFields;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraFirstProvisioningEnabled:(BOOL)a3;
- (void)setSetupFields:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerManualEntryStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerManualEntryStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerManualEntryStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  BOOL v5 = [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)self cameraFirstProvisioningEnabled];
  v6 = [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)self setupFields];
  v7 = [v3 stringWithFormat:@"<%@ camera first provisioning enabled %d setup fields %@>", v4, v5, v6];

  return v7;
}

- (NPKPaymentProvisioningFlowControllerManualEntryStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerManualEntryStepContext;
  BOOL v5 = [(NPKPaymentProvisioningFlowStepContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_cameraFirstProvisioningEnabled = [v4 decodeBoolForKey:@"cameraFirstProvisioningEnabled"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"setupFields"];
    setupFields = v5->_setupFields;
    v5->_setupFields = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerManualEntryStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraFirstProvisioningEnabled, @"cameraFirstProvisioningEnabled", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_setupFields forKey:@"setupFields"];
}

- (BOOL)cameraFirstProvisioningEnabled
{
  return self->_cameraFirstProvisioningEnabled;
}

- (void)setCameraFirstProvisioningEnabled:(BOOL)a3
{
  self->_cameraFirstProvisioningEnabled = a3;
}

- (NSArray)setupFields
{
  return self->_setupFields;
}

- (void)setSetupFields:(id)a3
{
}

- (void).cxx_destruct
{
}

@end