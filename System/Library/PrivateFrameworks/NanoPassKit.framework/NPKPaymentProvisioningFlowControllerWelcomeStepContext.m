@interface NPKPaymentProvisioningFlowControllerWelcomeStepContext
+ (BOOL)supportsSecureCoding;
- (BOOL)defaultImagesUsed;
- (NPKPaymentProvisioningFlowControllerWelcomeStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerWelcomeStepContext)initWithRequestContext:(id)a3;
- (NSArray)heroImages;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultImagesUsed:(BOOL)a3;
- (void)setHeroImages:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerWelcomeStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerWelcomeStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerWelcomeStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerWelcomeStepContext *)self heroImages];
  v6 = [v3 stringWithFormat:@"<%@ images %@>", v4, v5];

  return v6;
}

- (NPKPaymentProvisioningFlowControllerWelcomeStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerWelcomeStepContext;
  v5 = [(NPKPaymentProvisioningFlowStepContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"heroImages"];
    heroImages = v5->_heroImages;
    v5->_heroImages = (NSArray *)v9;

    v5->_defaultImagesUsed = [v4 decodeBoolForKey:@"defaultImagesUsed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerWelcomeStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_heroImages, @"heroImages", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_defaultImagesUsed forKey:@"defaultImagesUsed"];
}

- (NSArray)heroImages
{
  return self->_heroImages;
}

- (void)setHeroImages:(id)a3
{
}

- (BOOL)defaultImagesUsed
{
  return self->_defaultImagesUsed;
}

- (void)setDefaultImagesUsed:(BOOL)a3
{
  self->_defaultImagesUsed = a3;
}

- (void).cxx_destruct
{
}

@end