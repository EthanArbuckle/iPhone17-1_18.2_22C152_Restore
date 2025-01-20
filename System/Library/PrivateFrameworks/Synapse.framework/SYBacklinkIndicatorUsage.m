@interface SYBacklinkIndicatorUsage
+ (NSXPCListenerEndpoint)_listenerEndpoint;
+ (id)_identifierFromUserActivity:(id)a3;
+ (id)_proxyWithError:(id *)a3;
+ (void)didActivateBacklinkItemWithIdentifier:(id)a3;
+ (void)didActivateBacklinkItemWithUserActivity:(id)a3;
+ (void)didDismissBacklinkItemWithUserActivity:(id)a3;
+ (void)set_listenerEndpoint:(id)a3;
@end

@implementation SYBacklinkIndicatorUsage

+ (NSXPCListenerEndpoint)_listenerEndpoint
{
  return (NSXPCListenerEndpoint *)(id)__listenerEndpoint;
}

+ (void)set_listenerEndpoint:(id)a3
{
}

+ (id)_proxyWithError:(id *)a3
{
  v5 = [a1 _listenerEndpoint];

  id v6 = objc_alloc(MEMORY[0x1E4F29268]);
  v7 = v6;
  if (v5)
  {
    v8 = [a1 _listenerEndpoint];
    v9 = (void *)[v7 initWithListenerEndpoint:v8];
  }
  else
  {
    v9 = (void *)[v6 initWithMachServiceName:@"com.apple.synapse.backlink-indicator-usage" options:0];
  }
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2D818];
  [v9 setRemoteObjectInterface:v10];

  [v9 resume];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke;
  v13[3] = &unk_1E6463A38;
  v13[4] = &v14;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v13];
  if (a3) {
    *a3 = (id) v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

+ (void)didActivateBacklinkItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v5 = [a1 _proxyWithError:&v7];
  uint64_t v6 = v5;
  if (!v7) {
    [v5 didActivateBacklinkItemWithIdentifier:v4];
  }
}

+ (id)_identifierFromUserActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityType];
  if ([v4 isEqualToString:@"com.apple.notes.activity.edit-note"])
  {
    uint64_t v5 = [v3 userInfo];
    uint64_t v6 = [v5 objectForKey:@"uuid"];
    if (v6)
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
      if (v7)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v8 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SYBacklinkIndicatorUsage _identifierFromUserActivity:]((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SYBacklinkIndicatorUsage _identifierFromUserActivity:]((uint64_t)v5, v8, v21, v22, v23, v24, v25, v26);
      }
    }

    uint64_t v7 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SYBacklinkIndicatorUsage _identifierFromUserActivity:]((uint64_t)v4, v5, v15, v16, v17, v18, v19, v20);
  }
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

+ (void)didActivateBacklinkItemWithUserActivity:(id)a3
{
  id v4 = [a1 _identifierFromUserActivity:a3];
  if (v4)
  {
    uint64_t v7 = 0;
    uint64_t v5 = [a1 _proxyWithError:&v7];
    uint64_t v6 = v5;
    if (!v7) {
      [v5 didActivateBacklinkItemWithIdentifier:v4];
    }
  }
}

+ (void)didDismissBacklinkItemWithUserActivity:(id)a3
{
  id v4 = [a1 _identifierFromUserActivity:a3];
  if (v4)
  {
    uint64_t v7 = 0;
    uint64_t v5 = [a1 _proxyWithError:&v7];
    uint64_t v6 = v5;
    if (!v7) {
      [v5 didDismissBacklinkItemWithIdentifier:v4];
    }
  }
}

void __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_identifierFromUserActivity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_identifierFromUserActivity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_identifierFromUserActivity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end