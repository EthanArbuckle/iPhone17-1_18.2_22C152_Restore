@interface APAttributionServer
+ (BOOL)sendRequestToServer:(id)a3 requestTimestamp:(id)a4 payloadDeliveryTimestamp:(id)a5 interval:(unint64_t)a6 error:(id *)a7 completionHandler:(id)a8;
+ (void)_processSigningQueue:(id)a3 useFpdi:(BOOL)a4 signingAuthorityPoolManager:(id)a5;
+ (void)_serverPost:(id)a3 requestTimestamp:(id)a4 payloadDeliveryStartDate:(id)a5 interval:(unint64_t)a6 completionHandler:(id)a7;
+ (void)signPayloadWithFpdi:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 payloadDeliveryStartDate:(id)a8 completionHandler:(id)a9;
+ (void)signPayloadWithMescal:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 deliveryStartDate:(id)a8 isFallback:(BOOL)a9 completionHandler:(id)a10;
@end

@implementation APAttributionServer

+ (BOOL)sendRequestToServer:(id)a3 requestTimestamp:(id)a4 payloadDeliveryTimestamp:(id)a5 interval:(unint64_t)a6 error:(id *)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v17 = [v13 requestBody];

  if (v17)
  {
    v36 = v14;
    v18 = [v13 requestBody];
    id v44 = 0;
    v19 = +[NSJSONSerialization dataWithJSONObject:v18 options:0 error:&v44];
    id v20 = v44;

    BOOL v21 = v19 != 0;
    if (v19)
    {
      v22 = APPerfLogForCategory();
      v23 = v22;
      if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 134349056;
        unint64_t v48 = a6;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, a6, "Server Delivery Queue overhead", "id=%{public, name=id}lld", buf, 0xCu);
      }

      v24 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000673EC;
      block[3] = &unk_100234050;
      unint64_t v43 = a6;
      id v38 = v15;
      id v39 = v13;
      id v14 = v36;
      id v40 = v36;
      id v41 = v19;
      id v42 = v16;
      dispatch_async(v24, block);

      v25 = v38;
    }
    else
    {
      v30 = APLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = [v13 requestBody];
        v32 = [v31 jsonString];
        *(_DWORD *)buf = 138477827;
        unint64_t v48 = (unint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to serialize body %{private}@", buf, 0xCu);
      }
      if (a7)
      {
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        CFStringRef v46 = @"Unable to serialize body";
        v33 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v34 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v33];

        id v20 = v34;
        *a7 = v20;
      }
      id v14 = v36;
      v25 = [v13 payloadForRequestBodyABCLog];
      CreateDiagnosticReport();
    }
  }
  else
  {
    v26 = APLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Malformed request body", buf, 2u);
    }

    if (a7)
    {
      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      CFStringRef v50 = @"Malformed request body";
      v27 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v28 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v27];

      id v29 = v28;
      *a7 = v29;
    }
    id v20 = [v13 payloadForRequestBodyABCLog];
    CreateDiagnosticReport();
    BOOL v21 = 0;
  }

  return v21;
}

+ (void)_serverPost:(id)a3 requestTimestamp:(id)a4 payloadDeliveryStartDate:(id)a5 interval:(unint64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [v11 storefront];
  id v16 = v14;
  if (v15)
  {
    v17 = [v11 storefront];
    v18 = +[APAttributionAnalytics storefrontCountryOnly:v17];
  }
  else
  {
    v18 = @"NONE";
  }

  v19 = APPerfLogForCategory();
  id v20 = v19;
  unint64_t v21 = a6 - 1;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134349314;
    unint64_t v70 = a6;
    __int16 v71 = 2114;
    v72 = v18;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, a6, "HTTP Request Time", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", buf, 0x16u);
  }

  v22 = [v11 requestHeader];

  if (!v22)
  {
    v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Malformed request header", buf, 2u);
    }

    v24 = [v11 payloadForRequestHeaderABCLog];
    CreateDiagnosticReport();
  }
  v25 = [v11 requestHeader];
  v26 = +[NSMutableDictionary dictionaryWithDictionary:v25];

  v65 = v26;
  [v26 setObject:@"application/json; charset=utf-8" forKey:@"Content-Type"];
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v27 = +[NSProcessInfo processInfo];
    unsigned __int8 v28 = [v27 isRunningTests];

    if ((v28 & 1) == 0)
    {
      id v29 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:0];
      v30 = [v29 valueForKey:@"APAttribution.serverSignBody"];
      if (v30) {
        [v65 setObject:v30 forKey:@"X-Apple-BridgeTest"];
      }
    }
  }
  unint64_t spid = a6;
  v31 = [v11 requestBody];
  id v66 = 0;
  v32 = +[NSJSONSerialization dataWithJSONObject:v31 options:0 error:&v66];
  id v64 = v66;

  v33 = APLogForCategory();
  v34 = v33;
  if (v32)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v35 = [v11 requestBody];
      v36 = [v35 jsonString];
      *(_DWORD *)buf = 138477827;
      unint64_t v70 = (unint64_t)v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "JSON body %{private}@", buf, 0xCu);
    }
    id v62 = v13;

    v37 = APLogForCategory();
    id v38 = (void (**)(void, void, void, void))v16;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v39 = [v65 jsonString];
      *(_DWORD *)buf = 138477827;
      unint64_t v70 = (unint64_t)v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "JSON header %{private}@", buf, 0xCu);
    }
    id v40 = +[NSURL URLWithString:@"https://ca.iadsdk.apple.com/adserver/attribution/v2"];
    if (+[APSystemInternal isAppleInternalInstall])
    {
      v61 = v18;
      id v41 = v38;
      id v42 = objc_alloc_init(APServerConfiguration);
      unint64_t v43 = [(APServerConfiguration *)v42 serverURLForMessageID:&off_100249020 andBundleID:@"com.apple.ap.adprivacyd"];

      id v44 = [v43 URLByAppendingPathComponent:@"attribution/v2"];

      id v45 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:0];
      CFStringRef v46 = [v45 valueForKey:@"APAttribution.serverURLoverride"];
      if (v46)
      {
        uint64_t v47 = +[NSURL URLWithString:v46];

        id v44 = (void *)v47;
      }

      id v40 = v44;
      id v38 = v41;
      v18 = v61;
    }
    v54 = APLogForCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      unint64_t v70 = (unint64_t)v40;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Using %{private}@ to post attribution data", buf, 0xCu);
    }

    v55 = +[APNetworkClient sharedAPNetworkClient];
    v56 = [v11 bundleId];
    v57 = [v55 temporarySessionForClient:v56];

    id v58 = [objc_alloc((Class)APHTTPRequest) initWithURL:v40 HTTPMethod:2 HTTPHeaders:v65 HTTPBody:v32 serviceName:0 completionHandler:0];
    v59 = +[NSDate now];
    if (!+[APAttributionRetryWorkerBridge startWithSession:v57 request:v58 requestorId:@"attribution" intervalId:spid reportingStorefront:v18 requestTimestamp:v12 daemonStartTime:_daemonStartTime tokenReturnedToClientDate:v59 payloadDeliveryStartDate:v13])
    {
      v60 = APLogForCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Failed to initiate upload.", buf, 2u);
      }

      CreateDiagnosticReport();
      id v13 = v62;
    }
    if (v38) {
      v38[2](v38, 1, 0, 0);
    }

    v51 = v64;
  }
  else
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      unint64_t v48 = [v11 requestBody];
      NSErrorUserInfoKey v49 = [v48 jsonString];
      *(_DWORD *)buf = 138477827;
      unint64_t v70 = (unint64_t)v49;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Unable to serialize body %{private}@", buf, 0xCu);
    }
    NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
    CFStringRef v68 = @"Unable to serialize payload";
    CFStringRef v50 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    v51 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:1001 userInfo:v50];

    v52 = APPerfLogForCategory();
    v53 = v52;
    if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v70 = spid;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_END, spid, "HTTP Request Time", "id=%{public, name=id}lld", buf, 0xCu);
    }

    id v38 = (void (**)(void, void, void, void))v16;
    (*((void (**)(id, void, void *, void))v16 + 2))(v16, 0, v51, 0);
    id v40 = [v11 payloadForRequestBodyABCLog];
    CreateDiagnosticReport();
  }
}

+ (void)signPayloadWithFpdi:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 payloadDeliveryStartDate:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Signing: Got FPDI signing request.", buf, 2u);
  }

  id v65 = a1;
  id v21 = v17;
  if (qword_100288968 != -1) {
    dispatch_once(&qword_100288968, &stru_100234070);
  }
  [v15 timeIntervalSinceDate:_daemonStartTime];
  int64_t v22 = +[APAttributionAnalytics findBucketForDaemonRunningTime:](APAttributionAnalytics, "findBucketForDaemonRunningTime:");
  v23 = [v14 storefront];

  if (v23)
  {
    [v14 storefront];
    v25 = id v24 = v19;
    v26 = +[APAttributionAnalytics storefrontCountryOnly:v25];

    id v19 = v24;
  }
  else
  {
    v27 = APLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      __int16 v71 = "+[APAttributionServer signPayloadWithFpdi:requestTimestamp:interval:jsonBody:startDate:payloadDeliveryStartD"
            "ate:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{sensitive}s, Storefront is nil", buf, 0xCu);
    }

    CreateDiagnosticReport();
    v26 = @"NONE";
  }
  if (qword_100288950)
  {
    [(id)qword_100288960 lock];
    if ([(id)qword_100288950 state] == (id)18001)
    {
      id v63 = v19;
      [(id)qword_100288960 unlock];
      id v67 = 0;
      id v64 = [(id)qword_100288950 signatureForData:v16 error:&v67];
      id v28 = v67;
      +[NSDate now];
      uint64_t v61 = v60 = v28;
      if (v28)
      {
        id v29 = APLogForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v71 = (const char *)v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Signing: signingAuthorityPoolManager.state == APSigningAuthorityPoolManagerStateSetupSucceeded but signing failed: %{public}@. Fallback to Mescal.", buf, 0xCu);
        }

        id v19 = v63;
        LOBYTE(v58) = 1;
        v30 = v17;
        +[APAttributionServer signPayloadWithMescal:v14 requestTimestamp:v15 interval:a5 jsonBody:v16 startDate:v17 deliveryStartDate:v18 isFallback:v58 completionHandler:v63];
        v31 = v64;
        v32 = (void *)v61;
      }
      else
      {
        id v40 = APPerfLogForCategory();
        id v41 = v40;
        if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_DWORD *)buf = 134349314;
          __int16 v71 = (const char *)a5;
          __int16 v72 = 2114;
          v73 = v26;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, a5, "Payload Signing", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", buf, 0x16u);
        }
        id v59 = v15;

        id v42 = APLogForCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Signing: Using FPDI.", buf, 2u);
        }

        unint64_t v43 = [v64 base64EncodedStringWithOptions:32];
        v68[0] = @"daemonRunningTime";
        id v44 = +[NSNumber numberWithInteger:v22];
        v69[0] = v44;
        v69[1] = v26;
        v68[1] = @"storeFront";
        v68[2] = @"signingType";
        v69[2] = &off_100249050;
        +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];
        v46 = id v45 = v26;

        v30 = v17;
        v32 = (void *)v61;
        +[APAttributionAnalytics sendTimingAnalytics:@"payloadSigningTime" startDate:v17 endDate:v61 additionalFields:v46];
        [v14 setFpdiSignature:v43];
        [v65 _serverPost:v14 requestTimestamp:v59 payloadDeliveryStartDate:v18 interval:a5 completionHandler:v63];

        v26 = v45;
        id v15 = v59;

        id v19 = v63;
        v31 = v64;
      }

      goto LABEL_42;
    }
    v30 = v17;
    id v62 = v26;
    if ([(id)qword_100288950 state] == (id)18002
      || [(id)qword_100288950 state] == (id)18004)
    {
      v36 = APLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Signing: signingAuthorityPoolManager is not ready, starting it.", buf, 2u);
      }

      v37 = (void *)qword_100288958;
      +[APSigningQueueItem createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:](APSigningQueueItem, "createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:", v14, v15, a5, v19);
      v39 = id v38 = v19;
      [v37 add:v39];

      id v19 = v38;
      byte_100288970 = 0;
      [(id)qword_100288950 setupWithTimeout:&stru_1002340D0 completion:5.0];
      [(id)qword_100288960 unlock];
LABEL_41:
      v26 = v62;
      goto LABEL_42;
    }
    if ([(id)qword_100288950 state] != (id)18000)
    {
      id v50 = v19;
      v51 = (const char *)[(id)qword_100288950 state];
      id v52 = [objc_alloc((Class)APSigningAuthorityPoolManager) initWithName:@"attribution_fpdi" poolSize:1 numberToStash:1];
      v53 = (void *)qword_100288950;
      qword_100288950 = (uint64_t)v52;

      [(id)qword_100288960 unlock];
      v54 = APLogForCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        __int16 v71 = v51;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Signing: Unknown signingAuthorityPoolManager state: %ld", buf, 0xCu);
      }

      id v19 = v50;
      LOBYTE(v58) = 1;
      +[APAttributionServer signPayloadWithMescal:v14 requestTimestamp:v15 interval:a5 jsonBody:v16 startDate:v17 deliveryStartDate:v18 isFallback:v58 completionHandler:v50];
      goto LABEL_41;
    }
    int v47 = byte_100288970;
    [(id)qword_100288960 unlock];
    unint64_t v48 = APLogForCategory();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG);
    if (v47)
    {
      if (v49)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Signing: signingAuthorityPoolManager has stuck in SetupStarted state. Fallback to Mescal.", buf, 2u);
      }

      LOBYTE(v58) = 1;
      +[APAttributionServer signPayloadWithMescal:v14 requestTimestamp:v15 interval:a5 jsonBody:v16 startDate:v21 deliveryStartDate:v18 isFallback:v58 completionHandler:v19];
      goto LABEL_41;
    }
    if (v49)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Signing: signingAuthorityPoolManager is not ready, adding a request to the queue.", buf, 2u);
    }

    v55 = (void *)qword_100288958;
    +[APSigningQueueItem createItemWithRequest:v14 requestTimestamp:v15 interval:a5 jsonBody:v16 startDate:v21 deliveryStartDate:v18 completionHandler:v19];
    v57 = id v56 = v19;
    [v55 add:v57];

    id v19 = v56;
    v26 = v62;
    if ([(id)qword_100288950 state] == (id)18000) {
      +[APAttributionServer _processSigningQueue:qword_100288958 useFpdi:1 signingAuthorityPoolManager:qword_100288950];
    }
  }
  else
  {
    id v33 = v15;
    v34 = v26;
    v35 = APLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Signing: signingAuthorityPoolManager is nil. Using Mescal.", buf, 2u);
    }

    LOBYTE(v58) = 1;
    v30 = v17;
    +[APAttributionServer signPayloadWithMescal:v14 requestTimestamp:v33 interval:a5 jsonBody:v16 startDate:v17 deliveryStartDate:v18 isFallback:v58 completionHandler:v19];
    if (qword_100288978 != -1) {
      dispatch_once(&qword_100288978, &stru_100234090);
    }
    v26 = v34;
    id v15 = v33;
  }
LABEL_42:
}

+ (void)signPayloadWithMescal:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 deliveryStartDate:(id)a8 isFallback:(BOOL)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  objc_initWeak(&location, a1);
  int64_t v22 = +[APMescalSigningService service];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100068EBC;
  v28[3] = &unk_1002340F8;
  id v23 = v21;
  id v33 = v23;
  v34[1] = (id)a5;
  id v24 = v17;
  id v29 = v24;
  id v25 = v16;
  id v30 = v25;
  BOOL v35 = a9;
  id v26 = v19;
  id v31 = v26;
  objc_copyWeak(v34, &location);
  id v27 = v20;
  id v32 = v27;
  [v22 signatureForData:v18 waitTime:v28 completion:1.0e10];

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

+ (void)_processSigningQueue:(id)a3 useFpdi:(BOOL)a4 signingAuthorityPoolManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.waitingTasks", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069368;
  block[3] = &unk_100234120;
  BOOL v15 = a4;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

@end