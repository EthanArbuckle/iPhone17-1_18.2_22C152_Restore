@interface MOPersonalizedSensingServiceManager
+ (BOOL)isServiceDeployed;
+ (id)generatePromptSuggestionWithTemplate:(id)a3 context:(id)a4 options:(id)a5;
+ (void)handleDbAccessRenewalTask:(id)a3;
+ (void)primeService;
- (BOOL)isGMSAvailable;
- (MOPersonalizedSensingServiceManager)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (void)_fetchPersonalizedSyncContextWithOptions:(id)a3 withReply:(id)a4;
- (void)createConnection;
- (void)dealloc;
- (void)fetchPersonalizedContextWithOptions:(id)a3 withReply:(id)a4;
- (void)notifyContextFeedback:(id)a3 withReply:(id)a4;
- (void)refreshMomentsContextWithReply:(id)a3;
- (void)requestDBAccessForPersonalizedSensingServiceWithReply:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIsGMSAvailable:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation MOPersonalizedSensingServiceManager

+ (BOOL)isServiceDeployed
{
  return !+[MOPlatformInfo isIpad];
}

- (void)createConnection
{
  if (+[MOPersonalizedSensingServiceManager isServiceDeployed])
  {
    connection = self->_connection;
    if (connection)
    {
      self->_connection = 0;
    }
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PersonalizedSensingService"];
    v5 = self->_connection;
    self->_connection = v4;

    if (self->_connection)
    {
      v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270723F20];
      v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      v15 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
      [v6 setClasses:v15 forSelector:sel_fetchPersonalizedContextWithOptions_withReply_ argumentIndex:0 ofReply:1];

      v16 = (void *)MEMORY[0x263EFFA08];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      v24 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
      [v6 setClasses:v24 forSelector:sel_notifyContextFeedback_withReply_ argumentIndex:0 ofReply:1];

      [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
      [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_0];
      [(NSXPCConnection *)self->_connection setInvalidationHandler:&__block_literal_global_43];
      [(NSXPCConnection *)self->_connection activate];
    }
    v25 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v25, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,createConnection successful", buf, 2u);
    }
  }
}

void __55__MOPersonalizedSensingServiceManager_createConnection__block_invoke()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_259147000, v0, OS_LOG_TYPE_DEFAULT, "Connection to XPC service interrupted", v1, 2u);
  }
}

void __55__MOPersonalizedSensingServiceManager_createConnection__block_invoke_41()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_259147000, v0, OS_LOG_TYPE_DEFAULT, "Connection to XPC service invalidated", v1, 2u);
  }
}

- (MOPersonalizedSensingServiceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOPersonalizedSensingServiceManager;
  v2 = [(MOPersonalizedSensingServiceManager *)&v7 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"MOPersonalizedSensingServiceManager, %p", v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_isGMSAvailable = +[MOPlatformInfo generativeModelsAvailabilityStatus] == 1;
    [(MOPersonalizedSensingServiceManager *)v2 createConnection];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v3, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,dealloc", buf, 2u);
  }

  dispatch_queue_t v4 = [(MOPersonalizedSensingServiceManager *)self connection];
  [v4 invalidate];

  [(MOPersonalizedSensingServiceManager *)self setConnection:0];
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MOPersonalizedSensingServiceManager;
  [(MOPersonalizedSensingServiceManager *)&v6 dealloc];
}

- (void)_fetchPersonalizedSyncContextWithOptions:(id)a3 withReply:(id)a4
{
  uint64_t v5 = _fetchPersonalizedSyncContextWithOptions_withReply__onceToken;
  id v6 = a4;
  id v7 = a3;
  id v9 = v7;
  if (v5 == -1)
  {
    id v8 = v7;
  }
  else
  {
    dispatch_once(&_fetchPersonalizedSyncContextWithOptions_withReply__onceToken, &__block_literal_global_52);
    id v8 = v9;
  }
  [(id)_fetchPersonalizedSyncContextWithOptions_withReply__fetchSyncReader loadPersonalizedContextWithOptions:v8 withReply:v6];
}

uint64_t __90__MOPersonalizedSensingServiceManager__fetchPersonalizedSyncContextWithOptions_withReply___block_invoke()
{
  _fetchPersonalizedSyncContextWithOptions_withReply__fetchSyncReader = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)fetchPersonalizedContextWithOptions:(id)a3 withReply:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v8, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,fetchPersonalizedContextWithOptions", buf, 2u);
  }

  if (self->_isGMSAvailable)
  {
    if (!+[MOPersonalizedSensingServiceManager isServiceDeployed])
    {
      [(MOPersonalizedSensingServiceManager *)self _fetchPersonalizedSyncContextWithOptions:v6 withReply:v7];
      goto LABEL_18;
    }
    if ([v6 contextRetrieval] == 1)
    {
      connection = self->_connection;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke;
      v23[3] = &unk_2654489A0;
      uint64_t v10 = &v24;
      id v24 = v7;
      uint64_t v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v23];
    }
    else
    {
      if ([v6 contextRetrieval] != 2)
      {
        uint64_t v17 = 0;
        goto LABEL_15;
      }
      v16 = self->_connection;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_59;
      v21[3] = &unk_2654489A0;
      uint64_t v10 = &v22;
      id v22 = v7;
      uint64_t v11 = [(NSXPCConnection *)v16 remoteObjectProxyWithErrorHandler:v21];
    }
    uint64_t v17 = (void *)v11;

LABEL_15:
    uint64_t v18 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v18, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling fetchPersonalizedContextWithOptions", buf, 2u);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_60;
    v19[3] = &unk_2654489C8;
    id v20 = v7;
    [v17 fetchPersonalizedContextWithOptions:v6 withReply:v19];

    goto LABEL_18;
  }
  uint64_t v12 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v12, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,fetchPersonalizedContextWithOptions, generative models unavailable, do nothing", buf, 2u);
  }

  uint64_t v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v26 = *MEMORY[0x263F08320];
  v27[0] = @"Personalized Sensing unavailable";
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v15 = [v13 errorWithDomain:@"MOContextErrorDomain" code:1287 userInfo:v14];
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);

LABEL_18:
}

void __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_queue_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 code];
    id v6 = [v3 domain];
    id v7 = [v3 localizedDescription];
    int v8 = 134349571;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2113;
    uint64_t v13 = v7;
    _os_log_impl(&dword_259147000, v4, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,fetchPersonalizedContextWithOptions,XPCService synchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\"", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_queue_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 code];
    id v6 = [v3 domain];
    id v7 = [v3 localizedDescription];
    int v8 = 134349571;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2113;
    uint64_t v13 = v7;
    _os_log_impl(&dword_259147000, v4, OS_LOG_TYPE_INFO, "PersonalizedSensingServiceManager,fetchPersonalizedContextWithOptions,XPCService asynchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\"", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v16 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v20 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v5;
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * v5);
        id v7 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = [v6 contextIdentifier];
          *(_DWORD *)buf = 138412290;
          v32 = v8;
          _os_log_impl(&dword_259147000, v7, OS_LOG_TYPE_INFO, "PSServiceMgr, id, %@", buf, 0xCu);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v9 = [v6 contextStrings];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
              v15 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v14;
                _os_log_debug_impl(&dword_259147000, v15, OS_LOG_TYPE_DEBUG, "contextString, %@", buf, 0xCu);
              }

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }

        uint64_t v5 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v20);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyContextFeedback:(id)a3 withReply:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v8, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,notifyContextFeedback", buf, 2u);
  }

  if (self->_isGMSAvailable)
  {
    uint64_t v9 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_63];
    uint64_t v10 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v10, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling notifyContextFeedback", buf, 2u);
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__MOPersonalizedSensingServiceManager_notifyContextFeedback_withReply___block_invoke_64;
    v14[3] = &unk_265448A10;
    id v15 = v7;
    [v9 notifyContextFeedback:v6 withReply:v14];
    uint64_t v11 = v15;
  }
  else
  {
    uint64_t v12 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v12, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,notifyContextFeedback, generative models unavailable, do nothing", buf, 2u);
    }

    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Personalized Sensing unavailable";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v11 = [v13 errorWithDomain:@"MOContextErrorDomain" code:1287 userInfo:v9];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __71__MOPersonalizedSensingServiceManager_notifyContextFeedback_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 code];
    uint64_t v5 = [v2 domain];
    id v6 = [v2 localizedDescription];
    int v7 = 134349571;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2113;
    uint64_t v12 = v6;
    _os_log_impl(&dword_259147000, v3, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,notifyContextFeedback,XPCService synchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\"", (uint8_t *)&v7, 0x20u);
  }
}

void __71__MOPersonalizedSensingServiceManager_notifyContextFeedback_withReply___block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_259147000, v6, OS_LOG_TYPE_DEFAULT, "PSServiceMgr, notifyContextFeedback, result, %lu, error, %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestDBAccessForPersonalizedSensingServiceWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  BOOL v5 = +[MOPlatformInfo isIpad];
  id v6 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v6, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,requestDBAccessForPersonalizedSensingService is only supported on iPhone, called on iPad so do nothing", buf, 2u);
    }

LABEL_14:
    v4[2](v4, 0);
    goto LABEL_15;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v6, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,requestDBAccessForPersonalizedSensingService", buf, 2u);
  }

  if (!self->_isGMSAvailable)
  {
    uint64_t v12 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v12, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,requestDBAccessForPersonalizedSensingService, generative models unavailable, do nothing", buf, 2u);
    }

    goto LABEL_14;
  }
  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke;
  v15[3] = &unk_2654489A0;
  __int16 v9 = v4;
  id v16 = v9;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v11, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling requestDBAccessForPersonalizedSensingService", buf, 2u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke_66;
  v13[3] = &unk_265448A38;
  uint64_t v14 = v9;
  [v10 requestDBAccessForPersonalizedSensingServiceWithReply:v13];

LABEL_15:
}

void __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 code];
    id v6 = [v3 domain];
    BOOL v7 = [v3 localizedDescription];
    int v8 = 134349571;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2113;
    uint64_t v13 = v7;
    _os_log_impl(&dword_259147000, v4, OS_LOG_TYPE_DEFAULT, "PersonalizedSensingServiceManager,requestDBAccessForPersonalizedSensingService,XPCService asynchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\"", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke_66(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_259147000, v2, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,requestDBAccessForPersonalizedSensingService, remoteproxy being called", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)primeService
{
}

uint64_t __51__MOPersonalizedSensingServiceManager_primeService__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:a2];
}

+ (void)handleDbAccessRenewalTask:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x263F298F0];
  uint64_t v5 = [v3 identifier];
  id v37 = 0;
  [v4 reportCustomCheckpoint:502 forTask:v5 error:&v37];
  id v6 = v37;

  BOOL v7 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:].cold.4();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v8, OS_LOG_TYPE_INFO, "Recording MOCheckpointAssertionTaskStarted Checkpoint successful", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v34 = buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke;
  v32[3] = &unk_265448A80;
  v32[4] = buf;
  [v3 setExpirationHandler:v32];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  __int16 v10 = objc_alloc_init(MOPersonalizedSensingServiceManager);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke_2;
  v30[3] = &unk_265448AA8;
  uint64_t v11 = v9;
  v31 = v11;
  [(MOPersonalizedSensingServiceManager *)v10 requestDBAccessForPersonalizedSensingServiceWithReply:v30];
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    uint64_t v13 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:](v13);
    }
  }
  if (v34[24])
  {
    id v29 = 0;
    char v14 = [v3 setTaskExpiredWithRetryAfter:&v29 error:0.0];
    id v15 = v29;
    if (v14) {
      goto LABEL_22;
    }
    id v16 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:]((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    id v15 = 0;
  }
  long long v23 = (void *)MEMORY[0x263F298F0];
  long long v24 = [v3 identifier];
  id v28 = 0;
  [v23 reportCustomCheckpoint:503 forTask:v24 error:&v28];
  id v25 = v28;

  if (v25)
  {
    long long v26 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:]();
    }
  }
  else
  {
    long long v26 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v27 = 0;
      _os_log_impl(&dword_259147000, v26, OS_LOG_TYPE_INFO, "Recording MOCheckpointAssertionTaskCompleted Checkpoint successful", v27, 2u);
    }
  }

  [v3 setTaskCompleted];
LABEL_22:

  _Block_object_dispose(buf, 8);
}

uint64_t __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

intptr_t __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_259147000, v4, OS_LOG_TYPE_DEFAULT, "DB access token renewal succeeded: %d", (uint8_t *)v6, 8u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)generatePromptSuggestionWithTemplate:(id)a3 context:(id)a4 options:(id)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = (void *)[v7 copy];
  uint64_t v11 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v79 = [v8 associatedContacts];
    dispatch_time_t v12 = [v79 firstObject];
    uint64_t v13 = [v8 associatedLocations];
    char v14 = [v13 firstObject];
    [v8 associatedTime];
    id v15 = v8;
    id v16 = v10;
    v18 = id v17 = v9;
    uint64_t v19 = [v18 firstObject];
    *(_DWORD *)buf = 138413058;
    id v81 = v7;
    __int16 v82 = 2112;
    v83 = v12;
    __int16 v84 = 2112;
    v85 = v14;
    __int16 v86 = 2112;
    v87 = v19;
    _os_log_impl(&dword_259147000, v11, OS_LOG_TYPE_INFO, "generatePromptSuggestionWithTemplate, input context string: %@, contact meta data, %@, location meta data, %@, time meta data, %@", buf, 0x2Au);

    id v9 = v17;
    __int16 v10 = v16;
    id v8 = v15;
  }
  if ([v7 contentType])
  {
    uint64_t v20 = [v8 associatedContacts];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      uint64_t v22 = [v8 associatedContacts];
      long long v23 = [v22 firstObject];
      long long v24 = [v23 contactName];

      if ((([v24 hasSuffix:@"s"] & 1) != 0
         || [v24 hasSuffix:@"S"])
        && ([v10 textString],
            id v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = [v25 containsString:@"Taylor's"],
            v25,
            v26))
      {
        long long v27 = [v10 textString];
        id v28 = [v24 stringByAppendingString:@"'"];
        id v29 = [v27 stringByReplacingOccurrencesOfString:@"Taylor's" withString:v28];

        [v10 setTextString:v29];
        v30 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
LABEL_12:
        }
          +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:].cold.8();
      }
      else
      {
        v31 = [v10 textString];
        int v32 = [v31 containsString:@"Taylor"];

        if (!v32)
        {
LABEL_14:

          goto LABEL_15;
        }
        v33 = [v10 textString];
        id v29 = [v33 stringByReplacingOccurrencesOfString:@"Taylor" withString:v24];

        [v10 setTextString:v29];
        v30 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_12;
        }
      }

      goto LABEL_14;
    }
  }
LABEL_15:
  if (([v7 contentType] & 4) == 0) {
    goto LABEL_22;
  }
  uint64_t v34 = [v8 associatedLocations];
  if ([v34 count])
  {
    uint64_t v35 = [v10 textString];
    int v36 = [v35 containsString:@"placeName"];

    if (!v36) {
      goto LABEL_22;
    }
    id v37 = [v8 associatedLocations];
    v38 = [v37 firstObject];
    uint64_t v34 = [v38 place];

    v39 = [v10 textString];
    v40 = [v39 stringByReplacingOccurrencesOfString:@"placeName" withString:v34];

    [v10 setTextString:v40];
    v41 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:].cold.7();
    }
  }
LABEL_22:
  if (([v7 contentType] & 8) == 0) {
    goto LABEL_29;
  }
  v42 = [v8 associatedLocations];
  if ([v42 count])
  {
    v43 = [v10 textString];
    int v44 = [v43 containsString:@"cityName"];

    if (!v44) {
      goto LABEL_29;
    }
    v45 = [v8 associatedLocations];
    v46 = [v45 firstObject];
    v42 = [v46 city];

    v47 = [v10 textString];
    v48 = [v47 stringByReplacingOccurrencesOfString:@"cityName" withString:v42];

    [v10 setTextString:v48];
    v49 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:].cold.6();
    }
  }
LABEL_29:
  if (([v7 contentType] & 0x4000) != 0)
  {
    v50 = [v8 associatedTime];
    if (![v50 count])
    {
LABEL_35:

      goto LABEL_36;
    }
    v51 = [v10 textString];
    int v52 = [v51 containsString:@"timeReference"];

    if (v52)
    {
      v53 = [v8 associatedTime];
      v54 = [v53 firstObject];
      v50 = [v54 timeReferenceString];

      v55 = [v10 textString];
      v56 = [v55 stringByReplacingOccurrencesOfString:@"timeReference" withString:v50];

      [v10 setTextString:v56];
      v57 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:].cold.5();
      }

      goto LABEL_35;
    }
  }
LABEL_36:
  if ([v9 appendMusicString])
  {
    v58 = [v8 associatedMusic];
    uint64_t v59 = [v58 count];

    if (v59)
    {
      v60 = [v8 associatedMusic];
      uint64_t v61 = [v60 count];

      if (v61 == 1)
      {
        v62 = [v10 textString];
        v63 = [v8 associatedMusic];
        [v63 firstObject];
      }
      else
      {
        v64 = [v8 associatedMusic];
        signed int v65 = arc4random_uniform([v64 count]);

        v62 = [v10 textString];
        v63 = [v8 associatedMusic];
        [v63 objectAtIndexedSubscript:v65];
      v66 = };
      v67 = [v66 musicString];
      v68 = [v62 stringByAppendingString:v67];
      [v10 setTextString:v68];
    }
  }
  v69 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:].cold.4();
  }

  v70 = [v10 textString];
  int v71 = [v70 containsString:@"placeName"];

  if (v71)
  {
    v72 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:]();
    }
LABEL_53:

    id v77 = 0;
    goto LABEL_54;
  }
  v73 = [v10 textString];
  int v74 = [v73 containsString:@"cityName"];

  if (v74)
  {
    v72 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:]();
    }
    goto LABEL_53;
  }
  v75 = [v10 textString];
  int v76 = [v75 containsString:@"timeReference"];

  if (v76)
  {
    v72 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      +[MOPersonalizedSensingServiceManager generatePromptSuggestionWithTemplate:context:options:]();
    }
    goto LABEL_53;
  }
  id v77 = v10;
LABEL_54:

  return v77;
}

- (void)refreshMomentsContextWithReply:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *))a3;
  if (+[MOPlatformInfo isIpad])
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    uint64_t v22 = @"Refresh is not supported on iPad";
    id v6 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v7 = v5;
    uint64_t v8 = 263;
LABEL_12:
    uint64_t v13 = [v7 errorWithDomain:@"MOContextErrorDomain" code:v8 userInfo:v6];
    v4[2](v4, v13);
    goto LABEL_13;
  }
  id v9 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v9, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,refreshMomentsContext", buf, 2u);
  }

  if (!self->_isGMSAvailable)
  {
    char v14 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259147000, v14, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,refreshMomentsContext, generative models unavailable, do nothing", buf, 2u);
    }

    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08320];
    v24[0] = @"Personalized Sensing unavailable";
    id v6 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v7 = v15;
    uint64_t v8 = 1287;
    goto LABEL_12;
  }
  connection = self->_connection;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __70__MOPersonalizedSensingServiceManager_refreshMomentsContextWithReply___block_invoke;
  v18[3] = &unk_2654489A0;
  uint64_t v11 = v4;
  uint64_t v19 = v11;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
  dispatch_time_t v12 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259147000, v12, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling refreshMomentsContext", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__MOPersonalizedSensingServiceManager_refreshMomentsContextWithReply___block_invoke_90;
  v16[3] = &unk_2654489A0;
  id v17 = v11;
  [v6 refreshMomentsContextWithReply:v16];

  uint64_t v13 = v19;
LABEL_13:
}

void __70__MOPersonalizedSensingServiceManager_refreshMomentsContextWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__MOPersonalizedSensingServiceManager_refreshMomentsContextWithReply___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__MOPersonalizedSensingServiceManager_refreshMomentsContextWithReply___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isGMSAvailable
{
  return self->_isGMSAvailable;
}

- (void)setIsGMSAvailable:(BOOL)a3
{
  self->_isGMSAvailable = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)handleDbAccessRenewalTask:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_259147000, v0, v1, "Failed to record MOCheckpointAssertionTaskCompleted Checkpoint, error: %@", v2, v3, v4, v5, v6);
}

+ (void)handleDbAccessRenewalTask:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)handleDbAccessRenewalTask:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_259147000, log, OS_LOG_TYPE_ERROR, "Task timed out. Unable to renew access token for DB", v1, 2u);
}

+ (void)handleDbAccessRenewalTask:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_259147000, v0, v1, "Failed to record MOCheckpointAssertionTaskStarted Checkpoint, error: %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_259147000, v0, v1, "fail to replace place name placeholder for context string  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_259147000, v0, v1, "fail to replace city name placeholder for context string  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_259147000, v0, v1, "fail to replace time reference placeholder for context string  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_259147000, v0, v1, "generatePromptSuggestionWithTemplate, output prompt string  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_259147000, v0, v1, "generatePromptSuggestionWithTemplate, replace time reference,  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_259147000, v0, v1, "generatePromptSuggestionWithTemplate, replace city name,  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_259147000, v0, v1, "generatePromptSuggestionWithTemplate, replace place name,  %@", v2, v3, v4, v5, v6);
}

+ (void)generatePromptSuggestionWithTemplate:context:options:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_259147000, v0, v1, "generatePromptSuggestionWithTemplate, replace person name,  %@", v2, v3, v4, v5, v6);
}

void __70__MOPersonalizedSensingServiceManager_refreshMomentsContextWithReply___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 code];
  uint64_t v5 = [a1 domain];
  uint8_t v6 = [a1 localizedDescription];
  int v7 = 134349571;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  __int16 v10 = v5;
  __int16 v11 = 2113;
  dispatch_time_t v12 = v6;
  _os_log_error_impl(&dword_259147000, a2, OS_LOG_TYPE_ERROR, "PersonalizedSensingServiceManager,refreshMomentsContext,XPCService asynchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\"", (uint8_t *)&v7, 0x20u);
}

@end