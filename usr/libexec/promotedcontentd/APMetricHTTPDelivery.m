@interface APMetricHTTPDelivery
- (APDeliveryObservability)o11y;
- (APJourneySettings)journeySettings;
- (APMetricHTTPDelivery)init;
- (BOOL)_shouldReturnFakeResponse;
- (_TtC7Metrics27APSigningObservabilityDiary)diary;
- (id)_hashAndSavePayloadForInternalTesting:(id)a3 signature:(id)a4;
- (id)_serverURLForPurpose:(id)a3;
- (id)buildMetricDeliveryRequestFromData:(id)a3 toChannel:(id)a4 billing:(id)a5 signingAuthority:(id)a6 failIfSignatureIsNotAvailable:(BOOL)a7 error:(id *)a8;
- (id)sendHTTPDeliveryRequest:(id)a3 error:(id *)a4;
- (id)sendPayload:(id)a3 error:(id *)a4;
- (void)observeClientError:(int64_t)a3;
- (void)observeClientTimeout;
- (void)observerServerResponse:(int64_t)a3;
@end

@implementation APMetricHTTPDelivery

- (APMetricHTTPDelivery)init
{
  v10.receiver = self;
  v10.super_class = (Class)APMetricHTTPDelivery;
  v2 = [(APMetricHTTPDelivery *)&v10 init];
  if (v2)
  {
    v3 = [APDeliveryObservability alloc];
    v4 = objc_alloc_init(APDeliveryObservabilityCoreAnalyticsTransmitter);
    v5 = [(APDeliveryObservability *)v3 initWithTransmitter:v4];
    o11y = v2->_o11y;
    v2->_o11y = v5;

    v7 = objc_alloc_init(_TtC7Metrics27APSigningObservabilityDiary);
    diary = v2->_diary;
    v2->_diary = v7;
  }
  return v2;
}

- (APJourneySettings)journeySettings
{
  journeySettings = self->_journeySettings;
  if (!journeySettings)
  {
    v4 = +[APJourneySettings settings];
    v5 = self->_journeySettings;
    self->_journeySettings = v4;

    journeySettings = self->_journeySettings;
  }

  return journeySettings;
}

- (BOOL)_shouldReturnFakeResponse
{
  v2 = +[NSProcessInfo processInfo];
  unsigned int v3 = [v2 isRunningTests];

  if (v3)
  {
    v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      CFStringRef v7 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Metric data will not be sent running tests (%@)", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (id)buildMetricDeliveryRequestFromData:(id)a3 toChannel:(id)a4 billing:(id)a5 signingAuthority:(id)a6 failIfSignatureIsNotAvailable:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = objc_alloc_init(APMetricHTTPDeliveryRequest);
  [(APMetricHTTPDeliveryRequest *)v18 setData:v17];

  [(APMetricHTTPDeliveryRequest *)v18 setBilling:v15];
  v19 = [v16 destination];

  [(APMetricHTTPDeliveryRequest *)v18 setDestination:v19];
  if (!v14)
  {
    id v21 = 0;
LABEL_15:
    v29 = [(APMetricHTTPDelivery *)self diary];
    [v29 recordFailure];

    v20 = 0;
    if (v9) {
      goto LABEL_9;
    }
LABEL_16:
    if (+[APSystemInternal isAppleInternalInstall])
    {
      id v30 = objc_alloc((Class)NSUserDefaults);
      id v31 = [v30 initWithSuiteName:APDefaultsBundleID];
      v32 = [v31 objectForKey:@"APMetricDelivery.disableSigning"];
      unsigned __int8 v33 = [v32 BOOLValue];

      char v34 = v33 ^ 1;
    }
    else
    {
      char v34 = 1;
    }
    if (!+[APSystemInternal isAppleInternalInstall]|| (v34 & 1) != 0)
    {
      CFStringRef v44 = @"Content-Type";
      CFStringRef v45 = @"application/json";
      v35 = &v45;
      v36 = &v44;
      uint64_t v37 = 1;
    }
    else
    {
      v46[0] = @"Content-Type";
      v46[1] = @"X-Apple-BridgeTest";
      v47[0] = @"application/json";
      v47[1] = @"true";
      v35 = (const __CFString **)v47;
      v36 = (const __CFString **)v46;
      uint64_t v37 = 2;
    }
    v38 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v36 count:v37];
    [(APMetricHTTPDeliveryRequest *)v18 setHeaders:v38];
    v39 = v18;

    goto LABEL_33;
  }
  id v43 = 0;
  v20 = [(APMetricHTTPDeliveryRequest *)v18 buildSignatureUsingSigningAuthority:v14 error:&v43];
  id v21 = v43;
  if (!v20) {
    goto LABEL_15;
  }
  v22 = [(APMetricHTTPDelivery *)self diary];
  [v22 recordSuccess];

  id v23 = [v20 length];
  if (v21) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v23 == 0;
  }
  if (!v24 || !v9) {
    goto LABEL_16;
  }
LABEL_9:
  v25 = APLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138478083;
    v51 = v27;
    __int16 v52 = 2114;
    id v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to get a signature for Journey Server request: %{public}@", buf, 0x16u);
  }
  if (a8)
  {
    if (v21)
    {
      NSErrorUserInfoKey v48 = NSUnderlyingErrorKey;
      id v49 = v21;
      v28 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    }
    else
    {
      v28 = 0;
    }
    *a8 = +[NSError errorWithDomain:@"APMetricHTTPDeliveryDomain" code:8898 userInfo:v28];
  }
  if ([v14 state] == (id)18001)
  {
    if (qword_100289B60 == -1)
    {
      v39 = 0;
      goto LABEL_33;
    }
    dispatch_once(&qword_100289B60, &stru_100236530);
  }
  else
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100114E28;
    v41[3] = &unk_100233D50;
    id v42 = v14;
    if (qword_100289B68 != -1) {
      dispatch_once(&qword_100289B68, v41);
    }
  }
  v39 = 0;
LABEL_33:

  return v39;
}

- (id)_serverURLForPurpose:(id)a3
{
  id v4 = a3;
  v5 = [(APMetricHTTPDelivery *)self journeySettings];
  int v6 = [v4 value];
  unsigned int v7 = [v6 isEqualToString:@"ECRouter"];

  if (v7)
  {
    v8 = [v5 eCServerURL];
  }
  else
  {
    BOOL v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected destination (%@)", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)sendPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(APMetricHTTPDelivery *)self _shouldReturnFakeResponse])
  {
    unsigned int v7 = [v6 channel];
    v8 = [v7 destination];
    BOOL v9 = [(APMetricHTTPDelivery *)self _serverURLForPurpose:v8];

    id v10 = [objc_alloc((Class)NSHTTPURLResponse) initWithURL:v9 statusCode:200 HTTPVersion:0 headerFields:0];
  }
  else
  {
    int v11 = +[APSigningAuthorityPoolManager sharedInstance];
    BOOL v9 = [v11 currentSigningAuthority];

    id v12 = [v6 batchesData];
    v13 = [v6 channel];
    id v14 = [v6 billing];
    id v15 = [(APMetricHTTPDelivery *)self buildMetricDeliveryRequestFromData:v12 toChannel:v13 billing:v14 signingAuthority:v9 failIfSignatureIsNotAvailable:1 error:a4];

    id v16 = [v6 batchInfos];
    [v15 setBatchInfos:v16];

    uint64_t v17 = [v6 fakeNetworkResponse];
    if (v17)
    {
      v18 = (void *)v17;
      unsigned int v19 = +[APSystemInternal isAppleInternalInstall];

      if (v19)
      {
        v20 = [v6 fakeNetworkResponse];
        id v21 = [v15 headers];
        v22 = [v20 addFakeResponseHeadersToHeaders:v21];
        [v15 setHeaders:v22];
      }
    }
    if (v15)
    {
      id v10 = [(APMetricHTTPDelivery *)self sendHTTPDeliveryRequest:v15 error:a4];
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)sendHTTPDeliveryRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 signature];
  id v8 = [v7 length];

  if (v8)
  {
    BOOL v9 = [v6 destination];
    id v10 = [(APMetricHTTPDelivery *)self _serverURLForPurpose:v9];

    v35 = a4;
    if (+[APSystemInternal isAppleInternalInstall])
    {
      id v11 = objc_alloc((Class)NSUserDefaults);
      id v12 = [v11 initWithSuiteName:APDefaultsBundleID];
      v13 = [v12 stringForKey:kAPServerEnvironmentKey];
    }
    else
    {
      v13 = 0;
    }
    id v16 = (void *)kAPServerEnvironmentProduction;
    if (v13) {
      id v16 = v13;
    }
    id v17 = v16;

    v18 = +[APNetworkClient sharedAPNetworkClient];
    unsigned int v19 = [v6 billing];
    uint64_t v37 = v18;
    v20 = [v18 temporarySessionForClient:v19];

    *(void *)buf = 0;
    NSErrorUserInfoKey v48 = buf;
    uint64_t v49 = 0x3032000000;
    v50 = sub_100115670;
    v51 = sub_100115680;
    id v52 = 0;
    id v21 = dispatch_group_create();
    dispatch_group_enter(v21);
    v22 = dispatch_get_global_queue(9, 0);
    id v23 = [v6 batchInfos];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100115688;
    block[3] = &unk_100236580;
    block[4] = self;
    id v40 = v6;
    id v24 = v23;
    id v41 = v24;
    id v36 = v20;
    id v42 = v36;
    id v14 = v10;
    id v43 = v14;
    id v25 = v17;
    id v44 = v25;
    v46 = buf;
    v26 = v21;
    CFStringRef v45 = v26;
    dispatch_async(v22, block);
    dispatch_time_t v27 = dispatch_time(0, 120000000000);
    intptr_t v28 = dispatch_group_wait(v26, v27);
    v29 = sub_100118560();
    sub_100119874(v29, *((void **)v48 + 5), v28 != 0, v24);

    if (v28)
    {
      [(APMetricHTTPDelivery *)self observeClientTimeout];
      id v30 = APLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "We timed out waiting for the metric data to be sent to the server!", v38, 2u);
      }
      id v15 = 0;
    }
    else
    {
      id v15 = [*((id *)v48 + 5) URLResponse];
      id v31 = [*((id *)v48 + 5) responseError];
      id v30 = v31;
      if (v35) {
        id *v35 = v31;
      }
      if (v15)
      {
        -[APMetricHTTPDelivery observerServerResponse:](self, "observerServerResponse:", [v15 statusCode]);
      }
      else if (v30)
      {
        [(APMetricHTTPDelivery *)self observeClientError:[v30 code]];
      }
      v32 = APLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Metric data was sent to the server!", v38, 2u);
      }
    }
    unsigned __int8 v33 = (void *)*((void *)v48 + 5);
    *((void *)v48 + 5) = 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing signature.", buf, 2u);
    }
    id v15 = 0;
  }

  return v15;
}

- (void)observerServerResponse:(int64_t)a3
{
  if ((unint64_t)(a3 - 200) > 0x63)
  {
    if ((unint64_t)(a3 - 400) > 0x63)
    {
      if ((unint64_t)(a3 - 500) > 0x63) {
        return;
      }
      unsigned int v3 = [(APMetricHTTPDelivery *)self o11y];
      id v5 = v3;
      uint64_t v4 = 1;
    }
    else
    {
      unsigned int v3 = [(APMetricHTTPDelivery *)self o11y];
      id v5 = v3;
      uint64_t v4 = 0;
    }
    [v3 recordFailure:v4];
  }
  else
  {
    id v5 = [(APMetricHTTPDelivery *)self o11y];
    [v5 recordSuccess];
  }
}

- (void)observeClientError:(int64_t)a3
{
  if (a3 == -1009)
  {
    unsigned int v3 = [(APMetricHTTPDelivery *)self o11y];
    id v5 = v3;
    uint64_t v4 = 2;
  }
  else if (a3 == -1001)
  {
    unsigned int v3 = [(APMetricHTTPDelivery *)self o11y];
    id v5 = v3;
    uint64_t v4 = 3;
  }
  else
  {
    unsigned int v3 = [(APMetricHTTPDelivery *)self o11y];
    id v5 = v3;
    uint64_t v4 = 4;
  }
  [v3 recordFailure:v4];
}

- (void)observeClientTimeout
{
  id v2 = [(APMetricHTTPDelivery *)self o11y];
  [v2 recordFailure:3];
}

- (id)_hashAndSavePayloadForInternalTesting:(id)a3 signature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!+[APSystemInternal isAppleInternalInstall])goto LABEL_21; {
  id v7 = objc_alloc((Class)NSUserDefaults);
  }
  id v8 = [v7 initWithSuiteName:APDefaultsBundleID];
  if (![v8 BOOLForKey:kAPAutomationLoggingEnabled])
  {

LABEL_21:
    id v11 = 0;
    goto LABEL_22;
  }
  BOOL v9 = [@"/tmp/com.apple.ap.promotedcontentd" stringByAppendingPathComponent:@"EC"];
  id v10 = [v5 sha256];
  id v11 = [v10 asHexString];

  id v12 = [v9 stringByAppendingPathComponent:v11];
  v13 = [v9 stringByAppendingPathComponent:v11];
  id v14 = [v13 stringByAppendingPathExtension:@"sig"];

  id v15 = +[NSFileManager defaultManager];
  id v37 = 0;
  unsigned __int8 v16 = [v15 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v37];
  id v17 = v37;

  if ((v16 & 1) == 0)
  {
    v18 = APLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = [v17 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "error creating directory %{public}@", buf, 0xCu);
    }
  }
  v20 = +[NSFileManager defaultManager];
  unsigned __int8 v21 = [v20 fileExistsAtPath:v12];

  if ((v21 & 1) == 0)
  {
    v22 = +[NSFileManager defaultManager];
    [v22 createFileAtPath:v12 contents:0 attributes:0];
  }
  id v36 = v17;
  unsigned __int8 v23 = [v5 writeToFile:v12 options:1 error:&v36];
  id v24 = v36;

  if ((v23 & 1) == 0)
  {
    id v25 = APLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [v24 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v39 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "error writing to payload to file %{public}@", buf, 0xCu);
    }
  }
  dispatch_time_t v27 = +[NSFileManager defaultManager];
  unsigned __int8 v28 = [v27 fileExistsAtPath:v14];

  if ((v28 & 1) == 0)
  {
    v29 = +[NSFileManager defaultManager];
    [v29 createFileAtPath:v14 contents:0 attributes:0];
  }
  id v35 = v24;
  unsigned __int8 v30 = [v6 writeToFile:v14 atomically:1 encoding:4 error:&v35];
  id v31 = v35;

  if ((v30 & 1) == 0)
  {
    v32 = APLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v33 = [v31 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "error writing to signature to file %{public}@", buf, 0xCu);
    }
  }

LABEL_22:

  return v11;
}

- (_TtC7Metrics27APSigningObservabilityDiary)diary
{
  return self->_diary;
}

- (APDeliveryObservability)o11y
{
  return self->_o11y;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_o11y, 0);
  objc_storeStrong((id *)&self->_diary, 0);

  objc_storeStrong((id *)&self->_journeySettings, 0);
}

@end