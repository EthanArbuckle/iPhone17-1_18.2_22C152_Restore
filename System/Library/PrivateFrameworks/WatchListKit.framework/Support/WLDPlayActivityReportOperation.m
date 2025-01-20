@interface WLDPlayActivityReportOperation
- (NSArray)livePlayEvents;
- (NSArray)playEvents;
- (NSNumber)nextExpectedReportMillis;
- (UWLMessageWireEnvelope)envelope;
- (WLDPlayActivityReportOperation)init;
- (WLDPlayActivityReportOperation)initWithLivePlayEvents:(id)a3;
- (WLDPlayActivityReportOperation)initWithPlayEvents:(id)a3;
- (id)_protoForURLRequest:(id)a3;
- (id)_userAgentHeaderForRequest:(id)a3;
- (void)prepareURLRequest:(id)a3;
- (void)setEnvelope:(id)a3;
- (void)setLivePlayEvents:(id)a3;
- (void)setPlayEvents:(id)a3;
@end

@implementation WLDPlayActivityReportOperation

- (WLDPlayActivityReportOperation)init
{
  return 0;
}

- (WLDPlayActivityReportOperation)initWithLivePlayEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLDPlayActivityReportOperation;
  v5 = [(WLDPlayActivityReportOperation *)&v9 initWithURLRequest:0 options:4];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    livePlayEvents = v5->_livePlayEvents;
    v5->_livePlayEvents = v6;
  }
  return v5;
}

- (WLDPlayActivityReportOperation)initWithPlayEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLDPlayActivityReportOperation;
  v5 = [(WLDPlayActivityReportOperation *)&v9 initWithURLRequest:0 options:4];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    playEvents = v5->_playEvents;
    v5->_playEvents = v6;
  }
  return v5;
}

- (void)prepareURLRequest:(id)a3
{
  id v4 = a3;
  v5 = WLKNetworkSignpostLogObject();
  v6 = (char *)[(WLDPlayActivityReportOperation *)self signpostIdentifier];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = (os_signpost_id_t)v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NetworkRequest.Config", "", buf, 2u);
    }
  }

  v8 = +[WLKConfigurationManager sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __52__WLDPlayActivityReportOperation_prepareURLRequest___block_invoke;
  v10[3] = &unk_1000450C0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchConfigurationWithCompletionHandler:v10];
}

void __52__WLDPlayActivityReportOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = WLKNetworkSignpostLogObject();
  v8 = (char *)[*(id *)(a1 + 32) signpostIdentifier];
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = (os_signpost_id_t)v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v9, "NetworkRequest.Config", "", buf, 2u);
    }
  }

  if (v5)
  {
    v10 = [v5 serverRouteNamed:@"activityPlay"];
    id v11 = [v10 URL];

    if (v11)
    {
      v12 = +[NSMutableURLRequest requestWithURL:v11 cachePolicy:0 timeoutInterval:WLKDefaultNetworkRequestTimeout];
      [v12 setHTTPMethod:@"POST"];
      [v12 setValue:@"application/x-protobuf" forHTTPHeaderField:@"Content-Type"];
      v13 = +[WLKUserEnvironment currentEnvironment];
      v14 = [v13 platform];
      [v12 setValue:v14 forHTTPHeaderField:@"pfm"];

      v15 = +[NSString stringWithFormat:@"%d", WLKCurrentProtocolVersion()];
      [v12 setValue:v15 forHTTPHeaderField:@"ClientVersion"];

      v16 = [*(id *)(a1 + 32) _protoForURLRequest:v12];
      [*(id *)(a1 + 32) setEnvelope:v16];
      v17 = [v16 data];
      [v12 setHTTPBody:v17];

      id v18 = [v12 copy];
    }
    else
    {
      WLKError();
      id v18 = 0;
      v12 = v6;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v18 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSNumber)nextExpectedReportMillis
{
  v2 = [(WLDPlayActivityReportOperation *)self httpResponse];
  v3 = [v2 allHeaderFields];
  id v4 = objc_msgSend(v3, "wlk_caseInsensitiveValueForKey:", @"X-Apple-Next-Report-Expected-In-Milliseconds");

  return (NSNumber *)v4;
}

- (id)_protoForURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(WLDPlayActivityReportOperation *)self encoder];
  id v6 = [v5 account];

  v38 = objc_msgSend(v6, "ams_DSID");
  uint64_t v7 = [v38 stringValue];
  v8 = objc_alloc_init(UWLMessageHeaders);
  os_signpost_id_t v9 = objc_msgSend(v6, "ams_storefront");
  [(UWLMessageHeaders *)v8 setXAppleStorefront:v9];

  v35 = self;
  v10 = [(WLDPlayActivityReportOperation *)self _userAgentHeaderForRequest:v4];
  [(UWLMessageHeaders *)v8 setUserAgent:v10];

  v37 = (void *)v7;
  [(UWLMessageHeaders *)v8 setXDsid:v7];
  id v11 = +[WLKUserEnvironment currentEnvironment];
  v12 = [v11 platform];
  [(UWLMessageHeaders *)v8 setPfm:v12];

  [(UWLMessageHeaders *)v8 setClientVersion:WLKCurrentProtocolVersion()];
  id v13 = objc_alloc_init((Class)NSMutableArray);
  v40 = v4;
  [v4 URL];
  v36 = v39 = v6;
  v14 = objc_msgSend(v6, "ams_cookiesForURL:");
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v20 = objc_alloc_init(MapEntry);
        v21 = [v19 name];
        [(MapEntry *)v20 setKey:v21];

        v22 = [v19 value];
        [(MapEntry *)v20 setValue:v22];

        [v13 addObject:v20];
      }
      id v16 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v16);
  }
  if ([v13 count]) {
    [(UWLMessageHeaders *)v8 setCookies:v13];
  }
  v23 = objc_alloc_init(UWLMessageWireEnvelope);
  [(UWLMessageWireEnvelope *)v23 setVersion:1];
  [(UWLMessageWireEnvelope *)v23 setHeaders:v8];
  v24 = [(WLDPlayActivityReportOperation *)v35 playEvents];

  if (v24)
  {
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    v25 = [(WLDPlayActivityReportOperation *)v35 playEvents];
    id v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          [(UWLMessageWireEnvelope *)v23 addPlayEvents:*(void *)(*((void *)&v45 + 1) + 8 * (void)j)];
        }
        id v27 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v27);
    }
  }
  else
  {
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    v25 = [(WLDPlayActivityReportOperation *)v35 livePlayEvents];
    id v30 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v25);
          }
          [(UWLMessageWireEnvelope *)v23 addLiveActivityEvents:*(void *)(*((void *)&v41 + 1) + 8 * (void)k)];
        }
        id v31 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v31);
    }
  }

  return v23;
}

- (id)_userAgentHeaderForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(WLDPlayActivityReportOperation *)self encoder];
  id v6 = [v5 requestByEncodingRequest:v4 parameters:0];

  uint64_t v7 = [v6 resultWithError:0];
  v8 = [v7 valueForHTTPHeaderField:AMSHTTPHeaderUserAgent];

  return v8;
}

- (NSArray)playEvents
{
  return self->_playEvents;
}

- (void)setPlayEvents:(id)a3
{
}

- (NSArray)livePlayEvents
{
  return self->_livePlayEvents;
}

- (void)setLivePlayEvents:(id)a3
{
}

- (UWLMessageWireEnvelope)envelope
{
  return self->_envelope;
}

- (void)setEnvelope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelope, 0);
  objc_storeStrong((id *)&self->_livePlayEvents, 0);

  objc_storeStrong((id *)&self->_playEvents, 0);
}

@end