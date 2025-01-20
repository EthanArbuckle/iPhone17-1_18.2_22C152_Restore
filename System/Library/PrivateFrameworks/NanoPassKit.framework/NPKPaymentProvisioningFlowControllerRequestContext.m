@interface NPKPaymentProvisioningFlowControllerRequestContext
+ (BOOL)supportsSecureCoding;
- (NPKPaymentProvisioningFlowControllerRequestContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerRequestContext)initWithRequestHeader:(id)a3;
- (NPKProtoStandaloneRequestHeader)requestHeader;
- (NSString)currentStepIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerRequestContext

- (NPKPaymentProvisioningFlowControllerRequestContext)initWithRequestHeader:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKPaymentProvisioningFlowControllerRequestContext;
  v6 = [(NPKPaymentProvisioningFlowControllerRequestContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestHeader, a3);
    uint64_t v8 = [v5 stepIdentifier];
    currentStepIdentifier = v7->_currentStepIdentifier;
    v7->_currentStepIdentifier = (NSString *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerRequestContext;
  id v5 = [(NPKPaymentProvisioningFlowControllerRequestContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"currentStepIdentifier"];
    currentStepIdentifier = v5->_currentStepIdentifier;
    v5->_currentStepIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return (NPKProtoStandaloneRequestHeader *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)currentStepIdentifier
{
  return self->_currentStepIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStepIdentifier, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
}

@end