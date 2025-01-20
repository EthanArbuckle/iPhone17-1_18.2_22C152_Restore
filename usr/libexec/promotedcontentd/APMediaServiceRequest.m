@interface APMediaServiceRequest
+ (id)_buildQueryParamsForDevicePlatform:(id)a3 placement:(id)a4 parameters:(id)a5;
+ (void)_handleResponseJsonData:(id)a3 error:(id)a4 params:(id)a5 responseReceivedTimestamp:(double)a6 completionHandler:(id)a7;
+ (void)_handleResult:(id)a3 error:(id)a4 params:(id)a5 responseReceivedTimestamp:(double)a6 completionHandler:(id)a7;
+ (void)_logResponse:(id)a3 requestID:(id)a4 error:(id)a5 prettyPrint:(BOOL)a6;
+ (void)_reportBuildRequestForPlacement:(unint64_t)a3 duration:(double)a4 bagDuration:(double)a5;
- (APMediaServiceRequestParameters)params;
- (BOOL)isStorefrontAdPlatformsEnabledForBag:(id)a3;
- (double)responseTime;
- (id)_clientProcessInfo;
- (id)_createSessionForBag:(id)a3;
- (id)_devicePlatform;
- (id)_placementForPlacement:(unint64_t)a3;
- (id)_requestJsonCatchingError:(id *)a3;
- (id)runWithParameters:(id)a3 mediaServiceSession:(id)a4 completionHandler:(id)a5;
- (void)_logRequestURL:(id)a3 requestID:(id)a4 headers:(id)a5 innerRequestJson:(id)a6 prettyPrint:(BOOL)a7;
- (void)beginSignpostForPlacement:(unint64_t)a3 log:(id)a4 logID:(unint64_t)a5;
- (void)endSignpostForPlacement:(unint64_t)a3 log:(id)a4 logID:(unint64_t)a5;
- (void)setParams:(id)a3;
- (void)setResponseTime:(double)a3;
@end

@implementation APMediaServiceRequest

- (id)_devicePlatform
{
  if (+[AMSDevice deviceIsiPhone]) {
    return @"iphone";
  }
  if (+[AMSDevice deviceIsiPad]) {
    return @"ipad";
  }
  if (+[AMSDevice deviceIsAppleTV]) {
    return @"appletv";
  }
  if (+[AMSDevice deviceIsAppleWatch]) {
    return @"watch";
  }
  if (+[AMSDevice deviceIsiPod]) {
    return @"iphone";
  }
  if (+[AMSDevice deviceIsMac]) {
    return @"mac";
  }
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unknown device platform", v4, 2u);
  }

  return 0;
}

- (id)_placementForPlacement:(unint64_t)a3
{
  if (a3 - 7005 > 3) {
    return &stru_1002392C0;
  }
  else {
    return *(&off_100239138 + a3 - 7005);
  }
}

- (id)_clientProcessInfo
{
  id v2 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.AppStore"];

  return v2;
}

- (BOOL)isStorefrontAdPlatformsEnabledForBag:(id)a3
{
  BOOL v3 = +[APAMSBagManager isSearchLandingAdsEnabled];
  if (v3)
  {
    LOBYTE(v3) = +[APAMSBagManager isSponsoredAdsEnabledForAdTrackingd];
  }
  return v3;
}

- (id)runWithParameters:(id)a3 mediaServiceSession:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  v11 = [v8 idAccount];
  v103 = [v11 iAdID];

  unsigned int v12 = [v8 validate];
  if (v10 && v12 && v103)
  {
    [(APMediaServiceRequest *)self setParams:v8];
    if (+[APSystemInternal isAppleInternalInstall])
    {
      v13 = +[APMediaServiceRequestSettings settings];
    }
    else
    {
      v13 = 0;
    }
    v16 = +[NSDate now];
    [v16 timeIntervalSince1970];
    double v18 = v17;

    if ([v13 useAMSBagValue])
    {
      v19 = +[AMSMediaTask bagSubProfile];
      v20 = +[AMSMediaTask bagSubProfileVersion];
      v101 = +[AMSBag bagForProfile:v19 profileVersion:v20];
    }
    else
    {
      v101 = +[APAMSBagManager adprivacydBag];
    }
    double v21 = 0.0;
    if (([v13 ignoreBagKeyCheckValue] & 1) == 0)
    {
      if (![(APMediaServiceRequest *)self isStorefrontAdPlatformsEnabledForBag:v101])
      {
        v102 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2202 userInfo:0];
        v34 = APLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v102;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Ad Platforms is not enabled. Not making MediaAPI request: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        v10[2](v10, 0, v102);
        id v15 = v9;
        goto LABEL_61;
      }
      v22 = +[NSDate now];
      [v22 timeIntervalSince1970];
      double v24 = v23;

      double v21 = v24 - v18;
    }
    v25 = [v13 mockRequestJson];
    if ([v25 length])
    {
      v102 = v25;
    }
    else
    {
      id v120 = 0;
      v102 = [(APMediaServiceRequest *)self _requestJsonCatchingError:&v120];
      id v100 = v120;

      if (v100 || ![v102 length])
      {
        v32 = APLogForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v100;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to generate request from context: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        v10[2](v10, 0, v100);
        id v15 = v9;
        goto LABEL_60;
      }
    }
    id v26 = v9;
    v27 = v26;
    if (!v26)
    {
      id v26 = [(APMediaServiceRequest *)self _createSessionForBag:v101];
    }
    id v100 = v26;
    v99 = [v26 protocolHandler];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v98 = v99;
      v93 = [v98 tokenService];
      id v96 = [objc_alloc((Class)AMSMediaRequestEncoder) initWithTokenService:v93 bag:v101];
      [v96 setAccount:0];
      v28 = [(APMediaServiceRequest *)self _clientProcessInfo];
      [v96 setClientInfo:v28];

      CFStringRef v133 = @"adRequest";
      v134 = v102;
      CFStringRef v135 = @"data";
      v29 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
      v136 = v29;
      v92 = +[NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];

      v91 = +[NSJSONSerialization dataWithJSONObject:v92 options:0 error:0];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v129 = 0x3032000000;
      v130 = sub_100194F20;
      v131 = sub_100194F30;
      id v132 = 0;
      v88 = [v13 mediaAPIHostURL];
      if ([v88 length])
      {
        uint64_t v30 = +[NSURLComponents componentsWithString:v88];
        v31 = *(NSObject **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v30;
      }
      else
      {
        dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
        v36 = +[APAMSBagManager mediaAPIHostURL];
        v37 = [v36 valuePromise];

        v117[0] = _NSConcreteStackBlock;
        v117[1] = 3221225472;
        v117[2] = sub_100194F38;
        v117[3] = &unk_100239078;
        v117[4] = self;
        p_long long buf = &buf;
        v31 = v35;
        v118 = v31;
        [v37 addFinishBlock:v117];
        dispatch_time_t v38 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v31, v38))
        {
          v39 = APLogForCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = objc_opt_class();
            LODWORD(v123) = 138477827;
            *(void *)((char *)&v123 + 4) = v40;
            id v41 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the API host from AMSMediaTask bag in time.", (uint8_t *)&v123, 0xCu);
          }
          v42 = +[NSString stringWithFormat:@"Failed to get the API host from AMSMediaTask bag in time."];
          CreateDiagnosticReport();
        }
      }

      *(void *)&long long v123 = 0;
      *((void *)&v123 + 1) = &v123;
      uint64_t v124 = 0x3032000000;
      v125 = sub_100194F20;
      v126 = sub_100194F30;
      id v127 = [v13 countryCode];
      if (![*(id *)(*((void *)&v123 + 1) + 40) length])
      {
        dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
        v44 = +[APAMSBagManager mediaAPICountryCode];
        v45 = [v44 valuePromise];

        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472;
        v114[2] = sub_1001950CC;
        v114[3] = &unk_1002390A0;
        v114[4] = self;
        v116 = &v123;
        v46 = v43;
        v115 = v46;
        [v45 addFinishBlock:v114];
        dispatch_time_t v47 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v46, v47))
        {
          v48 = APLogForCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = objc_opt_class();
            *(_DWORD *)v121 = 138477827;
            v122 = v49;
            id v50 = v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the country code from AMSMediaTask bag in time.", v121, 0xCu);
          }
          v51 = +[NSString stringWithFormat:@"Failed to get the country code from AMSMediaTask bag in time."];
          CreateDiagnosticReport();
        }
      }
      v95 = [v13 devicePlatform];
      if (![v95 length])
      {
        uint64_t v52 = [(APMediaServiceRequest *)self _devicePlatform];

        v95 = (void *)v52;
      }
      if ([v13 disablePlacementParamValue])
      {
        uint64_t v53 = 0;
      }
      else
      {
        uint64_t v53 = -[APMediaServiceRequest _placementForPlacement:](self, "_placementForPlacement:", [v8 placement]);
      }
      v87 = (void *)v53;
      v90 = +[APMediaServiceRequest _buildQueryParamsForDevicePlatform:placement:parameters:](APMediaServiceRequest, "_buildQueryParamsForDevicePlatform:placement:parameters:", v95);
      v54 = +[NSString stringWithFormat:@"/v1/engagement/%@/ads", *(void *)(*((void *)&v123 + 1) + 40)];
      [*(id *)(*((void *)&buf + 1) + 40) setPath:v54];

      [*(id *)(*((void *)&buf + 1) + 40) setQueryItems:v90];
      v89 = [*(id *)(*((void *)&buf + 1) + 40) URL];
      v55 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:");
      [v55 setHTTPBody:v91];
      [v55 setHTTPMethod:@"POST"];
      v56 = [v8 context];
      v57 = [v56 identifier];
      v97 = [v57 UUIDString];

      if (+[APSystemInternal isAppleInternalInstall])
      {
        v58 = objc_alloc_init(APAdLibDefaults);
        id v59 = [objc_alloc((Class)ADRoutingInfoMessage) initWithRoutingType:1 preferencesStore:v58];
        v60 = [v59 payload];

        [v55 setValue:v60 forHTTPHeaderField:@"x-apple-iad-env-name"];
      }
      [v55 setValue:*(void *)(*((void *)&v123 + 1) + 40) forHTTPHeaderField:@"X-Apple-Store-Front"];
      [v55 setValue:v97 forHTTPHeaderField:@"X-Apple-App-Store-Client-Request-Id"];
      v61 = [v13 headers];
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472;
      v112[2] = sub_1001951E0;
      v112[3] = &unk_100235BB0;
      id v94 = v55;
      id v113 = v94;
      [v61 enumerateKeysAndObjectsUsingBlock:v112];

      id v62 = [v13 prettyPrintJsonValue];
      v63 = [v94 allHTTPHeaderFields];
      [(APMediaServiceRequest *)self _logRequestURL:v89 requestID:v97 headers:v63 innerRequestJson:v102 prettyPrint:v62];
      unsigned int v86 = v62;

      v64 = [v13 mockResponseResultForPlacement:[v8 placement]];
      v65 = [v8 requestTime];

      if (v65)
      {
        v66 = +[NSDate now];
        [v66 timeIntervalSince1970];
        double v68 = v67;

        v69 = objc_opt_class();
        id v70 = [v8 placement];
        v71 = [v8 requestTime];
        [v71 timeIntervalSince1970];
        [v69 _reportBuildRequestForPlacement:v70 duration:v68 - v72 bagDuration:v21];
      }
      if (v64)
      {
        +[APMediaServiceRequest _logResponse:v64 requestID:v97 error:0 prettyPrint:v86];
        v73 = +[NSDate now];
        [v73 timeIntervalSince1970];
        +[APMediaServiceRequest _handleResult:error:params:responseReceivedTimestamp:completionHandler:](APMediaServiceRequest, "_handleResult:error:params:responseReceivedTimestamp:completionHandler:", v64, 0, v8, v10);

        id v74 = v100;
      }
      else
      {
        v75 = APPerfLogForCategory();
        os_signpost_id_t v76 = os_signpost_id_generate(v75);
        -[APMediaServiceRequest beginSignpostForPlacement:log:logID:](self, "beginSignpostForPlacement:log:logID:", [v8 placement], v75, v76);
        v85 = (void *)v76;
        v77 = +[NSDate now];
        [v77 timeIntervalSince1970];
        v79 = v78;

        objc_initWeak((id *)v121, self);
        v80 = [v96 requestByEncodingRequest:v94 parameters:0];
        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472;
        v104[2] = sub_1001951EC;
        v104[3] = &unk_1002390F0;
        v109 = v10;
        id v81 = v100;
        id v105 = v81;
        objc_copyWeak(v110, (id *)v121);
        id v106 = v8;
        v82 = v75;
        v107 = v82;
        v110[1] = v85;
        v110[2] = v79;
        id v108 = v97;
        char v111 = v86;
        [v80 addFinishBlock:v104];
        id v83 = v81;

        objc_destroyWeak(v110);
        objc_destroyWeak((id *)v121);
      }
      _Block_object_dispose(&v123, 8);

      _Block_object_dispose(&buf, 8);
      id v15 = v100;
    }
    else
    {
      id v98 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2200 userInfo:0];
      v33 = APLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v98;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Media service request failed: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v10[2](v10, 0, v98);
      id v15 = v27;
    }

LABEL_60:
LABEL_61:

    goto LABEL_62;
  }
  v13 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:2200 userInfo:0];
  v14 = APLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Media service request failed: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v10[2](v10, 0, v13);
  id v15 = v9;
LABEL_62:

  return v15;
}

- (id)_createSessionForBag:(id)a3
{
  id v3 = a3;
  v4 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  id v5 = [objc_alloc((Class)AMSURLSession) initWithConfiguration:v4];
  id v6 = [objc_alloc((Class)AMSMediaTokenService) initWithClientIdentifier:@"com.apple.ap.promotedcontentd" bag:v3];

  [v6 setSession:v5];
  id v7 = [objc_alloc((Class)AMSMediaProtocolHandler) initWithTokenService:v6];
  [v5 setProtocolHandler:v7];

  return v5;
}

- (void)_logRequestURL:(id)a3 requestID:(id)a4 headers:(id)a5 innerRequestJson:(id)a6 prettyPrint:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v7)
  {
    v16 = [v13 jsonStringWithOptions:0];
    v19 = +[NSString stringWithFormat:@"{\"headers\":%@,\"body\":%@}", v16, v14];
    goto LABEL_9;
  }
  v16 = +[NSMutableDictionary dictionaryWithCapacity:2];
  double v17 = [v14 dataUsingEncoding:4];
  double v18 = +[NSJSONSerialization JSONObjectWithData:v17 options:0 error:0];

  if (!v13)
  {
    v20 = +[NSNull null];
    [v16 setObject:v20 forKeyedSubscript:@"headers"];

    if (v18) {
      goto LABEL_4;
    }
LABEL_7:
    double v21 = +[NSNull null];
    [v16 setObject:v21 forKeyedSubscript:@"body"];

    goto LABEL_8;
  }
  [v16 setObject:v13 forKeyedSubscript:@"headers"];
  if (!v18) {
    goto LABEL_7;
  }
LABEL_4:
  [v16 setObject:v18 forKeyedSubscript:@"body"];
LABEL_8:
  v19 = [v16 jsonStringWithOptions:3];

LABEL_9:
  v22 = APLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    double v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    *(_DWORD *)long long buf = 138413059;
    id v26 = v24;
    __int16 v27 = 2113;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2114;
    v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%@] Making Media API request to %{private}@ with identifier %{public}@:\n%{public}@", buf, 0x2Au);
  }
}

+ (void)_logResponse:(id)a3 requestID:(id)a4 error:(id)a5 prettyPrint:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 data];

  if (v6)
  {
    if (v13)
    {
      id v14 = [v10 data];
      id v13 = +[NSJSONSerialization JSONObjectWithData:v14 options:0 error:0];

      if (!v13)
      {
        id v15 = [v10 data];
        v16 = [v15 base64EncodedStringWithOptions:0];
        double v17 = +[NSString stringWithFormat:@"Failed to deserialize incoming data into JSON. %@", v16];

        APSimulateCrash();
        CFStringRef v50 = @"error";
        v51 = v17;
        id v13 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      }
    }
    double v18 = +[NSMutableDictionary dictionaryWithCapacity:4];
    v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 responseStatusCode]);
    [(__CFString *)v18 setObject:v19 forKeyedSubscript:@"statusCode"];

    v20 = [v10 responseHeaders];
    [(__CFString *)v18 setObject:v20 forKeyedSubscript:@"headers"];

    [(__CFString *)v18 setObject:v13 forKeyedSubscript:@"body"];
    [(__CFString *)v18 setObject:v12 forKeyedSubscript:@"error"];
    double v21 = [(__CFString *)v18 jsonStringWithOptions:3];
  }
  else
  {
    if (v13)
    {
      id v22 = objc_alloc((Class)NSString);
      double v23 = [v10 data];
      id v13 = (__CFString *)[v22 initWithData:v23 encoding:4];

      if (!v13)
      {
        double v24 = [v10 data];
        v25 = [v24 base64EncodedStringWithOptions:0];
        id v26 = +[NSString stringWithFormat:@"Failed to convert incoming data into UTF8 string. %@", v25];

        APSimulateCrash();
        id v13 = +[NSString stringWithFormat:@"{\"error\":\"%@\"}", v26];
      }
    }
    else
    {
      id v13 = @"null";
    }
    __int16 v27 = [v10 responseHeaders];
    double v18 = @"null";
    if (v27)
    {
      id v28 = [v10 responseHeaders];
      double v18 = [v28 jsonStringWithOptions:0];
    }
    if (v12)
    {
      id v49 = v12;
      __int16 v29 = +[NSArray arrayWithObjects:&v49 count:1];
      id v30 = [v29 jsonRepresentationWithOptions:0];
      __int16 v31 = [v30 firstObject];

      if (!+[NSJSONSerialization isValidJSONObject:v31])
      {
        CFStringRef v47 = @"description";
        if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))[v12 debugDescription]; {
        else
        }
        v33 = [v12 description];
        v48 = v33;
        uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

        __int16 v31 = (void *)v34;
      }
      dispatch_semaphore_t v35 = +[NSJSONSerialization dataWithJSONObject:v31 options:0 error:0];
      if (v35) {
        v32 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v35 encoding:4];
      }
      else {
        v32 = @"null";
      }
    }
    else
    {
      v32 = 0;
    }
    id v36 = [v10 responseStatusCode];
    if (v32) {
      CFStringRef v37 = v32;
    }
    else {
      CFStringRef v37 = @"null";
    }
    double v21 = +[NSString stringWithFormat:@"{\"statusCode\":%ld,\"headers\":%@,\"body\":%@,\"error\":%@}", v36, v18, v13, v37];
  }
  dispatch_time_t v38 = APLogForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = NSStringFromClass((Class)a1);
    *(_DWORD *)long long buf = 138412802;
    v42 = v39;
    __int16 v43 = 2114;
    id v44 = v11;
    __int16 v45 = 2114;
    v46 = v21;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%@] Received Media API response for %{public}@:\n%{public}@", buf, 0x20u);
  }
}

+ (void)_handleResult:(id)a3 error:(id)a4 params:(id)a5 responseReceivedTimestamp:(double)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  if (!v12
    || ([v12 domain],
        id v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v15 isEqualToString:AMSErrorDomain],
        v15,
        !v16))
  {
    uint64_t v19 = -1;
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v17 = [v12 userInfo];
  double v18 = [v17 objectForKey:AMSErrorUserInfoKeyStatusCode];

  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v19 = (uint64_t)[v18 longValue];
  }
  else {
    uint64_t v19 = -1;
  }

  if (v11) {
LABEL_7:
  }
    uint64_t v19 = (uint64_t)[v11 responseStatusCode];
LABEL_8:
  if ((unint64_t)(v19 - 400) <= 0x63)
  {
    uint64_t v20 = 3002;
    goto LABEL_19;
  }
  if ((unint64_t)(v19 - 500) <= 0x63)
  {
    uint64_t v20 = 3003;
    goto LABEL_19;
  }
  if (v19 != 200)
  {
    if (!v12)
    {
      double v24 = APLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = 134217984;
        id v26 = [v11 responseStatusCode];
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unexpected MediaAPI server response. Status code: %lu", (uint8_t *)&v25, 0xCu);
      }

      uint64_t v20 = 3002;
      id v22 = 0;
      goto LABEL_20;
    }
    uint64_t v20 = 3000;
LABEL_19:
    id v22 = v12;
LABEL_20:
    double v23 = +[NSError errorWithCode:v20 internalError:v22];
    v14[2](v14, 0, v23);

    goto LABEL_21;
  }
  double v21 = [v11 data];
  +[APMediaServiceRequest _handleResponseJsonData:v21 error:v12 params:v13 responseReceivedTimestamp:v14 completionHandler:a6];

LABEL_21:
}

+ (void)_handleResponseJsonData:(id)a3 error:(id)a4 params:(id)a5 responseReceivedTimestamp:(double)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  id v15 = [v11 length];
  if (v12 || !v15)
  {
    double v23 = +[NSError errorWithCode:3005 internalError:v12];
    v14[2](v14, 0, v23);
  }
  else
  {
    id v28 = 0;
    unsigned int v16 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:&v28];
    id v17 = v28;
    id v18 = v17;
    if (!v16 || v17)
    {
      double v24 = APLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = objc_opt_class();
        *(_DWORD *)long long buf = 138412546;
        id v30 = v25;
        __int16 v31 = 2114;
        id v32 = 0;
        id v26 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@: Error with MediaAPI response serialization: %{public}@", buf, 0x16u);
      }
      uint64_t v19 = +[NSError errorWithCode:3006 internalError:v18];
      v14[2](v14, 0, v19);
    }
    else
    {
      id v27 = 0;
      uint64_t v19 = +[APMediaServiceResponseTranslator translateResponse:v16 requestParams:v13 responseReceivedTimestamp:&v27 error:a6];
      id v18 = v27;
      if (v18)
      {
        uint64_t v20 = APLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          double v21 = objc_opt_class();
          *(_DWORD *)long long buf = 138412546;
          id v30 = v21;
          __int16 v31 = 2114;
          id v32 = v18;
          id v22 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: Error with MediaAPI response translator: %{public}@", buf, 0x16u);
        }
      }
      ((void (**)(id, void *, void *))v14)[2](v14, v19, v18);
    }
  }
}

- (id)_requestJsonCatchingError:(id *)a3
{
  BOOL v6 = [APMediaServiceContextTransformer alloc];
  BOOL v7 = [(APMediaServiceRequest *)self params];
  id v8 = [(APMediaServiceContextTransformer *)v6 initWithParams:v7];

  id v15 = 0;
  id v9 = [(APMediaServiceContextTransformer *)v8 transformedContextJSON:&v15];
  id v10 = v15;
  if (v10)
  {
    id v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138412546;
      id v17 = v12;
      __int16 v18 = 2114;
      id v19 = v10;
      id v13 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@: Error with context to JSON transformer: %{public}@", buf, 0x16u);
    }
    id v9 = 0;
  }

  if (a3) {
    *a3 = v10;
  }

  return v9;
}

+ (void)_reportBuildRequestForPlacement:(unint64_t)a3 duration:(double)a4 bagDuration:(double)a5
{
  if (a4 == 0.0)
  {
    unint64_t v6 = 0;
  }
  else
  {
    a5 = a5 * 100.0 / a4;
    unint64_t v6 = (unint64_t)a5;
  }
  v11[0] = @"Duration";
  BOOL v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4, a5);
  v12[0] = v7;
  v11[1] = @"Type";
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  v12[1] = v8;
  v11[2] = @"BagFraction";
  id v9 = +[NSNumber numberWithUnsignedInteger:v6];
  v12[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  +[APAnalytics sendEvent:@"mediasvc.buildrequest" customPayload:v10];
}

+ (id)_buildQueryParamsForDevicePlatform:(id)a3 placement:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 appMetadataFields];
  if (v10)
  {
    id v11 = [v9 appMetadataFields];
    id v12 = [v11 mutableCopy];
  }
  else
  {
    id v12 = +[NSMutableDictionary dictionary];
  }

  id v13 = [v12 valueForKey:@"platform"];

  if (!v13) {
    [v12 setValue:v7 forKey:@"platform"];
  }
  id v14 = [v12 valueForKey:@"placement"];

  if (!v14) {
    [v12 setValue:v8 forKey:@"placement"];
  }
  if ([v8 isEqualToString:@"search-landing"])
  {
    id v15 = [v12 valueForKey:@"fields"];

    if (!v15) {
      [v12 setValue:@"appBinaryTraits" forKey:@"fields"];
    }
    unsigned int v16 = [v12 valueForKey:@"omit[resource]"];

    if (!v16) {
      [v12 setValue:@"autos" forKey:@"omit[resource]"];
    }
  }
  +[NSMutableArray array];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100196770;
  v20[3] = &unk_100239118;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v21;
  [v12 enumerateKeysAndObjectsUsingBlock:v20];
  id v18 = [v17 copy];

  return v18;
}

- (void)beginSignpostForPlacement:(unint64_t)a3 log:(id)a4 logID:(unint64_t)a5
{
  id v7 = a4;
  id v8 = v7;
  unint64_t v9 = a5 - 1;
  if (a3 == 7005)
  {
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      __int16 v13 = 0;
      id v10 = "slpNetworkingTime";
      id v11 = (uint8_t *)&v13;
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a5, v10, "", v11, 2u);
    }
  }
  else if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    __int16 v12 = 0;
    id v10 = "clNetworkingTime";
    id v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }
}

- (void)endSignpostForPlacement:(unint64_t)a3 log:(id)a4 logID:(unint64_t)a5
{
  id v7 = a4;
  id v8 = v7;
  unint64_t v9 = a5 - 1;
  if (a3 == 7005)
  {
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      __int16 v13 = 0;
      id v10 = "slpNetworkingTime";
      id v11 = (uint8_t *)&v13;
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, a5, v10, " enableTelemetry=YES ", v11, 2u);
    }
  }
  else if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    __int16 v12 = 0;
    id v10 = "clNetworkingTime";
    id v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (APMediaServiceRequestParameters)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end