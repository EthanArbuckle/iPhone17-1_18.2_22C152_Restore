@interface RPNWFramer
+ (BOOL)writeControlOnFramer:(id)a3 type:(int)a4 error:(unsigned __int8)a5;
+ (BOOL)writeDataOnFramer:(id)a3 data:(id)a4;
+ (const)controlCodeToString:(int)a3;
+ (void)setupDaemonFramer:(id)a3 receiveHandler:(id)a4 closeHandler:(id)a5;
+ (void)startConnection:(id)a3;
+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4;
@end

@implementation RPNWFramer

+ (const)controlCodeToString:(int)a3
{
  if (a3 > 3) {
    return "INVALID";
  }
  else {
    return off_1E605B968[a3];
  }
}

+ (BOOL)writeControlOnFramer:(id)a3 type:(int)a4 error:(unsigned __int8)a5
{
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (a4 == 1) {
      int v9 = 320017171;
    }
    else {
      int v9 = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__RPNWFramer_writeControlOnFramer_type_error___block_invoke;
    v11[3] = &unk_1E605B800;
    v12 = v7;
    char v13 = a4;
    unsigned __int8 v14 = a5;
    __int16 v15 = 0;
    int v16 = v9;
    uint64_t v17 = 0;
    unsigned __int8 v19 = a5;
    int v18 = a4;
    nw_framer_async(v12, v11);
  }
  return v8 != 0;
}

void __46__RPNWFramer_writeControlOnFramer_type_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60))
  {
    if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    {
      +[RPNWFramer controlCodeToString:*(unsigned int *)(a1 + 56)];
      strerror(*(unsigned __int8 *)(a1 + 60));
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
  {
    +[RPNWFramer controlCodeToString:*(unsigned int *)(a1 + 56)];
    goto LABEL_8;
  }
}

+ (BOOL)writeDataOnFramer:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    async_block[0] = MEMORY[0x1E4F143A8];
    async_block[1] = 3221225472;
    async_block[2] = __37__RPNWFramer_writeDataOnFramer_data___block_invoke;
    async_block[3] = &unk_1E605B5D8;
    id v12 = v7;
    char v13 = v5;
    nw_framer_async(v13, async_block);
  }
  return v9;
}

void __37__RPNWFramer_writeDataOnFramer_data___block_invoke(uint64_t a1)
{
  size_t v2 = [*(id *)(a1 + 32) length];
  v3 = (const uint8_t *)[*(id *)(a1 + 32) bytes];
  *(void *)output_buffer = 0;
  size_t v5 = v2;
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), output_buffer, 0x10uLL);
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), v3, v2);
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

+ (void)startConnection:(id)a3
{
  id v3 = a3;
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  +[RPNWFramer writeControlOnFramer:v3 type:1 error:0];
}

+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = v4;
    LogPrintF();
  }
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v6, 2, v4, v5);
}

+ (void)setupDaemonFramer:(id)a3 receiveHandler:(id)a4 closeHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke;
  v13[3] = &unk_1E605B878;
  uint64_t v17 = v23;
  int v18 = v20;
  unsigned __int8 v19 = v22;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = v7;
  unsigned __int8 v14 = v12;
  nw_framer_set_input_handler(v12, v13);
  nw_framer_set_output_handler(v12, &__block_literal_global_1);
  nw_framer_set_cleanup_handler(v12, &__block_literal_global_30);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

uint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  while (1)
  {
    do
    {
      uint64_t v7 = *(void *)(a1 + 56);
      if (*(unsigned char *)(*(void *)(v7 + 8) + 24)) {
        break;
      }
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x3010000000;
      v30 = "";
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      parse[0] = MEMORY[0x1E4F143A8];
      parse[1] = 3221225472;
      parse[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_2;
      parse[3] = &unk_1E605B828;
      uint64_t v26 = 16;
      parse[4] = &v27;
      parse[5] = v7;
      long long v25 = *(_OWORD *)(a1 + 64);
      if (!nw_framer_parse_input(v6, 0x10uLL, 0x10uLL, 0, parse))
      {
        _Block_object_dispose(&v27, 8);
        uint64_t v14 = 16;
        goto LABEL_41;
      }
      if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      {
        id v8 = +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v16, v17, v18, v19);
        uint64_t v9 = *((unsigned __int8 *)v28 + 33);
        int v18 = strerror(*((unsigned __int8 *)v28 + 33));
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        id v16 = v8;
        uint64_t v17 = v9;
        LogPrintF();
      }
      _Block_object_dispose(&v27, 8);
    }
    while (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 3)
      {
        if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else
      {
        if (gLogCategory_RPNWFramer <= 90 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 57);
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v4, v5);
      goto LABEL_40;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      break;
    }
    if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v10 = *(void *)(a1 + 72);
    size_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_3;
    void v20[3] = &unk_1E605B850;
    uint64_t v22 = v10;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 56);
    id v21 = v12;
    uint64_t v23 = v13;
    if (!nw_framer_parse_input(v6, 1uLL, v11, 0, v20))
    {
      if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }

LABEL_40:
      uint64_t v14 = 0;
      goto LABEL_41;
    }
  }
  if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v14 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_41:

  return v14;
}

uint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_2(void *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[8] > a3) {
    return 0;
  }
  *(_OWORD *)(*(void *)(a1[4] + 8) + 32) = *a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 8) + 32);
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 40);
  return a1[8];
}

unint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_3(void *a1, uint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = a3;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) <= a3)
  {
    if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(a1[4] + 16))(a1[4]);
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(a1[4] + 16))(a1[4]);
    *(void *)(*(void *)(a1[5] + 8) + 24) -= v3;
  }
  return v3;
}

void __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (gLogCategory_RPNWFramer <= 90 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

void __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = v2;
  if (gLogCategory_RPNWFramer <= 30)
  {
    id v5 = v2;
    if (gLogCategory_RPNWFramer != -1 || (v4 = _LogCategory_Initialize(), unint64_t v3 = v5, v4))
    {
      LogPrintF();
      unint64_t v3 = v5;
    }
  }
}

@end