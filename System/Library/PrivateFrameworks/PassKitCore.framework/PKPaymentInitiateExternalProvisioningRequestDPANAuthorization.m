@interface PKPaymentInitiateExternalProvisioningRequestDPANAuthorization
- (NSData)signatureData;
- (NSString)dpanIdentifier;
- (PKPaymentInitiateExternalProvisioningRequestDPANAuthorization)initWithDPANID:(id)a3 signatureData:(id)a4 signatureInfo:(id)a5;
- (PKSecureElementSignatureInfo)signatureInfo;
- (id)dictionaryRepresentation;
@end

@implementation PKPaymentInitiateExternalProvisioningRequestDPANAuthorization

- (PKPaymentInitiateExternalProvisioningRequestDPANAuthorization)initWithDPANID:(id)a3 signatureData:(id)a4 signatureInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentInitiateExternalProvisioningRequestDPANAuthorization;
    v13 = [(PKPaymentInitiateExternalProvisioningRequestDPANAuthorization *)&v16 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_dpanIdentifier, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"type";
  v12[1] = @"DPANIdentifier";
  dpanIdentifier = self->_dpanIdentifier;
  signatureData = self->_signatureData;
  v13[0] = @"dpan";
  v13[1] = dpanIdentifier;
  v12[2] = @"signature";
  v5 = [(NSData *)signatureData base64EncodedStringWithOptions:0];
  v13[2] = v5;
  v12[3] = @"ECDSA";
  v6 = [(PKSecureElementSignatureInfo *)self->_signatureInfo certificates];
  v7 = [v6 certificateOfType:0];
  v13[3] = v7;
  v12[4] = @"RSA";
  v8 = [(PKSecureElementSignatureInfo *)self->_signatureInfo certificates];
  id v9 = [v8 certificateOfType:1];
  v13[4] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return v10;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (PKSecureElementSignatureInfo)signatureInfo
{
  return self->_signatureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureInfo, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end