@interface PKAccountWebServiceAddFundingSourceRequest
- (NSString)accountIdentifier;
- (NSString)fundingSourceTermsIdentifier;
- (NSString)odiAssessment;
- (NSURL)baseURL;
- (PKAccountPaymentFundingSource)fundingSource;
- (PKAccountWebServiceCertificatesResponse)certificatesResponse;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCertificatesResponse:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setFundingSource:(id)a3;
- (void)setFundingSourceTermsIdentifier:(id)a3;
- (void)setOdiAssessment:(id)a3;
@end

@implementation PKAccountWebServiceAddFundingSourceRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    __int16 v27 = 2082;
    v28 = "_baseURL";
LABEL_24:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_25;
  }
  if (!v4)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    __int16 v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_24;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v19 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    __int16 v27 = 2082;
    v28 = "_accountIdentifier";
    goto LABEL_24;
  }
  if (!self->_fundingSource)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v20 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    __int16 v27 = 2082;
    v28 = "_fundingSource";
    goto LABEL_24;
  }
  if (!self->_certificatesResponse)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v21 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    __int16 v27 = 2082;
    v28 = "_certificatesResponse";
    goto LABEL_24;
  }
  if (!self->_fundingSourceTermsIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      __int16 v27 = 2082;
      v28 = "_fundingSourceTermsIdentifier";
      goto LABEL_24;
    }
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  v24[0] = @"accounts";
  v24[1] = accountIdentifier;
  v24[2] = @"fundingSources";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v10 = [(PKAccountPaymentFundingSource *)self->_fundingSource jsonDictionaryRepresentationWithCertificatesResponse:self->_certificatesResponse];
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v10 forKeyedSubscript:@"fundingSource"];
  [v11 setObject:self->_fundingSourceTermsIdentifier forKeyedSubscript:@"fundingSourceTermsIdentifier"];
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    v13 = [(PKPaymentDeviceMetadata *)deviceMetadata dictionaryRepresentation];
    [v11 setObject:v13 forKeyedSubscript:@"deviceMetadata"];
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v11 setObject:odiAssessment forKeyedSubscript:@"odiAssessment"];
  }
  v15 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
  [v9 setHTTPBody:v15];

LABEL_26:
  return v9;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
}

- (NSString)fundingSourceTermsIdentifier
{
  return self->_fundingSourceTermsIdentifier;
}

- (void)setFundingSourceTermsIdentifier:(id)a3
{
}

- (PKAccountWebServiceCertificatesResponse)certificatesResponse
{
  return self->_certificatesResponse;
}

- (void)setCertificatesResponse:(id)a3
{
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_certificatesResponse, 0);
  objc_storeStrong((id *)&self->_fundingSourceTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end