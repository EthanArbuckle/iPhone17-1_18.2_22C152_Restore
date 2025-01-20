@interface NPKPaymentProvisioningFlowControllerPreconditionsStepContext
+ (BOOL)supportsSecureCoding;
- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)initWithRequestContext:(id)a3;
- (id)description;
- (unint64_t)preconditionsState;
- (void)encodeWithCoder:(id)a3;
- (void)setPreconditionsState:(unint64_t)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerPreconditionsStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerPreconditionsStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [v3 stringWithFormat:@"<%@ preconditionsState %ld>", v4, -[NPKPaymentProvisioningFlowControllerPreconditionsStepContext preconditionsState](self, "preconditionsState")];

  return v5;
}

- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NPKPaymentProvisioningFlowControllerPreconditionsStepContext;
  v5 = [(NPKPaymentProvisioningFlowStepContext *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_preconditionsState = [v4 decodeIntegerForKey:@"preconditionsState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerPreconditionsStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preconditionsState, @"preconditionsState", v5.receiver, v5.super_class);
}

- (unint64_t)preconditionsState
{
  return self->_preconditionsState;
}

- (void)setPreconditionsState:(unint64_t)a3
{
  self->_preconditionsState = a3;
}

@end