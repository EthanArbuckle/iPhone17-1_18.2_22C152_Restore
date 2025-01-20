@interface NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext
- (BOOL)allowNonSecureHTTP;
- (NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext)initWithRequestContext:(id)a3;
- (NSURL)termsURL;
- (PKPaymentSetupProduct)product;
- (id)description;
- (void)setAllowNonSecureHTTP:(BOOL)a3;
- (void)setProduct:(id)a3;
- (void)setTermsURL:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext

- (NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext *)self termsURL];
  v6 = [v3 stringWithFormat:@"<%@ terms URL %@ allow non-secure HTTP %d>", v4, v5, -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext allowNonSecureHTTP](self, "allowNonSecureHTTP")];

  return v6;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (BOOL)allowNonSecureHTTP
{
  return self->_allowNonSecureHTTP;
}

- (void)setAllowNonSecureHTTP:(BOOL)a3
{
  self->_allowNonSecureHTTP = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end