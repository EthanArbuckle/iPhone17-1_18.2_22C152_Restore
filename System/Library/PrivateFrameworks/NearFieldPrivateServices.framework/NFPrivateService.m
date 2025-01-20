@interface NFPrivateService
+ (BOOL)isResultSuccessful:(id)a3;
- (BOOL)canRun;
- (id)connectToService:(id)a3;
- (id)runService:(id)a3;
- (id)serviceName;
- (void)dealloc;
- (void)disconnect;
- (void)runService:(id)a3 withCompletion:(id)a4;
- (void)serviceNotificationReceived:(id)a3;
@end

@implementation NFPrivateService

+ (BOOL)isResultSuccessful:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 objectForKey:@"Error"];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)serviceName
{
  return @"com.apple.stockholm.services.ERROR";
}

- (id)connectToService:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_xpcConnection)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:v5];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v8;

    if (v6->_xpcConnection)
    {
      v10 = +[NFPrivateServiceInterface interface];
      [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v10];

      v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270653DD0];
      [(NSXPCConnection *)v6->_xpcConnection setExportedInterface:v11];

      [(NSXPCConnection *)v6->_xpcConnection setExportedObject:v6];
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INTERACTIVE, 0);
      v14 = dispatch_queue_create("NFServiceRootQueue", v13);

      if (v14)
      {
        [(NSXPCConnection *)v6->_xpcConnection _setQueue:v14];
      }
      else
      {
        v25 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v6);
          if (class_isMetaClass(Class)) {
            uint64_t v28 = 43;
          }
          else {
            uint64_t v28 = 45;
          }
          ClassName = object_getClassName(v6);
          Name = sel_getName(a2);
          Logger(3, "%c[%{public}s %{public}s]:%i Failed to create root queue", v28, ClassName, Name, 52);
        }
        dispatch_get_specific(*v25);
        v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = object_getClass(v6);
          if (class_isMetaClass(v32)) {
            int v33 = 43;
          }
          else {
            int v33 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v38 = v33;
          __int16 v39 = 2082;
          v40 = object_getClassName(v6);
          __int16 v41 = 2082;
          v42 = sel_getName(a2);
          __int16 v43 = 1024;
          int v44 = 52;
          _os_log_impl(&dword_257348000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to create root queue", buf, 0x22u);
        }
      }
      [(NSXPCConnection *)v6->_xpcConnection resume];
      v7 = 0;
    }
    else
    {
      v15 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        v17 = object_getClass(v6);
        if (class_isMetaClass(v17)) {
          uint64_t v18 = 43;
        }
        else {
          uint64_t v18 = 45;
        }
        v19 = object_getClassName(v6);
        v20 = sel_getName(a2);
        v16(3, "%c[%{public}s %{public}s]:%i Failed to connect to restore service", v18, v19, v20, 40);
      }
      dispatch_get_specific(*v15);
      v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(v6);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v38 = v23;
        __int16 v39 = 2082;
        v40 = object_getClassName(v6);
        __int16 v41 = 2082;
        v42 = sel_getName(a2);
        __int16 v43 = 1024;
        int v44 = 40;
        _os_log_impl(&dword_257348000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to restore service", buf, 0x22u);
      }

      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      v36 = @"XPC Connection error";
      v14 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v7 = [v24 errorWithDomain:@"NearFieldPrivateServices" code:4096 userInfo:v14];
    }
  }
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)canRun
{
  return 0;
}

- (id)runService:(id)a3
{
  v62[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  __int16 v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  if (![(NFPrivateService *)self canRun])
  {
    v61 = @"Error";
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = *MEMORY[0x263F08320];
    v60 = @"Service cannot run right now";
    v12 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    v13 = [v11 errorWithDomain:@"NearFieldPrivateServices" code:4098 userInfo:v12];
    v62[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];

    goto LABEL_20;
  }
  v6 = [(NFPrivateService *)self serviceName];
  uint64_t v7 = [(NFPrivateService *)self connectToService:v6];
  uint64_t v8 = (void *)v34[5];
  v34[5] = v7;

  uint64_t v9 = v34[5];
  if (v9)
  {
    v57 = @"Error";
    uint64_t v58 = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
LABEL_19:
    v14 = (void *)v10;
    goto LABEL_20;
  }
  xpcConnection = self->_xpcConnection;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __31__NFPrivateService_runService___block_invoke;
  v32[3] = &unk_265429658;
  v32[4] = self;
  v32[5] = &v33;
  v32[6] = a2;
  v16 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v32];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __31__NFPrivateService_runService___block_invoke_65;
  v31[3] = &unk_265429680;
  v31[4] = &v39;
  v31[5] = &v33;
  [v16 runService:v5 callback:v31];

  if (v34[5])
  {
    v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v20 = 43;
      }
      else {
        uint64_t v20 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(3, "%c[%{public}s %{public}s]:%i Failed running command : %@", v20, ClassName, Name, 91, v34[5]);
    }
    dispatch_get_specific(*v17);
    int v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      uint64_t v28 = v34[5];
      *(_DWORD *)buf = 67110146;
      int v48 = v25;
      __int16 v49 = 2082;
      v50 = v26;
      __int16 v51 = 2082;
      v52 = v27;
      __int16 v53 = 1024;
      int v54 = 91;
      __int16 v55 = 2112;
      uint64_t v56 = v28;
      _os_log_impl(&dword_257348000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed running command : %@", buf, 0x2Cu);
    }

    uint64_t v29 = v34[5];
    uint64_t v45 = @"Error";
    uint64_t v46 = v29;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    goto LABEL_19;
  }
  if (v40[5])
  {
    uint64_t v10 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
    goto LABEL_19;
  }
  v14 = (void *)MEMORY[0x263EFFA78];
LABEL_20:
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v14;
}

void __31__NFPrivateService_runService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 83, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = v14;
    __int16 v25 = 1024;
    int v26 = 83;
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_impl(&dword_257348000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __31__NFPrivateService_runService___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)runService:(id)a3 withCompletion:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a4;
  if ([(NFPrivateService *)self canRun])
  {
    uint64_t v9 = [(NFPrivateService *)self serviceName];
    uint64_t v10 = [(NFPrivateService *)self connectToService:v9];

    if (v10)
    {
      v24 = @"Error";
      __int16 v25 = v10;
      id v11 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v8[2](v8, v11);
    }
    else
    {
      xpcConnection = self->_xpcConnection;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __46__NFPrivateService_runService_withCompletion___block_invoke;
      v21[3] = &unk_2654296A8;
      v21[4] = self;
      SEL v23 = a2;
      v17 = v8;
      v22 = v17;
      uint64_t v18 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __46__NFPrivateService_runService_withCompletion___block_invoke_68;
      v19[3] = &unk_2654296D0;
      int v20 = v17;
      [v18 runService:v7 callback:v19];
    }
  }
  else
  {
    id v28 = @"Error";
    int v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    __int16 v27 = @"Service cannot run right now";
    v13 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v14 = [v12 errorWithDomain:@"NearFieldPrivateServices" code:4098 userInfo:v13];
    v29[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v8[2](v8, v15);
  }
}

void __46__NFPrivateService_runService_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x263F8C6C0];
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
    v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 118, v3);
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
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v22 = v12;
    __int16 v23 = 2082;
    v24 = v13;
    __int16 v25 = 2082;
    uint64_t v26 = v14;
    __int16 v27 = 1024;
    int v28 = 118;
    __int16 v29 = 2112;
    id v30 = v3;
    _os_log_impl(&dword_257348000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  v19 = @"Error";
  id v20 = v3;
  v16 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
}

void __46__NFPrivateService_runService_withCompletion___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = @"Error";
    v12[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (!v5)
    {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, MEMORY[0x263EFFA78]);
      goto LABEL_6;
    }
    uint64_t v9 = [NSDictionary dictionaryWithDictionary:v5];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
  }

LABEL_6:
}

- (void)disconnect
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  [(NSXPCConnection *)self->_xpcConnection setExportedObject:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)serviceNotificationReceived:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(4, "%c[%{public}s %{public}s]:%i Warning un-implemented notification handler.", v11, ClassName, Name, 145);
  }
  dispatch_get_specific(*v5);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v14;
    __int16 v18 = 2082;
    v19 = object_getClassName(self);
    __int16 v20 = 2082;
    __int16 v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 145;
    _os_log_impl(&dword_257348000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Warning un-implemented notification handler.", buf, 0x22u);
  }
}

- (void)dealloc
{
  if (self->_xpcConnection) {
    [(NFPrivateService *)self disconnect];
  }
  v3.receiver = self;
  v3.super_class = (Class)NFPrivateService;
  [(NFPrivateService *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end