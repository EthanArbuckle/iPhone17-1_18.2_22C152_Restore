@interface PKAccountWebServiceReportRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (PKAccountReport)report;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)trigger;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setReport:(id)a3;
- (void)setTrigger:(unint64_t)a3;
@end

@implementation PKAccountWebServiceReportRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = "_baseURL";
LABEL_15:
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_16;
  }
  if (!v4)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_15;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v15 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = "_accountIdentifier";
    goto LABEL_15;
  }
  if (!self->_report)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      __int16 v23 = 2082;
      v24 = "_report";
      goto LABEL_15;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v20[0] = @"accounts";
  v20[1] = accountIdentifier;
  v20[2] = @"reporting";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v5];
  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v10 = [(PKAccountReport *)self->_report dictionaryRepresentation];
  [v9 addEntriesFromDictionary:v10];

  switch(self->_trigger)
  {
    case 0uLL:
      goto LABEL_24;
    case 1uLL:
      v11 = @"manual";
      goto LABEL_23;
    case 2uLL:
      v11 = @"statementChanged";
      goto LABEL_23;
    case 3uLL:
      v11 = @"scheduledActivity";
      goto LABEL_23;
    default:
      v11 = @"unknown";
LABEL_23:
      [v9 safelySetObject:v11 forKey:@"trigger"];
LABEL_24:
      v19 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
      [v8 setHTTPBody:v19];

      v17 = (void *)[v8 copy];
      break;
  }
LABEL_17:

  return v17;
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

- (PKAccountReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end