@interface SPRConfigurator
- (SPRConfigurator)initWithConnector:(id)a3;
- (id)installWithToken:(id)a3 error:(id *)a4;
- (id)installWithToken:(id)a3 force:(BOOL)a4 error:(id *)a5;
- (id)prepare:(id *)a3;
- (id)prepareAndReturnError:(id *)a3;
- (id)prepareAndWarnAndReturnError:(id *)a3;
- (id)prepareAndWarnWithForce:(BOOL)a3 error:(id *)a4;
- (id)prepareAndWarnWithToken:(id)a3 force:(BOOL)a4 enableStoreAndForward:(BOOL)a5 error:(id *)a6;
- (id)prepareWithForce:(BOOL)a3 error:(id *)a4;
- (id)statusAndReturnError:(id *)a3;
- (id)statusWithToken:(id)a3 error:(id *)a4;
- (id)statusWithToken:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (void)installAsyncWithToken:(id)a3 callback:(id)a4;
- (void)installAsyncWithToken:(id)a3 force:(BOOL)a4 callback:(id)a5;
- (void)installWithToken:(id)a3 force:(BOOL)a4 delegate:(id)a5 completion:(id)a6;
@end

@implementation SPRConfigurator

- (SPRConfigurator)initWithConnector:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SPRConfigurator;
  v3 = [(SPRObject *)&v8 initWithConnector:a3];
  if (v3)
  {
    uint64_t v4 = dispatch_get_global_queue(25, 0);
    relayQueue = v3->_relayQueue;
    v3->_relayQueue = (OS_dispatch_queue *)v4;

    tokenKey = v3->_tokenKey;
    v3->_tokenKey = (NSString *)@"token";
  }
  return v3;
}

- (id)prepare:(id *)a3
{
  v7 = objc_msgSend_prepareAndWarnAndReturnError_(self, a2, (uint64_t)a3, v3, v4, v5);
  v12 = v7;
  if (v7)
  {
    v13 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)self->_tokenKey, v9, v10, v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareAndReturnError:(id *)a3
{
  v7 = objc_msgSend_prepareAndWarnAndReturnError_(self, a2, (uint64_t)a3, v3, v4, v5);
  v12 = v7;
  if (v7)
  {
    v13 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)self->_tokenKey, v9, v10, v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareAndWarnAndReturnError:(id *)a3
{
  return (id)objc_msgSend_prepareAndWarnWithForce_error_(self, a2, 0, (uint64_t)a3, v3, v4);
}

- (id)prepareWithForce:(BOOL)a3 error:(id *)a4
{
  v7 = objc_msgSend_prepareAndWarnWithForce_error_(self, a2, a3, (uint64_t)a4, v4, v5);
  v12 = v7;
  if (v7)
  {
    v13 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)self->_tokenKey, v9, v10, v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareAndWarnWithForce:(BOOL)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_prepareAndWarnWithToken_force_enableStoreAndForward_error_, 0, a3, 0, a4);
}

- (id)prepareAndWarnWithToken:(id)a3 force:(BOOL)a4 enableStoreAndForward:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_2212518A8;
  v32 = sub_2212518B8;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_2212518A8;
  v26 = sub_2212518B8;
  id v27 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2212518C0;
  v21[3] = &unk_26459CAD0;
  v21[4] = &v28;
  v15 = objc_msgSend_syncProxyWithErrorHandler_(self, v11, (uint64_t)v21, v12, v13, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2212518D0;
  v20[3] = &unk_26459CBC0;
  v20[4] = &v22;
  v20[5] = &v28;
  objc_msgSend_prepareAndWarnWithToken_force_enableStoreAndForward_reply_(v15, v16, (uint64_t)v10, v8, v7, (uint64_t)v20);

  if (a6)
  {
    v17 = (void *)v29[5];
    if (v17) {
      *a6 = v17;
    }
  }
  id v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v18;
}

- (id)installWithToken:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(SPRConfigurator *, char *, id, void, id *))MEMORY[0x270F9A6D0])(self, sel_installWithToken_force_error_, a3, 0, a4);
}

- (id)installWithToken:(id)a3 force:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_2212518A8;
  uint64_t v30 = sub_2212518B8;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_2212518A8;
  uint64_t v24 = sub_2212518B8;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_221251B6C;
  v19[3] = &unk_26459CAD0;
  v19[4] = &v26;
  uint64_t v13 = objc_msgSend_syncProxyWithErrorHandler_(self, v9, (uint64_t)v19, v10, v11, v12);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221251B7C;
  v18[3] = &unk_26459CBE8;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend_installWithToken_force_delegate_reply_(v13, v14, (uint64_t)v8, v6, 0, (uint64_t)v18);

  if (a5)
  {
    v15 = (void *)v27[5];
    if (v15) {
      *a5 = v15;
    }
  }
  id v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (void)installWithToken:(id)a3 force:(BOOL)a4 delegate:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_221251D4C;
  v23[3] = &unk_26459CC38;
  v23[4] = self;
  id v11 = v10;
  id v24 = v11;
  id v12 = a5;
  id v13 = a3;
  id v18 = objc_msgSend_asyncProxyWithErrorHandler_(self, v14, (uint64_t)v23, v15, v16, v17);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_221251E24;
  v21[3] = &unk_26459CC88;
  v21[4] = self;
  id v22 = v11;
  id v19 = v11;
  objc_msgSend_installWithToken_force_delegate_reply_(v18, v20, (uint64_t)v13, v7, (uint64_t)v12, (uint64_t)v21);
}

- (void)installAsyncWithToken:(id)a3 callback:(id)a4
{
}

- (void)installAsyncWithToken:(id)a3 force:(BOOL)a4 callback:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [SPRInstallRelay alloc];
  uint64_t v14 = objc_msgSend_initWithBase_queue_(v10, v11, (uint64_t)v8, (uint64_t)self->_relayQueue, v12, v13);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_221252094;
  v25[3] = &unk_26459CCD8;
  v25[4] = self;
  id v15 = v8;
  id v26 = v15;
  uint64_t v20 = objc_msgSend_asyncProxyWithErrorHandler_(self, v16, (uint64_t)v25, v17, v18, v19);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_221252160;
  v23[3] = &unk_26459CD28;
  v23[4] = self;
  id v24 = v15;
  id v21 = v15;
  objc_msgSend_installWithToken_force_delegate_reply_(v20, v22, (uint64_t)v9, v5, (uint64_t)v14, (uint64_t)v23);
}

- (id)statusAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(SPRConfigurator *, char *, __CFString *, uint64_t, id *))MEMORY[0x270F9A6D0])(self, sel_statusWithToken_options_error_, &stru_26D31DBA0, 0x3FFFLL, a3);
}

- (id)statusWithToken:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(SPRConfigurator *, char *, id, uint64_t, id *))MEMORY[0x270F9A6D0])(self, sel_statusWithToken_options_error_, a3, 0x3FFFLL, a4);
}

- (id)statusWithToken:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_2212518A8;
  id v31 = sub_2212518B8;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_2212518A8;
  id v25 = sub_2212518B8;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_22125248C;
  v20[3] = &unk_26459CAD0;
  v20[4] = &v21;
  uint64_t v13 = objc_msgSend_syncProxyWithErrorHandler_(self, v9, (uint64_t)v20, v10, v11, v12);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_22125249C;
  v19[3] = &unk_26459CBC0;
  v19[4] = &v27;
  void v19[5] = &v21;
  objc_msgSend_statusWithToken_options_reply_(v13, v14, (uint64_t)v8, a4, (uint64_t)v19, v15);

  if (a5)
  {
    uint64_t v16 = (void *)v22[5];
    if (v16) {
      *a5 = v16;
    }
  }
  id v17 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenKey, 0);
  objc_storeStrong((id *)&self->_relayQueue, 0);
}

@end