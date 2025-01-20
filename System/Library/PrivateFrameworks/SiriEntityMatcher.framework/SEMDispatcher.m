@interface SEMDispatcher
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SEMDispatcher)init;
- (SEMDispatcher)initWithIndexSiteManager:(id)a3 indexSiteCache:(id)a4 settings:(id)a5 queue:(id)a6;
- (id)administrator;
- (void)handleSetChangeBatch:(id)a3;
- (void)handleSettingsChange;
- (void)handleXPCEvent:(id)a3;
- (void)indexSiteAvailableWithType:(unsigned __int8)a3;
- (void)runMaintenanceWithShouldDefer:(id)a3;
- (void)setupXPCListeners;
@end

@implementation SEMDispatcher

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7ECE44;
  block[3] = &unk_2654DE1F8;
  block[4] = a1;
  if (qword_26B354A18 != -1) {
    dispatch_once(&qword_26B354A18, block);
  }
  v2 = (void *)qword_26B354A20;
  return v2;
}

- (SEMDispatcher)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMDispatcher)initWithIndexSiteManager:(id)a3 indexSiteCache:(id)a4 settings:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SEMDispatcher;
  v15 = [(SEMDispatcher *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_indexSiteManager, a3);
    objc_storeStrong((id *)&v16->_indexSiteCache, a4);
    objc_storeStrong((id *)&v16->_settings, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (void)setupXPCListeners
{
  if (!self->_adminServiceListener)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D88]);
    v6 = (NSXPCListener *)objc_msgSend_initWithMachServiceName_(v3, v4, @"com.apple.siri.inference.EntityMatcher.admin", v5);
    adminServiceListener = self->_adminServiceListener;
    self->_adminServiceListener = v6;

    objc_msgSend_setDelegate_(self->_adminServiceListener, v8, (uint64_t)self, v9);
    objc_msgSend_resume(self->_adminServiceListener, v10, v11, v12);
  }
  if (!self->_setChangeListener)
  {
    id v13 = objc_alloc(MEMORY[0x263F31788]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_25C7ED200;
    v17[3] = &unk_2654DE220;
    v17[4] = self;
    v15 = (CCSetChangeXPCListener *)objc_msgSend_initWithIdentifier_batchHandlerBlock_queue_useCase_(v13, v14, @"com.apple.siri.inference.EntityMatcher", (uint64_t)v17, self->_queue, 0x2709E3830);
    setChangeListener = self->_setChangeListener;
    self->_setChangeListener = v15;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
  id v9 = a4;
  if (self->_adminServiceListener == v6)
  {
    char ShouldAcceptNewConnection = objc_msgSend__adminServiceShouldAcceptNewConnection_(self, v7, (uint64_t)v9, v8);
  }
  else
  {
    v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[SEMDispatcher listener:shouldAcceptNewConnection:]";
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Unrecognized listener passed to delegate: %@", (uint8_t *)&v13, 0x16u);
    }
    char ShouldAcceptNewConnection = 0;
  }

  return ShouldAcceptNewConnection;
}

- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_valueForEntitlement_(v4, v5, @"com.apple.siri.inference.EntityMatcher.admin", v6);

  if (v7)
  {
    v10 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v8, (uint64_t)&unk_2709EB6B0, v9);
    objc_msgSend_setExportedInterface_(v4, v11, (uint64_t)v10, v12);

    int v13 = [SEMAdminConnection alloc];
    __int16 v15 = objc_msgSend_initWithSettings_indexSiteManager_queue_(v13, v14, (uint64_t)self->_settings, (uint64_t)self->_indexSiteManager, self->_queue);
    objc_msgSend_setExportedObject_(v4, v16, (uint64_t)v15, v17);

    objc_msgSend_resume(v4, v18, v19, v20);
    v21 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      int v32 = 136315394;
      v33 = "-[SEMDispatcher _adminServiceShouldAcceptNewConnection:]";
      __int16 v34 = 1024;
      int v35 = objc_msgSend_processIdentifier(v4, v23, v24, v25);
      v26 = "%s New connection established to process with pid=(%d)";
LABEL_6:
      _os_log_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v32, 0x12u);
    }
  }
  else
  {
    v27 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      v22 = v27;
      int v32 = 136315394;
      v33 = "-[SEMDispatcher _adminServiceShouldAcceptNewConnection:]";
      __int16 v34 = 1024;
      int v35 = objc_msgSend_processIdentifier(v4, v28, v29, v30);
      v26 = "%s Connecting process with pid=(%d) is not entitled for admin service - rejecting connection.";
      goto LABEL_6;
    }
  }

  return v7 != 0;
}

- (void)runMaintenanceWithShouldDefer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  int isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v6, v7, v8);
  v10 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v13 = @"Running";
    if (isEvaluationEnabled) {
      int v13 = @"Evaluation enabled. Ignoring";
    }
    int v14 = 136315394;
    __int16 v15 = "-[SEMDispatcher runMaintenanceWithShouldDefer:]";
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s %@ Maintenance", (uint8_t *)&v14, 0x16u);
  }
  if ((isEvaluationEnabled & 1) == 0) {
    objc_msgSend_performMaintenance_(self->_indexSiteManager, v11, (uint64_t)v4, v12);
  }
}

- (void)handleSettingsChange
{
  id v6 = (id)os_transaction_create();
  objc_msgSend_handleSettingsChange(self->_indexSiteManager, v3, v4, v5);
}

- (void)handleXPCEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSString;
  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x263EF86C8]);
  objc_msgSend_stringWithUTF8String_(v4, v6, (uint64_t)string, v7);
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(NSString, v9, @"sem_handling_event:%@", v10, v8);
  id v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_cStringUsingEncoding_(v11, v12, 4, v13);
  int v14 = (void *)os_transaction_create();
  if ((objc_msgSend_isEqualToString_(v8, v15, *MEMORY[0x263F282D8], v16) & 1) != 0
    || objc_msgSend_isEqualToString_(v8, v17, *MEMORY[0x263F28760], v19))
  {
    int isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v17, v18, v19);
    v21 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = @"Handling";
      *(_DWORD *)buf = 136315650;
      v31 = "-[SEMDispatcher handleXPCEvent:]";
      __int16 v32 = 2112;
      if (isEvaluationEnabled) {
        uint64_t v25 = @"Evaluation enabled. Ignoring";
      }
      v33 = v25;
      __int16 v34 = 2112;
      int v35 = v8;
      _os_log_impl(&dword_25C7CA000, v21, OS_LOG_TYPE_INFO, "%s %@ settings change notification: %@", buf, 0x20u);
    }
    if ((isEvaluationEnabled & 1) == 0) {
      objc_msgSend_handleSettingsChange(self, v22, v23, v24);
    }
  }
  else if (objc_msgSend_isEqual_(v8, v17, @"com.apple.sysdiagnose.sysdiagnoseStarted", v19))
  {
    v26 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SEMDispatcher handleXPCEvent:]";
      __int16 v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_INFO, "%s Handling sysdiagnose started notification: %@", buf, 0x16u);
    }
    objc_msgSend_handleSysdiagnoseStarted(self->_indexSiteManager, v27, v28, v29);
  }
}

- (void)handleSetChangeBatch:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  int isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v6, v7, v8);
  uint64_t v10 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v14 = @"Handling";
    int v19 = 136315650;
    uint64_t v20 = "-[SEMDispatcher handleSetChangeBatch:]";
    __int16 v21 = 2112;
    if (isEvaluationEnabled) {
      int v14 = @"Evaluation enabled. Ignoring";
    }
    v22 = v14;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s %@ Cascade change notification for sets: %@", (uint8_t *)&v19, 0x20u);
  }
  if ((isEvaluationEnabled & 1) == 0)
  {
    indexSiteManager = self->_indexSiteManager;
    uint64_t v16 = objc_msgSend_allObjects(v4, v11, v12, v13);
    objc_msgSend_handleUpdatedSets_(indexSiteManager, v17, (uint64_t)v16, v18);
  }
}

- (id)administrator
{
  id v3 = [SEMAdministrator alloc];
  id v4 = [SEMAdminConnection alloc];
  id v6 = objc_msgSend_initWithSettings_indexSiteManager_queue_(v4, v5, (uint64_t)self->_settings, (uint64_t)self->_indexSiteManager, self->_queue);
  uint64_t v8 = objc_msgSend_initWithAdminService_timeout_queue_(v3, v7, (uint64_t)v6, (uint64_t)self->_queue, 30.0);

  return v8;
}

- (void)indexSiteAvailableWithType:(unsigned __int8)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_25C7EDA90;
  v4[3] = &unk_2654DE248;
  unsigned __int8 v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setChangeListener, 0);
  objc_storeStrong((id *)&self->_adminServiceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSiteCache, 0);
  objc_storeStrong((id *)&self->_indexSiteManager, 0);
}

@end