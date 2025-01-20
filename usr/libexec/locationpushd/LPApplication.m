@interface LPApplication
- (BOOL)_extensionQueue_deliverLocationPayloadToExtension:(id)a3;
- (BOOL)hasLocationPushEntitlement;
- (BOOL)hasLocationPushServiceExtension;
- (LPApplication)init;
- (LPApplication)initWithAppBundleIdentifier:(id)a3;
- (NSMutableArray)pendingReplies;
- (NSString)apsEnvironment;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)extensionQueue;
- (OS_dispatch_queue)pendingReplyQueue;
- (id)serviceExtensionForBundleIdentifier:(id)a3;
- (void)addPendingTokenReply:(id)a3;
- (void)deliverLocationPayloadToExtension:(id)a3;
- (void)deliverToken:(id)a3;
- (void)setExtensionQueue:(id)a3;
- (void)setPendingReplies:(id)a3;
- (void)setPendingReplyQueue:(id)a3;
@end

@implementation LPApplication

- (LPApplication)init
{
}

- (LPApplication)initWithAppBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)LPApplication;
    v7 = [(LPApplication *)&v18 init];
    if (v7)
    {
      id v8 = [v5 stringByAppendingString:@".extension-run"];
      dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
      extensionQueue = v7->_extensionQueue;
      v7->_extensionQueue = (OS_dispatch_queue *)v9;

      id v11 = [v5 stringByAppendingString:@".token-reply"];
      dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
      pendingReplyQueue = v7->_pendingReplyQueue;
      v7->_pendingReplyQueue = (OS_dispatch_queue *)v12;

      uint64_t v14 = +[NSMutableArray array];
      pendingReplies = v7->_pendingReplies;
      v7->_pendingReplies = (NSMutableArray *)v14;

      objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)deliverToken:(id)a3
{
  id v4 = a3;
  id v5 = [(LPApplication *)self pendingReplyQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000040B4;
  v7[3] = &unk_10000C2E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addPendingTokenReply:(id)a3
{
  id v4 = a3;
  id v5 = [(LPApplication *)self pendingReplyQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004284;
  v7[3] = &unk_10000C308;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)deliverLocationPayloadToExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(LPApplication *)self extensionQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000043A0;
  v7[3] = &unk_10000C2E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSString)apsEnvironment
{
  id v3 = objc_alloc((Class)LSApplicationRecord);
  id v4 = [(LPApplication *)self bundleIdentifier];
  id v5 = [v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = [v5 entitlements];
  v7 = [v6 objectForKey:@"aps-environment" ofClass:objc_opt_class()];
  if (([v7 isEqualToString:APSEnvironmentProduction] & 1) != 0
    || [v7 isEqualToString:APSEnvironmentDevelopment])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return (NSString *)v8;
}

- (BOOL)hasLocationPushEntitlement
{
  id v3 = objc_alloc((Class)LSApplicationRecord);
  id v4 = [(LPApplication *)self bundleIdentifier];
  id v5 = [v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = [v5 entitlements];
  v7 = [v6 objectForKey:@"com.apple.developer.location.push" ofClass:objc_opt_class()];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)hasLocationPushServiceExtension
{
  v2 = self;
  id v3 = [(LPApplication *)self bundleIdentifier];
  id v4 = [(LPApplication *)v2 serviceExtensionForBundleIdentifier:v3];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_extensionQueue_deliverLocationPayloadToExtension:(id)a3
{
  id v52 = a3;
  id v4 = [(LPApplication *)self bundleIdentifier];
  id v5 = [(LPApplication *)self serviceExtensionForBundleIdentifier:v4];

  v53 = [v5 identifier];
  if (v5)
  {
    id v6 = [(LPApplication *)self bundleIdentifier];
    id v73 = 0;
    unsigned __int8 v7 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:v6 error:&v73];
    id v50 = v73;

    if (v7)
    {
      uint64_t v8 = dispatch_get_global_queue(21, 0);
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100004F0C;
      v70[3] = &unk_10000C2E0;
      id v48 = v53;
      id v71 = v48;
      id v9 = v5;
      id v72 = v9;
      v49 = (void *)v8;
      v10 = +[BSTimer scheduledTimerWithFireInterval:v8 queue:v70 handler:30.0];
      BSMachAbsoluteTime();
      double v12 = v11;
      *(void *)&long long v82 = 0;
      *((void *)&v82 + 1) = &v82;
      uint64_t v83 = 0x3032000000;
      v84 = sub_100004FE4;
      v85 = sub_100004FF4;
      id v86 = 0;
      id obj = 0;
      v13 = [v9 beginExtensionRequestWithOptions:0 inputItems:0 error:&obj];
      objc_storeStrong(&v86, obj);
      objc_opt_class();
      id v14 = v13;
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v51 = v15;

      [v10 cancel];
      v16 = [v9 _extensionContextForUUID:v51];
      BOOL v17 = v16 != 0;
      if (v16)
      {
        [v9 pidForRequestIdentifier:v51];
        if (BSPIDIsBeingDebugged())
        {
          if (qword_100010D10 != -1) {
            dispatch_once(&qword_100010D10, &stru_10000C398);
          }
          objc_super v18 = qword_100010D18;
          if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v75 = v48;
            __int16 v76 = 2114;
            id v77 = v51;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Extension is being debugged, will skip scheduling timers: sessionUUID=%{public}@", buf, 0x16u);
          }
          v19 = 0;
          id v20 = 0;
        }
        else
        {
          BSMachAbsoluteTime();
          double v30 = v29;
          id v31 = objc_alloc((Class)BSTimer);
          double v32 = fmax(v12 - v30 + 30.0, 0.0);
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_100004FFC;
          v65[3] = &unk_10000C330;
          id v46 = v48;
          id v66 = v46;
          id v33 = v51;
          id v67 = v33;
          id v34 = v9;
          id v68 = v34;
          id v47 = [v31 initWithFireInterval:v8 queue:v65 handler:v32];
          id v35 = objc_alloc((Class)BSTimer);
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_1000050DC;
          v61[3] = &unk_10000C330;
          id v62 = v34;
          id v36 = v33;
          id v63 = v36;
          id v64 = v16;
          id v20 = [v35 initWithFireInterval:v8 queue:v61 handler:25.0];
          if (qword_100010D10 != -1) {
            dispatch_once(&qword_100010D10, &stru_10000C398);
          }
          v37 = qword_100010D18;
          if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            id v75 = v46;
            __int16 v76 = 2114;
            id v77 = v36;
            __int16 v78 = 2048;
            double v79 = v32;
            __int16 v80 = 2048;
            uint64_t v81 = 0x4039000000000000;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}@] Extension started, scheduled timers: sessionUUID=%{public}@, serviceTime=%lf, graceTime=%lf", buf, 0x2Au);
          }

          v19 = v47;
        }
        v38 = v19;
        [v19 schedule];
        [v20 schedule];
        v39 = [v16 _auxiliaryConnection];
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100005208;
        v57[3] = &unk_10000C358;
        v60 = &v82;
        id v40 = v48;
        id v58 = v40;
        id v41 = v51;
        id v59 = v41;
        v42 = [v39 synchronousRemoteObjectProxyWithErrorHandler:v57];
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_100005314;
        v54[3] = &unk_10000C2E0;
        id v55 = v40;
        id v56 = v41;
        [v42 didReceiveLocationPushPayload:v52 reply:v54];

        v43 = [v16 _auxiliaryConnection];
        v44 = [v43 remoteObjectProxy];
        [v44 serviceExtensionPerformCleanup];

        [v38 cancel];
        [v20 cancel];
      }
      else
      {
        if (qword_100010D10 != -1) {
          dispatch_once(&qword_100010D10, &stru_10000C398);
        }
        v27 = qword_100010D18;
        if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(void **)(*((void *)&v82 + 1) + 40);
          *(_DWORD *)buf = 138543618;
          id v75 = v48;
          __int16 v76 = 2114;
          id v77 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not start an extension session: error=%{public}@", buf, 0x16u);
        }
      }

      _Block_object_dispose(&v82, 8);
    }
    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C398);
      }
      v24 = (void *)qword_100010D18;
      BOOL v17 = 0;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = [(LPApplication *)self bundleIdentifier];
        LODWORD(v82) = 138543362;
        *(void *)((char *)&v82 + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Don't yet have non-provisional authorization for %{public}@, bailing...", (uint8_t *)&v82, 0xCu);

        BOOL v17 = 0;
      }
    }
  }
  else
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C398);
    }
    v21 = (void *)qword_100010D18;
    BOOL v17 = 0;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = [(LPApplication *)self bundleIdentifier];
      LODWORD(v82) = 138543362;
      *(void *)((char *)&v82 + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Tried to deliver payload to %{public}@, but couldn't find a location push extension", (uint8_t *)&v82, 0xCu);

      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)serviceExtensionForBundleIdentifier:(id)a3
{
  id v4 = objc_alloc((Class)LSApplicationRecord);
  id v5 = [(LPApplication *)self bundleIdentifier];
  id v6 = [v4 initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];

  if (v6)
  {
    v15[0] = @"com.apple.location.push.service";
    v14[0] = NSExtensionPointName;
    v14[1] = NSExtensionContainingAppName;
    unsigned __int8 v7 = [v6 URL];
    uint64_t v8 = [v7 path];
    v15[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

    uint64_t v13 = 0;
    v10 = +[NSExtension extensionsWithMatchingAttributes:v9 error:&v13];
    double v11 = [v10 firstObject];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (OS_dispatch_queue)extensionQueue
{
  return self->_extensionQueue;
}

- (void)setExtensionQueue:(id)a3
{
}

- (OS_dispatch_queue)pendingReplyQueue
{
  return self->_pendingReplyQueue;
}

- (void)setPendingReplyQueue:(id)a3
{
}

- (NSMutableArray)pendingReplies
{
  return self->_pendingReplies;
}

- (void)setPendingReplies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplies, 0);
  objc_storeStrong((id *)&self->_pendingReplyQueue, 0);
  objc_storeStrong((id *)&self->_extensionQueue, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end