id sub_2146C47E4(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t vars8;

  v2 = objc_msgSend_cborWithData_(MEMORY[0x263F2BEB8], a2, a1);
  v4 = objc_msgSend_cborWithInteger_(MEMORY[0x263F2BEB8], v3, 24);
  objc_msgSend_setTag_(v2, v5, (uint64_t)v4);

  return v2;
}

id sub_2146C4850(void *a1, const char *a2, uint64_t a3)
{
  v3 = (void *)MEMORY[0x263EFF8F8];
  v4 = objc_msgSend_cborEncodeToBstrCbor(a1, a2, a3);
  v6 = objc_msgSend_dataWithCBOR_(v3, v5, (uint64_t)v4);

  return v6;
}

id sub_2146C48AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_length(v3, v4, v5);
  uint64_t v10 = v6;
  if (!v6 || (v6 & 1) != 0)
  {
    sub_2146CEA3C(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(STSExtension) STS_dataFromHexString:]", 25, @"String is of invalid length=%ld", v7, v8, v9, v6);
    v31 = 0;
    goto LABEL_19;
  }
  id v11 = objc_alloc(MEMORY[0x263EFF990]);
  if (v10 >= 0) {
    v13 = objc_msgSend_initWithLength_(v11, v12, v10 >> 1);
  }
  else {
    v13 = objc_msgSend_initWithLength_(v11, v12, (v10 + 1) >> 1);
  }
  v17 = v13;
  if (!v13)
  {
    sub_2146CEA3C(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(STSExtension) STS_dataFromHexString:]", 31, @"Memory allocation request failed.", v14, v15, v16, v35);
LABEL_17:
    v31 = 0;
    goto LABEL_18;
  }
  id v18 = v13;
  v21 = (unsigned char *)objc_msgSend_mutableBytes(v18, v19, v20);
  id v22 = v3;
  v25 = (unsigned char *)objc_msgSend_UTF8String(v22, v23, v24);
  __str[2] = 0;
  unsigned int v28 = *v25;
  if (*v25)
  {
    v29 = v25 + 2;
    uint64_t v30 = MEMORY[0x263EF8318];
    v31 = 0;
    do
    {
      __str[0] = v28;
      uint64_t v32 = *(v29 - 1);
      __str[1] = *(v29 - 1);
      if ((v28 & 0x80) != 0) {
        goto LABEL_17;
      }
      if ((*(_DWORD *)(v30 + 4 * v28 + 60) & 0x10000) == 0 || (char)v32 < 0) {
        goto LABEL_18;
      }
      if ((*(_DWORD *)(v30 + 4 * v32 + 60) & 0x10000) == 0) {
        goto LABEL_17;
      }
      *v21++ = strtoul(__str, 0, 16);
      unsigned int v33 = *v29;
      v29 += 2;
      unsigned int v28 = v33;
    }
    while (v33);
  }
  v31 = objc_msgSend_copy(v18, v26, v27);
LABEL_18:

LABEL_19:

  return v31;
}

__CFString *sub_2146C4A28(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_length(a1, a2, a3);
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v7 = v4;
  uint64_t v8 = objc_msgSend_length(a1, v5, v6);
  uint64_t v9 = (char *)malloc_type_malloc((2 * v8) | 1, 0xDE05561AuLL);
  if (!v9)
  {
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[NSData(STSExtension) STS_asHexString]", 65, a1, @"Memory allocation request failed.", v10, v11, v22);
LABEL_7:
    uint64_t v20 = &stru_26C558D10;
    goto LABEL_8;
  }
  v12 = v9;
  v9[2 * v8] = 0;
  id v13 = a1;
  uint64_t v16 = (unsigned __int8 *)objc_msgSend_bytes(v13, v14, v15);
  v17 = v12;
  do
  {
    int v18 = *v16++;
    sprintf(v17, "%02X", v18);
    v17 += 2;
    --v7;
  }
  while (v7);
  objc_msgSend_stringWithUTF8String_(NSString, v19, (uint64_t)v12);
  uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  free(v12);
LABEL_8:

  return v20;
}

id sub_2146C4B3C(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF990]);
  uint64_t v5 = objc_msgSend_length(a1, v3, v4);
  id v7 = objc_msgSend_initWithLength_(v2, v6, v5);
  uint64_t v10 = (unsigned char *)objc_msgSend_mutableBytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(a1, v11, v12) - 1;
  if (v13 >= 0)
  {
    do
    {
      id v14 = a1;
      *v10++ = *(unsigned char *)(objc_msgSend_bytes(v14, v15, v16) + v13--);
    }
    while (v13 != -1);
  }

  return v7;
}

id sub_2146C90B0(uint64_t a1)
{
  id v2 = 0;
  uint64_t v3 = *MEMORY[0x263F07F70];
  int v4 = 2;
  while (1)
  {
    uint64_t v5 = v2;
    id v2 = (*(void (**)(uint64_t))(a1 + 16))(a1);

    if (!v2) {
      break;
    }
    uint64_t v8 = objc_msgSend_domain(v2, v6, v7);
    if (!objc_msgSend_isEqual_(v8, v9, v3))
    {

LABEL_11:
      id v14 = v2;
      break;
    }
    uint64_t v12 = objc_msgSend_code(v2, v10, v11);

    if (v12 != 4097 || v4-- == 0) {
      goto LABEL_11;
    }
  }

  return v2;
}

id sub_2146C9184(void *a1, const char *a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_2146C92F8;
  uint64_t v16 = sub_2146C9308;
  id v17 = 0;
  uint64_t v3 = (void *)a1[4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2146C9310;
  v11[3] = &unk_264217920;
  v11[4] = v3;
  v11[5] = &v12;
  int v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v11);
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2146C9388;
  v10[3] = &unk_264217948;
  v10[4] = &v12;
  objc_msgSend_startConnectionHandoverWithConfiguration_type_credentialType_callback_(v4, v7, v5, v6, 0, v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void sub_2146C92E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2146C92F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2146C9308(uint64_t a1)
{
}

void sub_2146C9310(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:]_block_invoke", 79, *(void **)(a1 + 32), @"XPC Error: %@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2146C9388(uint64_t a1, void *a2)
{
}

id sub_2146C94C8(uint64_t a1, const char *a2)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_2146C92F8;
  id v17 = sub_2146C9308;
  id v18 = 0;
  id v3 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2146C963C;
  v12[3] = &unk_264217920;
  v12[4] = v3;
  v12[5] = &v13;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v12);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2146C96B4;
  v11[3] = &unk_264217948;
  v11[4] = &v13;
  objc_msgSend_startConnectionHandoverWithConfiguration_type_credentialType_callback_(v4, v8, v5, v6, v7, v11);

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_2146C9624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146C963C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:credentialType:delegate:]_block_invoke_2", 105, *(void **)(a1 + 32), @"XPC Error: %@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2146C96B4(uint64_t a1, void *a2)
{
}

id sub_2146C97B8(uint64_t a1, const char *a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_2146C92F8;
  uint64_t v15 = sub_2146C9308;
  id v16 = 0;
  id v3 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2146C9928;
  v10[3] = &unk_264217920;
  v10[4] = v3;
  void v10[5] = &v11;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v10);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2146C99A0;
  v9[3] = &unk_264217948;
  v9[4] = &v11;
  objc_msgSend_connectNotificationListenerEndpoint_callback_(v4, v6, v5, v9);

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void sub_2146C9910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146C9928(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary connectToNotificationListener:]_block_invoke_2", 131, *(void **)(a1 + 32), @"XPC Error: %@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2146C99A0(uint64_t a1, void *a2)
{
}

void sub_2146C9B08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2146C9B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v19[1] = *MEMORY[0x263EF8340];
  HIWORD(v17) = 111;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary processUnifiedAccessStepupAPDU:callbackQueue:responseHandler:]_block_invoke", 157, *(void **)(a1 + 32), @"Not initialized", a7, a8, v17);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, (uint64_t)&v17 + 6, 2);
  uint64_t v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = *MEMORY[0x263F08320];
  v19[0] = @"Not initialized";
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v19, &v18, 1);
  id v16 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v15, @"STSXPCHelperErrorDomain", 2, v14);

  (*(void (**)(uint64_t, void *, void *, uint64_t))(v9 + 16))(v9, v11, v16, 1);
}

void sub_2146C9E40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2146C9F34;
    block[3] = &unk_2642179E8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2146C9F34(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_2146C9F4C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary processConnectionHandoverRequest:callbackQueue:responseHandler:]_block_invoke_3", 192, v3, @"XPC Error: %@", v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2146C9FD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2146CA1C8(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_2146CA2D0;
    v10[3] = &unk_264217A88;
    id v13 = *(id *)(a1 + 40);
    id v11 = v7;
    char v14 = a3;
    id v12 = v8;
    dispatch_async(v9, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2146CA2D0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

void sub_2146CA2EC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary processConnectionHandoverRequestData:callbackQueue:responseHandler:]_block_invoke_3", 226, v3, @"XPC Error: %@", v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2146CA374(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2146CA550(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2146CA644;
    block[3] = &unk_2642179E8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2146CA644(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_2146CA65C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary generateConnectionHandoverRequestWithQueue:responseHandler:]_block_invoke_3", 256, v3, @"XPC Error: %@", v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2146CA6E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2146CA8BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2146CA9B0;
    block[3] = &unk_2642179E8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2146CA9B0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_2146CA9C8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary generateQRCodeCHRequestAndStartACWithQueue:responseHandler:]_block_invoke_3", 278, v3, @"XPC Error: %@", v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2146CAA4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2146CAC3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2146CAD0C;
    v5[3] = &unk_264217B50;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2146CAD0C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_2146CAD20(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:]_block_invoke_3", 305, v3, @"XPC Error: %@", v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2146CADA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2146CAF90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2146CB060;
    v5[3] = &unk_264217B50;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2146CB060(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_2146CB074(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary connectRemoteWithQRCodeHandoverData:callbackQueue:responseHandler:]_block_invoke_3", 327, v3, @"XPC Error: %@", v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2146CB0F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_2146CB298(uint64_t a1, const char *a2)
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_2146C92F8;
  v19 = sub_2146C9308;
  id v20 = 0;
  id v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2146CB3E4;
  v14[3] = &unk_264217920;
  v14[4] = v3;
  v14[5] = &v15;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v14);
  objc_msgSend_seProxyListener(*(void **)(a1 + 32), v5, v6);
  id v7 = (void **)objc_claimAutoreleasedReturnValue();
  id v10 = sub_2146CFCB8(v7, v8, v9);
  objc_msgSend_transferSEProxyWithXPCEndpoint_(v4, v11, (uint64_t)v10);

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_2146CB3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146CB3E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startSEProxyListener:parameters:workQueue:]_block_invoke_2", 363, *(void **)(a1 + 32), @"XPC Error: %@", v4, v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2146CBA60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2146CBBB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_2146CBBD0(uint64_t a1, const char *a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_2146C92F8;
  id v12 = sub_2146C9308;
  id v13 = 0;
  id v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2146CBCEC;
  v7[3] = &unk_264217920;
  v7[4] = v2;
  v7[5] = &v8;
  id v3 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v2, a2, (uint64_t)v7);
  objc_msgSend_invalidateWithCompletion_(v3, v4, (uint64_t)&unk_26C558BF0);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_2146CBCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146CBCEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary invalidate]_block_invoke_2", 458, *(void **)(a1 + 32), @"XPC Error: %@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2146CBD64()
{
  v0 = sub_2146CEB08();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_2146C3000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Invalidate STSXPCHeler", (const char *)&unk_2146D6623, v1, 2u);
  }
}

void sub_2146CBF34(_Unwind_Exception *exception_object)
{
}

void sub_2146CC0A4(_Unwind_Exception *exception_object)
{
}

void sub_2146CC258(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2146CC288(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_2146C3000, "STSHelperLibrary xpcInvalidated", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v2, &v8);
  os_activity_scope_leave(&v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = objc_msgSend_xpc(WeakRetained, v4, v5);
  objc_msgSend_didInvalidateXPC_connection_(WeakRetained, v7, 1, v6);
}

void sub_2146CC31C(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_2146C3000, "STSHelperLibrary xpcInterrupted", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v2, &v8);
  os_activity_scope_leave(&v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = objc_msgSend_xpc(WeakRetained, v4, v5);
  objc_msgSend_didInvalidateXPC_connection_(WeakRetained, v7, 0, v6);
}

void sub_2146CC4C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_2146CC71C(void *a1, const char *a2)
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_2146C92F8;
  uint64_t v17 = sub_2146C9308;
  id v18 = 0;
  uint64_t v3 = (void *)a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2146CC88C;
  v12[3] = &unk_264217948;
  v12[4] = &v13;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v12);
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2146CC89C;
  v11[3] = &unk_264217948;
  v11[4] = &v13;
  objc_msgSend_testWifiHandoverSessionWithServiceName_publisherRole_datapathPMK_datapathPMKID_callback_(v4, v8, v5, 1, v6, v7, v11);

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_2146CC874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146CC88C(uint64_t a1, void *a2)
{
}

void sub_2146CC89C(uint64_t a1, void *a2)
{
}

id sub_2146CC9EC(void *a1, const char *a2)
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_2146C92F8;
  uint64_t v17 = sub_2146C9308;
  id v18 = 0;
  uint64_t v3 = (void *)a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2146CCB5C;
  v12[3] = &unk_264217948;
  v12[4] = &v13;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v12);
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2146CCB6C;
  v11[3] = &unk_264217948;
  v11[4] = &v13;
  objc_msgSend_testWifiHandoverSessionWithServiceName_publisherRole_datapathPMK_datapathPMKID_callback_(v4, v8, v5, 0, v6, v7, v11);

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_2146CCB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146CCB5C(uint64_t a1, void *a2)
{
}

void sub_2146CCB6C(uint64_t a1, void *a2)
{
}

id sub_2146CCD4C(uint64_t a1, const char *a2)
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_2146C92F8;
  uint64_t v17 = sub_2146C9308;
  id v18 = 0;
  uint64_t v3 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2146CCEC0;
  v12[3] = &unk_264217948;
  v12[4] = &v13;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v12);
  BOOL v5 = *(unsigned char *)(a1 + 56) == 0;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2146CCED0;
  v11[3] = &unk_264217948;
  v11[4] = &v13;
  objc_msgSend_testBluetoothHandoverSessionType_uuid_peripheralAddress_callback_(v4, v8, v5, v6, v7, v11);

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_2146CCEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146CCEC0(uint64_t a1, void *a2)
{
}

void sub_2146CCED0(uint64_t a1, void *a2)
{
}

id sub_2146CD0B0(uint64_t a1, const char *a2)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_2146C92F8;
  id v18 = sub_2146C9308;
  id v19 = 0;
  uint64_t v3 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2146CD228;
  v13[3] = &unk_264217948;
  v13[4] = &v14;
  uint64_t v4 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v13);
  uint64_t v6 = v4;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2146CD238;
  v12[3] = &unk_264217948;
  v12[4] = &v14;
  objc_msgSend_testBluetoothHandoverSessionType_uuid_peripheralAddress_callback_(v4, v5, v7, v8, v9, v12);

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void sub_2146CD210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146CD228(uint64_t a1, void *a2)
{
}

void sub_2146CD238(uint64_t a1, void *a2)
{
}

id *sub_2146CD248(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = v2;
  uint64_t v6 = objc_msgSend_bytes(v3, v4, v5);
  id v7 = v3;
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  if ((unint64_t)objc_msgSend_length(v7, v14, v15) < 4)
  {
    uint64_t v16 = 0;
    goto LABEL_46;
  }
  uint64_t v17 = (unsigned __int16 *)(v10 + v13);
  id v18 = objc_alloc_init(STSApdu);
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    v18->_cls = *(unsigned char *)v6;
    v18->_instruction = *(unsigned char *)(v6 + 1);
    v18->_p1 = *(unsigned char *)(v6 + 2);
    v18->_p2 = *(unsigned char *)(v6 + 3);
  }
  id v20 = (unsigned char *)(v6 + 4);
  if ((unsigned __int16 *)(v6 + 4) == v17) {
    goto LABEL_44;
  }
  int v21 = *v20;
  BOOL v22 = *v20 == 0;
  if (*v20)
  {
    v23 = (unsigned __int16 *)(v6 + 5);
    unsigned int v24 = *v20;
  }
  else
  {
    uint64_t v26 = (char *)v17 - v20;
    if (v26 == 1)
    {
      BOOL v22 = 0;
      unsigned int v24 = 0;
      v23 = (unsigned __int16 *)(v6 + 5);
      BOOL v25 = 1;
      goto LABEL_16;
    }
    if (v26 <= 2) {
      goto LABEL_36;
    }
    v23 = (unsigned __int16 *)(v6 + 7);
    unsigned int v24 = __rev16(*(unsigned __int16 *)(v6 + 5));
    if (!v24)
    {
      BOOL v25 = 0;
      BOOL v22 = 1;
      goto LABEL_16;
    }
  }
  BOOL v25 = v21 != 0;
  if ((char *)v17 - (char *)v23 >= v24)
  {
    id v27 = v7;
    uint64_t v30 = objc_msgSend_bytes(v27, v28, v29);
    uint64_t v32 = objc_msgSend_subdataWithRange_(v27, v31, (uint64_t)v23 - v30, v24);
    if (p_isa) {
      objc_storeStrong(p_isa + 2, v32);
    }

    v23 = (unsigned __int16 *)((char *)v23 + v24);
  }
  else if ((char *)v17 - (char *)v23 > 0)
  {
    goto LABEL_36;
  }
LABEL_16:
  if (v23 == v17)
  {
    if (p_isa && p_isa[2])
    {
LABEL_44:
      uint64_t v16 = p_isa;
      goto LABEL_45;
    }
    if (v24) {
      unsigned int v36 = v24;
    }
    else {
      unsigned int v36 = 0x10000;
    }
    if (v24) {
      unsigned int v37 = v24;
    }
    else {
      unsigned int v37 = 253;
    }
    if (v22) {
      uint64_t v38 = v36;
    }
    else {
      uint64_t v38 = v37;
    }
LABEL_41:
    id v39 = objc_alloc(NSNumber);
    v41 = objc_msgSend_initWithInt_(v39, v40, v38);
    if (p_isa) {
      objc_storeStrong(p_isa + 3, v41);
    }

    goto LABEL_44;
  }
  if ((char *)v17 - (char *)v23 == 2)
  {
    if (!v25)
    {
      unsigned int v33 = __rev16(*v23);
      BOOL v34 = v33 == 0;
      unsigned int v35 = 0x10000;
LABEL_38:
      if (v34) {
        uint64_t v38 = v35;
      }
      else {
        uint64_t v38 = v33;
      }
      goto LABEL_41;
    }
  }
  else if ((char *)v17 - (char *)v23 == 1 && !v22)
  {
    unsigned int v33 = *(unsigned __int8 *)v23;
    BOOL v34 = v33 == 0;
    unsigned int v35 = 253;
    goto LABEL_38;
  }
LABEL_36:
  uint64_t v16 = 0;
LABEL_45:

LABEL_46:

  return v16;
}

id sub_2146CE348(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_data(MEMORY[0x263EFF990], v4, v5);
  char v85 = 0;
  char v84 = objc_msgSend_header(v3, v7, v8);
  objc_msgSend_appendBytes_length_(v6, v9, (uint64_t)&v84, 1);
  uint64_t v12 = objc_msgSend_type(v3, v10, v11);
  if (v12)
  {
  }
  else if (!objc_msgSend_typeNameFormat(v3, v13, v14))
  {
    char v85 = 0;
    objc_msgSend_appendBytes_length_(v6, v15, (uint64_t)&v85, 1);
    char v85 = 0;
    objc_msgSend_appendBytes_length_(v6, v82, (uint64_t)&v85, 1);
    goto LABEL_22;
  }
  uint64_t v17 = objc_msgSend_type(v3, v15, v16);
  char v85 = objc_msgSend_length(v17, v18, v19);

  objc_msgSend_appendBytes_length_(v6, v20, (uint64_t)&v85, 1);
  if (objc_msgSend_shortRecord(v3, v21, v22))
  {
    char v85 = 0;
    BOOL v25 = objc_msgSend_payload(v3, v23, v24);
    uint64_t v28 = objc_msgSend_length(v25, v26, v27);

    if (v28)
    {
      v31 = objc_msgSend_payload(v3, v29, v30);
      char v85 = objc_msgSend_length(v31, v32, v33);
    }
  }
  else
  {
    BOOL v34 = objc_msgSend_payload(v3, v23, v24);
    uint64_t v37 = objc_msgSend_length(v34, v35, v36);

    if (v37)
    {
      v40 = objc_msgSend_payload(v3, v38, v39);
      int v43 = objc_msgSend_length(v40, v41, v42);
    }
    else
    {
      int v43 = 0;
    }
    char v85 = HIBYTE(v43);
    objc_msgSend_appendBytes_length_(v6, v38, (uint64_t)&v85, 1);
    char v85 = BYTE2(v43);
    objc_msgSend_appendBytes_length_(v6, v44, (uint64_t)&v85, 1);
    char v85 = BYTE1(v43);
    objc_msgSend_appendBytes_length_(v6, v45, (uint64_t)&v85, 1);
    char v85 = v43;
  }
  objc_msgSend_appendBytes_length_(v6, v29, (uint64_t)&v85, 1);
  if (objc_msgSend__idLengthPresent(v3, v46, v47))
  {
    v50 = objc_msgSend_identifier(v3, v48, v49);
    uint64_t v53 = objc_msgSend_length(v50, v51, v52);

    if (v53)
    {
      v54 = objc_msgSend_identifier(v3, v48, v49);
      char v85 = objc_msgSend_length(v54, v55, v56);

      objc_msgSend_appendBytes_length_(v6, v57, (uint64_t)&v85, 1);
    }
  }
  v58 = objc_msgSend_type(v3, v48, v49);
  uint64_t v61 = objc_msgSend_length(v58, v59, v60);

  if (v61)
  {
    v64 = objc_msgSend_type(v3, v62, v63);
    objc_msgSend_appendData_(v6, v65, (uint64_t)v64);
  }
  if (objc_msgSend__idLengthPresent(v3, v62, v63))
  {
    v68 = objc_msgSend_identifier(v3, v66, v67);
    uint64_t v71 = objc_msgSend_length(v68, v69, v70);

    if (v71)
    {
      v72 = objc_msgSend_identifier(v3, v66, v67);
      objc_msgSend_appendData_(v6, v73, (uint64_t)v72);
    }
  }
  v74 = objc_msgSend_payload(v3, v66, v67);
  uint64_t v77 = objc_msgSend_length(v74, v75, v76);

  if (v77)
  {
    v80 = objc_msgSend_payload(v3, v78, v79);
    objc_msgSend_appendData_(v6, v81, (uint64_t)v80);
  }
LABEL_22:

  return v6;
}

id sub_2146CE658(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if (objc_msgSend_count(v3, v5, v6))
  {
    unint64_t v9 = 0;
    do
    {
      if (!v9)
      {
        uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(v3, v7, 0);
        objc_msgSend_setMessageBegin_(v10, v11, 1);
      }
      if (v9 == objc_msgSend_count(v3, v7, v8) - 1)
      {
        uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(v3, v12, v9);
        objc_msgSend_setMessageEnd_(v13, v14, 1);
      }
      uint64_t v15 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v3, v12, v9);
      id v18 = objc_msgSend_dataWithSTSNDEFRecord_(v15, v17, (uint64_t)v16);
      objc_msgSend_appendData_(v4, v19, (uint64_t)v18);

      ++v9;
    }
    while (v9 < objc_msgSend_count(v3, v20, v21));
  }
  uint64_t v22 = objc_msgSend_copy(v4, v7, v8);

  return v22;
}

uint64_t sub_2146CE784()
{
  if (qword_26781B0A0 != -1) {
    dispatch_once(&qword_26781B0A0, &unk_26C558C10);
  }
  return dword_26781B09C;
}

uint64_t sub_2146CE7C8()
{
  uint64_t result = arc4random();
  dword_26781B09C = result;
  return result;
}

void sub_2146CE7E8(os_log_type_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (qword_26781B0B0 != -1) {
    dispatch_once(&qword_26781B0B0, &unk_26C558C70);
  }
  id v6 = [NSString alloc];
  id v8 = objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v5, a3);
  uint64_t v11 = objc_msgSend_UTF8String(v8, v9, v10);
  uint64_t v12 = qword_26781B0A8;
  if (os_log_type_enabled((os_log_t)qword_26781B0A8, a1))
  {
    int v13 = 136446210;
    uint64_t v14 = v11;
    _os_log_impl(&dword_2146C3000, v12, a1, "%{public}s", (uint8_t *)&v13, 0xCu);
  }
}

uint64_t sub_2146CE8FC()
{
  qword_26781B0A8 = (uint64_t)os_log_create("com.apple.sts", "logging");

  return MEMORY[0x270F9A758]();
}

void sub_2146CE940(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a5;
  id v15 = a6;
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_26781B0C8 != -1) {
    dispatch_once(&qword_26781B0C8, &unk_26C558C50);
  }
  if (byte_26781B098 == 1)
  {
LABEL_5:
    uint64_t v16 = NSString;
    id v17 = v15;
    uint64_t v20 = objc_msgSend_objectInstanceID(v14, v18, v19);
    uint64_t v22 = objc_msgSend_stringWithFormat_(v16, v21, @"%08x [%s]:%d %@", v20, a3, a4, v17);

    sub_2146CE7E8(a1, v22, (uint64_t)&a9);
  }
}

void sub_2146CEA3C(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a5;
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_26781B0C8 != -1) {
    dispatch_once(&qword_26781B0C8, &unk_26C558C50);
  }
  if (byte_26781B098 == 1)
  {
LABEL_5:
    id v15 = objc_msgSend_stringWithFormat_(NSString, v13, @"%s : %d : %@", a3, a4, v14);
    sub_2146CE7E8(a1, v15, (uint64_t)&a9);
  }
}

id sub_2146CEB08()
{
  if (qword_26781B0C0 != -1) {
    dispatch_once(&qword_26781B0C0, &unk_26C558C90);
  }
  v0 = (void *)qword_26781B0B8;

  return v0;
}

uint64_t sub_2146CEB5C()
{
  qword_26781B0B8 = (uint64_t)os_log_create("com.apple.sts.signpost", "GeneralSignposts");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2146CEBA0()
{
  uint64_t result = MGGetBoolAnswer();
  if (result) {
    byte_26781B098 = 1;
  }
  return result;
}

void sub_2146CF63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2146CF65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2146CF8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2146CF904(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2146CF914(uint64_t a1)
{
}

void sub_2146CF91C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxy transceive:outError:]_block_invoke", 55, *(void **)(a1 + 32), @"XPC error: %@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_2146CF994(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id *sub_2146CFB0C(id *a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)STSRemoteTransceiverProxyListener;
    unint64_t v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeWeak(v9 + 2, v7);
      objc_storeStrong(a1 + 3, a4);
      *((unsigned char *)a1 + 8) = a3;
    }
  }

  return a1;
}

uint64_t sub_2146CFBFC(uint64_t result, const char *a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v3 = result;
    if (!*(void *)(result + 32))
    {
      uint64_t v4 = objc_msgSend_anonymousListener(MEMORY[0x263F08D88], a2, a3);
      id v5 = *(void **)(v3 + 32);
      *(void *)(v3 + 32) = v4;

      objc_msgSend_setDelegate_(*(void **)(v3 + 32), v6, v3);
      unint64_t v9 = *(void **)(v3 + 32);
      return objc_msgSend_resume(v9, v7, v8);
    }
  }
  return result;
}

void sub_2146CFC70(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    objc_msgSend_invalidate(*(void **)(a1 + 32), a2, a3);
    uint64_t v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

void **sub_2146CFCB8(void **a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    objc_msgSend_endpoint(a1[4], a2, a3);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = vars8;
  }
  return a1;
}

void sub_2146CFF88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_2146CFFD0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]_block_invoke", 101, a1[4], @"XPC invalidated", a7, a8, v14);
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v15 = WeakRetained;
  if (WeakRetained) {
    uint64_t v10 = (void *)*((void *)WeakRetained + 5);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  id v12 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend_removeObject_(v11, v13, (uint64_t)v12);
}

void sub_2146D0078(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]_block_invoke_2", 105, a1[4], @"XPC interrupted", a7, a8, v14);
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v15 = WeakRetained;
  if (WeakRetained) {
    uint64_t v10 = (void *)*((void *)WeakRetained + 5);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  id v12 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend_removeObject_(v11, v13, (uint64_t)v12);
}

id *sub_2146D0308(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STSUnifiedAccessHandler;
    int v13 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeWeak(v13 + 1, v9);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 3, a5);
      objc_storeStrong(a1 + 4, a3);
      uint64_t v14 = objc_alloc_init(STSNFCHandoverHandler);
      id v15 = a1[5];
      a1[5] = v14;
    }
  }

  return a1;
}

uint64_t sub_2146D03F8(uint64_t a1)
{
  uint64_t hasPrefix = a1;
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v4 = objc_msgSend_initWithBytes_length_(v2, v3, (uint64_t)&unk_2146D43A9, 9);
    id v7 = objc_msgSend_STS_asHexString(v4, v5, v6);

    id v8 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v10 = objc_msgSend_initWithBytes_length_(v8, v9, (uint64_t)&unk_2146D43B2, 9);
    int v13 = objc_msgSend_STS_asHexString(v10, v11, v12);

    if (objc_msgSend_hasPrefix_(*(void **)(hasPrefix + 32), v14, (uint64_t)v7)) {
      uint64_t hasPrefix = 1;
    }
    else {
      uint64_t hasPrefix = objc_msgSend_hasPrefix_(*(void **)(hasPrefix + 32), v15, (uint64_t)v13);
    }
  }
  return hasPrefix;
}

void sub_2146D04B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = objc_msgSend_length(v5, v7, v8);
  uint64_t v12 = *(void **)(a1 + 32);
  if (v9)
  {
    if (v12) {
      int v13 = (void *)v12[5];
    }
    else {
      int v13 = 0;
    }
    sub_2146D2518(v13, v5);
    BOOL v24 = 0;
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      uint64_t v15 = *(void *)(v14 + 40);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = sub_2146D2564(v15, *(void *)(a1 + 48), &v24);
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processStepupRequest:responseLe:callback:]_block_invoke", 104, *(void **)(a1 + 32), @"respApdu=%@, error=%@, isLastChunk=%d", v17, v18, (uint64_t)v16);
    int v19 = sub_2146D03F8(*(void *)(a1 + 32));
    (*(void (**)(void, void *, id, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v16, v6, v24 & ~v19);
  }
  else
  {
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processStepupRequest:responseLe:callback:]_block_invoke", 95, v12, @"Empty response", v10, v11, v23);
    id v20 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v22 = objc_msgSend_initWithBytes_length_(v20, v21, (uint64_t)&unk_2146D43BB, 2);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = (id)v22;
  }
}

void sub_2146D0624(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _processStepupRequest:responseLe:callback:]_block_invoke_2", 115, v3, @"XPC Error: %@", v5, v6, (uint64_t)v4);
  uint64_t v7 = *(void *)(a1 + 40);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, (uint64_t)&unk_2146D43BB, 2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v7 + 16))(v7, v9, v4, 1);
}

void sub_2146D06E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(id **)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2146D07AC;
  v10[3] = &unk_264217CD8;
  id v8 = v6;
  id v12 = v8;
  void v10[4] = a1;
  id v9 = v5;
  id v11 = v9;
  sub_2146D21C4(v7, v9, v10);
}

void sub_2146D07AC(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v9 = a4;
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = (void *)MEMORY[0x263F087E8];
    v37[0] = *MEMORY[0x263F08320];
    v39[0] = off_26781B058;
    id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v39, v37, 1);
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, @"STSXPCHelperErrorDomain", 11, v12);

    (*(void (**)(uint64_t, id, void *, uint64_t))(v10 + 16))(v10, v7, v14, 1);
  }
  else if (a2)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(a1 + 40);
    if (v15) {
      uint64_t v15 = (void *)v15[3];
    }
    uint64_t v36 = v15;
    uint64_t v19 = objc_msgSend_unsignedIntegerValue(v36, v17, v18);
    id v20 = *(id *)(a1 + 48);
    uint64_t v21 = v20;
    if (v16)
    {
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = sub_2146D04B4;
      v39[3] = &unk_264217CB0;
      v39[4] = v16;
      id v22 = v20;
      id v40 = v22;
      uint64_t v41 = v19;
      id v23 = v9;
      BOOL v24 = (void *)MEMORY[0x2166A65A0](v39);
      id WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = sub_2146D0624;
      v37[3] = &unk_264217A38;
      v37[4] = v16;
      id v38 = v22;
      uint64_t v27 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(WeakRetained, v26, (uint64_t)v37);
      uint64_t v28 = sub_2146D03F8(v16);
      uint64_t v30 = v16 + 16;
      uint64_t v29 = *(void *)(v16 + 16);
      id v31 = *(id *)(v30 + 8);
      objc_msgSend_processUnifiedAccessStepupSessionEstablishment_forAcwg_endpointIdentifier_intermediateKeyMaterial_callback_(v27, v32, (uint64_t)v23, v28, v31, v29, v24);
    }
  }
  else
  {
    id v33 = objc_alloc(MEMORY[0x263EFF8F8]);
    unsigned int v35 = objc_msgSend_initWithBytes_length_(v33, v34, (uint64_t)&unk_2146D43BD, 2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_2146D0A90(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v19 = a2;
  id v6 = a4;
  if (objc_msgSend_length(v19, v7, v8))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v10 = *(void **)(v9 + 40);
    }
    else {
      uint64_t v10 = 0;
    }
    sub_2146D2518(v10, v19);
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 40);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = sub_2146D2564(v12, *(void *)(a1 + 48), 0);
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processHandoverRequest:responseLe:callback:]_block_invoke", 156, *(void **)(a1 + 32), @"respApdu=%@, error=%@", v14, v15, v13);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v6 = (id)v13;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v18 = objc_msgSend_initWithBytes_length_(v16, v17, (uint64_t)&unk_2146D43BB, 2);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v19 = (id)v18;
  }
}

void sub_2146D0BD4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _processHandoverRequest:responseLe:callback:]_block_invoke_2", 161, v3, @"XPC Error: %@", v5, v6, (uint64_t)v4);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v7, (uint64_t)&unk_2146D43BB, 2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2146D0C8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id **)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2146D0D58;
  v10[3] = &unk_264217CD8;
  id v8 = v6;
  id v12 = v8;
  void v10[4] = a1;
  id v9 = v5;
  id v11 = v9;
  sub_2146D21C4(v7, v9, v10);
}

void sub_2146D0D58(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v9 = a4;
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v38[0] = off_26781B058;
    id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v38, &v32, 1);
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, @"STSXPCHelperErrorDomain", 11, v12);

    (*(void (**)(uint64_t, id, void *, uint64_t))(v10 + 16))(v10, v7, v14, 1);
  }
  else
  {
    if (a2)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(a1 + 40);
      if (v15) {
        uint64_t v15 = (void *)v15[3];
      }
      uint64_t v17 = v15;
      uint64_t v20 = objc_msgSend_unsignedIntegerValue(v17, v18, v19);
      id v21 = *(id *)(a1 + 48);
      id v22 = v21;
      if (v16)
      {
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = sub_2146D0A90;
        v38[3] = &unk_264217D00;
        id v23 = v21;
        v38[4] = v16;
        id v39 = v23;
        uint64_t v40 = v20;
        id v24 = v9;
        BOOL v25 = (void *)MEMORY[0x2166A65A0](v38);
        id WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
        uint64_t v32 = MEMORY[0x263EF8330];
        uint64_t v33 = 3221225472;
        BOOL v34 = sub_2146D0BD4;
        unsigned int v35 = &unk_264217A38;
        uint64_t v36 = v16;
        id v37 = v23;
        uint64_t v28 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(WeakRetained, v27, (uint64_t)&v32);
        objc_msgSend_processHandoverRequest_callback_(v28, v29, (uint64_t)v24, v25, v32, v33, v34, v35, v36);
      }
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x263EFF8F8]);
      uint64_t v17 = objc_msgSend_initWithBytes_length_(v30, v31, (uint64_t)&unk_2146D43BD, 2);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_2146D1008(void *a1, void *a2, void *a3)
{
  v70[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    id v7 = (void *)v5[2];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  uint64_t v11 = objc_msgSend_length(v8, v9, v10);

  if (v11)
  {
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processControlFlow:callback:]", 332, a1, @"%@", v12, v13, (uint64_t)v5);
    if (v5) {
      uint64_t v14 = (void *)v5[2];
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
    unint64_t v16 = 0x263F08000uLL;
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    uint64_t v69 = *MEMORY[0x263F08320];
    v70[0] = off_26781B058;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v70, &v69, 1);
    id v22 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v21, @"STSXPCHelperErrorDomain", 11, v20);

    if (objc_msgSend_length(v15, v23, v24))
    {
      id v27 = v15;
      id v30 = (unsigned char *)objc_msgSend_bytes(v27, v28, v29);
      uint64_t v33 = objc_msgSend_length(v27, v31, v32);
      if (*v30 == 65)
      {
        if ((unint64_t)(v33 - 1) > 1)
        {
          if (v30[1] == 1)
          {
            v44 = (void *)MEMORY[0x263F087E8];
            uint64_t v69 = v18;
            v70[0] = STSXPCHelperErrorDescriptions;
            v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)v70, &v69, 1);
            uint64_t v47 = objc_msgSend_errorWithDomain_code_userInfo_(v44, v46, @"STSXPCHelperErrorDomain", 0, v45);

            if (v30[2] == 1)
            {
              sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _extractContentFromTag41:isCompleted:]", 310, a1, @"CONTROL_FLOW returned Success", v48, v49, v68);
              char v50 = 0;
            }
            else
            {
              sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _extractContentFromTag41:isCompleted:]", 313, a1, @"CONTROL_FLOW returned Failure %d", v48, v49, v30[2]);
              char v50 = 1;
            }
            id v22 = (void *)v47;
            unint64_t v16 = 0x263F08000;
LABEL_18:
            id v38 = v22;

            if (objc_msgSend_code(v38, v51, v52)
              && (objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v53, (uint64_t)&unk_2146D43BB, 2),
                  (uint64_t v54 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v56 = (void *)v54;
              v57 = *(void **)(v16 + 2024);
              uint64_t v69 = v18;
              v70[0] = off_26781B058;
              v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v70, &v69, 1);
              uint64_t v60 = objc_msgSend_errorWithDomain_code_userInfo_(v57, v59, @"STSXPCHelperErrorDomain", 11, v58);

              v6[2](v6, v56, v60, 1);
            }
            else
            {
              id v61 = objc_alloc(MEMORY[0x263EFF8F8]);
              uint64_t v56 = objc_msgSend_initWithBytes_length_(v61, v62, (uint64_t)&unk_2146D43BD, 2);
              if ((v50 & 1) == 0)
              {
                v6[2](v6, v56, 0, 1);
                goto LABEL_25;
              }
              v64 = *(void **)(v16 + 2024);
              uint64_t v69 = v18;
              v70[0] = off_26781B080;
              v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)v70, &v69, 1);
              uint64_t v60 = objc_msgSend_errorWithDomain_code_userInfo_(v64, v66, @"STSXPCHelperErrorDomain", 16, v65);

              v6[2](v6, v56, v60, 1);
            }

LABEL_25:
            goto LABEL_26;
          }
          unsigned int v35 = @"Invalid CONTROL_FLOW payload length";
          uint64_t v36 = 317;
        }
        else
        {
          unsigned int v35 = @"Invalid CONTROL_FLOW payload";
          uint64_t v36 = 302;
        }
      }
      else
      {
        unsigned int v35 = @"Invalid CONTROL_FLOW payload";
        uint64_t v36 = 297;
      }
    }
    else
    {
      unsigned int v35 = @"Invalid CONTROL_FLOW payload";
      uint64_t v36 = 289;
    }
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _extractContentFromTag41:isCompleted:]", v36, a1, v35, v25, v26, v68);
    char v50 = 1;
    goto LABEL_18;
  }
  sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _processControlFlow:callback:]", 325, a1, @"Unexpected payload length 0", v12, v13, v67);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v37, (uint64_t)&unk_2146D43BB, 2);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = (void *)MEMORY[0x263F087E8];
  uint64_t v69 = *MEMORY[0x263F08320];
  v70[0] = off_26781B058;
  uint64_t v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)v70, &v69, 1);
  int v43 = objc_msgSend_errorWithDomain_code_userInfo_(v39, v42, @"STSXPCHelperErrorDomain", 11, v41);

  v6[2](v6, v38, v43, 1);
LABEL_26:
}

void sub_2146D156C(id *a1, void *a2, void *a3, void *a4)
{
  v150[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v139[0] = MEMORY[0x263EF8330];
    v139[1] = 3221225472;
    v139[2] = sub_2146D1EB4;
    v139[3] = &unk_264217D28;
    id v140 = v7;
    id v141 = v8;
    id v9 = a2;
    uint64_t v10 = (void (**)(void, void, void, void))MEMORY[0x2166A65A0](v139);
    uint64_t v11 = sub_2146CD248((uint64_t)STSApdu, v9);

    if (v11)
    {
      unsigned int v14 = *(unsigned __int8 *)(v11 + 9);
      if (v14 > 0xBF)
      {
        if (v14 == 192)
        {
          id v102 = *(id *)(v11 + 16);
          uint64_t v105 = objc_msgSend_length(v102, v103, v104);

          if (!v105)
          {
            v145[0] = 0;
            id v119 = a1[5];
            id v120 = *(id *)(v11 + 24);
            unint64_t v123 = objc_msgSend_unsignedIntegerValue(v120, v121, v122);
            v124 = sub_2146D2564((uint64_t)v119, v123, v145);

            if (v124)
            {
              v128 = 0;
            }
            else
            {
              v132 = (void *)MEMORY[0x263F087E8];
              uint64_t v149 = *MEMORY[0x263F08320];
              v150[0] = off_26781B010;
              v133 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v125, (uint64_t)v150, &v149, 1);
              v128 = objc_msgSend_errorWithDomain_code_userInfo_(v132, v134, @"STSXPCHelperErrorDomain", 2, v133);
            }
            sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 401, a1, @"respApdu=%@, error=%@, isLastChunk=%d", v126, v127, (uint64_t)v124);
            int v135 = sub_2146D03F8((uint64_t)a1);
            ((void (**)(void, void *, void *, void))v10)[2](v10, v124, v128, v145[0] & ~v135);

            goto LABEL_45;
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v106, (uint64_t)&unk_2146D43C1, 2);
          goto LABEL_42;
        }
        if (v14 == 195)
        {
          id v84 = *(id *)(v11 + 16);
          uint64_t v87 = objc_msgSend_length(v84, v85, v86);

          if (!v87)
          {
            sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 381, a1, @"Missing payload", v89, v90, v136);
            id v117 = objc_alloc(MEMORY[0x263EFF8F8]);
            uint64_t v116 = objc_msgSend_initWithBytes_length_(v117, v118, (uint64_t)&unk_2146D43C1, 2);
            goto LABEL_43;
          }
          if (!*(unsigned char *)(v11 + 10))
          {
            if (*(unsigned char *)(v11 + 11) == 1)
            {
              sub_2146D0C8C((uint64_t)a1, (void *)v11, v10);
              goto LABEL_45;
            }
            if (!*(unsigned char *)(v11 + 11))
            {
              sub_2146D06E0((uint64_t)a1, (void *)v11, v10);
              goto LABEL_45;
            }
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v88, (uint64_t)&unk_2146D43C3, 2);
          uint64_t v116 = LABEL_42:;
LABEL_43:
          v78 = (void *)v116;
          uint64_t v79 = (void (*)(void, void *, void *, uint64_t))v10[2];
          v80 = v10;
          v81 = v78;
          v82 = 0;
          uint64_t v83 = 0;
          goto LABEL_44;
        }
        goto LABEL_23;
      }
      if (v14 != 60)
      {
        if (v14 == 164)
        {
          id v15 = (id *)(id)v11;
          int v16 = sub_2146D03F8((uint64_t)a1);
          id v17 = v15[2];
          uint64_t v20 = objc_msgSend_length(v17, v18, v19);
          if (v16)
          {
            if (v20 == 9)
            {
              id v21 = v15[2];
              uint64_t v24 = objc_msgSend_bytes(v21, v22, v23);
              BOOL v26 = *(void *)v24 != 0x55CEAC09090000A0 || *(unsigned char *)(v24 + 8) != 2;

              if (!v26)
              {
                v138 = objc_msgSend_data(MEMORY[0x263EFF990], v27, v28);
                char v147 = -124;
                char v148 = 9;
                objc_msgSend_appendBytes_length_(v138, v31, (uint64_t)&v147, 1);
                objc_msgSend_appendBytes_length_(v138, v32, (uint64_t)&v148, 1);
                objc_msgSend_appendBytes_length_(v138, v33, (uint64_t)&unk_2146D43B2, 9);
                uint64_t v36 = objc_msgSend_data(MEMORY[0x263EFF990], v34, v35);
                char v146 = 0x80;
                *(_WORD *)v145 = 0;
                char v148 = 2;
                objc_msgSend_appendBytes_length_(v36, v37, (uint64_t)&v146, 1);
                objc_msgSend_appendBytes_length_(v36, v38, (uint64_t)&v148, 1);
                objc_msgSend_appendBytes_length_(v36, v39, (uint64_t)v145, 2);
                uint64_t v42 = objc_msgSend_data(MEMORY[0x263EFF990], v40, v41);
                __int16 v144 = 26239;
                LODWORD(v150[0]) = 918018;
                LODWORD(v149) = 918018;
                char v148 = 8;
                objc_msgSend_appendBytes_length_(v42, v43, (uint64_t)&v144, 2);
                objc_msgSend_appendBytes_length_(v42, v44, (uint64_t)&v148, 1);
                objc_msgSend_appendBytes_length_(v42, v45, (uint64_t)v150, 4);
                objc_msgSend_appendBytes_length_(v42, v46, (uint64_t)&v149, 4);
                uint64_t v49 = objc_msgSend_data(MEMORY[0x263EFF990], v47, v48);
                char v143 = -91;
                char v52 = objc_msgSend_length(v36, v50, v51);
                char v148 = objc_msgSend_length(v42, v53, v54) + v52;
                objc_msgSend_appendBytes_length_(v49, v55, (uint64_t)&v143, 1);
                objc_msgSend_appendBytes_length_(v49, v56, (uint64_t)&v148, 1);
                objc_msgSend_appendData_(v49, v57, (uint64_t)v36);
                objc_msgSend_appendData_(v49, v58, (uint64_t)v42);
                id v61 = objc_msgSend_data(MEMORY[0x263EFF990], v59, v60);
                char v142 = 111;
                char v64 = objc_msgSend_length(v138, v62, v63);
                char v148 = objc_msgSend_length(v49, v65, v66) + v64;
                objc_msgSend_appendBytes_length_(v61, v67, (uint64_t)&v142, 1);
                objc_msgSend_appendBytes_length_(v61, v68, (uint64_t)&v148, 1);
                objc_msgSend_appendData_(v61, v69, (uint64_t)v138);
                objc_msgSend_appendData_(v61, v70, (uint64_t)v49);
                v72 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v71, (uint64_t)&unk_2146D43BD, 2);
                objc_msgSend_appendData_(v61, v73, (uint64_t)v72);

LABEL_56:
                ((void (**)(void, void *, void, void))v10)[2](v10, v61, 0, 0);

                goto LABEL_45;
              }
            }
            else
            {
            }
            sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler _processSelectAID:]", 266, a1, @"Unexpected SELECT: %@", v29, v30, (uint64_t)v15);
          }
          else
          {
            if (v20 == 7)
            {
              id v107 = v15[2];
              v110 = (_DWORD *)objc_msgSend_bytes(v107, v108, v109);
              BOOL v112 = *v110 != 134217888 || *(_DWORD *)((char *)v110 + 3) != 33642504;

              if (!v112)
              {
                objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v113, (uint64_t)&unk_2146D43BD, 2);
                id v61 = LABEL_55:;
                goto LABEL_56;
              }
            }
            else
            {
            }
            sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler _processSelectAID:]", 275, a1, @"Unexpected SELECT: %@", v114, v115, (uint64_t)v15);
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v129, (uint64_t)&unk_2146D43BF, 2);
          goto LABEL_55;
        }
LABEL_23:
        sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 421, a1, @"Unsupported instruction: %@", v12, v13, v11);
LABEL_41:
        objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v91, (uint64_t)&unk_2146D43C5, 2);
        goto LABEL_42;
      }
      sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 404, a1, @"Control Flow", v12, v13, v136);
      if (!sub_2146D03F8((uint64_t)a1))
      {
        sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 416, a1, @"Unsupported instruction: %@", v92, v93, v11);
        goto LABEL_41;
      }
      id v94 = *(id *)(v11 + 16);
      uint64_t v97 = objc_msgSend_length(v94, v95, v96);

      if (v97)
      {
        if (!*(unsigned char *)(v11 + 10) && !*(unsigned char *)(v11 + 11))
        {
          sub_2146D1008(a1, (void *)v11, v10);
          goto LABEL_45;
        }
        uint64_t v101 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v98, (uint64_t)&unk_2146D43C3, 2);
      }
      else
      {
        sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 407, a1, @"Missing payload", v99, v100, v137);
        id v130 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v101 = objc_msgSend_initWithBytes_length_(v130, v131, (uint64_t)&unk_2146D43C1, 2);
      }
      v78 = (void *)v101;
      uint64_t v79 = (void (*)(void, void *, void *, uint64_t))v10[2];
      v80 = v10;
      v81 = v78;
      v82 = 0;
    }
    else
    {
      sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 370, a1, @"Invalid APDU: %@", v12, v13, 0);
      v74 = (void *)MEMORY[0x263F087E8];
      uint64_t v149 = *MEMORY[0x263F08320];
      v150[0] = @"Invalid APDU";
      uint64_t v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v75, (uint64_t)v150, &v149, 1);
      v78 = objc_msgSend_errorWithDomain_code_userInfo_(v74, v77, @"STSXPCHelperErrorDomain", 5, v76);

      uint64_t v79 = (void (*)(void, void *, void *, uint64_t))v10[2];
      v80 = v10;
      v81 = 0;
      v82 = v78;
    }
    uint64_t v83 = 1;
LABEL_44:
    v79(v80, v81, v82, v83);

LABEL_45:
  }
}

void sub_2146D1EB4(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2146D1F98;
  v13[3] = &unk_264217A88;
  id v9 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  id v14 = v7;
  char v17 = a4;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t sub_2146D1F98(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

id sub_2146D207C(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (a1)
  {
    unint64_t v9 = objc_msgSend_length(v3, v4, v5);
    if (v9 >= 0x100)
    {
      if ((unint64_t)objc_msgSend_length(v6, v7, v8) >= 0x10000)
      {
        if ((unint64_t)objc_msgSend_length(v6, v11, v12) >> 32) {
          uint64_t v10 = 8;
        }
        else {
          uint64_t v10 = 4;
        }
      }
      else
      {
        uint64_t v10 = 2;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    char v24 = 83;
    id v13 = objc_alloc(MEMORY[0x263EFF990]);
    id v15 = objc_msgSend_initWithBytes_length_(v13, v14, (uint64_t)&v24, 1);
    a1 = v15;
    if (v9 > 0xFF)
    {
      char v24 = v10 | 0x80;
      objc_msgSend_appendBytes_length_(v15, v16, (uint64_t)&v24, 1);
      char v21 = 8 * v10 - 8;
      do
      {
        char v24 = (unint64_t)objc_msgSend_length(v6, v19, v20) >> v21;
        objc_msgSend_appendBytes_length_(a1, v22, (uint64_t)&v24, 1);
        v21 -= 8;
        --v10;
      }
      while (v10);
    }
    else
    {
      char v24 = objc_msgSend_length(v6, v16, v17);
      objc_msgSend_appendBytes_length_(a1, v18, (uint64_t)&v24, 1);
    }
    objc_msgSend_appendData_(a1, v19, (uint64_t)v6);
  }

  return a1;
}

void sub_2146D21C4(id *a1, void *a2, void *a3)
{
  char v52 = a2;
  uint64_t v5 = a3;
  if (a1)
  {
    if (v52) {
      id v6 = (void *)v52[2];
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    uint64_t v10 = objc_msgSend_length(v7, v8, v9);

    if (!v10)
    {
      sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNFCHandoverHandler processEnvelopeCommand:completionHandler:]", 116, a1, @"Unexpected payload length 0", v11, v12, v50);
      id v31 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v30, (uint64_t)&unk_2146D43C7, 2);
      ((void (**)(id, uint64_t, void *, id))v5)[2](v5, 1, v31, a1[1]);

      id v32 = objc_alloc_init(MEMORY[0x263EFF990]);
      id v33 = a1[1];
      a1[1] = v32;

      goto LABEL_18;
    }
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSNFCHandoverHandler processEnvelopeCommand:completionHandler:]", 123, a1, @"%@", v11, v12, (uint64_t)v52);
    id v13 = a1[1];
    id v14 = v13;
    if (v52)
    {
      id v15 = (id)v52[2];
      objc_msgSend_appendData_(v14, v16, (uint64_t)v15);

      if ((v52[1] & 0x10) != 0)
      {
        ((void (**)(id, uint64_t, void *, id))v5)[2](v5, 0, 0, a1[1]);
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend_appendData_(v13, 0, 0);
    }
    id v17 = a1[1];
    if (objc_msgSend_length(v17, v18, v19))
    {
      id v22 = v17;
      uint64_t v25 = (unsigned char *)objc_msgSend_bytes(v22, v23, v24);
      uint64_t v28 = objc_msgSend_length(v22, v26, v27);
      if (*v25 == 83)
      {
        if (v28 == 1)
        {
          uint64_t v29 = 49;
        }
        else
        {
          unint64_t v41 = v25[1];
          if ((char)v25[1] < 0)
          {
            int v46 = v41 & 0x7F;
            uint64_t v36 = v28 - 2;
            if (v28 - 2 < (v41 & 0x7F))
            {
              uint64_t v29 = 59;
              goto LABEL_15;
            }
            unint64_t v41 = 0;
            uint64_t v42 = v25 + 2;
            if (v28 != 2 && v46)
            {
              unint64_t v41 = 0;
              uint64_t v47 = 2 - v28;
              do
              {
                unsigned int v48 = *v42++;
                unint64_t v41 = v48 | (v41 << 8);
                --v46;
                uint64_t v49 = v47 + 1;
                if (!(_BYTE)v46) {
                  break;
                }
                ++v47;
              }
              while (v47);
              uint64_t v36 = -v49;
            }
          }
          else
          {
            uint64_t v42 = v25 + 2;
            uint64_t v36 = v28 - 2;
          }
          if (v41 == v36)
          {
            id v43 = v22;
            uint64_t v35 = (uint64_t)&v42[-objc_msgSend_bytes(v43, v44, v45)];

            if (v36)
            {
              id v37 = 0;
              goto LABEL_17;
            }
LABEL_16:
            id v37 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v34, (uint64_t)&unk_2146D43C7, 2);
LABEL_17:
            id v38 = objc_msgSend_subdataWithRange_(a1[1], v34, v35, v36);
            ((void (**)(id, uint64_t, void *, void *))v5)[2](v5, 1, v37, v38);

            id v39 = objc_alloc_init(MEMORY[0x263EFF990]);
            id v40 = a1[1];
            a1[1] = v39;

            goto LABEL_18;
          }
          uint64_t v29 = 73;
        }
      }
      else
      {
        uint64_t v29 = 44;
      }
    }
    else
    {
      uint64_t v29 = 36;
    }
LABEL_15:
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNFCHandoverHandler _extractContentFromTag53:]", v29, a1, @"Invalid ENVELOPE payload", v20, v21, v51);

    uint64_t v35 = 0;
    uint64_t v36 = 0;
    goto LABEL_16;
  }
LABEL_18:
}

void *sub_2146D2518(void *result, void *a2)
{
  if (result)
  {
    id v2 = result;
    result[3] = 0;
    v2[2] = sub_2146D207C(result, a2);
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

id sub_2146D2564(uint64_t a1, unint64_t a2, BOOL *a3)
{
  if (!a1)
  {
LABEL_13:
    id v14 = 0;
    goto LABEL_21;
  }
  id v6 = *(id *)(a1 + 16);
  if (!v6
    || (uint64_t v11 = v6,
        uint64_t v12 = *(void *)(a1 + 24),
        uint64_t v13 = objc_msgSend_length(*(void **)(a1 + 16), v7, v8),
        v11,
        v12 == v13))
  {
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSNFCHandoverHandler getResponseAPDUWithChunkSize:isLastChunk:]", 148, (void *)a1, @"Empty response buffer", v9, v10, v41);
    if (a3)
    {
      id v14 = 0;
      *a3 = 1;
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  if (a2 > 0x1000)
  {
    a2 = 4096;
    sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSNFCHandoverHandler getResponseAPDUWithChunkSize:isLastChunk:]", 154, (void *)a1, @"Restrict chunk size to %lu", v9, v10, 4096);
  }
  id v15 = *(id *)(a1 + 16);
  uint64_t v18 = objc_msgSend_length(v15, v16, v17);
  uint64_t v19 = *(void *)(a1 + 24);

  if (v18 - v19 >= a2) {
    unint64_t v20 = a2;
  }
  else {
    unint64_t v20 = v18 - v19;
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
  id v22 = objc_msgSend_subdataWithRange_(*(void **)(a1 + 16), v21, *(void *)(a1 + 24), v20);
  objc_msgSend_appendData_(v14, v23, (uint64_t)v22);

  uint64_t v24 = *(void **)(a1 + 16);
  *(void *)(a1 + 24) += v20;
  id v25 = v24;
  uint64_t v28 = objc_msgSend_length(v25, v26, v27);
  uint64_t v29 = *(void *)(a1 + 24);

  char v31 = v28 - v29;
  if ((unint64_t)(v28 - v29) >= 0x100)
  {
    char v31 = 0;
LABEL_16:
    char v32 = 97;
    goto LABEL_17;
  }
  if (v28 != v29) {
    goto LABEL_16;
  }
  char v31 = 0;
  char v32 = -112;
LABEL_17:
  v42[0] = v32;
  v42[1] = v31;
  objc_msgSend_appendBytes_length_(v14, v30, (uint64_t)v42, 2);
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v36 = objc_msgSend_length(*(void **)(a1 + 16), v34, v35);
  if (a3) {
    *a3 = v33 == v36;
  }
  if (v33 == v36)
  {
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSNFCHandoverHandler getResponseAPDUWithChunkSize:isLastChunk:]", 184, (void *)a1, @"Buffer all read", v37, v38, v41);
    id v39 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
  }
LABEL_21:

  return v14;
}

id sub_2146D2EF8(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)STSXPCHelperClientEntitlementChecker;
    a1 = objc_msgSendSuper2(&v21, sel_init);
    if (a1)
    {
      *((_DWORD *)a1 + 3) = objc_msgSend_processIdentifier(v3, v4, v5);
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (v3) {
        objc_msgSend_auditToken(v3, v6, v7);
      }
      else {
        memset(&token, 0, sizeof(token));
      }
      SecTaskRef v9 = SecTaskCreateWithAuditToken(v8, &token);
      if (v9)
      {
        uint64_t v12 = v9;
        uint64_t v13 = @"com.apple.sts.xpchelperclient.transceive.proxy.listener";
        CFErrorRef error = 0;
        CFTypeRef v16 = SecTaskCopyValueForEntitlement(v12, @"com.apple.sts.xpchelperclient.transceive.proxy.listener", &error);
        if (error)
        {
          sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelperClientEntitlementChecker _copyValueOfEntitlement:secTask:]", 34, a1, @"Failed to get entitlements: %@", v14, v15, (uint64_t)error);
          CFRelease(error);
        }
        if (v16)
        {
          CFTypeID v17 = CFGetTypeID(v16);
          BOOL v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v16) != 0;
          CFRelease(v16);
        }
        else
        {
          BOOL v18 = 0;
        }

        *((unsigned char *)a1 + 8) = v18;
        CFRelease(v12);
      }
      else
      {
        sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelperClientEntitlementChecker initWithConnection:]", 88, a1, @"Cannot create SecTaskRef with XPC Connection: %@", v10, v11, (uint64_t)v3);

        a1 = 0;
      }
    }
  }

  return a1;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}