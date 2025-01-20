@interface PDSharingManagementRetrievePartnerEncryptionCertificateResponse
- (NSArray)supportedEncryptionSchemes;
- (NSData)certificate;
- (PDSharingManagementRetrievePartnerEncryptionCertificateResponse)initWithData:(id)a3;
@end

@implementation PDSharingManagementRetrievePartnerEncryptionCertificateResponse

- (PDSharingManagementRetrievePartnerEncryptionCertificateResponse)initWithData:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PDSharingManagementRetrievePartnerEncryptionCertificateResponse;
  v3 = [(PDSharingManagementRetrievePartnerEncryptionCertificateResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PDSharingManagementRetrievePartnerEncryptionCertificateResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_alloc((Class)NSData);
      v7 = [v5 PKStringForKey:@"certificate"];
      v8 = (NSData *)[v6 initWithBase64EncodedString:v7 options:0];
      certificate = v4->_certificate;
      v4->_certificate = v8;

      uint64_t v10 = [v5 PKArrayContaining:objc_opt_class() forKey:@"supportedEncryptionSchemes"];
      supportedEncryptionSchemes = v4->_supportedEncryptionSchemes;
      v4->_supportedEncryptionSchemes = (NSArray *)v10;

      if (v4->_certificate && v4->_supportedEncryptionSchemes) {
        goto LABEL_10;
      }
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        id v16 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
    }

    v4 = 0;
LABEL_10:
  }
  return v4;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSArray)supportedEncryptionSchemes
{
  return self->_supportedEncryptionSchemes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedEncryptionSchemes, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end