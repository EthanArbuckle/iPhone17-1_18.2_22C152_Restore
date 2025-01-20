@interface SPRServiceClient
+ (SPRServiceClient)shared;
- (BOOL)abortAndReturnError:(id *)a3;
- (BOOL)jetsamAndReturnError:(id *)a3;
- (NSDate)buildDate;
- (SPRPrimer)sharedPrimer;
- (id)proxyDescription;
- (void)invalidate;
- (void)onDisconnect;
@end

@implementation SPRServiceClient

+ (SPRServiceClient)shared
{
  if (qword_267F494E0 != -1) {
    dispatch_once(&qword_267F494E0, &unk_26D31D7E8);
  }
  v2 = (void *)qword_267F494E8;
  return (SPRServiceClient *)v2;
}

- (NSDate)buildDate
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_221257F38;
  v17 = sub_221257F48;
  id v18 = 0;
  v5 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)&unk_26D31D908, v2, v3, v4);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_221257FAC;
  v12[3] = &unk_26459D2B8;
  v12[4] = &v13;
  objc_msgSend_copyBuildDateWithReply_(v5, v6, (uint64_t)v12, v7, v8, v9);

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSDate *)v10;
}

- (id)proxyDescription
{
  return @"XPC service";
}

- (SPRPrimer)sharedPrimer
{
  p_primerPredicate = &self->_primerPredicate;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22125806C;
  block[3] = &unk_26459CF58;
  block[4] = self;
  if (*p_primerPredicate != -1) {
    dispatch_once(p_primerPredicate, block);
  }
  return self->_sharedPrimer;
}

- (void)invalidate
{
  uint64_t v7 = objc_msgSend_connection(self, a2, v2, v3, v4, v5);
  objc_msgSend_invalidate(v7, v8, v9, v10, v11, v12);

  objc_msgSend_onDisconnect(self, v13, v14, v15, v16, v17);
}

- (BOOL)abortAndReturnError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_connection(self, a2, (uint64_t)a3, v3, v4, v5);
  int v14 = objc_msgSend_processIdentifier(v8, v9, v10, v11, v12, v13);

  v20 = objc_msgSend_xpcClient(SPRLogger, v15, v16, v17, v18, v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v38[0] = 67109120;
    v38[1] = v14;
    _os_log_impl(&dword_221247000, v20, OS_LOG_TYPE_INFO, "Terminating daemon (PID=%d) with SIGABRT...", (uint8_t *)v38, 8u);
  }

  int v26 = terminate_with_reason();
  if (v26)
  {
    if (a3)
    {
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08438];
      v29 = __error();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, v28, *v29, 0, v31);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend_onDisconnect(self, v21, v22, v23, v24, v25);
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x263F08B88], v32, v33, v34, v35, v36, 0.5);
  }
  return v26 == 0;
}

- (BOOL)jetsamAndReturnError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_connection(self, a2, (uint64_t)a3, v3, v4, v5);
  int v14 = objc_msgSend_processIdentifier(v8, v9, v10, v11, v12, v13);

  v20 = objc_msgSend_xpcClient(SPRLogger, v15, v16, v17, v18, v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v38[0] = 67109120;
    v38[1] = v14;
    _os_log_impl(&dword_221247000, v20, OS_LOG_TYPE_INFO, "Terminating daemon (PID=%d) with Jetsam...", (uint8_t *)v38, 8u);
  }

  int v26 = terminate_with_reason();
  if (v26)
  {
    if (a3)
    {
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08438];
      v29 = __error();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, v28, *v29, 0, v31);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend_onDisconnect(self, v21, v22, v23, v24, v25);
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x263F08B88], v32, v33, v34, v35, v36, 0.5);
  }
  return v26 == 0;
}

- (void)onDisconnect
{
  objc_msgSend_invalidate(self->_sharedPrimer, a2, v2, v3, v4, v5);
}

- (void).cxx_destruct
{
}

@end