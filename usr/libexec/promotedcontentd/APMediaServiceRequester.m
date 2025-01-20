@interface APMediaServiceRequester
- (APMediaServiceRequest)mediaServiceRequest;
- (APMediaServiceRequester)init;
- (BOOL)hasOdml;
- (NSArray)receivedContentDataItems;
- (NSString)bundleID;
- (NSString)contextFingerprint;
- (double)responseTime;
- (id)_loadInternalPropertiesFromContentData:(id)a3;
- (id)_loadJourneyStartRelayValuesFromContentData:(id)a3;
- (id)completionHandler;
- (id)deliveryBlock;
- (id)sendRequest:(id)a3 params:(id)a4 mediaServiceSession:(id)a5 completionHandler:(id)a6;
- (void)_handleMediaServiceResponse:(id)a3 params:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_handleRankedRepresentations:(id)a3 params:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContextFingerprint:(id)a3;
- (void)setDeliveryBlock:(id)a3;
- (void)setHasOdml:(BOOL)a3;
- (void)setMediaServiceRequest:(id)a3;
- (void)setReceivedContentDataItems:(id)a3;
- (void)setResponseTime:(double)a3;
@end

@implementation APMediaServiceRequester

- (APMediaServiceRequester)init
{
  v3.receiver = self;
  v3.super_class = (Class)APMediaServiceRequester;
  return [(APMediaServiceRequester *)&v3 init];
}

- (id)sendRequest:(id)a3 params:(id)a4 mediaServiceSession:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13
    && ([(APMediaServiceRequester *)self deliveryBlock],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v10)
    && v14)
  {
    [(APMediaServiceRequester *)self setCompletionHandler:v13];
    v15 = [v11 context];
    v16 = [v15 fingerprint];
    [(APMediaServiceRequester *)self setContextFingerprint:v16];

    [(APMediaServiceRequester *)self setMediaServiceRequest:v10];
    -[APMediaServiceRequester setHasOdml:](self, "setHasOdml:", [v11 hasOdml]);
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (+[APMockMAPIResponseSettings settings](APMockMAPIResponseSettings, "settings"), v17 = objc_claimAutoreleasedReturnValue(), [v17 contentDataObjects], v18 = objc_claimAutoreleasedReturnValue(), v17, v18))
    {
      [(APMediaServiceRequester *)self _handleMediaServiceResponse:v18 params:v11 error:0 completionHandler:v13];
      id v19 = v12;
    }
    else
    {
      objc_initWeak(&location, self);
      v20 = [(APMediaServiceRequester *)self mediaServiceRequest];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10017A60C;
      v22[3] = &unk_100238868;
      objc_copyWeak(&v25, &location);
      id v23 = v11;
      id v24 = v13;
      id v19 = [v20 runWithParameters:v23 mediaServiceSession:v12 completionHandler:v22];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v19 = v12;
  }

  return v19;
}

- (void)_handleMediaServiceResponse:(id)a3 params:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  v14 = [(APMediaServiceRequester *)self mediaServiceRequest];
  [v14 responseTime];
  -[APMediaServiceRequester setResponseTime:](self, "setResponseTime:");

  [(APMediaServiceRequester *)self setReceivedContentDataItems:v10];
  v15 = [(APMediaServiceRequester *)self receivedContentDataItems];
  v16 = [(APMediaServiceRequester *)self contextFingerprint];
  v17 = +[APMediaServiceErrorResponseProcessor processErrorsForContentDataItems:v15 error:v12 contextFingerprint:v16 params:v11];

  if (v17 && ![v10 count])
  {
    [v17 setDiagnosticCode:0];
    v29 = [(APMediaServiceRequester *)self deliveryBlock];
    v36 = v17;
    v30 = +[NSArray arrayWithObjects:&v36 count:1];
    ((void (**)(void, void *))v29)[2](v29, v30);

    v13[2](v13);
  }
  else if ([v10 count])
  {
    unsigned int v18 = [(APMediaServiceRequester *)self hasOdml];
    id v19 = APLogForCategory();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v20)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "ODML enabled. Reranking content data.", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10017AB64;
      v31[3] = &unk_100238890;
      objc_copyWeak(&v33, &buf);
      id v32 = v11;
      +[APMediaServicesRanker rankRepresentations:v10 completionHandler:v31];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (v20)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "ODML disabled. Sorting content data.", (uint8_t *)&buf, 2u);
      }

      v27 = +[APMediaServicesRanker findValidObjectsInContentDataItems:v10];
      v28 = +[APMediaServicesRanker sortByRank:v27];
      [(APMediaServiceRequester *)self _handleRankedRepresentations:v28 params:v11];
    }
  }
  else
  {
    id v21 = objc_alloc((Class)NSUUID);
    v22 = [(APMediaServiceRequester *)self contextFingerprint];
    id v23 = [v21 initWithUUIDString:v22];
    id v24 = +[APContentData createForServerUnfilledReason:1025 placementType:5 contextIdentifier:v23];

    [v24 setDiagnosticCode:1];
    id v25 = [(APMediaServiceRequester *)self deliveryBlock];
    v35 = v24;
    v26 = +[NSArray arrayWithObjects:&v35 count:1];
    ((void (**)(void, void *))v25)[2](v25, v26);

    v13[2](v13);
    v17 = v24;
  }
}

- (void)_handleRankedRepresentations:(id)a3 params:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 firstObject];
  if (v8)
  {
    unsigned int v9 = [v7 deliverEntireBatch];
    uint64_t v10 = [(APMediaServiceRequester *)self deliveryBlock];
    id v11 = (void (**)(void, void))v10;
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    }
    else
    {
      v31 = v8;
      v17 = +[NSArray arrayWithObjects:&v31 count:1];
      ((void (**)(void, void *))v11)[2](v11, v17);
    }
    unsigned int v18 = [(APMediaServiceRequester *)self contextFingerprint];
    id v19 = +[APManagedContext findManagedContextByFingerprint:v18];

    if (v19)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10017AF08;
      v25[3] = &unk_1002388B8;
      v26 = v19;
      id v27 = v8;
      id v28 = v7;
      v29 = self;
      [v6 enumerateObjectsUsingBlock:v25];
      BOOL v20 = [(APMediaServiceRequester *)self completionHandler];
      v20[2]();

      id v21 = v26;
    }
    else
    {
      id v24 = [(APMediaServiceRequester *)self contextFingerprint];
      APSimulateCrashNoKillProcess();

      id v21 = [(APMediaServiceRequester *)self completionHandler];
      v21[2]();
    }
  }
  else
  {
    id v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "No valid content data object was returned by Media API.", buf, 2u);
    }

    unsigned int v13 = [v7 deliverEntireBatch];
    v14 = [(APMediaServiceRequester *)self deliveryBlock];
    v15 = [(APMediaServiceRequester *)self receivedContentDataItems];
    v16 = v15;
    if (v13)
    {
      ((void (**)(void, void *))v14)[2](v14, v15);
    }
    else
    {
      v22 = [v15 firstObject];
      id v32 = v22;
      id v23 = +[NSArray arrayWithObjects:&v32 count:1];
      ((void (**)(void, void *))v14)[2](v14, v23);
    }
    id v19 = [(APMediaServiceRequester *)self completionHandler];
    v19[2]();
  }
}

- (id)_loadJourneyStartRelayValuesFromContentData:(id)a3
{
  objc_super v3 = [a3 representations];
  v4 = [v3 anyObject];

  v13[0] = kAPMetricAdGroupId;
  uint64_t v5 = [v4 journeyRelayAdGroupId];
  id v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_1002392C0;
  }
  v14[0] = v7;
  v13[1] = kAPMetricCampaignId;
  uint64_t v8 = [v4 journeyRelayCampaignId];
  unsigned int v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_1002392C0;
  }
  v14[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (id)_loadInternalPropertiesFromContentData:(id)a3
{
  objc_super v3 = [a3 representations];
  v4 = [v3 anyObject];

  uint64_t v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 adamID];

  if (v6)
  {
    CFStringRef v7 = [v4 adamID];
    [v5 setObject:v7 forKey:kAPMetricSubscriptionIdentifier];
  }
  uint64_t v8 = [v4 impressionID];

  if (v8)
  {
    unsigned int v9 = [v4 impressionID];
    [v5 setObject:v9 forKey:kAPMetricImpressionIdentifier];
  }
  CFStringRef v10 = [v4 metadata];

  if (v10)
  {
    id v11 = [v4 metadata];
    [v5 setObject:v11 forKey:kAPMetadataIdentifier];
  }
  id v12 = +[NSDictionary dictionaryWithDictionary:v5];

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (id)deliveryBlock
{
  return self->_deliveryBlock;
}

- (void)setDeliveryBlock:(id)a3
{
}

- (APMediaServiceRequest)mediaServiceRequest
{
  return self->_mediaServiceRequest;
}

- (void)setMediaServiceRequest:(id)a3
{
}

- (NSString)contextFingerprint
{
  return self->_contextFingerprint;
}

- (void)setContextFingerprint:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
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

- (NSArray)receivedContentDataItems
{
  return self->_receivedContentDataItems;
}

- (void)setReceivedContentDataItems:(id)a3
{
}

- (BOOL)hasOdml
{
  return self->_hasOdml;
}

- (void)setHasOdml:(BOOL)a3
{
  self->_hasOdml = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedContentDataItems, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_contextFingerprint, 0);
  objc_storeStrong((id *)&self->_mediaServiceRequest, 0);
  objc_storeStrong(&self->_deliveryBlock, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end