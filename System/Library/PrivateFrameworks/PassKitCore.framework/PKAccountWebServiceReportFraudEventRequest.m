@interface PKAccountWebServiceReportFraudEventRequest
- (NSString)accountIdentifier;
- (NSString)odiAssessment;
- (NSURL)baseURL;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)event;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setEvent:(unint64_t)a3;
- (void)setOdiAssessment:(id)a3;
@end

@implementation PKAccountWebServiceReportFraudEventRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2082;
    v24 = "_baseURL";
LABEL_15:
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_16;
  }
  if (!v4)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_15;
  }
  if (!self->_accountIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2082;
      v24 = "_accountIdentifier";
      goto LABEL_15;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v7) {
    [v6 setObject:v7 forKey:@"deviceMetadata"];
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v6 setObject:odiAssessment forKey:@"odiAssessment"];
  }
  v9 = PKAccountFraudEventToString(self->_event);
  [v6 setObject:v9 forKeyedSubscript:@"event"];

  accountIdentifier = self->_accountIdentifier;
  v20[0] = @"accounts";
  v20[1] = accountIdentifier;
  v20[2] = @"reportEvent";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v12 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v11 queryParameters:0 appleAccountInformation:v5];
  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v13 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v6];
  [v12 setHTTPBody:v13];

  v14 = (void *)[v12 copy];
LABEL_17:

  return v14;
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

- (unint64_t)event
{
  return self->_event;
}

- (void)setEvent:(unint64_t)a3
{
  self->_event = a3;
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
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end