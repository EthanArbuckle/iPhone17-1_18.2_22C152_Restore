@interface SPRReader
- (BOOL)cancelReadAndReturnError:(id *)a3;
- (BOOL)cancelReadWithCallback:(id)a3 error:(id *)a4;
- (BOOL)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 activationId:(id)a5 trxCount:(int64_t)a6 error:(id *)a7;
- (BOOL)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 trxCount:(int64_t)a5 error:(id *)a6;
- (BOOL)validateWithReadParameters:(id)a3 error:(id *)a4;
- (SPRReader)initWithConnector:(id)a3;
- (id)generateSecureReaderBlobWithTrxBlob:(id)a3 pinBlob:(id)a4 error:(id *)a5;
- (id)getCardReaderBlobWithTxnBlob:(id)a3;
- (id)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 activationId:(id)a5 mid:(id)a6 partnerId:(id)a7 virtualTerminalId:(id)a8 error:(id *)a9;
- (id)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 mid:(id)a5 partnerId:(id)a6 virtualTerminalId:(id)a7 error:(id *)a8;
- (void)cancelReadWithCallback:(id)a3;
- (void)readCardWithParameter:(id)a3 callback:(id)a4;
- (void)readCardWithParameter:(id)a3 delegate:(id)a4 completion:(id)a5;
@end

@implementation SPRReader

- (SPRReader)initWithConnector:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SPRReader;
  v3 = [(SPRObject *)&v7 initWithConnector:a3];
  if (v3)
  {
    uint64_t v4 = dispatch_get_global_queue(25, 0);
    relayQueue = v3->_relayQueue;
    v3->_relayQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (BOOL)validateWithReadParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_221255C80;
  v28 = sub_221255C90;
  id v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_221255C98;
  v19[3] = &unk_26459CAD0;
  v19[4] = &v24;
  v11 = objc_msgSend_syncProxyWithErrorHandler_(self, v7, (uint64_t)v19, v8, v9, v10);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221255CA8;
  v18[3] = &unk_26459CB20;
  v18[4] = &v20;
  v18[5] = &v24;
  objc_msgSend_validateWithReadParameters_reply_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13, v14);

  if (a4)
  {
    v15 = (void *)v25[5];
    if (v15) {
      *a4 = v15;
    }
  }
  char v16 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

- (void)readCardWithParameter:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [SPRReadRelay alloc];
  v12 = objc_msgSend_initWithBase_queue_(v8, v9, (uint64_t)v6, (uint64_t)self->_relayQueue, v10, v11);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_221255E2C;
  v24[3] = &unk_26459CCD8;
  v24[4] = self;
  id v13 = v6;
  id v25 = v13;
  v18 = objc_msgSend_asyncProxyWithErrorHandler_(self, v14, (uint64_t)v24, v15, v16, v17);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_221255EF8;
  v22[3] = &unk_26459D1B0;
  v22[4] = self;
  id v23 = v13;
  id v19 = v13;
  objc_msgSend_readCardWithParameter_delegate_reply_(v18, v20, (uint64_t)v7, (uint64_t)v12, (uint64_t)v22, v21);
}

- (void)readCardWithParameter:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_221256140;
  v22[3] = &unk_26459CC38;
  v22[4] = self;
  id v9 = v8;
  id v23 = v9;
  id v10 = a4;
  id v11 = a3;
  uint64_t v16 = objc_msgSend_asyncProxyWithErrorHandler_(self, v12, (uint64_t)v22, v13, v14, v15);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_221256218;
  v20[3] = &unk_26459D1D8;
  v20[4] = self;
  id v21 = v9;
  id v17 = v9;
  objc_msgSend_readCardWithParameter_delegate_reply_(v16, v18, (uint64_t)v11, (uint64_t)v10, (uint64_t)v20, v19);
}

- (BOOL)cancelReadAndReturnError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_221255C80;
  id v25 = sub_221255C90;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2212564AC;
  v16[3] = &unk_26459CAD0;
  v16[4] = &v21;
  id v7 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v16, v3, v4, v5);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2212564BC;
  v15[3] = &unk_26459CB20;
  v15[4] = &v17;
  v15[5] = &v21;
  objc_msgSend_cancelReadWithReply_(v7, v8, (uint64_t)v15, v9, v10, v11);

  if (a3)
  {
    v12 = (void *)v22[5];
    if (v12) {
      *a3 = v12;
    }
  }
  char v13 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)generateSecureReaderBlobWithTrxBlob:(id)a3 pinBlob:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_221255C80;
  v32 = sub_221255C90;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_221255C80;
  id v26 = sub_221255C90;
  id v27 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2212566F0;
  v21[3] = &unk_26459CAD0;
  v21[4] = &v22;
  uint64_t v14 = objc_msgSend_syncProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_221256700;
  v20[3] = &unk_26459D200;
  v20[4] = &v28;
  void v20[5] = &v22;
  objc_msgSend_generateSecureReaderBlobWithTrxBlob_pinBlob_reply_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v20, v16);

  if (a5)
  {
    uint64_t v17 = (void *)v23[5];
    if (v17) {
      *a5 = v17;
    }
  }
  id v18 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v18;
}

- (id)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 activationId:(id)a5 mid:(id)a6 partnerId:(id)a7 virtualTerminalId:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_221255C80;
  v42 = sub_221255C90;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_221255C80;
  v36 = sub_221255C90;
  id v37 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_2212569F0;
  v31[3] = &unk_26459CAD0;
  v31[4] = &v32;
  id v25 = objc_msgSend_syncProxyWithErrorHandler_(self, v21, (uint64_t)v31, v22, v23, v24);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_221256A00;
  v30[3] = &unk_26459D200;
  v30[4] = &v38;
  v30[5] = &v32;
  objc_msgSend_getStoreAndForwardResultsBlobWithTrxHashes_sessionId_activationId_mid_partnerId_virtualTerminalId_reply_(v25, v26, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, v19, v20, v30);

  if (a9)
  {
    id v27 = (void *)v33[5];
    if (v27) {
      *a9 = v27;
    }
  }
  id v28 = (id)v39[5];
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v28;
}

- (BOOL)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 activationId:(id)a5 trxCount:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_221255C80;
  uint64_t v34 = sub_221255C90;
  id v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_221256C80;
  v25[3] = &unk_26459CAD0;
  v25[4] = &v30;
  id v19 = objc_msgSend_syncProxyWithErrorHandler_(self, v15, (uint64_t)v25, v16, v17, v18);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_221256C90;
  v24[3] = &unk_26459CB20;
  v24[4] = &v26;
  void v24[5] = &v30;
  objc_msgSend_validateStoreAndForwardResultsToken_sessionId_activationId_trxCount_reply_(v19, v20, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, a6, v24);

  if (a7)
  {
    uint64_t v21 = (void *)v31[5];
    if (v21) {
      *a7 = v21;
    }
  }
  char v22 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

- (id)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 mid:(id)a5 partnerId:(id)a6 virtualTerminalId:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_221255C80;
  uint64_t v40 = sub_221255C90;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_221255C80;
  uint64_t v34 = sub_221255C90;
  id v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_221256F0C;
  v29[3] = &unk_26459CAD0;
  v29[4] = &v30;
  uint64_t v23 = objc_msgSend_syncProxyWithErrorHandler_(self, v19, (uint64_t)v29, v20, v21, v22);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_221256F1C;
  v28[3] = &unk_26459D200;
  v28[4] = &v36;
  v28[5] = &v30;
  objc_msgSend_getStoreAndForwardResultsBlobWithTrxHashes_sessionId_activationId_mid_partnerId_virtualTerminalId_reply_(v23, v24, (uint64_t)v14, (uint64_t)v15, @"00000000-0000-0000-0000-000000000000", (uint64_t)v16, v17, v18, v28);

  if (a8)
  {
    id v25 = (void *)v31[5];
    if (v25) {
      *a8 = v25;
    }
  }
  id v26 = (id)v37[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v26;
}

- (BOOL)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 trxCount:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_221255C80;
  v31 = sub_221255C90;
  id v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_221257188;
  v22[3] = &unk_26459CAD0;
  v22[4] = &v27;
  id v16 = objc_msgSend_syncProxyWithErrorHandler_(self, v12, (uint64_t)v22, v13, v14, v15);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_221257198;
  v21[3] = &unk_26459CB20;
  v21[4] = &v23;
  void v21[5] = &v27;
  objc_msgSend_validateStoreAndForwardResultsToken_sessionId_activationId_trxCount_reply_(v16, v17, (uint64_t)v10, (uint64_t)v11, @"00000000-0000-0000-0000-000000000000", a5, v21);

  if (a6)
  {
    id v18 = (void *)v28[5];
    if (v18) {
      *a6 = v18;
    }
  }
  char v19 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v19;
}

- (id)getCardReaderBlobWithTxnBlob:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_221255C80;
  uint64_t v21 = sub_221255C90;
  uint64_t v22 = &stru_26D31DBA0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221257340;
  v16[3] = &unk_26459CB70;
  v16[4] = self;
  id v9 = objc_msgSend_syncProxyWithErrorHandler_(self, v5, (uint64_t)v16, v6, v7, v8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2212573AC;
  v15[3] = &unk_26459D228;
  v15[4] = &v17;
  objc_msgSend_getCardReaderBlobWithTxnBlob_reply_(v9, v10, (uint64_t)v4, (uint64_t)v15, v11, v12);

  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

- (void)cancelReadWithCallback:(id)a3
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2212574A4;
  v14[3] = &unk_26459CB70;
  v14[4] = self;
  id v4 = a3;
  id v9 = objc_msgSend_asyncProxyWithErrorHandler_(self, v5, (uint64_t)v14, v6, v7, v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_221257510;
  v13[3] = &unk_26459CB70;
  v13[4] = self;
  objc_msgSend_cancelReadWithCallback_reply_(v9, v10, (uint64_t)v4, (uint64_t)v13, v11, v12);
}

- (BOOL)cancelReadWithCallback:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_221255C80;
  id v33 = sub_221255C90;
  id v34 = 0;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v7 = [SPRReadRelay alloc];
  uint64_t v11 = objc_msgSend_initWithBase_queue_(v7, v8, (uint64_t)v6, (uint64_t)self->_relayQueue, v9, v10);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_221257768;
  v24[3] = &unk_26459CAD0;
  v24[4] = &v29;
  id v16 = objc_msgSend_syncProxyWithErrorHandler_(self, v12, (uint64_t)v24, v13, v14, v15);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_221257778;
  v23[3] = &unk_26459CB20;
  v23[4] = &v25;
  v23[5] = &v29;
  objc_msgSend_cancelReadWithCallback_reply_(v16, v17, (uint64_t)v11, (uint64_t)v23, v18, v19);

  if (a4)
  {
    uint64_t v20 = (void *)v30[5];
    if (v20) {
      *a4 = v20;
    }
  }
  char v21 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (void).cxx_destruct
{
}

@end