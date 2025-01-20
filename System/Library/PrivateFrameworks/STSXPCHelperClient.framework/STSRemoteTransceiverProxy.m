@interface STSRemoteTransceiverProxy
- (NSXPCConnection)xpc;
- (STSRemoteTransceiverProxy)initWithListenerEndpoint:(id)a3;
- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)transceive:(id)a3 outError:(id *)a4;
- (void)dealloc;
- (void)setXpc:(id)a3;
@end

@implementation STSRemoteTransceiverProxy

- (STSRemoteTransceiverProxy)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxy initWithListenerEndpoint:]", 24, self, @"endpoint=%@", v5, v6, (uint64_t)v4);
  v21.receiver = self;
  v21.super_class = (Class)STSRemoteTransceiverProxy;
  v7 = [(STSRemoteTransceiverProxy *)&v21 init];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v10 = objc_msgSend_initWithListenerEndpoint_(v8, v9, (uint64_t)v4);
    xpc = v7->_xpc;
    v7->_xpc = (NSXPCConnection *)v10;

    v13 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v12, (uint64_t)&unk_26C55DFE8);
    objc_msgSend_setRemoteObjectInterface_(v7->_xpc, v14, (uint64_t)v13);

    objc_msgSend_setExportedObject_(v7->_xpc, v15, (uint64_t)v7);
    objc_msgSend_setInterruptionHandler_(v7->_xpc, v16, (uint64_t)&unk_26C558C30);
    objc_msgSend_setInvalidationHandler_(v7->_xpc, v17, (uint64_t)&unk_26C558CB0);
    objc_msgSend_resume(v7->_xpc, v18, v19);
  }

  return v7;
}

- (void)dealloc
{
  id v4 = objc_msgSend_xpc(self, a2, v2);
  objc_msgSend_invalidate(v4, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)STSRemoteTransceiverProxy;
  [(STSRemoteTransceiverProxy *)&v7 dealloc];
}

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_2146CF904;
  v27 = sub_2146CF914;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_2146CF904;
  objc_super v21 = sub_2146CF914;
  id v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2146CF91C;
  v16[3] = &unk_264217920;
  v16[4] = self;
  v16[5] = &v23;
  id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)v16);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2146CF994;
  v15[3] = &unk_264217C60;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend_transceive_completion_(v8, v9, (uint64_t)v6, v15);

  if (v24[5])
  {
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxy transceive:outError:]", 64, self, @"error=%@", v10, v11, v24[5]);
    v12 = (void *)v24[5];
  }
  else
  {
    v12 = 0;
  }
  *a4 = v12;
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v13;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_xpc(self, v5, v6);
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_xpc(self, v5, v6);
  v9 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v4);

  return v9;
}

- (NSXPCConnection)xpc
{
  return self->_xpc;
}

- (void)setXpc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end