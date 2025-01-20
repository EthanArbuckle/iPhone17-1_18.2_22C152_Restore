@interface ORReader
- (BOOL)cancelProvisionAndReturnError:(id *)a3;
- (ORProvisionDelegate)delegate;
- (ORReader)initWithConnector:(id)a3;
- (id)checkStatusWithError:(id *)a3;
- (void)checkStatusWithCompletion:(id)a3;
- (void)provisionCardWithParameters:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ORReader

- (ORReader)initWithConnector:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ORReader;
  v3 = [(SPRObject *)&v7 initWithConnector:a3];
  if (v3)
  {
    uint64_t v4 = dispatch_get_global_queue(25, 0);
    relayQueue = v3->_relayQueue;
    v3->_relayQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)provisionCardWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_221252AC4;
  v20[3] = &unk_26459CC38;
  v20[4] = self;
  id v7 = v6;
  id v21 = v7;
  id v8 = a3;
  v13 = objc_msgSend_asyncProxyWithErrorHandler_(self, v9, (uint64_t)v20, v10, v11, v12);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221252B9C;
  v18[3] = &unk_26459CE48;
  v18[4] = self;
  id v19 = v7;
  id v15 = v7;
  objc_msgSend_provisionCardWithParameters_delegate_reply_(v13, v16, (uint64_t)v8, (uint64_t)WeakRetained, (uint64_t)v18, v17);
}

- (BOOL)cancelProvisionAndReturnError:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_221252E30;
  v25 = sub_221252E40;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221252E48;
  v16[3] = &unk_26459CAD0;
  v16[4] = &v21;
  id v7 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v16, v3, v4, v5);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_221252E58;
  v15[3] = &unk_26459CB20;
  v15[4] = &v17;
  v15[5] = &v21;
  objc_msgSend_cancelProvisionWithReply_(v7, v8, (uint64_t)v15, v9, v10, v11);

  if (a3)
  {
    uint64_t v12 = (void *)v22[5];
    if (v12) {
      *a3 = v12;
    }
  }
  char v13 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)checkStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221252F8C;
  v18[3] = &unk_26459CC38;
  v18[4] = self;
  id v5 = v4;
  id v19 = v5;
  uint64_t v10 = objc_msgSend_asyncProxyWithErrorHandler_(self, v6, (uint64_t)v18, v7, v8, v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221253064;
  v16[3] = &unk_26459CE70;
  v16[4] = self;
  id v17 = v5;
  id v11 = v5;
  objc_msgSend_checkStatusWithReply_(v10, v12, (uint64_t)v16, v13, v14, v15);
}

- (id)checkStatusWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_221252E30;
  v27 = sub_221252E40;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = sub_221252E30;
  uint64_t v21 = sub_221252E40;
  id v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_22125333C;
  v16[3] = &unk_26459CAD0;
  v16[4] = &v23;
  uint64_t v7 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v16, v3, v4, v5);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22125334C;
  v15[3] = &unk_26459CE98;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend_checkStatusWithReply_(v7, v8, (uint64_t)v15, v9, v10, v11);

  if (a3)
  {
    uint64_t v12 = (void *)v24[5];
    if (v12) {
      *a3 = v12;
    }
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (ORProvisionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ORProvisionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relayQueue, 0);
}

@end