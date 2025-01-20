@interface APAttributionReceiver
- (APAttributionAnalytics)analytics;
- (APAttributionReceiver)initWithConnection:(id)a3;
- (APXPCConnection)connection;
- (BOOL)canReturnToken:(id)a3;
- (Protocol)exportedInterface;
- (double)responseTime;
- (id)remoteObjectInterface;
- (unint64_t)attemptId;
- (unint64_t)intervalId;
- (unint64_t)serverRetries;
- (void)_attributionTokenRequestTimestamp:(id)a3 completionHandler:(id)a4;
- (void)_continueAttribution:(id)a3 token:(id)a4 cached:(BOOL)a5 requestTimestamp:(id)a6 error:(id)a7 constructionWithCompletionHandler:(id)a8;
- (void)attributionAnalytics:(unint64_t)a3 end:(unint64_t)a4 Handler:(id)a5;
- (void)attributionTokenRequestTimestamp:(id)a3 interval:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAnalytics:(id)a3;
- (void)setAttemptId:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setIntervalId:(unint64_t)a3;
- (void)setResponseTime:(double)a3;
- (void)setServerRetries:(unint64_t)a3;
- (void)terminateConnection;
@end

@implementation APAttributionReceiver

- (APAttributionReceiver)initWithConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APAttributionReceiver;
  v6 = [(APAttributionReceiver *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(APAttributionAnalytics);
    analytics = v7->_analytics;
    v7->_analytics = v8;
  }
  return v7;
}

- (BOOL)canReturnToken:(id)a3
{
  id v3 = a3;
  v4 = [[APItunesMetaData alloc] initWithBundleID:v3];

  if ([(APItunesMetaData *)v4 installedByAppStore]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [(APItunesMetaData *)v4 installedAsTestApp];
  }

  return v5;
}

- (void)attributionTokenRequestTimestamp:(id)a3 interval:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(APAttributionReceiver *)self setIntervalId:a4];
  v10 = APPerfLogForCategory();
  [(APAttributionReceiver *)self setAttemptId:os_signpost_id_generate(v10)];

  if (v9)
  {
    objc_super v11 = +[APIDAccountProvider privateUserAccount];
    v12 = APPerfLogForCategory();
    unint64_t v13 = [(APAttributionReceiver *)self intervalId];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_DWORD *)buf = 134349312;
        unint64_t v22 = [(APAttributionReceiver *)self intervalId];
        __int16 v23 = 2050;
        unint64_t v24 = [(APAttributionReceiver *)self attemptId];
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Token Request", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006E144;
    v16[3] = &unk_100234168;
    id v17 = v8;
    id v18 = v11;
    v19 = self;
    id v20 = v9;
    id v15 = v11;
    [(APAttributionReceiver *)self _attributionTokenRequestTimestamp:v17 completionHandler:v16];
  }
}

- (void)_attributionTokenRequestTimestamp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  long long v90 = 0u;
  long long v91 = 0u;
  id v8 = [(APAttributionReceiver *)self connection];
  id v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v90 = 0u;
    long long v91 = 0u;
  }

  if (ba_is_process_extension())
  {
    NSErrorUserInfoKey v104 = NSLocalizedDescriptionKey;
    CFStringRef v105 = @"Attribution services not available in extensions";
    v10 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    objc_super v11 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:3 userInfo:v10];
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      uint64_t v93 = (uint64_t)"-[APAttributionReceiver _attributionTokenRequestTimestamp:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{sensitive}s, Attribution services not available in extensions", buf, 0xCu);
    }

    id v13 = [objc_alloc((Class)AAAttributionResult) initWithError:v11];
    v7[2](v7, v13);
  }
  else
  {
    __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v15 = [(APAttributionReceiver *)self analytics];
    [v15 setTokenDaemonStart:v14];

    v10 = objc_alloc_init(APAttributionRequest);
    [(APAttributionRequest *)v10 loadIDAccountDetails];
    v16 = [(APAttributionReceiver *)self connection];
    objc_super v11 = [v16 bundleID];

    [(APAttributionRequest *)v10 setBundleId:v11];
    id v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v93 = (uint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Request for Attribution from bundle %{public}@", buf, 0xCu);
    }

    id v18 = [(APAttributionRequest *)v10 bundleId];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      v29 = APLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "BundleID nil", buf, 2u);
      }

      NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
      CFStringRef v103 = @"BundleID nil";
      id v13 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      v30 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v13];
      id v31 = [objc_alloc((Class)AAAttributionResult) initWithError:v30];
      v7[2](v7, v31);
    }
    else
    {
      if (+[APSystemInternal isAppleInternalInstall])
      {
        id v20 = objc_alloc((Class)APSettingsStorageUserDefaults);
        v21 = [@"APAttribution.bundleID" componentsSeparatedByString:@"."];
        unint64_t v22 = [v21 lastObject];
        v100 = v22;
        v101 = v11;
        __int16 v23 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v24 = [v20 initWithDefaultValues:v23];

        uint64_t v25 = [v24 valueForKey:@"APAttribution.bundleID"];

        [(APAttributionRequest *)v10 setBundleId:v25];
        v26 = [v24 valueForKey:@"APAttribution.applyRateLimiting"];
        v27 = v26;
        if (v26) {
          unsigned int v28 = [v26 BOOLValue];
        }
        else {
          unsigned int v28 = 1;
        }
        v32 = APLogForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v93 = v25;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Using override bundleID %{public}@ to pull attribution data", buf, 0xCu);
        }

        objc_super v11 = (void *)v25;
      }
      else
      {
        unsigned int v28 = 1;
      }
      v33 = [(APAttributionRequest *)v10 bundleId];
      unsigned __int8 v34 = [(APAttributionReceiver *)self canReturnToken:v33];

      v35 = APLogForCategory();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
      if (v34)
      {
        if (v36)
        {
          v37 = [(APAttributionRequest *)v10 bundleId];
          *(_DWORD *)buf = 138477827;
          uint64_t v93 = (uint64_t)v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Continuing with Attribution for %{private}@ app installed by a supported marketplace", buf, 0xCu);
        }
        if (v28)
        {
          v38 = [(APAttributionRequest *)v10 bundleId];
          id v13 = +[APAttributionCacheElement cachedElementForBundleIdentifier:v38];
        }
        else
        {
          v38 = APLogForCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Rate limiting is disabled", buf, 2u);
          }
          id v13 = 0;
        }

        v42 = APPerfLogForCategory();
        os_signpost_id_t v43 = [(APAttributionReceiver *)self intervalId];
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          unint64_t v44 = [(APAttributionReceiver *)self intervalId];
          unint64_t v45 = [(APAttributionReceiver *)self attemptId];
          *(_DWORD *)buf = 134349312;
          uint64_t v93 = v44;
          __int16 v94 = 2050;
          unint64_t v95 = v45;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, v43, "Check ATT", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
        }

        v46 = [(APAttributionReceiver *)self connection];
        v47 = v46;
        if (v46) {
          [v46 auditToken];
        }
        else {
          memset(v89, 0, sizeof(v89));
        }
        BOOL v48 = +[APAttributionAppTracking appTrackingStatus:v89];

        v49 = APPerfLogForCategory();
        os_signpost_id_t v50 = [(APAttributionReceiver *)self intervalId];
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          unint64_t v51 = [(APAttributionReceiver *)self intervalId];
          unint64_t v52 = [(APAttributionReceiver *)self attemptId];
          *(_DWORD *)buf = 134349312;
          uint64_t v93 = v51;
          __int16 v94 = 2050;
          unint64_t v95 = v52;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v50, "Check ATT", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
        }

        if (v13
          && ([(APAttributionRequest *)v10 toroId],
              v53 = objc_claimAutoreleasedReturnValue(),
              unsigned int v54 = [v13 isValidCheckWithToroID:v53 andTrackingStatus:v48],
              v53,
              v54))
        {
          v55 = APPerfLogForCategory();
          os_signpost_id_t v56 = [(APAttributionReceiver *)self intervalId];
          if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
          {
            unint64_t v57 = [(APAttributionReceiver *)self intervalId];
            unint64_t v58 = [(APAttributionReceiver *)self attemptId];
            *(_DWORD *)buf = 134349312;
            uint64_t v93 = v57;
            __int16 v94 = 2050;
            unint64_t v95 = v58;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_EVENT, v56, "Use Cached Token", "Use Cached Token id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
          }

          v59 = APLogForCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v93 = (uint64_t)v11;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Token requested before previous expired, returning cached token for %{public}@", buf, 0xCu);
          }

          v60 = APLogForCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v61 = [v13 token];
            *(_DWORD *)buf = 141558274;
            uint64_t v93 = 1752392040;
            __int16 v94 = 2112;
            unint64_t v95 = (unint64_t)v61;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Token = %{mask.hash}@", buf, 0x16u);
          }
          v62 = +[APAttributionTokenTracker defaultTracker];
          v63 = [v13 token];
          v64 = [(APAttributionRequest *)v10 bundleId];
          unsigned int v65 = [v62 isTokenUsedByOtherBundle:v63 bundleID:v64];

          if (v65)
          {
            +[APAttributionAnalytics sendTokenDuplicateAnalytics:@"TokenDupeCache"];
            v66 = APPerfLogForCategory();
            os_signpost_id_t v67 = [(APAttributionReceiver *)self intervalId];
            if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
            {
              unint64_t v68 = [(APAttributionReceiver *)self intervalId];
              unint64_t v69 = [(APAttributionReceiver *)self attemptId];
              *(_DWORD *)buf = 134349570;
              uint64_t v93 = v68;
              __int16 v94 = 2050;
              unint64_t v95 = v69;
              __int16 v96 = 2114;
              CFStringRef v97 = @"local";
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_EVENT, v67, "Duplicate Token Found", "Duplicate Token Found id=%{public, name=id}lld attempt=%{public, name=attempt}lld cache=%{public, name=cache}@", buf, 0x20u);
            }
          }
          else
          {
            v66 = +[APAttributionTokenTracker defaultTracker];
            v78 = [v13 token];
            v79 = [(APAttributionRequest *)v10 bundleId];
            [v66 addToken:v78 bundleID:v79];
          }
          id v80 = objc_alloc((Class)AAAttributionResult);
          v81 = [v13 token];
          id v82 = [v80 initWithToken:v81 source:1];
          v7[2](v7, v82);
        }
        else
        {
          __uint64_t v70 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          v71 = [(APAttributionReceiver *)self analytics];
          [v71 setTokenStart:v70];

          v72 = APPerfLogForCategory();
          os_signpost_id_t v73 = [(APAttributionReceiver *)self intervalId];
          if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
          {
            unint64_t v74 = [(APAttributionReceiver *)self intervalId];
            unint64_t v75 = [(APAttributionReceiver *)self attemptId];
            *(_DWORD *)buf = 134349312;
            uint64_t v93 = v74;
            __int16 v94 = 2050;
            unint64_t v95 = v75;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v72, OS_SIGNPOST_INTERVAL_BEGIN, v73, "Create Token", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
          }

          objc_initWeak((id *)buf, self);
          v76 = APLogForCategory();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v88 = 0;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Creating token", v88, 2u);
          }

          unint64_t v77 = [(APAttributionReceiver *)self intervalId];
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472;
          v83[2] = sub_10006F05C;
          v83[3] = &unk_100234190;
          objc_copyWeak(&v87, (id *)buf);
          v10 = v10;
          v84 = v10;
          id v85 = v6;
          v86 = v7;
          +[APAttributionToken tokenWithDetail:v48 interval:v77 completionHandler:v83];

          objc_destroyWeak(&v87);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        if (v36)
        {
          v39 = [(APAttributionRequest *)v10 bundleId];
          *(_DWORD *)buf = 138477827;
          uint64_t v93 = (uint64_t)v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Cannot attribute %{private}@ as it was installed by an unsupported marketplace.", buf, 0xCu);
        }
        NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
        CFStringRef v99 = @"App is not able to be attributed";
        id v13 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        v40 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v13];
        id v41 = [objc_alloc((Class)AAAttributionResult) initWithError:v40];
        v7[2](v7, v41);
      }
    }
  }
}

- (void)_continueAttribution:(id)a3 token:(id)a4 cached:(BOOL)a5 requestTimestamp:(id)a6 error:(id)a7 constructionWithCompletionHandler:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, id))a8;
  if (v15)
  {
    BOOL v107 = v11;
    __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v20 = [(APAttributionReceiver *)self analytics];
    [v20 setTokenEnd:v19];

    v21 = APPerfLogForCategory();
    unint64_t v22 = [(APAttributionReceiver *)self intervalId];
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 134349312;
        unint64_t v125 = [(APAttributionReceiver *)self intervalId];
        __int16 v126 = 2050;
        unint64_t v127 = [(APAttributionReceiver *)self attemptId];
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v23, "Create Token", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }

    id v24 = APLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Created token", buf, 2u);
    }
    id v110 = v17;

    uint64_t v25 = [v15 key];
    v26 = [v25 base64EncodedStringWithOptions:0];
    [v14 setAttributionKey:v26];

    v27 = APPerfLogForCategory();
    unint64_t v28 = [(APAttributionReceiver *)self intervalId];
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v29 = v28;
      if (os_signpost_enabled(v27))
      {
        unint64_t v30 = [(APAttributionReceiver *)self intervalId];
        unint64_t v31 = [(APAttributionReceiver *)self attemptId];
        *(_DWORD *)buf = 134349312;
        unint64_t v125 = v30;
        __int16 v126 = 2050;
        unint64_t v127 = v31;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v29, "Load Metadata", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }

    v32 = [APItunesMetaData alloc];
    v33 = [v14 bundleId];
    unsigned __int8 v34 = [(APItunesMetaData *)v32 initWithBundleID:v33];

    id v117 = 0;
    LOBYTE(v32) = [(APItunesMetaData *)v34 loadMetaDataWithError:&v117];
    id v35 = v117;
    BOOL v36 = v35;
    if (v32)
    {
      id v108 = v16;
      v106 = v18;
      [v14 setDevelopmentApp:-[APItunesMetaData installedAsTestApp](v34, "installedAsTestApp")];
      [v14 addMetaData:v34];
      [v14 loadDeviceInfo];
      v37 = objc_alloc_init(APAttributionCapData);
      v38 = [(APItunesMetaData *)v34 adamID];
      [(APAttributionCapData *)v37 loadCapData:v38];

      CFStringRef v105 = v37;
      [v14 addCapData:v37];
      v39 = APPerfLogForCategory();
      unint64_t v40 = [(APAttributionReceiver *)self intervalId];
      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v41 = v40;
        if (os_signpost_enabled(v39))
        {
          unint64_t v42 = [(APAttributionReceiver *)self intervalId];
          unint64_t v43 = [(APAttributionReceiver *)self attemptId];
          *(_DWORD *)buf = 134349312;
          unint64_t v125 = v42;
          __int16 v126 = 2050;
          unint64_t v127 = v43;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, v41, "Load Metadata", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
        }
      }

      __uint64_t v44 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      unint64_t v45 = [(APAttributionReceiver *)self analytics];
      [v45 setServerPostStart:v44];

      uint64_t v46 = [(APAttributionReceiver *)self analytics];
      v47 = (void *)os_transaction_create();
      uint64_t v48 = +[NSDate date];
      unint64_t v49 = [(APAttributionReceiver *)self intervalId];
      id v116 = v36;
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472;
      v112[2] = sub_10006FDAC;
      v112[3] = &unk_1002341B8;
      id v103 = (id)v46;
      id v113 = v103;
      v114 = self;
      id v102 = v47;
      id v115 = v102;
      NSErrorUserInfoKey v104 = (void *)v48;
      LOBYTE(v46) = +[APAttributionServer sendRequestToServer:v14 requestTimestamp:v108 payloadDeliveryTimestamp:v48 interval:v49 error:&v116 completionHandler:v112];
      id v50 = v116;

      if (v46)
      {
        unint64_t v51 = [v14 storefront];
        unint64_t v52 = [(APAttributionReceiver *)self analytics];
        [v52 setStorefrontID:v51];

        __uint64_t v53 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        unsigned int v54 = [(APAttributionReceiver *)self analytics];
        [v54 setTokenDaemonEnd:v53];

        v55 = [v15 signedAttributionToken];

        if (!v55)
        {
          NSErrorUserInfoKey v118 = NSLocalizedDescriptionKey;
          CFStringRef v119 = @"Error no signed token available";
          v83 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
          uint64_t v84 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v83];

          id v16 = v108;
          id v71 = [objc_alloc((Class)AAAttributionResult) initWithError:v84];
          id v18 = v106;
          v106[2](v106, v71);
          id v50 = (id)v84;
LABEL_44:

          id v17 = v110;
          p_super = &v105->super;
LABEL_45:

          goto LABEL_46;
        }
        os_signpost_id_t v56 = [v15 signedAttributionToken];
        unint64_t v57 = [v14 bundleId];
        unint64_t v58 = [(APAttributionReceiver *)self connection];
        v59 = v58;
        if (v58) {
          [v58 auditToken];
        }
        else {
          memset(v111, 0, sizeof(v111));
        }
        BOOL v85 = +[APAttributionAppTracking appTrackingStatus:v111];
        v86 = [v14 toroId];
        id v87 = +[APAttributionCacheElement elementWithToken:v56 andBundle:v57 andAppTrackingStatus:v85 andToroID:v86];

        v88 = [(APAttributionReceiver *)self analytics];
        [v88 setStatus:@"Success"];

        v89 = [(APAttributionReceiver *)self analytics];
        [v89 sendTokenAnalytics];

        long long v90 = APLogForCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          long long v91 = [v15 signedAttributionToken];
          *(_DWORD *)buf = 141558274;
          unint64_t v125 = 1752392040;
          __int16 v126 = 2112;
          unint64_t v127 = (unint64_t)v91;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "Token %{mask.hash}@", buf, 0x16u);
        }
        v92 = +[APAttributionTokenTracker defaultTracker];
        uint64_t v93 = [v15 signedAttributionToken];
        __int16 v94 = [v14 bundleId];
        unsigned __int8 v95 = [v92 isTokenUsedByOtherBundle:v93 bundleID:v94];

        id v18 = v106;
        if ((v95 & 1) == 0)
        {
          __int16 v96 = +[APAttributionTokenTracker defaultTracker];
          CFStringRef v97 = [v15 signedAttributionToken];
          NSErrorUserInfoKey v98 = [v14 bundleId];
          [v96 addToken:v97 bundleID:v98];
        }
        if (v107) {
          uint64_t v99 = 2;
        }
        else {
          uint64_t v99 = 3;
        }
        id v100 = objc_alloc((Class)AAAttributionResult);
        id v71 = [v15 signedAttributionToken];
        id v101 = [v100 initWithToken:v71 source:v99];
        v106[2](v106, v101);
      }
      else
      {
        NSErrorUserInfoKey v120 = NSLocalizedDescriptionKey;
        CFStringRef v121 = @"Error posting to Attribution server";
        unint64_t v69 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        uint64_t v70 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v69];

        id v71 = [objc_alloc((Class)AAAttributionResult) initWithError:v70];
        id v18 = v106;
        v106[2](v106, v71);
        id v50 = (id)v70;
      }
      id v16 = v108;
      goto LABEL_44;
    }
    id v109 = v15;
    id v66 = v16;
    os_signpost_id_t v67 = v18;
    if (v35)
    {
      if ([v35 code] == (id)3)
      {
        unint64_t v68 = &kAttributionAnalyticsTokenStatusErrorMetaDataBundleID;
LABEL_27:
        v72 = *v68;
        os_signpost_id_t v73 = [(APAttributionReceiver *)self analytics];
        [v73 setStatus:v72];

        goto LABEL_28;
      }
      if ([v36 code] == (id)2)
      {
        unint64_t v68 = &kAttributionAnalyticsTokenStatusErrorMetaDataNoData;
        goto LABEL_27;
      }
    }
LABEL_28:
    unint64_t v74 = [(APAttributionReceiver *)self analytics];
    [v74 sendTokenAnalytics];

    NSErrorUserInfoKey v122 = NSLocalizedDescriptionKey;
    CFStringRef v123 = @"Error loading data from iTunesMetadata";
    unint64_t v75 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
    id v50 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v75];

    id v76 = [objc_alloc((Class)AAAttributionResult) initWithError:v50];
    id v18 = v67;
    v67[2](v67, v76);

    p_super = APPerfLogForCategory();
    unint64_t v78 = [(APAttributionReceiver *)self intervalId];
    if (v78 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {
      id v17 = v110;
      id v16 = v66;
    }
    else
    {
      os_signpost_id_t v79 = v78;
      id v17 = v110;
      id v16 = v66;
      if (os_signpost_enabled(p_super))
      {
        id v80 = p_super;
        unint64_t v81 = [(APAttributionReceiver *)self intervalId];
        unint64_t v82 = [(APAttributionReceiver *)self attemptId];
        *(_DWORD *)buf = 134349312;
        unint64_t v125 = v81;
        p_super = v80;
        __int16 v126 = 2050;
        unint64_t v127 = v82;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_END, v79, "Load Metadata", "id=%{public, name=id}lld attempt=%{public, name=attempt}lld", buf, 0x16u);
      }
    }
    id v15 = v109;
    goto LABEL_45;
  }
  if (v17)
  {
    v60 = [(APAttributionReceiver *)self analytics];
    [v60 setStatus:@"ErrorTokenSigning"];

    v61 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 code]);
    v62 = [v61 stringValue];
    v63 = [(APAttributionReceiver *)self analytics];
    [v63 setErrorCode:v62];

    v64 = [(APAttributionReceiver *)self analytics];
    [v64 sendTokenAnalytics];
  }
  NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
  CFStringRef v129 = @"Error generating token";
  unsigned int v65 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  id v50 = +[NSError errorWithDomain:@"com.apple.ap.adservices.attributionError" code:2 userInfo:v65];

  unsigned __int8 v34 = (APItunesMetaData *)[objc_alloc((Class)AAAttributionResult) initWithError:v50];
  v18[2](v18, v34);
LABEL_46:
}

- (void)attributionAnalytics:(unint64_t)a3 end:(unint64_t)a4 Handler:(id)a5
{
  id v14 = (void (**)(id, uint64_t, void))a5;
  if (a4 >= a3
    && ([(APAttributionReceiver *)self analytics],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 tokenDaemonStart],
        v8,
        v9))
  {
    v10 = [(APAttributionReceiver *)self analytics];
    [v10 setStart:a3];

    BOOL v11 = [(APAttributionReceiver *)self analytics];
    [v11 setEnd:a4];

    v12 = [(APAttributionReceiver *)self analytics];
    [v12 sendAnalytics];

    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14[2](v14, v13, 0);
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___AAAttribution_XPC;
}

- (id)remoteObjectInterface
{
  return &OBJC_PROTOCOL___AAAttribution_XPC;
}

- (void)terminateConnection
{
  id v3 = [(APAttributionReceiver *)self connection];

  if (v3)
  {
    v4 = [(APAttributionReceiver *)self connection];
    [v4 invalidate];

    [(APAttributionReceiver *)self setConnection:0];
  }
}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (APAttributionAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
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

- (unint64_t)serverRetries
{
  return self->_serverRetries;
}

- (void)setServerRetries:(unint64_t)a3
{
  self->_serverRetries = a3;
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void)setIntervalId:(unint64_t)a3
{
  self->_intervalId = a3;
}

- (unint64_t)attemptId
{
  return self->_attemptId;
}

- (void)setAttemptId:(unint64_t)a3
{
  self->_attemptId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end