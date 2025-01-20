@interface PKAccountWebServiceSchedulePaymentRequest
- (Class)signatureResponseClass;
- (NSData)publicKeyHash;
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (PKAccountPaymentScheduleDetails)scheduleDetails;
- (PKAccountScheduledPaymentList)scheduledPayments;
- (PKAccountWebServiceCertificatesResponse)certificatesResponse;
- (PKApplePayTrustHashResponse)hashResponse;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (id)endpointComponents;
- (id)manifestHashWithReferenceIdentifier:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCertificatesResponse:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setHashResponse:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setScheduleDetails:(id)a3;
- (void)setScheduledPayments:(id)a3;
@end

@implementation PKAccountWebServiceSchedulePaymentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAccountWebServiceSchedulePaymentRequest *)self baseURL];
  if (!v5)
  {
    v15 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v23 = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "baseURL";
LABEL_19:
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v23, 0x16u);

    goto LABEL_20;
  }
  if (!v4)
  {
    v15 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    int v23 = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "appleAccountInformation";
    goto LABEL_19;
  }
  if (!self->_scheduledPayments)
  {
    v15 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v19 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v19);
    int v23 = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "_scheduledPayments";
    goto LABEL_19;
  }
  if (!self->_scheduleDetails)
  {
    v15 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v20 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v20);
    int v23 = 138543618;
    v24 = v17;
    __int16 v25 = 2082;
    v26 = "_scheduleDetails";
    goto LABEL_19;
  }
  if (!self->_accountIdentifier)
  {
    v15 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v21);
      int v23 = 138543618;
      v24 = v17;
      __int16 v25 = 2082;
      v26 = "_accountIdentifier";
      goto LABEL_19;
    }
LABEL_20:

    v14 = 0;
    goto LABEL_21;
  }
  v6 = [(PKAccountWebServiceSchedulePaymentRequest *)self endpointComponents];
  v7 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v6 queryParameters:0 appleAccountInformation:v4];

  [v7 setHTTPMethod:@"POST"];
  [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = [(PKAccountScheduledPaymentList *)self->_scheduledPayments jsonArrayRepresentationWithCertificatesResponse:self->_certificatesResponse];
  [v8 setObject:v9 forKeyedSubscript:@"scheduledPayments"];

  v10 = [(PKAccountPaymentScheduleDetails *)self->_scheduleDetails jsonDictionaryRepresentation];
  [v8 setObject:v10 forKeyedSubscript:@"scheduleDetails"];

  v11 = [(NSData *)self->_publicKeyHash hexEncoding];
  [v8 setObject:v11 forKeyedSubscript:@"publicKeyHash"];

  v12 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v12) {
    [v8 setObject:v12 forKey:@"deviceMetadata"];
  }
  v13 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v8];
  [v7 setHTTPBody:v13];

  v14 = (void *)[v7 copy];
LABEL_21:

  return v14;
}

- (Class)signatureResponseClass
{
  return (Class)objc_opt_class();
}

- (id)endpointComponents
{
  v5[3] = *MEMORY[0x1E4F143B8];
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v5[0] = @"accounts";
    v5[1] = accountIdentifier;
    v5[2] = @"payments";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)manifestHashWithReferenceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PKAccountScheduledPaymentList *)self->_scheduledPayments scheduledPaymentOfFundingSourceType:1];
  v6 = [(PKAccountScheduledPaymentList *)self->_scheduledPayments scheduledPaymentOfFundingSourceType:2];
  v7 = [v5 hashComponentWithCertificatesResponse:self->_certificatesResponse];
  v8 = [v6 hashComponentWithCertificatesResponse:self->_certificatesResponse];
  v9 = [(PKAccountPaymentScheduleDetails *)self->_scheduleDetails hashString];
  v10 = [MEMORY[0x1E4F28E78] string];
  if ([v7 length]) {
    [v10 appendString:v7];
  }
  if ([v8 length]) {
    [v10 appendString:v8];
  }
  if (v9) {
    [v10 appendString:v9];
  }
  [v10 appendString:v4];
  v11 = [v10 dataUsingEncoding:4];
  v12 = [v11 SHA256Hash];

  return v12;
}

- (NSURL)baseURL
{
  return self->baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKApplePayTrustHashResponse)hashResponse
{
  return self->hashResponse;
}

- (void)setHashResponse:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (PKAccountScheduledPaymentList)scheduledPayments
{
  return self->_scheduledPayments;
}

- (void)setScheduledPayments:(id)a3
{
}

- (PKAccountPaymentScheduleDetails)scheduleDetails
{
  return self->_scheduleDetails;
}

- (void)setScheduleDetails:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_certificatesResponse, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_scheduledPayments, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end