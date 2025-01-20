@interface PKPeerPaymentEncryptionCertificatesResponse
- (PKPeerPaymentEncryptionCertificate)certificate;
- (PKPeerPaymentEncryptionCertificatesResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentEncryptionCertificatesResponse

- (PKPeerPaymentEncryptionCertificatesResponse)initWithData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentEncryptionCertificatesResponse;
  v3 = [(PKWebServiceResponse *)&v12 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [[PKPeerPaymentEncryptionCertificate alloc] initWithDictionary:v6];

      p_super = &v4->_certificate->super;
      v4->_certificate = v7;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentEncryptionCertificatesResponse: expected dictionary and received %{public}@", buf, 0xCu);
      }
    }
  }
  return v4;
}

- (PKPeerPaymentEncryptionCertificate)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
}

@end