@interface UISApplicationStateService
- (BOOL)_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:(id)a3 description:(id)a4;
- (BOOL)_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:(id)a3 description:(id)a4 legacyEntitlement:(id)a5;
- (UISApplicationStateService)init;
- (UISApplicationStateService)initWithCalloutQueue:(id)a3;
- (UISApplicationStateServiceDelegate)delegate;
- (id)_dataSourceForApplicationBundleIdentifier:(id)a3;
- (id)_operatingBundleIdentifier;
- (void)badgeValueWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)nextWakeIntervalSinceReferenceDateWithCompletion:(id)a3;
- (void)setBadgeValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(id)a3;
- (void)setNextWakeIntervalSinceReferenceDate:(id)a3;
- (void)setUsesBackgroundNetwork:(id)a3;
- (void)usesBackgroundNetworkWithCompletion:(id)a3;
@end

@implementation UISApplicationStateService

void __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke(void *a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F628B0];
  id v5 = a2;
  v4 = [v3 userInteractive];
  [v5 setServiceQuality:v4];

  [v5 setInterface:a1[4]];
  [v5 setInterfaceTarget:a1[5]];
  [v5 setTargetDispatchingQueue:*(void *)(a1[5] + 16)];
  [v5 setInterruptionHandler:&__block_literal_global_4];
  [v5 setInvalidationHandler:&__block_literal_global_71];
  [v5 setUserInfo:a1[6]];
}

- (void)setBadgeValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v5 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v5 description:@"set badge value" legacyEntitlement:@"com.apple.frontboard.app-badge-value-access"])
  {
    v6 = [(UISApplicationStateService *)self _dataSourceForApplicationBundleIdentifier:v5];
    if (v6)
    {
      if (objc_opt_respondsToSelector())
      {
        [v6 setBadgeValue:v4];
        v7 = _UISStateServiceLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = [MEMORY[0x1E4F62880] currentContext];
          int v10 = 138543874;
          v11 = v8;
          __int16 v12 = 2114;
          v13 = v5;
          __int16 v14 = 2114;
          id v15 = v4;
          v9 = "Client \"%{public}@\" set the badge value of %{public}@ to %{public}@";
LABEL_10:
          _os_log_impl(&dword_191ABF000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x20u);
        }
      }
      else
      {
        v7 = _UISStateServiceLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = [MEMORY[0x1E4F62880] currentContext];
          int v10 = 138543874;
          v11 = v8;
          __int16 v12 = 2114;
          v13 = v5;
          __int16 v14 = 2114;
          id v15 = v4;
          v9 = "Ignored client \"%{public}@\" request to change the badge value of %{public}@ to %{public}@ because the s"
               "erver does not support setting badge values for this application.";
          goto LABEL_10;
        }
      }
    }
    else
    {
      v7 = _UISStateServiceLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [MEMORY[0x1E4F62880] currentContext];
        int v10 = 138543874;
        v11 = v8;
        __int16 v12 = 2114;
        v13 = v5;
        __int16 v14 = 2114;
        id v15 = v4;
        v9 = "Ignored client \"%{public}@\" request to change the badge value of %{public}@ to %{public}@ because the ser"
             "ver reported no data source for the application.";
        goto LABEL_10;
      }
    }
  }
}

- (void)badgeValueWithCompletion:(id)a3
{
  v13 = (void (**)(id, void *, void *, void))a3;
  if (!v13)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UISApplicationStateService.m", 266, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v5 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v5 description:@"get badge value" legacyEntitlement:@"com.apple.frontboard.app-badge-value-access"])
  {
    v6 = [(UISApplicationStateService *)self _dataSourceForApplicationBundleIdentifier:v5];
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = [v6 badgeValue];
    }
    else
    {
      v7 = 0;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      int v10 = v7;
    }
    else {
      int v10 = 0;
    }
    if (v9) {
      v11 = v7;
    }
    else {
      v11 = 0;
    }
    v13[2](v13, v10, v11, 0);
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EE28C190 code:0 userInfo:0];
    ((void (**)(id, void *, void *, void *))v13)[2](v13, 0, 0, v7);
  }
}

- (id)_operatingBundleIdentifier
{
  id v4 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [v4 userInfo];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [MEMORY[0x1E4F62880] currentContext];
    [v7 handleFailureInMethod:a2, self, @"UISApplicationStateService.m", 326, @"Must have a bundle identifier on the connection - userInfo: %@ (currentContext: %@)", 0, v8 object file lineNumber description];
  }
  return v5;
}

- (BOOL)_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:(id)a3 description:(id)a4 legacyEntitlement:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  v11 = [MEMORY[0x1E4F62880] currentContext];
  __int16 v12 = [v11 remoteProcess];
  v13 = v12;
  if (!v12)
  {
    v17 = _UISStateServiceLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_191ABF000, v17, OS_LOG_TYPE_DEFAULT, "Client: %{public}@ unable to validate caller.", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_11;
  }
  __int16 v14 = [v12 bundleIdentifier];
  char v15 = [v14 isEqualToString:v8];

  if ((v15 & 1) == 0
    && ([v13 hasEntitlement:@"com.apple.uikitservices.app.value-access"] & 1) == 0
    && (!v10 || ([v13 hasEntitlement:v10] & 1) == 0))
  {
    v17 = _UISStateServiceLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543874;
      v20 = v11;
      __int16 v21 = 2114;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_error_impl(&dword_191ABF000, v17, OS_LOG_TYPE_ERROR, "Client: %{public}@ not authorized to %{public}@ on behalf of application: %{public}@", (uint8_t *)&v19, 0x20u);
    }
LABEL_11:

    BOOL v16 = 0;
    goto LABEL_12;
  }
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (id)_dataSourceForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  if (*(unsigned char *)&self->_delegateFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [WeakRetained dataSourceForApplicationBundleIdentifier:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = [a5 decodeStringForKey:0x1EE28C0F0];
  id v9 = v8;
  if (v8 && [v8 length])
  {
    id v10 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:0x1EE28C170];
    v11 = [MEMORY[0x1E4F62868] protocolForProtocol:&unk_1EE298610];
    [v10 setServer:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke;
    v13[3] = &unk_1E57352E8;
    id v14 = v10;
    char v15 = self;
    id v16 = v9;
    id v12 = v10;
    [v7 configureConnection:v13];
    [v7 activate];
  }
  else
  {
    [v7 invalidate];
  }
}

uint64_t __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)setMinimumBackgroundFetchInterval:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v5 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v5 description:@"set maximum background fetch interval"])
  {
    [v4 doubleValue];
    double v7 = v6;
    id v8 = _UISStateServiceLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v7;
      _os_log_impl(&dword_191ABF000, v8, OS_LOG_TYPE_INFO, "%{public}@ wants minFetchInterval: %f", buf, 0x16u);
    }

    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v9 = (void *)qword_1EB288850;
    uint64_t v15 = qword_1EB288850;
    if (!qword_1EB288850)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_DASSchedulerClass_block_invoke;
      v17 = &unk_1E5735260;
      v18 = &v12;
      __get_DASSchedulerClass_block_invoke((uint64_t)buf);
      id v9 = (void *)v13[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v12, 8);
    v11 = objc_msgSend(v10, "sharedScheduler", v12);
    [v11 setMinimumBackgroundFetchInterval:v5 forApp:v7];
  }
}

- (BOOL)_isCurrentConnectionAuthorizedForApplicationBundleIdentifier:(id)a3 description:(id)a4
{
  return [(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:a3 description:a4 legacyEntitlement:0];
}

- (UISApplicationStateService)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.uikit.applicationstateservice.server", 0);
  id v4 = [MEMORY[0x1E4F62AC8] queueWithDispatchQueue:v3];
  id v5 = [(UISApplicationStateService *)self initWithCalloutQueue:v4];

  return v5;
}

- (UISApplicationStateService)initWithCalloutQueue:(id)a3
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UISApplicationStateService;
  double v7 = [(UISApplicationStateService *)&v20 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_calloutQueue, a3);
    id v9 = (void *)MEMORY[0x1E4F628A0];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __51__UISApplicationStateService_initWithCalloutQueue___block_invoke;
    v17 = &unk_1E57352C0;
    SEL v19 = a2;
    id v10 = v8;
    v18 = v10;
    uint64_t v11 = [v9 listenerWithConfigurator:&v14];
    id v12 = v10[1];
    v10[1] = (id)v11;

    objc_msgSend(v10[1], "activate", v14, v15, v16, v17);
  }

  return v8;
}

void __51__UISApplicationStateService_initWithCalloutQueue___block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = (void *)MEMORY[0x1E4F628B8];
  id v4 = a2;
  id v9 = [v3 bootstrapConfiguration];
  id v5 = [v9 domainsContainingServiceIdentifier:0x1EE28C170];
  if ([v5 count] != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"UISApplicationStateService.m", 69, @"must have one and only one domain specify %@ : domains=%@", 0x1EE28C170, v5 object file lineNumber description];
  }
  id v6 = [v5 anyObject];
  double v7 = [v6 identifier];
  [v4 setDomain:v7];

  [v4 setService:0x1EE28C170];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

uint64_t __72__UISApplicationStateService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 activate];
}

- (void)nextWakeIntervalSinceReferenceDateWithCompletion:(id)a3
{
  v13 = (void (**)(id, void *, void))a3;
  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UISApplicationStateService.m", 130, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v5 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v5 description:@"get next wake interval"])
  {
    id v6 = [(UISApplicationStateService *)self _dataSourceForApplicationBundleIdentifier:v5];
    double v7 = -1.0;
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v8 = [v6 nextWakeDate];
      id v9 = v8;
      if (v8)
      {
        [v8 timeIntervalSinceReferenceDate];
        double v7 = v10;
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v7];
    v13[2](v13, v11, 0);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EE28C190 code:0 userInfo:0];
    ((void (**)(id, void *, void *))v13)[2](v13, &unk_1EE295568, v6);
  }
}

- (void)setNextWakeIntervalSinceReferenceDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v5 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v5 description:@"set next wake interval"])
  {
    [v4 doubleValue];
    uint64_t v7 = v6;
    int v8 = BSFloatEqualToFloat();
    char v9 = v8;
    if (v8 && (BSSelfTaskHasEntitlement() & 1) == 0)
    {
      double v10 = _UISStateServiceLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2112;
        __int16 v21 = @"aps-connection-initiate";
        id v13 = v19;
        _os_log_error_impl(&dword_191ABF000, v10, OS_LOG_TYPE_ERROR, "%{public}@: The entitlement %@ is required to use the push keepalive interval", buf, 0x16u);
      }
    }
    uint64_t v11 = [(UISApplicationStateService *)self _dataSourceForApplicationBundleIdentifier:v5];
    if (objc_opt_respondsToSelector())
    {
      id v12 = dispatch_get_global_queue(21, 0);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke;
      v14[3] = &unk_1E5735310;
      uint64_t v16 = v7;
      char v17 = v9;
      v14[4] = self;
      id v15 = v11;
      dispatch_async(v12, v14);
    }
  }
}

void __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke(uint64_t a1)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v2 = (void *)_MergedGlobals_7;
  uint64_t v27 = _MergedGlobals_7;
  if (!_MergedGlobals_7)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __getAPSConnectionClass_block_invoke;
    uint64_t v22 = &unk_1E5735260;
    __int16 v23 = &v24;
    __getAPSConnectionClass_block_invoke((uint64_t)&v19);
    v2 = (void *)v25[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v24, 8);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  id v4 = (void *)qword_1EB288848;
  uint64_t v27 = qword_1EB288848;
  if (!qword_1EB288848)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __getAPSEnvironmentProductionSymbolLoc_block_invoke;
    uint64_t v22 = &unk_1E5735260;
    __int16 v23 = &v24;
    id v5 = ApplePushServiceLibrary();
    uint64_t v6 = dlsym(v5, "APSEnvironmentProduction");
    *(void *)(v23[1] + 24) = v6;
    qword_1EB288848 = *(void *)(v23[1] + 24);
    id v4 = (void *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v4)
  {
    [v3 keepAliveIntervalForEnvironmentName:*v4];
    if (*(double *)(a1 + 48) == -1.0)
    {
      uint64_t v11 = 0;
    }
    else
    {
      if (v7 <= 0.0) {
        double v8 = 1740.0;
      }
      else {
        double v8 = v7;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v10 = v8 + v9;
      if (!*(unsigned char *)(a1 + 56) && *(double *)(a1 + 48) < v10) {
        double v10 = *(double *)(a1 + 48);
      }
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v10];
    }
    id v12 = *(void **)(*(void *)(a1 + 32) + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke_2;
    v16[3] = &unk_1E57351C0;
    id v17 = *(id *)(a1 + 40);
    id v18 = v11;
    id v13 = v11;
    [v12 performAsync:v16];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"NSString *getAPSEnvironmentProduction(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"UISApplicationStateService.m", 26, @"%s", dlerror());

    __break(1u);
  }
}

uint64_t __68__UISApplicationStateService_setNextWakeIntervalSinceReferenceDate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNextWakeDate:*(void *)(a1 + 40)];
}

- (void)usesBackgroundNetworkWithCompletion:(id)a3
{
  double v10 = (void (**)(id, void *, void))a3;
  if (!v10)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UISApplicationStateService.m", 225, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v5 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v5 description:@"get uses background network"])
  {
    uint64_t v6 = [(UISApplicationStateService *)self _dataSourceForApplicationBundleIdentifier:v5];
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v7 = [v6 usesBackgroundNetwork];
    }
    else {
      uint64_t v7 = 0;
    }
    double v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
    v10[2](v10, v8, 0);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EE28C190 code:0 userInfo:0];
    ((void (**)(id, void *, void *))v10)[2](v10, (void *)MEMORY[0x1E4F1CC28], v6);
  }
}

- (void)setUsesBackgroundNetwork:(id)a3
{
  id v7 = a3;
  [(FBSSerialQueue *)self->_calloutQueue assertOnQueue];
  id v4 = [(UISApplicationStateService *)self _operatingBundleIdentifier];
  if ([(UISApplicationStateService *)self _isCurrentConnectionAuthorizedForApplicationBundleIdentifier:v4 description:@"set uses background network"])
  {
    uint64_t v5 = [v7 BOOLValue];
    uint64_t v6 = [(UISApplicationStateService *)self _dataSourceForApplicationBundleIdentifier:v4];
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 setUsesBackgroundNetwork:v5];
    }
  }
}

- (UISApplicationStateServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UISApplicationStateServiceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end