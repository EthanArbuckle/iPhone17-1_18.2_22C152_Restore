@interface NPKPaymentProvisioningFlowControllerChooseProductStepContext
+ (BOOL)supportsSecureCoding;
- (NPKPaymentProvisioningFlowControllerChooseProductStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerChooseProductStepContext)initWithRequestContext:(id)a3;
- (NSArray)products;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProducts:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerChooseProductStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerChooseProductStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseProductStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerChooseProductStepContext *)self products];
  v6 = [v3 stringWithFormat:@"<%@ products %@>", v4, v5];

  return v6;
}

- (NPKPaymentProvisioningFlowControllerChooseProductStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseProductStepContext;
  v5 = [(NPKPaymentProvisioningFlowStepContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"products"];
    products = v5->_products;
    v5->_products = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseProductStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_products, @"products", v5.receiver, v5.super_class);
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