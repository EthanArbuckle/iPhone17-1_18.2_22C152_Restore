@interface SEMXPCClient
+ (void)initialize;
- (NSString)clientId;
- (NSXPCConnection)connection;
- (SEMXPCClient)init;
- (SEMXPCClient)initWithServiceProtocol:(id)a3 machServiceName:(id)a4 clientId:(id)a5 interruptionCode:(unsigned __int16)a6 invalidationCode:(unsigned __int16)a7;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_failureHandlerWithResponse:(unsigned __int16)a3;
- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4;
- (unsigned)failureCode;
- (unsigned)interruptionCode;
- (void)dealloc;
- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4;
- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)setConnection:(id)a3;
- (void)setFailureCode:(unsigned __int16)a3;
@end

@implementation SEMXPCClient

- (SEMXPCClient)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMXPCClient)initWithServiceProtocol:(id)a3 machServiceName:(id)a4 clientId:(id)a5 interruptionCode:(unsigned __int16)a6 invalidationCode:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = a6;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v45.receiver = self;
  v45.super_class = (Class)SEMXPCClient;
  v15 = [(SEMXPCClient *)&v45 init];
  p_isa = (void **)&v15->super.isa;
  if (v15)
  {
    v15->_failureCode = 0;
    v15->_interruptionCode = v8;
    objc_storeStrong((id *)&v15->_clientId, a5);
    id v17 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v19 = objc_msgSend_initWithMachServiceName_options_(v17, v18, (uint64_t)v13, 0);
    v20 = p_isa[2];
    p_isa[2] = (void *)v19;

    if (!p_isa[2]
      || (objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v21, (uint64_t)v12, v22),
          (uint64_t v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v43 = 0;
      goto LABEL_9;
    }
    v26 = (void *)v23;
    objc_msgSend_setRemoteObjectInterface_(p_isa[2], v24, v23, v25);
    v27 = p_isa[2];
    v30 = objc_msgSend__failureHandlerWithResponse_(p_isa, v28, v8, v29);
    objc_msgSend_setInterruptionHandler_(v27, v31, (uint64_t)v30, v32);

    v33 = p_isa[2];
    v36 = objc_msgSend__failureHandlerWithResponse_(p_isa, v34, v7, v35);
    objc_msgSend_setInvalidationHandler_(v33, v37, (uint64_t)v36, v38);

    v39 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[SEMXPCClient initWithServiceProtocol:machServiceName:clientId:interruptionCode:invalidationCode:]";
      __int16 v48 = 2112;
      id v49 = v14;
      _os_log_impl(&dword_25C7CA000, v39, OS_LOG_TYPE_INFO, "%s Client %@ connecting to XPC service", buf, 0x16u);
    }
    objc_msgSend_resume(p_isa[2], v40, v41, v42);
  }
  v43 = p_isa;
LABEL_9:

  return v43;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v3;
    v11 = objc_msgSend_clientId(self, v8, v9, v10);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[SEMXPCClient dealloc]";
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_debug_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_DEBUG, "%s Invalidating XPC connection for client %@", buf, 0x16u);
  }
  objc_msgSend_invalidate(self->_connection, v4, v5, v6);
  v12.receiver = self;
  v12.super_class = (Class)SEMXPCClient;
  [(SEMXPCClient *)&v12 dealloc];
}

- (id)_failureHandlerWithResponse:(unsigned __int16)a3
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_25C81F938;
  v6[3] = &unk_2654DEFC8;
  objc_copyWeak(&v7, &location);
  unsigned __int16 v8 = a3;
  v4 = (void *)MEMORY[0x2611949C0](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_25C81FB38;
  v8[3] = &unk_2654DEFF0;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x2611949C0](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  unsigned __int16 v8 = (void (**)(id, void *, id))a5;
  id v10 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, v6, (uint64_t)v11);
  if (v10) {
    v8[2](v8, v10, v11);
  }
}

- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, id))a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_25C81FE04;
  v13[3] = &unk_2654DDED0;
  id v10 = v8;
  id v14 = v10;
  objc_super v12 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, (uint64_t)v13);
  if (v12) {
    v9[2](v9, v12, v10);
  }
}

- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, id))a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_25C81FF00;
  v13[3] = &unk_2654DDED0;
  id v10 = v8;
  id v14 = v10;
  objc_super v12 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, (uint64_t)v13);
  if (v12) {
    v9[2](v9, v12, v10);
  }
}

- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_25C81FFF8;
  v11[3] = &unk_2654DDED0;
  id v8 = v6;
  id v12 = v8;
  id v10 = objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, 1, (uint64_t)v11);
  if (v10) {
    v7[2](v7, v10, v8);
  }
}

- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v9 = objc_msgSend__errorHandlerWithCompletion_(self, v7, (uint64_t)v6, v8);
  id v13 = objc_msgSend_connection(self, v10, v11, v12);
  v16 = v13;
  if (v4) {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v13, v14, (uint64_t)v9, v15);
  }
  else {
  uint64_t v17 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v13, v14, (uint64_t)v9, v15);
  }

  if (v6 && !v17)
  {
    uint64_t v21 = objc_msgSend_failureCode(self, v18, v19, v20);
    v6[2](v6, v21);
  }

  return v17;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (unsigned)failureCode
{
  return self->_failureCode;
}

- (void)setFailureCode:(unsigned __int16)a3
{
  self->_failureCode = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (unsigned)interruptionCode
{
  return self->_interruptionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end