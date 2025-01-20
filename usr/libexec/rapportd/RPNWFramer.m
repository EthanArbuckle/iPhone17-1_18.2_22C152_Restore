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
    return (&off_100122868)[a3];
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
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100041984;
    v11[3] = &unk_100122640;
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
    if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    async_block[0] = _NSConcreteStackBlock;
    async_block[1] = 3221225472;
    async_block[2] = sub_100041BBC;
    async_block[3] = &unk_1001219D0;
    id v12 = v7;
    char v13 = v5;
    nw_framer_async(v13, async_block);
  }
  return v9;
}

+ (void)startConnection:(id)a3
{
  id v3 = a3;
  if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  +[RPNWFramer writeControlOnFramer:v3 type:1 error:0];
}

+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (dword_100141070 <= 30 && (dword_100141070 != -1 || _LogCategory_Initialize()))
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
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100041FBC;
  v13[3] = &unk_1001226B8;
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
  nw_framer_set_output_handler(v12, &stru_1001226F8);
  nw_framer_set_cleanup_handler(v12, &stru_100122738);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

@end