@interface SPRMonitor
- (BOOL)signalWithEvent:(id)a3 error:(id *)a4;
- (BOOL)signalWithEvent:(unsigned __int16)a3 component:(unsigned __int8)a4 origin:(unsigned __int8)a5 details:(id)a6 error:(id *)a7;
- (BOOL)signalWithEvent:(unsigned __int16)a3 data:(id)a4 error:(id *)a5;
@end

@implementation SPRMonitor

- (BOOL)signalWithEvent:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)signalWithEvent:(unsigned __int16)a3 data:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, (uint64_t)a5, v5);

  if (a5 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)signalWithEvent:(unsigned __int16)a3 component:(unsigned __int8)a4 origin:(unsigned __int8)a5 details:(id)a6 error:(id *)a7
{
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_2212528B0;
  v32 = sub_2212528C0;
  id v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2212528C8;
  v23[3] = &unk_26459CAD0;
  v23[4] = &v28;
  v17 = objc_msgSend_syncProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15, v16);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2212528D8;
  v22[3] = &unk_26459CB20;
  v22[4] = &v24;
  v22[5] = &v28;
  objc_msgSend_signalWithEvent_component_origin_details_reply_(v17, v18, v10, v9, v8, (uint64_t)v12, v22);

  if (a7)
  {
    v19 = (void *)v29[5];
    if (v19) {
      *a7 = v19;
    }
  }
  char v20 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v20;
}

@end