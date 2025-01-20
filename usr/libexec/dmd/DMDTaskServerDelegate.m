@interface DMDTaskServerDelegate
+ (id)_specialCasedRequestNamesToOperationNames;
- (CATOperationQueue)concurrentOperationQueue;
- (Class)operationClassForRequest:(id)a3 error:(id *)a4;
- (DMDConfigurationEngine)configurationEngine;
- (DMDDeviceStateObserver)deviceStateObserver;
- (DMDTaskServerDelegate)initWithPolicyPersistence:(id)a3 activationManager:(id)a4;
- (DMFOSStateHandler)stateHandler;
- (NSDictionary)serialOperationQueuesByGroup;
- (NSString)description;
- (id)_nameForOperationGroup:(unint64_t)a3;
- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7;
- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6;
- (void)_currentLocaleDidChange:(id)a3;
- (void)configurationEngineDidResume:(id)a3;
- (void)configurationEngineWillSuspend:(id)a3;
- (void)prepareToRunOperation:(id)a3 withContext:(id)a4 withDatabase:(id)a5;
- (void)run;
- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5;
- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6;
- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5;
- (void)server:(id)a3 clientSessionDidConnect:(id)a4;
- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4;
- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4;
@end

@implementation DMDTaskServerDelegate

- (DMDTaskServerDelegate)initWithPolicyPersistence:(id)a3 activationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)DMDTaskServerDelegate;
  v8 = [(DMDTaskServerDelegate *)&v38 init];
  if (v8)
  {
    id v34 = v7;
    uint64_t v9 = objc_opt_new();
    concurrentOperationQueue = v8->_concurrentOperationQueue;
    v8->_concurrentOperationQueue = (CATOperationQueue *)v9;

    v11 = +[NSString stringWithFormat:@"%@.%p.concurrent", objc_opt_class(), v8];
    [(CATOperationQueue *)v8->_concurrentOperationQueue setName:v11];

    char v12 = 1;
    [(CATOperationQueue *)v8->_concurrentOperationQueue setSuspended:1];
    v13 = objc_opt_new();
    uint64_t v14 = 0;
    do
    {
      char v15 = v12;
      v16 = objc_opt_new();
      v17 = v13;
      uint64_t v18 = objc_opt_class();
      v19 = [(DMDTaskServerDelegate *)v8 _nameForOperationGroup:v14];
      v20 = +[NSString stringWithFormat:@"%@.%p.serial.%@", v18, v8, v19];
      [v16 setName:v20];

      v13 = v17;
      [v16 setSuspended:1];
      v21 = +[NSNumber numberWithUnsignedInteger:v14];
      [v17 setObject:v16 forKeyedSubscript:v21];

      char v12 = 0;
      uint64_t v14 = 1;
    }
    while ((v15 & 1) != 0);
    v22 = (NSDictionary *)[v17 copy];
    serialOperationQueuesByGroup = v8->_serialOperationQueuesByGroup;
    v8->_serialOperationQueuesByGroup = v22;

    uint64_t v24 = objc_opt_new();
    deviceStateObserver = v8->_deviceStateObserver;
    v8->_deviceStateObserver = (DMDDeviceStateObserver *)v24;

    id v26 = +[DMDConfigurationDatabase newUserDatabase];
    id v7 = v34;
    v27 = [[DMDConfigurationEngine alloc] initWithDatabase:v26 policyPersistence:v6 activationManager:v34];
    configurationEngine = v8->_configurationEngine;
    v8->_configurationEngine = v27;

    [(DMDConfigurationEngine *)v8->_configurationEngine setDelegate:v8];
    [(DMDConfigurationEngine *)v8->_configurationEngine setDeviceStateProvider:v8->_deviceStateObserver];
    [(DMDConfigurationEngine *)v8->_configurationEngine setTaskOperationProvider:v8];

    [(DMDDeviceStateObserver *)v8->_deviceStateObserver startObservingChanges];
    objc_initWeak(&location, v8);
    id v29 = objc_alloc((Class)DMFOSStateHandler);
    v30 = CATGetCatalystQueue();
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000756D8;
    v35[3] = &unk_1000C9D50;
    objc_copyWeak(&v36, &location);
    v31 = (DMFOSStateHandler *)[v29 initWithQueue:v30 name:@"DMD" stateHandlerBlock:v35];
    stateHandler = v8->_stateHandler;
    v8->_stateHandler = v31;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)run
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting…", v7, 2u);
  }
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

  v4 = [(DMDTaskServerDelegate *)self concurrentOperationQueue];
  [v4 setSuspended:0];

  v5 = [(DMDTaskServerDelegate *)self serialOperationQueuesByGroup];
  [v5 enumerateKeysAndObjectsUsingBlock:&stru_1000CBE60];

  id v6 = [(DMDTaskServerDelegate *)self configurationEngine];
  [v6 resume];
}

- (NSString)description
{
  v3 = objc_opt_new();
  v4 = [(DMDTaskServerDelegate *)self serialOperationQueuesByGroup];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100075968;
  v12[3] = &unk_1000CBE88;
  v12[4] = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  id v6 = [(DMDTaskServerDelegate *)self deviceStateObserver];
  id v7 = [(DMDTaskServerDelegate *)self concurrentOperationQueue];
  v8 = [v7 operations];
  v11 = [(DMDTaskServerDelegate *)self configurationEngine];
  uint64_t v9 = DMFObjectDescription();

  return (NSString *)v9;
}

- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a6;
  char v12 = [(DMDTaskServerDelegate *)self operationClassForRequest:v10 error:a7];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = objc_opt_new();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = v14;
      id v31 = v11;
      id v15 = v11;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v16 = [(objc_class *)v13 requiredEntitlements];
      id v17 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            if (([v15 BOOLValueForEntitlement:v21] & 1) == 0)
            {
              uint64_t v24 = +[NSBundle bundleForClass:objc_opt_class()];
              v25 = [v24 localizedStringForKey:@"Process is missing entitlement “%@”" value:&stru_1000CC390 table:@"DMFServerErrors"];

              uint64_t v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v21);
              v27 = (void *)v26;
              if (a7)
              {
                NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
                uint64_t v37 = v26;
                v28 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
                DMFErrorWithCodeAndUserInfo();
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v23 = 0;
              uint64_t v14 = v30;
              id v11 = v31;
              goto LABEL_21;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      v22 = [v15 valueForEntitlement:DMFEntitlementsApplicationIdentifierKey];
      uint64_t v14 = v30;
      [v30 setClientBundleIdentifier:v22];

      [v30 setUid:[v15 effectiveUserIdentifier]];
      id v11 = v31;
    }
    if ([(objc_class *)v13 validateRequest:v10 error:a7])
    {
      id v23 = [[v13 alloc] initWithRequest:v10];
      [(DMDTaskServerDelegate *)self prepareToRunOperation:v23 withContext:v14 withDatabase:0];
    }
    else
    {
      id v23 = 0;
    }
LABEL_21:
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get operation class for request: %{public}@", buf, 0xCu);
    }
    id v23 = 0;
  }

  return v23;
}

- (Class)operationClassForRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075F60;
  block[3] = &unk_1000CA4E0;
  block[4] = self;
  block[5] = a2;
  if (qword_1000FBD08 != -1) {
    dispatch_once(&qword_1000FBD08, block);
  }
  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  id v10 = [[(id)qword_1000FBD00 firstMatchInString:v9 options:0 range:[v9 length]];
  id v11 = v10;
  if (!v10)
  {
    Class v21 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v12 = [v10 rangeAtIndex:1];
  uint64_t v14 = [v9 substringWithRange:v12, v13];
  id v15 = [(id)objc_opt_class() _specialCasedRequestNamesToOperationNames];
  uint64_t v16 = [v15 objectForKeyedSubscript:v14];
  id v17 = (void *)v16;
  if (v16) {
    id v18 = (void *)v16;
  }
  else {
    id v18 = v14;
  }
  id v19 = v18;

  v20 = +[NSString stringWithFormat:@"DMD%@Operation", v19];

  Class v21 = NSClassFromString(v20);
  if (![(objc_class *)v21 isSubclassOfClass:objc_opt_class()]) {
    Class v21 = 0;
  }

  if (a4)
  {
LABEL_12:
    if (!v21)
    {
      DMFErrorWithCodeAndUserInfo();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_14:
  v22 = v21;

  return v22;
}

- (void)prepareToRunOperation:(id)a3 withContext:(id)a4 withDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v12;
    id v11 = [(DMDTaskServerDelegate *)self configurationEngine];
    [v10 setConfigurationEngine:v11];

    [v10 setContext:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 setDatabase:v9];
  }
}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = v12;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received request: %{public}@, from client: %{public}@", (uint8_t *)&v24, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(id)objc_opt_class() isPermittedOnCurrentPlatform] & 1) != 0)
  {
    uint64_t v13 = [v11 clientUserInfo];
    uint64_t v14 = [v11 transport];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v16 = [v11 transport];
      id v17 = [v13 objectForKeyedSubscript:DMFConnectionSenderPIDKey];
      unsigned int v18 = [v17 intValue];

      if (v18 && v18 != [v16 processIdentifier])
      {
        if (a6)
        {
          DMFErrorWithCodeAndUserInfo();
          v22 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        goto LABEL_10;
      }
    }
    uint64_t v16 = [v13 objectForKeyedSubscript:DMFConnectionTargetUIDKey];
    id v19 = [v13 objectForKeyedSubscript:DMFConnectionAppleIDKey];
    id v20 = [v16 intValue];
    Class v21 = [v11 transport];
    v22 = [(DMDTaskServerDelegate *)self operationForRequest:v12 targetUID:v20 appleID:v19 transport:v21 error:a6];

LABEL_10:
    goto LABEL_14;
  }
  if (a6)
  {
    DMFErrorWithCodeAndUserInfo();
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_14:

  return v22;
}

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Connected %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disconnected %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalidated %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a5 verboseDescription];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Interrupted %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [v6 invalidate];
}

- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    id v10 = a4;
    __int16 v11 = 2114;
    id v12 = a5;
    __int16 v13 = 2114;
    id v14 = a6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notification %{public}@: %{public}@ %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Add operation: %{public}@", buf, 0xCu);
  }
  id v12 = [(DMDTaskServerDelegate *)self serialOperationQueuesByGroup];
  __int16 v13 = [v12 objectForKeyedSubscript:&off_1000D3680];

  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___DMDTaskOperationProtocol])
  {
    id v14 = v11;
    if ([v14 runConcurrently])
    {
      uint64_t v15 = [(DMDTaskServerDelegate *)self concurrentOperationQueue];
    }
    else
    {
      uint64_t v16 = [(DMDTaskServerDelegate *)self serialOperationQueuesByGroup];
      id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 queueGroup]);
      uint64_t v15 = [v16 objectForKeyedSubscript:v17];

      __int16 v13 = v16;
    }

    __int16 v13 = (void *)v15;
  }
  if (!v13)
  {
    unsigned int v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"DMDTaskServerDelegate.m", 295, @"Queue must not be nil for operation: %@", v11 object file lineNumber description];
  }
  [v13 addOperation:v11];
}

- (void)configurationEngineDidResume:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Declaration engine did resume", v3, 2u);
  }
}

- (void)configurationEngineWillSuspend:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Declaration engine did suspend", v3, 2u);
  }
}

+ (id)_specialCasedRequestNamesToOperationNames
{
  if (qword_1000FBD18 != -1) {
    dispatch_once(&qword_1000FBD18, &stru_1000CBEA8);
  }
  v2 = (void *)qword_1000FBD10;

  return v2;
}

- (void)_currentLocaleDidChange:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notified of locale change. Exiting when clean.", v3, 2u);
  }
  xpc_transaction_exit_clean();
}

- (id)_nameForOperationGroup:(unint64_t)a3
{
  if (a3 == 1) {
    return @"declaration";
  }
  else {
    return @"unspecified";
  }
}

- (CATOperationQueue)concurrentOperationQueue
{
  return self->_concurrentOperationQueue;
}

- (NSDictionary)serialOperationQueuesByGroup
{
  return self->_serialOperationQueuesByGroup;
}

- (DMDDeviceStateObserver)deviceStateObserver
{
  return self->_deviceStateObserver;
}

- (DMDConfigurationEngine)configurationEngine
{
  return self->_configurationEngine;
}

- (DMFOSStateHandler)stateHandler
{
  return self->_stateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_configurationEngine, 0);
  objc_storeStrong((id *)&self->_deviceStateObserver, 0);
  objc_storeStrong((id *)&self->_serialOperationQueuesByGroup, 0);

  objc_storeStrong((id *)&self->_concurrentOperationQueue, 0);
}

@end