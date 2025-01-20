@interface APAdSpaceEventRequester
- (APAdSpaceEventRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 idAccount:(id)a6;
- (BOOL)isAllowedEmptyResponse;
- (Class)responseClass;
- (id)headers;
- (id)protoBuffer;
- (int)statusCode;
- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5;
- (void)makeRequest:(id)a3;
- (void)setStatusCode:(int)a3;
@end

@implementation APAdSpaceEventRequester

- (APAdSpaceEventRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 idAccount:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)APAdSpaceEventRequester;
  v6 = [(APLegacyMetricRequester *)&v17 initWithMetric:a3 internalContent:a4 andContext:a5 clientInfo:0 idAccount:a6];
  v7 = v6;
  if (v6)
  {
    v8 = [(APLegacyMetricRequester *)v6 context];

    if (!v8)
    {
      v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [(APLegacyMetricRequester *)v7 internalContent];
        v11 = [v10 content];
        v12 = [v11 identifier];
        v13 = [(APLegacyMetricRequester *)v7 internalContent];
        v14 = [v13 content];
        v15 = [v14 contextIdentifier];
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No context for content %{public}@ with context identifier %{public}@", buf, 0x16u);
      }
    }
  }
  return v7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (int)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int)a3
{
  if (a3 <= 0xE && ((1 << a3) & 0x40E0) != 0
    || (a3 - 3002) <= 9 && ((1 << (a3 + 70)) & 0x213) != 0)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      uint64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Setting obsolete ASE %ld.", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_statusCode = a3;
}

- (void)makeRequest:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  if ([(APAdSpaceEventRequester *)self statusCode])
  {
    v12.receiver = self;
    v12.super_class = (Class)APAdSpaceEventRequester;
    [(APServerRequester *)&v12 makeRequest:v4];
    v5 = [(APLegacyMetricRequester *)self internalContent];
    [v5 statusEventSent:-[APAdSpaceEventRequester statusCode](self, "statusCode")];
  }
  else
  {
    uint64_t v6 = [(APLegacyMetricRequester *)self internalContent];
    uint64_t v7 = [(id)v6 content];
    v8 = [v7 identifier];
    v9 = +[NSString stringWithFormat:@"ASE 0 will not be sent for content ID %@", v8];

    v10 = +[NSProcessInfo processInfo];
    LOBYTE(v6) = [v10 isRunningTests];

    if ((v6 & 1) == 0) {
      APSimulateCrash();
    }
    v11 = +[APLegacyInterfaceError invalidRequestErrorWithCode:0 reason:v9];
    v4[2](v4, 0, v11);
  }
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v10 = objc_alloc((Class)NSUserDefaults);
    id v11 = [v10 initWithSuiteName:APDefaultsBundleID];
    if ([v11 BOOLForKey:@"disableDelayForRequests"])
    {
      objc_super v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[APAdSpaceEventRequester makeDelayedRequest:requestSentHandler:responseCallback:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s Overriding delay to 0 seconds", buf, 0xCu);
      }

      a3 = 0.0;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)APAdSpaceEventRequester;
  [(APServerRequester *)&v14 makeDelayedRequest:v8 requestSentHandler:v9 responseCallback:a3];
  v13 = [(APLegacyMetricRequester *)self internalContent];
  [v13 statusEventSent:-[APAdSpaceEventRequester statusCode](self, "statusCode")];
}

- (id)headers
{
  v9.receiver = self;
  v9.super_class = (Class)APAdSpaceEventRequester;
  v3 = [(APServerRequester *)&v9 headers];
  id v4 = [v3 mutableCopy];

  [(APServerRequester *)self roundedTimestamp];
  uint64_t v6 = +[NSString stringWithFormat:@"%.6f", v5];
  [v4 setValue:v6 forKey:@"timestamp"];

  id v7 = [v4 copy];

  return v7;
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBAdSpaceStatusEventRequest);
  [(APPBAdSpaceStatusEventRequest *)v3 setStatusCode:[(APAdSpaceEventRequester *)self statusCode]];
  id v4 = [(APLegacyMetricRequester *)self internalContent];
  uint64_t v5 = [v4 privateContent];
  uint64_t v6 = [v5 adResponseIdentifier];
  [(APPBAdSpaceStatusEventRequest *)v3 setAdServerResponseIdentifier:v6];

  id v7 = [(APLegacyMetricRequester *)self internalContent];
  id v8 = [v7 content];
  objc_super v9 = [v8 identifier];
  [(APPBAdSpaceStatusEventRequest *)v3 setAdOriginIdentifier:v9];

  id v10 = +[APEncryptedIDProvider provider];
  id v11 = [(APServerRequester *)self idAccount];
  objc_super v12 = [v10 encryptedIDsForIDAccountPrivate:v11];

  if ([(APAdSpaceEventRequester *)self statusCode] != 360)
  {
    __int16 v20 = [v12 anonymousDemandID];
    [(APPBAdSpaceStatusEventRequest *)v3 setAnonymousDemandiAdID:v20];

    v21 = [v12 contentID];
    [(APPBAdSpaceStatusEventRequest *)v3 setContentiAdID:v21];

    v22 = [v12 DPID];
    [(APPBAdSpaceStatusEventRequest *)v3 setDPID:v22];

    v23 = [v12 iAdID];
    [(APPBAdSpaceStatusEventRequest *)v3 setIAdID:v23];

    if (![(APPBAdSpaceStatusEventRequest *)v3 hasAnonymousDemandiAdID]
      || ![(APPBAdSpaceStatusEventRequest *)v3 hasContentiAdID]
      || ![(APPBAdSpaceStatusEventRequest *)v3 hasIAdID])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A4BEC;
      block[3] = &unk_100233D50;
      v50 = v3;
      if (qword_100289850 != -1) {
        dispatch_once(&qword_100289850, block);
      }
    }
    v24 = [(APLegacyMetricRequester *)self metric];
    v25 = metricPropertyValue(v24, (void *)0x15);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [(APLegacyMetricRequester *)self metric];
      v27 = metricPropertyValue(v26, (void *)0x15);
      LODWORD(v28) = [v27 intValue];

      if (v28 != -1)
      {
        uint64_t v28 = (int)v28;
        goto LABEL_22;
      }
    }
    else
    {
    }
    v29 = [(APLegacyMetricRequester *)self internalContent];
    uint64_t v30 = [v29 content];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [(APLegacyMetricRequester *)self internalContent];
      v33 = [v32 content];
      v34 = [v33 representations];
      id v35 = [v34 count];

      if (!v35)
      {
        uint64_t v28 = -1;
        goto LABEL_22;
      }
      v29 = [(APLegacyMetricRequester *)self internalContent];
      v36 = [v29 content];
      v37 = [v36 getRepresentation];
      uint64_t v28 = (uint64_t)[v37 placementType];
    }
    else
    {
      uint64_t v28 = -1;
    }

LABEL_22:
    objc_super v17 = [(APLegacyMetricRequester *)self context];
    v18 = [(APLegacyMetricRequester *)self internalContent];
    v38 = [v18 content];
    v39 = [v38 identifier];
    v40 = [v17 contextJSONForRequest:v39 andPlacementType:v28];
    [(APPBAdSpaceStatusEventRequest *)v3 setContextJSON:v40];

    goto LABEL_23;
  }
  v13 = [v12 deviceNewsPlusSubscriberID];
  [(APPBAdSpaceStatusEventRequest *)v3 setIAdID:v13];

  if (![(APPBAdSpaceStatusEventRequest *)v3 hasIAdID])
  {
    CFStringRef v53 = @"hasIAdID";
    objc_super v14 = +[NSNumber numberWithBool:[(APPBAdSpaceStatusEventRequest *)v3 hasIAdID]];
    v54 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];

    v16 = [v15 description];
    CreateDiagnosticReport();
  }
  objc_super v17 = [(APServerRequester *)self idAccount];
  v18 = APLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v17 deviceNewsPlusSubscriberID];
    *(_DWORD *)buf = 138543362;
    v52 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting iAdID to deviceNewsPlusSubscriberID %{public}@", buf, 0xCu);
  }
LABEL_23:

  [(APServerRequester *)self roundedTimestamp];
  -[APPBAdSpaceStatusEventRequest setTimestamp:](v3, "setTimestamp:");
  v41 = [(APLegacyMetricRequester *)self internalContent];
  v42 = [v41 privateContent];
  [v42 responseTime];
  -[APPBAdSpaceStatusEventRequest setResponseTime:](v3, "setResponseTime:");

  v43 = [(APLegacyMetricRequester *)self internalContent];
  -[APPBAdSpaceStatusEventRequest setFirstMessage:](v3, "setFirstMessage:", [v43 isFirstMessage:[APAdSpaceEventRequester statusCode](self, "statusCode")]);

  v44 = +[APDeviceInfo current];
  v45 = [v44 osVersionAndBuild];
  [(APPBAdSpaceStatusEventRequest *)v3 setOsVersionAndBuild:v45];

  v46 = [(APLegacyMetricRequester *)self metric];
  v47 = [v46 bundleIdentifier];
  [(APPBAdSpaceStatusEventRequest *)v3 setBundleID:v47];

  return v3;
}

@end