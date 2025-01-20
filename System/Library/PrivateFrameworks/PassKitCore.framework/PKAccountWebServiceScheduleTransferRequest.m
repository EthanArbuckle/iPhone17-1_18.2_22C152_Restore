@interface PKAccountWebServiceScheduleTransferRequest
- (Class)signatureResponseClass;
- (NSData)publicKeyHash;
- (NSString)accountIdentifier;
- (NSString)odiAssessment;
- (NSURL)baseURL;
- (PKAccountScheduledTransferList)scheduledTransfers;
- (PKAccountTransferScheduleDetails)scheduleDetails;
- (PKApplePayTrustHashResponse)hashResponse;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (id)endpointComponents;
- (id)manifestHashWithReferenceIdentifier:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setHashResponse:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setScheduleDetails:(id)a3;
- (void)setScheduledTransfers:(id)a3;
@end

@implementation PKAccountWebServiceScheduleTransferRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAccountWebServiceScheduleTransferRequest *)self baseURL];
  if (!v5)
  {
    v16 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    int v24 = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "baseURL";
LABEL_21:
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v24, 0x16u);

    goto LABEL_22;
  }
  if (!v4)
  {
    v16 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    int v24 = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_21;
  }
  if (!self->_scheduledTransfers)
  {
    v16 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v20 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v20);
    int v24 = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "_scheduledTransfers";
    goto LABEL_21;
  }
  if (!self->_scheduleDetails)
  {
    v16 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v21 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v21);
    int v24 = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "_scheduleDetails";
    goto LABEL_21;
  }
  if (!self->_accountIdentifier)
  {
    v16 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v22);
      int v24 = 138543618;
      v25 = v18;
      __int16 v26 = 2082;
      v27 = "_accountIdentifier";
      goto LABEL_21;
    }
LABEL_22:

    v15 = 0;
    goto LABEL_23;
  }
  v6 = [(PKAccountWebServiceScheduleTransferRequest *)self endpointComponents];
  v7 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v6 queryParameters:0 appleAccountInformation:v4];

  [v7 setHTTPMethod:@"POST"];
  [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = [(PKAccountScheduledTransferList *)self->_scheduledTransfers jsonArrayRepresentation];
  [v8 setObject:v9 forKeyedSubscript:@"scheduledTransfers"];

  v10 = [(PKAccountTransferScheduleDetails *)self->_scheduleDetails jsonDictionaryRepresentation];
  [v8 setObject:v10 forKeyedSubscript:@"scheduleDetails"];

  v11 = [(NSData *)self->_publicKeyHash hexEncoding];
  [v8 setObject:v11 forKeyedSubscript:@"publicKeyHash"];

  v12 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v12) {
    [v8 setObject:v12 forKey:@"deviceMetadata"];
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v8 setObject:odiAssessment forKey:@"odiAssessment"];
  }
  v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v8];
  [v7 setHTTPBody:v14];

  v15 = (void *)[v7 copy];
LABEL_23:

  return v15;
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
    v5[2] = @"transfers";
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
  v5 = [(PKAccountScheduledTransferList *)self->_scheduledTransfers scheduledTransferOfFundingSourceType:1];
  v6 = [(PKAccountScheduledTransferList *)self->_scheduledTransfers scheduledTransferOfFundingSourceType:2];
  v7 = [v5 hashComponent];
  v8 = [v6 hashComponent];
  v9 = [(PKAccountTransferScheduleDetails *)self->_scheduleDetails hashString];
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

- (PKAccountScheduledTransferList)scheduledTransfers
{
  return self->_scheduledTransfers;
}

- (void)setScheduledTransfers:(id)a3
{
}

- (PKAccountTransferScheduleDetails)scheduleDetails
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
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_scheduledTransfers, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end