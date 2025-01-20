@interface NFRemoteAdminManager
+ (id)sharedRemoteAdminManager;
- (BOOL)cancelCardIngestion;
- (BOOL)queueServerConnection:(id)a3;
- (BOOL)queueServerConnectionForApplets:(id)a3;
- (BOOL)setRegistrationInfo:(id)a3 primaryRegionTopic:(id)a4;
- (NFRemoteAdminManager)init;
- (id)deleteAllAppletsAndCleanupWithTSM;
- (id)deleteAllSPAppletsAndCleanupWithTSM;
- (id)deleteAllWalletAppletsAndCleanupWithTSM;
- (id)getAPNPublicToken;
- (id)nextRequestForServer:(id)a3;
- (id)primaryRegionTopic;
- (id)registrationInfo;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectIfNeeded;
- (void)appletStateChange:(id)a3;
- (void)appletsDeleted:(id)a3;
- (void)connectToServer:(id)a3 callback:(id)a4;
- (void)connectToServer:(id)a3 initialClientRequestInfo:(id)a4 callback:(id)a5;
- (void)didInterruptXPCConnection:(id)a3;
- (void)didInvalidateXPCConnection:(id)a3;
- (void)getSELDInfoForBroker:(id)a3;
- (void)ingestCard:(id)a3 withCompletionHandler:(id)a4;
- (void)readerModeCardIngestionStatus:(unint64_t)a3;
- (void)readerModeCardSessionToken:(id)a3;
- (void)registerEventListener:(id)a3;
- (void)unregisterEventListener:(id)a3;
@end

@implementation NFRemoteAdminManager

+ (id)sharedRemoteAdminManager
{
  if (qword_1EB4D2060 != -1) {
    dispatch_once(&qword_1EB4D2060, &__block_literal_global_9);
  }
  [(id)_MergedGlobals_21 _connectIfNeeded];
  v2 = (void *)_MergedGlobals_21;
  return v2;
}

uint64_t __48__NFRemoteAdminManager_sharedRemoteAdminManager__block_invoke()
{
  v0 = objc_alloc_init(NFRemoteAdminManager);
  uint64_t v1 = _MergedGlobals_21;
  _MergedGlobals_21 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (NFRemoteAdminManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NFRemoteAdminManager;
  v2 = [(NFRemoteAdminManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nearfield.seld.xpc", v6);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)_connectIfNeeded
{
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_connection) {
    goto LABEL_9;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.seld.tsmmanager" options:4096];
  connection = v3->_connection;
  v3->_connection = (NSXPCConnection *)v4;

  v6 = +[NFRemoteAdminManagerInterface interface];
  [(NSXPCConnection *)v3->_connection setRemoteObjectInterface:v6];

  dispatch_queue_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF400F8];
  [(NSXPCConnection *)v3->_connection setExportedInterface:v7];

  [(NSXPCConnection *)v3->_connection setExportedObject:v3];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__18;
  v16[4] = __Block_byref_object_dispose__18;
  v17 = v3->_connection;
  objc_initWeak(&location, v3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__NFRemoteAdminManager__connectIfNeeded__block_invoke;
  v13[3] = &unk_1E595E980;
  objc_copyWeak(&v14, &location);
  v13[4] = v16;
  [(NSXPCConnection *)v3->_connection setInvalidationHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NFRemoteAdminManager__connectIfNeeded__block_invoke_2;
  v11[3] = &unk_1E595E980;
  objc_copyWeak(&v12, &location);
  v11[4] = v16;
  [(NSXPCConnection *)v3->_connection setInterruptionHandler:v11];
  [(NSXPCConnection *)v3->_connection _setQueue:v3->_xpcQueue];
  [(NSXPCConnection *)v3->_connection resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);

  if (v3->_connection)
  {
LABEL_9:
    if (!v3->_hasEventListener && [(NSMutableSet *)v3->_eventListeners count])
    {
      v3->_hasEventListener = 1;
      v8 = v3->_connection;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__NFRemoteAdminManager__connectIfNeeded__block_invoke_3;
      v10[3] = &unk_1E595C648;
      v10[4] = v3;
      v10[5] = a2;
      v9 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v10];
      [v9 registerForCallbacks:v3];
    }
  }
  objc_sync_exit(v3);
}

void __40__NFRemoteAdminManager__connectIfNeeded__block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_19D636000, "NFRemoteAdminManager xpcInvalidated", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didInvalidateXPCConnection:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __40__NFRemoteAdminManager__connectIfNeeded__block_invoke_2(uint64_t a1)
{
  v2 = _os_activity_create(&dword_19D636000, "NFRemoteAdminManager xpcInterrupted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didInterruptXPCConnection:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __40__NFRemoteAdminManager__connectIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Failed to re-register with seld: %{public}@", v9, ClassName, Name, 86, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 86;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to re-register with seld: %{public}@", buf, 0x2Cu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
}

- (void)didInvalidateXPCConnection:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(5, "%c[%{public}s %{public}s]:%i Connection invalidated: %{public}@", v11, ClassName, Name, 96, v5);
  }
  dispatch_get_specific(*v6);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v31 = v14;
    __int16 v32 = 2082;
    v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 96;
    __int16 v38 = 2114;
    id v39 = v5;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connection invalidated: %{public}@", buf, 0x2Cu);
  }

  v15 = self;
  objc_sync_enter(v15);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v16 = v15->_eventListeners;
  uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        __int16 v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v21 didReceiveFatalCommunicationError];
        }
      }
      uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  connection = v15->_connection;
  v15->_connection = 0;

  v15->_hasEventListener = 0;
  objc_sync_exit(v15);
}

- (void)didInterruptXPCConnection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(5, "%c[%{public}s %{public}s]:%i Connection interrupted: %{public}@", v11, ClassName, Name, 112, v5);
  }
  dispatch_get_specific(*v6);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v18 = v14;
    __int16 v19 = 2082;
    v20 = object_getClassName(self);
    __int16 v21 = 2082;
    v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 112;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connection interrupted: %{public}@", buf, 0x2Cu);
  }

  self->_hasEventListener = 0;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NFRemoteAdminManager *)v5 _connectIfNeeded];
  connection = v5->_connection;
  if (connection)
  {
    dispatch_queue_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"No connection to nfcd";
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v11 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v10];
    v4[2](v4, v11);

    objc_sync_exit(v5);
    dispatch_queue_t v7 = 0;
  }

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NFRemoteAdminManager *)v5 _connectIfNeeded];
  connection = v5->_connection;
  if (connection)
  {
    dispatch_queue_t v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"No connection to nfcd";
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v11 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v10];
    v4[2](v4, v11);

    objc_sync_exit(v5);
    dispatch_queue_t v7 = 0;
  }

  return v7;
}

- (void)registerEventListener:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_19D636000, "registerEventListener:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  dispatch_queue_t v7 = self;
  objc_sync_enter(v7);
  if (!v7->_hasEventListener)
  {
    v7->_hasEventListener = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__NFRemoteAdminManager_registerEventListener___block_invoke;
    v9[3] = &unk_1E595C648;
    v9[4] = v7;
    v9[5] = a2;
    id v8 = [(NFRemoteAdminManager *)v7 remoteObjectProxyWithErrorHandler:v9];
    [v8 registerForCallbacks:v7];
  }
  [(NSMutableSet *)v7->_eventListeners addObject:v5];
  objc_sync_exit(v7);
}

void __46__NFRemoteAdminManager_registerEventListener___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 184, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 184;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
}

- (void)unregisterEventListener:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_19D636000, "unregisterEventListener:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  dispatch_queue_t v7 = self;
  objc_sync_enter(v7);
  [(NSMutableSet *)v7->_eventListeners removeObject:v5];

  if (![(NSMutableSet *)v7->_eventListeners count] && v7->_hasEventListener)
  {
    v7->_hasEventListener = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__NFRemoteAdminManager_unregisterEventListener___block_invoke;
    v9[3] = &unk_1E595C648;
    v9[4] = v7;
    v9[5] = a2;
    id v8 = [(NFRemoteAdminManager *)v7 remoteObjectProxyWithErrorHandler:v9];
    [v8 unregisterForCallbacks:v7];
  }
  objc_sync_exit(v7);
}

void __48__NFRemoteAdminManager_unregisterEventListener___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 202, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 202;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
}

- (BOOL)setRegistrationInfo:(id)a3 primaryRegionTopic:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = _os_activity_create(&dword_19D636000, "setRegistrationInfo:primaryRegionTopic:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__NFRemoteAdminManager_setRegistrationInfo_primaryRegionTopic___block_invoke;
  v13[3] = &unk_1E595C648;
  v13[4] = self;
  void v13[5] = a2;
  objc_super v10 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__NFRemoteAdminManager_setRegistrationInfo_primaryRegionTopic___block_invoke_82;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  [v10 setRegistrationInfo:v8 primaryRegionTopic:v7 completion:v12];

  LOBYTE(v7) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v7;
}

void __63__NFRemoteAdminManager_setRegistrationInfo_primaryRegionTopic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 219, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 219;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __63__NFRemoteAdminManager_setRegistrationInfo_primaryRegionTopic___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 222, v3);
    }
    dispatch_get_specific(*v4);
    objc_super v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      int v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      v20 = v13;
      __int16 v21 = 2082;
      v22 = v14;
      __int16 v23 = 1024;
      int v24 = 222;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)registrationInfo
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "registrationInfo", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__NFRemoteAdminManager_registrationInfo__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__NFRemoteAdminManager_registrationInfo__block_invoke_83;
  v8[3] = &unk_1E595D8E8;
  v8[5] = &state;
  v8[6] = a2;
  v8[4] = self;
  [v5 registrationInfoWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __40__NFRemoteAdminManager_registrationInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 239, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 239;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __40__NFRemoteAdminManager_registrationInfo__block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 242, v6);
    }
    dispatch_get_specific(*v7);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      char v16 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 2082;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = 242;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    if (!v5) {
      id v5 = (id)objc_opt_new();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
}

- (id)primaryRegionTopic
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "primaryRegionTopic", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__NFRemoteAdminManager_primaryRegionTopic__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__NFRemoteAdminManager_primaryRegionTopic__block_invoke_85;
  v8[3] = &unk_1E595E9A8;
  v8[5] = &state;
  v8[6] = a2;
  v8[4] = self;
  [v5 primaryRegionTopicWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __42__NFRemoteAdminManager_primaryRegionTopic__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 261, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 261;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFRemoteAdminManager_primaryRegionTopic__block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 264, v6);
    }
    dispatch_get_specific(*v7);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      char v16 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 2082;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = 264;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    if (!v5) {
      id v5 = (id)objc_opt_new();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
}

- (id)nextRequestForServer:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "nextRequestForServer:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__18;
  int v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__NFRemoteAdminManager_nextRequestForServer___block_invoke;
  v11[3] = &unk_1E595C648;
  v11[4] = self;
  void v11[5] = a2;
  id v7 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__NFRemoteAdminManager_nextRequestForServer___block_invoke_87;
  v10[3] = &unk_1E595D8E8;
  v10[5] = &state;
  void v10[6] = a2;
  v10[4] = self;
  [v7 nextRequestForServer:v5 completion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __45__NFRemoteAdminManager_nextRequestForServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 283, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 283;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __45__NFRemoteAdminManager_nextRequestForServer___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 286, v7);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      id v26 = v18;
      __int16 v27 = 1024;
      int v28 = 286;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)connectToServer:(id)a3 callback:(id)a4
{
}

- (void)connectToServer:(id)a3 initialClientRequestInfo:(id)a4 callback:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = _os_activity_create(&dword_19D636000, "connectToServer:initialClientRequestInfo:callback:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__NFRemoteAdminManager_connectToServer_initialClientRequestInfo_callback___block_invoke;
  v19[3] = &unk_1E595DEC0;
  v19[4] = self;
  SEL v21 = a2;
  id v13 = v9;
  id v20 = v13;
  id v14 = [(NFRemoteAdminManager *)self remoteObjectProxyWithErrorHandler:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__NFRemoteAdminManager_connectToServer_initialClientRequestInfo_callback___block_invoke_88;
  v16[3] = &unk_1E595DEC0;
  id v17 = v13;
  SEL v18 = a2;
  v16[4] = self;
  id v15 = v13;
  [v14 connectToServer:v11 initialClientRequestInfo:v10 completion:v16];
}

void __74__NFRemoteAdminManager_connectToServer_initialClientRequestInfo_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 308, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    id v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 308;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__NFRemoteAdminManager_connectToServer_initialClientRequestInfo_callback___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 312, v3);
    }
    dispatch_get_specific(*v4);
    id v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      id v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v12;
      __int16 v20 = 2082;
      __int16 v21 = v13;
      __int16 v22 = 2082;
      __int16 v23 = v14;
      __int16 v24 = 1024;
      int v25 = 312;
      __int16 v26 = 2114;
      id v27 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v15();
}

- (BOOL)queueServerConnection:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "queueServerConnection:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__NFRemoteAdminManager_queueServerConnection___block_invoke;
  v10[3] = &unk_1E595C648;
  v10[4] = self;
  v10[5] = a2;
  id v7 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__NFRemoteAdminManager_queueServerConnection___block_invoke_89;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  [v7 queueServerConnection:v5 completion:v9];

  LOBYTE(v5) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v5;
}

void __46__NFRemoteAdminManager_queueServerConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 328, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 328;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __46__NFRemoteAdminManager_queueServerConnection___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 331, v3);
    }
    dispatch_get_specific(*v4);
    id v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      char v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = v13;
      __int16 v21 = 2082;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = 331;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)queueServerConnectionForApplets:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "queueServerConnectionForApplets:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__NFRemoteAdminManager_queueServerConnectionForApplets___block_invoke;
  v10[3] = &unk_1E595C648;
  v10[4] = self;
  v10[5] = a2;
  id v7 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__NFRemoteAdminManager_queueServerConnectionForApplets___block_invoke_90;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  [v7 queueServerConnectionForApplets:v5 completion:v9];

  LOBYTE(v5) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v5;
}

void __56__NFRemoteAdminManager_queueServerConnectionForApplets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 348, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 348;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __56__NFRemoteAdminManager_queueServerConnectionForApplets___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 351, v3);
    }
    dispatch_get_specific(*v4);
    id v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      char v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = v13;
      __int16 v21 = 2082;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = 351;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)ingestCard:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _os_activity_create(&dword_19D636000, "ingestCard:withCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v10 = [v7 cardServiceInfo];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    __int16 v34 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v36 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v40 = 45;
      if (isMetaClass) {
        uint64_t v40 = 43;
      }
      v36(3, "%c[%{public}s %{public}s]:%i Missing card info", v40, ClassName, Name, 370);
    }
    dispatch_get_specific(*v34);
    v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      v44 = object_getClassName(self);
      v45 = sel_getName(a2);
      *(_DWORD *)os_activity_scope_state_s state = 67109890;
      *(_DWORD *)&state[4] = v43;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v44;
      __int16 v63 = 2082;
      v64 = v45;
      __int16 v65 = 1024;
      int v66 = 370;
      _os_log_impl(&dword_19D636000, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing card info", state, 0x22u);
    }

    if (v8)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      __int16 v29 = [NSString stringWithUTF8String:"nf.fwk"];
      uint64_t v60 = *MEMORY[0x1E4F28568];
      v61 = @"Missing card info";
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      uint64_t v31 = v46;
      __int16 v32 = v29;
      uint64_t v33 = 0;
      goto LABEL_26;
    }
LABEL_27:
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __57__NFRemoteAdminManager_ingestCard_withCompletionHandler___block_invoke;
    v55[3] = &unk_1E595DEC0;
    v55[4] = self;
    SEL v57 = a2;
    id v48 = v8;
    id v56 = v48;
    v49 = [(NFRemoteAdminManager *)self remoteObjectProxyWithErrorHandler:v55];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __57__NFRemoteAdminManager_ingestCard_withCompletionHandler___block_invoke_100;
    v52[3] = &unk_1E595E9D0;
    v52[4] = self;
    SEL v54 = a2;
    id v53 = v48;
    [v49 ingestCard:v7 completion:v52];

    goto LABEL_28;
  }
  uint64_t v12 = [v7 uri];
  if (v12)
  {
    char v13 = (void *)v12;
    id v14 = [v7 uri];
    uint64_t v15 = [v14 length];

    if (v15) {
      goto LABEL_27;
    }
  }
  int v16 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v17 = NFLogGetLogger();
  if (v17)
  {
    int v18 = (void (*)(uint64_t, const char *, ...))v17;
    __int16 v19 = object_getClass(self);
    BOOL v20 = class_isMetaClass(v19);
    __int16 v21 = object_getClassName(self);
    v50 = sel_getName(a2);
    uint64_t v22 = 45;
    if (v20) {
      uint64_t v22 = 43;
    }
    v18(3, "%c[%{public}s %{public}s]:%i Missing uri", v22, v21, v50, 376);
  }
  dispatch_get_specific(*v16);
  __int16 v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v24 = object_getClass(self);
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    id v26 = object_getClassName(self);
    uint64_t v27 = sel_getName(a2);
    *(_DWORD *)os_activity_scope_state_s state = 67109890;
    *(_DWORD *)&state[4] = v25;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v26;
    __int16 v63 = 2082;
    v64 = v27;
    __int16 v65 = 1024;
    int v66 = 376;
    _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing uri", state, 0x22u);
  }

  if (v8)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    __int16 v29 = [NSString stringWithUTF8String:"seld"];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    v59 = @"Missing uri";
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    uint64_t v31 = v28;
    __int16 v32 = v29;
    uint64_t v33 = 10;
LABEL_26:
    v47 = (void *)[v31 initWithDomain:v32 code:v33 userInfo:v30];
    (*((void (**)(id, void *, uint64_t))v8 + 2))(v8, v47, -1);
  }
LABEL_28:
}

void __57__NFRemoteAdminManager_ingestCard_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 384, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v12;
    __int16 v20 = 2082;
    __int16 v21 = v13;
    __int16 v22 = 2082;
    __int16 v23 = v14;
    __int16 v24 = 1024;
    int v25 = 384;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id, uint64_t))(v15 + 16))(v15, v3, -1);
  }
}

void __57__NFRemoteAdminManager_ingestCard_withCompletionHandler___block_invoke_100(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      char v13 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i %{public}@, spStatusCode=%{public}@", v14, ClassName, Name, 390, v5, v13);
    }
    dispatch_get_specific(*v6);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(*(id *)(a1 + 32));
      int v19 = sel_getName(*(SEL *)(a1 + 48));
      __int16 v20 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 67110402;
      int v23 = v17;
      __int16 v24 = 2082;
      int v25 = v18;
      __int16 v26 = 2082;
      id v27 = v19;
      __int16 v28 = 1024;
      int v29 = 390;
      __int16 v30 = 2114;
      id v31 = v5;
      __int16 v32 = 2114;
      uint64_t v33 = v20;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@, spStatusCode=%{public}@", buf, 0x36u);
    }
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, id, uint64_t))(v21 + 16))(v21, v5, a3);
  }
}

- (BOOL)cancelCardIngestion
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "cancelCardIngestion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NFRemoteAdminManager_cancelCardIngestion__block_invoke;
  v8[3] = &unk_1E595C648;
  v8[4] = self;
  v8[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__NFRemoteAdminManager_cancelCardIngestion__block_invoke_104;
  v7[3] = &unk_1E595CBD0;
  v7[5] = &state;
  v7[6] = a2;
  v7[4] = self;
  [v5 cancelCardIngestionWithCompletion:v7];

  LOBYTE(a2) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)a2;
}

void __43__NFRemoteAdminManager_cancelCardIngestion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 405, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 405;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFRemoteAdminManager_cancelCardIngestion__block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 408, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      char v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      char v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = v13;
      __int16 v21 = 2082;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = 408;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)getAPNPublicToken
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "gertAPNPublicToken", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__18;
  char v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__NFRemoteAdminManager_getAPNPublicToken__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__NFRemoteAdminManager_getAPNPublicToken__block_invoke_105;
  v8[3] = &unk_1E595CB58;
  v8[5] = &state;
  void v8[6] = a2;
  v8[4] = self;
  [v5 getAPNPublicTokenWithCompletion:v8];

  id v6 = objc_msgSend(*(id *)(state.opaque[1] + 40), "NF_asHexString");
  _Block_object_dispose(&state, 8);

  return v6;
}

void __41__NFRemoteAdminManager_getAPNPublicToken__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 425, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 425;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __41__NFRemoteAdminManager_getAPNPublicToken__block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 428, v7);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      int v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      id v26 = v18;
      __int16 v27 = 1024;
      int v28 = 428;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)getSELDInfoForBroker:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "getSELDInfoForBroker:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__NFRemoteAdminManager_getSELDInfoForBroker___block_invoke;
  v13[3] = &unk_1E595DEC0;
  v13[4] = self;
  SEL v15 = a2;
  id v7 = v5;
  id v14 = v7;
  id v8 = [(NFRemoteAdminManager *)self remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__NFRemoteAdminManager_getSELDInfoForBroker___block_invoke_107;
  v10[3] = &unk_1E595E9F8;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v7;
  [v8 getSELDInfoForBrokerWithCompletion:v10];
}

void __45__NFRemoteAdminManager_getSELDInfoForBroker___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 443, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v12;
    __int16 v20 = 2082;
    __int16 v21 = v13;
    __int16 v22 = 2082;
    __int16 v23 = v14;
    __int16 v24 = 1024;
    int v25 = 443;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id, void))(v15 + 16))(v15, v3, 0);
  }
}

void __45__NFRemoteAdminManager_getSELDInfoForBroker___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 449, v6);
    }
    dispatch_get_specific(*v7);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      int v16 = object_getClassName(*(id *)(a1 + 32));
      int v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v22 = v15;
      __int16 v23 = 2082;
      __int16 v24 = v16;
      __int16 v25 = 2082;
      __int16 v26 = v17;
      __int16 v27 = 1024;
      int v28 = 449;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v6, v5);
  }
}

- (id)deleteAllAppletsAndCleanupWithTSM
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "deleteAllAppletsAndCleanupWithTSM", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__NFRemoteAdminManager_deleteAllAppletsAndCleanupWithTSM__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NFRemoteAdminManager_deleteAllAppletsAndCleanupWithTSM__block_invoke_108;
  v8[3] = &unk_1E595CF58;
  v8[4] = &state;
  [v5 deleteAllAppletsAndCleanupWithTSMWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __57__NFRemoteAdminManager_deleteAllAppletsAndCleanupWithTSM__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 464, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 464;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __57__NFRemoteAdminManager_deleteAllAppletsAndCleanupWithTSM__block_invoke_108(uint64_t a1, void *a2)
{
}

- (id)deleteAllWalletAppletsAndCleanupWithTSM
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "deleteAllWalletAppletsAndCleanupWithTSM", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__NFRemoteAdminManager_deleteAllWalletAppletsAndCleanupWithTSM__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__NFRemoteAdminManager_deleteAllWalletAppletsAndCleanupWithTSM__block_invoke_109;
  v8[3] = &unk_1E595CF58;
  v8[4] = &state;
  [v5 deleteAllWalletAppletsAndCleanupWithTSMWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __63__NFRemoteAdminManager_deleteAllWalletAppletsAndCleanupWithTSM__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 479, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 479;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __63__NFRemoteAdminManager_deleteAllWalletAppletsAndCleanupWithTSM__block_invoke_109(uint64_t a1, void *a2)
{
}

- (id)deleteAllSPAppletsAndCleanupWithTSM
{
  os_activity_scope_state_s v4 = _os_activity_create(&dword_19D636000, "deleteAllSPAppletsAndCleanupWithTSM", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__NFRemoteAdminManager_deleteAllSPAppletsAndCleanupWithTSM__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFRemoteAdminManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NFRemoteAdminManager_deleteAllSPAppletsAndCleanupWithTSM__block_invoke_110;
  v8[3] = &unk_1E595CF58;
  v8[4] = &state;
  [v5 deleteAllSPAppletsAndCleanupWithTSMithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __59__NFRemoteAdminManager_deleteAllSPAppletsAndCleanupWithTSM__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_activity_scope_state_s v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 495, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 495;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __59__NFRemoteAdminManager_deleteAllSPAppletsAndCleanupWithTSM__block_invoke_110(uint64_t a1, void *a2)
{
}

- (void)readerModeCardSessionToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5->_eventListeners;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "readerModeCardSessionToken:", v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)readerModeCardIngestionStatus:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4->_eventListeners;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "readerModeCardIngestionStatus:", a3, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v4);
}

- (void)appletStateChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = v5->_eventListeners;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "appletStateChange:", v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)appletsDeleted:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = v5->_eventListeners;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "appletsDeleted:", v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end