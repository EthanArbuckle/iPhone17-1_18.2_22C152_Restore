@interface NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext
- (NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext)initWithRequestContext:(id)a3;
- (NSArray)certificates;
- (NSData)nonce;
- (NSData)nonceSignature;
- (id)description;
- (void)setCertificates:(id)a3;
- (void)setNonce:(id)a3;
- (void)setNonceSignature:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext

- (NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *)self certificates];
  v6 = [(NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *)self nonce];
  v7 = [(NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *)self nonceSignature];
  v8 = [v3 stringWithFormat:@"<%@ certificates %@ nonce %@ nonce signature %@>", v4, v5, v6, v7];

  return v8;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)nonceSignature
{
  return self->_nonceSignature;
}

- (void)setNonceSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceSignature, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end