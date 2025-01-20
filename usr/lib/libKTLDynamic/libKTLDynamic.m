uint64_t ___ZL14ICE_FILER_readP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_EU13block_pointerFvjjE_block_invoke(uint64_t a1, AriMsg *a2, unsigned int a3)
{
  AriHost *BufCtx;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned char __b[3072];
  uint64_t v15;

  v15 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  BufCtx = (AriHost *)AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  if (ARI_CsiIceFilerReadRspCb_Extract())
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read_block_invoke", (uint64_t)"Error: Failed ARI_EXTRACT on copyReceiveData (Remaining=%d/%d)\n", v7, v8, v9, v10, v11, v12, *(unsigned int *)(*(void *)(a1 + 32) + 48));
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = -7;
  }
  else
  {
    IceFilerReadRspCb(-1431655766, 0xAAAAAAAA, __b, BufCtx);
  }
  return 0;
}

void __destroy_helper_block_e8_32r40r48c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

__n128 KTLDebugRegisterDelegate(__n128 *a1)
{
  __n128 result = *a1;
  off_26AA6F9C8 = (uint64_t (*)(void, void, void))a1[1].n128_u64[0];
  *(__n128 *)&gDelegate = result;
  return result;
}

uint64_t __KTLNVMSendRegister_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiFpRegisterRsp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLNVMSendRegister(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v39 = v2;
  int v40 = 14;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v31 = 0;
    int v41 = 0;
    unsigned int v42 = v2;
    uint64_t v35 = 0;
    if (ARI_CsiFpRegister_ENC()
      || (v4 = operator new(0x18uLL),
          uint64_t v5 = v35,
          v4[2] = v41,
          *((void *)v4 + 2) = v5,
          *(void *)v4 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v4))
      || !KTLUTACopyReceiveData(a1, &v31))
    {
      BOOL v14 = 0;
      unsigned int v15 = 14;
      return !v15 && v14;
    }
    uint64_t v6 = v31;
    (*(void (**)(uint64_t))(*(void *)v31 + 16))(v31);
    int v7 = ARI_CsiFpRegisterRsp_Extract();
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    BOOL v14 = v7 == 0;
    unsigned int v15 = v40;
    if (v14) {
      goto LABEL_27;
    }
    return !v15 && v14;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2000000000;
  int v38 = 14;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2000000000;
  int v34 = -1;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (ARI_CsiFpRegister_BLK())
  {
    BOOL v14 = 0;
    unsigned int v15 = *((_DWORD *)v36 + 6);
    int v40 = v15;
    v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v26 = dispatch_semaphore_wait(v17, v19);
  if (v26) {
    _KTLErrorPrint((uint64_t)"KTLNVMSendRegister", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v29);
  }
  if (v39) {
    AriHost::ExitTrx((AriHost *)v39);
  }
  unsigned int v15 = *((_DWORD *)v36 + 6);
  int v40 = v15;
  if (v26)
  {
    BOOL v14 = 0;
    v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v14 = *((_DWORD *)v32 + 6) == 0;
  v18 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v18);
LABEL_24:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  if (v14)
  {
LABEL_27:
    if (v15)
    {
      if (v15 > 0xE) {
        v27 = "Unknown";
      }
      else {
        v27 = off_2644139F8[v15 - 1];
      }
      _KTLErrorPrint((uint64_t)"KTLNVMSendRegister", (uint64_t)"Error: CsiFpRegisterRsp Failure (%s)\n", v8, v9, v10, v11, v12, v13, (uint64_t)v27);
      unsigned int v15 = v40;
    }
  }
  return !v15 && v14;
}

void sub_21C63C768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  if (object) {
    dispatch_release(object);
  }
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v18 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMSendUpdateAck(uint64_t a1, BOOL *a2)
{
  uint64_t v46 = 0;
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  unsigned int v45 = v4;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    uint64_t v37 = 0;
    LODWORD(v33) = v4;
    int v47 = 0;
    uint64_t v41 = 0;
    if (ARI_CsiFpUpdateAck_ENC()
      || (uint64_t v6 = operator new(0x18uLL),
          uint64_t v7 = v41,
          v6[2] = v47,
          *((void *)v6 + 2) = v7,
          *(void *)uint64_t v6 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v6))
      || !KTLUTACopyReceiveData(a1, &v37))
    {
      unsigned int v17 = 0;
      BOOL v16 = 0;
      goto LABEL_32;
    }
    uint64_t v8 = v37;
    (*(void (**)(uint64_t))(*(void *)v37 + 16))(v37);
    int v9 = ARI_CsiFpUpdateAckRsp_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    BOOL v16 = v9 == 0;
    unsigned int v17 = HIDWORD(v46);
    if (v16) {
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  uint64_t v41 = 0;
  unsigned int v42 = &v41;
  uint64_t v43 = 0x2000000000;
  int v44 = 14;
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x2000000000;
  int v40 = -1431655766;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2000000000;
  int v36 = -1;
  uint64_t v18 = dispatch_semaphore_create(0);
  dispatch_time_t v19 = v18;
  dispatch_object_t object = v18;
  if (v18) {
    dispatch_retain(v18);
  }
  if (ARI_CsiFpUpdateAck_BLK())
  {
    BOOL v16 = 0;
    unsigned int v17 = *((_DWORD *)v42 + 6);
    LODWORD(v46) = *((_DWORD *)v38 + 6);
    HIDWORD(v46) = v17;
    uint64_t v20 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v21 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v28 = dispatch_semaphore_wait(v19, v21);
  if (v28) {
    _KTLErrorPrint((uint64_t)"KTLNVMSendUpdateAck", (uint64_t)"Timeout waiting for response.\n", v22, v23, v24, v25, v26, v27, v31);
  }
  if (v45) {
    AriHost::ExitTrx((AriHost *)v45);
  }
  unsigned int v17 = *((_DWORD *)v42 + 6);
  LODWORD(v46) = *((_DWORD *)v38 + 6);
  HIDWORD(v46) = v17;
  if (v28)
  {
    BOOL v16 = 0;
    uint64_t v20 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v16 = *((_DWORD *)v34 + 6) == 0;
  uint64_t v20 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v20);
LABEL_24:
  if (v19) {
    dispatch_release(v19);
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  if (v16)
  {
LABEL_27:
    if (v17)
    {
      if (v17 > 0xE) {
        uint64_t v29 = "Unknown";
      }
      else {
        uint64_t v29 = off_2644139F8[v17 - 1];
      }
      _KTLErrorPrint((uint64_t)"KTLNVMSendUpdateAck", (uint64_t)"Error: CsiFpUpdateAckRsp Failure (%s)\n", v10, v11, v12, v13, v14, v15, (uint64_t)v29);
      unsigned int v17 = HIDWORD(v46);
    }
  }
LABEL_32:
  *a2 = v46 != 0;
  return !v17 && v16;
}

void sub_21C63CB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (object) {
    dispatch_release(object);
  }
  if (v23) {
    dispatch_release(v23);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v24 - 112), 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32r40r48r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  unsigned int v2 = *(NSObject **)(a1 + 56);
  if (v2) {
    dispatch_release(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

void __copy_helper_block_e8_32r40r48r56c25_ZTSN8dispatch9semaphoreE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  unsigned int v4 = *(NSObject **)(a2 + 56);
  a1[7] = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

uint64_t __KTLNVMSendUpdateAck_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiFpUpdateAckRsp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t ICE_FILER_read(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    return ICE_FILER_read(a1, 0, a2, a3, a4, a5, a6, a8);
  }
  else
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Invalid Parameter.\n", a3, a4, a5, a6, a7, a8, v8);
    return 0xFFFFFFFFLL;
  }
}

intptr_t IceFilerReadRspCb(int a1, unsigned int a2, const void *a3, AriHost *a4)
{
  if (pthread_mutex_lock(&ice_filer_lookup_mutex))
  {
    uint64_t v14 = 0;
    if (a1)
    {
LABEL_3:
      intptr_t result = _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. Uta Failure from Baseband.\n", v8, v9, v10, v11, v12, v13, v27);
      int v16 = -3;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v14 = qword_26AA6FA28;
    if ((int *)qword_26AA6FA28 == &ice_filer_lookup_head)
    {
LABEL_10:
      pthread_mutex_unlock(&ice_filer_lookup_mutex);
      return _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. ARI Context ID %x not on Lookup Table.\n", v18, v19, v20, v21, v22, v23, (uint64_t)a4);
    }
    while (*(_DWORD *)v14 != a4)
    {
      uint64_t v14 = *(void *)(v14 + 80);
      if ((int *)v14 == &ice_filer_lookup_head) {
        goto LABEL_10;
      }
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
    if (a1) {
      goto LABEL_3;
    }
  }
  if (a3)
  {
    if (*(_DWORD *)(v14 + 48) >= a2)
    {
      intptr_t result = *(void *)(v14 + 8);
      if (result)
      {
        if (a2)
        {
          uint64_t v25 = *(unsigned int (**)(void))result;
          if (*(void *)result)
          {
            while (v25())
            {
              uint64_t v25 = **(unsigned int (***)(void))(v14 + 8);
              if (!v25) {
                goto LABEL_31;
              }
            }
            uint64_t v25 = 0;
          }
LABEL_31:
          intptr_t result = _KTLErrorPrint((uint64_t)"ICE_FILER_transport_write", (uint64_t)"Error: TelephonyUtilTransportWrite (ret=%d, available=%d, written=%d).\n", v8, v9, v10, v11, v12, v13, (uint64_t)v25);
          *(_DWORD *)(v14 + 72) = -6;
        }
      }
      else
      {
        intptr_t result = (intptr_t)memcpy(*(void **)(v14 + 40), a3, a2);
        *(void *)(v14 + 40) += a2;
      }
      unsigned int v26 = *(_DWORD *)(v14 + 48) - a2;
      *(_DWORD *)(v14 + 48) = v26;
      if (v26) {
        goto LABEL_5;
      }
      int v16 = *(_DWORD *)(v14 + 32);
    }
    else
    {
      intptr_t result = _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. Buffer Overflow.\n", v8, v9, v10, v11, v12, v13, v27);
      int v16 = -2;
    }
  }
  else
  {
    intptr_t result = _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. NUL p_data from Baseband.\n", v8, v9, v10, v11, v12, v13, v27);
    int v16 = -4;
  }
LABEL_4:
  *(_DWORD *)(v14 + 72) = v16;
LABEL_5:
  uint64_t v17 = *(void *)(v14 + 16);
  if (!*(void *)(v17 + 8))
  {
    if (*(_DWORD *)(v17 + 16))
    {
      intptr_t result = *(unsigned int *)(v14 + 72);
      if (result)
      {
        uint64_t v24 = *(void (**)(void))(v14 + 56);
        if (v24)
        {
          v24();
          return ICE_FILER_lookup_remove(a4);
        }
        else
        {
          intptr_t result = *(void *)(v14 + 64);
          if (result) {
            return dispatch_semaphore_signal((dispatch_semaphore_t)result);
          }
        }
      }
    }
  }
  return result;
}

uint64_t __KTLNVMReadUpdateHeader_block_invoke(void *a1, AriMsg *a2, unsigned int a3)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = ARI_CsiFpUpdateHeaderData_Extract();
  int BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  uint64_t v7 = a1[9];
  *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = BufCtx;
  dispatch_semaphore_signal(v7);
  return *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
}

uint64_t ICE_FILER_read(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  int v60 = a5;
  if (!a1 || (unsigned int v8 = a4) == 0 || (v10 = a2, (a2 == 0) == (a3 == 0)))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Invalid Parameter.\n", a3, a4, a5, a6, a7, a8, v52);
    return 0xFFFFFFFFLL;
  }
  unsigned int v13 = a5;
  if (!*(void *)(a1 + 8) && !(_BYTE)a5 && *(_DWORD *)(a1 + 16))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Missing required transaction ID: context_id=%x\n", a3, a4, a5, a6, a7, a8, a5);
    return 0xFFFFFFFFLL;
  }
  if (pthread_mutex_lock(&ice_filer_lookup_mutex)) {
    goto LABEL_6;
  }
  uint64_t v23 = qword_26AA6FA28;
  if ((int *)qword_26AA6FA28 != &ice_filer_lookup_head)
  {
    uint64_t v24 = qword_26AA6FA28;
    while (*(_DWORD *)v24 != v13)
    {
      uint64_t v24 = *(void *)(v24 + 80);
      if ((int *)v24 == &ice_filer_lookup_head) {
        goto LABEL_17;
      }
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
LABEL_6:
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Context Already Exists.\n", v15, v16, v17, v18, v19, v20, v52);
    return 4294967291;
  }
LABEL_17:
  uint64_t v25 = (unsigned int *)operator new(0x60uLL);
  *((void *)v25 + 8) = 0;
  *uint64_t v25 = v13;
  *((void *)v25 + 1) = a3;
  *((void *)v25 + 2) = a1;
  if (a3) {
    uint64_t v10 = operator new[](0xC00uLL);
  }
  *((void *)v25 + 3) = v10;
  v25[8] = v8;
  *((void *)v25 + 5) = v10;
  v25[12] = v8;
  *((void *)v25 + 7) = a6;
  *((void *)v25 + 8) = 0;
  v25[18] = 0;
  *((void *)v25 + 10) = v23;
  *((void *)v25 + 11) = &ice_filer_lookup_head;
  *(void *)(v23 + 88) = v25;
  qword_26AA6FA28 = (uint64_t)v25;
  _KTLDebugFlags = 13;
  pthread_mutex_unlock(&ice_filer_lookup_mutex);
  if (*(void *)(a1 + 8) || !*(_DWORD *)(a1 + 16))
  {
    int v54 = 0;
    v53[0] = 0;
    v53[1] = 0;
    ARI_CsiIceFilerReadReq_ENC();
    unsigned int v26 = operator new(0x18uLL);
    v26[2] = 0;
    *((void *)v26 + 2) = 0;
    *(void *)unsigned int v26 = &unk_26CCDD1F8;
    KTLUTASendAndReleaseData(a1, v26);
    if (!v25[18])
    {
      while (1)
      {
        if (a7) {
          (*(void (**)(uint64_t, void))(a7 + 16))(a7, v25[8] - v25[12]);
        }
        if (!KTLUTACopyReceiveData(a1, v53)) {
          break;
        }
        memset(__b, 170, sizeof(__b));
        uint64_t v33 = (unsigned int *)v53[0];
        int v34 = (AriMsg *)(*(uint64_t (**)(uint64_t))(*(void *)v53[0] + 16))(v53[0]);
        int BufCtx = (AriHost *)AriMsg::GetBufCtx(v34, (const unsigned __int8 *)v33[2]);
        (*(void (**)(unsigned int *))(*(void *)v33 + 16))(v33);
        if (ARI_CsiIceFilerReadRspCb_Extract())
        {
          _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: Failed ARI_EXTRACT on copyReceiveData (Remaining=%d/%d)\n", v36, v37, v38, v39, v40, v41, v25[12]);
          v25[18] = -7;
        }
        else
        {
          IceFilerReadRspCb(-1431655766, 0xAAAAAAAA, __b, BufCtx);
        }
        (*(void (**)(unsigned int *))(*(void *)v33 + 8))(v33);
        if (v25[18]) {
          goto LABEL_40;
        }
      }
      _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Failed copyReceiveData (Remaining=%d/%d)\n", v27, v28, v29, v30, v31, v32, v25[12]);
    }
LABEL_40:
    if (a7) {
      (*(void (**)(uint64_t, void))(a7 + 16))(a7, v25[8] - v25[12]);
    }
    uint64_t v21 = v25[18];
    ICE_FILER_lookup_remove((AriHost *)v60);
  }
  else
  {
    if (!a6)
    {
      dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
      uint64_t v43 = *((void *)v25 + 8);
      *((void *)v25 + 8) = v42;
      if (v43) {
        dispatch_release(v43);
      }
    }
    uint64_t v55 = MEMORY[0x263EF8330];
    uint64_t v56 = 0x40000000;
    v57 = ___ZL14ICE_FILER_readP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_EU13block_pointerFvjjE_block_invoke;
    v58 = &__block_descriptor_tmp_15;
    v59 = v25;
    int Req_BLK = ARI_CsiIceFilerReadReq_BLK();
    if (!*((void *)v25 + 8)) {
      return 0xFFFFFFFFLL;
    }
    if (!Req_BLK)
    {
      dispatch_time_t v45 = dispatch_time(0, 1000000 * (*(_DWORD *)(a1 + 20) - v25[8] / 0xC00 + 8 * (v25[8] / 0xC00)));
      if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)v25 + 8), v45)) {
        _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Timeout waiting for transfer to complete\n", v46, v47, v48, v49, v50, v51, v52);
      }
    }
    uint64_t v21 = v25[18];
    ICE_FILER_lookup_remove((AriHost *)v60);
  }
  return v21;
}

{
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    return ICE_FILER_read(a1, a2, 0, a3, a4, a5, 0, a8);
  }
  else
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Invalid Parameter.\n", a3, a4, a5, a6, a7, a8, v8);
    return 0xFFFFFFFFLL;
  }
}

uint64_t __KTLNVMSendDeregister_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiFpRegisterRsp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __KTLNVMSendSnapshot_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiFpSnapshotRsp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_21C63B000);
  }
  return result;
}

void *trace::ARICommandDriver::ARICommandDriver(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  return result;
}

{
  *uint64_t result = a2;
  return result;
}

uint64_t trace::ARICommandDriver::TraceConfig(uint64_t *a1, uint64_t a2, AriSdk::ARI_TraceSetConfigRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_TraceSetConfigRspCb_SDK *)operator new(0x48uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_TraceSetConfigRspCb_SDK::ARI_TraceSetConfigRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  v73 = __Block_byref_object_copy_;
  v74 = __Block_byref_object_dispose_;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_TraceSetConfigRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 1560477696);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_TraceSetConfigRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_TraceSetConfigRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"TraceConfig", (uint64_t)"Failed to run TraceSetConfigReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C63DA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_TraceSetConfigRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  unsigned int v4 = (AriSdk::ARI_TraceSetConfigRspCb_SDK *)operator new(0x48uLL);
  AriSdk::ARI_TraceSetConfigRspCb_SDK::ARI_TraceSetConfigRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C63DBD0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

uint64_t KTLDebugSetOutputFile(uint64_t a1)
{
  uint64_t result = sKTLDebugOutputFile;
  if (sKTLDebugOutputFile) {
    uint64_t result = fclose((FILE *)sKTLDebugOutputFile);
  }
  sKTLDebugOutputFile = a1;
  return result;
}

double KTLDebugSetDefaults()
{
  double result = *(double *)&gDelegateDefault;
  *(_OWORD *)&gDelegate = gDelegateDefault;
  off_26AA6F9C8 = (uint64_t (*)(void, void, void))off_26CCDD180;
  _KTLDebugFlags = 15;
  return result;
}

uint64_t KTLDebugSetFlags(uint64_t result)
{
  _KTLDebugFlags = result;
  return result;
}

uint64_t _KTLDebugPrint(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_KTLDebugFlags) {
    return gDelegate(result, a2, &a9);
  }
  return result;
}

uint64_t _KTLErrorPrint(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((_KTLDebugFlags & 4) != 0) {
    return (*(&gDelegate + 1))(result, a2, &a9);
  }
  return result;
}

uint64_t _KTLDebugPrintStdout(const char *a1, const char *a2, va_list a3)
{
  if (!sKTLDebugOutputFile)
  {
    sKTLDebugOutputFile = (uint64_t)fopen("/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log", "a");
    if (!sKTLDebugOutputFile)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Warning: Failed to open %s for writing\n", "/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log");
      sKTLDebugOutputFile = (uint64_t)fopen("/dev/null", "w");
    }
  }
  unsigned int SystemTime = TelephonyUtilGetSystemTime();
  fprintf((FILE *)sKTLDebugOutputFile, "%u.%03u %s:", SystemTime / 0x3E8, SystemTime % 0x3E8, a1);
  vfprintf((FILE *)sKTLDebugOutputFile, a2, a3);
  uint64_t v7 = (FILE *)sKTLDebugOutputFile;

  return fflush(v7);
}

uint64_t _KTLDebugPrintBinaryStdout(const char *a1, int a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!sKTLDebugOutputFile)
  {
    sKTLDebugOutputFile = (uint64_t)fopen("/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log", "a");
    if (!sKTLDebugOutputFile)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Warning: Failed to open %s for writing\n", "/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log");
      sKTLDebugOutputFile = (uint64_t)fopen("/dev/null", "w");
    }
  }
  size_t BufferSize = TelephonyUtilLogGetBufferSize();
  if (MEMORY[0x270FA5388]()) {
    memset((char *)v9 - ((BufferSize + 15) & 0x1FFFFFFF0), 170, BufferSize);
  }
  uint64_t v5 = "misc";
  if (a2 == 1) {
    uint64_t v5 = "recv";
  }
  if (a2) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = "send";
  }
  TelephonyUtilLogBinaryToBuffer();
  unsigned int SystemTime = TelephonyUtilGetSystemTime();
  fprintf((FILE *)sKTLDebugOutputFile, "%u.%03u [%s] %s\n%s", SystemTime / 0x3E8, SystemTime % 0x3E8, v6, a1, (const char *)v9 - ((BufferSize + 15) & 0x1FFFFFFF0));
  return fflush((FILE *)sKTLDebugOutputFile);
}

uint64_t GetBBIPCLogs(uint64_t a1, uint64_t a2)
{
  return GetBBIPCLogs(a1, 0, a2);
}

uint64_t GetBBIPCLogs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  unint64_t v119 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v118[3] = v5;
  v118[4] = v5;
  v118[1] = v5;
  v118[2] = v5;
  v118[0] = v5;
  unint64_t v140 = 0xAAAAAAAAAAAAAAAALL;
  v139[10] = v5;
  v139[11] = v5;
  v139[8] = v5;
  v139[9] = v5;
  v139[6] = v5;
  v139[7] = v5;
  v139[4] = v5;
  v139[5] = v5;
  v139[2] = v5;
  v139[3] = v5;
  v139[0] = v5;
  v139[1] = v5;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  unint64_t v148 = 0;
  unsigned int v6 = *(_DWORD *)(a1 + 16);
  unsigned int v138 = v6;
  if (!*(void *)(a1 + 8) && v6)
  {
    unint64_t v160 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v158 = v7;
    long long v159 = v7;
    long long v156 = v7;
    long long v157 = v7;
    long long v154 = v7;
    long long v155 = v7;
    long long v153 = v7;
    uint64_t v133 = 0;
    v134 = &v133;
    uint64_t v135 = 0x2000000000;
    v136 = &v153;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2000000000;
    int v132 = -1;
    *(void *)__dst = 0;
    v150 = __dst;
    uint64_t v151 = 0x2000000000;
    int v152 = -1431655766;
    uint64_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = v8;
    uint64_t v120 = MEMORY[0x263EF8330];
    uint64_t v121 = 1174405120;
    uint64_t v122 = (uint64_t)___ZL22KTLGetIPCLogBufferListP10KTLOptionsP22CsiIceIpcLogBufferList_block_invoke;
    v123 = &__block_descriptor_tmp_1;
    v124 = &v129;
    v125 = __dst;
    v126 = &v133;
    dispatch_object_t object = v8;
    if (v8) {
      dispatch_retain(v8);
    }
    LogBufferListint Req_BLK = ARI_CsiIpcGetLogBufferListReq_BLK();
    int v11 = LogBufferListReq_BLK;
    _KTLDebugPrint((uint64_t)"KTLGetIPCLogBufferList", (uint64_t)"sendRet=%d\n", v12, v13, v14, v15, v16, v17, LogBufferListReq_BLK);
    if (v11)
    {
      BOOL v24 = 0;
      unint64_t v148 = v160;
      long long v145 = v157;
      long long v146 = v158;
      long long v147 = v159;
      long long v141 = v153;
      long long v142 = v154;
      long long v143 = v155;
      long long v144 = v156;
    }
    else
    {
      dispatch_time_t v36 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v37 = dispatch_semaphore_wait(v9, v36);
      if (v37) {
        _KTLErrorPrint((uint64_t)"KTLGetIPCLogBufferList", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v114);
      }
      if (v138) {
        AriHost::ExitTrx((AriHost *)v138);
      }
      long long v145 = v157;
      long long v146 = v158;
      long long v147 = v159;
      unint64_t v148 = v160;
      long long v141 = v153;
      long long v142 = v154;
      long long v143 = v155;
      long long v144 = v156;
      BOOL v24 = !v37 && !*((_DWORD *)v130 + 6) && *((_DWORD *)v150 + 6) == 0;
    }
    _KTLDebugPrint((uint64_t)"KTLGetIPCLogBufferList", (uint64_t)"ret=%d list size=%lu\n", v18, v19, v20, v21, v22, v23, v24);
    if (object) {
      dispatch_release(object);
    }
    if (v9) {
      dispatch_release(v9);
    }
    _Block_object_dispose(__dst, 8);
    _Block_object_dispose(&v129, 8);
    _Block_object_dispose(&v133, 8);
    if (v24) {
      goto LABEL_24;
    }
LABEL_11:
    _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBufferList returned false\n", v25, v26, v27, v28, v29, v30, v113);
    return 0;
  }
  int v137 = 0;
  uint64_t v133 = 0;
  LODWORD(v129) = v6;
  *(_DWORD *)__dst = 0;
  *(void *)&long long v153 = 0;
  if (ARI_CsiIpcGetLogBufferListReq_ENC()) {
    goto LABEL_11;
  }
  uint64_t v31 = operator new(0x18uLL);
  uint64_t v32 = v153;
  v31[2] = *(_DWORD *)__dst;
  *((void *)v31 + 2) = v32;
  *(void *)uint64_t v31 = &unk_26CCDD1F8;
  if (!KTLUTASendAndReleaseData(a1, v31)) {
    goto LABEL_11;
  }
  if ((KTLUTACopyReceiveData(a1, &v133) & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v33 = v133;
  (*(void (**)(uint64_t))(*(void *)v133 + 16))(v133);
  int v34 = ARI_CsiIpcGetLogBufferListRsp_Extract();
  (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
  if (v34 | v137) {
    goto LABEL_11;
  }
LABEL_24:
  uint64_t v38 = 0;
  LOBYTE(v39) = 0;
  unsigned int v116 = 0;
  unint64_t v40 = (unint64_t)&v141 | 0xC;
  do
  {
    strncpy(__dst, (const char *)v40, 8uLL);
    LOBYTE(v150) = 0;
    _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"Fetching log buffer entry: filename=\"%s\" size=%d level=%d next=%d buf_p=%d\n", v41, v42, v43, v44, v45, v46, (uint64_t)__dst);
    if (*(_DWORD *)(v40 - 4) && *(_DWORD *)(v40 + 8))
    {
      if (strstr(__dst, "..") || strchr(__dst, 47))
      {
        _KTLErrorPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"Skipping potentially dangerous filename \"%s\"\n", v47, v48, v49, v50, v51, v52, (uint64_t)__dst);
        goto LABEL_26;
      }
      if (a2) {
        snprintf((char *)v139, 0xC8uLL, "%s/%s.bin");
      }
      else {
        snprintf((char *)v139, 0xC8uLL, "%s.bin");
      }
      int v59 = open((const char *)v139, 1537, 420);
      int v60 = "Failure";
      if (v59 >= 0) {
        int v60 = "Success";
      }
      _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"File Open: %s (name=\"%s\" descriptor=%d)\n", v53, v54, v55, v56, v57, v58, (uint64_t)v60);
      if (v59 < 0)
      {
        LOBYTE(v39) = 0;
        goto LABEL_26;
      }
      int v39 = TelephonyUtilTransportCreateWithFD();
      uint64_t v67 = "Failure";
      if (v39) {
        uint64_t v67 = "Success";
      }
      _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"TelephonyUtilTransportCreateWithFD: %s (filedesc=%d)\n", v61, v62, v63, v64, v65, v66, (uint64_t)v67);
      if (v39)
      {
        int v68 = *(_DWORD *)(a1 + 16);
        int v137 = v68;
        if (*(void *)(a1 + 8) || !v68)
        {
          int v128 = 0;
          LODWORD(v129) = v68;
          uint64_t v133 = 0;
          unsigned int v138 = 0;
          uint64_t v120 = 0;
          if (!ARI_CsiIpcGetLogBufferReq_ENC())
          {
            v109 = operator new(0x18uLL);
            uint64_t v110 = v120;
            v109[2] = v138;
            *((void *)v109 + 2) = v110;
            *(void *)v109 = &unk_26CCDD1F8;
            if (KTLUTASendAndReleaseData(a1, v109))
            {
              if (KTLUTACopyReceiveData(a1, &v133))
              {
                uint64_t v111 = v133;
                (*(void (**)(uint64_t))(*(void *)v133 + 16))(v133);
                int v112 = ARI_CsiIpcGetLogBufferRsp_Extract();
                (*(void (**)(uint64_t))(*(void *)v111 + 8))(v111);
                if (!(v112 | v128))
                {
                  _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBuffer: %s\n", v103, v104, v105, v106, v107, v108, (uint64_t)"Success");
LABEL_55:
                  int v95 = ICE_FILER_read(a1, 0, (uint64_t)v118, *(unsigned int *)(v40 - 4), v116, 0, a3, v94);
                  LOBYTE(v39) = v95 > 0;
                  v102 = "Failure";
                  if (v95 > 0) {
                    v102 = "Success";
                  }
                  _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"ICE_FILER_read: %s (return code=%d)\n", v96, v97, v98, v99, v100, v101, (uint64_t)v102);
                  goto LABEL_66;
                }
              }
            }
          }
          _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBuffer: %s\n", v103, v104, v105, v106, v107, v108, (uint64_t)"Failure");
LABEL_65:
          LOBYTE(v39) = 0;
LABEL_66:
          close(v59);
          TelephonyUtilTransportFree();
          goto LABEL_26;
        }
        uint64_t v120 = 0;
        uint64_t v121 = (uint64_t)&v120;
        uint64_t v122 = 0x2000000000;
        LODWORD(v123) = -1;
        uint64_t v133 = 0;
        v134 = &v133;
        uint64_t v135 = 0x2000000000;
        LODWORD(v136) = -1431655766;
        uint64_t v129 = 0;
        v130 = &v129;
        uint64_t v131 = 0x2000000000;
        int v132 = 0;
        uint64_t v69 = dispatch_semaphore_create(0);
        *(void *)&long long v153 = MEMORY[0x263EF8330];
        *((void *)&v153 + 1) = 1174405120;
        *(void *)&long long v154 = ___ZL18KTLGetIPCLogBufferP10KTLOptionsjjjPi_block_invoke;
        *((void *)&v154 + 1) = &__block_descriptor_tmp_22;
        *(void *)&long long v155 = &v120;
        *((void *)&v155 + 1) = &v133;
        *(void *)&long long v156 = &v129;
        uint64_t v70 = v69;
        *((void *)&v156 + 1) = v69;
        if (v69) {
          dispatch_retain(v69);
        }
        LogBufferint Req_BLK = ARI_CsiIpcGetLogBufferReq_BLK();
        int v72 = LogBufferReq_BLK;
        _KTLDebugPrint((uint64_t)"KTLGetIPCLogBuffer", (uint64_t)"sendRet=%d\n", v73, v74, v75, v76, v77, v78, LogBufferReq_BLK);
        if (!v72)
        {
          dispatch_time_t v85 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
          if (!dispatch_semaphore_wait(v70, v85))
          {
            unsigned int v116 = *((_DWORD *)v130 + 6);
            if (*(_DWORD *)(v121 + 24)) {
              BOOL v86 = 0;
            }
            else {
              BOOL v86 = *((_DWORD *)v134 + 6) == 0;
            }
LABEL_48:
            _KTLDebugPrint((uint64_t)"KTLGetIPCLogBuffer", (uint64_t)"ret=%d\n", v79, v80, v81, v82, v83, v84, v86);
            if (*((void *)&v156 + 1)) {
              dispatch_release(*((dispatch_object_t *)&v156 + 1));
            }
            if (v70) {
              dispatch_release(v70);
            }
            _Block_object_dispose(&v129, 8);
            _Block_object_dispose(&v133, 8);
            _Block_object_dispose(&v120, 8);
            v93 = "Failure";
            if (v86) {
              v93 = "Success";
            }
            _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBuffer: %s\n", v87, v88, v89, v90, v91, v92, (uint64_t)v93);
            if (v86) {
              goto LABEL_55;
            }
            goto LABEL_65;
          }
          _KTLErrorPrint((uint64_t)"KTLGetIPCLogBuffer", (uint64_t)"Timeout waiting for response.\n", v79, v80, v81, v82, v83, v84, v115);
        }
        BOOL v86 = 0;
        unsigned int v116 = *((_DWORD *)v130 + 6);
        goto LABEL_48;
      }
    }
LABEL_26:
    v40 += 24;
    ++v38;
  }
  while (v38 != 5);
  return v39 & 1;
}

void sub_21C63E928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v47 = *(NSObject **)(v45 - 184);
  if (v47) {
    dispatch_release(v47);
  }
  if (v44) {
    dispatch_release(v44);
  }
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21C63E970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,NSObject *object,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  if (object) {
    dispatch_release(object);
  }
  if (v44) {
    dispatch_release(v44);
  }
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL22KTLGetIPCLogBufferListP10KTLOptionsP22CsiIceIpcLogBufferList_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIpcGetLogBufferListRsp_Extract();
  _KTLDebugPrint((uint64_t)"KTLGetIPCLogBufferList_block_invoke", (uint64_t)"blockRet=%d\n", v2, v3, v4, v5, v6, v7, *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void ktl::KTLARIPacket::~KTLARIPacket(AriMsg **this, unsigned __int8 *a2)
{
  *this = (AriMsg *)&unk_26CCDD1F8;
  AriMsg::ReleaseEncodedMessage(this[2], a2);
}

{
  uint64_t vars8;

  *this = (AriMsg *)&unk_26CCDD1F8;
  AriMsg::ReleaseEncodedMessage(this[2], a2);

  operator delete(this);
}

uint64_t ktl::KTLPacket::getBuffer(ktl::KTLPacket *this)
{
  return *((void *)this + 2);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t ___ZL18KTLGetIPCLogBufferP10KTLOptionsjjjPi_block_invoke(uint64_t a1, AriMsg *a2, unsigned int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIpcGetLogBufferRsp_Extract();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  _KTLDebugPrint((uint64_t)"KTLGetIPCLogBuffer_block_invoke", (uint64_t)"blockRet=%d blockCtxId=%d\n", v6, v7, v8, v9, v10, v11, *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void *eUICC::VinylCommandDriver::VinylCommandDriver(void *result, uint64_t a2)
{
  *double result = a2;
  if (*(_DWORD *)(a2 + 20) >> 4 <= 0x270u) {
    *(_DWORD *)(a2 + 20) = 10000;
  }
  return result;
}

{
  *double result = a2;
  if (*(_DWORD *)(a2 + 20) >> 4 <= 0x270u) {
    *(_DWORD *)(a2 + 20) = 10000;
  }
  return result;
}

uint64_t eUICC::VinylCommandDriver::GetVinylType(eUICC::VinylCommandDriver *this, AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *a2, AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK **a3)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t SimDataRspCb = ktl::CommandDriver::perform<AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK>((uint64_t *)this, 755040256, &v20, a3, v5, v6, v7, v8);
  uint64_t v16 = SimDataRspCb;
  uint64_t v17 = v21;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if (v16) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if ((SimDataRspCb & 1) == 0) {
LABEL_4:
  }
    _KTLErrorPrint((uint64_t)"GetVinylType", (uint64_t)"%s \n", v10, v11, v12, v13, v14, v15, (uint64_t)"VinylCommandDriver GetVinylType perform failure");
LABEL_5:
  uint64_t v18 = v23;
  if (!v23 || atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v16;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  return v16;
}

void sub_21C63ED50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_21C63ED6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ktl::CommandDriver::perform<AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK>(uint64_t *a1, uint64_t a2, uint64_t **a3, AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a4 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = **a3;
    uint64_t v14 = (*a3)[1] - v13;
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v60) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, v14);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && (((unsigned int (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v60, 1, v15, 0)? (BOOL v22 = v60 == v14): (BOOL v22 = 0), v22))
    {
      uint64_t v60 = 0;
      if (KTLUTACopyReceiveData(*a1, &v60))
      {
        uint64_t v38 = v60;
        if (v60)
        {
          int v39 = (AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *)operator new(0xD8uLL);
          unint64_t v40 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v38 + 16))(v38);
          AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::ARI_IBISimAccessGetSimDataRspCb_SDK(v39, v40);
          *a4 = v39;
          (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
          goto LABEL_26;
        }
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v29 = "error while trying to get response from device \n";
LABEL_11:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v29, v23, v24, v25, v26, v27, v28, v59);
    goto LABEL_12;
  }
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x3002000000;
  uint64_t v63 = __Block_byref_object_copy__0;
  uint64_t v64 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v31 = AriHost::Send();
  if (v31)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v32, v33, v34, v35, v36, v37, v31);
    goto LABEL_23;
  }
  uint64_t v41 = v61;
  dispatch_time_t v42 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v41[5], v42))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v43, v44, v45, v46, v47, v48, v59);
LABEL_23:
    char v49 = 0;
    _Block_object_dispose(&v60, 8);
    uint64_t v50 = object;
    if (!object) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  char v49 = 1;
  _Block_object_dispose(&v60, 8);
  uint64_t v50 = object;
  if (object) {
LABEL_24:
  }
    dispatch_release(v50);
LABEL_25:
  if ((v49 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_26:
  char hasDeclaredGmid = AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::hasDeclaredGmid(*a4);
  uint64_t v52 = *a4;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v52) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a4);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v53, v54, v55, v56, v57, v58, a2);
      goto LABEL_12;
    }
    uint64_t v29 = "Received NACK\n";
    goto LABEL_11;
  }
  if (!AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::unpack(v52)) {
    return 1;
  }
LABEL_12:
  if (*a4) {
    (*(void (**)(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *))(*(void *)*a4 + 16))(*a4);
  }
  uint64_t result = 0;
  *a4 = 0;
  return result;
}

void sub_21C63F128(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21C63F13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object)
{
  if (!object) {
    _Unwind_Resume(a1);
  }
  dispatch_release(object);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::GetData(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylGetDataRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylGetDataRspCb_SDK *)operator new(0x210uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylGetDataRspCb_SDK::ARI_IBIVinylGetDataRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylGetDataRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372285952);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylGetDataRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetData", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver GetData perform failure");
  }
  return v42;
}

void sub_21C63F5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::InstallVad(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylInstallVadRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *)operator new(0x58uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::ARI_IBIVinylInstallVadRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372646400);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"InstallVad", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver InstallVad perform failure");
  }
  return v42;
}

void sub_21C63FB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::StreamFW(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylInstallFwRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  _KTLDebugFlags = 13;
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *)operator new(0x58uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::ARI_IBIVinylInstallFwRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372679168);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"StreamFW", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver StreamFW perform failure");
  }
  _KTLDebugFlags = 15;
  return v42;
}

void sub_21C640024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::SwitchCardMode(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *)operator new(0x58uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::ARI_IBIVinylSwitchModeRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372613632);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"SwitchCardMode", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver SwitchCardMode perform failure");
  }
  return v42;
}

void sub_21C640534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::GetEid(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylGetEidRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylGetEidRspCb_SDK *)operator new(0x68uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylGetEidRspCb_SDK::ARI_IBIVinylGetEidRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylGetEidRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372253184);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylGetEidRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetEid", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver GetEid perform failure");
  }
  return v42;
}

void sub_21C640A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylTapeRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylTapeRspCb_SDK *)operator new(0x90uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylTapeRspCb_SDK::ARI_IBIVinylTapeRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylTapeRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372351488);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylTapeRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylTapeRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"DeleteProfile", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver DeleteProfile perform failure");
  }
  return v42;
}

void sub_21C640F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::InitPerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylInitPsoRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *)operator new(0x78uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::ARI_IBIVinylInitPsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372384256);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"InitPerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver InitPerso perform failure");
  }
  return v42;
}

void sub_21C64146C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::AuthPerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *)operator new(0x78uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::ARI_IBIVinylAuthPsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372417024);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"AuthPerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver AuthPerso perform failure");
  }
  return v42;
}

void sub_21C64197C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::FinalizePerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *)operator new(0x58uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::ARI_IBIVinylFinalizePsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372449792);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"FinalizePerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver FinalizePerso perform failure");
  }
  return v42;
}

void sub_21C641E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::ValidatePerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *)operator new(0x78uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::ARI_IBIVinylValidatePsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__0;
  uint64_t v74 = __Block_byref_object_dispose__0;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372482560);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"ValidatePerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver ValidatePerso perform failure");
  }
  return v42;
}

void sub_21C6423A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk35ARI_IBISimAccessGetSimDataRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *)operator new(0xD8uLL);
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::ARI_IBISimAccessGetSimDataRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6424B4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_IBIVinylGetDataRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylGetDataRspCb_SDK *)operator new(0x210uLL);
  AriSdk::ARI_IBIVinylGetDataRspCb_SDK::ARI_IBIVinylGetDataRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64252C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_IBIVinylInstallVadRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::ARI_IBIVinylInstallVadRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6425A4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk30ARI_IBIVinylInstallFwRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::ARI_IBIVinylInstallFwRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64261C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_IBIVinylSwitchModeRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::ARI_IBIVinylSwitchModeRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C642694(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_IBIVinylGetEidRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylGetEidRspCb_SDK *)operator new(0x68uLL);
  AriSdk::ARI_IBIVinylGetEidRspCb_SDK::ARI_IBIVinylGetEidRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64270C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk25ARI_IBIVinylTapeRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylTapeRspCb_SDK *)operator new(0x90uLL);
  AriSdk::ARI_IBIVinylTapeRspCb_SDK::ARI_IBIVinylTapeRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C642784(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_IBIVinylInitPsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *)operator new(0x78uLL);
  AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::ARI_IBIVinylInitPsoRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6427FC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_IBIVinylAuthPsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *)operator new(0x78uLL);
  AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::ARI_IBIVinylAuthPsoRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C642874(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk32ARI_IBIVinylFinalizePsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::ARI_IBIVinylFinalizePsoRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6428EC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk32ARI_IBIVinylValidatePsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v4 = (AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *)operator new(0x78uLL);
  AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::ARI_IBIVinylValidatePsoRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C642964(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLCalculate8bitXor(int8x16_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 8)
  {
    if (a2 >= 0x20)
    {
      uint64_t v2 = a2 & 0xFFFFFFE0;
      uint64_t v5 = a1 + 1;
      int8x16_t v6 = 0uLL;
      uint64_t v7 = v2;
      int8x16_t v8 = 0uLL;
      do
      {
        int8x16_t v6 = veorq_s8(v5[-1], v6);
        int8x16_t v8 = veorq_s8(*v5, v8);
        v5 += 2;
        v7 -= 32;
      }
      while (v7);
      int8x16_t v9 = veorq_s8(v8, v6);
      *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
      unint64_t v10 = v9.i64[0] ^ HIDWORD(v9.i64[0]) ^ ((unint64_t)(v9.i64[0] ^ HIDWORD(v9.i64[0])) >> 16);
      unsigned __int8 v3 = v10 ^ BYTE1(v10);
      if (v2 == a2) {
        return v3;
      }
      if ((a2 & 0x18) == 0) {
        goto LABEL_14;
      }
    }
    else
    {
      unsigned __int8 v3 = 0;
      uint64_t v2 = 0;
    }
    uint64_t v11 = v2;
    uint64_t v2 = a2 & 0xFFFFFFF8;
    int8x8_t v12 = (int8x8_t)v3;
    uint64_t v13 = (int8x8_t *)&a1->i8[v11];
    uint64_t v14 = v11 - v2;
    do
    {
      int8x8_t v15 = *v13++;
      int8x8_t v12 = veor_s8(v15, v12);
      v14 += 8;
    }
    while (v14);
    uint64_t v16 = *(void *)&v12 ^ HIDWORD(*(void *)&v12) ^ ((*(void *)&v12 ^ HIDWORD(*(void *)&v12)) >> 16);
    unsigned __int8 v3 = v16 ^ BYTE1(v16);
    if (v2 == a2) {
      return v3;
    }
    goto LABEL_14;
  }
  uint64_t v2 = 0;
  unsigned __int8 v3 = 0;
LABEL_14:
  uint64_t v17 = a2 - v2;
  uint64_t v18 = &a1->i8[v2];
  do
  {
    char v19 = *v18++;
    v3 ^= v19;
    --v17;
  }
  while (v17);
  return v3;
}

uint64_t ktl::CommandDriver::perform(uint64_t *a1, uint64_t **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  int8x16_t v9 = *(unsigned int (***)(void, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))(*a1 + 8);
  if (v9 || !*(_DWORD *)(v8 + 16))
  {
    uint64_t v10 = **a2;
    uint64_t v11 = (*a2)[1] - v10;
    uint64_t v12 = *(unsigned int *)(v8 + 20);
    LODWORD(v47) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", a3, a4, a5, a6, a7, a8, v11);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v10);
    }
    if (*v9)
    {
      if ((*v9)(v9, v10, v11, &v47, 1, v12, 0) && v47 == v11) {
        return 1;
      }
    }
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v13, v14, v15, v16, v17, v18, v11);
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"error sending\n", v20, v21, v22, v23, v24, v25, v46);
    return 0;
  }
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3002000000;
  uint64_t v50 = __Block_byref_object_copy__1;
  uint64_t v51 = __Block_byref_object_dispose__1;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v29 = AriHost::Send();
  if (v29)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v30, v31, v32, v33, v34, v35, v29);
    goto LABEL_17;
  }
  uint64_t v36 = v48;
  dispatch_time_t v37 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v36[5], v37))
  {
    uint64_t v26 = 1;
    _Block_object_dispose(&v47, 8);
    uint64_t v44 = object;
    if (object) {
      goto LABEL_18;
    }
    return v26;
  }
  _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v38, v39, v40, v41, v42, v43, v45);
LABEL_17:
  uint64_t v26 = 0;
  _Block_object_dispose(&v47, 8);
  uint64_t v44 = object;
  if (!object) {
    return v26;
  }
LABEL_18:
  dispatch_release(v44);
  return v26;
}

void sub_21C642D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performENSt3__110shared_ptrIKNS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke(uint64_t a1)
{
  return 0;
}

BOOL KTLAudioEnableHWLoopback(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v38 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v30 = 0;
    int v39 = 0;
    unsigned int v40 = v2;
    uint64_t v34 = 0;
    if (ARI_CsiIceAudEnableLoopbackHWReq_ENC()
      || (uint64_t v10 = operator new(0x18uLL),
          uint64_t v11 = v34,
          v10[2] = v39,
          *((void *)v10 + 2) = v11,
          *(void *)uint64_t v10 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v10)))
    {
      BOOL v15 = 0;
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v12 = 0xFFFFFFFFLL;
      if (KTLUTACopyReceiveData(a1, &v30))
      {
        uint64_t v13 = v30;
        LODWORD(v34) = -1;
        (*(void (**)(uint64_t))(*(void *)v30 + 16))(v30);
        int v14 = ARI_CsiIceAudEnableLoopbackHWRespCb_Extract();
        (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
        BOOL v15 = v14 == 0;
        uint64_t v12 = v34;
        if (!v34) {
          return !v12 && v15;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
LABEL_27:
    _KTLErrorPrint((uint64_t)"KTLAudioEnableHWLoopback", (uint64_t)"Error on the result: %d\n", v4, v5, v6, v7, v8, v9, v12);
    return !v12 && v15;
  }
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2000000000;
  int v37 = -1;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2000000000;
  int v33 = -1;
  uint64_t v16 = dispatch_semaphore_create(0);
  uint64_t v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (ARI_CsiIceAudEnableLoopbackHWReq_BLK())
  {
    BOOL v15 = 0;
    uint64_t v12 = *((unsigned int *)v35 + 6);
    uint64_t v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v26 = dispatch_semaphore_wait(v17, v19);
  if (v26) {
    _KTLErrorPrint((uint64_t)"KTLAudioEnableHWLoopback", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v28);
  }
  if (v38) {
    AriHost::ExitTrx((AriHost *)v38);
  }
  uint64_t v12 = *((unsigned int *)v35 + 6);
  if (v26)
  {
    BOOL v15 = 0;
    uint64_t v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v15 = *((_DWORD *)v31 + 6) == 0;
  uint64_t v18 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v18);
LABEL_24:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  if (v12) {
    goto LABEL_27;
  }
  return !v12 && v15;
}

void sub_21C64306C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLAudioEnableHWLoopback_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceAudEnableLoopbackHWRespCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __copy_helper_block_e8_32r40r48c25_ZTSN8dispatch9semaphoreE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  uint64_t v4 = *(NSObject **)(a2 + 48);
  a1[6] = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

BOOL KTLAudioDisableHWLoopback(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v32 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v24 = 0;
    int v33 = 0;
    unsigned int v34 = v2;
    uint64_t v28 = 0;
    if (ARI_CsiIceAudDisableLoopbackHWReq_ENC()
      || (uint64_t v4 = operator new(0x18uLL),
          uint64_t v5 = v28,
          v4[2] = v33,
          *((void *)v4 + 2) = v5,
          *(void *)uint64_t v4 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v4)))
    {
      BOOL v9 = 0;
      int v6 = -1;
    }
    else
    {
      int v6 = -1;
      if (KTLUTACopyReceiveData(a1, &v24))
      {
        uint64_t v7 = v24;
        LODWORD(v28) = -1;
        (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
        int v8 = ARI_CsiIceAudDisableLoopbackHWRespCb_Extract();
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
        BOOL v9 = v8 == 0;
        int v6 = v28;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    return !v6 && v9;
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000;
  int v27 = -1;
  uint64_t v10 = dispatch_semaphore_create(0);
  uint64_t v11 = v10;
  dispatch_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  if (ARI_CsiIceAudDisableLoopbackHWReq_BLK())
  {
    BOOL v9 = 0;
    int v6 = *((_DWORD *)v29 + 6);
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  dispatch_time_t v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v20 = dispatch_semaphore_wait(v11, v13);
  if (v20) {
    _KTLErrorPrint((uint64_t)"KTLAudioDisableHWLoopback", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  }
  if (v32) {
    AriHost::ExitTrx((AriHost *)v32);
  }
  int v6 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    BOOL v9 = *((_DWORD *)v25 + 6) == 0;
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v9 = 0;
  uint64_t v12 = object;
  if (object) {
LABEL_22:
  }
    dispatch_release(v12);
LABEL_23:
  if (v11) {
    dispatch_release(v11);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v6 && v9;
}

void sub_21C643430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  if (object) {
    dispatch_release(object);
  }
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v18 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLAudioDisableHWLoopback_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceAudDisableLoopbackHWRespCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLStartProvision(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unsigned int v5 = *(_DWORD *)(a1 + 16);
  unsigned int v30 = v5;
  if (*(void *)(a1 + 8)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    uint64_t v26 = 0;
    int v27 = &v26;
    uint64_t v28 = 0x2000000000;
    int v29 = -1;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x4F002000000;
    uint64_t v36 = __Block_byref_object_copy__2;
    int v37 = __Block_byref_object_dispose__2;
    memset(v38, 170, sizeof(v38));
    uint64_t v12 = dispatch_semaphore_create(0);
    dispatch_time_t v13 = v12;
    uint64_t v24 = MEMORY[0x263EF8330];
    dispatch_object_t object = v12;
    if (v12) {
      dispatch_retain(v12);
    }
    if (ARI_CsiIceStartProvisionReq_BLK())
    {
      memcpy(a3, v34 + 5, 0x4C4uLL);
      BOOL v14 = 0;
      uint64_t v15 = object;
      if (!object) {
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_time_t v16 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v23 = dispatch_semaphore_wait(v13, v16);
      if (v23) {
        _KTLErrorPrint((uint64_t)"KTLStartProvision", (uint64_t)"Timeout waiting for response.\n", v17, v18, v19, v20, v21, v22, v24);
      }
      if (v30) {
        AriHost::ExitTrx((AriHost *)v30);
      }
      memcpy(a3, v34 + 5, 0x4C4uLL);
      if (v23)
      {
        BOOL v14 = 0;
        uint64_t v15 = object;
        if (!object) {
          goto LABEL_23;
        }
      }
      else
      {
        BOOL v14 = *((_DWORD *)v27 + 6) == 0;
        uint64_t v15 = object;
        if (!object)
        {
LABEL_23:
          if (v13) {
            dispatch_release(v13);
          }
          _Block_object_dispose(&v33, 8);
          _Block_object_dispose(&v26, 8);
          if (v14) {
            return a3[1] == 0;
          }
          return 0;
        }
      }
    }
    dispatch_release(v15);
    goto LABEL_23;
  }
  uint64_t v26 = 0;
  int v31 = 0;
  unsigned int v32 = v5;
  uint64_t v33 = 0;
  if (ARI_CsiIceStartProvisionReq_ENC()) {
    return 0;
  }
  uint64_t v7 = operator new(0x18uLL);
  uint64_t v8 = v33;
  v7[2] = v31;
  *((void *)v7 + 2) = v8;
  *(void *)uint64_t v7 = &unk_26CCDD1F8;
  if (!KTLUTASendAndReleaseData(a1, v7)) {
    return 0;
  }
  if ((KTLUTACopyReceiveData(a1, &v26) & 1) == 0) {
    return 0;
  }
  uint64_t v9 = v26;
  (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
  int v10 = ARI_CsiIceStartProvisionResp_Extract();
  (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  if (v10) {
    return 0;
  }
  return a3[1] == 0;
}

void sub_21C643824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (object) {
    dispatch_release(object);
  }
  if (v22) {
    dispatch_release(v22);
  }
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0x4C4uLL);
}

uint64_t __KTLStartProvision_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceStartProvisionResp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLFinishProvision(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  unsigned int v5 = *(_DWORD *)(a1 + 16);
  unsigned int v49 = v5;
  if (*(void *)(a1 + 8)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2000000000;
    int v48 = -1;
    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0xD802000000;
    uint64_t v55 = __Block_byref_object_copy__2;
    uint64_t v56 = __Block_byref_object_dispose__3;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v57 = v12;
    long long v58 = v12;
    long long v59 = v12;
    long long v60 = v12;
    long long v61 = v12;
    long long v62 = v12;
    long long v63 = v12;
    long long v64 = v12;
    long long v65 = v12;
    v66[0] = v12;
    *(_OWORD *)((char *)v66 + 12) = v12;
    dispatch_time_t v13 = dispatch_semaphore_create(0);
    BOOL v14 = v13;
    dispatch_object_t object = v13;
    if (v13) {
      dispatch_retain(v13);
    }
    if (ARI_CsiIceFinishProvisionReq_BLK())
    {
      BOOL v15 = 0;
      dispatch_time_t v16 = v53;
      long long v17 = *(_OWORD *)(v53 + 9);
      long long v18 = *(_OWORD *)(v53 + 7);
      *(_OWORD *)a3 = *(_OWORD *)(v53 + 5);
      *(_OWORD *)(a3 + 16) = v18;
      *(_OWORD *)(a3 + 32) = v17;
      long long v19 = *(_OWORD *)(v16 + 13);
      long long v20 = *(_OWORD *)(v16 + 17);
      long long v21 = *(_OWORD *)(v16 + 11);
      *(_OWORD *)(a3 + 80) = *(_OWORD *)(v16 + 15);
      *(_OWORD *)(a3 + 96) = v20;
      *(_OWORD *)(a3 + 48) = v21;
      *(_OWORD *)(a3 + 64) = v19;
      long long v22 = *(_OWORD *)(v16 + 21);
      long long v23 = *(_OWORD *)(v16 + 23);
      long long v24 = *(_OWORD *)(v16 + 19);
      *(_OWORD *)(a3 + 156) = *(_OWORD *)((char *)v16 + 196);
      *(_OWORD *)(a3 + 128) = v22;
      *(_OWORD *)(a3 + 144) = v23;
      *(_OWORD *)(a3 + 112) = v24;
      uint64_t v25 = object;
      if (!object) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    dispatch_time_t v26 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v33 = dispatch_semaphore_wait(v14, v26);
    if (v33) {
      _KTLErrorPrint((uint64_t)"KTLFinishProvision", (uint64_t)"Timeout waiting for response.\n", v27, v28, v29, v30, v31, v32, v43);
    }
    if (v49) {
      AriHost::ExitTrx((AriHost *)v49);
    }
    unsigned int v34 = v53;
    long long v35 = *(_OWORD *)(v53 + 9);
    long long v36 = *(_OWORD *)(v53 + 7);
    *(_OWORD *)a3 = *(_OWORD *)(v53 + 5);
    *(_OWORD *)(a3 + 16) = v36;
    *(_OWORD *)(a3 + 32) = v35;
    long long v37 = *(_OWORD *)(v34 + 13);
    long long v38 = *(_OWORD *)(v34 + 17);
    long long v39 = *(_OWORD *)(v34 + 11);
    *(_OWORD *)(a3 + 80) = *(_OWORD *)(v34 + 15);
    *(_OWORD *)(a3 + 96) = v38;
    *(_OWORD *)(a3 + 48) = v39;
    *(_OWORD *)(a3 + 64) = v37;
    long long v40 = *(_OWORD *)(v34 + 21);
    long long v41 = *(_OWORD *)(v34 + 23);
    long long v42 = *(_OWORD *)(v34 + 19);
    *(_OWORD *)(a3 + 156) = *(_OWORD *)((char *)v34 + 196);
    *(_OWORD *)(a3 + 128) = v40;
    *(_OWORD *)(a3 + 144) = v41;
    *(_OWORD *)(a3 + 112) = v42;
    if (v33)
    {
      BOOL v15 = 0;
      uint64_t v25 = object;
      if (!object) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v15 = *((_DWORD *)v46 + 6) == 0;
      uint64_t v25 = object;
      if (!object)
      {
LABEL_16:
        if (v14) {
          dispatch_release(v14);
        }
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v45, 8);
        if (v15) {
          return *(_DWORD *)(a3 + 20) == 0;
        }
        return 0;
      }
    }
LABEL_15:
    dispatch_release(v25);
    goto LABEL_16;
  }
  uint64_t v45 = 0;
  int v50 = 0;
  unsigned int v51 = v5;
  uint64_t v52 = 0;
  if (ARI_CsiIceFinishProvisionReq_ENC()) {
    return 0;
  }
  uint64_t v7 = operator new(0x18uLL);
  uint64_t v8 = v52;
  v7[2] = v50;
  *((void *)v7 + 2) = v8;
  *(void *)uint64_t v7 = &unk_26CCDD1F8;
  if (!KTLUTASendAndReleaseData(a1, v7)) {
    return 0;
  }
  if ((KTLUTACopyReceiveData(a1, &v45) & 1) == 0) {
    return 0;
  }
  uint64_t v9 = v45;
  (*(void (**)(uint64_t))(*(void *)v45 + 16))(v45);
  int v10 = ARI_CsiIceFinishProvisionResp_Extract();
  (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  if (v10) {
    return 0;
  }
  return *(_DWORD *)(a3 + 20) == 0;
}

void sub_21C643CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (object) {
    dispatch_release(object);
  }
  if (v23) {
    dispatch_release(v23);
  }
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(_OWORD *)(a1 + 40) = v2;
  long long v4 = *(_OWORD *)(a2 + 88);
  long long v5 = *(_OWORD *)(a2 + 104);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v6;
  *(_OWORD *)(a1 + 104) = v5;
  *(_OWORD *)(a1 + 88) = v4;
  __n128 result = *(__n128 *)(a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 168);
  long long v9 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 196) = *(_OWORD *)(a2 + 196);
  *(_OWORD *)(a1 + 184) = v9;
  *(_OWORD *)(a1 + 168) = v8;
  *(__n128 *)(a1 + 152) = result;
  return result;
}

uint64_t __KTLFinishProvision_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceFinishProvisionResp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLGetManifestStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  unsigned int v30 = v4;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2000000000;
    int v29 = -1;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x13802000000;
    long long v36 = __Block_byref_object_copy__7;
    long long v37 = __Block_byref_object_dispose__8;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v52 = v11;
    long long v53 = v11;
    long long v54 = v11;
    long long v38 = v11;
    long long v39 = v11;
    long long v40 = v11;
    long long v41 = v11;
    long long v42 = v11;
    long long v43 = v11;
    long long v44 = v11;
    long long v45 = v11;
    long long v46 = v11;
    long long v47 = v11;
    long long v48 = v11;
    long long v49 = v11;
    long long v50 = v11;
    long long v51 = v11;
    long long v12 = dispatch_semaphore_create(0);
    dispatch_time_t v13 = v12;
    dispatch_object_t object = v12;
    if (v12) {
      dispatch_retain(v12);
    }
    if (ARI_CsiIceGetManifestStatusReq_BLK())
    {
      memcpy(a2, v34 + 5, 0x110uLL);
      BOOL v14 = 0;
      BOOL v15 = object;
      if (!object) {
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_time_t v16 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v23 = dispatch_semaphore_wait(v13, v16);
      if (v23) {
        _KTLErrorPrint((uint64_t)"KTLGetManifestStatus", (uint64_t)"Timeout waiting for response.\n", v17, v18, v19, v20, v21, v22, v24);
      }
      if (v30) {
        AriHost::ExitTrx((AriHost *)v30);
      }
      memcpy(a2, v34 + 5, 0x110uLL);
      if (v23)
      {
        BOOL v14 = 0;
        BOOL v15 = object;
        if (!object) {
          goto LABEL_23;
        }
      }
      else
      {
        BOOL v14 = *((_DWORD *)v27 + 6) == 0;
        BOOL v15 = object;
        if (!object)
        {
LABEL_23:
          if (v13) {
            dispatch_release(v13);
          }
          _Block_object_dispose(&v33, 8);
          _Block_object_dispose(&v26, 8);
          if (v14) {
            return *a2 == 0;
          }
          return 0;
        }
      }
    }
    dispatch_release(v15);
    goto LABEL_23;
  }
  uint64_t v26 = 0;
  int v31 = 0;
  unsigned int v32 = v4;
  uint64_t v33 = 0;
  if (ARI_CsiIceGetManifestStatusReq_ENC()) {
    return 0;
  }
  long long v6 = operator new(0x18uLL);
  uint64_t v7 = v33;
  v6[2] = v31;
  *((void *)v6 + 2) = v7;
  *(void *)long long v6 = &unk_26CCDD1F8;
  if (!KTLUTASendAndReleaseData(a1, v6)) {
    return 0;
  }
  if ((KTLUTACopyReceiveData(a1, &v26) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = v26;
  (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
  int v9 = ARI_CsiIceGetManifestStatusResp_Extract();
  (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  if (v9) {
    return 0;
  }
  return *a2 == 0;
}

void sub_21C64413C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (object) {
    dispatch_release(object);
  }
  if (v23) {
    dispatch_release(v23);
  }
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0x110uLL);
}

uint64_t __KTLGetManifestStatus_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceGetManifestStatusResp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void *Bsp::BspCommandDriver::BspCommandDriver(void *result, uint64_t a2)
{
  *__n128 result = a2;
  return result;
}

{
  *__n128 result = a2;
  return result;
}

uint64_t Bsp::BspCommandDriver::GetIMEIInfo(Bsp::BspCommandDriver *this, AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *a2, AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK **a3)
{
  uint64_t v22 = 0;
  intptr_t v23 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v9 = ktl::CommandDriver::perform<AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK>((uint64_t *)this, 83918848, &v20, a3, v5, v6, v7, v8);
  uint64_t v16 = v9;
  uint64_t v17 = v21;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if (v16) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if ((v9 & 1) == 0) {
LABEL_4:
  }
    _KTLErrorPrint((uint64_t)"GetIMEIInfo", (uint64_t)"Failed request\n", v10, v11, v12, v13, v14, v15, (uint64_t)v20);
LABEL_5:
  uint64_t v18 = v23;
  if (!v23 || atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v16;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  return v16;
}

void sub_21C64433C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_21C644358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ktl::CommandDriver::perform<AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK>(uint64_t *a1, uint64_t a2, uint64_t **a3, AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a4 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = **a3;
    uint64_t v14 = (*a3)[1] - v13;
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v60) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, v14);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && (((unsigned int (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v60, 1, v15, 0)? (BOOL v22 = v60 == v14): (BOOL v22 = 0), v22))
    {
      uint64_t v60 = 0;
      if (KTLUTACopyReceiveData(*a1, &v60))
      {
        uint64_t v38 = v60;
        if (v60)
        {
          long long v39 = (AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)operator new(0x60uLL);
          long long v40 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v38 + 16))(v38);
          AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK(v39, v40);
          *a4 = v39;
          (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
          goto LABEL_26;
        }
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    int v29 = "error while trying to get response from device \n";
LABEL_11:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v29, v23, v24, v25, v26, v27, v28, v59);
    goto LABEL_12;
  }
  uint64_t v60 = 0;
  long long v61 = &v60;
  uint64_t v62 = 0x3002000000;
  long long v63 = __Block_byref_object_copy__3;
  long long v64 = __Block_byref_object_dispose__3;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v31 = AriHost::Send();
  if (v31)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v32, v33, v34, v35, v36, v37, v31);
    goto LABEL_23;
  }
  long long v41 = v61;
  dispatch_time_t v42 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v41[5], v42))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v43, v44, v45, v46, v47, v48, v59);
LABEL_23:
    char v49 = 0;
    _Block_object_dispose(&v60, 8);
    long long v50 = object;
    if (!object) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  char v49 = 1;
  _Block_object_dispose(&v60, 8);
  long long v50 = object;
  if (object) {
LABEL_24:
  }
    dispatch_release(v50);
LABEL_25:
  if ((v49 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_26:
  char hasDeclaredGmid = AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::hasDeclaredGmid(*a4);
  long long v52 = *a4;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v52) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a4);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v53, v54, v55, v56, v57, v58, a2);
      goto LABEL_12;
    }
    int v29 = "Received NACK\n";
    goto LABEL_11;
  }
  if (!AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::unpack(v52)) {
    return 1;
  }
LABEL_12:
  if (*a4) {
    (*(void (**)(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *))(*(void *)*a4 + 16))(*a4);
  }
  uint64_t result = 0;
  *a4 = 0;
  return result;
}

void sub_21C644714(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21C644728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object)
{
  if (!object) {
    _Unwind_Resume(a1);
  }
  dispatch_release(object);
  _Unwind_Resume(a1);
}

uint64_t Bsp::BspCommandDriver::GetBBWakeReason(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _KTLErrorPrint((uint64_t)"GetBBWakeReason", (uint64_t)"Getting Baseband wake reason", (uint64_t)a3, a4, a5, a6, a7, a8, v74);
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v16 = *a1;
  uint64_t v17 = *(void **)(*a1 + 8);
  if (v17 || !*(_DWORD *)(v16 + 16))
  {
    uint64_t v18 = MEMORY[0];
    uint64_t v19 = MEMORY[8] - MEMORY[0];
    uint64_t v20 = *(unsigned int *)(v16 + 20);
    LODWORD(v76) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v10, v11, v12, v13, v14, v15, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v18);
    }
    if (*v17
      && ((char v27 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v17)(v17, v18, v19, &v76, 1, v20, 0), v76 == v19)? (v28 = v27): (v28 = 0), (v28 & 1) != 0))
    {
      uint64_t v76 = 0;
      int v29 = KTLUTACopyReceiveData(*a1, &v76);
      uint64_t v36 = v76;
      if (v76) {
        int v37 = v29;
      }
      else {
        int v37 = 0;
      }
      if (v37 == 1)
      {
        uint64_t v38 = (AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *)operator new(0x50uLL);
        long long v39 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v36 + 16))(v36);
        AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::ARI_CsiIceWakeupReasonRspCb_SDK(v38, v39);
        *a3 = v38;
        (*(void (**)(uint64_t))(*(void *)v36 + 8))(v36);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v21, v22, v23, v24, v25, v26, v19);
    }
    long long v40 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v40, v30, v31, v32, v33, v34, v35, v75);
    goto LABEL_17;
  }
  uint64_t v76 = 0;
  uint64_t v77 = &v76;
  uint64_t v78 = 0x3002000000;
  uint64_t v79 = __Block_byref_object_copy__3;
  uint64_t v80 = __Block_byref_object_dispose__3;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v49 = AriHost::Send();
  if (v49)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v50, v51, v52, v53, v54, v55, v49);
    goto LABEL_28;
  }
  uint64_t v56 = v77;
  dispatch_time_t v57 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v56[5], v57))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v58, v59, v60, v61, v62, v63, v75);
LABEL_28:
    char v64 = 0;
    _Block_object_dispose(&v76, 8);
    long long v65 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v64 = 1;
  _Block_object_dispose(&v76, 8);
  long long v65 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v65);
LABEL_30:
  if ((v64 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v67 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v67) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v68, v69, v70, v71, v72, v73, 4111007744);
      goto LABEL_17;
    }
    long long v40 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::unpack(v67))
  {
    uint64_t v47 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v47 = 0;
  *a3 = 0;
LABEL_20:
  if ((v47 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetBBWakeReason", (uint64_t)"Failed request\n", v41, v42, v43, v44, v45, v46, v75);
  }
  return v47;
}

void sub_21C644BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t Bsp::BspCommandDriver::SwTrap(uint64_t *a1, const void **a2)
{
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v43 = v4;
  *(_OWORD *)uint64_t v44 = v4;
  v41[3] = v4;
  *(_OWORD *)__p = v4;
  v41[1] = v4;
  v41[2] = v4;
  v41[0] = v4;
  AriSdk::ARI_CsiBspSwTrapReq_v3_SDK::ARI_CsiBspSwTrapReq_v3_SDK((AriSdk::ARI_CsiBspSwTrapReq_v3_SDK *)v41);
  uint64_t v5 = operator new(8uLL);
  *uint64_t v5 = 0x600DC0FFEELL;
  uint64_t v6 = __p[0];
  __p[0] = v5;
  if (v6) {
    operator delete(v6);
  }
  int v7 = *((char *)a2 + 23);
  if (v7 >= 0) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = *a2;
  }
  if (v7 >= 0) {
    size_t v9 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v9 = (size_t)a2[1];
  }
  if (v9)
  {
    if ((v9 & 0x8000000000000000) != 0) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = (char *)operator new(v9);
    uint64_t v11 = &v10[v9];
    memmove(v10, v8, v9);
    if (v9 >= 0x201)
    {
      AriOsa::LogSrcInfo((uint64_t *)v47, (AriOsa *)"/AppleInternal/Library/BuildRoots/7a5643da-a7fb-11ef-987a-36218cb420d5/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "operator=", v12);
      if (v48 >= 0) {
        uint64_t v14 = v47;
      }
      else {
        uint64_t v14 = (void **)v47[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Array assignment too large(%p), got(%zu) max(%zu)", v13, v14, 360, &__p[1], v9, 512);
      if (v48 < 0) {
        operator delete(v47[0]);
      }
      if (v10) {
        operator delete(v10);
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  if (__p[1])
  {
    *(void **)&long long v43 = __p[1];
    operator delete(__p[1]);
  }
  __p[1] = v10;
  *(void *)&long long v43 = v11;
  *((void *)&v43 + 1) = v11;
LABEL_23:
  int v16 = (int)__p[1];
  int v15 = v43;
  uint64_t v17 = operator new(4uLL);
  _DWORD *v17 = v15 - v16;
  uint64_t v18 = v44[0];
  v44[0] = v17;
  if (v18) {
    operator delete(v18);
  }
  uint64_t v19 = operator new(4uLL);
  *uint64_t v19 = 0;
  uint64_t v20 = v44[1];
  v44[1] = v19;
  if (v20) {
    operator delete(v20);
  }
  AriSdk::MsgBase::getRawBytes();
  long long v39 = v45;
  long long v40 = v46;
  if (v46) {
    atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v27 = ktl::CommandDriver::perform(a1, &v39, v21, v22, v23, v24, v25, v26);
  uint64_t v34 = v27;
  uint64_t v35 = v40;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
    std::__shared_weak_count::__release_weak(v35);
    if (v34) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((v27 & 1) == 0) {
LABEL_32:
  }
    _KTLErrorPrint((uint64_t)"SwTrap", (uint64_t)"Failed to send request (this message does not expect a response)\n", v28, v29, v30, v31, v32, v33, v38);
LABEL_33:
  MEMORY[0x21D4ABA10](v41);
  uint64_t v36 = v46;
  if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
    std::__shared_weak_count::__release_weak(v36);
  }
  return v34;
}

void sub_21C644F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17)
{
  if (*(char *)(v18 - 49) < 0) {
    operator delete(*(void **)(v18 - 72));
  }
  if (v17)
  {
    operator delete(v17);
    MEMORY[0x21D4ABA10](&a17);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v18 - 88);
    _Unwind_Resume(a1);
  }
  MEMORY[0x21D4ABA10](&a17);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v18 - 88);
  _Unwind_Resume(a1);
}

void std::vector<char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264413948, MEMORY[0x263F8C060]);
}

void sub_21C645024(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk29ARI_CsiMsCpsReadImeiRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)operator new(0x60uLL);
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6450F0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_CsiIceWakeupReasonRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::ARI_CsiIceWakeupReasonRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C645168(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetFirmwareVersion(uint64_t a1, char *a2, int *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 170, sizeof(v14));
  BOOL Info = KTLSysGetInfo(a1, 4, (uint64_t)v14, v6, v7, v8, v9, v10);
  if (Info)
  {
    if (v14[128] < *a3) {
      int v12 = v14[128] + 1;
    }
    else {
      int v12 = *a3;
    }
    *a3 = v12;
    memcpy(a2, v14, (v12 - 1));
    a2[*a3 - 1] = 0;
  }
  else
  {
    *a3 = 0;
  }
  return Info;
}

uint64_t KTLGetIMEI(uint64_t a1, unsigned char *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v19[3] = *MEMORY[0x263EF8340];
  memset(v19, 170, 24);
  if (*a3 < 0xFu) {
    return 0;
  }
  BOOL v11 = KTLGetIMEIInfo(a1, a4, (uint64_t)v19, a4, a5, a6, a7, a8);
  uint64_t result = 0;
  if (a2)
  {
    if (v11)
    {
      bzero(a2, *a3);
      *a2 = (BYTE4(v19[0]) >> 4) | 0x30;
      unsigned int v12 = BYTE5(v19[0]);
      a2[1] = BYTE5(v19[0]) & 0xF | 0x30;
      a2[2] = (v12 >> 4) | 0x30;
      unsigned int v13 = BYTE6(v19[0]);
      a2[3] = BYTE6(v19[0]) & 0xF | 0x30;
      a2[4] = (v13 >> 4) | 0x30;
      unsigned int v14 = HIBYTE(v19[0]);
      a2[5] = HIBYTE(v19[0]) & 0xF | 0x30;
      a2[6] = (v14 >> 4) | 0x30;
      unsigned int v15 = LOBYTE(v19[1]);
      a2[7] = v19[1] & 0xF | 0x30;
      a2[8] = (v15 >> 4) | 0x30;
      unsigned int v16 = BYTE1(v19[1]);
      a2[9] = BYTE1(v19[1]) & 0xF | 0x30;
      a2[10] = (v16 >> 4) | 0x30;
      unsigned int v17 = BYTE2(v19[1]);
      a2[11] = BYTE2(v19[1]) & 0xF | 0x30;
      a2[12] = (v17 >> 4) | 0x30;
      unsigned int v18 = BYTE3(v19[1]);
      a2[13] = BYTE3(v19[1]) & 0xF | 0x30;
      a2[14] = (v18 >> 4) | 0x30;
      a2[15] = 0;
      uint64_t result = 1;
      *a3 = 16;
    }
  }
  return result;
}

uint64_t KTLGetIMEI_V2(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v16 = a1;
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[2] = v3;
  v14[3] = v3;
  v14[0] = v3;
  v14[1] = v3;
  AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::ARI_CsiMsCpsReadImeiReq_SDK((AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *)v14);
  unsigned int v13 = (AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
  long long v4 = operator new(4uLL);
  _DWORD *v4 = 0;
  uint64_t v5 = __p;
  __p = v4;
  if (v5) {
    operator delete(v5);
  }
  IMEIBOOL Info = Bsp::BspCommandDriver::GetIMEIInfo((Bsp::BspCommandDriver *)&v16, (AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *)v14, &v13);
  if (IMEIInfo)
  {
    *(_DWORD *)(a2 + 36) = 16;
    *(_DWORD *)(a2 + 16) = 16;
    *(_DWORD *)(a2 + 84) = 17;
    *(_DWORD *)(a2 + 60) = 17;
    uint64_t v7 = v13;
    uint64_t v8 = (unsigned char *)*((void *)v13 + 9);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)a2 = (v8[4] >> 4) | 0x30;
    *(unsigned char *)(a2 + 1) = v8[5] & 0xF | 0x30;
    *(unsigned char *)(a2 + 2) = (v8[5] >> 4) | 0x30;
    *(unsigned char *)(a2 + 3) = v8[6] & 0xF | 0x30;
    *(unsigned char *)(a2 + 4) = (v8[6] >> 4) | 0x30;
    *(unsigned char *)(a2 + 5) = v8[7] & 0xF | 0x30;
    *(unsigned char *)(a2 + 6) = (v8[7] >> 4) | 0x30;
    *(unsigned char *)(a2 + 7) = v8[8] & 0xF | 0x30;
    *(unsigned char *)(a2 + 8) = (v8[8] >> 4) | 0x30;
    *(unsigned char *)(a2 + 9) = v8[9] & 0xF | 0x30;
    *(unsigned char *)(a2 + 10) = (v8[9] >> 4) | 0x30;
    *(unsigned char *)(a2 + 11) = v8[10] & 0xF | 0x30;
    *(unsigned char *)(a2 + 12) = (v8[10] >> 4) | 0x30;
    *(unsigned char *)(a2 + 13) = v8[11] & 0xF | 0x30;
    *(unsigned char *)(a2 + 14) = (v8[11] >> 4) | 0x30;
    *(unsigned char *)(a2 + 15) = 0;
    *(_DWORD *)(a2 + 16) = 16;
    uint64_t v9 = (unsigned char *)*((void *)v7 + 9);
    *(void *)(a2 + 40) = 0;
    *(void *)(a2 + 48) = 0;
    *(unsigned char *)(a2 + 56) = 0;
    *(unsigned char *)(a2 + 40) = (v9[12] >> 4) | 0x30;
    *(unsigned char *)(a2 + 41) = v9[13] & 0xF | 0x30;
    *(unsigned char *)(a2 + 42) = (v9[13] >> 4) | 0x30;
    *(unsigned char *)(a2 + 43) = v9[14] & 0xF | 0x30;
    *(unsigned char *)(a2 + 44) = (v9[14] >> 4) | 0x30;
    *(unsigned char *)(a2 + 45) = v9[15] & 0xF | 0x30;
    *(unsigned char *)(a2 + 46) = (v9[15] >> 4) | 0x30;
    *(unsigned char *)(a2 + 47) = v9[16] & 0xF | 0x30;
    *(unsigned char *)(a2 + 48) = (v9[16] >> 4) | 0x30;
    *(unsigned char *)(a2 + 49) = v9[17] & 0xF | 0x30;
    *(unsigned char *)(a2 + 50) = (v9[17] >> 4) | 0x30;
    *(unsigned char *)(a2 + 51) = v9[18] & 0xF | 0x30;
    *(unsigned char *)(a2 + 52) = (v9[18] >> 4) | 0x30;
    *(unsigned char *)(a2 + 53) = v9[19] & 0xF | 0x30;
    *(unsigned char *)(a2 + 54) = (v9[19] >> 4) | 0x30;
    *(unsigned char *)(a2 + 55) = v9[20] & 0xF | 0x30;
    *(unsigned char *)(a2 + 56) = 0;
    *(_DWORD *)(a2 + 60) = 17;
    uint64_t v10 = (unsigned char *)*((void *)v7 + 10);
    if (v10)
    {
      *(void *)(a2 + 28) = 0;
      *(void *)(a2 + 20) = 0;
      *(unsigned char *)(a2 + 20) = (*v10 >> 4) | 0x30;
      *(unsigned char *)(a2 + 21) = v10[1] & 0xF | 0x30;
      *(unsigned char *)(a2 + 22) = (v10[1] >> 4) | 0x30;
      *(unsigned char *)(a2 + 23) = v10[2] & 0xF | 0x30;
      *(unsigned char *)(a2 + 24) = (v10[2] >> 4) | 0x30;
      *(unsigned char *)(a2 + 25) = v10[3] & 0xF | 0x30;
      *(unsigned char *)(a2 + 26) = (v10[3] >> 4) | 0x30;
      *(unsigned char *)(a2 + 27) = v10[4] & 0xF | 0x30;
      *(unsigned char *)(a2 + 28) = (v10[4] >> 4) | 0x30;
      *(unsigned char *)(a2 + 29) = v10[5] & 0xF | 0x30;
      *(unsigned char *)(a2 + 30) = (v10[5] >> 4) | 0x30;
      *(unsigned char *)(a2 + 31) = v10[6] & 0xF | 0x30;
      *(unsigned char *)(a2 + 32) = (v10[6] >> 4) | 0x30;
      *(unsigned char *)(a2 + 33) = v10[7] & 0xF | 0x30;
      *(unsigned char *)(a2 + 34) = (v10[7] >> 4) | 0x30;
      *(unsigned char *)(a2 + 35) = 0;
      *(_DWORD *)(a2 + 36) = 16;
      BOOL v11 = (unsigned char *)*((void *)v7 + 10);
      *(unsigned char *)(a2 + 80) = 0;
      *(void *)(a2 + 64) = 0;
      *(void *)(a2 + 72) = 0;
      *(unsigned char *)(a2 + 64) = (v11[8] >> 4) | 0x30;
      *(unsigned char *)(a2 + 65) = v11[9] & 0xF | 0x30;
      *(unsigned char *)(a2 + 66) = (v11[9] >> 4) | 0x30;
      *(unsigned char *)(a2 + 67) = v11[10] & 0xF | 0x30;
      *(unsigned char *)(a2 + 68) = (v11[10] >> 4) | 0x30;
      *(unsigned char *)(a2 + 69) = v11[11] & 0xF | 0x30;
      *(unsigned char *)(a2 + 70) = (v11[11] >> 4) | 0x30;
      *(unsigned char *)(a2 + 71) = v11[12] & 0xF | 0x30;
      *(unsigned char *)(a2 + 72) = (v11[12] >> 4) | 0x30;
      *(unsigned char *)(a2 + 73) = v11[13] & 0xF | 0x30;
      *(unsigned char *)(a2 + 74) = (v11[13] >> 4) | 0x30;
      *(unsigned char *)(a2 + 75) = v11[14] & 0xF | 0x30;
      *(unsigned char *)(a2 + 76) = (v11[14] >> 4) | 0x30;
      *(unsigned char *)(a2 + 77) = v11[15] & 0xF | 0x30;
      *(unsigned char *)(a2 + 78) = (v11[15] >> 4) | 0x30;
      *(_WORD *)(a2 + 79) = v11[16] & 0xF | 0x30;
      *(_DWORD *)(a2 + 84) = 17;
    }
    else
    {
      *(_DWORD *)(a2 + 84) = 0;
      *(void *)(a2 + 64) = 0;
      *(void *)(a2 + 72) = 0;
      *(unsigned char *)(a2 + 80) = 0;
      *(void *)(a2 + 28) = 0;
      *(void *)(a2 + 20) = 0;
      *(_DWORD *)(a2 + 36) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 84) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 41) = 0u;
    *(void *)(a2 + 68) = 0;
    *(void *)(a2 + 60) = 0;
    *(void *)(a2 + 73) = 0;
  }
  MEMORY[0x21D4ABA70](v14);
  return IMEIInfo;
}

uint64_t KTLGetMEID(uint64_t a1, unsigned char *a2, _DWORD *a3, int a4)
{
  v15[3] = *MEMORY[0x263EF8340];
  memset(v15, 170, 24);
  if (*a3 < 0xEu) {
    return 0;
  }
  BOOL v7 = KTLGetMEIDInfo(a1, a4, (uint64_t)v15);
  uint64_t result = 0;
  if (a2)
  {
    if (v7)
    {
      bzero(a2, *a3);
      unsigned int v8 = BYTE4(v15[0]);
      *a2 = BYTE4(v15[0]) & 0xF | 0x30;
      a2[1] = (v8 >> 4) | 0x30;
      unsigned int v9 = BYTE5(v15[0]);
      a2[2] = BYTE5(v15[0]) & 0xF | 0x30;
      a2[3] = (v9 >> 4) | 0x30;
      unsigned int v10 = BYTE6(v15[0]);
      a2[4] = BYTE6(v15[0]) & 0xF | 0x30;
      a2[5] = (v10 >> 4) | 0x30;
      unsigned int v11 = HIBYTE(v15[0]);
      a2[6] = HIBYTE(v15[0]) & 0xF | 0x30;
      a2[7] = (v11 >> 4) | 0x30;
      unsigned int v12 = LOBYTE(v15[1]);
      a2[8] = v15[1] & 0xF | 0x30;
      a2[9] = (v12 >> 4) | 0x30;
      unsigned int v13 = BYTE1(v15[1]);
      a2[10] = BYTE1(v15[1]) & 0xF | 0x30;
      a2[11] = (v13 >> 4) | 0x30;
      unsigned int v14 = BYTE2(v15[1]);
      a2[12] = BYTE2(v15[1]) & 0xF | 0x30;
      a2[13] = (v14 >> 4) | 0x30;
      a2[14] = 0;
      uint64_t result = 1;
      *a3 = 14;
    }
  }
  return result;
}

uint64_t KTLIsValidIMEIString(const char *a1)
{
  uint64_t result = strncmp(a1, "00000000000000", 0xFuLL);
  if (result) {
    return strncmp(a1, "00499901064000", 0xFuLL) != 0;
  }
  return result;
}

BOOL KTLIsValidMEIDString(const char *a1)
{
  return strncmp(a1, "00000000000000", 0xEuLL) != 0;
}

uint64_t KTLGetIMEISV(uint64_t a1, unsigned char *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v19[3] = *MEMORY[0x263EF8340];
  memset(v19, 170, 24);
  if (*a3 < 0x10u) {
    return 0;
  }
  BOOL v11 = KTLGetIMEIInfo(a1, a4, (uint64_t)v19, a4, a5, a6, a7, a8);
  uint64_t result = 0;
  if (a2)
  {
    if (v11)
    {
      bzero(a2, *a3);
      *a2 = (BYTE4(v19[1]) >> 4) | 0x30;
      unsigned int v12 = BYTE5(v19[1]);
      a2[1] = BYTE5(v19[1]) & 0xF | 0x30;
      a2[2] = (v12 >> 4) | 0x30;
      unsigned int v13 = BYTE6(v19[1]);
      a2[3] = BYTE6(v19[1]) & 0xF | 0x30;
      a2[4] = (v13 >> 4) | 0x30;
      unsigned int v14 = HIBYTE(v19[1]);
      a2[5] = HIBYTE(v19[1]) & 0xF | 0x30;
      a2[6] = (v14 >> 4) | 0x30;
      unsigned int v15 = LOBYTE(v19[2]);
      a2[7] = v19[2] & 0xF | 0x30;
      a2[8] = (v15 >> 4) | 0x30;
      unsigned int v16 = BYTE1(v19[2]);
      a2[9] = BYTE1(v19[2]) & 0xF | 0x30;
      a2[10] = (v16 >> 4) | 0x30;
      unsigned int v17 = BYTE2(v19[2]);
      a2[11] = BYTE2(v19[2]) & 0xF | 0x30;
      a2[12] = (v17 >> 4) | 0x30;
      unsigned int v18 = BYTE3(v19[2]);
      a2[13] = BYTE3(v19[2]) & 0xF | 0x30;
      a2[14] = (v18 >> 4) | 0x30;
      a2[15] = BYTE4(v19[2]) & 0xF | 0x30;
      a2[16] = 0;
      uint64_t result = 1;
      *a3 = 17;
    }
  }
  return result;
}

uint64_t KTLGetSIMInfo(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t VinylType = 0;
  if (a1 && a2)
  {
    uint64_t v18 = a1;
    if (*(_DWORD *)(a1 + 20) >> 4 <= 0x270u) {
      *(_DWORD *)(a1 + 20) = 10000;
    }
    __p = (void *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[2] = v6;
    v16[3] = v6;
    v16[0] = v6;
    v16[1] = v6;
    AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK((AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v16);
    unsigned int v15 = 0;
    BOOL v7 = operator new(4uLL);
    *BOOL v7 = a3;
    unsigned int v8 = __p;
    __p = v7;
    if (v8) {
      operator delete(v8);
    }
    *(unsigned char *)(a2 + 4) = 0;
    *(_DWORD *)a2 = 0;
    uint64_t VinylType = eUICC::VinylCommandDriver::GetVinylType((eUICC::VinylCommandDriver *)&v18, (AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v16, &v15);
    if (!VinylType) {
      goto LABEL_21;
    }
    unsigned int v9 = v15;
    int v10 = **((_DWORD **)v15 + 9);
    if (!v10 || v10 == 6 && **((_DWORD **)v15 + 16) == 2)
    {
      *(unsigned char *)(a2 + 4) = 0;
    }
    else
    {
      int v11 = 1;
      *(unsigned char *)(a2 + 4) = 1;
      unsigned int v12 = (unsigned char *)*((void *)v9 + 17);
      if (v12)
      {
        int v13 = *v12;
        if (v13 == 2)
        {
          int v11 = 3;
        }
        else if (v13 == 1)
        {
          int v11 = 2;
        }
        else
        {
          if (*v12)
          {
            *(_DWORD *)a2 = 0;
            goto LABEL_20;
          }
          int v11 = 1;
        }
      }
      *(_DWORD *)a2 = v11;
    }
LABEL_20:
    (*(void (**)(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *))(*(void *)v9 + 16))(v9);
LABEL_21:
    MEMORY[0x21D4ABEF0](v16);
  }
  return VinylType;
}

uint64_t KTLGetSimSlotMapping(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (!a1 || !a2) {
    return v2;
  }
  BOOL v31 = 0;
  memset(v30, 170, sizeof(v30));
  *(void *)a2 = 0x100000000;
  int v5 = KTLIsBBSimStackMappingEnabled(a1, &v31);
  if (!v5 || v31)
  {
    if (v5) {
      uint64_t v27 = "BB internal SIM slot -> stack instance mapping enabled. Using default SIM stack mapping in KTL.\n";
    }
    else {
      uint64_t v27 = "Treating BB as single-SIM. Using default SIM stack mapping in KTL.\n";
    }
    _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)v27, v6, v7, v8, v9, v10, v11, v28);
    return 1;
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"BB internal SIM slot -> stack instance mapping disabled. Retrieveing SIM stack mapping from BB.\n.", v6, v7, v8, v9, v10, v11, v28);
    if (KTLGetSimStackMapping(a1, (uint64_t)v30))
    {
      if (v30[0]) {
        int v18 = *(_DWORD *)&v30[4];
      }
      else {
        int v18 = 255;
      }
      *(_DWORD *)a2 = v18;
      _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"simSlotMapping->slot_instance_id[%lu] = %d\n", v12, v13, v14, v15, v16, v17, 0);
      if (v30[0] <= 1u) {
        int v25 = 255;
      }
      else {
        int v25 = *(_DWORD *)&v30[8];
      }
      *(_DWORD *)(a2 + 4) = v25;
      uint64_t v2 = 1;
      _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"simSlotMapping->slot_instance_id[%lu] = %d\n", v19, v20, v21, v22, v23, v24, 1);
      return v2;
    }
    _KTLErrorPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"Failed to retrieve SIM stack mapping from BB.\n", v12, v13, v14, v15, v16, v17, v29);
    return 0;
  }
}

uint64_t KTLGetSimSlotInstance(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 0;
  if (a1 && a3)
  {
    unsigned int v11 = a2;
    if (a2 < 2)
    {
      unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t result = KTLGetSimSlotMapping(a1, (uint64_t)&v12);
      if (result) {
        *a3 = *((_DWORD *)&v12 + v11);
      }
    }
    else
    {
      _KTLErrorPrint((uint64_t)"KTLGetSimSlotInstance", (uint64_t)"simSlot parameter: %d is >= KTL max number of supported SIMs: %d\n", (uint64_t)a3, a4, a5, a6, a7, a8, a2);
      return 0;
    }
  }
  return result;
}

uint64_t KTLGetSIMSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v2 = KTLGetSimSlotMapping(a1, (uint64_t)&v6);
      if (v2)
      {
        KTLGetSIMInfo(a1, a2, v6);
        KTLGetSIMInfo(a1, a2 + 8, SHIDWORD(v6));
      }
    }
  }
  return v2;
}

const char *asString(int a1)
{
  if ((a1 - 1) > 2) {
    return "unknown SIM type";
  }
  else {
    return off_264413968[a1 - 1];
  }
}

uint64_t KTLEFICheckSIMReady(uint64_t a1, BOOL *a2)
{
  uint64_t v2 = 0;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  *a2 = 0;
  uint64_t v2 = 0;
  if (!KTLPing(a1, a2)) {
    return v2;
  }
  if (*a2)
  {
    uint64_t v2 = KTLIsSIMSlotReady(a1, (char *)a2, 0);
    BOOL v6 = 0;
    if (v2 && *a2)
    {
      if (KTLIsSIMSlotReady(a1, (char *)&v6, 1)) {
        *a2 = v6;
      }
    }
    return v2;
  }
  return 1;
}

uint64_t KTLIsSIMSlotReady(uint64_t a1, char *a2, int a3)
{
  uint64_t v22 = a1;
  if (*(_DWORD *)(a1 + 20) >> 4 <= 0x270u) {
    *(_DWORD *)(a1 + 20) = 10000;
  }
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[2] = v5;
  v20[3] = v5;
  v20[0] = v5;
  v20[1] = v5;
  AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK((AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v20);
  uint64_t v19 = 0;
  BOOL v6 = operator new(4uLL);
  *BOOL v6 = a3;
  uint64_t v7 = __p;
  __p = v6;
  if (v7) {
    operator delete(v7);
  }
  uint64_t VinylType = eUICC::VinylCommandDriver::GetVinylType((eUICC::VinylCommandDriver *)&v22, (AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v20, &v19);
  if (VinylType)
  {
    uint64_t v15 = v19;
    unsigned int v16 = **((_DWORD **)v19 + 9);
    char v17 = 1;
    if (v16 > 6)
    {
      if (v16 - 128 >= 3)
      {
        if (v16 != 254)
        {
          _KTLErrorPrint((uint64_t)"KTLIsSIMSlotReady", (uint64_t)"Unknown sim state 0x%x\n", v8, v9, v10, v11, v12, v13, **((unsigned int **)v19 + 9));
          uint64_t v15 = v19;
          *a2 = 0;
          if (!v15) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        goto LABEL_12;
      }
    }
    else if (((1 << v16) & 0x6D) == 0)
    {
LABEL_12:
      char v17 = 0;
    }
    *a2 = v17;
LABEL_14:
    (*(void (**)(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *))(*(void *)v15 + 16))(v15);
    goto LABEL_15;
  }
  *a2 = 0;
LABEL_15:
  MEMORY[0x21D4ABEF0](v20);
  return VinylType;
}

BOOL KTLNVMReadGroupEnumList(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  long long v40 = (AriHost *)v4;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    uint64_t v36 = 0;
    LODWORD(v32) = v4;
    int v41 = 0;
    uint64_t v42 = 0;
    if (ARI_CsiBspNvmGroupEnumListReq_ENC()
      || (BOOL v6 = operator new(0x18uLL),
          uint64_t v7 = v42,
          v6[2] = v41,
          *((void *)v6 + 2) = v7,
          *(void *)BOOL v6 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v6))
      || !KTLUTACopyReceiveData(a1, &v36))
    {
      int v17 = 0;
      BOOL v16 = 0;
      return v17 == 1 && v16;
    }
    uint64_t v8 = v36;
    (*(void (**)(uint64_t))(*(void *)v36 + 16))(v36);
    int v9 = ARI_CsiBspNvmGroupEnumListRespCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    BOOL v16 = v9 == 0;
    int v17 = HIDWORD(v40);
    if (v16) {
      goto LABEL_27;
    }
    return v17 == 1 && v16;
  }
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0xDD802000000;
  uint64_t v45 = __Block_byref_object_copy__4;
  uint64_t v46 = __Block_byref_object_dispose__4;
  memset(v47, 170, sizeof(v47));
  uint64_t v36 = 0;
  int v37 = &v36;
  uint64_t v38 = 0x2000000000;
  int v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000;
  int v35 = -1;
  int v18 = dispatch_semaphore_create(0);
  uint64_t v19 = v18;
  uint64_t v30 = MEMORY[0x263EF8330];
  dispatch_object_t object = v18;
  if (v18) {
    dispatch_retain(v18);
  }
  if (ARI_CsiBspNvmGroupEnumListReq_BLK())
  {
    int v17 = *((_DWORD *)v37 + 6);
    HIDWORD(v40) = v17;
    memcpy(a2, v43 + 5, 0xDB0uLL);
    BOOL v16 = 0;
    uint64_t v20 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v21 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v28 = dispatch_semaphore_wait(v19, v21);
  if (v28) {
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupEnumList", (uint64_t)"Timeout waiting for response.\n", v22, v23, v24, v25, v26, v27, v30);
  }
  if (v40) {
    AriHost::ExitTrx((AriHost *)v40);
  }
  int v17 = *((_DWORD *)v37 + 6);
  HIDWORD(v40) = v17;
  memcpy(a2, v43 + 5, 0xDB0uLL);
  if (v28)
  {
    BOOL v16 = 0;
    uint64_t v20 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v16 = *((_DWORD *)v33 + 6) == 0;
  uint64_t v20 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v20);
LABEL_24:
  if (v19) {
    dispatch_release(v19);
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  if (v16)
  {
LABEL_27:
    if (v17 != 1)
    {
      _KTLErrorPrint((uint64_t)"KTLNVMReadGroupEnumList", (uint64_t)"Error: CsiBspNvmGroupEnumListRespCb Failure\n", v10, v11, v12, v13, v14, v15, v30);
      int v17 = HIDWORD(v40);
    }
  }
  return v17 == 1 && v16;
}

void sub_21C6466A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (object) {
    dispatch_release(object);
  }
  if (v27) {
    dispatch_release(v27);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0xDB0uLL);
}

uint64_t __KTLNVMReadGroupEnumList_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspNvmGroupEnumListRespCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLNVMReadGroupStart(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  uint64_t v38 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v30 = 0;
    int v39 = 0;
    unsigned int v40 = v2;
    uint64_t v34 = 0;
    if (ARI_CsiBspNvmReadGroupReq_ENC()
      || (unsigned int v4 = operator new(0x18uLL),
          uint64_t v5 = v34,
          v4[2] = v39,
          *((void *)v4 + 2) = v5,
          *(void *)unsigned int v4 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v4))
      || !KTLUTACopyReceiveData(a1, &v30))
    {
      int v15 = 0;
      BOOL v14 = 0;
      return v15 == 1 && v14;
    }
    uint64_t v6 = v30;
    (*(void (**)(uint64_t))(*(void *)v30 + 16))(v30);
    int v7 = ARI_CsiBspNvmReadGroupRespCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    BOOL v14 = v7 == 0;
    int v15 = HIDWORD(v38);
    if (v14) {
      goto LABEL_27;
    }
    return v15 == 1 && v14;
  }
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2000000000;
  int v37 = 0;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2000000000;
  int v33 = -1;
  BOOL v16 = dispatch_semaphore_create(0);
  int v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (ARI_CsiBspNvmReadGroupReq_BLK())
  {
    BOOL v14 = 0;
    int v15 = *((_DWORD *)v35 + 6);
    HIDWORD(v38) = v15;
    int v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v26 = dispatch_semaphore_wait(v17, v19);
  if (v26) {
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupStart", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v28);
  }
  if (v38) {
    AriHost::ExitTrx((AriHost *)v38);
  }
  int v15 = *((_DWORD *)v35 + 6);
  HIDWORD(v38) = v15;
  if (v26)
  {
    BOOL v14 = 0;
    int v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v14 = *((_DWORD *)v31 + 6) == 0;
  int v18 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v18);
LABEL_24:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  if (v14)
  {
LABEL_27:
    if (v15 != 1)
    {
      _KTLErrorPrint((uint64_t)"KTLNVMReadGroupStart", (uint64_t)"Error: CsiBspNvmReadGroupRespCb Failure\n", v8, v9, v10, v11, v12, v13, v28);
      int v15 = HIDWORD(v38);
    }
  }
  return v15 == 1 && v14;
}

void sub_21C646A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLNVMReadGroupStart_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspNvmReadGroupRespCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLNVMReadGroupBlock(uint64_t a1, uint64_t a2, int *a3, void *a4, _DWORD *a5)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  int v9 = *(_DWORD *)(a1 + 16);
  int v49 = v9;
  if (*(void *)(a1 + 8)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10)
  {
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2000000000;
    int v48 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0xDD802000000;
    uint64_t v53 = __Block_byref_object_copy__4;
    uint64_t v54 = __Block_byref_object_dispose__4;
    memset(v55, 170, sizeof(v55));
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x2000000000;
    int v44 = -1431655766;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x2000000000;
    int v40 = -1;
    uint64_t v21 = dispatch_semaphore_create(0);
    uint64_t v22 = v21;
    dispatch_object_t object = v21;
    if (v21) {
      dispatch_retain(v21);
    }
    if (!ARI_CsiBspNvmReadGroupBlockReq_BLK())
    {
      dispatch_time_t v23 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v22, v23))
      {
        int v30 = 1;
LABEL_17:
        *a3 = *((_DWORD *)v46 + 6);
        memcpy(a4, v51 + 5, 0xDB0uLL);
        *a5 = *((_DWORD *)v42 + 6);
        if (v30)
        {
          BOOL v31 = *((_DWORD *)v38 + 6) == 0;
          uint64_t v32 = object;
          if (!object)
          {
LABEL_23:
            if (v22) {
              dispatch_release(v22);
            }
            _Block_object_dispose(&v37, 8);
            _Block_object_dispose(&v41, 8);
            _Block_object_dispose(&v50, 8);
            _Block_object_dispose(&v45, 8);
            if (v31) {
              goto LABEL_26;
            }
            goto LABEL_29;
          }
        }
        else
        {
          BOOL v31 = 0;
          uint64_t v32 = object;
          if (!object) {
            goto LABEL_23;
          }
        }
        dispatch_release(v32);
        goto LABEL_23;
      }
      _KTLErrorPrint((uint64_t)"KTLNVMReadGroupBlock", (uint64_t)"Timeout waiting for response.\n", v24, v25, v26, v27, v28, v29, v35);
    }
    int v30 = 0;
    goto LABEL_17;
  }
  uint64_t v45 = 0;
  LODWORD(v41) = v9;
  LODWORD(v37) = 0;
  uint64_t v50 = 0;
  if (ARI_CsiBspNvmReadGroupBlockReq_ENC()
    || (int v17 = operator new(0x18uLL),
        uint64_t v18 = v50,
        v17[2] = v37,
        *((void *)v17 + 2) = v18,
        *(void *)int v17 = &unk_26CCDD1F8,
        !KTLUTASendAndReleaseData(a1, v17))
    || (KTLUTACopyReceiveData(a1, &v45) & 1) == 0)
  {
    *a5 = 0;
    goto LABEL_29;
  }
  uint64_t v19 = v45;
  (*(void (**)(uint64_t))(*(void *)v45 + 16))(v45);
  int v20 = ARI_CsiBspNvmReadGroupBlockRespCb_Extract();
  (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  *a5 = 0;
  if (v20)
  {
LABEL_29:
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupBlock", (uint64_t)"Error: CsiBspNvmReadGroupBlockRespCb Failure\n", v11, v12, v13, v14, v15, v16, v35);
    return 0;
  }
LABEL_26:
  int v33 = *a3;
  if (!*a3)
  {
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupBlock", (uint64_t)"Error: CsiBspNvmReadGroupBlockRespCb Failure\n", v11, v12, v13, v14, v15, v16, v35);
    int v33 = *a3;
  }
  return v33 != 0;
}

void sub_21C646ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  if (object) {
    dispatch_release(object);
  }
  if (v32) {
    dispatch_release(v32);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLNVMReadGroupBlock_block_invoke(void *a1, AriMsg *a2, unsigned int a3)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = ARI_CsiBspNvmReadGroupBlockRespCb_Extract();
  int BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  int v7 = a1[8];
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = BufCtx;
  dispatch_semaphore_signal(v7);
  return *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
}

void __copy_helper_block_e8_32r40r48r56r64c25_ZTSN8dispatch9semaphoreE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  unsigned int v4 = *(NSObject **)(a2 + 64);
  a1[8] = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r40r48r56r64c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  unsigned int v2 = *(NSObject **)(a1 + 64);
  if (v2) {
    dispatch_release(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

const char *KTLFlashPluginGetResultString(unsigned int a1)
{
  if (a1 > 0xE) {
    return "Unknown";
  }
  else {
    return off_264413980[a1];
  }
}

BOOL KTLNVMSendDeregister(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v39 = v2;
  int v40 = 14;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v31 = 0;
    int v41 = 0;
    unsigned int v42 = v2;
    uint64_t v35 = 0;
    if (ARI_CsiFpRegister_ENC()
      || (unsigned int v4 = operator new(0x18uLL),
          uint64_t v5 = v35,
          v4[2] = v41,
          *((void *)v4 + 2) = v5,
          *(void *)unsigned int v4 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v4))
      || !KTLUTACopyReceiveData(a1, &v31))
    {
      BOOL v14 = 0;
      unsigned int v15 = 14;
      return !v15 && v14;
    }
    uint64_t v6 = v31;
    (*(void (**)(uint64_t))(*(void *)v31 + 16))(v31);
    int v7 = ARI_CsiFpRegisterRsp_Extract();
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    BOOL v14 = v7 == 0;
    unsigned int v15 = v40;
    if (v14) {
      goto LABEL_27;
    }
    return !v15 && v14;
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2000000000;
  int v38 = 14;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2000000000;
  int v34 = -1;
  uint64_t v16 = dispatch_semaphore_create(0);
  int v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (ARI_CsiFpRegister_BLK())
  {
    BOOL v14 = 0;
    unsigned int v15 = *((_DWORD *)v36 + 6);
    int v40 = v15;
    uint64_t v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v26 = dispatch_semaphore_wait(v17, v19);
  if (v26) {
    _KTLErrorPrint((uint64_t)"KTLNVMSendDeregister", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v29);
  }
  if (v39) {
    AriHost::ExitTrx((AriHost *)v39);
  }
  unsigned int v15 = *((_DWORD *)v36 + 6);
  int v40 = v15;
  if (v26)
  {
    BOOL v14 = 0;
    uint64_t v18 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v14 = *((_DWORD *)v32 + 6) == 0;
  uint64_t v18 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v18);
LABEL_24:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  if (v14)
  {
LABEL_27:
    if (v15)
    {
      if (v15 > 0xE) {
        uint64_t v27 = "Unknown";
      }
      else {
        uint64_t v27 = off_2644139F8[v15 - 1];
      }
      _KTLErrorPrint((uint64_t)"KTLNVMSendDeregister", (uint64_t)"Error: CsiFpRegisterRsp Failure (%s)\n", v8, v9, v10, v11, v12, v13, (uint64_t)v27);
      unsigned int v15 = v40;
    }
  }
  return !v15 && v14;
}

void sub_21C6473D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  if (object) {
    dispatch_release(object);
  }
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v18 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMSendGetStatus(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  unsigned int v60 = v4;
  int v61 = 14;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    uint64_t v46 = 0;
    LODWORD(v42) = v4;
    int v62 = 0;
    uint64_t v50 = 0;
    if (ARI_CsiFpGetStatus_ENC()
      || (uint64_t v6 = operator new(0x18uLL),
          uint64_t v7 = v50,
          v6[2] = v62,
          *((void *)v6 + 2) = v7,
          *(void *)uint64_t v6 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v6))
      || !KTLUTACopyReceiveData(a1, &v46))
    {
      BOOL v16 = 0;
      unsigned int v17 = 14;
      return !v17 && v16;
    }
    uint64_t v8 = v46;
    (*(void (**)(uint64_t))(*(void *)v46 + 16))(v46);
    int v9 = ARI_CsiFpGetStatusRsp_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    BOOL v16 = v9 == 0;
    unsigned int v17 = v61;
    if (!v9) {
      goto LABEL_27;
    }
    return !v17 && v16;
  }
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x7002000000;
  uint64_t v53 = __Block_byref_object_copy__14;
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v55 = v18;
  long long v56 = v18;
  long long v57 = v18;
  long long v58 = v18;
  uint64_t v54 = __Block_byref_object_dispose__15;
  unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2000000000;
  int v49 = 14;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2000000000;
  int v45 = -1;
  dispatch_time_t v19 = dispatch_semaphore_create(0);
  uint64_t v20 = v19;
  dispatch_object_t object = v19;
  if (v19) {
    dispatch_retain(v19);
  }
  if (ARI_CsiFpGetStatus_BLK())
  {
    BOOL v16 = 0;
    unsigned int v17 = *((_DWORD *)v47 + 6);
    int v61 = v17;
    uint64_t v21 = v51;
    *(_OWORD *)a2 = *(_OWORD *)(v51 + 5);
    long long v22 = *(_OWORD *)(v21 + 9);
    long long v23 = *(_OWORD *)(v21 + 11);
    long long v24 = *(_OWORD *)(v21 + 7);
    *(void *)(a2 + 64) = v21[13];
    *(_OWORD *)(a2 + 32) = v22;
    *(_OWORD *)(a2 + 48) = v23;
    *(_OWORD *)(a2 + 16) = v24;
    uint64_t v25 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v26 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v33 = dispatch_semaphore_wait(v20, v26);
  if (v33) {
    _KTLErrorPrint((uint64_t)"KTLNVMSendGetStatus", (uint64_t)"Timeout waiting for response.\n", v27, v28, v29, v30, v31, v32, v40);
  }
  if (v60) {
    AriHost::ExitTrx((AriHost *)v60);
  }
  unsigned int v17 = *((_DWORD *)v47 + 6);
  int v61 = v17;
  int v34 = v51;
  *(_OWORD *)a2 = *(_OWORD *)(v51 + 5);
  long long v35 = *(_OWORD *)(v34 + 9);
  long long v36 = *(_OWORD *)(v34 + 11);
  long long v37 = *(_OWORD *)(v34 + 7);
  *(void *)(a2 + 64) = v34[13];
  *(_OWORD *)(a2 + 32) = v35;
  *(_OWORD *)(a2 + 48) = v36;
  *(_OWORD *)(a2 + 16) = v37;
  if (v33)
  {
    BOOL v16 = 0;
    uint64_t v25 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v16 = *((_DWORD *)v43 + 6) == 0;
  uint64_t v25 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v25);
LABEL_24:
  if (v20) {
    dispatch_release(v20);
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  if (v16)
  {
LABEL_27:
    if (v17)
    {
      if (v17 > 0xE) {
        int v38 = "Unknown";
      }
      else {
        int v38 = off_2644139F8[v17 - 1];
      }
      _KTLErrorPrint((uint64_t)"KTLNVMSendGetStatus", (uint64_t)"Error: CsiFpGetStatusRsp Failure (%s)\n", v10, v11, v12, v13, v14, v15, (uint64_t)v38);
      unsigned int v17 = v61;
    }
  }
  return !v17 && v16;
}

void sub_21C6477EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (object) {
    dispatch_release(object);
  }
  if (v27) {
    dispatch_release(v27);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  __n128 result = *(__n128 *)(a2 + 56);
  long long v3 = *(_OWORD *)(a2 + 72);
  long long v4 = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

uint64_t __KTLNVMSendGetStatus_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiFpGetStatusRsp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLNVMSendSnapshot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v49 = 0;
  unsigned int v7 = *(_DWORD *)(a1 + 16);
  unsigned int v48 = v7;
  if (*(void *)(a1 + 8)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (v8)
  {
    uint64_t v40 = 0;
    ++KTLNVMSendSnapshot::seqId;
    LODWORD(v36) = v7;
    int v50 = 0;
    uint64_t v44 = 0;
    if (ARI_CsiFpSnapshot_ENC()
      || (int v9 = operator new(0x18uLL),
          uint64_t v10 = v44,
          void v9[2] = v50,
          *((void *)v9 + 2) = v10,
          *(void *)int v9 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v9))
      || !KTLUTACopyReceiveData(a1, &v40))
    {
      unsigned int v20 = 0;
      BOOL v19 = 0;
      goto LABEL_32;
    }
    uint64_t v11 = v40;
    (*(void (**)(uint64_t))(*(void *)v40 + 16))(v40);
    int v12 = ARI_CsiFpSnapshotRsp_Extract();
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    BOOL v19 = v12 == 0;
    unsigned int v20 = HIDWORD(v49);
    if (v19) {
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  uint64_t v44 = 0;
  int v45 = &v44;
  uint64_t v46 = 0x2000000000;
  int v47 = 14;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2000000000;
  int v43 = -1431655766;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2000000000;
  int v39 = -1;
  uint64_t v21 = dispatch_semaphore_create(0);
  long long v22 = v21;
  ++KTLNVMSendSnapshot::seqId;
  dispatch_object_t object = v21;
  if (v21) {
    dispatch_retain(v21);
  }
  if (ARI_CsiFpSnapshot_BLK())
  {
    BOOL v19 = 0;
    unsigned int v20 = *((_DWORD *)v45 + 6);
    LODWORD(v49) = *((_DWORD *)v41 + 6);
    HIDWORD(v49) = v20;
    long long v23 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  dispatch_time_t v24 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v31 = dispatch_semaphore_wait(v22, v24);
  if (v31) {
    _KTLErrorPrint((uint64_t)"KTLNVMSendSnapshot", (uint64_t)"Timeout waiting for response.\n", v25, v26, v27, v28, v29, v30, v34);
  }
  if (v48) {
    AriHost::ExitTrx((AriHost *)v48);
  }
  unsigned int v20 = *((_DWORD *)v45 + 6);
  LODWORD(v49) = *((_DWORD *)v41 + 6);
  HIDWORD(v49) = v20;
  if (v31)
  {
    BOOL v19 = 0;
    long long v23 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v19 = *((_DWORD *)v37 + 6) == 0;
  long long v23 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v23);
LABEL_24:
  if (v22) {
    dispatch_release(v22);
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  if (v19)
  {
LABEL_27:
    if (v20)
    {
      if (v20 > 0xE) {
        uint64_t v32 = "Unknown";
      }
      else {
        uint64_t v32 = off_2644139F8[v20 - 1];
      }
      _KTLErrorPrint((uint64_t)"KTLNVMSendSnapshot", (uint64_t)"Error: CsiFpSnapshotRsp Failure (%s)\n", v13, v14, v15, v16, v17, v18, (uint64_t)v32);
      unsigned int v20 = HIDWORD(v49);
    }
  }
LABEL_32:
  *a5 = v49 != 0;
  return !v20 && v19;
}

void sub_21C647C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (object) {
    dispatch_release(object);
  }
  if (v26) {
    dispatch_release(v26);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMReadUpdateHeader(uint64_t a1, _OWORD *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  unsigned int v59 = 0;
  int v8 = *(_DWORD *)(a1 + 16);
  int v58 = v8;
  if (*(void *)(a1 + 8)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    uint64_t v54 = 0;
    LODWORD(v50) = v8;
    LODWORD(v46) = 0;
    uint64_t v60 = 0;
    if (ARI_CsiFpUpdateHeader_ENC()
      || (uint64_t v10 = operator new(0x18uLL),
          uint64_t v11 = v60,
          v10[2] = v46,
          *((void *)v10 + 2) = v11,
          *(void *)uint64_t v10 = &unk_26CCDD1F8,
          !KTLUTASendAndReleaseData(a1, v10))
      || !KTLUTACopyReceiveData(a1, &v54))
    {
      unsigned int v21 = 0;
      BOOL v20 = 0;
      *a4 = 0;
      return !v21 && v20;
    }
    uint64_t v12 = v54;
    (*(void (**)(uint64_t))(*(void *)v54 + 16))(v54);
    int v13 = ARI_CsiFpUpdateHeaderData_Extract();
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
    BOOL v20 = v13 == 0;
    unsigned int v21 = v59;
    *a4 = 0;
    if (v20) {
      goto LABEL_26;
    }
    return !v21 && v20;
  }
  uint64_t v60 = 0;
  int v61 = &v60;
  uint64_t v62 = 0x7802000000;
  uint64_t v63 = __Block_byref_object_copy__24;
  char v64 = __Block_byref_object_dispose__25;
  *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v65 = v22;
  long long v66 = v22;
  long long v67 = v22;
  long long v68 = v22;
  long long v69 = v22;
  uint64_t v54 = 0;
  long long v55 = &v54;
  uint64_t v56 = 0x2000000000;
  int v57 = 14;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2000000000;
  int v53 = -1431655766;
  uint64_t v46 = 0;
  int v47 = &v46;
  uint64_t v48 = 0x2000000000;
  int v49 = 0;
  uint64_t v42 = 0;
  int v43 = &v42;
  uint64_t v44 = 0x2000000000;
  int v45 = -1;
  long long v23 = dispatch_semaphore_create(0);
  dispatch_time_t v24 = v23;
  dispatch_object_t object = v23;
  if (v23) {
    dispatch_retain(v23);
  }
  if (ARI_CsiFpUpdateHeader_BLK()) {
    goto LABEL_16;
  }
  dispatch_time_t v25 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v24, v25))
  {
    _KTLErrorPrint((uint64_t)"KTLNVMReadUpdateHeader", (uint64_t)"Timeout waiting for response.\n", v26, v27, v28, v29, v30, v31, v40);
LABEL_16:
    int v32 = 0;
    goto LABEL_17;
  }
  int v32 = 1;
LABEL_17:
  unsigned int v21 = *((_DWORD *)v55 + 6);
  unsigned int v59 = v21;
  intptr_t v33 = v61;
  *a2 = *(_OWORD *)(v61 + 5);
  long long v34 = *(_OWORD *)(v33 + 9);
  long long v35 = *(_OWORD *)(v33 + 13);
  long long v36 = *(_OWORD *)(v33 + 7);
  a2[3] = *(_OWORD *)(v33 + 11);
  a2[4] = v35;
  a2[1] = v36;
  a2[2] = v34;
  *a3 = *((_DWORD *)v51 + 6);
  *a4 = *((_DWORD *)v47 + 6);
  if (!v32)
  {
    BOOL v20 = 0;
    long long v37 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v20 = *((_DWORD *)v43 + 6) == 0;
  long long v37 = object;
  if (object) {
LABEL_22:
  }
    dispatch_release(v37);
LABEL_23:
  if (v24) {
    dispatch_release(v24);
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
  if (v20)
  {
LABEL_26:
    if (v21)
    {
      if (v21 > 0xE) {
        uint64_t v38 = "Unknown";
      }
      else {
        uint64_t v38 = off_2644139F8[v21 - 1];
      }
      _KTLErrorPrint((uint64_t)"KTLNVMReadUpdateHeader", (uint64_t)"Error: CsiFpUpdateHeaderData Failure (%s)\n", v14, v15, v16, v17, v18, v19, (uint64_t)v38);
      unsigned int v21 = v59;
    }
  }
  return !v21 && v20;
}

void sub_21C6480F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  if (object) {
    dispatch_release(object);
  }
  if (v33) {
    dispatch_release(v33);
  }
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  __n128 result = *(__n128 *)(a2 + 56);
  long long v3 = *(_OWORD *)(a2 + 72);
  long long v4 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void __copy_helper_block_e8_32r40r48r56r64r72c25_ZTSN8dispatch9semaphoreE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  _Block_object_assign(a1 + 8, *(const void **)(a2 + 64), 8);
  long long v4 = *(NSObject **)(a2 + 72);
  a1[9] = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r40r48r56r64r72c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  unsigned int v2 = *(NSObject **)(a1 + 72);
  if (v2) {
    dispatch_release(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 64), 8);
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  long long v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

void *nvm::ARICommandDriver::ARICommandDriver(void *result, uint64_t a2)
{
  *__n128 result = a2;
  return result;
}

{
  *__n128 result = a2;
  return result;
}

uint64_t nvm::ARICommandDriver::NVMSnapshot(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBINvmSnapshotRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        intptr_t v33 = (AriSdk::ARI_IBINvmSnapshotRspCb_SDK *)operator new(0x50uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBINvmSnapshotRspCb_SDK::ARI_IBINvmSnapshotRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    long long v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__47;
  uint64_t v74 = __Block_byref_object_dispose__48;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBINvmSnapshotRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178706432);
      goto LABEL_17;
    }
    long long v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBINvmSnapshotRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"NVMSnapshot", (uint64_t)"Failed IBINvmSnapshotReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C648724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__47(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_IBINvmSnapshotRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBINvmSnapshotRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBINvmSnapshotRspCb_SDK::ARI_IBINvmSnapshotRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C648838(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLCDSendStartCoredumpCommand(void *a1, _WORD *a2, uint64_t a3, uint64_t a4, unsigned int **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int __size = 0;
  if (a3 <= 8)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"maxLen( %u) is less than sizeof command(%lu)\n", a3, a4, (uint64_t)a5, a6, a7, a8, a3);
    return 0;
  }
  *(_DWORD *)a2 = a3;
  a2[2] = 16;
  a2[3] = a3 ^ WORD1(a3) ^ 0x10;
  int __size_4 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendEnhancedCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d\n", a3, a4, (uint64_t)a5, a6, a7, a8, 16);
  if (!*a1
    || !((unsigned int (*)(void *, _WORD *, uint64_t, int *, uint64_t, uint64_t, void))*a1)(a1, a2, 8, &__size_4, 1, a4, 0)|| __size_4 != 8)
  {
    long long v35 = "Failed to send PSI\n";
LABEL_16:
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)v35, v13, v14, v15, v16, v17, v18, v49);
    return 0;
  }
  uint64_t v19 = (uint64_t (*)(void *, _WORD *, uint64_t, unsigned int *, uint64_t, uint64_t, void))a1[1];
  if (!v19 || (v19(a1, a2, a3, &__size, 1, a4, 0) & 1) == 0)
  {
    long long v35 = "Failed to read coredump list table\n";
    goto LABEL_16;
  }
  size_t v20 = __size;
  if (__size < 8 || __size > a3)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"read byte (%u) is less than the dump list size (%lu) or more than maxlen(%u)\n", v13, v14, v15, v16, v17, v18, __size);
    return 0;
  }
  uint64_t v21 = (unsigned int *)malloc(__size);
  if (!v21)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Failed to allocate memory for core dump lists\n", v22, v23, v24, v25, v26, v27, v49);
    return 1;
  }
  uint64_t v28 = v21;
  memcpy(v21, a2, v20);
  if (!v28[1] || *v28 < 0x10000)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Failed after checking of core dump lists:\n", v29, v30, v31, v32, v33, v34, v49);
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Number of entries: %u\n", v37, v38, v39, v40, v41, v42, v28[1]);
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Version: %u\n", v43, v44, v45, v46, v47, v48, *v28);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Read Buffer as CoreDump Header List:", 1, a2);
    }
    free(v28);
    return 0;
  }
  *a5 = v28;
  return 1;
}

uint64_t KTLCDProcessCoredumpEntry(void *a1, void *a2, uint64_t a3, unsigned int *a4, uint64_t __size, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  if (__size)
  {
    unsigned int v11 = __size;
    int v13 = a3;
    uint64_t v37 = 0;
    unint64_t v38 = 0xAAAA0011AAAAAAAALL;
    uint64_t v16 = malloc(__size);
    if (v16)
    {
      uint64_t v17 = v16;
      LODWORD(v38) = v13;
      HIWORD(v38) = v13 ^ HIWORD(v13) ^ 0x11;
      if (!*a1)
      {
LABEL_34:
        uint64_t v24 = 0;
        goto LABEL_35;
      }
      uint64_t v24 = 0;
      if (!((unsigned int (*)(void *, unint64_t *, uint64_t, char *, uint64_t, uint64_t, void))*a1)(a1, &v38, 8, (char *)&v37 + 4, 1, a8, 0))goto LABEL_35; {
      uint64_t v36 = a7;
      }
      if (HIDWORD(v37) != 8) {
        goto LABEL_35;
      }
      unsigned int v25 = *a4;
      a6[1] = *a4;
      unsigned int v26 = a6[2];
      if (v26)
      {
        unsigned int v27 = v25 / v26;
        if (v27 < v11) {
          int v28 = 1;
        }
        else {
          int v28 = v27 / v11;
        }
        if (v25) {
          goto LABEL_11;
        }
      }
      else
      {
        a6[2] = 1;
        if (v25 < v11) {
          int v28 = 1;
        }
        else {
          int v28 = v25 / v11;
        }
        if (v25)
        {
LABEL_11:
          int v35 = v28;
          while (1)
          {
            uint64_t v29 = v11 >= v25 ? v25 : v11;
            uint64_t v30 = (unsigned int (*)(void *, void *, uint64_t, uint64_t *, void, uint64_t, void))a1[1];
            if (!v30) {
              break;
            }
            if (!v30(a1, v17, v29, &v37, 0, a8, 0) || v37 == 0) {
              break;
            }
            v25 -= v37;
            if (!--v28)
            {
              *a6 = *a4 - v25;
              (*(void (**)(uint64_t, _DWORD *, unsigned int *))(v36 + 16))(v36, a6, a4);
              int v28 = v35;
            }
            if (!*a2) {
              goto LABEL_34;
            }
            uint64_t v32 = ((uint64_t (*)(void *, void *, void, char *, uint64_t, uint64_t, void))*a2)(a2, v17, v37, (char *)&v37 + 4, 1, a8, 0);
            uint64_t v24 = v32;
            if (!v25 || (v32 & 1) == 0) {
              goto LABEL_35;
            }
          }
          _KTLDebugPrint((uint64_t)"KTLCDProcessCoredumpEntry", (uint64_t)"Read failed. success = %u, read %u of %u\n", v18, v19, v20, v21, v22, v23, 0);
          goto LABEL_34;
        }
      }
      uint64_t v24 = 1;
LABEL_35:
      free(v17);
      return v24;
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLCDProcessCoredumpEntry", (uint64_t)"Chunk size cannot be zero\n", a3, (uint64_t)a4, __size, (uint64_t)a6, a7, a8, v34);
  }
  return 0;
}

uint64_t KTLCDSendEndCoredumpCommand(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v23 = 0;
  if (!a2 || a3 <= 8)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendEndCoredumpCommand", (uint64_t)"maxLen( %u) is less than sizeof command(%lu)\n", a3, a4, a5, a6, a7, a8, a3);
    return 0;
  }
  *(_DWORD *)a2 = a3;
  *(_WORD *)(a2 + 4) = 18;
  *(_WORD *)(a2 + 6) = a3 ^ WORD1(a3) ^ 0x12;
  int v24 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendEnhancedCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d\n", a3, a4, a5, a6, a7, a8, 18);
  if (!*a1
    || !((unsigned int (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*a1)(a1, a2, 8, &v24, 1, a4, 0)|| v24 != 8)
  {
    uint64_t v20 = "Failed to send PSI command\n";
    goto LABEL_11;
  }
  uint64_t v18 = (uint64_t (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))a1[1];
  if (!v18 || (uint64_t v19 = 1, (v18(a1, a2, a3, &v23, 1, a4, 0) & 1) == 0))
  {
    uint64_t v20 = "Failed to read response\n";
LABEL_11:
    _KTLDebugPrint((uint64_t)"KTLCDSendEndCoredumpCommand", (uint64_t)v20, v12, v13, v14, v15, v16, v17, v22);
    return 0;
  }
  return v19;
}

BOOL KTLGetAntennaPort(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2)
  {
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPort", (uint64_t)"These parameters cannot be NULL: opt: %p, antennaPort: %p\n", a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  int v64 = 0x7FFFFFFF;
  int v65 = -1;
  unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v62[2] = v10;
  v62[3] = v10;
  v62[0] = v10;
  v62[1] = v10;
  AriSdk::ARI_CsiIceGetTxAntennaReq_SDK::ARI_CsiIceGetTxAntennaReq_SDK((AriSdk::ARI_CsiIceGetTxAntennaReq_SDK *)v62);
  uint64_t v60 = 0;
  int v61 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v17 = *(void **)(a1 + 8);
  if (!v17 && *(_DWORD *)(a1 + 16))
  {
    int v35 = dispatch_semaphore_create(0);
    uint64_t v36 = v35;
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x2000000000;
    char v59 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x2000000000;
    int v55 = -1;
    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x2000000000;
    int v51 = 0x7FFFFFFF;
    dispatch_object_t object = v35;
    if (v35) {
      dispatch_retain(v35);
    }
    if (AriHost::Send())
    {
      uint64_t v43 = "Failed to send the message of CsiIceGetTxAntennaReq.\n";
    }
    else
    {
      dispatch_time_t v44 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v36, v44))
      {
        if (*((unsigned char *)v57 + 24))
        {
          int v30 = *((_DWORD *)v53 + 6);
          int v31 = *((_DWORD *)v49 + 6);
          int v64 = v31;
          int v65 = v30;
          BOOL v29 = 1;
          uint64_t v45 = object;
          if (!object)
          {
LABEL_34:
            _Block_object_dispose(&v48, 8);
            _Block_object_dispose(&v52, 8);
            _Block_object_dispose(&v56, 8);
            if (v36) {
              dispatch_release(v36);
            }
            goto LABEL_16;
          }
LABEL_33:
          dispatch_release(v45);
          goto LABEL_34;
        }
LABEL_32:
        BOOL v29 = 0;
        int v30 = -1;
        int v31 = 0x7FFFFFFF;
        uint64_t v45 = object;
        if (!object) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      uint64_t v43 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPort", (uint64_t)v43, v37, v38, v39, v40, v41, v42, v46);
    goto LABEL_32;
  }
  uint64_t v18 = *v60;
  uint64_t v19 = v60[1] - *v60;
  uint64_t v20 = *(unsigned int *)(a1 + 20);
  LODWORD(v56) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v11, v12, v13, v14, v15, v16, v19);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v18);
  }
  if (!*v17
    || ((char v27 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v17)(v17, v18, v19, &v56, 1, v20, 0), v56 == v19)? (v28 = v27): (v28 = 0), (v28 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v21, v22, v23, v24, v25, v26, v19);
    goto LABEL_15;
  }
  uint64_t v56 = 0;
  if (!KTLUTACopyReceiveData(a1, &v56))
  {
LABEL_15:
    BOOL v29 = 0;
    int v30 = -1;
    int v31 = 0x7FFFFFFF;
    goto LABEL_16;
  }
  BOOL v29 = KTLGetAntennaPortParseAndRelease(v56, &v65, &v64);
  int v31 = v64;
  int v30 = v65;
LABEL_16:
  if (v30) {
    BOOL v32 = 0;
  }
  else {
    BOOL v32 = v29;
  }
  *a2 = v31;
  uint64_t v33 = v61;
  if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }
  MEMORY[0x21D4ABBE0](v62);
  return v32;
}

void sub_21C649190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  if (v27)
  {
    dispatch_release(v27);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v28 - 160);
    MEMORY[0x21D4ABBE0](v28 - 144);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v28 - 160);
  MEMORY[0x21D4ABBE0](v28 - 144);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLGetAntennaPortP10KTLOptionsP14KTLAntennaPort_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLGetAntennaPortParseAndRelease((uint64_t)v6, (_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), (_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C6492C4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetAntennaPortParseAndRelease(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23[3] = v6;
  long long v24 = v6;
  v23[1] = v6;
  v23[2] = v6;
  v23[0] = v6;
  uint64_t v7 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::ARI_CsiIceGetTxAntennaRspCb_SDK((AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *)v23, v7);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v23) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPortParseAndRelease", (uint64_t)"NACK Received\n", v8, v9, v10, v11, v12, v13, *(uint64_t *)&v23[0]);
  }
  int v20 = AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::unpack((AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *)v23);
  if (v20)
  {
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPortParseAndRelease", (uint64_t)"Failed to unpack response.\n", v14, v15, v16, v17, v18, v19, *(uint64_t *)&v23[0]);
  }
  else
  {
    uint64_t v21 = (_DWORD *)*((void *)&v24 + 1);
    *a2 = *(_DWORD *)v24;
    *a3 = *v21;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABD50](v23);
  return v20 == 0;
}

uint64_t KTLSetAntennaPort(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (!a1)
  {
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPort", (uint64_t)"These parameters cannot be NULL: opt: %p\n", a3, a4, a5, a6, a7, a8, 0);
    return v8;
  }
  unsigned int v59 = -1;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v57[3] = v10;
  long long v58 = v10;
  v57[1] = v10;
  v57[2] = v10;
  v57[0] = v10;
  AriSdk::ARI_CsiIceSetTxAntennaReq_SDK::ARI_CsiIceSetTxAntennaReq_SDK((AriSdk::ARI_CsiIceSetTxAntennaReq_SDK *)v57);
  uint64_t v11 = operator new(4uLL);
  *uint64_t v11 = a2;
  uint64_t v12 = (void *)v58;
  *(void *)&long long v58 = v11;
  if (v12) {
    operator delete(v12);
  }
  int v55 = 0;
  uint64_t v56 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v19 = *(void **)(v8 + 8);
  if (!v19 && *(_DWORD *)(v8 + 16))
  {
    uint64_t v34 = dispatch_semaphore_create(0);
    int v35 = v34;
    int v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x2000000000;
    char v54 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2000000000;
    int v50 = -1;
    dispatch_object_t object = v34;
    if (v34) {
      dispatch_retain(v34);
    }
    if (AriHost::Send())
    {
      uint64_t v42 = "Failed to send the message of CsiIceSetTxAntennaReq.\n";
    }
    else
    {
      dispatch_time_t v43 = dispatch_time(0, 1000000 * *(unsigned int *)(v8 + 20));
      if (!dispatch_semaphore_wait(v35, v43))
      {
        if (*((unsigned char *)v52 + 24))
        {
          unsigned int v31 = *((_DWORD *)v48 + 6);
          unsigned int v59 = v31;
          LODWORD(v8) = 1;
          dispatch_time_t v44 = object;
          if (!object)
          {
LABEL_35:
            _Block_object_dispose(&v47, 8);
            _Block_object_dispose(&v51, 8);
            if (v35) {
              dispatch_release(v35);
            }
            goto LABEL_17;
          }
LABEL_34:
          dispatch_release(v44);
          goto LABEL_35;
        }
LABEL_33:
        LODWORD(v8) = 0;
        unsigned int v31 = -1;
        dispatch_time_t v44 = object;
        if (!object) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      uint64_t v42 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPort", (uint64_t)v42, v36, v37, v38, v39, v40, v41, v45);
    goto LABEL_33;
  }
  uint64_t v20 = *v55;
  uint64_t v21 = v55[1] - *v55;
  uint64_t v22 = *(unsigned int *)(v8 + 20);
  LODWORD(v51) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v13, v14, v15, v16, v17, v18, v21);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v20);
  }
  if (!*v19
    || ((char v29 = ((uint64_t (*)(void *, uint64_t, uint64_t, ktl::KTLPacket **, uint64_t, uint64_t, void))*v19)(v19, v20, v21, &v51, 1, v22, 0), v51 == v21)? (v30 = v29): (v30 = 0), (v30 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v23, v24, v25, v26, v27, v28, v21);
    goto LABEL_16;
  }
  int v51 = 0;
  if (!KTLUTACopyReceiveData(v8, (uint64_t *)&v51))
  {
LABEL_16:
    LODWORD(v8) = 0;
    unsigned int v31 = -1;
    goto LABEL_17;
  }
  LODWORD(v8) = KTLSetAntennaPortParseAndRelease(v51, &v59);
  unsigned int v31 = v59;
LABEL_17:
  if (v31) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v8;
  }
  BOOL v32 = v56;
  if (v56 && !atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
    std::__shared_weak_count::__release_weak(v32);
  }
  MEMORY[0x21D4ABC20](v57);
  return v8;
}

void sub_21C649774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  if (v27)
  {
    dispatch_release(v27);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
    MEMORY[0x21D4ABC20](v28 - 144);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  MEMORY[0x21D4ABC20](v28 - 144);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLSetAntennaPortP10KTLOptions14KTLAntennaPort_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  long long v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)long long v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLSetAntennaPortParseAndRelease((ktl::KTLPacket *)v6, (unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 0;
}

void sub_21C6498A8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLSetAntennaPortParseAndRelease(ktl::KTLPacket *a1, unsigned int *a2)
{
  uint64_t v21 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  uint64_t v5 = (const unsigned __int8 *)(*(uint64_t (**)(ktl::KTLPacket *))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::ARI_CsiIceSetTxAntennaRspCb_SDK((AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPortParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  }
  int v18 = AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::unpack((AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *)v20);
  if (v18) {
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPortParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  }
  else {
    *a2 = *v21;
  }
  (*(void (**)(ktl::KTLPacket *))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABDA0](v20);
  return v18 == 0;
}

BOOL KTLGetRxDiversity(uint64_t a1, int a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetRxDiversity", (uint64_t)"These parameters cannot be NULL: opt: %p, rxDiversity: %p\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  unsigned int v11 = *(_DWORD *)(a1 + 16);
  int v57 = -1;
  unsigned int v58 = v11;
  int v55 = 0x7FFFFFFF;
  int v56 = a2;
  if (*(void *)(a1 + 8)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12)
  {
    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x2000000000;
    int v54 = -1;
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2000000000;
    int v50 = -1;
    uint64_t v43 = 0;
    dispatch_time_t v44 = &v43;
    uint64_t v45 = 0x2000000000;
    int v46 = a2;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2000000000;
    int v42 = 0x7FFFFFFF;
    uint64_t v19 = dispatch_semaphore_create(0);
    uint64_t v20 = v19;
    dispatch_object_t object = v19;
    if (v19) {
      dispatch_retain(v19);
    }
    if (ARI_CsiIceGetRxDiversityReq_BLK())
    {
      _KTLErrorPrint((uint64_t)"KTLGetRxDiversity", (uint64_t)"Failed to send request.\n", v21, v22, v23, v24, v25, v26, v37);
      int v27 = 0;
      int v17 = -1;
      goto LABEL_25;
    }
    dispatch_time_t v28 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v20, v28))
    {
      _KTLErrorPrint((uint64_t)"KTLGetRxDiversity", (uint64_t)"Timeout waiting for response.\n", v29, v30, v31, v32, v33, v34, v37);
      int v27 = 0;
      int v17 = -1;
      int v35 = (AriHost *)v58;
      if (!v58) {
        goto LABEL_25;
      }
    }
    else if (*((_DWORD *)v52 + 6))
    {
      int v27 = 0;
      int v17 = -1;
      int v35 = (AriHost *)v58;
      if (!v58) {
        goto LABEL_25;
      }
    }
    else
    {
      int v17 = *((_DWORD *)v48 + 6);
      int v36 = *((_DWORD *)v44 + 6);
      int v55 = *((_DWORD *)v40 + 6);
      int v56 = v36;
      int v27 = 1;
      int v35 = (AriHost *)v58;
      if (!v58)
      {
LABEL_25:
        if (object) {
          dispatch_release(object);
        }
        if (v20) {
          dispatch_release(v20);
        }
        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v51, 8);
        BOOL result = 0;
        if (!v27) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
    }
    AriHost::ExitTrx(v35);
    goto LABEL_25;
  }
  uint64_t v47 = 0;
  LODWORD(v43) = v11;
  LODWORD(v39) = 0;
  uint64_t v51 = 0;
  if (!ARI_CsiIceGetRxDiversityReq_ENC()
    && (uint64_t v13 = operator new(0x18uLL),
        uint64_t v14 = v51,
        v13[2] = v39,
        *((void *)v13 + 2) = v14,
        *(void *)uint64_t v13 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v13))
    && KTLUTACopyReceiveData(a1, &v47))
  {
    uint64_t v15 = v47;
    (*(void (**)(uint64_t))(*(void *)v47 + 16))(v47);
    int v16 = ARI_CsiIceGetRxDiversityRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
    int v17 = v57;
    BOOL result = 0;
    if (!v16)
    {
LABEL_30:
      if (!v17) {
        BOOL result = v56 == a2;
      }
    }
  }
  else
  {
    BOOL result = 0;
  }
LABEL_32:
  *a3 = v55;
  return result;
}

void sub_21C649D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  if (object) {
    dispatch_release(object);
  }
  if (v29) {
    dispatch_release(v29);
  }
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v30 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLGetRxDiversityP10KTLOptions13KTLAntennaRATP14KTLRxDiversity_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceGetRxDiversityRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLSetRxDiversity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    _KTLErrorPrint((uint64_t)"KTLSetRxDiversity", (uint64_t)"These parameters cannot be NULL: opt: %p\n", a3, a4, a5, a6, a7, a8, 0);
    return 0;
  }
  unsigned int v9 = *(_DWORD *)(a1 + 16);
  int v44 = -1;
  unsigned int v45 = v9;
  if (*(void *)(a1 + 8)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10)
  {
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x2000000000;
    int v43 = -1;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2000000000;
    int v39 = -1;
    int v18 = dispatch_semaphore_create(0);
    uint64_t v19 = v18;
    dispatch_object_t object = v18;
    if (v18) {
      dispatch_retain(v18);
    }
    if (ARI_CsiIceRxDiversityReq_BLK())
    {
      _KTLErrorPrint((uint64_t)"KTLSetRxDiversity", (uint64_t)"Failed to send request.\n", v20, v21, v22, v23, v24, v25, v34);
      BOOL v15 = 0;
      int v16 = -1;
LABEL_23:
      if (object) {
        dispatch_release(object);
      }
      if (v19) {
        dispatch_release(v19);
      }
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
      return !v16 && v15;
    }
    dispatch_time_t v26 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v19, v26))
    {
      _KTLErrorPrint((uint64_t)"KTLSetRxDiversity", (uint64_t)"Timeout waiting for response.\n", v27, v28, v29, v30, v31, v32, v34);
      BOOL v15 = 0;
      int v16 = -1;
      uint64_t v33 = (AriHost *)v45;
      if (!v45) {
        goto LABEL_23;
      }
    }
    else if (*((_DWORD *)v41 + 6))
    {
      BOOL v15 = 0;
      int v16 = -1;
      uint64_t v33 = (AriHost *)v45;
      if (!v45) {
        goto LABEL_23;
      }
    }
    else
    {
      int v16 = *((_DWORD *)v37 + 6);
      BOOL v15 = 1;
      uint64_t v33 = (AriHost *)v45;
      if (!v45) {
        goto LABEL_23;
      }
    }
    AriHost::ExitTrx(v33);
    goto LABEL_23;
  }
  uint64_t v36 = 0;
  int v46 = 0;
  unsigned int v47 = v9;
  uint64_t v40 = 0;
  if (!ARI_CsiIceRxDiversityReq_ENC()
    && (unsigned int v11 = operator new(0x18uLL),
        uint64_t v12 = v40,
        v11[2] = v46,
        *((void *)v11 + 2) = v12,
        *(void *)unsigned int v11 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v11))
    && KTLUTACopyReceiveData(a1, &v36))
  {
    uint64_t v13 = v36;
    (*(void (**)(uint64_t))(*(void *)v36 + 16))(v36);
    int v14 = ARI_CsiIceRxDiversityRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    BOOL v15 = v14 == 0;
    int v16 = v44;
  }
  else
  {
    BOOL v15 = 0;
    int v16 = -1;
  }
  return !v16 && v15;
}

void sub_21C64A174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLSetRxDiversityP10KTLOptions13KTLAntennaRAT14KTLRxDiversity_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceRxDiversityRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLRFFilePushReq(uint64_t a1, int a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a4)
  {
    int v10 = a3;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v80[3] = v12;
    long long v81 = v12;
    v80[1] = v12;
    v80[2] = v12;
    v80[0] = v12;
    AriSdk::ARI_CsiIceRFFilerWriteReq_SDK::ARI_CsiIceRFFilerWriteReq_SDK((AriSdk::ARI_CsiIceRFFilerWriteReq_SDK *)v80);
    uint64_t v13 = operator new(4uLL);
    *uint64_t v13 = a2;
    int v14 = (void *)v81;
    *(void *)&long long v81 = v13;
    if (v14) {
      operator delete(v14);
    }
    BOOL v15 = operator new(4uLL);
    *BOOL v15 = v10;
    int v16 = (void *)*((void *)&v81 + 1);
    *((void *)&v81 + 1) = v15;
    if (v16) {
      operator delete(v16);
    }
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    AriSdk::MsgBase::getRawBytes();
    if (MEMORY[0] == MEMORY[8])
    {
      _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)"Failed to setup CsiIceRFFilerWriteReq\n", v17, v18, v19, v20, v21, v22, v64);
      BOOL v36 = 0;
LABEL_57:
      MEMORY[0x21D4ABC00](v80);
      return v36;
    }
    uint64_t v74 = 0;
    uint64_t v75 = &v74;
    uint64_t v76 = 0x2000000000;
    char v77 = 0;
    uint64_t v23 = *(void **)(a1 + 8);
    if (!v23 && *(_DWORD *)(a1 + 16))
    {
      uint64_t v70 = 0;
      uint64_t v71 = &v70;
      uint64_t v72 = 0x2000000000;
      int v73 = 0;
      uint64_t v48 = dispatch_semaphore_create(0);
      uint64_t v49 = v48;
      v66[1] = MEMORY[0x263EF8330];
      _OWORD v66[2] = 1174405120;
      v66[3] = (uint64_t)___Z16KTLRFFilePushReqP10KTLOptionsjjPi_block_invoke;
      v66[4] = (uint64_t)&__block_descriptor_tmp_21;
      int v68 = a2;
      int v69 = v10;
      v66[5] = (uint64_t)&v74;
      v66[6] = (uint64_t)&v70;
      dispatch_object_t object = v48;
      if (v48) {
        dispatch_retain(v48);
      }
      int started = AriHost::StartStream();
      dispatch_time_t v51 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (dispatch_semaphore_wait(v49, v51))
      {
        _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)"Timeout waiting for response.\n", v52, v53, v54, v55, v56, v57, v64);
        *((unsigned char *)v75 + 24) = 0;
      }
      else
      {
        if (*((unsigned char *)v75 + 24)) {
          BOOL v60 = started == 0;
        }
        else {
          BOOL v60 = 0;
        }
        char v61 = v60;
        *((unsigned char *)v75 + 24) = v61;
        if (v60) {
          *a4 = *((_DWORD *)v71 + 6);
        }
      }
      if (object) {
        dispatch_release(object);
      }
      if (v49) {
        dispatch_release(v49);
      }
      _Block_object_dispose(&v70, 8);
LABEL_54:
      BOOL v36 = *((unsigned char *)v75 + 24) != 0;
      _Block_object_dispose(&v74, 8);
      uint64_t v62 = v79;
      if (v79 && !atomic_fetch_add(&v79->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
      goto LABEL_57;
    }
    uint64_t v24 = *v78;
    uint64_t v25 = v78[1] - *v78;
    uint64_t v26 = *(unsigned int *)(a1 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v17, v18, v19, v20, v21, v22, v25);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v24);
    }
    if (*v23
      && ((char v33 = ((uint64_t (*)(void *, uint64_t, uint64_t, AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **, uint64_t, uint64_t, void))*v23)(v23, v24, v25, &v70, 1, v26, 0), v70 == v25)? (v34 = v33): (v34 = 0), (v34 & 1) != 0))
    {
      char v35 = 1;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v27, v28, v29, v30, v31, v32, v25);
      char v35 = 0;
    }
    *((unsigned char *)v75 + 24) = v35;
    v66[0] = 0;
    char v37 = KTLUTACopyReceiveData(a1, v66);
    uint64_t v38 = v66[0];
    *((unsigned char *)v75 + 24) = v37;
    uint64_t v70 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v71 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **)0xAAAAAAAAAAAAAAAALL;
    int v39 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v38 + 16))(v38);
    getResponse<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>(&v70, v39);
    int v46 = v70;
    if (*((unsigned char *)v75 + 24))
    {
      if (v70)
      {
        unsigned int v47 = (_DWORD *)*((void *)v70 + 8);
        if (*v47 == a2)
        {
          **((_DWORD **)v70 + 9) = v10;
          *((unsigned char *)v75 + 24) = v10 != 0;
          if (v10)
          {
LABEL_37:
            *a4 = 0;
            unsigned int v59 = (std::__shared_weak_count *)v71;
            if (v71 && !atomic_fetch_add((atomic_ullong *volatile)v71 + 1, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
              std::__shared_weak_count::__release_weak(v59);
            }
            goto LABEL_54;
          }
        }
        else
        {
          *((unsigned char *)v75 + 24) = 0;
        }
        goto LABEL_35;
      }
      *((unsigned char *)v75 + 24) = 0;
    }
    else
    {
      *((unsigned char *)v75 + 24) = 0;
      if (v46)
      {
        unsigned int v47 = (_DWORD *)*((void *)v46 + 8);
LABEL_35:
        uint64_t v65 = *v47;
        unsigned int v58 = "Response in error. response->instance_t1: %d(expecting nInstance: %d), response->result_t2: %d(expecting %d), \n";
        goto LABEL_36;
      }
    }
    unsigned int v58 = "Failed to get response!\n";
LABEL_36:
    _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)v58, v40, v41, v42, v43, v44, v45, v65);
    goto LABEL_37;
  }
  _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)"Parameters are not correct: opt: %p, filerID: %p\n", a3, (uint64_t)a4, a5, a6, a7, a8, a1);
  return 0;
}

void sub_21C64A704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,dispatch_object_t object,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  if (object) {
    dispatch_release(object);
  }
  if (v31) {
    dispatch_release(v31);
  }
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a31);
  MEMORY[0x21D4ABC00](v32 - 160);
  _Unwind_Resume(a1);
}

void sub_21C64A760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a31);
  MEMORY[0x21D4ABC00](v31 - 160);
  _Unwind_Resume(a1);
}

uint64_t ___Z16KTLRFFilePushReqP10KTLOptionsjjPi_block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v32 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
    getResponse<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>(&v32, (const unsigned __int8 *)v7);
    uint64_t v20 = v32;
    BOOL v21 = v32 && **((_DWORD **)v32 + 8) == *(_DWORD *)(a1 + 56) && **((_DWORD **)v32 + 9) == *(_DWORD *)(a1 + 60);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v21;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = AriMsg::GetBufCtx((AriMsg *)a2, (const unsigned __int8 *)a3);
      _KTLDebugPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Filer ID: %d (0x%x)\n", v22, v23, v24, v25, v26, v27, *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      uint64_t v28 = 0;
      uint64_t v29 = (std::__shared_weak_count *)v33;
      if (!v33) {
        goto LABEL_16;
      }
    }
    else if (v20)
    {
      _KTLErrorPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Response in error. response->instance_t1: %d(expecting nInstance: %d), response->result_t2: %d(expecting %d), \n", v14, v15, v16, v17, v18, v19, **((unsigned int **)v20 + 8));
      uint64_t v28 = 0xFFFFFFFFLL;
      uint64_t v29 = (std::__shared_weak_count *)v33;
      if (!v33) {
        goto LABEL_16;
      }
    }
    else
    {
      _KTLErrorPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Failed to get response!\n", v14, v15, v16, v17, v18, v19, v31);
      uint64_t v28 = 0xFFFFFFFFLL;
      uint64_t v29 = (std::__shared_weak_count *)v33;
      if (!v33) {
        goto LABEL_16;
      }
    }
    if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  else
  {
    _KTLErrorPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Failed to allocate packet memory\n", v8, v9, v10, v11, v12, v13, v31);
    uint64_t v28 = 0xFFFFFFFFLL;
  }
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return v28;
}

void sub_21C64A9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21C64A9D8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void getResponse<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>(AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **a1, const unsigned __int8 *a2)
{
  if (a2)
  {
    long long v4 = (std::__shared_weak_count *)operator new(0x68uLL);
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCDD8E8;
    uint64_t v5 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)&v4[1];
    AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::ARI_CsiIceRFFilerWriteRspCb_SDK((AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)&v4[1], a2);
    if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)&v4[1]) == 67600384
      || AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::unpack(v5))
    {
      *a1 = 0;
      a1[1] = 0;
      if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      *a1 = v5;
      a1[1] = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)v4;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

void sub_21C64AB3C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_21C64AB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ktl::KTLReceivePacket::~KTLReceivePacket(ktl::KTLReceivePacket *this)
{
  *(void *)this = &unk_26CCDD8A8;
  uint64_t v1 = (void *)*((void *)this + 2);
  if (v1) {
    operator delete[](v1);
  }
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CCDD8A8;
  unsigned int v2 = (void *)*((void *)this + 2);
  if (v2) {
    operator delete[](v2);
  }

  operator delete(this);
}

uint64_t ktl::KTLReceivePacket::getBuffer(ktl::KTLReceivePacket *this)
{
  return *((void *)this + 4);
}

void std::__shared_ptr_emplace<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCDD8E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CCDD8E8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

BOOL KTLSecGetFusingState(uint64_t a1, int *a2)
{
  int v41 = 0;
  int v42 = -1;
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v40 = v2;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v2 == 0;
  }
  if (!v5)
  {
    uint64_t v36 = 0;
    char v37 = &v36;
    uint64_t v38 = 0x2000000000;
    int v39 = -1;
    uint64_t v32 = 0;
    unint64_t v33 = &v32;
    uint64_t v34 = 0x2000000000;
    int v35 = -1431655766;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2000000000;
    int v31 = -1;
    uint64_t v14 = dispatch_semaphore_create(0);
    uint64_t v15 = v14;
    uint64_t v26 = MEMORY[0x263EF8330];
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    if (ARI_CsiSecGetFusingStateReq_BLK())
    {
      BOOL v10 = 0;
      int v11 = *((_DWORD *)v37 + 6);
      int v12 = *((_DWORD *)v33 + 6);
      uint64_t v16 = object;
      if (!object) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_time_t v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v24 = dispatch_semaphore_wait(v15, v17);
      if (v24) {
        _KTLErrorPrint((uint64_t)"KTLSecGetFusingState", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v26);
      }
      if (v40) {
        AriHost::ExitTrx((AriHost *)v40);
      }
      int v11 = *((_DWORD *)v37 + 6);
      int v12 = *((_DWORD *)v33 + 6);
      if (v24)
      {
        BOOL v10 = 0;
        uint64_t v16 = object;
        if (!object)
        {
LABEL_25:
          if (v15) {
            dispatch_release(v15);
          }
          _Block_object_dispose(&v28, 8);
          _Block_object_dispose(&v32, 8);
          _Block_object_dispose(&v36, 8);
          goto LABEL_28;
        }
      }
      else
      {
        BOOL v10 = *((_DWORD *)v29 + 6) == 0;
        uint64_t v16 = object;
        if (!object) {
          goto LABEL_25;
        }
      }
    }
    dispatch_release(v16);
    goto LABEL_25;
  }
  uint64_t v32 = 0;
  LODWORD(v28) = v2;
  int v43 = 0;
  uint64_t v36 = 0;
  if (!ARI_CsiSecGetFusingStateReq_ENC()
    && (uint64_t v6 = operator new(0x18uLL),
        uint64_t v7 = v36,
        v6[2] = v43,
        *((void *)v6 + 2) = v7,
        *(void *)uint64_t v6 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v6))
    && KTLUTACopyReceiveData(a1, &v32))
  {
    uint64_t v8 = v32;
    (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
    int v9 = ARI_CsiSecGetFusingStateRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    BOOL v10 = v9 == 0;
    int v12 = v41;
    int v11 = v42;
  }
  else
  {
    int v12 = 0;
    BOOL v10 = 0;
    int v11 = -1;
  }
LABEL_28:
  if (v12) {
    int v25 = 3;
  }
  else {
    int v25 = 1;
  }
  *a2 = v25;
  return !v11 && v10;
}

void sub_21C64AFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLSecGetFusingState_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiSecGetFusingStateRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t KTLSecGetRandomNum(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v18 = a1;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[2] = v3;
  v17[3] = v3;
  v17[0] = v3;
  v17[1] = v3;
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v17);
  uint64_t v16 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
  uint64_t RandomNum = security::ARICommandDriver::GetRandomNum((security::ARICommandDriver *)&v18, (AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v17, &v16);
  if ((RandomNum & 1) == 0) {
    _KTLErrorPrint((uint64_t)"KTLSecGetRandomNum", (uint64_t)"Failed GetRandomNum ARI command\n", v4, v5, v6, v7, v8, v9, v15);
  }
  uint64_t v11 = *((void *)v16 + 8);
  int v12 = *(_DWORD *)(v11 + 32);
  long long v13 = *(_OWORD *)(v11 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v11;
  *(_OWORD *)(a2 + 16) = v13;
  *(_DWORD *)(a2 + 32) = v12;
  MEMORY[0x21D4ABC70](v17);
  return RandomNum;
}

void *security::ARICommandDriver::ARICommandDriver(void *result, uint64_t a2)
{
  *BOOL result = a2;
  return result;
}

{
  *BOOL result = a2;
  return result;
}

uint64_t security::ARICommandDriver::GetRandomNum(security::ARICommandDriver *this, AriSdk::ARI_CsiSecGetRandomNumReq_SDK *a2, AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *(void *)this;
  int v12 = *(void **)(*(void *)this + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*(void *)this, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        unint64_t v33 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)operator new(0x48uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::ARI_CsiSecGetRandomNumRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    int v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  int v73 = __Block_byref_object_copy__23;
  uint64_t v74 = __Block_byref_object_dispose__24;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  dispatch_time_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*(void *)this + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    BOOL v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  BOOL v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 84082688);
      goto LABEL_17;
    }
    int v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(void))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetRandomNum", (uint64_t)"Failed CsiSecGetRandomNumReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C64B5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

BOOL KTLSecGetSNUM(uint64_t a1, uint64_t a2)
{
  v39[3] = *MEMORY[0x263EF8340];
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v31 = v2;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v2 == 0;
  }
  if (v5)
  {
    uint64_t v27 = 0;
    int v32 = 0;
    unsigned int v33 = v2;
    uint64_t v34 = 0;
    if (!ARI_CsiSecGetSNUMReq_ENC())
    {
      uint64_t v6 = operator new(0x18uLL);
      uint64_t v7 = v34;
      v6[2] = v32;
      *((void *)v6 + 2) = v7;
      *(void *)uint64_t v6 = &unk_26CCDD1F8;
      if (KTLUTASendAndReleaseData(a1, v6))
      {
        if (KTLUTACopyReceiveData(a1, &v27))
        {
          uint64_t v8 = v27;
          (*(void (**)(uint64_t))(*(void *)v27 + 16))(v27);
          int v9 = ARI_CsiSecGetSNUMRspCb_Extract();
          (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
          return v9 == 0;
        }
      }
    }
    return 0;
  }
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x4002000000;
  uint64_t v37 = __Block_byref_object_copy__5;
  uint64_t v38 = __Block_byref_object_dispose__5;
  memset(v39, 170, 24);
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2000000000;
  int v30 = -1;
  int v12 = dispatch_semaphore_create(0);
  uint64_t v13 = v12;
  uint64_t v25 = MEMORY[0x263EF8330];
  dispatch_object_t object = v12;
  if (v12) {
    dispatch_retain(v12);
  }
  if (!ARI_CsiSecGetSNUMReq_BLK())
  {
    dispatch_time_t v16 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v23 = dispatch_semaphore_wait(v13, v16);
    if (v23) {
      _KTLErrorPrint((uint64_t)"KTLSecGetSNUM", (uint64_t)"Timeout waiting for response.\n", v17, v18, v19, v20, v21, v22, v25);
    }
    if (v31) {
      AriHost::ExitTrx((AriHost *)v31);
    }
    uint64_t v24 = v35[7];
    *(_OWORD *)a2 = *(_OWORD *)(v35 + 5);
    *(void *)(a2 + 16) = v24;
    if (v23)
    {
      BOOL v10 = 0;
      uint64_t v15 = object;
      if (!object) {
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v10 = *((_DWORD *)v28 + 6) == 0;
      uint64_t v15 = object;
      if (!object) {
        goto LABEL_18;
      }
    }
    goto LABEL_17;
  }
  BOOL v10 = 0;
  uint64_t v14 = v35[7];
  *(_OWORD *)a2 = *(_OWORD *)(v35 + 5);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = object;
  if (object) {
LABEL_17:
  }
    dispatch_release(v15);
LABEL_18:
  if (v13) {
    dispatch_release(v13);
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v34, 8);
  return v10;
}

void sub_21C64B9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (object) {
    dispatch_release(object);
  }
  if (v22) {
    dispatch_release(v22);
  }
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t __KTLSecGetSNUM_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiSecGetSNUMRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLSecGetChipId(uint64_t a1, _DWORD *a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  unsigned int v33 = v4;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    uint64_t v25 = 0;
    int v34 = 0;
    unsigned int v35 = v4;
    uint64_t v29 = 0;
    if (ARI_CsiSecGetChipIdReq_ENC()) {
      return 0;
    }
    uint64_t v6 = operator new(0x18uLL);
    uint64_t v7 = v29;
    v6[2] = v34;
    *((void *)v6 + 2) = v7;
    *(void *)uint64_t v6 = &unk_26CCDD1F8;
    if (!KTLUTASendAndReleaseData(a1, v6) || !KTLUTACopyReceiveData(a1, &v25)) {
      return 0;
    }
    uint64_t v8 = v25;
    (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
    int v9 = ARI_CsiSecGetChipIdRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    return v9 == 0;
  }
  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x2000000000;
  int v32 = -1431655766;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2000000000;
  int v28 = -1;
  uint64_t v11 = dispatch_semaphore_create(0);
  int v12 = v11;
  dispatch_object_t object = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  if (!ARI_CsiSecGetChipIdReq_BLK())
  {
    dispatch_time_t v15 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v22 = dispatch_semaphore_wait(v12, v15);
    if (v22) {
      _KTLErrorPrint((uint64_t)"KTLSecGetChipId", (uint64_t)"Timeout waiting for response.\n", v16, v17, v18, v19, v20, v21, v23);
    }
    if (v33) {
      AriHost::ExitTrx((AriHost *)v33);
    }
    *a2 = *((_DWORD *)v30 + 6);
    if (v22)
    {
      BOOL v10 = 0;
      uint64_t v13 = object;
      if (!object) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v10 = *((_DWORD *)v26 + 6) == 0;
      uint64_t v13 = object;
      if (!object) {
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  BOOL v10 = 0;
  *a2 = *((_DWORD *)v30 + 6);
  uint64_t v13 = object;
  if (object) {
LABEL_14:
  }
    dispatch_release(v13);
LABEL_15:
  if (v12) {
    dispatch_release(v12);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v10;
}

void sub_21C64BD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLSecGetChipId_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiSecGetChipIdRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLSecGetPkHash(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  unsigned int v34 = v4;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x5002000000;
    uint64_t v40 = __Block_byref_object_copy__7_0;
    uint64_t v41 = __Block_byref_object_dispose__8_0;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v11;
    long long v43 = v11;
    __int16 v44 = -21846;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2000000000;
    int v33 = -1;
    int v12 = dispatch_semaphore_create(0);
    uint64_t v13 = v12;
    uint64_t v28 = MEMORY[0x263EF8330];
    dispatch_object_t object = v12;
    if (v12) {
      dispatch_retain(v12);
    }
    if (ARI_CsiSecGetPkHashReq_BLK())
    {
      BOOL v10 = 0;
      __int16 v14 = *((_WORD *)v38 + 36);
      long long v15 = *(_OWORD *)(v38 + 7);
      *(_OWORD *)a2 = *(_OWORD *)(v38 + 5);
      *(_OWORD *)(a2 + 16) = v15;
      *(_WORD *)(a2 + 32) = v14;
      uint64_t v16 = object;
      if (!object) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    dispatch_time_t v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v25 = dispatch_semaphore_wait(v13, v18);
    if (v25) {
      _KTLErrorPrint((uint64_t)"KTLSecGetPkHash", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v28);
    }
    if (v34) {
      AriHost::ExitTrx((AriHost *)v34);
    }
    __int16 v26 = *((_WORD *)v38 + 36);
    long long v27 = *(_OWORD *)(v38 + 7);
    *(_OWORD *)a2 = *(_OWORD *)(v38 + 5);
    *(_OWORD *)(a2 + 16) = v27;
    *(_WORD *)(a2 + 32) = v26;
    if (v25)
    {
      BOOL v10 = 0;
      uint64_t v16 = object;
      if (!object) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v10 = *((_DWORD *)v31 + 6) == 0;
      uint64_t v16 = object;
      if (!object)
      {
LABEL_16:
        if (v13) {
          dispatch_release(v13);
        }
        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&v37, 8);
        if (!*(_WORD *)(a2 + 32)) {
          goto LABEL_19;
        }
        return v10;
      }
    }
LABEL_15:
    dispatch_release(v16);
    goto LABEL_16;
  }
  uint64_t v30 = 0;
  int v35 = 0;
  unsigned int v36 = v4;
  uint64_t v37 = 0;
  if (ARI_CsiSecGetPkHashReq_ENC()
    || (uint64_t v6 = operator new(0x18uLL),
        uint64_t v7 = v37,
        v6[2] = v35,
        *((void *)v6 + 2) = v7,
        *(void *)uint64_t v6 = &unk_26CCDD1F8,
        !KTLUTASendAndReleaseData(a1, v6))
    || !KTLUTACopyReceiveData(a1, &v30))
  {
    BOOL v10 = 0;
    if (*(_WORD *)(a2 + 32)) {
      return v10;
    }
    goto LABEL_19;
  }
  uint64_t v8 = v30;
  (*(void (**)(uint64_t))(*(void *)v30 + 16))(v30);
  int v9 = ARI_CsiSecGetPkHashRspCb_Extract();
  (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  BOOL v10 = v9 == 0;
  if (!*(_WORD *)(a2 + 32))
  {
LABEL_19:
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_WORD *)(a2 + 32) = 32;
  }
  return v10;
}

void sub_21C64C118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (object) {
    dispatch_release(object);
  }
  if (v22) {
    dispatch_release(v22);
  }
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__7_0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t __KTLSecGetPkHash_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiSecGetPkHashRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLGetPersonalizationInfo(uint64_t a1, _DWORD *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  memset(v30, 170, sizeof(v30));
  int v24 = 0;
  unsigned __int16 v29 = -21846;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[0] = v4;
  v28[1] = v4;
  uint64_t v27 = a1;
  v26[2] = v4;
  v26[3] = v4;
  v26[0] = v4;
  v26[1] = v4;
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v26);
  intptr_t v25 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
  if (security::ARICommandDriver::GetRandomNum((security::ARICommandDriver *)&v27, (AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v26, &v25))
  {
    uint64_t v11 = *((void *)v25 + 8);
    long long v12 = *(_OWORD *)(v11 + 16);
    __src[0] = *(_OWORD *)v11;
    __src[1] = v12;
    unsigned int v32 = *(_DWORD *)(v11 + 32);
    MEMORY[0x21D4ABC70](v26);
    BOOL result = KTLSecGetSNUM(a1, (uint64_t)v30);
    if (result)
    {
      BOOL result = KTLSecGetChipId(a1, &v24);
      if (result)
      {
        BOOL result = KTLSecGetPkHash(a1, (uint64_t)v28);
        if (result)
        {
          size_t v20 = v32;
          size_t v21 = v30[8];
          size_t v22 = v29;
          if (v32 > 0x20 || v30[8] > 0x10u || v29 >= 0x21u)
          {
            _KTLErrorPrint((uint64_t)"KTLGetPersonalizationInfo", (uint64_t)"Invalid buffer size(s) returned from baseband:\nnonce(%u)\tnonce_max(%u)\nsnum(%u)\tsnum_max(%u)\npkhash(%u)\tpkhash_max(%u)\n", v14, v15, v16, v17, v18, v19, v32);
            return 0;
          }
          else
          {
            *a2 = v24;
            a2[1] = v20;
            a2[2] = v21;
            a2[3] = v22;
            bzero((char *)a2 + v20 + 16, 80 - v20);
            memcpy(a2 + 4, __src, v20);
            memcpy(a2 + 12, v30, v21);
            memcpy(a2 + 16, v28, v22);
            return 1;
          }
        }
      }
    }
  }
  else
  {
    _KTLErrorPrint((uint64_t)"KTLSecGetRandomNum", (uint64_t)"Failed GetRandomNum ARI command\n", v5, v6, v7, v8, v9, v10, v23);
    MEMORY[0x21D4ABC70](v26);
    return 0;
  }
  return result;
}

BOOL KTLSecGetFactoryDebugEnabled(uint64_t a1, _DWORD *a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 16);
  unsigned int v35 = v4;
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    uint64_t v25 = 0;
    int v36 = 0;
    unsigned int v37 = v4;
    uint64_t v29 = 0;
    if (ARI_CsiIceGetFactoryDebugEnabledReq_ENC()) {
      return 0;
    }
    uint64_t v6 = operator new(0x18uLL);
    uint64_t v7 = v29;
    v6[2] = v36;
    *((void *)v6 + 2) = v7;
    *(void *)uint64_t v6 = &unk_26CCDD1F8;
    if (!KTLUTASendAndReleaseData(a1, v6) || !KTLUTACopyReceiveData(a1, &v25)) {
      return 0;
    }
    uint64_t v8 = v25;
    (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
    int v9 = ARI_CsiIceGetFactoryDebugEnabledResp_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    return v9 == 0;
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3002000000;
  unsigned int v32 = __Block_byref_object_copy__13;
  uint64_t v33 = __Block_byref_object_dispose__14;
  int v34 = -1431655766;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2000000000;
  int v28 = -1;
  uint64_t v11 = dispatch_semaphore_create(0);
  long long v12 = v11;
  dispatch_object_t object = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  if (!ARI_CsiIceGetFactoryDebugEnabledReq_BLK())
  {
    dispatch_time_t v15 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v22 = dispatch_semaphore_wait(v12, v15);
    if (v22) {
      _KTLErrorPrint((uint64_t)"KTLSecGetFactoryDebugEnabled", (uint64_t)"Timeout waiting for response.\n", v16, v17, v18, v19, v20, v21, v23);
    }
    if (v35) {
      AriHost::ExitTrx((AriHost *)v35);
    }
    *a2 = *((_DWORD *)v30 + 10);
    if (v22)
    {
      BOOL v10 = 0;
      uint64_t v13 = object;
      if (!object) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v10 = *((_DWORD *)v26 + 6) == 0;
      uint64_t v13 = object;
      if (!object) {
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  BOOL v10 = 0;
  *a2 = *((_DWORD *)v30 + 10);
  uint64_t v13 = object;
  if (object) {
LABEL_14:
  }
    dispatch_release(v13);
LABEL_15:
  if (v12) {
    dispatch_release(v12);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v10;
}

void sub_21C64C6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 40) = *(_DWORD *)(a2 + 40);
  return result;
}

uint64_t __KTLSecGetFactoryDebugEnabled_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceGetFactoryDebugEnabledResp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t security::ARICommandDriver::GetPersonalizationParams(uint64_t *a1, uint64_t a2, AriSdk::ARI_GetPersonalizationParametersRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  long long v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *)operator new(0xA8uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::ARI_GetPersonalizationParametersRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    unsigned int v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  int v73 = __Block_byref_object_copy__23;
  uint64_t v74 = __Block_byref_object_dispose__24;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  dispatch_time_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    BOOL v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  BOOL v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4245028864);
      goto LABEL_17;
    }
    unsigned int v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetPersonalizationParams", (uint64_t)"Failed GetPersonalizationParametersReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C64CC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t security::ARICommandDriver::CsiSecCollectScrtBlob(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  long long v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *)operator new(0x60uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::ARI_CsiSecCollectScrtBlobRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    unsigned int v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  int v73 = __Block_byref_object_copy__23;
  uint64_t v74 = __Block_byref_object_dispose__24;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  dispatch_time_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    BOOL v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  BOOL v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4245094400);
      goto LABEL_17;
    }
    unsigned int v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"CsiSecCollectScrtBlob", (uint64_t)"Failed CsiSecCollectScrtBlobReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C64D110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t security::ARICommandDriver::CsiSecReadSikPKey(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  long long v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *)operator new(0x60uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::ARI_CsiSecReadSikPKeyRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    unsigned int v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  int v73 = __Block_byref_object_copy__23;
  uint64_t v74 = __Block_byref_object_dispose__24;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  dispatch_time_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    BOOL v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  BOOL v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4245127168);
      goto LABEL_17;
    }
    unsigned int v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"CsiSecReadSikPKey", (uint64_t)"Failed CsiSecReadSikPKeyReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C64D618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_CsiSecGetRandomNumRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  unsigned int v4 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)operator new(0x48uLL);
  AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::ARI_CsiSecGetRandomNumRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64D728(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk41ARI_GetPersonalizationParametersRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  unsigned int v4 = (AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *)operator new(0xA8uLL);
  AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::ARI_GetPersonalizationParametersRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64D7A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk34ARI_CsiSecCollectScrtBlobRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  unsigned int v4 = (AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *)operator new(0x60uLL);
  AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::ARI_CsiSecCollectScrtBlobRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64D818(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk30ARI_CsiSecReadSikPKeyRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  unsigned int v4 = (AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *)operator new(0x60uLL);
  AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::ARI_CsiSecReadSikPKeyRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C64D890(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t getRestoreOSMode(void)
{
  {
    return getRestoreOSMode(void)::restoreOS;
  }
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  unsigned int v2 = off_26AA6F9A0;
  if (!off_26AA6F9A0)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v5, v1);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_26AA6F9A0, &v5);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&v5);
    unsigned int v2 = off_26AA6F9A0;
  }
  v4[0] = v2;
  v4[1] = qword_26AA6F9A8;
  if (qword_26AA6F9A8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_26AA6F9A8 + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  char v3 = (*(uint64_t (**)(void *))(*(void *)v2 + 96))(v2);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)v4);
  getRestoreOSMode(void)::restoreOS = v3;
  return getRestoreOSMode(void)::restoreOS;
}

void sub_21C64D9A8(_Unwind_Exception *a1)
{
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  unsigned int v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  char v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

uint64_t std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100](uint64_t result, long long *a2)
{
  uint64_t v2 = result;
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  unsigned int v4 = *(std::__shared_weak_count **)(result + 8);
  *(_OWORD *)BOOL result = v3;
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      return v2;
    }
  }
  return result;
}

uint64_t KTLPSIFormatEnhancedCommand(uint64_t a1, __int16 a2, int a3)
{
  *(_DWORD *)a1 = a3;
  *(_WORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 6) = a2 ^ HIWORD(a3) ^ a3;
  return 1;
}

uint64_t KTLPSIFormatEnhancedCommandMrcData(uint64_t a1, __int16 a2, int a3)
{
  *(_DWORD *)a1 = a3;
  *(_WORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 6) = a2 ^ HIWORD(a3) ^ a3;
  return 1;
}

uint64_t KTLPSISendEnhancedCommand(uint64_t a1, uint64_t (**a2)(void, uint64_t, uint64_t, int *, uint64_t, uint64_t, void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v14 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendEnhancedCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d\n", a3, a4, a5, a6, a7, a8, *(unsigned __int16 *)(a1 + 4));
  long long v12 = *a2;
  if (*a2)
  {
    LODWORD(result) = v12(a2, a1, a3, &v14, 1, a4, 0);
    LODWORD(v12) = v14;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if (v12 == a3) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t KTLPSISendMrcTrainingCommand(uint64_t a1, uint64_t (**a2)(void, uint64_t, uint64_t, int *, uint64_t, uint64_t, void), uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendMrcTrainingCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d, length = %u\n", a3, a4, (uint64_t)a5, a6, a7, a8, *(unsigned __int16 *)(a1 + 4));
  uint64_t v13 = *a2;
  if (*a2)
  {
    LODWORD(result) = v13(a2, a1, a3, &v15, 1, a4, 0);
    LODWORD(v13) = v15;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if (v13 == a3) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0;
  }
  *a5 = v13;
  return result;
}

uint64_t KTLPSIReadResponse(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _KTLDebugPrint((uint64_t)"KTLPSIReadResponse", (uint64_t)"Reading response from PSI\n", a3, (uint64_t)a4, a5, a6, a7, a8, v22);
  unsigned int v23 = 0;
  uint64_t v17 = *(uint64_t (**)(uint64_t, unsigned __int16 *, uint64_t, unsigned int *, void, uint64_t, void))(a1 + 8);
  if (v17)
  {
    int v18 = v17(a1, a4, a2, &v23, 0, a3, 0);
    char v19 = v18;
    uint64_t v20 = v23;
    if (v23 && (_KTLDebugFlags & 2) != 0)
    {
      off_26AA6F9C8("Rx:", 1, a4);
      uint64_t v20 = v23;
      if ((v19 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else if (!v18)
    {
      goto LABEL_11;
    }
    if (v20 >= 2 && v20 <= a2)
    {
      _KTLDebugPrint((uint64_t)"KTLPSIReadResponse", (uint64_t)"Read response from PSI: code = %u\n", v12, v20, v13, v14, v15, v16, *a4);
      return 1;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_11:
  _KTLDebugPrint((uint64_t)"KTLPSIReadResponse", (uint64_t)"Failed reading response from PSI: bytesRead = %u\n", v12, v20, v13, v14, v15, v16, v20);
  return 0;
}

uint64_t KTLPSIReadMrcResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _KTLDebugPrint((uint64_t)"KTLPSIReadMrcResponse", (uint64_t)"Reading response from PSI, maxLength = %u\n", a3, a4, a5, a6, a7, a8, a2);
  unsigned int v24 = 0;
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, void, uint64_t, void))(a1 + 8);
  if (!v17)
  {
    uint64_t v20 = 0;
    goto LABEL_11;
  }
  int v18 = v17(a1, a4, a2, &v24, 0, a3, 0);
  char v19 = v18;
  uint64_t v20 = v24;
  if (v24 && (_KTLDebugFlags & 2) != 0)
  {
    off_26AA6F9C8("Rx:", 1, a4);
    uint64_t v20 = v24;
    if (v19) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v21 = 0;
    uint64_t v22 = "Failed reading response from PSI: bytesRead = %u\n";
    goto LABEL_12;
  }
  if (!v18) {
    goto LABEL_11;
  }
LABEL_8:
  if (v20 < 2 || v20 > a2) {
    goto LABEL_11;
  }
  uint64_t v21 = 1;
  uint64_t v22 = "Successful Read response from PSI,bytesRead = %u\n";
LABEL_12:
  _KTLDebugPrint((uint64_t)"KTLPSIReadMrcResponse", (uint64_t)v22, v12, v20, v13, v14, v15, v16, v20);
  return v21;
}

uint64_t KTLCreateEBLLengthPacket(_DWORD *a1, int a2)
{
  *a1 = a2;
  return 1;
}

BOOL KTLParseEBLLengthAck(unsigned __int16 *a1)
{
  return *a1 == 52428;
}

uint64_t KTLSendEBLImage(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  char v11 = a4;
  int v10 = 0;
  if (!*a2) {
    return 0;
  }
  int v7 = a3;
  if (!((unsigned int (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*a2)(a2, a1, a3, &v10, 1, a5, 0)|| v10 != v7)
  {
    return 0;
  }
  if (*a2)
  {
    LODWORD(result) = ((uint64_t (*)(void *, char *, uint64_t, int *, uint64_t, uint64_t, void))*a2)(a2, &v11, 1, &v10, 1, a5, 0);
    int v7 = v10;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if (v7 == 1) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t KTLSendEBLImageNoXor(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v4 = a3;
  int v6 = 0;
  if (!*a2) {
    return 0;
  }
  LODWORD(result) = ((uint64_t (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*a2)(a2, a1, a3, &v6, 1, a4, 0);
  if (v6 == v4) {
    return result;
  }
  else {
    return 0;
  }
}

BOOL KTLParseEBLDownloadResult(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1) << 8 == 42240;
}

const char *PSIModeDescription(int a1)
{
  if (a1 <= 52479)
  {
    if (a1 == 462) {
      return "Secure";
    }
    if (a1 == 43520) {
      return "Normal";
    }
  }
  else
  {
    switch(a1)
    {
      case 52480:
        return "Coredump";
      case 61166:
        return "BadEEPROM";
      case 56577:
        return "Enhanced";
    }
  }
  return "Unknown";
}

uint64_t KTLParsePSIRunning(unsigned __int16 *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    int v10 = *a1;
    if (v10 > 0xEEEE) {
      return 0;
    }
    *a2 = v10;
    if (v10 <= 52479)
    {
      if (v10 == 462)
      {
        char v11 = "Secure";
        goto LABEL_17;
      }
      if (v10 == 43520)
      {
        char v11 = "Normal";
        goto LABEL_17;
      }
    }
    else
    {
      switch(v10)
      {
        case 52480:
          char v11 = "Coredump";
          goto LABEL_17;
        case 61166:
          char v11 = "BadEEPROM";
          goto LABEL_17;
        case 56577:
          char v11 = "Enhanced";
LABEL_17:
          _KTLDebugPrint((uint64_t)"KTLParsePSIRunning", (uint64_t)"PSI is running in %s mode\n", a3, a4, a5, a6, a7, a8, (uint64_t)v11);
          return 1;
      }
    }
    char v11 = "Unknown";
    goto LABEL_17;
  }
  return result;
}

uint64_t KTLParsePSIICEPersonalizionInfo(_OWORD *a1, unsigned int a2, uint64_t *a3)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2 >= 0x4C)
    {
      uint64_t result = (uint64_t)malloc(0x4CuLL);
      if (result)
      {
        long long v6 = a1[1];
        *(_OWORD *)uint64_t result = *a1;
        *(_OWORD *)(result + 16) = v6;
        long long v7 = a1[3];
        *(_OWORD *)(result + 32) = a1[2];
        *(_OWORD *)(result + 48) = v7;
        *(_OWORD *)(result + 60) = *(_OWORD *)((char *)a1 + 60);
        if (*(_WORD *)result == 3777)
        {
          *a3 = result;
          return 1;
        }
        else
        {
          free((void *)result);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICEPersonalizionInfoSha384(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2 >= 0x78)
    {
      uint64_t result = (uint64_t)malloc(0x78uLL);
      if (result)
      {
        long long v6 = *(_OWORD *)(a1 + 80);
        *(_OWORD *)(result + 64) = *(_OWORD *)(a1 + 64);
        *(_OWORD *)(result + 80) = v6;
        *(_OWORD *)(result + 96) = *(_OWORD *)(a1 + 96);
        *(void *)(result + 112) = *(void *)(a1 + 112);
        long long v7 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)uint64_t result = *(_OWORD *)a1;
        *(_OWORD *)(result + 16) = v7;
        long long v8 = *(_OWORD *)(a1 + 48);
        *(_OWORD *)(result + 32) = *(_OWORD *)(a1 + 32);
        *(_OWORD *)(result + 48) = v8;
        if (*(_WORD *)result == 3777)
        {
          *a3 = result;
          return 1;
        }
        else
        {
          free((void *)result);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICEHashResponse(const void *a1, size_t __size, void *a3)
{
  uint64_t result = 0;
  if (a1)
  {
    if (__size >= 8)
    {
      size_t v6 = __size;
      uint64_t result = (uint64_t)malloc(__size);
      if (result)
      {
        long long v7 = (_WORD *)result;
        memcpy((void *)result, a1, v6);
        if (*v7 == 3777 && 96 * (unint64_t)*((unsigned int *)v7 + 1) <= (unsigned __int16)v7[1])
        {
          *a3 = v7;
          return 1;
        }
        else
        {
          free(v7);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICEHashResponseSha384(const void *a1, size_t __size, void *a3)
{
  uint64_t result = 0;
  if (a1)
  {
    if (__size >= 8)
    {
      size_t v6 = __size;
      uint64_t result = (uint64_t)malloc(__size);
      if (result)
      {
        long long v7 = (_WORD *)result;
        memcpy((void *)result, a1, v6);
        if (*v7 == 3777 && 112 * (unint64_t)*((unsigned int *)v7 + 1) <= (unsigned __int16)v7[1])
        {
          *a3 = v7;
          return 1;
        }
        else
        {
          free(v7);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICETestModeResponse(const void *a1, size_t __size, unsigned __int16 **a3)
{
  uint64_t result = 0;
  if (a1)
  {
    if (__size >= 4)
    {
      size_t v6 = __size;
      uint64_t result = (uint64_t)malloc(__size);
      if (result)
      {
        long long v7 = (unsigned __int16 *)result;
        memcpy((void *)result, a1, v6);
        if (v6 - 4 == v7[1])
        {
          *a3 = v7;
          return 1;
        }
        else
        {
          free(v7);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLEBLReceivePacket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v8 = *(uint64_t (**)(void))(a1 + 8);
  if (v8 && (v8() & 1) != 0)
  {
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Received:", 1, a2);
    }
    _KTLDebugPrint((uint64_t)"KTLEBLReceivePacket", (uint64_t)"Packet read < Minimum size (%d < %ld)\n", a3, 0, a5, a6, a7, a8, 0);
    return 0;
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLEBLReceivePacket", (uint64_t)"Packet read failed.\n", a3, a4, a5, a6, a7, a8, v11);
    return 0;
  }
}

uint64_t KTLEBLSendReadfileData(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = a3;
  int v6 = 0;
  if (!*a1) {
    return 0;
  }
  LODWORD(result) = ((uint64_t (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*a1)(a1, a2, a3, &v6, 1, a4, 0);
  if (v6 == v4) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t KTLEBLSendPacket(uint64_t (**a1)(void, uint64_t, uint64_t, int *, uint64_t, uint64_t, void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v14 = 0;
  uint64_t v11 = (*(_DWORD *)(a2 + 4) + 8);
  _KTLDebugPrint((uint64_t)"KTLEBLSendPacket", (uint64_t)"Sending command of length %u, type %u\n", a3, a4, a5, a6, a7, a8, v11);
  uint64_t v12 = *a1;
  if (*a1)
  {
    LODWORD(result) = v12(a1, a2, v11, &v14, 1, a3, 0);
    LODWORD(v12) = v14;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if (v12 == v11) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t KTLEBLParseStartInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)a1)
  {
    case 1:
      unsigned int v8 = *(_DWORD *)(a1 + 4);
      if (v8 > 0xB)
      {
        if (v8 == 12)
        {
          uint64_t v10 = *(void *)(a1 + 8);
          *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 16);
          *(void *)a2 = v10;
          uint64_t result = 1;
        }
        else
        {
          _KTLDebugPrint((uint64_t)"KTLEBLParseStartInfo", (uint64_t)"Error: packet malformed, payload too large for StartInfo.\n", a3, a4, a5, a6, a7, a8, v11);
          uint64_t result = 0;
        }
      }
      else
      {
        _KTLDebugPrint((uint64_t)"KTLEBLParseStartInfo", (uint64_t)"Error: packet malformed, payload too small for StartInfo.\n", a3, a4, a5, a6, a7, a8, v11);
        uint64_t result = 0;
      }
      break;
    default:
      _KTLDebugPrint((uint64_t)"KTLEBLParseStartInfo", (uint64_t)"Error: packet id mismatch (expected=%d (%s), got=%d (%s))\n", a3, a4, a5, a6, a7, a8, 1);
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t KTLEBLCreateStartACKPacket(uint64_t a1, _DWORD *a2)
{
  *(void *)a1 = 0x1000000002;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_DWORD *)(a1 + 12) = a2[1];
  *(_DWORD *)(a1 + 16) = a2[2];
  *(_DWORD *)(a1 + 20) = a2[3];
  return 1;
}

uint64_t KTLEBLParseReadfile(uint64_t a1, void *a2, _DWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return KTLEBLParseReadfileExt(a1, a2, 0x1000uLL, a3, a4, a6, a7, a8);
}

uint64_t KTLEBLParseReadfileExt(uint64_t a1, void *a2, size_t a3, _DWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a2 && a4 && a5)
  {
    switch(*(_DWORD *)a1)
    {
      case 3:
        size_t v12 = *(unsigned int *)(a1 + 16);
        unsigned int v13 = *(_DWORD *)(a1 + 4);
        if (v13 < (int)v12 + 12)
        {
          int v14 = "Error: packet malformed, payload too small for Readfile.\n";
          goto LABEL_10;
        }
        if (v13 > (int)v12 + 12)
        {
          int v14 = "Error: packet malformed, payload too large for Readfile.\n";
          goto LABEL_10;
        }
        if (v12 > a3)
        {
          _KTLDebugPrint((uint64_t)"KTLEBLParseReadfileExt", (uint64_t)"Error: given filename size (%lu) is too small to copy. We need %d size.\n", a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a3);
          return 0;
        }
        bzero(a2, a3);
        strncpy((char *)a2, (const char *)(a1 + 20), *(unsigned int *)(a1 + 16));
        *a4 = *(_DWORD *)(a1 + 8);
        *a5 = *(_DWORD *)(a1 + 12);
        uint64_t result = 1;
        break;
      default:
        uint64_t v16 = 3;
        int v14 = "Error: packet id mismatch (expected=%d (%s), got=%d (%s))\n";
LABEL_10:
        _KTLDebugPrint((uint64_t)"KTLEBLParseReadfileExt", (uint64_t)v14, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v16);
        return 0;
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLEBLParseReadfileExt", (uint64_t)"Error: one of given parameter got null.(pkt: %p, fname: %p, offset: %p, length: %p)\n", a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a1);
    return 0;
  }
  return result;
}

uint64_t KTLEBLParseDone(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*a1)
  {
    case 4:
      unsigned int v8 = a1[1];
      if (v8 > 3)
      {
        if (v8 == 4)
        {
          *a2 = a1[2];
          uint64_t result = 1;
        }
        else
        {
          _KTLDebugPrint((uint64_t)"KTLEBLParseDone", (uint64_t)"Error: packet malformed, payload too large for Done.\n", a3, a4, a5, a6, a7, a8, v10);
          uint64_t result = 0;
        }
      }
      else
      {
        _KTLDebugPrint((uint64_t)"KTLEBLParseDone", (uint64_t)"Error: packet malformed, payload too small for Done.\n", a3, a4, a5, a6, a7, a8, v10);
        uint64_t result = 0;
      }
      break;
    default:
      _KTLDebugPrint((uint64_t)"KTLEBLParseDone", (uint64_t)"Error: packet id mismatch (expected=%d (%s), got=%d (%s))\n", a3, a4, a5, a6, a7, a8, 4);
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t KTLEBLCreateDoneACKPacket(void *a1)
{
  *a1 = 5;
  return 1;
}

uint64_t KTLInitOptions(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8 = a4 != 0;
  BOOL v9 = a5 != 0;
  uint64_t v10 = v8 ^ v9;
  if ((v8 ^ v9))
  {
    *(_DWORD *)a1 = a2;
    *(_DWORD *)(a1 + 4) = a3;
    *(void *)(a1 + 8) = a4;
    *(_DWORD *)(a1 + 16) = a5;
    *(_DWORD *)(a1 + 20) = a6;
    return v8 ^ v9;
  }
  else
  {
    *(_DWORD *)(a1 + 4) = 3;
    _KTLErrorPrint((uint64_t)"KTLInitOptions", (uint64_t)"Provide either transport or ARI id, not both\n", a3, a4, a5, a6, a7, a8, v12);
    return v10;
  }
}

uint64_t KTLOpenChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a1 + 24) = 0;
  unsigned int v8 = *(_DWORD *)(a1 + 4);
  if (v8 < 3) {
    return 1;
  }
  if (v8 == 3) {
    _KTLErrorPrint((uint64_t)"KTLOpenChannel", (uint64_t)"Invalid transport option selected.  See previous error.  Abort!\n", a3, a4, a5, a6, a7, a8, vars0);
  }
  return 0;
}

uint64_t KTLCloseChannel(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4);
  if ((v1 - 1) < 2) {
    return 1;
  }
  if (!v1)
  {
    uint64_t v2 = *(void **)(a1 + 24);
    if (v2)
    {
      do
      {
        long long v3 = (void *)v2[5];
        (*(void (**)(void *))(*v2 + 8))(v2);
        uint64_t v2 = v3;
      }
      while (v3);
    }
    return 1;
  }
  return 0;
}

uint64_t KTLEFISendData(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ((*(unsigned __int8 *)a2 | 0x20) == 0x61)
  {
    if (a3 > 0xC00)
    {
      _KTLErrorPrint((uint64_t)"KTLEFISendData", (uint64_t)"AT string size (%u) larger than max size (%u).\n", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
      goto LABEL_23;
    }
    uint64_t v12 = (a3 - 1);
    if (*((unsigned char *)a2 + v12) == 10)
    {
      if (*((unsigned char *)a2 + (a3 - 2)) == 13) {
        goto LABEL_22;
      }
      if (a3 <= 0xBFF)
      {
        *((unsigned char *)a2 + a3) = 10;
        *((unsigned char *)a2 + v12) = 13;
        LODWORD(v9) = a3 + 1;
        goto LABEL_22;
      }
    }
    else if (a3 <= 0xBFE)
    {
      *(_WORD *)((char *)a2 + a3) = 2573;
      LODWORD(v9) = a3 + 2;
      goto LABEL_22;
    }
    _KTLErrorPrint((uint64_t)"KTLEFISendData", (uint64_t)"Not enough space left to append \\r\\n to AT string.\n", a3, (uint64_t)a4, a5, a6, a7, a8, v25);
LABEL_22:
    bzero(__dst, 0xC00uLL);
    __dst[768] = v9;
    memcpy(__dst, a2, v9);
    __dst[769] = *(_DWORD *)(a1 + 20);
    __dst[770] = 1;
    if (!ARI_CsiIceAtExtReq_ENC())
    {
      unsigned int v24 = operator new(0x18uLL);
      v24[2] = 0;
      *((void *)v24 + 2) = 0;
      *(void *)unsigned int v24 = &unk_26CCDD1F8;
      uint64_t result = KTLUTASendAndReleaseData(a1, v24);
      goto LABEL_24;
    }
LABEL_23:
    uint64_t result = 0;
LABEL_24:
    *a4 = 1;
    return result;
  }
  if (a3 >= 0xC && *a2 == -1417756450)
  {
    unsigned int v13 = *(void **)(a1 + 8);
    uint64_t v14 = *(unsigned int *)(a1 + 20);
    __dst[0] = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, a2);
    }
    if (*v13
      && ((char v21 = ((uint64_t (*)(void *, _DWORD *, uint64_t, _DWORD *, uint64_t, uint64_t, void))*v13)(v13, a2, v9, __dst, 1, v14, 0), __dst[0] == v9)? (v22 = v21): (v22 = 0), (v22 & 1) != 0))
    {
      uint64_t result = 1;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v15, v16, v17, v18, v19, v20, v9);
      uint64_t result = 0;
    }
    *a4 = 0;
  }
  else
  {
    _KTLErrorPrint((uint64_t)"KTLEFISendData", (uint64_t)"Unrecognized message type.\n", a3, (uint64_t)a4, a5, a6, a7, a8, v25);
    return 0;
  }
  return result;
}

uint64_t KTLRawSendData(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v21 = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", a3, a4, a5, a6, a7, a8, a3);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, a2);
  }
  if (!*a1
    || ((uint64_t v18 = 1,
         ((unsigned int (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*a1)(a1, a2, a3, &v21, 1, a4, 0))? (BOOL v19 = v21 == a3): (BOOL v19 = 0), !v19))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v12, v13, v14, v15, v16, v17, a3);
    return 0;
  }
  return v18;
}

uint64_t KTLEFIReceiveData(uint64_t a1, char *a2, _DWORD *a3, unsigned int a4, int a5)
{
  *(size_t *)((char *)&__b[385] + 4) = *MEMORY[0x263EF8340];
  uint64_t v45 = 0;
  *a3 = 0;
  if (a5)
  {
    if (!KTLUTACopyReceiveData(a1, (uint64_t *)&v45)) {
      return 0;
    }
    while (1)
    {
      uint64_t v9 = v45;
      uint64_t v10 = (AriMsg *)(*(uint64_t (**)(unsigned int *))(*(void *)v45 + 16))(v45);
      if (AriMsg::GetBufGmid(v10, (const unsigned __int8 *)v9[2]) != -116752384) {
        break;
      }
      unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43[2] = v17;
      v43[3] = v17;
      v43[0] = v17;
      v43[1] = v17;
      uint64_t v18 = (*(uint64_t (**)(unsigned int *))(*(void *)v9 + 16))(v9);
      MEMORY[0x21D4AB970](v43, v18, v9[2]);
      memset(__b, 170, 0xC0CuLL);
      if (a4 - *a3 < 0xAAAAAAAA)
      {
        _KTLErrorPrint((uint64_t)"KTLEFIReceiveData", (uint64_t)"Received AT string size %u, but caller provided buffer size %u\n", v19, v20, v21, v22, v23, v24, (*a3 - 1431655766));
        (*(void (**)(unsigned int *))(*(void *)v9 + 8))(v9);
        AriMsg::~AriMsg((AriMsg *)v43);
        return 0;
      }
      unint64_t v25 = 0;
      do
      {
        char v26 = *((unsigned char *)__b + v25);
        if (!v26) {
          char v26 = 32;
        }
        *((unsigned char *)__b + v25++) = v26;
      }
      while (v25 < LODWORD(__b[384]));
      memcpy(a2, __b, LODWORD(__b[384]));
      uint64_t v27 = *a3;
      if (v27)
      {
        if (v27 < 8)
        {
          uint64_t v28 = &a2[-v27];
          unsigned int v29 = LODWORD(__b[384]) + v27;
        }
        else
        {
          uint64_t v28 = a2 - 8;
          unsigned int v29 = LODWORD(__b[384]) + 8;
        }
      }
      else
      {
        unsigned int v29 = __b[384];
        uint64_t v28 = a2;
      }
      size_t v31 = v29;
      if (strnstr(v28, "\r\nOK\r\n", v29)) {
        BOOL v30 = 1;
      }
      else {
        BOOL v30 = strnstr(v28, "\r\nERROR\r\n", v31) != 0;
      }
      a2 += LODWORD(__b[384]);
      *a3 += LODWORD(__b[384]);
      AriMsg::~AriMsg((AriMsg *)v43);
      uint64_t v9 = v45;
      if (v45) {
        goto LABEL_19;
      }
      uint64_t v45 = 0;
      if (v30) {
        return 1;
      }
LABEL_20:
      if ((KTLUTACopyReceiveData(a1, (uint64_t *)&v45) & 1) == 0) {
        return 0;
      }
    }
    _KTLErrorPrint((uint64_t)"KTLEFIReceiveData", (uint64_t)"EFI receive expected AT response (%u) but found (%u)\n", v11, v12, v13, v14, v15, v16, 4178214912);
    BOOL v30 = 0;
LABEL_19:
    (*(void (**)(unsigned int *))(*(void *)v9 + 8))(v9);
    uint64_t v45 = 0;
    if (v30) {
      return 1;
    }
    goto LABEL_20;
  }
  if (!KTLUTACopyReceiveData(a1, (uint64_t *)&v45)) {
    return 0;
  }
  uint64_t v39 = v45;
  unsigned int v40 = v45[2];
  BOOL v32 = v40 <= a4;
  if (v40 > a4)
  {
    _KTLErrorPrint((uint64_t)"KTLEFIReceiveData", (uint64_t)"Receved message of size %u, but caller provided buffer size %u\n", v33, v34, v35, v36, v37, v38, v45[2]);
  }
  else
  {
    uint64_t v41 = (const void *)(*(uint64_t (**)(unsigned int *))(*(void *)v45 + 16))(v45);
    memcpy(a2, v41, v39[2]);
    *a3 = v39[2];
  }
  (*(void (**)(unsigned int *))(*(void *)v39 + 8))(v39);
  return v32;
}

void sub_21C64F4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  AriMsg::~AriMsg((AriMsg *)va);
  _Unwind_Resume(a1);
}

uint64_t KTLUTACopyReceiveData(uint64_t a1, uint64_t *a2)
{
  dispatch_time_t v11 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  while (1)
  {
    uint64_t result = ktl::KTLReceivePacket::fetchARIMsgFromTransport(a1, v4, v5, v6, v7, v8, v9, v10);
    *a2 = result;
    if (!result) {
      break;
    }
    uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    uint64_t v14 = (AriMsg *)(*(uint64_t (**)(void))(*(void *)*a2 + 16))();
    uint64_t result = AriMsg::GetBufMsgDir(v14, (const unsigned __int8 *)*(unsigned int *)(*a2 + 8));
    if (result == 1) {
      break;
    }
    _KTLDebugPrint((uint64_t)"KTLUTACopyReceiveData", (uint64_t)"Skipping unexpected message (groupId=%d, msgId=0x%x) with unexpected direction (%d) and retrying receive.\n", v15, v16, v17, v18, v19, v20, (*v13 >> 35) & 0x3FLL);
    if (*a2) {
      (*(void (**)(uint64_t))(*(void *)*a2 + 8))(*a2);
    }
    *a2 = 0;
    if (dispatch_time(0, 0) > v11) {
      return 0;
    }
  }
  return result;
}

uint64_t KTLUTASendAndReleaseData(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = (*(uint64_t (**)(unsigned int *))(*(void *)a2 + 16))(a2);
  uint64_t v6 = a2[2];
  uint64_t v7 = *(unsigned int *)(a1 + 20);
  int v23 = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v8, v9, v10, v11, v12, v13, v6);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v5);
  }
  if (!*v4
    || ((uint64_t v20 = 1,
         ((unsigned int (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*v4)(v4, v5, v6, &v23, 1, v7, 0))? (BOOL v21 = v23 == v6): (BOOL v21 = 0), !v21))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v14, v15, v16, v17, v18, v19, v6);
    uint64_t v20 = 0;
  }
  (*(void (**)(unsigned int *))(*(void *)a2 + 8))(a2);
  return v20;
}

BOOL KTLUTACopyReceiveNextMessage(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t ARIMsgFromTransport = ktl::KTLReceivePacket::fetchARIMsgFromTransport(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  *a2 = ARIMsgFromTransport;
  return ARIMsgFromTransport != 0;
}

uint64_t KTLRawReceiveData(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  long long v3 = *(uint64_t (**)(void))(a1 + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = v3();
  if (*a3)
  {
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Rx:", 1, a2);
    }
  }
  return v6;
}

uint64_t KTLRawReceiveDataExact(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  *a3 = 0;
  if (!a4) {
    return 1;
  }
  uint64_t v6 = a4;
  uint64_t v10 = a2;
  do
  {
    unsigned int v16 = 0;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, void))(a1 + 8);
    if (!v11 || (v11(a1, v10, v6, &v16, 1, a5, 0) & 1) == 0) {
      return 0;
    }
    uint64_t v12 = v16;
    unsigned int v13 = *a3 + v16;
    *a3 = v13;
    v10 += v12;
    uint64_t v6 = (v6 - v12);
  }
  while (v6);
  if (!v13 || (_KTLDebugFlags & 2) == 0) {
    return 1;
  }
  uint64_t v14 = 1;
  off_26AA6F9C8("Rx:", 1, a2);
  return v14;
}

void ice_filer_lookup_node::~ice_filer_lookup_node(ice_filer_lookup_node *this)
{
  int v1 = *((void *)this + 8);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ICE_FILER_write(uint64_t a1, uint64_t a2, uint64_t a3, AriHost *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    return ICE_FILER_write(a1, 0, a2, a3, a4, a5, a7, a8);
  }
  else
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: %s. Invalid Parameter.\n", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)"ICE_FILER_write");
    return 0xFFFFFFFFLL;
  }
}

uint64_t ICE_FILER_write(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, AriHost *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || (unsigned int v8 = a4) == 0 || (v10 = a2, (a2 == 0) == (a3 == 0)))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: ICE_FILER_write. Invalid Parameter.\n", a3, a4, (uint64_t)a5, a6, a7, a8, v78);
    return 0xFFFFFFFFLL;
  }
  if (!*(void *)(a1 + 8) && !(_BYTE)a5 && *(_DWORD *)(a1 + 16))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Missing required transaction ID: context_id=%x\n", a3, a4, (uint64_t)a5, a6, a7, a8, (uint64_t)a5);
    return 0xFFFFFFFFLL;
  }
  if (pthread_mutex_lock(&ice_filer_lookup_mutex))
  {
LABEL_6:
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: ICE_FILER_write. Context Already Exists.\n", v14, v15, v16, v17, v18, v19, v78);
    return 4294967291;
  }
  uint64_t v22 = qword_26AA6FA28;
  if ((int *)qword_26AA6FA28 != &ice_filer_lookup_head)
  {
    uint64_t v23 = qword_26AA6FA28;
    while (*(_DWORD *)v23 != a5)
    {
      uint64_t v23 = *(void *)(v23 + 80);
      if ((int *)v23 == &ice_filer_lookup_head) {
        goto LABEL_17;
      }
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
    goto LABEL_6;
  }
LABEL_17:
  uint64_t v24 = (unsigned int *)operator new(0x60uLL);
  *((void *)v24 + 8) = 0;
  *uint64_t v24 = a5;
  *((void *)v24 + 1) = a3;
  *((void *)v24 + 2) = a1;
  if (a3) {
    uint64_t v10 = operator new[](0xC00uLL);
  }
  *((void *)v24 + 3) = v10;
  v24[8] = v8;
  *((void *)v24 + 5) = v10;
  v24[12] = v8;
  *((void *)v24 + 7) = a6;
  *((void *)v24 + 8) = 0;
  v24[18] = 0;
  *((void *)v24 + 10) = v22;
  *((void *)v24 + 11) = &ice_filer_lookup_head;
  *(void *)(v22 + 88) = v24;
  qword_26AA6FA28 = (uint64_t)v24;
  _KTLDebugFlags = 13;
  pthread_mutex_unlock(&ice_filer_lookup_mutex);
  if (!*(void *)(a1 + 8) && *(_DWORD *)(a1 + 16))
  {
    if (!a6)
    {
      dispatch_semaphore_t v50 = dispatch_semaphore_create(0);
      dispatch_time_t v51 = *((void *)v24 + 8);
      *((void *)v24 + 8) = v50;
      if (v51) {
        dispatch_release(v51);
      }
    }
    dispatch_time_t v52 = &__block_descriptor_tmp;
    do
    {
      unsigned int v53 = v24[12];
      if (!v53) {
        break;
      }
      if (v53 >= 0xC00) {
        unsigned int v54 = 3072;
      }
      else {
        unsigned int v54 = v24[12];
      }
      uint64_t v55 = *((void *)v24 + 1);
      uint64_t v56 = (char *)*((void *)v24 + 5);
      if (v55)
      {
        uint64_t v57 = v52;
        v80[0] = 0;
        uint64_t v58 = *(void *)(v55 + 8);
        unsigned int v59 = v54;
        if (v58)
        {
          while (1)
          {
            if (!((unsigned int (*)(void))v58)())
            {
              uint64_t v58 = 0;
              goto LABEL_90;
            }
            if (v59 < v80[0]) {
              break;
            }
            if (v59 == v80[0])
            {
              uint64_t v56 = (char *)*((void *)v24 + 5);
              dispatch_time_t v52 = v57;
              goto LABEL_67;
            }
            v56 += v80[0];
            uint64_t v58 = *(void *)(*((void *)v24 + 1) + 8);
            v59 -= v80[0];
            if (!v58) {
              goto LABEL_90;
            }
          }
          uint64_t v58 = 1;
        }
LABEL_90:
        _KTLErrorPrint((uint64_t)"ICE_FILER_transport_read", (uint64_t)"Error: TelephonyUtilTransportRead (ret=%d, available=%d, read=%d).\n", v25, v26, v27, v28, v29, v30, v58);
        v24[18] = -6;
        break;
      }
LABEL_67:
      *(void *)uint64_t v80 = 0;
      long long v81 = 0;
      CreateFilerWriteRequest(v56, v54);
      v79[1] = MEMORY[0x263EF8330];
      v79[2] = 0x40000000;
      v79[3] = (uint64_t)___ZL15ICE_FILER_writeP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_E_block_invoke;
      v79[4] = (uint64_t)v52;
      v79[5] = (uint64_t)v24;
      int v60 = AriHost::Send();
      if (v60)
      {
        _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"%s: Failed to send (Remaining=%d/%d).  Aborting...\n", v25, v26, v27, v28, v29, v30, (uint64_t)"ICE_FILER_write");
        v24[18] = -6;
      }
      else
      {
        if (!*((void *)v24 + 1)) {
          *((void *)v24 + 5) += v54;
        }
        v24[12] -= v54;
      }
      if (v81 && !atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
        std::__shared_weak_count::__release_weak(v81);
      }
    }
    while (!v60);
    if (!*((void *)v24 + 8)) {
      return 0xFFFFFFFFLL;
    }
    dispatch_time_t v77 = dispatch_time(0, 1000000 * (*(_DWORD *)(a1 + 20) - v24[8] / 0xC00 + 8 * (v24[8] / 0xC00)));
    if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)v24 + 8), v77)) {
      goto LABEL_87;
    }
    uint64_t v76 = "Timeout waiting for transfer to complete\n";
LABEL_84:
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)v76, v61, v62, v63, v64, v65, v66, v78);
    goto LABEL_87;
  }
  v79[0] = 0;
  unsigned int v31 = v24[12];
  if (!v31) {
    goto LABEL_80;
  }
  while (1)
  {
    unsigned int v32 = v31 >= 0xC00 ? 3072 : v31;
    uint64_t v33 = *((void *)v24 + 1);
    uint64_t v34 = (char *)*((void *)v24 + 5);
    if (v33) {
      break;
    }
LABEL_32:
    *(void *)uint64_t v80 = 0;
    long long v81 = 0;
    CreateFilerWriteRequest(v34, v32);
    uint64_t v37 = *(void **)(a1 + 8);
    uint64_t v38 = MEMORY[0];
    uint64_t v39 = MEMORY[8] - MEMORY[0];
    uint64_t v40 = *(unsigned int *)(a1 + 20);
    int v82 = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v41, v42, v43, v44, v45, v46, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v38);
    }
    if (*v37
      && ((char v47 = ((uint64_t (*)(void *, uint64_t, uint64_t, int *, uint64_t, uint64_t, void))*v37)(v37, v38, v39, &v82, 1, v40, 0), v82 == v39)? (v48 = v47): (v48 = 0), (v48 & 1) != 0))
    {
      if (*((void *)v24 + 1)) {
        goto LABEL_40;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v25, v26, v27, v28, v29, v30, v39);
      if (*((void *)v24 + 1))
      {
LABEL_40:
        unsigned int v31 = v24[12] - v32;
        v24[12] = v31;
        uint64_t v49 = v81;
        if (v81) {
          goto LABEL_44;
        }
        goto LABEL_47;
      }
    }
    *((void *)v24 + 5) += v32;
    unsigned int v31 = v24[12] - v32;
    v24[12] = v31;
    uint64_t v49 = v81;
    if (v81)
    {
LABEL_44:
      if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
      unsigned int v31 = v24[12];
    }
LABEL_47:
    if (!v31) {
      goto LABEL_80;
    }
  }
  v80[0] = 0;
  uint64_t v35 = *(void *)(v33 + 8);
  unsigned int v36 = v32;
  if (v35)
  {
    while (1)
    {
      if (!((unsigned int (*)(void))v35)())
      {
        uint64_t v35 = 0;
        goto LABEL_79;
      }
      if (v36 < v80[0]) {
        break;
      }
      if (v36 == v80[0])
      {
        uint64_t v34 = (char *)*((void *)v24 + 5);
        goto LABEL_32;
      }
      v34 += v80[0];
      uint64_t v35 = *(void *)(*((void *)v24 + 1) + 8);
      v36 -= v80[0];
      if (!v35) {
        goto LABEL_79;
      }
    }
    uint64_t v35 = 1;
  }
LABEL_79:
  _KTLErrorPrint((uint64_t)"ICE_FILER_transport_read", (uint64_t)"Error: TelephonyUtilTransportRead (ret=%d, available=%d, read=%d).\n", v25, v26, v27, v28, v29, v30, v35);
  v24[18] = -6;
LABEL_80:
  if (!KTLUTACopyReceiveData(a1, v79))
  {
    uint64_t v76 = "Error: ICE_FILER_write. Failed copyReceiveData\n";
    goto LABEL_84;
  }
  v80[0] = -1431655766;
  uint64_t v67 = (unsigned int *)v79[0];
  uint64_t v68 = (AriMsg *)(*(uint64_t (**)(uint64_t))(*(void *)v79[0] + 16))(v79[0]);
  int BufCtx = (AriHost *)AriMsg::GetBufCtx(v68, (const unsigned __int8 *)v67[2]);
  (*(void (**)(unsigned int *))(*(void *)v67 + 16))(v67);
  if (ARI_CsiIceFilerWriteRspCb_Extract())
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: ICE_FILER_write. Failed ARI_EXTRACT (Remaining=%d/%d)\n", v70, v71, v72, v73, v74, v75, v24[12]);
    v24[18] = -7;
  }
  else
  {
    IceFilerWriteRspCb(v80[0], BufCtx, v70, v71, v72, v73, v74, v75, v78);
  }
  (*(void (**)(unsigned int *))(*(void *)v67 + 8))(v67);
LABEL_87:
  uint64_t v20 = v24[18];
  ICE_FILER_lookup_remove(a5);
  return v20;
}

void sub_21C650134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21C650148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21C65015C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ICE_FILER_write(uint64_t a1, void *a2, uint64_t a3, AriHost *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    return ICE_FILER_write(a1, a2, 0, a3, a4, a5, a7, a8);
  }
  else
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: %s. Invalid Parameter.\n", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)"ICE_FILER_write");
    return 0xFFFFFFFFLL;
  }
}

uint64_t CreateFilerWriteRequest(const void *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[3] = v4;
  *(_OWORD *)__p = v4;
  v11[1] = v4;
  v11[2] = v4;
  v11[0] = v4;
  AriSdk::ARI_CsiIceFilerWriteReq_SDK::ARI_CsiIceFilerWriteReq_SDK((AriSdk::ARI_CsiIceFilerWriteReq_SDK *)v11);
  uint64_t v5 = operator new(4uLL);
  *uint64_t v5 = a2;
  uint64_t v6 = __p[0];
  __p[0] = v5;
  if (v6) {
    operator delete(v6);
  }
  if (a2 <= 0xBFF) {
    size_t v7 = 3072 - a2;
  }
  else {
    size_t v7 = 0;
  }
  bzero(&__dst[a2], v7);
  memcpy(__dst, a1, a2);
  uint64_t v8 = operator new(0xC00uLL);
  memcpy(v8, __dst, 0xC00uLL);
  uint64_t v9 = __p[1];
  __p[1] = v8;
  if (v9) {
    operator delete(v9);
  }
  AriSdk::MsgBase::getRawBytes();
  return MEMORY[0x21D4ABA50](v11);
}

uint64_t ___ZL15ICE_FILER_writeP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_E_block_invoke(uint64_t a1, AriMsg *this, unsigned __int8 *a3)
{
  int BufCtx = (AriHost *)AriMsg::GetBufCtx(this, (const unsigned __int8 *)a3);
  if (ARI_CsiIceFilerWriteRspCb_Extract())
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write_block_invoke", (uint64_t)"Error: ICE_FILER_write. Failed ARI_EXTRACT (Remaining=%d/%d)\n", v5, v6, v7, v8, v9, v10, *(unsigned int *)(*(void *)(a1 + 32) + 48));
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = -7;
  }
  else
  {
    IceFilerWriteRspCb(-1431655766, BufCtx, v5, v6, v7, v8, v9, v10, v12);
  }
  return 0;
}

intptr_t IceFilerWriteRspCb(int a1, AriHost *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (pthread_mutex_lock(&ice_filer_lookup_mutex))
  {
    uint64_t v17 = 0;
    if (a1) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  uint64_t v17 = qword_26AA6FA28;
  if ((int *)qword_26AA6FA28 != &ice_filer_lookup_head)
  {
    while (*(_DWORD *)v17 != a2)
    {
      uint64_t v17 = *(void *)(v17 + 80);
      if ((int *)v17 == &ice_filer_lookup_head) {
        goto LABEL_8;
      }
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
    if (a1)
    {
LABEL_3:
      _KTLErrorPrint((uint64_t)"IceFilerWriteRspCb", (uint64_t)"Error: IceFilerWriteRspCb. Failure from Baseband.\n", v11, v12, v13, v14, v15, v16, v27);
      intptr_t result = 4294967293;
      *(_DWORD *)(v17 + 72) = -3;
      uint64_t v19 = *(void *)(v17 + 16);
      if (*(void *)(v19 + 8)) {
        return result;
      }
LABEL_13:
      if (*(_DWORD *)(v19 + 16))
      {
        uint64_t v26 = *(void (**)(void))(v17 + 56);
        if (v26)
        {
          v26();
          return ICE_FILER_lookup_remove(a2);
        }
        else
        {
          intptr_t result = *(void *)(v17 + 64);
          if (result)
          {
            return dispatch_semaphore_signal((dispatch_semaphore_t)result);
          }
        }
      }
      return result;
    }
LABEL_12:
    intptr_t result = *(unsigned int *)(v17 + 32);
    *(_DWORD *)(v17 + 72) = result;
    uint64_t v19 = *(void *)(v17 + 16);
    if (*(void *)(v19 + 8)) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_8:
  pthread_mutex_unlock(&ice_filer_lookup_mutex);

  return _KTLErrorPrint((uint64_t)"IceFilerWriteRspCb", (uint64_t)"Error: IceFilerWriteRspCb. ARI Context ID not on Lookup Table.\n", v20, v21, v22, v23, v24, v25, a9);
}

uint64_t ICE_FILER_lookup_remove(AriHost *a1)
{
  uint64_t result = pthread_mutex_lock(&ice_filer_lookup_mutex);
  if (result)
  {
    if (!a1) {
      return result;
    }
    goto LABEL_3;
  }
  uint64_t v3 = qword_26AA6FA28;
  if ((int *)qword_26AA6FA28 != &ice_filer_lookup_head)
  {
    while (*(_DWORD *)v3 != a1)
    {
      uint64_t v3 = *(void *)(v3 + 80);
      if ((int *)v3 == &ice_filer_lookup_head) {
        goto LABEL_17;
      }
    }
    if (*(void *)(v3 + 8))
    {
      long long v4 = *(void **)(v3 + 24);
      if (v4) {
        operator delete[](v4);
      }
    }
    uint64_t v5 = *(void *)(v3 + 80);
    *(void *)(v5 + 88) = *(void *)(v3 + 88);
    *(void *)(*(void *)(v3 + 88) + 80) = v5;
    uint64_t v6 = *(NSObject **)(v3 + 64);
    if (v6) {
      dispatch_release(v6);
    }
    operator delete((void *)v3);
    if ((int *)qword_26AA6FA28 == &ice_filer_lookup_head) {
      _KTLDebugFlags = 15;
    }
  }
LABEL_17:
  uint64_t result = pthread_mutex_unlock(&ice_filer_lookup_mutex);
  if (a1)
  {
LABEL_3:
    return AriHost::ExitTrx(a1);
  }
  return result;
}

uint64_t _GLOBAL__sub_I_ice_filer_cpp()
{
  ice_filer_lookup_head = 0;
  qword_26AA6FA00 = 0;
  dword_26AA6FA08 = 0;
  qword_26AA6F9E8 = 0;
  unk_26AA6F9F0 = 0;
  qword_26AA6F9E0 = 0;
  dword_26AA6F9F8 = 0;
  qword_26AA6FA10 = 0;
  unk_26AA6FA18 = 0;
  dword_26AA6FA20 = 0;
  qword_26AA6FA28 = (uint64_t)&ice_filer_lookup_head;
  unk_26AA6FA30 = &ice_filer_lookup_head;
  return __cxa_atexit((void (*)(void *))ice_filer_lookup_node::~ice_filer_lookup_node, &ice_filer_lookup_head, &dword_21C63B000);
}

uint64_t ktl::KTLReceivePacket::fetchARIMsgFromTransport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 24))
  {
    _KTLDebugPrint((uint64_t)"fetchARIMsgFromTransport", (uint64_t)"Pulling next message from backlog\n", a3, a4, a5, a6, a7, a8, v26);
    uint64_t v9 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = *(void *)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    uint64_t v10 = operator new(0x30uLL);
    uint64_t v16 = operator new[](0x7FFFuLL);
    v10[2] = 0x7FFF;
    *((void *)v10 + 2) = v16;
    *(void *)uint64_t v10 = &unk_26CCDD8A8;
    v10[6] = 0x7FFF;
    *((void *)v10 + 4) = v16;
    *((void *)v10 + 5) = 0;
    uint64_t v17 = *(unsigned int *)(a1 + 20);
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 8) + 8);
    if (v18)
    {
      v18();
      uint64_t v12 = 0;
    }
    _KTLDebugPrint((uint64_t)"sKTLPacketCopyReceiveData", (uint64_t)"Receive Data failed.\n", v11, v12, v13, v17, v14, v15, v26);
    (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
    _KTLErrorPrint((uint64_t)"fetchARIMsgFromTransport", (uint64_t)"Failed initial receive\n", v19, v20, v21, v22, v23, v24, v27);
    return 0;
  }
  return v9;
}

void sub_21C650B84(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21C650B9C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ktl::KTLReceivePacket::setMessageBounds(uint64_t this, unsigned int a2, int a3)
{
  *(void *)(this + 32) = *(void *)(this + 16) + a2;
  *(_DWORD *)(this + 8) = a3;
  return this;
}

uint64_t sFetchMessageRemainder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v26[1] = *MEMORY[0x263EF8340];
  size_t v6 = a3;
  MEMORY[0x270FA5388]();
  if (v7) {
    memset((char *)v26 - ((v6 + 15) & 0x1FFFFFFF0), 170, v6);
  }
  _KTLDebugPrint((uint64_t)"sFetchMessageRemainder", (uint64_t)"Have %u bytes, expect %u more...", v7, v8, v9, v10, v11, v12, *(unsigned int *)(a2 + 8));
  int v19 = 0;
  if (a3)
  {
    uint64_t v20 = *(void *)(a1 + 8);
    uint64_t v21 = *(unsigned int *)(a1 + 20);
    uint64_t v22 = a3;
    uint64_t v23 = (char *)v26 - ((v6 + 15) & 0x1FFFFFFF0);
    while (1)
    {
      HIDWORD(v26[0]) = 0;
      uint64_t v24 = *(uint64_t (**)(uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, void))(v20 + 8);
      if (!v24 || (v24(v20, v23, v22, (char *)v26 + 4, 1, v21, 0) & 1) == 0) {
        break;
      }
      v19 += HIDWORD(v26[0]);
      v23 += HIDWORD(v26[0]);
      uint64_t v22 = (v22 - HIDWORD(v26[0]));
      if (!v22)
      {
        if (v19)
        {
          if ((_KTLDebugFlags & 2) != 0) {
            off_26AA6F9C8("Rx:", 1, (char *)v26 - ((v6 + 15) & 0x1FFFFFFF0));
          }
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    if (v19 == a3)
    {
      _KTLDebugPrint((uint64_t)"sFetchMessageRemainder", (uint64_t)"Success\n", v13, v14, v15, v16, v17, v18, v26[0]);
      memcpy((void *)(*(void *)(a2 + 32) + *(unsigned int *)(a2 + 8)), (char *)v26 - ((v6 + 15) & 0x1FFFFFFF0), v6);
      *(_DWORD *)(a2 + 8) += a3;
      return 1;
    }
  }
  _KTLDebugPrint((uint64_t)"sFetchMessageRemainder", (uint64_t)"Failed receive of remaining packet bytes (expected=%u, actual=%u)\n", v13, v14, v15, v16, v17, v18, a3);
  return 0;
}

void *ktl::KTLReceivePacket::append(ktl::KTLReceivePacket *this, size_t __n, unsigned __int8 *__src)
{
  int v3 = __n;
  uint64_t result = memcpy((void *)(*((void *)this + 4) + *((unsigned int *)this + 2)), __src, __n);
  *((_DWORD *)this + 2) += v3;
  return result;
}

BOOL KTLBspSetApWakeInterval(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  uint64_t v32 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v24 = 0;
    int v33 = 0;
    unsigned int v34 = v2;
    uint64_t v28 = 0;
    if (!ARI_CsiIceBspSetApWakeIntervalReq_ENC()
      && (long long v4 = operator new(0x18uLL),
          uint64_t v5 = v28,
          void v4[2] = v33,
          *((void *)v4 + 2) = v5,
          *(void *)long long v4 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      uint64_t v6 = v24;
      (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
      int v7 = ARI_CsiIceBspSetApWakeIntervalRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      BOOL v8 = v7 == 0;
      int v9 = HIDWORD(v32);
    }
    else
    {
      int v9 = 0;
      BOOL v8 = 0;
    }
    return !v9 && v8;
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1431655766;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000;
  int v27 = -1;
  uint64_t v10 = dispatch_semaphore_create(0);
  uint64_t v11 = v10;
  dispatch_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  if (ARI_CsiIceBspSetApWakeIntervalReq_BLK())
  {
    BOOL v8 = 0;
    int v9 = *((_DWORD *)v29 + 6);
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  dispatch_time_t v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v20 = dispatch_semaphore_wait(v11, v13);
  if (v20) {
    _KTLErrorPrint((uint64_t)"KTLBspSetApWakeInterval", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  }
  if (v32) {
    AriHost::ExitTrx((AriHost *)v32);
  }
  int v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    BOOL v8 = *((_DWORD *)v25 + 6) == 0;
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v8 = 0;
  uint64_t v12 = object;
  if (object) {
LABEL_22:
  }
    dispatch_release(v12);
LABEL_23:
  if (v11) {
    dispatch_release(v11);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_21C6510B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspSetApWakeInterval_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceBspSetApWakeIntervalRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t KTLPing(uint64_t a1, BOOL *a2)
{
  *a2 = 0;
  int RestoreOSMode = getRestoreOSMode();
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45[2] = v5;
  v45[3] = v5;
  v45[1] = v5;
  v45[0] = v5;
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)v45);
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v12 = *(void **)(a1 + 8);
  if (!v12 && *(_DWORD *)(a1 + 16))
  {
    uint64_t v25 = dispatch_semaphore_create(0);
    uint64_t v26 = v25;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2000000000;
    char v42 = 0;
    dispatch_object_t object = v25;
    if (v25) {
      dispatch_retain(v25);
    }
    if (AriHost::Send())
    {
      uint64_t v24 = 0;
      int v27 = object;
      if (!object) {
        goto LABEL_22;
      }
    }
    else
    {
      dispatch_time_t v28 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (dispatch_semaphore_wait(v26, v28))
      {
        _KTLErrorPrint((uint64_t)"KTLPing", (uint64_t)"Timeout waiting for response.\n", v29, v30, v31, v32, v33, v34, v37);
        uint64_t v24 = 0;
        int v27 = object;
        if (!object) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v24 = *((unsigned char *)v40 + 24) != 0;
        int v27 = object;
        if (!object)
        {
LABEL_22:
          _Block_object_dispose(&v39, 8);
          if (v26) {
            dispatch_release(v26);
          }
          goto LABEL_24;
        }
      }
    }
    dispatch_release(v27);
    goto LABEL_22;
  }
  uint64_t v13 = *v43;
  uint64_t v14 = v43[1] - *v43;
  uint64_t v15 = *(unsigned int *)(a1 + 20);
  LODWORD(v39) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v6, v7, v8, v9, v10, v11, v14);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v13);
  }
  if (*v12
    && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v39, 1, v15, 0), v39 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
  {
    uint64_t v39 = 0;
    if (KTLUTACopyReceiveData(a1, &v39)) {
      uint64_t v24 = KTLPingParseAndRelease(v39, a2, RestoreOSMode);
    }
    else {
      uint64_t v24 = 0;
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    uint64_t v24 = 0;
  }
LABEL_24:
  uint64_t v35 = v44;
  if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
    std::__shared_weak_count::__release_weak(v35);
  }
  MEMORY[0x21D4ABED0](v45);
  return v24;
}

void sub_21C651450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, dispatch_object_t object, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a21, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
      MEMORY[0x21D4ABED0](v26 - 128);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a21, 8);
    if (!v25) {
      goto LABEL_3;
    }
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  MEMORY[0x21D4ABED0](v26 - 128);
  _Unwind_Resume(a1);
}

void sub_21C6514B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  MEMORY[0x21D4ABED0](v17 - 128);
  _Unwind_Resume(a1);
}

uint64_t __KTLPing_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLPingParseAndRelease((uint64_t)v6, *(BOOL **)(a1 + 48), *(_DWORD *)(a1 + 64));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C651588(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLPingParseAndRelease(uint64_t a1, BOOL *a2, int a3)
{
  uint64_t v19 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18[2] = v6;
  v18[3] = v6;
  v18[0] = v6;
  v18[1] = v6;
  uint64_t v7 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v18, v7);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v18) == 67600384)
  {
    uint64_t v14 = "NACK Received\n";
LABEL_5:
    _KTLErrorPrint((uint64_t)"KTLPingParseAndRelease", (uint64_t)v14, v8, v9, v10, v11, v12, v13, *(uint64_t *)&v18[0]);
    uint64_t v15 = 0;
    goto LABEL_6;
  }
  if (AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v18))
  {
    uint64_t v14 = "Malformed response\n";
    goto LABEL_5;
  }
  BOOL v17 = (*v19 - 3) < 2;
  if (!a3) {
    BOOL v17 = *v19 == 4;
  }
  *a2 = v17;
  uint64_t v15 = 1;
LABEL_6:
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABF60](v18);
  return v15;
}

void __copy_helper_block_e8_32r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  long long v4 = *(NSObject **)(a2 + 56);
  *(void *)(a1 + 56) = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  unsigned int v2 = *(NSObject **)(a1 + 56);
  if (v2) {
    dispatch_release(v2);
  }
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL KTLMonMemoryStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  uint64_t v43 = v3;
  if (!a3) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2000000000;
    int v42 = -1;
    uint64_t v35 = 0;
    unsigned int v36 = &v35;
    uint64_t v37 = 0x2000000000;
    int v38 = -1431655766;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x4002000000;
    uint64_t v32 = __Block_byref_object_copy__6;
    uint64_t v33 = __Block_byref_object_dispose__6;
    memset(v34, 170, sizeof(v34));
    uint64_t v14 = dispatch_semaphore_create(0);
    uint64_t v15 = v14;
    uint64_t v27 = MEMORY[0x263EF8330];
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    if (ARI_CsiMonMemoryStatusReq_BLK())
    {
      BOOL v11 = 0;
      int v12 = *((_DWORD *)v36 + 6);
      uint64_t v16 = v30[7];
      *(_OWORD *)a3 = *(_OWORD *)(v30 + 5);
      *(void *)(a3 + 16) = v16;
      BOOL v17 = object;
      if (!object) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_time_t v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v25 = dispatch_semaphore_wait(v15, v18);
      if (v25) {
        _KTLErrorPrint((uint64_t)"KTLMonMemoryStatus", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v27);
      }
      if (v43) {
        AriHost::ExitTrx((AriHost *)v43);
      }
      int v12 = *((_DWORD *)v36 + 6);
      uint64_t v26 = v30[7];
      *(_OWORD *)a3 = *(_OWORD *)(v30 + 5);
      *(void *)(a3 + 16) = v26;
      if (v25)
      {
        BOOL v11 = 0;
        BOOL v17 = object;
        if (!object)
        {
LABEL_25:
          if (v15) {
            dispatch_release(v15);
          }
          _Block_object_dispose(&v29, 8);
          _Block_object_dispose(&v35, 8);
          _Block_object_dispose(&v39, 8);
          return !v12 && v11;
        }
      }
      else
      {
        BOOL v11 = *((_DWORD *)v40 + 6) == 0;
        BOOL v17 = object;
        if (!object) {
          goto LABEL_25;
        }
      }
    }
    dispatch_release(v17);
    goto LABEL_25;
  }
  uint64_t v39 = 0;
  LODWORD(v35) = v3;
  int v44 = 0;
  uint64_t v29 = 0;
  if (!ARI_CsiMonMemoryStatusReq_ENC()
    && (uint64_t v7 = operator new(0x18uLL),
        uint64_t v8 = v29,
        v7[2] = v44,
        *((void *)v7 + 2) = v8,
        *(void *)uint64_t v7 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v7))
    && KTLUTACopyReceiveData(a1, &v39))
  {
    uint64_t v9 = v39;
    (*(void (**)(uint64_t))(*(void *)v39 + 16))(v39);
    int v10 = ARI_CsiMonMemoryStatusRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    BOOL v11 = v10 == 0;
    int v12 = HIDWORD(v43);
  }
  else
  {
    int v12 = 0;
    BOOL v11 = 0;
  }
  return !v12 && v11;
}

void sub_21C651AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (object) {
    dispatch_release(object);
  }
  if (v25) {
    dispatch_release(v25);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 112), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t __KTLMonMemoryStatus_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiMonMemoryStatusRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLCddGetDebugLog(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v43 = 0;
  int v3 = *(_DWORD *)(a1 + 16);
  int v42 = v3;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (v7)
  {
    uint64_t v32 = 0;
    LODWORD(v28) = v3;
    int v44 = 0;
    uint64_t v36 = 0;
    if (!ARI_CsiCddGetDebugLogReq_ENC()
      && (uint64_t v8 = operator new(0x18uLL),
          uint64_t v9 = v36,
          v8[2] = v44,
          *((void *)v8 + 2) = v9,
          *(void *)uint64_t v8 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v8))
      && KTLUTACopyReceiveData(a1, &v32))
    {
      uint64_t v10 = v32;
      (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
      int v11 = ARI_CsiCddGetDebugLogRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
      BOOL v12 = v11 == 0;
      int v13 = v43;
      int v14 = HIDWORD(v43);
    }
    else
    {
      int v13 = 0;
      int v14 = 0;
      BOOL v12 = 0;
    }
    *a3 = 0;
    goto LABEL_24;
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3002000000;
  uint64_t v39 = __Block_byref_object_copy__4;
  uint64_t v40 = __Block_byref_object_dispose__5;
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000;
  int v35 = -1;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v16 = dispatch_semaphore_create(0);
  BOOL v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (!ARI_CsiCddGetDebugLogReq_BLK())
  {
    dispatch_time_t v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (!dispatch_semaphore_wait(v17, v18))
    {
      *a3 = *((_DWORD *)v29 + 6);
      BOOL v12 = *((_DWORD *)v33 + 6) == 0;
      int v13 = *((_DWORD *)v37 + 10);
      int v14 = *((_DWORD *)v37 + 11);
      intptr_t v25 = object;
      if (!object) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    _KTLErrorPrint((uint64_t)"KTLCddGetDebugLog", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v26);
  }
  BOOL v12 = 0;
  *a3 = *((_DWORD *)v29 + 6);
  int v13 = *((_DWORD *)v37 + 10);
  int v14 = *((_DWORD *)v37 + 11);
  intptr_t v25 = object;
  if (object) {
LABEL_18:
  }
    dispatch_release(v25);
LABEL_19:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_24:
  *a2 = v14;
  return !v13 && v12;
}

void sub_21C651EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (object) {
    dispatch_release(object);
  }
  if (v26) {
    dispatch_release(v26);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

uint64_t __KTLCddGetDebugLog_block_invoke(void *a1, AriMsg *a2, unsigned int a3)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = ARI_CsiCddGetDebugLogRspCb_Extract();
  int BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  BOOL v7 = a1[7];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = BufCtx;
  dispatch_semaphore_signal(v7);
  return *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
}

BOOL KTLSahGetCrashReport(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v43 = 0;
  int v3 = *(_DWORD *)(a1 + 16);
  int v42 = v3;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (v7)
  {
    uint64_t v32 = 0;
    LODWORD(v28) = v3;
    int v44 = 0;
    uint64_t v36 = 0;
    if (!ARI_CsiSahGetCrashReportReq_ENC()
      && (uint64_t v8 = operator new(0x18uLL),
          uint64_t v9 = v36,
          v8[2] = v44,
          *((void *)v8 + 2) = v9,
          *(void *)uint64_t v8 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v8))
      && KTLUTACopyReceiveData(a1, &v32))
    {
      uint64_t v10 = v32;
      (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
      int v11 = ARI_CsiSahGetCrashReportRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
      BOOL v12 = v11 == 0;
      int v13 = v43;
      int v14 = HIDWORD(v43);
    }
    else
    {
      int v13 = 0;
      int v14 = 0;
      BOOL v12 = 0;
    }
    *a3 = 0;
    goto LABEL_24;
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3002000000;
  uint64_t v39 = __Block_byref_object_copy__9;
  uint64_t v40 = __Block_byref_object_dispose__10;
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000;
  int v35 = -1;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v16 = dispatch_semaphore_create(0);
  BOOL v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (!ARI_CsiSahGetCrashReportReq_BLK())
  {
    dispatch_time_t v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (!dispatch_semaphore_wait(v17, v18))
    {
      *a3 = *((_DWORD *)v29 + 6);
      BOOL v12 = *((_DWORD *)v33 + 6) == 0;
      int v13 = *((_DWORD *)v37 + 10);
      int v14 = *((_DWORD *)v37 + 11);
      intptr_t v25 = object;
      if (!object) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    _KTLErrorPrint((uint64_t)"KTLSahGetCrashReport", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v26);
  }
  BOOL v12 = 0;
  *a3 = *((_DWORD *)v29 + 6);
  int v13 = *((_DWORD *)v37 + 10);
  int v14 = *((_DWORD *)v37 + 11);
  intptr_t v25 = object;
  if (object) {
LABEL_18:
  }
    dispatch_release(v25);
LABEL_19:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_24:
  *a2 = v14;
  return !v13 && v12;
}

void sub_21C6522B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (object) {
    dispatch_release(object);
  }
  if (v26) {
    dispatch_release(v26);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

uint64_t __KTLSahGetCrashReport_block_invoke(void *a1, AriMsg *a2, unsigned int a3)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = ARI_CsiSahGetCrashReportRspCb_Extract();
  int BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  BOOL v7 = a1[7];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = BufCtx;
  dispatch_semaphore_signal(v7);
  return *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
}

BOOL KTLCddGetParamDump(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v43 = 0;
  int v3 = *(_DWORD *)(a1 + 16);
  int v42 = v3;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (v7)
  {
    uint64_t v32 = 0;
    LODWORD(v28) = v3;
    int v44 = 0;
    uint64_t v36 = 0;
    if (!ARI_CsiCddGetParamDumpReq_ENC()
      && (uint64_t v8 = operator new(0x18uLL),
          uint64_t v9 = v36,
          v8[2] = v44,
          *((void *)v8 + 2) = v9,
          *(void *)uint64_t v8 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v8))
      && KTLUTACopyReceiveData(a1, &v32))
    {
      uint64_t v10 = v32;
      (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
      int v11 = ARI_CsiCddGetParamDumpRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
      BOOL v12 = v11 == 0;
      int v13 = v43;
      int v14 = HIDWORD(v43);
    }
    else
    {
      int v13 = 0;
      int v14 = 0;
      BOOL v12 = 0;
    }
    *a3 = 0;
    goto LABEL_24;
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3002000000;
  uint64_t v39 = __Block_byref_object_copy__14_0;
  uint64_t v40 = __Block_byref_object_dispose__15_0;
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000;
  int v35 = -1;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v16 = dispatch_semaphore_create(0);
  BOOL v17 = v16;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  if (!ARI_CsiCddGetParamDumpReq_BLK())
  {
    dispatch_time_t v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (!dispatch_semaphore_wait(v17, v18))
    {
      *a3 = *((_DWORD *)v29 + 6);
      BOOL v12 = *((_DWORD *)v33 + 6) == 0;
      int v13 = *((_DWORD *)v37 + 10);
      int v14 = *((_DWORD *)v37 + 11);
      intptr_t v25 = object;
      if (!object) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    _KTLErrorPrint((uint64_t)"KTLCddGetParamDump", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v26);
  }
  BOOL v12 = 0;
  *a3 = *((_DWORD *)v29 + 6);
  int v13 = *((_DWORD *)v37 + 10);
  int v14 = *((_DWORD *)v37 + 11);
  intptr_t v25 = object;
  if (object) {
LABEL_18:
  }
    dispatch_release(v25);
LABEL_19:
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_24:
  *a2 = v14;
  return !v13 && v12;
}

void sub_21C6526B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (object) {
    dispatch_release(object);
  }
  if (v26) {
    dispatch_release(v26);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14_0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

uint64_t __KTLCddGetParamDump_block_invoke(void *a1, AriMsg *a2, unsigned int a3)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = ARI_CsiCddGetParamDumpRspCb_Extract();
  int BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  BOOL v7 = a1[7];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = BufCtx;
  dispatch_semaphore_signal(v7);
  return *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
}

BOOL KTLBspSwTrap(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v28 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (!v3)
  {
    uint64_t v24 = 0;
    intptr_t v25 = &v24;
    uint64_t v26 = 0x2000000000;
    int v27 = -1;
    uint64_t v9 = dispatch_semaphore_create(0);
    uint64_t v10 = v9;
    v22[1] = MEMORY[0x263EF8330];
    v22[2] = 1174405120;
    v22[3] = (uint64_t)__KTLBspSwTrap_block_invoke;
    v22[4] = (uint64_t)&__block_descriptor_tmp_19;
    v22[5] = (uint64_t)&v24;
    dispatch_object_t object = v9;
    if (v9) {
      dispatch_retain(v9);
    }
    if (ARI_CsiBspSwTrapReq_BLK()) {
      goto LABEL_18;
    }
    dispatch_time_t v11 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v18 = dispatch_semaphore_wait(v10, v11);
    if (v18) {
      _KTLErrorPrint((uint64_t)"KTLBspSwTrap", (uint64_t)"Timeout waiting for response.\n", v12, v13, v14, v15, v16, v17, v21);
    }
    if (v28) {
      AriHost::ExitTrx((AriHost *)v28);
    }
    if (v18)
    {
LABEL_18:
      BOOL v19 = 0;
      uint64_t v20 = object;
      if (!object)
      {
LABEL_20:
        if (v10) {
          dispatch_release(v10);
        }
        _Block_object_dispose(&v24, 8);
        return v19;
      }
    }
    else
    {
      BOOL v19 = *((_DWORD *)v25 + 6) == 0;
      uint64_t v20 = object;
      if (!object) {
        goto LABEL_20;
      }
    }
    dispatch_release(v20);
    goto LABEL_20;
  }
  v22[0] = 0;
  int v29 = 0;
  unsigned int v30 = v2;
  uint64_t v24 = 0;
  if (ARI_CsiBspSwTrapReq_ENC()) {
    return 0;
  }
  long long v4 = operator new(0x18uLL);
  uint64_t v5 = v24;
  void v4[2] = v29;
  *((void *)v4 + 2) = v5;
  *(void *)long long v4 = &unk_26CCDD1F8;
  if (!KTLUTASendAndReleaseData(a1, v4) || !KTLUTACopyReceiveData(a1, v22)) {
    return 0;
  }
  uint64_t v6 = v22[0];
  (*(void (**)(uint64_t))(*(void *)v22[0] + 16))(v22[0]);
  int v7 = ARI_CsiBspSwTrapRspCb_Extract();
  (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  return v7 == 0;
}

void sub_21C652A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  if (object)
  {
    dispatch_release(object);
    if (!v17)
    {
LABEL_3:
      _Block_object_dispose(&a17, 8);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_3;
  }
  dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspSwTrap_block_invoke(uint64_t a1)
{
  int v2 = ARI_CsiBspSwTrapRspCb_Extract();
  BOOL v3 = *(NSObject **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  dispatch_semaphore_signal(v3);
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __copy_helper_block_e8_32r40c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  long long v4 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r40c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  int v2 = *(NSObject **)(a1 + 40);
  if (v2) {
    dispatch_release(v2);
  }
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL KTLBspDebugJtagMode(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  uint64_t v32 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v24 = 0;
    int v33 = 0;
    unsigned int v34 = v2;
    uint64_t v28 = 0;
    if (!ARI_CsiBspDebugJtagModeReq_ENC()
      && (long long v4 = operator new(0x18uLL),
          uint64_t v5 = v28,
          void v4[2] = v33,
          *((void *)v4 + 2) = v5,
          *(void *)long long v4 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      uint64_t v6 = v24;
      (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
      int v7 = ARI_CsiBspDebugJtagModeRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      BOOL v8 = v7 == 0;
      int v9 = HIDWORD(v32);
    }
    else
    {
      int v9 = 0;
      BOOL v8 = 0;
    }
    return !v9 && v8;
  }
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1431655766;
  uint64_t v24 = 0;
  intptr_t v25 = &v24;
  uint64_t v26 = 0x2000000000;
  int v27 = -1;
  uint64_t v10 = dispatch_semaphore_create(0);
  dispatch_time_t v11 = v10;
  dispatch_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  if (ARI_CsiBspDebugJtagModeReq_BLK())
  {
    BOOL v8 = 0;
    int v9 = *((_DWORD *)v29 + 6);
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  dispatch_time_t v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v20 = dispatch_semaphore_wait(v11, v13);
  if (v20) {
    _KTLErrorPrint((uint64_t)"KTLBspDebugJtagMode", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  }
  if (v32) {
    AriHost::ExitTrx((AriHost *)v32);
  }
  int v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    BOOL v8 = *((_DWORD *)v25 + 6) == 0;
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v8 = 0;
  uint64_t v12 = object;
  if (object) {
LABEL_22:
  }
    dispatch_release(v12);
LABEL_23:
  if (v11) {
    dispatch_release(v11);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_21C652E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspDebugJtagMode_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspDebugJtagModeRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLBspSetNvItemsToState(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  uint64_t v32 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v24 = 0;
    int v33 = 0;
    unsigned int v34 = v2;
    uint64_t v28 = 0;
    if (!ARI_CsiBspSetNvItemsToStateReq_ENC()
      && (long long v4 = operator new(0x18uLL),
          uint64_t v5 = v28,
          void v4[2] = v33,
          *((void *)v4 + 2) = v5,
          *(void *)long long v4 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      uint64_t v6 = v24;
      (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
      int v7 = ARI_CsiBspSetNvItemsToStateRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      BOOL v8 = v7 == 0;
      int v9 = HIDWORD(v32);
    }
    else
    {
      int v9 = 0;
      BOOL v8 = 0;
    }
    return !v9 && v8;
  }
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1431655766;
  uint64_t v24 = 0;
  intptr_t v25 = &v24;
  uint64_t v26 = 0x2000000000;
  int v27 = -1;
  uint64_t v10 = dispatch_semaphore_create(0);
  dispatch_time_t v11 = v10;
  dispatch_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  if (ARI_CsiBspSetNvItemsToStateReq_BLK())
  {
    BOOL v8 = 0;
    int v9 = *((_DWORD *)v29 + 6);
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  dispatch_time_t v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v20 = dispatch_semaphore_wait(v11, v13);
  if (v20) {
    _KTLErrorPrint((uint64_t)"KTLBspSetNvItemsToState", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  }
  if (v32) {
    AriHost::ExitTrx((AriHost *)v32);
  }
  int v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    BOOL v8 = *((_DWORD *)v25 + 6) == 0;
    uint64_t v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v8 = 0;
  uint64_t v12 = object;
  if (object) {
LABEL_22:
  }
    dispatch_release(v12);
LABEL_23:
  if (v11) {
    dispatch_release(v11);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_21C653174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspSetNvItemsToState_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspSetNvItemsToStateRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLBspShutdown(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v28 = v2;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (!v3)
  {
    uint64_t v24 = 0;
    intptr_t v25 = &v24;
    uint64_t v26 = 0x2000000000;
    int v27 = -1;
    int v9 = dispatch_semaphore_create(0);
    uint64_t v10 = v9;
    v22[1] = MEMORY[0x263EF8330];
    v22[2] = 1174405120;
    v22[3] = (uint64_t)__KTLBspShutdown_block_invoke;
    v22[4] = (uint64_t)&__block_descriptor_tmp_28;
    v22[5] = (uint64_t)&v24;
    dispatch_object_t object = v9;
    if (v9) {
      dispatch_retain(v9);
    }
    if (ARI_CsiBspShutdownReq_BLK()) {
      goto LABEL_18;
    }
    dispatch_time_t v11 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v18 = dispatch_semaphore_wait(v10, v11);
    if (v18) {
      _KTLErrorPrint((uint64_t)"KTLBspShutdown", (uint64_t)"Timeout waiting for response.\n", v12, v13, v14, v15, v16, v17, v21);
    }
    if (v28) {
      AriHost::ExitTrx((AriHost *)v28);
    }
    if (v18)
    {
LABEL_18:
      BOOL v19 = 0;
      intptr_t v20 = object;
      if (!object)
      {
LABEL_20:
        if (v10) {
          dispatch_release(v10);
        }
        _Block_object_dispose(&v24, 8);
        return v19;
      }
    }
    else
    {
      BOOL v19 = *((_DWORD *)v25 + 6) == 0;
      intptr_t v20 = object;
      if (!object) {
        goto LABEL_20;
      }
    }
    dispatch_release(v20);
    goto LABEL_20;
  }
  v22[0] = 0;
  int v29 = 0;
  unsigned int v30 = v2;
  uint64_t v24 = 0;
  if (ARI_CsiBspShutdownReq_ENC()) {
    return 0;
  }
  long long v4 = operator new(0x18uLL);
  uint64_t v5 = v24;
  void v4[2] = v29;
  *((void *)v4 + 2) = v5;
  *(void *)long long v4 = &unk_26CCDD1F8;
  if (!KTLUTASendAndReleaseData(a1, v4) || !KTLUTACopyReceiveData(a1, v22)) {
    return 0;
  }
  uint64_t v6 = v22[0];
  (*(void (**)(uint64_t))(*(void *)v22[0] + 16))(v22[0]);
  int v7 = ARI_CsiBspShutdownRspCb_Extract();
  (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  return v7 == 0;
}

void sub_21C6534A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  if (object)
  {
    dispatch_release(object);
    if (!v17)
    {
LABEL_3:
      _Block_object_dispose(&a17, 8);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_3;
  }
  dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspShutdown_block_invoke(uint64_t a1)
{
  int v2 = ARI_CsiBspShutdownRspCb_Extract();
  BOOL v3 = *(NSObject **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  dispatch_semaphore_signal(v3);
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLSysGetInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3)
  {
    _KTLErrorPrint((uint64_t)"KTLSysGetInfo", (uint64_t)"System Information Parameter is missing.\n", 0, a4, a5, a6, a7, a8, v29[0]);
    return 0;
  }
  unsigned int v10 = *(_DWORD *)(a1 + 16);
  unsigned int v35 = v10;
  if (*(void *)(a1 + 8)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  if (!v11)
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2000000000;
    int v34 = -1;
    uint64_t v16 = dispatch_semaphore_create(0);
    uint64_t v17 = v16;
    v29[1] = MEMORY[0x263EF8330];
    v29[2] = 1174405120;
    v29[3] = (uint64_t)__KTLSysGetInfo_block_invoke;
    v29[4] = (uint64_t)&__block_descriptor_tmp_30_0;
    v29[5] = (uint64_t)&v31;
    v29[6] = a3;
    dispatch_object_t object = v16;
    if (v16) {
      dispatch_retain(v16);
    }
    if (ARI_CsiSysGetInfoReqV2_BLK()) {
      goto LABEL_21;
    }
    dispatch_time_t v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v25 = dispatch_semaphore_wait(v17, v18);
    if (v25) {
      _KTLErrorPrint((uint64_t)"KTLSysGetInfo", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v29[0]);
    }
    if (v35) {
      AriHost::ExitTrx((AriHost *)v35);
    }
    if (v25)
    {
LABEL_21:
      BOOL v26 = 0;
      int v27 = object;
      if (!object) {
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v26 = *((_DWORD *)v32 + 6) == 0;
      int v27 = object;
      if (!object)
      {
LABEL_23:
        if (v17) {
          dispatch_release(v17);
        }
        _Block_object_dispose(&v31, 8);
        if (v26) {
          return *(_DWORD *)(a3 + 516) == 0;
        }
        return 0;
      }
    }
    dispatch_release(v27);
    goto LABEL_23;
  }
  v29[0] = 0;
  int v36 = 0;
  unsigned int v37 = v10;
  uint64_t v31 = 0;
  if (!ARI_CsiSysGetInfoReqV2_ENC())
  {
    uint64_t v12 = operator new(0x18uLL);
    uint64_t v13 = v31;
    v12[2] = v36;
    *((void *)v12 + 2) = v13;
    *(void *)uint64_t v12 = &unk_26CCDD1F8;
    if (KTLUTASendAndReleaseData(a1, v12))
    {
      if (KTLUTACopyReceiveData(a1, v29))
      {
        uint64_t v14 = v29[0];
        (*(void (**)(uint64_t))(*(void *)v29[0] + 16))(v29[0]);
        int v15 = ARI_CsiSysGetInfoRspCbV2_Extract();
        (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
        if (!v15) {
          return *(_DWORD *)(a3 + 516) == 0;
        }
      }
    }
  }
  return 0;
}

void sub_21C6537EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  if (object)
  {
    dispatch_release(object);
    if (!v17)
    {
LABEL_3:
      _Block_object_dispose(&a17, 8);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_3;
  }
  dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLSysGetInfo_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiSysGetInfoRspCbV2_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __copy_helper_block_e8_32r48c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  long long v4 = *(NSObject **)(a2 + 48);
  *(void *)(a1 + 48) = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r48c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  int v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL KTLBspGetCalibrationStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t v40 = 0;
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v39 = v2;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v2 == 0;
  }
  if (!v5)
  {
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x2000000000;
    int v38 = -1431655766;
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2000000000;
    int v34 = -1431655766;
    uint64_t v27 = 0;
    unsigned int v28 = &v27;
    uint64_t v29 = 0x2000000000;
    int v30 = -1;
    uint64_t v14 = dispatch_semaphore_create(0);
    int v15 = v14;
    uint64_t v25 = MEMORY[0x263EF8330];
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    if (ARI_CsiBspGetCalibrationStatusReq_BLK())
    {
      BOOL v10 = 0;
      int v11 = *((_DWORD *)v36 + 6);
      int v12 = *((_DWORD *)v32 + 6);
      uint64_t v16 = object;
      if (!object) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_time_t v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v24 = dispatch_semaphore_wait(v15, v17);
      if (v24) {
        _KTLErrorPrint((uint64_t)"KTLBspGetCalibrationStatus", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v25);
      }
      if (v39) {
        AriHost::ExitTrx((AriHost *)v39);
      }
      int v11 = *((_DWORD *)v36 + 6);
      int v12 = *((_DWORD *)v32 + 6);
      if (v24)
      {
        BOOL v10 = 0;
        uint64_t v16 = object;
        if (!object)
        {
LABEL_25:
          if (v15) {
            dispatch_release(v15);
          }
          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v35, 8);
          goto LABEL_28;
        }
      }
      else
      {
        BOOL v10 = *((_DWORD *)v28 + 6) == 0;
        uint64_t v16 = object;
        if (!object) {
          goto LABEL_25;
        }
      }
    }
    dispatch_release(v16);
    goto LABEL_25;
  }
  uint64_t v31 = 0;
  LODWORD(v27) = v2;
  int v41 = 0;
  uint64_t v35 = 0;
  if (!ARI_CsiBspGetCalibrationStatusReq_ENC()
    && (uint64_t v6 = operator new(0x18uLL),
        uint64_t v7 = v35,
        v6[2] = v41,
        *((void *)v6 + 2) = v7,
        *(void *)uint64_t v6 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v6))
    && KTLUTACopyReceiveData(a1, &v31))
  {
    uint64_t v8 = v31;
    (*(void (**)(uint64_t))(*(void *)v31 + 16))(v31);
    int v9 = ARI_CsiBspGetCalibrationStatusRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    BOOL v10 = v9 == 0;
    int v12 = v40;
    int v11 = HIDWORD(v40);
  }
  else
  {
    int v11 = 0;
    int v12 = 0;
    BOOL v10 = 0;
  }
LABEL_28:
  *a2 = v12;
  return !v11 && v10;
}

void sub_21C653C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspGetCalibrationStatus_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspGetCalibrationStatusRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLBspStateGet(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  unsigned int v39 = v3;
  int v40 = -1;
  if (!a3) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x2000000000;
    int v38 = -1431655766;
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2000000000;
    int v34 = -1;
    uint64_t v27 = 0;
    unsigned int v28 = &v27;
    uint64_t v29 = 0x2000000000;
    int v30 = -1431655766;
    uint64_t v14 = dispatch_semaphore_create(0);
    int v15 = v14;
    uint64_t v25 = MEMORY[0x263EF8330];
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    if (ARI_CsiBspStateGetReq_BLK())
    {
      BOOL v11 = 0;
      int v12 = *((_DWORD *)v36 + 6);
      *a3 = *((_DWORD *)v28 + 6);
      uint64_t v16 = object;
      if (!object) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_time_t v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v24 = dispatch_semaphore_wait(v15, v17);
      if (v24) {
        _KTLErrorPrint((uint64_t)"KTLBspStateGet", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v25);
      }
      if (v39) {
        AriHost::ExitTrx((AriHost *)v39);
      }
      int v12 = *((_DWORD *)v36 + 6);
      *a3 = *((_DWORD *)v28 + 6);
      if (v24)
      {
        BOOL v11 = 0;
        uint64_t v16 = object;
        if (!object)
        {
LABEL_25:
          if (v15) {
            dispatch_release(v15);
          }
          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v35, 8);
          return !v12 && v11;
        }
      }
      else
      {
        BOOL v11 = *((_DWORD *)v32 + 6) == 0;
        uint64_t v16 = object;
        if (!object) {
          goto LABEL_25;
        }
      }
    }
    dispatch_release(v16);
    goto LABEL_25;
  }
  uint64_t v31 = 0;
  LODWORD(v27) = v3;
  int v41 = 0;
  uint64_t v35 = 0;
  if (!ARI_CsiBspStateGetReq_ENC()
    && (uint64_t v7 = operator new(0x18uLL),
        uint64_t v8 = v35,
        v7[2] = v41,
        *((void *)v7 + 2) = v8,
        *(void *)uint64_t v7 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v7))
    && KTLUTACopyReceiveData(a1, &v31))
  {
    uint64_t v9 = v31;
    (*(void (**)(uint64_t))(*(void *)v31 + 16))(v31);
    int v10 = ARI_CsiBspStateGetRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    BOOL v11 = v10 == 0;
    int v12 = v40;
  }
  else
  {
    BOOL v11 = 0;
    int v12 = -1;
  }
  return !v12 && v11;
}

void sub_21C654014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspStateGet_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspStateGetRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL KTLBspStateSet(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v32 = v2;
  int v33 = -1;
  if (*(void *)(a1 + 8)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    uint64_t v24 = 0;
    int v34 = 0;
    unsigned int v35 = v2;
    uint64_t v28 = 0;
    if (!ARI_CsiBspStateSetReq_ENC()
      && (long long v4 = operator new(0x18uLL),
          uint64_t v5 = v28,
          void v4[2] = v34,
          *((void *)v4 + 2) = v5,
          *(void *)long long v4 = &unk_26CCDD1F8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      uint64_t v6 = v24;
      (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
      int v7 = ARI_CsiBspStateSetRspCb_Extract();
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      BOOL v8 = v7 == 0;
      int v9 = v33;
    }
    else
    {
      BOOL v8 = 0;
      int v9 = -1;
    }
    return !v9 && v8;
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1431655766;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000;
  int v27 = -1;
  int v10 = dispatch_semaphore_create(0);
  BOOL v11 = v10;
  dispatch_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  if (ARI_CsiBspStateSetReq_BLK())
  {
    BOOL v8 = 0;
    int v9 = *((_DWORD *)v29 + 6);
    int v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  dispatch_time_t v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  intptr_t v20 = dispatch_semaphore_wait(v11, v13);
  if (v20) {
    _KTLErrorPrint((uint64_t)"KTLBspStateSet", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  }
  if (v32) {
    AriHost::ExitTrx((AriHost *)v32);
  }
  int v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    BOOL v8 = *((_DWORD *)v25 + 6) == 0;
    int v12 = object;
    if (!object) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v8 = 0;
  int v12 = object;
  if (object) {
LABEL_22:
  }
    dispatch_release(v12);
LABEL_23:
  if (v11) {
    dispatch_release(v11);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_21C654394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLBspStateSet_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiBspStateSetRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t KTLBspIceAtStringWrite(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  *(_DWORD *)(a2 + 3076) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(a2 + 3080) = 1;
  if (ARI_CsiIceAtExtReq_ENC()) {
    return 0;
  }
  long long v4 = operator new(0x18uLL);
  void v4[2] = 0;
  *((void *)v4 + 2) = 0;
  *(void *)long long v4 = &unk_26CCDD1F8;
  return KTLUTASendAndReleaseData(a1, v4);
}

BOOL KTLBspIceAtString()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  unsigned int v2 = v1;
  long long v4 = v3;
  uint64_t v5 = v0;
  uint64_t v59 = *MEMORY[0x263EF8340];
  int v52 = 0;
  int v7 = *(_DWORD *)(v0 + 16);
  unsigned int v6 = *(_DWORD *)(v0 + 20);
  v3[769] = v6;
  v3[770] = 1;
  if (*(void *)(v0 + 8)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (v8)
  {
    uint64_t v47 = 0;
    memset(__b, 170, 0xC0CuLL);
    bzero(__src, 0xC0CuLL);
    dispatch_time_t v9 = dispatch_time(0, 1000000 * v6);
    LODWORD(v43) = v7;
    uint64_t __dst = 0;
    if (ARI_CsiIceAtExtReq_ENC())
    {
      char v10 = 0;
    }
    else
    {
      uint64_t v17 = operator new(0x18uLL);
      uint64_t v18 = __dst;
      v17[2] = 0;
      *((void *)v17 + 2) = v18;
      *(void *)uint64_t v17 = &unk_26CCDD1F8;
      char v10 = KTLUTASendAndReleaseData(v5, v17);
    }
    while (1)
    {
      if ((v10 & 1) == 0)
      {
LABEL_38:
        BOOL v15 = 0;
        return !v52 && v15;
      }
      if (KTLUTACopyReceiveData(v5, &v47))
      {
        uint64_t v19 = v47;
        (*(void (**)(uint64_t))(*(void *)v47 + 16))(v47);
        int v20 = ARI_CsiIceAtExtRsp_Extract();
        (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
        char v10 = v20 == 0;
        if (!(v20 | v52))
        {
          size_t v26 = LODWORD(__b[384]);
          if (LODWORD(__b[384]))
          {
            unint64_t v27 = 0;
            do
            {
              if (!*((unsigned char *)__b + v27))
              {
                _KTLDebugPrint((uint64_t)"KTLBspIceAtString", (uint64_t)"Embedded null found in AT response at buffer offset %u\n", v26, v21, v22, v23, v24, v25, v27);
                *((unsigned char *)__b + v27) = 32;
                size_t v26 = LODWORD(__b[384]);
              }
              ++v27;
            }
            while (v27 < v26);
          }
          else
          {
            size_t v26 = 0;
          }
          fwrite(__b, 1uLL, v26, v2);
          fflush(v2);
          uint64_t __dst = 0;
          p_dst = 0;
          uint64_t v28 = LODWORD(__src[192]);
          if (LODWORD(__src[192]) <= 7)
          {
            memcpy(&__dst, __src, LODWORD(__src[192]));
          }
          else
          {
            uint64_t __dst = *(void *)&v51[LODWORD(__src[192])];
            uint64_t v28 = 8;
          }
          uint64_t v29 = (char *)&__dst + v28;
          size_t v30 = LODWORD(__b[384]);
          if (LODWORD(__b[384]) >= 8) {
            size_t v31 = 8;
          }
          else {
            size_t v31 = LODWORD(__b[384]);
          }
          memcpy(v29, __b, v31);
          if (strnstr((const char *)__b, "\r\nOK\r\n", v30)
            || strnstr((const char *)__b, "\r\nERROR\r\n", LODWORD(__b[384]))
            || strnstr((const char *)&__dst, "\r\nOK\r\n", 0x10uLL)
            || strnstr((const char *)&__dst, "\r\nERROR\r\n", 0x10uLL))
          {
            BOOL v15 = 1;
            return !v52 && v15;
          }
          memcpy(__src, __b, 0xC0CuLL);
          char v10 = 1;
        }
      }
      else
      {
        char v10 = 0;
      }
      if (dispatch_time(0, 0) > v9) {
        goto LABEL_38;
      }
    }
  }
  uint64_t __dst = 0;
  p_dst = &__dst;
  uint64_t v57 = 0x2000000000;
  int v58 = 0;
  uint64_t v47 = 0;
  char v48 = &v47;
  uint64_t v49 = 0x2000000000;
  int v50 = 0;
  uint64_t v43 = 0;
  int v44 = &v43;
  uint64_t v45 = 0x2000000000;
  int v46 = -1;
  __b[0] = 0;
  __b[1] = __b;
  __b[2] = 0xC3802000000;
  __b[3] = __Block_byref_object_copy__40;
  __b[4] = __Block_byref_object_dispose__41;
  bzero(&__b[5], 0xC0CuLL);
  BOOL v11 = dispatch_semaphore_create(0);
  *(void *)&__src[4] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  _OWORD __src[2] = v12;
  __src[3] = v12;
  __src[0] = v12;
  __src[1] = v12;
  AriSdk::ARI_CsiIceAtExtReq_SDK::ARI_CsiIceAtExtReq_SDK((AriSdk::ARI_CsiIceAtExtReq_SDK *)__src);
  dispatch_time_t v13 = operator new(0xC0CuLL);
  memcpy(v13, v4, 0xC0CuLL);
  uint64_t v14 = *(void **)&__src[4];
  *(void *)&__src[4] = v13;
  if (v14) {
    operator delete(v14);
  }
  AriSdk::MsgBase::getRawBytes();
  if (v11) {
    dispatch_retain(v11);
  }
  if (AriHost::StartStream())
  {
    BOOL v15 = 0;
    int v52 = *((_DWORD *)v48 + 6);
    uint64_t v16 = v11;
    if (!v11) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  dispatch_time_t v32 = dispatch_time(0, 1000000 * *(unsigned int *)(v5 + 20));
  intptr_t v39 = dispatch_semaphore_wait(v11, v32);
  if (v39) {
    _KTLErrorPrint((uint64_t)"KTLBspIceAtString", (uint64_t)"Timeout waiting for response.\n", v33, v34, v35, v36, v37, v38, v42);
  }
  int v40 = (AriHost *)*((unsigned int *)p_dst + 6);
  if (v40) {
    AriHost::EndStream(v40);
  }
  int v52 = *((_DWORD *)v48 + 6);
  if (!v39)
  {
    BOOL v15 = *((_DWORD *)v44 + 6) == 0;
    uint64_t v16 = v11;
    if (!v11) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  BOOL v15 = 0;
  uint64_t v16 = v11;
  if (v11) {
LABEL_45:
  }
    dispatch_release(v16);
LABEL_46:
  MEMORY[0x21D4AB9B0](__src);
  if (v11) {
    dispatch_release(v11);
  }
  _Block_object_dispose(__b, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&__dst, 8);
  return !v52 && v15;
}

void sub_21C654B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,NSObject *object,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  if (object) {
    dispatch_release(object);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  MEMORY[0x21D4AB9B0](&a33);
  if (v33) {
    dispatch_release(v33);
  }
  _Block_object_dispose(&STACK[0xCD0], 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0xC0CuLL);
}

uint64_t __KTLBspIceAtString_block_invoke(uint64_t a1, AriMsg *a2, unsigned int a3)
{
  *(void *)&__b[771] = *MEMORY[0x263EF8340];
  memset(__b, 170, 0xC0CuLL);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiIceAtExtRsp_Extract();
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!result)
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      return 0;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
    size_t v12 = __b[768];
    if (__b[768])
    {
      unint64_t v13 = 0;
      do
      {
        if (!*((unsigned char *)__b + v13))
        {
          _KTLDebugPrint((uint64_t)"KTLBspIceAtString_block_invoke", (uint64_t)"Embedded null found in AT response at buffer offset %u\n", v12, v7, v8, v9, v10, v11, v13);
          *((unsigned char *)__b + v13) = 32;
          size_t v12 = __b[768];
        }
        ++v13;
      }
      while (v13 < v12);
    }
    else
    {
      size_t v12 = 0;
    }
    fwrite(__b, 1uLL, v12, *(FILE **)(a1 + 64));
    fflush(*(FILE **)(a1 + 64));
    __dst[0] = 0;
    __dst[1] = 0;
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v15 = (char *)(v14 + 40);
    uint64_t v16 = *(unsigned int *)(v14 + 3112);
    if (v16 <= 7)
    {
      memcpy(__dst, v15, *(unsigned int *)(v14 + 3112));
    }
    else
    {
      __dst[0] = *(void *)&v15[v16 - 8];
      uint64_t v16 = 8;
    }
    uint64_t v17 = (char *)__dst + v16;
    size_t v18 = __b[768];
    if (__b[768] >= 8u) {
      size_t v19 = 8;
    }
    else {
      size_t v19 = __b[768];
    }
    memcpy(v17, __b, v19);
    if (strnstr((const char *)__b, "\r\nOK\r\n", v18)) {
      goto LABEL_21;
    }
    if (!strnstr((const char *)__b, "\r\nERROR\r\n", __b[768]))
    {
      if (strnstr((const char *)__dst, "\r\nOK\r\n", 0x10uLL)) {
        goto LABEL_21;
      }
      if (!strnstr((const char *)__dst, "\r\nERROR\r\n", 0x10uLL)) {
        goto LABEL_22;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
LABEL_21:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
LABEL_22:
    memcpy((void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), __b, 0xC0CuLL);
    return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

void __copy_helper_block_e8_32r40r48r56r72c25_ZTSN8dispatch9semaphoreE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  long long v4 = *(NSObject **)(a2 + 72);
  a1[9] = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r40r48r56r72c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  unsigned int v2 = *(NSObject **)(a1 + 72);
  if (v2) {
    dispatch_release(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL KTLGetIMEIInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfo", (uint64_t)"opt(%p) or respParam(%p) is NULL\n", a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v54[2] = v11;
  v54[3] = v11;
  v54[0] = v11;
  v54[1] = v11;
  AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::ARI_CsiMsCpsReadImeiReq_SDK((AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *)v54);
  size_t v12 = operator new(4uLL);
  *size_t v12 = a2;
  unint64_t v13 = __p;
  __p = v12;
  if (v13) {
    operator delete(v13);
  }
  int v52 = 0;
  unsigned int v53 = 0;
  AriSdk::MsgBase::getRawBytes();
  int v20 = *(void **)(a1 + 8);
  if (v20 || !*(_DWORD *)(a1 + 16))
  {
    uint64_t v21 = *v52;
    uint64_t v22 = v52[1] - *v52;
    uint64_t v23 = *(unsigned int *)(a1 + 20);
    LODWORD(v48) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v14, v15, v16, v17, v18, v19, v22);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v21);
    }
    if (*v20
      && ((v30 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v20)(v20, v21, v22, &v48, 1, v23, 0), v48 == v22)? (char v31 = v30): (char v31 = 0), (v31 & 1) != 0))
    {
      uint64_t v48 = 0;
      if (KTLUTACopyReceiveData(a1, &v48)) {
        BOOL v32 = KTLGetIMEIInfoParseAndRelease(v48, a3);
      }
      else {
        BOOL v32 = 0;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v24, v25, v26, v27, v28, v29, v22);
      BOOL v32 = 0;
    }
    goto LABEL_29;
  }
  uint64_t v33 = dispatch_semaphore_create(0);
  uint64_t v34 = v33;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2000000000;
  char v51 = 0;
  dispatch_object_t object = v33;
  if (v33) {
    dispatch_retain(v33);
  }
  if (AriHost::Send())
  {
    int v41 = "Failed to send the message of CsiMsCpsReadImeiReq.\n";
    goto LABEL_25;
  }
  dispatch_time_t v42 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v34, v42))
  {
    int v41 = "Timeout waiting for response.\n";
LABEL_25:
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfo", (uint64_t)v41, v35, v36, v37, v38, v39, v40, v46);
    BOOL v32 = 0;
    uint64_t v43 = object;
    if (!object) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  BOOL v32 = *((unsigned char *)v49 + 24) != 0;
  uint64_t v43 = object;
  if (object) {
LABEL_26:
  }
    dispatch_release(v43);
LABEL_27:
  _Block_object_dispose(&v48, 8);
  if (v34) {
    dispatch_release(v34);
  }
LABEL_29:
  int v44 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  MEMORY[0x21D4ABA70](v54);
  return v32;
}

void sub_21C655264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a19, 8);
  if (v25)
  {
    dispatch_release(v25);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
    MEMORY[0x21D4ABA70](&a25);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x21D4ABA70](&a25);
  _Unwind_Resume(a1);
}

uint64_t __KTLGetIMEIInfo_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  unsigned int v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)unsigned int v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLGetIMEIInfoParseAndRelease((uint64_t)v6, *(void *)(a1 + 48));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C655384(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetIMEIInfoParseAndRelease(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v4;
  long long v23 = v4;
  v21[2] = v4;
  v21[3] = v4;
  v21[0] = v4;
  v21[1] = v4;
  uint64_t v5 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK((AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)v21, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v21) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfoParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v21[0]);
  }
  int v18 = AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::unpack((AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)v21);
  if (v18)
  {
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfoParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v21[0]);
  }
  else
  {
    uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 16);
    *(_OWORD *)a2 = **((_OWORD **)&v22 + 1);
    *(void *)(a2 + 16) = v19;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABC50](v21);
  return v18 == 0;
}

BOOL KTLGetMEIDInfo(uint64_t a1, int a2, uint64_t a3)
{
  v42[3] = *MEMORY[0x263EF8340];
  unsigned int v5 = *(_DWORD *)(a1 + 16);
  unsigned int v34 = v5;
  int v35 = a2;
  if (*(void *)(a1 + 8)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (v6)
  {
    v32[0] = 0;
    LODWORD(v28) = v5;
    int v36 = 0;
    uint64_t v37 = 0;
    if (ARI_CsiMsCpsReadMeidReq_ENC()) {
      return 0;
    }
    uint64_t v7 = operator new(0x18uLL);
    uint64_t v8 = v37;
    v7[2] = v36;
    *((void *)v7 + 2) = v8;
    *(void *)uint64_t v7 = &unk_26CCDD1F8;
    if (!KTLUTASendAndReleaseData(a1, v7) || !KTLUTACopyReceiveData(a1, v32)) {
      return 0;
    }
    uint64_t v9 = v32[0];
    (*(void (**)(uint64_t))(*(void *)v32[0] + 16))(v32[0]);
    int v10 = ARI_CsiMsCpsReadMeidRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    return v10 == 0;
  }
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x4002000000;
  uint64_t v40 = __Block_byref_object_copy__51;
  int v41 = __Block_byref_object_dispose__52;
  memset(v42, 170, 24);
  v32[0] = 0;
  v32[1] = (uint64_t)v32;
  v32[2] = 0x2000000000;
  int v33 = -1431655766;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1;
  uint64_t v12 = dispatch_semaphore_create(0);
  uint64_t v13 = v12;
  dispatch_object_t object = v12;
  if (v12) {
    dispatch_retain(v12);
  }
  if (!ARI_CsiMsCpsReadMeidReq_BLK())
  {
    dispatch_time_t v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    intptr_t v24 = dispatch_semaphore_wait(v13, v17);
    if (v24) {
      _KTLErrorPrint((uint64_t)"KTLGetMEIDInfo", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v26);
    }
    if (v34) {
      AriHost::ExitTrx((AriHost *)v34);
    }
    uint64_t v25 = v38[7];
    *(_OWORD *)a3 = *(_OWORD *)(v38 + 5);
    *(void *)(a3 + 16) = v25;
    if (v24)
    {
      BOOL v11 = 0;
      uint64_t v15 = object;
      if (!object) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v11 = *((_DWORD *)v29 + 6) == 0;
      uint64_t v15 = object;
      if (!object) {
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  BOOL v11 = 0;
  uint64_t v14 = v38[7];
  *(_OWORD *)a3 = *(_OWORD *)(v38 + 5);
  *(void *)(a3 + 16) = v14;
  uint64_t v15 = object;
  if (object) {
LABEL_14:
  }
    dispatch_release(v15);
LABEL_15:
  if (v13) {
    dispatch_release(v13);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v37, 8);
  return v11;
}

void sub_21C655854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (object) {
    dispatch_release(object);
  }
  if (v22) {
    dispatch_release(v22);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v23 - 136), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t __KTLGetMEIDInfo_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiMsCpsReadMeidRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

unint64_t KTLBmmProvideBootTimeInfo(uint64_t a1, _DWORD *a2)
{
  unint64_t v2 = (unint64_t)a2;
  if (a2)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v50[2] = v4;
    v50[3] = v4;
    v50[0] = v4;
    v50[1] = v4;
    AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::ARI_CsiBmmProvideBootTimeInfoReq_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *)v50);
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    AriSdk::MsgBase::getRawBytes();
    BOOL v11 = *(void **)(a1 + 8);
    if (v11 || !*(_DWORD *)(a1 + 16))
    {
      uint64_t v12 = *v48;
      uint64_t v13 = v48[1] - *v48;
      uint64_t v14 = *(unsigned int *)(a1 + 20);
      LODWORD(v44) = 0;
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, v13);
      if ((_KTLDebugFlags & 2) != 0) {
        off_26AA6F9C8("Tx:", 0, v12);
      }
      if (!*v11
        || ((char v21 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v11)(v11, v12, v13, &v44, 1, v14, 0), v44 == v13)? (v22 = v21): (v22 = 0), (v22 & 1) == 0))
      {
        _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v15, v16, v17, v18, v19, v20, v13);
        goto LABEL_14;
      }
      uint64_t v44 = 0;
      if (!KTLUTACopyReceiveData(a1, &v44) || !KTLBmmProvideBootTimeInfoParseAndRelease(v44, (void *)v2))
      {
LABEL_14:
        unint64_t v2 = 0;
        uint64_t v23 = v49;
        if (!v49)
        {
LABEL_17:
          MEMORY[0x21D4ABFC0](v50);
          return v2;
        }
LABEL_15:
        if (!atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
        goto LABEL_17;
      }
LABEL_32:
      if (!*(_DWORD *)(v2 + 3600))
      {
        unint64_t v2 = *(_DWORD *)(v2 + 3604) == 0;
        uint64_t v23 = v49;
        if (!v49) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    uint64_t v25 = dispatch_semaphore_create(0);
    uint64_t v26 = v25;
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x2000000000;
    char v47 = 0;
    dispatch_object_t object = v25;
    if (v25) {
      dispatch_retain(v25);
    }
    if (AriHost::Send())
    {
      _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfo", (uint64_t)"Failed to send the message of CsiBmmProvideBootTimeInfoReq.\n", v27, v28, v29, v30, v31, v32, v42);
      BOOL v33 = 0;
      unsigned int v34 = object;
      if (!object) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    dispatch_time_t v35 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v26, v35))
    {
      _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfo", (uint64_t)"Timeout waiting for response.\n", v36, v37, v38, v39, v40, v41, v42);
      BOOL v33 = 0;
      unsigned int v34 = object;
      if (!object) {
        goto LABEL_25;
      }
    }
    else
    {
      BOOL v33 = *((unsigned char *)v45 + 24) != 0;
      unsigned int v34 = object;
      if (!object)
      {
LABEL_25:
        _Block_object_dispose(&v44, 8);
        if (v26)
        {
          dispatch_release(v26);
          if (!v33) {
            goto LABEL_14;
          }
        }
        else if (!v33)
        {
          goto LABEL_14;
        }
        goto LABEL_32;
      }
    }
LABEL_24:
    dispatch_release(v34);
    goto LABEL_25;
  }
  return v2;
}

void sub_21C655C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a19, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
      MEMORY[0x21D4ABFC0](&a25);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a19, 8);
    if (!v25) {
      goto LABEL_3;
    }
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x21D4ABFC0](&a25);
  _Unwind_Resume(a1);
}

void sub_21C655CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va1, a15);
  va_start(va, a15);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  MEMORY[0x21D4ABFC0](va1);
  _Unwind_Resume(a1);
}

uint64_t __KTLBmmProvideBootTimeInfo_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLBmmProvideBootTimeInfoParseAndRelease((uint64_t)v6, *(void **)(a1 + 48));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C655D78(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLBmmProvideBootTimeInfoParseAndRelease(uint64_t a1, void *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__src = v4;
  long long v22 = v4;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  uint64_t v5 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfoParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  }
  int v18 = AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::unpack((AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *)v20);
  if (v18) {
    _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfoParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  }
  else {
    memcpy(a2, __src[0], 0xE1CuLL);
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4AC080](v20);
  return v18 == 0;
}

uint64_t KTLTriggerDelayedResponse(uint64_t a1, int a2)
{
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46[2] = v4;
  v46[3] = v4;
  v46[0] = v4;
  v46[1] = v4;
  AriSdk::ARI_CsiDelayedOutstandingReq_SDK::ARI_CsiDelayedOutstandingReq_SDK((AriSdk::ARI_CsiDelayedOutstandingReq_SDK *)v46);
  uint64_t v5 = operator new(4uLL);
  *uint64_t v5 = a2;
  uint64_t v6 = __p;
  __p = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v13 = *(void **)(a1 + 8);
  if (v13 || !*(_DWORD *)(a1 + 16))
  {
    uint64_t v14 = *v44;
    uint64_t v15 = v44[1] - *v44;
    uint64_t v16 = *(unsigned int *)(a1 + 20);
    LODWORD(v40) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v7, v8, v9, v10, v11, v12, v15);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v14);
    }
    if (*v13
      && ((char v23 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v13)(v13, v14, v15, &v40, 1, v16, 0), v40 == v15)? (v24 = v23): (v24 = 0), (v24 & 1) != 0))
    {
      uint64_t v40 = 0;
      if (KTLUTACopyReceiveData(a1, &v40))
      {
        uint64_t v25 = KTLTriggerDelayedResponseParseAndRelease(v40);
        uint64_t v26 = v45;
        if (!v45) {
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v25 = 0;
        uint64_t v26 = v45;
        if (!v45) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v17, v18, v19, v20, v21, v22, v15);
      uint64_t v25 = 0;
      uint64_t v26 = v45;
      if (!v45) {
        goto LABEL_27;
      }
    }
    goto LABEL_25;
  }
  uint64_t v27 = dispatch_semaphore_create(0);
  uint64_t v28 = v27;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2000000000;
  char v43 = 0;
  dispatch_object_t object = v27;
  if (v27) {
    dispatch_retain(v27);
  }
  AriHost::Send();
  dispatch_time_t v29 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v28, v29))
  {
    _KTLErrorPrint((uint64_t)"KTLTriggerDelayedResponse", (uint64_t)"Timeout waiting for response.\n", v30, v31, v32, v33, v34, v35, v38);
    uint64_t v25 = 0;
    uint64_t v36 = object;
    if (!object) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v25 = *((unsigned char *)v41 + 24) != 0;
  uint64_t v36 = object;
  if (object) {
LABEL_21:
  }
    dispatch_release(v36);
LABEL_22:
  _Block_object_dispose(&v40, 8);
  if (v28) {
    dispatch_release(v28);
  }
  uint64_t v26 = v45;
  if (v45)
  {
LABEL_25:
    if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
LABEL_27:
  MEMORY[0x21D4ABE40](v46);
  return v25;
}

void sub_21C6561DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a19, 8);
  if (v25)
  {
    dispatch_release(v25);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
    MEMORY[0x21D4ABE40](&a25);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x21D4ABE40](&a25);
  _Unwind_Resume(a1);
}

uint64_t __KTLTriggerDelayedResponse_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLTriggerDelayedResponseParseAndRelease((uint64_t)v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 0;
}

void sub_21C6562F8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLTriggerDelayedResponseParseAndRelease(uint64_t a1)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v2;
  v13[3] = v2;
  v13[0] = v2;
  v13[1] = v2;
  BOOL v3 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiDelayedOutstandingResp_SDK::ARI_CsiDelayedOutstandingResp_SDK((AriSdk::ARI_CsiDelayedOutstandingResp_SDK *)v13, v3);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v13) == 67600384)
  {
    uint64_t v10 = "NACK Received\n";
  }
  else
  {
    if (!AriSdk::ARI_CsiDelayedOutstandingResp_SDK::unpack((AriSdk::ARI_CsiDelayedOutstandingResp_SDK *)v13))
    {
      _KTLDebugPrint((uint64_t)"KTLTriggerDelayedResponseParseAndRelease", (uint64_t)"Delayed response received\n", v4, v5, v6, v7, v8, v9, *(uint64_t *)&v13[0]);
      uint64_t v11 = 1;
      goto LABEL_6;
    }
    uint64_t v10 = "Malformed response\n";
  }
  _KTLErrorPrint((uint64_t)"KTLTriggerDelayedResponseParseAndRelease", (uint64_t)v10, v4, v5, v6, v7, v8, v9, *(uint64_t *)&v13[0]);
  uint64_t v11 = 0;
LABEL_6:
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABEB0](v13);
  return v11;
}

uint64_t KTLIsBBSimStackMappingEnabled(uint64_t a1, BOOL *a2)
{
  uint64_t v2 = 0;
  if (!a1 || !a2) {
    return v2;
  }
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45[2] = v5;
  v45[3] = v5;
  v45[0] = v5;
  v45[1] = v5;
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::ARI_CsiMSimGetSimStackMappingStatusReq_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *)v45);
  char v43 = 0;
  uint64_t v44 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v12 = *(void **)(a1 + 8);
  if (v12 || !*(_DWORD *)(a1 + 16))
  {
    uint64_t v13 = *v43;
    uint64_t v14 = v43[1] - *v43;
    uint64_t v15 = *(unsigned int *)(a1 + 20);
    LODWORD(v39) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v6, v7, v8, v9, v10, v11, v14);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, ktl::KTLPacket **, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v39, 1, v15, 0), v39 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v39 = 0;
      if (KTLUTACopyReceiveData(a1, (uint64_t *)&v39)) {
        uint64_t v2 = KTLIsBBSimStackMappingEnabledParseAndRelease(v39, a2);
      }
      else {
        uint64_t v2 = 0;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
      uint64_t v2 = 0;
    }
    goto LABEL_26;
  }
  char v24 = dispatch_semaphore_create(0);
  uint64_t v25 = v24;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2000000000;
  char v42 = 0;
  dispatch_object_t object = v24;
  if (v24) {
    dispatch_retain(v24);
  }
  if (AriHost::Send())
  {
    uint64_t v32 = "Failed to send message CsiMSimGetSimStackMappingStatusReq.\n";
    goto LABEL_22;
  }
  dispatch_time_t v33 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v25, v33))
  {
    uint64_t v32 = "Timeout waiting for response.\n";
LABEL_22:
    _KTLErrorPrint((uint64_t)"KTLIsBBSimStackMappingEnabled", (uint64_t)v32, v26, v27, v28, v29, v30, v31, v37);
    uint64_t v2 = 0;
    uint64_t v34 = object;
    if (!object) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  uint64_t v2 = *((unsigned char *)v40 + 24) != 0;
  uint64_t v34 = object;
  if (object) {
LABEL_23:
  }
    dispatch_release(v34);
LABEL_24:
  _Block_object_dispose(&v39, 8);
  if (v25) {
    dispatch_release(v25);
  }
LABEL_26:
  uint64_t v35 = v44;
  if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
    std::__shared_weak_count::__release_weak(v35);
  }
  MEMORY[0x21D4AC110](v45);
  return v2;
}

void sub_21C656718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a19, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
      MEMORY[0x21D4AC110](&a25);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a19, 8);
    if (!v25) {
      goto LABEL_3;
    }
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x21D4AC110](&a25);
  _Unwind_Resume(a1);
}

void sub_21C656780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va1, a15);
  va_start(va, a15);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  MEMORY[0x21D4AC110](va1);
  _Unwind_Resume(a1);
}

uint64_t __KTLIsBBSimStackMappingEnabled_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLIsBBSimStackMappingEnabledParseAndRelease((ktl::KTLPacket *)v6, *(BOOL **)(a1 + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 0;
}

void sub_21C65684C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLIsBBSimStackMappingEnabledParseAndRelease(ktl::KTLPacket *a1, BOOL *a2)
{
  uint64_t v21 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  long long v5 = (const unsigned __int8 *)(*(uint64_t (**)(ktl::KTLPacket *))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384)
  {
    _KTLDebugPrint((uint64_t)"KTLIsBBSimStackMappingEnabledParseAndRelease", (uint64_t)"Not supported\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  }
  else
  {
    if (!AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::unpack((AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *)v20))
    {
      *a2 = *v21 != 0;
      uint64_t v18 = 1;
      goto LABEL_6;
    }
    _KTLErrorPrint((uint64_t)"KTLIsBBSimStackMappingEnabledParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  }
  uint64_t v18 = 0;
LABEL_6:
  (*(void (**)(ktl::KTLPacket *))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4AC160](v20);
  return v18;
}

BOOL KTLGetSimStackMapping(uint64_t a1, uint64_t a2)
{
  BOOL v2 = 0;
  if (!a1 || !a2) {
    return v2;
  }
  int v52 = -1;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v51[2] = v5;
  v51[3] = v5;
  v51[0] = v5;
  v51[1] = v5;
  AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::ARI_IBIMSimGetSimStackMappingReq_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *)v51);
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v12 = *(void **)(a1 + 8);
  if (!v12 && *(_DWORD *)(a1 + 16))
  {
    uint64_t v28 = dispatch_semaphore_create(0);
    uint64_t v29 = v28;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2000000000;
    char v48 = 0;
    uint64_t v41 = 0;
    char v42 = &v41;
    uint64_t v43 = 0x2000000000;
    int v44 = -1;
    dispatch_object_t object = v28;
    if (v28) {
      dispatch_retain(v28);
    }
    if (AriHost::Send())
    {
      uint64_t v36 = "Failed to send message IBIMSimGetSimStackMappingReq.\n";
    }
    else
    {
      dispatch_time_t v37 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v29, v37))
      {
        BOOL v24 = *((unsigned char *)v46 + 24) != 0;
        int v25 = *((_DWORD *)v42 + 6);
        int v52 = v25;
        uint64_t v38 = object;
        if (!object)
        {
LABEL_32:
          _Block_object_dispose(&v41, 8);
          _Block_object_dispose(&v45, 8);
          if (v29) {
            dispatch_release(v29);
          }
          goto LABEL_15;
        }
LABEL_31:
        dispatch_release(v38);
        goto LABEL_32;
      }
      uint64_t v36 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetSimStackMapping", (uint64_t)v36, v30, v31, v32, v33, v34, v35, v39);
    BOOL v24 = 0;
    int v25 = -1;
    uint64_t v38 = object;
    if (!object) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  uint64_t v13 = *v49;
  uint64_t v14 = v49[1] - *v49;
  uint64_t v15 = *(unsigned int *)(a1 + 20);
  LODWORD(v45) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v6, v7, v8, v9, v10, v11, v14);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v13);
  }
  if (!*v12
    || ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v45, 1, v15, 0), v45 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    goto LABEL_14;
  }
  uint64_t v45 = 0;
  if (!KTLUTACopyReceiveData(a1, &v45))
  {
LABEL_14:
    BOOL v24 = 0;
    int v25 = -1;
    goto LABEL_15;
  }
  BOOL v24 = KTLGetSimStackMappingParseAndRelease(v45, &v52, a2);
  int v25 = v52;
LABEL_15:
  if (v25) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = v24;
  }
  uint64_t v26 = v50;
  if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  MEMORY[0x21D4AC000](v51);
  return v2;
}

void sub_21C656CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  if (v27)
  {
    dispatch_release(v27);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
    MEMORY[0x21D4AC000](v28 - 144);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  MEMORY[0x21D4AC000](v28 - 144);
  _Unwind_Resume(a1);
}

uint64_t __KTLGetSimStackMapping_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLGetSimStackMappingParseAndRelease((uint64_t)v6, (_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), *(void *)(a1 + 48));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C656DE0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetSimStackMappingParseAndRelease(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[3] = v6;
  long long v25 = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  uint64_t v7 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::ARI_IBIMSimGetSimStackMappingRspCb_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *)v24, v7);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v24) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLGetSimStackMappingParseAndRelease", (uint64_t)"NACK Received\n", v8, v9, v10, v11, v12, v13, *(uint64_t *)&v24[0]);
  }
  int v20 = AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::unpack((AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *)v24);
  if (v20)
  {
    _KTLErrorPrint((uint64_t)"KTLGetSimStackMappingParseAndRelease", (uint64_t)"Failed to unpack response.\n", v14, v15, v16, v17, v18, v19, *(uint64_t *)&v24[0]);
  }
  else
  {
    uint64_t v21 = *((void *)&v25 + 1);
    *a2 = *(_DWORD *)v25;
    int v22 = *(_DWORD *)(v21 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v21;
    *(_DWORD *)(a3 + 16) = v22;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4AC0B0](v24);
  return v20 == 0;
}

void __copy_helper_block_e8_32r40r56c25_ZTSN8dispatch9semaphoreE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  long long v4 = *(NSObject **)(a2 + 56);
  a1[7] = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r40r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  BOOL v2 = *(NSObject **)(a1 + 56);
  if (v2) {
    dispatch_release(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL KTLGetSimTrayStatus(uint64_t a1, int a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatus", (uint64_t)"opt(%p) or respParam(%p) is NULL\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v54[2] = v11;
  v54[3] = v11;
  v54[0] = v11;
  v54[1] = v11;
  AriSdk::ARI_IBISimTrayStatusReq_SDK::ARI_IBISimTrayStatusReq_SDK((AriSdk::ARI_IBISimTrayStatusReq_SDK *)v54);
  uint64_t v12 = operator new(4uLL);
  *uint64_t v12 = a2;
  uint64_t v13 = __p;
  __p = v12;
  if (v13) {
    operator delete(v13);
  }
  int v52 = 0;
  unsigned int v53 = 0;
  AriSdk::MsgBase::getRawBytes();
  int v20 = *(void **)(a1 + 8);
  if (v20 || !*(_DWORD *)(a1 + 16))
  {
    uint64_t v21 = *v52;
    uint64_t v22 = v52[1] - *v52;
    uint64_t v23 = *(unsigned int *)(a1 + 20);
    LODWORD(v48) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v14, v15, v16, v17, v18, v19, v22);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v21);
    }
    if (*v20
      && ((v30 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v20)(v20, v21, v22, &v48, 1, v23, 0), v48 == v22)? (char v31 = v30): (char v31 = 0), (v31 & 1) != 0))
    {
      uint64_t v48 = 0;
      if (KTLUTACopyReceiveData(a1, &v48)) {
        BOOL v32 = KTLGetSimTrayStatusParseAndRelease(v48, a3);
      }
      else {
        BOOL v32 = 0;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v24, v25, v26, v27, v28, v29, v22);
      BOOL v32 = 0;
    }
    goto LABEL_29;
  }
  uint64_t v33 = dispatch_semaphore_create(0);
  uint64_t v34 = v33;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2000000000;
  char v51 = 0;
  dispatch_object_t object = v33;
  if (v33) {
    dispatch_retain(v33);
  }
  if (AriHost::Send())
  {
    uint64_t v41 = "Failed to send the message of IBISimTrayStatusReq.\n";
    goto LABEL_25;
  }
  dispatch_time_t v42 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v34, v42))
  {
    uint64_t v41 = "Timeout waiting for response.\n";
LABEL_25:
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatus", (uint64_t)v41, v35, v36, v37, v38, v39, v40, v46);
    BOOL v32 = 0;
    uint64_t v43 = object;
    if (!object) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  BOOL v32 = *((unsigned char *)v49 + 24) != 0;
  uint64_t v43 = object;
  if (object) {
LABEL_26:
  }
    dispatch_release(v43);
LABEL_27:
  _Block_object_dispose(&v48, 8);
  if (v34) {
    dispatch_release(v34);
  }
LABEL_29:
  int v44 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  MEMORY[0x21D4ABB00](v54);
  return v32;
}

void sub_21C657328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a19, 8);
  if (v25)
  {
    dispatch_release(v25);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
    MEMORY[0x21D4ABB00](&a25);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x21D4ABB00](&a25);
  _Unwind_Resume(a1);
}

uint64_t __KTLGetSimTrayStatus_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  long long v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)long long v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLGetSimTrayStatusParseAndRelease((uint64_t)v6, *(_DWORD **)(a1 + 48));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C657448(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetSimTrayStatusParseAndRelease(uint64_t a1, _DWORD *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[3] = v4;
  long long v21 = v4;
  v20[1] = v4;
  v20[2] = v4;
  v20[0] = v4;
  long long v5 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_IBISimTrayStatusRspCb_SDK::ARI_IBISimTrayStatusRspCb_SDK((AriSdk::ARI_IBISimTrayStatusRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatusParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  }
  int v18 = AriSdk::ARI_IBISimTrayStatusRspCb_SDK::unpack((AriSdk::ARI_IBISimTrayStatusRspCb_SDK *)v20);
  if (v18) {
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatusParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  }
  else {
    *a2 = **((_DWORD **)&v21 + 1);
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABCC0](v20);
  return v18 == 0;
}

BOOL KTLGetCurrentBootState(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2)
  {
    _KTLErrorPrint((uint64_t)"KTLGetCurrentBootState", (uint64_t)"opt(%p) or bootState(%p) is NULL\n", a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v59[2] = v10;
  v59[3] = v10;
  v59[0] = v10;
  v59[1] = v10;
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)v59);
  uint64_t v57 = 0;
  int v58 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v17 = *(void **)(a1 + 8);
  if (!v17 && *(_DWORD *)(a1 + 16))
  {
    uint64_t v37 = dispatch_semaphore_create(0);
    uint64_t v38 = v37;
    uint64_t v53 = 0;
    unsigned int v54 = &v53;
    uint64_t v55 = 0x2000000000;
    char v56 = 0;
    dispatch_object_t object = v37;
    if (v37) {
      dispatch_retain(v37);
    }
    if (AriHost::Send())
    {
      uint64_t v45 = "Failed to send command\n";
    }
    else
    {
      dispatch_time_t v46 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v38, v46))
      {
        BOOL v35 = *((unsigned char *)v54 + 24) != 0;
        uint64_t v47 = object;
        if (!object)
        {
LABEL_26:
          _Block_object_dispose(&v53, 8);
          if (v38) {
            dispatch_release(v38);
          }
          goto LABEL_30;
        }
LABEL_25:
        dispatch_release(v47);
        goto LABEL_26;
      }
      uint64_t v45 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetCurrentBootState", (uint64_t)v45, v39, v40, v41, v42, v43, v44, v50);
    BOOL v35 = 0;
    uint64_t v47 = object;
    if (!object) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v18 = *v57;
  uint64_t v19 = v57[1] - *v57;
  uint64_t v20 = *(unsigned int *)(a1 + 20);
  LODWORD(v53) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v11, v12, v13, v14, v15, v16, v19);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v18);
  }
  if (*v17
    && ((char v27 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v17)(v17, v18, v19, &v53, 1, v20, 0), v53 == v19)? (v28 = v27): (v28 = 0), (v28 & 1) != 0))
  {
    uint64_t v53 = 0;
    if (KTLUTACopyReceiveData(a1, &v53))
    {
      if (KTLGetCurrentBootStateParseAndRelease(v53, a1, a2, v30, v31, v32, v33, v34))
      {
        BOOL v35 = 1;
        goto LABEL_30;
      }
      uint64_t v36 = "Failed to parse response.\n";
    }
    else
    {
      uint64_t v36 = "Failed to copy received data.\n";
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v21, v22, v23, v24, v25, v26, v19);
    uint64_t v36 = "Failed to send raw data.\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetCurrentBootState", (uint64_t)v36, v29, v30, v31, v32, v33, v34, v51);
  BOOL v35 = 0;
LABEL_30:
  uint64_t v48 = v58;
  if (v58 && !atomic_fetch_add(&v58->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
  MEMORY[0x21D4ABED0](v59);
  return v35;
}

void sub_21C6578C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a19, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
      MEMORY[0x21D4ABED0](&a25);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a19, 8);
    if (!v25) {
      goto LABEL_3;
    }
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x21D4ABED0](&a25);
  _Unwind_Resume(a1);
}

void sub_21C657930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va1, a15);
  va_start(va, a15);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  MEMORY[0x21D4ABED0](va1);
  _Unwind_Resume(a1);
}

uint64_t __KTLGetCurrentBootState_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLGetCurrentBootStateParseAndRelease((uint64_t)v6, *(void *)(a1 + 40), *(_DWORD **)(a1 + 48), v8, v9, v10, v11, v12);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_21C6579FC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLGetCurrentBootStateParseAndRelease(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetCurrentBootStateParseAndRelease", (uint64_t)"pkt(%p) or opt(%p) or bootState(%p) is NULL\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  uint64_t v23 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[2] = v10;
  v22[3] = v10;
  v22[0] = v10;
  v22[1] = v10;
  uint64_t v11 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v22, v11);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v22) == 67600384)
  {
    uint64_t v18 = "NACK Received\n";
  }
  else
  {
    if (!AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v22))
    {
      *a3 = *v23;
      uint64_t v20 = 1;
      goto LABEL_10;
    }
    uint64_t v18 = "Malformed response\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetCurrentBootStateParseAndRelease", (uint64_t)v18, v12, v13, v14, v15, v16, v17, v21);
  uint64_t v20 = 0;
LABEL_10:
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABF60](v22);
  return v20;
}

BOOL KTLGetFactGetTestReadyState(uint64_t a1, BOOL *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyState", (uint64_t)"opt(%p) or allReady(%p) or moduleStatus(%p) is NULL\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v60[2] = v11;
  v60[3] = v11;
  v60[1] = v11;
  v60[0] = v11;
  AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::ARI_CsiFactGetTestReadyStateReq_SDK((AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *)v60);
  int v58 = 0;
  uint64_t v59 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v18 = *(void **)(a1 + 8);
  if (!v18 && *(_DWORD *)(a1 + 16))
  {
    uint64_t v38 = dispatch_semaphore_create(0);
    uint64_t v39 = v38;
    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x2000000000;
    char v57 = 0;
    dispatch_object_t object = v38;
    if (v38) {
      dispatch_retain(v38);
    }
    if (AriHost::Send())
    {
      dispatch_time_t v46 = "Failed to send command\n";
    }
    else
    {
      dispatch_time_t v47 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v39, v47))
      {
        BOOL v36 = *((unsigned char *)v55 + 24) != 0;
        uint64_t v48 = object;
        if (!object)
        {
LABEL_27:
          _Block_object_dispose(&v54, 8);
          if (v39) {
            dispatch_release(v39);
          }
          goto LABEL_31;
        }
LABEL_26:
        dispatch_release(v48);
        goto LABEL_27;
      }
      dispatch_time_t v46 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyState", (uint64_t)v46, v40, v41, v42, v43, v44, v45, v51);
    BOOL v36 = 0;
    uint64_t v48 = object;
    if (!object) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  uint64_t v19 = *v58;
  uint64_t v20 = v58[1] - *v58;
  uint64_t v21 = *(unsigned int *)(a1 + 20);
  LODWORD(v54) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v12, v13, v14, v15, v16, v17, v20);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v19);
  }
  if (*v18
    && ((v28 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v18)(v18, v19, v20, &v54, 1, v21, 0), v54 == v20)? (char v29 = v28): (char v29 = 0), (v29 & 1) != 0))
  {
    uint64_t v54 = 0;
    if (KTLUTACopyReceiveData(a1, &v54))
    {
      if (KTLGetFactGetTestReadyStateParseAndRelease(v54, a1, a2, a3, v32, v33, v34, v35))
      {
        BOOL v36 = 1;
        goto LABEL_31;
      }
      uint64_t v37 = "Failed to parse response.\n";
    }
    else
    {
      uint64_t v37 = "Failed to copy received data.\n";
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v22, v23, v24, v25, v26, v27, v20);
    uint64_t v37 = "Failed to send raw data.\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyState", (uint64_t)v37, v30, v31, v32, v33, v34, v35, v52);
  BOOL v36 = 0;
LABEL_31:
  uint64_t v49 = v59;
  if (v59 && !atomic_fetch_add(&v59->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  MEMORY[0x21D4ABF30](v60);
  return v36;
}

void sub_21C657EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a21, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
      MEMORY[0x21D4ABF30](v26 - 128);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a21, 8);
    if (!v25) {
      goto LABEL_3;
    }
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  MEMORY[0x21D4ABF30](v26 - 128);
  _Unwind_Resume(a1);
}

void sub_21C657F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  MEMORY[0x21D4ABF30](v17 - 128);
  _Unwind_Resume(a1);
}

uint64_t __KTLGetFactGetTestReadyState_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLGetFactGetTestReadyStateParseAndRelease((uint64_t)v6, *(void *)(a1 + 40), *(BOOL **)(a1 + 48), *(_DWORD **)(a1 + 56), v8, v9, v10, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  return 0;
}

void sub_21C658000(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLGetFactGetTestReadyStateParseAndRelease(uint64_t a1, uint64_t a2, BOOL *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2 || !a3 || !a4)
  {
    _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyStateParseAndRelease", (uint64_t)"pkt(%p) or opt(%p) or allReady(%p) or moduleStatus(%p) is NULL\n", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a1);
    return 0;
  }
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[3] = v11;
  long long v25 = v11;
  v24[1] = v11;
  v24[2] = v11;
  v24[0] = v11;
  uint64_t v12 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::ARI_CsiFactGetTestReadyStateRspCb_SDK((AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *)v24, v12);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v24) == 67600384)
  {
    uint64_t v19 = "NACK Received\n";
  }
  else
  {
    if (!AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::unpack((AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *)v24))
    {
      uint64_t v22 = (_DWORD *)*((void *)&v25 + 1);
      *a3 = *(_DWORD *)v25 != 0;
      *a4 = *v22;
      uint64_t v21 = 1;
      goto LABEL_11;
    }
    uint64_t v19 = "Malformed response\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyStateParseAndRelease", (uint64_t)v19, v13, v14, v15, v16, v17, v18, v23);
  uint64_t v21 = 0;
LABEL_11:
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4AC030](v24);
  return v21;
}

void __copy_helper_block_e8_32r64c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  long long v4 = *(NSObject **)(a2 + 64);
  *(void *)(a1 + 64) = v4;
  if (v4)
  {
    dispatch_retain(v4);
  }
}

void __destroy_helper_block_e8_32r64c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  BOOL v2 = *(NSObject **)(a1 + 64);
  if (v2) {
    dispatch_release(v2);
  }
  BOOL v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

void *Bsp::ARICommandDriver::ARICommandDriver(void *result, uint64_t a2)
{
  *__n128 result = a2;
  return result;
}

{
  *__n128 result = a2;
  return result;
}

uint64_t Bsp::ARICommandDriver::GetCurrentBootState(Bsp::ARICommandDriver *this, AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *a2, AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *(void *)this;
  uint64_t v12 = *(void **)(*(void *)this + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*(void *)this, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)operator new(0x48uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__94;
  uint64_t v74 = __Block_byref_object_dispose__95;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*(void *)this + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 84312064);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(void))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetCurrentBootState", (uint64_t)"Failed CsiGetCurrentBootStateRspCb\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C6586BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t Bsp::ARICommandDriver::SysGetInfoV2(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *)operator new(0x48uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::ARI_CsiSysGetInfoRspCbV2_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__94;
  uint64_t v74 = __Block_byref_object_dispose__95;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 84410368);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"SysGetInfoV2", (uint64_t)"Failed CsiSysGetInfoRspCbV2\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C658BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t Bsp::ARICommandDriver::GetNvItemsSetting(uint64_t *a1, uint64_t a2, AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        uint64_t v33 = (AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *)operator new(0x58uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::ARI_FactoryGetNvItemsSettingRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__94;
  uint64_t v74 = __Block_byref_object_dispose__95;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4177625088);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetNvItemsSetting", (uint64_t)"Failed FactoryGetNvItemsSettingRspCb\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C6590C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__95(uint64_t a1)
{
  int v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk35ARI_CsiGetCurrentBootStateRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)operator new(0x48uLL);
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6591DC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_CsiSysGetInfoRspCbV2_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *)operator new(0x48uLL);
  AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::ARI_CsiSysGetInfoRspCbV2_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C659254(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk37ARI_FactoryGetNvItemsSettingRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::ARI_FactoryGetNvItemsSettingRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C6592CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

long long *KTLGetKDMProductName(void)
{
  uint64_t HardwareModel = _MergedGlobals;
  if (_MergedGlobals)
  {
    if ((_BYTE)xmmword_267C8BC88) {
      return &xmmword_267C8BC88;
    }
  }
  else
  {
    uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals = HardwareModel;
    if ((_BYTE)xmmword_267C8BC88) {
      return &xmmword_267C8BC88;
    }
  }
  xmmword_267C8BD68 = 0u;
  unk_267C8BD78 = 0u;
  xmmword_267C8BD48 = 0u;
  unk_267C8BD58 = 0u;
  xmmword_267C8BD28 = 0u;
  unk_267C8BD38 = 0u;
  xmmword_267C8BD08 = 0u;
  unk_267C8BD18 = 0u;
  xmmword_267C8BCE8 = 0u;
  unk_267C8BCF8 = 0u;
  xmmword_267C8BCC8 = 0u;
  unk_267C8BCD8 = 0u;
  xmmword_267C8BCA8 = 0u;
  unk_267C8BCB8 = 0u;
  xmmword_267C8BC88 = 0u;
  unk_267C8BC98 = 0u;
  if (HardwareModel
    && snprintf((char *)&xmmword_267C8BC88, 0xFFuLL, "%c%d%c", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, *(char *)(HardwareModel + 5)) > 254)
  {
    return 0;
  }
  return &xmmword_267C8BC88;
}

unint64_t KTLGetKDMFilename@<X0>(const char *a1@<X0>, char *a2@<X8>)
{
  return sKTLGetFileName(a2, a1, "kdm");
}

unint64_t sKTLGetFileName(char *a1, const char *a2, const char *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__str = 0u;
  long long v14 = 0u;
  uint64_t HardwareModel = _MergedGlobals;
  if (_MergedGlobals)
  {
    if ((_BYTE)xmmword_267C8BC88) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals = HardwareModel;
    if ((_BYTE)xmmword_267C8BC88) {
      goto LABEL_8;
    }
  }
  xmmword_267C8BD68 = 0u;
  unk_267C8BD78 = 0u;
  xmmword_267C8BD48 = 0u;
  unk_267C8BD58 = 0u;
  xmmword_267C8BD28 = 0u;
  unk_267C8BD38 = 0u;
  xmmword_267C8BD08 = 0u;
  unk_267C8BD18 = 0u;
  xmmword_267C8BCE8 = 0u;
  unk_267C8BCF8 = 0u;
  xmmword_267C8BCC8 = 0u;
  unk_267C8BCD8 = 0u;
  xmmword_267C8BCA8 = 0u;
  unk_267C8BCB8 = 0u;
  xmmword_267C8BC88 = 0u;
  unk_267C8BC98 = 0u;
  if (HardwareModel
    && snprintf((char *)&xmmword_267C8BC88, 0xFFuLL, "%c%d%c", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, *(char *)(HardwareModel + 5)) > 254)
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v7 = (const char *)&xmmword_267C8BC88;
LABEL_9:
  unint64_t result = snprintf(__str, 0xFFuLL, "%s%s%s.%s", v7, "_", a2, a3);
  if ((int)result > 254)
  {
    a1[23] = 0;
    *a1 = 0;
    return result;
  }
  unint64_t result = strlen(__str);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v9 = result;
  if (result >= 0x17)
  {
    uint64_t v10 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v10 = result | 7;
    }
    uint64_t v11 = v10 + 1;
    uint64_t v12 = (const char *)operator new(v10 + 1);
    *((void *)a1 + 1) = v9;
    *((void *)a1 + 2) = v11 | 0x8000000000000000;
    *(void *)a1 = v12;
    a1 = (char *)v12;
  }
  else
  {
    a1[23] = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  unint64_t result = (unint64_t)memcpy(a1, __str, v9);
LABEL_19:
  a1[v9] = 0;
  return result;
}

void KTLGetKeyword(const char *a1@<X0>, std::string *a2@<X8>)
{
  v31.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v30 = v3;
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v3;
  long long v28 = v3;
  long long v29 = v3;
  strlen(a1);
  ctu::partition();
  memset(&v27, 170, sizeof(v27));
  if (SBYTE7(v29) < 0)
  {
    std::string::__init_copy_ctor_external(&v27, (const std::string::value_type *)v28, *((std::string::size_type *)&v28 + 1));
  }
  else
  {
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v28;
    v27.__r_.__value_.__r.__words[2] = v29;
  }
  std::string::size_type size = HIBYTE(v27.__r_.__value_.__r.__words[2]);
  int v5 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v27.__r_.__value_.__l.__size_;
  }
  if (!size) {
    goto LABEL_39;
  }
  memset(__dst, 170, sizeof(__dst));
  uint64_t HardwareModel = _MergedGlobals;
  if (_MergedGlobals)
  {
    if ((_BYTE)xmmword_267C8BC88) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals = HardwareModel;
    if ((_BYTE)xmmword_267C8BC88) {
      goto LABEL_14;
    }
  }
  xmmword_267C8BD68 = 0u;
  unk_267C8BD78 = 0u;
  xmmword_267C8BD48 = 0u;
  unk_267C8BD58 = 0u;
  xmmword_267C8BD28 = 0u;
  unk_267C8BD38 = 0u;
  xmmword_267C8BD08 = 0u;
  unk_267C8BD18 = 0u;
  xmmword_267C8BCE8 = 0u;
  unk_267C8BCF8 = 0u;
  xmmword_267C8BCC8 = 0u;
  unk_267C8BCD8 = 0u;
  xmmword_267C8BCA8 = 0u;
  unk_267C8BCB8 = 0u;
  xmmword_267C8BC88 = 0u;
  unk_267C8BC98 = 0u;
  if (HardwareModel
    && snprintf((char *)&xmmword_267C8BC88, 0xFFuLL, "%c%d%c", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, *(char *)(HardwareModel + 5)) > 254)
  {
    uint64_t v7 = 0;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = (const char *)&xmmword_267C8BC88;
LABEL_15:
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v9 = v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v10 = operator new(v11 + 1);
    __dst[1] = v9;
    void __dst[2] = v12 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_22;
  }
  HIBYTE(__dst[2]) = v8;
  uint64_t v10 = __dst;
  if (v8) {
LABEL_22:
  }
    memcpy(v10, v7, v9);
  *((unsigned char *)v10 + v9) = 0;
  int v5 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
  std::string::size_type v13 = HIBYTE(__dst[2]);
  int v14 = SHIBYTE(__dst[2]);
  long long v15 = (void *)__dst[0];
  if (__dst[2] >= 0) {
    long long v16 = (const char *)__dst;
  }
  else {
    long long v16 = (const char *)__dst[0];
  }
  if (__dst[2] < 0) {
    std::string::size_type v13 = __dst[1];
  }
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v17 = &v27;
  }
  else {
    long long v17 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  std::string::size_type v18 = HIBYTE(v27.__r_.__value_.__r.__words[2]);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v18 = v27.__r_.__value_.__l.__size_;
  }
  if (v13 <= v18) {
    size_t v19 = v18;
  }
  else {
    size_t v19 = v13;
  }
  if (strncasecmp((const char *)v17, v16, v19)) {
    goto LABEL_37;
  }
  memset(&v25, 170, sizeof(v25));
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v25, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  }
  else {
    std::string v25 = v31;
  }
  char v20 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v21 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v21 = v25.__r_.__value_.__l.__size_;
  }
  if (!v21)
  {
LABEL_63:
    if (v20 < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
LABEL_37:
    if (v14 < 0) {
      operator delete(v15);
    }
LABEL_39:
    *((unsigned char *)&a2->__r_.__value_.__s + 23) = 0;
    a2->__r_.__value_.__s.__data_[0] = 0;
    goto LABEL_40;
  }
  *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long v23 = v22;
  *(_OWORD *)long long v24 = v22;
  ctu::partition();
  memset(a2, 170, sizeof(std::string));
  if (SHIBYTE(v24[0]) < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)v23[0], (std::string::size_type)v23[1]);
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)v23;
    a2->__r_.__value_.__r.__words[2] = (std::string::size_type)v24[0];
  }
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
  {
    if (!a2->__r_.__value_.__l.__size_)
    {
      operator delete(a2->__r_.__value_.__l.__data_);
LABEL_75:
      operator delete((void *)0xAAAAAAAAAAAAAAAALL);
      operator delete(v24[1]);
      if (SHIBYTE(v24[0]) < 0) {
        operator delete(v23[0]);
      }
      char v20 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
      goto LABEL_63;
    }
  }
  else if (!*((unsigned char *)&a2->__r_.__value_.__s + 23))
  {
    goto LABEL_75;
  }
  operator delete((void *)0xAAAAAAAAAAAAAAAALL);
  operator delete(v24[1]);
  if (SHIBYTE(v24[0]) < 0)
  {
    operator delete(v23[0]);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    {
LABEL_72:
      operator delete(v25.__r_.__value_.__l.__data_);
      if ((v14 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_73;
    }
  }
  else if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
  {
    goto LABEL_72;
  }
  if ((v14 & 0x80000000) == 0) {
    goto LABEL_40;
  }
LABEL_73:
  operator delete(v15);
LABEL_40:
  if (v5 < 0)
  {
    operator delete(v27.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_42:
      if ((SHIBYTE(v30) & 0x80000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_47;
    }
  }
  else if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_42;
  }
  operator delete(v31.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v30) & 0x80000000) == 0)
  {
LABEL_43:
    if ((SBYTE7(v29) & 0x80000000) == 0) {
      return;
    }
LABEL_48:
    operator delete((void *)v28);
    return;
  }
LABEL_47:
  operator delete(*((void **)&v29 + 1));
  if (SBYTE7(v29) < 0) {
    goto LABEL_48;
  }
}

void sub_21C6599EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  std::tuple<std::string,std::string,std::string>::~tuple((uint64_t)&a13);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((v33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((v34 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((v33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(v32);
  if ((v34 & 0x80000000) == 0)
  {
LABEL_4:
    std::tuple<std::string,std::string,std::string>::~tuple(v35 - 144);
    _Unwind_Resume(a1);
  }
LABEL_7:
  operator delete(a32);
  std::tuple<std::string,std::string,std::string>::~tuple(v35 - 144);
  _Unwind_Resume(a1);
}

uint64_t std::tuple<std::string,std::string,std::string>::~tuple(uint64_t a1)
{
  if ((*(char *)(a1 + 71) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
    goto LABEL_7;
  }
  operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
    return a1;
  }
LABEL_7:
  operator delete(*(void **)a1);
  return a1;
}

unint64_t KTLGetETBFilename@<X0>(const char *a1@<X0>, char *a2@<X8>)
{
  return sKTLGetFileName(a2, a1, "etb");
}

uint64_t KTLGetMaskFileExtensionName@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  switch(result)
  {
    case 2:
      *(unsigned char *)(a2 + 23) = 3;
      *(_WORD *)a2 = 26211;
      *(unsigned char *)(a2 + 2) = 103;
      break;
    case 1:
      *(unsigned char *)(a2 + 23) = 3;
      *(_WORD *)a2 = 29797;
      *(unsigned char *)(a2 + 2) = 98;
      break;
    case 0:
      *(unsigned char *)(a2 + 23) = 3;
      *(_WORD *)a2 = 25707;
      *(unsigned char *)(a2 + 2) = 109;
      break;
  }
  return result;
}

unint64_t KTLGetTraceConfigFilename@<X0>(const char *a1@<X0>, char *a2@<X8>)
{
  return sKTLGetFileName(a2, a1, "cfg");
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    size_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void *hsfiler::ARICommandDriver::ARICommandDriver(void *result, uint64_t a2)
{
  *unint64_t result = a2;
  return result;
}

{
  *unint64_t result = a2;
  return result;
}

uint64_t hsfiler::ARICommandDriver::StartReadSession(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        int v33 = (AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *)operator new(0x50uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__7;
  uint64_t v74 = __Block_byref_object_dispose__7;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178509824);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"StartReadSession", (uint64_t)"Failed IBIFilerHSStartReadBBSessionReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65A0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::GetReadSize(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        int v33 = (AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *)operator new(0x58uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__7;
  uint64_t v74 = __Block_byref_object_dispose__7;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178542592);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"GetReadSize", (uint64_t)"Failed IBIFilerHSReadBBGetSizeReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65A5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::ReadFileFromBB(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        int v33 = (AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *)operator new(0x58uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::ARI_IBIFilerHSReadBBRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__7;
  uint64_t v74 = __Block_byref_object_dispose__7;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178575360);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"ReadFileFromBB", (uint64_t)"Failed IBIFilerHSReadBBReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65AAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::StartWriteSession(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        int v33 = (AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *)operator new(0x50uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__7;
  uint64_t v74 = __Block_byref_object_dispose__7;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178608128);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"StartWriteSession", (uint64_t)"Failed IBIFilerHSStartWriteBBSessionReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65AFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::WriteFileToBB(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        int v33 = (AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *)operator new(0x50uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::ARI_IBIFilerHSWriteBBRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__7;
  uint64_t v74 = __Block_byref_object_dispose__7;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178640896);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"WriteFileToBB", (uint64_t)"Failed IBIFilerHSWriteBBReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65B4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::EndSession(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        int v33 = (AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *)operator new(0x50uLL);
        int v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::ARI_IBIFilerHSEndBBSessionRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    uint64_t v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__7;
  uint64_t v74 = __Block_byref_object_dispose__7;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    int v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  int v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178673664);
      goto LABEL_17;
    }
    uint64_t v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"EndSession", (uint64_t)"Failed IBIFilerHSEndBBSessionReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65B9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  int v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk41ARI_IBIFilerHSStartReadBBSessionRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65BAFC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk36ARI_IBIFilerHSReadBBGetSizeRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65BB74(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk29ARI_IBIFilerHSReadBBRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::ARI_IBIFilerHSReadBBRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65BBEC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk42ARI_IBIFilerHSStartWriteBBSessionRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65BC64(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk30ARI_IBIFilerHSWriteBBRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::ARI_IBIFilerHSWriteBBRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65BCDC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk35ARI_IBIFilerHSEndBBSessionRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  long long v4 = (AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::ARI_IBIFilerHSEndBBSessionRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65BD54(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLCpsGetSvn(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10[3] = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  memset(v10, 170, 24);
  BOOL result = KTLGetIMEIInfo(a1, 0, (uint64_t)v10, a4, a5, a6, a7, a8);
  *a2 = (BYTE4(v10[2]) & 0xF) + 10 * (BYTE3(v10[2]) >> 4);
  return result;
}

BOOL KTLCpsSetSvn(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  unsigned int v33 = v2;
  int v34 = 1;
  if (!a2) {
    return 0;
  }
  if (*(void *)(a1 + 8)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (!v4)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2000000000;
    int v32 = 1;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2000000000;
    int v28 = -1;
    uint64_t v12 = dispatch_semaphore_create(0);
    uint64_t v13 = v12;
    dispatch_object_t object = v12;
    if (v12) {
      dispatch_retain(v12);
    }
    if (ARI_UtaMsCpsSetSvnReq_BLK())
    {
      BOOL v9 = 0;
      int v10 = *((_DWORD *)v30 + 6);
      uint64_t v14 = object;
      if (!object) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_time_t v15 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      intptr_t v22 = dispatch_semaphore_wait(v13, v15);
      if (v22) {
        _KTLErrorPrint((uint64_t)"KTLCpsSetSvn", (uint64_t)"Timeout waiting for response.\n", v16, v17, v18, v19, v20, v21, v23);
      }
      if (v33) {
        AriHost::ExitTrx((AriHost *)v33);
      }
      int v10 = *((_DWORD *)v30 + 6);
      if (v22)
      {
        BOOL v9 = 0;
        uint64_t v14 = object;
        if (!object)
        {
LABEL_25:
          if (v13) {
            dispatch_release(v13);
          }
          _Block_object_dispose(&v25, 8);
          _Block_object_dispose(&v29, 8);
          return !v10 && v9;
        }
      }
      else
      {
        BOOL v9 = *((_DWORD *)v26 + 6) == 0;
        uint64_t v14 = object;
        if (!object) {
          goto LABEL_25;
        }
      }
    }
    dispatch_release(v14);
    goto LABEL_25;
  }
  uint64_t v25 = 0;
  int v35 = 0;
  unsigned int v36 = v2;
  uint64_t v29 = 0;
  if (!ARI_UtaMsCpsSetSvnReq_ENC()
    && (uint64_t v5 = operator new(0x18uLL),
        uint64_t v6 = v29,
        v5[2] = v35,
        *((void *)v5 + 2) = v6,
        *(void *)uint64_t v5 = &unk_26CCDD1F8,
        KTLUTASendAndReleaseData(a1, v5))
    && KTLUTACopyReceiveData(a1, &v25))
  {
    uint64_t v7 = v25;
    (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
    int v8 = ARI_AriUtaMsCpsSetSvnRspCb_Extract();
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    BOOL v9 = v8 == 0;
    int v10 = v34;
  }
  else
  {
    BOOL v9 = 0;
    int v10 = 1;
  }
  return !v10 && v9;
}

void sub_21C65C0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (object) {
    dispatch_release(object);
  }
  if (v21) {
    dispatch_release(v21);
  }
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLCpsSetSvn_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_AriUtaMsCpsSetSvnRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t KTLCpsPriWrite(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, char *a5, uint64_t a6, char *a7, uint64_t a8, unsigned __int8 a9)
{
  if (!a1 || !a4)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"opt(%p) or filerId(%p) is NULL\n", a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a1);
    return 0;
  }
  unsigned int v11 = a6;
  if (a6 >= 0x401)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"PRI signature size (%u) larger than max allowed (%d)", a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a6);
    return 0;
  }
  unsigned int v14 = a8;
  if (a8 >= 0x65)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"Carrier bundle name length (%u) larger than max allowed (%d)", a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a8);
    return 0;
  }
  int v17 = a3;
  uint64_t v106 = 0;
  uint64_t v107 = &v106;
  uint64_t v108 = 0x2000000000;
  int v109 = 0xFFFF;
  uint64_t v102 = 0;
  uint64_t v103 = &v102;
  uint64_t v104 = 0x2000000000;
  int v105 = 0x7FFFFFFF;
  uint64_t v98 = 0;
  uint64_t v99 = &v98;
  uint64_t v100 = 0x2000000000;
  int v101 = -1;
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v96 = v19;
  *(_OWORD *)uint64_t v97 = v19;
  *(_OWORD *)uint64_t __dst = v19;
  long long v95 = v19;
  v92[3] = v19;
  *(_OWORD *)__p = v19;
  v92[1] = v19;
  v92[2] = v19;
  v92[0] = v19;
  AriSdk::ARI_IBIPriWriteReq_V2_SDK::ARI_IBIPriWriteReq_V2_SDK((AriSdk::ARI_IBIPriWriteReq_V2_SDK *)v92);
  uint64_t v20 = operator new(4uLL);
  *uint64_t v20 = a2;
  uint64_t v21 = __p[0];
  __p[0] = v20;
  if (v21) {
    operator delete(v21);
  }
  intptr_t v22 = operator new(4uLL);
  *intptr_t v22 = v17;
  uint64_t v23 = __p[1];
  __p[1] = v22;
  if (v23) {
    operator delete(v23);
  }
  int v24 = operator new(2uLL);
  *int v24 = v11;
  uint64_t v25 = __dst[0];
  __dst[0] = v24;
  if (v25) {
    operator delete(v25);
  }
  if (a5)
  {
    size_t v26 = v11;
    unint64_t v27 = *((void *)&v95 + 1);
    int v28 = (char *)__dst[1];
    if (*((void *)&v95 + 1) - (unint64_t)__dst[1] >= v11)
    {
      uint64_t v33 = v95 - (unint64_t)__dst[1];
      if ((unint64_t)v95 - (unint64_t)__dst[1] >= v11)
      {
        if (v11) {
          memmove(__dst[1], a5, v11);
        }
        int v32 = &v28[v11];
      }
      else
      {
        int v34 = &a5[v11];
        int v35 = &a5[v33];
        if ((void *)v95 != __dst[1])
        {
          memmove(__dst[1], a5, v95 - (unint64_t)__dst[1]);
          int v34 = &a5[v26];
          int v28 = (char *)v95;
        }
        int64_t v36 = v34 - v35;
        if (v33 != v26) {
          memmove(v28, v35, v34 - v35);
        }
        int v32 = &v28[v36];
      }
    }
    else
    {
      if (__dst[1])
      {
        *(void **)&long long v95 = __dst[1];
        operator delete(__dst[1]);
        unint64_t v27 = 0;
        __dst[1] = 0;
        long long v95 = 0uLL;
      }
      uint64_t v29 = 2 * v27;
      if (2 * v27 <= v11) {
        uint64_t v29 = v11;
      }
      if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v30 = v29;
      }
      uint64_t v31 = (char *)operator new(v30);
      __dst[1] = v31;
      *((void *)&v95 + 1) = &v31[v30];
      memcpy(v31, a5, v26);
      int v32 = &v31[v26];
    }
    *(void *)&long long v95 = v32;
  }
  if (a7)
  {
    size_t v37 = v14;
    unint64_t v38 = (unint64_t)v97[0];
    uint64_t v39 = (char *)v96[0];
    if ((void *)((char *)v97[0] - (char *)v96[0]) >= (void *)v14)
    {
      int64_t v44 = (char *)v96[1] - (char *)v96[0];
      if ((void *)((char *)v96[1] - (char *)v96[0]) >= (void *)v14)
      {
        if (v14) {
          memmove(v96[0], a7, v14);
        }
        uint64_t v43 = &v39[v14];
      }
      else
      {
        if (v96[1] != v96[0])
        {
          memmove(v96[0], a7, (char *)v96[1] - (char *)v96[0]);
          uint64_t v39 = (char *)v96[1];
        }
        if (v44 != v14) {
          memmove(v39, &a7[v44], v14 - v44);
        }
        uint64_t v43 = &v39[v14 - v44];
      }
    }
    else
    {
      if (v96[0])
      {
        v96[1] = v96[0];
        operator delete(v96[0]);
        unint64_t v38 = 0;
        v96[0] = 0;
        v96[1] = 0;
        v97[0] = 0;
      }
      uint64_t v40 = 2 * v38;
      if (2 * v38 <= v14) {
        uint64_t v40 = v14;
      }
      if (v38 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v41 = v40;
      }
      uint64_t v42 = (char *)operator new(v41);
      v96[0] = v42;
      v97[0] = &v42[v41];
      memcpy(v42, a7, v37);
      uint64_t v43 = &v42[v37];
    }
    v96[1] = v43;
  }
  uint64_t v45 = operator new(4uLL);
  *uint64_t v45 = a9;
  uint64_t v46 = v97[1];
  v97[1] = v45;
  if (v46) {
    operator delete(v46);
  }
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  AriSdk::MsgBase::getRawBytes();
  uint64_t v53 = *(void **)(a1 + 8);
  if (!v53 && *(_DWORD *)(a1 + 16))
  {
    uint64_t v66 = dispatch_semaphore_create(0);
    uint64_t v67 = v66;
    uint64_t v86 = 0;
    uint64_t v87 = &v86;
    uint64_t v88 = 0x2000000000;
    char v89 = 0;
    dispatch_object_t object = v66;
    if (v66) {
      dispatch_retain(v66);
    }
    if (AriHost::Send())
    {
      uint64_t v74 = "Failed to send the message of IBIPriWriteReq_V2.\n";
      goto LABEL_82;
    }
    dispatch_time_t v75 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v67, v75))
    {
      uint64_t v74 = "Timeout waiting for response.\n";
LABEL_82:
      _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)v74, v68, v69, v70, v71, v72, v73, v84);
      uint64_t v12 = 0;
      uint64_t v76 = object;
      if (!object) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
    uint64_t v77 = *((unsigned int *)v107 + 6);
    if (*((unsigned char *)v87 + 24) && v77 == a2 && (uint64_t v77 = a2, !*((_DWORD *)v103 + 6)))
    {
      uint64_t v12 = 1;
      *a4 = *((_DWORD *)v99 + 6);
      uint64_t v76 = object;
      if (!object)
      {
LABEL_84:
        _Block_object_dispose(&v86, 8);
        if (v67) {
          dispatch_release(v67);
        }
        goto LABEL_71;
      }
    }
    else
    {
      _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"Returned Instance is %d while expecting instance is %d\n", v68, v69, v70, v71, v72, v73, v77);
      _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"PRI/GRI Command Result: %d\n", v78, v79, v80, v81, v82, v83, *((unsigned int *)v103 + 6));
      uint64_t v12 = 0;
      *a4 = *((_DWORD *)v99 + 6);
      uint64_t v76 = object;
      if (!object) {
        goto LABEL_84;
      }
    }
LABEL_83:
    dispatch_release(v76);
    goto LABEL_84;
  }
  uint64_t v54 = *v90;
  uint64_t v55 = v90[1] - *v90;
  uint64_t v56 = *(unsigned int *)(a1 + 20);
  LODWORD(v86) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v47, v48, v49, v50, v51, v52, v55);
  if ((_KTLDebugFlags & 2) != 0) {
    off_26AA6F9C8("Tx:", 0, v54);
  }
  if (!*v53
    || ((char v63 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v53)(v53, v54, v55, &v86, 1, v56, 0), v86 == v55)? (v64 = v63): (v64 = 0), (v64 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v57, v58, v59, v60, v61, v62, v55);
    goto LABEL_69;
  }
  uint64_t v86 = 0;
  if (!KTLUTACopyReceiveData(a1, &v86))
  {
LABEL_69:
    uint64_t v12 = 0;
    goto LABEL_70;
  }
  uint64_t v12 = KTLCpsPriWriteParseAndRelease(v86, (_DWORD *)v107 + 6, (_DWORD *)v103 + 6, (_DWORD *)v99 + 6);
LABEL_70:
  *a4 = 0;
LABEL_71:
  uint64_t v65 = v91;
  if (v91 && !atomic_fetch_add(&v91->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
    std::__shared_weak_count::__release_weak(v65);
  }
  MEMORY[0x21D4AB9D0](v92);
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);
  return v12;
}

void sub_21C65C8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,char a27)
{
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&a21, 8);
  if (v27) {
    dispatch_release(v27);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  MEMORY[0x21D4AB9D0](&a27);
  _Block_object_dispose((const void *)(v28 - 200), 8);
  _Block_object_dispose((const void *)(v28 - 168), 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __KTLCpsPriWrite_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = operator new[](a3);
  v6[2] = a3;
  *((void *)v6 + 2) = v7;
  *(void *)uint64_t v6 = &unk_26CCDD8A8;
  v6[6] = a3;
  *((void *)v6 + 4) = v7;
  *((void *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = KTLCpsPriWriteParseAndRelease((uint64_t)v6, (_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), (_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24), (_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8)+ 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  return 0;
}

void sub_21C65C9F4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLCpsPriWriteParseAndRelease(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v32 = v8;
  long long v33 = v8;
  long long v30 = v8;
  long long v31 = v8;
  long long v29 = v8;
  BOOL v9 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::ARI_IBIPriWriteRspCb_V2_SDK((AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *)&v29, v9);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)&v29) == 67600384) {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWriteParseAndRelease", (uint64_t)"NACK Received\n", v10, v11, v12, v13, v14, v15, v29);
  }
  int v16 = AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::unpack((AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *)&v29);
  if (a2) {
    BOOL v23 = v16 == 0;
  }
  else {
    BOOL v23 = 0;
  }
  BOOL v25 = !v23 || a3 == 0 || a4 == 0;
  uint64_t v26 = !v25;
  if (v25)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWriteParseAndRelease", (uint64_t)"Failed to unpack response.\n", v17, v18, v19, v20, v21, v22, v29);
  }
  else
  {
    unint64_t v27 = (_DWORD *)*((void *)&v33 + 1);
    *a2 = *(_DWORD *)v33;
    *a3 = *v27;
    *a4 = DWORD2(v30);
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  MEMORY[0x21D4ABAC0](&v29);
  return v26;
}

BOOL KTLGetSimCardPresence(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (!a1) {
    return v8;
  }
  if (a2 >= 2)
  {
    _KTLErrorPrint((uint64_t)"KTLGetSimSlotInstance", (uint64_t)"simSlot parameter: %d is >= KTL max number of supported SIMs: %d\n", (uint64_t)a3, a4, a5, a6, a7, a8, a2);
    return 0;
  }
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  if ((KTLGetSimSlotMapping(a1, (uint64_t)&v32) & 1) == 0) {
    return 0;
  }
  unsigned int v10 = *(_DWORD *)(v8 + 16);
  unsigned int v38 = v10;
  if (*(void *)(v8 + 8) || !v10)
  {
    uint64_t v28 = 0;
    int v39 = 0;
    unsigned int v40 = v10;
    unint64_t v32 = 0;
    if (!ARI_CsiMsSimCardPresenceReq_ENC())
    {
      uint64_t v13 = operator new(0x18uLL);
      unint64_t v14 = v32;
      v13[2] = v39;
      *((void *)v13 + 2) = v14;
      *(void *)uint64_t v13 = &unk_26CCDD1F8;
      if (KTLUTASendAndReleaseData(v8, v13))
      {
        if (KTLUTACopyReceiveData(v8, &v28))
        {
          uint64_t v15 = v28;
          (*(void (**)(uint64_t))(*(void *)v28 + 16))(v28);
          int v16 = ARI_CsiMsSimCardPresenceRspCb_Extract();
          (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
          return v16 == 0;
        }
      }
    }
    return 0;
  }
  unint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3002000000;
  int v35 = __Block_byref_object_copy__8;
  int64_t v36 = __Block_byref_object_dispose__8;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = -1;
  uint64_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = v11;
  dispatch_object_t object = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  if (ARI_CsiMsSimCardPresenceReq_BLK())
  {
    uint64_t v8 = 0;
    *a3 = v33[5];
  }
  else
  {
    dispatch_time_t v17 = dispatch_time(0, 1000000 * *(unsigned int *)(v8 + 20));
    intptr_t v24 = dispatch_semaphore_wait(v12, v17);
    if (v24) {
      _KTLErrorPrint((uint64_t)"KTLGetSimCardPresence", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v26);
    }
    if (v38) {
      AriHost::ExitTrx((AriHost *)v38);
    }
    *a3 = v33[5];
    if (v24) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = *((_DWORD *)v29 + 6) == 0;
    }
  }
  if (object) {
    dispatch_release(object);
  }
  if (v12) {
    dispatch_release(v12);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v8;
}

void sub_21C65CE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (object) {
    dispatch_release(object);
  }
  if (v23) {
    dispatch_release(v23);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

uint64_t __KTLGetSimCardPresence_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ARI_CsiMsSimCardPresenceRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void *cps::ARICommandDriver::ARICommandDriver(void *result, uint64_t a2)
{
  *BOOL result = a2;
  return result;
}

{
  *BOOL result = a2;
  return result;
}

uint64_t cps::ARICommandDriver::PriRefresh(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIPriRefreshRspCb_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        long long v33 = (AriSdk::ARI_IBIPriRefreshRspCb_SDK *)operator new(0x50uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIPriRefreshRspCb_SDK::ARI_IBIPriRefreshRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    int v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__19;
  uint64_t v74 = __Block_byref_object_dispose__20;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIPriRefreshRspCb_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 2231468032);
      goto LABEL_17;
    }
    int v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIPriRefreshRspCb_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIPriRefreshRspCb_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"PriRefresh", (uint64_t)"Failed IBIPriRefreshReq\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65D3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t cps::ARICommandDriver::PriWrite(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIPriWriteRspCb_V3_SDK **a3)
{
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = *(void **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    uint64_t v13 = MEMORY[0];
    uint64_t v14 = MEMORY[8] - MEMORY[0];
    uint64_t v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0) {
      off_26AA6F9C8("Tx:", 0, v13);
    }
    if (*v12
      && ((char v22 = ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))*v12)(v12, v13, v14, &v70, 1, v15, 0), v70 == v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      uint64_t v70 = 0;
      int v24 = KTLUTACopyReceiveData(*a1, &v70);
      uint64_t v31 = v70;
      if (v70) {
        int v32 = v24;
      }
      else {
        int v32 = 0;
      }
      if (v32 == 1)
      {
        long long v33 = (AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *)operator new(0x50uLL);
        uint64_t v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 16))(v31);
        AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::ARI_IBIPriWriteRspCb_V3_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    int v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3002000000;
  uint64_t v73 = __Block_byref_object_copy__19;
  uint64_t v74 = __Block_byref_object_dispose__20;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v44 = AriHost::Send();
  if (v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  uint64_t v51 = v71;
  dispatch_time_t v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    char v59 = 0;
    _Block_object_dispose(&v70, 8);
    uint64_t v60 = object;
    if (!object) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v59 = 1;
  _Block_object_dispose(&v70, 8);
  uint64_t v60 = object;
  if (object) {
LABEL_29:
  }
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_31:
  char hasDeclaredGmid = AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::hasDeclaredGmid(*a3);
  uint64_t v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 2223112192);
      goto LABEL_17;
    }
    int v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::unpack(v62))
  {
    uint64_t v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3) {
    (*(void (**)(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *))(*(void *)*a3 + 16))(*a3);
  }
  uint64_t v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0) {
    _KTLErrorPrint((uint64_t)"PriWrite", (uint64_t)"Failed IBIPriWriteReq_V3\n", v36, v37, v38, v39, v40, v41, v69);
  }
  return v42;
}

void sub_21C65D8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
  int v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk26ARI_IBIPriRefreshRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  BOOL v4 = (AriSdk::ARI_IBIPriRefreshRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIPriRefreshRspCb_SDK::ARI_IBIPriRefreshRspCb_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65D9E4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_IBIPriWriteRspCb_V3_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  BOOL v4 = (AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::ARI_IBIPriWriteRspCb_V3_SDK(v4, a2);
  **(void **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21C65DA5C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ARI_AriUtaMsCpsSetSvnRspCb_Extract()
{
  return MEMORY[0x270F8C728]();
}

uint64_t ARI_CsiBspDebugJtagModeReq_BLK()
{
  return MEMORY[0x270F8C730]();
}

uint64_t ARI_CsiBspDebugJtagModeReq_ENC()
{
  return MEMORY[0x270F8C738]();
}

uint64_t ARI_CsiBspDebugJtagModeRspCb_Extract()
{
  return MEMORY[0x270F8C740]();
}

uint64_t ARI_CsiBspGetCalibrationStatusReq_BLK()
{
  return MEMORY[0x270F8C748]();
}

uint64_t ARI_CsiBspGetCalibrationStatusReq_ENC()
{
  return MEMORY[0x270F8C750]();
}

uint64_t ARI_CsiBspGetCalibrationStatusRspCb_Extract()
{
  return MEMORY[0x270F8C758]();
}

uint64_t ARI_CsiBspNvmGroupEnumListReq_BLK()
{
  return MEMORY[0x270F8C760]();
}

uint64_t ARI_CsiBspNvmGroupEnumListReq_ENC()
{
  return MEMORY[0x270F8C768]();
}

uint64_t ARI_CsiBspNvmGroupEnumListRespCb_Extract()
{
  return MEMORY[0x270F8C770]();
}

uint64_t ARI_CsiBspNvmReadGroupBlockReq_BLK()
{
  return MEMORY[0x270F8C778]();
}

uint64_t ARI_CsiBspNvmReadGroupBlockReq_ENC()
{
  return MEMORY[0x270F8C780]();
}

uint64_t ARI_CsiBspNvmReadGroupBlockRespCb_Extract()
{
  return MEMORY[0x270F8C788]();
}

uint64_t ARI_CsiBspNvmReadGroupReq_BLK()
{
  return MEMORY[0x270F8C790]();
}

uint64_t ARI_CsiBspNvmReadGroupReq_ENC()
{
  return MEMORY[0x270F8C798]();
}

uint64_t ARI_CsiBspNvmReadGroupRespCb_Extract()
{
  return MEMORY[0x270F8C7A0]();
}

uint64_t ARI_CsiBspSetNvItemsToStateReq_BLK()
{
  return MEMORY[0x270F8C7A8]();
}

uint64_t ARI_CsiBspSetNvItemsToStateReq_ENC()
{
  return MEMORY[0x270F8C7B0]();
}

uint64_t ARI_CsiBspSetNvItemsToStateRspCb_Extract()
{
  return MEMORY[0x270F8C7B8]();
}

uint64_t ARI_CsiBspShutdownReq_BLK()
{
  return MEMORY[0x270F8C7C0]();
}

uint64_t ARI_CsiBspShutdownReq_ENC()
{
  return MEMORY[0x270F8C7C8]();
}

uint64_t ARI_CsiBspShutdownRspCb_Extract()
{
  return MEMORY[0x270F8C7D0]();
}

uint64_t ARI_CsiBspStateGetReq_BLK()
{
  return MEMORY[0x270F8C7D8]();
}

uint64_t ARI_CsiBspStateGetReq_ENC()
{
  return MEMORY[0x270F8C7E0]();
}

uint64_t ARI_CsiBspStateGetRspCb_Extract()
{
  return MEMORY[0x270F8C7E8]();
}

uint64_t ARI_CsiBspStateSetReq_BLK()
{
  return MEMORY[0x270F8C7F0]();
}

uint64_t ARI_CsiBspStateSetReq_ENC()
{
  return MEMORY[0x270F8C7F8]();
}

uint64_t ARI_CsiBspStateSetRspCb_Extract()
{
  return MEMORY[0x270F8C800]();
}

uint64_t ARI_CsiBspSwTrapReq_BLK()
{
  return MEMORY[0x270F8C808]();
}

uint64_t ARI_CsiBspSwTrapReq_ENC()
{
  return MEMORY[0x270F8C810]();
}

uint64_t ARI_CsiBspSwTrapRspCb_Extract()
{
  return MEMORY[0x270F8C818]();
}

uint64_t ARI_CsiCddGetDebugLogReq_BLK()
{
  return MEMORY[0x270F8C820]();
}

uint64_t ARI_CsiCddGetDebugLogReq_ENC()
{
  return MEMORY[0x270F8C828]();
}

uint64_t ARI_CsiCddGetDebugLogRspCb_Extract()
{
  return MEMORY[0x270F8C830]();
}

uint64_t ARI_CsiCddGetParamDumpReq_BLK()
{
  return MEMORY[0x270F8C838]();
}

uint64_t ARI_CsiCddGetParamDumpReq_ENC()
{
  return MEMORY[0x270F8C840]();
}

uint64_t ARI_CsiCddGetParamDumpRspCb_Extract()
{
  return MEMORY[0x270F8C848]();
}

uint64_t ARI_CsiFpGetStatusRsp_Extract()
{
  return MEMORY[0x270F8C850]();
}

uint64_t ARI_CsiFpGetStatus_BLK()
{
  return MEMORY[0x270F8C858]();
}

uint64_t ARI_CsiFpGetStatus_ENC()
{
  return MEMORY[0x270F8C860]();
}

uint64_t ARI_CsiFpRegisterRsp_Extract()
{
  return MEMORY[0x270F8C868]();
}

uint64_t ARI_CsiFpRegister_BLK()
{
  return MEMORY[0x270F8C870]();
}

uint64_t ARI_CsiFpRegister_ENC()
{
  return MEMORY[0x270F8C878]();
}

uint64_t ARI_CsiFpSnapshotRsp_Extract()
{
  return MEMORY[0x270F8C880]();
}

uint64_t ARI_CsiFpSnapshot_BLK()
{
  return MEMORY[0x270F8C888]();
}

uint64_t ARI_CsiFpSnapshot_ENC()
{
  return MEMORY[0x270F8C890]();
}

uint64_t ARI_CsiFpUpdateAckRsp_Extract()
{
  return MEMORY[0x270F8C898]();
}

uint64_t ARI_CsiFpUpdateAck_BLK()
{
  return MEMORY[0x270F8C8A0]();
}

uint64_t ARI_CsiFpUpdateAck_ENC()
{
  return MEMORY[0x270F8C8A8]();
}

uint64_t ARI_CsiFpUpdateHeaderData_Extract()
{
  return MEMORY[0x270F8C8B0]();
}

uint64_t ARI_CsiFpUpdateHeader_BLK()
{
  return MEMORY[0x270F8C8B8]();
}

uint64_t ARI_CsiFpUpdateHeader_ENC()
{
  return MEMORY[0x270F8C8C0]();
}

uint64_t ARI_CsiIceAtExtReq_ENC()
{
  return MEMORY[0x270F8C8D0]();
}

uint64_t ARI_CsiIceAtExtRsp_Extract()
{
  return MEMORY[0x270F8C8D8]();
}

uint64_t ARI_CsiIceAudDisableLoopbackHWReq_BLK()
{
  return MEMORY[0x270F8C8E0]();
}

uint64_t ARI_CsiIceAudDisableLoopbackHWReq_ENC()
{
  return MEMORY[0x270F8C8E8]();
}

uint64_t ARI_CsiIceAudDisableLoopbackHWRespCb_Extract()
{
  return MEMORY[0x270F8C8F0]();
}

uint64_t ARI_CsiIceAudEnableLoopbackHWReq_BLK()
{
  return MEMORY[0x270F8C8F8]();
}

uint64_t ARI_CsiIceAudEnableLoopbackHWReq_ENC()
{
  return MEMORY[0x270F8C900]();
}

uint64_t ARI_CsiIceAudEnableLoopbackHWRespCb_Extract()
{
  return MEMORY[0x270F8C908]();
}

uint64_t ARI_CsiIceBspSetApWakeIntervalReq_BLK()
{
  return MEMORY[0x270F8C910]();
}

uint64_t ARI_CsiIceBspSetApWakeIntervalReq_ENC()
{
  return MEMORY[0x270F8C918]();
}

uint64_t ARI_CsiIceBspSetApWakeIntervalRspCb_Extract()
{
  return MEMORY[0x270F8C920]();
}

uint64_t ARI_CsiIceFilerReadReq_BLK()
{
  return MEMORY[0x270F8C928]();
}

uint64_t ARI_CsiIceFilerReadReq_ENC()
{
  return MEMORY[0x270F8C930]();
}

uint64_t ARI_CsiIceFilerReadRspCb_Extract()
{
  return MEMORY[0x270F8C938]();
}

uint64_t ARI_CsiIceFilerWriteRspCb_Extract()
{
  return MEMORY[0x270F8C940]();
}

uint64_t ARI_CsiIceFinishProvisionReq_BLK()
{
  return MEMORY[0x270F8C948]();
}

uint64_t ARI_CsiIceFinishProvisionReq_ENC()
{
  return MEMORY[0x270F8C950]();
}

uint64_t ARI_CsiIceFinishProvisionResp_Extract()
{
  return MEMORY[0x270F8C958]();
}

uint64_t ARI_CsiIceGetFactoryDebugEnabledReq_BLK()
{
  return MEMORY[0x270F8C960]();
}

uint64_t ARI_CsiIceGetFactoryDebugEnabledReq_ENC()
{
  return MEMORY[0x270F8C968]();
}

uint64_t ARI_CsiIceGetFactoryDebugEnabledResp_Extract()
{
  return MEMORY[0x270F8C970]();
}

uint64_t ARI_CsiIceGetManifestStatusReq_BLK()
{
  return MEMORY[0x270F8C978]();
}

uint64_t ARI_CsiIceGetManifestStatusReq_ENC()
{
  return MEMORY[0x270F8C980]();
}

uint64_t ARI_CsiIceGetManifestStatusResp_Extract()
{
  return MEMORY[0x270F8C988]();
}

uint64_t ARI_CsiIceGetRxDiversityReq_BLK()
{
  return MEMORY[0x270F8C990]();
}

uint64_t ARI_CsiIceGetRxDiversityReq_ENC()
{
  return MEMORY[0x270F8C998]();
}

uint64_t ARI_CsiIceGetRxDiversityRspCb_Extract()
{
  return MEMORY[0x270F8C9A0]();
}

uint64_t ARI_CsiIceRxDiversityReq_BLK()
{
  return MEMORY[0x270F8C9A8]();
}

uint64_t ARI_CsiIceRxDiversityReq_ENC()
{
  return MEMORY[0x270F8C9B0]();
}

uint64_t ARI_CsiIceRxDiversityRspCb_Extract()
{
  return MEMORY[0x270F8C9B8]();
}

uint64_t ARI_CsiIceStartProvisionReq_BLK()
{
  return MEMORY[0x270F8C9C0]();
}

uint64_t ARI_CsiIceStartProvisionReq_ENC()
{
  return MEMORY[0x270F8C9C8]();
}

uint64_t ARI_CsiIceStartProvisionResp_Extract()
{
  return MEMORY[0x270F8C9D0]();
}

uint64_t ARI_CsiIpcGetLogBufferListReq_BLK()
{
  return MEMORY[0x270F8C9D8]();
}

uint64_t ARI_CsiIpcGetLogBufferListReq_ENC()
{
  return MEMORY[0x270F8C9E0]();
}

uint64_t ARI_CsiIpcGetLogBufferListRsp_Extract()
{
  return MEMORY[0x270F8C9E8]();
}

uint64_t ARI_CsiIpcGetLogBufferReq_BLK()
{
  return MEMORY[0x270F8C9F0]();
}

uint64_t ARI_CsiIpcGetLogBufferReq_ENC()
{
  return MEMORY[0x270F8C9F8]();
}

uint64_t ARI_CsiIpcGetLogBufferRsp_Extract()
{
  return MEMORY[0x270F8CA00]();
}

uint64_t ARI_CsiMonMemoryStatusReq_BLK()
{
  return MEMORY[0x270F8CA08]();
}

uint64_t ARI_CsiMonMemoryStatusReq_ENC()
{
  return MEMORY[0x270F8CA10]();
}

uint64_t ARI_CsiMonMemoryStatusRspCb_Extract()
{
  return MEMORY[0x270F8CA18]();
}

uint64_t ARI_CsiMsCpsReadMeidReq_BLK()
{
  return MEMORY[0x270F8CA20]();
}

uint64_t ARI_CsiMsCpsReadMeidReq_ENC()
{
  return MEMORY[0x270F8CA28]();
}

uint64_t ARI_CsiMsCpsReadMeidRspCb_Extract()
{
  return MEMORY[0x270F8CA30]();
}

uint64_t ARI_CsiMsSimCardPresenceReq_BLK()
{
  return MEMORY[0x270F8CA38]();
}

uint64_t ARI_CsiMsSimCardPresenceReq_ENC()
{
  return MEMORY[0x270F8CA40]();
}

uint64_t ARI_CsiMsSimCardPresenceRspCb_Extract()
{
  return MEMORY[0x270F8CA48]();
}

uint64_t ARI_CsiSahGetCrashReportReq_BLK()
{
  return MEMORY[0x270F8CA50]();
}

uint64_t ARI_CsiSahGetCrashReportReq_ENC()
{
  return MEMORY[0x270F8CA58]();
}

uint64_t ARI_CsiSahGetCrashReportRspCb_Extract()
{
  return MEMORY[0x270F8CA60]();
}

uint64_t ARI_CsiSecGetChipIdReq_BLK()
{
  return MEMORY[0x270F8CA68]();
}

uint64_t ARI_CsiSecGetChipIdReq_ENC()
{
  return MEMORY[0x270F8CA70]();
}

uint64_t ARI_CsiSecGetChipIdRspCb_Extract()
{
  return MEMORY[0x270F8CA78]();
}

uint64_t ARI_CsiSecGetFusingStateReq_BLK()
{
  return MEMORY[0x270F8CA80]();
}

uint64_t ARI_CsiSecGetFusingStateReq_ENC()
{
  return MEMORY[0x270F8CA88]();
}

uint64_t ARI_CsiSecGetFusingStateRspCb_Extract()
{
  return MEMORY[0x270F8CA90]();
}

uint64_t ARI_CsiSecGetPkHashReq_BLK()
{
  return MEMORY[0x270F8CA98]();
}

uint64_t ARI_CsiSecGetPkHashReq_ENC()
{
  return MEMORY[0x270F8CAA0]();
}

uint64_t ARI_CsiSecGetPkHashRspCb_Extract()
{
  return MEMORY[0x270F8CAA8]();
}

uint64_t ARI_CsiSecGetSNUMReq_BLK()
{
  return MEMORY[0x270F8CAB0]();
}

uint64_t ARI_CsiSecGetSNUMReq_ENC()
{
  return MEMORY[0x270F8CAB8]();
}

uint64_t ARI_CsiSecGetSNUMRspCb_Extract()
{
  return MEMORY[0x270F8CAC0]();
}

uint64_t ARI_CsiSysGetInfoReqV2_BLK()
{
  return MEMORY[0x270F8CAC8]();
}

uint64_t ARI_CsiSysGetInfoReqV2_ENC()
{
  return MEMORY[0x270F8CAD0]();
}

uint64_t ARI_CsiSysGetInfoRspCbV2_Extract()
{
  return MEMORY[0x270F8CAD8]();
}

uint64_t ARI_UtaMsCpsSetSvnReq_BLK()
{
  return MEMORY[0x270F8CAE0]();
}

uint64_t ARI_UtaMsCpsSetSvnReq_ENC()
{
  return MEMORY[0x270F8CAE8]();
}

uint64_t TelephonyCapabilitiesGetHardwareModel()
{
  return MEMORY[0x270F97128]();
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x270F97190]();
}

uint64_t TelephonyUtilLogBinaryToBuffer()
{
  return MEMORY[0x270F971B8]();
}

uint64_t TelephonyUtilLogGetBufferSize()
{
  return MEMORY[0x270F971C0]();
}

uint64_t TelephonyUtilTransportCreateWithFD()
{
  return MEMORY[0x270F97220]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x270F8CD00](this, a2, a3);
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x270F976E8](this);
}

uint64_t ctu::partition()
{
  return MEMORY[0x270F97788]();
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD58](this, a2);
}

uint64_t AriMsg::GetBufMsgDir(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD60](this, a2);
}

uint64_t AriMsg::ReleaseEncodedMessage(AriMsg *this, unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD68](this, a2);
}

uint64_t AriMsg::GetBufCtx(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD80](this, a2);
}

void AriMsg::AriMsg(AriMsg *this, const unsigned __int8 *a2)
{
}

void AriMsg::~AriMsg(AriMsg *this)
{
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F8CDB8](this, a2, a3);
}

uint64_t AriSdk::ARI_CsiIceAtExtReq_SDK::ARI_CsiIceAtExtReq_SDK(AriSdk::ARI_CsiIceAtExtReq_SDK *this)
{
  return MEMORY[0x270F8CEE0](this);
}

void AriSdk::ARI_CsiIceAtExtReq_SDK::~ARI_CsiIceAtExtReq_SDK(AriSdk::ARI_CsiIceAtExtReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIPriWriteReq_V2_SDK::ARI_IBIPriWriteReq_V2_SDK(AriSdk::ARI_IBIPriWriteReq_V2_SDK *this)
{
  return MEMORY[0x270F8D288](this);
}

void AriSdk::ARI_IBIPriWriteReq_V2_SDK::~ARI_IBIPriWriteReq_V2_SDK(AriSdk::ARI_IBIPriWriteReq_V2_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylTapeRspCb_SDK::unpack(AriSdk::ARI_IBIVinylTapeRspCb_SDK *this)
{
  return MEMORY[0x270F8D330](this);
}

uint64_t AriSdk::ARI_IBIVinylTapeRspCb_SDK::ARI_IBIVinylTapeRspCb_SDK(AriSdk::ARI_IBIVinylTapeRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D338](this, a2);
}

uint64_t AriSdk::ARI_CsiBspSwTrapReq_v3_SDK::ARI_CsiBspSwTrapReq_v3_SDK(AriSdk::ARI_CsiBspSwTrapReq_v3_SDK *this)
{
  return MEMORY[0x270F8D358](this);
}

void AriSdk::ARI_CsiBspSwTrapReq_v3_SDK::~ARI_CsiBspSwTrapReq_v3_SDK(AriSdk::ARI_CsiBspSwTrapReq_v3_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIPriRefreshRspCb_SDK::unpack(AriSdk::ARI_IBIPriRefreshRspCb_SDK *this)
{
  return MEMORY[0x270F8D4E8](this);
}

uint64_t AriSdk::ARI_IBIPriRefreshRspCb_SDK::ARI_IBIPriRefreshRspCb_SDK(AriSdk::ARI_IBIPriRefreshRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D4F0](this, a2);
}

uint64_t AriSdk::ARI_CsiIceFilerWriteReq_SDK::ARI_CsiIceFilerWriteReq_SDK(AriSdk::ARI_CsiIceFilerWriteReq_SDK *this)
{
  return MEMORY[0x270F8D688](this);
}

void AriSdk::ARI_CsiIceFilerWriteReq_SDK::~ARI_CsiIceFilerWriteReq_SDK(AriSdk::ARI_CsiIceFilerWriteReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::ARI_CsiMsCpsReadImeiReq_SDK(AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *this)
{
  return MEMORY[0x270F8D6B0](this);
}

void AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::~ARI_CsiMsCpsReadImeiReq_SDK(AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBINvmSnapshotRspCb_SDK::unpack(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *this)
{
  return MEMORY[0x270F8D728](this);
}

uint64_t AriSdk::ARI_IBINvmSnapshotRspCb_SDK::ARI_IBINvmSnapshotRspCb_SDK(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D730](this, a2);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::unpack(AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *this)
{
  return MEMORY[0x270F8D738](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::ARI_IBIPriWriteRspCb_V2_SDK(AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D740](this, a2);
}

void AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::~ARI_IBIPriWriteRspCb_V2_SDK(AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::unpack(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *this)
{
  return MEMORY[0x270F8D750](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::ARI_IBIPriWriteRspCb_V3_SDK(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D758](this, a2);
}

uint64_t AriSdk::ARI_IBISimTrayStatusReq_SDK::ARI_IBISimTrayStatusReq_SDK(AriSdk::ARI_IBISimTrayStatusReq_SDK *this)
{
  return MEMORY[0x270F8D7A8](this);
}

void AriSdk::ARI_IBISimTrayStatusReq_SDK::~ARI_IBISimTrayStatusReq_SDK(AriSdk::ARI_IBISimTrayStatusReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylGetEidRspCb_SDK::unpack(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *this)
{
  return MEMORY[0x270F8D820](this);
}

uint64_t AriSdk::ARI_IBIVinylGetEidRspCb_SDK::ARI_IBIVinylGetEidRspCb_SDK(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D828](this, a2);
}

uint64_t AriSdk::ARI_TraceSetConfigRspCb_SDK::unpack(AriSdk::ARI_TraceSetConfigRspCb_SDK *this)
{
  return MEMORY[0x270F8D848](this);
}

uint64_t AriSdk::ARI_TraceSetConfigRspCb_SDK::ARI_TraceSetConfigRspCb_SDK(AriSdk::ARI_TraceSetConfigRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D850](this, a2);
}

uint64_t AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::unpack(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *this)
{
  return MEMORY[0x270F8D978](this);
}

uint64_t AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::ARI_CsiSysGetInfoRspCbV2_SDK(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8D980](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *this)
{
  return MEMORY[0x270F8DB30](this);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::ARI_IBIVinylAuthPsoRspCb_SDK(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8DB38](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylGetDataRspCb_SDK::unpack(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *this)
{
  return MEMORY[0x270F8DB40](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataRspCb_SDK::ARI_IBIVinylGetDataRspCb_SDK(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8DB48](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *this)
{
  return MEMORY[0x270F8DB58](this);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::ARI_IBIVinylInitPsoRspCb_SDK(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8DB60](this, a2);
}

uint64_t AriSdk::ARI_CsiIceGetTxAntennaReq_SDK::ARI_CsiIceGetTxAntennaReq_SDK(AriSdk::ARI_CsiIceGetTxAntennaReq_SDK *this)
{
  return MEMORY[0x270F8DC00](this);
}

void AriSdk::ARI_CsiIceGetTxAntennaReq_SDK::~ARI_CsiIceGetTxAntennaReq_SDK(AriSdk::ARI_CsiIceGetTxAntennaReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiIceRFFilerWriteReq_SDK::ARI_CsiIceRFFilerWriteReq_SDK(AriSdk::ARI_CsiIceRFFilerWriteReq_SDK *this)
{
  return MEMORY[0x270F8DC10](this);
}

void AriSdk::ARI_CsiIceRFFilerWriteReq_SDK::~ARI_CsiIceRFFilerWriteReq_SDK(AriSdk::ARI_CsiIceRFFilerWriteReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiIceSetTxAntennaReq_SDK::ARI_CsiIceSetTxAntennaReq_SDK(AriSdk::ARI_CsiIceSetTxAntennaReq_SDK *this)
{
  return MEMORY[0x270F8DC20](this);
}

void AriSdk::ARI_CsiIceSetTxAntennaReq_SDK::~ARI_CsiIceSetTxAntennaReq_SDK(AriSdk::ARI_CsiIceSetTxAntennaReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::unpack(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this)
{
  return MEMORY[0x270F8DC70](this);
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8DC78](this, a2);
}

void AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::~ARI_CsiMsCpsReadImeiRspCb_SDK(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
  return MEMORY[0x270F8DC88](this);
}

void AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *this)
{
  return MEMORY[0x270F8DD98](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::ARI_IBIFilerHSReadBBRspCb_SDK(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8DDA0](this, a2);
}

uint64_t AriSdk::ARI_IBISimTrayStatusRspCb_SDK::unpack(AriSdk::ARI_IBISimTrayStatusRspCb_SDK *this)
{
  return MEMORY[0x270F8DE88](this);
}

uint64_t AriSdk::ARI_IBISimTrayStatusRspCb_SDK::ARI_IBISimTrayStatusRspCb_SDK(AriSdk::ARI_IBISimTrayStatusRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8DE90](this, a2);
}

void AriSdk::ARI_IBISimTrayStatusRspCb_SDK::~ARI_IBISimTrayStatusRspCb_SDK(AriSdk::ARI_IBISimTrayStatusRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::unpack(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *this)
{
  return MEMORY[0x270F8E020](this);
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::ARI_CsiSecReadSikPKeyRspCb_SDK(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E028](this, a2);
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *this)
{
  return MEMORY[0x270F8E128](this);
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::ARI_IBIFilerHSWriteBBRspCb_SDK(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E130](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::unpack(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *this)
{
  return MEMORY[0x270F8E350](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::ARI_IBIVinylInstallFwRspCb_SDK(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E358](this, a2);
}

uint64_t AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::unpack(AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *this)
{
  return MEMORY[0x270F8E428](this);
}

uint64_t AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::ARI_CsiIceGetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E430](this, a2);
}

void AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::~ARI_CsiIceGetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::unpack(AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *this)
{
  return MEMORY[0x270F8E440](this);
}

uint64_t AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::ARI_CsiIceRFFilerWriteRspCb_SDK(AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E448](this, a2);
}

uint64_t AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::unpack(AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *this)
{
  return MEMORY[0x270F8E450](this);
}

uint64_t AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::ARI_CsiIceSetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E458](this, a2);
}

void AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::~ARI_CsiIceSetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::unpack(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *this)
{
  return MEMORY[0x270F8E478](this);
}

uint64_t AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::ARI_CsiIceWakeupReasonRspCb_SDK(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E480](this, a2);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::unpack(AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *this)
{
  return MEMORY[0x270F8E4C0](this);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::ARI_CsiSecGetRandomNumRspCb_SDK(AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E4C8](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::unpack(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *this)
{
  return MEMORY[0x270F8E7E8](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::ARI_IBIVinylInstallVadRspCb_SDK(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E7F0](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::unpack(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *this)
{
  return MEMORY[0x270F8E810](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::ARI_IBIVinylSwitchModeRspCb_SDK(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8E818](this, a2);
}

uint64_t AriSdk::ARI_CsiDelayedOutstandingReq_SDK::ARI_CsiDelayedOutstandingReq_SDK(AriSdk::ARI_CsiDelayedOutstandingReq_SDK *this)
{
  return MEMORY[0x270F8E868](this);
}

void AriSdk::ARI_CsiDelayedOutstandingReq_SDK::~ARI_CsiDelayedOutstandingReq_SDK(AriSdk::ARI_CsiDelayedOutstandingReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *this)
{
  return MEMORY[0x270F8EBA8](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::ARI_IBIVinylFinalizePsoRspCb_SDK(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8EBB0](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *this)
{
  return MEMORY[0x270F8EBC8](this);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::ARI_IBIVinylValidatePsoRspCb_SDK(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8EBD0](this, a2);
}

uint64_t AriSdk::ARI_CsiDelayedOutstandingResp_SDK::unpack(AriSdk::ARI_CsiDelayedOutstandingResp_SDK *this)
{
  return MEMORY[0x270F8EBE8](this);
}

uint64_t AriSdk::ARI_CsiDelayedOutstandingResp_SDK::ARI_CsiDelayedOutstandingResp_SDK(AriSdk::ARI_CsiDelayedOutstandingResp_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8EBF0](this, a2);
}

void AriSdk::ARI_CsiDelayedOutstandingResp_SDK::~ARI_CsiDelayedOutstandingResp_SDK(AriSdk::ARI_CsiDelayedOutstandingResp_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
  return MEMORY[0x270F8EC00](this);
}

void AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x270F8EE50](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::unpack(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *this)
{
  return MEMORY[0x270F8EFF8](this);
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::ARI_CsiSecCollectScrtBlobRspCb_SDK(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F000](this, a2);
}

uint64_t AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::ARI_CsiFactGetTestReadyStateReq_SDK(AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *this)
{
  return MEMORY[0x270F8F238](this);
}

void AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::~ARI_CsiFactGetTestReadyStateReq_SDK(AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this)
{
  return MEMORY[0x270F8F248](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F250](this, a2);
}

void AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::~ARI_CsiGetCurrentBootStateRspCb_SDK(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *this)
{
  return MEMORY[0x270F8F380](this);
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::ARI_IBIFilerHSEndBBSessionRspCb_SDK(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F388](this, a2);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::unpack(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *this)
{
  return MEMORY[0x270F8F490](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::ARI_IBISimAccessGetSimDataRspCb_SDK(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F498](this, a2);
}

uint64_t AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::ARI_CsiBmmProvideBootTimeInfoReq_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *this)
{
  return MEMORY[0x270F8F530](this);
}

void AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::~ARI_CsiBmmProvideBootTimeInfoReq_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *this)
{
  return MEMORY[0x270F8F618](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F620](this, a2);
}

uint64_t AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::ARI_IBIMSimGetSimStackMappingReq_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *this)
{
  return MEMORY[0x270F8F628](this);
}

void AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::~ARI_IBIMSimGetSimStackMappingReq_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::unpack(AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *this)
{
  return MEMORY[0x270F8F778](this);
}

uint64_t AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::ARI_CsiFactGetTestReadyStateRspCb_SDK(AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F780](this, a2);
}

void AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::~ARI_CsiFactGetTestReadyStateRspCb_SDK(AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::unpack(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *this)
{
  return MEMORY[0x270F8F7C8](this);
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::ARI_FactoryGetNvItemsSettingRspCb_SDK(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8F7D0](this, a2);
}

uint64_t AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::unpack(AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *this)
{
  return MEMORY[0x270F8FA38](this);
}

uint64_t AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8FA40](this, a2);
}

void AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::~ARI_CsiBmmProvideBootTimeInfoRspCb_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::unpack(AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *this)
{
  return MEMORY[0x270F8FAE8](this);
}

uint64_t AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::ARI_IBIMSimGetSimStackMappingRspCb_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8FAF0](this, a2);
}

void AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::~ARI_IBIMSimGetSimStackMappingRspCb_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *this)
{
}

uint64_t AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::unpack(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *this)
{
  return MEMORY[0x270F8FE48](this);
}

uint64_t AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::ARI_GetPersonalizationParametersRspCb_SDK(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8FE50](this, a2);
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *this)
{
  return MEMORY[0x270F8FEA8](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8FEB0](this, a2);
}

uint64_t AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::ARI_CsiMSimGetSimStackMappingStatusReq_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *this)
{
  return MEMORY[0x270F8FEF8](this);
}

void AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::~ARI_CsiMSimGetSimStackMappingStatusReq_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *this)
{
  return MEMORY[0x270F8FF60](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8FF68](this, a2);
}

uint64_t AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::unpack(AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *this)
{
  return MEMORY[0x270F90028](this);
}

uint64_t AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F90030](this, a2);
}

void AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::~ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *this)
{
}

uint64_t AriSdk::MsgBase::getRawBytes()
{
  return MEMORY[0x270F90240]();
}

uint64_t AriHost::StartStream()
{
  return MEMORY[0x270F90250]();
}

uint64_t AriHost::Send()
{
  return MEMORY[0x270F902B0]();
}

uint64_t AriHost::ExitTrx(AriHost *this)
{
  return MEMORY[0x270F902C0](this);
}

uint64_t AriHost::EndStream(AriHost *this)
{
  return MEMORY[0x270F902C8](this);
}

uint64_t AriSdk::ARI_IBIVinylTapeRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylTapeRspCb_SDK *this)
{
  return MEMORY[0x270F902F0](this);
}

uint64_t AriSdk::ARI_IBIPriRefreshRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIPriRefreshRspCb_SDK *this)
{
  return MEMORY[0x270F902F8](this);
}

uint64_t AriSdk::ARI_IBINvmSnapshotRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *this)
{
  return MEMORY[0x270F90300](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::hasDeclaredGmid(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *this)
{
  return MEMORY[0x270F90308](this);
}

uint64_t AriSdk::ARI_IBIVinylGetEidRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *this)
{
  return MEMORY[0x270F90310](this);
}

uint64_t AriSdk::ARI_TraceSetConfigRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_TraceSetConfigRspCb_SDK *this)
{
  return MEMORY[0x270F90318](this);
}

uint64_t AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *this)
{
  return MEMORY[0x270F90320](this);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *this)
{
  return MEMORY[0x270F90328](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *this)
{
  return MEMORY[0x270F90330](this);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *this)
{
  return MEMORY[0x270F90338](this);
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this)
{
  return MEMORY[0x270F90340](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *this)
{
  return MEMORY[0x270F90348](this);
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *this)
{
  return MEMORY[0x270F90350](this);
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *this)
{
  return MEMORY[0x270F90358](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *this)
{
  return MEMORY[0x270F90360](this);
}

uint64_t AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *this)
{
  return MEMORY[0x270F90368](this);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *this)
{
  return MEMORY[0x270F90370](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *this)
{
  return MEMORY[0x270F90378](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *this)
{
  return MEMORY[0x270F90380](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *this)
{
  return MEMORY[0x270F90388](this);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *this)
{
  return MEMORY[0x270F90390](this);
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *this)
{
  return MEMORY[0x270F90398](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this)
{
  return MEMORY[0x270F903A0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *this)
{
  return MEMORY[0x270F903A8](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *this)
{
  return MEMORY[0x270F903B0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *this)
{
  return MEMORY[0x270F903B8](this);
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *this)
{
  return MEMORY[0x270F903C0](this);
}

uint64_t AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *this)
{
  return MEMORY[0x270F903C8](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *this)
{
  return MEMORY[0x270F903D0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *this)
{
  return MEMORY[0x270F903D8](this);
}

uint64_t AriSdk::MsgBase::getMergedGMID(AriSdk::MsgBase *this)
{
  return MEMORY[0x270F903E0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}