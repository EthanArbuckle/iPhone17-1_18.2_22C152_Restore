@interface APPCControllerCoordinator
+ (id)_addToCacheContentData:(id)a3 context:(id)a4;
+ (void)_sendFirstRequestMetricIfRequiredForPlacement:(unint64_t)a3;
- (APUnfairRecursiveLock)lock;
- (BOOL)hasRunningLandingPageRequest;
- (BOOL)isBlockedForNewsSubscriber:(id)a3 bundleID:(id)a4;
- (Class)mediaServiceRequestClass;
- (NSMutableSet)tokens;
- (NSString)bundleID;
- (id)deliveryBlock;
- (id)mediaServiceSession;
- (id)queryCacheForRequests:(id)a3 managedContext:(id)a4;
- (unint64_t)_getAppStorePlacement:(id)a3;
- (void)_handleMissingClientInfoForRequestOfTypes:(id)a3 forContext:(id)a4;
- (void)_requestFromMediaApi:(id)a3 params:(id)a4 completionHandler:(id)a5;
- (void)_requestFromMediaWithParams:(id)a3 completionHandler:(id)a4;
- (void)createContentDatasFromContext:(id)a3 unfilledReasonCode:(int64_t)a4 types:(id)a5 diagnosticCode:(int64_t)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)findQualifiedPlacementFromCachedData:(id)a3 forRequests:(id)a4;
- (void)handleNewPromotedContent:(id)a3 adsReceived:(unint64_t *)a4 adsRequested:(unint64_t)a5 token:(id)a6 context:(id)a7 lastInBatch:(BOOL)a8 deliverEntireBatch:(BOOL)a9 completionHandler:(id)a10;
- (void)requestFromLegacyInterfaceForPromotedContents:(id)a3 context:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 deliverEntireBatch:(BOOL)a9 completionHandler:(id)a10;
- (void)setHasRunningLandingPageRequest:(BOOL)a3;
- (void)setMediaServiceRequestClass:(Class)a3;
- (void)setMediaServiceSession:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation APPCControllerCoordinator

- (void)dealloc
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      requesterID = self->_requesterID;
    }
    else {
      requesterID = 0;
    }
    *(_DWORD *)buf = 138543362;
    v7 = requesterID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Destroyed APPCControllerCoordinator for requester ID %{public}@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)APPCControllerCoordinator;
  [(APPCControllerCoordinator *)&v5 dealloc];
}

+ (id)_addToCacheContentData:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 fingerprint];
  v8 = +[APManagedContext findManagedContextByFingerprint:v7];

  if (!v8)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v5 content];
      v11 = [v10 identifier];
      v12 = [v6 fingerprint];
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received promoted content %{public}@ for context %{public}@ but managed content does not exist. Creating new managed context.", (uint8_t *)&v16, 0x16u);
    }
    v13 = +[APIDAccountProvider privateUserAccount];
    v8 = +[APManagedContext createManagedContextWithContext:v6 idAccount:v13];
  }
  v14 = [v8 addContentData:v5];

  return v14;
}

- (void)handleNewPromotedContent:(id)a3 adsReceived:(unint64_t *)a4 adsRequested:(unint64_t)a5 token:(id)a6 context:(id)a7 lastInBatch:(BOOL)a8 deliverEntireBatch:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v34 = a8;
  id v14 = a3;
  id v15 = a6;
  int v16 = (void (**)(void))a10;
  v17 = +[APPCControllerCoordinator _addToCacheContentData:v14 context:a7];
  __int16 v18 = [(APPCControllerCoordinator *)self bundleID];
  [v17 markInUseByClientWithId:v18];

  v19 = APLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Send one promoted content", buf, 2u);
  }

  v20 = [(APPCControllerCoordinator *)self deliveryBlock];
  v21 = [v14 content];
  v44 = v21;
  v22 = +[NSArray arrayWithObjects:&v44 count:1];
  ((void (**)(void, void *))v20)[2](v20, v22);

  v23 = [(APPCControllerCoordinator *)self lock];
  [v23 lock];
  ++*a4;
  v24 = APLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [v14 content];
    [v25 identifier];
    v33 = v17;
    v27 = v26 = v16;
    unint64_t v28 = *a4;
    *(_DWORD *)buf = 138544130;
    v37 = v27;
    __int16 v38 = 2114;
    id v39 = v15;
    __int16 v40 = 2050;
    unint64_t v41 = v28;
    __int16 v42 = 2050;
    unint64_t v43 = a5;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received one promoted content %{public}@ for the request %{public}@. Progress %{public}lu/%{public}lu.", buf, 0x2Au);

    int v16 = v26;
    v17 = v33;
  }
  if (a9)
  {
    if (!v34) {
      goto LABEL_12;
    }
  }
  else if (*a4 != a5)
  {
    goto LABEL_12;
  }
  v29 = APLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    [v15 UUIDString];
    v31 = v30 = v16;
    *(_DWORD *)buf = 138543362;
    v37 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "All responses for the request %{public}@ have been received.", buf, 0xCu);

    int v16 = v30;
  }

  v16[2](v16);
  v32 = [(APPCControllerCoordinator *)self tokens];
  [v32 removeObject:v15];

LABEL_12:
  [v23 unlock];
}

- (void)findQualifiedPlacementFromCachedData:(id)a3 forRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSDate date];
  v9 = [v6 expirationDate];
  unsigned int v10 = [v9 isEarlierThan:v8];

  if (v10)
  {
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Promoted content %{public}@ matches a request but is expired.", buf, 0xCu);
    }
  }
  else
  {
    v13 = [v6 placementTypes];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10017C7E0;
    v14[3] = &unk_1002388E0;
    id v15 = v7;
    id v16 = v6;
    v17 = self;
    [v13 enumerateObjectsUsingBlock:v14];

    v11 = v15;
  }
}

- (id)queryCacheForRequests:(id)a3 managedContext:(id)a4
{
  id v6 = a4;
  id v7 = +[NSCountedSet setWithArray:a3];
  [v6 managedContentDataEnumerator];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      -[APPCControllerCoordinator findQualifiedPlacementFromCachedData:forRequests:](self, "findQualifiedPlacementFromCachedData:forRequests:", *(void *)(*((void *)&v16 + 1) + 8 * v12), v7, (void)v16);
      if (![v7 count]) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v13 = +[NSMutableArray arrayWithCountedSet:v7];
  id v14 = +[NSArray arrayWithArray:v13];

  return v14;
}

- (void)requestFromLegacyInterfaceForPromotedContents:(id)a3 context:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 deliverEntireBatch:(BOOL)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v22 = (void (**)(void))a10;
  v23 = v22;
  if (v20)
  {
    unint64_t v28 = v22;
    v24 = APLogForCategory();
    v25 = v16;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v26 = [v17 identifier];
      *(_DWORD *)buf = 136643331;
      *(void *)&uint8_t buf[4] = "-[APPCControllerCoordinator requestFromLegacyInterfaceForPromotedContents:context:withToken:a"
                           "ndBundleID:clientInfo:idAccount:deliverEntireBatch:completionHandler:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2114;
      id v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{sensitive}s: bundleID for context %{public}@ is %{public}@.", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v39 = 0;
    v27 = +[APPromotedContentLegacyInterface sharedInstance];
    objc_initWeak(&location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10017CDB8;
    v29[3] = &unk_100238908;
    objc_copyWeak(&v35, &location);
    BOOL v34 = buf;
    id v30 = v25;
    id v31 = v18;
    id v32 = v17;
    BOOL v36 = a9;
    id v33 = v28;
    [v27 requestPromotedContentOfTypes:v30 forContext:v32 withToken:v31 andBundleID:v19 clientInfo:v20 idAccount:v21 completionHandler:v29];

    id v16 = v25;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
    v23 = (void (**)(void))v28;
  }
  else
  {
    [(APPCControllerCoordinator *)self _handleMissingClientInfoForRequestOfTypes:v16 forContext:v17];
    v23[2](v23);
  }
}

- (void)_handleMissingClientInfoForRequestOfTypes:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v30 = @"BUG ON INTEGRATOR: This app appears to be integrating with PromotedContentUI, but is making requests for Ads without having already called the [PCUI start] method.";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  CFStringRef v27 = @"requestTypes";
  id v28 = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  CreateDiagnosticReport();

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v14 intValue] & 0x80000000) != 0 || (int)objc_msgSend(v14, "intValue") > 9) {
          uint64_t v15 = -1;
        }
        else {
          uint64_t v15 = (int)[v14 intValue];
        }
        id v16 = [v7 identifier];
        id v17 = +[APContentData createForServerUnfilledReason:1026 placementType:v15 contextIdentifier:v16];

        id v18 = [(APPCControllerCoordinator *)self deliveryBlock];
        v25 = v17;
        id v19 = +[NSArray arrayWithObjects:&v25 count:1];
        ((void (**)(void, void *))v18)[2](v18, v19);
      }
      id v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }
}

- (void)_requestFromMediaWithParams:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(APPCControllerCoordinator *)self mediaServiceRequestClass]) {
    id v8 = [(APPCControllerCoordinator *)self mediaServiceRequestClass];
  }
  else {
    id v8 = (objc_class *)APMediaServiceRequest;
  }
  id v9 = objc_alloc_init(v8);
  [(APPCControllerCoordinator *)self _requestFromMediaApi:v9 params:v7 completionHandler:v6];
}

- (void)_requestFromMediaApi:(id)a3 params:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 placement];
  if (v11 == (id)7005) {
    [(APPCControllerCoordinator *)self setHasRunningLandingPageRequest:1];
  }
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_10017D414;
  CFStringRef v27 = sub_10017D424;
  id v28 = objc_alloc_init(APMediaServiceRequester);
  uint64_t v12 = [(APPCControllerCoordinator *)self deliveryBlock];
  [(id)v24[5] setDeliveryBlock:v12];

  v13 = [(APPCControllerCoordinator *)self bundleID];
  [(id)v24[5] setBundleID:v13];

  objc_initWeak(&location, self);
  id v14 = (void *)v24[5];
  uint64_t v15 = [(APPCControllerCoordinator *)self mediaServiceSession];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10017D42C;
  v18[3] = &unk_100238930;
  v21[1] = v11;
  objc_copyWeak(v21, &location);
  id v16 = v10;
  id v19 = v16;
  id v20 = &v23;
  id v17 = [v14 sendRequest:v8 params:v9 mediaServiceSession:v15 completionHandler:v18];
  [(APPCControllerCoordinator *)self setMediaServiceSession:v17];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v23, 8);
}

- (unint64_t)_getAppStorePlacement:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3
    || ([v3 current], id v5 = objc_claimAutoreleasedReturnValue(), v5, !v5)
    || ([v4 current],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = (char *)[v6 placement],
        v6,
        (unint64_t)(v7 - 7009) <= 0xFFFFFFFFFFFFFFFBLL))
  {
    APSimulateCrash();
    id v7 = 0;
  }

  return (unint64_t)v7;
}

+ (void)_sendFirstRequestMetricIfRequiredForPlacement:(unint64_t)a3
{
  if ((byte_10028D230 & 1) == 0)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    if ((byte_10028D230 & 1) == 0)
    {
      id v5 = +[NSDate now];
      id v6 = +[APPromotedContentControllerDaemonModule daemonStartTime];
      [v5 timeIntervalSinceDate:v6];
      double v8 = v7;

      v12[0] = @"Interval";
      id v9 = +[NSNumber numberWithDouble:v8];
      v12[1] = @"Placement";
      v13[0] = v9;
      id v10 = +[NSNumber numberWithUnsignedInteger:a3];
      v13[1] = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

      +[APAnalytics sendEvent:@"FirstRequestDelay" customPayload:v11];
      byte_10028D230 = 1;
    }
    objc_sync_exit(v4);
  }
}

- (BOOL)isBlockedForNewsSubscriber:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"com.apple.news"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.stocks"])
  {
    double v7 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
    double v8 = [v7 blockAdsForSubscribers];

    if (v8)
    {
      id v9 = [v7 blockAdsForSubscribers];
      unsigned int v10 = [v9 BOOLValue];
    }
    else
    {
      unsigned int v10 = 1;
    }
    id v11 = [v5 supplementalContext];
    uint64_t v12 = [v11 objectForKey:APSupplementalContextFeedMetadataContentProviderIdKey];

    v13 = [v5 supplementalContext];
    id v14 = [v13 objectForKey:APSupplementalContextPlacementKey];

    if (v10) {
      LOBYTE(v10) = +[APPCPolicyEngine isSubscriber]
    }
                 && (([v14 isEqualToString:APSupplementalContextInFeedKey] & 1) != 0
                  || [v14 isEqualToString:APSupplementalContextNativeInFeedKey])
                 && [v12 intValue] == 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)createContentDatasFromContext:(id)a3 unfilledReasonCode:(int64_t)a4 types:(id)a5 diagnosticCode:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  v29 = (void (**)(void))a7;
  v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v12;
  id v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    uint64_t v14 = *(void *)v35;
    uint64_t v15 = &swift_getForeignTypeMetadata_ptr;
    id v30 = v11;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v17 intValue] & 0x80000000) != 0 || (int)objc_msgSend(v17, "intValue") > 9) {
          uint64_t v18 = -1;
        }
        else {
          uint64_t v18 = (int)[v17 intValue];
        }
        id v19 = v15[186];
        id v20 = [v11 identifier];
        if (a4 == 1029)
        {
          [v11 maxSize];
          long long v21 = [v19 createForServerUnfilledReason:1029 placementType:v18 contextIdentifier:v20 size:];

          id v20 = [[APContentDataInternal alloc] initWithContent:v21];
          long long v22 = +[APPCControllerCoordinator _addToCacheContentData:v20 context:v11];
          [(APPCControllerCoordinator *)self bundleID];
          uint64_t v23 = v15;
          uint64_t v24 = v14;
          uint64_t v25 = v13;
          CFStringRef v27 = v26 = a6;
          [v22 markInUseByClientWithId:v27];

          a6 = v26;
          v13 = v25;
          uint64_t v14 = v24;
          uint64_t v15 = v23;
          a4 = 1029;
          id v11 = v30;
          [v22 markUsed];
        }
        else
        {
          long long v21 = [v19 createForServerUnfilledReason:a4 placementType:v18 contextIdentifier:v20];
        }

        [v21 setDiagnosticCode:a6];
        [v13 addObject:v21];
      }
      id v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
  }

  id v28 = [(APPCControllerCoordinator *)self deliveryBlock];
  ((void (**)(void, void *))v28)[2](v28, v13);

  v29[2](v29);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (id)deliveryBlock
{
  return self->_deliveryBlock;
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (BOOL)hasRunningLandingPageRequest
{
  return self->_hasRunningLandingPageRequest;
}

- (void)setHasRunningLandingPageRequest:(BOOL)a3
{
  self->_hasRunningLandingPageRequest = a3;
}

- (id)mediaServiceSession
{
  id WeakRetained = objc_loadWeakRetained(&self->_mediaServiceSession);

  return WeakRetained;
}

- (void)setMediaServiceSession:(id)a3
{
}

- (Class)mediaServiceRequestClass
{
  return self->_mediaServiceRequestClass;
}

- (void)setMediaServiceRequestClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceRequestClass, 0);
  objc_destroyWeak(&self->_mediaServiceSession);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong(&self->_deliveryBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_requesterID, 0);
}

@end