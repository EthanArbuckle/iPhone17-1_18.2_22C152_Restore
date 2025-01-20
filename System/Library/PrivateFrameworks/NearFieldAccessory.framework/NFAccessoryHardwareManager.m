@interface NFAccessoryHardwareManager
+ (id)sharedHardwareManager;
- (BOOL)connect;
- (BOOL)shutdownAndLeaveHWEnabled:(BOOL)a3;
- (BOOL)triggerDelayedWake:(unsigned __int8)a3;
- (NFAccessoryHardwareManager)init;
- (id)clearMultiTagState;
- (id)enableLPCD:(BOOL)a3;
- (id)enableMultiTag:(BOOL)a3;
- (id)getDieId:(id *)a3;
- (id)getInfo;
- (id)getLastDetectedTags:(id *)a3;
- (id)getMultiTagState:(id *)a3;
- (id)getPowerCounters:(id *)a3;
- (id)getRfSettings:(id *)a3;
- (id)pushSignedRF:(id)a3;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)startReaderSession:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)updateHWSupport:(BOOL)a3;
- (unsigned)getHwSupport:(BOOL)a3 error:(id *)a4;
- (void)_cleanupSessions;
- (void)_connectIfNeeded;
- (void)dealloc;
- (void)didInterruptXPCConnection:(id)a3;
- (void)didInvalidateXPCConnection:(id)a3;
- (void)disconnect;
- (void)sessionDidEnd:(id)a3;
@end

@implementation NFAccessoryHardwareManager

+ (id)sharedHardwareManager
{
  if (qword_26AD35280 != -1) {
    dispatch_once(&qword_26AD35280, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_0;
  return v2;
}

uint64_t __51__NFAccessoryHardwareManager_sharedHardwareManager__block_invoke()
{
  _MergedGlobals_0 = objc_alloc_init(NFAccessoryHardwareManager);
  return MEMORY[0x270F9A758]();
}

- (BOOL)connect
{
  [(NFAccessoryHardwareManager *)self _connectIfNeeded];
  v3 = self;
  objc_sync_enter(v3);
  connection = v3->_connection;
  if (connection) {
    ++v3->_refCount;
  }
  BOOL v5 = connection != 0;
  objc_sync_exit(v3);

  return v5;
}

- (void)disconnect
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  unint64_t refCount = obj->_refCount;
  if (refCount)
  {
    unint64_t v4 = refCount - 1;
    obj->_unint64_t refCount = v4;
    if (!v4)
    {
      [(NSXPCConnection *)obj->_connection invalidate];
      connection = obj->_connection;
      obj->_connection = 0;

      v2 = obj;
    }
  }
  objc_sync_exit(v2);
}

- (void)_cleanupSessions
{
  v3 = self->_sessions;
  objc_sync_enter(v3);
  id v4 = (id)[(NSMutableSet *)self->_sessions copy];
  [(NSMutableSet *)self->_sessions removeAllObjects];
  objc_sync_exit(v3);

  [v4 enumerateObjectsUsingBlock:&__block_literal_global_3];
}

uint64_t __46__NFAccessoryHardwareManager__cleanupSessions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndUnexpectedly];
}

- (void)_connectIfNeeded
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v3 = self;
  objc_sync_enter(v3);
  unsigned int hwSupport = v3->_hwSupport;
  if (v3->_connection)
  {
    if (hwSupport == 1)
    {
      id v5 = [(NFAccessoryHardwareManager *)v3 updateHWSupport:1];
      if (v3->_hwSupport != 2)
      {
        v6 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i Hardware is not supported", "-[NFAccessoryHardwareManager _connectIfNeeded]", 169);
        }
        dispatch_get_specific(*v6);
        v8 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v36 = "-[NFAccessoryHardwareManager _connectIfNeeded]";
          __int16 v37 = 1024;
          int v38 = 169;
          _os_log_impl(&dword_21ECDA000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Hardware is not supported", buf, 0x12u);
        }

        [(NSXPCConnection *)v3->_connection invalidate];
      }
    }
  }
  else if (hwSupport != 4)
  {
    v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v10) {
      v10(6, "%s:%i Accessory framwork - connecting XPC", "-[NFAccessoryHardwareManager _connectIfNeeded]", 96);
    }
    dispatch_get_specific(*v9);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "-[NFAccessoryHardwareManager _connectIfNeeded]";
      __int16 v37 = 1024;
      int v38 = 96;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Accessory framwork - connecting XPC", buf, 0x12u);
    }

    dispatch_get_specific(*v9);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(6, "%s:%i Connecting to %s", "-[NFAccessoryHardwareManager _connectIfNeeded]", 102, "com.apple.nfcacd.hwmanager");
    }
    dispatch_get_specific(*v9);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v36 = "-[NFAccessoryHardwareManager _connectIfNeeded]";
      __int16 v37 = 1024;
      int v38 = 102;
      __int16 v39 = 2080;
      v40 = "com.apple.nfcacd.hwmanager";
      _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Connecting to %s", buf, 0x1Cu);
    }

    uint64_t v14 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.nfcacd.hwmanager" options:4096];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v14;

    if (v3->_connection)
    {
      v16 = +[NFHardwareManagerAccessoryInterface interface]();
      [(NSXPCConnection *)v3->_connection setRemoteObjectInterface:v16];

      v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D057C30];
      [(NSXPCConnection *)v3->_connection setExportedInterface:v17];

      [(NSXPCConnection *)v3->_connection setExportedObject:v3];
      objc_initWeak(&location, v3);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke;
      v32[3] = &unk_2644EC8D0;
      objc_copyWeak(&v33, &location);
      [(NSXPCConnection *)v3->_connection setInvalidationHandler:v32];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_2;
      v30[3] = &unk_2644EC8D0;
      objc_copyWeak(&v31, &location);
      [(NSXPCConnection *)v3->_connection setInterruptionHandler:v30];
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INTERACTIVE, -1);

      v20 = dispatch_queue_create("com.apple.NFAccessory.xpc", v19);
      dispatch_queue_set_specific(v20, *v9, (void *)3, 0);
      [(NSXPCConnection *)v3->_connection _setQueue:v20];
      [(NSXPCConnection *)v3->_connection resume];
      id v21 = [(NFAccessoryHardwareManager *)v3 updateHWSupport:1];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_2_60;
      v29[3] = &unk_2644EC8F8;
      v29[4] = v3;
      v29[5] = a2;
      v22 = [(NFAccessoryHardwareManager *)v3 synchronousRemoteObjectProxyWithErrorHandler:v29];
      v23 = [MEMORY[0x263F08AB0] processInfo];
      v24 = [v23 processName];
      [v22 setClientName:v24];

      if (v3->_hwSupport == 4)
      {
        dispatch_get_specific(*v9);
        v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v25) {
          v25(3, "%s:%i Hardware is not supported", "-[NFAccessoryHardwareManager _connectIfNeeded]", 161);
        }
        dispatch_get_specific(*v9);
        v26 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v36 = "-[NFAccessoryHardwareManager _connectIfNeeded]";
          __int16 v37 = 1024;
          int v38 = 161;
          _os_log_impl(&dword_21ECDA000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Hardware is not supported", buf, 0x12u);
        }

        [(NSXPCConnection *)v3->_connection invalidate];
      }

      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    else
    {
      dispatch_get_specific(*v9);
      v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v27) {
        v27(6, "%s:%i failed to connect to daemon", "-[NFAccessoryHardwareManager _connectIfNeeded]", 107);
      }
      dispatch_get_specific(*v9);
      v28 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v36 = "-[NFAccessoryHardwareManager _connectIfNeeded]";
        __int16 v37 = 1024;
        int v38 = 107;
        _os_log_impl(&dword_21ECDA000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s:%i failed to connect to daemon", buf, 0x12u);
      }
    }
  }
  objc_sync_exit(v3);
}

void __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i XPC invalidated", "-[NFAccessoryHardwareManager _connectIfNeeded]_block_invoke", 117);
  }
  dispatch_get_specific(*v2);
  id v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[NFAccessoryHardwareManager _connectIfNeeded]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 117;
    _os_log_impl(&dword_21ECDA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i XPC invalidated", buf, 0x12u);
  }

  id v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_56;
  block[3] = &unk_2644EC8D0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = WeakRetained;
    objc_sync_enter(v2);
    v3 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = 0;

    *((_DWORD *)v2 + 8) = 1;
    objc_sync_exit(v2);

    [v2 _cleanupSessions];
    id WeakRetained = v4;
  }
}

void __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i XPC interrupted", "-[NFAccessoryHardwareManager _connectIfNeeded]_block_invoke_2", 132);
  }
  dispatch_get_specific(*v2);
  id v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[NFAccessoryHardwareManager _connectIfNeeded]_block_invoke_2";
    __int16 v10 = 1024;
    int v11 = 132;
    _os_log_impl(&dword_21ECDA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i XPC interrupted", buf, 0x12u);
  }

  id v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_58;
  block[3] = &unk_2644EC8D0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _cleanupSessions];
    id v2 = v3;
    objc_sync_enter(v2);
    v2[8] = 1;
    objc_sync_exit(v2);

    id WeakRetained = v3;
  }
}

void __46__NFAccessoryHardwareManager__connectIfNeeded__block_invoke_2_60(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to update client name : %{public}@", v9, ClassName, Name, 157, v3);
  }
  dispatch_get_specific(*v4);
  __int16 v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 157;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to update client name : %{public}@", buf, 0x2Cu);
  }
}

- (NFAccessoryHardwareManager)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)NFAccessoryHardwareManager;
  id v2 = [(NFAccessoryHardwareManager *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    sessions = v2->_sessions;
    v2->_sessions = v3;

    if (NFProductSupportsAC())
    {
      int v5 = 1;
    }
    else
    {
      v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i HW is not supported on this platform", "-[NFAccessoryHardwareManager init]", 188);
      }
      dispatch_get_specific(*v6);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[NFAccessoryHardwareManager init]";
        __int16 v13 = 1024;
        int v14 = 188;
        _os_log_impl(&dword_21ECDA000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i HW is not supported on this platform", buf, 0x12u);
      }

      int v5 = 3;
    }
    v2->_unsigned int hwSupport = v5;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NFAccessoryHardwareManager;
  [(NFAccessoryHardwareManager *)&v3 dealloc];
}

- (void)sessionDidEnd:(id)a3
{
  obj = self->_sessions;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSMutableSet *)self->_sessions removeObject:v5];

  objc_sync_exit(obj);
}

- (void)didInvalidateXPCConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i Connection invalidated", "-[NFAccessoryHardwareManager didInvalidateXPCConnection:]", 211);
  }
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    objc_super v10 = "-[NFAccessoryHardwareManager didInvalidateXPCConnection:]";
    __int16 v11 = 1024;
    int v12 = 211;
    _os_log_impl(&dword_21ECDA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Connection invalidated", buf, 0x12u);
  }

  id v7 = self;
  objc_sync_enter(v7);
  connection = v7->_connection;
  v7->_connection = 0;

  objc_sync_exit(v7);
}

- (void)didInterruptXPCConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i Connection interrupted", "-[NFAccessoryHardwareManager didInterruptXPCConnection:]", 219);
  }
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    objc_super v10 = "-[NFAccessoryHardwareManager didInterruptXPCConnection:]";
    __int16 v11 = 1024;
    int v12 = 219;
    _os_log_impl(&dword_21ECDA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Connection interrupted", buf, 0x12u);
  }

  id v7 = self->_sessions;
  objc_sync_enter(v7);
  v8 = (void *)[(NSMutableSet *)self->_sessions copy];
  self->_unsigned int hwSupport = 1;
  objc_sync_exit(v7);

  [v8 enumerateObjectsUsingBlock:&__block_literal_global_73];
}

uint64_t __56__NFAccessoryHardwareManager_didInterruptXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndUnexpectedly];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NFAccessoryHardwareManager *)v5 _connectIfNeeded];
  connection = v5->_connection;
  if (connection)
  {
    id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfac.fwk"];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"no xpc connection";
    objc_super v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    __int16 v11 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v10];

    v4[2](v4, v11);
    id v7 = 0;
  }

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NFAccessoryHardwareManager *)v5 _connectIfNeeded];
  connection = v5->_connection;
  if (connection)
  {
    id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfac.fwk"];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"no xpc connection";
    objc_super v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    __int16 v11 = (void *)[v8 initWithDomain:v9 code:0 userInfo:v10];

    v4[2](v4, v11);
    id v7 = 0;
  }

  return v7;
}

- (id)startReaderSession:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_21ECDA000, "startReaderSession:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v27 = 0;
  v28 = (int *)&v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  __int16 v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v7 = objc_opt_new();
  id v8 = *(void **)(state.opaque[1] + 40);
  *(void *)(state.opaque[1] + 40) = v7;

  [*(id *)(state.opaque[1] + 40) setDidStartCallback:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__NFAccessoryHardwareManager_startReaderSession___block_invoke;
  v17[3] = &unk_2644EC920;
  v17[4] = self;
  [*(id *)(state.opaque[1] + 40) setDidEndCallback:v17];
  uint64_t v9 = MEMORY[0x263EF8330];
  objc_super v10 = v24;
  do
  {
    *((unsigned char *)v10 + 24) = 0;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __49__NFAccessoryHardwareManager_startReaderSession___block_invoke_2;
    v16[3] = &unk_2644EC948;
    v16[4] = self;
    v16[5] = &v27;
    v16[7] = &state;
    v16[8] = a2;
    v16[6] = &v23;
    __int16 v11 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
    uint64_t v12 = *(void *)(state.opaque[1] + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__NFAccessoryHardwareManager_startReaderSession___block_invoke_86;
    v15[3] = &unk_2644EC970;
    v15[4] = self;
    v15[5] = &state;
    v15[6] = a2;
    [v11 queueReaderSession:v12 callback:v15];

    objc_super v10 = v24;
  }
  while (*((unsigned char *)v24 + 24) && v28[6] < 3);
  id v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t __49__NFAccessoryHardwareManager_startReaderSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __49__NFAccessoryHardwareManager_startReaderSession___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v4 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v18, ClassName, Name, 291, v3);
    }
    dispatch_get_specific(*v5);
    uint64_t v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      id v22 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v23 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v21;
      __int16 v38 = 2082;
      __int16 v39 = v22;
      __int16 v40 = 2082;
      uint64_t v41 = v23;
      __int16 v42 = 1024;
      int v43 = 291;
      __int16 v44 = 2114;
      id v45 = v3;
      _os_log_impl(&dword_21ECDA000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
    }

    int v24 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v25 = objc_alloc(MEMORY[0x263F087E8]);
    char v26 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v27 = [NSString stringWithUTF8String:"XPC Error"];
    v35 = v27;
    v28 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v29 = (void *)[v25 initWithDomain:v26 code:7 userInfo:v28];
    [v24 didStartSession:v29];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) resume];
  }
  else
  {
    if (Logger)
    {
      id v8 = object_getClass(*(id *)(a1 + 32));
      BOOL v9 = class_isMetaClass(v8);
      int v30 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v10 = 45;
      if (v9) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v10, v30, v32, 287, v3);
    }
    dispatch_get_specific(*v5);
    __int16 v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v13;
      __int16 v38 = 2082;
      __int16 v39 = v14;
      __int16 v40 = 2082;
      uint64_t v41 = v15;
      __int16 v42 = 1024;
      int v43 = 287;
      __int16 v44 = 2114;
      id v45 = v3;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __49__NFAccessoryHardwareManager_startReaderSession___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v7);
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  objc_sync_exit(v7);

  if (v6)
  {
    id v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 305, v6);
    }
    dispatch_get_specific(*v8);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      v17 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      char v26 = v18;
      __int16 v27 = 1024;
      int v28 = 305;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_21ECDA000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didStartSession:v6];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setProxy:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIsFirstInQueue:1];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resume];
}

- (id)getDieId:(id *)a3
{
  id v6 = _os_activity_create(&dword_21ECDA000, "getDieId:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  int v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__NFAccessoryHardwareManager_getDieId___block_invoke;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &v12;
    v11[6] = a2;
    v11[4] = self;
    id v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__NFAccessoryHardwareManager_getDieId___block_invoke_89;
    v10[3] = &unk_2644EC998;
    v10[4] = self;
    v10[5] = &v12;
    v10[6] = &state;
    v10[7] = a2;
    [v7 getDieId:v10];

    if (a3) {
      *a3 = (id) v13[5];
    }
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __39__NFAccessoryHardwareManager_getDieId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(6, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 329, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 329;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __39__NFAccessoryHardwareManager_getDieId___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i Error = %{public}@", v12, ClassName, Name, 332, v6);
  }
  dispatch_get_specific(*v7);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    id v17 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v26 = v15;
    __int16 v27 = 2082;
    id v28 = v16;
    __int16 v29 = 2082;
    id v30 = v17;
    __int16 v31 = 1024;
    int v32 = 332;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Error = %{public}@", buf, 0x2Cu);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v6;
  id v20 = v6;

  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v5;
}

- (id)getPowerCounters:(id *)a3
{
  id v6 = _os_activity_create(&dword_21ECDA000, "getPowerCounteres:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__NFAccessoryHardwareManager_getPowerCounters___block_invoke;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &v12;
    v11[6] = a2;
    v11[4] = self;
    id v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__NFAccessoryHardwareManager_getPowerCounters___block_invoke_92;
    v10[3] = &unk_2644EC9C0;
    v10[4] = self;
    v10[5] = &v12;
    v10[6] = &state;
    v10[7] = a2;
    [v7 getPowerCounters:v10];

    if (a3) {
      *a3 = (id) v13[5];
    }
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __47__NFAccessoryHardwareManager_getPowerCounters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(6, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 352, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 352;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __47__NFAccessoryHardwareManager_getPowerCounters___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i Error = %{public}@", v12, ClassName, Name, 355, v5);
  }
  dispatch_get_specific(*v7);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    id v17 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v26 = v15;
    __int16 v27 = 2082;
    id v28 = v16;
    __int16 v29 = 2082;
    id v30 = v17;
    __int16 v31 = 1024;
    int v32 = 355;
    __int16 v33 = 2114;
    id v34 = v5;
    _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Error = %{public}@", buf, 0x2Cu);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v5;
  id v20 = v5;

  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v6;
}

- (id)getRfSettings:(id *)a3
{
  id v6 = _os_activity_create(&dword_21ECDA000, "getRfSettings:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__NFAccessoryHardwareManager_getRfSettings___block_invoke;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &v12;
    v11[6] = a2;
    v11[4] = self;
    id v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__NFAccessoryHardwareManager_getRfSettings___block_invoke_94;
    v10[3] = &unk_2644EC9C0;
    v10[4] = self;
    v10[5] = &v12;
    v10[6] = &state;
    v10[7] = a2;
    [v7 getRfSettings:v10];

    if (a3) {
      *a3 = (id) v13[5];
    }
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __44__NFAccessoryHardwareManager_getRfSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(6, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 376, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 376;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __44__NFAccessoryHardwareManager_getRfSettings___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i Error = %{public}@", v12, ClassName, Name, 379, v5);
  }
  dispatch_get_specific(*v7);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    int v16 = object_getClassName(*(id *)(a1 + 32));
    id v17 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    int v26 = v15;
    __int16 v27 = 2082;
    id v28 = v16;
    __int16 v29 = 2082;
    id v30 = v17;
    __int16 v31 = 1024;
    int v32 = 379;
    __int16 v33 = 2114;
    id v34 = v5;
    _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Error = %{public}@", buf, 0x2Cu);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v5;
  id v20 = v5;

  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v6;
}

- (id)getInfo
{
  int v4 = _os_activity_create(&dword_21ECDA000, "getInfo", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  uint64_t v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__NFAccessoryHardwareManager_getInfo__block_invoke;
    v9[3] = &unk_2644EC8F8;
    v9[4] = self;
    v9[5] = a2;
    id v5 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__NFAccessoryHardwareManager_getInfo__block_invoke_95;
    v8[3] = &unk_2644EC9E8;
    v8[5] = &state;
    v8[6] = a2;
    v8[4] = self;
    [v5 getInfo:v8];
  }
  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __37__NFAccessoryHardwareManager_getInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 399, v3);
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
    id v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 399;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __37__NFAccessoryHardwareManager_getInfo__block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v9(3, "%c[%{public}s %{public}s]:%i Error = %{public}@", v12, ClassName, Name, 402, v6);
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
      id v17 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v23 = v15;
      __int16 v24 = 2082;
      __int16 v25 = v16;
      __int16 v26 = 2082;
      uint64_t v27 = v17;
      __int16 v28 = 1024;
      int v29 = 402;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error = %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v5;
}

- (id)enableLPCD:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v6 = "enableLPCD:Y";
  }
  else {
    id v6 = "enableLPCD:N";
  }
  id v7 = _os_activity_create(&dword_21ECDA000, v6, MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__NFAccessoryHardwareManager_enableLPCD___block_invoke;
    v12[3] = &unk_2644EC7C0;
    v12[5] = &state;
    v12[6] = a2;
    v12[4] = self;
    id v8 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__NFAccessoryHardwareManager_enableLPCD___block_invoke_97;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &state;
    v11[6] = a2;
    v11[4] = self;
    [v8 enableLPCD:v3 callback:v11];
  }
  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __41__NFAccessoryHardwareManager_enableLPCD___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 420, v3);
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
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 420;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __41__NFAccessoryHardwareManager_enableLPCD___block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v6(3, "%c[%{public}s %{public}s]:%i Error = %{public}@", v9, ClassName, Name, 425, v3);
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
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      id v22 = v13;
      __int16 v23 = 2082;
      __int16 v24 = v14;
      __int16 v25 = 1024;
      int v26 = 425;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error = %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (id)enableMultiTag:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v6 = "enableMultiTag:Y";
  }
  else {
    id v6 = "enableMultiTag:N";
  }
  id v7 = _os_activity_create(&dword_21ECDA000, v6, MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__NFAccessoryHardwareManager_enableMultiTag___block_invoke;
    v12[3] = &unk_2644EC7C0;
    v12[5] = &state;
    v12[6] = a2;
    v12[4] = self;
    id v8 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__NFAccessoryHardwareManager_enableMultiTag___block_invoke_98;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &state;
    v11[6] = a2;
    v11[4] = self;
    [v8 enableMultiTag:v3 callback:v11];
  }
  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __45__NFAccessoryHardwareManager_enableMultiTag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 444, v3);
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
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 444;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __45__NFAccessoryHardwareManager_enableMultiTag___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v6(3, "%c[%{public}s %{public}s]:%i Error = %{public}@", v9, ClassName, Name, 448, v3);
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
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      id v22 = v13;
      __int16 v23 = 2082;
      __int16 v24 = v14;
      __int16 v25 = 1024;
      int v26 = 448;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error = %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (id)getLastDetectedTags:(id *)a3
{
  id v6 = _os_activity_create(&dword_21ECDA000, "getLastDetectedTags:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__1;
  __int16 v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__NFAccessoryHardwareManager_getLastDetectedTags___block_invoke;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &v12;
    v11[6] = a2;
    v11[4] = self;
    id v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__NFAccessoryHardwareManager_getLastDetectedTags___block_invoke_99;
    v10[3] = &unk_2644ECA10;
    v10[4] = &v12;
    v10[5] = &state;
    [v7 getLastDetectedTags:v10];
  }
  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __50__NFAccessoryHardwareManager_getLastDetectedTags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 465, v3);
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
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 465;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __50__NFAccessoryHardwareManager_getLastDetectedTags___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else if (v5 && [v5 count])
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          int v16 = [NFACTag alloc];
          id v17 = -[NFACTag initWithInternalTag:](v16, "initWithInternalTag:", v15, (void)v18);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (id)getMultiTagState:(id *)a3
{
  id v6 = _os_activity_create(&dword_21ECDA000, "getMultiTagState:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__1;
  long long v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__NFAccessoryHardwareManager_getMultiTagState___block_invoke;
    v11[3] = &unk_2644EC7C0;
    v11[5] = &v12;
    v11[6] = a2;
    v11[4] = self;
    uint64_t v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__NFAccessoryHardwareManager_getMultiTagState___block_invoke_103;
    v10[3] = &unk_2644ECA38;
    v10[4] = self;
    v10[5] = &v12;
    void v10[6] = &state;
    v10[7] = a2;
    [v7 getMultiTagState:v10];
  }
  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __47__NFAccessoryHardwareManager_getMultiTagState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 498, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 498;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __47__NFAccessoryHardwareManager_getMultiTagState___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Error: %{public}@", v12, ClassName, Name, 502, v6);
    }
    dispatch_get_specific(*v7);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      int v16 = object_getClassName(*(id *)(a1 + 32));
      id v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v35 = v15;
      __int16 v36 = 2082;
      int v37 = v16;
      __int16 v38 = 2082;
      __int16 v39 = v17;
      __int16 v40 = 1024;
      int v41 = 502;
      __int16 v42 = 2114;
      id v43 = v6;
      _os_log_impl(&dword_21ECDA000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error: %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else if (v5 && [v5 count])
  {
    uint64_t v18 = objc_opt_new();
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v21 = v5;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          int v26 = [[NFACTag alloc] initWithInternalTag:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v23);
    }
  }
}

- (id)clearMultiTagState
{
  int v4 = _os_activity_create(&dword_21ECDA000, "clearMultiTagState", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  uint64_t v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  if ([(NFAccessoryHardwareManager *)self connect])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__NFAccessoryHardwareManager_clearMultiTagState__block_invoke;
    v9[3] = &unk_2644EC7C0;
    v9[5] = &state;
    void v9[6] = a2;
    v9[4] = self;
    id v5 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__NFAccessoryHardwareManager_clearMultiTagState__block_invoke_105;
    v8[3] = &unk_2644ECA60;
    v8[4] = &state;
    [v5 clearMultiTagState:v8];
  }
  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __48__NFAccessoryHardwareManager_clearMultiTagState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 531, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 531;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __48__NFAccessoryHardwareManager_clearMultiTagState__block_invoke_105(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (BOOL)triggerDelayedWake:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v6 = _os_activity_create(&dword_21ECDA000, "triggerDelayedWake:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__NFAccessoryHardwareManager_triggerDelayedWake___block_invoke;
  v10[3] = &unk_2644EC8F8;
  v10[4] = self;
  v10[5] = a2;
  uint64_t v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__NFAccessoryHardwareManager_triggerDelayedWake___block_invoke_106;
  v9[3] = &unk_2644EC7C0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  [v7 triggerDelayedWake:v3 callback:v9];

  LOBYTE(v3) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v3;
}

void __49__NFAccessoryHardwareManager_triggerDelayedWake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 550, v3);
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
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    uint64_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = 550;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __49__NFAccessoryHardwareManager_triggerDelayedWake___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 553, v3);
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
      int v18 = v12;
      __int16 v19 = 2082;
      int v20 = v13;
      __int16 v21 = 2082;
      uint64_t v22 = v14;
      __int16 v23 = 1024;
      int v24 = 553;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)pushSignedRF:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_21ECDA000, "pushSignedRF:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__NFAccessoryHardwareManager_pushSignedRF___block_invoke;
  v11[3] = &unk_2644EC7C0;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  uint64_t v7 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__NFAccessoryHardwareManager_pushSignedRF___block_invoke_107;
  v10[3] = &unk_2644EC7C0;
  v10[5] = &state;
  void v10[6] = a2;
  v10[4] = self;
  [v7 pushSignedRF:v5 callback:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __43__NFAccessoryHardwareManager_pushSignedRF___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 570, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 570;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __43__NFAccessoryHardwareManager_pushSignedRF___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 574, v3);
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
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      uint64_t v22 = v13;
      __int16 v23 = 2082;
      int v24 = v14;
      __int16 v25 = 1024;
      int v26 = 574;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (BOOL)shutdownAndLeaveHWEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v6 = "shutdownAndLeaveHWEnabled:Y";
  }
  else {
    id v6 = "shutdownAndLeaveHWEnabled:N";
  }
  uint64_t v7 = _os_activity_create(&dword_21ECDA000, v6, MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__NFAccessoryHardwareManager_shutdownAndLeaveHWEnabled___block_invoke;
  v12[3] = &unk_2644EC8F8;
  v12[4] = self;
  v12[5] = a2;
  id v8 = [(NFAccessoryHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__NFAccessoryHardwareManager_shutdownAndLeaveHWEnabled___block_invoke_108;
  v11[3] = &unk_2644EC7C0;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  [v8 shutdownAndLeaveHWEnabled:v3 callback:v11];

  char v9 = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v9;
}

void __56__NFAccessoryHardwareManager_shutdownAndLeaveHWEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 594, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    uint64_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = 594;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __56__NFAccessoryHardwareManager_shutdownAndLeaveHWEnabled___block_invoke_108(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 597, v3);
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
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      int v20 = v13;
      __int16 v21 = 2082;
      uint64_t v22 = v14;
      __int16 v23 = 1024;
      int v24 = 597;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)updateHWSupport:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (a3) {
    id v6 = "updateHWSupport:Y";
  }
  else {
    id v6 = "updateHWSupport:N";
  }
  uint64_t v7 = _os_activity_create(&dword_21ECDA000, v6, MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  id v55 = 0;
  id v8 = self;
  objc_sync_enter(v8);
  if (NFProductSupportsAC())
  {
    if (v3)
    {
      connection = v8->_connection;
      if (!connection)
      {
        id v26 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v28 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v8);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v8);
          Name = sel_getName(a2);
          uint64_t v32 = 45;
          if (isMetaClass) {
            uint64_t v32 = 43;
          }
          v28(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : No XPC connection", v32, ClassName, Name, 634);
        }
        dispatch_get_specific(*v26);
        __int16 v33 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          id v34 = object_getClass(v8);
          if (class_isMetaClass(v34)) {
            int v35 = 43;
          }
          else {
            int v35 = 45;
          }
          __int16 v36 = object_getClassName(v8);
          int v37 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v59 = v35;
          __int16 v60 = 2082;
          v61 = v36;
          __int16 v62 = 2082;
          v63 = v37;
          __int16 v64 = 1024;
          int v65 = 634;
          _os_log_impl(&dword_21ECDA000, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : No XPC connection", buf, 0x22u);
        }

        id v38 = objc_alloc(MEMORY[0x263F087E8]);
        __int16 v39 = [NSString stringWithUTF8String:"nfcd"];
        v56[0] = *MEMORY[0x263F08320];
        __int16 v40 = [NSString stringWithUTF8String:"XPC Error"];
        v57[0] = v40;
        v57[1] = &unk_26D055418;
        v56[1] = @"Line";
        v56[2] = @"Method";
        int v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
        v57[2] = v41;
        v56[3] = *MEMORY[0x263F07F80];
        __int16 v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 635);
        v57[3] = v42;
        id v43 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];
        uint64_t v44 = [v38 initWithDomain:v39 code:7 userInfo:v43];
        id v45 = *(void **)(state.opaque[1] + 40);
        *(void *)(state.opaque[1] + 40) = v44;

        int v24 = 0;
        goto LABEL_20;
      }
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __46__NFAccessoryHardwareManager_updateHWSupport___block_invoke;
      v50[3] = &unk_2644EC7C0;
      v50[4] = v8;
      v50[5] = &state;
      v50[6] = a2;
      id v10 = v50;
    }
    else
    {
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __46__NFAccessoryHardwareManager_updateHWSupport___block_invoke_125;
      v49[3] = &unk_2644EC7C0;
      v49[4] = v8;
      v49[5] = &state;
      v49[6] = a2;
      id v10 = v49;
      connection = v8;
    }
    int v24 = [connection synchronousRemoteObjectProxyWithErrorHandler:v10];
LABEL_20:
    if (!*(void *)(state.opaque[1] + 40))
    {
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __46__NFAccessoryHardwareManager_updateHWSupport___block_invoke_126;
      v48[3] = &unk_2644ECA88;
      v48[4] = v8;
      [v24 isHWSupported:v48];
    }

    objc_sync_exit(v8);
    id v23 = *(id *)(state.opaque[1] + 40);
    goto LABEL_23;
  }
  uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v12 = NFLogGetLogger();
  if (v12)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))v12;
    uint64_t v14 = object_getClass(v8);
    BOOL v15 = class_isMetaClass(v14);
    id v16 = object_getClassName(v8);
    uint64_t v46 = sel_getName(a2);
    uint64_t v17 = 45;
    if (v15) {
      uint64_t v17 = 43;
    }
    v13(3, "%c[%{public}s %{public}s]:%i HW not supported on this device", v17, v16, v46, 621);
  }
  dispatch_get_specific(*v11);
  int v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = object_getClass(v8);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    __int16 v21 = object_getClassName(v8);
    uint64_t v22 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v59 = v20;
    __int16 v60 = 2082;
    v61 = v21;
    __int16 v62 = 2082;
    v63 = v22;
    __int16 v64 = 1024;
    int v65 = 621;
    _os_log_impl(&dword_21ECDA000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HW not supported on this device", buf, 0x22u);
  }

  v8->_unsigned int hwSupport = 4;
  objc_sync_exit(v8);

  id v23 = 0;
LABEL_23:
  _Block_object_dispose(&state, 8);

  return v23;
}

void __46__NFAccessoryHardwareManager_updateHWSupport___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", v9, ClassName, Name, 630, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 630;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __46__NFAccessoryHardwareManager_updateHWSupport___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", v9, ClassName, Name, 639, v3);
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
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 639;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

uint64_t __46__NFAccessoryHardwareManager_updateHWSupport___block_invoke_126(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 32) = a2;
  return result;
}

- (unsigned)getHwSupport:(BOOL)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [(NFAccessoryHardwareManager *)self updateHWSupport:0];
    uint64_t v7 = v6;
    if (a4 && v6) {
      *a4 = v6;
    }
    id v8 = self;
    objc_sync_enter(v8);
    unsigned int hwSupport = v8->_hwSupport;
    objc_sync_exit(v8);
  }
  else
  {
    id v10 = self;
    objc_sync_enter(v10);
    unsigned int v11 = v10->_hwSupport;
    objc_sync_exit(v10);

    if (v11 != 1)
    {
      [(NFAccessoryHardwareManager *)v10 connect];
      int v12 = [(NFAccessoryHardwareManager *)v10 updateHWSupport:0];
      uint64_t v13 = v12;
      if (a4 && v12) {
        *a4 = v12;
      }
    }
    uint64_t v7 = v10;
    objc_sync_enter(v7);
    unsigned int hwSupport = v10->_hwSupport;
    objc_sync_exit(v7);
  }

  return hwSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end