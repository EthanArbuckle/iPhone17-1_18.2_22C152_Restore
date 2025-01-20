@interface APLegacyMetricRequester
- (APClientInfo)clientInfo;
- (APContentDataInternal)internalContent;
- (APContext)context;
- (APLegacyMetricRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (APLegacyMetricRetryManagerProtocol)retryManager;
- (APMetricProtocol)metric;
- (APPBLogMetaData)logMetadata;
- (void)requestWillSend:(id)a3 headers:(id)a4 request:(id)a5;
- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5;
- (void)setClientInfo:(id)a3;
- (void)setContext:(id)a3;
- (void)setInternalContent:(id)a3;
- (void)setMetric:(id)a3;
- (void)setRetryManager:(id)a3;
@end

@implementation APLegacyMetricRequester

- (APLegacyMetricRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v13 = a3;
  v14 = (APContentDataInternal *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v32 = a5;
  id v33 = a6;
  v34 = v16;
  id obj = a3;
  if (v14
    && ([(APContentDataInternal *)v14 content],
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v18))
  {
    v19 = v14;
  }
  else
  {
    v19 = objc_alloc_init(APContentDataInternal);

    if (v15)
    {
      v20 = [v15 identifier];
      v21 = [(APContentDataInternal *)v19 content];
      [v21 setContextIdentifier:v20];
    }
  }
  v35 = v13;
  uint64_t v22 = [v13 bundleIdentifier];
  if (v22) {
    v23 = (__CFString *)v22;
  }
  else {
    v23 = @"com.apple.ap.promotedcontentd";
  }
  v24 = +[NSUUID UUID];
  v25 = [v15 identifier];
  v26 = [v25 UUIDString];
  v27 = [(APContentDataInternal *)v19 content];
  v28 = [v27 identifier];
  v36.receiver = self;
  v36.super_class = (Class)APLegacyMetricRequester;
  v29 = [(APServerRequester *)&v36 initWithBundleID:v23 requestIdentifier:v24 contextIdentifier:v26 contentIdentifier:v28 idAccount:v17];

  if (v29)
  {
    objc_storeStrong((id *)&v29->_metric, obj);
    objc_storeStrong((id *)&v29->_internalContent, v19);
    objc_storeStrong((id *)&v29->_context, v32);
    objc_storeStrong((id *)&v29->_clientInfo, v33);
  }

  return v29;
}

- (APPBLogMetaData)logMetadata
{
  logMetadata = self->_logMetadata;
  if (!logMetadata)
  {
    v4 = objc_alloc_init(APPBLogMetaData);
    v5 = self->_logMetadata;
    self->_logMetadata = v4;

    v6 = [(APLegacyMetricRequester *)self clientInfo];
    v7 = +[APEncryptedIDProvider provider];
    v8 = [(APServerRequester *)self idAccount];
    v9 = [v7 encryptedIDsForIDAccountPrivate:v8];

    v10 = [(APContentDataInternal *)self->_internalContent privateContent];
    v11 = [v10 batchResponseID];
    [(APPBLogMetaData *)self->_logMetadata setBatchId:v11];

    v12 = [(APContentDataInternal *)self->_internalContent privateContent];
    id v13 = [v12 adResponseIdentifier];
    [(APPBLogMetaData *)self->_logMetadata setAdDataResponseIdentifier:v13];

    v14 = [(APContentDataInternal *)self->_internalContent privateContent];
    id v15 = [v14 impressionIdentifier];
    [(APPBLogMetaData *)self->_logMetadata setImpressionIdentifierData:v15];

    id v16 = [(APContentDataInternal *)self->_internalContent privateContent];
    -[APPBLogMetaData setMessageSequence:](self->_logMetadata, "setMessageSequence:", [v16 sequenceNumber]);

    id v17 = [(APContentDataInternal *)self->_internalContent transientContent];
    -[APPBLogMetaData setImpressionSequence:](self->_logMetadata, "setImpressionSequence:", [v17 impressionSequenceNumber]);

    v18 = +[NSDate date];
    [v18 timeIntervalSince1970];
    -[APPBLogMetaData setTimeStamp:](self->_logMetadata, "setTimeStamp:");

    v19 = +[APDeviceInfo current];
    -[APPBLogMetaData setConnectionType:](self->_logMetadata, "setConnectionType:", +[APLegacyTypeTranslator connectionTypeToAPPBAdConnection:](APLegacyTypeTranslator, "connectionTypeToAPPBAdConnection:", [v19 connectionType]));

    v20 = objc_alloc_init(APPBAdSize);
    [(APPBLogMetaData *)self->_logMetadata setScreenSize:v20];

    if (v6)
    {
      id v21 = [v6 screenWidth];
      uint64_t v22 = [(APPBLogMetaData *)self->_logMetadata screenSize];
      [v22 setWidth:v21];

      id v23 = [v6 screenHeight];
      v24 = [(APPBLogMetaData *)self->_logMetadata screenSize];
      [v24 setHeight:v23];

      v25 = [v6 scale];
      -[APPBLogMetaData setScreenScale:](self->_logMetadata, "setScreenScale:", (double)(int)[v25 intValue]);
    }
    v26 = [v9 iAdID];
    [(APPBLogMetaData *)self->_logMetadata setIAdID:v26];

    v27 = [v9 anonymousDemandID];
    [(APPBLogMetaData *)self->_logMetadata setAnonymousDemandiAdID:v27];

    v28 = [v9 contentID];
    [(APPBLogMetaData *)self->_logMetadata setContentiAdID:v28];

    v29 = [v9 DPID];
    [(APPBLogMetaData *)self->_logMetadata setDPID:v29];

    v30 = [(APContentDataInternal *)self->_internalContent privateContent];
    unsigned int v31 = [v30 isCarouselAd];

    if (v31)
    {
      id v32 = [(APContentDataInternal *)self->_internalContent transientContent];
      -[APPBLogMetaData setSlotPosition:](self->_logMetadata, "setSlotPosition:", [v32 clickedCarouselElement]);
    }
    id v33 = [(APLegacyMetricRequester *)self internalContent];
    v34 = [v33 transientContent];
    int v35 = [v34 clickCount];

    if (v35 >= 2) {
      [(APPBLogMetaData *)self->_logMetadata setOverclickCount:(v35 - 1)];
    }

    logMetadata = self->_logMetadata;
  }

  return logMetadata;
}

- (void)requestWillSend:(id)a3 headers:(id)a4 request:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)APLegacyMetricRequester;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(APServerRequester *)&v17 requestWillSend:v10 headers:v9 request:v8];
  v11 = +[NSProcessInfo processInfo];
  [v11 isRunningTests];

  v12 = [APServerRequest alloc];
  id v13 = [(APServerRequester *)self requestIdentifier];
  v14 = [(APServerRequester *)self bundleID];
  id v15 = sub_1000E8248((id *)&v12->super.isa, v13, v14, v10, v9, v8, [(APServerRequester *)self responseClass]);

  id v16 = [(APLegacyMetricRequester *)self retryManager];
  [v16 registerMetricRequest:v15];
}

- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSProcessInfo processInfo];
  [v11 isRunningTests];

  v16.receiver = self;
  v16.super_class = (Class)APLegacyMetricRequester;
  [(APServerRequester *)&v16 responseReceived:v10 responseProtobuf:v9 error:v8];

  int64_t v12 = +[APLegacyMetricRetryManager resultForResponse:v10 error:v8];
  id v13 = [(APLegacyMetricRequester *)self retryManager];
  v14 = [(APServerRequester *)self requestIdentifier];
  id v15 = [v14 UUIDString];
  [v13 completeServerRequestId:v15 result:v12];
}

- (APMetricProtocol)metric
{
  return (APMetricProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetric:(id)a3
{
}

- (APContentDataInternal)internalContent
{
  return (APContentDataInternal *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalContent:(id)a3
{
}

- (APContext)context
{
  return (APContext *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContext:(id)a3
{
}

- (APClientInfo)clientInfo
{
  return (APClientInfo *)objc_getProperty(self, a2, 112, 1);
}

- (void)setClientInfo:(id)a3
{
}

- (APLegacyMetricRetryManagerProtocol)retryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_retryManager);

  return (APLegacyMetricRetryManagerProtocol *)WeakRetained;
}

- (void)setRetryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_retryManager);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_internalContent, 0);
  objc_storeStrong((id *)&self->_metric, 0);

  objc_storeStrong((id *)&self->_logMetadata, 0);
}

@end