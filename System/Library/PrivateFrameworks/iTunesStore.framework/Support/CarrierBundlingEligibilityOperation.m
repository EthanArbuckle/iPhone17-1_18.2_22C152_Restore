@interface CarrierBundlingEligibilityOperation
- (BOOL)isDeepLink;
- (CarrierBundlingEligibilityResponse)eligibilityResponse;
- (NSString)cellularProviderName;
- (NSString)mobileSubscriberCountryCode;
- (NSString)mobileSubscriberNetworkCode;
- (NSString)phoneNumber;
- (id)_newDefaultRequestBodyDictionary;
- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4;
- (id)_sendPreflightRequest:(id *)a3;
- (void)_finishEnrichmentWithSessionID:(id)a3 carrierResponse:(id)a4 URLResponse:(id)a5 URLError:(id)a6 outputBlock:(id)a7;
- (void)_finishSilentSMSWithSessionID:(id)a3 responseCode:(int64_t)a4 smsSendingError:(id)a5 outputBlock:(id)a6;
- (void)_sendEnrichmentRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4;
- (void)_sendSilentSMSRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4;
- (void)run;
- (void)setDeepLink:(BOOL)a3;
@end

@implementation CarrierBundlingEligibilityOperation

- (NSString)cellularProviderName
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  id v3 = [(NSString *)self->_cellularProviderName copy];
  [(CarrierBundlingEligibilityOperation *)self unlock];

  return (NSString *)v3;
}

- (CarrierBundlingEligibilityResponse)eligibilityResponse
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  id v3 = self->_eligibilityResponse;
  [(CarrierBundlingEligibilityOperation *)self unlock];

  return v3;
}

- (BOOL)isDeepLink
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  BOOL deepLink = self->_deepLink;
  [(CarrierBundlingEligibilityOperation *)self unlock];
  return deepLink;
}

- (NSString)mobileSubscriberCountryCode
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  id v3 = [(NSString *)self->_mobileSubscriberCountryCode copy];
  [(CarrierBundlingEligibilityOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)mobileSubscriberNetworkCode
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  id v3 = [(NSString *)self->_mobileSubscriberNetworkCode copy];
  [(CarrierBundlingEligibilityOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  id v3 = [(NSString *)self->_phoneNumber copy];
  [(CarrierBundlingEligibilityOperation *)self unlock];

  return (NSString *)v3;
}

- (void)setDeepLink:(BOOL)a3
{
  [(CarrierBundlingEligibilityOperation *)self lock];
  self->_BOOL deepLink = a3;

  [(CarrierBundlingEligibilityOperation *)self unlock];
}

- (void)run
{
  v4 = +[SSVTelephonyController sharedController];
  unsigned int v5 = [v4 isPhoneNumberAccessRestricted];

  if (v5)
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"CarrierBundlingEligibilityOperation.m" lineNumber:94 description:@"Phone number access is restricted."];
  }
  uint64_t v47 = 0;
  v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_1000B2AE4;
  v51 = sub_1000B2AF4;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_1000B2AE4;
  v45 = sub_1000B2AF4;
  id v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  v6 = +[ISNetworkObserver sharedInstance];
  v7 = [v6 mobileSubscriberCountryCode];
  v8 = [v6 mobileSubscriberNetworkCode];
  v9 = [v6 providerName];
  v34 = v6;
  v10 = [v6 phoneNumber];
  v11 = +[SSVTelephonyController sharedController];
  v12 = [v11 IMEI];

  [(CarrierBundlingEligibilityOperation *)self lock];
  v13 = (NSString *)[v9 copy];
  cellularProviderName = self->_cellularProviderName;
  self->_cellularProviderName = v13;

  v15 = (NSString *)[v7 copy];
  mobileSubscriberCountryCode = self->_mobileSubscriberCountryCode;
  self->_mobileSubscriberCountryCode = v15;

  v17 = (NSString *)[v8 copy];
  mobileSubscriberNetworkCode = self->_mobileSubscriberNetworkCode;
  self->_mobileSubscriberNetworkCode = v17;

  v19 = (NSString *)[v10 copy];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v19;

  v21 = (NSString *)[v12 copy];
  IMEI = self->_IMEI;
  self->_IMEI = v21;

  [(CarrierBundlingEligibilityOperation *)self unlock];
  v23 = v10;
  v24 = v9;
  v25 = v8;
  v26 = v7;
  for (i = 0; ; i = v29)
  {
    v28 = (id *)(v42 + 5);
    id obj = (id)v42[5];
    v29 = [(CarrierBundlingEligibilityOperation *)self _sendPreflightRequest:&obj];
    objc_storeStrong(v28, obj);

    if (![v29 wantsDelayedRetry]) {
      break;
    }
    [v29 delayInterval];
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
  }
  if (v29)
  {
    v30 = [v29 error];

    if (v30)
    {
      uint64_t v31 = [v29 error];
      v32 = (void *)v42[5];
      v42[5] = v31;
    }
    else
    {
      if ((char *)[v29 bundlingStatus] - 1 <= (char *)3)
      {
        objc_storeStrong(v48 + 5, v29);
        *((unsigned char *)v38 + 24) = 1;
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000B2AFC;
      v35[3] = &unk_1003A58B0;
      v35[4] = &v41;
      v35[5] = &v47;
      v35[6] = &v37;
      v32 = objc_retainBlock(v35);
      if ([v29 needsHeaderEnrichment])
      {
        [(CarrierBundlingEligibilityOperation *)self _sendEnrichmentRequestWithPreflightResponse:v29 outputBlock:v32];
      }
      else if ([v29 needsSilentSMS])
      {
        [(CarrierBundlingEligibilityOperation *)self _sendSilentSMSRequestWithPreflightResponse:v29 outputBlock:v32];
      }
    }
  }
  [(CarrierBundlingEligibilityOperation *)self lock];
  objc_storeStrong((id *)&self->_eligibilityResponse, v48[5]);
  [(CarrierBundlingEligibilityOperation *)self unlock];
  [(CarrierBundlingEligibilityOperation *)self setError:v42[5]];
  [(CarrierBundlingEligibilityOperation *)self setSuccess:*((unsigned __int8 *)v38 + 24)];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)_finishEnrichmentWithSessionID:(id)a3 carrierResponse:(id)a4 URLResponse:(id)a5 URLError:(id)a6 outputBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v30 = (void (**)(id, CarrierBundlingEligibilityResponse *, id))a7;
  id v16 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v16 setHTTPMethod:@"POST"];
  [v16 setURLBagKey:@"fuseHeaderEnrichmentResponse"];
  [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  uint64_t v31 = v15;
  id v17 = -[CarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionaryWithResponseCode:error:](self, "_newDefaultRequestBodyDictionaryWithResponseCode:error:", [v14 statusCode], v15);
  v18 = v17;
  if (v13) {
    [v17 setObject:v13 forKey:@"responseMessage"];
  }
  if (v12) {
    [v18 setObject:v12 forKey:@"sessionId"];
  }
  v32 = v12;
  if ([(CarrierBundlingEligibilityOperation *)self isDeepLink]) {
    [v18 setObject:@"true" forKey:@"deepLink"];
  }
  v29 = v18;
  v19 = +[NSJSONSerialization dataWithJSONObject:v18 options:0 error:0];
  [v16 setHTTPBody:v19];

  while (1)
  {
    id v20 = objc_alloc_init((Class)ISStoreURLOperation);
    v21 = +[DaemonProtocolDataProvider provider];
    [v20 setDataProvider:v21];

    [v20 setRequestProperties:v16];
    id v33 = 0;
    unsigned int v22 = [(CarrierBundlingEligibilityOperation *)self runSubOperation:v20 returningError:&v33];
    id v23 = v33;
    v24 = [v20 dataProvider];
    v25 = [v24 output];

    v26 = 0;
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = [[CarrierBundlingEligibilityResponse alloc] initWithEligibilityDictionary:v25];
      }
      else {
        v26 = 0;
      }
    }
    if (![(CarrierBundlingEligibilityResponse *)v26 wantsDelayedRetry]) {
      break;
    }
    [(CarrierBundlingEligibilityResponse *)v26 delayInterval];
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
  }
  v27 = [(CarrierBundlingEligibilityResponse *)v26 error];

  if (v27)
  {
    uint64_t v28 = [(CarrierBundlingEligibilityResponse *)v26 error];

    v26 = 0;
    id v23 = (id)v28;
  }
  v30[2](v30, v26, v23);
}

- (void)_finishSilentSMSWithSessionID:(id)a3 responseCode:(int64_t)a4 smsSendingError:(id)a5 outputBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v26 = (void (**)(id, CarrierBundlingEligibilityResponse *, id))a6;
  id v12 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v12 setHTTPMethod:@"POST"];
  [v12 setURLBagKey:@"fuseHeaderEnrichmentResponse"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v27 = v11;
  id v13 = [(CarrierBundlingEligibilityOperation *)self _newDefaultRequestBodyDictionaryWithResponseCode:a4 error:v11];
  id v14 = v13;
  if (v10) {
    [v13 setObject:v10 forKey:@"sessionId"];
  }
  if ([(CarrierBundlingEligibilityOperation *)self isDeepLink]) {
    [v14 setObject:@"true" forKey:@"deepLink"];
  }
  v25 = v14;
  id v15 = +[NSJSONSerialization dataWithJSONObject:v14 options:0 error:0];
  [v12 setHTTPBody:v15];

  while (1)
  {
    id v16 = objc_alloc_init((Class)ISStoreURLOperation);
    id v17 = +[DaemonProtocolDataProvider provider];
    [v16 setDataProvider:v17];

    [v16 setRequestProperties:v12];
    id v28 = 0;
    unsigned int v18 = [(CarrierBundlingEligibilityOperation *)self runSubOperation:v16 returningError:&v28];
    id v19 = v28;
    id v20 = [v16 dataProvider];
    v21 = [v20 output];

    unsigned int v22 = 0;
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v22 = [[CarrierBundlingEligibilityResponse alloc] initWithEligibilityDictionary:v21];
      }
      else {
        unsigned int v22 = 0;
      }
    }
    if (![(CarrierBundlingEligibilityResponse *)v22 wantsDelayedRetry]) {
      break;
    }
    [(CarrierBundlingEligibilityResponse *)v22 delayInterval];
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
  }
  id v23 = [(CarrierBundlingEligibilityResponse *)v22 error];

  if (v23)
  {
    uint64_t v24 = [(CarrierBundlingEligibilityResponse *)v22 error];

    unsigned int v22 = 0;
    id v19 = (id)v24;
  }
  v26[2](v26, v22, v19);
}

- (id)_newDefaultRequestBodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(CarrierBundlingEligibilityOperation *)self cellularProviderName];
  if (v4) {
    [v3 setObject:v4 forKey:@"carrier"];
  }
  unsigned int v5 = +[ISDevice sharedInstance];
  v6 = [v5 guid];

  if (v6) {
    [v3 setObject:v6 forKey:@"guid"];
  }
  v7 = [(CarrierBundlingEligibilityOperation *)self mobileSubscriberCountryCode];

  if (v7) {
    [v3 setObject:v7 forKey:@"MCC"];
  }
  v8 = [(CarrierBundlingEligibilityOperation *)self mobileSubscriberNetworkCode];

  if (v8) {
    [v3 setObject:v8 forKey:@"MNC"];
  }
  [(CarrierBundlingEligibilityOperation *)self lock];
  v9 = self->_IMEI;

  [(CarrierBundlingEligibilityOperation *)self unlock];
  if (v9) {
    [v3 setObject:v9 forKey:@"IMEI"];
  }

  return v3;
}

- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(CarrierBundlingEligibilityOperation *)self _newDefaultRequestBodyDictionary];
  v8 = +[NSString stringWithFormat:@"%ld", a3];
  [v7 setObject:v8 forKey:@"responseCode"];

  if (v6)
  {
    v9 = [v6 domain];

    if (v9)
    {
      id v10 = [v6 domain];
      [v7 setObject:v10 forKey:@"error-domain"];
    }
    if ([v6 code])
    {
      id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
      [v7 setObject:v11 forKey:@"error-code"];
    }
    id v12 = [v6 userInfo];
    id v13 = [v12 objectForKey:NSLocalizedDescriptionKey];
    if (v13) {
      [v7 setObject:v13 forKey:@"error-title"];
    }
    id v14 = [v12 objectForKey:NSLocalizedFailureReasonErrorKey];

    if (v14) {
      [v7 setObject:v14 forKey:@"error-message"];
    }
    id v15 = [v12 objectForKey:NSUnderlyingErrorKey];

    if (v15)
    {
      id v16 = +[NSString stringWithFormat:@"%@", v15];
      [v7 setObject:v16 forKey:@"error-underlying"];
    }
  }

  return v7;
}

- (void)_sendEnrichmentRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4
{
  id v6 = a3;
  uint64_t v47 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = sub_1000B2AE4;
  v63 = sub_1000B2AF4;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1000B2AE4;
  v57 = sub_1000B2AF4;
  id v58 = 0;
  v50 = v6;
  uint64_t v49 = [v6 headerEnrichmentURL];
  if (v49)
  {
    [v6 delayInterval];
    if (v7 > 2.22044605e-16) {
      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
    }
    CFStringRef applicationID = (const __CFString *)kSSUserDefaultsIdentifier;
    while (1)
    {
      id v8 = objc_alloc_init((Class)ISURLOperation);
      v9 = +[ISDataProvider provider];
      [v8 setDataProvider:v9];

      [v8 _setLoadsHTTPFailures:1];
      id v10 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v49];
      [v10 setHTTPMethod:@"POST"];
      [v10 setITunesStoreRequest:0];
      [v10 setValue:@"ValidateMobile" forHTTPHeaderField:@"SOAPAction"];
      if (MGGetBoolAnswer()) {
        BOOL v11 = CFPreferencesGetAppBooleanValue(@"ISHeaderEnrichmentAllowsWiFi", applicationID, 0) == 0;
      }
      else {
        BOOL v11 = 1;
      }
      objc_msgSend(v10, "setRequiresCellularDataNetwork:", v11, v44);
      id v12 = [v50 headerEnrichmentMessage];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v12 dataUsingEncoding:4];
        [v10 setHTTPBody:v13];
      }
      [v10 setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
      [v8 setRequestProperties:v10];
      id v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14)
      {
        id v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      unsigned int v16 = [v14 shouldLogToDisk];
      id v17 = [v14 OSLogObject];
      unsigned int v18 = v17;
      if (v16) {
        int v19 = v15 | 2;
      }
      else {
        int v19 = v15;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        int v20 = v19;
      }
      else {
        int v20 = v19 & 2;
      }
      if (v20)
      {
        v21 = objc_opt_class();
        int v65 = 138412290;
        v66 = v21;
        id v22 = v21;
        LODWORD(v46) = 12;
        v45 = &v65;
        id v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23) {
          goto LABEL_22;
        }
        unsigned int v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v65, v46);
        free(v23);
        v45 = (int *)v18;
        SSFileLog();
      }

LABEL_22:
      uint64_t v24 = (id *)(v54 + 5);
      id obj = (id)v54[5];
      [(CarrierBundlingEligibilityOperation *)self runSubOperation:v8 returningError:&obj];
      objc_storeStrong(v24, obj);
      id v25 = [v8 response];
      if (v25)
      {
        id v26 = 0;
LABEL_24:
        v27 = objc_msgSend(v50, "headerEnrichmentSessionIdentifier", v45);
        id v28 = [v8 dataProvider];
        v29 = [v28 output];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v30 = [objc_alloc((Class)NSString) initWithData:v29 encoding:4];
        }
        else {
          id v30 = 0;
        }
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1000B3CDC;
        v51[3] = &unk_1003A58D8;
        v51[4] = &v53;
        v51[5] = &v59;
        [(CarrierBundlingEligibilityOperation *)self _finishEnrichmentWithSessionID:v27 carrierResponse:v30 URLResponse:v25 URLError:v26 outputBlock:v51];

        goto LABEL_32;
      }
      uint64_t v31 = [(id)v54[5] domain];
      unsigned int v32 = [v31 isEqualToString:NSURLErrorDomain];

      if (!v32)
      {
        id v26 = 0;
        id v25 = 0;
        goto LABEL_32;
      }
      id v25 = [objc_alloc((Class)NSHTTPURLResponse) initWithURL:v49 statusCode:400 HTTPVersion:@"HTTP/1.1" headerFields:0];
      id v26 = [(id)v54[5] copy];
      if (v25) {
        goto LABEL_24;
      }
LABEL_32:
      if (!objc_msgSend((id)v60[5], "needsHeaderEnrichment", v45))
      {

        goto LABEL_48;
      }
      id v33 = +[SSLogConfig sharedDaemonConfig];
      if (!v33)
      {
        id v33 = +[SSLogConfig sharedConfig];
      }
      unsigned int v34 = [v33 shouldLog];
      unsigned int v35 = [v33 shouldLogToDisk];
      v36 = [v33 OSLogObject];
      uint64_t v37 = v36;
      if (v35) {
        int v38 = v34 | 2;
      }
      else {
        int v38 = v34;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        int v39 = v38;
      }
      else {
        int v39 = v38 & 2;
      }
      if (v39)
      {
        char v40 = objc_opt_class();
        int v65 = 138412290;
        v66 = v40;
        id v41 = v40;
        LODWORD(v46) = 12;
        v44 = &v65;
        v42 = (void *)_os_log_send_and_compose_impl();

        if (!v42) {
          goto LABEL_45;
        }
        uint64_t v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v65, v46);
        free(v42);
        v44 = (int *)v37;
        SSFileLog();
      }

LABEL_45:
      [(id)v60[5] delayInterval];
      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
    }
  }
  uint64_t v43 = SSError();
  id v8 = (id)v54[5];
  v54[5] = v43;
LABEL_48:

  if (v47) {
    v47[2](v47, v60[5], v54[5]);
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
}

- (id)_sendPreflightRequest:(id *)a3
{
  id v5 = objc_alloc_init((Class)ISLoadURLBagOperation);
  id v44 = 0;
  [(CarrierBundlingEligibilityOperation *)self runSubOperation:v5 returningError:&v44];
  id v6 = v44;
  double v7 = [v5 URLBag];
  uint64_t v8 = [v7 urlForKey:@"fuseHeaderEnrichment"];
  v9 = (void *)v8;
  if (v6) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7 == 0;
  }
  if (!v10 && v8 == 0)
  {
    id v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      id v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      v27 |= 2u;
    }
    id v28 = [v26 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
      v27 &= 2u;
    }
    if (v27)
    {
      v29 = objc_opt_class();
      int v45 = 138412290;
      uint64_t v46 = v29;
      id v30 = v29;
      LODWORD(v38) = 12;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_34:

        unsigned int v32 = objc_alloc_init(CarrierBundlingEligibilityResponse);
        [(CarrierBundlingEligibilityResponse *)v32 setBundlingStatus:2];
        id v33 = 0;
        goto LABEL_44;
      }
      id v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v45, v38);
      free(v31);
      SSFileLog();
    }

    goto LABEL_34;
  }
  if (!v8)
  {
    SSError();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v32 = 0;
    goto LABEL_44;
  }
  id v12 = objc_alloc_init((Class)ISStoreURLOperation);
  id v13 = +[DaemonProtocolDataProvider provider];
  [v12 setDataProvider:v13];

  [v12 setMachineDataStyle:3];
  id v14 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v9];
  [v14 setHTTPMethod:@"POST"];
  [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v15 = [(CarrierBundlingEligibilityOperation *)self _newDefaultRequestBodyDictionary];
  uint64_t v16 = [(CarrierBundlingEligibilityOperation *)self phoneNumber];
  if (v16) {
    [v15 setObject:v16 forKey:@"phoneNumber"];
  }
  int v39 = (void *)v16;
  if ([(CarrierBundlingEligibilityOperation *)self isDeepLink]) {
    [v15 setObject:@"true" forKey:@"deepLink"];
  }
  id v41 = a3;
  id v42 = v6;
  char v40 = v15;
  id v17 = +[NSJSONSerialization dataWithJSONObject:v15 options:0 error:0];
  [v14 setHTTPBody:v17];

  [v12 setRequestProperties:v14];
  unsigned int v18 = +[SSLogConfig sharedDaemonConfig];
  if (!v18)
  {
    unsigned int v18 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  v21 = [v18 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    int v22 = v20;
  }
  else {
    int v22 = v20 & 2;
  }
  if (!v22)
  {
    id v6 = v42;
    goto LABEL_37;
  }
  id v23 = objc_opt_class();
  int v45 = 138412290;
  uint64_t v46 = v23;
  id v24 = v23;
  LODWORD(v38) = 12;
  id v25 = (void *)_os_log_send_and_compose_impl();

  id v6 = v42;
  if (v25)
  {
    v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v45, v38);
    free(v25);
    SSFileLog();
LABEL_37:
  }
  id v43 = 0;
  unsigned int v34 = [(CarrierBundlingEligibilityOperation *)self runSubOperation:v12 returningError:&v43];
  id v33 = v43;
  unsigned int v32 = 0;
  a3 = v41;
  if (v34)
  {
    unsigned int v35 = [v12 dataProvider];
    v36 = [v35 output];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v32 = [[CarrierBundlingEligibilityResponse alloc] initWithEligibilityDictionary:v36];
    }
    else {
      unsigned int v32 = 0;
    }

    id v6 = v42;
  }

LABEL_44:
  if (a3 && !v32) {
    *a3 = v33;
  }

  return v32;
}

- (void)_sendSilentSMSRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4
{
  id v6 = a3;
  uint64_t v47 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = sub_1000B2AE4;
  uint64_t v61 = sub_1000B2AF4;
  id v62 = 0;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_1000B2AE4;
  uint64_t v55 = sub_1000B2AF4;
  id v56 = 0;
  v48 = [v6 silentSMSMessage];
  uint64_t v7 = [v6 silentSMSNumber];
  uint64_t v8 = (void *)v7;
  if (!v48 || !v7)
  {
    uint64_t v43 = SSError();
    id v12 = (id)v52[5];
    v52[5] = v43;
    goto LABEL_49;
  }
  [v6 delayInterval];
  if (v9 > 2.22044605e-16) {
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
  }
  while (1)
  {
    BOOL v10 = +[SSVTelephonyController sharedController];
    id v50 = 0;
    unsigned int v11 = [v10 sendSMSWithText:v48 toPhoneNumber:v8 countryCode:0 error:&v50];
    id v12 = v50;

    if (v11)
    {
      id v13 = +[SSLogConfig sharedDaemonConfig];
      if (!v13)
      {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v14 = [v13 shouldLog];
      unsigned int v15 = [v13 shouldLogToDisk];
      uint64_t v16 = [v13 OSLogObject];
      id v17 = v16;
      if (v15) {
        int v18 = v14 | 2;
      }
      else {
        int v18 = v14;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        int v19 = v18;
      }
      else {
        int v19 = v18 & 2;
      }
      if (!v19) {
        goto LABEL_17;
      }
      int v20 = objc_opt_class();
      int v63 = 138412290;
      id v64 = v20;
      id v21 = v20;
      LODWORD(v46) = 12;
      int v45 = &v63;
      int v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v63, v46);
        free(v22);
        int v45 = (int *)v17;
        SSFileLog();
LABEL_17:
        uint64_t v23 = 200;
        goto LABEL_30;
      }
      uint64_t v23 = 200;
    }
    else
    {
      id v13 = +[SSLogConfig sharedDaemonConfig];
      if (!v13)
      {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = [v13 shouldLog];
      unsigned int v25 = [v13 shouldLogToDisk];
      id v26 = [v13 OSLogObject];
      id v17 = v26;
      if (v25) {
        int v27 = v24 | 2;
      }
      else {
        int v27 = v24;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        int v28 = v27;
      }
      else {
        int v28 = v27 & 2;
      }
      if (!v28) {
        goto LABEL_29;
      }
      v29 = objc_opt_class();
      int v63 = 138412290;
      id v64 = v29;
      id v30 = v29;
      LODWORD(v46) = 12;
      int v45 = &v63;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (v31)
      {
        id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v63, v46);
        free(v31);
        int v45 = (int *)v17;
        SSFileLog();
LABEL_29:
        uint64_t v23 = 460;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v23 = 460;
    }
LABEL_31:

    unsigned int v32 = [v6 headerEnrichmentSessionIdentifier];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000B4A0C;
    v49[3] = &unk_1003A58D8;
    v49[4] = &v51;
    v49[5] = &v57;
    [(CarrierBundlingEligibilityOperation *)self _finishSilentSMSWithSessionID:v32 responseCode:v23 smsSendingError:v12 outputBlock:v49];
    if (![(id)v58[5] needsSilentSMS]) {
      break;
    }
    id v33 = +[SSLogConfig sharedDaemonConfig];
    if (!v33)
    {
      id v33 = +[SSLogConfig sharedConfig];
    }
    unsigned int v34 = objc_msgSend(v33, "shouldLog", v45);
    unsigned int v35 = [v33 shouldLogToDisk];
    v36 = [v33 OSLogObject];
    uint64_t v37 = v36;
    if (v35) {
      int v38 = v34 | 2;
    }
    else {
      int v38 = v34;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      int v39 = v38;
    }
    else {
      int v39 = v38 & 2;
    }
    if (v39)
    {
      char v40 = objc_opt_class();
      int v63 = 138412290;
      id v64 = v40;
      id v41 = v40;
      LODWORD(v46) = 12;
      id v44 = &v63;
      id v42 = (void *)_os_log_send_and_compose_impl();

      if (!v42) {
        goto LABEL_44;
      }
      uint64_t v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v63, v46);
      free(v42);
      id v44 = (int *)v37;
      SSFileLog();
    }

LABEL_44:
    [(id)v58[5] delayInterval];
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:");
  }
LABEL_49:

  if (v47) {
    v47[2](v47, v58[5], v52[5]);
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_mobileSubscriberNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileSubscriberCountryCode, 0);
  objc_storeStrong((id *)&self->_eligibilityResponse, 0);

  objc_storeStrong((id *)&self->_cellularProviderName, 0);
}

@end