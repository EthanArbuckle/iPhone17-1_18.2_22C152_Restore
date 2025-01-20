@interface SPCoreParsecInterface
+ (id)getSharedInstance;
+ (id)sharedFeedbackListener;
+ (void)initialize;
+ (void)setSharedFeedbackListener:(id)a3;
- (BOOL)parsecEnabled;
- (OS_dispatch_queue)sharedQueue;
- (PRSSearchSession)searchSession;
- (SPCoreParsecInterface)init;
- (double)gSessionStartTime;
- (id)getFeedbackListener;
- (int64_t)sessionOnceToken;
- (void)activate:(double)a3;
- (void)deactivate;
- (void)dealloc;
- (void)setGSessionStartTime:(double)a3;
- (void)setParsecEnabled:(BOOL)a3;
- (void)setParsecFeedbackAllowed:(BOOL)a3;
- (void)setParsecState:(BOOL)a3;
- (void)setSearchSession:(id)a3;
- (void)setSessionOnceToken:(int64_t)a3;
- (void)setSharedQueue:(id)a3;
- (void)setupSearchSession;
@end

@implementation SPCoreParsecInterface

+ (void)initialize
{
}

+ (id)getSharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!getSharedInstance_interface)
  {
    v3 = objc_alloc_init(SPCoreParsecInterface);
    v4 = (void *)getSharedInstance_interface;
    getSharedInstance_interface = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)getSharedInstance_interface;

  return v5;
}

+ (void)setSharedFeedbackListener:(id)a3
{
}

+ (id)sharedFeedbackListener
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!gSharedFeedbackListener)
  {
    v3 = +[SPCoreParsecInterface getSharedInstance];
    uint64_t v4 = [v3 getFeedbackListener];
    v5 = (void *)gSharedFeedbackListener;
    gSharedFeedbackListener = v4;
  }
  objc_sync_exit(v2);

  v6 = (void *)gSharedFeedbackListener;

  return v6;
}

- (void)setupSearchSession
{
  obj = self;
  objc_sync_enter(obj);
  id v2 = obj;
  if (!obj->_parsecEnabled) {
    goto LABEL_3;
  }
  v3 = [(SPCoreParsecInterface *)obj searchSession];

  id v2 = obj;
  if (v3) {
    goto LABEL_3;
  }
  id v4 = objc_alloc(MEMORY[0x263F78D60]);
  v5 = [(SPCoreParsecInterface *)obj sharedQueue];
  v6 = (void *)[v4 initWithClient:obj clientQueue:v5];
  [(SPCoreParsecInterface *)obj setSearchSession:v6];

  v7 = [(SPCoreParsecInterface *)obj searchSession];

  id v2 = obj;
  if (v7)
  {
    v8 = [(SPCoreParsecInterface *)obj searchSession];
    v9 = [v8 listener];
    [(SPSearchParsecFeedbackProxy *)obj->_listener setListener:v9];

    +[SPSearchFeedbackSender synchronizedBlock:&__block_literal_global_3];
    objc_sync_exit(obj);

    +[SPSearchFeedbackSender updateFeedbackListeners];
  }
  else
  {
LABEL_3:
    objc_sync_exit(v2);
  }
}

void __43__SPCoreParsecInterface_setupSearchSession__block_invoke()
{
  id v0 = +[SPCoreParsecInterface getSharedInstance];
  [v0 setParsecFeedbackAllowed:_parsecFeedbackAllowed];
}

- (void)setParsecFeedbackAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    int v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl(&dword_21E5D7000, v5, v6, "[FEEDBACK-DEBUG] (SPCoreParsecInterface setParsecFeedbackAllowed) allowed: %d, ", (uint8_t *)&v16, 8u);
  }

  v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = [(SPCoreParsecInterface *)self searchSession];
    int v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_21E5D7000, v7, v8, "[FEEDBACK-DEBUG] (SPCoreParsecInterface setParsecFeedbackAllowed) self.session: %@, ", (uint8_t *)&v16, 0xCu);
  }
  v10 = self;
  objc_sync_enter(v10);
  v11 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "allowed";
    if (!v3) {
      v12 = "forbidden";
    }
    int v16 = 136315138;
    v17 = v12;
    _os_log_impl(&dword_21E5D7000, v11, OS_LOG_TYPE_DEFAULT, "Parsec feedback %s", (uint8_t *)&v16, 0xCu);
  }

  xpc_object_t v13 = xpc_BOOL_create(v3);
  v14 = one_member_dict("allowed", v13);
  analytics_send_event();

  _parsecFeedbackAllowed = v3;
  v15 = [(SPCoreParsecInterface *)v10 searchSession];
  [v15 setParsecFeedbackAllowed:_parsecFeedbackAllowed];

  objc_sync_exit(v10);
  +[SPSearchFeedbackSender updateFeedbackListeners];
}

- (id)getFeedbackListener
{
  if (self->_parsecEnabled)
  {
    int64_t sessionOnceToken = self->_sessionOnceToken;
    p_int64_t sessionOnceToken = &self->_sessionOnceToken;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __44__SPCoreParsecInterface_getFeedbackListener__block_invoke;
    v20 = &unk_2644B2A50;
    v21 = self;
    if (sessionOnceToken != -1) {
      dispatch_once(p_sessionOnceToken, &block);
    }
    v5 = [(SPCoreParsecInterface *)self searchSession];

    if (!v5)
    {
      [(SPCoreParsecInterface *)self setupSearchSession];
      os_log_type_t v6 = [(SPCoreParsecInterface *)self searchSession];
      [(id)client setSession:v6];
    }
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __44__SPCoreParsecInterface_getFeedbackListener__block_invoke_2;
    v15 = &unk_2644B2A50;
    int v16 = self;
    if (getFeedbackListener_onceToken != -1) {
      dispatch_once(&getFeedbackListener_onceToken, &v12);
    }
    v7 = self->_listener;
    os_log_type_t v8 = [(SPCoreParsecInterface *)self searchSession];
    xpc_object_t v9 = xpc_BOOL_create(v8 != 0);

    v10 = one_member_dict("parsecPresent", v9);
    analytics_send_event();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __44__SPCoreParsecInterface_getFeedbackListener__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(QueryController);
  BOOL v3 = (void *)client;
  client = (uint64_t)v2;

  id v4 = objc_alloc(MEMORY[0x263F78D60]);
  uint64_t v5 = client;
  os_log_type_t v6 = [*(id *)(a1 + 32) sharedQueue];
  v7 = (void *)[v4 initWithClient:v5 clientQueue:v6];
  [*(id *)(a1 + 32) setSearchSession:v7];

  id v8 = [*(id *)(a1 + 32) searchSession];
  [(id)client setSession:v8];
}

uint64_t __44__SPCoreParsecInterface_getFeedbackListener__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(SPSearchParsecFeedbackProxy);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) searchSession];
  os_log_type_t v6 = [v5 listener];
  [*(id *)(*(void *)(a1 + 32) + 8) setListener:v6];

  v7 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v7, "setInterface:");
}

- (SPCoreParsecInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPCoreParsecInterface;
  id v2 = [(SPCoreParsecInterface *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Shared parsec queue", 0);
    sharedQueue = v2->_sharedQueue;
    v2->_sharedQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SPCoreParsecInterface;
  [(SPCoreParsecInterface *)&v2 dealloc];
}

- (void)setParsecState:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (void)activate:(double)a3
{
  int64_t sessionOnceToken = self->_sessionOnceToken;
  p_int64_t sessionOnceToken = &self->_sessionOnceToken;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SPCoreParsecInterface_activate___block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  if (sessionOnceToken != -1) {
    dispatch_once(p_sessionOnceToken, block);
  }
  v7 = [(SPCoreParsecInterface *)self searchSession];

  if (!v7)
  {
    [(SPCoreParsecInterface *)self setupSearchSession];
    id v8 = [(SPCoreParsecInterface *)self searchSession];
    [(id)client setSession:v8];
  }
  self->_gSessionStartTime = a3;
  [(PRSSearchSession *)self->_searchSession setSessionStartTime:a3];
  [(PRSSearchSession *)self->_searchSession activate];
}

void __34__SPCoreParsecInterface_activate___block_invoke(uint64_t a1)
{
  objc_super v2 = objc_alloc_init(QueryController);
  dispatch_queue_t v3 = (void *)client;
  client = (uint64_t)v2;

  id v4 = objc_alloc(MEMORY[0x263F78D60]);
  uint64_t v5 = client;
  objc_super v6 = [*(id *)(a1 + 32) sharedQueue];
  v7 = (void *)[v4 initWithClient:v5 clientQueue:v6];
  [*(id *)(a1 + 32) setSearchSession:v7];

  id v8 = [*(id *)(a1 + 32) searchSession];
  [(id)client setSession:v8];
}

- (void)deactivate
{
}

- (PRSSearchSession)searchSession
{
  return (PRSSearchSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchSession:(id)a3
{
}

- (BOOL)parsecEnabled
{
  return self->_parsecEnabled;
}

- (void)setParsecEnabled:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (OS_dispatch_queue)sharedQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedQueue:(id)a3
{
}

- (double)gSessionStartTime
{
  return self->_gSessionStartTime;
}

- (void)setGSessionStartTime:(double)a3
{
  self->_gSessionStartTime = a3;
}

- (int64_t)sessionOnceToken
{
  return self->_sessionOnceToken;
}

- (void)setSessionOnceToken:(int64_t)a3
{
  self->_int64_t sessionOnceToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end