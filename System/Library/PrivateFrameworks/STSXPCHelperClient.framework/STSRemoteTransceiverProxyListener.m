@interface STSRemoteTransceiverProxyListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)dealloc;
- (void)transceive:(id)a3 completion:(id)a4;
@end

@implementation STSRemoteTransceiverProxyListener

- (void)dealloc
{
  v3 = self;
  if (self) {
    self = (STSRemoteTransceiverProxyListener *)self->_xpcListener;
  }
  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = v3;
  v4.super_class = (Class)STSRemoteTransceiverProxyListener;
  [(STSRemoteTransceiverProxyListener *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_processIdentifier(v7, v8, v9);
  sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]", 74, self, @"Accepting new connection from pid %d", v11, v12, v10);
  if (!self || !self->_disableEntitlements)
  {
    v14 = sub_2146D2EF8([STSXPCHelperClientEntitlementChecker alloc], v7);
    v17 = v14;
    if (!v14 || !v14[8])
    {
      sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]", 80, self, @"Missing xpcHelperClientTransceiveProxyListenerAccess entitlement", v15, v16, v31);

      BOOL v29 = 0;
      goto LABEL_11;
    }
  }
  v18 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v13, (uint64_t)&unk_26C55DFE8);
  objc_msgSend_setExportedInterface_(v7, v19, (uint64_t)v18);

  if (self) {
    objc_msgSend_addObject_(self->_xpcConnections, v20, (uint64_t)v7);
  }
  else {
    objc_msgSend_addObject_(0, v20, (uint64_t)v7);
  }
  objc_msgSend_setExportedObject_(v7, v21, (uint64_t)self);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_2146CFFD0;
  v35[3] = &unk_264217C88;
  v35[4] = self;
  objc_copyWeak(&v36, &from);
  objc_copyWeak(&v37, &location);
  objc_msgSend_setInvalidationHandler_(v7, v22, (uint64_t)v35);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_2146D0078;
  v32[3] = &unk_264217C88;
  v32[4] = self;
  objc_copyWeak(&v33, &from);
  objc_copyWeak(&v34, &location);
  objc_msgSend_setInterruptionHandler_(v7, v23, (uint64_t)v32);
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v25 = workQueue;
  objc_msgSend__setQueue_(v7, v26, (uint64_t)v25);

  objc_msgSend_resume(v7, v27, v28);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  BOOL v29 = 1;
LABEL_11:

  return v29;
}

- (void)transceive:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v9 = (void (**)(id, void *, id))a4;
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0)
  {
    uint64_t v12 = WeakRetained;
    id v19 = 0;
    v13 = objc_msgSend_transceiveWithData_outError_(WeakRetained, v11, (uint64_t)v6, &v19);
    id v14 = v19;
    v9[2](v9, v13, v14);
  }
  else
  {
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener transceive:completion:]", 125, self, @"Invalid state", v7, v8, (uint64_t)v19);
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = off_26781B010;
    v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v21, &v20, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, @"STSXPCHelperErrorDomain", 2, v17);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end