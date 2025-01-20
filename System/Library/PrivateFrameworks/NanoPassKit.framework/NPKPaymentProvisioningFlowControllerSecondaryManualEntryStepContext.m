@interface NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAddingDifferentCard;
- (NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext)initWithRequestContext:(id)a3;
- (PKPaymentCredential)credential;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsAddingDifferentCard:(BOOL)a3;
- (void)setCredential:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext;
  return [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  BOOL v5 = [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)self cameraFirstProvisioningEnabled];
  v6 = [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)self setupFields];
  v7 = [(NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext *)self credential];
  v8 = [v3 stringWithFormat:@"<%@ camera first provisioning enabled %d setup fields %@ credential %@>", v4, v5, v6, v7];

  return v8;
}

- (NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext;
  BOOL v5 = [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credential"];
    credential = v5->_credential;
    v5->_credential = (PKPaymentCredential *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowControllerManualEntryStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_credential, @"credential", v5.receiver, v5.super_class);
}

- (PKPaymentCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (BOOL)allowsAddingDifferentCard
{
  return self->_allowsAddingDifferentCard;
}

- (void)setAllowsAddingDifferentCard:(BOOL)a3
{
  self->_allowsAddingDifferentCard = a3;
}

- (void).cxx_destruct
{
}

@end