@interface SPRPINController
- (BOOL)addDigitWithValue:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)capturePINWithParameters:(id)a3 error:(id *)a4;
- (BOOL)removeLastDigitAndReturnError:(id *)a3;
- (BOOL)updateParameters:(id)a3 error:(id *)a4;
- (BOOL)verifyWithPINToken:(id)a3 error:(id *)a4;
- (id)generatePINBlockAndReturnError:(id *)a3;
- (void)cancelPINCapture;
@end

@implementation SPRPINController

- (BOOL)capturePINWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_22124F298;
  v31 = sub_22124F2A8;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_22124F298;
  v25 = sub_22124F2A8;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_22124F2B0;
  v20[3] = &unk_26459CAD0;
  v20[4] = &v27;
  v11 = objc_msgSend_syncProxyWithErrorHandler_(self, v7, (uint64_t)v20, v8, v9, v10);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_22124F2C0;
  v19[3] = &unk_26459CAF8;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend_capturePINWithParameters_reply_(v11, v12, (uint64_t)v6, (uint64_t)v19, v13, v14);

  v15 = (void *)v22[5];
  if (v15) {
    objc_storeStrong((id *)&self->_pinCrypto, v15);
  }
  if (a4)
  {
    v16 = (void *)v28[5];
    if (v16) {
      *a4 = v16;
    }
  }
  BOOL v17 = v22[5] != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (BOOL)addDigitWithValue:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v7 = a3;
  uint64_t v52 = 0;
  v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_22124F298;
  v56 = sub_22124F2A8;
  id v57 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v9 = objc_msgSend_xpcClient(SPRLogger, a2, a3, (uint64_t)a4, v4, v5);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v16 = objc_msgSend_xpcClient(SPRLogger, v11, v12, v13, v14, v15);
  BOOL v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_221247000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v10, "add digit client", "begin add digit client", buf, 2u);
  }

  if (v7 >= 0xA)
  {
    uint64_t v22 = objc_msgSend_errorWithCode_(SPRError, v18, 11005, v19, v20, v21);
LABEL_10:
    id v25 = v53[5];
    v53[5] = (id)v22;
    goto LABEL_11;
  }
  pinCrypto = self->_pinCrypto;
  if (!pinCrypto)
  {
    uint64_t v22 = objc_msgSend_errorWithCode_reason_(SPRError, v18, 11006, @"no capture", v20, v21);
    goto LABEL_10;
  }
  v24 = v53;
  id obj = v53[5];
  objc_msgSend_encryptDigit_error_(pinCrypto, v18, v7, (uint64_t)&obj, v20, v21);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v24 + 5, obj);
  if (v25)
  {
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = sub_22124F6CC;
    v45[3] = &unk_26459CAD0;
    v45[4] = &v52;
    v30 = objc_msgSend_syncProxyWithErrorHandler_(self, v26, (uint64_t)v45, v27, v28, v29);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = sub_22124F6DC;
    v44[3] = &unk_26459CB20;
    v44[4] = &v48;
    v44[5] = &v52;
    objc_msgSend_addDigitWithCipher_reply_(v30, v31, (uint64_t)v25, (uint64_t)v44, v32, v33);
  }
LABEL_11:

  v39 = objc_msgSend_xpcClient(SPRLogger, v34, v35, v36, v37, v38);
  v40 = v39;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_221247000, v40, OS_SIGNPOST_INTERVAL_END, v10, "add digit client", "end add digit client", buf, 2u);
  }

  if (a4)
  {
    id v41 = v53[5];
    if (v41) {
      *a4 = v41;
    }
  }
  char v42 = *((unsigned char *)v49 + 24);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v42;
}

- (BOOL)removeLastDigitAndReturnError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_22124F298;
  id v25 = sub_22124F2A8;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_22124F898;
  v16[3] = &unk_26459CAD0;
  v16[4] = &v21;
  uint64_t v7 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v16, v3, v4, v5);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22124F8A8;
  v15[3] = &unk_26459CB20;
  v15[4] = &v17;
  v15[5] = &v21;
  objc_msgSend_removeLastDigitWithReply_(v7, v8, (uint64_t)v15, v9, v10, v11);

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

- (id)generatePINBlockAndReturnError:(id *)a3
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_22124F298;
  uint64_t v29 = sub_22124F2A8;
  id v30 = 0;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_22124F298;
  uint64_t v23 = sub_22124F2A8;
  id v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_22124FACC;
  v18[3] = &unk_26459CAD0;
  v18[4] = &v25;
  uint64_t v8 = objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v18, v3, v4, v5);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_22124FADC;
  v17[3] = &unk_26459CB48;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_generatePINBlockWithReply_(v8, v9, (uint64_t)v17, v10, v11, v12);

  if (v20[5])
  {
    pinCrypto = self->_pinCrypto;
    self->_pinCrypto = 0;
  }
  if (a3)
  {
    uint64_t v14 = (void *)v26[5];
    if (v14) {
      *a3 = v14;
    }
  }
  id v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (void)cancelPINCapture
{
  pinCrypto = self->_pinCrypto;
  self->_pinCrypto = 0;

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22124FC0C;
  v13[3] = &unk_26459CB70;
  v13[4] = self;
  uint64_t v8 = objc_msgSend_syncProxyWithErrorHandler_(self, v4, (uint64_t)v13, v5, v6, v7);
  objc_msgSend_cancelPINCaptureWithReply_(v8, v9, (uint64_t)&unk_26D31D7C8, v10, v11, v12);
}

- (BOOL)updateParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_22124F298;
  uint64_t v28 = sub_22124F2A8;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_22124FE34;
  v19[3] = &unk_26459CAD0;
  v19[4] = &v24;
  uint64_t v11 = objc_msgSend_syncProxyWithErrorHandler_(self, v7, (uint64_t)v19, v8, v9, v10);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_22124FE44;
  v18[3] = &unk_26459CB20;
  v18[4] = &v20;
  void v18[5] = &v24;
  objc_msgSend_updateParameters_reply_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13, v14);

  if (a4)
  {
    id v15 = (void *)v25[5];
    if (v15) {
      *a4 = v15;
    }
  }
  char v16 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

- (BOOL)verifyWithPINToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_22124F298;
  uint64_t v28 = sub_22124F2A8;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_221250020;
  v19[3] = &unk_26459CAD0;
  v19[4] = &v24;
  uint64_t v11 = objc_msgSend_syncProxyWithErrorHandler_(self, v7, (uint64_t)v19, v8, v9, v10);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221250030;
  v18[3] = &unk_26459CB20;
  v18[4] = &v20;
  void v18[5] = &v24;
  objc_msgSend_verifyWithPINToken_reply_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13, v14);

  if (a4)
  {
    id v15 = (void *)v25[5];
    if (v15) {
      *a4 = v15;
    }
  }
  char v16 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

- (void).cxx_destruct
{
}

@end