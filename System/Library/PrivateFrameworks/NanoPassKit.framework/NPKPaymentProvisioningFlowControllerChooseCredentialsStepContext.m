@interface NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsManualEntry;
- (NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext)initWithRequestContext:(id)a3;
- (NSArray)credentials;
- (NSArray)flowIdentifiers;
- (NSDictionary)flowIdentifierToCredential;
- (PKPaymentSetupProduct)product;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)setCredentials:(id)a3;
- (void)setFlowIdentifierToCredential:(id)a3;
- (void)setFlowIdentifiers:(id)a3;
- (void)setProduct:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (NSArray)credentials
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)self flowIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)self flowIdentifierToCredential];
        v11 = [v10 objectForKey:v9];

        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return (NSArray *)v12;
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  uint64_t v5 = [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)self flowIdentifiers];
  uint64_t v6 = [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)self flowIdentifierToCredential];
  uint64_t v7 = [v6 allValues];
  BOOL v8 = [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)self allowsManualEntry];
  uint64_t v9 = [(NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *)self product];
  v10 = [v3 stringWithFormat:@"<%@ ordered flow identifiers %@ credentials %@ allows manual entry %d product %@>", v4, v5, v7, v8, v9];

  return v10;
}

- (NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext;
  uint64_t v5 = [(NPKPaymentProvisioningFlowStepContext *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"flowIdentifierToCredential"];
    flowIdentifierToCredential = v5->_flowIdentifierToCredential;
    v5->_flowIdentifierToCredential = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"flowIdentifiers"];
    flowIdentifiers = v5->_flowIdentifiers;
    v5->_flowIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentials"];
    credentials = v5->_credentials;
    v5->_credentials = (NSArray *)v16;

    v5->_allowsManualEntry = [v4 decodeBoolForKey:@"allowsManualEntry"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"product"];
    product = v5->_product;
    v5->_product = (PKPaymentSetupProduct *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_flowIdentifierToCredential, @"flowIdentifierToCredential", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_flowIdentifiers forKey:@"flowIdentifiers"];
  [v4 encodeObject:self->_credentials forKey:@"credentials"];
  [v4 encodeBool:self->_allowsManualEntry forKey:@"allowsManualEntry"];
  [v4 encodeObject:self->_product forKey:@"product"];
}

- (NSDictionary)flowIdentifierToCredential
{
  return self->_flowIdentifierToCredential;
}

- (void)setFlowIdentifierToCredential:(id)a3
{
}

- (NSArray)flowIdentifiers
{
  return self->_flowIdentifiers;
}

- (void)setFlowIdentifiers:(id)a3
{
}

- (void)setCredentials:(id)a3
{
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
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
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_flowIdentifiers, 0);
  objc_storeStrong((id *)&self->_flowIdentifierToCredential, 0);
}

@end