@interface MOConfiguration
+ (id)sharedInstance;
- (BOOL)isAllowedToPromptEventCategory:(unint64_t)a3;
- (BOOL)isAllowedToPromptResourceType:(unint64_t)a3;
- (MOConfiguration)init;
- (void)dealloc;
- (void)onEventStreamsUpdated;
- (void)reset;
@end

@implementation MOConfiguration

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MOConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_shared_0;
  return v2;
}

uint64_t __33__MOConfiguration_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (MOConfiguration)init
{
  v35.receiver = self;
  v35.super_class = (Class)MOConfiguration;
  v2 = [(MOConfiguration *)&v35 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedEventStreamPermissions = v2->cachedEventStreamPermissions;
    v2->cachedEventStreamPermissions = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    cachedResourceStreamPermissions = v2->cachedResourceStreamPermissions;
    v2->cachedResourceStreamPermissions = (NSMutableDictionary *)v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)onEventStreamsUpdated_bounce, @"com.apple.momentsd.event-streams-updated", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2940EC8];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    [v8 setClasses:v11 forSelector:sel_isAllowedToPromptEventCategory_withReply_ argumentIndex:0 ofReply:0];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    [v8 setClasses:v16 forSelector:sel_isAllowedToPromptEventCategory_withReply_ argumentIndex:0 ofReply:1];

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    [v8 setClasses:v19 forSelector:sel_isAllowedToPromptResourceType_withReply_ argumentIndex:0 ofReply:0];

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    [v8 setClasses:v24 forSelector:sel_isAllowedToPromptResourceType_withReply_ argumentIndex:0 ofReply:1];

    v25 = [[MOConnection alloc] initWithName:@"MOConfiguration"];
    connectionProxy = v2->connectionProxy;
    v2->connectionProxy = v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.momentsd" options:0];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v27;

    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v8];
    v29 = [(MOConnection *)v2->connectionProxy onConnectionInterrupted];
    [(NSXPCConnection *)v2->connection setInterruptionHandler:v29];

    [(NSXPCConnection *)v2->connection setInvalidationHandler:&__block_literal_global_5];
    uint64_t v30 = [(NSXPCConnection *)v2->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_116];
    syncProxy = v2->syncProxy;
    v2->syncProxy = (MOConfigurationXPCProtocol *)v30;

    [(NSXPCConnection *)v2->connection resume];
  }
  v32 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v32, OS_LOG_TYPE_DEFAULT, "initiate client", buf, 2u);
  }

  return v2;
}

void __23__MOConfiguration_init__block_invoke()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEFAULT, "Invalidated", v1, 2u);
  }
}

void __23__MOConfiguration_init__block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 localizedDescription];
    uint64_t v5 = [v2 localizedFailureReason];
    int v6 = 138412802;
    v7 = @"Error on remote object proxy";
    __int16 v8 = 2112;
    v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D24AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MOConfiguration;
  [(MOConfiguration *)&v3 dealloc];
}

- (void)onEventStreamsUpdated
{
  objc_super v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D24AE000, v3, OS_LOG_TYPE_INFO, "onEventStreamsUpdated", v4, 2u);
  }

  [(MOConfiguration *)self reset];
}

- (void)reset
{
  objc_super v3 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl(&dword_1D24AE000, v3, OS_LOG_TYPE_INFO, "clearing cache", v8, 2u);
  }

  v4 = (NSMutableDictionary *)objc_opt_new();
  cachedEventStreamPermissions = self->cachedEventStreamPermissions;
  self->cachedEventStreamPermissions = v4;

  int v6 = (NSMutableDictionary *)objc_opt_new();
  cachedResourceStreamPermissions = self->cachedResourceStreamPermissions;
  self->cachedResourceStreamPermissions = v6;
}

- (BOOL)isAllowedToPromptEventCategory:(unint64_t)a3
{
  if (self->syncProxy)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    int v6 = [v5 stringValue];

    v7 = [(NSMutableDictionary *)self->cachedEventStreamPermissions objectForKey:v6];
    __int16 v8 = v7;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    if (v7)
    {
      char v9 = [v7 BOOLValue];
      *((unsigned char *)v16 + 24) = v9;
    }
    else
    {
      connectionProxy = self->connectionProxy;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke;
      v14[3] = &unk_1E691FCE8;
      v14[5] = &v15;
      v14[6] = a3;
      v14[4] = self;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_124;
      v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v13[4] = a3;
      [(MOConnection *)connectionProxy callBlock:v14 onInterruption:v13];
      v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v16 + 24)];
      [(NSMutableDictionary *)self->cachedEventStreamPermissions setObject:v11 forKeyedSubscript:v6];

      char v9 = *((unsigned char *)v16 + 24) != 0;
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    int v6 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOConfiguration isAllowedToPromptEventCategory:](v6);
    }
    char v9 = 0;
  }

  return v9;
}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1[4] + 16);
  uint64_t v5 = a1[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_2;
  v7[3] = &unk_1E691FCC0;
  uint64_t v9 = a1[5];
  uint64_t v10 = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 isAllowedToPromptEventCategory:v5 withReply:v7];
}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = [NSNumber numberWithUnsignedInteger:a1[6]];
    id v8 = [NSNumber numberWithBool:a2];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1D24AE000, v6, OS_LOG_TYPE_DEBUG, "isAllowedToPrompt event category: %@ %@, %@", (uint8_t *)&v9, 0x20u);
  }
  if (!v5) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_124_cold_1(a1);
  }
}

- (BOOL)isAllowedToPromptResourceType:(unint64_t)a3
{
  if (self->syncProxy)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = [v5 stringValue];

    v7 = [(NSMutableDictionary *)self->cachedResourceStreamPermissions objectForKey:v6];
    id v8 = v7;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    if (v7)
    {
      char v9 = [v7 BOOLValue];
      *((unsigned char *)v16 + 24) = v9;
    }
    else
    {
      connectionProxy = self->connectionProxy;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke;
      v14[3] = &unk_1E691FCE8;
      v14[5] = &v15;
      v14[6] = a3;
      v14[4] = self;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_126;
      v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v13[4] = a3;
      [(MOConnection *)connectionProxy callBlock:v14 onInterruption:v13];
      __int16 v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v16 + 24)];
      [(NSMutableDictionary *)self->cachedResourceStreamPermissions setObject:v11 forKeyedSubscript:v6];

      char v9 = *((unsigned char *)v16 + 24) != 0;
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v6 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOConfiguration isAllowedToPromptEventCategory:](v6);
    }
    char v9 = 0;
  }

  return v9;
}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1[4] + 16);
  uint64_t v5 = a1[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_2;
  v7[3] = &unk_1E691FCC0;
  uint64_t v9 = a1[5];
  uint64_t v10 = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 isAllowedToPromptResourceType:v5 withReply:v7];
}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = [NSNumber numberWithUnsignedInteger:a1[6]];
    id v8 = [NSNumber numberWithBool:a2];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1D24AE000, v6, OS_LOG_TYPE_DEBUG, "isAllowedToPrompt resource type: %@ %@, %@", (uint8_t *)&v9, 0x20u);
  }
  if (!v5) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _mo_log_facility_get_os_log(MOLogFacilityPermissions);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_126_cold_1(a1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedResourceStreamPermissions, 0);
  objc_storeStrong((id *)&self->cachedEventStreamPermissions, 0);
  objc_storeStrong((id *)&self->connectionProxy, 0);
  objc_storeStrong((id *)&self->syncProxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

- (void)isAllowedToPromptEventCategory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid remote syncProxy", v1, 2u);
}

void __50__MOConfiguration_isAllowedToPromptEventCategory___block_invoke_124_cold_1(uint64_t a1)
{
  v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1D24AE000, v2, v3, "isAllowedToPrompt event category: %@, %@", v4, v5, v6, v7, v8);
}

void __49__MOConfiguration_isAllowedToPromptResourceType___block_invoke_126_cold_1(uint64_t a1)
{
  v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1D24AE000, v2, v3, "isAllowedToPrompt resource type: %@, %@", v4, v5, v6, v7, v8);
}

@end