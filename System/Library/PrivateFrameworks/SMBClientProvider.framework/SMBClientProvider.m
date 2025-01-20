uint64_t sub_100002744(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "smbclientd main starting", v18, 2u);
  }
  v0 = objc_alloc_init(SMBClientdSettings);
  v1 = (void *)qword_1000914E8;
  qword_1000914E8 = (uint64_t)v0;

  if (_set_user_dir_suffix())
  {
    id v2 = NSTemporaryDirectory();
  }
  else
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10004C320(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = objc_opt_new();
  id v12 = +[SMBClientService newServiceProxyObjectWithDelegate:v11];
  v13 = objc_opt_new();
  [v13 setServer:v12];
  id v14 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.filesystems.smbclientd"];
  [v14 setDelegate:v13];
  v15 = (void *)qword_1000914E0;
  qword_1000914E0 = (uint64_t)v12;
  id v16 = v12;

  [v14 resume];
  [(id)qword_1000914E8 reconstituteWithService:v16];
  [v16 initializationFinished];

  CFRunLoopRun();
  return 0;
}

void sub_100003788(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000039F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003A08(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003B80(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (v5)
  {
    [*(id *)(a1 + 32) setDeObj:v5];
    [*(id *)(a1 + 32) setEnumState:1];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004C35C();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100003E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003EAC(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004C544();
    }
  }
  else
  {
    ++*(void *)(*(void *)(a1 + 32) + 56);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100004F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004FBC(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000050B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000516C;
  v7[3] = &unk_100088770;
  uint64_t v6 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v6 _getEntriesInBuffer:v1 BufferLen:v2 CookieIn:v3 VerifyIn:v4 IsReadDirAttr:v5 CompletionHandler:v7];
}

uint64_t sub_10000516C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000054C0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 72);
  if (v2 == -1)
  {
    [*(id *)(a1 + 32) setEnumState:2];
    objc_msgSend(*(id *)(a1 + 32), "close_dir_enum");
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      if (*(unsigned char *)(a1 + 80))
      {
        *(_WORD *)(v4 + 8) = 0;
        *(void *)uint64_t v4 = -1;
      }
      else
      {
        *(_WORD *)(v4 + 16) = 0;
        *(void *)(v4 + 8) = -1;
      }
    }
    goto LABEL_23;
  }
  if (v2)
  {
    if (v2 == 55)
    {
      uint64_t v3 = *(void *)(a1 + 48);
      if (v3)
      {
        if (*(unsigned char *)(a1 + 80)) {
          *(_WORD *)(v3 + 8) = 0;
        }
        else {
          *(_WORD *)(v3 + 16) = 0;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        sub_10004CD2C();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004CC94(a1);
    }
LABEL_23:
    id v8 = [*(id *)(a1 + 32) dnp];
    [v8 getReadDirVerifier];

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  int v9 = 0;
  unsigned int v5 = [*(id *)(a1 + 32) fillNextEntry:*(void *)(a1 + 56) BufLen:*(void *)(a1 + 64) IsReadDirAttr:*(unsigned __int8 *)(a1 + 80) BytesFilled:&v9];
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    ++v6[7];
    uint64_t v6 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v6, "processNextEntry:inbufPtr:prevEntry:inbufRemain:bytesFilled:IsReadDirAttr:CompletionHandler:", *(void *)(a1 + 40));
}

void sub_10000578C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000057B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100005D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_100005DDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005DEC(uint64_t a1)
{
}

void sub_100005DF4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(long long **)(a1 + 64);
  long long v9 = v7[13];
  long long v8 = v7[14];
  long long v10 = v7[12];
  *(void *)(v6 + 272) = *((void *)v7 + 30);
  *(_OWORD *)(v6 + 240) = v9;
  *(_OWORD *)(v6 + 256) = v8;
  *(_OWORD *)(v6 + 224) = v10;
  long long v11 = v7[11];
  long long v13 = v7[8];
  long long v12 = v7[9];
  *(_OWORD *)(v6 + 192) = v7[10];
  *(_OWORD *)(v6 + 208) = v11;
  *(_OWORD *)(v6 + 160) = v13;
  *(_OWORD *)(v6 + 176) = v12;
  long long v14 = v7[7];
  long long v16 = v7[4];
  long long v15 = v7[5];
  *(_OWORD *)(v6 + 128) = v7[6];
  *(_OWORD *)(v6 + 144) = v14;
  *(_OWORD *)(v6 + 96) = v16;
  *(_OWORD *)(v6 + 112) = v15;
  long long v17 = *v7;
  long long v18 = v7[1];
  long long v19 = v7[3];
  *(_OWORD *)(v6 + 64) = v7[2];
  *(_OWORD *)(v6 + 80) = v19;
  *(_OWORD *)(v6 + 32) = v17;
  *(_OWORD *)(v6 + 48) = v18;
  free(*(void **)(a1 + 64));
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v5;
  id v22 = v5;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000060A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000060C8(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000062DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006300(uint64_t a1, int a2)
{
  free(*(void **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v4);
}

void sub_100006580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000065A8(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100006820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000684C(uint64_t a1, int a2)
{
  free(*(void **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v4);
}

void sub_10000A4DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_10000A4F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t sub_10000A548@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W8>, float a5@<S0>)
{
  *(float *)a2 = a5;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(void *)(a2 + 10) = result;
  *(_WORD *)(a2 + 18) = 1024;
  *(_DWORD *)(a2 + 20) = a4;
  return result;
}

void sub_10000A584(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void sub_10000A5A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

float *sub_10000A5F0(float *result, int a2, _DWORD *a3, float a4)
{
  *result = a4;
  *a3 = a2;
  return result;
}

uint64_t sub_10000A5FC(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(void *)(a2 + 10) = result;
  return result;
}

void sub_10000A614(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x18u);
}

void sub_10000B3A8(uint64_t a1)
{
  uint64_t v3 = (id *)(a1 + 32);
  int v2 = *(void **)(a1 + 32);
  if (v2[52])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [*v3 shareName];
      int v8 = 136315394;
      uint64_t v9 = "-[smbMount tryCreateRootNode]_block_invoke";
      __int16 v10 = 2112;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: share: %@, already have a root node", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    unsigned int v5 = [v2 connState];
    if (v5)
    {
      if (v5 == 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100050970((uint64_t)v3);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000508C0(v3);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [*v3 shareName];
        int v8 = 136315394;
        uint64_t v9 = "-[smbMount tryCreateRootNode]_block_invoke";
        __int16 v10 = 2112;
        long long v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: share: %@, connecting to server...", (uint8_t *)&v8, 0x16u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) connectToServer];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100050A0C(v3);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = [*v3 shareName];
          int v8 = 136315394;
          uint64_t v9 = "-[smbMount tryCreateRootNode]_block_invoke";
          __int16 v10 = 2112;
          long long v11 = v7;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: share: %@ connected, connection now ACTIVE", (uint8_t *)&v8, 0x16u);
        }
        *((_DWORD *)*v3 + 45) = 1;
        [*v3 resumeIdleTimer];
      }
    }
  }
}

void sub_10000B6E4(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 32) connState];
  if (v3)
  {
    if (v3 == 1)
    {
      uint64_t v4 = (timespec *)((char *)*v2 + 472);
      clock_gettime(_CLOCK_REALTIME, v4);
    }
  }
  else if (([*v2 shutdownReason] & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050CB8((uint64_t)v2);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 57;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) connectToServer];
    unsigned int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v5)
    {
      int v6 = sub_100033040(v5);
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6)
      {
        if (v7) {
          sub_100050B50();
        }
        objc_msgSend(*v2, "setShutdownReason:", objc_msgSend(*v2, "shutdownReason") | 2);
        [*v2 setConnState:6];
        [*v2 cancelIdleTimer];
        int v8 = [*v2 connQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000B8E4;
        block[3] = &unk_100088838;
        block[4] = *v2;
        dispatch_barrier_async(v8, block);
      }
      else if (v7)
      {
        sub_100050C04();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100050AB0((uint64_t)v2);
      }
      *((_DWORD *)*v2 + 45) = 1;
      [*v2 resumeIdleTimer];
    }
  }
}

id sub_10000B8E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushAndDisconnect];
}

void sub_10000BBD4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connectionSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC64;
  block[3] = &unk_100088838;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_10000BC64(uint64_t a1)
{
  return [*(id *)(a1 + 32) idleTimerFired];
}

id sub_10000BD90(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  int v2 = (char *)[v1 openFileCounter] + *(void *)(a1 + 40);
  return [v1 setOpenFileCounter:v2];
}

id sub_10000BE6C(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 40);
  unint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = (id *)(a1 + 32);
  if (v2 <= (unint64_t)[*(id *)(a1 + 32) openFileCounter])
  {
    id v5 = *v3;
    int v6 = (char *)[v5 openFileCounter] - *v1;
    return [v5 setOpenFileCounter:v6];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100051158();
    }
    return [*v3 setOpenFileCounter:0];
  }
}

id sub_10000BF9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOpenFileCounter:0];
}

id sub_10000C03C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  unint64_t v2 = (char *)[v1 pendingChangeNotifyCount] + *(void *)(a1 + 40);
  return [v1 setPendingChangeNotifyCount:v2];
}

id sub_10000C118(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 40);
  unint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = (id *)(a1 + 32);
  if (v2 <= (unint64_t)[*(id *)(a1 + 32) pendingChangeNotifyCount])
  {
    id v5 = *v3;
    int v6 = (char *)[v5 pendingChangeNotifyCount] - *v1;
    return [v5 setPendingChangeNotifyCount:v6];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051218();
    }
    return [*v3 setPendingChangeNotifyCount:0];
  }
}

id sub_10000C248(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPendingChangeNotifyCount:0];
}

void sub_10000C374(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "setShutdownReason:", objc_msgSend(*(id *)(a1 + 32), "shutdownReason") | 1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000512D8(v1);
  }
}

id sub_10000C510(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFileNodesForConnection:*(void *)(a1 + 40)];
}

void sub_10000C850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C880(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C890(uint64_t a1)
{
}

id sub_10000C898(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C90C;
  v3[3] = &unk_100088888;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 prepareForReclaim:v3];
}

void sub_10000C90C(uint64_t a1)
{
}

void sub_10000CDE0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000CE88;
  v5[3] = &unk_1000888B0;
  v5[4] = v1;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v1 _LILookup:v2 name:v4 forClient:v3 reply:v5];
}

void sub_10000CE88(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  BOOL v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v10 = a3;
  uint64_t v9 = [v7 opsSyncGroup];
  dispatch_group_leave(v9);

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

void sub_10000D548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 240), 8);
  _Block_object_dispose((const void *)(v57 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D5A0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10000D5FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 lockMeta];
  if ([v3 isRevokedLocked])
  {
    [v3 unlockMeta];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v3, "setInUseClientSet:", *(void *)(a1 + 64) | (unint64_t)objc_msgSend(v3, "inUseClientSet"));
    [v3 unlockMeta];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D72C;
    v7[3] = &unk_100088950;
    uint64_t v12 = *(void *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    id v4 = v3;
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = v5;
    id v11 = v6;
    [v4 fetchAttrDataWithCompletionHandler:v7];
  }
}

void sub_10000D72C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    BOOL v7 = [*(id *)(a1 + 40) fh];
    (*(void (**)(uint64_t, void, void *, id))(v6 + 16))(v6, 0, v7, v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051698();
    }
    [*(id *)(a1 + 40) lockMeta];
    objc_msgSend(*(id *)(a1 + 40), "setInUseClientSet:", (unint64_t)objc_msgSend(*(id *)(a1 + 40), "inUseClientSet") & ~*(void *)(a1 + 72));
    [*(id *)(a1 + 40) unlockMeta];
    if (a3 == 2)
    {
      id v8 = [*(id *)(a1 + 48) nodeTableSyncQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D8B4;
      block[3] = &unk_100088928;
      int8x16_t v10 = *(int8x16_t *)(a1 + 40);
      id v9 = (id)v10.i64[0];
      int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
      dispatch_sync(v8, block);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_10000D8B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNodeDisappeared:*(void *)(a1 + 40)];
}

void sub_10000D8C0(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000D968(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DA30;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr queryNameInParent:v5 QueryName:v4 FAttrs:v6 CompletionHandler:v8];
}

uint64_t sub_10000DA30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000DA40(uint64_t a1, int a2)
{
  uint64_t v4 = *(long long **)(a1 + 88);
  long long v6 = v4[1];
  long long v5 = v4[2];
  long long v59 = *v4;
  long long v60 = v6;
  long long v61 = v5;
  long long v7 = v4[6];
  long long v9 = v4[3];
  long long v8 = v4[4];
  long long v64 = v4[5];
  long long v65 = v7;
  long long v62 = v9;
  long long v63 = v8;
  long long v10 = v4[10];
  long long v12 = v4[7];
  long long v11 = v4[8];
  long long v68 = v4[9];
  long long v69 = v10;
  long long v66 = v12;
  long long v67 = v11;
  long long v13 = v4[14];
  long long v15 = v4[11];
  long long v14 = v4[12];
  long long v72 = v4[13];
  long long v73 = v13;
  long long v70 = v15;
  long long v71 = v14;
  free(v4);
  if (a2)
  {
    if (a2 != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051738(a1, a2);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    long long v16 = [[smbNode alloc] initWithName:*(void *)(a1 + 32) andParent:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) andAttr:&v59];
    if (v16)
    {
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10000DF7C;
      v53[3] = &unk_100088A40;
      uint64_t v17 = *(void *)(a1 + 80);
      long long v18 = *(void **)(a1 + 48);
      v53[4] = *(void *)(a1 + 40);
      uint64_t v57 = v17;
      id v54 = v18;
      id v55 = *(id *)(a1 + 32);
      id v19 = *(id *)(a1 + 64);
      uint64_t v20 = *(void *)(a1 + 72);
      id v56 = v19;
      uint64_t v58 = v20;
      v21 = objc_retainBlock(v53);
      id v22 = v21;
      if (DWORD2(v66) == 5)
      {
        uint64_t v47 = 0;
        v48 = &v47;
        uint64_t v49 = 0x3032000000;
        v50 = sub_10000C880;
        v51 = sub_10000C890;
        id v52 = 0;
        v23 = *(void **)(a1 + 40);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10000E2C4;
        v44[3] = &unk_100088A90;
        v45 = v16;
        v46 = &v47;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000E3EC;
        v38[3] = &unk_100088AB8;
        id v39 = *(id *)(a1 + 32);
        id v41 = *(id *)(a1 + 56);
        v40 = v45;
        v43 = &v47;
        id v42 = v22;
        [v23 submitRequestBlock:v44 continuationBlock:v38];

        _Block_object_dispose(&v47, 8);
      }
      else if (DWORD2(v66) == 1 && (void)v60 == 1067)
      {
        uint64_t v47 = 0;
        v48 = &v47;
        uint64_t v49 = 0x3032000000;
        v50 = sub_10000C880;
        v51 = sub_10000C890;
        id v52 = 0;
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x2020000000;
        char v37 = 0;
        v24 = *(void **)(a1 + 40);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10000E494;
        v32[3] = &unk_100088B08;
        v33 = v16;
        v34 = v36;
        v35 = &v47;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10000E5D0;
        v25[3] = &unk_100088B30;
        id v26 = *(id *)(a1 + 32);
        id v28 = *(id *)(a1 + 56);
        v30 = v36;
        v27 = v33;
        v31 = &v47;
        id v29 = v22;
        [v24 submitRequestBlock:v32 continuationBlock:v25];

        _Block_object_dispose(v36, 8);
        _Block_object_dispose(&v47, 8);
      }
      else
      {
        ((void (*)(void *, smbNode *))v21[2])(v21, v16);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100051800((uint64_t *)(a1 + 72));
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void sub_10000DF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_10000DF7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) nodeTableSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E124;
  block[3] = &unk_1000889A0;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 64);
  void block[4] = v5;
  id v18 = v6;
  id v19 = *(id *)(a1 + 48);
  dispatch_sync(v4, block);

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    long long v7 = [*(id *)(a1 + 32) nodeTableSyncQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000E1CC;
    v13[3] = &unk_100088A18;
    v13[4] = *(void *)(a1 + 32);
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 72);
    id v14 = v8;
    uint64_t v16 = v9;
    id v15 = *(id *)(a1 + 48);
    dispatch_sync(v7, v13);

    (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v8, v10, v11, v12);
  }
}

void sub_10000E124(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000E1CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handleTable];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 fh];
  [v2 setObject:v3 forKey:v4];

  id v8 = [*(id *)(a1 + 32) nameTable];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fh];
  id v7 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v6, *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  [v8 setObject:v5 forKey:v7];
}

void sub_10000E2C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E370;
  v7[3] = &unk_100088A68;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  +[smb_subr readReparseSymlink:v5 completionHandler:v7];
}

void sub_10000E370(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000E3EC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000518A0(a1);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) setReparseSymLink:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v4();
  }
}

void sub_10000E494(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E548;
  v6[3] = &unk_100088AE0;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  +[smb_subr checkForWindowsSymlink:v4 CompletionHandler:v6];
}

void sub_10000E548(void *a1, int a2, char a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v6 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t sub_10000E5D0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051928(a1);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      [*(id *)(a1 + 40) setWindowsSymLink:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    }
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v4();
  }
}

void sub_10000E78C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E820;
  v3[3] = &unk_100088B80;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _getAttr:v2 reply:v3];
}

void sub_10000E820(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = a3;
  id v5 = [v4 opsSyncGroup];
  dispatch_group_leave(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000EB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_10000EB80(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10000EBDC(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051A00(a1);
    }
    if (a3 == 2)
    {
      id v7 = [*(id *)(a1 + 32) nodeTableSyncQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000ECEC;
      v9[3] = &unk_100088810;
      uint64_t v8 = *(void *)(a1 + 48);
      v9[4] = *(void *)(a1 + 32);
      v9[5] = v8;
      dispatch_sync(v7, v9);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

id sub_10000ECEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNodeDisappeared:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_10000EE14(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EEB8;
  v4[3] = &unk_100088BF8;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v1 _LIOpen:v2 withMode:v3 reply:v4];
}

uint64_t sub_10000EEB8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10000F4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose((const void *)(v60 - 224), 8);
  _Block_object_dispose((const void *)(v60 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F508(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

uint64_t sub_10000F564(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) findSharedFileRef:*(unsigned int *)(a1 + 48)];
  return _objc_release_x1();
}

void sub_10000F5BC(void *a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1[4] + 8) + 40) isViable])
  {
    uint64_t v4 = *(void *)(*(void *)(a1[4] + 8) + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000F6C8;
    v8[3] = &unk_100088C70;
    uint64_t v5 = a1[6];
    uint64_t v10 = a1[5];
    id v9 = v3;
    +[smb_subr openFileNode:v4 withStream:0 withArgs:v5 CompletionHandler:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1[5] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    (*((void (**)(id, uint64_t))v3 + 2))(v3, 5);
  }
}

void sub_10000F6C8(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F744(uint64_t a1)
{
  free(*(void **)(a1 + 80));
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fileRefSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F90C;
  block[3] = &unk_100088C48;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  int v10 = *(_DWORD *)(a1 + 88);
  dispatch_sync(v2, block);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setFidCtx:");
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setCreateDisposition:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 32)];
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fileRefSyncQueue];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10000F964;
      v7[3] = &unk_100088CC0;
      uint64_t v5 = *(void *)(a1 + 64);
      void v7[4] = *(void *)(a1 + 40);
      v7[5] = v5;
      dispatch_sync(v4, v7);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100051BCC((uint64_t *)(a1 + 40));
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  return v3();
}

uint64_t sub_10000F90C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) findSharedFileRef:*(unsigned int *)(a1 + 48)];
  return _objc_release_x1();
}

id sub_10000F964(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addNewFileRef:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_10000FA90(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000FB34;
  v4[3] = &unk_100088D10;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v1 _LIClose:v2 keepingMode:v3 reply:v4];
}

void sub_10000FB34(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a5;
  id v10 = a3;
  int8x16_t v9 = [v7 opsSyncGroup];
  dispatch_group_leave(v9);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000100C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Block_object_dispose((const void *)(v45 - 208), 8);
  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose((const void *)(v45 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010144(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_1000101A0(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 96);
  v4[0] = _NSConcreteStackBlock;
  int8x16_t v2 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v4[1] = 3221225472;
  v4[2] = sub_100010260;
  v4[3] = &unk_100088D38;
  int8x16_t v6 = v2;
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  id v5 = *(id *)(a1 + 32);
  [v3 closeFileRefWithMode:v1 CompletionHandler:v4];
}

uint64_t sub_100010260(void *a1, int a2, int a3)
{
  if (!(a3 | a2))
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) interestedClients];
    uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) name];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v4 hasPrefix:@"."] ^ 1;

    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) wasWritten] != 0;
    [*(id *)(*(void *)(a1[6] + 8) + 40) setWasWritten:0];
    if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
    {
      id v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) parent];

      if (v5)
      {
        int8x16_t v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) parent];
        uint64_t v7 = [v6 fh];
        uint64_t v8 = *(void *)(a1[9] + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        id v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) parent];
        *(void *)(*(void *)(a1[10] + 8) + 24) = [v10 interestedClients];

        uint64_t v11 = [*(id *)(*(void *)(a1[6] + 8) + 40) name];
        uint64_t v12 = *(void *)(a1[11] + 8);
        long long v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
    }
  }
  id v14 = *(uint64_t (**)(void))(a1[4] + 16);
  return v14();
}

void sub_100010548(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000105E8;
  v4[3] = &unk_100088BF8;
  void v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 _LIReclaim:v2 forClient:v3 reply:v4];
}

uint64_t sub_1000105E8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_1000109E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_100010A1C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100010A78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nameTable];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) parent];
  uint64_t v4 = [v3 fh];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
  id v6 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v4, v5, [*(id *)(a1 + 32) isCaseSensitive]);
  [v2 removeObjectForKey:v6];

  id v8 = [*(id *)(a1 + 32) handleTable];
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fh];
  [v8 removeObjectForKey:v7];
}

void sub_100010B90(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100010C24;
  v2[3] = &unk_1000889C8;
  id v3 = *(id *)(a1 + 32);
  [v1 prepareForReclaim:v2];
}

uint64_t sub_100010C24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010D78(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010E2C;
  v6[3] = &unk_100088DD8;
  void v6[4] = v1;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v1 _LIReadDir:v2 intoBuffer:v5 forCookie:v3 andVerifier:v4 reply:v6];
}

uint64_t sub_100010E2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_1000113C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Block_object_dispose((const void *)(v45 - 224), 8);
  _Block_object_dispose((const void *)(v45 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011424(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100011480(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) bytes];
  id v6 = [*(id *)(a1 + 40) length];
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011590;
  v12[3] = &unk_100088E28;
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v13 = v3;
  uint64_t v14 = v10;
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  v12[4] = v9;
  id v11 = v3;
  [v4 getEntriesInBuffer:v5 BufferLen:v6 CookieIn:v7 VerifyIn:v8 IsReadDirAttr:0 CompletionHandler:v12];
}

uint64_t sub_100011590(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a5;
  id v13 = (void *)a1[4];
  if (!v13)
  {
    uint64_t v16 = 0;
    long long v15 = 0u;
LABEL_7:
    *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
    *(void *)(*(void *)(a1[8] + 8) + 24) = a3;
    goto LABEL_8;
  }
  [v13 shareInfo];
  if ((BYTE8(v15) & 1) == 0 || a2 != 13 || (WORD4(v15) & 0x200) != 0) {
    goto LABEL_7;
  }
  a2 = 0;
  *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  char v8 = 1;
LABEL_8:
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v8;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(a1[5] + 16))(a1[5], a2, a3, a4, a5, a6, a7, a8, v15, *((void *)&v15 + 1), v16);
}

uint64_t sub_100011660(uint64_t a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100052098();
    if (a2) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  if (!a2) {
    goto LABEL_7;
  }
LABEL_3:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100051FEC();
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

void sub_100011858(uint64_t a1, int a2, unint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) createDispatchData];
  uint64_t v7 = v6;
  if (a2)
  {
    char v8 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48) <= a3) {
      goto LABEL_6;
    }
    id v10 = v6;
    uint64_t v9 = objc_msgSend(v6, "subdataWithRange:", 0, a3);
    uint64_t v7 = v10;
    char v8 = (void *)v9;
  }

  uint64_t v7 = v8;
LABEL_6:
  id v11 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011A70(uint64_t a1, int a2, unint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) createDispatchData];
  uint64_t v7 = v6;
  if (a2)
  {
    char v8 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48) <= a3) {
      goto LABEL_6;
    }
    id v10 = v6;
    uint64_t v9 = objc_msgSend(v6, "subdataWithRange:", 0, a3);
    uint64_t v7 = v10;
    char v8 = (void *)v9;
  }

  uint64_t v7 = v8;
LABEL_6:
  id v11 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011C78(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011D2C;
  v6[3] = &unk_100088DD8;
  void v6[4] = v1;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v1 _LIReadDirAndAttrs:v2 intoBuffer:v5 forCookie:v3 andVerifier:v4 reply:v6];
}

uint64_t sub_100011D2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10001226C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 256), 8);
  _Block_object_dispose((const void *)(v43 - 224), 8);
  _Block_object_dispose((const void *)(v43 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000122C8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100012324(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) bytes];
  id v6 = [*(id *)(a1 + 40) length];
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012430;
  v10[3] = &unk_100088EC8;
  long long v12 = *(_OWORD *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);
  id v11 = v3;
  id v9 = v3;
  [v4 getEntriesInBuffer:v5 BufferLen:v6 CookieIn:v7 VerifyIn:v8 IsReadDirAttr:1 CompletionHandler:v10];
}

uint64_t sub_100012430(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a4;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a5;
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t sub_100012464(uint64_t a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100052390();
    if (a2) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  if (!a2) {
    goto LABEL_7;
  }
LABEL_3:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000522E4();
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

void sub_100012674(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012728;
  v6[3] = &unk_100088F18;
  void v6[4] = v1;
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  [v1 _LICreate:v2 named:v3 withAttrs:v4 andClient:v5 reply:v6];
}

void sub_100012728(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a6;
  id v11 = a5;
  id v13 = a3;
  long long v12 = [v9 opsSyncGroup];
  dispatch_group_leave(v12);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100012E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v67 - 240), 8);
  _Block_object_dispose((const void *)(v67 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012EE0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100012F3C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100012FE4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000130B0;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr createFile:v5 NewName:v4 FileType:1 RetAttr:v6 CompletionHandler:v8];
}

uint64_t sub_1000130B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000130C0(uint64_t a1, int a2)
{
  uint64_t v4 = *(_OWORD **)(a1 + 112);
  long long v6 = v4[1];
  long long v5 = v4[2];
  v45[0] = *v4;
  v45[1] = v6;
  v45[2] = v5;
  long long v7 = v4[6];
  long long v9 = v4[3];
  long long v8 = v4[4];
  v45[5] = v4[5];
  v45[6] = v7;
  v45[3] = v9;
  v45[4] = v8;
  long long v10 = v4[10];
  long long v12 = v4[7];
  long long v11 = v4[8];
  v45[9] = v4[9];
  v45[10] = v10;
  v45[7] = v12;
  v45[8] = v11;
  long long v13 = v4[14];
  long long v15 = v4[11];
  long long v14 = v4[12];
  v45[13] = v4[13];
  v45[14] = v13;
  v45[11] = v15;
  v45[12] = v14;
  free(v4);
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000525F4(a1);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000133EC;
    v39[3] = &unk_100088F68;
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v44 = *(void *)(a1 + 120);
    uint64_t v42 = v16;
    int8x16_t v30 = *(int8x16_t *)(a1 + 32);
    id v17 = (id)v30.i64[0];
    int8x16_t v40 = vextq_s8(v30, v30, 8uLL);
    uint64_t v43 = *(void *)(a1 + 72);
    id v41 = *(id *)(a1 + 56);
    id v18 = objc_retainBlock(v39);
    id v19 = [[smbNode alloc] initWithName:*(void *)(a1 + 32) andParent:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) andAttr:v45];
    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(a1 + 48) bytes];
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      *(void *)(v22 + 8) &= 0xFFFFFFFFFFFFFFE7;
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      v24 = *(void **)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100013668;
      v31[3] = &unk_100089008;
      uint64_t v35 = *(void *)(a1 + 64);
      id v32 = *(id *)(a1 + 32);
      id v26 = *(id *)(a1 + 56);
      uint64_t v28 = *(void *)(a1 + 96);
      uint64_t v27 = *(void *)(a1 + 104);
      id v33 = v26;
      uint64_t v29 = *(void *)(a1 + 80);
      uint64_t v36 = v28;
      uint64_t v37 = v29;
      uint64_t v38 = v27;
      v34 = v18;
      [v24 setAttrInternalLocked:v23 setAttrs:v25 CompletionHandler:v31];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005255C((uint64_t *)(a1 + 64));
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void sub_1000133EC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v7, "setInUseClientSet:", *(void *)(a1 + 72) | (unint64_t)objc_msgSend(v7, "inUseClientSet"));
  long long v10 = [*(id *)(a1 + 32) nodeTableSyncQueue];
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100013570;
  id v19 = &unk_100088A18;
  long long v11 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = v7;
  uint64_t v23 = *(void *)(a1 + 56);
  id v22 = v11;
  id v12 = v7;
  dispatch_sync(v10, &v16);

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "interestedClients", v16, v17, v18, v19, v20);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidateAttrs];
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  long long v15 = [v12 fh];
  (*(void (**)(uint64_t, void, id, uint64_t, void *, id))(v13 + 16))(v13, 0, v9, v14, v15, v8);
}

void sub_100013570(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handleTable];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 fh];
  [v2 setObject:v3 forKey:v4];

  id v8 = [*(id *)(a1 + 32) nameTable];
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fh];
  id v7 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v6, *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  [v8 setObject:v5 forKey:v7];
}

void sub_100013668(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052698();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void **)(*(void *)(v3 + 8) + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013790;
    v5[3] = &unk_100088FE0;
    uint64_t v9 = v3;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    long long v10 = *(_OWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 80);
    id v8 = *(id *)(a1 + 48);
    [v4 fetchAttrDataWithCompletionHandler:v5];
  }
}

void sub_100013790(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100013988;
    v13[3] = &unk_100088FB8;
    uint64_t v17 = *(void *)(a1 + 56);
    id v8 = &v14;
    id v14 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 80);
    id v15 = v9;
    uint64_t v18 = v10;
    id v16 = *(id *)(a1 + 48);
    int8x16_t v19 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    [v7 fetchAttrDataWithCompletionHandler:v13];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052738();
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100013960;
    v20[3] = &unk_100088F90;
    id v8 = &v21;
    uint64_t v12 = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    int v22 = a3;
    +[smb_subr deleteNameInParent:v11 DeleteName:v12 FileType:1 CompletionHandler:v20];
  }
}

uint64_t sub_100013960(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0, 0, 0, 0);
}

void sub_100013988(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000527D8();
    }
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013AC8;
    v7[3] = &unk_1000889C8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    +[smb_subr deleteNameInParent:v5 DeleteName:v6 FileType:1 CompletionHandler:v7];
  }
}

uint64_t sub_100013AC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013C44(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013CF8;
  v6[3] = &unk_100088F18;
  void v6[4] = v1;
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  [v1 _LIMakeDir:v2 named:v3 withAttrs:v4 andClient:v5 reply:v6];
}

void sub_100013CF8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a6;
  id v11 = a5;
  id v13 = a3;
  uint64_t v12 = [v9 opsSyncGroup];
  dispatch_group_leave(v12);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100014430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 240), 8);
  _Block_object_dispose((const void *)(v69 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000144B0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10001450C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000145B4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014680;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr createFile:v5 NewName:v4 FileType:2 RetAttr:v6 CompletionHandler:v8];
}

uint64_t sub_100014680(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014690(uint64_t a1, int a2)
{
  uint64_t v4 = *(_OWORD **)(a1 + 112);
  long long v6 = v4[1];
  long long v5 = v4[2];
  v45[0] = *v4;
  v45[1] = v6;
  v45[2] = v5;
  long long v7 = v4[6];
  long long v9 = v4[3];
  long long v8 = v4[4];
  v45[5] = v4[5];
  v45[6] = v7;
  v45[3] = v9;
  v45[4] = v8;
  long long v10 = v4[10];
  long long v12 = v4[7];
  long long v11 = v4[8];
  v45[9] = v4[9];
  v45[10] = v10;
  v45[7] = v12;
  v45[8] = v11;
  long long v13 = v4[14];
  long long v15 = v4[11];
  long long v14 = v4[12];
  v45[13] = v4[13];
  v45[14] = v13;
  v45[11] = v15;
  v45[12] = v14;
  free(v4);
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052A6C(a1);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000149BC;
    v39[3] = &unk_100088F68;
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v44 = *(void *)(a1 + 120);
    uint64_t v42 = v16;
    int8x16_t v30 = *(int8x16_t *)(a1 + 32);
    id v17 = (id)v30.i64[0];
    int8x16_t v40 = vextq_s8(v30, v30, 8uLL);
    uint64_t v43 = *(void *)(a1 + 72);
    id v41 = *(id *)(a1 + 56);
    uint64_t v18 = objc_retainBlock(v39);
    int8x16_t v19 = [[smbNode alloc] initWithName:*(void *)(a1 + 32) andParent:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) andAttr:v45];
    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(a1 + 48) bytes];
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      *(void *)(v22 + 8) &= 0xFFFFFFFFFFFFFFE7;
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      v24 = *(void **)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100014C38;
      v31[3] = &unk_100089008;
      uint64_t v35 = *(void *)(a1 + 64);
      id v32 = *(id *)(a1 + 32);
      id v26 = *(id *)(a1 + 56);
      uint64_t v28 = *(void *)(a1 + 96);
      uint64_t v27 = *(void *)(a1 + 104);
      id v33 = v26;
      uint64_t v29 = *(void *)(a1 + 80);
      uint64_t v36 = v28;
      uint64_t v37 = v29;
      uint64_t v38 = v27;
      v34 = v18;
      [v24 setAttrInternalLocked:v23 setAttrs:v25 CompletionHandler:v31];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000529D4((uint64_t *)(a1 + 64));
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void sub_1000149BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v7, "setInUseClientSet:", *(void *)(a1 + 72) | (unint64_t)objc_msgSend(v7, "inUseClientSet"));
  long long v10 = [*(id *)(a1 + 32) nodeTableSyncQueue];
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_100014B40;
  int8x16_t v19 = &unk_100088A18;
  long long v11 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = v7;
  uint64_t v23 = *(void *)(a1 + 56);
  id v22 = v11;
  id v12 = v7;
  dispatch_sync(v10, &v16);

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "interestedClients", v16, v17, v18, v19, v20);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidateAttrs];
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  long long v15 = [v12 fh];
  (*(void (**)(uint64_t, void, id, uint64_t, void *, id))(v13 + 16))(v13, 0, v9, v14, v15, v8);
}

void sub_100014B40(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handleTable];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 fh];
  [v2 setObject:v3 forKey:v4];

  id v8 = [*(id *)(a1 + 32) nameTable];
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fh];
  id v7 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v6, *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  [v8 setObject:v5 forKey:v7];
}

void sub_100014C38(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052B10();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void **)(*(void *)(v3 + 8) + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100014D60;
    v5[3] = &unk_100088FE0;
    uint64_t v9 = v3;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    long long v10 = *(_OWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 80);
    id v8 = *(id *)(a1 + 48);
    [v4 fetchAttrDataWithCompletionHandler:v5];
  }
}

void sub_100014D60(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014F54;
    v12[3] = &unk_100089058;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 80);
    uint64_t v17 = v8;
    uint64_t v9 = &v13;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    int8x16_t v18 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    [v7 fetchAttrDataWithCompletionHandler:v12];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052BB0();
    }
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100014F2C;
    v19[3] = &unk_100088F90;
    uint64_t v9 = &v20;
    uint64_t v11 = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    int v21 = a3;
    +[smb_subr deleteNameInParent:v10 DeleteName:v11 FileType:2 CompletionHandler:v19];
  }
}

uint64_t sub_100014F2C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0, 0, 0, 0);
}

void sub_100014F54(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v6 || *(void *)(v7 + 40))
  {
    objc_storeStrong((id *)(v7 + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052C50();
    }
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001509C;
    v10[3] = &unk_100088F90;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    int v12 = a3;
    +[smb_subr deleteNameInParent:v8 DeleteName:v9 FileType:2 CompletionHandler:v10];
  }
}

uint64_t sub_10001509C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0, 0, 0, 0);
}

void sub_1000151F0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015290;
  v4[3] = &unk_100088B80;
  void v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _LIGetFsAttr:v2 name:v3 reply:v4];
}

void sub_100015290(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = a3;
  id v5 = [v4 opsSyncGroup];
  dispatch_group_leave(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100016024(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10001607C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016158;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100016158(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
    free(a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_1000161B4(void *a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[4] + 16);
    v3();
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 32) = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v4 = +[NSData dataWithBytes:*(void *)(a1[5] + 8) + 32 length:8];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_100016284(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016360;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100016360(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
    free(a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_1000163BC(void *a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[4] + 16);
    v3();
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 32) = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v4 = +[NSData dataWithBytes:*(void *)(a1[5] + 8) + 32 length:8];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_10001648C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016568;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100016568(uint64_t a1, int a2, void *a3, unint64_t a4)
{
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3 / a4;
    free(a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_1000165CC(void *a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[4] + 16);
    v3();
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 32) = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v4 = +[NSData dataWithBytes:*(void *)(a1[5] + 8) + 32 length:8];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_10001669C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016778;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100016778(uint64_t a1, int a2, void *a3, unint64_t a4)
{
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3[2] / a4;
    free(a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_1000167DC(void *a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[4] + 16);
    v3();
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 32) = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v4 = +[NSData dataWithBytes:*(void *)(a1[5] + 8) + 32 length:8];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1000168AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016988;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100016988(uint64_t a1, int a2, void *a3, unint64_t a4)
{
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3[1] / a4;
    free(a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_1000169EC(void *a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[4] + 16);
    v3();
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 32) = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v4 = +[NSData dataWithBytes:*(void *)(a1[5] + 8) + 32 length:8];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_100016ABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016B98;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100016B98(uint64_t a1, int a2, void *a3, unint64_t a4)
{
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*a3 - a3[1]) / a4;
    free(a3);
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_100016C00(void *a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[4] + 16);
    v3();
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 32) = *(void *)(*(void *)(a1[6] + 8) + 24);
    id v4 = +[NSData dataWithBytes:*(void *)(a1[5] + 8) + 32 length:8];
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_100016E6C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 80);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016F28;
  v7[3] = &unk_100088F18;
  void v7[4] = v1;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v1 _LIMakeSymLink:v2 named:v3 withContents:v4 andAttrs:v6 andClient:v5 reply:v7];
}

void sub_100016F28(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a6;
  id v11 = a5;
  id v13 = a3;
  int v12 = [v9 opsSyncGroup];
  dispatch_group_leave(v12);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100017928(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000179C0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100017A1C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100017AC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  objc_msgSend(v9, "setInUseClientSet:", *(void *)(a1 + 72) | (unint64_t)objc_msgSend(v9, "inUseClientSet"));
  id v10 = [*(id *)(a1 + 32) handleTable];
  id v11 = [v9 fh];
  [v10 setObject:v9 forKey:v11];

  int v12 = [*(id *)(a1 + 32) nameTable];
  id v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fh];
  id v14 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v13, *(void *)(a1 + 40), [*(id *)(a1 + 32) isCaseSensitive]);
  [v12 setObject:v9 forKey:v14];

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) interestedClients];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidateAttrs];
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v17 = [v9 fh];

  (*(void (**)(uint64_t, void, id, uint64_t, id, id))(v15 + 16))(v15, 0, v8, v16, v17, v7);
}

void sub_100017C6C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052F34();
    }
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_5:
    v3();
    return;
  }
  uint64_t v4 = [[smbNode alloc] initWithName:*(void *)(a1 + 40) andParent:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) andAttr:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  free(*(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052E9C((uint64_t *)(a1 + 80));
    }
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
    [v7 setWindowsSymLink:v8];
  }
  else {
    [v7 setReparseSymLink:v8];
  }
  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [*(id *)(a1 + 48) bytes];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100017E88;
  v17[3] = &unk_100089170;
  uint64_t v21 = *(void *)(a1 + 80);
  id v18 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 104);
  id v19 = v12;
  uint64_t v14 = *(void *)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 120);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v22 = v13;
  uint64_t v23 = v15;
  uint64_t v24 = v14;
  uint64_t v25 = v16;
  id v20 = *(id *)(a1 + 72);
  [v10 setAttrInternalLocked:v9 setAttrs:v11 CompletionHandler:v17];
}

void sub_100017E88(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052FD4();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void **)(*(void *)(v3 + 8) + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100017FB8;
    v7[3] = &unk_100089148;
    uint64_t v11 = v3;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    id v8 = v5;
    uint64_t v12 = v6;
    id v9 = *(id *)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 88);
    id v10 = *(id *)(a1 + 48);
    [v4 fetchAttrDataWithCompletionHandler:v7];
  }
}

void sub_100017FB8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000181C0;
    v14[3] = &unk_100089120;
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v6 = &v15;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 64);
    id v15 = v7;
    uint64_t v19 = v8;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 88);
    id v16 = v9;
    uint64_t v20 = v10;
    id v17 = *(id *)(a1 + 48);
    int8x16_t v21 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    [v5 fetchAttrDataWithCompletionHandler:v14];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053074();
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 5;
    }
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000181A0;
    v22[3] = &unk_1000889C8;
    uint64_t v6 = &v23;
    uint64_t v13 = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 40);
    +[smb_subr deleteNameInParent:v12 DeleteName:v13 FileType:v11 CompletionHandler:v22];
  }
}

uint64_t sub_1000181A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000181C0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053114();
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 5;
    }
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018314;
    v8[3] = &unk_1000889C8;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    +[smb_subr deleteNameInParent:v6 DeleteName:v7 FileType:v5 CompletionHandler:v8];
  }
}

uint64_t sub_100018314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018334(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(v4 + 8) + 24);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018408;
  v10[3] = &unk_1000889C8;
  id v11 = v3;
  id v9 = v3;
  +[smb_subr createReparseSymlink:v5 NewName:v7 Target:v6 RetAttr:v8 CompletionHandler:v10];
}

uint64_t sub_100018408(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018418(uint64_t a1, int a2)
{
  if (a2 == 45)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v3) {
      sub_1000531B4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSm_flags:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "sm_flags") & 0xFFFFFFFE);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100018598;
    v18[3] = &unk_1000891C0;
    uint64_t v21 = *(void *)(a1 + 64);
    id v11 = *(void **)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 72);
    id v20 = v12;
    uint64_t v22 = v13;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001867C;
    v15[3] = &unk_1000891E8;
    uint64_t v17 = *(void *)(a1 + 80);
    id v16 = *(id *)(a1 + 56);
    [v11 submitRequestBlockOnce:v18 continuationBlock:v15];
  }
  else
  {
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v14();
  }
}

void sub_100018598(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(v4 + 8) + 24);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001866C;
  v10[3] = &unk_1000889C8;
  id v11 = v3;
  id v9 = v3;
  +[smb_subr createWindowsSymlink:v5 NewName:v7 Target:v6 RetAttr:v8 CompletionHandler:v10];
}

uint64_t sub_10001866C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001867C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001869C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(v4 + 8) + 24);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018770;
  v10[3] = &unk_1000889C8;
  id v11 = v3;
  id v9 = v3;
  +[smb_subr createWindowsSymlink:v5 NewName:v7 Target:v6 RetAttr:v8 CompletionHandler:v10];
}

uint64_t sub_100018770(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100018780(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000188E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001897C;
  v3[3] = &unk_100088B80;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _LIPathConf:v2 reply:v3];
}

void sub_10001897C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v5 = [v4 opsSyncGroup];
  dispatch_group_leave(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100018C60(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018D18;
  v6[3] = &unk_100089238;
  void v6[4] = v1;
  id v7 = *(id *)(a1 + 48);
  [v1 _LIRead:v2 atOffset:v3 withPointer:v4 length:v5 reply:v6];
}

uint64_t sub_100018D18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10001919C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000191E0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

uint64_t sub_10001923C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fileRefForRead];
  return _objc_release_x1();
}

void sub_1000193F8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 && !*(_DWORD *)(a1 + 120))
  {
    if (v2 > [*(id *)(a1 + 40) serverMaxRd]) {
      unint64_t v2 = [*(id *)(a1 + 40) serverMaxRd];
    }
    uint64_t v4 = *(_OWORD **)(a1 + 80);
    *uint64_t v4 = 0u;
    v4[1] = 0u;
    uint64_t v5 = *(void *)(a1 + 104);
    *(void *)(*(void *)(a1 + 80) + 8) = *(void *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 80);
    *(_DWORD *)(v6 + 16) = v2;
    *(void *)uint64_t v6 = v5;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000195FC;
    v32[3] = &unk_100089288;
    id v7 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 80);
    id v33 = v8;
    uint64_t v34 = v9;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000196D8;
    v19[3] = &unk_1000892B0;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 104);
    uint64_t v25 = *(void *)(a1 + 112);
    unint64_t v26 = v2;
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v27 = v11;
    uint64_t v28 = v12;
    uint64_t v29 = v13;
    uint64_t v14 = *(void *)(a1 + 40);
    id v20 = v10;
    uint64_t v21 = v14;
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 96);
    id v22 = v15;
    uint64_t v30 = v16;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 88);
    id v23 = v17;
    uint64_t v31 = v18;
    id v24 = *(id *)(a1 + 64);
    [v7 submitRequestBlock:v32 continuationBlock:v19];
  }
  else
  {
    free(*(void **)(a1 + 80));
    [*(id *)(a1 + 32) decRef];
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
}

void sub_1000195FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) fidCtx];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000196C8;
  v7[3] = &unk_1000889C8;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr sendRead:v4 Param:v5 ReadBuf:0 CompletionHandler:v7];
}

uint64_t sub_1000196C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000196D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = a2;
    if (a2 == 96)
    {
      uint64_t v3 = 0;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100053384();
    }
    return [*(id *)(a1 + 40) readRequest:*(void *)(a1 + 48) bptr:*(void *)(a1 + 112) smbNode:*(void *)(a1 + 32) fileRef:*(void *)(a1 + 56) rdparamPtr:*(void *)(a1 + 104) result:v3 thisOffset:*(void *)(a1 + 88) bytesRemain:0 bytesRead:*(void *)(a1 + 120) pass:*(void *)(a1 + 72) + 1 reply:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 104);
    uint64_t v5 = *(unsigned int *)(v4 + 28);
    return [*(id *)(a1 + 40) readRequest:*(void *)(a1 + 48) bptr:*(void *)(a1 + 112) + v5 smbNode:*(void *)(a1 + 32) fileRef:*(void *)(a1 + 56) rdparamPtr:v4 result:0 thisOffset:*(void *)(a1 + 88) + v5 bytesRemain:*(void *)(a1 + 96) - v5 bytesRead:*(void *)(a1 + 120) + v5 pass:*(void *)(a1 + 72) + 1 reply:*(void *)(a1 + 64)];
  }
}

void sub_100019940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019958(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100019B00(uint64_t a1, int a2, unint64_t a3)
{
  if (a2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
    if (*(void *)(a1 + 48) > a3)
    {
      id v7 = v4;
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, a3);

      id v4 = (id)v6;
    }
  }
  id v8 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100019CB4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100019D48;
  v3[3] = &unk_1000888B0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _LIReadLink:v2 reply:v3];
}

void sub_100019D48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v9 = a3;
  id v8 = [v6 opsSyncGroup];
  dispatch_group_leave(v8);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001A2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A320(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10001A37C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (a3 == 2)
    {
      id v7 = [*(id *)(a1 + 32) nodeTableSyncQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001A478;
      v9[3] = &unk_100088810;
      uint64_t v8 = *(void *)(a1 + 48);
      v9[4] = *(void *)(a1 + 32);
      v9[5] = v8;
      dispatch_sync(v7, v9);
    }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

id sub_10001A478(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNodeDisappeared:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_10001A48C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A544;
  v7[3] = &unk_100088A68;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  +[smb_subr readSymlink:v4 completionHandler:v7];
}

void sub_10001A544(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A5C0(void *a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053648((uint64_t)a1);
    }
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) lockMeta];
    unsigned __int8 v3 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "np_flag");
    uint64_t v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 40);
    if ((v3 & 2) != 0) {
      [v4 setReparseSymLink:v5];
    }
    else {
      [v4 setWindowsSymLink:v5];
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) unlockMeta];
    uint64_t v6 = a1[6];
    id v7 = *(void **)(*(void *)(v6 + 8) + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001A70C;
    v11[3] = &unk_100089350;
    id v8 = (void *)a1[5];
    v11[4] = a1[4];
    uint64_t v13 = v6;
    id v9 = v8;
    uint64_t v10 = a1[7];
    id v12 = v9;
    uint64_t v14 = v10;
    [v7 fetchAttrDataWithCompletionHandler:v11];
  }
}

void sub_10001A70C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (a3 == 2)
    {
      id v7 = [*(id *)(a1 + 32) nodeTableSyncQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001A818;
      v9[3] = &unk_100088810;
      uint64_t v8 = *(void *)(a1 + 48);
      v9[4] = *(void *)(a1 + 32);
      v9[5] = v8;
      dispatch_sync(v7, v9);
    }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

id sub_10001A818(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNodeDisappeared:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_10001A9E0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001AA80;
  v4[3] = &unk_1000893C8;
  void v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _LIRemove:v2 name:v3 reply:v4];
}

void sub_10001AA80(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a6;
  id v11 = a3;
  uint64_t v10 = [v8 namespaceChangingGroup];
  dispatch_group_leave(v10);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001B060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 240), 8);
  _Block_object_dispose((const void *)(v51 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B0B8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10001B114(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001B264;
  v19[3] = &unk_1000893F0;
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 72);
  id v20 = v5;
  uint64_t v22 = v6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001B344;
  v12[3] = &unk_100089468;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v7;
  uint64_t v17 = *(void *)(a1 + 64);
  id v15 = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v16 = v9;
  uint64_t v18 = v10;
  id v11 = v3;
  [v4 submitRequestBlockOnce:v19 continuationBlock:v12];
}

void sub_10001B264(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v6 = *(unsigned int *)(*(void *)(a1[6] + 8) + 24);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B334;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr deleteNameInParent:v5 DeleteName:v4 FileType:v6 CompletionHandler:v8];
}

uint64_t sub_10001B334(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001B344(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053850();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = [*(id *)(a1 + 40) nodeTableSyncQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001B518;
      block[3] = &unk_100089418;
      uint64_t v18 = *(void *)(a1 + 64);
      int8x16_t v9 = *(int8x16_t *)(a1 + 32);
      id v4 = (id)v9.i64[0];
      int8x16_t v17 = vextq_s8(v9, v9, 8uLL);
      dispatch_sync(v3, block);
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "invalidateAttrs", *(_OWORD *)&v9);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void **)(*(void *)(v5 + 8) + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001B5D4;
    v10[3] = &unk_100089440;
    uint64_t v14 = v5;
    id v11 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 72);
    id v12 = v7;
    uint64_t v15 = v8;
    [v6 fetchAttrDataWithCompletionHandler:v10];
  }
}

void sub_10001B518(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nameTable];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fh];
  id v3 = [*(id *)(a1 + 40) name];
  id v4 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v2, v3, [*(id *)(a1 + 32) isCaseSensitive]);
  [v5 removeObjectForKey:v4];
}

void sub_10001B5D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) interestedClients];
    if (v5)
    {
      id v7 = [*(id *)(a1 + 40) interestedClients];
      uint64_t v8 = [*(id *)(a1 + 40) fh];
      (*(void (**)(uint64_t, void, id, id, id, void *, void))(v4 + 16))(v4, 0, v3, v6, v7, v8, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
    else
    {
      (*(void (**)(uint64_t, void, id, id, void, const __CFString *, void))(v4 + 16))(v4, 0, v3, v6, 0, &stru_10008A998, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000538C4();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10001B714(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t sub_10001B7BC(void *a1)
{
  if ([*(id *)(*(void *)(a1[5] + 8) + 40) isSymlink]
    && (objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "np_flag") & 2) != 0)
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 5;
  }
  id v2 = *(uint64_t (**)(void))(a1[4] + 16);
  return v2();
}

void sub_10001B9F4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001BA94;
  v4[3] = &unk_1000893C8;
  void v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _LIRemoveDir:v2 name:v3 reply:v4];
}

void sub_10001BA94(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a6;
  id v11 = a3;
  uint64_t v10 = [v8 namespaceChangingGroup];
  dispatch_group_leave(v10);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001C060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C0B4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10001C110(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C26C;
  v14[3] = &unk_1000894E0;
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v4 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C338;
  v7[3] = &unk_100089530;
  id v8 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 48);
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  id v6 = v3;
  [v4 submitRequestBlockOnce:v14 continuationBlock:v7];
}

void sub_10001C26C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v5 + 8) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C328;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr deleteNameInParent:v6 DeleteName:v4 FileType:2 CompletionHandler:v8];
}

uint64_t sub_10001C328(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C338(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053AAC();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      id v3 = [*(id *)(a1 + 48) nodeTableSyncQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C584;
      block[3] = &unk_100089508;
      uint64_t v4 = *(void **)(a1 + 56);
      void block[4] = *(void *)(a1 + 48);
      id v19 = v4;
      id v20 = *(id *)(a1 + 32);
      dispatch_sync(v3, block);

      uint64_t v5 = [*(id *)(a1 + 40) fileRefSyncQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001C614;
      v16[3] = &unk_100088838;
      id v17 = *(id *)(a1 + 40);
      dispatch_sync(v5, v16);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) invalidateAttrs];
    uint64_t v6 = *(void *)(a1 + 72);
    id v7 = *(void **)(*(void *)(v6 + 8) + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001C61C;
    v10[3] = &unk_100089440;
    uint64_t v14 = v6;
    id v11 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 64);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 80);
    id v12 = v8;
    uint64_t v15 = v9;
    [v7 fetchAttrDataWithCompletionHandler:v10];
  }
}

void sub_10001C584(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  [v3 removeObjectForKey:v2];
}

id sub_10001C614(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForReclaimSync];
}

void sub_10001C61C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) interestedClients];
    if (v5)
    {
      id v7 = [*(id *)(a1 + 40) interestedClients];
      id v8 = [*(id *)(a1 + 40) fh];
      (*(void (**)(uint64_t, void, id, id, id, void *, void))(v4 + 16))(v4, 0, v3, v6, v7, v8, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
    else
    {
      (*(void (**)(uint64_t, void, id, id, void, const __CFString *, void))(v4 + 16))(v4, 0, v3, v6, 0, &stru_10008A998, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053B1C();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10001C75C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) nameTable];
  id v2 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", *(void *)(a1 + 40), *(void *)(a1 + 48), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001CA64(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CB20;
  v7[3] = &unk_100089580;
  void v7[4] = v1;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v1 _LIRename:v2 name:v3 toDir:v4 andName:v6 withFlags:v5 reply:v7];
}

void sub_10001CB20(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, void *a11)
{
  uint64_t v16 = *(void **)(a1 + 32);
  id v17 = a11;
  id v18 = a8;
  id v19 = a5;
  id v22 = a3;
  id v20 = [v16 namespaceChangingGroup];
  dispatch_group_leave(v20);

  (*(void (**)(void, uint64_t, id, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v22, a4, v19);
}

void sub_10001D7E8(_Unwind_Exception *a1)
{
}

uint64_t sub_10001D8A0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

uint64_t sub_10001D8FC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10001D958(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) nameTable];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fh];
  id v3 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v2, *(void *)(a1 + 40), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001DA18(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) nameTable];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fh];
  id v3 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v2, *(void *)(a1 + 40), [*(id *)(a1 + 32) isCaseSensitive]);
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001DAD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 68)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned int *)(a1 + 64);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001DBD4;
  v10[3] = &unk_1000889C8;
  id v11 = v3;
  id v9 = v3;
  +[smb_subr renameFile:v4 FileName:v5 NewParent:v6 NewName:v7 VType:v8 CompletionHandler:v10];
}

uint64_t sub_10001DBD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001DBE4(uint64_t a1, uint64_t a2)
{
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10001E184;
  v57[3] = &unk_100089698;
  uint64_t v4 = *(void **)(a1 + 40);
  v57[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 80);
  long long v61 = *(_OWORD *)(a1 + 64);
  long long v62 = v5;
  long long v6 = *(_OWORD *)(a1 + 112);
  long long v63 = *(_OWORD *)(a1 + 96);
  long long v64 = v6;
  char v67 = *(unsigned char *)(a1 + 160);
  id v58 = v4;
  long long v65 = *(_OWORD *)(a1 + 128);
  id v59 = *(id *)(a1 + 48);
  id v60 = *(id *)(a1 + 56);
  long long v66 = *(_OWORD *)(a1 + 144);
  uint64_t v7 = objc_retainBlock(v57);
  uint64_t v8 = v7;
  if (a2)
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) getSmbFattr];
    if (a2 == 13 && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      int v10 = v9[30];
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v10 == 2)
      {
        if (v11)
        {
          uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) name];
          uint64_t v36 = *(void *)(a1 + 48);
          uint64_t v37 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) name];
          uint64_t v38 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138413058;
          uint64_t v69 = v35;
          __int16 v70 = 2112;
          uint64_t v71 = v36;
          __int16 v72 = 2112;
          long long v73 = v37;
          __int16 v74 = 2112;
          uint64_t v75 = v38;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, trying renameOverExistingDir", buf, 0x2Au);
        }
        uint64_t v12 = *(void *)(a1 + 72);
        uint64_t v13 = *(void *)(*(void *)(v12 + 8) + 40);
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v14 = *(void **)(a1 + 48);
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
        id v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10001EB74;
        v50[3] = &unk_1000896C0;
        uint64_t v55 = v12;
        id v19 = v14;
        uint64_t v20 = *(void *)(a1 + 120);
        id v51 = v19;
        uint64_t v56 = v20;
        id v52 = *(id *)(a1 + 40);
        id v53 = *(id *)(a1 + 56);
        id v54 = v8;
        [v17 renameOverExistingDir:v13 FromName:v19 toDir:v16 NewName:v15 ToFile:v18 CompletionHandler:v50];

        uint64_t v21 = v51;
      }
      else
      {
        if (v11)
        {
          uint64_t v39 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) name];
          uint64_t v40 = *(void *)(a1 + 48);
          id v41 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) name];
          uint64_t v42 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138413058;
          uint64_t v69 = v39;
          __int16 v70 = 2112;
          uint64_t v71 = v40;
          __int16 v72 = 2112;
          long long v73 = v41;
          __int16 v74 = 2112;
          uint64_t v75 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, trying renameOverExistingFile\n", buf, 0x2Au);
        }
        uint64_t v22 = *(void *)(a1 + 72);
        uint64_t v23 = *(void *)(*(void *)(v22 + 8) + 40);
        uint64_t v25 = *(void *)(a1 + 40);
        id v24 = *(void **)(a1 + 48);
        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
        uint64_t v27 = *(void **)(a1 + 32);
        uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10001EC2C;
        v43[3] = &unk_1000896C0;
        uint64_t v48 = v22;
        id v29 = v24;
        uint64_t v30 = *(void *)(a1 + 120);
        id v44 = v29;
        uint64_t v49 = v30;
        id v45 = *(id *)(a1 + 40);
        id v46 = *(id *)(a1 + 56);
        id v47 = v8;
        [v27 renameOverExistingFile:v23 FromName:v29 toDir:v26 NewName:v25 ToFile:v28 CompletionHandler:v43];

        uint64_t v21 = v44;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) name];
        uint64_t v32 = *(void *)(a1 + 48);
        id v33 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) name];
        uint64_t v34 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138413314;
        uint64_t v69 = v31;
        __int16 v70 = 2112;
        uint64_t v71 = v32;
        __int16 v72 = 2112;
        long long v73 = v33;
        __int16 v74 = 2112;
        uint64_t v75 = v34;
        __int16 v76 = 1024;
        int v77 = a2;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, renameFile error: %d\n", buf, 0x30u);
      }
      (*(void (**)(void, uint64_t, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a2, 0, 0);
    }
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
}

void sub_10001E184(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) nodeTableSyncQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E4D4;
    block[3] = &unk_100089620;
    void block[4] = *(void *)(a1 + 32);
    int8x16_t v32 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    dispatch_sync(v2, block);
  }
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v3)
  {
    uint64_t v4 = [v3 fh];
    uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
    long long v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8)+ 40) interestedClients];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8)
                                                                            + 152) != 1;
    uint64_t v7 = [*(id *)(a1 + 32) nodeTableSyncQueue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001E598;
    v30[3] = &unk_100089620;
    uint64_t v8 = *(void *)(a1 + 120);
    v30[4] = *(void *)(a1 + 32);
    v30[5] = v8;
    v30[6] = *(void *)(a1 + 80);
    dispatch_sync(v7, v30);

    [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) invalidateAttrs];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) invalidateAttrs];
  if (!*(unsigned char *)(a1 + 160)) {
    [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) invalidateAttrs];
  }
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v9)
  {
    [v9 setName:*(void *)(a1 + 40)];
    if (!*(unsigned char *)(a1 + 160)) {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setParent:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
    }
    int v10 = [*(id *)(a1 + 32) nodeTableSyncQueue];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001E65C;
    v29[3] = &unk_100088810;
    uint64_t v11 = *(void *)(a1 + 64);
    v29[4] = *(void *)(a1 + 32);
    v29[5] = v11;
    dispatch_sync(v10, v29);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8)
                                                                            + 152) != 1;
  }
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void **)(*(void *)(v12 + 8) + 40);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001E740;
  v17[3] = &unk_100089670;
  uint64_t v21 = v12;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 120);
  id v18 = v14;
  uint64_t v22 = v15;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 56);
  char v28 = *(unsigned char *)(a1 + 160);
  long long v23 = *(_OWORD *)(a1 + 144);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v24 = *(void *)(a1 + 64);
  uint64_t v25 = v16;
  int8x16_t v26 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
  uint64_t v27 = *(void *)(a1 + 104);
  [v13 fetchAttrDataWithCompletionHandler:v17];
}

void sub_10001E4D4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nameTable];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fh];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) name];
  id v4 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v2, v3, [*(id *)(a1 + 32) isCaseSensitive]);
  [v5 removeObjectForKey:v4];
}

void sub_10001E598(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nameTable];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fh];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) name];
  id v4 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v2, v3, [*(id *)(a1 + 32) isCaseSensitive]);
  [v5 removeObjectForKey:v4];
}

void sub_10001E65C(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) nameTable];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [v2 parent];
  id v4 = [v3 fh];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
  id v6 = +[LiveFSItemPair newWithParent:fname:caseSensitivity:](LiveFSItemPair, "newWithParent:fname:caseSensitivity:", v4, v5, [*(id *)(a1 + 32) isCaseSensitive]);
  [v7 setObject:v2 forKey:v6];
}

void sub_10001E740(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    if (*(unsigned char *)(a1 + 128))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) interestedClients];
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v11 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) interestedClients];
      id v12 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) interestedClients];
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) fh];
      (*(void (**)(uint64_t, void, uint64_t, id, uint64_t, id, id, void *, _BYTE, void, void, _BYTE))(v8 + 16))(v8, 0, v7, v9, v10, v11, v12, v13, *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24));
    }
    else
    {
      id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10001E9D4;
      v17[3] = &unk_100089648;
      uint64_t v21 = *(void *)(a1 + 56);
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 64);
      id v18 = v15;
      uint64_t v22 = v16;
      id v19 = *(id *)(a1 + 40);
      id v20 = *(id *)(a1 + 48);
      int8x16_t v23 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
      long long v24 = *(_OWORD *)(a1 + 88);
      long long v25 = *(_OWORD *)(a1 + 104);
      uint64_t v26 = *(void *)(a1 + 120);
      [v14 fetchAttrDataWithCompletionHandler:v17];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053E80();
    }
    (*(void (**)(void, uint64_t, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a3, 0, 0);
  }
}

void sub_10001E9D4(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), a2);
    uint64_t v7 = *(void *)(*(void *)(a1[10] + 8) + 40);
    uint64_t v8 = a1[6];
    id v9 = [*(id *)(*(void *)(a1[7] + 8) + 40) interestedClients];
    uint64_t v10 = *(void *)(*(void *)(a1[9] + 8) + 40);
    id v11 = [*(id *)(*(void *)(a1[8] + 8) + 40) interestedClients];
    id v12 = [*(id *)(*(void *)(a1[11] + 8) + 40) interestedClients];
    uint64_t v13 = [*(id *)(*(void *)(a1[11] + 8) + 40) fh];
    (*(void (**)(uint64_t, void, uint64_t, id, uint64_t, id, id, void *, _BYTE, void, void, _BYTE))(v8 + 16))(v8, 0, v7, v9, v10, v11, v12, v13, *(unsigned char *)(*(void *)(a1[12] + 8) + 24), *(void *)(*(void *)(a1[13] + 8) + 24), *(void *)(*(void *)(a1[14] + 8) + 40), *(unsigned char *)(*(void *)(a1[15] + 8) + 24));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053F40();
    }
    (*(void (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], a3, 0, 0);
  }
}

uint64_t sub_10001EB74(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054000();
    }
    return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, 0, 0);
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v5();
  }
}

uint64_t sub_10001EC2C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000540C0();
    }
    return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, 0, 0);
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v5();
  }
}

void sub_10001F0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10001F0EC(uint64_t a1)
{
  uint64_t v19 = 0;
  uint64_t v2 = malloc_type_malloc(0x28uLL, 0x10000400A747E1EuLL);
  *uint64_t v2 = 0u;
  v2[1] = 0u;
  *((void *)v2 + 4) = 0;
  unsigned int v3 = objc_msgSend(*(id *)(a1 + 32), "share_fstype");
  unsigned int v4 = v3;
  id v5 = *(uint64_t **)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = v5[5];
  if ((v6 & 0x1000) != 0)
  {
    sub_1000338C0(v5 + 18, &v19, v3 == 1);
    *((void *)v2 + 3) = v19;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v5 = *(uint64_t **)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = v5[5];
    if ((v6 & 0x800) == 0)
    {
LABEL_3:
      if ((v6 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  sub_1000338C0(v5 + 16, &v19, v4 == 1);
  *((void *)v2 + 2) = v19;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  id v5 = *(uint64_t **)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = v5[5];
  if ((v6 & 0x400) == 0)
  {
LABEL_4:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  sub_1000338C0(v5 + 14, &v19, v4 == 1);
  *((void *)v2 + 1) = v19;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  id v5 = *(uint64_t **)(*(void *)(a1 + 56) + 8);
  if ((v5[5] & 0x2000) != 0)
  {
LABEL_5:
    sub_1000338C0(v5 + 20, &v19, v4 == 1);
    *(void *)uint64_t v2 = v19;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
LABEL_6:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001F368;
    v15[3] = &unk_100089710;
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 72);
    id v16 = v8;
    uint64_t v17 = v9;
    id v18 = v2;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001F444;
    v10[3] = &unk_100089738;
    uint64_t v13 = v2;
    id v11 = *(id *)(a1 + 40);
    int v14 = *(_DWORD *)(a1 + 80);
    id v12 = *(id *)(a1 + 48);
    [v7 submitRequestBlock:v15 continuationBlock:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10001F368(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[4];
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 120);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F434;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr setNodeBasicInfo:v5 BasicInfo:v4 FileType:v6 CompletionHandler:v8];
}

uint64_t sub_10001F434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001F444(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000541E8(a1);
  }
  [*(id *)(a1 + 32) invalidateAttrs];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001F4B0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 80);
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 120);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F584;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr setNodeEOF:v4 Eof:v5 FileType:v6 CompletionHandler:v8];
}

uint64_t sub_10001F584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001F594(uint64_t a1, int a2)
{
  uint64_t v4 = a1 + 32;
  [*(id *)(a1 + 32) invalidateAttrs];
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054288(v4);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v6();
  }
}

void sub_10001F764(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F804;
  v4[3] = &unk_1000897B0;
  void v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _LISetAttr:v2 setAttrs:v3 reply:v4];
}

void sub_10001F804(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a6;
  id v11 = a4;
  id v13 = a3;
  id v12 = [v9 opsSyncGroup];
  dispatch_group_leave(v12);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

void sub_10001FCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak(v31);
  objc_destroyWeak((id *)(v32 - 128));
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 208), 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001FD20(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_10001FD7C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) interestedClients];
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v9[1] = 3221225472;
    v9[2] = sub_10001FE98;
    v9[3] = &unk_1000897D8;
    int8x16_t v11 = v5;
    v9[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v12 = v8;
    [v6 fetchAttrDataWithCompletionHandler:v9];
  }
}

void sub_10001FE98(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) parent];

    if (v7)
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) parent];
      id v7 = [v8 fh];

      id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) parent];
      id v10 = [v9 interestedClients];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) name];
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    id v18 = [*(id *)(*(void *)(v16 + 8) + 40) name];
    if ([v18 hasPrefix:@"."]) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 0;
    }
    (*(void (**)(uint64_t, void, uint64_t, void *, id, void *, uint64_t, uint64_t))(v13 + 16))(v13, 0, v14, v7, v10, v15, v17, v19);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000543A4(a1);
    }
    if (a3 == 2)
    {
      int8x16_t v11 = [*(id *)(a1 + 32) nodeTableSyncQueue];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000200E0;
      v20[3] = &unk_100088810;
      uint64_t v12 = *(void *)(a1 + 56);
      void v20[4] = *(void *)(a1 + 32);
      v20[5] = v12;
      dispatch_sync(v11, v20);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_1000200E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNodeDisappeared:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_1000201F8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002028C;
  v3[3] = &unk_100088B80;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _LIStatFS:v2 reply:v3];
}

void sub_10002028C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = a3;
  int8x16_t v5 = [v4 opsSyncGroup];
  dispatch_group_leave(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100020610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002064C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_1000206A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pd];
  id v5 = [*(id *)(a1 + 32) shareID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020784;
  v8[3] = &unk_1000890A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  +[smb_subr statFS:v4 ShareID:v5 CompletionHandler:v8];
}

uint64_t sub_100020784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000207A0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054488();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = +[NSData dataWithBytes:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) length:40];
    free(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1000209B8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020A60;
  v5[3] = &unk_100089238;
  void v5[4] = v1;
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  [v1 _LIWrite:v2 atOffset:v4 withBuffer:v3 reply:v5];
}

uint64_t sub_100020A60(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_100020F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020F7C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

uint64_t sub_100020FD8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fileRefForWrite];
  return _objc_release_x1();
}

void sub_1000211BC(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 80);
  if (v2 && !*(_DWORD *)(a1 + 120))
  {
    if (v2 > [*(id *)(a1 + 48) serverMaxWr]) {
      unint64_t v2 = [*(id *)(a1 + 48) serverMaxWr];
    }
    uint64_t v4 = (char *)[*(id *)(a1 + 56) bytes] + *(void *)(a1 + 96);
    id v5 = +[NSData dataWithBytesNoCopy:v4 length:v2 freeWhenDone:0];
    id v6 = *(_OWORD **)(a1 + 88);
    *id v6 = 0u;
    v6[1] = 0u;
    *(void *)(*(void *)(a1 + 88) + _Block_object_dispose(&STACK[0x3C0], 8) = v4;
    uint64_t v7 = *(void *)(a1 + 88);
    *(_DWORD *)(v7 + 16) = v2;
    *(void *)uint64_t v7 = *(void *)(a1 + 104);
    uint64_t v8 = *(void **)(a1 + 48);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100021450;
    v32[3] = &unk_100089850;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 88);
    id v34 = v5;
    uint64_t v35 = v10;
    id v33 = v9;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100021534;
    v19[3] = &unk_100089878;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 104);
    uint64_t v26 = *(void *)(a1 + 112);
    unint64_t v27 = v2;
    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 88);
    uint64_t v28 = v12;
    uint64_t v29 = v13;
    uint64_t v30 = v14;
    uint64_t v15 = *(void *)(a1 + 48);
    id v20 = v11;
    uint64_t v21 = v15;
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 96);
    id v24 = v16;
    uint64_t v31 = v17;
    id v25 = *(id *)(a1 + 72);
    id v18 = v5;
    [v8 submitRequestBlock:v32 continuationBlock:v19];
  }
  else
  {
    free(*(void **)(a1 + 88));
    [*(id *)(a1 + 32) decRef];
    [*(id *)(a1 + 40) invalidateAttrs];
    if (*(void *)(a1 + 96) && ![*(id *)(a1 + 40) wasWritten]) {
      [*(id *)(a1 + 40) setWasWritten:1];
    }
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v3();
  }
}

void sub_100021450(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) fidCtx];
  uint64_t v7 = a1 + 40;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v7 + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021524;
  v9[3] = &unk_1000889C8;
  id v10 = v3;
  id v8 = v3;
  +[smb_subr sendWrite:v4 Param:v6 WriteBuf:v5 CompletionHandler:v9];
}

uint64_t sub_100021524(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100021534(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000546C8();
    }
    return [*(id *)(a1 + 40) writeRequest:*(void *)(a1 + 48) withBuffer:*(void *)(a1 + 56) smbNode:*(void *)(a1 + 32) fileRef:*(void *)(a1 + 64) wrparamPtr:*(void *)(a1 + 112) result:a2 thisOffset:*(void *)(a1 + 96) bytesWritten:*(void *)(a1 + 120) bytesRemain:0 pass:*(void *)(a1 + 80) reply:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 112);
    return [*(id *)(a1 + 40) writeRequest:*(void *)(a1 + 48) withBuffer:*(void *)(a1 + 56) smbNode:*(void *)(a1 + 32) fileRef:*(void *)(a1 + 64) wrparamPtr:v5 result:0 thisOffset:*(void *)(a1 + 96) + *(unsigned int *)(v5 + 28) bytesWritten:*(void *)(a1 + 120) + *(unsigned int *)(v5 + 28) bytesRemain:*(void *)(a1 + 104) - *(unsigned int *)(v5 + 28) pass:*(void *)(a1 + 80) + 1 reply:*(void *)(a1 + 72)];
  }
}

void sub_100021768(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021808;
  v4[3] = &unk_100088B80;
  void v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _LIGetXattr:v2 name:v3 reply:v4];
}

void sub_100021808(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = a3;
  id v5 = [v4 opsSyncGroup];
  dispatch_group_leave(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100021D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 240), 8);
  _Block_object_dispose((const void *)(v41 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021DC4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100021E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) serverMaxRd];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021F0C;
  v10[3] = &unk_1000898C8;
  uint64_t v8 = *(void *)(a1 + 64);
  id v11 = v3;
  uint64_t v12 = v8;
  id v9 = v3;
  +[smb_subr readNodeStream:v4 StreamName:v6 ReadBuffer:v5 MaxReadXferLen:v7 CompletionHandler:v10];
}

uint64_t sub_100021F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100021F28(uint64_t a1, int a2)
{
  if (a2 == 93)
  {
    [*(id *)(a1 + 32) setNegativeForName:*(void *)(a1 + 40)];
LABEL_12:
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_13:
    v11();
    return;
  }
  if (a2 == 34)
  {
    id v3 = [objc_alloc((Class)NSMutableData) initWithLength:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100022194;
      v18[3] = &unk_1000898F0;
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v6 = *(void **)(a1 + 48);
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 48);
      id v19 = v7;
      uint64_t v20 = v9;
      uint64_t v10 = *(void *)(a1 + 80);
      uint64_t v22 = v8;
      uint64_t v23 = v10;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10002229C;
      v13[3] = &unk_100089918;
      uint64_t v17 = v8;
      id v14 = *(id *)(a1 + 32);
      id v15 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 56);
      [v6 submitRequestBlock:v18 continuationBlock:v13];

      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000548EC();
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_13;
  }
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005484C();
    }
    goto LABEL_12;
  }
  id v12 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
  [*(id *)(a1 + 32) setData:v12 forName:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100022194(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) serverMaxRd];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022280;
  v10[3] = &unk_1000898C8;
  uint64_t v8 = *(void *)(a1 + 64);
  id v11 = v3;
  uint64_t v12 = v8;
  id v9 = v3;
  +[smb_subr readNodeStream:v4 StreamName:v6 ReadBuffer:v5 MaxReadXferLen:v7 CompletionHandler:v10];
}

uint64_t sub_100022280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002229C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000549B0();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
    [*(id *)(a1 + 32) setData:v3 forName:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000224C0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022578;
  v6[3] = &unk_100089968;
  void v6[4] = v1;
  id v7 = *(id *)(a1 + 64);
  [v1 _LISetXattr:v2 name:v3 value:v4 how:v5 reply:v6];
}

void sub_100022578(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a5;
  id v10 = a3;
  id v9 = [v7 opsSyncGroup];
  dispatch_group_leave(v9);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100022C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v65 - 256), 8);
  _Block_object_dispose((const void *)(v65 - 224), 8);
  _Block_object_dispose((const void *)(v65 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022C70(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100022CCC(void *a1, int a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) interestedClients];
  if (a2)
  {
    uint64_t v4 = *(void (**)(void))(a1[4] + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) parent];

    if (v5)
    {
      uint64_t v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) parent];
      uint64_t v7 = [v6 fh];
      uint64_t v8 = *(void *)(a1[7] + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) parent];
      *(void *)(*(void *)(a1[8] + 8) + 24) = [v10 interestedClients];
    }
    uint64_t v11 = a1[4];
    uint64_t v12 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v13 = *(void *)(*(void *)(a1[8] + 8) + 24);
    id v18 = [*(id *)(*(void *)(a1[6] + 8) + 40) name];
    uint64_t v14 = a1[6];
    uint64_t v15 = *(void *)(*(void *)(a1[5] + 8) + 24);
    id v16 = [*(id *)(*(void *)(v14 + 8) + 40) name];
    if ([v16 hasPrefix:@"."]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 0;
    }
    (*(void (**)(uint64_t, void, uint64_t, uint64_t, id, uint64_t, uint64_t))(v11 + 16))(v11, 0, v12, v13, v18, v15, v17);
  }
}

void sub_100022E9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) serverMaxWr];
  uint64_t v8 = *(void *)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022F88;
  v10[3] = &unk_1000889C8;
  id v11 = v3;
  id v9 = v3;
  +[smb_subr writeNodeStream:v4 StreamName:v6 How:v5 MaxWriteXferLen:v7 WriteBuffer:v8 CompletionHandler:v10];
}

uint64_t sub_100022F88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100022F98(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054B58();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setData:*(void *)(a1 + 48) forName:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100023004(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v5 + 8) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000230BC;
  v8[3] = &unk_1000889C8;
  id v9 = v3;
  id v7 = v3;
  +[smb_subr deleteNodeStream:v6 StreamName:v4 CompletionHandler:v8];
}

uint64_t sub_1000230BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000230CC(uint64_t a1, int a2)
{
  if (a2 && a2 != 93)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054C18();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setNegativeForName:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100023244(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000232D8;
  v3[3] = &unk_100089A30;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _LIListXattrs:v2 reply:v3];
}

void sub_1000232D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v5 = [v4 opsSyncGroup];
  dispatch_group_leave(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100023748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100023790(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_1000237EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000238A4;
  v7[3] = &unk_100089A58;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  +[smb_subr listNodeStreams:v4 CompletionHandler:v7];
}

void sub_1000238A4(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100023920(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 != 93)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100054D88();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      return;
    }
    goto LABEL_10;
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
LABEL_10:
    [*(id *)(a1 + 32) setNoXattrsPresent:1];
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
    return;
  }
  id v3 = sub_100033128(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    [*(id *)(a1 + 32) setNoXattrsPresent:0];
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_100054DF8(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

void sub_100023C48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 callerID] == *(id *)(a1 + 32)) {
    [v4 setSearchAborted];
  }
}

void sub_100023CA4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 80);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023D60;
  v7[3] = &unk_100088BF8;
  void v7[4] = v1;
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v1 _LISearch:v2 token:v3 criteria:v4 returnProxy:v6 withCallerID:v5 reply:v7];
}

uint64_t sub_100023D60(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_100024ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_100024B18(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

void sub_100024C48(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024CE8;
  v4[3] = &unk_1000889C8;
  id v5 = *(id *)(a1 + 48);
  [v1 _LISearchReplenishCredits:v2 credits:v3 reply:v4];
}

uint64_t sub_100024CE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100024EC0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100024F50;
  v3[3] = &unk_1000889C8;
  id v4 = *(id *)(a1 + 48);
  [v1 _LISearchAbort:v2 reply:v3];
}

uint64_t sub_100024F50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000250BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _LISearchAbortAllClientSearches:*(void *)(a1 + 40)];
}

void sub_100025204(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 callerID] == *(id *)(a1 + 32)) {
    [v4 setSearchAborted];
  }
}

void sub_100025374(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100025418;
  v4[3] = &unk_100088BF8;
  void v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v1 _LIAccessCheck:v2 requestedAccess:v3 reply:v4];
}

uint64_t sub_100025418(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) opsSyncGroup];
  dispatch_group_leave(v2);

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10002581C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002585C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lookupHandle:*(void *)(a1 + 40) IsStale:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  return _objc_release_x1();
}

uint64_t sub_1000258B8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (int *)(a1 + 56);
  int v10 = *(_DWORD *)(a1 + 56);
  if ((a2 & 1) == 0 && (v10 & 2) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055718();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 2) == 0 && (v10 & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000557B4();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x20) == 0 && (v10 & 8) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055850();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x10000) == 0 && (v10 & 0x10) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000558EC();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 4) == 0 && (v10 & 0x20) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055988();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x40) == 0 && (v10 & 0x40) != 0)
  {
    id v18 = *(void **)(a1 + 32);
    if (v18)
    {
      [v18 shareInfo];
      if (a2 & 2) != 0 && (BYTE8(v20))
      {
        int v10 = *v11;
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v21 = 0;
      long long v20 = 0u;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055A24();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
LABEL_27:
  if ((a2 & 0x80) == 0 && (v10 & 0x80) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055AC0();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x100) == 0 && (v10 & 0x100) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055B5C();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x80) == 0 && (v10 & 0x200) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055BF8();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x100) == 0 && (v10 & 0x400) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055C94();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x20000) == 0 && (v10 & 0x800) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055D30();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x40000) == 0 && (v10 & 0x1000) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055DCC();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  if ((a2 & 0x80000) == 0 && (v10 & 0x2000) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055E68();
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 13, v12, v13, v14, v15, v16, v17, v20, *((void *)&v20 + 1), v21);
  }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, a3, a4, a5, a6, a7, a8);
}

void sub_100025BC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025C78;
  v7[3] = &unk_100089B10;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  +[smb_subr queryMaxAccess:v4 CompletionHandler:v7];
}

uint64_t sub_100025C78(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100025C94(void *a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100055F04((uint64_t)a1);
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 2032127;
    unsigned __int8 v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) isRoot];
    if (a2 == 13 && (v4 & 1) == 0) {
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  else
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) setMaxAccessAttr:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
    id v6 = *(uint64_t (**)(void))(a1[4] + 16);
    return v6();
  }
}

void sub_100025EFC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100025FA0;
  v5[3] = &unk_100089B38;
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v1 _LISetUpdateInterest:v2 interest:v3 forClient:v4 reply:v5];
}

uint64_t sub_100025FA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100026500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location)
{
  objc_destroyWeak(v46);
  _Block_object_dispose(&a40, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100026550(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000560A0();
    }
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = getNSErrorFromLiveFSErrno();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100056024();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100026600(id *a1, int a2)
{
  if (a2)
  {
    if (a2 != 89 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100056120();
    }
  }
  else
  {
    uint64_t v3 = [a1[5] namespaceChangingGroup];
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v4 = [a1[5] opsQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100026718;
    v5[3] = &unk_100089B88;
    id v6 = a1[4];
    long long v7 = *(_OWORD *)(a1 + 5);
    objc_copyWeak(&v8, a1 + 7);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v8);
  }
}

void sub_100026718(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000561A0();
  }
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v2, "historyResetItem:interestedItem:interestedClients:", v3, v3, objc_msgSend(WeakRetained, "interestedClients"));
}

void sub_100026794(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000562B8();
    }
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = getNSErrorFromLiveFSErrno();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005623C();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100026920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026938(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 180);
  return result;
}

uint64_t sub_1000269D4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 180) = *(_DWORD *)(result + 40);
  return result;
}

void sub_100026A6C(uint64_t a1)
{
  uint64_t v1 = (int *)(a1 + 40);
  uint64_t v2 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 32) + 184) |= *(_DWORD *)(a1 + 40);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100056338(v1, v2);
  }
}

void sub_100026C8C(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 256);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026D30;
  block[3] = &unk_100089C28;
  void block[4] = v3;
  id v6 = *(id *)(a1 + 40);
  int v7 = a2;
  dispatch_async(v4, block);
}

uint64_t sub_100026D30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void sub_100026D60(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) connectionState];
  switch(v2)
  {
    case 1u:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100026F70;
      v20[3] = &unk_100089C78;
      uint64_t v4 = *(void *)(a1 + 48);
      id v5 = *(id *)(a1 + 40);
      char v23 = *(unsigned char *)(a1 + 56);
      void v20[4] = *(void *)(a1 + 32);
      id v21 = v5;
      id v22 = *(id *)(a1 + 48);
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v20);

      id v6 = v21;
LABEL_11:

      return;
    case 2u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000564F0(a1, v7, v8, v9, v10, v11, v12, v13);
      }
      atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 464), 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(NSObject **)(v14 + 256);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000270E0;
      v16[3] = &unk_100089C50;
      void v16[4] = v14;
      id v17 = *(id *)(a1 + 48);
      id v18 = *(id *)(a1 + 40);
      char v19 = *(unsigned char *)(a1 + 56);
      dispatch_async(v15, v16);

      id v6 = v17;
      goto LABEL_11;
    case 7u:
      uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100056470();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
  }
}

void sub_100026F70(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (sub_100033040(a2))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100056568();
      }
      [*(id *)(a1 + 32) notifyConnectionLost];
      if (*(unsigned char *)(a1 + 56))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v4 = *(NSObject **)(v3 + 256);
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_1000270CC;
        v6[3] = &unk_100089C50;
        void v6[4] = v3;
        id v7 = *(id *)(a1 + 48);
        id v8 = *(id *)(a1 + 40);
        char v9 = *(unsigned char *)(a1 + 56);
        dispatch_async(v4, v6);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      return;
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

id sub_1000270CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitRequestBlock:*(void *)(a1 + 40) continuationBlock:*(void *)(a1 + 48) allowRetries:*(unsigned __int8 *)(a1 + 56)];
}

id sub_1000270E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitRequestBlock:*(void *)(a1 + 40) continuationBlock:*(void *)(a1 + 48) allowRetries:*(unsigned __int8 *)(a1 + 56)];
}

void sub_100027170(uint64_t a1)
{
  switch([*(id *)(a1 + 32) connState])
  {
    case 0u:
      [*(id *)(a1 + 32) setConnState:6];
      [*(id *)(a1 + 32) cancelIdleTimer];
      BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v2) {
        sub_100056688(v2, v3, v4, v5, v6, v7, v8, v9);
      }
      uint64_t v10 = [*(id *)(a1 + 32) connQueue];
      uint64_t v11 = v10;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100027450;
      v39[3] = &unk_100088838;
      void v39[4] = *(void *)(a1 + 32);
      uint64_t v12 = v39;
      goto LABEL_16;
    case 1u:
      [*(id *)(a1 + 32) setConnState:6];
      [*(id *)(a1 + 32) cancelIdleTimer];
      BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v13) {
        sub_10005664C(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      uint64_t v10 = [*(id *)(a1 + 32) connQueue];
      uint64_t v11 = v10;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100027448;
      v40[3] = &unk_100088838;
      v40[4] = *(void *)(a1 + 32);
      uint64_t v12 = v40;
      goto LABEL_16;
    case 2u:
      [*(id *)(a1 + 32) setConnState:3];
      BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v21) {
        sub_1000566C4(v21, v22, v23, v24, v25, v26, v27, v28);
      }
      uint64_t v10 = [*(id *)(a1 + 32) mgmtQueue];
      uint64_t v11 = v10;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100027458;
      v38[3] = &unk_100088838;
      void v38[4] = *(void *)(a1 + 32);
      uint64_t v12 = v38;
      goto LABEL_16;
    case 4u:
      [*(id *)(a1 + 32) setConnState:5];
      BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v29) {
        sub_100056700(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      uint64_t v10 = [*(id *)(a1 + 32) mgmtQueue];
      uint64_t v11 = v10;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100027460;
      v37[3] = &unk_100088838;
      v37[4] = *(void *)(a1 + 32);
      uint64_t v12 = v37;
LABEL_16:
      dispatch_barrier_async(v10, v12);

      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000565DC();
      }
      break;
  }
}

id sub_100027448(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushAndDisconnect];
}

id sub_100027450(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushAndDisconnect];
}

id sub_100027458(uint64_t a1)
{
  return [*(id *)(a1 + 32) reconnectCancelWait];
}

id sub_100027460(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushEIOCancelWait];
}

void sub_1000274F0(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  unsigned int v2 = [*(id *)(a1 + 32) connState];
  if (v2 == 4 || v2 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005673C();
    }
    [*v1 setConnState:2];
    [*v1 setServerConnected:0];
    [*v1 cancelIdleTimer];
    [*v1 setOpenFileCounter:0];
    [*v1 setPendingChangeNotifyCount:0];
    uint64_t v4 = [*v1 connQueue];
    dispatch_suspend(v4);

    uint64_t v5 = [*v1 mgmtQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002760C;
    block[3] = &unk_100088838;
    void block[4] = *v1;
    dispatch_async(v5, block);
  }
}

id sub_10002760C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reconnectSession];
}

void sub_100028954(_Unwind_Exception *a1)
{
}

void sub_100028A00(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned int v2 = [*(id *)(a1 + 32) handleTable];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*((void *)&v15 + 1) + 8 * (void)v6));
        uint64_t v7 = [*(id *)(a1 + 32) handleTable];
        uint64_t v8 = [v7 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fileRefSyncQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100028BD8;
        block[3] = &unk_100089CA0;
        void block[4] = *(void *)(a1 + 48);
        dispatch_sync(v11, block);

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

id sub_100028BD8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) prepareForReconnect];
}

void sub_100028BE8(uint64_t a1)
{
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v28 = (id *)(a1 + 32);
  id obj = [*(id *)(a1 + 32) handleTable];
  id v2 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v2)
  {
    uint64_t v3 = a1 + 48;
    uint64_t v30 = *(void *)v42;
    while (2)
    {
      id v4 = 0;
      do
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(obj);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*((void *)&v41 + 1) + 8 * (void)v4));
        uint64_t v5 = [*(id *)(a1 + 32) handleTable];
        uint64_t v6 = [v5 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;

        uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fileRefSyncQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100029184;
        block[3] = &unk_100088CC0;
        int8x16_t v40 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
        dispatch_sync(v9, block);

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100056BAC((uint64_t *)(a1 + 48), v28);
          }
          [*v28 setServerConnected:0];
          goto LABEL_21;
        }
        if ([*(id *)(*(void *)(*(void *)v3 + 8) + 40) isDir])
        {
          uint64_t v10 = [*(id *)(*(void *)(*(void *)v3 + 8) + 40) changeNotifyFileRef];
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            objc_initWeak(&location, *(id *)(*(void *)(*(void *)v3 + 8) + 40));
            id v12 = objc_alloc((Class)NSString);
            BOOL v13 = [*(id *)(*(void *)(*(void *)v3 + 8) + 40) name];
            id v14 = [v12 initWithString:v13];

            v36[0] = 0;
            v36[1] = v36;
            v36[2] = 0x3032000000;
            void v36[3] = sub_10000C880;
            v36[4] = sub_10000C890;
            id v37 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            long long v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_1000291C0;
            v31[3] = &unk_100089BB0;
            id v16 = v14;
            uint64_t v17 = *(void *)(a1 + 32);
            id v32 = v16;
            uint64_t v33 = v17;
            uint64_t v34 = v36;
            objc_copyWeak(&v35, &location);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v15 reopenChangeNotify:v31];
            uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
            int v19 = *(unsigned __int8 *)(v18 + 24);
            if (*(unsigned char *)(v18 + 24))
            {
              id v20 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                id v27 = [*(id *)(*(void *)(*(void *)v3 + 8) + 40) name];
                id v22 = [v27 UTF8String];
                uint64_t v23 = [*v28 serverName];
                uint64_t v24 = [*v28 shareName];
                *(_DWORD *)buf = 136315906;
                id v46 = "-[smbMount reconnectSession]_block_invoke";
                __int16 v47 = 2080;
                id v48 = v22;
                __int16 v49 = 2112;
                v50 = v23;
                __int16 v51 = 2112;
                id v52 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lost connection while reopening change notify for np: %s on server: %@, share: %@ \n", buf, 0x2Au);
              }
              [*v28 setServerConnected:0];
            }
            else
            {
              uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
              objc_msgSend(*(id *)(a1 + 32), "historyResetItem:interestedItem:interestedClients:", v21, v21, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "interestedClients"));
            }
            objc_destroyWeak(&v35);

            _Block_object_dispose(v36, 8);
            objc_destroyWeak(&location);
            if (v19) {
              goto LABEL_21;
            }
          }
        }
        id v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      id v2 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = 0;

LABEL_21:
}

void sub_100029144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
}

id sub_100029184(uint64_t a1)
{
  id result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) reopenFilesAfterReconnect];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1000291C0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 != 89 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100056CA4();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100056D78(a1);
    }
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v3, "historyResetItem:interestedItem:interestedClients:", v4, v4, objc_msgSend(WeakRetained, "interestedClients"));
  }
}

id sub_100029270(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 shutdownReason] | 2;
  return [v1 setShutdownReason:v2];
}

id sub_100029370(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyConnectionLost];
}

void sub_100029978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1000299D8(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) handleTable];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*((void *)&v15 + 1) + 8 * (void)v6));
        uint64_t v7 = [*(id *)(a1 + 32) handleTable];
        uint64_t v8 = [v7 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        BOOL v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fileRefSyncQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100029BB0;
        block[3] = &unk_100089CA0;
        void block[4] = *(void *)(a1 + 48);
        dispatch_sync(v11, block);

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

id sub_100029BB0(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) prepareForReconnect];
}

void sub_100029BC0(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) handleTable];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*((void *)&v17 + 1) + 8 * (void)v6));
        uint64_t v7 = [*(id *)(a1 + 32) handleTable];
        uint64_t v8 = [v7 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        BOOL v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileRefSyncQueue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100029DB8;
        v14[3] = &unk_100089BD8;
        uint64_t v16 = *(void *)(a1 + 56);
        id v15 = *(id *)(a1 + 40);
        dispatch_sync(v11, v14);

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

void sub_100029DB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100029E5C;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 32);
  [v2 prepareForReclaim:v3];
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100029E5C(uint64_t a1)
{
}

id sub_100029E64(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shutdownReason];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100029F64(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushAndDisconnect];
}

id sub_10002A038(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushAndDisconnect];
}

void sub_10002A218(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) name];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A2E0;
  v7[3] = &unk_1000889C8;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr deleteNameInParent:v4 DeleteName:v5 FileType:2 CompletionHandler:v7];
}

uint64_t sub_10002A2E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002A2F0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057100();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100057064(a1);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002A4A8;
    v8[3] = &unk_100089D68;
    id v3 = *(void **)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    char v13 = *(unsigned char *)(a1 + 88);
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 72);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002A594;
    v4[3] = &unk_100089D90;
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 80);
    [v3 submitRequestBlockOnce:v8 continuationBlock:v4];
  }
}

void sub_10002A4A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void *)(a1 + 48);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A584;
  v9[3] = &unk_1000889C8;
  id v10 = v3;
  id v8 = v3;
  +[smb_subr renameFile:v4 FileName:v5 NewParent:v6 NewName:v7 VType:2 CompletionHandler:v9];
}

uint64_t sub_10002A584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002A594(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057244();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_1000571A8(a1);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002A850(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) name];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A930;
  v9[3] = &unk_1000889C8;
  id v10 = v3;
  id v8 = v3;
  +[smb_subr renameFile:v4 FileName:v5 NewParent:0 NewName:v6 VType:v7 CompletionHandler:v9];
}

uint64_t sub_10002A930(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002A940(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057388();
    }
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000572EC(a1);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002AB20;
    v13[3] = &unk_100089E08;
    id v3 = *(void **)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    char v19 = *(unsigned char *)(a1 + 100);
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 72);
    int v18 = *(_DWORD *)(a1 + 96);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002AC18;
    v6[3] = &unk_100089E30;
    id v7 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = *(id *)(a1 + 80);
    int v12 = *(_DWORD *)(a1 + 96);
    id v11 = *(id *)(a1 + 88);
    [v3 submitRequestBlockOnce:v13 continuationBlock:v6];
  }
}

void sub_10002AB20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 68)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void *)(a1 + 48);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned int *)(a1 + 64);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AC08;
  v10[3] = &unk_1000889C8;
  id v11 = v3;
  id v9 = v3;
  +[smb_subr renameFile:v4 FileName:v5 NewParent:v6 NewName:v7 VType:v8 CompletionHandler:v10];
}

uint64_t sub_10002AC08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002AC18(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057430();
    }
    uint64_t v4 = *(void **)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002AE8C;
    v19[3] = &unk_100089DE0;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 40);
    int v23 = *(_DWORD *)(a1 + 72);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002AF7C;
    v15[3] = &unk_100089D90;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 64);
    [v4 submitRequestBlockOnce:v19 continuationBlock:v15];
  }
  uint64_t v5 = *(void **)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AFFC;
  v10[3] = &unk_100089850;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  int v13 = *(_DWORD *)(a1 + 72);
  int v14 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B0D8;
  v6[3] = &unk_100089D90;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 64);
  [v5 submitRequestBlockOnce:v10 continuationBlock:v6];
}

void sub_10002AE8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) name];
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002AF6C;
  v9[3] = &unk_1000889C8;
  id v10 = v3;
  id v8 = v3;
  +[smb_subr renameFile:v4 FileName:v5 NewParent:0 NewName:v6 VType:v7 CompletionHandler:v9];
}

uint64_t sub_10002AF6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002AF7C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057574();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_1000574D8(a1);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002AFFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B0C0;
  v8[3] = &unk_100088F90;
  id v9 = v3;
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  int v10 = *(_DWORD *)(a1 + 52);
  id v7 = v3;
  +[smb_subr deleteNameInParent:v4 DeleteName:v5 FileType:v6 CompletionHandler:v8];
}

uint64_t sub_10002B0C0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t sub_10002B0D8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000576B8();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_10005761C(a1);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10002BC84(uint64_t result, uint64_t a2, uint64_t a3, int a4, float a5)
{
  *(float *)a3 = a5;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  *(_WORD *)(a3 + 22) = 1024;
  *(_DWORD *)(a3 + 24) = a4;
  return result;
}

void sub_10002BCFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

uint64_t sub_10002BD38(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t sub_10002BD50@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(*(void *)(a1 + 8) + 40);
}

uint64_t sub_10002BD80(uint64_t result, uint64_t a2, uint64_t a3, int a4, float a5)
{
  *(float *)a3 = a5;
  *(_DWORD *)(a3 + 4) = a4;
  *(_WORD *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 2112;
  *(void *)(a3 + 10) = result;
  *(_WORD *)(a3 + 1_Block_object_dispose(&STACK[0x200], 8) = 2112;
  *(void *)(a3 + 20) = a2;
  return result;
}

void sub_10002BDD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_10002BDEC(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_10002BDF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10002BE28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x18u);
}

void sub_10002BE44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_10002BE84(uint64_t result, uint64_t a2, float a3)
{
  *(float *)id result = a3;
  *(void *)(result + 4) = a2;
  *(_WORD *)(result + 12) = 2048;
  *(void *)(result + 14) = 184;
  return result;
}

void sub_10002BEF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10002BF74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t sub_10002BFE4()
{
  return v0;
}

void sub_10002BFF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10002C00C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

uint64_t sub_10002C04C()
{
  return *(void *)(v0 + 40);
}

void sub_10002C06C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_10002C078(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

uint64_t sub_10002C094(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_10002C0A0()
{
  return *(void *)(v0 + 40);
}

uint64_t sub_10002C0AC(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_10002C0C4()
{
  return *(void *)v0;
}

uint64_t sub_10002C0EC(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_10002C0F8@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, int a3@<W8>, float a4@<S0>)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_10002C128(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10002C144(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

uint64_t sub_10002C180()
{
  return *(void *)v0;
}

void sub_10002C1A4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

uint64_t sub_10002C3A8(uint64_t result)
{
  return result;
}

void sub_10002C47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10002C494(uint64_t a1)
{
  if ([*(id *)(a1 + 32) refCount])
  {
    objc_msgSend(*(id *)(a1 + 32), "setRefCount:", objc_msgSend(*(id *)(a1 + 32), "refCount") - 1);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000579DC();
  }
  id result = [*(id *)(a1 + 32) refCount];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_10002D970(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DA00;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DA00(uint64_t a1)
{
}

void sub_10002DA08(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DA98;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DA98(uint64_t a1)
{
}

void sub_10002DAA0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DB30;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DB30(uint64_t a1)
{
}

void sub_10002DB38(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DBC8;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DBC8(uint64_t a1)
{
}

void sub_10002DBD0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DC60;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DC60(uint64_t a1)
{
}

void sub_10002DC68(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DCF8;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DCF8(uint64_t a1)
{
}

void sub_10002DD00(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002DD90;
  v3[3] = &unk_100089D18;
  id v4 = *(id *)(a1 + 48);
  [v1 closeFileRefInternal:v2 CompletionHandler:v3];
}

void sub_10002DD90(uint64_t a1)
{
}

uint64_t sub_10002DD98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) openFileRefs];
  id v3 = *(uint64_t (**)(uint64_t, void, id))(v1 + 16);
  return v3(v1, 0, v2);
}

void sub_10002DF88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fidCtx];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E054;
  v7[3] = &unk_1000889C8;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr sendClose:v4 Param:v5 GetPostAttrs:0 CompletionHandler:v7];
}

uint64_t sub_10002E054(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002E064(uint64_t a1, int a2)
{
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4) {
      sub_100057D30();
    }
  }
  else if (v4)
  {
    sub_100057C90(a1);
  }
  free(*(void **)(a1 + 56));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002E40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002E448(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002E458(uint64_t a1)
{
}

void sub_10002E460(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E518;
  v7[3] = &unk_1000889C8;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr queryNode:v4 attrs:v5 CompletionHandler:v7];
}

uint64_t sub_10002E518(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002E528(uint64_t a1, int a2)
{
  uint64_t v4 = *(char **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  long long v5 = *((_OWORD *)v4 + 3);
  long long v56 = *((_OWORD *)v4 + 2);
  long long v57 = v5;
  long long v6 = *((_OWORD *)v4 + 5);
  long long v58 = *((_OWORD *)v4 + 4);
  long long v59 = v6;
  long long v7 = *((_OWORD *)v4 + 1);
  long long v54 = *(_OWORD *)v4;
  long long v55 = v7;
  timespec v53 = *(timespec *)(v4 + 104);
  int v8 = *((_DWORD *)v4 + 30);
  timespec v9 = *(timespec *)(v4 + 124);
  timespec v10 = *(timespec *)(v4 + 140);
  timespec v11 = *(timespec *)(v4 + 172);
  timespec v62 = *(timespec *)(v4 + 156);
  timespec v63 = v11;
  timespec v60 = v9;
  timespec v61 = v10;
  timespec v12 = *(timespec *)(v4 + 188);
  timespec v13 = *(timespec *)(v4 + 204);
  timespec v14 = *(timespec *)(v4 + 220);
  int v67 = *((_DWORD *)v4 + 59);
  timespec v65 = v13;
  timespec v66 = v14;
  timespec v64 = v12;
  free(v4);
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057F34();
    }
    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  id v17 = (timespec **)(a1 + 32);
  id v16 = *(timespec **)(a1 + 32);
  if (LODWORD(v16[8].tv_sec) != v8)
  {
    if ([(timespec *)v16 np_flag])
    {
      if (v8 == 1)
      {
        id v16 = *v17;
        goto LABEL_7;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100057EBC();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100057E1C(a1 + 32, v8);
    }
    [*(id *)(a1 + 32) setZombieState:1];
    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
    v15();
    return;
  }
LABEL_7:
  [(id)v16[22].tv_nsec lock];
  id v18 = *v17;
  long long v19 = v57;
  *(_OWORD *)&v18[2].tv_nsec = v56;
  *(_OWORD *)&v18[3].tv_nsec = v19;
  long long v20 = v59;
  *(_OWORD *)&v18[4].tv_nsec = v58;
  *(_OWORD *)&v18[5].tv_nsec = v20;
  long long v21 = v55;
  *(_OWORD *)&v18->tv_nsec = v54;
  *(_OWORD *)&v18[1].tv_nsec = v21;
  v18[7] = v53;
  LODWORD(v18[8].tv_sec) = v8;
  timespec v22 = v60;
  timespec v23 = v61;
  timespec v24 = v62;
  *(timespec *)((char *)v18 + 180) = v63;
  *(timespec *)((char *)v18 + 164) = v24;
  *(timespec *)((char *)v18 + 14_Block_object_dispose(&STACK[0x200], 8) = v23;
  *(timespec *)((char *)v18 + 132) = v22;
  timespec v25 = v64;
  timespec v26 = v65;
  timespec v27 = v66;
  HIDWORD(v18[15].tv_sec) = v67;
  *(timespec *)((char *)v18 + 22_Block_object_dispose(&STACK[0x200], 8) = v27;
  *(timespec *)((char *)v18 + 212) = v26;
  *(timespec *)((char *)v18 + 196) = v25;
  clock_gettime(_CLOCK_REALTIME, *v17 + 16);
  uint64_t v28 = *v17;
  if (((*v17)->tv_nsec & 0x40) != 0)
  {
    BYTE4(v28[15].tv_nsec) = 1;
    LODWORD((*v17)[15].tv_nsec) = (*v17)[15].tv_sec;
    clock_gettime(_CLOCK_REALTIME, *v17 + 17);
    uint64_t v28 = *v17;
  }
  [(id)v28[22].tv_nsec unlock];
  BOOL v29 = *v17;
  int tv_sec_high = HIDWORD((*v17)[20].tv_sec);
  if ((tv_sec_high & 2) != 0)
  {
    id v32 = [(timespec *)v29 mp];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10002E96C;
    v50[3] = &unk_100088A90;
    uint64_t v33 = *(void *)(a1 + 56);
    uint64_t v51 = *(void *)(a1 + 32);
    uint64_t v52 = v33;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10002EA94;
    v47[3] = &unk_100089ED0;
    v47[4] = v51;
    id v34 = *(id *)(a1 + 40);
    uint64_t v35 = *(void *)(a1 + 56);
    id v48 = v34;
    uint64_t v49 = v35;
    [v32 submitRequestBlock:v50 continuationBlock:v47];

    uint64_t v36 = v48;
LABEL_21:

    return;
  }
  if (tv_sec_high)
  {
    id v37 = [(timespec *)v29 mp];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10002EB4C;
    v44[3] = &unk_100088A90;
    uint64_t v38 = *(void *)(a1 + 56);
    uint64_t v45 = *(void *)(a1 + 32);
    uint64_t v46 = v38;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10002EC74;
    v41[3] = &unk_100089ED0;
    v41[4] = v45;
    id v39 = *(id *)(a1 + 40);
    uint64_t v40 = *(void *)(a1 + 56);
    id v42 = v39;
    uint64_t v43 = v40;
    [v37 submitRequestBlock:v44 continuationBlock:v41];

    uint64_t v36 = v42;
    goto LABEL_21;
  }
  uint64_t v31 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  v31();
}

void sub_10002E96C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002EA18;
  v7[3] = &unk_100088A68;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  +[smb_subr readReparseSymlink:v5 completionHandler:v7];
}

void sub_10002EA18(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002EA94(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057FA4();
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 360) lock];
    [*(id *)(a1 + 32) setReparseSymLink:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(a1 + 32) + 360) unlock];
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
}

void sub_10002EB4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002EBF8;
  v7[3] = &unk_100088A68;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  +[smb_subr readWindowsSymlink:v5 completionHandler:v7];
}

void sub_10002EBF8(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002EC74(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057FA4();
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 360) lock];
    [*(id *)(a1 + 32) setWindowsSymLink:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(a1 + 32) + 360) unlock];
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
}

void sub_10002EE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002EE48(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002F0D4(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 360) lock];
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = (void *)v4[36];
    if (v5)
    {
      id v6 = (void *)v4[45];
      id v20 = v5;
      [v6 unlock];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v7 = (uint64_t)(v4 + 1);
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
      id v8 = [v4 mp];
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 shareInfo];
        char v10 = v21;
      }
      else
      {
        char v10 = 0;
      }
      sub_1000333BC(v7, v10, (uint64_t)&v22);

      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 408);
      *(void *)(v11 + 40_Block_object_dispose(&STACK[0x200], 8) = v12 + 1;
      *(void *)&long long v23 = v12;
      uint64_t v13 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v13 + 324) & 3) != 0) {
        *(void *)&long long v25 = *(void *)(v13 + 400);
      }
      uint64_t v14 = +[NSData dataWithBytes:&v22 length:184];
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 288);
      *(void *)(v15 + 28_Block_object_dispose(&STACK[0x200], 8) = v14;

      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = *(void **)(v17 + 360);
      id v19 = *(id *)(v17 + 288);
      [v18 unlock];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_10002F798(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
  id v3 = [v2 fidCtx];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F878;
  v6[3] = &unk_100089F48;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v8 = v5;
  id v7 = v4;
  +[smb_subr sendClose:v3 Param:v5 GetPostAttrs:0 CompletionHandler:v6];
}

void sub_10002F878(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100058090();
  }
  objc_msgSend(*(id *)(a1 + 32), "setRead_fileRef:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10002F8D8(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
  id v3 = [v2 fidCtx];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F9B8;
  v6[3] = &unk_100089F48;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v8 = v5;
  id v7 = v4;
  +[smb_subr sendClose:v3 Param:v5 GetPostAttrs:0 CompletionHandler:v6];
}

void sub_10002F9B8(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100058124();
  }
  objc_msgSend(*(id *)(a1 + 32), "setWrite_fileRef:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10002FA18(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
  id v3 = [v2 fidCtx];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FAF8;
  v6[3] = &unk_100089F48;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v8 = v5;
  id v7 = v4;
  +[smb_subr sendClose:v3 Param:v5 GetPostAttrs:0 CompletionHandler:v6];
}

void sub_10002FAF8(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000581B8();
  }
  objc_msgSend(*(id *)(a1 + 32), "setReadWrite_fileRef:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10002FB58(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          free(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v6), "pointerValue", (void)v9));
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }

    [*(id *)(a1 + 32) removeAllObjects];
  }
  if (*(void *)(a1 + 56))
  {
    id v7 = [*(id *)(a1 + 40) mp];
    [v7 decreaseOpenFileCount:*(void *)(a1 + 56)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002FD50(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDir])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002FE1C;
    v4[3] = &unk_1000889C8;
    id v2 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v2 clearChangeNotify:0 completionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

uint64_t sub_10002FE1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002FF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002FFB4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDir])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003006C;
    v4[3] = &unk_100088888;
    id v2 = *(void **)(a1 + 32);
    void v4[4] = *(void *)(a1 + 40);
    [v2 clearChangeNotify:0 completionHandler:v4];
  }
  else
  {
    id v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    dispatch_group_leave(v3);
  }
}

void sub_10003006C(uint64_t a1)
{
}

void sub_10003029C(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
  unsigned int v3 = [v2 reconnState];

  if (v3 != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setReconnState:1];
  }
}

void sub_100030330(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
  unsigned int v3 = [v2 reconnState];

  if (v3 != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setReconnState:1];
  }
}

void sub_1000303C4(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
  unsigned int v3 = [v2 reconnState];

  if (v3 != 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setReconnState:1];
  }
}

void sub_100030778(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100030790(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 reconnState] == 1)
  {
    unsigned int v3 = objc_msgSend(*v2, "ReadWrite_fileRef");
    unsigned int v4 = [v3 shareMode];

    if (v4 != 7)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_msgSend(v5, "ReadWrite_fileRef");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 reopenFileRef:v6];

      LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
      uint64_t v8 = v7;
      if (v6)
      {
        [v7 setReconnState:2];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000585B0((uint64_t)v2);
        }
      }
      else
      {
        [v7 setReconnState:0];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100058528((uint64_t)v2);
        }
        long long v9 = [*v2 mp];
        [v9 increaseOpenFileCount:1];
      }
    }
  }
  else
  {
  }
}

void sub_100030900(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 reconnState] == 1)
  {
    unsigned int v3 = objc_msgSend(*v2, "Write_fileRef");
    unsigned int v4 = [v3 shareMode];

    if (v4 != 7)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_msgSend(v5, "Write_fileRef");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 reopenFileRef:v6];

      LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
      uint64_t v8 = v7;
      if (v6)
      {
        [v7 setReconnState:2];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000586C4((uint64_t)v2);
        }
      }
      else
      {
        [v7 setReconnState:0];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_10005863C((uint64_t)v2);
        }
        long long v9 = [*v2 mp];
        [v9 increaseOpenFileCount:1];
      }
    }
  }
  else
  {
  }
}

void sub_100030A70(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 reconnState] == 1)
  {
    unsigned int v3 = objc_msgSend(*v2, "Read_fileRef");
    unsigned int v4 = [v3 shareMode];

    if (v4 != 7)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_msgSend(v5, "Read_fileRef");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 reopenFileRef:v6];

      LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
      uint64_t v8 = v7;
      if (v6)
      {
        [v7 setReconnState:2];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000587D8((uint64_t)v2);
        }
      }
      else
      {
        [v7 setReconnState:0];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100058750((uint64_t)v2);
        }
        long long v9 = [*v2 mp];
        [v9 increaseOpenFileCount:1];
      }
    }
  }
  else
  {
  }
}

void sub_100030E04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100030E1C(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 reconnState] == 1)
  {
    unsigned int v3 = objc_msgSend(*v2, "ReadWrite_fileRef");
    unsigned int v4 = [v3 shareMode];

    if (v4 == 7)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_msgSend(v5, "ReadWrite_fileRef");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 reopenFileRef:v6];

      LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "ReadWrite_fileRef");
      uint64_t v8 = v7;
      if (v6)
      {
        [v7 setReconnState:2];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000588EC((uint64_t)v2);
        }
      }
      else
      {
        [v7 setReconnState:0];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100058864((uint64_t)v2);
        }
        long long v9 = [*v2 mp];
        [v9 increaseOpenFileCount:1];
      }
    }
  }
  else
  {
  }
}

void sub_100030F8C(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 reconnState] == 1)
  {
    unsigned int v3 = objc_msgSend(*v2, "Write_fileRef");
    unsigned int v4 = [v3 shareMode];

    if (v4 == 7)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_msgSend(v5, "Write_fileRef");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 reopenFileRef:v6];

      LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "Write_fileRef");
      uint64_t v8 = v7;
      if (v6)
      {
        [v7 setReconnState:2];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100058A00((uint64_t)v2);
        }
      }
      else
      {
        [v7 setReconnState:0];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100058978((uint64_t)v2);
        }
        long long v9 = [*v2 mp];
        [v9 increaseOpenFileCount:1];
      }
    }
  }
  else
  {
  }
}

void sub_1000310FC(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 reconnState] == 1)
  {
    unsigned int v3 = objc_msgSend(*v2, "Read_fileRef");
    unsigned int v4 = [v3 shareMode];

    if (v4 == 7)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = objc_msgSend(v5, "Read_fileRef");
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 reopenFileRef:v6];

      LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v7 = objc_msgSend(*(id *)(a1 + 32), "Read_fileRef");
      uint64_t v8 = v7;
      if (v6)
      {
        [v7 setReconnState:2];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100058B14((uint64_t)v2);
        }
      }
      else
      {
        [v7 setReconnState:0];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100058A8C((uint64_t)v2);
        }
        long long v9 = [*v2 mp];
        [v9 increaseOpenFileCount:1];
      }
    }
  }
  else
  {
  }
}

void sub_1000314A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000314D8(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(*(void *)(a1 + 56) + 16);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  free(*(void **)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003186C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000318A0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003195C;
  v7[3] = &unk_100089FE8;
  uint64_t v5 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = v4;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr openFileNode:v5 withStream:0 withArgs:v4 CompletionHandler:v7];
}

void sub_10003195C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  free(*(void **)(a1 + 48));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
  id v7 = v4;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000319F4(uint64_t a1, int a2)
{
  if (!a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 480), *(id *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 480) setFidCtx:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v8 = *(void *)(a1 + 32);
    *(void *)(v8 + 304) = 0;
    *(void *)(v8 + 312) = 0;
    *(_WORD *)(*(void *)(a1 + 32) + 30_Block_object_dispose(&STACK[0x200], 8) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 312) = 3399;
    uint64_t v9 = [*(id *)(a1 + 32) mp];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100031C04;
    v14[3] = &unk_10008A010;
    void v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100031CF0;
    v11[3] = &unk_10008A038;
    uint64_t v10 = *(void *)(a1 + 72);
    v11[4] = *(void *)(a1 + 32);
    uint64_t v13 = v10;
    id v12 = *(id *)(a1 + 48);
    [v9 submitRequestBlockOnce:v14 continuationBlock:v11];

    return;
  }
  id v4 = [*(id *)(a1 + 32) mp];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 shareInfo];

    if (BYTE8(v16))
    {
      BOOL v6 = (WORD4(v16) & 0x200) == 0 && a2 == 13;
      BOOL v7 = v6;
      if (a2 == 22 || v7) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100058C74((id *)(a1 + 32));
  }
LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100031C04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 480) fidCtx];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5 + 304;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031CE0;
  v9[3] = &unk_1000889C8;
  id v10 = v3;
  id v8 = v3;
  +[smb_subr setChangeNotify:v4 Param:v7 CompletionHandler:v9 NotifyHandler:v6];
}

uint64_t sub_100031CE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100031CF0(uint64_t a1, int a2)
{
  if (!a2) {
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100058D10(a1);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 480) decRef];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
    *uint64_t v5 = 0u;
    v5[1] = 0u;
    v5[2] = 0u;
    v5[3] = 0u;
    uint64_t v6 = [*(id *)(a1 + 32) mp];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100031EAC;
    v17[3] = &unk_100089288;
    uint64_t v18 = *(void *)(a1 + 32);
    long long v19 = v5;
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    long long v11 = sub_100031F8C;
    id v12 = &unk_100089738;
    uint64_t v13 = v18;
    id v15 = v5;
    id v14 = *(id *)(a1 + 40);
    int v16 = a2;
    [v6 submitRequestBlock:v17 continuationBlock:&v9];

LABEL_7:
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "mp", v9, v10, v11, v12, v13);
    [v7 increaseChangeNotifyCount:1];

    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

void sub_100031EAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 480) fidCtx];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031F7C;
  v7[3] = &unk_1000889C8;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr sendClose:v4 Param:v5 GetPostAttrs:0 CompletionHandler:v7];
}

uint64_t sub_100031F7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100031F8C(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100058DAC(a1);
  }
  free(*(void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 480);
  *(void *)(v3 + 480) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100032358(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fidCtx];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032424;
  v7[3] = &unk_1000889C8;
  id v8 = v3;
  id v6 = v3;
  +[smb_subr sendClose:v4 Param:v5 GetPostAttrs:0 CompletionHandler:v7];
}

uint64_t sub_100032424(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100032434(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100058EF4(a1);
  }
  free(*(void **)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) mp];
  [v3 decreaseChangeNotifyCount:1];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000324C0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fidCtx];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032588;
  v5[3] = &unk_100089F48;
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  void v5[4] = *(void *)(a1 + 40);
  uint64_t v7 = v4;
  id v6 = v3;
  +[smb_subr sendClose:v2 Param:v4 GetPostAttrs:0 CompletionHandler:v5];
}

void sub_100032588(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100058F90();
  }
  id v3 = [*(id *)(a1 + 32) mp];
  [v3 decreaseChangeNotifyCount:1];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_1000325F8(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void sub_100032AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_100032AD8(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(*(void *)(a1 + 56) + 16);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  free(*(void **)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100032B58(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100032B6C(void *a1, int a2)
{
  uint64_t v4 = a1[5];
  id v3 = (void *)a1[6];
  *(_DWORD *)(*(void *)(v4 + 8) + 24) = a2;
  free(v3);
  id v5 = a1[4];
  dispatch_group_leave(v5);
}

void sub_100032F38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_100032F94@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, int a3@<W8>)
{
  *(void *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + 24) = a3;
  return result;
}

void sub_100032FB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100032FE0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

uint64_t sub_100033008(uint64_t result)
{
  if (((result + 5046) > 4 || ((1 << (result - 74)) & 0x13) == 0) && (result + 5997) >= 2) {
    return result;
  }
  else {
    return 80;
  }
}

uint64_t sub_100033040(unsigned int a1)
{
  return (a1 < 0x3A) & (0x238000100000000uLL >> a1);
}

id sub_10003305C(const sockaddr *a1, socklen_t a2)
{
  int v2 = getnameinfo(a1, a2, __s, 0x401u, 0, 0, 2);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000591B0(v3);
    }
    goto LABEL_5;
  }
  if (strchr(__s, 37))
  {
LABEL_5:
    id v4 = 0;
    goto LABEL_6;
  }
  id v4 = [objc_alloc((Class)NSString) initWithUTF8String:__s];
LABEL_6:
  return v4;
}

id sub_100033128(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1 || ![v1 length])
  {
    id v4 = 0;
LABEL_20:
    id v6 = 0;
    id v5 = 0;
    goto LABEL_21;
  }
  id v3 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
  id v4 = v3;
  if (!v3 || ![v3 length]) {
    goto LABEL_20;
  }
  id v5 = [v4 componentsSeparatedByString:&stru_10008AEF8];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = v5;
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        id v8 = v7;
        id v9 = 0;
        uint64_t v10 = *(void *)v16;
        do
        {
          long long v11 = 0;
          id v12 = v9;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v5);
            }
            id v9 = *(id *)(*((void *)&v15 + 1) + 8 * (void)v11);

            if (objc_msgSend(v9, "length", (void)v15)) {
              [v6 addObject:v9];
            }
            long long v11 = (char *)v11 + 1;
            id v12 = v9;
          }
          while (v8 != v11);
          id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }
      if ([v6 count])
      {
        id v13 = [v6 copy];
        goto LABEL_22;
      }
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_21:
  id v13 = 0;
LABEL_22:

  return v13;
}

uint64_t sub_10003331C(unsigned int a1)
{
  int v1 = (a1 >> 23) & 0xC0 | ((__int16)(a1 >> 13) >> 15) & 0x1C0;
  int v2 = v1 | 0x100;
  if ((a1 & 0x80000000) != 0) {
    v1 |= 0x100u;
  }
  if (a1) {
    int v1 = v2;
  }
  int v3 = (32 * a1) & 0x80;
  if ((a1 & 0x10000) != 0) {
    int v3 = 128;
  }
  int v4 = (2 * a1) & 0x40 | (((a1 & 2) != 0) << 7) | v3;
  if ((a1 & 0x40) != 0) {
    int v4 = 192;
  }
  int v5 = v4 | v1;
  int v6 = (a1 >> 9) & 0x100;
  if ((a1 & 0x100000) != 0) {
    int v6 = 256;
  }
  int v7 = (a1 >> 11) & 0x80;
  if ((a1 & 0x80000) != 0) {
    int v7 = 128;
  }
  return (a1 >> 1) & 0x80 | (((a1 >> 7) & 1) << 8) | v6 | v7 | v5;
}

uint64_t sub_1000333BC(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(a3 + 176) = 0;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 12_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + ++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  int v6 = *(_DWORD *)(a1 + 120);
  if (v6 != 1)
  {
    if (v6 == 5)
    {
      int v6 = 3;
    }
    else if (v6 != 2)
    {
      NSLog(@"smbfattr_to_lifileattr: Unexpected fa_vtype: %u", *(unsigned int *)(a1 + 120));
      goto LABEL_7;
    }
  }
  *(_DWORD *)(a3 + 24) = v6;
  *(void *)(a3 + 8) |= 1uLL;
LABEL_7:
  if ((*(unsigned char *)a1 & 0x40) != 0) {
    uint64_t result = sub_10003331C(*(_DWORD *)(a1 + 232));
  }
  else {
    uint64_t result = 448;
  }
  *(_DWORD *)(a3 + 2_Block_object_dispose(&STACK[0x200], 8) = result;
  uint64_t v8 = *(void *)(a3 + 8);
  *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x200], 8) = *(_OWORD *)(a1 + 16);
  *(void *)(a3 + 64) = *(void *)(a1 + 96);
  *(void *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = v8 | 0x1C2;
  *(_OWORD *)(a3 + 80) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a3 + 96) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a3 + 112) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a3 + 12_Block_object_dispose(&STACK[0x200], 8) = *(_OWORD *)(a1 + 80);
  *(_DWORD *)(a3 + 44) = 0;
  if (*(_DWORD *)(a1 + 120) == 2)
  {
    int v9 = 0;
    int v10 = *(_DWORD *)(a1 + 8);
    if ((a2 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  int v10 = *(_DWORD *)(a1 + 8);
  if ((v10 & 0x20) == 0)
  {
    int v9 = 0x10000;
    *(_DWORD *)(a3 + 44) = 0x10000;
LABEL_15:
    if ((v10 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  int v9 = 0;
  if (v10)
  {
LABEL_16:
    v9 |= 2u;
    *(_DWORD *)(a3 + 44) = v9;
  }
LABEL_17:
  if ((v10 & 2) != 0)
  {
    v9 |= 0x8000u;
    *(_DWORD *)(a3 + 44) = v9;
  }
  if ((v10 & 0x400) != 0 && *(_DWORD *)(a1 + 168) == -2147483618 && (v10 & 0x401200) != 0) {
    *(_DWORD *)(a3 + 44) = v9 | 0x40000000;
  }
  *(void *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = v8 | 0x3DE2;
  return result;
}

uint64_t sub_100033544(uint64_t *a1)
{
  if (*((_DWORD *)a1 + 2) <= 0x67u)
  {
    printf("smb_parse_fileid_both_dir_info: Parse error, truncated FileIdBothDirInformation, buflen: %u\n");
    return 0;
  }
  int v2 = (_OWORD *)a1[3];
  v2[13] = 0u;
  v2[14] = 0u;
  v2[11] = 0u;
  v2[12] = 0u;
  v2[9] = 0u;
  v2[10] = 0u;
  v2[7] = 0u;
  v2[8] = 0u;
  v2[5] = 0u;
  v2[6] = 0u;
  v2[3] = 0u;
  void v2[4] = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  *int v2 = 0u;
  uint64_t v3 = *a1;
  int v4 = (uint64_t *)a1[3];
  unint64_t v5 = *(void *)(*a1 + 16);
  uint64_t v6 = qword_100091490;
  v4[10] = *(void *)(*a1 + 8) / 0x989680uLL - qword_100091490;
  v4[11] = 0;
  void v4[4] = v5 / 0x989680 - v6;
  void v4[5] = 0;
  unint64_t v7 = *(void *)(v3 + 32);
  v4[8] = *(void *)(v3 + 24) / 0x989680uLL - v6;
  v4[9] = 0;
  v4[6] = v7 / 0x989680 - v6;
  v4[7] = 0;
  *((_OWORD *)v4 + 1) = *(_OWORD *)(v3 + 40);
  int v8 = *(_DWORD *)(v3 + 56);
  *((_DWORD *)v4 + 2) = v8;
  if ((v8 & 0x10) != 0)
  {
    int v10 = 2;
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 30) = 1;
  if ((v8 & 0x400) != 0)
  {
    int v9 = *(_DWORD *)(v3 + 64);
    *((_DWORD *)v4 + 42) = v9;
    if (v9 == -1610612724)
    {
      *v4 |= 2uLL;
      int v10 = 5;
LABEL_9:
      *((_DWORD *)v4 + 30) = v10;
    }
  }
  uint64_t v11 = *v4;
  *v4 |= 1uLL;
  if ((~*((_DWORD *)a1 + 4) & 5) == 0)
  {
    if ((v8 & 0x400) != 0) {
      int v12 = 2032127;
    }
    else {
      int v12 = *(_DWORD *)(v3 + 64);
    }
    *((_DWORD *)v4 + 5_Block_object_dispose(&STACK[0x200], 8) = v12;
    *int v4 = v11 | 0x41;
  }
  v4[12] = *(void *)(v3 + 96);
  id v13 = (UInt8 **)a1[4];
  if (v13)
  {
    CFIndex v14 = *(unsigned int *)(v3 + 60);
    if (!v14)
    {
      puts("smb_parse_fileid_both_dir_info: FileIdBothDirInformation.name_len is zero");
      return 0;
    }
    if (*((_DWORD *)a1 + 2) - 104 < v14)
    {
      printf("smb_parse_fileid_both_dir_info: Truncated FileIdBothDirInformation, name_len: %u but bufremain: %u\n");
      return 0;
    }
    if (sub_100033748((UInt8 *)(v3 + 104), v14, v13, (_DWORD *)a1 + 10))
    {
      printf("smb_parse_fileid_both_dir_info: Failed to convert FileIdBothDirInformation.Filename, error: %d\n");
      return 0;
    }
  }
  return 1;
}

unint64_t sub_10003371C(unint64_t result, void *a2)
{
  *a2 = result / 0x989680 - qword_100091490;
  a2[1] = 0;
  return result;
}

uint64_t sub_100033748(UInt8 *bytes, CFIndex numBytes, UInt8 **a3, _DWORD *a4)
{
  CFStringRef v7 = CFStringCreateWithBytes(kCFAllocatorDefault, bytes, numBytes, 0x14000100u, 0);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFIndex usedBufLen = 0;
    CFIndex Length = CFStringGetLength(v7);
    v16.id location = 0;
    v16.length = Length;
    if (CFStringGetBytes(v8, v16, 0x8000100u, 0, 0, 0, 0, &usedBufLen))
    {
      CFIndex v10 = usedBufLen;
      uint64_t v11 = (UInt8 *)malloc_type_calloc(usedBufLen, 1uLL, 0x557FE399uLL);
      if (!v11)
      {
        printf("utf16_to_utf8: No memory for encode buffer, encode_len: %lu\n", v10);
        uint64_t v13 = 12;
        goto LABEL_11;
      }
      int v12 = v11;
      v17.id location = 0;
      v17.length = Length;
      if (CFStringGetBytes(v8, v17, 0x8000100u, 0, 0, v11, v10, &usedBufLen))
      {
        uint64_t v13 = 0;
        *a3 = v12;
        *a4 = v10;
LABEL_11:
        CFRelease(v8);
        return v13;
      }
      puts("utf16_to_utf8: Failed to convert input string");
      free(v12);
    }
    else
    {
      printf("utf16_to_utf8: Error converting input string: %s\n", (const char *)bytes);
    }
    uint64_t v13 = 22;
    goto LABEL_11;
  }
  printf("utf16_to_utf8: Failed to created CFString from inbuf: %s\n", (const char *)bytes);
  return 22;
}

uint64_t *sub_1000338C0(uint64_t *result, void *a2, int a3)
{
  uint64_t v3 = *result;
  unint64_t v4 = qword_100091490;
  if (a3)
  {
    uint64_t v3 = qword_100091490;
    unint64_t v4 = *result & 0xFFFFFFFFFFFFFFFELL;
  }
  *a2 = 10000000 * (v4 + v3);
  return result;
}

uint64_t sub_1000338F4(char *cStr, UInt8 **a2, _DWORD *a3, _DWORD *a4, uint64_t a5)
{
  CFStringRef v10 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (v10)
  {
    CFStringRef v11 = v10;
    CFIndex maxBufLen = 0;
    CFIndex Length = CFStringGetLength(v10);
    v19.id location = 0;
    v19.length = Length;
    if (CFStringGetBytes(v11, v19, 0x14000100u, 0, 0, 0, 0, &maxBufLen))
    {
      size_t v13 = maxBufLen;
      if (a5)
      {
        size_t v13 = maxBufLen + 2;
        maxBufLen += 2;
      }
      CFIndex v14 = (UInt8 *)malloc_type_calloc(v13, 1uLL, 0x4449F9E0uLL);
      if (!v14)
      {
        printf("utf8_to_utf16: No memory for encode_len: %lu\n", maxBufLen);
        a5 = 12;
LABEL_14:
        CFRelease(v11);
        return a5;
      }
      long long v15 = v14;
      v20.id location = 0;
      v20.length = Length;
      CFIndex Bytes = CFStringGetBytes(v11, v20, 0x14000100u, 0, 0, v14, maxBufLen, 0);
      if (Bytes)
      {
        *a2 = v15;
        *a3 = maxBufLen;
        *a4 = Bytes;
        if (a5)
        {
          a5 = 0;
          *a4 = Bytes + 1;
        }
        goto LABEL_14;
      }
      printf("utf8_to_utf16: Failed to convert input string: %s\n", cStr);
      free(v15);
    }
    else
    {
      printf("utf8_to_utf16: Error converting input string: %s\n", cStr);
    }
    a5 = 22;
    goto LABEL_14;
  }
  printf("utf8_to_utf16: Failed to created CFString from inbuf: %s\n", cStr);
  return 22;
}

unsigned char *sub_100033A90(void *a1, int *a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  memset(&c, 0, sizeof(c));
  *a2 = 0;
  if (!v3
    || ![v3 length]
    || (unint64_t v5 = (const char *)[v4 UTF8String]) == 0)
  {
    int v9 = 0;
    int v11 = 22;
LABEL_9:
    *a2 = v11;
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  CC_LONG v7 = strnlen(v5, 0x400uLL);
  CFStringRef v8 = malloc_type_malloc(0x42BuLL, 0x5D666A17uLL);
  int v9 = v8;
  if (!v8)
  {
    int v11 = 12;
    goto LABEL_9;
  }
  *(_DWORD *)CFStringRef v8 = *(_DWORD *)aXsym;
  void v8[4] = aXsym[4];
  snprintf(v8 + 5, 0x426uLL, "%04u\n", v7);
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, v6, v7);
  CC_MD5_Final(md, &c);
  snprintf(v9 + 10, 0x421uLL, "%08x%08x%08x%08x\n", bswap32(*(unsigned int *)md), bswap32(v15), bswap32(v16), bswap32(v17));
  CFStringRef v10 = v9 + 43;
  __memcpy_chk();
  if ((int)(v7 - 1025) <= -2)
  {
    v10[v7] = 10;
    if (v7 != 1023) {
      memset(&v10[v7 + 1], 32, 1023 - v7);
    }
  }
LABEL_10:

  return v9;
}

uint64_t sub_100033C5C(uint64_t a1, unsigned int a2, void *a3)
{
  if (a2 < 0x42B) {
    return 22;
  }
  if (*(_DWORD *)a1 != *(_DWORD *)aXsym || *(unsigned __int8 *)(a1 + 4) != aXsym[4]) {
    return 22;
  }
  uint64_t v7 = 0;
  CC_LONG v8 = 0;
  while (1)
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + 5 + v7) - 48;
    if (v9 > 9) {
      break;
    }
    CC_LONG v8 = v9 + 10 * v8;
    if (++v7 == 4)
    {
      LODWORD(v7) = 4;
      break;
    }
  }
  uint64_t result = 22;
  if (v7 == 4 && v8 <= 0x400)
  {
    memset(&c, 0, sizeof(c));
    CC_MD5_Init(&c);
    CC_MD5_Update(&c, (const void *)(a1 + 43), v8);
    CC_MD5_Final(md, &c);
    snprintf(__str, 0x21uLL, "%08x%08x%08x%08x", bswap32(*(unsigned int *)md), bswap32(v20), bswap32(v21), bswap32(v22));
    if (*(void *)(a1 + 10) != *(void *)__str
      || *(void *)(a1 + 18) != v16
      || *(void *)(a1 + 26) != v17
      || *(void *)(a1 + 34) != v18)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100059230();
      }
      return 22;
    }
    if (a3)
    {
      id v13 = [objc_alloc((Class)NSString) initWithBytes:a1 + 43 length:v8 encoding:4];
      uint64_t result = 0;
      *a3 = v13;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

unsigned char *sub_100033E38(unsigned char *result, unsigned char *a2)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_100033E44(_DWORD *result, _DWORD *a2)
{
  *a2 = *result;
  return result;
}

_WORD *sub_100033E50(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  return result;
}

void *sub_100033E5C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void *sub_100033E68(void *__src, void *__dst, size_t __n)
{
  return memcpy(__dst, __src, __n);
}

void sub_100033E7C(uint64_t a1)
{
  NSLog(@"a_valid_mask [0x%llx]", *(void *)a1);
  NSLog(@"fa_attr: 0x%x", *(unsigned int *)(a1 + 8));
  NSLog(@"fa_size: 0x%llx", *(void *)(a1 + 16));
  NSLog(@"fa_data_alloc: 0x%llx>", *(void *)(a1 + 24));
  time_t v7 = *(void *)(a1 + 40) / 1000000000 + *(void *)(a1 + 32);
  int v2 = ctime(&v7);
  NSLog(@"fa_atime: %s", v2);
  time_t v7 = *(void *)(a1 + 56) / 1000000000 + *(void *)(a1 + 48);
  id v3 = ctime(&v7);
  NSLog(@"fa_chtime: %s", v3);
  time_t v7 = *(void *)(a1 + 72) / 1000000000 + *(void *)(a1 + 64);
  unint64_t v4 = ctime(&v7);
  NSLog(@"fa_mtime: %s", v4);
  time_t v7 = *(void *)(a1 + 88) / 1000000000 + *(void *)(a1 + 80);
  unint64_t v5 = ctime(&v7);
  NSLog(@"fa_crtime: %s", v5);
  NSLog(@"fa_ino: 0x%llx>", *(void *)(a1 + 96));
  NSLog(@"fa_size: 0x%llx>", *(void *)(a1 + 16));
  time_t v7 = *(void *)(a1 + 112) / 1000000000 + *(void *)(a1 + 104);
  uint64_t v6 = ctime(&v7);
  NSLog(@"fa_reqtime: %s", v6);
  NSLog(@"fa_vtype: 0x%x", *(unsigned int *)(a1 + 120));
  NSLog(@"fa_uid: %llu>", *(void *)(a1 + 128));
  NSLog(@"fa_gid: %llu>", *(void *)(a1 + 136));
  NSLog(@"fa_permissions: 0x%llx", *(void *)(a1 + 144));
  NSLog(@"fa_nlinks: 0x%llx", *(void *)(a1 + 152));
  NSLog(@"fa_flags_mask: 0x%x", *(unsigned int *)(a1 + 160));
  NSLog(@"fa_unix: 0x%x", *(unsigned int *)(a1 + 164));
  NSLog(@"fa_reparse_tag: 0x%x", *(unsigned int *)(a1 + 168));
  NSLog(@"fa_fstatus: 0x%x", *(unsigned __int16 *)(a1 + 172));
  NSLog(@"fa_created_disp: 0x%x", *(unsigned int *)(a1 + 176));
  NSLog(@"fa_rsrc_size: 0x%llx", *(void *)(a1 + 184));
  NSLog(@"fa_rsrc_alloc: 0x%llx", *(void *)(a1 + 192));
  NSLog(@"fa_max_access: 0x%x", *(unsigned int *)(a1 + 232));
}

void sub_10003466C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"mountNumber"];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v4];
}

id sub_10003486C(id *a1)
{
  int v2 = +[NSFileManager defaultManager];
  char v26 = 0;
  id v25 = 0;
  id v3 = [v2 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v25];
  id v4 = v25;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000592F4();
    }
    id v10 = v4;
    goto LABEL_12;
  }
  unint64_t v5 = +[NSURL fileURLWithPath:@"smbclientd" relativeToURL:v3];
  if (!v5)
  {
    int v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100059364();
    }
    id v10 = v11;
LABEL_12:
    id v9 = v10;
    uint64_t v6 = 0;
LABEL_24:
    id v13 = v10;
    goto LABEL_25;
  }
  uint64_t v6 = v5;
  time_t v7 = [v5 path];
  unsigned int v8 = [v2 fileExistsAtPath:v7 isDirectory:&v26];

  if (!v8)
  {
    id v24 = v4;
    int v12 = [v2 createDirectoryAtURL:v6 withIntermediateDirectories:0 attributes:0 error:&v24];
    id v9 = v24;

    if (v12) {
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005944C();
    }
    id v10 = v9;
    goto LABEL_23;
  }
  if (!v26)
  {
    CFIndex v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:20 userInfo:0];

    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_1000593D4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    id v10 = v14;
LABEL_23:
    id v9 = v10;
    goto LABEL_24;
  }
  id v9 = v4;
LABEL_14:
  if (a1) {
    objc_storeStrong(a1, v6);
  }
  id v13 = 0;
LABEL_25:

  return v13;
}

void sub_100035308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003532C(uint64_t a1, void *a2, unsigned char *a3)
{
  id result = [a2 containsString:*(void *)(a1 + 32)];
  if (result)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

void sub_100035FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  objc_sync_exit(obj);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036018(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036028(uint64_t a1)
{
}

id sub_100036030(void *a1)
{
  id v1 = a1;
  [v1 setUser:0];
  [v1 setPath:0];
  int v2 = [v1 URL];

  id v3 = [v2 absoluteString];

  id v4 = [v3 substringFromIndex:objc_msgSend(@"smb://", "length")];

  return v4;
}

void sub_1000360C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v4)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
      {
        uint64_t v5 = [v4 objectForKeyedSubscript:@"shares"];
        uint64_t v6 = *(void *)(*(void *)(a1 + 104) + 8);
        time_t v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v5;
      }
    }
    else
    {
      id v8 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      int v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"shares"];
      id v12 = [v11 mutableCopy];
      uint64_t v13 = *(void *)(*(void *)(a1 + 104) + 8);
      CFIndex v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) forKeyedSubscript:@"shares"];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObject:v3];
    [*(id *)(a1 + 32) addObject:v3];
    BOOL v15 = *(void **)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 72);
    uint64_t v19 = +[NSString stringWithFormat:@"%@", v3];
    uint64_t v20 = +[NSString stringWithFormat:@"%@%@", *(void *)(a1 + 88), v3];
    LODWORD(v30) = 1;
    uint64_t v21 = [v15 internalAddShare:v3 server:v16 password:v17 service:v18 displayName:v19 storageName:v20 existingTags:0 flags:v30];

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100059A14(a1 + 80, (uint64_t)v3, (uint64_t)v21, v22, v23, v24, v25, v26);
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 112) + 8);
      long long v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v21;
      id v29 = v21;
    }
    else
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    }
  }
}

void sub_100036534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_100036560(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:@"user"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"storageName"];
  if ([v9 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v11 = 136315906;
      id v12 = "-[SMBClientdSettings removeServer:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s [%@]Matching server entry: %@ user: %@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

void sub_100036884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036898(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  id v4 = *(void **)(a1 + 32);
  id v5 = [a2 objectForKeyedSubscript:LiveFSMounterMountedOnKey];
  [v4 addObject:v5];
}

void sub_100036900(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got server %@", buf, 0xCu);
  }
  id v6 = v4;
  id v7 = [v5 objectForKeyedSubscript:@"mountNumber"];
  id v8 = [v5 objectForKeyedSubscript:@"shares"];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"storageName"];
  uint64_t v10 = [v5 objectForKeyedSubscript:@"user"];
  int v11 = [v5 objectForKeyedSubscript:@"url"];
  id v12 = +[NSURL URLWithString:v11];
  id v32 = 0;
  __int16 v13 = +[SMBClientdKeychainUtilities getItemForIdentifier:v6 error:&v32];
  id v14 = v32;
  if (v14)
  {
    id v15 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100059CFC();
    }
  }
  else
  {
    uint64_t v22 = v8;
    id v15 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
    uint64_t v16 = [*(id *)(a1 + 32) addVolumeCluster:v9];
    if (v16)
    {
      __int16 v17 = (void *)v16;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100059C8C();
      }
    }
    else
    {
      uint64_t v18 = +[LiveFSFPMountClient locallyBuildFPDomain:v9 displayName:v6 provider:@"com.apple.SMBClientProvider.FileProvider" how:1];
      if (!v18)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100036C6C;
        v24[3] = &unk_10008A1C8;
        id v19 = v12;
        uint64_t v21 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 40);
        id v25 = v19;
        uint64_t v26 = v20;
        id v27 = v15;
        id v28 = v21;
        id v29 = v6;
        id v30 = v9;
        id v31 = *(id *)(a1 + 48);
        id v15 = v15;
        [v8 enumerateObjectsUsingBlock:v24];

        goto LABEL_13;
      }
      __int16 v17 = (void *)v18;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100059C1C();
      }
    }

    id v8 = v22;
  }
LABEL_13:
}

void sub_100036C6C(void *a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100059D6C();
  }
  uint64_t v5 = a1[4];
  id v4 = (void *)a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  id v8 = +[NSString stringWithFormat:@"%@", v3];
  uint64_t v9 = +[NSString stringWithFormat:@"%@%@", a1[9], v3];
  LODWORD(v11) = 0;
  uint64_t v10 = [v4 internalAddShare:v3 server:v5 password:v6 service:v7 displayName:v8 storageName:v9 existingTags:a1[10] flags:v11];
}

void sub_10003721C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100037250(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10003729C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100037480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000374A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000374B4(uint64_t a1)
{
}

void sub_1000374BC(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_1000376A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000376C4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10003785C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100037880(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100037A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100037A58(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100037C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100037C24(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100037DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100037E20(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_100037F14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100037FD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10003808C(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005A3CC();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100038198(uint64_t a1, int a2)
{
  if (a2 && a2 != 96 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005A444();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100038314(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005A4BC();
  }
  free(*(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100038494(uint64_t a1, int a2)
{
  if (a2 || (id v3 = *(_DWORD **)(a1 + 40), v3[3]))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A534();
    }
    id v3 = *(_DWORD **)(a1 + 40);
  }
  free(v3);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100038608(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005A5AC();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100038848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100038860(void *a1, int a2)
{
  *(_DWORD *)(a1[7] + 12) = 0;
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  if (!a2 && ((uint64_t v7 = (_DWORD *)a1[7], *v7 != 268) ? (v8 = *v7 == 0) : (v8 = 1), v8))
  {
    +[smb_subr sendChangeNotify:Param:CompletionHandler:NotifyHandler:](smb_subr, "sendChangeNotify:Param:CompletionHandler:NotifyHandler:", a1[4]);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005A6E8();
    }
    uint64_t v6 = *(uint64_t (**)(void))(a1[5] + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005A660();
    }
    uint64_t v6 = *(uint64_t (**)(void))(a1[5] + 16);
  }
  return v6();
}

void sub_10003897C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A770(a1, a2);
    }
  }
}

void sub_100038ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100038AD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A814();
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  uint64_t v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(void *)uint64_t v5 = 4;
  *(_OWORD *)(v5 + 12) = xmmword_10006C490;
  *(void *)(v5 + 2_Block_object_dispose(&STACK[0x200], 8) = 0x100000001;
  uint64_t v6 = a1 + 40;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:0 withStreamName:0];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v8 = objc_alloc_init((Class)SMBFileAllInformation);
    if (v8)
    {
      uint64_t v9 = malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
      bzero(v9 + 1, 0x46EuLL);
      *uint64_t v9 = 4609;
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddQueryInformation:v9 withStreamName:0 forFileAllInfo:v8 withInputBuffer:0 withOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005A930();
        }
        free(v5);
        uint64_t v10 = v9;
      }
      else
      {
        uint64_t v20 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v20 = 0u;
        v20[1] = 0u;
        v20[2] = 0u;
        v20[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v20 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100038E78;
          v25[3] = &unk_10008A2D8;
          id v30 = v5;
          id v31 = v9;
          id v32 = v20;
          id v21 = *(id *)(a1 + 32);
          uint64_t v22 = *(void *)(a1 + 40);
          id v28 = v21;
          uint64_t v29 = v22;
          id v26 = v4;
          id v23 = v8;
          uint64_t v24 = *(void *)(a1 + 48);
          id v27 = v23;
          uint64_t v33 = v24;
          [v26 sendCmpdRequest:v25];

          goto LABEL_24;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005A8C0();
        }
        free(v5);
        free(v9);
        uint64_t v10 = v20;
      }
      free(v10);
      id v19 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v11) {
        sub_10005A884(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      free(v5);
      id v19 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v19();
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005A9A0();
  }
  free(v5);
  uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
  v7();
LABEL_25:
}

uint64_t sub_100038E78(uint64_t a1, int a2)
{
  if (!a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005AAF0();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 72) withStreamName:0 forFileAllInfo:*(void *)(a1 + 40) withOutputBuffer:0];
      if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005AA10();
        }
        uint64_t v6 = *(void **)(a1 + 40);
        if (v6) {
          [v6 attributes];
        }
        uint64_t v7 = *(_OWORD **)(a1 + 88);
        v7[1] = 0u;
        v7[2] = 0u;
        *uint64_t v7 = 0u;
        void v7[5] = 0u;
        void v7[6] = 0u;
        v7[3] = 0u;
        void v7[4] = 0u;
        v7[9] = 0u;
        v7[10] = 0u;
        v7[7] = 0u;
        v7[8] = 0u;
        v7[13] = 0u;
        v7[14] = 0u;
        v7[11] = 0u;
        v7[12] = 0u;
        id v4 = *(_DWORD **)(a1 + 64);
        uint64_t v8 = *(void *)(a1 + 88);
        *(_DWORD *)(v8 + 232) = v4[29];
        *(void *)v8 |= 0x40uLL;
        goto LABEL_12;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005AA80();
      }
    }
    id v4 = *(_DWORD **)(a1 + 64);
LABEL_12:
    free(v4);
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005AB60();
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

void sub_100039280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000392A4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100039558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003957C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005ACD0();
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_9;
  }
  uint64_t v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(void *)uint64_t v5 = 4;
  *(_OWORD *)(v5 + 12) = xmmword_10006C4A0;
  *(void *)(v5 + 2_Block_object_dispose(&STACK[0x200], 8) = 0x100000001;
  uint64_t v6 = a1 + 64;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v8 = [objc_alloc((Class)NSMutableData) initWithCapacity:1024];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 setLength:1024];
      uint64_t v10 = malloc_type_malloc(0x10uLL, 0x100004094CA146DuLL);
      *(void *)((char *)v10 + 2) = 0;
      v10[1] = 0;
      *(_WORD *)uint64_t v10 = 805;
      *((_DWORD *)v10 + 2) = 32;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddQueryDirectory:v10 onDir:*(void *)(a1 + 40) returnDataIn:v9];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v11) {
          sub_10005AD40(v11, v12, v13, v14, v15, v16, v17, v18);
        }
        free(v5);
        id v19 = v10;
      }
      else
      {
        uint64_t v29 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v29 = 0u;
        v29[1] = 0u;
        v29[2] = 0u;
        v29[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v29 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100039940;
          v34[3] = &unk_10008A328;
          uint64_t v40 = v5;
          uint64_t v41 = v10;
          id v42 = v29;
          id v30 = *(id *)(a1 + 56);
          uint64_t v31 = *(void *)(a1 + 64);
          id v38 = v30;
          uint64_t v39 = v31;
          id v35 = v4;
          id v32 = v9;
          uint64_t v33 = *(void *)(a1 + 72);
          id v36 = v32;
          uint64_t v43 = v33;
          id v37 = *(id *)(a1 + 48);
          [v35 sendCmpdRequest:v34];

          goto LABEL_24;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005AD7C();
        }
        free(v5);
        free(v10);
        id v19 = v29;
      }
      free(v19);
      id v28 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v20) {
        sub_10005AD40(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      free(v5);
      id v28 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v28();
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005ADEC();
  }
  free(v5);
  uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_9:
  v7();
LABEL_25:
}

uint64_t sub_100039940(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005AFE8();
    }
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a2, v4, v5, v6, v7, v8, v9);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 72)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005AF78();
    }
LABEL_8:
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v11, v12, v13, v14, v15, v16);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryDirectory:*(void *)(a1 + 80) returnDataIn:*(void *)(a1 + 40)];
  int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v17)
  {
    if (v17 != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005AE5C();
    }
    goto LABEL_8;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 88) withFlags:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005AF08();
    }
    goto LABEL_8;
  }
  uint64_t v46 = 0;
  long long v45 = 0u;
  long long v44 = 0u;
  id v43 = [*(id *)(a1 + 40) mutableBytes];
  LODWORD(v44) = [*(id *)(a1 + 40) length];
  *(void *)&long long v45 = *(void *)(a1 + 96);
  uint64_t v18 = [*(id *)(a1 + 48) mp];
  id v19 = v18;
  if (v18)
  {
    [v18 shareInfo];
    uint64_t v20 = *((void *)&v41 + 1);
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v42 = 0;
    long long v41 = 0u;
  }
  *((void *)&v44 + 1) = v20;

  if (sub_100033544((uint64_t *)&v43))
  {
    [*(id *)(a1 + 48) setMaxAccessAttr:*(unsigned int *)(*(void *)(a1 + 72) + 116)];
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v21, v22, v23, v24, v25, v26, v41, *((void *)&v41 + 1), v42);
  }
  else
  {
    BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v27) {
      sub_10005AECC(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 72, v35, v36, v37, v38, v39, v40, v41, *((void *)&v41 + 1), v42);
  }
}

void sub_100039E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100039E88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B0F0();
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_23;
  }
  uint64_t v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(void *)uint64_t v5 = 4;
  *(void *)(v5 + 12) = 0x8000000002;
  *((void *)v5 + 3) = 0x100000007;
  if (*((_DWORD *)[*(id *)(a1 + 32) getSmbFattr] + 30) == 2)
  {
    *((_DWORD *)v5 + 5) = 16;
    int v6 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v6;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if (*((_DWORD *)[*(id *)(a1 + 32) getSmbFattr] + 30) == 5)
  {
    int v6 = *((_DWORD *)v5 + 8) | 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v8 = a1 + 64;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 40) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B1D0();
    }
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v10 = (char *)malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
    bzero(v10 + 2, 0x46EuLL);
    *(_WORD *)uint64_t v10 = 4609;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddQueryInformation:v10 withStreamName:0 forFileAllInfo:*(void *)(a1 + 48) withInputBuffer:0 withOutputBuffer:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005B160();
      }
      free(v5);
      uint64_t v9 = v10;
    }
    else
    {
      uint64_t v11 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      _OWORD *v11 = 0u;
      v11[1] = 0u;
      v11[2] = 0u;
      v11[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24) = [v4 cmpdAddClose:v11 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24))
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10003A20C;
        v16[3] = &unk_10008A2D8;
        uint64_t v21 = v5;
        uint64_t v22 = v10;
        uint64_t v23 = v11;
        id v12 = *(id *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 64);
        id v19 = v12;
        uint64_t v20 = v13;
        id v17 = v4;
        id v14 = *(id *)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 72);
        id v18 = v14;
        uint64_t v24 = v15;
        [v17 sendCmpdRequest:v16];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005B160();
      }
      free(v5);
      free(v10);
      uint64_t v9 = (char *)v11;
    }
  }
  free(v9);
  uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_23:
  v7();
LABEL_24:
}

uint64_t sub_10003A20C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B390();
    }
LABEL_11:
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B320();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 72) withStreamName:0 forFileAllInfo:*(void *)(a1 + 40) withOutputBuffer:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B2B0();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005B240();
  }
  uint64_t v5 = *(void **)(a1 + 40);
  if (v5) {
    [v5 attributes];
  }
  int v6 = *(_OWORD **)(a1 + 88);
  v6[1] = 0u;
  v6[2] = 0u;
  *int v6 = 0u;
  void v6[5] = 0u;
  v6[6] = 0u;
  v6[3] = 0u;
  void v6[4] = 0u;
  v6[9] = 0u;
  v6[10] = 0u;
  v6[7] = 0u;
  v6[8] = 0u;
  v6[13] = 0u;
  v6[14] = 0u;
  v6[11] = 0u;
  v6[12] = 0u;
  uint64_t v7 = *(_DWORD **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 88);
  *(_DWORD *)(v8 + 232) = v7[29];
  *(void *)v8 |= 0x40uLL;
  free(v7);
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

uint64_t sub_10003A5D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003A828(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005B494();
  }
  free(*(void **)(a1 + 40));
  *(_DWORD *)(*(void *)(a1 + 48) + ++*(_DWORD *)(*(void *)(result + 32) + 16) = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003AAE0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005B598();
  }
  free(*(void **)(a1 + 40));
  *(_DWORD *)(*(void *)(a1 + 48) + ++*(_DWORD *)(*(void *)(result + 32) + 16) = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003ADCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003ADF0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B6CC();
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_12;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  int v6 = v5;
  *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(void *)id v5 = 5;
  *(void *)(v5 + 12) = 0x8000000002;
  *((void *)v5 + 3) = 0x200000007;
  if (*(_DWORD *)(a1 + 80) == 2)
  {
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 1;
    int v7 = 16;
  }
  else
  {
    int v7 = 128;
  }
  *((_DWORD *)v5 + 5) = v7;
  uint64_t v9 = a1 + 64;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v10 = objc_alloc_init((Class)SMBFileAllInformation);
    if (v10)
    {
      uint64_t v11 = malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
      bzero(v11 + 1, 0x46EuLL);
      _WORD *v11 = 4609;
      *(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24) = [v4 cmpdAddQueryInformation:v11 withStreamName:0 forFileAllInfo:v10 withInputBuffer:0 withOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005B778();
        }
        free(v6);
        id v12 = v11;
      }
      else
      {
        uint64_t v22 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v22 = 0u;
        v22[1] = 0u;
        v22[2] = 0u;
        v22[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24) = [v4 cmpdAddClose:v22 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24))
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10003B1EC;
          v27[3] = &unk_10008A3F0;
          uint64_t v34 = v6;
          uint64_t v35 = v11;
          uint64_t v36 = v22;
          id v23 = *(id *)(a1 + 56);
          uint64_t v24 = *(void *)(a1 + 64);
          id v32 = v23;
          uint64_t v33 = v24;
          id v28 = v4;
          id v29 = v10;
          id v30 = *(id *)(a1 + 40);
          id v25 = *(id *)(a1 + 48);
          int v38 = *(_DWORD *)(a1 + 80);
          uint64_t v26 = *(void *)(a1 + 72);
          id v31 = v25;
          uint64_t v37 = v26;
          [v28 sendCmpdRequest:v27];

          goto LABEL_27;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005B778();
        }
        free(v6);
        free(v11);
        id v12 = v22;
      }
      free(v12);
      uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v13) {
        sub_10005B73C(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      free(v6);
      uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v21();
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005B7E8();
  }
  free(v6);
  uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_12:
  v8();
LABEL_28:
}

void sub_10003B1EC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B9EC();
    }
LABEL_8:
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    free(*(void **)(a1 + 96));
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_9:
    v3();
    return;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 80)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B97C();
    }
    goto LABEL_8;
  }
  unsigned int v4 = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 88) withStreamName:0 forFileAllInfo:*(void *)(a1 + 40) withOutputBuffer:0];
  unsigned int v5 = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 96) withFlags:0];
  if (!v4)
  {
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B858(a1);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9) {
      [v9 attributes];
    }
    id v10 = *(_OWORD **)(a1 + 104);
    long long v11 = v29;
    long long v12 = v31;
    v10[1] = v30;
    v10[2] = v12;
    *id v10 = v11;
    long long v13 = v32;
    long long v14 = v33;
    long long v15 = v35;
    v10[5] = v34;
    v10[6] = v15;
    v10[3] = v13;
    void v10[4] = v14;
    long long v16 = v36;
    long long v17 = v37;
    long long v18 = v39;
    v10[9] = v38;
    v10[10] = v18;
    v10[7] = v16;
    v10[8] = v17;
    long long v19 = v40;
    long long v20 = v41;
    long long v21 = v43;
    v10[13] = v42;
    v10[14] = v21;
    v10[11] = v19;
    v10[12] = v20;
    uint64_t v22 = *(_DWORD **)(a1 + 80);
    uint64_t v23 = *(void *)(a1 + 104);
    *(_DWORD *)(v23 + 232) = v22[29];
    *(void *)v23 |= 0x40uLL;
    free(v22);
    free(*(void **)(a1 + 88));
    free(*(void **)(a1 + 96));
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005B904();
  }
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 88));
  free(*(void **)(a1 + 96));
  int v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned int *)(a1 + 112);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003B53C;
  v24[3] = &unk_10008A3C8;
  id v25 = v6;
  id v26 = *(id *)(a1 + 56);
  id v27 = *(id *)(a1 + 64);
  unsigned int v28 = v4;
  +[smb_subr deleteNameInParent:v25 DeleteName:v7 FileType:v8 CompletionHandler:v24];
}

uint64_t sub_10003B53C(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005BA5C();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10003B810(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005BB80();
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)(v3 + 120) = 2;
    *(void *)v3 |= 1uLL;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003B884(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005BBF0(a1);
    }
    uint64_t v3 = [*(id *)(a1 + 32) mp];
    unsigned int v4 = [v3 pd];
    unsigned int v5 = [*(id *)(a1 + 32) mp];
    id v6 = [v5 shareID];
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003BA04;
    v10[3] = &unk_100088BF8;
    id v11 = v7;
    id v12 = *(id *)(a1 + 40);
    +[smb_subr queryNodeAttr:v4 ShareID:v6 QueryNode:v11 QueryStream:0 FAttrs:v8 CompletionHandler:v10];
  }
  else
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
}

uint64_t sub_10003BA04(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005BC7C(a1);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10003BD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003BD58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v5 + 184) = 0u;
    *(_OWORD *)(v5 + 200) = 0u;
    *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
    *(_OWORD *)(v5 + 232) = 0u;
    *(void *)unsigned int v5 = 1;
    *((_DWORD *)v5 + 7) = 2;
    *(_OWORD *)(v5 + 12) = xmmword_10006C4B0;
    uint64_t v6 = a1 + 72;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005BF20();
      }
      uint64_t v7 = v5;
    }
    else
    {
      uint64_t v9 = malloc_type_malloc(0x60uLL, 0x1000040718B784FuLL);
      *uint64_t v9 = 0u;
      v9[1] = 0u;
      v9[2] = 0u;
      v9[3] = 0u;
      void v9[4] = 0u;
      void v9[5] = 0u;
      *((_DWORD *)v9 + 1) = 589988;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v4 cmpdAddIoctl:v9 setReparsePoint:*(void *)(a1 + 40)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005BEB0();
        }
        free(v5);
        uint64_t v7 = (char *)v9;
      }
      else
      {
        id v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *id v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10003C0B0;
          v15[3] = &unk_10008A490;
          uint64_t v22 = v5;
          uint64_t v23 = v9;
          uint64_t v24 = v10;
          id v11 = *(id *)(a1 + 64);
          uint64_t v12 = *(void *)(a1 + 72);
          id v20 = v11;
          uint64_t v21 = v12;
          id v16 = v4;
          id v17 = *(id *)(a1 + 48);
          id v18 = *(id *)(a1 + 56);
          id v13 = *(id *)(a1 + 32);
          uint64_t v14 = *(void *)(a1 + 80);
          id v19 = v13;
          uint64_t v25 = v14;
          [v16 sendCmpdRequest:v15];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005BE40();
        }
        free(v5);
        free(v9);
        uint64_t v7 = (char *)v10;
      }
    }
    free(v7);
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005BDD0();
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v8();
LABEL_19:
}

void sub_10003C0B0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005C264();
    }
LABEL_7:
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    free(*(void **)(a1 + 96));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  uint64_t v3 = a1 + 72;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 80)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005C1F4();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseIoctl:*(void *)(a1 + 88) reparsePoint:0 sendInputBuffer:0 rcvOutputBuffer:0];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 96) withFlags:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10005C0AC();
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) resetCmpdRequest];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005C03C();
      }
      goto LABEL_7;
    }
    uint64_t v10 = *(void *)(a1 + 80);
    *(void *)(v10 + 240) = 0;
    *(_OWORD *)(v10 + 20_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v10 + 224) = 0u;
    *(_OWORD *)(v10 + 176) = 0u;
    *(_OWORD *)(v10 + 192) = 0u;
    *(_OWORD *)(v10 + 144) = 0u;
    *(_OWORD *)(v10 + 160) = 0u;
    *(_OWORD *)(v10 + 112) = 0u;
    *(_OWORD *)(v10 + 12_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v10 + 80) = 0u;
    *(_OWORD *)(v10 + 96) = 0u;
    *(_OWORD *)(v10 + 4_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v10 + 64) = 0u;
    *(_OWORD *)(v10 + ++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
    *(_OWORD *)(v10 + 32) = 0u;
    *(_OWORD *)uint64_t v10 = 0u;
    uint64_t v11 = *(void *)(a1 + 80);
    *(void *)uint64_t v11 = 1;
    *(_OWORD *)(v11 + 12) = xmmword_10006C4C0;
    int v12 = *(_DWORD *)(v11 + 32) | 0x200000;
    *(_DWORD *)(v11 + 2_Block_object_dispose(&STACK[0x200], 8) = 1;
    *(_DWORD *)(v11 + 32) = v12;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "cmpdAddCreate:withName:withStreamName:");
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005BF20();
      }
      goto LABEL_7;
    }
    id v13 = objc_alloc_init((Class)SMBFileAllInformation);
    if (v13)
    {
      uint64_t v14 = malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
      bzero(v14 + 1, 0x46EuLL);
      *uint64_t v14 = 4609;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) cmpdAddQueryInformation:v14 withStreamName:0 forFileAllInfo:v13 withInputBuffer:0 withOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005BFCC();
        }
      }
      else
      {
        uint64_t v24 = *(_OWORD **)(a1 + 96);
        v24[2] = 0u;
        v24[3] = 0u;
        _OWORD *v24 = 0u;
        v24[1] = 0u;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) cmpdAddClose:*(void *)(a1 + 96) withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          uint64_t v25 = *(void **)(a1 + 32);
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10003C6E4;
          v31[3] = &unk_10008A468;
          long long v36 = *(_OWORD *)(a1 + 80);
          uint64_t v26 = *(void *)(a1 + 96);
          long long v37 = v14;
          uint64_t v38 = v26;
          id v27 = *(id *)(a1 + 64);
          uint64_t v28 = *(void *)(a1 + 72);
          id v34 = v27;
          uint64_t v35 = v28;
          id v32 = *(id *)(a1 + 32);
          id v29 = v13;
          uint64_t v30 = *(void *)(a1 + 104);
          id v33 = v29;
          uint64_t v39 = v30;
          [v25 sendCmpdRequest:v31];

          goto LABEL_37;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005BE40();
        }
      }
      free(*(void **)(a1 + 80));
      free(*(void **)(a1 + 88));
      free(v14);
      free(*(void **)(a1 + 96));
      uint64_t v23 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_10005BF90(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      free(*(void **)(a1 + 80));
      free(*(void **)(a1 + 88));
      free(*(void **)(a1 + 96));
      uint64_t v23 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v23();
LABEL_37:

    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005C11C(a1);
  }
  if (*(_DWORD *)(*(void *)(*(void *)v3 + 8) + 24) == 13
    || *(_DWORD *)(*(void *)(a1 + 88) + 12) == -1073741727)
  {
    id v4 = [*(id *)(a1 + 40) mp];
    unsigned int v5 = [v4 shareType];

    if (v5 != 7) {
      *(_DWORD *)(*(void *)(*(void *)v3 + 8) + 24) = 45;
    }
  }
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10003C668;
  v40[3] = &unk_10008A440;
  id v41 = v6;
  id v42 = *(id *)(a1 + 48);
  long long v45 = *(_OWORD *)(a1 + 80);
  uint64_t v46 = *(void *)(a1 + 96);
  id v8 = *(id *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  id v43 = v8;
  uint64_t v44 = v9;
  +[smb_subr deleteNameInParent:v41 DeleteName:v7 FileType:1 CompletionHandler:v40];
}

uint64_t sub_10003C668(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10005C2D4();
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10003C6E4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005C3E8();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005C1F4();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 80) withStreamName:0 forFileAllInfo:*(void *)(a1 + 40) withOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005C378();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 88) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005C0AC();
        }
        uint64_t v3 = *(void **)(a1 + 40);
        if (v3) {
          [v3 attributes];
        }
        id v4 = *(_OWORD **)(a1 + 96);
        v4[1] = 0u;
        v4[2] = 0u;
        *id v4 = 0u;
        void v4[5] = 0u;
        v4[6] = 0u;
        v4[3] = 0u;
        void v4[4] = 0u;
        v4[9] = 0u;
        v4[10] = 0u;
        v4[7] = 0u;
        v4[8] = 0u;
        v4[13] = 0u;
        v4[14] = 0u;
        v4[11] = 0u;
        v4[12] = 0u;
      }
    }
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 88));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003CB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003CBA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005C524();
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  unsigned int v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(void *)unsigned int v5 = 1;
  *((_DWORD *)v5 + 7) = 2;
  *(_OWORD *)(v5 + 12) = xmmword_10006C4D0;
  uint64_t v6 = a1 + 48;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v8 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
    *id v8 = 0u;
    v8[1] = 0u;
    *((_DWORD *)v8 + 4) = 1067;
    id v9 = [objc_alloc((Class)NSData) initWithBytes:*(void *)(a1 + 56) length:1067];
    free(*(void **)(a1 + 56));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 cmpdAddWrite:v8 fromBuffer:v9];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005C640();
      }
      free(v5);
      free(v8);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_29;
    }
    id v10 = objc_alloc_init((Class)SMBFileAllInformation);
    if (v10)
    {
      uint64_t v11 = malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
      bzero(v11 + 1, 0x46EuLL);
      _WORD *v11 = 4609;
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddQueryInformation:v11 withStreamName:0 forFileAllInfo:v10 withInputBuffer:0 withOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005C5D0();
        }
        free(v5);
        free(v8);
        int v12 = v11;
      }
      else
      {
        uint64_t v22 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v22 = 0u;
        v22[1] = 0u;
        v22[2] = 0u;
        v22[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v22 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10003D034;
          v27[3] = &unk_10008A468;
          id v32 = v5;
          id v33 = v8;
          id v34 = v11;
          uint64_t v35 = v22;
          id v23 = *(id *)(a1 + 40);
          uint64_t v24 = *(void *)(a1 + 48);
          id v30 = v23;
          uint64_t v31 = v24;
          id v28 = v4;
          id v25 = v10;
          uint64_t v26 = *(void *)(a1 + 64);
          id v29 = v25;
          uint64_t v36 = v26;
          [v28 sendCmpdRequest:v27];

          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005C5D0();
        }
        free(v5);
        free(v8);
        free(v11);
        int v12 = v22;
      }
      free(v12);
      uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v13) {
        sub_10005C594(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      free(v5);
      free(v8);
      uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v21();
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005C640();
  }
  free(v5);
  uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_9:
  v7();
LABEL_30:
}

uint64_t sub_10003D034(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005C870();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005C800();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseWrite:*(void *)(a1 + 72)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005C790();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 80) withStreamName:0 forFileAllInfo:*(void *)(a1 + 40) withOutputBuffer:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10005C720();
          }
        }
        else
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 88) withFlags:0];
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_10005C6B0();
          }
          uint64_t v3 = *(void **)(a1 + 40);
          if (v3) {
            [v3 attributes];
          }
          id v4 = *(_OWORD **)(a1 + 96);
          v4[1] = 0u;
          v4[2] = 0u;
          *id v4 = 0u;
          void v4[5] = 0u;
          v4[6] = 0u;
          v4[3] = 0u;
          void v4[4] = 0u;
          v4[9] = 0u;
          v4[10] = 0u;
          v4[7] = 0u;
          v4[8] = 0u;
          v4[13] = 0u;
          v4[14] = 0u;
          v4[11] = 0u;
          v4[12] = 0u;
        }
      }
    }
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 88));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10003D42C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10003D43C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003D6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003D6F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
    *(_OWORD *)(v5 + 184) = 0u;
    *(_OWORD *)(v5 + 200) = 0u;
    *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
    *(_OWORD *)(v5 + 232) = 0u;
    *(void *)unsigned int v5 = 1;
    *(_OWORD *)(v5 + 12) = xmmword_10006C4E0;
    *(void *)(v5 + 2_Block_object_dispose(&STACK[0x200], 8) = 0x20000000000001;
    uint64_t v6 = a1 + 56;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005CB6C();
      }
      uint64_t v7 = v5;
    }
    else
    {
      id v9 = malloc_type_malloc(0x60uLL, 0x1000040718B784FuLL);
      *id v9 = 0u;
      v9[1] = 0u;
      v9[2] = 0u;
      v9[3] = 0u;
      void v9[4] = 0u;
      void v9[5] = 0u;
      *((_DWORD *)v9 + 1) = 589992;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddIoctl:v9 getReparsePoint:*(void *)(a1 + 40)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005CAFC();
        }
        free(v5);
        uint64_t v7 = (char *)v9;
      }
      else
      {
        id v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *id v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_10003DA20;
          v13[3] = &unk_10008A530;
          uint64_t v18 = v5;
          uint64_t v19 = v9;
          uint64_t v20 = v10;
          id v11 = *(id *)(a1 + 48);
          uint64_t v12 = *(void *)(a1 + 56);
          id v16 = v11;
          uint64_t v17 = v12;
          id v14 = v4;
          id v15 = *(id *)(a1 + 40);
          [v14 sendCmpdRequest:v13];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005CA8C();
        }
        free(v5);
        free(v9);
        uint64_t v7 = (char *)v10;
      }
    }
    free(v7);
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005CA1C();
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
LABEL_19:
}

uint64_t sub_10003DA20(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005CD2C();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005CCBC();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseIoctl:*(void *)(a1 + 72) reparsePoint:*(void *)(a1 + 40) sendInputBuffer:0 rcvOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005CC4C();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005CBDC();
        }
      }
    }
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003DE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003DE64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *unsigned int v5 = 0u;
    v5[1] = 0u;
    v5[2] = 0u;
    v5[3] = 0u;
    void v5[4] = 0u;
    void v5[5] = 0u;
    v5[6] = 0u;
    v5[7] = 0u;
    v5[8] = 0u;
    v5[9] = 0u;
    v5[10] = 0u;
    v5[11] = 0u;
    v5[12] = 0u;
    v5[13] = 0u;
    v5[14] = 0u;
    *((void *)v5 + 30) = 0;
    *((_DWORD *)v5 + 7) = 1;
    *(_OWORD *)((char *)v5 + 12) = xmmword_10006C4F0;
    uint64_t v6 = a1 + 56;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005CF74();
      }
      uint64_t v7 = v5;
    }
    else
    {
      id v9 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
      *id v9 = 0u;
      v9[1] = 0u;
      *((_DWORD *)v9 + 4) = 1067;
      *((void *)v9 + 1) = [*(id *)(a1 + 40) bytes];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddRead:v9 intoBuffer:*(void *)(a1 + 40)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005CF04();
        }
        free(v5);
        uint64_t v7 = v9;
      }
      else
      {
        id v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *id v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_10003E174;
          v13[3] = &unk_10008A530;
          uint64_t v18 = v5;
          uint64_t v19 = v9;
          uint64_t v20 = v10;
          id v11 = *(id *)(a1 + 48);
          uint64_t v12 = *(void *)(a1 + 56);
          id v16 = v11;
          uint64_t v17 = v12;
          id v14 = v4;
          id v15 = *(id *)(a1 + 40);
          [v14 sendCmpdRequest:v13];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005CE94();
        }
        free(v5);
        free(v9);
        uint64_t v7 = v10;
      }
    }
    free(v7);
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005CE24();
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
LABEL_19:
}

void sub_10003E174(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D21C();
    }
LABEL_11:
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D1AC();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseRead:*(void *)(a1 + 72) intoBuffer:*(void *)(a1 + 40)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D13C();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005D0CC();
  }
  if (*(_DWORD *)(*(void *)(a1 + 72) + 28) <= 0x42Au)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005CFE4();
    }
    goto LABEL_11;
  }
  id v3 = [*(id *)(a1 + 40) bytes];
  unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 72) + 28);
  id v7 = 0;
  int v5 = sub_100033C5C((uint64_t)v3, v4, &v7);
  id v6 = v7;
  if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005D05C();
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003E6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003E6CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    int v5 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *int v5 = 0u;
    v5[1] = 0u;
    v5[2] = 0u;
    v5[3] = 0u;
    void v5[4] = 0u;
    void v5[5] = 0u;
    v5[6] = 0u;
    v5[7] = 0u;
    v5[8] = 0u;
    v5[9] = 0u;
    v5[10] = 0u;
    v5[11] = 0u;
    v5[12] = 0u;
    v5[13] = 0u;
    v5[14] = 0u;
    *((void *)v5 + 30) = 0;
    *((_DWORD *)v5 + 7) = 1;
    *(_OWORD *)((char *)v5 + 12) = xmmword_10006C4F0;
    uint64_t v6 = a1 + 56;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005D464();
      }
      id v7 = v5;
    }
    else
    {
      id v9 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
      *id v9 = 0u;
      v9[1] = 0u;
      *((_DWORD *)v9 + 4) = 1067;
      *((void *)v9 + 1) = [*(id *)(a1 + 40) bytes];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddRead:v9 intoBuffer:*(void *)(a1 + 40)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005D3F4();
        }
        free(v5);
        id v7 = v9;
      }
      else
      {
        id v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *id v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_10003E9E0;
          v13[3] = &unk_10008A530;
          uint64_t v18 = v5;
          uint64_t v19 = v9;
          uint64_t v20 = v10;
          id v11 = *(id *)(a1 + 48);
          uint64_t v12 = *(void *)(a1 + 56);
          id v16 = v11;
          uint64_t v17 = v12;
          id v14 = v4;
          id v15 = *(id *)(a1 + 40);
          [v14 sendCmpdRequest:v13];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005D384();
        }
        free(v5);
        free(v9);
        id v7 = v10;
      }
    }
    free(v7);
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D314();
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
LABEL_19:
}

void sub_10003E9E0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D69C();
    }
LABEL_11:
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D62C();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseRead:*(void *)(a1 + 72) intoBuffer:*(void *)(a1 + 40)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D5BC();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005D54C();
  }
  if (*(_DWORD *)(*(void *)(a1 + 72) + 28) <= 0x42Au)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D4D4();
    }
    goto LABEL_11;
  }
  id v3 = [*(id *)(a1 + 40) bytes];
  unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 72) + 28);
  id v6 = 0;
  sub_100033C5C((uint64_t)v3, v4, &v6);
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003EEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003EEC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D758();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_23;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((void *)v5 + 30) = 0;
  *(void *)(v5 + 12) = 0x10008000000002;
  *((void *)v5 + 3) = 0x100000007;
  if (*((_DWORD *)[*(id *)(a1 + 32) getSmbFattr] + 30) == 2)
  {
    *((_DWORD *)v5 + 5) = 16;
    int v6 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v6;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if (*((_DWORD *)[*(id *)(a1 + 32) getSmbFattr] + 30) == 5)
  {
    int v6 = *((_DWORD *)v5 + 8) | 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v8 = a1 + 64;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 40) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005D8A8();
    }
    id v9 = v5;
  }
  else
  {
    id v10 = (char *)malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
    bzero(v10 + 2, 0x46EuLL);
    *(_WORD *)id v10 = 5633;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddQueryInformation:v10 withStreamName:0 forFileAllInfo:0 withInputBuffer:0 withOutputBuffer:*(void *)(a1 + 48)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005D838();
      }
      free(v5);
      id v9 = v10;
    }
    else
    {
      id v11 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      _OWORD *v11 = 0u;
      v11[1] = 0u;
      v11[2] = 0u;
      v11[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24) = [v4 cmpdAddClose:v11 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24))
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10003F228;
        v14[3] = &unk_10008A530;
        uint64_t v19 = v5;
        uint64_t v20 = v10;
        uint64_t v21 = v11;
        id v12 = *(id *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 64);
        id v17 = v12;
        uint64_t v18 = v13;
        id v15 = v4;
        id v16 = *(id *)(a1 + 48);
        [v15 sendCmpdRequest:v14];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005D7C8();
      }
      free(v5);
      free(v10);
      id v9 = (char *)v11;
    }
  }
  free(v9);
  id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_23:
  v7();
LABEL_24:
}

uint64_t sub_10003F228(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005DA68();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005D9F8();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 72) withStreamName:0 forFileAllInfo:0 withOutputBuffer:*(void *)(a1 + 40)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005D988();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005D918();
        }
      }
    }
  }
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003F6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10003F6E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005DB24();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_23;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((void *)v5 + 30) = 0;
  *(void *)(v5 + 12) = 0x10008000000002;
  *((void *)v5 + 3) = 0x100000007;
  if (*((_DWORD *)[*(id *)(a1 + 32) getSmbFattr] + 30) == 2)
  {
    *((_DWORD *)v5 + 5) = 16;
    int v6 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v6;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if (*((_DWORD *)[*(id *)(a1 + 32) getSmbFattr] + 30) == 5)
  {
    int v6 = *((_DWORD *)v5 + 8) | 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v8 = a1 + 64;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 40) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005DC74();
    }
    id v9 = v5;
  }
  else
  {
    id v10 = (char *)malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
    bzero(v10 + 2, 0x46EuLL);
    *(_WORD *)id v10 = 5633;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddQueryInformation:v10 withStreamName:*(void *)(a1 + 48) forFileAllInfo:0 withInputBuffer:0 withOutputBuffer:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005DC04();
      }
      free(v5);
      id v9 = v10;
    }
    else
    {
      id v11 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      _OWORD *v11 = 0u;
      v11[1] = 0u;
      v11[2] = 0u;
      v11[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24) = [v4 cmpdAddClose:v11 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24))
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10003FA4C;
        v14[3] = &unk_10008A5A8;
        uint64_t v20 = v5;
        uint64_t v21 = v10;
        uint64_t v22 = v11;
        id v12 = *(id *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 64);
        id v17 = v12;
        uint64_t v18 = v13;
        id v15 = v4;
        id v16 = *(id *)(a1 + 48);
        long long v19 = *(_OWORD *)(a1 + 72);
        [v15 sendCmpdRequest:v14];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005DB94();
      }
      free(v5);
      free(v10);
      id v9 = (char *)v11;
    }
  }
  free(v9);
  id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_23:
  v7();
LABEL_24:
}

uint64_t sub_10003FA4C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005DE34();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 80)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005DDC4();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 88) withStreamName:*(void *)(a1 + 40) forFileAllInfo:0 withOutputBuffer:0];
      uint64_t v4 = *(void *)(a1 + 88);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(v4 + 1088);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(_DWORD *)(v4 + 1108);
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005DD54();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 96) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005DCE4();
        }
      }
    }
  }
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 88));
  free(*(void **)(a1 + 96));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10003FE18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10003FE28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000400B4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    int v6 = *(void **)(a1 + 64);
    unint64_t v7 = v6[13];
    free(v6);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000403F4;
    v24[3] = &unk_10008A648;
    id v8 = v5;
    id v25 = v8;
    id v26 = *(id *)(a1 + 32);
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 56);
    id v9 = objc_retainBlock(v24);
    if ((unint64_t)[*(id *)(a1 + 48) length] >= v7)
    {
      uint64_t v18 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(a1 + 48);
      unsigned int v17 = *(_DWORD *)(a1 + 72);
      id v12 = [v11 length];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10004057C;
      v19[3] = &unk_10008A648;
      id v20 = *(id *)(a1 + 48);
      id v21 = *(id *)(a1 + 32);
      id v22 = *(id *)(a1 + 40);
      id v23 = v9;
      LODWORD(v++*(_DWORD *)(*(void *)(result + 32) + 16) = 0;
      +[smb_subr readNodeStreamChunk:v10 FileNode:v8 ReadBuffer:v11 MaxReadXferLen:v17 StreamOffset:0 rdparamPtr:v18 result:v16 bytesRead:0 bytesRemain:v12 pass:0 reply:v19];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [*(id *)(a1 + 32) name];
        uint64_t v14 = *(void *)(a1 + 40);
        id v15 = [*(id *)(a1 + 48) length];
        *(_DWORD *)buf = 138413058;
        id v30 = v13;
        __int16 v31 = 2112;
        uint64_t v32 = v14;
        __int16 v33 = 2048;
        id v34 = v15;
        __int16 v35 = 2048;
        unint64_t v36 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "readNodeStreamChunks: np: %@, stream: %@, readBufLen: %lu, streamEOF: %llu error: ERANGE", buf, 0x2Au);
      }
      ((void (*)(void *, uint64_t, unint64_t))v9[2])(v9, 34, v7);
    }
  }
  else
  {
    if (a2 != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005DF30();
    }
    free(*(void **)(a1 + 64));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1000403F4(uint64_t a1, int a2, uint64_t a3)
{
  int v6 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
  *int v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100040508;
  v8[3] = &unk_10008A620;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v12 = v6;
  int v14 = a2;
  id v11 = *(id *)(a1 + 56);
  uint64_t v13 = a3;
  +[smb_subr sendClose:v7 Param:v6 GetPostAttrs:0 CompletionHandler:v8];
}

uint64_t sub_100040508(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005DFC4();
  }
  free(*(void **)(a1 + 56));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10004057C(uint64_t a1, int a2, id a3)
{
  if ([*(id *)(a1 + 32) length] != a3
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 40) name];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) length];
    int v10 = 138413314;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    id v15 = a3;
    __int16 v16 = 2048;
    id v17 = v9;
    __int16 v18 = 1024;
    int v19 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "readNodeStreamChunks: np: %@, stream: %@, read: %lu, bufLen: %lu error: %d", (uint8_t *)&v10, 0x30u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10004080C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005E058(a1);
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 && !*(_DWORD *)(a1 + 112))
  {
    if (v2 >= *(unsigned int *)(a1 + 104)) {
      uint64_t v3 = *(unsigned int *)(a1 + 104);
    }
    else {
      uint64_t v3 = *(void *)(a1 + 72);
    }
    uint64_t v4 = (char *)[*(id *)(a1 + 40) bytes] + *(unsigned int *)(a1 + 108);
    id v5 = *(_OWORD **)(a1 + 80);
    *id v5 = 0u;
    v5[1] = 0u;
    *(void *)(*(void *)(a1 + 80) + _Block_object_dispose(&STACK[0x200], 8) = v4;
    uint64_t v6 = *(void *)(a1 + 80);
    *(_DWORD *)(v6 + ++*(_DWORD *)(*(void *)(result + 32) + 16) = v3;
    *(void *)uint64_t v6 = *(unsigned int *)(a1 + 108);
    uint64_t v7 = *(void *)(a1 + 48);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000409BC;
    v17[3] = &unk_10008A698;
    id v8 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 88);
    id v18 = v8;
    uint64_t v22 = v9;
    uint64_t v23 = v3;
    int v28 = *(_DWORD *)(a1 + 108);
    uint64_t v11 = *(void *)(a1 + 96);
    uint64_t v24 = v10;
    uint64_t v25 = v11;
    id v19 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    int v29 = *(_DWORD *)(a1 + 104);
    __int16 v14 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    id v20 = v12;
    uint64_t v26 = v13;
    id v15 = v14;
    uint64_t v16 = *(void *)(a1 + 72);
    id v21 = v15;
    uint64_t v27 = v16;
    +[smb_subr sendRead:v7 Param:v6 ReadBuf:0 CompletionHandler:v17];
  }
  else
  {
    free(*(void **)(a1 + 80));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_1000409BC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E0E8();
    }
    LODWORD(v6) = a2;
    return [*(id *)(a1 + 88) readNodeStreamChunk:*(void *)(a1 + 32) FileNode:*(void *)(a1 + 40) ReadBuffer:*(void *)(a1 + 48) MaxReadXferLen:*(unsigned int *)(a1 + 116) StreamOffset:*(unsigned int *)(a1 + 112) rdparamPtr:*(void *)(a1 + 80) result:v6 bytesRead:*(void *)(a1 + 96) bytesRemain:0 pass:*(void *)(a1 + 64) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 80);
    LODWORD(v6) = 0;
    return [*(id *)(a1 + 88) readNodeStreamChunk:*(void *)(a1 + 32) FileNode:*(void *)(a1 + 40) ReadBuffer:*(void *)(a1 + 48) MaxReadXferLen:*(unsigned int *)(a1 + 116) StreamOffset:(*(_DWORD *)(v5 + 28) + *(_DWORD *)(a1 + 112)) rdparamPtr:v5 result:v6 bytesRead:*(void *)(a1 + 96) + *(unsigned int *)(v5 + 28) bytesRemain:*(void *)(a1 + 104) - *(unsigned int *)(v5 + 28) pass:*(void *)(a1 + 64) reply:*(void *)(a1 + 56)];
  }
}

void sub_100040CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100040CEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *uint64_t v5 = 0u;
    v5[1] = 0u;
    v5[2] = 0u;
    v5[3] = 0u;
    void v5[4] = 0u;
    void v5[5] = 0u;
    v5[6] = 0u;
    v5[7] = 0u;
    v5[8] = 0u;
    v5[9] = 0u;
    v5[10] = 0u;
    v5[11] = 0u;
    v5[12] = 0u;
    v5[13] = 0u;
    v5[14] = 0u;
    *((void *)v5 + 30) = 0;
    *((_DWORD *)v5 + 7) = 1;
    *(_OWORD *)((char *)v5 + 12) = xmmword_10006C500;
    uint64_t v6 = a1 + 64;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:*(void *)(a1 + 40)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005E31C();
      }
      uint64_t v7 = v5;
    }
    else
    {
      uint64_t v9 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
      *uint64_t v9 = 0u;
      v9[1] = 0u;
      *((void *)v9 + 1) = [*(id *)(a1 + 48) bytes];
      *((_DWORD *)v9 + 4) = [*(id *)(a1 + 48) length];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddRead:v9 intoBuffer:*(void *)(a1 + 48)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005E2AC();
        }
        free(v5);
        uint64_t v7 = v9;
      }
      else
      {
        uint64_t v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100040FFC;
          v13[3] = &unk_10008A530;
          id v18 = v5;
          id v19 = v9;
          id v20 = v10;
          id v11 = *(id *)(a1 + 56);
          uint64_t v12 = *(void *)(a1 + 64);
          id v16 = v11;
          uint64_t v17 = v12;
          id v14 = v4;
          id v15 = *(id *)(a1 + 48);
          [v14 sendCmpdRequest:v13];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005E23C();
        }
        free(v5);
        free(v9);
        uint64_t v7 = v10;
      }
    }
    free(v7);
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E1CC();
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v8();
LABEL_19:
}

uint64_t sub_100040FFC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E578();
    }
LABEL_17:
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    free(*(void **)(a1 + 80));
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v6();
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  int v4 = *(_DWORD *)(v3 + 24);
  if (v4)
  {
    if (v4 == 2)
    {
      *(_DWORD *)(v3 + 24) = 93;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10005E38C();
    }
    goto LABEL_17;
  }
  unint64_t v5 = *(void *)(*(void *)(a1 + 64) + 104);
  if ((unint64_t)[*(id *)(a1 + 40) length] < v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005E3FC((id *)(a1 + 40), v5);
    }
    goto LABEL_17;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseRead:*(void *)(a1 + 72) intoBuffer:*(void *)(a1 + 40)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E508();
    }
    goto LABEL_17;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 80) withFlags:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005E498();
  }
  [*(id *)(a1 + 40) setLength:*(unsigned int *)(*(void *)(a1 + 72) + 28)];
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

uint64_t sub_1000413E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000413F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000416D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    free(*(void **)(a1 + 64));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100041928;
    v21[3] = &unk_10008A738;
    id v6 = v5;
    id v22 = v6;
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 56);
    uint64_t v7 = objc_retainBlock(v21);
    id v15 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
    id v8 = *(void **)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v11 = *(unsigned int *)(a1 + 80);
    id v12 = [v10 length];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100041AA4;
    v16[3] = &unk_10008A648;
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v20 = v7;
    uint64_t v13 = v7;
    LODWORD(v14) = 0;
    [v8 writeNodeStreamChunk:v9 FileNode:v6 WriteBuffer:v10 MaxWriteXferLen:v11 StreamOffset:0 wrparamPtr:v15 result:v14 bytesWritten:0 bytesRemain:v12 pass:0 reply:v16];
  }
  else
  {
    if (a2 != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E6EC();
    }
    free(*(void **)(a1 + 64));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100041928(uint64_t a1, int a2)
{
  int v4 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
  *int v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041A34;
  v6[3] = &unk_10008A710;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v10 = v4;
  int v11 = a2;
  id v9 = *(id *)(a1 + 56);
  +[smb_subr sendClose:v5 Param:v4 GetPostAttrs:0 CompletionHandler:v6];
}

uint64_t sub_100041A34(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005E780();
  }
  free(*(void **)(a1 + 56));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100041AA4(uint64_t a1, int a2, id a3)
{
  if ([*(id *)(a1 + 32) length] != a3
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v7 = [*(id *)(a1 + 40) name];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) length];
    int v10 = 138413314;
    int v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    id v15 = a3;
    __int16 v16 = 2048;
    id v17 = v9;
    __int16 v18 = 1024;
    int v19 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "writeNodeStreamChunks: np: %@, stream: %@, written: %lu, bufLen: %lu error: %d", (uint8_t *)&v10, 0x30u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100041D30(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005E814(a1);
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 && !*(_DWORD *)(a1 + 112))
  {
    if (v2 >= *(unsigned int *)(a1 + 104)) {
      uint64_t v3 = *(unsigned int *)(a1 + 104);
    }
    else {
      uint64_t v3 = *(void *)(a1 + 72);
    }
    int v4 = (char *)[*(id *)(a1 + 40) bytes] + *(void *)(a1 + 64);
    uint64_t v5 = +[NSData dataWithBytesNoCopy:v4 length:v3 freeWhenDone:0];
    id v6 = *(_OWORD **)(a1 + 80);
    *id v6 = 0u;
    v6[1] = 0u;
    *(void *)(*(void *)(a1 + 80) + _Block_object_dispose(&STACK[0x200], 8) = v4;
    uint64_t v7 = *(void *)(a1 + 80);
    *(_DWORD *)(v7 + ++*(_DWORD *)(*(void *)(result + 32) + 16) = v3;
    *(void *)uint64_t v7 = *(unsigned int *)(a1 + 108);
    uint64_t v8 = *(void *)(a1 + 48);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100041F04;
    v18[3] = &unk_10008A698;
    id v9 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 88);
    id v19 = v9;
    uint64_t v23 = v10;
    uint64_t v24 = v3;
    int v29 = *(_DWORD *)(a1 + 108);
    uint64_t v12 = *(void *)(a1 + 96);
    uint64_t v25 = v11;
    uint64_t v26 = v12;
    id v20 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 40);
    int v30 = *(_DWORD *)(a1 + 104);
    id v15 = *(void **)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    id v21 = v13;
    uint64_t v27 = v14;
    id v16 = v15;
    uint64_t v17 = *(void *)(a1 + 72);
    id v22 = v16;
    uint64_t v28 = v17;
    +[smb_subr sendWrite:v8 Param:v7 WriteBuf:v5 CompletionHandler:v18];
  }
  else
  {
    free(*(void **)(a1 + 80));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_100041F04(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E8A4();
    }
    LODWORD(v6) = a2;
    return [*(id *)(a1 + 88) writeNodeStreamChunk:*(void *)(a1 + 32) FileNode:*(void *)(a1 + 40) WriteBuffer:*(void *)(a1 + 48) MaxWriteXferLen:*(unsigned int *)(a1 + 116) StreamOffset:*(unsigned int *)(a1 + 112) wrparamPtr:*(void *)(a1 + 80) result:v6 bytesWritten:*(void *)(a1 + 96) bytesRemain:0 pass:*(void *)(a1 + 64) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 80);
    LODWORD(v6) = 0;
    return [*(id *)(a1 + 88) writeNodeStreamChunk:*(void *)(a1 + 32) FileNode:*(void *)(a1 + 40) WriteBuffer:*(void *)(a1 + 48) MaxWriteXferLen:*(unsigned int *)(a1 + 116) StreamOffset:(*(_DWORD *)(v5 + 28) + *(_DWORD *)(a1 + 112)) wrparamPtr:v5 result:v6 bytesWritten:*(void *)(a1 + 96) + *(unsigned int *)(v5 + 28) bytesRemain:*(void *)(a1 + 104) - *(unsigned int *)(v5 + 28) pass:*(void *)(a1 + 64) + 1 reply:*(void *)(a1 + 56)];
  }
}

void sub_100042220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100042244(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *(_OWORD *)uint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *((_OWORD *)v5 + 4) = 0u;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 6) = 0u;
    *((_OWORD *)v5 + 7) = 0u;
    *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
    *((_OWORD *)v5 + 9) = 0u;
    *((_OWORD *)v5 + 10) = 0u;
    *((_OWORD *)v5 + 11) = 0u;
    *((_OWORD *)v5 + 12) = 0u;
    *((_OWORD *)v5 + 13) = 0u;
    *((_OWORD *)v5 + 14) = 0u;
    *((void *)v5 + 30) = 0;
    *(void *)(v5 + 12) = 0x200000002;
    *((_DWORD *)v5 + 5) = 128;
    uint64_t v6 = *(int *)(a1 + 72);
    if (v6 >= 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005EB48();
      }
      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      uint64_t v7 = v5;
      *((_DWORD *)v5 + 7) = dword_10006C520[v6];
      uint64_t v8 = a1 + 64;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:*(void *)(a1 + 40)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005EAD8();
        }
        id v9 = v7;
      }
      else
      {
        uint64_t v11 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
        _OWORD *v11 = 0u;
        v11[1] = 0u;
        *((void *)v11 + 1) = [*(id *)(a1 + 48) bytes];
        *((_DWORD *)v11 + 4) = [*(id *)(a1 + 48) length];
        *(void *)uint64_t v11 = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddWrite:v11 fromBuffer:*(void *)(a1 + 48)];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10005EA68();
          }
          free(v7);
          id v9 = (char *)v11;
        }
        else
        {
          uint64_t v12 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
          *uint64_t v12 = 0u;
          v12[1] = 0u;
          v12[2] = 0u;
          v12[3] = 0u;
          *(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24) = [v4 cmpdAddClose:v12 withFlags:0];
          if (!*(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24))
          {
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_100042588;
            v15[3] = &unk_10008A788;
            id v19 = v7;
            id v20 = v11;
            id v21 = v12;
            id v13 = *(id *)(a1 + 56);
            uint64_t v14 = *(void *)(a1 + 64);
            id v17 = v13;
            uint64_t v18 = v14;
            id v16 = v4;
            [v16 sendCmpdRequest:v15];

            goto LABEL_23;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10005E9F8();
          }
          free(v7);
          free(v11);
          id v9 = (char *)v12;
        }
      }
      free(v9);
      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005E988();
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v10();
LABEL_23:
}

uint64_t sub_100042588(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005ED0C();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    int v4 = *(_DWORD *)(v3 + 24);
    if (v4)
    {
      if (v4 == 2)
      {
        *(_DWORD *)(v3 + 24) = 93;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10005EBBC();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseWrite:*(void *)(a1 + 64)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005EC9C();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005EC2C();
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000429B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000429D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *(_OWORD *)uint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *((_OWORD *)v5 + 4) = 0u;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 6) = 0u;
    *((_OWORD *)v5 + 7) = 0u;
    *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
    *((_OWORD *)v5 + 9) = 0u;
    *((_OWORD *)v5 + 10) = 0u;
    *((_OWORD *)v5 + 11) = 0u;
    *((_OWORD *)v5 + 12) = 0u;
    *((_OWORD *)v5 + 13) = 0u;
    *((_OWORD *)v5 + 14) = 0u;
    *((void *)v5 + 30) = 0;
    *(void *)(v5 + 12) = 0x11000000000002;
    *((_DWORD *)v5 + 5) = 128;
    *((_DWORD *)v5 + 7) = 1;
    uint64_t v6 = a1 + 64;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 32) withStreamName:*(void *)(a1 + 40)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005EF54();
      }
      uint64_t v7 = v5;
    }
    else
    {
      id v9 = malloc_type_malloc(0x58uLL, 0x1000040DCA60672uLL);
      *id v9 = 0u;
      v9[1] = 0u;
      v9[2] = 0u;
      v9[3] = 0u;
      void v9[4] = 0u;
      *((void *)v9 + 10) = 0;
      *((_WORD *)v9 + 2) = 3329;
      *((void *)v9 + 4) = 1;
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddSetInformation:v9 withInputBuffer:0 withRenameTarget:0];
      if (*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005EEA8(a1);
        }
        free(v5);
        uint64_t v7 = (char *)v9;
      }
      else
      {
        uint64_t v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100042CE0;
          v13[3] = &unk_10008A788;
          id v17 = v5;
          uint64_t v18 = v9;
          id v19 = v10;
          id v11 = *(id *)(a1 + 56);
          uint64_t v12 = *(void *)(a1 + 64);
          id v15 = v11;
          uint64_t v16 = v12;
          id v14 = v4;
          [v14 sendCmpdRequest:v13];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005EE38();
        }
        free(v5);
        free(v9);
        uint64_t v7 = (char *)v10;
      }
    }
    free(v7);
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005EDC8();
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v8();
LABEL_19:
}

uint64_t sub_100042CE0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F114();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    int v4 = *(_DWORD *)(v3 + 24);
    if (v4)
    {
      if (v4 == 2)
      {
        *(_DWORD *)(v3 + 24) = 93;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10005EFC4();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseSetInformation:*(void *)(a1 + 64)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005F0A4();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005F034();
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100043050(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005F184();
  }
  free(*(void **)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000431D0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F1F4();
    }
    free(*(void **)(a1 + 40));
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    free(*(void **)(a1 + 40));
    int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
}

uint64_t sub_100043340(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F264();
    }
    free(*(void **)(a1 + 40));
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    free(*(void **)(a1 + 40));
    int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
}

void sub_1000434C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000434DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *(_OWORD *)id v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *((_OWORD *)v5 + 4) = 0u;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 6) = 0u;
    *((_OWORD *)v5 + 7) = 0u;
    *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
    *((_OWORD *)v5 + 9) = 0u;
    *((_OWORD *)v5 + 10) = 0u;
    *((_OWORD *)v5 + 11) = 0u;
    *((_OWORD *)v5 + 12) = 0u;
    *((_OWORD *)v5 + 13) = 0u;
    *((_OWORD *)v5 + 14) = 0u;
    *((void *)v5 + 30) = 0;
    *(_OWORD *)(v5 + 12) = xmmword_10006C510;
    *(void *)(v5 + 2_Block_object_dispose(&STACK[0x200], 8) = 0x100000001;
    uint64_t v6 = a1 + 40;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:0 withStreamName:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005F3B4();
      }
      uint64_t v7 = v5;
    }
    else
    {
      id v9 = (char *)malloc_type_malloc(0x470uLL, 0x10000402F070C0BuLL);
      bzero(v9 + 2, 0x46EuLL);
      *(_WORD *)id v9 = 770;
      *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddQueryInformation:v9 withStreamName:0 forFileAllInfo:0 withInputBuffer:0 withOutputBuffer:0];
      if (*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005F344();
        }
        free(v5);
        uint64_t v7 = v9;
      }
      else
      {
        uint64_t v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *uint64_t v10 = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        v10[3] = 0u;
        *(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
        if (!*(_DWORD *)(*(void *)(*(void *)v6 + 8) + 24))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_1000437D4;
          v13[3] = &unk_10008A788;
          id v17 = v5;
          uint64_t v18 = v9;
          id v19 = v10;
          id v11 = *(id *)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          id v15 = v11;
          uint64_t v16 = v12;
          id v14 = v4;
          [v14 sendCmpdRequest:v13];

          goto LABEL_19;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005F344();
        }
        free(v5);
        free(v9);
        uint64_t v7 = (char *)v10;
      }
    }
    free(v7);
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F2D4();
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
LABEL_19:
}

uint64_t sub_1000437D4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F460();
    }
LABEL_11:
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B320();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseQueryInformation:*(void *)(a1 + 64) withStreamName:0 forFileAllInfo:0 withOutputBuffer:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B2B0();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005B240();
  }
  id v5 = malloc_type_malloc(0x28uLL, 0x10000400A747E1EuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = (*(_DWORD *)(v8 + 1072) * *(_DWORD *)(v8 + 1076));
    uint64_t v10 = *(void *)(v8 + 1056);
    uint64_t v11 = *(void *)(v8 + 1064);
    *uint64_t v6 = v10 * v9;
    v6[1] = v11 * v9;
    v6[2] = v11 * v9;
    v6[3] = v10;
    void v6[4] = v11;
    free(v7);
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 72));
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_10005F424(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v3();
}

void sub_100043C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100043C90(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F51C(a1);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_23;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  uint64_t v6 = v5;
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((void *)v5 + 30) = 0;
  *(void *)(v5 + 12) = 0x10400000002;
  *((void *)v5 + 3) = 0x100000007;
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    *((_DWORD *)v5 + 5) = 16;
    int v7 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v7;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if (*(_DWORD *)(a1 + 72) == 5)
  {
    int v7 = 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v9 = a1 + 56;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 40) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F6AC(a1);
    }
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v11 = (char *)malloc_type_malloc(0x58uLL, 0x1000040DCA60672uLL);
    *((void *)v11 + 10) = 0;
    *((_OWORD *)v11 + 3) = 0u;
    *((_OWORD *)v11 + 4) = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *((_OWORD *)v11 + 2) = 0u;
    *(_OWORD *)uint64_t v11 = 0u;
    *((_WORD *)v11 + 2) = 1025;
    BOOL v12 = *(long long **)(a1 + 64);
    long long v13 = *v12;
    long long v14 = v12[1];
    *((void *)v11 + 9) = *((void *)v12 + 4);
    *(_OWORD *)(v11 + 56) = v14;
    *(_OWORD *)(v11 + 40) = v13;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddSetInformation:v11 withInputBuffer:0 withRenameTarget:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005F618(a1);
      }
      free(v6);
      uint64_t v10 = v11;
    }
    else
    {
      uint64_t v15 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      _OWORD *v15 = 0u;
      v15[1] = 0u;
      v15[2] = 0u;
      v15[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24) = [v4 cmpdAddClose:v15 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24))
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100043FE0;
        v18[3] = &unk_10008A788;
        id v22 = v6;
        uint64_t v23 = v11;
        uint64_t v24 = v15;
        id v16 = *(id *)(a1 + 48);
        uint64_t v17 = *(void *)(a1 + 56);
        id v20 = v16;
        uint64_t v21 = v17;
        id v19 = v4;
        [v19 sendCmpdRequest:v18];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005F5A8();
      }
      free(v6);
      free(v11);
      uint64_t v10 = (char *)v15;
    }
  }
  free(v10);
  uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_23:
  v8();
LABEL_24:
}

uint64_t sub_100043FE0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F890();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005F820();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseSetInformation:*(void *)(a1 + 64)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005F7B0();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005F740();
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000443E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100044408(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005F94C(a1);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_23;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  uint64_t v6 = v5;
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((void *)v5 + 30) = 0;
  *(void *)(v5 + 12) = 0x600000002;
  *((void *)v5 + 3) = 0x100000007;
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    *((_DWORD *)v5 + 5) = 16;
    int v7 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v7;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if (*(_DWORD *)(a1 + 72) == 5)
  {
    int v7 = 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v9 = a1 + 56;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 40) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005FADC(a1);
    }
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v11 = malloc_type_malloc(0x58uLL, 0x1000040DCA60672uLL);
    _OWORD *v11 = 0u;
    v11[1] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    v11[4] = 0u;
    *((void *)v11 + 10) = 0;
    *((_WORD *)v11 + 2) = 5121;
    *((void *)v11 + 4) = *(void *)(a1 + 64);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddSetInformation:v11 withInputBuffer:0 withRenameTarget:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005FA48(a1);
      }
      free(v6);
      uint64_t v10 = (char *)v11;
    }
    else
    {
      BOOL v12 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      *BOOL v12 = 0u;
      v12[1] = 0u;
      v12[2] = 0u;
      v12[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24) = [v4 cmpdAddClose:v12 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24))
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100044748;
        v15[3] = &unk_10008A788;
        id v19 = v6;
        id v20 = v11;
        uint64_t v21 = v12;
        id v13 = *(id *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        id v17 = v13;
        uint64_t v18 = v14;
        id v16 = v4;
        [v16 sendCmpdRequest:v15];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005F9D8();
      }
      free(v6);
      free(v11);
      uint64_t v10 = (char *)v12;
    }
  }
  free(v10);
  uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_23:
  v8();
LABEL_24:
}

uint64_t sub_100044748(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005FCC0();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005FC50();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseSetInformation:*(void *)(a1 + 64)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005FBE0();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005FB70();
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100044B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100044B64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005FD7C();
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_23;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  uint64_t v6 = v5;
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((void *)v5 + 30) = 0;
  *(void *)(v5 + 12) = 0x11000000000002;
  *((void *)v5 + 3) = 0x100000007;
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    *((_DWORD *)v5 + 5) = 16;
    int v7 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v7;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if (*(_DWORD *)(a1 + 72) == 5)
  {
    int v7 = 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v9 = a1 + 64;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 48) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005FF18();
    }
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v11 = malloc_type_malloc(0x58uLL, 0x1000040DCA60672uLL);
    _OWORD *v11 = 0u;
    v11[1] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    v11[4] = 0u;
    *((void *)v11 + 10) = 0;
    *((_WORD *)v11 + 2) = 3329;
    *((void *)v11 + 4) = 1;
    *(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24) = [v4 cmpdAddSetInformation:v11 withInputBuffer:0 withRenameTarget:0];
    if (*(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005FE84();
      }
      free(v6);
      uint64_t v10 = (char *)v11;
    }
    else
    {
      BOOL v12 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      *BOOL v12 = 0u;
      v12[1] = 0u;
      v12[2] = 0u;
      v12[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24) = [v4 cmpdAddClose:v12 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v9 + 8) + 24))
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100044EA4;
        v15[3] = &unk_10008A788;
        id v19 = v6;
        id v20 = v11;
        uint64_t v21 = v12;
        id v13 = *(id *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 64);
        id v17 = v13;
        uint64_t v18 = v14;
        id v16 = v4;
        [v16 sendCmpdRequest:v15];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005FE14();
      }
      free(v6);
      free(v11);
      uint64_t v10 = (char *)v12;
    }
  }
  free(v10);
  uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_23:
  v8();
LABEL_24:
}

uint64_t sub_100044EA4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000600FC();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006008C();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseSetInformation:*(void *)(a1 + 64)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10006001C();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10005FFAC();
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100045404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100045430(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100060258(a1, a2, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_23;
  }
  uint64_t v6 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  int v7 = v6;
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 10) = 0u;
  *((_OWORD *)v6 + 11) = 0u;
  *((_OWORD *)v6 + 12) = 0u;
  *((_OWORD *)v6 + 13) = 0u;
  *((_OWORD *)v6 + 14) = 0u;
  *((void *)v6 + 30) = 0;
  *(void *)(v6 + 12) = 0x11000000000002;
  *((void *)v6 + 3) = 0x100000007;
  if (*(_DWORD *)(a1 + 80) == 2)
  {
    *((_DWORD *)v6 + 5) = 16;
    int v8 = 1;
LABEL_9:
    *((_DWORD *)v6 + _Block_object_dispose(&STACK[0x200], 8) = v8;
    goto LABEL_10;
  }
  *((_DWORD *)v6 + 5) = 128;
  if (*(_DWORD *)(a1 + 80) == 5)
  {
    int v8 = 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v16 = a1 + 72;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v5 cmpdAddCreate:v6 withName:*(void *)(a1 + 48) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000603EC();
    }
    id v17 = v7;
  }
  else
  {
    uint64_t v18 = malloc_type_malloc(0x58uLL, 0x1000040DCA60672uLL);
    v18[10] = 0;
    *(_OWORD *)uint64_t v18 = 0u;
    *((_OWORD *)v18 + 1) = 0u;
    *((_OWORD *)v18 + 2) = 0u;
    *((_OWORD *)v18 + 3) = 0u;
    *((_OWORD *)v18 + 4) = 0u;
    *((_WORD *)v18 + 2) = 2561;
    *((_DWORD *)v18 + 20) = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v5 cmpdAddSetInformation:v18 withInputBuffer:0 withRenameTarget:*(void *)(a1 + 56)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100060358();
      }
      free(v7);
      id v17 = (char *)v18;
    }
    else
    {
      id v19 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      *id v19 = 0u;
      v19[1] = 0u;
      v19[2] = 0u;
      v19[3] = 0u;
      *(_DWORD *)(*(void *)(*(void *)v16 + 8) + 24) = [v5 cmpdAddClose:v19 withFlags:0];
      if (!*(_DWORD *)(*(void *)(*(void *)v16 + 8) + 24))
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100045770;
        v22[3] = &unk_10008A788;
        uint64_t v26 = v7;
        uint64_t v27 = v18;
        uint64_t v28 = v19;
        id v20 = *(id *)(a1 + 64);
        uint64_t v21 = *(void *)(a1 + 72);
        id v24 = v20;
        uint64_t v25 = v21;
        id v23 = v5;
        [v23 sendCmpdRequest:v22];

        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000602E8();
      }
      free(v7);
      free(v18);
      id v17 = (char *)v19;
    }
  }
  free(v17);
  uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_23:
  v15();
LABEL_24:
}

uint64_t sub_100045770(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000605D0();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100060560();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseSetInformation:*(void *)(a1 + 64)];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000604F0();
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 72) withFlags:0];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100060480();
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100045B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100045B78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006068C();
    }
    int v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_19;
  }
  id v5 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *(_OWORD *)(v5 + _Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 8_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 16_Block_object_dispose(&STACK[0x200], 8) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 2++*(_DWORD *)(*(void *)(result + 32) + 16) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(void *)id v5 = 4;
  *(void *)(v5 + 12) = 0x8000000002;
  *((void *)v5 + 3) = 0x100000007;
  if ([*(id *)(a1 + 32) isDir])
  {
    *((_DWORD *)v5 + 5) = 16;
    int v6 = 1;
LABEL_9:
    *((_DWORD *)v5 + _Block_object_dispose(&STACK[0x200], 8) = v6;
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 5) = 128;
  if ([*(id *)(a1 + 32) isSymlink])
  {
    int v6 = *((_DWORD *)v5 + 8) | 0x200000;
    goto LABEL_9;
  }
LABEL_10:
  int v8 = (uint64_t *)(a1 + 56);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 cmpdAddCreate:v5 withName:*(void *)(a1 + 40) withStreamName:0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006076C();
    }
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v10 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
    *uint64_t v10 = 0u;
    v10[1] = 0u;
    v10[2] = 0u;
    v10[3] = 0u;
    *(_DWORD *)(*(void *)(*v8 + 8) + 24) = [v4 cmpdAddClose:v10 withFlags:0];
    uint64_t v11 = *v8;
    if (!*(_DWORD *)(*(void *)(*v8 + 8) + 24))
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100045E28;
      v12[3] = &unk_10008A8A0;
      uint64_t v15 = v11;
      uint64_t v16 = v5;
      id v17 = v10;
      id v14 = *(id *)(a1 + 48);
      id v13 = v4;
      [v13 sendCmpdRequest:v12];

      goto LABEL_20;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000606FC();
    }
    free(v5);
    uint64_t v9 = (char *)v10;
  }
  free(v9);
  int v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_19:
  v7();
LABEL_20:
}

uint64_t sub_100045E28(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000608BC();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseCreate:*(void *)(a1 + 56)];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006084C();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) cmpdParseClose:*(void *)(a1 + 64) withFlags:0];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000607DC();
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100046320(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_10004633C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_100046364(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_1000463D0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_1000463EC(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_100046498(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void sub_1000464B4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

uint64_t sub_1000464C8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1000464E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x32u);
}

void sub_100046530(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_100046568(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

id sub_100046818(void *a1, const void *a2, int a3, int *a4)
{
  id v7 = a1;
  __int16 v415 = 0;
  __int16 v414 = 0;
  int v412 = 0;
  int v413 = 0;
  int v411 = 0;
  uint64_t v410 = 0;
  v424[0] = 0;
  v424[1] = 0;
  unsigned int v409 = 0;
  *a4 = 0;
  int v8 = sub_100047844(v7, 1432, 1432);
  uint64_t v9 = v8;
  if (!v8)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_1000609AC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_32;
  }
  if (!sub_100047998(v8, 5))
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_100061E80(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 0))
  {
    BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v28) {
      sub_100061E44(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 11))
  {
    BOOL v36 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v36) {
      sub_100061E08(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 3))
  {
    BOOL v44 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v44) {
      sub_100061DCC(v44, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 16))
  {
    BOOL v52 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v52) {
      sub_100061D90(v52, v53, v54, v55, v56, v57, v58, v59);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 0))
  {
    BOOL v60 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v60) {
      sub_100061D54(v60, v61, v62, v63, v64, v65, v66, v67);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 0))
  {
    BOOL v68 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v68) {
      sub_100061D18(v68, v69, v70, v71, v72, v73, v74, v75);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 72))
  {
    BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v76) {
      sub_100061CDC(v76, v77, v78, v79, v80, v81, v82, v83);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 0))
  {
    BOOL v84 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v84) {
      sub_100061CA0(v84, v85, v86, v87, v88, v89, v90, v91);
    }
    goto LABEL_80;
  }
  if (!sub_100047ABC(v9, (int)objc_msgSend(v9, "call_id")))
  {
    BOOL v92 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v92) {
      sub_100061C64(v92, v93, v94, v95, v96, v97, v98, v99);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 4096))
  {
    BOOL v100 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v100) {
      sub_100061C28(v100, v101, v102, v103, v104, v105, v106, v107);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 4096))
  {
    BOOL v108 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v108) {
      sub_100061BEC(v108, v109, v110, v111, v112, v113, v114, v115);
    }
    goto LABEL_80;
  }
  if (!sub_100047ABC(v9, 0))
  {
    BOOL v116 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v116) {
      sub_100061BB0(v116, v117, v118, v119, v120, v121, v122, v123);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 1))
  {
    BOOL v124 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v124) {
      sub_100061B74(v124, v125, v126, v127, v128, v129, v130, v131);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 0))
  {
    BOOL v132 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v132) {
      sub_100061B38(v132, v133, v134, v135, v136, v137, v138, v139);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 0))
  {
    BOOL v140 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v140) {
      sub_100061AFC(v140, v141, v142, v143, v144, v145, v146, v147);
    }
    goto LABEL_80;
  }
  if (!sub_100047A28(v9, 0))
  {
    BOOL v148 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v148) {
      sub_100061AC0(v148, v149, v150, v151, v152, v153, v154, v155);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 1))
  {
    BOOL v156 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v156) {
      sub_100061A84(v156, v157, v158, v159, v160, v161, v162, v163);
    }
    goto LABEL_80;
  }
  if (!sub_100047998(v9, 0))
  {
    BOOL v164 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v164) {
      sub_100061A48(v164, v165, v166, v167, v168, v169, v170, v171);
    }
    goto LABEL_80;
  }
  if (!sub_100047B50(v9, a2, 0x10u))
  {
    BOOL v172 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v172) {
      sub_100061A0C(v172, v173, v174, v175, v176, v177, v178, v179);
    }
    goto LABEL_80;
  }
  if (!sub_100047ABC(v9, a3))
  {
    BOOL v180 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v180) {
      sub_1000619D0(v180, v181, v182, v183, v184, v185, v186, v187);
    }
    goto LABEL_80;
  }
  if (!sub_100047B50(v9, &unk_100091498, 0x10u))
  {
    BOOL v188 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v188) {
      sub_100061994(v188, v189, v190, v191, v192, v193, v194, v195);
    }
    goto LABEL_80;
  }
  if (!sub_100047ABC(v9, 2))
  {
    BOOL v196 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v196) {
      sub_100061958(v196, v197, v198, v199, v200, v201, v202, v203);
    }
LABEL_80:
    uint64_t v18 = 0;
    int v19 = 1;
    goto LABEL_81;
  }
  if ((sub_100047BF0(v9) & 1) == 0)
  {
    uint64_t v18 = 0;
    int v19 = 2;
    goto LABEL_81;
  }
  if (!sub_100047F44(v9))
  {
    BOOL v205 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v205) {
      sub_10006191C(v205, v206, v207, v208, v209, v210, v211, v212);
    }
    uint64_t v18 = 0;
    int v19 = 3;
    goto LABEL_81;
  }
  if (objc_msgSend(v9, "in_len") <= 0xF)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000609E8(v9);
    }
LABEL_97:
    uint64_t v18 = 0;
    int v19 = 4;
    goto LABEL_81;
  }
  if (!sub_1000481AC(v9, (unsigned char *)&v415 + 1))
  {
    BOOL v213 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v213) {
      sub_1000618E0(v213, v214, v215, v216, v217, v218, v219, v220);
    }
    goto LABEL_97;
  }
  if (HIBYTE(v415) != 5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006186C();
    }
    goto LABEL_100;
  }
  if (!sub_1000481AC(v9, (unsigned char *)&v415 + 1))
  {
    BOOL v221 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v221) {
      sub_100061830(v221, v222, v223, v224, v225, v226, v227, v228);
    }
    goto LABEL_97;
  }
  if (HIBYTE(v415))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000617BC();
    }
LABEL_100:
    uint64_t v18 = 0;
    int v19 = 9;
    goto LABEL_81;
  }
  if (!sub_1000481AC(v9, &v415))
  {
    BOOL v237 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v237) {
      sub_100061780(v237, v238, v239, v240, v241, v242, v243, v244);
    }
    goto LABEL_97;
  }
  if (!sub_1000481AC(v9, (unsigned char *)&v414 + 1))
  {
    BOOL v245 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v245) {
      sub_100061744(v245, v246, v247, v248, v249, v250, v251, v252);
    }
    goto LABEL_97;
  }
  if ((v414 & 0x100) == 0)
  {
    BOOL v229 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v229) {
      sub_100060A5C(v229, v230, v231, v232, v233, v234, v235, v236);
    }
LABEL_108:
    uint64_t v18 = 0;
    int v19 = 8;
    goto LABEL_81;
  }
  if ((v414 & 0x200) != 0)
  {
    objc_msgSend(v9, "setIn_lastfrag:", 1);
  }
  else
  {
    BOOL v253 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v253) {
      sub_100061708(v253, v254, v255, v256, v257, v258, v259, v260);
    }
  }
  if (!sub_100048240(v9, (_DWORD *)&v410 + 1))
  {
    BOOL v262 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v262) {
      sub_1000616CC(v262, v263, v264, v265, v266, v267, v268, v269);
    }
    goto LABEL_97;
  }
  unsigned __int8 v261 = BYTE4(v410);
  objc_msgSend(v9, "setIn_ndr:", HIDWORD(v410));
  if (v261 >= 0x10u && (v261 & 0xF0) != 0x10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100061658();
    }
    uint64_t v18 = 0;
    int v19 = 5;
    goto LABEL_81;
  }
  if (v261 <= 0xFu)
  {
    BOOL v270 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v270) {
      sub_10006161C(v270, v271, v272, v273, v274, v275, v276, v277);
    }
  }
  if ((v261 & 0xF) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000615A8();
    }
    uint64_t v18 = 0;
    int v19 = 6;
    goto LABEL_81;
  }
  if (!sub_1000482D8(v9, &v413))
  {
    BOOL v279 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v279) {
      sub_10006156C(v279, v280, v281, v282, v283, v284, v285, v286);
    }
    goto LABEL_97;
  }
  uint64_t v278 = (unsigned __int16)v413;
  if ((unsigned __int16)v413 <= 0xFu)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100060A98(v278, v9);
    }
    goto LABEL_108;
  }
  objc_msgSend(v9, "setIn_fbtbd:", (unsigned __int16)v413);
  if (!sub_1000482D8(v9, (_WORD *)&v413 + 1))
  {
    BOOL v287 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v287) {
      sub_100061530(v287, v288, v289, v290, v291, v292, v293, v294);
    }
    goto LABEL_97;
  }
  if (HIWORD(v413))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000614BC();
    }
    goto LABEL_108;
  }
  if (!sub_100048240(v9, &v411))
  {
    BOOL v295 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v295) {
      sub_100061480(v295, v296, v297, v298, v299, v300, v301, v302);
    }
    goto LABEL_97;
  }
  if (v411)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100061410();
    }
    uint64_t v18 = 0;
    int v19 = 7;
    goto LABEL_81;
  }
  if (v415 != 12)
  {
    if (v415 == 13)
    {
      BOOL v303 = sub_1000482D8(v9, (_WORD *)&v413 + 1);
      BOOL v304 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v303)
      {
        if (v304) {
          sub_100061360();
        }
        uint64_t v18 = 0;
        int v19 = 12;
      }
      else
      {
        if (v304) {
          sub_1000613D4(v304, v305, v306, v307, v308, v309, v310, v311);
        }
        uint64_t v18 = 0;
        int v19 = 11;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100060B2C();
      }
      uint64_t v18 = 0;
      int v19 = 10;
    }
    goto LABEL_81;
  }
  if (!sub_1000482D8(v9, (_WORD *)&v413 + 1))
  {
    BOOL v316 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v316) {
      sub_100061324(v316, v317, v318, v319, v320, v321, v322, v323);
    }
    goto LABEL_97;
  }
  objc_msgSend(v9, "setIn_max_xmit_frag:", HIWORD(v413));
  if (!sub_1000482D8(v9, (_WORD *)&v413 + 1))
  {
    BOOL v324 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v324) {
      sub_1000612E8(v324, v325, v326, v327, v328, v329, v330, v331);
    }
    goto LABEL_97;
  }
  objc_msgSend(v9, "setIn_max_recv_frag:", HIWORD(v413));
  objc_msgSend(v9, "setNegotiated_max_xmit_frag:", 4096);
  unsigned int v312 = objc_msgSend(v9, "negotiated_max_xmit_frag");
  if (v312 > objc_msgSend(v9, "in_max_recv_frag")) {
    objc_msgSend(v9, "setNegotiated_max_xmit_frag:", objc_msgSend(v9, "in_max_recv_frag"));
  }
  objc_msgSend(v9, "setNegotiated_max_recv_frag:", 4096);
  unsigned int v313 = objc_msgSend(v9, "negotiated_max_recv_frag");
  if (v313 > objc_msgSend(v9, "in_max_xmit_frag")) {
    objc_msgSend(v9, "setNegotiated_max_recv_frag:", objc_msgSend(v9, "in_max_xmit_frag"));
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100061250(v9);
  }
  if (!sub_100048240(v9, &v409))
  {
    BOOL v332 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v332) {
      sub_100061214(v332, v333, v334, v335, v336, v337, v338, v339);
    }
    goto LABEL_97;
  }
  objc_msgSend(v9, "setAssoc_group_id:", 0);
  if (!sub_1000482D8(v9, (_WORD *)&v413 + 1))
  {
    BOOL v340 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v340) {
      sub_1000611D8(v340, v341, v342, v343, v344, v345, v346, v347);
    }
    goto LABEL_97;
  }
  objc_msgSend(v9, "setSec_addr_len:", HIWORD(v413));
  unsigned int v314 = objc_msgSend(v9, "in_finger");
  unsigned int v315 = objc_msgSend(v9, "sec_addr_len") + v314;
  if (v315 > objc_msgSend(v9, "in_len"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100060BA0(v9);
    }
    goto LABEL_97;
  }
  if (!objc_msgSend(v9, "sec_addr_len"))
  {
    int v348 = 26;
LABEL_190:
    unsigned __int8 v349 = objc_msgSend(v9, "sec_addr_len");
    int v350 = (v349 + 2) & 3;
    if (((v349 + 2) & 3) != 0)
    {
      int v351 = 0;
      int v348 = v348 - v350 + 4;
      unsigned int v352 = v350 | 0xFFFFFFFC;
      while (sub_1000481AC(v9, (unsigned char *)&v415 + 1))
      {
        if (v352 == --v351) {
          goto LABEL_194;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100061068();
      }
      goto LABEL_97;
    }
LABEL_194:
    if (!sub_1000481AC(v9, &v414))
    {
      BOOL v371 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v371) {
        sub_10006102C(v371, v372, v373, v374, v375, v376, v377, v378);
      }
      goto LABEL_97;
    }
    if (!sub_1000481AC(v9, (unsigned char *)&v415 + 1))
    {
      BOOL v379 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v379) {
        sub_100060FF0(v379, v380, v381, v382, v383, v384, v385, v386);
      }
      goto LABEL_97;
    }
    if (!sub_1000482D8(v9, (_WORD *)&v413 + 1))
    {
      BOOL v387 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v387) {
        sub_100060FB4(v387, v388, v389, v390, v391, v392, v393, v394);
      }
      goto LABEL_97;
    }
    int v354 = v414;
    if (v414 < 2u)
    {
      if (!(_BYTE)v414)
      {
LABEL_244:
        BOOL v400 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v400) {
          sub_100060CF8(v400, v401, v402, v403, v404, v405, v406, v407);
        }
        uint64_t v18 = 0;
        int v19 = 15;
        goto LABEL_81;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100060F40();
    }
    int v395 = 0;
    char v396 = 0;
    *(void *)&long long v353 = 67109376;
    long long v408 = v353;
    do
    {
      if (!sub_1000482D8(v9, (_WORD *)&v412 + 1))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100060ED0();
        }
        goto LABEL_97;
      }
      if (!sub_1000482D8(v9, &v412))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100060E60();
        }
        goto LABEL_97;
      }
      if (!sub_100048370(v9, v424, 0x10u))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100060DF0();
        }
        goto LABEL_97;
      }
      if (!sub_100048240(v9, &v410))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100060D80();
        }
        goto LABEL_97;
      }
      int v397 = HIWORD(v412);
      if (HIWORD(v412))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109632;
          int v417 = v395;
          __int16 v418 = 1024;
          int v419 = v397;
          __int16 v420 = 1024;
          int v421 = (unsigned __int16)v412;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "rpc_bind_interface: bind_ack, context rejected, p_result_list[%u]: result: %u, reason: %u\n", buf, 0x14u);
        }
      }
      else if (sub_10004B3AC((uint64_t)v424, (uint64_t)&unk_100091498))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100060D34(v422, v395, &v423);
        }
      }
      else
      {
        int v398 = v410;
        if (v410 != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v408;
          int v417 = v395;
          __int16 v418 = 1024;
          int v419 = v398;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "rpc_bind_interface: bind_ack p_result_list[%u]: ctx_version not NDR_VERS_2,  got: %u\n", buf, 0xEu);
        }
        char v396 = 1;
      }
      ++v395;
    }
    while (v354 != v395);
    if ((v396 & 1) == 0) {
      goto LABEL_244;
    }
    if (v348 + 24 * v354 + 4 != objc_msgSend(v9, "in_fbtbd"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100060C74(v9);
      }
      goto LABEL_108;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100060C2C();
    }
    v399 = sub_100048898(v7, (uint64_t)objc_msgSend(v9, "negotiated_max_xmit_frag", v408), (uint64_t)objc_msgSend(v9, "negotiated_max_recv_frag"));
    uint64_t v18 = v399;
    if (v399)
    {
      objc_msgSend(v399, "setAssoc_group_id:", v409);
      objc_msgSend(v18, "setContext_id:", 0);
      goto LABEL_82;
    }
    goto LABEL_33;
  }
  objc_msgSend(v9, "setSec_addr:", malloc_type_calloc(1uLL, objc_msgSend(v9, "sec_addr_len"), 0x39DD9B1uLL));
  if (objc_msgSend(v9, "sec_addr"))
  {
    if (!sub_100048370(v9, objc_msgSend(v9, "sec_addr"), objc_msgSend(v9, "sec_addr_len")))
    {
      BOOL v363 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v363) {
        sub_10006119C(v363, v364, v365, v366, v367, v368, v369, v370);
      }
      goto LABEL_97;
    }
    int v348 = objc_msgSend(v9, "sec_addr_len") + 26;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100061118(v9);
    }
    goto LABEL_190;
  }
  BOOL v355 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v355) {
    sub_1000610DC(v355, v356, v357, v358, v359, v360, v361, v362);
  }
LABEL_32:
  uint64_t v18 = 0;
LABEL_33:
  int v19 = 13;
LABEL_81:
  *a4 = v19;
LABEL_82:

  return v18;
}

bindrecStream *sub_100047844(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  int v6 = objc_alloc_init(bindrecStream);
  if (!v6)
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_100061EBC(v8, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_12:
    id v7 = 0;
    goto LABEL_13;
  }
  id v7 = v6;
  [(bindrecStream *)v6 setTctx:v5];
  [(bindrecStream *)v7 setIn_max_recv_frag:(unsigned __int16)a3];
  [(bindrecStream *)v7 setIn_max_xmit_frag:(unsigned __int16)a2];
  [(bindrecStream *)v7 setSend_size:a2];
  [(bindrecStream *)v7 setRecv_size:a3];
  [(bindrecStream *)v7 setOut_base:malloc_type_malloc(a2, 0xB594237BuLL)];
  if ([(bindrecStream *)v7 out_base])
  {
    [(bindrecStream *)v7 setIn_base:malloc_type_malloc(a3, 0x9C2CB5C7uLL)];
    if ([(bindrecStream *)v7 in_base])
    {
      [(bindrecStream *)v7 setIn_lastfrag:0];
      goto LABEL_13;
    }
    BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v24) {
      sub_100061F34(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    goto LABEL_12;
  }
  BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v16) {
    sub_100061EF8(v16, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_13:

  return v7;
}

BOOL sub_100047998(void *a1, char a2)
{
  id v3 = a1;
  unsigned int v4 = objc_msgSend(v3, "out_finger");
  unsigned int v5 = objc_msgSend(v3, "send_size");
  if (v4 < v5)
  {
    int v6 = objc_msgSend(v3, "out_base");
    v6[objc_msgSend(v3, "out_finger")] = a2;
    objc_msgSend(v3, "setOut_finger:", objc_msgSend(v3, "out_finger") + 1);
  }

  return v4 < v5;
}

BOOL sub_100047A28(void *a1, __int16 a2)
{
  id v3 = a1;
  unint64_t v4 = objc_msgSend(v3, "out_finger") + 2;
  unint64_t v5 = objc_msgSend(v3, "send_size");
  if (v4 <= v5)
  {
    int v6 = (char *)objc_msgSend(v3, "out_base");
    *(_WORD *)&v6[objc_msgSend(v3, "out_finger")] = a2;
    objc_msgSend(v3, "setOut_finger:", objc_msgSend(v3, "out_finger") + 2);
  }

  return v4 <= v5;
}

BOOL sub_100047ABC(void *a1, int a2)
{
  id v3 = a1;
  unint64_t v4 = objc_msgSend(v3, "out_finger") + 4;
  unint64_t v5 = objc_msgSend(v3, "send_size");
  if (v4 <= v5)
  {
    int v6 = (char *)objc_msgSend(v3, "out_base");
    *(_DWORD *)&v6[objc_msgSend(v3, "out_finger")] = a2;
    objc_msgSend(v3, "setOut_finger:", objc_msgSend(v3, "out_finger") + 4);
  }

  return v4 <= v5;
}

BOOL sub_100047B50(void *a1, const void *a2, unsigned int a3)
{
  id v5 = a1;
  unsigned int v6 = objc_msgSend(v5, "out_finger") + a3;
  unsigned int v7 = objc_msgSend(v5, "send_size");
  if (v6 <= v7)
  {
    memmove((char *)objc_msgSend(v5, "out_base") + objc_msgSend(v5, "out_finger"), a2, a3);
    objc_msgSend(v5, "setOut_finger:", objc_msgSend(v5, "out_finger") + a3);
  }

  return v6 <= v7;
}

uint64_t sub_100047BF0(void *a1)
{
  id v1 = a1;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  unint64_t v2 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
  *unint64_t v2 = 0u;
  v2[1] = 0u;
  unsigned int v3 = objc_msgSend(v1, "out_finger");
  uint64_t v20 = v1;
  unint64_t v4 = dispatch_group_create();
  if (v3)
  {
    unsigned int v6 = 0;
    unsigned int v7 = 0;
    uint64_t v19 = v22;
    int v8 = 1;
    *(void *)&long long v5 = 67109632;
    long long v18 = v5;
    while (1)
    {
      uint64_t v9 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)objc_msgSend(v20, "out_base", v18, v19) + v7, v3, 0);

      *((_DWORD *)v2 + 4) = v3;
      dispatch_group_enter(v4);
      uint64_t v10 = [v20 tctx];
      uint64_t v11 = [v10 fidCtx];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v22[0] = sub_100048470;
      v22[1] = &unk_1000886F8;
      BOOL v24 = &v25;
      uint64_t v12 = v4;
      uint64_t v23 = v12;
      +[smb_subr sendWrite:v11 Param:v2 WriteBuf:v9 CompletionHandler:v21];

      dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      if (*((_DWORD *)v26 + 6)) {
        break;
      }
      int v13 = *((_DWORD *)v2 + 7);
      v7 += v13;
      v3 -= v13;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v18;
        unsigned int v30 = v8;
        __int16 v31 = 1024;
        unsigned int v32 = v7;
        __int16 v33 = 1024;
        unsigned int v34 = v3;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "bindrec_flush: After pass: %u, nwritten: %u, nremain: %u\n", buf, 0x14u);
      }

      ++v8;
      unsigned int v6 = v9;
      if (!v3) {
        goto LABEL_9;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = *((_DWORD *)v26 + 6);
      int v17 = *((_DWORD *)v2 + 6);
      *(_DWORD *)buf = 67109888;
      unsigned int v30 = v3;
      __int16 v31 = 1024;
      unsigned int v32 = v7;
      __int16 v33 = 1024;
      unsigned int v34 = v16;
      __int16 v35 = 1024;
      int v36 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "bindrec_flush: sendWrite error, nremain: %u, nwritten: %u, error: %d, ntstatus: 0x%x\n", buf, 0x1Au);
    }

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v9 = 0;
LABEL_9:
    objc_msgSend(v20, "setOut_finger:", 0);
    uint64_t v14 = 1;
  }
  free(v2);
  _Block_object_dispose(&v25, 8);

  return v14;
}

void sub_100047F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100047F44(void *a1)
{
  id v1 = a1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x4010000000;
  BOOL v24 = &unk_10007BB3D;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  unint64_t v2 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
  *unint64_t v2 = 0u;
  v2[1] = 0u;
  *((void *)v2 + 1) = objc_msgSend(v1, "in_base");
  *((_DWORD *)v2 + 4) = objc_msgSend(v1, "recv_size");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10006208C();
  }
  unsigned int v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  unint64_t v4 = [v1 tctx];
  long long v5 = [v4 fidCtx];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_100048410;
  uint64_t v12 = &unk_10008A8F0;
  uint64_t v14 = &v21;
  uint64_t v15 = &v17;
  unsigned int v16 = v2;
  unsigned int v6 = v3;
  int v13 = v6;
  +[smb_subr sendRead:v5 Param:v2 ReadBuf:0 CompletionHandler:&v9];

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  int v7 = *((_DWORD *)v18 + 6);
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100061FF4();
    }
  }
  else
  {
    objc_msgSend(v1, "setIn_finger:", 0, v9, v10, v11, v12);
    objc_msgSend(v1, "setIn_len:", *((unsigned int *)v22 + 15));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100061F70();
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7 == 0;
}

void sub_100048188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000481AC(void *a1, unsigned char *a2)
{
  id v3 = a1;
  unsigned int v4 = objc_msgSend(v3, "in_finger");
  unsigned int v5 = objc_msgSend(v3, "in_len");
  if (v4 < v5)
  {
    unsigned int v6 = objc_msgSend(v3, "in_base");
    *a2 = v6[objc_msgSend(v3, "in_finger")];
    objc_msgSend(v3, "setIn_finger:", objc_msgSend(v3, "in_finger") + 1);
  }

  return v4 < v5;
}

BOOL sub_100048240(void *a1, _DWORD *a2)
{
  id v3 = a1;
  unint64_t v4 = objc_msgSend(v3, "in_finger") + 4;
  unint64_t v5 = objc_msgSend(v3, "in_len");
  if (v4 <= v5)
  {
    unsigned int v6 = (char *)objc_msgSend(v3, "in_base");
    *a2 = *(_DWORD *)&v6[objc_msgSend(v3, "in_finger")];
    objc_msgSend(v3, "setIn_finger:", objc_msgSend(v3, "in_finger") + 4);
  }

  return v4 <= v5;
}

BOOL sub_1000482D8(void *a1, _WORD *a2)
{
  id v3 = a1;
  unint64_t v4 = objc_msgSend(v3, "in_finger") + 2;
  unint64_t v5 = objc_msgSend(v3, "in_len");
  if (v4 <= v5)
  {
    unsigned int v6 = (char *)objc_msgSend(v3, "in_base");
    *a2 = *(_WORD *)&v6[objc_msgSend(v3, "in_finger")];
    objc_msgSend(v3, "setIn_finger:", objc_msgSend(v3, "in_finger") + 2);
  }

  return v4 <= v5;
}

BOOL sub_100048370(void *a1, void *a2, unsigned int a3)
{
  id v5 = a1;
  unsigned int v6 = objc_msgSend(v5, "in_finger") + a3;
  unsigned int v7 = objc_msgSend(v5, "in_len");
  if (v6 <= v7)
  {
    memmove(a2, (char *)objc_msgSend(v5, "in_base") + objc_msgSend(v5, "in_finger"), a3);
    objc_msgSend(v5, "setIn_finger:", objc_msgSend(v5, "in_finger") + a3);
  }

  return v6 <= v7;
}

void sub_100048410(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(_OWORD **)(a1 + 56);
  long long v6 = v5[1];
  *(_OWORD *)(v4 + 32) = *v5;
  *(_OWORD *)(v4 + 4_Block_object_dispose(&STACK[0x200], 8) = v6;
  free(*(void **)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  unsigned int v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void sub_100048470(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

ndrrecStream *sub_100048898(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  long long v6 = objc_alloc_init(ndrrecStream);
  if (v6)
  {
    unsigned int v7 = v6;
    [(ndrrecStream *)v6 setTctx:v5];
    [(ndrrecStream *)v7 setSend_size:a2];
    [(ndrrecStream *)v7 setOut_base:malloc_type_calloc(1uLL, [(ndrrecStream *)v7 send_size], 0x8BBDE81uLL)];
    if ([(ndrrecStream *)v7 out_base])
    {
      int v8 = [(ndrrecStream *)v7 out_base];
      *(_WORD *)int v8 = 5;
      v8[2] = 0;
      *((_DWORD *)v8 + 1) = 16;
      [(ndrrecStream *)v7 setOut_finger:24];
      [(ndrrecStream *)v7 setRecv_size:a3];
      [(ndrrecStream *)v7 setIn_base:malloc_type_malloc([(ndrrecStream *)v7 recv_size], 0x4E90B6EuLL)];
      if ([(ndrrecStream *)v7 in_base]) {
        goto LABEL_12;
      }
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v9) {
        sub_100062184(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v25) {
        sub_100062148(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_10006210C(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  unsigned int v7 = 0;
LABEL_12:

  return v7;
}

id sub_100048A00(void *a1, uint64_t a2)
{
  return [a1 setOpnum:a2];
}

uint64_t sub_100048A08(void *a1, unsigned char *a2)
{
  id v3 = a1;
  char v8 = 0;
  if (objc_msgSend(v3, "in_fbtbc")
    && (unsigned int v4 = objc_msgSend(v3, "in_finger") + 1, v4 <= objc_msgSend(v3, "in_len")))
  {
    id v5 = objc_msgSend(v3, "in_base");
    *a2 = v5[objc_msgSend(v3, "in_finger")];
    objc_msgSend(v3, "setIn_finger:", objc_msgSend(v3, "in_finger") + 1);
    objc_msgSend(v3, "setIn_fbtbc:", objc_msgSend(v3, "in_fbtbc") - 1);
  }
  else
  {
    if (!sub_100048AE0(v3, &v8, 1u))
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    *a2 = v8;
  }
  uint64_t v6 = 1;
LABEL_8:

  return v6;
}

uint64_t sub_100048AE0(void *a1, char *a2, unsigned int a3)
{
  id v5 = a1;
  if (a3)
  {
    do
    {
      for (i = v5; ; i = v8)
      {
        unsigned int v7 = objc_msgSend(i, "in_fbtbc");
        if (v7) {
          break;
        }
        if (objc_msgSend(v5, "in_lastfrag"))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1000621C0(a3);
          }
          goto LABEL_61;
        }
        id v8 = v5;
        uint64_t v68 = 0;
        uint64_t v69 = 0;
        int v67 = 0;
        unsigned __int16 v66 = 0;
        char v65 = 0;
        if ((sub_100049768(v8, (char *)&v68, 0x10u) & 1) == 0)
        {
          BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v15) {
            sub_100062800(v15, v16, v17, v18, v19, v20, v21, v22);
          }
LABEL_60:

LABEL_61:
          uint64_t v14 = 0;
          goto LABEL_62;
        }
        objc_msgSend(v8, "setIn_lastfrag:", (BYTE3(v68) >> 1) & 1);
        if (v68 != 5)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10006278C();
          }
          goto LABEL_60;
        }
        if (BYTE1(v68))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100062718();
          }
          goto LABEL_60;
        }
        objc_msgSend(v8, "setIn_ndr:", HIDWORD(v68));
        int v9 = BYTE4(v68) & 0xF0;
        if (BYTE4(v68) >= 0x10u && v9 != 16)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000626A4();
          }
          goto LABEL_60;
        }
        if ((v68 & 0xF00000000) != 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100062630();
          }
          goto LABEL_60;
        }
        if (WORD1(v69))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000625BC();
          }
          goto LABEL_60;
        }
        if (v9 != 16)
        {
          BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v23) {
            sub_100062580(v23, v24, v25, v26, v27, v28, v29, v30);
          }
          goto LABEL_60;
        }
        int v10 = HIDWORD(v69);
        if (v10 != objc_msgSend(v8, "call_id_counter"))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000624E0(v8);
          }
          goto LABEL_60;
        }
        objc_msgSend(v8, "setIn_fbtbc:", (unsigned __int16)v69 - 16);
        unsigned __int8 v11 = BYTE2(v68);
        if ((BYTE2(v68) & 0xFE) == 2)
        {
          if ((sub_100049768(v8, (char *)&v67, 4u) & 1) == 0)
          {
            BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v31) {
              sub_100062454(v31, v32, v33, v34, v35, v36, v37, v38);
            }
            goto LABEL_60;
          }
          objc_msgSend(v8, "setIn_fbtbc:", objc_msgSend(v8, "in_fbtbc") - 4);
          if ((sub_100049768(v8, (char *)&v66, 2u) & 1) == 0)
          {
            BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v39) {
              sub_100062418(v39, v40, v41, v42, v43, v44, v45, v46);
            }
            goto LABEL_60;
          }
          objc_msgSend(v8, "setIn_fbtbc:", objc_msgSend(v8, "in_fbtbc") - 2);
          int v12 = v66;
          if (v12 != objc_msgSend(v8, "context_id"))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100062378(v8, &v66);
            }
            goto LABEL_60;
          }
          if ((sub_100049768(v8, &v65, 1u) & 1) == 0)
          {
            BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v47) {
              sub_10006233C(v47, v48, v49, v50, v51, v52, v53, v54);
            }
            goto LABEL_60;
          }
          objc_msgSend(v8, "setIn_fbtbc:", objc_msgSend(v8, "in_fbtbc") - 1);
          if (sub_100049768(v8, &v65, 1u))
          {
            objc_msgSend(v8, "setIn_fbtbc:", objc_msgSend(v8, "in_fbtbc") - 1);
            if (BYTE2(v68) == 3)
            {
              char v56 = sub_100049768(v8, (char *)&v67, 4u);
              if (v56)
              {
                objc_msgSend(v8, "setIn_fbtbc:", objc_msgSend(v8, "in_fbtbc") - 4);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100062240();
                }
              }
              else
              {
                BOOL v57 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v57) {
                  sub_1000622B4(v57, v58, v59, v60, v61, v62, v63, v64);
                }
              }
              goto LABEL_60;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_1000622F0(buf, &v73);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100062490(v70, v11, v71);
        }
      }
      if (v7 >= a3) {
        unsigned int v13 = a3;
      }
      else {
        unsigned int v13 = v7;
      }
      uint64_t v14 = sub_100049768(v5, a2, v13);
      if (!v14) {
        break;
      }
      a2 += v13;
      objc_msgSend(v5, "setIn_fbtbc:", objc_msgSend(v5, "in_fbtbc") - v13);
      a3 -= v13;
    }
    while (a3);
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_62:

  return v14;
}

uint64_t sub_100048FC0(void *a1, char a2)
{
  id v3 = a1;
  unsigned int v4 = objc_msgSend(v3, "out_finger");
  if (v4 < objc_msgSend(v3, "send_size") || (uint64_t v5 = 0, sub_100049054(v3, 0)))
  {
    uint64_t v6 = objc_msgSend(v3, "out_base");
    v6[objc_msgSend(v3, "out_finger")] = a2;
    objc_msgSend(v3, "setOut_finger:", objc_msgSend(v3, "out_finger") + 1);
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t sub_100049054(void *a1, int a2)
{
  id v3 = a1;
  unsigned int v4 = objc_msgSend(v3, "out_base");
  v4[3] = 0;
  if ((objc_msgSend(v3, "out_first_frag_sent") & 1) == 0)
  {
    v4[3] |= 1u;
    objc_msgSend(v3, "setOut_first_frag_sent:", 1);
  }
  if (a2) {
    v4[3] |= 2u;
  }
  *((_WORD *)v4 + 4) = (unsigned __int16)objc_msgSend(v3, "out_finger");
  *((_WORD *)v4 + 5) = 0;
  objc_msgSend(v3, "setCall_id_counter:", objc_msgSend(v3, "call_id_counter") + 1);
  *((_DWORD *)v4 + 3) = objc_msgSend(v3, "call_id_counter");
  *((_DWORD *)v4 + 4) = objc_msgSend(v3, "out_finger") - 24;
  *((_WORD *)v4 + 10) = (unsigned __int16)objc_msgSend(v3, "context_id");
  *((_WORD *)v4 + 11) = (unsigned __int16)[v3 opnum];
  id v5 = v3;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  group = dispatch_group_create();
  uint64_t v6 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  unsigned int v7 = objc_msgSend(v5, "out_finger");
  if (v7)
  {
    int v9 = 0;
    unsigned int v10 = 0;
    uint64_t v24 = v27;
    int v11 = 1;
    *(void *)&long long v8 = 67109632;
    long long v23 = v8;
    while (1)
    {
      int v12 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)objc_msgSend(v5, "out_base", v23, v24) + v10, v7, 0);

      *((_DWORD *)v6 + 4) = v7;
      dispatch_group_enter(group);
      unsigned int v13 = [v5 tctx];
      uint64_t v14 = [v13 fidCtx];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v27[0] = sub_100049C90;
      v27[1] = &unk_1000886F8;
      uint64_t v29 = &v30;
      BOOL v15 = group;
      uint64_t v28 = v15;
      +[smb_subr sendWrite:v14 Param:v6 WriteBuf:v12 CompletionHandler:v26];

      dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      unsigned int v16 = *((_DWORD *)v31 + 6);
      if (v16) {
        break;
      }
      int v17 = *((_DWORD *)v6 + 7);
      v10 += v17;
      v7 -= v17;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v23;
        unsigned int v35 = v11;
        __int16 v36 = 1024;
        unsigned int v37 = v10;
        __int16 v38 = 1024;
        unsigned int v39 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "transport_flush: After pass: %u, nwritten: %u, nremain: %u", buf, 0x14u);
      }

      ++v11;
      int v9 = v12;
      if (!v7) {
        goto LABEL_13;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v22 = *((_DWORD *)v6 + 6);
      *(_DWORD *)buf = 67109888;
      unsigned int v35 = v7;
      __int16 v36 = 1024;
      unsigned int v37 = v10;
      __int16 v38 = 1024;
      unsigned int v39 = v16;
      __int16 v40 = 1024;
      int v41 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "transport_flush: sendWrite error, nremain: %u, nwritten: %u, error: %d, ntstatus: 0x%x", buf, 0x1Au);
    }
    uint64_t v20 = 0;
    uint64_t v18 = v28;
  }
  else
  {
    int v12 = 0;
LABEL_13:
    free(v6);
    uint64_t v18 = &_os_log_default;
    id v19 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10006283C(buf, (int)objc_msgSend(v5, "out_finger"));
    }
    uint64_t v20 = 1;
  }

  _Block_object_dispose(&v30, 8);
  if (v20) {
    objc_msgSend(v5, "setOut_finger:", 24);
  }

  return v20;
}

void sub_100049458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100049480(void *a1, _WORD *a2)
{
  id v3 = a1;
  __int16 v8 = 0;
  if (objc_msgSend(v3, "in_fbtbc") >= 2)
  {
    unsigned int v4 = objc_msgSend(v3, "in_finger") + 2;
    if (v4 <= objc_msgSend(v3, "in_len"))
    {
      uint64_t v6 = (char *)objc_msgSend(v3, "in_base");
      *a2 = *(_WORD *)&v6[objc_msgSend(v3, "in_finger")];
      objc_msgSend(v3, "setIn_finger:", objc_msgSend(v3, "in_finger") + 2);
      objc_msgSend(v3, "setIn_fbtbc:", objc_msgSend(v3, "in_fbtbc") - 2);
      goto LABEL_7;
    }
  }
  if (sub_100048AE0(v3, (char *)&v8, 2u))
  {
    *a2 = v8;
LABEL_7:
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

uint64_t sub_10004955C(void *a1, __int16 a2)
{
  id v3 = a1;
  unint64_t v4 = objc_msgSend(v3, "out_finger") + 2;
  if (v4 <= objc_msgSend(v3, "send_size") || (uint64_t v5 = 0, sub_100049054(v3, 0)))
  {
    uint64_t v6 = (char *)objc_msgSend(v3, "out_base");
    *(_WORD *)&v6[objc_msgSend(v3, "out_finger")] = a2;
    objc_msgSend(v3, "setOut_finger:", objc_msgSend(v3, "out_finger") + 2);
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t sub_1000495F4(void *a1, _DWORD *a2)
{
  id v3 = a1;
  int v8 = 0;
  if (objc_msgSend(v3, "in_fbtbc") >= 4)
  {
    unsigned int v4 = objc_msgSend(v3, "in_finger") + 4;
    if (v4 <= objc_msgSend(v3, "in_len"))
    {
      uint64_t v6 = (char *)objc_msgSend(v3, "in_base");
      *a2 = *(_DWORD *)&v6[objc_msgSend(v3, "in_finger")];
      objc_msgSend(v3, "setIn_finger:", objc_msgSend(v3, "in_finger") + 4);
      objc_msgSend(v3, "setIn_fbtbc:", objc_msgSend(v3, "in_fbtbc") - 4);
      goto LABEL_7;
    }
  }
  if (sub_100048AE0(v3, (char *)&v8, 4u))
  {
    *a2 = v8;
LABEL_7:
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

uint64_t sub_1000496D0(void *a1, int a2)
{
  id v3 = a1;
  unint64_t v4 = objc_msgSend(v3, "out_finger") + 4;
  if (v4 <= objc_msgSend(v3, "send_size") || (uint64_t v5 = 0, sub_100049054(v3, 0)))
  {
    uint64_t v6 = (char *)objc_msgSend(v3, "out_base");
    *(_DWORD *)&v6[objc_msgSend(v3, "out_finger")] = a2;
    objc_msgSend(v3, "setOut_finger:", objc_msgSend(v3, "out_finger") + 4);
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t sub_100049768(void *a1, char *a2, unsigned int a3)
{
  id v4 = a1;
  if (a3)
  {
    int v21 = a3;
    unsigned int v22 = a3;
    do
    {
      while (1)
      {
        unsigned int v5 = objc_msgSend(v4, "in_len");
        unsigned int v6 = objc_msgSend(v4, "in_finger");
        unsigned int v7 = v5 - v6;
        if (v5 == v6) {
          break;
        }
        if (v22 >= v7) {
          size_t v17 = v7;
        }
        else {
          size_t v17 = v22;
        }
        memmove(a2, (char *)objc_msgSend(v4, "in_base") + objc_msgSend(v4, "in_finger"), v17);
        objc_msgSend(v4, "setIn_finger:", objc_msgSend(v4, "in_finger") + v17);
        a2 += v17;
        v22 -= v17;
        if (!v22) {
          goto LABEL_16;
        }
      }
      id v8 = v4;
      uint64_t v33 = 0;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x4010000000;
      __int16 v36 = &unk_10007BB3D;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2020000000;
      int v32 = 0;
      int v9 = dispatch_group_create();
      unsigned int v10 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
      *unsigned int v10 = 0u;
      v10[1] = 0u;
      *((void *)v10 + 1) = objc_msgSend(v8, "in_base");
      *((_DWORD *)v10 + 4) = objc_msgSend(v8, "recv_size");
      dispatch_group_enter(v9);
      int v11 = [v8 tctx];
      int v12 = [v11 fidCtx];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100049C38;
      v24[3] = &unk_10008A8F0;
      uint64_t v26 = &v29;
      uint64_t v27 = &v33;
      uint64_t v28 = v10;
      unsigned int v13 = v9;
      uint64_t v25 = v13;
      +[smb_subr sendRead:v12 Param:v10 ReadBuf:0 CompletionHandler:v24];

      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      int v14 = *((_DWORD *)v30 + 6);
      if (v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          int v15 = *((_DWORD *)v34 + 14);
          *(_DWORD *)buf = 67109376;
          int v42 = v14;
          __int16 v43 = 1024;
          int v44 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "fill_input_buf: sendRead error: %d, ntstatus: 0x%x\n", buf, 0xEu);
        }
      }
      else
      {
        objc_msgSend(v8, "setIn_finger:", 0);
        objc_msgSend(v8, "setIn_len:", *((unsigned int *)v34 + 15));
        id v16 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_10006291C(v39, (int)objc_msgSend(v8, "in_len"), v40);
        }
      }
      _Block_object_dispose(&v29, 8);

      _Block_object_dispose(&v33, 8);
    }
    while (!v14);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062888(v21, v22);
    }
    uint64_t v18 = 0;
  }
  else
  {
LABEL_16:
    uint64_t v18 = 1;
  }

  return v18;
}

void sub_100049B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100049B48(void *a1, char *a2, unsigned int a3)
{
  id v5 = a1;
  if (a3)
  {
    while (1)
    {
      unsigned int v6 = objc_msgSend(v5, "send_size");
      unsigned int v7 = v6 - objc_msgSend(v5, "out_finger");
      size_t v8 = a3 >= v7 ? v7 : a3;
      if (v8)
      {
        memmove((char *)objc_msgSend(v5, "out_base") + objc_msgSend(v5, "out_finger"), a2, v8);
        objc_msgSend(v5, "setOut_finger:", objc_msgSend(v5, "out_finger") + v8);
        a2 += v8;
        a3 -= v8;
      }
      unsigned int v9 = objc_msgSend(v5, "out_finger");
      if (v9 == objc_msgSend(v5, "send_size") && !sub_100049054(v5, 0)) {
        break;
      }
      if (!a3) {
        goto LABEL_10;
      }
    }
    uint64_t v10 = 0;
  }
  else
  {
LABEL_10:
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t sub_100049C30(void *a1)
{
  return sub_100049054(a1, 1);
}

void sub_100049C38(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  id v3 = *(_OWORD **)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v5 = v3[1];
  *(_OWORD *)(v4 + 32) = *v3;
  *(_OWORD *)(v4 + 4_Block_object_dispose(&STACK[0x200], 8) = v5;
  free(*(void **)(a1 + 56));
  unsigned int v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void sub_100049C90(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void *sub_100049E74(void *a1)
{
  id v1 = a1;
  int v21 = 0;
  unint64_t v2 = [transportCtx alloc];
  id v3 = [v1 pd];
  uint64_t v4 = [v1 serverName];
  long long v5 = -[transportCtx initWithPiston:ServerName:ServerMaxRead:ServerMaxWrite:ServerMaxTransact:ShareID:](v2, "initWithPiston:ServerName:ServerMaxRead:ServerMaxWrite:ServerMaxTransact:ShareID:", v3, v4, [v1 serverMaxRead], objc_msgSend(v1, "serverMaxWrite"), objc_msgSend(v1, "serverMaxTransact"), objc_msgSend(v1, "shareID"));

  if (v5)
  {
    uint64_t v6 = sub_10004A080(v5, @"srvsvc");
    unsigned int v20 = v6;
    if (v6)
    {
      uint64_t v7 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100062A14();
      }
      size_t v8 = 0;
    }
    else
    {
      size_t v17 = sub_100046818(v5, &unk_1000914B8, dword_1000914D8, &v21);
      if (v17)
      {
        id v18 = [v1 serverName];
        size_t v8 = sub_10004A3A4(v17, (const char *)[v18 UTF8String], &v20);

        if (!v8)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000629A4();
          }
          size_t v8 = 0;
        }
      }
      else
      {
        sub_10004B3F8(v21, (uint64_t)"Failed to bind to srvsvc interface:");
        size_t v8 = 0;
        unsigned int v20 = sub_10004B6AC(v21);
      }
      sub_10004A6EC(v5);
      uint64_t v7 = v20;
    }
  }
  else
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_100062968(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    size_t v8 = 0;
    uint64_t v7 = 12;
  }
  [v1 setStatus:v7];

  return v8;
}

uint64_t sub_10004A080(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x11810000000;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v30[2] = &unk_10007BB3D;
  uint64_t v46 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10004A858;
  uint64_t v26 = sub_10004A868;
  id v27 = 0;
  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x2020000000;
  int v21 = 0;
  long long v5 = dispatch_group_create();
  uint64_t v6 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  *((void *)v6 + 30) = 0;
  v6[13] = 0u;
  v6[14] = 0u;
  v6[11] = 0u;
  v6[12] = 0u;
  v6[9] = 0u;
  v6[10] = 0u;
  v6[7] = 0u;
  v6[8] = 0u;
  void v6[5] = 0u;
  v6[6] = 0u;
  v6[3] = 0u;
  void v6[4] = 0u;
  v6[2] = 0u;
  *(_OWORD *)((char *)v6 + 12) = xmmword_10006C540;
  *((_DWORD *)v6 + 7) = 1;
  dispatch_group_enter(v5);
  uint64_t v7 = [v3 pd];
  id v8 = [v3 shareID];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004A870;
  v13[3] = &unk_1000887C0;
  uint64_t v15 = &v19;
  uint64_t v16 = &v22;
  size_t v17 = &v29;
  id v18 = v6;
  BOOL v9 = v5;
  uint64_t v14 = v9;
  +[smb_subr sendCreateFile:v7 ShareID:v8 FileName:v4 StreamName:0 Param:v6 CompletionHandler:v13];

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (v23[5])
  {
    objc_msgSend(v3, "setFidCtx:");
  }
  else
  {
    id v10 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062A84((uint64_t)[v4 UTF8String], (uint64_t)v20, (uint64_t)v30, buf);
    }
  }
  uint64_t v11 = *(unsigned int *)(v20[0] + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v29, 8);
  return v11;
}

void sub_10004A368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void *sub_10004A3A4(void *a1, const char *a2, _DWORD *a3)
{
  id v5 = a1;
  uint64_t v107 = 0;
  BOOL v108 = 0;
  sub_100048A00(v5, 15);
  int v106 = sub_10004B6D0(a2, (UInt8 **)&v108, (_DWORD *)&v107 + 1, &v107);
  if (v106)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062E34();
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 1) & 1) == 0)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_100062DF8(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, v107) & 1) == 0)
  {
    BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v25) {
      sub_100062DBC(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 0) & 1) == 0)
  {
    BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v33) {
      sub_100062D80(v33, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, v107) & 1) == 0)
  {
    BOOL v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v41) {
      sub_100062D44(v41, v42, v43, v44, v45, v46, v47, v48);
    }
    goto LABEL_50;
  }
  if ((sub_100049B48(v5, (char *)v108, HIDWORD(v107)) & 1) == 0)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_100062D08(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if ((v107 & 0x300000000) != 0)
  {
    int v14 = 0;
    unsigned int v15 = BYTE4(v107) & 3 | 0xFFFFFFFC;
    while ((sub_100048FC0(v5, 0) & 1) != 0)
    {
      if (v15 == --v14) {
        goto LABEL_15;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062C98();
    }
    goto LABEL_50;
  }
LABEL_15:
  if ((sub_1000496D0(v5, 1) & 1) == 0)
  {
    BOOL v49 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v49) {
      sub_100062C5C(v49, v50, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 1) & 1) == 0)
  {
    BOOL v57 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v57) {
      sub_100062C20(v57, v58, v59, v60, v61, v62, v63, v64);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 1) & 1) == 0)
  {
    BOOL v65 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v65) {
      sub_100062BE4(v65, v66, v67, v68, v69, v70, v71, v72);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 0) & 1) == 0)
  {
    BOOL v73 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!v73) {
      goto LABEL_50;
    }
LABEL_41:
    sub_100062B30(v73, v74, v75, v76, v77, v78, v79, v80);
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 0) & 1) == 0)
  {
    BOOL v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v81) {
      sub_100062BA8(v81, v82, v83, v84, v85, v86, v87, v88);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, -1) & 1) == 0)
  {
    BOOL v89 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v89) {
      sub_100062B6C(v89, v90, v91, v92, v93, v94, v95, v96);
    }
    goto LABEL_50;
  }
  if ((sub_1000496D0(v5, 0) & 1) == 0)
  {
    BOOL v73 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!v73) {
      goto LABEL_50;
    }
    goto LABEL_41;
  }
  if (sub_100049C30(v5))
  {
    uint64_t v16 = sub_10004A94C(v5, &v106);
    goto LABEL_51;
  }
  BOOL v97 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v97) {
    sub_100062AF4(v97, v98, v99, v100, v101, v102, v103, v104);
  }
LABEL_50:
  uint64_t v16 = 0;
LABEL_51:
  if (v108) {
    free(v108);
  }
  *a3 = v106;

  return v16;
}

uint64_t sub_10004A6EC(void *a1)
{
  id v1 = a1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  unint64_t v2 = dispatch_group_create();
  id v3 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
  v3[2] = 0u;
  v3[3] = 0u;
  *id v3 = 0u;
  v3[1] = 0u;
  dispatch_group_enter(v2);
  id v4 = [v1 fidCtx];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004A938;
  v8[3] = &unk_1000886F8;
  uint64_t v10 = &v11;
  id v5 = v2;
  uint64_t v9 = v5;
  +[smb_subr sendClose:v4 Param:v3 GetPostAttrs:0 CompletionHandler:v8];

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  free(v3);
  uint64_t v6 = *((unsigned int *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_10004A840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004A858(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004A868(uint64_t a1)
{
}

void sub_10004A870(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v19 = obj;
  id v5 = *(long long **)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v8 = v5[13];
  long long v7 = v5[14];
  long long v9 = v5[12];
  *(void *)(v6 + 272) = *((void *)v5 + 30);
  *(_OWORD *)(v6 + 240) = v8;
  *(_OWORD *)(v6 + 256) = v7;
  *(_OWORD *)(v6 + 224) = v9;
  long long v10 = v5[11];
  long long v12 = v5[8];
  long long v11 = v5[9];
  *(_OWORD *)(v6 + 192) = v5[10];
  *(_OWORD *)(v6 + 20_Block_object_dispose(&STACK[0x200], 8) = v10;
  *(_OWORD *)(v6 + 160) = v12;
  *(_OWORD *)(v6 + 176) = v11;
  long long v13 = v5[7];
  long long v15 = v5[4];
  long long v14 = v5[5];
  *(_OWORD *)(v6 + 12_Block_object_dispose(&STACK[0x200], 8) = v5[6];
  *(_OWORD *)(v6 + 144) = v13;
  *(_OWORD *)(v6 + 96) = v15;
  *(_OWORD *)(v6 + 112) = v14;
  long long v16 = *v5;
  long long v17 = v5[1];
  long long v18 = v5[3];
  *(_OWORD *)(v6 + 64) = v5[2];
  *(_OWORD *)(v6 + 80) = v18;
  *(_OWORD *)(v6 + 32) = v16;
  *(_OWORD *)(v6 + 4_Block_object_dispose(&STACK[0x200], 8) = v17;
  free(*(void **)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10004A938(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void *sub_10004A94C(void *a1, int *a2)
{
  id v3 = a1;
  uint64_t v147 = 0;
  size_t count = 0;
  int v146 = 0;
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_1000637EC(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_34;
  }
  if (count != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006377C();
    }
    goto LABEL_37;
  }
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v24) {
      sub_100063740(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_34;
  }
  if (count != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000636D0();
    }
    goto LABEL_37;
  }
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v32) {
      sub_100063694(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_34;
  }
  if (!count)
  {
    BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v40) {
      sub_100062EA4(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_37;
  }
  if ((sub_1000495F4(v3, (_DWORD *)&count + 1) & 1) == 0)
  {
    BOOL v48 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v48) {
      sub_100063658(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    goto LABEL_34;
  }
  if (!HIDWORD(count))
  {
    BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v56) {
      sub_100062EE0(v56, v57, v58, v59, v60, v61, v62, v63);
    }
    goto LABEL_37;
  }
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v64) {
      sub_10006361C(v64, v65, v66, v67, v68, v69, v70, v71);
    }
    goto LABEL_34;
  }
  if (!count)
  {
    BOOL v72 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v72) {
      sub_100062F1C(v72, v73, v74, v75, v76, v77, v78, v79);
    }
LABEL_37:
    id v5 = 0;
    int v14 = 72;
    goto LABEL_38;
  }
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v80 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v80) {
      sub_1000635E0(v80, v81, v82, v83, v84, v85, v86, v87);
    }
LABEL_34:
    id v5 = 0;
    int v14 = 5;
    goto LABEL_38;
  }
  if (count != HIDWORD(count) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006355C();
  }
  id v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
  if (!v4)
  {
    BOOL v88 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v88) {
      sub_100062F58(v88, v89, v90, v91, v92, v93, v94, v95);
    }
    goto LABEL_62;
  }
  id v5 = v4;
  uint64_t v6 = malloc_type_calloc(HIDWORD(count), 0x18uLL, 0x101004023BA6C86uLL);
  v5[1] = v6;
  if (!v6)
  {
    BOOL v96 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v96) {
      sub_100062F94(v96, v97, v98, v99, v100, v101, v102, v103);
    }
    free(v5);
LABEL_62:
    id v5 = 0;
    int v14 = 12;
    goto LABEL_38;
  }
  int v7 = HIDWORD(count);
  *(_DWORD *)id v5 = HIDWORD(count);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 8;
    while (1)
    {
      if ((sub_1000495F4(v3, &count) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000634EC();
        }
        goto LABEL_86;
      }
      if (!count)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000631DC();
        }
        goto LABEL_89;
      }
      if ((sub_1000495F4(v3, &count) & 1) == 0) {
        break;
      }
      *(_DWORD *)(v5[1] + v9) = count;
      if ((sub_1000495F4(v3, &count) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10006340C();
        }
LABEL_86:
        int v14 = 5;
        goto LABEL_90;
      }
      if (!count)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10006324C();
        }
LABEL_89:
        int v14 = 72;
        goto LABEL_90;
      }
      ++v8;
      v9 += 24;
      if (v8 >= HIDWORD(count))
      {
        if (!HIDWORD(count)) {
          goto LABEL_63;
        }
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          int v146 = 0;
          uint64_t v147 = 0;
          int v12 = sub_10004AF78(v3, v11, &v147, &v146);
          if (v12) {
            break;
          }
          if (!v146)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000632BC();
            }
            goto LABEL_89;
          }
          *(void *)(v5[1] + v10) = v147;
          int v146 = 0;
          uint64_t v147 = 0;
          int v13 = sub_10004AF78(v3, v11, &v147, &v146);
          if (v13)
          {
            int v14 = v13;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10006332C();
            }
            goto LABEL_90;
          }
          *(void *)(v5[1] + v10 + ++*(_DWORD *)(*(void *)(result + 32) + 16) = v147;
          ++v11;
          v10 += 24;
          if (v11 >= HIDWORD(count))
          {
            int v14 = 0;
            goto LABEL_64;
          }
        }
        int v14 = v12;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10006339C();
        }
LABEL_90:
        sub_10004B24C((unsigned int *)v5);
        id v5 = 0;
        goto LABEL_38;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006347C();
    }
    goto LABEL_86;
  }
LABEL_63:
  int v14 = 5;
LABEL_64:
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v122 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v122) {
      sub_1000631A0(v122, v123, v124, v125, v126, v127, v128, v129);
    }
    goto LABEL_90;
  }
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v130 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v130) {
      sub_100063164(v130, v131, v132, v133, v134, v135, v136, v137);
    }
    goto LABEL_90;
  }
  if (count)
  {
    char v104 = sub_1000495F4(v3, &count);
    BOOL v105 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if ((v104 & 1) == 0)
    {
      if (v105) {
        sub_100063128(v105, v106, v107, v108, v109, v110, v111, v112);
      }
      goto LABEL_90;
    }
    if (v105) {
      sub_1000630B8();
    }
  }
  if ((sub_1000495F4(v3, &count) & 1) == 0)
  {
    BOOL v138 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v138) {
      sub_10006307C(v138, v139, v140, v141, v142, v143, v144, v145);
    }
    goto LABEL_90;
  }
  int v113 = count;
  BOOL v114 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v113)
  {
    if (v114) {
      sub_10006300C();
    }
    goto LABEL_90;
  }
  if (v114) {
    sub_100062FD0(v114, v115, v116, v117, v118, v119, v120, v121);
  }
  int v14 = 0;
LABEL_38:
  *a2 = v14;

  return v5;
}

uint64_t sub_10004AF78(void *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  id v6 = a1;
  memset(numBytes, 0, sizeof(numBytes));
  char v18 = 0;
  uint64_t v17 = 0;
  if ((sub_1000495F4(v6, &numBytes[2]) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063BB0();
    }
    goto LABEL_17;
  }
  if ((sub_1000495F4(v6, &numBytes[2]) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063B40();
    }
    goto LABEL_17;
  }
  if ((sub_1000495F4(v6, numBytes) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063AD0();
    }
    goto LABEL_17;
  }
  if (!numBytes[0])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063828();
    }
    uint64_t v11 = 72;
    goto LABEL_18;
  }
  size_t v7 = 2 * numBytes[0];
  numBytes[0] = v7;
  if (v7 <= 2)
  {
    uint64_t v11 = 0;
    if (!v7)
    {
      *a3 = v17;
      *a4 = numBytes[1];
      goto LABEL_18;
    }
    while ((sub_100048A08(v6, &v18) & 1) != 0)
    {
      LODWORD(v11) = v11 + 1;
      char v13 = numBytes[0];
      if (v11 >= numBytes[0])
      {
        uint64_t v9 = 0;
        goto LABEL_35;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063A60();
    }
    goto LABEL_17;
  }
  unint64_t v8 = (char *)malloc_type_calloc(1uLL, v7, 0xF00C15CCuLL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006389C();
    }
    uint64_t v11 = 12;
    goto LABEL_18;
  }
  uint64_t v9 = (UInt8 *)v8;
  if ((sub_100048AE0(v6, v8, numBytes[0]) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000639EC();
    }
LABEL_17:
    uint64_t v11 = 5;
    goto LABEL_18;
  }
  uint64_t v10 = sub_100033748(v9, numBytes[0], &v17, &numBytes[1]);
  if (v10)
  {
    uint64_t v11 = v10;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006397C();
    }
    goto LABEL_18;
  }
  char v13 = numBytes[0];
LABEL_35:
  int v14 = v13 & 3;
  if (v14)
  {
    int v15 = 0;
    unsigned int v16 = v14 | 0xFFFFFFFC;
    while ((sub_100048A08(v6, &v18) & 1) != 0)
    {
      if (v16 == --v15) {
        goto LABEL_39;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006390C();
    }
    goto LABEL_17;
  }
LABEL_39:
  *a3 = v17;
  *a4 = numBytes[1];
  if (v9) {
    free(v9);
  }
  uint64_t v11 = 0;
LABEL_18:

  return v11;
}

void sub_10004B24C(unsigned int *a1)
{
  if (*a1)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *((void *)a1 + 1);
      id v5 = *(void **)(v4 + v2);
      if (v5)
      {
        free(v5);
        uint64_t v4 = *((void *)a1 + 1);
      }
      id v6 = *(void **)(v4 + v2 + 16);
      if (v6) {
        free(v6);
      }
      ++v3;
      v2 += 24;
    }
    while (v3 < *a1);
  }
  free(*((void **)a1 + 1));
  free(a1);
}

void sub_10004B2E4(uint64_t a1, uint64_t a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100063E54(a2, v3, v4, v5, v6, v7, v8, v9);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100063DE0();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100063D6C();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100063CF8();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100063C20();
  }
}

BOOL sub_10004B3AC(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 != *(_DWORD *)a2
      || *(unsigned __int16 *)(a1 + 4) != *(unsigned __int16 *)(a2 + 4)
      || *(unsigned __int16 *)(a1 + 6) != *(unsigned __int16 *)(a2 + 6)
      || *(void *)(a1 + 8) != *(void *)(a2 + 8);
}

void sub_10004B3F8(int a1, uint64_t a2)
{
  if (a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100063E54(a2, v4, v5, v6, v7, v8, v9, v10);
  }
  switch(a1)
  {
    case 0:
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v11) {
        sub_100063EC8(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      break;
    case 1:
      BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v19) {
        sub_100063F3C(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      break;
    case 2:
      BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v27) {
        sub_100063FB4(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      break;
    case 3:
      BOOL v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v35) {
        sub_10006402C(v35, v36, v37, v38, v39, v40, v41, v42);
      }
      break;
    case 4:
      BOOL v43 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v43) {
        sub_1000640A4(v43, v44, v45, v46, v47, v48, v49, v50);
      }
      break;
    case 5:
      BOOL v51 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v51) {
        sub_10006411C(v51, v52, v53, v54, v55, v56, v57, v58);
      }
      break;
    case 6:
      BOOL v59 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v59) {
        sub_100064194(v59, v60, v61, v62, v63, v64, v65, v66);
      }
      break;
    case 7:
      BOOL v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v67) {
        sub_10006420C(v67, v68, v69, v70, v71, v72, v73, v74);
      }
      break;
    case 8:
      BOOL v75 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v75) {
        sub_100064284(v75, v76, v77, v78, v79, v80, v81, v82);
      }
      break;
    case 9:
      BOOL v83 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v83) {
        sub_1000642FC(v83, v84, v85, v86, v87, v88, v89, v90);
      }
      break;
    case 10:
      BOOL v91 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v91) {
        sub_100064374(v91, v92, v93, v94, v95, v96, v97, v98);
      }
      break;
    case 11:
      BOOL v99 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v99) {
        sub_1000643EC(v99, v100, v101, v102, v103, v104, v105, v106);
      }
      break;
    case 12:
      BOOL v107 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v107) {
        sub_100064464(v107, v108, v109, v110, v111, v112, v113, v114);
      }
      break;
    case 13:
      BOOL v115 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v115) {
        sub_1000644DC(v115, v116, v117, v118, v119, v120, v121, v122);
      }
      break;
    case 14:
      BOOL v123 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v123) {
        sub_100064554(v123, v124, v125, v126, v127, v128, v129, v130);
      }
      break;
    case 15:
      BOOL v131 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v131) {
        sub_1000645CC(v131, v132, v133, v134, v135, v136, v137, v138);
      }
      break;
    case 16:
      BOOL v139 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v139) {
        sub_100064644(v139, v140, v141, v142, v143, v144, v145, v146);
      }
      break;
    case 17:
      BOOL v147 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v147) {
        sub_1000646BC(v147, v148, v149, v150, v151, v152, v153, v154);
      }
      break;
    default:
      return;
  }
}

uint64_t sub_10004B6AC(int a1)
{
  if ((a1 - 1) > 0x10) {
    return 0;
  }
  else {
    return dword_10006C558[a1 - 1];
  }
}

uint64_t sub_10004B6D0(const char *a1, UInt8 **a2, _DWORD *a3, _DWORD *a4)
{
  size_t v8 = strnlen(a1, 0x300uLL);
  uint64_t v9 = (char *)malloc_type_malloc(v8 + 3, 0x42192BE4uLL);
  if (v9)
  {
    uint64_t v10 = v9;
    *(_WORD *)uint64_t v9 = 23644;
    strncpy(v9 + 2, a1, v8 + 1);
    uint64_t v11 = sub_1000338F4(v10, a2, a3, a4, 1);
    free(v10);
    return v11;
  }
  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_100064734(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return 12;
  }
}

void sub_10004B790(const char *a1, unsigned __int8 *a2, unsigned int a3)
{
  if (a1) {
    puts(a1);
  }
  int v5 = a3 & 7;
  if (a3 >= 8)
  {
    unsigned int v6 = a3 >> 3;
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v7 = *a2;
        int v8 = a2[1];
        int v9 = a2[2];
        int v10 = a2[3];
        int v11 = a2[4];
        int v12 = a2[5];
        int v13 = a2[6];
        int v14 = a2[7];
        *(_DWORD *)buf = 67110912;
        int v16 = v7;
        __int16 v17 = 1024;
        int v18 = v8;
        __int16 v19 = 1024;
        int v20 = v9;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 1024;
        int v24 = v11;
        __int16 v25 = 1024;
        int v26 = v12;
        __int16 v27 = 1024;
        int v28 = v13;
        __int16 v29 = 1024;
        int v30 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%02x %02x %02x %02x %02x %02x %02x %02x\n", buf, 0x32u);
      }
      a2 += 8;
      --v6;
    }
    while (v6);
  }
  if ((a3 & 7) != 0)
  {
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000647F8(buf, a2, &v16);
      }
      ++a2;
      --v5;
    }
    while (v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000647B0();
    }
  }
}

void sub_10004BE08(unsigned int *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *a1;
  if (v4)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = 8;
    do
    {
      uint64_t v9 = *((void *)a1 + 1);
      int v10 = (uint64_t *)(v9 + v8 - 8);
      if (*v10)
      {
        int v11 = *(_DWORD *)(v9 + v8) & 0xF;
        BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v11)
        {
          if (v12) {
            sub_100064AF4(v14, v11, v15);
          }
        }
        else
        {
          if (v12) {
            sub_100064AA4(v16, v10, &v17);
          }
          id v13 = [objc_alloc((Class)NSString) initWithUTF8String:*v10];

          [v3 addObject:v13];
          ++v6;
          int v7 = v13;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        sub_100064A58(buf, v5, &v19);
      }
      ++v5;
      v8 += 24;
    }
    while (v4 != v5);
  }
}

void sub_10004BF8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsString:@"$"]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_10004BFEC(int *a1)
{
  int v1 = *a1;
  int v2 = 136315394;
  id v3 = "-[SMBClientService addSMBServerOrShare:completionHandler:]";
  __int16 v4 = 1024;
  int v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s:  getSharesAtServerURL result: %d\n", (uint8_t *)&v2, 0x12u);
}

void sub_10004C084(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "newConnection ID: %d, is not entitled.\n", (uint8_t *)v1, 8u);
}

void sub_10004C108(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "addVolune: about to reply %@", (uint8_t *)&v1, 0xCu);
}

void sub_10004C188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004C1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004C200(uint64_t a1, uint64_t a2)
{
  int v2 = 136315650;
  id v3 = "-[smbcdMountServiceDelegate LiveMountService:ejectVolumeCluster:withFlags:reply:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s Error deleting FPDomain for volume cluster(%@): %@", (uint8_t *)&v2, 0x20u);
}

void sub_10004C29C(int *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "smbclientd: getSharesAtServer error: %d\n", (uint8_t *)v2, 8u);
}

void sub_10004C320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004C35C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "openEnumeration: enumDirOpen error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004C3CC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "restart_dir_enum: Couldn't restart, openEnumeration error: %d (prevState: ENUM_INIT)\n", v1, v2, v3, v4, v5);
}

void sub_10004C43C()
{
  sub_1000057A8();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "restart_dir_enum: Couldn't restart, openEnumeration error: %d (prevState: %u)\n", v1, 0xEu);
}

void sub_10004C4C4()
{
  sub_1000057EC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "skipAnEntry: entryIndex: %llu, no memory for dirEnt object\n", v0, 0xCu);
}

void sub_10004C544()
{
  sub_1000057EC();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v0, "skipAnEntry: entryIndex: %llu, enumDirNext error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004C5D4(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "fillDirEntry(attr): inBuf has insufficient space for record, inBufLen: %lu\n", (uint8_t *)&v1, 0xCu);
}

void sub_10004C654()
{
  sub_1000057E0();
  __int16 v2 = 2048;
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "fillDirEntry(attr): inBuf exhausted, recLen: %u, inBufLen: %lu\n", v1, 0x12u);
}

void sub_10004C6E0(void *a1, char a2, void *a3)
{
  __int16 v6 = [a1 name];
  if (a2) {
    bzero(a3, 0xF0uLL);
  }
  else {
    [a1 attributes];
  }
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v7, "fillDirEntry: EntryName: %@, unexpected fa_vtype: %u\n", v8, v9, v10, v11, 2u);
}

void sub_10004C7B4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "fillNextEntry: no memory for dent object\n", v0, 2u);
}

void sub_10004C7FC()
{
  sub_1000057D0();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "fillNextEntry: query_dir_next returned error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004C86C()
{
  sub_1000057D0();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "fillNextEntry: fillDirEntry for '.' returned error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004C8DC()
{
  sub_1000057D0();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "fillNextEntry: fillDirEntry for '..' returned error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004C94C()
{
  sub_1000057EC();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getEntriesInBuffer: entryIndex was reset to %llu\n", v0, 0xCu);
}

void sub_10004C9CC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "getEntriesInBuffer: resetCurrentIndex returned error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004CA3C()
{
  sub_1000057EC();
  __int16 v2 = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "getEntriesInBuffer: Cookie mismatch, _entryIndex: %llu, cookieIn: %llu", v1, 0x16u);
}

void sub_10004CAC8(uint64_t a1, uint64_t a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "getEntriesInBuffer: verifier mismatch: verifier: %llu, verifierIn: %llu\n", (uint8_t *)&v2, 0x16u);
}

void sub_10004CB54()
{
  sub_1000057A8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getEntriesInBuffer: ENUM_INIT -> ENUM_OPEN openEnumeration error: %d\n", v0, 8u);
}

void sub_10004CBD0()
{
  sub_1000057A8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getEntriesInBuffer: ENUM_EOF -> ENUM_OPEN openEnumeration error: %d\n", v0, 8u);
}

void sub_10004CC4C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getEntriesInBuffer: State: ENUM_EOF, just returning EOF\n", v0, 2u);
}

void sub_10004CC94(uint64_t a1)
{
  [*(id *)(a1 + 32) entryIndex];
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v1, "getEntriesInBuffer: entryIndex: %llu fillNextEntry error: %d\n", v2, v3, v4, v5, 0);
}

void sub_10004CD2C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getEntriesInBuffer: buffer too small for the very 1st entry\n", v0, 2u);
}

void sub_10004CD74(uint64_t a1, uint8_t *buf, int a3)
{
  int v3 = *(_DWORD *)(*(void *)a1 + 24);
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "pipeOpen: channel: %u, waitOnPipe error: %d\n", buf, 0xEu);
}

void sub_10004CDD4(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, a3, "pipeOpen: channel: %u, warning, pipe is already open\n", (uint8_t *)a1);
}

void sub_10004CE18()
{
  sub_10000A5BC();
  sub_10000A548(v1, v2, v3, v4, 1.5048e-36);
  sub_10000A614((void *)&_mh_execute_header, &_os_log_default, v5, "pipeWait: cannot wait, channel: %u pipe %@, sendPipeWait error: %d\n", v6);
}

void sub_10004CE64()
{
  sub_10000A5BC();
  sub_10000A548(v1, v2, v3, v4, 1.5048e-36);
  sub_10000A614((void *)&_mh_execute_header, &_os_log_default, v5, "pipeClose: channel: %u pipe %@, sendClose error: %d\n", v6);
}

void sub_10004CEB0()
{
  sub_10000A5BC();
  sub_10000A548(v1, v2, v3, v4, 1.5048e-36);
  sub_10000A614((void *)&_mh_execute_header, &_os_log_default, v5, "pipeTransceive: channel: %u pipe %@, sendPipeTransceive error: %d", v6);
}

void sub_10004CEFC(void *a1, uint64_t a2, int a3)
{
  sub_10000A5FC((uint64_t)a1, a2, a3, 1.5047e-36);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "pipeTransceive: channel: %u pipe %@ is not open", v4, 0x12u);
}

void sub_10004CF54()
{
  sub_10000A5BC();
  sub_10000A548(v1, v2, v3, v4, 1.5048e-36);
  sub_10000A614((void *)&_mh_execute_header, &_os_log_default, v5, "pipeWrite: channel: %u pipe %@, sendWrite error: %d", v6);
}

void sub_10004CFA0(void *a1, uint64_t a2, int a3)
{
  sub_10000A5FC((uint64_t)a1, a2, a3, 1.5047e-36);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "pipeWrite: channel: %u pipe %@ is not open", v4, 0x12u);
}

void sub_10004CFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D160(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "parseSearchCriteria: Setting LISearchObjModifiedAfter: %@\n", (uint8_t *)&v1, 0xCu);
}

void sub_10004D1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D3FC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doTreeConnect: (search) IPC$ sendTreeConnect error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D520()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doTreeDisconnect: (search) sendTreeDisconnect error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D590()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u, failed to alloc qstatusExResults object\n", v1, v2, v3, v4, v5);
}

void sub_10004D600()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u, no memory for pidmapper\n", v1, v2, v3, v4, v5);
}

void sub_10004D670(void *a1)
{
  [a1 qStatus];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v1, "procCheckIndexingEnabled: ch: %u, doQueryStatusExMessage QStatusEx: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_10004D6F0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u, doQueryStatusExMessage error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D760()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u, doQueryStatusMessage QStatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_10004D7D4()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u, doQueryStatusMessage error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D844()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u doSetBindings error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D8B4()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u doQueryMessage error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D924()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u doConnectMessage error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004D994()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u pipeOpen error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004DA04()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "procCheckIndexingEnabled: ch: %u, not connected to IPC$\n", v1, v2, v3, v4, v5);
}

void sub_10004DA74(void *a1)
{
  [a1 qStatus];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v1, "procPrimaryQuery: ch: %u, qExResult.qStatus: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_10004DAF4()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, doQueryStatusExMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004DB64()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, QStatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_10004DBD8()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, doQueryStatusMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004DC48()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, doSetBindings error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004DCB8()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, doQueryMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004DD28()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, pipeWait error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004DD98()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, doConnectMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004DE08()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procPrimaryQuery: ch: %u, pipeOpen error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004DE78(void *a1)
{
  [a1 qStatus];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v1, "procSecondaryQuery: ch:%u, qExResult.qStatus: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_10004DEF8()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, doQueryStatusExMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004DF68()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, QStatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_10004DFDC()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, doQueryStatusMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004E04C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, doSetBindings error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E0BC()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, doQueryMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004E12C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, pipeWait error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E19C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, doConnectMessage error: %d", v1, v2, v3, v4, v5);
}

void sub_10004E20C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "procSecondaryQuery: ch: %u, pipeOpen error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E27C()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %u, primary: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004E2F0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %u, primary: %u, failed to alloc wspConnectIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004E360()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %u, primary: %u, connectOut message is empty\n", v1, v2, v3, v4, v5);
}

void sub_10004E3D0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %u, primary: %u, no memory for connectOut object\n", v1, v2, v3, v4, v5);
}

void sub_10004E440(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  sub_10000A5D0();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v2, "doConnectMessage: ch: %u, primary: %u connectOut status: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_10004E4DC()
{
  sub_10000A528();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %u, primary: %u, connectOut decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E54C()
{
  sub_10000A528();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %u primary: %u, connectIn pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E5BC()
{
  sub_10000A528();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v0, "doConnectMessage: ch: %um primary: %u, failed to encode connectIn, error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E62C()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryMessage: ch: %u, primary: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004E6A0()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryMessage: ch: %u, primary: %u, no memory for wspQueryIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004E714()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryMessage: ch: %u, primary: %u, no memory for queryOut object\n", v1, v2, v3, v4, v5);
}

void sub_10004E784(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  sub_10000A5D0();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v2, "doQueryMessage: ch: %u, primary: %u, queryOut status: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_10004E820()
{
  sub_10000A528();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryMessage: ch: %u, primary: %u, queryOut decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E890()
{
  sub_10000A528();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryMessage: ch: %u, primary: %u, QueryIn pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E900()
{
  sub_10000A528();
  sub_10000A584((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryMessage: ch: %u, primary: %u, encodePrimaryQuery error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004E970()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusMessage: ch: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004E9E0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusMessage: ch: %u, no memory for wspQueryStatusIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004EA50()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusMessage: ch: %u, no memory for wspQueryStatusOut object\n", v1, v2, v3, v4, v5);
}

void sub_10004EAC0(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v2, "doQueryStatusMessage: ch: %u, wspQueryStatusOut status: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_10004EB50()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusMessage: ch: %u, wspQueryStatusOut decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004EBC0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusMessage: ch: %u, pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004EC30()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusMessage: ch: %u, encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004ECA0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusExMessage: ch: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004ED10()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusExMessage: ch: %u, no memory for wspQueryStatusExIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004ED80()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusExMessage: ch: %u, no memory for wspQueryStatusExOut object\n", v1, v2, v3, v4, v5);
}

void sub_10004EDF0(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v2, "doQueryStatusExMessage: ch: %u, wspQueryStatusExOut status: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_10004EE80()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusExMessage: ch: %u, wspQueryStatusExOut decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004EEF0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusExMessage: ch: %u, pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004EF60()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doQueryStatusExMessage: encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004EFD0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doSetBindings: ch: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004F040()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doSetBindings: ch: %u, no memory for wspSetBindingsIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004F0B0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doSetBindings: ch: %u, no memory for whdr obj\n", v1, v2, v3, v4, v5);
}

void sub_10004F120(void *a1)
{
  [a1 status];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v1, "doSetBindings: ch: %u, CPMSetBindings status: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_10004F1A0(void *a1)
{
  [a1 msgid];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v1, "doSetBindings: ch: %u, expected CPMSetBindingsOut, got: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_10004F220()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doSetBindings: ch: %u, WSP reply decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F290()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doSetBindings: ch: %u, pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F300()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doSetBindings: ch: %u,encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F370()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doFreeCursor: ch: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004F3E0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doFreeCursor: ch: %u, no memory for wspSetBindingsIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004F450()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doFreeCursor: ch: %u, no memory for wspFreeCursorOut obj\n", v1, v2, v3, v4, v5);
}

void sub_10004F4C0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doFreeCursor: ch: %u, wspFreeCursorOut decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F530()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doFreeCursor: ch: %u, pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F5A0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doFreeCursor: ch: %u, encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F610()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doDisconnect: ch: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004F680()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doDisconnect: ch: %u, no memory for wspSetBindingsIn object\n", v1, v2, v3, v4, v5);
}

void sub_10004F6F0()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doDisconnect: ch: %u, pipeWrite error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F760()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doDisconnect: ch: %u, encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004F7D0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doGetRows: ch: %u, failed to alloc reqData\n", v1, v2, v3, v4, v5);
}

void sub_10004F840()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "doGetRows: ch: %u, no memory for wspGetRows object\n", v1, v2, v3, v4, v5);
}

void sub_10004F8B0()
{
  sub_1000057A8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "doGetRows: ch: %u, No rows were received, so quitting\n", v0, 8u);
}

void sub_10004F92C(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  sub_10000A510();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "doGetRows: ch: %u, non-critical whdr status : 0x%x\n", v2, 0xEu);
}

void sub_10004F9C8(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  sub_10000A510();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v2, "doGetRows: ch: %u, wspHdr status: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_10004FA58()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doGetRows: ch: %u, getRowsOut decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004FAC8()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doGetRows: ch: %u, pipeTransceive error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004FB38()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "doGetRows: ch: %u: encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10004FBA8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeOpen: (search) invalid channel: %u\n", v1, v2, v3, v4, v5);
}

void sub_10004FC18()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeWait: (search) channel: %u, IPC$ not connected\n", v1, v2, v3, v4, v5);
}

void sub_10004FC88()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeWait: (search) invalid channel: %u\n", v1, v2, v3, v4, v5);
}

void sub_10004FCF8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeTransceive: (search) channel: %u, IPC$ not connected\n", v1, v2, v3, v4, v5);
}

void sub_10004FD68()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeTransceive: (search) invalid channel: %u\n", v1, v2, v3, v4, v5);
}

void sub_10004FDD8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeWrite: (search) channel: %u, IPC$ not connected\n", v1, v2, v3, v4, v5);
}

void sub_10004FE48()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeWrite: (search) invalid channel: %u\n", v1, v2, v3, v4, v5);
}

void sub_10004FEB8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeClose: (search) channel: %u, IPC$ not connected\n", v1, v2, v3, v4, v5);
}

void sub_10004FF28()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "pipeClose: (search) invalid channel: %u\n", v1, v2, v3, v4, v5);
}

void sub_10004FF98(float *a1, int a2, _DWORD *a3)
{
  sub_10000A5F0(a1, a2, a3, 1.5047e-36);
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, v3, "parseSearchResults: row: %u, no Path property found\n", v4);
}

void sub_10004FFD8(float *a1, int a2, _DWORD *a3)
{
  sub_10000A5F0(a1, a2, a3, 1.5047e-36);
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, v3, "parseSearchResults: row: %u, Path property nil strValue\n", v4);
}

void sub_100050018(float *a1, int a2, _DWORD *a3)
{
  sub_10000A5F0(a1, a2, a3, 1.5047e-36);
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, v3, "parseSearchResults: row: %u, no SystemFileAttributes property found\n", v4);
}

void sub_100050058(float *a1, int a2, _DWORD *a3)
{
  sub_10000A5F0(a1, a2, a3, 1.5047e-36);
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, v3, "parseSearchResults: row: %u, no SystemDateModified property found\n", v4);
}

void sub_100050098(float *a1, int a2, _DWORD *a3)
{
  sub_10000A5F0(a1, a2, a3, 1.5047e-36);
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, v3, "parseSearchResults: row: %u, no SystemDateAccessed property found\n", v4);
}

void sub_1000500D8(float *a1, int a2, _DWORD *a3)
{
  sub_10000A5F0(a1, a2, a3, 1.5047e-36);
  sub_10000A4F8((void *)&_mh_execute_header, &_os_log_default, v3, "parseSearchResults: row: %u, no memory for searchResultItem\n", v4);
}

void sub_100050118(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "ReturnTypes: 0x%x\n", (uint8_t *)v2, 8u);
}

void sub_10005019C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "SearchToken: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_100050220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005025C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100050298()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: queryShareRootSync error: %d\n", v1, v2, v3, v4, v5);
}

void sub_100050308(void *a1)
{
  uint64_t v1 = [a1 shareName];
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "Share %{public}@ doesn't support Named Streams, mounting Read-only", v3);
}

void sub_100050394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005041C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100050494()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: sendQueryShare error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_100050508()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: getPeerAddress error: %u\n", v1, v2, v3, v4, v5);
}

void sub_100050578()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: sendTreeConnect error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_1000505EC()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: sendSessionSetup error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_100050660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005069C()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: unable to obtain credentials, NSError: %@", v1);
}

void sub_100050710()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "connectToServer: sendNegotiate error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_100050784(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002BFE4() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "disconnectFromServer: disconnecting from server: %@, share: %@", v4);
}

void sub_100050824(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002BFE4() shareName];
  sub_10002BD5C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v3, "disconnectFromServer: server: %@, share: %@ is already disconnected", v4, v5, v6, v7, v8);
}

void sub_1000508C0(id *a1)
{
  [*a1 shareName];
  objc_claimAutoreleasedReturnValue();
  sub_10002C18C();
  int v3 = 136315650;
  uint64_t v4 = "-[smbMount tryCreateRootNode]_block_invoke";
  sub_10002BE68();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "%s: share: %@, connection state: %u, just returning", (uint8_t *)&v3);
}

void sub_100050970(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) shareName];
  v4[0] = 136315394;
  sub_10002C0D0();
  uint64_t v5 = v2;
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "%s: share: %@, unexpected state, ACTIVE connection without a root node", (uint8_t *)v4);
}

void sub_100050A0C(id *a1)
{
  [*a1 shareName];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  int v3 = 136315650;
  uint64_t v4 = "-[smbMount tryCreateRootNode]_block_invoke";
  sub_10002BE68();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "%s: share: %@, connnect error: %d, staying IDLE", (uint8_t *)&v3);
}

void sub_100050AB0(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C180() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "checkServerConnection: successfully connected to server: %@, share: %@", v4);
}

void sub_100050B50()
{
  sub_10002BD74();
  [*v2 serverName];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_10002C0C4() shareName];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  int v4 = 138412802;
  uint64_t v5 = v1;
  sub_10002BE68();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "checkServerConnection: Fatal error so ejecting server: %@, share: %@ error: %d ", (uint8_t *)&v4);
}

void sub_100050C04()
{
  sub_10002BD74();
  [*v2 serverName];
  objc_claimAutoreleasedReturnValue();
  [(id)sub_10002C0C4() shareName];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  int v4 = 138412802;
  uint64_t v5 = v1;
  sub_10002BE68();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "checkServerConnection: Non fatal error on server: %@, share: %@, error: %d", (uint8_t *)&v4);
}

void sub_100050CB8(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C180() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "checkServerConnection: Ejecting server: %@, share: %@ so stay disconnected", v4);
}

void sub_100050D58(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint8_t v8 = [(id)sub_10002BFE4() shareName];
  [a1 connState];
  sub_10002C144((void *)&_mh_execute_header, &_os_log_default, v3, "idleTimerFired: server: %@, share: %@, nothing to do in state: 0x%x", v4, v5, v6, v7, 2u);
}

void sub_100050E20(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002BFE4() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "idleTimerFired: entering idle-disconnect, server: %@ share: %@", v4);
}

void sub_100050EC0(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10002BFE4() shareName];
  [a1 pendingChangeNotifyCount];
  sub_10002C028();
  sub_10002C128((void *)&_mh_execute_header, &_os_log_default, v4, "idleTimerFired: server: %@ share: %@ is busy, pendingChangeNotifyCount: %llu", v5, v6, v7, v8, v9);
}

void sub_100050F6C(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10002BFE4() shareName];
  [a1 openFileCounter];
  sub_10002C028();
  sub_10002C128((void *)&_mh_execute_header, &_os_log_default, v4, "idleTimerFired: server: %@ share: %@ is busy, openFileRefs: %llu", v5, v6, v7, v8, v9);
}

void sub_100051018(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002BFE4() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "idleTimerFired: lazy attempt to create root node for server: %@ share: %@ ", v4);
}

void sub_1000510B8(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002BFE4() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "idleTimerFired: Changing back to IDLE state for server: %@ share: %@", v4);
}

void sub_100051158()
{
  sub_10002BD74();
  [*v2 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10002C0C4() shareName];
  [*v0 openFileCounter];
  sub_10002BF8C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "decreaseOpenFileCount: server: %@, share: %@, openFileCounter underrun, delta: %llu, openFileCounter: %llu", v4, 0x2Au);
}

void sub_100051218()
{
  sub_10002BD74();
  [*v2 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10002C0C4() shareName];
  [*v0 pendingChangeNotifyCount];
  sub_10002BF8C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "decreaseChangeNotifyCount: server: %@, share: %@, changeNotifyCount underrun, delta: %llu, changeNotifyCount: %llu", v4, 0x2Au);
}

void sub_1000512D8(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C180() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "disconnect: set DISCONNECT_REQUESTED flag on server: %@, share: %@", v4);
}

void sub_100051378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000513B4()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "invalidateFileNodesForConnection: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100051404()
{
  sub_10002BD74();
  uint64_t v2 = [v1 serverName];
  uint64_t v3 = [v0 shareName];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v4, "rootFileHandleForClient: server: %@, share: %@, checkServerConnection returned error: %d", v5);
}

void sub_1000514B0(void *a1)
{
  [a1 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002BFE4() shareName];
  sub_10002BD5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v3, "rootFileHandleForClient: calling checkServerConnection to get root node for server: %@, share: %@", v4);
}

void sub_100051550(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LILookup name: %s, nil or zero-length directory tp handle", v3);
}

void sub_100051590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000515CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100051608(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LILookup: Unable to find parent node for name: %s\n", v3);
}

void sub_100051648()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LILookup: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100051698()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 64)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LILookup: dnp: %@, name: %@, node hit, fetchAttrDataWithCompletionHandler error: %d\n", v3);
}

void sub_100051738(uint64_t a1, int a2)
{
  uint64_t v4 = [(id)sub_10002BD50(*(void *)(a1 + 72)) name];
  uint64_t v5 = *(void *)(a1 + 32);
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 1024;
  int v12 = a2;
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LILookup: queryNameInParent for dnp: %@, filename: %@, returned error: %d", (uint8_t *)&v7);
}

void sub_100051800(uint64_t *a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*a1) name];
  sub_10002BF5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LILookup: initWithName failed for dnp: %@, filename: %@\n", v3);
}

void sub_1000518A0(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v1, "LILookup: readReparseSymlink name: %s error: %d\n", v2, v3, v4, v5, v6);
}

void sub_100051928(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v1, "LILookup: checkForWindowsSymlink name: %s error: %d\n", v2, v3, v4, v5, v6);
}

void sub_1000519B0()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "getAttr: server: %@ share:%@, checkServerConnection error: %d", v7);
}

void sub_100051A00(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(a1 + 48)) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "getFileAttributes: np: %@, fetchAttrData error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100051A94()
{
  sub_10002BE5C();
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v0, "LIOpen: Node not found for file handle: %@\n", v1);
}

void sub_100051B08()
{
  sub_10002BE5C();
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v0, "LIOpen: stale file handle: %@\n", v1);
}

void sub_100051B7C()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIOpen: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100051BCC(uint64_t *a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*a1) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "LIOpen: openFileNode %@ returned error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100051C60()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIClose: Node not found for file handle: %@\n", v1);
}

void sub_100051CD4()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIClose: Stale file handle: %@\n", v1);
}

void sub_100051D48()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "LIClose: np: %@, file not open for file handle %@", v5);
}

void sub_100051D94()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIClose: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100051DE4(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIReclaim: Node not found for file handle: %s\n", v3);
}

void sub_100051E24()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIReclaim: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100051E74(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIReadDir: dnp for handle: %s not found\n", v3);
}

void sub_100051EB4(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIReadDir: dnp stale handle: %s\n", v3);
}

void sub_100051EF4(uint64_t a1, int *a2, uint64_t a3, void *a4)
{
  sub_10002C0F8(a1, a3, *a2, 4.8151e-34);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LIReadDir: Unable to get a dirEnumerator from dnp: %s, error: %d", v5, 0x12u);
}

void sub_100051F50()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIReadDir: Called on a non-directory node: %s", v4);
}

void sub_100051F9C()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIReadDir: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100051FEC()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(v0 + 56)) name];
  sub_10002BFB8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LIReadDir: getEntriesInBuffer for dnp: %@, cookieIn: %llu, verifierIn: %llu returned error: %d\n", v2, 0x26u);
}

void sub_100052098()
{
  sub_10002C1A4(__stack_chk_guard);
  sub_10002BF44();
  sub_10002C078((void *)&_mh_execute_header, &_os_log_default, v0, "LIReadDir(1) getEntriesInBuffer returned %lu bytes with err: %d\n", v1, v2, v3, v4, v5);
}

void sub_100052108()
{
  sub_10002BE5C();
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v0, "LIReadDirAndAttrs: dnp for handle: %@ not found", v1);
}

void sub_10005217C()
{
  sub_10002BE5C();
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v0, "LIReadDirAndAttrs: dnp stale handle: %@", v1);
}

void sub_1000521F0()
{
  sub_10002C0B8();
  sub_10002C0F8(v2, v3, *v1, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LIReadDirAndAttrs: Unable to get a dirEnumerator from dnp: %@, error: %d", v4, 0x12u);
}

void sub_100052248()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIReadDirAndAttrs: Called on a non-directory node: %@", v4);
}

void sub_100052294()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIReadDirAndAttrs: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_1000522E4()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(v0 + 56)) name];
  sub_10002BFB8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LIReadDirAndAttrs: dnp: %@, cookieIn: %llu, verifierIn: %llu returned getEntriesInBuffer error: %d", v2, 0x26u);
}

void sub_100052390()
{
  sub_10002C1A4(__stack_chk_guard);
  sub_10002BF44();
  sub_10002C078((void *)&_mh_execute_header, &_os_log_default, v0, "LIReadDirAndAttrs getEntriesInBuffer returned %lu bytes with err: %d", v1, v2, v3, v4, v5);
}

void sub_100052400(uint64_t a1, uint64_t a2)
{
  sub_10002BE84(a1, a2, 3.8521e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: inAddr size: %lu smaller than LiFileAttributes_t size: %lu", v3);
}

void sub_100052440(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: Directory not found for new file: %s:", v3);
}

void sub_100052480(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: Stale directory handle: %s:", v3);
}

void sub_1000524C0()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "LICreate: dnp: %@, file: %@ already exists", v5);
}

void sub_10005250C()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LICreate: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_10005255C(uint64_t *a1)
{
  [(id)sub_10002BD50(*a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C18C();
  sub_10002BF5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: initWithName failed for dnp: %@, filename: %@", v3);
}

void sub_1000525F4(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(a1 + 64)) name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: Failed to create new file %@ in dnp: %@, error: %d", v3);
}

void sub_100052698()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: failed to set attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_100052738()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: failed to fetch parent directory attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_1000527D8()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LICreate: failed to fetch new file attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_100052878(uint64_t a1, uint64_t a2)
{
  sub_10002BE84(a1, a2, 3.8521e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: inAddr size: %lu smaller than LiFileAttributes_t size: %lu\n", v3);
}

void sub_1000528B8(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: Parent directory not found for: %s:\n", v3);
}

void sub_1000528F8(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: Stale parent directory handle %s\n", v3);
}

void sub_100052938()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "LIMakeDir: dnp: %@, directory: %@ already exists\n", v5);
}

void sub_100052984()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIMakeDir: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_1000529D4(uint64_t *a1)
{
  [(id)sub_10002BD50(*a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C18C();
  sub_10002BF5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: initWithName failed for dnp: %@, name: %@\n", v3);
}

void sub_100052A6C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(a1 + 64)) name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: Failed to create new directory %@ in dnp: %@, error: %d\n", v3);
}

void sub_100052B10()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: failed to set attributes for dnp: %@, new filename: %@, error: %d\n", v3);
}

void sub_100052BB0()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: failed to fetch parent directory attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_100052C50()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 64)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeDir: failed to fetch new dir attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_100052CF0()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIGetFsAttr: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100052D40(uint64_t a1, uint64_t a2)
{
  sub_10002BE84(a1, a2, 3.8521e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: inAddr size: %lu smaller than LiFileAttributes_t size: %lu\n", v3);
}

void sub_100052D80(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: Directory not found for new symlink: %s:\n", v3);
}

void sub_100052DC0(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: Stale directory handle: %s\n", v3);
}

void sub_100052E00()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "LIMakeSymLink: dnp: %@, node: %@ already exists\n", v5);
}

void sub_100052E4C()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIMakeSymLink: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100052E9C(uint64_t *a1)
{
  [(id)sub_10002BD50(*a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C18C();
  sub_10002BF5C();
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: initWithName failed for dnp: %@, filename: %@\n", v3);
}

void sub_100052F34()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 80)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: dnp: %@, contents: %@, createSymlink error: %d\n", v3);
}

void sub_100052FD4()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: failed to set attributes for dnp: %@, new symlink: %@, error: %d\n", v3);
}

void sub_100053074()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: failed to fetch parent directory attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_100053114()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIMakeSymLink: failed to fetch new symlink attributes for dnp: %@, np: %@, error: %d\n", v3);
}

void sub_1000531B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000531F0()
{
  sub_10002BD74();
  uint64_t v2 = [v1 serverName];
  uint64_t v3 = [v0 shareName];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v4, "LIPathConf: server: %@, share: %@, checkServerConnection error: %d", v5);
}

void sub_10005329C()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIRead: No fileRef found for FREAD, np: %@\n", v4);
}

void sub_1000532E8()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIRead: fileRef with nil fidCtx, np: %s\n", v4);
}

void sub_100053334()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIRead: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100053384()
{
  sub_10002BD74();
  uint64_t v1 = [*(id *)(v0 + 32) name];
  sub_10002BEA0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LIRead: np: %@, pass: %llu thisRead: %llu thisOff: %llu, bytesRemain: %llu error: %d, ntstatus: 0x%x\n", v2, 0x40u);
}

void sub_100053438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[smbMount readFrom:atOffset:intoBuffer:requestID:reply:]";
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Error mapping buffer", (uint8_t *)&v3);
}

void sub_1000534B8()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIRead: no memory for bData object, lengthRequested: %ld\n", v1);
}

void sub_10005352C(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIReadLink: Node not found for handle: %s\n", v3);
}

void sub_10005356C(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIReadLink: Stale file handle: %s\n", v3);
}

void sub_1000535AC()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v3, "LIReadLink: warning, np: %s does not appear to be a symlink\n", v4);
}

void sub_1000535F8()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIReadLink: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100053648(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(a1 + 48)) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "LIReadLink: np: %@, readSymlink error: %d", v3, v4, v5, v6, v7);
}

void sub_1000536DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053718()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIRemove: Directory node for name: %@ not found", v1);
}

void sub_10005378C()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIRemove: Stale directory handle: %@", v1);
}

void sub_100053800()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIRemove: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100053850()
{
  sub_10002BF44();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v0, "LIRemove: name: %@, smb_delete_name_in_parent error: %d", v1, v2, v3, v4, v5);
}

void sub_1000538C4()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIRemove: dnp: %@, name: %@, parent dir getAttrData error: %d", v3);
}

void sub_100053964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000539A0(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIRemove: Directory node for name: %s not found\n", v3);
}

void sub_1000539E0(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "LIRemoveDir: Stale parent directory handle: %s\n", v3);
}

void sub_100053A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053A5C()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIRemoveDir: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100053AAC()
{
  sub_10002C06C(__stack_chk_guard);
  sub_10002BF44();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v0, "LIRemoveDir: name: %@, smb_delete_name_in_parent returned an error: %d", v1, v2, v3, v4, v5);
}

void sub_100053B1C()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LIRemoveDir: dnp: %@, name: %@, parent dir getAttrData error: %d", v3);
}

void sub_100053BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, a3, "%s: rename flags: 0x%x not supported, returning ENOTSUP", a5, a6, a7, a8, 2u);
}

void sub_100053C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053CF8()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIRename: No existing node for fromName: %@ in node table\n", v1);
}

void sub_100053D6C()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIRename: Found frm_np: %@ in node table\n", v4);
}

void sub_100053DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053E30()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIRename: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100053E80()
{
  sub_10002BD74();
  uint64_t v3 = [(id)sub_10002BD50(*(void *)(v2 + 56)) name];
  [(id)sub_10002BD50(*(void *)(v0 + 64)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C160();
  sub_10002BDA0();
  sub_10002C00C((void *)&_mh_execute_header, &_os_log_default, v4, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, frm_dnp getAttrData error: %d\n", v5, v6, v7, v8, v9);
}

void sub_100053F40()
{
  sub_10002BD74();
  uint64_t v3 = [(id)sub_10002BD50(*(void *)(v2 + 56)) name];
  [(id)sub_10002BD50(*(void *)(v0 + 64)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C160();
  sub_10002BDA0();
  sub_10002C00C((void *)&_mh_execute_header, &_os_log_default, v4, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, to_dnp getAttrData error: %d\n", v5, v6, v7, v8, v9);
}

void sub_100054000()
{
  sub_10002BD74();
  uint64_t v3 = [(id)sub_10002BD50(*(void *)(v2 + 64)) name];
  [(id)sub_10002BD50(*(void *)(v0 + 72)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C160();
  sub_10002BDA0();
  sub_10002C00C((void *)&_mh_execute_header, &_os_log_default, v4, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, renameOverExistingDir error: %d", v5, v6, v7, v8, v9);
}

void sub_1000540C0()
{
  sub_10002BD74();
  uint64_t v3 = [(id)sub_10002BD50(*(void *)(v2 + 64)) name];
  [(id)sub_10002BD50(*(void *)(v0 + 72)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C160();
  sub_10002BDA0();
  sub_10002C00C((void *)&_mh_execute_header, &_os_log_default, v4, "LIRename: frm_dnp: %@ frm_np: %@, to_dnp: %@ toName: %@, renameOverExistingFile error: %d", v5, v6, v7, v8, v9);
}

void sub_100054180(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)a3 = 136315394;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(void *)(a3 + 14) = v5;
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, a3, "LiSetAttr: np: %s, one or more attr not allowed to be set, validmask: 0x%llx\n", (uint8_t *)a3);
}

void sub_1000541E8(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setAttrInternalLocked: np: %@, setBasicInfo error: %d\n", v3, v4, v5, v6, 2u);
}

void sub_100054288(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "LiSetAttr: np: %@, smb_set_eof error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100054314(uint64_t a1, uint64_t a2)
{
  sub_10002BE84(a1, a2, 3.8521e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v2, "LISetAttr: inAddr size: %lu smaller than LiFileAttributes_t size: %lu\n", v3);
}

void sub_100054354()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LISetAttr: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_1000543A4(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(a1 + 56)) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "LISetAttr:  np: %@ getAttrData error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100054438()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIStatFS: server: %@, share: %@, checkServerConnection  error: %d", v7);
}

void sub_100054488()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "smb_statfs returned an error: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000544F8()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIWrite: Node not found for handle: %@\n", v1);
}

void sub_10005456C()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LIWrite: Stale file handle: %@\n", v1);
}

void sub_1000545E0()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIWrite: No fileRef for FWRITE, np: %@\n", v4);
}

void sub_10005462C()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LIWrite: fileRef with nil fidCtx, np: %s\n", v4);
}

void sub_100054678()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIWrite: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_1000546C8()
{
  sub_10002BD74();
  uint64_t v1 = [*(id *)(v0 + 32) name];
  sub_10002BEA0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "writeRequest: np: %@, pass: %llu thisWrite: %llu thisOff: %llu, bytesRemain: %llu error: %d, ntstatus: 0x%x", v2, 0x40u);
}

void sub_10005477C(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIGetXattr: Node not found for file handle: %s\n", v3);
}

void sub_1000547BC(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIGetXattr: stale file handle: %s\n", v3);
}

void sub_1000547FC()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIGetXattr: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_10005484C()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(v0 + 72)) name];
  sub_10002BCA8();
  sub_10002C144((void *)&_mh_execute_header, &_os_log_default, v2, "LIGetXattr: np: %@, for stream: %@ info, queryNodeStream error: %d", v3, v4, v5, v6, v7);
}

void sub_1000548EC()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(v0 + 72)) name];
  sub_10002C110();
  __int16 v4 = 2048;
  uint64_t v5 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LIGetXattr: np: %@, stream: %@, no memory for buffer of stream_size: %llu\n", v3, 0x20u);
}

void sub_1000549B0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LIGetXattr: readNodeStream error: %d", v1, v2, v3, v4, v5);
}

void sub_100054A20()
{
  sub_10002BE5C();
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v0, "LISetXattr: Node not found for file handle: %@", v1);
}

void sub_100054A94()
{
  sub_10002BE5C();
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v0, "LISetXattr: stale file handle: %@", v1);
}

void sub_100054B08()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LISetXattr: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100054B58()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v2 + 64)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002C110();
  __int16 v5 = 1024;
  int v6 = v3;
  __int16 v7 = 1024;
  int v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LISetXattr: np: %@ stream: %@, how: %u, writeNodeStream error: %d\n", v4, 0x22u);
}

void sub_100054C18()
{
  sub_10002BD74();
  [(id)sub_10002BD50(*(void *)(v1 + 56)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BEE4();
  sub_10002BCA8();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v2, "LISetXattr: np: %@ stream: %@, deleteNodeStream error: %d\n", v3);
}

void sub_100054CB8(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIListXattrs: Node not found for file handle: %s\n", v3);
}

void sub_100054CF8(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LIListXattrs: stale file handle: %s\n", v3);
}

void sub_100054D38()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIListXattrs: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100054D88()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LIListXattrs: listNodeStreams error: %d", v1, v2, v3, v4, v5);
}

void sub_100054DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054E34(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LISearch: Node not found for file handle: %s", v3);
}

void sub_100054E74(uint64_t a1, uint64_t a2)
{
  sub_10002BDEC(a1, a2, 4.8149e-34);
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, v2, "LISearch: stale file handle: %s", v3);
}

void sub_100054EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005501C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055094()
{
  sub_1000057A8();
  sub_10002BFF0((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: calling LISearchTokenDone(%d)", v1, v2, v3, v4, v5);
}

void sub_100055104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005517C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000551B8(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LISearch: searchCtx.searchRows was nil for this pass", buf, 2u);
}

void sub_1000551FC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch doGetRows error: %d", v1, v2, v3, v4, v5);
}

void sub_10005526C(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LISearch: procSecondaryQuery cRowsTotal: %u, cResultsFound: %u", buf, 0xEu);
}

void sub_1000552C4()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: procSecondaryQuery error: %d", v1, v2, v3, v4, v5);
}

void sub_100055334()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: procPrimaryQuery error: %d", v1, v2, v3, v4, v5);
}

void sub_1000553A4()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: procCheckIndexingEnabled error: %d", v1, v2, v3, v4, v5);
}

void sub_100055414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055450()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: doTreeConnect error: %d", v1, v2, v3, v4, v5);
}

void sub_1000554C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000554FC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: gethostname(3) error: %d", v1, v2, v3, v4, v5);
}

void sub_10005556C()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BF74((void *)&_mh_execute_header, &_os_log_default, v4, "Search path for np: %@ is %@", v5);
}

void sub_1000555B8()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "LISearch: failed to create searchPath for np: %@", v4);
}

void sub_100055604()
{
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v0, "LISearch: searchToken: %@ already in use", v1);
}

void sub_100055678()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LISearch: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_1000556C8()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "LIAccessCheck: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100055718()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessReadData denied", v3, v4, v5, v6, v7);
}

void sub_1000557B4()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessWriteData denied", v3, v4, v5, v6, v7);
}

void sub_100055850()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessExecute denied", v3, v4, v5, v6, v7);
}

void sub_1000558EC()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessDelete denied", v3, v4, v5, v6, v7);
}

void sub_100055988()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessAppendData denied", v3, v4, v5, v6, v7);
}

void sub_100055A24()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessDeleteChild denied", v3, v4, v5, v6, v7);
}

void sub_100055AC0()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessReadAttributes denied", v3, v4, v5, v6, v7);
}

void sub_100055B5C()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessWriteAttributes denied", v3, v4, v5, v6, v7);
}

void sub_100055BF8()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessReadExtAttributes denied", v3, v4, v5, v6, v7);
}

void sub_100055C94()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessWriteExtAttributes denied", v3, v4, v5, v6, v7);
}

void sub_100055D30()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessReadSecurity denied", v3, v4, v5, v6, v7);
}

void sub_100055DCC()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessWriteSecurity denied", v3, v4, v5, v6, v7);
}

void sub_100055E68()
{
  sub_10002BF38();
  [(id)sub_10002BD50(*(void *)(v1 + 48)) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002BF0C();
  sub_10002BCDC();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "LiAccessCheck: np: %@, access: 0x%x, maxAccess: 0x%x, LIAccessTakeOwnership denied", v3, v4, v5, v6, v7);
}

void sub_100055F04(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002BD50(*(void *)(a1 + 40)) name];
  sub_10002BE10();
  sub_10002C078((void *)&_mh_execute_header, &_os_log_default, v2, "LIAccessCheck: np: %@, queryMaxAccess error: %d", v3, v4, v5, v6, v7);
}

void sub_100055F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100055FD4()
{
  sub_10002BCCC();
  sub_10002BC84(v2, v3, v4, v5, 5.7781e-34);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "setUpdateInterest: server: %@, share: %@, checkServerConnection error: %d", v7);
}

void sub_100056024()
{
  sub_10002C06C(__stack_chk_guard);
  sub_10002C16C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v0, "%s: np: %@ addChangeNotify worked \n", v1, v2, v3, v4, 2u);
}

void sub_1000560A0()
{
  sub_10002C06C(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10002BF18();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v0, "%s: np: %@ addChangeNotify error: %d \n", (uint8_t *)v1);
}

void sub_100056120()
{
  sub_10002C06C(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10002BF18();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v0, "%s: np: %@ Change Notify error: %d \n", (uint8_t *)v1);
}

void sub_1000561A0()
{
  sub_10002C06C(__stack_chk_guard);
  sub_10002C128((void *)&_mh_execute_header, &_os_log_default, v0, "%s: np: %@ addChangeNotify worked item %@\n", v1, v2, v3, v4, 2u);
}

void sub_10005623C()
{
  sub_10002C06C(__stack_chk_guard);
  sub_10002C16C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v0, "%s: np: %@ clearChangeNotify worked \n", v1, v2, v3, v4, 2u);
}

void sub_1000562B8()
{
  sub_10002C06C(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10002BF18();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v0, "%s: np: %@ clearChangeNotify error: %d \n", (uint8_t *)v1);
}

void sub_100056338(int *a1, id *a2)
{
  int v3 = *a1;
  [*a2 serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_10002C180() shareName];
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 2112;
  int v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v5, "SetShutDownReason: set shutdownReason to 0x%x on server: %@, share: %@", (uint8_t *)v6);
}

void sub_100056400()
{
  sub_1000057A8();
  sub_10002BFF0((void *)&_mh_execute_header, &_os_log_default, v0, "submitRequestBlock: In state 0x%x, returning EIO early", v1, v2, v3, v4, v5);
}

void sub_100056470()
{
  sub_10000A56C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "submitRequestBlock: request cancelled by %u state (allow retries: %d)\n", v0, 0xEu);
}

void sub_1000564F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056568()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "submitRequestBlock: connection error: %d, retrying after reconnect (allow retries: %d)\n", v1, v2, v3, v4, v5);
}

void sub_1000565DC()
{
  sub_1000057A8();
  sub_10002BFF0((void *)&_mh_execute_header, &_os_log_default, v0, "requestDisconnect: ignored in %u state", v1, v2, v3, v4, v5);
}

void sub_10005664C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000566C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005673C()
{
  sub_10002BD74();
  [*v0 openFileCounter];
  [(id)sub_10002C0C4() pendingChangeNotifyCount];
  sub_10002C144((void *)&_mh_execute_header, &_os_log_default, v1, "notifyConnectionLost: Entering INRECONNECT with openFiles: %llu, pendingChangeNotify: %llu, state: 0x%x", v2, v3, v4, v5, 0);
}

void sub_1000567EC()
{
  sub_10002BCCC();
  sub_10002BD80(v2, v3, v4, v5, 1.5048e-36);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "reconnectSession: reconnect failed with error: %d, ejecting server: %@, share: %@ \n", v7);
}

void sub_10005683C()
{
  sub_10002BCCC();
  sub_10002BD80(v2, v3, v4, v5, 1.5048e-36);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "reconnectSession: reconnect cycle failed, now disconnecting state: %u on server: %@, share: %@ \n", v7);
}

void sub_10005688C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: SMBPiston init failed on server: %@, share: %@ \n", v6);
}

void sub_1000568DC()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: no memory for modelName and/or tmpFSName on server: %@, share: %@ \n", v6);
}

void sub_10005692C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: Reconnect succeeded, resuming new session on server: %@, share: %@ ", v6);
}

void sub_10005697C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: lost connection during reconnect, flush and starting new reconnect cycle on server: %@, share: %@ ", v6);
}

void sub_1000569CC()
{
  sub_10002BCCC();
  sub_10002BD80(v2, v3, v4, v5, 1.5048e-36);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "reconnectSession: reconnect canceled by state: %u on server: %@, share: %@ \n", v7);
}

void sub_100056A1C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BF74((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: Reopening fileRefs on server: %@, share: %@ \n", v6);
}

void sub_100056A6C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BF74((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: Preparing fileRefs for reconnect on server: %@, share: %@ \n", v6);
}

void sub_100056ABC()
{
  sub_10002BCCC();
  sub_10002BD80(v2, v3, v4, v5, 1.5048e-36);
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v6, "reconnectSession: session reconnected, passes: %u on server: %@, share: %@ \n", v7);
}

void sub_100056B0C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: disconnecting, unable to obtain credentials on server: %@, share: %@ \n", v6);
}

void sub_100056B5C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "reconnectSession: Starting reconnect on server: %@, share: %@", v6);
}

void sub_100056BAC(uint64_t *a1, id *a2)
{
  id v3 = [(id)sub_10002BD50(*a1) name];
  id v4 = [v3 UTF8String];
  uint64_t v5 = [*a2 serverName];
  uint64_t v6 = [*a2 shareName];
  int v7 = 136315650;
  id v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  int v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: lost connection while reopening files for np: %s on server: %@, share: %@ \n", (uint8_t *)&v7, 0x20u);
}

void sub_100056CA4()
{
  sub_10002BD74();
  [*(id *)(v1 + 40) serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() shareName];
  sub_10002C0D0();
  sub_10002C00C((void *)&_mh_execute_header, &_os_log_default, v3, "%s: np: %@ reopen Change Notify error: %d on server: %@, share: %@ \n", v4, v5, v6, v7, 2u);
}

void sub_100056D78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) serverName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10002C0A0() shareName];
  v6[0] = 136315906;
  sub_10002C0D0();
  uint64_t v7 = v2;
  __int16 v8 = v4;
  __int16 v9 = v1;
  __int16 v10 = v4;
  uint64_t v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: np: %@ addChangeNotify worked on server: %@, share: %@ \n", (uint8_t *)v6, 0x2Au);
}

void sub_100056E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100056E88()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "flushAndDisconnect: resume idle timer on server: %@ share: %@", v6);
}

void sub_100056ED8()
{
  sub_10002BD74();
  *(_DWORD *)uint64_t v2 = 138412802;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(void *)(v2 + 14) = v4;
  *(_WORD *)(v2 + 22) = 2112;
  *(void *)(v2 + 24) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "flushAndDisconnect: server: %@ share:%@ ejectVolumeForURL returned error %@", v6, 0x20u);
}

void sub_100056F4C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "flushAndDisconnect: ejecting server: %@ share: %@", v6);
}

void sub_100056F9C()
{
  sub_10002BCCC();
  sub_10002BD38(v2, v3, v4, 5.778e-34);
  sub_10002BF74((void *)&_mh_execute_header, &_os_log_default, v5, "flushAndDisconnect: starting. server: %@ share: %@ \n", v6);
}

void sub_100056FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100057064(uint64_t a1)
{
  [(id)sub_10002C0AC(a1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C0A0() name];
  sub_10002BD5C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingDir: to_dnp: %@ to_np: %@, deleteNameInParent success", v4, v5, v6, v7, v8);
}

void sub_100057100()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingDir: to_dnp: %@ to_np: %@, deleteNameInParent error: %d", v4);
}

void sub_1000571A8(uint64_t a1)
{
  [(id)sub_10002C0AC(a1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C0A0() name];
  sub_10002BD5C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingDir: to_dnp: %@ to_np: %@, renameFile success", v4, v5, v6, v7, v8);
}

void sub_100057244()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingDir: to_dnp: %@ to_np: %@, renameFile error: %d", v4);
}

void sub_1000572EC(uint64_t a1)
{
  [(id)sub_10002C0AC(a1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C0A0() name];
  sub_10002BD5C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, silly renameFile success", v4, v5, v6, v7, v8);
}

void sub_100057388()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, silly renameFile error: %d", v4);
}

void sub_100057430()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, renameFile error: %d", v4);
}

void sub_1000574D8(uint64_t a1)
{
  [(id)sub_10002C0AC(a1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C0A0() name];
  sub_10002BD5C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, renameFile (undo silly-name) success", v4, v5, v6, v7, v8);
}

void sub_100057574()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, renameFile (undo silly-name) result: %d", v4);
}

void sub_10005761C(uint64_t a1)
{
  [(id)sub_10002C0AC(a1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C0A0() name];
  sub_10002BD5C();
  sub_10002BEF0((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, deleteNameInParent (silly-name) success", v4, v5, v6, v7, v8);
}

void sub_1000576B8()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10002C04C() name];
  sub_10002BD14();
  sub_10002BCFC((void *)&_mh_execute_header, &_os_log_default, v3, "renameOverExistingFile: to_dnp: %@, to_np: %@, deleteNameInParent (silly-name) error: %d", v4);
}

void sub_100057760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5A0((void *)&_mh_execute_header, &_os_log_default, a3, "deliverSearchResults: parseSearchResults returned nil\n", a5, a6, a7, a8, 0);
}

void sub_10005779C(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_10002BE44((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "deliverSearchResults: Calling LISearchResult path: %@\n", a1);
}

void sub_1000577E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005781C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "hasConflict: Conflict: requestedMode: 0x%x  (O_SHLOCK vs. our FWRITE)\n", v1, v2, v3, v4, v5);
}

void sub_10005788C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "Conflict: requestedMode: 0x%x (cannot grant O_EXLOCK)\n", v1, v2, v3, v4, v5);
}

void sub_1000578FC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "hasConflict: Conflict: requestedMode: 0x%x (FWRITE vs. our O_SHLOCK)\n", v1, v2, v3, v4, v5);
}

void sub_10005796C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "hasConflict: Conflict requestedMode: 0x%x (we hold O_EXLOCK)\n", v1, v2, v3, v4, v5);
}

void sub_1000579DC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Warning, fileRef refCount is zero, cannot decrement\n", v0, 2u);
}

void sub_100057A24()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "initWithName: failed to allocate filerefCache:\n", v0, 2u);
}

void sub_100057A6C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "mount point is nil - setting fileId to 0", v0, 2u);
}

void sub_100057AB4()
{
  __error();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "symlinkTargetCache: clock_gettime error: %d\n", v1, v2, v3, v4, 0);
}

void sub_100057B30()
{
  sub_10002BD74();
  uint64_t v3 = [v2 name];
  int v4 = 138412802;
  uint8_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = v0;
  __int16 v8 = 1024;
  unsigned int v9 = [v1 openFileRefs];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "findSharedFileRef: np: %@, unexpected inMode: 0x%x, openFileRefs: %u", (uint8_t *)&v4, 0x18u);
}

void sub_100057BF0(void *a1, void *a2)
{
  uint64_t v3 = [a1 name];
  [a2 openMode];
  sub_100032FF0();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "closeFileRefInternal: np: %@, mode: 0x%x, fileRef is not open\n", v4, 0x12u);
}

void sub_100057C90(uint64_t a1)
{
  id v2 = [(id)sub_10002C0AC(a1) name];
  [*(id *)(a1 + 40) openMode];
  sub_100032FF0();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "closeFileRefInternal: Closed fileref for np: %@, mode: 0x%x\n", v3, 0x12u);
}

void sub_100057D30()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002C0AC(v0) name];
  sub_100032F54();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "closeFileRefInternal: Error closing np: %@, error: %d, ntstatus: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_100057DCC(int *a1, uint8_t *buf)
{
  int v2 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "refreshAttrsWithCompletionHandler: clock_gettime error: %d\n", buf, 8u);
}

void sub_100057E1C(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 384);
  int v3 = *(_DWORD *)(*(void *)a1 + 128);
  int v4 = 138412802;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "refreshAttrs: np: %@, unexpected fa_vtype change from %u to %u", (uint8_t *)&v4, 0x18u);
}

void sub_100057EBC()
{
  sub_10002BF44();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v0, "refreshAttrs: np: %@, Windows symlink, unexpected fa_vtype: %u", v1, v2, v3, v4, v5);
}

void sub_100057F34()
{
  sub_100032FE0(__stack_chk_guard);
  sub_10002BF44();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v0, "refreshAttrsWithCompletionHandler: node: %@ smb_query_node error: %d", v1, v2, v3, v4, v5);
}

void sub_100057FA4()
{
  sub_100032FE0(__stack_chk_guard);
  sub_10002BF44();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v0, "refreshAttrsWithCompletionHandler: node: %@ readReparseSymlink error: %d", v1, v2, v3, v4, v5);
}

void sub_100058014()
{
  __error();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "getMaxAccessAttr: clock_gettime error: %d\n", v1, v2, v3, v4, 0);
}

void sub_100058090()
{
  sub_10002BD74();
  [(id)sub_10002C0AC(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100032FD0();
  sub_100032F54();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "closeAllFileRefs: np: %@, Read_fileRef sendClose error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_100058124()
{
  sub_10002BD74();
  [(id)sub_10002C0AC(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100032FD0();
  sub_100032F54();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "closeAllFileRefs: np: %@, Write_fileRef sendClose error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_1000581B8()
{
  sub_10002BD74();
  [(id)sub_10002C0AC(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100032FD0();
  sub_100032F54();
  sub_10002BE28((void *)&_mh_execute_header, &_os_log_default, v2, "closeAllFileRefs: np: %@, ReadWrite_fileRef sendClose error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005824C(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "prepareForReclaim: np: %@, closing all fileRefs...", v3, v4, v5, v6, v7);
}

void sub_1000582D4(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "prepareForReclaimSync: np: %@, closing all fileRefs...", buf, 0xCu);
}

void sub_100058330(void *a1)
{
  id v1 = [a1 name];
  [v1 UTF8String];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenFilesAfterReconnect: revoking np: %s, reopen failed\n", v3, v4, v5, v6, v7);
}

void sub_1000583C0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "reopenFilesAfterReconnect: reopenSharedRefs error: %d\n", v1, v2, v3, v4, v5);
}

void sub_100058430()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "reopenFilesAfterReconnect: reopenDenyModeRefs error: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000584A0(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenFilesNodes: np: %@ is not viable for reopening files", v3, v4, v5, v6, v7);
}

void sub_100058528(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenDenyModeRefs: fileRef for np: %@, ReadWrite_fileRef reopened", v3, v4, v5, v6, v7);
}

void sub_1000585B0(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "reopenDenyModeRefs: np: %@, reopen ReadWrite_fileRef error: %d\n", v3, v4, v5, v6, v7);
}

void sub_10005863C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenDenyModeRefs: fileRef for np: %@, Write_fileRef reopened", v3, v4, v5, v6, v7);
}

void sub_1000586C4(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "reopenDenyModeRefs: np: %@, reopen Write_fileRef error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100058750(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenDenyModeRefs: fileRef for np: %@, Read_fileRef reopened", v3, v4, v5, v6, v7);
}

void sub_1000587D8(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "reopenDenyModeRefs: np: %@, reopen Read_fileRef error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100058864(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenSharedRefs: fileRef for np: %@, ReadWrite_fileRef reopened", v3, v4, v5, v6, v7);
}

void sub_1000588EC(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "reopenSharedRefs: np: %@, reopen ReadWrite_fileRef error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100058978(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenSharedRefs: fileRef for np: %@, Write_fileRef reopened", v3, v4, v5, v6, v7);
}

void sub_100058A00(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "reopenSharedRefs: np: %@, reopen Write_fileRef error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100058A8C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0EC(a1) name];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "reopenSharedRefs: fileRef for np: %@, Read_fileRef reopened", v3, v4, v5, v6, v7);
}

void sub_100058B14(uint64_t a1)
{
  [(id)sub_10002C0EC(a1) name];
  objc_claimAutoreleasedReturnValue();
  sub_10002C058();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "reopenSharedRefs: np: %@, reopen Read_fileRef error: %d\n", v3, v4, v5, v6, v7);
}

void sub_100058BA0()
{
  sub_10000A5BC();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 1024;
  *(_DWORD *)(v1 + 14) = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reopenFileRef: fileRef for np: %@, openFileNode error: %d", v4, 0x12u);
}

void sub_100058C04(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[smbNode addChangeNotify:NotifyHandler:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: np: %@ fileRef alloc failed \n", buf, 0x16u);
}

void sub_100058C74(id *a1)
{
  uint64_t v1 = [*a1 name];
  sub_100032F74();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "%s: np: %@ openFileNode error: %d\n", v3, v4, v5, v6, 2u);
}

void sub_100058D10(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) name];
  sub_100032F74();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "%s: np: %@ setChangeNotify error: %d \n", v3, v4, v5, v6, 2u);
}

void sub_100058DAC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) name];
  sub_100032F74();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "%s: np: %@ cleanup sendClose error: %d\n", v3, v4, v5, v6, 2u);
}

void sub_100058E48(void *a1)
{
  uint64_t v1 = [a1 name];
  int v2 = 136315394;
  uint64_t v3 = "-[smbNode clearChangeNotify:completionHandler:]";
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: np: %@ changeNotifyFileRef is nil? \n", (uint8_t *)&v2, 0x16u);
}

void sub_100058EF4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) name];
  sub_100032F74();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "%s: np: %@ sendClose error: %d\n", v3, v4, v5, v6, 2u);
}

void sub_100058F90()
{
  sub_10002BD74();
  [*(id *)(v2 + 32) name];
  objc_claimAutoreleasedReturnValue();
  sub_100032FD0();
  int v5 = 136315906;
  uint64_t v6 = "-[smbNode clearChangeNotify:completionHandler:]_block_invoke_2";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v0;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: np: %@, Change Notify sendClose error: %d, ntstatus: 0x%x", (uint8_t *)&v5, 0x22u);
}

void sub_100059060()
{
  sub_10000A5BC();
  _DWORD *v1 = 136315650;
  sub_100032F94(v2, (uint64_t)v1, v3);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: np: %@ sendClose error: %d\n", v4, 0x1Cu);
}

void sub_1000590C0()
{
  sub_10000A5BC();
  _DWORD *v1 = 136315650;
  sub_100032F94(v2, (uint64_t)v1, v3);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: np: %@ setChangeNotify error: %d \n", v4, 0x1Cu);
}

void sub_100059120(void *a1)
{
  id v1 = [a1 name];
  [v1 UTF8String];
  sub_10002BE5C();
  sub_100032F38((void *)&_mh_execute_header, &_os_log_default, v2, "smbNode destructing, my name was: %s\n", v3, v4, v5, v6, v7);
}

void sub_1000591B0(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "getServerAddressStr: getnameinfo error: %d\n", (uint8_t *)v1, 8u);
}

void sub_100059230()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "check_symlink_reparse_buffer, md5 hashes are different\n", v0, 2u);
}

void sub_100059278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000592F4()
{
  sub_10003726C();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error getting location %lu: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100059364()
{
  sub_10003726C();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error getting %lu/LiveFiles: %{public}@", v1, v2, v3, v4, v5);
}

void sub_1000593D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005944C()
{
  sub_10003726C();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error creating %lu/smbclientd: %{public}@", v1, v2, v3, v4, v5);
}

void sub_1000594BC(int *a1, uint64_t a2)
{
  int v2 = *a1;
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "internalAddShare: smbMountFromServerURL returned error: %d for share: %@ ", (uint8_t *)v3, 0x12u);
}

void sub_10005954C()
{
  sub_100037238();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "internalAddShare: Forced unmount returned error %@ for share: %@", v1, v2, v3, v4, v5);
}

void sub_1000595BC()
{
  sub_100037238();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "internalAddShare: addVolume returned error: %@ for share: %@", v1, v2, v3, v4, v5);
}

void sub_10005962C()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "No servername given in %@", v1, v2, v3, v4, v5);
}

void sub_10005969C()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "No username given in %@", v1, v2, v3, v4, v5);
}

void sub_10005970C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059748()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "Error saving password to keychain: %@", v1, v2, v3, v4, v5);
}

void sub_1000597B8()
{
  sub_10002BE5C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "about to save password for %@", v0, 0xCu);
}

void sub_100059834()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "Error creating volume cluster: %@", v1, v2, v3, v4, v5);
}

void sub_1000598A4()
{
  sub_100037288();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Error updating new password to keychain: %@", v1, v2, v3, v4, 2u);
}

void sub_100059920()
{
  sub_100037288();
  sub_10003729C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: error retrieving saved password for desc %@, error: %@", v1, v2, v3, v4, 2u);
}

void sub_1000599A4()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "Already have connection to server %@ under other user", v1, v2, v3, v4, v5);
}

void sub_100059A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059AA0()
{
  sub_100037288();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "%s Server Entry (%@) does not exist", v1, v2, v3, v4, 2u);
}

void sub_100059B1C()
{
  sub_100037288();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "%s Error saving server list after removal: %@", v1, v2, v3, v4, 2u);
}

void sub_100059B98()
{
  sub_10002BE5C();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error '%@' loading config for %s", v1, v2, v3, v4, v5);
}

void sub_100059C1C()
{
  sub_100037238();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error creating cluster master domain for desc %@, error %@", v1, v2, v3, v4, v5);
}

void sub_100059C8C()
{
  sub_100037238();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error creating cluster master for desc %@, error %@", v1, v2, v3, v4, v5);
}

void sub_100059CFC()
{
  sub_100037238();
  sub_10003721C((void *)&_mh_execute_header, &_os_log_default, v0, "Error retrieving password for desc %@, error %@", v1, v2, v3, v4, v5);
}

void sub_100059D6C()
{
  sub_10002BE5C();
  __int16 v2 = 2112;
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reconstituteWithService: calling internalAddShare for share: %@, url: %@", v1, 0x16u);
}

void sub_100059DF8()
{
  sub_100037238();
  sub_10003729C((void *)&_mh_execute_header, &_os_log_default, v0, "Error retrieving item for desc %@ (%@), error %@", v1, v2, v3, v4, v5);
}

void sub_100059E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059F60()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "ejectVolumeForURL: save returned error %@", v1, v2, v3, v4, v5);
}

void sub_100059FD0()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "ejectVolumeForURL: unmountVolume returned error %@", v1, v2, v3, v4, v5);
}

void sub_10005A040()
{
  sub_10002BE5C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "ejectVolumeForURL: calling unmountVolume on %@", v0, 0xCu);
}

void sub_10005A0BC()
{
  sub_10002BE5C();
  sub_100037250((void *)&_mh_execute_header, &_os_log_default, v0, "ejectVolumeForURL: Called. mountOnString <%@> ", v1, v2, v3, v4, v5);
}

void sub_10005A12C()
{
  sub_1000464B4(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendNegotiate: negotiateTo error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A19C()
{
  sub_100046568(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendSessionSetup: login error: %d, ntStatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A20C()
{
  sub_100046568(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendLogoff: logoff error: %d, ntStatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A27C()
{
  sub_1000464B4(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendTreeConnect: treeConnect error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A2EC()
{
  sub_1000464B4(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendTreeDisonnect: treeDisconnect error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A35C()
{
  sub_1000464B4(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendQueryShare: queryShareInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A3CC()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendWrite: write error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A444()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendRead: read error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A4BC()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendPipeWait: ioctl error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A534()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendPipeTransceive: ioctl error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A5AC()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "sendSetInfo: setInformation error: %d, ntStatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005A624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003788((void *)&_mh_execute_header, &_os_log_default, a3, "sendChangeNotify: No memory for return buffer\n", a5, a6, a7, a8, 0);
}

void sub_10005A660()
{
  int v0 = 136315138;
  uint64_t v1 = "+[smb_subr sendChangeNotify:Param:CompletionHandler:NotifyHandler:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: call notifyHandler", (uint8_t *)&v0, 0xCu);
}

void sub_10005A6E8()
{
  int v0 = 136315138;
  uint64_t v1 = "+[smb_subr sendChangeNotify:Param:CompletionHandler:NotifyHandler:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: call notifyHandler after requeue", (uint8_t *)&v0, 0xCu);
}

void sub_10005A770(uint64_t a1, int a2)
{
  int v2 = **(_DWORD **)(a1 + 32);
  int v3 = 136315650;
  uint64_t v4 = "+[smb_subr sendChangeNotify:Param:CompletionHandler:NotifyHandler:]_block_invoke_2";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 1024;
  int v8 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: sendChangeNotify error: %d, ntStatus: 0x%x", (uint8_t *)&v3, 0x18u);
}

void sub_10005A814()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005A884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005A8C0()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005A930()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005A9A0()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005AA10()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005AA80()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005AAF0()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005AB60()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRoot: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005ABD0()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryShareRootSync: queryShareRoot error: %d", v1, v2, v3, v4, v5);
}

void sub_10005AC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005AC84()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "queryDirOneAttr: Failed to build path for dnp: %s", v4);
}

void sub_10005ACD0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005AD40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005AD7C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005ADEC()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005AE5C()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: cmpdParseQueryDirectory error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005AECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005AF08()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005AF78()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005AFE8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryDirOneAttr: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B058()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "queryNodeAttr: No memory for SMBFileAllInformation, np: %@", v4);
}

void sub_10005B0A4()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "queryNodeAttr: Failed to build path for np: %@", v4);
}

void sub_10005B0F0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B160()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B1D0()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B240()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B2B0()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B320()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B390()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeAttr: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B400(void *a1)
{
  id v1 = [a1 name];
  [v1 UTF8String];
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "openFileNode: Failed to build path for np: %s", v3);
}

void sub_10005B494()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "openFileNode: sendCreateFile error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B50C(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "openFileInParent: Failed to build path for dnp: %@", v3);
}

void sub_10005B598()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "openFileInParent: sendCreateFile error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B610()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: invalid vtype: %u", v1, v2, v3, v4, v5);
}

void sub_10005B680()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "createFile: Failed to build path for dnp: %@, name: %@", v5);
}

void sub_10005B6CC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005B778()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B7E8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005B858(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) name];
  sub_100046380();
  sub_100046498((void *)&_mh_execute_header, &_os_log_default, v2, "createFile: dnp: %@, name: %@, cmpdParseClose error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005B904()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B97C()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: cmpdParseCreate error: %d, ntstatus 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005B9EC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createFile: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005BA5C()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002C094(v0) name];
  sub_10002BCA8();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "createFile: dnp: %@, name: %@, deleteNameInParent error: %d", v3, v4, v5, v6, v7);
}

void sub_10005BAF4(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "queryNode: np: %@, isRoot false AND np.parent is nil", v3);
}

void sub_10005BB80()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNode: queryShareRoot error: %d", v1, v2, v3, v4, v5);
}

void sub_10005BBF0(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "queryNode: np: %@, completionHandler(result); error: %d, trying QueryFile",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_10005BC7C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "queryNode: np: %@, queryNodeAttr error: %d", v3, v4, v5, v6, v7);
}

void sub_10005BD08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005BD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005BD80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1000464C8(a1, a2, a3, 4.8151e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "createReparseSymlink: Failed to build path for dnp: %s, name: %s", v6);
}

void sub_10005BDD0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005BE40()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005BEB0()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdAddIoctl error: %d", v1, v2, v3, v4, v5);
}

void sub_10005BF20()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005BF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005BFCC()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C03C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: resetCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C0AC()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C11C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) name];
  sub_10002BE5C();
  sub_100046498((void *)&_mh_execute_header, &_os_log_default, v2, "createReparseSymlink: dnp: %@, name: %@, cmpdParseIoctl error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005C1F4()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C264()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C2D4()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002C094(v0) name];
  sub_10002BCA8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "createReparseSymlink: dnp: %@, name: %@, markForDelete error: %d", v2, 0x1Cu);
}

void sub_10005C378()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C3E8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createReparseSymlink: second sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C458()
{
  sub_1000057E0();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "createWindowsSymlink: failed to allocate symlink data, error: %d", v0, 8u);
}

void sub_10005C4D8()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "createWindowsSymlink: Failed to build path for dnp: %@, name: %@", v5);
}

void sub_10005C524()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005C5D0()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C640()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C6B0()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C720()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C790()
{
  sub_1000463EC(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdParseWrite error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C800()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005C870()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "createWindowsSymlink: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005C8E0(void *a1)
{
  uint64_t v2 = [a1 name];
  objc_msgSend(a1, "np_flag");
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v3, "smb_read_symlink: np: %@ not a symlink, np_flag: 0x%x", v4, v5, v6, v7, 2u);
}

void sub_10005C984()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "readReparseSymlink: No memory to read reparse node np: %@", v4);
}

void sub_10005C9D0()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "readReparseSymlink: Failed to build path for np: %s\n", v4);
}

void sub_10005CA1C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CA8C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CAFC()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdAddIoctl error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CB6C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CBDC()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005CC4C()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdParseIoctl error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005CCBC()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005CD2C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readReparseSymlink: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005CDD8()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "readWindowsSymlink: Failed to build path for np: %s", v4);
}

void sub_10005CE24()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CE94()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CF04()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: cmpdAddRead error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CF74()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005CFE4()
{
  sub_1000464FC();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink short read, expected: %u, actualIOLen: %u", v1, v2, v3, v4, v5);
}

void sub_10005D05C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: failed to parse symlink data, error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D0CC()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D13C()
{
  sub_1000463EC(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: cmpdParseRead error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D1AC()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D21C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readWindowsSymlink: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005D2C8()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "smbCheckForWindowsSymlink: Failed to build path for np: %s", v4);
}

void sub_10005D314()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D384()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D3F4()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: cmpdAddRead error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D464()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D4D4()
{
  sub_1000464FC();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink short read, expected: %u, actualIOLen: %u", v1, v2, v3, v4, v5);
}

void sub_10005D54C()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D5BC()
{
  sub_1000463EC(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: cmpdParseRead error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D62C()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D69C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "smbCheckForWindowsSymlink: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D70C()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "listNodeStreams: Failed to build path for np: %s", v4);
}

void sub_10005D758()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D7C8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D838()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D8A8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005D918()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D988()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005D9F8()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005DA68()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "listNodeStreams: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005DAD8()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "queryNodeStream: Failed to build path for np: %s\n", v4);
}

void sub_10005DB24()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005DB94()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005DC04()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005DC74()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005DCE4()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005DD54()
{
  sub_100046364(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: cmpdParseQueryInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005DDC4()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005DE34()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryNodeStream: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005DEA4(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "readNodeStreamChunks: Failed to build path for np: %@", v3);
}

void sub_10005DF30()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046554();
  sub_100046380();
  sub_100046498((void *)&_mh_execute_header, &_os_log_default, v2, "readNodeStreamChunks: np: %@, stream: %@, sendCreateFile error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005DFC4()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046540();
  sub_100046380();
  sub_100046498((void *)&_mh_execute_header, &_os_log_default, v2, "readNodeStreamChunks: np: %@, stream: %@, sendClose error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005E058(uint64_t a1)
{
  [*(id *)(a1 + 32) name];
  objc_claimAutoreleasedReturnValue();
  sub_10004657C();
  sub_100046444();
  sub_1000464E0((void *)&_mh_execute_header, &_os_log_default, v2, "readNodeStreamChunk start: np: %@, maxReadLen: %u, off: %u, read: %llu, remain: %llu result: %d", v3, v4, v5, v6, v7);
}

void sub_10005E0E8()
{
  sub_10002BD74();
  [*(id *)(v1 + 32) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046518();
  sub_100046408();
  sub_1000464E0((void *)&_mh_execute_header, &_os_log_default, v2, "readNodeStreamChunk: np: %@ pass: %llu, thisRead: %llu, thisOffset: %u, error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005E180()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "readNodeStreamCompound: Failed to build path for np: %s\n", v4);
}

void sub_10005E1CC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005E23C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005E2AC()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: cmpdAddRead error: %d", v1, v2, v3, v4, v5);
}

void sub_10005E31C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005E38C()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005E3FC(id *a1, uint64_t a2)
{
  [*a1 length];
  sub_10002BE5C();
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "readNodeStreamCompound: readBufLen: %lu, streamEOF: %llu, error: ERANGE", v3, 0x16u);
}

void sub_10005E498()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005E508()
{
  sub_1000463EC(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: cmpdParseRead error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005E578()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "readNodeStreamCompound: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005E5E8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamChunks: unsupported LIXattrHow: %u", v1, v2, v3, v4, v5);
}

void sub_10005E658(void *a1)
{
  id v1 = [a1 name];
  [v1 UTF8String];
  sub_10002BE5C();
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v2, "writeNodeStreamChunks: Failed to build path for np: %s\n", v3);
}

void sub_10005E6EC()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046554();
  sub_100046380();
  sub_100046498((void *)&_mh_execute_header, &_os_log_default, v2, "writeNodeStreamChunks: np: %@, stream: %@, sendCreateFile error: %d, ntstatus: 0x%x\n", v3, v4, v5, v6, v7);
}

void sub_10005E780()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046540();
  sub_100046380();
  sub_100046498((void *)&_mh_execute_header, &_os_log_default, v2, "writeNodeStreamChunks: np: %@, stream: %@, sendClose error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005E814(uint64_t a1)
{
  [*(id *)(a1 + 32) name];
  objc_claimAutoreleasedReturnValue();
  sub_10004657C();
  sub_100046444();
  sub_1000464E0((void *)&_mh_execute_header, &_os_log_default, v2, "writeNodeStreamChunk start: np: %@, maxWriteLen: %u, off: %u, written: %llu, remain: %llu result: %d", v3, v4, v5, v6, v7);
}

void sub_10005E8A4()
{
  sub_10002BD74();
  [*(id *)(v1 + 32) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046518();
  sub_100046408();
  sub_1000464E0((void *)&_mh_execute_header, &_os_log_default, v2, "writeNodeStreamChunk: np: %@ pass: %llu, thisWrite: %llu, thisOffset: %u, error: %d, ntstatus: 0x%x", v3, v4, v5, v6, v7);
}

void sub_10005E93C()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "writeNodeStreamCompound: Failed to build path for np: %s\n", v4);
}

void sub_10005E988()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005E9F8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005EA68()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: cmpdAddRead error: %d", v1, v2, v3, v4, v5);
}

void sub_10005EAD8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005EB48()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: unsupported LIXattrHow: %u", v1, v2, v3, v4, v5);
}

void sub_10005EBBC()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005EC2C()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005EC9C()
{
  sub_1000463EC(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: cmpdParseWrite error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005ED0C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "writeNodeStreamCompound: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005ED7C()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "deleteNodeStream: Failed to build path for np: %s\n", v4);
}

void sub_10005EDC8()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005EE38()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005EEA8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) name];
  sub_1000463AC();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "deleteNodeStream: np: %@, name: %@, cmpdAddSetInformation error: %d", v3, v4, v5, v6, v7);
}

void sub_10005EF54()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005EFC4()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F034()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F0A4()
{
  sub_1000463D0(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: cmpdParseSetInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F114()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNodeStream: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F184()
{
  sub_100046530(__stack_chk_guard);
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "enumeratorWithParameters: failed with error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F1F4()
{
  sub_100046530(__stack_chk_guard);
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "enumDirNext: nextEntry error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F264()
{
  sub_100046530(__stack_chk_guard);
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "enumDirClose: close error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F2D4()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "statFS: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F344()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "statFS: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F3B4()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "statFS: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005F460()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "statFS: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F4D0()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "setNodeBasicInfo: Failed to build path for np: %s\n", v4);
}

void sub_10005F51C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setNodeBasicInfo: np: %@, nodeForCmpd error: %d", v3, v4, v5, v6, v7);
}

void sub_10005F5A8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeBasicInfo: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F618(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_100046358();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setNodeBasicInfo: np: %@, cmpdAddSetInformation error: %d", v3, v4, v5, v6, v7);
}

void sub_10005F6AC(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_100046358();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setNodeBasicInfo: np: %@,cmpdAddCreate error: %d", v3, v4, v5, v6, v7);
}

void sub_10005F740()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeBasicInfo: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F7B0()
{
  sub_1000463D0(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeBasicInfo: cmpdParseSetInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F820()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeBasicInfo: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005F890()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeBasicInfo: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005F900()
{
  sub_10002C198();
  sub_10002BDEC(v1, v2, 4.8149e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "setNodeEOF: Failed to build path for np: %s", v4);
}

void sub_10005F94C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_10002BE10();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setNodeEOF: np: %@, nodeForCmpd error: %d", v3, v4, v5, v6, v7);
}

void sub_10005F9D8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeEOF: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005FA48(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_100046358();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setNodeEOF: np: %@, cmpdAddSetInformation error: %d", v3, v4, v5, v6, v7);
}

void sub_10005FADC(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10002C0AC(a1) name];
  sub_100046358();
  sub_100032F20();
  sub_1000057B4((void *)&_mh_execute_header, &_os_log_default, v2, "setNodeEOF: np: %@,cmpdAddCreate error: %d", v3, v4, v5, v6, v7);
}

void sub_10005FB70()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeEOF: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005FBE0()
{
  sub_1000463D0(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeEOF: cmpdParseSetInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005FC50()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeEOF: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10005FCC0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "setNodeEOF: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10005FD30()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "deleteNameInParent: dnp: %@, name: %@, failed to build a path", v5);
}

void sub_10005FD7C()
{
  sub_10002BD74();
  uint64_t v1 = [(id)sub_10002C094(v0) name];
  sub_10002BCA8();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "deleteNameInParent: dnp: %@, name: %@, nodeForCmpd error: %d", v3, v4, v5, v6, v7);
}

void sub_10005FE14()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNameInParent: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_10005FE84()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046480();
  sub_1000463AC();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "deleteNameInParent: dnp: %@, name: %@, cmpdAddSetInformation error: %d", v3, v4, v5, v6, v7);
}

void sub_10005FF18()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046480();
  sub_1000463AC();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "deleteNameInParent: dnp: %@, name: %@, cmpdAddCreate error: %d", v3, v4, v5, v6, v7);
}

void sub_10005FFAC()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNameInParent: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10006001C()
{
  sub_1000463D0(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNameInParent: cmpdParseSetInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10006008C()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNameInParent: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_1000600FC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "deleteNameInParent: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10006016C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1000464C8(a1, a2, a3, 4.8151e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "renameFile: Failed to build rename path for dnp: %s, newName: %s\n", v6);
}

void sub_1000601BC()
{
  sub_10002C0B8();
  sub_10002BD38(v1, v2, v3, 5.778e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v4, "renameFile: Failed to build path for dnp: %@, name: %@", v5);
}

void sub_100060208(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1000464C8(a1, a2, a3, 4.8151e-34);
  sub_10002BDF8((void *)&_mh_execute_header, &_os_log_default, v5, "renameFile: Failed to build rename path for new_dnp: %s, newName: %s\n", v6);
}

void sub_100060258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000602E8()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "renameFile: cmpdAddClose error: %d", v1, v2, v3, v4, v5);
}

void sub_100060358()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046480();
  sub_1000463AC();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "renameFile: dnp: %@, fileName: %@, cmpdAddSetInformation error: %d", v3, v4, v5, v6, v7);
}

void sub_1000603EC()
{
  sub_10002BD74();
  [(id)sub_10002C094(v1) name];
  objc_claimAutoreleasedReturnValue();
  sub_100046480();
  sub_1000463AC();
  sub_100032FB4((void *)&_mh_execute_header, &_os_log_default, v2, "renameFile: dnp: %@, fileName: %@, cmpdAddCreate error: %d", v3, v4, v5, v6, v7);
}

void sub_100060480()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "renameFile: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_1000604F0()
{
  sub_1000463D0(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "renameFile: cmpdParseSetInformation error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_100060560()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "renameFile: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_1000605D0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "renameFile: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_100060640()
{
  sub_10002C0E0();
  sub_10002BDEC(v1, v2, 5.7779e-34);
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, v3, "queryMaxAccess: Failed to build path for np: %@\n", v4);
}

void sub_10006068C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryMaxAccess: nodeForCmpd error: %d", v1, v2, v3, v4, v5);
}

void sub_1000606FC()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryMaxAccess: cmpdAddQueryInformation error: %d", v1, v2, v3, v4, v5);
}

void sub_10006076C()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryMaxAccess: cmpdAddCreate error: %d", v1, v2, v3, v4, v5);
}

void sub_1000607DC()
{
  sub_10004633C(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryMaxAccess: cmpdParseClose error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_10006084C()
{
  sub_100046320(__stack_chk_guard);
  sub_1000462F4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "queryMaxAccess: cmpdParseCreate error: %d, ntstatus: 0x%x", v1, v2, v3, v4, v5);
}

void sub_1000608BC()
{
  sub_10004630C();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "queryMaxAccess: sendCmpdRequest error: %d", v1, v2, v3, v4, v5);
}

void sub_10006092C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "+[smb_subr setChangeNotify:Param:CompletionHandler:NotifyHandler:]";
  sub_10002BDD4((void *)&_mh_execute_header, &_os_log_default, a3, "%s: fidCtx is nil? \n", (uint8_t *)&v3);
}

void sub_1000609AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000609E8(void *a1)
{
  objc_msgSend(a1, "in_len");
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v1, "rpc_bind_interface: truncated bind_ack, received only %u bytes\n", v2, v3, v4, v5, v6);
}

void sub_100060A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100060A98(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "in_len");
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v2, "rpc_bind_interface: Decode error, insufficient frag_len: %u, in_len: %u\n", v3, v4, v5, v6, 0);
}

void sub_100060B2C()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Unexpected pdu_type in bind reply, pdu_type: %u\n", v1, v2, v3, v4, v5);
}

void sub_100060BA0(void *a1)
{
  objc_msgSend(a1, "in_finger");
  objc_msgSend(a1, "in_len");
  sub_100048484();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v2, "rpc_bind_interface: bind_ack secondary addr len exceeds recv buffer: sec_addr_len: %u, in_len: %u\n", v3, v4, v5, v6, v7);
}

void sub_100060C2C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "rpc_bind_interface: BIND_REQ was accepted, context negotiation was successful\n", v0, 2u);
}

void sub_100060C74(void *a1)
{
  objc_msgSend(a1, "in_fbtbd");
  sub_10004849C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v1, "rpc_bind_interface: incorrect frag_len field: %u, nDecoded: %u\n", v2, v3, v4, v5, v6);
}

void sub_100060CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100060D34(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "rpc_bind_interface: bind_ack p_result_list[%u]: ctx_uuid accepted not 32-bit NDR\n", buf, 8u);
}

void sub_100060D80()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_ack truncated at field: p_result_list[%u]:if_version\n", v1, v2, v3, v4, v5);
}

void sub_100060DF0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_ack truncated at field: p_result_list[%u]:if_uuid\n", v1, v2, v3, v4, v5);
}

void sub_100060E60()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_ack truncated at field: p_result_list[%u]:reason\n", v1, v2, v3, v4, v5);
}

void sub_100060ED0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_ack truncated at field: p_result_list[%u]:result\n", v1, v2, v3, v4, v5);
}

void sub_100060F40()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Warning, p_result_list count is larger than expected, count: %u\n", v1, v2, v3, v4, v5);
}

void sub_100060FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100060FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006102C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061068()
{
  sub_10004849C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_ack truncated at sec_addr npad: %u, index: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000610DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061118(void *a1)
{
  int v1 = 136315138;
  id v2 = objc_msgSend(a1, "sec_addr");
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "rpc_bind_interface: bind_ack secondary_address: %s\n", (uint8_t *)&v1, 0xCu);
}

void sub_10006119C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000611D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061250(void *a1)
{
  objc_msgSend(a1, "negotiated_max_xmit_frag");
  objc_msgSend(a1, "negotiated_max_recv_frag");
  sub_100048484();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "rpc_bind_interface: Negotiated: max_xmit_frag: %u, max_recv_frag: %u\n", v2, 0xEu);
}

void sub_1000612E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061360()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_request rejected, reason: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000613D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061410()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: bind_ack unexpected call_id: %u\n", v1, v2, v3, v4, v5);
}

void sub_100061480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000614BC()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Unexpected auth_len: %u\n", v1, v2, v3, v4, v5);
}

void sub_100061530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006156C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000615A8()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Unsupported NDR Character Format: %u\n", v1, v2, v3, v4, v5);
}

void sub_10006161C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061658()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Unsupported NDR Integer Format: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000616CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000617BC()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Unsupported rpc version minor: %u\n", v1, v2, v3, v4, v5);
}

void sub_100061830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006186C()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_bind_interface: Unsupported rpc version: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000618E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006191C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000619D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061F70()
{
  sub_1000057E0();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "bindrec_fill_input_buf: Filled %u bytes", v0, 8u);
}

void sub_100061FF4()
{
  sub_1000057E0();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "bindrec_fill_input_buf: SMB READ error: %d, ntstatus: 0x%x", v1, 0xEu);
}

void sub_10006208C()
{
  sub_1000057E0();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "fill_input_buf: Outoing Read: io_buf_len: %u\n", v0, 8u);
}

void sub_10006210C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000621C0(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "ndrrec_getbytes: remain: %u, but in_lastfrag set\n", (uint8_t *)v1, 8u);
}

void sub_100062240()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "set_input_fragment: rpc fault received, fault_code: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000622B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000622F0(uint8_t *buf, _DWORD *a2)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "set_input_fragment: rpc_reply, decode error reading reserved1, err: %d\n", buf, 8u);
}

void sub_10006233C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062378(void *a1, unsigned __int16 *a2)
{
  unsigned int v3 = objc_msgSend(a1, "context_id");
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "set_input_fragment: rpc_reply, context_id mismatch, exp: %u, recv: %u\n", (uint8_t *)v5, 0xEu);
}

void sub_100062418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062490(uint8_t *buf, unsigned __int8 a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "set_input_fragment: Unexpected rpc pdu_type in stream, pdu_type: %u\n", buf, 8u);
}

void sub_1000624E0(void *a1)
{
  objc_msgSend(a1, "call_id_counter");
  sub_1000057E0();
  __int16 v3 = 1024;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "set_input_fragment: Received reply without call_id mismatch, expected: %u, got: %u\n", v2, 0xEu);
}

void sub_100062580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000625BC()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "set_input_fragment: Received reply with unexpected auth_length: %u\n", v1, v2, v3, v4, v5);
}

void sub_100062630()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "set_input_fragment: Received reply with unexpected NDR Character Format: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000626A4()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "set_input_fragment: Received reply with unexpected NDR Integer Format: %u\n", v1, v2, v3, v4, v5);
}

void sub_100062718()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "set_input_fragment: Received reply with unexpected rpc_version_minor: %u\n", v1, v2, v3, v4, v5);
}

void sub_10006278C()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "set_input_fragment: set_input_fragment: Received reply with unexpected rpc_version: %u\n", v1, v2, v3, v4, v5);
}

void sub_100062800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006283C(uint8_t *buf, int a2)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "transport_flush: flushed %u bytes to the transport", buf, 8u);
}

void sub_100062888(int a1, int a2)
{
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  __int16 v5 = 1024;
  int v6 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "get_input_bytes: fill_input_buf error, len: %u, nremain: %u, returned: %u\n", (uint8_t *)v2, 0x14u);
}

void sub_10006291C(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "fill_input_buf: Filled %u bytes\n", buf, 8u);
}

void sub_100062968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000629A4()
{
  sub_10004B2D8();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "get_share_list: NetShareEnum1 error: %d\n", v1, v2, v3, v4, v5);
}

void sub_100062A14()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "get_share_list: open_named_pipe error: %d\n", v1, v2, v3, v4, v5);
}

void sub_100062A84(uint64_t a1, uint64_t a2, uint64_t a3, uint8_t *buf)
{
  int v4 = *(_DWORD *)(*(void *)a2 + 24);
  int v5 = *(_DWORD *)(*(void *)a3 + 84);
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "open_named_pipe: pipe: %s sendCreateFile error: %d, ntstatus: 0x%x\n", buf, 0x18u);
}

void sub_100062AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062C98()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "NetShareEnum1: Failed to encode srvsvc_handle pad[%i]\n", v1, v2, v3, v4, v5);
}

void sub_100062D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062E34()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "NetShareEnum1: make_srvsvc_handle returned an error: %u\n", v1, v2, v3, v4, v5);
}

void sub_100062EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006300C()
{
  sub_10004B2D8();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: NetShareEnum decoded with status: %u\n", v1, v2, v3, v4, v5);
}

void sub_10006307C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000630B8()
{
  sub_10004B2D8();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Decoded a Resume handle of: %u\n", v1, v2, v3, v4, v5);
}

void sub_100063128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000631A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000631DC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Decoded entry[%i] ShareName, ReferentId is zero\n", v1, v2, v3, v4, v5);
}

void sub_10006324C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Decoded entry[%i] ShareComment, ReferentId is zero\n", v1, v2, v3, v4, v5);
}

void sub_1000632BC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Received an empty ShareName string at entry: %u\n", v1, v2, v3, v4, v5);
}

void sub_10006332C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Failed to parse ShareComment at entry: %u, error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10006339C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Failed to parse ShareName at entry: %u, error: %d\n", v1, v2, v3, v4, v5);
}

void sub_10006340C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Failed to decode entry[%i] ShareComment ReferentId\n", v1, v2, v3, v4, v5);
}

void sub_10006347C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Failed to decode entry[%i] ShareName ShareType\n", v1, v2, v3, v4, v5);
}

void sub_1000634EC()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Failed to decode entry[%i] ShareName ReferentId\n", v1, v2, v3, v4, v5);
}

void sub_10006355C()
{
  sub_1000057E0();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Decoded SHARE_INFO_1 Buffer, MaxCount: %u differs from EntryCount: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000635E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006361C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000636D0()
{
  sub_10004B2D8();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Decoded SHARE_ENUM_STRUCT, unexpected SwitchIndex: %u\n", v1, v2, v3, v4, v5);
}

void sub_100063740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006377C()
{
  sub_10004B2D8();
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "srvsvc_decode_shareinfo1: Decoded SHARE_ENUM_STRUCT, unexpected Infolevel: %u\n", v1, v2, v3, v4, v5);
}

void sub_1000637EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063828()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: String with bad length at entry: %u length: %u\n", v1, v2, v3, v4, v5);
}

void sub_10006389C()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: No memory for decoding string at entry: %u\n", v1, v2, v3, v4, v5);
}

void sub_10006390C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: Decode error at entry %u, field: pad[%u]\n", v1, v2, v3, v4, v5);
}

void sub_10006397C()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: utf16_to_utf8 for entry %u returned error: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000639EC()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: Failed to decode string at entry: %u, len: %u\n", v1, v2, v3, v4, v5);
}

void sub_100063A60()
{
  sub_10000A4C4();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: Decode error at entry %u, field: null_terminator[%u]\n", v1, v2, v3, v4, v5);
}

void sub_100063AD0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: Error decoding string at entry: %u, field: ActualCount\n", v1, v2, v3, v4, v5);
}

void sub_100063B40()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: Error decoding string at entry: %u, field: Offset\n", v1, v2, v3, v4, v5);
}

void sub_100063BB0()
{
  sub_1000057A8();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "rpc_parse_utf16_string: Error decoding string at entry: %u, field: MaxCount\n", v1, v2, v3, v4, v5);
}

void sub_100063C20()
{
  sub_1000057E0();
  __int16 v8 = 1024;
  int v9 = v0;
  __int16 v10 = 1024;
  int v11 = v1;
  __int16 v12 = 1024;
  int v13 = v2;
  __int16 v14 = 1024;
  int v15 = v3;
  __int16 v16 = 1024;
  int v17 = v4;
  __int16 v18 = 1024;
  int v19 = v5;
  __int16 v20 = 1024;
  int v21 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "u4: 0x%2x 0x%2x 0x%2x 0x%2x 0x%2x 0x%2x 0x%2x 0x%2x\n", v7, 0x32u);
}

void sub_100063CF8()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "u3: 0x%2x\n", v1, v2, v3, v4, v5);
}

void sub_100063D6C()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "u2: 0x%2x\n", v1, v2, v3, v4, v5);
}

void sub_100063DE0()
{
  sub_1000057E0();
  sub_10000578C((void *)&_mh_execute_header, &_os_log_default, v0, "u1: 0x%4x\n", v1, v2, v3, v4, v5);
}

void sub_100063E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006402C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000640A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006411C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006420C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000642FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000643EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000644DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000645CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000646BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000647B0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "\n", v0, 2u);
}

void sub_1000647F8(uint8_t *buf, unsigned __int8 *a2, _DWORD *a3)
{
  int v3 = *a2;
  *(_DWORD *)buf = 67109120;
  *a3 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%02x ", buf, 8u);
}

void sub_100064848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000648C0()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "getSharesAtServer: sendTreeConnect error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_100064934()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "getSharesAtServer: sendSessionSetup error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_1000649A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000649E4()
{
  sub_10000A56C();
  sub_10000A4DC((void *)&_mh_execute_header, &_os_log_default, v0, "getSharesAtServer: sendNegotiate error: %u, ntstatus: 0x%x\n", v1, v2, v3, v4, v5);
}

void sub_100064A58(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getShareArrayFromContainer: Share at index %u has NULL share_netname, skipping\n", buf, 8u);
}

void sub_100064AA4(uint8_t *buf, uint64_t *a2, void *a3)
{
  uint64_t v3 = *a2;
  *(_DWORD *)buf = 136315138;
  *a3 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Adding DISK Share: %s\n", buf, 0xCu);
}

void sub_100064AF4(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "getShareArrayFromContainer: Skipping STYPE: 0x%x\n", buf, 8u);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t getNSErrorFromLiveFSErrno()
{
  return _getNSErrorFromLiveFSErrno();
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return _nanosleep(__rqtp, __rmtp);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_addRef(void *a1, const char *a2, ...)
{
  return [a1 addRef];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cDocumentsToFilter(void *a1, const char *a2, ...)
{
  return [a1 cDocumentsToFilter];
}

id objc_msgSend_cFilteredDocuments(void *a1, const char *a2, ...)
{
  return [a1 cFilteredDocuments];
}

id objc_msgSend_cResultsFound(void *a1, const char *a2, ...)
{
  return [a1 cResultsFound];
}

id objc_msgSend_cRowsTotal(void *a1, const char *a2, ...)
{
  return [a1 cRowsTotal];
}

id objc_msgSend_calculateSet(void *a1, const char *a2, ...)
{
  return [a1 calculateSet];
}

id objc_msgSend_callerID(void *a1, const char *a2, ...)
{
  return [a1 callerID];
}

id objc_msgSend_cancelIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelIdleTimer];
}

id objc_msgSend_changeNotifyFileRef(void *a1, const char *a2, ...)
{
  return [a1 changeNotifyFileRef];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_checkSearchAborted(void *a1, const char *a2, ...)
{
  return [a1 checkSearchAborted];
}

id objc_msgSend_checkServerConnection(void *a1, const char *a2, ...)
{
  return [a1 checkServerConnection];
}

id objc_msgSend_closeEnumeration(void *a1, const char *a2, ...)
{
  return [a1 closeEnumeration];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return [a1 columns];
}

id objc_msgSend_connQueue(void *a1, const char *a2, ...)
{
  return [a1 connQueue];
}

id objc_msgSend_connState(void *a1, const char *a2, ...)
{
  return [a1 connState];
}

id objc_msgSend_connectToServer(void *a1, const char *a2, ...)
{
  return [a1 connectToServer];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return [a1 connectionState];
}

id objc_msgSend_connectionSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionSyncQueue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createDispatchData(void *a1, const char *a2, ...)
{
  return [a1 createDispatchData];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return [a1 cursor];
}

id objc_msgSend_deObj(void *a1, const char *a2, ...)
{
  return [a1 deObj];
}

id objc_msgSend_decDirRefCount(void *a1, const char *a2, ...)
{
  return [a1 decDirRefCount];
}

id objc_msgSend_decRef(void *a1, const char *a2, ...)
{
  return [a1 decRef];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dentObjSave(void *a1, const char *a2, ...)
{
  return [a1 dentObjSave];
}

id objc_msgSend_desiredAccess(void *a1, const char *a2, ...)
{
  return [a1 desiredAccess];
}

id objc_msgSend_dirEnumerationSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 dirEnumerationSyncQueue];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_disconnectFromServer(void *a1, const char *a2, ...)
{
  return [a1 disconnectFromServer];
}

id objc_msgSend_dnp(void *a1, const char *a2, ...)
{
  return [a1 dnp];
}

id objc_msgSend_doTreeConnect(void *a1, const char *a2, ...)
{
  return [a1 doTreeConnect];
}

id objc_msgSend_doTreeDisconnect(void *a1, const char *a2, ...)
{
  return [a1 doTreeDisconnect];
}

id objc_msgSend_dwRatioFinishedDenominator(void *a1, const char *a2, ...)
{
  return [a1 dwRatioFinishedDenominator];
}

id objc_msgSend_dwRatioFinishedNumerator(void *a1, const char *a2, ...)
{
  return [a1 dwRatioFinishedNumerator];
}

id objc_msgSend_entryIndex(void *a1, const char *a2, ...)
{
  return [a1 entryIndex];
}

id objc_msgSend_enumState(void *a1, const char *a2, ...)
{
  return [a1 enumState];
}

id objc_msgSend_fextPatterns(void *a1, const char *a2, ...)
{
  return [a1 fextPatterns];
}

id objc_msgSend_fh(void *a1, const char *a2, ...)
{
  return [a1 fh];
}

id objc_msgSend_fidCtx(void *a1, const char *a2, ...)
{
  return [a1 fidCtx];
}

id objc_msgSend_fileRefForRead(void *a1, const char *a2, ...)
{
  return [a1 fileRefForRead];
}

id objc_msgSend_fileRefForWrite(void *a1, const char *a2, ...)
{
  return [a1 fileRefForWrite];
}

id objc_msgSend_fileRefSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 fileRefSyncQueue];
}

id objc_msgSend_flushAndReconnect(void *a1, const char *a2, ...)
{
  return [a1 flushAndReconnect];
}

id objc_msgSend_fsName(void *a1, const char *a2, ...)
{
  return [a1 fsName];
}

id objc_msgSend_getNextFileID(void *a1, const char *a2, ...)
{
  return [a1 getNextFileID];
}

id objc_msgSend_getReadDirVerifier(void *a1, const char *a2, ...)
{
  return [a1 getReadDirVerifier];
}

id objc_msgSend_getSmbFattr(void *a1, const char *a2, ...)
{
  return [a1 getSmbFattr];
}

id objc_msgSend_handleTable(void *a1, const char *a2, ...)
{
  return [a1 handleTable];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_idleTimer(void *a1, const char *a2, ...)
{
  return [a1 idleTimer];
}

id objc_msgSend_idleTimerRunning(void *a1, const char *a2, ...)
{
  return [a1 idleTimerRunning];
}

id objc_msgSend_inUseClientSet(void *a1, const char *a2, ...)
{
  return [a1 inUseClientSet];
}

id objc_msgSend_incDirRefCount(void *a1, const char *a2, ...)
{
  return [a1 incDirRefCount];
}

id objc_msgSend_initFresh(void *a1, const char *a2, ...)
{
  return [a1 initFresh];
}

id objc_msgSend_initializationFinished(void *a1, const char *a2, ...)
{
  return [a1 initializationFinished];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interestedClients(void *a1, const char *a2, ...)
{
  return [a1 interestedClients];
}

id objc_msgSend_interfaceForListeners(void *a1, const char *a2, ...)
{
  return [a1 interfaceForListeners];
}

id objc_msgSend_invalidateAttrs(void *a1, const char *a2, ...)
{
  return [a1 invalidateAttrs];
}

id objc_msgSend_isAborted(void *a1, const char *a2, ...)
{
  return [a1 isAborted];
}

id objc_msgSend_isCaseSensitive(void *a1, const char *a2, ...)
{
  return [a1 isCaseSensitive];
}

id objc_msgSend_isDir(void *a1, const char *a2, ...)
{
  return [a1 isDir];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isGuestLogin(void *a1, const char *a2, ...)
{
  return [a1 isGuestLogin];
}

id objc_msgSend_isReg(void *a1, const char *a2, ...)
{
  return [a1 isReg];
}

id objc_msgSend_isRevokedLocked(void *a1, const char *a2, ...)
{
  return [a1 isRevokedLocked];
}

id objc_msgSend_isRoot(void *a1, const char *a2, ...)
{
  return [a1 isRoot];
}

id objc_msgSend_isSymlink(void *a1, const char *a2, ...)
{
  return [a1 isSymlink];
}

id objc_msgSend_isViable(void *a1, const char *a2, ...)
{
  return [a1 isViable];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastRequestTime(void *a1, const char *a2, ...)
{
  return [a1 lastRequestTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_liAttr(void *a1, const char *a2, ...)
{
  return [a1 liAttr];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockMeta(void *a1, const char *a2, ...)
{
  return [a1 lockMeta];
}

id objc_msgSend_logConfig(void *a1, const char *a2, ...)
{
  return [a1 logConfig];
}

id objc_msgSend_logContents(void *a1, const char *a2, ...)
{
  return [a1 logContents];
}

id objc_msgSend_logoutDisconnect(void *a1, const char *a2, ...)
{
  return [a1 logoutDisconnect];
}

id objc_msgSend_makeSillyDeleteName(void *a1, const char *a2, ...)
{
  return [a1 makeSillyDeleteName];
}

id objc_msgSend_maxRank(void *a1, const char *a2, ...)
{
  return [a1 maxRank];
}

id objc_msgSend_mgmtQueue(void *a1, const char *a2, ...)
{
  return [a1 mgmtQueue];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return [a1 modelName];
}

id objc_msgSend_mountURL(void *a1, const char *a2, ...)
{
  return [a1 mountURL];
}

id objc_msgSend_mp(void *a1, const char *a2, ...)
{
  return [a1 mp];
}

id objc_msgSend_msgid(void *a1, const char *a2, ...)
{
  return [a1 msgid];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameTable(void *a1, const char *a2, ...)
{
  return [a1 nameTable];
}

id objc_msgSend_namespaceChangingGroup(void *a1, const char *a2, ...)
{
  return [a1 namespaceChangingGroup];
}

id objc_msgSend_newClient(void *a1, const char *a2, ...)
{
  return [a1 newClient];
}

id objc_msgSend_noXattrsPresent(void *a1, const char *a2, ...)
{
  return [a1 noXattrsPresent];
}

id objc_msgSend_nodeTableSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 nodeTableSyncQueue];
}

id objc_msgSend_notifyConnectionLost(void *a1, const char *a2, ...)
{
  return [a1 notifyConnectionLost];
}

id objc_msgSend_openEnumeration(void *a1, const char *a2, ...)
{
  return [a1 openEnumeration];
}

id objc_msgSend_openFileCounter(void *a1, const char *a2, ...)
{
  return [a1 openFileCounter];
}

id objc_msgSend_openFileRefs(void *a1, const char *a2, ...)
{
  return [a1 openFileRefs];
}

id objc_msgSend_openMode(void *a1, const char *a2, ...)
{
  return [a1 openMode];
}

id objc_msgSend_opnum(void *a1, const char *a2, ...)
{
  return [a1 opnum];
}

id objc_msgSend_opsQueue(void *a1, const char *a2, ...)
{
  return [a1 opsQueue];
}

id objc_msgSend_opsSyncGroup(void *a1, const char *a2, ...)
{
  return [a1 opsSyncGroup];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pd(void *a1, const char *a2, ...)
{
  return [a1 pd];
}

id objc_msgSend_pendingChangeNotifyCount(void *a1, const char *a2, ...)
{
  return [a1 pendingChangeNotifyCount];
}

id objc_msgSend_pipe0(void *a1, const char *a2, ...)
{
  return [a1 pipe0];
}

id objc_msgSend_pipe1(void *a1, const char *a2, ...)
{
  return [a1 pipe1];
}

id objc_msgSend_pipeClose(void *a1, const char *a2, ...)
{
  return [a1 pipeClose];
}

id objc_msgSend_pipeIsOpen(void *a1, const char *a2, ...)
{
  return [a1 pipeIsOpen];
}

id objc_msgSend_pipeName(void *a1, const char *a2, ...)
{
  return [a1 pipeName];
}

id objc_msgSend_pipeOpen(void *a1, const char *a2, ...)
{
  return [a1 pipeOpen];
}

id objc_msgSend_pipeWait(void *a1, const char *a2, ...)
{
  return [a1 pipeWait];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_propValue(void *a1, const char *a2, ...)
{
  return [a1 propValue];
}

id objc_msgSend_qStatus(void *a1, const char *a2, ...)
{
  return [a1 qStatus];
}

id objc_msgSend_readwriteSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 readwriteSyncQueue];
}

id objc_msgSend_reconnState(void *a1, const char *a2, ...)
{
  return [a1 reconnState];
}

id objc_msgSend_refCount(void *a1, const char *a2, ...)
{
  return [a1 refCount];
}

id objc_msgSend_refSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 refSyncQueue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reopenDenyModeRefs(void *a1, const char *a2, ...)
{
  return [a1 reopenDenyModeRefs];
}

id objc_msgSend_reopenFilesAfterReconnect(void *a1, const char *a2, ...)
{
  return [a1 reopenFilesAfterReconnect];
}

id objc_msgSend_reopenSharedRefs(void *a1, const char *a2, ...)
{
  return [a1 reopenSharedRefs];
}

id objc_msgSend_replyData(void *a1, const char *a2, ...)
{
  return [a1 replyData];
}

id objc_msgSend_requestDisconnect(void *a1, const char *a2, ...)
{
  return [a1 requestDisconnect];
}

id objc_msgSend_resetAfterReconnect(void *a1, const char *a2, ...)
{
  return [a1 resetAfterReconnect];
}

id objc_msgSend_resetCmpdRequest(void *a1, const char *a2, ...)
{
  return [a1 resetCmpdRequest];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 resumeIdleTimer];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return [a1 rootNode];
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return [a1 rows];
}

id objc_msgSend_rowsetBookMark(void *a1, const char *a2, ...)
{
  return [a1 rowsetBookMark];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_searchLock(void *a1, const char *a2, ...)
{
  return [a1 searchLock];
}

id objc_msgSend_searchObjects(void *a1, const char *a2, ...)
{
  return [a1 searchObjects];
}

id objc_msgSend_searchPath(void *a1, const char *a2, ...)
{
  return [a1 searchPath];
}

id objc_msgSend_searchReturnTypes(void *a1, const char *a2, ...)
{
  return [a1 searchReturnTypes];
}

id objc_msgSend_searchRows(void *a1, const char *a2, ...)
{
  return [a1 searchRows];
}

id objc_msgSend_searchToken(void *a1, const char *a2, ...)
{
  return [a1 searchToken];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serverConnected(void *a1, const char *a2, ...)
{
  return [a1 serverConnected];
}

id objc_msgSend_serverMaxRd(void *a1, const char *a2, ...)
{
  return [a1 serverMaxRd];
}

id objc_msgSend_serverMaxRead(void *a1, const char *a2, ...)
{
  return [a1 serverMaxRead];
}

id objc_msgSend_serverMaxTransact(void *a1, const char *a2, ...)
{
  return [a1 serverMaxTransact];
}

id objc_msgSend_serverMaxWr(void *a1, const char *a2, ...)
{
  return [a1 serverMaxWr];
}

id objc_msgSend_serverMaxWrite(void *a1, const char *a2, ...)
{
  return [a1 serverMaxWrite];
}

id objc_msgSend_serverName(void *a1, const char *a2, ...)
{
  return [a1 serverName];
}

id objc_msgSend_serverVersion(void *a1, const char *a2, ...)
{
  return [a1 serverVersion];
}

id objc_msgSend_setSearchAborted(void *a1, const char *a2, ...)
{
  return [a1 setSearchAborted];
}

id objc_msgSend_shareID(void *a1, const char *a2, ...)
{
  return [a1 shareID];
}

id objc_msgSend_shareInfo(void *a1, const char *a2, ...)
{
  return [a1 shareInfo];
}

id objc_msgSend_shareMode(void *a1, const char *a2, ...)
{
  return [a1 shareMode];
}

id objc_msgSend_shareName(void *a1, const char *a2, ...)
{
  return [a1 shareName];
}

id objc_msgSend_shareType(void *a1, const char *a2, ...)
{
  return [a1 shareType];
}

id objc_msgSend_shutdownReason(void *a1, const char *a2, ...)
{
  return [a1 shutdownReason];
}

id objc_msgSend_skipAnEntry(void *a1, const char *a2, ...)
{
  return [a1 skipAnEntry];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_strValue(void *a1, const char *a2, ...)
{
  return [a1 strValue];
}

id objc_msgSend_symlinkTargetCache(void *a1, const char *a2, ...)
{
  return [a1 symlinkTargetCache];
}

id objc_msgSend_tctx(void *a1, const char *a2, ...)
{
  return [a1 tctx];
}

id objc_msgSend_timeSpec(void *a1, const char *a2, ...)
{
  return [a1 timeSpec];
}

id objc_msgSend_tmpDent(void *a1, const char *a2, ...)
{
  return [a1 tmpDent];
}

id objc_msgSend_treeIsConnected(void *a1, const char *a2, ...)
{
  return [a1 treeIsConnected];
}

id objc_msgSend_trueSequential(void *a1, const char *a2, ...)
{
  return [a1 trueSequential];
}

id objc_msgSend_tryCreateRootNode(void *a1, const char *a2, ...)
{
  return [a1 tryCreateRootNode];
}

id objc_msgSend_uint4Val(void *a1, const char *a2, ...)
{
  return [a1 uint4Val];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unlockMeta(void *a1, const char *a2, ...)
{
  return [a1 unlockMeta];
}

id objc_msgSend_updateFileID(void *a1, const char *a2, ...)
{
  return [a1 updateFileID];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userDomain(void *a1, const char *a2, ...)
{
  return [a1 userDomain];
}

id objc_msgSend_userName(void *a1, const char *a2, ...)
{
  return [a1 userName];
}

id objc_msgSend_vType(void *a1, const char *a2, ...)
{
  return [a1 vType];
}

id objc_msgSend_wasWritten(void *a1, const char *a2, ...)
{
  return [a1 wasWritten];
}

id objc_msgSend_wctx(void *a1, const char *a2, ...)
{
  return [a1 wctx];
}

id objc_msgSend_whdr(void *a1, const char *a2, ...)
{
  return [a1 whdr];
}

id objc_msgSend_whereID(void *a1, const char *a2, ...)
{
  return [a1 whereID];
}

id objc_msgSend_workID(void *a1, const char *a2, ...)
{
  return [a1 workID];
}

id objc_msgSend_xattrCache(void *a1, const char *a2, ...)
{
  return [a1 xattrCache];
}

id objc_msgSend_xattrIOQueue(void *a1, const char *a2, ...)
{
  return [a1 xattrIOQueue];
}