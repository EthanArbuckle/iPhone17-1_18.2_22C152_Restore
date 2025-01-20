@interface APSigningQueue
- (APQueue)queue;
- (APSigningQueue)init;
- (void)add:(id)a3;
- (void)processWithFPDISigningAuthorityPoolManager:(id)a3;
- (void)processWithMescal;
- (void)setQueue:(id)a3;
@end

@implementation APSigningQueue

- (APSigningQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)APSigningQueue;
  v2 = [(APSigningQueue *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(APQueue);
    queue = v2->_queue;
    v2->_queue = v3;
  }
  return v2;
}

- (void)processWithFPDISigningAuthorityPoolManager:(id)a3
{
  id v4 = a3;
  v5 = [(APSigningQueue *)self queue];
  objc_super v6 = [v5 dequeue];

  if (v6)
  {
    p_cache = APAttributionToken.cache;
    v45 = self;
    id v47 = v4;
    do
    {
      v8 = [v6 jsonBody];
      id v50 = 0;
      v9 = [v4 signatureForData:v8 error:&v50];
      id v10 = v50;

      v11 = APLogForCategory();
      v12 = v11;
      v48 = v10;
      v49 = v9;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v54 = (const char *)v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Signing: Processing queue with FPDI but signing failed: %{public}@. Fallback to Mescal.", buf, 0xCu);
        }

        v13 = [v6 request];
        v14 = [v6 requestTimestamp];
        id v15 = [v6 intervalId];
        v16 = [v6 jsonBody];
        v17 = [v6 startDate];
        v18 = [v6 deliveryStartDate];
        v19 = [v6 handler];
        LOBYTE(v44) = 1;
        +[APAttributionServer signPayloadWithMescal:v13 requestTimestamp:v14 interval:v15 jsonBody:v16 startDate:v17 deliveryStartDate:v18 isFallback:v44 completionHandler:v19];
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Signing: Signing item using FPDI.", buf, 2u);
        }

        uint64_t v46 = [v9 base64EncodedStringWithOptions:32];
        v20 = [v6 requestTimestamp];
        [v20 timeIntervalSinceDate:_daemonStartTime];
        double v22 = v21;

        id v23 = [p_cache + 8 findBucketForDaemonRunningTime:v22];
        uint64_t v24 = +[NSDate now];
        v16 = @"NONE";
        v25 = [v6 request];
        v26 = [v25 storefront];

        if (v26)
        {
          v27 = [v6 request];
          v28 = [v27 storefront];
          uint64_t v29 = [p_cache + 8 storefrontCountryOnly:v28];

          v16 = (__CFString *)v29;
        }
        else
        {
          v30 = APLogForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136642819;
            v54 = "-[APSigningQueue processWithFPDISigningAuthorityPoolManager:]";
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{sensitive}s, Storefront is nil", buf, 0xCu);
          }

          CreateDiagnosticReport();
        }
        v31 = APPerfLogForCategory();
        v32 = (char *)[v6 intervalId];
        if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v33 = (os_signpost_id_t)v32;
          if (os_signpost_enabled(v31))
          {
            v34 = (const char *)[v6 intervalId];
            *(_DWORD *)buf = 134349314;
            v54 = v34;
            __int16 v55 = 2114;
            v56 = v16;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v33, "Payload Signing", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", buf, 0x16u);
          }
        }

        v51[0] = @"daemonRunningTime";
        v35 = +[NSNumber numberWithInteger:v23];
        v52[0] = v35;
        v52[1] = v16;
        v51[1] = @"storeFront";
        v51[2] = @"signingType";
        v52[2] = &off_100249098;
        v17 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];

        v36 = [v6 startDate];
        [p_cache + 8 sendTimingAnalytics:@"payloadSigningTime" startDate:v36 endDate:v24 additionalFields:v17];

        v37 = [v6 request];
        v13 = (void *)v46;
        [v37 setFpdiSignature:v46];

        v18 = [v6 request];
        v19 = [v6 requestTimestamp];
        v38 = [v6 deliveryStartDate];
        id v39 = [v6 intervalId];
        [v6 handler];
        v41 = v40 = (void *)v24;
        +[APAttributionServer _serverPost:v18 requestTimestamp:v19 payloadDeliveryStartDate:v38 interval:v39 completionHandler:v41];

        v14 = v40;
        self = v45;
      }
      id v4 = v47;

      v42 = [(APSigningQueue *)self queue];
      uint64_t v43 = [v42 dequeue];

      objc_super v6 = (void *)v43;
      p_cache = (void **)(APAttributionToken + 16);
    }
    while (v43);
  }
}

- (void)processWithMescal
{
  v3 = [(APSigningQueue *)self queue];
  id v4 = [v3 dequeue];

  if (v4)
  {
    do
    {
      v5 = APLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Signing: Signing item using Mescal.", buf, 2u);
      }

      objc_super v6 = [v4 request];
      v7 = [v4 requestTimestamp];
      id v8 = [v4 intervalId];
      v9 = [v4 jsonBody];
      id v10 = [v4 startDate];
      v11 = [v4 deliveryStartDate];
      v12 = [v4 handler];
      LOBYTE(v15) = 1;
      +[APAttributionServer signPayloadWithMescal:v6 requestTimestamp:v7 interval:v8 jsonBody:v9 startDate:v10 deliveryStartDate:v11 isFallback:v15 completionHandler:v12];

      v13 = [(APSigningQueue *)self queue];
      uint64_t v14 = [v13 dequeue];

      id v4 = (void *)v14;
    }
    while (v14);
  }
}

- (void)add:(id)a3
{
  id v4 = a3;
  id v5 = [(APSigningQueue *)self queue];
  [v5 enqueue:v4];
}

- (APQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end