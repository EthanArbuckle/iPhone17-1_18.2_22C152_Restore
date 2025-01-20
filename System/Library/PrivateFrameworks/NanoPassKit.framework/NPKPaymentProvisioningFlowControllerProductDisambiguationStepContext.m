@interface NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext
- (NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext)initWithRequestContext:(id)a3;
- (NSArray)products;
- (id)description;
- (void)setProducts:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext

- (NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext *)self products];
  v6 = [v3 stringWithFormat:@"<%@ products %@>", v4, v5];

  return v6;
}

- (NSArray)products
{
  return self->_products;
}

- (void)setProducts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end