@interface USDeviceActivityMonitorExtensionProxy
- (NSArray)extensions;
- (OS_dispatch_queue_global)timeoutQueue;
- (USDeviceActivityMonitorExtensionProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4;
- (USDeviceActivityMonitorExtensionProxy)initWithClientIdentifier:(id)a3 error:(id *)a4;
- (USDeviceActivityMonitorExtensionProxy)initWithExtensionsMatchingAttributes:(id)a3 error:(id *)a4;
- (id)_scheduleTimerWithIntervalInSeconds:(unint64_t)a3 leewayInSeconds:(unint64_t)a4 extensionPID:(int)a5 handler:(id)a6;
- (id)_scheduleTimerWithIntervalInSeconds:(unint64_t)a3 leewayInSeconds:(unint64_t)a4 handler:(id)a5;
- (unint64_t)timeoutInSeconds;
- (unint64_t)timeoutLeewayInSeconds;
- (void)_cancelTimer:(id)a3;
- (void)_requestExtensionVendorProxyForExtension:(id)a3 proxyHandler:(id)a4;
- (void)eventDidReachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5;
- (void)eventDidUnreachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5;
- (void)eventWillReachThresholdWarning:(id)a3 activity:(id)a4 replyHandler:(id)a5;
- (void)intervalDidEndForActivity:(id)a3 replyHandler:(id)a4;
- (void)intervalDidStartForActivity:(id)a3 replyHandler:(id)a4;
- (void)intervalWillEndWarningForActivity:(id)a3 replyHandler:(id)a4;
- (void)intervalWillStartWarningForActivity:(id)a3 replyHandler:(id)a4;
- (void)setTimeoutInSeconds:(unint64_t)a3;
- (void)setTimeoutLeewayInSeconds:(unint64_t)a3;
@end

@implementation USDeviceActivityMonitorExtensionProxy

- (USDeviceActivityMonitorExtensionProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F07FE0];
  v12[0] = *MEMORY[0x263F07FF8];
  v12[1] = v6;
  v13[0] = @"com.apple.deviceactivity.monitor-extension";
  v13[1] = a3;
  v7 = NSDictionary;
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = [(USDeviceActivityMonitorExtensionProxy *)self initWithExtensionsMatchingAttributes:v9 error:a4];
  return v10;
}

- (USDeviceActivityMonitorExtensionProxy)initWithClientIdentifier:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = 0;
  v7 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:v6 error:&v24];
  id v8 = v24;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[USDeviceActivityMonitorExtensionProxy initWithClientIdentifier:error:]((uint64_t)v6, (uint64_t)v8);
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      v15 = +[USUsageTrackingBundle usageTrackingBundle];
      v16 = [v15 localizedStringForKey:@"ExtensionMatchingError" value:&stru_26C98B540 table:0];

      id v17 = [NSString alloc];
      v18 = [MEMORY[0x263EFF960] currentLocale];
      v19 = objc_msgSend(v17, "initWithFormat:locale:", v16, v18, 0);

      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      v28[0] = v19;
      v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v22 = [v20 errorWithDomain:@"UsageTrackingErrorDomain" code:200 userInfo:v21];

      v14 = 0;
      *a4 = v22;
      goto LABEL_8;
    }
    v14 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = *MEMORY[0x263F07FF8];
  v26[0] = @"com.apple.deviceactivity.monitor-extension";
  uint64_t v10 = *MEMORY[0x263F07FB0];
  v25[0] = v9;
  v25[1] = v10;
  v11 = [v7 URL];
  v12 = [v11 path];
  v26[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  self = [(USDeviceActivityMonitorExtensionProxy *)self initWithExtensionsMatchingAttributes:v13 error:a4];
  v14 = self;
LABEL_8:

  return v14;
}

- (USDeviceActivityMonitorExtensionProxy)initWithExtensionsMatchingAttributes:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F08800] extensionsWithMatchingAttributes:v6 error:a4];
  if ([v7 count])
  {
    v22.receiver = self;
    v22.super_class = (Class)USDeviceActivityMonitorExtensionProxy;
    id v8 = [(USDeviceActivityMonitorExtensionProxy *)&v22 init];
    objc_storeStrong((id *)v8 + 3, v7);
    *(_OWORD *)(v8 + 8) = xmmword_21839E570;
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = dispatch_get_global_queue(v9, 0);
    v11 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v10;
  }
  else
  {

    id v8 = 0;
    if (a4 && v7)
    {
      id v12 = v6;
      v13 = +[USUsageTrackingBundle usageTrackingBundle];
      v14 = [v13 localizedStringForKey:@"ExtensionMatchingError" value:&stru_26C98B540 table:0];

      id v15 = [NSString alloc];
      v16 = [MEMORY[0x263EFF960] currentLocale];
      id v17 = objc_msgSend(v15, "initWithFormat:locale:", v14, v16, v12);

      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      v24[0] = v17;
      v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      v20 = [v18 errorWithDomain:@"UsageTrackingErrorDomain" code:200 userInfo:v19];

      id v8 = 0;
      *a4 = v20;
    }
  }

  return (USDeviceActivityMonitorExtensionProxy *)v8;
}

- (void)intervalDidStartForActivity:(id)a3 replyHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __82__USDeviceActivityMonitorExtensionProxy_intervalDidStartForActivity_replyHandler___block_invoke;
        v14[3] = &unk_26431DBA8;
        id v15 = v6;
        id v16 = v7;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v12 proxyHandler:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __82__USDeviceActivityMonitorExtensionProxy_intervalDidStartForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 intervalDidStartForActivity:*(void *)(a1 + 32) replyHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)intervalDidEndForActivity:(id)a3 replyHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __80__USDeviceActivityMonitorExtensionProxy_intervalDidEndForActivity_replyHandler___block_invoke;
        v14[3] = &unk_26431DBA8;
        id v15 = v6;
        id v16 = v7;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v12 proxyHandler:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __80__USDeviceActivityMonitorExtensionProxy_intervalDidEndForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 intervalDidEndForActivity:*(void *)(a1 + 32) replyHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)eventDidReachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __86__USDeviceActivityMonitorExtensionProxy_eventDidReachThreshold_activity_replyHandler___block_invoke;
        v17[3] = &unk_26431DBD0;
        id v18 = v8;
        id v19 = v9;
        id v20 = v10;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v15 proxyHandler:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

uint64_t __86__USDeviceActivityMonitorExtensionProxy_eventDidReachThreshold_activity_replyHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 eventDidReachThreshold:a1[4] activity:a1[5] replyHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)eventDidUnreachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __88__USDeviceActivityMonitorExtensionProxy_eventDidUnreachThreshold_activity_replyHandler___block_invoke;
        v17[3] = &unk_26431DBD0;
        id v18 = v8;
        id v19 = v9;
        id v20 = v10;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v15 proxyHandler:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

uint64_t __88__USDeviceActivityMonitorExtensionProxy_eventDidUnreachThreshold_activity_replyHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 eventDidUnreachThreshold:a1[4] activity:a1[5] replyHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)intervalWillStartWarningForActivity:(id)a3 replyHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __90__USDeviceActivityMonitorExtensionProxy_intervalWillStartWarningForActivity_replyHandler___block_invoke;
        v14[3] = &unk_26431DBA8;
        id v15 = v6;
        id v16 = v7;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v12 proxyHandler:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __90__USDeviceActivityMonitorExtensionProxy_intervalWillStartWarningForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 intervalWillStartWarningForActivity:*(void *)(a1 + 32) replyHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)intervalWillEndWarningForActivity:(id)a3 replyHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __88__USDeviceActivityMonitorExtensionProxy_intervalWillEndWarningForActivity_replyHandler___block_invoke;
        v14[3] = &unk_26431DBA8;
        id v15 = v6;
        id v16 = v7;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v12 proxyHandler:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __88__USDeviceActivityMonitorExtensionProxy_intervalWillEndWarningForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 intervalWillEndWarningForActivity:*(void *)(a1 + 32) replyHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)eventWillReachThresholdWarning:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(USDeviceActivityMonitorExtensionProxy *)self extensions];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __94__USDeviceActivityMonitorExtensionProxy_eventWillReachThresholdWarning_activity_replyHandler___block_invoke;
        v17[3] = &unk_26431DBD0;
        id v18 = v8;
        id v19 = v9;
        id v20 = v10;
        [(USDeviceActivityMonitorExtensionProxy *)self _requestExtensionVendorProxyForExtension:v15 proxyHandler:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

uint64_t __94__USDeviceActivityMonitorExtensionProxy_eventWillReachThresholdWarning_activity_replyHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 eventWillReachThresholdWarning:a1[4] activity:a1[5] replyHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)_requestExtensionVendorProxyForExtension:(id)a3 proxyHandler:(id)a4
{
  v45[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = [MEMORY[0x263EFF910] now];
  unint64_t v9 = [(USDeviceActivityMonitorExtensionProxy *)self timeoutInSeconds];
  unint64_t v10 = [(USDeviceActivityMonitorExtensionProxy *)self timeoutLeewayInSeconds];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke;
  v42[3] = &unk_26431DB50;
  id v11 = v6;
  id v43 = v11;
  uint64_t v12 = [(USDeviceActivityMonitorExtensionProxy *)self _scheduleTimerWithIntervalInSeconds:v9 leewayInSeconds:v10 handler:v42];
  id v41 = 0;
  uint64_t v13 = [v11 beginExtensionRequestWithOptions:0 inputItems:0 error:&v41];
  id v14 = v41;
  [(USDeviceActivityMonitorExtensionProxy *)self _cancelTimer:v12];
  if (v13)
  {
    id v36 = v14;
    unint64_t v15 = [(USDeviceActivityMonitorExtensionProxy *)self timeoutInSeconds];
    id v16 = [MEMORY[0x263EFF910] now];
    v37 = v8;
    [v16 timeIntervalSinceDate:v8];
    unint64_t v18 = v15 - (unint64_t)v17;

    uint64_t v19 = [v11 pidForRequestIdentifier:v13];
    unint64_t v20 = [(USDeviceActivityMonitorExtensionProxy *)self timeoutLeewayInSeconds];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_9;
    v38[3] = &unk_26431DBF8;
    id v21 = v11;
    id v39 = v21;
    id v22 = v13;
    id v40 = v22;
    long long v23 = [(USDeviceActivityMonitorExtensionProxy *)self _scheduleTimerWithIntervalInSeconds:v18 leewayInSeconds:v20 extensionPID:v19 handler:v38];

    long long v24 = [v21 _extensionContextForUUID:v22];
    v25 = [v24 _auxiliaryConnection];
    if (v25)
    {
      +[USXPCRemoteObjectProxy synchronousProxyFromConnection:v25 withRetryCount:1 proxyHandler:v7];
    }
    else
    {
      uint64_t v26 = +[USUsageTrackingBundle usageTrackingBundle];
      v34 = [v26 localizedStringForKey:@"ExtensionConnectionError" value:&stru_26C98B540 table:0];
      v35 = v7;

      id v27 = [NSString alloc];
      v28 = [MEMORY[0x263EFF960] currentLocale];
      v29 = [v21 identifier];
      v30 = objc_msgSend(v27, "initWithFormat:locale:", v34, v28, v29);

      v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45[0] = v30;
      v32 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v33 = [v31 errorWithDomain:@"UsageTrackingErrorDomain" code:201 userInfo:v32];
      v35[2](v35, 0, v33);

      id v7 = v35;
    }
    [(USDeviceActivityMonitorExtensionProxy *)self _cancelTimer:v23];

    id v14 = v36;
    id v8 = v37;
  }
  else
  {
    v7[2](v7, 0, v14);
    long long v23 = v12;
  }
}

uint64_t __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_cold_1(a1);
  }
  return [*(id *)(a1 + 32) _kill:9];
}

void __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_9(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_9_cold_1(a1);
  }
  [*(id *)(a1 + 32) cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x263F087C8] defaultCenter];
  [v2 postNotificationName:@"DidCancelDeviceActivityMonitorExtensionRequest" object:0];
}

- (id)_scheduleTimerWithIntervalInSeconds:(unint64_t)a3 leewayInSeconds:(unint64_t)a4 extensionPID:(int)a5 handler:(id)a6
{
  id v9 = a6;
  if (BSPIDIsBeingDebugged())
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = [(USDeviceActivityMonitorExtensionProxy *)self _scheduleTimerWithIntervalInSeconds:a3 leewayInSeconds:a4 handler:v9];
  }

  return v10;
}

- (id)_scheduleTimerWithIntervalInSeconds:(unint64_t)a3 leewayInSeconds:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = [(USDeviceActivityMonitorExtensionProxy *)self timeoutQueue];
  unint64_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v9);

  dispatch_time_t v11 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * a4);
  dispatch_source_set_event_handler(v10, v8);

  dispatch_resume(v10);
  return v10;
}

- (void)_cancelTimer:(id)a3
{
  if (a3) {
    dispatch_source_cancel((dispatch_source_t)a3);
  }
}

- (unint64_t)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(unint64_t)a3
{
  self->_timeoutInSeconds = a3;
}

- (unint64_t)timeoutLeewayInSeconds
{
  return self->_timeoutLeewayInSeconds;
}

- (void)setTimeoutLeewayInSeconds:(unint64_t)a3
{
  self->_timeoutLeewayInSeconds = a3;
}

- (NSArray)extensions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue_global)timeoutQueue
{
  return (OS_dispatch_queue_global *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

- (void)initWithClientIdentifier:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to get bundle for client %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) identifier];
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Killing %{public}@ because it took too long to start.", (uint8_t *)&v2, 0xCu);
}

void __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_9_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) identifier];
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Canceling request to %{public}@ because it exceeded its allowed time.", (uint8_t *)&v2, 0xCu);
}

@end