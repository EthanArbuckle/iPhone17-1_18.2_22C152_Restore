@interface SPRObject
- (NSString)proxyDescription;
- (NSXPCProxyCreating)connection;
- (SPRObject)initWithConnector:(id)a3;
- (id)asyncProxyWithErrorHandler:(id)a3;
- (id)connectAndReturnError:(id *)a3;
- (id)connectionWithErrorHandler:(id)a3;
- (id)mapXPCConnectionError:(id)a3;
- (id)syncProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SPRObject

- (SPRObject)initWithConnector:(id)a3
{
  v4 = (void *)MEMORY[0x223C7D4D0](a3, a2);
  id connector = self->_connector;
  self->_id connector = v4;

  connection = self->_connection;
  self->_connection = 0;

  return self;
}

- (void)dealloc
{
  if (self->_connection)
  {
    objc_msgSend_xpcClient(SPRLogger, a2, v2, v3, v4, v5);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_22127D4D8(self, v7, v8, v9, v10, v11);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SPRObject;
  [(SPRObject *)&v12 dealloc];
}

- (NSString)proxyDescription
{
  uint64_t v2 = objc_opt_class();
  uint64_t v8 = objc_msgSend_description(v2, v3, v4, v5, v6, v7);
  objc_super v12 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v8, v9, @"SPR", @"Remote", v10, v11);

  return (NSString *)v12;
}

- (id)connectAndReturnError:(id *)a3
{
  connection = self->_connection;
  if (!connection)
  {
    (*((void (**)(void))self->_connector + 2))();
    uint64_t v5 = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_connection;
    self->_connection = v5;

    connection = self->_connection;
  }
  if (connection) {
    uint64_t v7 = self;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_connectionWithErrorHandler_(self, v5, (uint64_t)v4, v6, v7, v8);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_22125A1C8;
  v17[3] = &unk_26459D308;
  v17[4] = self;
  id v18 = v4;
  id v10 = v4;
  v15 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v17, v12, v13, v14);

  return v15;
}

- (id)asyncProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_connectionWithErrorHandler_(self, v5, (uint64_t)v4, v6, v7, v8);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_22125A2FC;
  v17[3] = &unk_26459D308;
  v17[4] = self;
  id v18 = v4;
  id v10 = v4;
  v15 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v17, v12, v13, v14);

  return v15;
}

- (id)mapXPCConnectionError:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v10 = objc_msgSend_domain(v4, v5, v6, v7, v8, v9);
  int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x263F07F70], v12, v13, v14);

  if (isEqualToString && (objc_msgSend_code(v4, v16, v17, v18, v19, v20) | 2) == 0x1003)
  {
    v21 = self;
    objc_sync_enter(v21);
    if (v21->_connection)
    {
      v27 = objc_msgSend_xpcClient(SPRLogger, v22, v23, v24, v25, v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = objc_msgSend_proxyDescription(v21, v28, v29, v30, v31, v32);
        sub_22127D5E0(v33, v53, v27);
      }

      connection = v21->_connection;
      v21->_connection = 0;

      objc_msgSend_onDisconnect(v21, v35, v36, v37, v38, v39);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v40, @"SoftPosReader", 14001, 0, v41);
    }
    else
    {
      v43 = objc_msgSend_xpcClient(SPRLogger, v22, v23, v24, v25, v26);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v49 = objc_msgSend_proxyDescription(v21, v44, v45, v46, v47, v48);
        sub_22127D588(v49, v53, v43);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v50, @"SoftPosReader", 14002, 0, v51);
    }
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v21);
  }
  else
  {
    id v42 = v4;
  }

  return v42;
}

- (id)connectionWithErrorHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  connection = v5->_connection;
  if (!connection)
  {
    for (uint64_t i = 1; ; ++i)
    {
      uint64_t v8 = (*((void (**)(void))v5->_connector + 2))();
      id v9 = 0;
      id v10 = v5->_connection;
      v5->_connection = (NSXPCProxyCreating *)v8;

      if (v5->_connection) {
        break;
      }
      if (i == 3)
      {
        v4[2](v4, v9);
        goto LABEL_10;
      }
      objc_msgSend_sleepForTimeInterval_(MEMORY[0x263F08B88], v11, v12, v13, v14, v15, (double)i * 0.1);
    }
    v16 = objc_msgSend_xpcClient(SPRLogger, v11, v12, v13, v14, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend_proxyDescription(v5, v17, v18, v19, v20, v21);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v22;
      _os_log_impl(&dword_221247000, v16, OS_LOG_TYPE_INFO, "%@ connected", buf, 0xCu);
    }
LABEL_10:

    connection = v5->_connection;
  }
  uint64_t v23 = connection;
  objc_sync_exit(v5);

  return v23;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  connection = obj->_connection;
  obj->_connection = 0;

  objc_msgSend_onDisconnect(obj, v3, v4, v5, v6, v7);
  objc_sync_exit(obj);
}

- (NSXPCProxyCreating)connection
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_connector, 0);
}

@end