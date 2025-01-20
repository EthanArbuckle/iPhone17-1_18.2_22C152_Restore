@interface NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext
+ (BOOL)supportsSecureCoding;
- (NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext)initWithRequestContext:(id)a3;
- (NSArray)setupFields;
- (NSString)subtitle;
- (NSString)title;
- (PKPaymentSetupProduct)product;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProduct:(id)a3;
- (void)setSetupFields:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)self title];
  v6 = [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)self subtitle];
  v7 = [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)self setupFields];
  v8 = [(NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *)self product];
  v9 = [v3 stringWithFormat:@"<%@ title %@ subtitle %@ setup fields %@ product %@>", v4, v5, v6, v7, v8];

  return v9;
}

- (NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext;
  v5 = [(NPKPaymentProvisioningFlowStepContext *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"setupFields"];
    setupFields = v5->_setupFields;
    v5->_setupFields = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"product"];
    product = v5->_product;
    v5->_product = (PKPaymentSetupProduct *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v4 encodeObject:self->_setupFields forKey:@"setupFields"];
  [v4 encodeObject:self->_product forKey:@"product"];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSArray)setupFields
{
  return self->_setupFields;
}

- (void)setSetupFields:(id)a3
{
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
  objc_storeStrong((id *)&self->_setupFields, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end