uint64_t start()
{
  void *v0;
  NSObject *v1;
  void *v2;
  unsigned int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;

  v1 = wc_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting up", (uint8_t *)&v11, 2u);
  }

  v2 = (void *)MGCopyAnswer();
  v3 = [v2 BOOLValue];

  if (v3)
  {
    v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446210;
      v12 = "Wed Dec 31 16:00:00 1969";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon Build Time: %{public}s", (uint8_t *)&v11, 0xCu);
    }
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000449B0);
  v5 = +[WCDSystemMonitor sharedSystemMonitor];
  v6 = +[WatchConnectivityDaemon sharedDaemon];
  v7 = +[WCDPushKitManager sharedPushKitManager];
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v8, &stru_1000449F0);
  dispatch_resume(v8);
  os_state_add_handler();

  v9 = +[NSRunLoop mainRunLoop];
  [v9 run];

  return 1;
}

void sub_100002858(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = string;
    v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "launched for event: %{public}s", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_100002914(id a1)
{
  v1 = wc_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM received, shutting down.", v2, 2u);
  }

  exit(0);
}

os_state_data_s *__cdecl sub_100002974(id a1, os_state_hints_s *a2)
{
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  NSAppendPrintF();
  id v3 = 0;
  v4 = +[WCDSystemMonitor sharedSystemMonitor];
  int v5 = [v4 state];

  if (v5)
  {
    v19 = v5;
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }
  v7 = +[WatchConnectivityDaemon sharedDaemon];
  v8 = [v7 state];

  if (v8)
  {
    v20 = v8;
    NSAppendPrintF();
    id v9 = v3;

    id v3 = v9;
  }
  v10 = +[WCDPushKitManager sharedPushKitManager];
  v11 = [v10 state];

  if (v11)
  {
    NSAppendPrintF();
    id v12 = v3;

    id v3 = v12;
  }
  NSAppendPrintF();
  id v13 = v3;

  if (v13)
  {
    id v14 = +[NSPropertyListSerialization dataWithPropertyList:v13 format:200 options:0 error:0];
    id v15 = [v14 length];
    v16 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v15 + 200, 0x69825810uLL);
    v17 = v16;
    if (v16)
    {
      v16->var0 = 1;
      v16->var1.var1 = v15;
      __strlcpy_chk();
      id v14 = v14;
      memcpy(v17->var4, [v14 bytes], (size_t)v15);
    }
  }
  else
  {
    id v14 = 0;
    v17 = 0;
  }

  return v17;
}

id sub_100002CAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendStateIfNeccessary];
}

void sub_100002E14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100002E30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handlLocalFirstUnlockStateChanged];
}

id sub_1000038E8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) receivedFirstUnlockState];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 sendFirstUnlockRequest];
  }
  return result;
}

id sub_1000040E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchAppBundleIdentifier];
}

id sub_1000040EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchExtensionBundleIdentifier];
}

id sub_1000040F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) companionAppBundleIdentifier];
}

id sub_1000040FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) canRunIndependentlyOfCompanionApp];
}

id sub_100004104(uint64_t a1)
{
  return [*(id *)(a1 + 32) isRunningIndependently];
}

id sub_10000410C(uint64_t a1)
{
  return [*(id *)(a1 + 32) isStandaloneWatchApp];
}

id sub_100004114(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCompanionAppInstalled];
}

id sub_10000411C(uint64_t a1)
{
  return [*(id *)(a1 + 32) isWatchAppInstalled];
}

id sub_100004124(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasComplications];
}

id sub_10000412C(uint64_t a1)
{
  return [*(id *)(a1 + 32) uniqueInstallID];
}

void sub_100004288(uint64_t a1)
{
  id v2 = [[*(id *)(a1 + 32) appendBool:objc_msgSend(*(id *)(a1 + 40), "canRunIndependentlyOfCompanionApp") withName:@"canRunIndependently" ifEqualTo:1];
  id v3 = [[*(id *)(a1 + 32) appendBool:objc_msgSend(*(id *)(a1 + 40), "isRunningIndependently") withName:@"runningIndependently" ifEqualTo:1];
  id v4 = [[*(id *)(a1 + 32) appendBool:[*(id *)(a1 + 40) isStandaloneWatchApp] withName:@"standalone" ifEqualTo:1];
  id v5 = [[*(id *)(a1 + 32) appendBool:[*(id *)(a1 + 40) isCompanionAppInstalled] withName:@"companionAppInstalled"];
  id v6 = [[*(id *)(a1 + 32) appendBool:[*(id *)(a1 + 40) isWatchAppInstalled] withName:@"watchAppInstalled"];
  id v7 = [[*(id *)(a1 + 32) appendBool:objc_msgSend(*(id *)(a1 + 40), "hasComplications") withName:@"hasComplications" ifEqualTo:1];
  v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) uniqueInstallID];
  [v8 appendString:v9 withName:@"uniqueInstallID"];
}

void sub_100004DD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100004DFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  unsigned int v9 = [WeakRetained isCancelled];

  if (v9) {
    goto LABEL_9;
  }
  if (v5)
  {
    v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A724((uint64_t)v6, (uint64_t)v5, v10);
    }

    id v11 = objc_loadWeakRetained(v7);
    id v12 = [v11 retryCount];

    if (v12 != (id)4)
    {
      id v16 = objc_loadWeakRetained(v7);
      [v16 setRetryCount:[v16 retryCount] + 1];

      id v17 = objc_loadWeakRetained(v7);
      sleep([v17 retryCount]);

      id v15 = objc_loadWeakRetained(v7);
      [v15 doWork];
      goto LABEL_10;
    }
    id v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002A6AC((uint64_t)v6, v13);
    }

    id v14 = objc_loadWeakRetained(v7);
    [v14 setFailed:1];

LABEL_9:
    id v15 = objc_loadWeakRetained(v7);
    [v15 finish];
LABEL_10:
  }
}

void sub_100005704(id a1)
{
  v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v2 = [v1 firstObject];

  id v3 = [v2 stringByAppendingPathComponent:@"WatchConnectivity"];
  id v4 = [v3 stringByAppendingPathComponent:@"Clients"];
  id v5 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned int v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v10];
  id v7 = v10;

  if (v6)
  {
    uint64_t v8 = +[NSURL fileURLWithPath:v4 isDirectory:1];
    unsigned int v9 = qword_1000516A0;
    qword_1000516A0 = v8;
  }
  else
  {
    unsigned int v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002A7E0((uint64_t)v7, v9);
    }
  }
}

void sub_10000617C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000061AC(uint64_t a1)
{
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained loggingIdentifier];
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: XPC connection interrupted", (uint8_t *)&v7, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v6 = [v5 connection];
  [v6 invalidate];
}

void sub_10000629C(uint64_t a1)
{
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained loggingIdentifier];
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: XPC connection invalidated", buf, 0xCu);
  }
  id v5 = (id *)(a1 + 32);
  id v6 = objc_loadWeakRetained(v5);
  int v7 = [v6 connection];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000640C;
  v9[3] = &unk_100044BC0;
  id v10 = v7;
  id v8 = v7;
  objc_copyWeak(&v11, v5);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v11);
}

void sub_10000640C(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained connection];
  LODWORD(v1) = [v1 isEqual:v4];

  if (v1)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 handleXPCInvalidation];
  }
}

id sub_100006B98(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void sub_100008214(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 identifier];
  [v3 removeOutstandingMessage:v6];

  int v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 48) identifier];
  [v7 handleSentMessageWithIdentifier:v8 error:v5];
}

void sub_1000082AC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 identifier];
  [v3 removeOutstandingMessage:v6];

  int v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 48) identifier];
  [v7 handleSentMessageWithIdentifier:v8 error:v5];
}

void sub_100009294(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = a2;
  [v3 copyProgressUpdatesForFileTransfer:v4 fromClonedFileURL:v5];
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_1000094E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *sub_100009524(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"IDSSendResourceProgressIdentifier"];

  id v6 = [*(id *)(a1 + 32) transferIdentifier];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:v5];

    if (v8)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
      [v9 setTotalUnitCount:[v3 totalUnitCount]];
      [v9 setCompletedUnitCount:[v3 completedUnitCount]];
      id v10 = [*(id *)(a1 + 32) file];
      id v11 = [v10 fileURL];
      [v9 setFileURL:v11];

      id v12 = [v3 byteTotalCount];
      [v9 setByteTotalCount:v12];

      id v13 = [v3 byteCompletedCount];
      [v9 setByteCompletedCount:v13];

      id v14 = [v3 kind];
      [v9 setKind:v14];

      [v9 setCancellable:[v3 isCancellable]];
      [v9 setPausable:[v3 isPausable]];
      [v9 setFileOperationKind:NSProgressFileOperationKindCopying];
      [v9 setUserInfoObject:v5 forKey:IDSSendResourceProgressIdentifier];
      [*(id *)(*(void *)(a1 + 40) + 80) setObject:v9 forKeyedSubscript:v5];
      [v9 publish];
      id v15 = wc_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v9 fileURL];
        *(_DWORD *)buf = 138412802;
        v28 = v5;
        __int16 v29 = 2112;
        v30 = v16;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Published progressCopy with transferID %@, to fileURL: %@, progress: %@", buf, 0x20u);
      }
    }
    if ([v3 isFinished]) {
      [v9 unpublish];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained registerForUpdatesForProgress:v3];
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000098A0;
  v23[3] = &unk_100044C38;
  char v26 = v7;
  id v24 = v5;
  int8x16_t v22 = *(int8x16_t *)(a1 + 32);
  id v18 = (id)v22.i64[0];
  int8x16_t v25 = vextq_s8(v22, v22, 8uLL);
  id v19 = v5;
  v20 = objc_retainBlock(v23);

  return v20;
}

void sub_1000098A0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = wc_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 136446466;
      id v6 = "-[WCDClient copyProgressUpdatesForFileTransfer:fromClonedFileURL:]_block_invoke";
      __int16 v7 = 2114;
      uint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s Progress unpublished for transfer %{public}@", (uint8_t *)&v5, 0x16u);
    }

    [*(id *)(a1 + 40) removeProgressForFileTransfer:*(void *)(a1 + 48)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v4 unpublish];
  }
}

void sub_10000A104(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002A9A0();
  }
}

void sub_10000A784(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002AA48();
  }
}

Class sub_10000A9D4()
{
  if (qword_1000516B8 != -1) {
    dispatch_once(&qword_1000516B8, &stru_100044CA8);
  }
  Class result = objc_getClass("_CDComplications");
  qword_1000516B0 = (uint64_t)result;
  off_1000510F0 = (uint64_t (*)())sub_10000AA38;
  return result;
}

id sub_10000AA38()
{
  return (id)qword_1000516B0;
}

void sub_10000AA44(id a1)
{
  qword_1000516C0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreDuet.framework/CoreDuet", 2);
}

void sub_10000AA88(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t WCDProtoFirstUnlockRequestReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 12) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoDaemonStartedUpReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 12) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoApplicationContextReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = PBReaderReadData();
      id v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000C890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
}

void sub_10000C8E0(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  unsigned __int8 v4 = [WeakRetained isCancelled];

  id v5 = objc_loadWeakRetained(v2);
  if ((v4 & 1) == 0)
  {
    id v7 = v5;
    unint64_t v6 = [v5 delegate];
    [v6 onqueue_retrievedPairingStateIsPaired:objc_msgSend(*(id *)(a1 + 32), "paired") pairingID:*(void *)(a1 + 40) pairedDeviceInformation:*(void *)(a1 + 48) pairedDevicesPairingIDs:*(void *)(a1 + 56)];

    id v5 = objc_loadWeakRetained(v2);
  }
  id v8 = v5;
  [v5 finish];
}

void sub_10000CD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CDCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  +[NSMutableDictionary dictionary];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CFB4;
  v17[3] = &unk_100044CF8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];
  id v8 = +[ACXDeviceConnection sharedDeviceConnection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D050;
  v11[3] = &unk_100044D98;
  uint64_t v9 = *(void *)(a1 + 32);
  v11[4] = *(void *)(a1 + 40);
  id v15 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  id v14 = *(id *)(a1 + 32);
  [v8 enumerateLocallyAvailableApplicationsForPairedDevice:v9 options:1 withBlock:v11];

  objc_destroyWeak(&v16);
}

void sub_10000CFA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000CFB4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:ACXWatchKitVersion];
  uint64_t v7 = (uint64_t)[v6 integerValue];

  if (v7 >= 2) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v8];
  }
}

uint64_t sub_10000D050(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    [*(id *)(a1 + 32) finish];
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_5;
  }
  if (!v5)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000D2F4;
    v21[3] = &unk_100044D20;
    objc_copyWeak(&v23, (id *)(a1 + 72));
    id v22 = *(id *)(a1 + 40);
    id v12 = objc_retainBlock(v21);
    if ([*(id *)(a1 + 48) count])
    {
      id v13 = +[ACXDeviceConnection sharedDeviceConnection];
      uint64_t v14 = *(void *)(a1 + 56);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000D394;
      v15[3] = &unk_100044D70;
      objc_copyWeak(&v20, (id *)(a1 + 72));
      id v18 = *(id *)(a1 + 64);
      id v16 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 40);
      id v19 = v12;
      [v13 fetchInstalledComplicationsForPairedDevice:v14 completion:v15];

      objc_destroyWeak(&v20);
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    }

    objc_destroyWeak(&v23);
    goto LABEL_5;
  }
  uint64_t v9 = [[WCDApplicationInfo alloc] initWithACXApplication:v5];
  if ([(WCDApplicationInfo *)v9 hasValidConfiguration]) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  id v10 = *(void **)(a1 + 48);
  id v11 = [v5 bundleIdentifier];
  [v10 removeObjectForKey:v11];

  uint64_t v7 = 1;
LABEL_6:

  return v7;
}

void sub_10000D2D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000D2F4(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v4 = [WeakRetained isCancelled];

  id v5 = objc_loadWeakRetained(v2);
  if ((v4 & 1) == 0)
  {
    id v7 = v5;
    id v6 = [v5 delegate];
    [v6 onqueue_retrievedInstalledAppsList:*(void *)(a1 + 32)];

    id v5 = objc_loadWeakRetained(v2);
  }
  id v8 = v5;
  [v5 finish];
}

void sub_10000D394(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  unsigned int v8 = [WeakRetained isCancelled];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 64));
    [v9 finish];
  }
  else if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10002AB38(v5, v10);
    }

    id v11 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D4F8;
    v12[3] = &unk_100044D48;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    [v11 enumerateKeysAndObjectsUsingBlock:v12];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, *(dispatch_block_t *)(a1 + 56));
  }
}

void sub_10000D4F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  if (!v7)
  {
    id v7 = +[NSDictionary dictionary];
  }
  unsigned int v8 = [[WCDApplicationInfo alloc] initWithAppConduitInstalledApplication:v6 complicationInfo:v7];

  id v9 = wc_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(WCDApplicationInfo *)v8 debugDescription];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating legacy app info %@", (uint8_t *)&v11, 0xCu);
  }
  if ([(WCDApplicationInfo *)v8 hasValidConfiguration]) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

void sub_10000DC20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_10000DC78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DC88(uint64_t a1)
{
}

void sub_10000DC90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 objectForKeyedSubscript:ACXContainerAppBundleIdKey];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    unsigned int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002ABE8(a1, (uint64_t)v5, v9);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000DD34(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v4 = [WeakRetained isCancelled];

  id v5 = objc_loadWeakRetained(v2);
  if ((v4 & 1) == 0)
  {
    id v7 = v5;
    uint64_t v6 = [v5 delegate];
    [v6 onqueue_retrievedIOSApplicationsContainingActiveComplications:*(void *)(a1 + 32)];

    id v5 = objc_loadWeakRetained(v2);
  }
  id v8 = v5;
  [v5 finish];
}

uint64_t WCDProtoPairedSyncComplicationsStartedAckReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      *(unsigned char *)(a1 + 16) |= 2u;
      while (1)
      {
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
        v19 |= (unint64_t)(v21 & 0x7F) << v17;
        if ((v21 & 0x80) == 0) {
          goto LABEL_40;
        }
        v17 += 7;
        BOOL v9 = v18++ >= 9;
        if (v9)
        {
          uint64_t v19 = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v19 = 0;
      }
LABEL_42:
      *(unsigned char *)(a1 + 12) = v19 != 0;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_36;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000F85C()
{
  qword_1000516C8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100010168(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100010198(uint64_t a1)
{
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = [WeakRetained connection];
  [v4 invalidate];
}

void sub_100010228(uint64_t a1)
{
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", v8, 2u);
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setConnection:0];

  id v5 = objc_loadWeakRetained(v3);
  unint64_t v6 = [v5 delegate];
  id v7 = objc_loadWeakRetained(v3);
  [v6 clientXPCConnectionDidDisconnect:v7];
}

id sub_100010510(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void sub_100010AE8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v16 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v8 type:a2 isResponse:0];

  uint64_t v9 = IDSDefaultPairedDevice;
  id v10 = [objc_alloc((Class)IDSMessageContext) initWithDictionary:0 boostContext:0];
  [v10 setServiceIdentifier:*(void *)(a1 + 32)];
  [v10 setOutgoingResponseIdentifier:v7];

  int v11 = +[WatchConnectivityDaemon sharedDaemon];
  char v12 = [v11 idsService];
  unsigned int v13 = [v11 idsService];
  uint64_t v14 = [v13 accounts];
  unint64_t v15 = [v14 anyObject];
  [v11 service:v12 account:v15 incomingUnhandledProtobuf:v16 fromID:v9 context:v10];
}

void sub_100010C38(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v24 = a2;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = *(void **)(a1 + 32);
  id v14 = a3;
  unint64_t v15 = [v13 connection];
  [v15 processIdentifier];

  uint64_t v16 = WCCheckFileAndConsumeSandboxTokenForProcessID();
  if (v16 < 1)
  {
    if (a6)
    {
      *a6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:13 userInfo:0];
    }
  }
  else
  {
    uint64_t v17 = IDSDefaultPairedDevice;
    id v18 = [objc_alloc((Class)IDSMessageContext) initWithDictionary:0 boostContext:0];
    [v18 setServiceIdentifier:*(void *)(a1 + 40)];
    [v18 setOutgoingResponseIdentifier:v12];
    uint64_t v19 = +[WatchConnectivityDaemon sharedDaemon];
    unint64_t v20 = [v19 idsService];
    char v21 = [v19 idsService];
    id v22 = [v21 accounts];
    id v23 = [v22 anyObject];
    [v19 service:v20 account:v23 incomingResourceAtURL:v24 metadata:v11 fromID:v17 context:v18];

    sandbox_extension_release();
  }
}

void sub_100010FF8(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002AE6C((uint64_t)v2);
  }
}

void sub_1000110EC(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

uint64_t sub_1000111AC()
{
  qword_1000516D8 = objc_opt_new();

  return _objc_release_x1();
}

id sub_100011540(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) resume];
}

id sub_10001154C(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadPersistedClients];
}

id sub_100012648(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 companionAppBundleIdentifier];
}

void sub_100013C7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = objc_opt_new();
    [v4 setObject:v3 forKeyedSubscript:IDSSendMessageOptionDuetIdentifiersOverrideKey];
    [v4 setObject:&off_100046B78 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonWakingKey];
    [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:IDSSendMessageOptionSubServiceKey];
    if (*(unsigned char *)(a1 + 72))
    {
      [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
    }
    else
    {
      [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
      id v8 = [*(id *)(a1 + 48) dataFromUUIDString:*(void *)(a1 + 40)];
      [v4 setObject:v8 forKeyedSubscript:IDSSendMessageOptionUUIDKey];
    }
    id v9 = objc_alloc((Class)IDSProtobuf);
    id v10 = [*(id *)(a1 + 56) data];
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    id v12 = [v9 initWithProtobufData:v10 type:v11 isResponse:0];

    unsigned int v13 = [*(id *)(a1 + 48) idsService];
    id v14 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v20 = 0;
    id v21 = 0;
    [v13 sendProtobuf:v12 toDestinations:v14 priority:200 options:v4 identifier:&v21 error:&v20];
    id v7 = v21;
    id v15 = v20;

    uint64_t v16 = wc_log();
    uint64_t v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10002B0E4();
      }

      uint64_t v18 = *(void *)(a1 + 64);
      id v19 = [*(id *)(a1 + 48) WCErrorForIDSError:v15];
      (*(void (**)(uint64_t, id))(v18 + 16))(v18, v19);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      id v19 = [*(id *)(a1 + 64) copy];
      [*(id *)(*(void *)(a1 + 48) + 56) setObject:v19 forKeyedSubscript:v7];
    }
  }
  else
  {
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002B2F0();
    }

    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = +[NSError wcErrorWithCode:7001];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void sub_100014CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100014D18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014D28(uint64_t a1)
{
}

void sub_100014D30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = objc_opt_new();
    [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:IDSSendMessageOptionSubServiceKey];
    id v5 = [*(id *)(a1 + 40) dataFromUUIDString:*(void *)(a1 + 48)];
    [v4 setObject:v5 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

    uint64_t v6 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v4 setObject:v6 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v4 setObject:v3 forKeyedSubscript:IDSSendMessageOptionDuetIdentifiersOverrideKey];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionWantsProgress];
    if ([*(id *)(a1 + 56) hasIncreasedPriorityTraffic]) {
      uint64_t v7 = 200;
    }
    else {
      uint64_t v7 = 100;
    }
    id v8 = [*(id *)(a1 + 40) idsService];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v11 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8);
    id obj = *(id *)(v12 + 40);
    id v21 = 0;
    LODWORD(v9) = [v8 sendResourceAtURL:v9 metadata:v10 toDestinations:v11 priority:v7 options:v4 identifier:&v21 error:&obj];
    id v13 = v21;
    objc_storeStrong((id *)(v12 + 40), obj);

    id v14 = wc_log();
    id v15 = v14;
    if (v9)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002B3A4(a1 + 96);
      }

      uint64_t v18 = *(void *)(a1 + 88);
      id v19 = [*(id *)(a1 + 40) WCErrorForIDSError:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
    }
  }
  else
  {
    uint64_t v16 = wc_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002B2F0();
    }

    uint64_t v17 = *(void *)(a1 + 88);
    id v13 = +[NSError wcErrorWithCode:7001];
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  }

  [*(id *)(a1 + 80) closeFile];
  WCDeleteItemAtURL();
}

void sub_1000166A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = objc_opt_new();
    [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:IDSSendMessageOptionSubServiceKey];
    id v5 = [*(id *)(a1 + 40) dataFromUUIDString:*(void *)(a1 + 48)];
    [v4 setObject:v5 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

    uint64_t v6 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v4 setObject:v6 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v4 setObject:v3 forKeyedSubscript:IDSSendMessageOptionDuetIdentifiersOverrideKey];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonWakingKey];
    uint64_t v7 = [*(id *)(a1 + 40) idsService];
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v20 = 0;
    id v21 = 0;
    unsigned int v11 = [v7 sendResourceAtURL:v8 metadata:v9 toDestinations:v10 priority:200 options:v4 identifier:&v21 error:&v20];
    id v12 = v21;
    id v13 = v20;

    id v14 = wc_log();
    id v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002B8CC();
      }

      uint64_t v18 = *(void *)(a1 + 72);
      id v19 = [*(id *)(a1 + 40) WCErrorForIDSError:v13];
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
    }
  }
  else
  {
    uint64_t v16 = wc_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002B2F0();
    }

    uint64_t v17 = *(void *)(a1 + 72);
    id v13 = +[NSError wcErrorWithCode:7001];
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v13);
  }
}

void sub_100017828(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = (uint64_t *)(a1 + 56);
  if ([*(id *)(a1 + 32) notifyIfFileTransferWithCommunicationID:*(void *)(a1 + 40) pairingID:*(void *)(a1 + 48) sendID:*(void *)(a1 + 56) success:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 64)])
  {
    char v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *v3;
      uint64_t v6 = *v2;
      int v12 = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      uint64_t v7 = "identifier: %{public}@, communicationID: %{public}@ was a file transfer";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    unsigned int v8 = [*(id *)(a1 + 32) notifyIfUserInfoTransferWithCommunicationID:*(void *)(a1 + 40) pairingID:*(void *)(a1 + 48) sendID:*(void *)(a1 + 56) success:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 64)];
    uint64_t v9 = wc_log();
    char v4 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *v3;
        uint64_t v11 = *v2;
        int v12 = 138543618;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        uint64_t v15 = v11;
        uint64_t v7 = "identifier: %{public}@, communicationID: %{public}@ was a user info transfer";
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_10002BB1C(v2 + 2, v2, v4);
    }
  }
}

id sub_1000181A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleIncomingRequest:*(void *)(a1 + 40) withCommunicationID:*(void *)(a1 + 48) isInUse:*(unsigned __int8 *)(a1 + 64) coreLocationData:*(void *)(a1 + 56)];
}

void sub_1000181BC(void *a1)
{
  id v2 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  [v2 handleResponse:a1[6]];
}

void sub_100018214(uint64_t a1)
{
  id v2 = [WCDProtoApplicationContext alloc];
  id v3 = [*(id *)(a1 + 32) data];
  uint64_t v9 = [(WCDProtoApplicationContext *)v2 initWithData:v3];

  char v4 = [*(id *)(a1 + 40) applicationInfoForCommunicationID:*(void *)(a1 + 48)];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [(WCDProtoApplicationContext *)v9 clientData];
  [v5 persistAppContext:v6 applicationInfo:v4 pairingID:*(void *)(a1 + 56)];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v7 handleApplicationContextWithPairingID:*(void *)(a1 + 56)];
  unsigned int v8 = [v7 connection];

  if (!v8) {
    [*(id *)(a1 + 40) notifyDuetOfPendingContentForCompanionAppID:*(void *)(a1 + 48) forComplication:0];
  }
}

void sub_100018310(uint64_t a1)
{
  id v2 = objc_alloc((Class)WCDProtoUserInfoTransfer);
  id v3 = [*(id *)(a1 + 32) data];
  id v8 = [v2 initWithData:v3];

  char v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 64) outgoingResponseIdentifier];
  [v4 handleIncomingUserInfoTransferProto:v8 communicationID:v5 pairingID:v6 sendID:v7];
}

void sub_100018C30(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = wc_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002BCE4(a1, v3, v4);
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_100014D18;
    uint64_t v16 = sub_100014D28;
    id v17 = 0;
    id v5 = objc_alloc((Class)BKSProcessAssertion);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100018D90;
    v9[3] = &unk_1000450A8;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    uint64_t v11 = &v12;
    id v6 = [v5 initWithBundleIdentifier:(id)v8.i64[0] flags:1 reason:10004 name:@"Reset timeout" withHandler:v9];
    uint64_t v7 = (void *)v13[5];
    v13[5] = (uint64_t)v6;

    _Block_object_dispose(&v12, 8);
  }
}

void sub_100018D90(void *a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018E30;
    block[3] = &unk_100045080;
    id v3 = (void *)a1[5];
    block[4] = a1[4];
    id v4 = v3;
    uint64_t v5 = a1[6];
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_100018E30(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanUpProcessAssertionForIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) acquireBackgroundAssertionForIdentifier:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v2 invalidate];
}

void sub_100019040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100019068(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100019424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019448(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeObjectForKey:*(void *)(a1 + 32)];
}

void sub_100019594(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"process-assertion"];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "companionAppIdentifier: %{public}@ invalidating process assertion", (uint8_t *)&v8, 0xCu);
      }

      [v5 invalidate];
    }
    [*(id *)(*(void *)(a1 + 32) + 88) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

id sub_10001B714(void *a1)
{
  id result = (id)(*(uint64_t (**)(void))(a1[6] + 16))();
  if (a1[4])
  {
    id v3 = (void *)a1[5];
    return [v3 sendAckForMessageWithContext:];
  }
  return result;
}

void sub_10001BCDC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    id v5 = v2;
    id v3 = [v2 objectForKeyedSubscript:@"inuse-assertion"];
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 invalidate];
    }
    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:*(void *)(a1 + 40)];
    id v2 = v5;
  }
}

void sub_10001BE98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001BED4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001BEF0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10001BF10(uint64_t a1@<X8>)
{
  *(void *)(v1 - 24) = a1;
}

void sub_10001BF2C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_fault_impl(a1, v11, OS_LOG_TYPE_FAULT, a4, &buf, 0xCu);
}

void sub_10001BF74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10001C148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    [v4 setObject:@"633486" forKeyedSubscript:@"ComponentID"];
    [v4 setObject:@"WatchConnectivity" forKeyedSubscript:@"ComponentName"];
    [v4 setObject:@"all" forKeyedSubscript:@"ComponentVersion"];
    [v4 setObject:@"phone,watch" forKeyedSubscript:@"AutoDiagnostics"];
    [v4 setObject:@"Serious Bug" forKeyedSubscript:@"Classification"];
    [v4 setObject:@"I Didn't Try" forKeyedSubscript:@"Reproducibility"];
    uint64_t v5 = +[NSString stringWithFormat:@"User hit <rdar://problem/%@>", *(void *)(a1 + 32)];
    [v4 setObject:v5 forKeyedSubscript:@"Description"];

    id v6 = +[NSString stringWithFormat:@"WatchConnectivity detected problem %@", *(void *)(a1 + 32)];
    [v4 setObject:v6 forKeyedSubscript:@"Title"];

    uint64_t v7 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
    int v8 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v15 = [v9 objectForKeyedSubscript:v14];
          uint64_t v16 = +[NSURLQueryItem queryItemWithName:v14 value:v15];
          [v8 addObject:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    [v7 setQueryItems:v8];
    id v17 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v18 = [v7 URL];
    [v17 openURL:v18];
  }
}

Class sub_10001CC3C()
{
  if (qword_1000516F0 != -1) {
    dispatch_once(&qword_1000516F0, &stru_1000451F8);
  }
  Class result = objc_getClass("PSYSyncCoordinator");
  qword_1000516E8 = (uint64_t)result;
  off_1000513F8 = (uint64_t (*)())sub_10001CCA0;
  return result;
}

id sub_10001CCA0()
{
  return (id)qword_1000516E8;
}

void sub_10001CCAC(id a1)
{
  qword_1000516F8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PairedSync.framework/PairedSync", 2);
}

void sub_10001D2D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10001D308(uint64_t a1)
{
  id v2 = wc_pushkit_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v4 = [WeakRetained bundleID];
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: XPC connection interrupted", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = objc_loadWeakRetained(v5);
  uint64_t v7 = [v6 connection];
  [v7 invalidate];

  id v8 = objc_loadWeakRetained(v5);
  [v8 setConnection:0];
}

void sub_10001D414(uint64_t a1)
{
  id v2 = wc_pushkit_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v4 = [WeakRetained bundleID];
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: XPC connection invalidated", buf, 0xCu);
  }
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = objc_loadWeakRetained(v5);
  [v6 setConnection:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D568;
  block[3] = &unk_100044B98;
  objc_copyWeak(&v8, v5);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
}

void sub_10001D568(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 clientXPCConnectionDidDisconnect:v3];
}

id sub_10001D7EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void sub_10001DD40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = wc_pushkit_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002C8C0(a1, (uint64_t)v3, v4);
  }
}

uint64_t WCDProtoComplicationPingReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = PBReaderReadString();
      uint64_t v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10001E6FC()
{
  qword_100051700 = objc_opt_new();

  return _objc_release_x1();
}

void sub_10001EC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_10001ECB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v3 = [WeakRetained failed];

  if (v3)
  {
    char v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002C990();
    }

    unsigned int v5 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    unint64_t v6 = sub_10001EDD4;
  }
  else
  {
    unsigned int v5 = v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    unint64_t v6 = sub_10001EDE4;
  }
  v5[2] = v6;
  v5[3] = &unk_100044A68;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  [v7 releaseVoucher];
}

uint64_t sub_10001EDD4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 20) = 1;
  return result;
}

void sub_10001EDE4(uint64_t a1)
{
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "complete", v5, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 20) = 0;
  unsigned int v3 = [*(id *)(a1 + 32) notifyObserversQueued:"systemObserverInitialSetUpComplete"];
  [v3 setQueuePriority:8];
  char v4 = [*(id *)(a1 + 32) notifyOperationQueue];
  [v4 setSuspended:0];
}

void sub_10001F078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001F09C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F158;
  v5[3] = &unk_100044D20;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10001F158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleApplicationStateChange:*(void *)(a1 + 32)];
}

void sub_10001FDBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v4 - 112), 8);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 160));
  _Unwind_Resume(a1);
}

void sub_10001FE30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleInstalledApplicationsChanged];
}

void sub_10001FE70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleActiveComplicationsChanged];
}

void sub_10001FEB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleActiveComplicationsChanged];
}

void sub_10001FEF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleRemainingComplicationUserInfoTransfersReset];
}

void sub_100020190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 80));
  _Unwind_Resume(a1);
}

id sub_1000201C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) onqueue_handleSwitch];
}

void sub_1000201D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v3 = [WeakRetained paired];

  if (v3)
  {
    uint64_t v4 = (id *)(a1 + 48);
    id v5 = objc_loadWeakRetained(v4);
    [v5 handleActiveComplicationsChanged];

    id v8 = objc_loadWeakRetained(v4);
    [v8 handleInstalledApplicationsChanged];
  }
  else if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v6 = wc_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "unpaired from all watches", buf, 2u);
    }

    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    [v7 setUpInitialState];
  }
}

void sub_10002045C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020484(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained releaseVoucher];
}

void sub_100020764(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:NRDevicePropertyPairingID];

  if (v3)
  {
    uint64_t v4 = [v3 UUIDString];
    id v5 = [*(id *)(a1 + 40) pairingID];
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      id v7 = wc_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        BOOL v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting initial state for invactive (pairingID %@)", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(a1 + 40) resetInitialState];
    }
  }
}

id sub_100020994(uint64_t a1)
{
  return [*(id *)(a1 + 32) onqueue_switchIfReady];
}

id sub_100020AA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) onqueue_switchIfReady];
}

id sub_100020FA4(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 watchAppBundleIdentifier];
}

id sub_10002108C(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 watchAppBundleIdentifier];
}

void sub_100021214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100021238(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 companionAppBundleIdentifier];
}

void sub_100021240(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 21) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained releaseVoucher];
}

id sub_1000213F0(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 companionAppBundleIdentifier];
}

id sub_1000214D8(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 companionAppBundleIdentifier];
}

void sub_100021BC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021E18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002209C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022490(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022510(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002266C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t sub_10002268C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002276C;
    block[3] = &unk_100045340;
    objc_copyWeak(v8, v2);
    id v5 = *(void **)(a1 + 56);
    void block[4] = *(void *)(a1 + 32);
    v8[1] = v5;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(v8);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002276C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 notifyObservers:v5];
  }
}

void sub_1000229B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022A6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022B1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

intptr_t sub_100022C94(uint64_t a1)
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2050000000;
  uint64_t v2 = (void *)qword_100051720;
  uint64_t v12 = qword_100051720;
  if (!qword_100051720)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_100023310;
    v8[3] = &unk_100045390;
    v8[4] = &v9;
    sub_100023310((uint64_t)v8);
    uint64_t v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  uint64_t v4 = [v3 initializeForAdmissionChecking:1];
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned int v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 144));
}

void sub_100022D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10002314C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_10002319C();
  uint64_t result = dlsym(v2, "kComplicationPushLimitsResetNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100051710 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10002319C()
{
  v3[0] = 0;
  if (!qword_100051718)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_10002329C;
    v3[4] = &unk_100044E28;
    v3[5] = v3;
    long long v4 = off_1000453B0;
    uint64_t v5 = 0;
    qword_100051718 = _sl_dlopen();
  }
  uint64_t v0 = qword_100051718;
  uint64_t v1 = (void *)v3[0];
  if (!qword_100051718)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_10002329C()
{
  uint64_t result = _sl_dlopen();
  qword_100051718 = result;
  return result;
}

void sub_100023310(uint64_t a1)
{
  sub_10002319C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_CDComplications");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100051720 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (WCDProtoMessageRequest *)sub_10002CAA4();
    [(WCDProtoMessageRequest *)v2 setVersion:v4];
  }
}

uint64_t WCDProtoMessageRequestReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_52;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_54:
        *(_DWORD *)(a1 + 24) = v14;
        continue;
      case 2u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8;
        goto LABEL_50;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (2)
        {
          unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
            v22 |= (unint64_t)(v24 & 0x7F) << v20;
            if (v24 < 0)
            {
              v20 += 7;
              BOOL v9 = v21++ >= 9;
              if (v9)
              {
                uint64_t v22 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v22 = 0;
        }
LABEL_58:
        BOOL v36 = v22 != 0;
        uint64_t v37 = 29;
        goto LABEL_67;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (2)
        {
          unint64_t v28 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v28 == -1 || v28 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v9 = v26++ >= 9;
              if (v9)
              {
                uint64_t v27 = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v27 = 0;
        }
LABEL_62:
        BOOL v36 = v27 != 0;
        uint64_t v37 = 28;
        goto LABEL_67;
      case 5u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        *(unsigned char *)(a1 + 32) |= 8u;
        break;
      case 6u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16;
LABEL_50:
        v35 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v33 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v33 == -1 || v33 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v34 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v33);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
      v32 |= (unint64_t)(v34 & 0x7F) << v30;
      if ((v34 & 0x80) == 0) {
        goto LABEL_64;
      }
      v30 += 7;
      BOOL v9 = v31++ >= 9;
      if (v9)
      {
        uint64_t v32 = 0;
        goto LABEL_66;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_64:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v32 = 0;
    }
LABEL_66:
    BOOL v36 = v32 != 0;
    uint64_t v37 = 30;
LABEL_67:
    *(unsigned char *)(a1 + v37) = v36;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoMessageResponseReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_43;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_45:
        uint64_t v29 = 20;
        goto LABEL_50;
      case 2u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v18;

        continue;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (2)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v14 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              BOOL v9 = v21++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_49:
        uint64_t v29 = 16;
LABEL_50:
        *(_DWORD *)(a1 + v29) = v14;
        continue;
      case 4u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 28) |= 4u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v27 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v27 == -1 || v27 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v27);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
      v26 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0) {
        goto LABEL_52;
      }
      v24 += 7;
      BOOL v9 = v25++ >= 9;
      if (v9)
      {
        uint64_t v26 = 0;
        goto LABEL_54;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_52:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v26 = 0;
    }
LABEL_54:
    *(unsigned char *)(a1 + 24) = v26 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoFirstUnlockStateReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      *(unsigned char *)(a1 + 16) |= 2u;
      while (1)
      {
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
        v19 |= (unint64_t)(v21 & 0x7F) << v17;
        if ((v21 & 0x80) == 0) {
          goto LABEL_40;
        }
        v17 += 7;
        BOOL v9 = v18++ >= 9;
        if (v9)
        {
          uint64_t v19 = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v19 = 0;
      }
LABEL_42:
      *(unsigned char *)(a1 + 12) = v19 != 0;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_36;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoDaemonClientsInformationReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = PBReaderReadData();
      unsigned int v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoFirstUnlockAckReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      *(unsigned char *)(a1 + 16) |= 2u;
      while (1)
      {
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
        v19 |= (unint64_t)(v21 & 0x7F) << v17;
        if ((v21 & 0x80) == 0) {
          goto LABEL_40;
        }
        v17 += 7;
        BOOL v9 = v18++ >= 9;
        if (v9)
        {
          uint64_t v19 = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v19 = 0;
      }
LABEL_42:
      *(unsigned char *)(a1 + 12) = v19 != 0;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_36;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t WCDProtoInstalledAppsChangedReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 12) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_1000273CC()
{
  qword_100051728 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100027A7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 enabledTopics];
  unsigned int v5 = +[NSMutableSet setWithArray:v4];

  [v5 minusSet:*(void *)(a1 + 32)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        char v12 = wc_pushkit_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v18 = v3;
          __int16 v19 = 2114;
          uint64_t v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ downgrading Enabled topic %{public}@ to Ignored", buf, 0x16u);
        }

        [v3 moveTopic:v11 fromList:0 toList:2];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v8);
  }
}

void sub_100027C3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 ignoredTopics];
  unsigned int v5 = +[NSMutableSet setWithArray:v4];

  [v5 intersectSet:*(void *)(a1 + 32)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        char v12 = wc_pushkit_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v18 = v3;
          __int16 v19 = 2114;
          uint64_t v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading Ignored topic %{public}@ to Enabled", buf, 0x16u);
        }

        [v3 moveTopic:v11 fromList:2 toList:0];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v8);
  }
}

id sub_1000280B4(id a1, WCDApplicationInfo *a2)
{
  return [(WCDApplicationInfo *)a2 companionAppBundleIdentifier];
}

void sub_1000280BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 enabledTopics];
  unsigned int v5 = +[NSMutableSet setWithArray:v4];

  id v6 = [v3 ignoredTopics];
  uint64_t v7 = +[NSMutableSet setWithArray:v6];

  id v8 = [v5 mutableCopy];
  id v18 = (void *)v7;
  [v8 unionSet:v7];
  [v8 minusSet:*(void *)(a1 + 32)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = wc_pushkit_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v24 = v3;
          __int16 v25 = 2114;
          uint64_t v26 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating token and removing topic %{public}@", buf, 0x16u);
        }

        [v3 invalidateTokenForTopic:v14 identifier:0];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }

  [v5 minusSet:v9];
  [v18 minusSet:v9];
  long long v16 = [v5 allObjects];
  char v17 = [v18 allObjects];
  [v3 setEnabledTopics:v16 ignoredTopics:v17];
}

void sub_100028CFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() topicFromBundleId:v5];
  if ([v6 isProductionEnvironment]
    && [*(id *)(a1 + 40) isEqual:APSEnvironmentProduction])
  {
    id v8 = wc_pushkit_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      id v9 = "requesting Product token for topic %{public}@ for bundle ID %{public}@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (([v6 isProductionEnvironment] & 1) == 0
    && [*(id *)(a1 + 40) isEqual:APSEnvironmentDevelopment])
  {
    id v8 = wc_pushkit_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      id v9 = "requesting Development token for topic %{public}@ for bundle ID %{public}@";
      goto LABEL_9;
    }
LABEL_10:

    [*(id *)(a1 + 48) requestTokenForTopic:v7 identifier:0];
  }
}

void sub_1000297A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  _Block_object_dispose((const void *)(v25 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000297EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    char v4 = wc_pushkit_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002CD38(a1, (uint64_t)v3, v4);
    }
  }
  else
  {
    id v5 = wc_pushkit_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "meteringStartedOnComplication %{public}@", (uint8_t *)&v10, 0xCu);
    }

    char v4 = +[WCDSystemMonitor sharedSystemMonitor];
    uint64_t v7 = [v4 duetComplications];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = objc_opt_new();
    [v7 meteringStartedOnComplication:v8 costDictionary:0 onDate:v9];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10002994C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = wc_pushkit_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002CDF4(a1, (uint64_t)v6, v7);
    }
  }
  uint64_t v8 = wc_pushkit_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v15 = 138543362;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "meteringStoppedOnComplication %{public}@", (uint8_t *)&v15, 0xCu);
  }

  int v10 = +[WCDSystemMonitor sharedSystemMonitor];
  uint64_t v11 = [v10 duetComplications];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = objc_opt_new();
  [v11 meteringStoppedOnComplication:v12 costDictionary:0 onDate:v13];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAssertion:0];
  [WeakRetained setAssertionInvalidationHandler:0];
}

void sub_100029FB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t WCDProtoPairedSyncComplicationsStartedReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 12) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10002A540(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error getting extension bundle ID for iOS app bundle ID %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10002A5BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@ is missing watchAppBundleIdentifier", (uint8_t *)&v2, 0xCu);
}

void sub_10002A634(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@ is missing iOSAppBundleID", (uint8_t *)&v2, 0xCu);
}

void sub_10002A6AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error %{public}@. Already retried max times", (uint8_t *)&v2, 0xCu);
}

void sub_10002A724(uint64_t a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5 = NSPrintF();
  *(_DWORD *)buf = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ due to %{public}@", buf, 0x16u);
}

void sub_10002A7E0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = NSPrintF();
  *(_DWORD *)buf = 138543362;
  unsigned int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to create path %{public}@", buf, 0xCu);
}

void sub_10002A884()
{
  sub_10000AAB4();
  [v1 loggingIdentifier];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10000AA70();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "%{public}@: failed with error: %{public}@", v5, v6, v7, v8, v9, v10, v11);
}

void sub_10002A928(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not get create directories. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002A9A0()
{
  sub_10000AAB4();
  [*(id *)(v1 + 32) loggingIdentifier];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10000AA70();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "%{public}@ error sending complication user info %{public}@", v5, v6, v7, v8, v9, v10, v11);
}

void sub_10002AA48()
{
  sub_10000AAB4();
  [*(id *)(v1 + 32) loggingIdentifier];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10000AA70();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "%{public}@: failed with %{public}@", v5, v6, v7, v8, v9, v10, v11);
}

void sub_10002AAF0(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "EXCEPTION: %s", buf, 0xCu);
}

void sub_10002AB38(void *a1, NSObject *a2)
{
  int v3 = [a1 keyEnumerator];
  int v4 = [v3 allObjects];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Complications: %@", (uint8_t *)&v5, 0xCu);
}

void sub_10002ABE8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = NSPrintF();
  *(_DWORD *)buf = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "error getting iOS app bundle ID for watch app bundle ID %{public}@ (%{public}@)", buf, 0x16u);
}

void sub_10002ACA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "WCDIndexManager cannot clear cache for nil application", v1, 2u);
}

void sub_10002ACE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Missing bundleID for application: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002AD60(uint64_t a1)
{
  uint64_t v1 = NSPrintF();
  sub_1000110EC((void *)&_mh_execute_header, v2, v3, "failed to persist wireData with error: %{public}@", v4, v5, v6, v7, a1, v9, 2u);
}

void sub_10002ADF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unsupported fake protobuf type: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002AE6C(uint64_t a1)
{
  uint64_t v1 = NSPrintF();
  sub_1000110EC((void *)&_mh_execute_header, v2, v3, "%{public}@", v4, v5, v6, v7, a1, v9, 2u);
}

void sub_10002AF00()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "failed with error %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002AF8C()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "WCSession unavailable to iOS extensions", v2, v3, v4, v5, v6);
}

void sub_10002AFC0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = 0;
  sub_10001BE98((void *)&_mh_execute_header, a1, a3, "could not resolve communication ID for client %{public}@", (uint8_t *)&v3);
}

void sub_10002B034(void *a1)
{
  uint64_t v7 = [a1 wc_connectionBundleID];
  [a1 processIdentifier];
  sub_10001BF64();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

void sub_10002B0E4()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "error: %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002B170()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "called on WatchOS", v2, v3, v4, v5, v6);
}

void sub_10002B1A4()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "called on iOS", v2, v3, v4, v5, v6);
}

void sub_10002B1D8()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "couldn't deserialize informationData due to %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002B264()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "%{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002B2F0()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "error getting duet identifiers", v2, v3, v4, v5, v6);
}

void sub_10002B324(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to open destination file for copying. Errno: %d", buf, 8u);
}

void sub_10002B370()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "Could not create destination file for file transfer", v2, v3, v4, v5, v6);
}

void sub_10002B3A4(uint64_t a1)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v1 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v2, v3, "failed due to %{public}@", v4, v5, v6, v7, v8, v9, v10);
}

void sub_10002B440()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "error cancelling send %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002B4CC()
{
  sub_10001BF9C();
  sub_10001BF90();
  uint64_t v0 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v1, v2, "failed to move file to client %{public}@ inbox. error: %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_10002B568()
{
  sub_10001BEB0();
  sub_10001BEF0((void *)&_mh_execute_header, v0, v1, "missing info (data container: %{public}@, pairingID: %{public}@)");
}

void sub_10002B5D0()
{
  sub_10001BF9C();
  sub_10001BF90();
  uint64_t v0 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v1, v2, "error serializing file transfer result %{public}@ due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_10002B66C()
{
  sub_10001BF9C();
  sub_10001BF90();
  uint64_t v0 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v1, v2, "error writing file transfer result to disk %{public}@ due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_10002B708()
{
  sub_10000AAB4();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "error creating outgoing file transfer path %{public}@ due to %{public}@", v5, v6, v7, v8, v9, v10, 2u);
}

void sub_10002B7B4()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "admissionCheckOnComplication failed with error. error: %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002B840()
{
  sub_10001BF10(__stack_chk_guard);
  uint64_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "error setting user info data. error: %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002B8CC()
{
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, v0, v1, "error: %{public}@", v2);
}

void sub_10002B938()
{
  sub_10001BF9C();
  sub_10001BF90();
  uint64_t v0 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v1, v2, "error serializing user info transfer result %{public}@ due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_10002B9D4()
{
  sub_10001BF9C();
  sub_10001BF90();
  uint64_t v0 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v1, v2, "error writing user info transfer result to disk %{public}@ due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_10002BA70()
{
  sub_10000AAB4();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "error creating outgoing user info transfer path %{public}@ due to %{public}@", v5, v6, v7, v8, v9, v10, 2u);
}

void sub_10002BB1C(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  sub_10001BEF0((void *)&_mh_execute_header, (uint64_t)a2, a3, "identifier: %{public}@, communicationID: %{public}@ failed to find transfer", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002BB9C(void *a1)
{
  [a1 type];
  sub_10001BF64();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
}

void sub_10002BC20()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "no metadata", v2, v3, v4, v5, v6);
}

void sub_10002BC54(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 objectForKeyedSubscript:a2];
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, a3, v5, "incorrect type %{public}@", v6);
}

void sub_10002BCE4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_10001BE98((void *)&_mh_execute_header, a2, a3, "couldn't launch companionAppIdentifier: %{public}@", (uint8_t *)&v4);
}

void sub_10002BD58()
{
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, v0, v1, "companionAppIdentifier: %{public}@, failed to acquire process assertion", v2);
}

void sub_10002BDC4()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "iOS app assertion semaphore timed out", v2, v3, v4, v5, v6);
}

void sub_10002BDF8()
{
  sub_10001BF58();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "no background assertion object for identifier %{public}@", v1, 0xCu);
}

void sub_10002BE6C()
{
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, v0, v1, "failed to created process assertion timer for identifier %{public}@", v2);
}

void sub_10002BED8()
{
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, v0, v1, "error getting watch app bundle ID %{public}@", v2);
}

void sub_10002BF44()
{
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, v0, v1, "file already exists, duplicate delivery? %{public}@", v2);
}

void sub_10002BFB0()
{
  sub_10001BF10(__stack_chk_guard);
  os_log_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error committing index of user info data %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C03C()
{
  sub_10001BF10(__stack_chk_guard);
  os_log_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error deserializing user info data %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C0C8()
{
  sub_10001BF10(__stack_chk_guard);
  os_log_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error moving file into Inbox %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C154()
{
  sub_10001BF10(__stack_chk_guard);
  os_log_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error creating metadata folder %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C1E0()
{
  sub_10001BF10(__stack_chk_guard);
  os_log_t v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error creating file folder %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C26C()
{
  sub_10000AAB4();
  int v6 = [v0 path];
  sub_10001BF64();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

void sub_10002C310()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "error creating user info transfer from file", v2, v3, v4, v5, v6);
}

void sub_10002C344(uint64_t a1, uint64_t a2)
{
  if (a1) {
    a2 = a1;
  }
  uint64_t v10 = a2;
  uint64_t v3 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v4, v5, "error archiving user info file to inbox: %{public}@", v6, v7, v8, v9, v10, v11, v12);
}

void sub_10002C3DC()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "error committing index of user info transfer from file", v2, v3, v4, v5, v6);
}

void sub_10002C410()
{
  sub_10001BF10(__stack_chk_guard);
  id v0 = NSPrintF();
  sub_10001BEC8();
  sub_1000110EC((void *)&_mh_execute_header, v1, v2, "error creating user info folder in the inbox %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C49C()
{
  sub_10000AAB4();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "error writing current complication identifier at %{public}@ due to %{public}@", v5, v6, v7, v8, v9, v10, 2u);
}

void sub_10002C548()
{
  sub_10000AAB4();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "error committing index for moving user info file to inbox %{public}@ due to %{public}@", v5, v6, v7, v8, v9, v10, 2u);
}

void sub_10002C5F4()
{
  sub_10000AAB4();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  sub_10000AAA8();
  int v2 = NSPrintF();
  sub_10001BF1C();
  sub_10000AA88((void *)&_mh_execute_header, v3, v4, "error creating user info folder in the inbox %{public}@ due to %{public}@", v5, v6, v7, v8, v9, v10, 2u);
}

void sub_10002C6A0()
{
  sub_10001BF4C();
  sub_10001BF74((void *)&_mh_execute_header, v0, v1, "You've encountered <rdar://problem/33601638>, please grab a sysdiagnose from both phone and watch and file a bug report referencing the 33601638", v2, v3, v4, v5, v6);
}

void sub_10002C6D4()
{
  sub_10001BF10(__stack_chk_guard);
  id v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error writing application context data to file %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C760()
{
  sub_10001BF10(__stack_chk_guard);
  id v0 = NSPrintF();
  sub_10001BEC8();
  sub_10001BF2C((void *)&_mh_execute_header, v1, v2, "error creating application context folder %{public}@", v3, v4, v5, v6, v7, v8, v9);
}

void sub_10002C7EC()
{
  sub_10001BF58();
  sub_10001BE98((void *)&_mh_execute_header, v0, v1, "failed to set CL transient authorization info %@", v2);
}

void sub_10002C858()
{
  sub_10001BF4C();
  sub_10001BF74((void *)&_mh_execute_header, v0, v1, "failed to take InUse assertion", v2, v3, v4, v5, v6);
}

void sub_10002C88C()
{
  sub_10001BF4C();
  sub_10001BF74((void *)&_mh_execute_header, v0, v1, "failed to create timer for InUse assertion", v2, v3, v4, v5, v6);
}

void sub_10002C8C0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) bundleID];
  uint64_t v5 = NSPrintF();
  *(_DWORD *)buf = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
}

void sub_10002C990()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "initial set up failed. Awaiting trigger to try set up again", v2, v3, v4, v5, v6);
}

void sub_10002C9C4()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "nil bundle ID", v2, v3, v4, v5, v6);
}

void sub_10002C9F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002CA70()
{
  sub_10001BF4C();
  sub_10001BED4((void *)&_mh_execute_header, v0, v1, "CDComplications creation timed out", v2, v3, v4, v5, v6);
}

uint64_t sub_10002CAA4()
{
  int v0 = abort_report_np();
  return sub_10002CACC(v0, v1, v2);
}

void sub_10002CACC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error getting bundle record for %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10002CB54(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "WCSession unavailable to iOS extensions", v1, 2u);
}

void sub_10002CB98()
{
  sub_10001BF58();
  sub_100029FB8((void *)&_mh_execute_header, v0, v1, "Rejecting new connection from bundleID: %{public}@ as it has no valid 'aps-environment' entitlement string", v2, v3, v4, v5, v6);
}

void sub_10002CC00()
{
  sub_10001BF58();
  sub_100029FB8((void *)&_mh_execute_header, v0, v1, "Pending request as client %{public}@ has no complication registered with WatchKit.", v2, v3, v4, v5, v6);
}

void sub_10002CC68()
{
  sub_10001BF58();
  sub_100029FB8((void *)&_mh_execute_header, v0, v1, "bundleID: %{public}@, dropping incoming message because the app did not launch in time", v2, v3, v4, v5, v6);
}

void sub_10002CCD0()
{
  sub_10001BF58();
  sub_100029FB8((void *)&_mh_execute_header, v0, v1, "bundleID: %{public}@, dropping incoming message because the app failed to launch", v2, v3, v4, v5, v6);
}

void sub_10002CD38(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = NSPrintF();
  *(_DWORD *)buf = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "bundleID: %{public}@, failed with error %{public}@", buf, 0x16u);
}

void sub_10002CDF4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "bundleID: %{public}@, failed to acquire process assertion wiht error %{public}@", (uint8_t *)&v4, 0x16u);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_MD5(data, len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CLKActiveComplicationsFromActivePairedDevice()
{
  return _CLKActiveComplicationsFromActivePairedDevice();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyMultipleAnswers()
{
  return _MGCopyMultipleAnswers();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t NSAppendPrintF()
{
  return _NSAppendPrintF();
}

uint64_t NSPrintF()
{
  return _NSPrintF();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t WCCheckFileAndConsumeSandboxTokenForAuditToken()
{
  return _WCCheckFileAndConsumeSandboxTokenForAuditToken();
}

uint64_t WCCheckFileAndConsumeSandboxTokenForProcessID()
{
  return _WCCheckFileAndConsumeSandboxTokenForProcessID();
}

uint64_t WCCompactStringFromCollection()
{
  return _WCCompactStringFromCollection();
}

uint64_t WCDashboardLogJSON()
{
  return _WCDashboardLogJSON();
}

uint64_t WCDeleteItemAtURL()
{
  return _WCDeleteItemAtURL();
}

uint64_t WCFileTransfersURLInContainer()
{
  return _WCFileTransfersURLInContainer();
}

uint64_t WCInboxAppContextFolderURLInContainer()
{
  return _WCInboxAppContextFolderURLInContainer();
}

uint64_t WCSessionFilesURLInContainer()
{
  return _WCSessionFilesURLInContainer();
}

uint64_t WCTransferIdentifierFromComplicationIdentifier()
{
  return _WCTransferIdentifierFromComplicationIdentifier();
}

uint64_t WCTransferredFilesURLInContainer()
{
  return _WCTransferredFilesURLInContainer();
}

uint64_t WCTransferredUserInfoInboxURLInContainer()
{
  return _WCTransferredUserInfoInboxURLInContainer();
}

uint64_t WCUserInfoTransfersInContainer()
{
  return _WCUserInfoTransfersInContainer();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return __CTServerConnectionCopyCellularUsagePolicy();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return _fclonefileat(a1, a2, a3, a4);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

uint64_t wc_log()
{
  return _wc_log();
}

uint64_t wc_pushkit_log()
{
  return _wc_pushkit_log();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t xpc_connection_copy_bundle_id()
{
  return _xpc_connection_copy_bundle_id();
}

uint64_t xpc_connection_is_extension()
{
  return _xpc_connection_is_extension();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_acknowledgedState(void *a1, const char *a2, ...)
{
  return [a1 acknowledgedState];
}

id objc_msgSend_activeDeviceConnected(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceConnected];
}

id objc_msgSend_activeIDSDevice(void *a1, const char *a2, ...)
{
  return [a1 activeIDSDevice];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_allApplications(void *a1, const char *a2, ...)
{
  return [a1 allApplications];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowMessageSending(void *a1, const char *a2, ...)
{
  return [a1 allowMessageSending];
}

id objc_msgSend_altAccountCache(void *a1, const char *a2, ...)
{
  return [a1 altAccountCache];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applicationInfo(void *a1, const char *a2, ...)
{
  return [a1 applicationInfo];
}

id objc_msgSend_applicationWorkspace(void *a1, const char *a2, ...)
{
  return [a1 applicationWorkspace];
}

id objc_msgSend_assertion(void *a1, const char *a2, ...)
{
  return [a1 assertion];
}

id objc_msgSend_assertionInvalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 assertionInvalidationHandler];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDToClient(void *a1, const char *a2, ...)
{
  return [a1 bundleIDToClient];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_byteCompletedCount(void *a1, const char *a2, ...)
{
  return [a1 byteCompletedCount];
}

id objc_msgSend_byteTotalCount(void *a1, const char *a2, ...)
{
  return [a1 byteTotalCount];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canRunIndependentlyOfCompanionApp(void *a1, const char *a2, ...)
{
  return [a1 canRunIndependentlyOfCompanionApp];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_clearPersistedClientState(void *a1, const char *a2, ...)
{
  return [a1 clearPersistedClientState];
}

id objc_msgSend_clearRemoteAcknowledgedState(void *a1, const char *a2, ...)
{
  return [a1 clearRemoteAcknowledgedState];
}

id objc_msgSend_clientCurrentPairingID(void *a1, const char *a2, ...)
{
  return [a1 clientCurrentPairingID];
}

id objc_msgSend_clientData(void *a1, const char *a2, ...)
{
  return [a1 clientData];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_clientStorageFileURL(void *a1, const char *a2, ...)
{
  return [a1 clientStorageFileURL];
}

id objc_msgSend_clientSupportsActiveDeviceSwitch(void *a1, const char *a2, ...)
{
  return [a1 clientSupportsActiveDeviceSwitch];
}

id objc_msgSend_clientsDeniedComplicationRegister(void *a1, const char *a2, ...)
{
  return [a1 clientsDeniedComplicationRegister];
}

id objc_msgSend_clientsStorageURL(void *a1, const char *a2, ...)
{
  return [a1 clientsStorageURL];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_communicationID(void *a1, const char *a2, ...)
{
  return [a1 communicationID];
}

id objc_msgSend_companionAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 companionAppBundleID];
}

id objc_msgSend_companionAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 companionAppBundleIdentifier];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_complicationEnabled(void *a1, const char *a2, ...)
{
  return [a1 complicationEnabled];
}

id objc_msgSend_complicationTransferIdentifier(void *a1, const char *a2, ...)
{
  return [a1 complicationTransferIdentifier];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return [a1 coordinator];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyVoucher(void *a1, const char *a2, ...)
{
  return [a1 copyVoucher];
}

id objc_msgSend_coreLocationData(void *a1, const char *a2, ...)
{
  return [a1 coreLocationData];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterpartCanEstablishXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 counterpartCanEstablishXPCConnection];
}

id objc_msgSend_counterpartCanEstablishXPCConnectionCalled(void *a1, const char *a2, ...)
{
  return [a1 counterpartCanEstablishXPCConnectionCalled];
}

id objc_msgSend_createDuetComplications(void *a1, const char *a2, ...)
{
  return [a1 createDuetComplications];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deliverPendingItems(void *a1, const char *a2, ...)
{
  return [a1 deliverPendingItems];
}

id objc_msgSend_dequeuePendingComplicationPings(void *a1, const char *a2, ...)
{
  return [a1 dequeuePendingComplicationPings];
}

id objc_msgSend_dequeuePendingContent(void *a1, const char *a2, ...)
{
  return [a1 dequeuePendingContent];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_developmentConnection(void *a1, const char *a2, ...)
{
  return [a1 developmentConnection];
}

id objc_msgSend_deviceInformation(void *a1, const char *a2, ...)
{
  return [a1 deviceInformation];
}

id objc_msgSend_deviceStatus(void *a1, const char *a2, ...)
{
  return [a1 deviceStatus];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryMessage(void *a1, const char *a2, ...)
{
  return [a1 dictionaryMessage];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_doWork(void *a1, const char *a2, ...)
{
  return [a1 doWork];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_duetComplications(void *a1, const char *a2, ...)
{
  return [a1 duetComplications];
}

id objc_msgSend_enabledTopics(void *a1, const char *a2, ...)
{
  return [a1 enabledTopics];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_expectsResponse(void *a1, const char *a2, ...)
{
  return [a1 expectsResponse];
}

id objc_msgSend_failed(void *a1, const char *a2, ...)
{
  return [a1 failed];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return [a1 file];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fileIdentifier];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return [a1 firstUnlocked];
}

id objc_msgSend_flushReadyBlocks(void *a1, const char *a2, ...)
{
  return [a1 flushReadyBlocks];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_handlLocalFirstUnlockStateChanged(void *a1, const char *a2, ...)
{
  return [a1 handlLocalFirstUnlockStateChanged];
}

id objc_msgSend_handleActiveComplicationsChanged(void *a1, const char *a2, ...)
{
  return [a1 handleActiveComplicationsChanged];
}

id objc_msgSend_handleActiveDeviceSwitchStarted(void *a1, const char *a2, ...)
{
  return [a1 handleActiveDeviceSwitchStarted];
}

id objc_msgSend_handleCounterpartDaemonDidStart(void *a1, const char *a2, ...)
{
  return [a1 handleCounterpartDaemonDidStart];
}

id objc_msgSend_handleInstalledApplicationsChanged(void *a1, const char *a2, ...)
{
  return [a1 handleInstalledApplicationsChanged];
}

id objc_msgSend_handleInstalledAppsChangedMessage(void *a1, const char *a2, ...)
{
  return [a1 handleInstalledAppsChangedMessage];
}

id objc_msgSend_handleMessageSendingAllowed(void *a1, const char *a2, ...)
{
  return [a1 handleMessageSendingAllowed];
}

id objc_msgSend_handleRemainingComplicationUserInfoTransfersReset(void *a1, const char *a2, ...)
{
  return [a1 handleRemainingComplicationUserInfoTransfersReset];
}

id objc_msgSend_handleSwitchStartedByIDS(void *a1, const char *a2, ...)
{
  return [a1 handleSwitchStartedByIDS];
}

id objc_msgSend_handleXPCInvalidation(void *a1, const char *a2, ...)
{
  return [a1 handleXPCInvalidation];
}

id objc_msgSend_hasAcknowledgedState(void *a1, const char *a2, ...)
{
  return [a1 hasAcknowledgedState];
}

id objc_msgSend_hasComplication(void *a1, const char *a2, ...)
{
  return [a1 hasComplication];
}

id objc_msgSend_hasComplications(void *a1, const char *a2, ...)
{
  return [a1 hasComplications];
}

id objc_msgSend_hasCoreLocationData(void *a1, const char *a2, ...)
{
  return [a1 hasCoreLocationData];
}

id objc_msgSend_hasIncreasedPriorityTraffic(void *a1, const char *a2, ...)
{
  return [a1 hasIncreasedPriorityTraffic];
}

id objc_msgSend_hasIsInUse(void *a1, const char *a2, ...)
{
  return [a1 hasIsInUse];
}

id objc_msgSend_hasSuccess(void *a1, const char *a2, ...)
{
  return [a1 hasSuccess];
}

id objc_msgSend_hasValidConfiguration(void *a1, const char *a2, ...)
{
  return [a1 hasValidConfiguration];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iOSApplicationsContainingActiveComplications(void *a1, const char *a2, ...)
{
  return [a1 iOSApplicationsContainingActiveComplications];
}

id objc_msgSend_iOSApplicationsContainingComplications(void *a1, const char *a2, ...)
{
  return [a1 iOSApplicationsContainingComplications];
}

id objc_msgSend_iOSApplicationsContainingWatchApp(void *a1, const char *a2, ...)
{
  return [a1 iOSApplicationsContainingWatchApp];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiersToSyncSessions(void *a1, const char *a2, ...)
{
  return [a1 identifiersToSyncSessions];
}

id objc_msgSend_idsInsecureServiceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsInsecureServiceIdentifier];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return [a1 idsService];
}

id objc_msgSend_idsServiceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsServiceIdentifier];
}

id objc_msgSend_ignoredTopics(void *a1, const char *a2, ...)
{
  return [a1 ignoredTopics];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_indexCache(void *a1, const char *a2, ...)
{
  return [a1 indexCache];
}

id objc_msgSend_informationData(void *a1, const char *a2, ...)
{
  return [a1 informationData];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialSetUpComplete(void *a1, const char *a2, ...)
{
  return [a1 initialSetUpComplete];
}

id objc_msgSend_insecureIDSService(void *a1, const char *a2, ...)
{
  return [a1 insecureIDSService];
}

id objc_msgSend_installStatus(void *a1, const char *a2, ...)
{
  return [a1 installStatus];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateConnection(void *a1, const char *a2, ...)
{
  return [a1 invalidateConnection];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isActiveDeviceConnected(void *a1, const char *a2, ...)
{
  return [a1 isActiveDeviceConnected];
}

id objc_msgSend_isAlwaysReachable(void *a1, const char *a2, ...)
{
  return [a1 isAlwaysReachable];
}

id objc_msgSend_isCancellable(void *a1, const char *a2, ...)
{
  return [a1 isCancellable];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCompanionAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isCompanionAppInstalled];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isCurrentComplicationInfo(void *a1, const char *a2, ...)
{
  return [a1 isCurrentComplicationInfo];
}

id objc_msgSend_isDictionaryMessage(void *a1, const char *a2, ...)
{
  return [a1 isDictionaryMessage];
}

id objc_msgSend_isEqual(void *a1, const char *a2, ...)
{
  return [a1 isEqual];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isInUse(void *a1, const char *a2, ...)
{
  return [a1 isInUse];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPausable(void *a1, const char *a2, ...)
{
  return [a1 isPausable];
}

id objc_msgSend_isProductionEnvironment(void *a1, const char *a2, ...)
{
  return [a1 isProductionEnvironment];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isRunningIndependently(void *a1, const char *a2, ...)
{
  return [a1 isRunningIndependently];
}

id objc_msgSend_isStandaloneWatchApp(void *a1, const char *a2, ...)
{
  return [a1 isStandaloneWatchApp];
}

id objc_msgSend_isWatchAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isWatchAppInstalled];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadInstalledWatchApps(void *a1, const char *a2, ...)
{
  return [a1 loadInstalledWatchApps];
}

id objc_msgSend_loadPersistedClientState(void *a1, const char *a2, ...)
{
  return [a1 loadPersistedClientState];
}

id objc_msgSend_loadRemoteAcknowledgedState(void *a1, const char *a2, ...)
{
  return [a1 loadRemoteAcknowledgedState];
}

id objc_msgSend_loadRemoteFirstUnlockState(void *a1, const char *a2, ...)
{
  return [a1 loadRemoteFirstUnlockState];
}

id objc_msgSend_localDeviceFirstUnlocked(void *a1, const char *a2, ...)
{
  return [a1 localDeviceFirstUnlocked];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_loggingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 loggingIdentifier];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_monitoredBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 monitoredBundleIDs];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newSerialOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 newSerialOperationQueue];
}

id objc_msgSend_newSessionState(void *a1, const char *a2, ...)
{
  return [a1 newSessionState];
}

id objc_msgSend_notifyOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 notifyOperationQueue];
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return [a1 nsuuid];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_originalDestinationDevice(void *a1, const char *a2, ...)
{
  return [a1 originalDestinationDevice];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_outstandingMessagesToSend(void *a1, const char *a2, ...)
{
  return [a1 outstandingMessagesToSend];
}

id objc_msgSend_outstandingMessagesToSendCount(void *a1, const char *a2, ...)
{
  return [a1 outstandingMessagesToSendCount];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return [a1 paired];
}

id objc_msgSend_pairedDeviceInformation(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceInformation];
}

id objc_msgSend_pairedDevicesPairingIDs(void *a1, const char *a2, ...)
{
  return [a1 pairedDevicesPairingIDs];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pendingContentDequeued(void *a1, const char *a2, ...)
{
  return [a1 pendingContentDequeued];
}

id objc_msgSend_pendingPayloads(void *a1, const char *a2, ...)
{
  return [a1 pendingPayloads];
}

id objc_msgSend_persistClientState(void *a1, const char *a2, ...)
{
  return [a1 persistClientState];
}

id objc_msgSend_previousReachable(void *a1, const char *a2, ...)
{
  return [a1 previousReachable];
}

id objc_msgSend_privateClientInterface(void *a1, const char *a2, ...)
{
  return [a1 privateClientInterface];
}

id objc_msgSend_privateDaemonInterface(void *a1, const char *a2, ...)
{
  return [a1 privateDaemonInterface];
}

id objc_msgSend_privilegedCalled(void *a1, const char *a2, ...)
{
  return [a1 privilegedCalled];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productionConnection(void *a1, const char *a2, ...)
{
  return [a1 productionConnection];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressToken(void *a1, const char *a2, ...)
{
  return [a1 progressToken];
}

id objc_msgSend_protobufData(void *a1, const char *a2, ...)
{
  return [a1 protobufData];
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return [a1 publish];
}

id objc_msgSend_reachable(void *a1, const char *a2, ...)
{
  return [a1 reachable];
}

id objc_msgSend_receivedFirstUnlockState(void *a1, const char *a2, ...)
{
  return [a1 receivedFirstUnlockState];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_releaseVoucher(void *a1, const char *a2, ...)
{
  return [a1 releaseVoucher];
}

id objc_msgSend_remoteDeviceFirstUnlocked(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceFirstUnlocked];
}

id objc_msgSend_remoteFirstUnlocked(void *a1, const char *a2, ...)
{
  return [a1 remoteFirstUnlocked];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestFirstUnlockStateIfNeccessary(void *a1, const char *a2, ...)
{
  return [a1 requestFirstUnlockStateIfNeccessary];
}

id objc_msgSend_resetInitialState(void *a1, const char *a2, ...)
{
  return [a1 resetInitialState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return [a1 retainArguments];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_retrySetupInitialStateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 retrySetupInitialStateIfNeeded];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sendDaemonDidStart(void *a1, const char *a2, ...)
{
  return [a1 sendDaemonDidStart];
}

id objc_msgSend_sendFirstUnlockState(void *a1, const char *a2, ...)
{
  return [a1 sendFirstUnlockState];
}

id objc_msgSend_sendInstalledAppsChangedMessage(void *a1, const char *a2, ...)
{
  return [a1 sendInstalledAppsChangedMessage];
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 serviceIdentifier];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setUpApplicationStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 setUpApplicationStateMonitor];
}

id objc_msgSend_setUpInitialState(void *a1, const char *a2, ...)
{
  return [a1 setUpInitialState];
}

id objc_msgSend_setupBundleIDMonitoring(void *a1, const char *a2, ...)
{
  return [a1 setupBundleIDMonitoring];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedComplication(void *a1, const char *a2, ...)
{
  return [a1 sharedComplication];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPushKitManager(void *a1, const char *a2, ...)
{
  return [a1 sharedPushKitManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedSystemMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedSystemMonitor];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return [a1 standardizedURL];
}

id objc_msgSend_startMonitoringWatchAppUIStates(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringWatchAppUIStates];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subscribeToAllNotifications(void *a1, const char *a2, ...)
{
  return [a1 subscribeToAllNotifications];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return [a1 succinctDescriptionBuilder];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemObserverComplicationsInstalledChanged(void *a1, const char *a2, ...)
{
  return [a1 systemObserverComplicationsInstalledChanged];
}

id objc_msgSend_terminateApplicationDueToSwitchIfEligible(void *a1, const char *a2, ...)
{
  return [a1 terminateApplicationDueToSwitchIfEligible];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_transferIdentifier(void *a1, const char *a2, ...)
{
  return [a1 transferIdentifier];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return [a1 uniqueIDOverride];
}

id objc_msgSend_uniqueInstallID(void *a1, const char *a2, ...)
{
  return [a1 uniqueInstallID];
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return [a1 unpublish];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAllClientsWithValues(void *a1, const char *a2, ...)
{
  return [a1 updateAllClientsWithValues];
}

id objc_msgSend_updateClientWithSessionState(void *a1, const char *a2, ...)
{
  return [a1 updateClientWithSessionState];
}

id objc_msgSend_updateLocalFirstUnlockState(void *a1, const char *a2, ...)
{
  return [a1 updateLocalFirstUnlockState];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInfoData(void *a1, const char *a2, ...)
{
  return [a1 userInfoData];
}

id objc_msgSend_validApplications(void *a1, const char *a2, ...)
{
  return [a1 validApplications];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_watchAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 watchAppBundleIdentifier];
}

id objc_msgSend_watchAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 watchAppInstalled];
}

id objc_msgSend_watchConnectivityServiceAvailable(void *a1, const char *a2, ...)
{
  return [a1 watchConnectivityServiceAvailable];
}

id objc_msgSend_watchExtensionBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 watchExtensionBundleIdentifier];
}

id objc_msgSend_watchKitAppExtensionBundleID(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppExtensionBundleID];
}

id objc_msgSend_watchKitVersion(void *a1, const char *a2, ...)
{
  return [a1 watchKitVersion];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return [a1 xpcListener];
}