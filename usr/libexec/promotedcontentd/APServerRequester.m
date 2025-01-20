@interface APServerRequester
- (APIDAccount_Private)idAccount;
- (APServerRequester)initWithBundleID:(id)a3 requestIdentifier:(id)a4 contextIdentifier:(id)a5 contentIdentifier:(id)a6 idAccount:(id)a7;
- (BOOL)cancelled;
- (BOOL)isAllowedEmptyResponse;
- (BOOL)shouldSignRequestWithMessageId:(int64_t)a3;
- (Class)responseClass;
- (NSArray)adServerEnvironment;
- (NSDictionary)headers;
- (NSString)bundleID;
- (NSString)contentIdentifier;
- (NSString)contextIdentifier;
- (NSUUID)requestIdentifier;
- (double)responseTime;
- (double)roundedTimestamp;
- (double)timestamp;
- (id)_accountIDsDict;
- (id)_deserializeResponse:(id)a3 error:(id *)a4;
- (id)_serverConfiguration;
- (id)_serverEnvironmentTranslation:(id)a3;
- (id)additionalRequestDescription;
- (id)additionalResponseDescription;
- (id)buildURLForRequestProtobuf:(id)a3;
- (id)idsAsString;
- (id)makeNetworkRequest:(id)a3;
- (id)protoBuffer;
- (void)_logRequestURL:(id)a3 headers:(id)a4 body:(id)a5;
- (void)_logResponse:(id)a3 responseProtobuf:(id)a4 requestProtobufClass:(Class)a5 error:(id)a6;
- (void)cancelDelayedRequest;
- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5;
- (void)makeRequest:(id)a3;
- (void)setAdServerEnvironment:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setContentIdentifier:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setResponseTime:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation APServerRequester

- (Class)responseClass
{
  v3 = NSStringFromSelector(a2);
  v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  APSimulateCrash();

  v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isAllowedEmptyResponse
{
  return 0;
}

- (APServerRequester)initWithBundleID:(id)a3 requestIdentifier:(id)a4 contextIdentifier:(id)a5 contentIdentifier:(id)a6 idAccount:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v24 = a5;
  id v23 = a6;
  id v15 = a7;
  v16 = v15;
  v17 = 0;
  if (v13 && v14 && v15)
  {
    v25.receiver = self;
    v25.super_class = (Class)APServerRequester;
    v18 = [(APServerRequester *)&v25 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_bundleID, a3);
      objc_storeStrong((id *)&v19->_requestIdentifier, a4);
      objc_storeStrong((id *)&v19->_contextIdentifier, a5);
      objc_storeStrong((id *)&v19->_contentIdentifier, a6);
      objc_storeStrong((id *)&v19->_idAccount, a7);
      v20 = +[NSDate date];
      [v20 timeIntervalSince1970];
      v19->_timestamp = v21;
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

- (double)roundedTimestamp
{
  v2 = +[NSNumber numberWithDouble:self->_timestamp];
  v3 = v2;
  if (v2)
  {
    [v2 decimalValue];
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    int v11 = 0;
  }
  v4 = +[NSDecimalNumber decimalNumberWithDecimal:v10];
  v5 = +[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:3 scale:1 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  v6 = [v4 decimalNumberByRoundingAccordingToBehavior:v5];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (NSDictionary)headers
{
  v3 = +[NSDate date];
  [v3 timeIntervalSince1970];
  uint64_t v5 = v4;

  v6 = +[NSMutableDictionary dictionaryWithCapacity:7];
  double v7 = +[NSString stringWithFormat:@"%.6f", v5];
  [v6 setValue:v7 forKey:@"timestamp"];

  double v8 = [(APServerRequester *)self bundleID];
  [v6 setValue:v8 forKey:@"bundleID"];

  v9 = +[APDeviceInfo current];
  v10 = [v9 deviceModel];
  [v6 setValue:v10 forKey:@"device"];

  int v11 = +[APDeviceInfo current];
  v12 = [v11 osVersionAndBuild];
  [v6 setValue:v12 forKey:@"os_Version"];

  id v13 = [(APServerRequester *)self idAccount];
  id v14 = [v13 storefront];
  [v6 setValue:v14 forKey:@"storefront"];

  id v15 = +[APDeviceInfo current];
  v16 = [(APServerRequester *)self bundleID];
  v17 = [(APServerRequester *)self idAccount];
  v18 = [v17 storefront];
  v19 = [v15 userAgentStringForBundleID:v16 storefront:v18];
  [v6 setValue:v19 forKey:@"User-Agent"];

  [v6 setValue:@"com.apple.ap.promotedcontentd" forKey:@"Request-Source"];
  id v20 = [v6 copy];

  return (NSDictionary *)v20;
}

- (id)protoBuffer
{
  v3 = NSStringFromSelector(a2);
  uint64_t v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  APSimulateCrash();

  uint64_t v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)idsAsString
{
  v3 = [(APServerRequester *)self idAccount];
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v4 = objc_alloc((Class)NSUserDefaults);
    id v5 = [v4 initWithSuiteName:APDefaultsBundleID];
    if ([v5 BOOLForKey:kAPAutomationLoggingEnabled])
    {
      v6 = [(APServerRequester *)self _accountIDsDict];
      id v7 = [v6 jsonString];
      goto LABEL_6;
    }
  }
  id v5 = [v3 iTunesDSID];
  v6 = [v3 iAdID];
  double v8 = [v3 DPID];
  v9 = [v3 contentID];
  v10 = [v3 anonymousDemandID];
  int v11 = [v3 toroID];
  v12 = [v3 deviceNewsPlusSubscriberID];
  id v7 = +[NSString stringWithFormat:@"DSID: %@\niAdID: %@\nDPID: %@\nContentID: %@\nAnonymousDemandID: %@\nToroID: %@\nDeviceNewsPlusSubscriberID: %@", v5, v6, v8, v9, v10, v11, v12];

LABEL_6:

  return v7;
}

- (BOOL)shouldSignRequestWithMessageId:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1C) & (0xC00000Eu >> a3);
}

- (id)buildURLForRequestProtobuf:(id)a3
{
  id v4 = [(id)objc_opt_class() options];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"messageIndex"];
    if (v6)
    {
      id v7 = [(APServerRequester *)self _serverConfiguration];
      double v8 = [(APServerRequester *)self bundleID];
      v9 = [v7 serverURLForMessageID:v6 andBundleID:v8];

      v10 = APPBAdsOptions();
      int v11 = [v10 objectForKeyedSubscript:@"protocolVersion"];

      if (v11)
      {
        v12 = [v9 URLByAppendingPathComponent:v11];
        id v13 = [v5 objectForKeyedSubscript:@"URLSuffix"];
        if (v13)
        {
          id v14 = [v12 URLByAppendingPathComponent:v13];
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)makeRequest:(id)a3
{
  id v3 = [(APServerRequester *)self makeNetworkRequest:a3];
}

- (id)makeNetworkRequest:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(APServerRequester *)self headers];
  v6 = [(APServerRequester *)self protoBuffer];
  if (!v6)
  {
    double v21 = +[NSError errorWithDomain:@"com.apple.ap.LegacyInterface" code:1001 userInfo:0];
    v4[2](v4, 0, v21);

LABEL_21:
    id v24 = 0;
    goto LABEL_30;
  }
  id v7 = [(APServerRequester *)self bundleID];

  if (!v7)
  {
    v22 = APLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "BundleID cannot be nil, aborting the request.", buf, 2u);
    }

    id v23 = +[NSError errorWithDomain:@"com.apple.ap.LegacyInterface" code:1003 userInfo:0];
    v4[2](v4, 0, v23);

    goto LABEL_21;
  }
  double v8 = [(APServerRequester *)self buildURLForRequestProtobuf:v6];
  if (v8)
  {
    if (+[APSystemInternal isAppleInternalInstall])
    {
      uint64_t v9 = [(APServerRequester *)self _serverEnvironmentTranslation:v8];
      v10 = (void *)v9;
      if (v9)
      {
        uint64_t v41 = v9;
        int v11 = +[NSArray arrayWithObjects:&v41 count:1];
        [(APServerRequester *)self setAdServerEnvironment:v11];
      }
      v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [(APServerRequester *)self adServerEnvironment];
        *(_DWORD *)buf = 138543362;
        id v40 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Making request to ad server environment %{public}@", buf, 0xCu);
      }
    }
    id v14 = +[APProtobufSerialization serializeProtobuffer:v6];
    if (v14)
    {
      [(APServerRequester *)self requestWillSend:v8 headers:v5 request:v6];
      v34 = [(id)objc_opt_class() options];
      v33 = [v34 objectForKeyedSubscript:@"messageIndex"];
      if (-[APServerRequester shouldSignRequestWithMessageId:](self, "shouldSignRequestWithMessageId:", [v33 integerValue]))
      {
        id v15 = APLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "New signing service is not enabled, sign data using old service.", buf, 2u);
        }

        v16 = +[APMescalSigningService service];
        id v38 = 0;
        v17 = [v16 signatureForData:v14 error:&v38];
        id v18 = v38;

        if (![v17 length] || v18)
        {
          id v20 = APLogForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v40 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to get a signature for LI server request: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v19 = [v5 mutableCopy];
          [v19 setObject:v17 forKeyedSubscript:@"X-Apple-ActionSignature"];
          id v20 = v5;
          id v5 = v19;
        }
      }
      [(APServerRequester *)self _logRequestURL:v8 headers:v5 body:v6];
      v26 = +[NSDate date];
      [v26 timeIntervalSince1970];
      v28 = v27;

      v29 = objc_opt_class();
      objc_initWeak((id *)buf, self);
      v30 = +[APNetworkClient sharedAPNetworkClient];
      v31 = [(APServerRequester *)self bundleID];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10009F7F0;
      v35[3] = &unk_100235080;
      objc_copyWeak(v37, (id *)buf);
      v37[1] = v28;
      v37[2] = v29;
      v36 = v4;
      id v24 = [v30 POST:v8 client:v31 headers:v5 body:v14 completionHandler:v35];

      objc_destroyWeak(v37);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v34 = +[NSError errorWithDomain:@"com.apple.ap.LegacyInterface" code:1002 userInfo:0];
      v4[2](v4, 0, v34);
      id v24 = 0;
    }
  }
  else
  {
    objc_super v25 = +[NSError errorWithDomain:@"com.apple.ap.LegacyInterface" code:1004 userInfo:0];
    v4[2](v4, 0, v25);

    id v24 = 0;
  }

LABEL_30:

  return v24;
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (qword_100289838 != -1) {
    dispatch_once(&qword_100289838, &stru_1002350A0);
  }
  v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [(APServerRequester *)self requestIdentifier];
    *(_DWORD *)buf = 138412546;
    id v20 = v11;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Delaying request with ID %@ for %.2f seconds.", buf, 0x16u);
  }
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  id v13 = qword_100289830;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009FC20;
  block[3] = &unk_1002350C8;
  block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_after(v12, v13, block);
}

- (id)_accountIDsDict
{
  v2 = [(APServerRequester *)self idAccount];
  v26[0] = @"DSID";
  uint64_t v3 = [v2 iTunesDSID];
  id v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = &stru_1002392C0;
  }
  v27[0] = v5;
  v26[1] = @"iAdID";
  uint64_t v6 = [v2 iAdID];
  id v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_1002392C0;
  }
  v27[1] = v8;
  v26[2] = @"DPID";
  uint64_t v9 = [v2 DPID];
  v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = &stru_1002392C0;
  }
  v27[2] = v11;
  v26[3] = @"ContentID";
  uint64_t v12 = [v2 contentID];
  id v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = &stru_1002392C0;
  }
  v27[3] = v14;
  v26[4] = @"AnonymousDemandID";
  uint64_t v15 = [v2 anonymousDemandID];
  v16 = (void *)v15;
  if (v15) {
    CFStringRef v17 = (const __CFString *)v15;
  }
  else {
    CFStringRef v17 = &stru_1002392C0;
  }
  v27[4] = v17;
  v26[5] = @"ToroID";
  uint64_t v18 = [v2 toroID];
  v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = &stru_1002392C0;
  }
  v27[5] = v20;
  v26[6] = @"DeviceNewsPlusSubscriberID";
  uint64_t v21 = [v2 deviceNewsPlusSubscriberID];
  double v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_1002392C0;
  }
  v27[6] = v23;
  id v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];

  return v24;
}

- (void)_logRequestURL:(id)a3 headers:(id)a4 body:(id)a5
{
  id v77 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = [(APServerRequester *)self idsAsString];
    *(_DWORD *)buf = 138477827;
    v84 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "IDs for request:\n%{private}@", buf, 0xCu);
  }
  uint64_t v12 = +[NSMutableDictionary dictionaryWithCapacity:2];
  id v13 = v12;
  if (v8)
  {
    [v12 setValue:v8 forKey:@"headers"];
  }
  else
  {
    CFStringRef v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Request headers were nil", buf, 2u);
    }
  }
  uint64_t v15 = [v9 dictionaryRepresentation];

  if (v15)
  {
    v16 = [v9 dictionaryRepresentation];
    [v13 setValue:v16 forKey:@"body"];
  }
  else
  {
    v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Request body was nil", buf, 2u);
    }
  }

  CFStringRef v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    CFStringRef v20 = [(APServerRequester *)self requestIdentifier];
    uint64_t v21 = [(APServerRequester *)self contextIdentifier];
    double v22 = [(APServerRequester *)self contentIdentifier];
    CFStringRef v23 = [(APServerRequester *)self additionalRequestDescription];
    [v13 jsonString];
    v75 = v13;
    id v24 = v9;
    v26 = id v25 = v8;
    *(_DWORD *)buf = 138544899;
    v84 = v19;
    __int16 v85 = 2113;
    id v86 = v77;
    __int16 v87 = 2114;
    v88 = v20;
    __int16 v89 = 2114;
    v90 = v21;
    __int16 v91 = 2114;
    v92 = v22;
    __int16 v93 = 2113;
    v94 = v23;
    __int16 v95 = 2113;
    v96 = v26;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Making %{public}@ to %{private}@ with identifiers {\"r\":%{public}@, \"ctx\":[%{public}@], \"cnt\":[%{public}@]} %{private}@:\n%{private}@", buf, 0x48u);

    id v8 = v25;
    id v9 = v24;
    id v13 = v75;
  }
  if (+[APSystemInternal isAppleInternalInstall]&& objc_opt_class())
  {
    id v73 = objc_alloc_init((Class)APTestHookSender);
    v68 = [(APServerRequester *)self _accountIDsDict];
    v71 = v27;
    id v28 = objc_alloc((Class)APTestHookID);
    v29 = [(APServerRequester *)self requestIdentifier];
    v30 = [v29 UUIDString];
    v76 = v13;
    id v31 = [v28 initWithID:v30 ofType:2];
    v82[0] = v31;
    id v32 = objc_alloc((Class)APTestHookID);
    v33 = [(APServerRequester *)self contentIdentifier];
    id v34 = [v32 initWithID:v33 ofType:1];
    v82[1] = v34;
    id v72 = v8;
    id v35 = objc_alloc((Class)APTestHookID);
    [(APServerRequester *)self contextIdentifier];
    v36 = id v74 = v9;
    id v37 = [v35 initWithID:v36 ofType:0];
    v82[2] = v37;
    id v38 = +[NSArray arrayWithObjects:v82 count:3];
    [v73 send:v68 ofType:1 withMetadata:0 forIDs:v38];

    v80[0] = &off_1002492F0;
    v69 = [(APServerRequester *)self requestIdentifier];
    v81[0] = v69;
    v80[1] = &off_100249308;
    uint64_t v39 = [(APServerRequester *)self contentIdentifier];
    v67 = (void *)v39;
    if (v39) {
      CFStringRef v40 = (const __CFString *)v39;
    }
    else {
      CFStringRef v40 = &stru_1002392C0;
    }
    v81[1] = v40;
    v80[2] = &off_100249320;
    uint64_t v41 = [(APServerRequester *)self contextIdentifier];
    v42 = (void *)v41;
    if (v41) {
      CFStringRef v43 = (const __CFString *)v41;
    }
    else {
      CFStringRef v43 = &stru_1002392C0;
    }
    v81[2] = v43;
    v44 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];
    id v45 = objc_alloc((Class)APTestHookID);
    v66 = [(APServerRequester *)self requestIdentifier];
    v46 = [v66 UUIDString];
    id v47 = [v45 initWithID:v46 ofType:2];
    v79[0] = v47;
    id v48 = objc_alloc((Class)APTestHookID);
    v49 = [(APServerRequester *)self contentIdentifier];
    id v50 = [v48 initWithID:v49 ofType:1];
    v79[1] = v50;
    id v51 = objc_alloc((Class)APTestHookID);
    v52 = [(APServerRequester *)self contextIdentifier];
    id v53 = [v51 initWithID:v52 ofType:0];
    v79[2] = v53;
    v54 = +[NSArray arrayWithObjects:v79 count:3];
    [v73 send:v44 ofType:0 withMetadata:0 forIDs:v54];

    id v8 = v72;
    id v55 = [objc_alloc((Class)APTestHookMetadata) initWithHttpHeaders:v72];
    id v56 = objc_alloc((Class)APTestHookID);
    v70 = [(APServerRequester *)self requestIdentifier];
    v57 = [v70 UUIDString];
    id v58 = [v56 initWithID:v57 ofType:2];
    v78[0] = v58;
    id v59 = objc_alloc((Class)APTestHookID);
    v60 = [(APServerRequester *)self contentIdentifier];
    id v61 = [v59 initWithID:v60 ofType:1];
    v78[1] = v61;
    id v62 = objc_alloc((Class)APTestHookID);
    v63 = [(APServerRequester *)self contextIdentifier];
    id v64 = [v62 initWithID:v63 ofType:0];
    v78[2] = v64;
    v65 = +[NSArray arrayWithObjects:v78 count:3];
    [v73 send:v74 withMetadata:v55 forIDs:v65];

    id v9 = v74;
    v27 = v71;

    id v13 = v76;
  }
}

- (id)additionalRequestDescription
{
  return &stru_1002392C0;
}

- (void)_logResponse:(id)a3 responseProtobuf:(id)a4 requestProtobufClass:(Class)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    id v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v14 = [(APServerRequester *)self requestIdentifier];
      id v15 = [v12 code];
      v16 = [v12 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v62 = v14;
      __int16 v63 = 2048;
      id v64 = v15;
      __int16 v65 = 2114;
      v66 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received error for request %{public}@\nCode:%ld\nReason:%{public}@", buf, 0x20u);
    }
    CFStringRef v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [v10 responseBody];
      v19 = [v18 base64EncodedStringWithOptions:0];
      *(_DWORD *)buf = 138543362;
      id v62 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Base64-encoded response is:\n%{public}@", buf, 0xCu);
    }
  }
  else if ([v10 valid])
  {
    CFStringRef v17 = +[NSMutableDictionary dictionaryWithCapacity:2];
    CFStringRef v20 = [v10 responseHeaders];

    if (v20)
    {
      uint64_t v21 = [v10 responseHeaders];
      [v17 setValue:v21 forKey:@"headers"];
    }
    else
    {
      uint64_t v21 = APLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Response headers were nil", buf, 2u);
      }
    }

    id v25 = [v11 dictionaryRepresentation];

    if (v25)
    {
      v26 = [v11 dictionaryRepresentation];
      [v17 setValue:v26 forKey:@"body"];
    }
    else
    {
      v26 = APLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Response body was nil", buf, 2u);
      }
    }

    v27 = APLogForCategory();
    id v28 = v27;
    if (v11)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        id v31 = NSStringFromClass(a5);
        id v32 = [(APServerRequester *)self requestIdentifier];
        v33 = [(APServerRequester *)self contextIdentifier];
        [(APServerRequester *)self contentIdentifier];
        id v34 = v55 = self;
        id v35 = [(APServerRequester *)self additionalRequestDescription];
        [v17 jsonString];
        v36 = id v58 = v10;
        *(_DWORD *)buf = 138544899;
        id v62 = v30;
        __int16 v63 = 2114;
        id v64 = v31;
        __int16 v65 = 2114;
        v66 = v32;
        __int16 v67 = 2114;
        v68 = v33;
        __int16 v69 = 2114;
        v70 = v34;
        __int16 v71 = 2113;
        id v72 = v35;
        __int16 v73 = 2113;
        id v74 = v36;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received %{public}@ from %{public}@ with identifiers {\"r\":%{public}@, \"ctx\":[%{public}@], \"cnt\":[%{public}@]} %{private}@:\n%{private}@", buf, 0x48u);

        id v10 = v58;
        self = v55;

        id v12 = 0;
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v37 = [(APServerRequester *)self requestIdentifier];
      id v38 = [v10 responseBody];
      *(_DWORD *)buf = 138543619;
      id v62 = v37;
      __int16 v63 = 2113;
      id v64 = v38;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Response protobuf was nil for request: %{public}@ with response: %{private}@", buf, 0x16u);
    }
  }
  else
  {
    double v22 = APLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      CFStringRef v23 = [(APServerRequester *)self requestIdentifier];
      *(_DWORD *)buf = 138543618;
      id v62 = v23;
      __int16 v63 = 2048;
      id v64 = [v10 responseStatusCode];
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Response not valid %{public}@\n status %ld", buf, 0x16u);
    }
    CFStringRef v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v10 responseHeaders];
      *(_DWORD *)buf = 138412290;
      id v62 = v24;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "response headers %@", buf, 0xCu);
    }
  }

  if (+[APSystemInternal isAppleInternalInstall]&& objc_opt_class())
  {
    id v40 = objc_alloc_init((Class)APTestHookSender);
    id v41 = objc_alloc((Class)APTestHookMetadata);
    v42 = [v10 responseHeaders];
    id v53 = [v41 initWithHttpHeaders:v42];

    id v43 = objc_alloc((Class)APTestHookID);
    [(APServerRequester *)self requestIdentifier];
    id v56 = v59 = v10;
    [v56 UUIDString];
    v54 = id v57 = v12;
    id v44 = [v43 initWithID:v54 ofType:2];
    v60[0] = v44;
    id v45 = objc_alloc((Class)APTestHookID);
    v46 = [(APServerRequester *)self contentIdentifier];
    id v47 = [v45 initWithID:v46 ofType:1];
    v60[1] = v47;
    id v48 = objc_alloc((Class)APTestHookID);
    [(APServerRequester *)self contextIdentifier];
    id v50 = v49 = v11;
    id v51 = [v48 initWithID:v50 ofType:0];
    v60[2] = v51;
    v52 = +[NSArray arrayWithObjects:v60 count:3];
    [v40 send:v49 withMetadata:v53 forIDs:v52];

    id v11 = v49;
    id v12 = v57;

    id v10 = v59;
  }
}

- (id)additionalResponseDescription
{
  return &stru_1002392C0;
}

- (void)cancelDelayedRequest
{
  uint64_t v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(APServerRequester *)self requestIdentifier];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling request with ID %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(APServerRequester *)self setCancelled:1];
}

- (id)_deserializeResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length] || !-[APServerRequester isAllowedEmptyResponse](self, "isAllowedEmptyResponse"))
  {
    id v8 = +[APProtobufSerialization deserializeProtobufferData:v6 ofClass:[(APServerRequester *)self responseClass] error:a4];
    id v7 = v8;
    if (v8)
    {
      id v9 = v8;
    }
    else if (a4)
    {
      id v10 = [(APServerRequester *)self requestIdentifier];
      id v11 = +[NSString stringWithFormat:@"Deserializing protobuffer failed for request %@.", v10];
      *a4 = +[APLegacyInterfaceError validationErrorWithCode:4501 andReason:v11];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_serverConfiguration
{
  if (qword_100289848 != -1) {
    dispatch_once(&qword_100289848, &stru_1002350E8);
  }
  v2 = (void *)qword_100289840;

  return v2;
}

- (id)_serverEnvironmentTranslation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  int v5 = +[NSURL URLWithString:kAPServerEnvironmentProductionBaseURL];
  id v6 = [v5 host];
  if ([v4 isEqual:v6])
  {

LABEL_4:
    id v11 = 0;
    goto LABEL_14;
  }
  id v7 = [v3 host];
  id v8 = +[NSURL URLWithString:@"https://news.iadsdk.apple.com/adserver/"];
  id v9 = [v8 host];
  unsigned __int8 v10 = [v7 isEqual:v9];

  if (v10) {
    goto LABEL_4;
  }
  id v12 = [v3 host];
  unsigned int v13 = [v12 containsString:@"iad2v1"];

  if (v13)
  {
    CFStringRef v14 = (id *)&kAPServerEnvironmentQE1;
LABEL_13:
    id v11 = (__CFString *)*v14;
    goto LABEL_14;
  }
  id v15 = [v3 host];
  unsigned int v16 = [v15 containsString:@"iad2v2"];

  if (v16)
  {
    CFStringRef v14 = (id *)&kAPServerEnvironmentQE2;
    goto LABEL_13;
  }
  CFStringRef v17 = [v3 host];
  unsigned int v18 = [v17 containsString:@"iad2v3"];

  if (v18)
  {
    CFStringRef v14 = (id *)&kAPServerEnvironmentQE3;
    goto LABEL_13;
  }
  v19 = [v3 host];
  unsigned int v20 = [v19 containsString:@"iad2v4"];

  if (v20)
  {
    CFStringRef v14 = (id *)&kAPServerEnvironmentQE4;
    goto LABEL_13;
  }
  double v22 = [v3 host];
  unsigned int v23 = [v22 containsString:@"iad2v5"];

  if (v23) {
    id v11 = @"QE5";
  }
  else {
    id v11 = @"custom";
  }
LABEL_14:

  return v11;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (APIDAccount_Private)idAccount
{
  return self->_idAccount;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSArray)adServerEnvironment
{
  return self->_adServerEnvironment;
}

- (void)setAdServerEnvironment:(id)a3
{
}

- (NSString)contextIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_adServerEnvironment, 0);
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end