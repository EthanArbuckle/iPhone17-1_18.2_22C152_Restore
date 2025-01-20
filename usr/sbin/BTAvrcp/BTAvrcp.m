void sub_100002544(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(void);
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void block[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = [*(id *)(a1 + 32) condition];
  [v7 lock];

  if ([*(id *)(a1 + 32) pendingSwitchers])
  {
    v5[2](v5);
    v8 = *(void **)(a1 + 32);
    v9 = (char *)[v8 pendingSwitchers] - 1;
    [v8 setPendingSwitchers:v9];
    if (!v9)
    {
      v10 = [*(id *)(a1 + 32) condition];
      [v10 signal];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002684;
    block[3] = &unk_100018780;
    v13 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v11 = [*(id *)(a1 + 32) condition];
  [v11 unlock];
}

uint64_t sub_100002684(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100002970(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_10000297C()
{
  v0 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

id sub_100002E18(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_100002EE0(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_BOOL];
  v7[0] = v1;
  v8[0] = &stru_100018850;
  v2 = +[NSValue valueWithPointer:&_xpc_type_int64];
  v7[1] = v2;
  v8[1] = &stru_100018870;
  v3 = +[NSValue valueWithPointer:&_xpc_type_uint64];
  v7[2] = v3;
  v8[2] = &stru_100018890;
  v4 = +[NSValue valueWithPointer:&_xpc_type_double];
  v7[3] = v4;
  v8[3] = &stru_1000188B0;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v6 = (void *)qword_10001F188;
  qword_10001F188 = v5;
}

NSNumber *__cdecl sub_100003018(id a1, OS_xpc_object *a2)
{
  BOOL value = xpc_BOOL_get_value(a2);

  return +[NSNumber numberWithBool:value];
}

NSNumber *__cdecl sub_10000305C(id a1, OS_xpc_object *a2)
{
  int64_t value = xpc_int64_get_value(a2);

  return +[NSNumber numberWithLongLong:value];
}

NSNumber *__cdecl sub_1000030A0(id a1, OS_xpc_object *a2)
{
  uint64_t value = xpc_uint64_get_value(a2);

  return +[NSNumber numberWithUnsignedLongLong:value];
}

NSNumber *__cdecl sub_1000030E4(id a1, OS_xpc_object *a2)
{
  double value = xpc_double_get_value(a2);

  return +[NSNumber numberWithDouble:value];
}

void sub_1000031C8(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_string];
  v4 = v1;
  uint64_t v5 = &stru_100018910;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = (void *)qword_10001F198;
  qword_10001F198 = v2;
}

NSString *__cdecl sub_100003270(id a1, OS_xpc_object *a2)
{
  string_ptr = xpc_string_get_string_ptr(a2);

  return +[NSString stringWithUTF8String:string_ptr];
}

void sub_100003358(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_dictionary];
  v4 = v1;
  uint64_t v5 = &stru_100018970;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = (void *)qword_10001F1A8;
  qword_10001F1A8 = v2;
}

OS_xpc_object *__cdecl sub_100003400(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;

  return v2;
}

void sub_100003850(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100003870()
{
  return v0;
}

void sub_100003908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100003974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_100003B1C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _timerEvent];
}

id sub_100003B24(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimer:0];
}

void sub_100003C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t start()
{
  sub_10000A004("BTAvrcp");
  uint64_t v0 = [[BTXpcService alloc] initWithName:"com.apple.BTServer.avrcp" sessionClass:objc_opt_class()];
  if (v0)
  {
    v1 = +[NSRunLoop currentRunLoop];
    [v1 run];
  }
  return 1;
}

void sub_100004AB4(void *a1, uint64_t a2)
{
  if (a2 == 5)
  {
    uint64_t v6 = a1[7];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    v3 = (void *)a1[4];
    uint64_t v4 = +[NSString stringWithFormat:@"%lu", v6];
    id v9 = (id)v4;
    CFStringRef v5 = @"kTrackCount";
    goto LABEL_11;
  }
  if (a2 == 4)
  {
    uint64_t v2 = a1[6];
    if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    v3 = (void *)a1[4];
    uint64_t v4 = +[NSString stringWithFormat:@"%lu", v2];
    id v9 = (id)v4;
    CFStringRef v5 = @"kTrackNumber";
LABEL_11:
    [v3 setValue:v4 forKey:v5];

    return;
  }
  uint64_t v7 = a1[4];
  v8 = (void *)a1[5];

  _[v8 setReplyAttributeForID:a2 inReplyAttributes:v7];
}

void sub_100006B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    MRPlaybackQueueGetContentItemAtOffset();
    MRContentItemGetArtworkData();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      CFStringRef v5 = +[NSMutableDictionary dictionary];
      [v5 setValue:v6 forKey:@"kImageData"];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

id sub_100006D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) sendReplyToMsg:*(void *)(a1 + 40) status:a2 args:a3];
}

void sub_1000075B8(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      uint64_t v4 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v4 trackTitle];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v6 = *(void **)(a1 + 40);
      CFStringRef v7 = @"kTitle";
      goto LABEL_19;
    case 2:
      v8 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v8 trackArtist];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v6 = *(void **)(a1 + 40);
      CFStringRef v7 = @"kArtist";
      goto LABEL_19;
    case 3:
      id v9 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v9 trackAlbum];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v6 = *(void **)(a1 + 40);
      CFStringRef v7 = @"kAlbum";
      goto LABEL_19;
    case 4:
      uint64_t v10 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v10 trackQueueIndex];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v11 = [v21 unsignedIntegerValue];
      v12 = *(void **)(a1 + 40);
      v13 = +[NSString stringWithFormat:@"%lu", v11];
      CFStringRef v14 = @"kTrackNumber";
      goto LABEL_16;
    case 5:
      v15 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v15 trackQueueCount];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v16 = [v21 unsignedIntegerValue];
      v12 = *(void **)(a1 + 40);
      v13 = +[NSString stringWithFormat:@"%lu", v16];
      CFStringRef v14 = @"kTrackCount";
      goto LABEL_16;
    case 6:
      v17 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v17 trackGenre];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v6 = *(void **)(a1 + 40);
      CFStringRef v7 = @"kGenre";
      goto LABEL_19;
    case 7:
      v18 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v18 trackDuration];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v19 = [v21 unsignedIntegerValue];
      v12 = *(void **)(a1 + 40);
      v13 = +[NSString stringWithFormat:@"%lu", v19];
      CFStringRef v14 = @"kPlayingTime";
LABEL_16:
      [v12 setValue:v13 forKey:v14];

      break;
    case 8:
      v20 = [*(id *)(a1 + 32) nowPlayingInfo];
      id v21 = [v20 trackImageHandle];

      CFStringRef v5 = v21;
      if (!v21) {
        goto LABEL_21;
      }
      id v6 = *(void **)(a1 + 40);
      CFStringRef v7 = @"kImageHandle";
LABEL_19:
      [v6 setValue:v21 forKey:v7];
      break;
    default:
      return;
  }
  CFStringRef v5 = v21;
LABEL_21:
}

uint64_t sub_10000A004(char *category)
{
  qword_10001F1C0 = (uint64_t)os_log_create("com.apple.bluetooth", category);

  return _objc_release_x1();
}

void sub_10000ACDC(id a1, NSDictionary *a2)
{
  uint64_t v2 = a2;
  v3 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplySuccess];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID];
    id v6 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v5;
      CFStringRef v7 = v6;
      int v15 = 136315138;
      id v16 = [v5 UTF8String];
      v8 = "ABC Snapshot successful with SessionID %s";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
    }
  }
  else
  {
    id v11 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplyReason];
    signed int v12 = [v11 intValue];

    id v5 = [(NSDictionary *)v2 objectForKeyedSubscript:kSymptomDiagnosticReplyReasonString];
    v13 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = (void *)v12;
      id v5 = v5;
      CFStringRef v7 = v13;
      int v15 = 134218242;
      id v16 = v14;
      __int16 v17 = 2080;
      id v18 = [v5 UTF8String];
      v8 = "ABC Snapshot failed with code %lld and reason: %s";
      id v9 = v7;
      uint32_t v10 = 22;
      goto LABEL_6;
    }
  }
}

void sub_10000BA04(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BB2C;
  v10[3] = &unk_100018AE0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BB34;
  v7[3] = &unk_100018AE0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v12;
  id v5 = *(void (**)(uint64_t, void *, void *))(v4 + 16);
  id v6 = v12;
  v5(v4, v10, v7);
}

id sub_10000BB2C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setRecentStations:*(void *)(a1 + 40)];
}

id sub_10000BB34(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setRecentStations:*(void *)(a1 + 40)];
}

void sub_10000BBA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BC44;
  v5[3] = &unk_100018AE0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id sub_10000BC44(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setRecentStations:*(void *)(a1 + 40)];
}

void sub_10000BCF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint32_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) stations:v12];
        [v4 addObjectsFromArray:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v11 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000FE50(v11, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000CA08(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) setReplyAttributeForID:a2 inReplyAttributes:*(void *)(a1 + 40)];
}

uint64_t sub_10000D268(uint64_t a1, uint64_t a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D328;
  v5[3] = &unk_100018B80;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D334;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v2 + 16))(v2, v5, v4);
}

id sub_10000D328(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _infoDidChange:*(void *)(a1 + 40)];
}

id sub_10000D334(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshInfo];
}

uint64_t sub_10000D33C(uint64_t a1, uint64_t a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D3FC;
  v5[3] = &unk_100018B80;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D408;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v2 + 16))(v2, v5, v4);
}

id sub_10000D3FC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _appDidChange:*(void *)(a1 + 40)];
}

id sub_10000D408(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshApp];
}

uint64_t sub_10000D410(uint64_t a1, char a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D4D4;
  v5[3] = &unk_100018BF8;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D4EC;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v2 + 16))(v2, v5, v4);
}

id sub_10000D4D4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _appIsPlayingDidChange:*(unsigned char *)(a1 + 40) != 0];
}

id sub_10000D4EC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshAppIsPlaying];
}

uint64_t sub_10000D4F4(uint64_t a1, char a2, uint64_t a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D5B8;
  v6[3] = &unk_100018C48;
  char v9 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D5D0;
  v5[3] = &unk_100018998;
  void v5[4] = v7;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v3 + 16))(v3, v6, v5);
}

id *sub_10000D5B8(id *result)
{
  if (*((unsigned char *)result + 48)) {
    return (id *)_[result[4] _activeOriginDidChange:result[5]];
  }
  return result;
}

id sub_10000D5D0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshActiveOrigin];
}

uint64_t sub_10000D5D8(uint64_t a1, uint64_t a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D698;
  v5[3] = &unk_100018B80;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D6D8;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, void *, void *))(v2 + 16))(v2, v5, v4);
}

void sub_10000D698(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) _supportedCommandsDidChange:];
}

id sub_10000D6D8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _refreshSupportedCommands];
}

id sub_10000D7F4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _infoDidChange:a2];
}

id sub_10000D874(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _appDidChange:a2];
}

id sub_10000D8F4(uint64_t a1, int a2)
{
  return _[*(id *)(a1 + 32) _appIsPlayingDidChange:a2 != 0];
}

id *sub_10000D978(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] _activeOriginDidChange:];
  }
  return result;
}

void sub_10000D9FC(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) _supportedCommandsDidChange:a2];
}

void sub_10000EF7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000F950(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create XPC server", v1, 2u);
}

void sub_10000F994(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "XPC server error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FA0C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected XPC server event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FA84(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC connection does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_10000FAC8(char a1, void *a2)
{
  if (a1) {
    CFStringRef v3 = @"reply";
  }
  else {
    CFStringRef v3 = @"message";
  }
  id v4 = a2;
  id v5 = [(id)sub_100003870() description];
  int v6 = 138412546;
  CFStringRef v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending XPC %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10000FB98(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100003870() description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received XPC message: %@", (uint8_t *)&v4, 0xCu);
}

void sub_10000FC3C(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100003870() description];
  sub_100003850((void *)&_mh_execute_header, v4, v5, "XPC connection error: %@", v6, v7, v8, v9, 2u);
}

void sub_10000FCD0(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100003870() description];
  sub_100003850((void *)&_mh_execute_header, v4, v5, "Unexpected XPC connection event: %@", v6, v7, v8, v9, 2u);
}

void sub_10000FD64(void *a1, void *a2)
{
  CFStringRef v3 = a1;
  uint64_t v4 = [a2 builtQuery];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Built query: %@", (uint8_t *)&v5, 0xCu);
}

void sub_10000FE0C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out fetching recent stations", v1, 2u);
}

void sub_10000FE50(void *a1, void *a2)
{
  CFStringRef v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 count];
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Found %lu recent stations", (uint8_t *)&v4, 0xCu);
}

void sub_10000FEEC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out initializing NowPlayingInfo state", v1, 2u);
}

void sub_10000FF30(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "De-allocating now playing information", v1, 2u);
}

void sub_10000FF74()
{
  sub_10000EF98();
  sub_10000EF7C((void *)&_mh_execute_header, v0, v1, "Info did change: %@", v2, v3, v4, v5, v6);
}

void sub_10000FFDC()
{
  sub_10000EF98();
  sub_10000EF7C((void *)&_mh_execute_header, v0, v1, "AppIdentifier did change: %@", v2, v3, v4, v5, v6);
}

void sub_100010044(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000100C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PlaybackQueue did change", v1, 2u);
}

void sub_10001010C(void *a1, const void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (__CFString *)CFCopyDescription(a2);
  sub_10000EF98();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ActiveOrigin did change: %@", v5, 0xCu);
}

void sub_1000101AC()
{
  sub_10000EF98();
  sub_10000EF7C((void *)&_mh_execute_header, v0, v1, "SupportedCommands did change: %@", v2, v3, v4, v5, v6);
}

void sub_100010214(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Missing artwork identifier. CurrentArtworkIdentifier: %@", (uint8_t *)&v3, 0xCu);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t MRContentItemGetArtworkData()
{
  return _MRContentItemGetArtworkData();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return _MRMediaRemoteCommandInfoGetCommand();
}

uint64_t MRMediaRemoteCommandInfoGetIntegerValueForKey()
{
  return _MRMediaRemoteCommandInfoGetIntegerValueForKey();
}

uint64_t MRMediaRemoteCopySupportedCommands()
{
  return _MRMediaRemoteCopySupportedCommands();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return _MRMediaRemoteGetActiveOrigin();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return _MRMediaRemoteGetLocalOrigin();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationDisplayID()
{
  return _MRMediaRemoteGetNowPlayingApplicationDisplayID();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationIsPlaying()
{
  return _MRMediaRemoteGetNowPlayingApplicationIsPlaying();
}

uint64_t MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork()
{
  return _MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return _MRMediaRemoteRegisterForNowPlayingNotifications();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return _MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
}

uint64_t MRMediaRemoteSendCommand()
{
  return _MRMediaRemoteSendCommand();
}

uint64_t MRMediaRemoteSetAppPlaybackQueue()
{
  return _MRMediaRemoteSetAppPlaybackQueue();
}

uint64_t MRMediaRemoteSetRepeatMode()
{
  return _MRMediaRemoteSetRepeatMode();
}

uint64_t MRMediaRemoteSetShuffleMode()
{
  return _MRMediaRemoteSetShuffleMode();
}

uint64_t MRMediaRemoteSetWantsOriginChangeNotifications()
{
  return _MRMediaRemoteSetWantsOriginChangeNotifications();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return _MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return _MRMediaRemoteUnregisterForNowPlayingNotifications();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return _MRNowPlayingPlayerPathCreate();
}

uint64_t MROriginIsLocalOrigin()
{
  return _MROriginIsLocalOrigin();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return _MRPlaybackQueueGetContentItemAtOffset();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return _MRPlaybackQueueRequestCreate();
}

uint64_t MRPlaybackQueueRequestSetIncludeArtwork()
{
  return _MRPlaybackQueueRequestSetIncludeArtwork();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return _MRSystemAppPlaybackQueueCreate();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return _MRSystemAppPlaybackQueueDestroy();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return _MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryData()
{
  return _MRSystemAppPlaybackQueueSetLocalQueryData();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID()
{
  return _MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t WriteStackshotReportWithPID()
{
  return _WriteStackshotReportWithPID();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void abort(void)
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__defaultPlaybackRate(void *a1, const char *a2, ...)
{
  return _[a1 _defaultPlaybackRate];
}

id objc_msgSend__handleConnection_(void *a1, const char *a2, ...)
{
  return [a1 _handleConnection:];
}

id objc_msgSend__initializeState(void *a1, const char *a2, ...)
{
  return _[a1 _initializeState];
}

id objc_msgSend__objectForKey_dict_optional_converters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_objectForKey:dict:optional:converters:");
}

id objc_msgSend__playbackRate(void *a1, const char *a2, ...)
{
  return _[a1 _playbackRate];
}

id objc_msgSend__playbackStateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _playbackStateDidChange];
}

id objc_msgSend__settingsDidChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_settingsDidChange:");
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startTimer];
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopTimer];
}

id objc_msgSend__supportedCommandsDidChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_supportedCommandsDidChange:");
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return _[a1 _timeout];
}

id objc_msgSend__trackDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _trackDidChange];
}

id objc_msgSend__trackHash(void *a1, const char *a2, ...)
{
  return _[a1 _trackHash];
}

id objc_msgSend_activeCategories(void *a1, const char *a2, ...)
{
  return _[a1 activeCategories];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return [a1 addFilterPredicate:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_albumName_(void *a1, const char *a2, ...)
{
  return [a1 albumName:];
}

id objc_msgSend_albumsQuery(void *a1, const char *a2, ...)
{
  return _[a1 albumsQuery];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForIdentifier:];
}

id objc_msgSend_archivedDataWithRootObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archivedDataWithRootObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_artistHasSingleAlbum_(void *a1, const char *a2, ...)
{
  return [a1 artistHasSingleAlbum:];
}

id objc_msgSend_artistName_(void *a1, const char *a2, ...)
{
  return [a1 artistName:];
}

id objc_msgSend_artistsQuery(void *a1, const char *a2, ...)
{
  return _[a1 artistsQuery];
}

id objc_msgSend_attributeIDsFromArgs_(void *a1, const char *a2, ...)
{
  return [a1 attributeIDsFromArgs:];
}

id objc_msgSend_baseQuery(void *a1, const char *a2, ...)
{
  return _[a1 baseQuery];
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _[a1 beginTransaction];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_browsablePlayers(void *a1, const char *a2, ...)
{
  return _[a1 browsablePlayers];
}

id objc_msgSend_builtQuery(void *a1, const char *a2, ...)
{
  return _[a1 builtQuery];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_changePath_replyBlock_(void *a1, const char *a2, ...)
{
  return [a1 changePath:replyBlock:];
}

id objc_msgSend_childrenCount(void *a1, const char *a2, ...)
{
  return _[a1 childrenCount];
}

id objc_msgSend_collectionAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 collectionAtIndex:];
}

id objc_msgSend_collectionWithUid_property_(void *a1, const char *a2, ...)
{
  return [a1 collectionWithUid:property:];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return _[a1 collections];
}

id objc_msgSend_composerHasSingleAlbum_(void *a1, const char *a2, ...)
{
  return [a1 composerHasSingleAlbum:];
}

id objc_msgSend_composersQuery(void *a1, const char *a2, ...)
{
  return _[a1 composersQuery];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _[a1 condition];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_createFolderWithUid_folder_(void *a1, const char *a2, ...)
{
  return [a1 createFolderWithUid:folder];
}

id objc_msgSend_createSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 createSwitcher];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 currentPlaybackState];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _[a1 currentSettings];
}

id objc_msgSend_currentTrackHash(void *a1, const char *a2, ...)
{
  return _[a1 currentTrackHash];
}

id objc_msgSend_currentVFSPath(void *a1, const char *a2, ...)
{
  return _[a1 currentVFSPath];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return _[a1 defaultMediaLibrary];
}

id objc_msgSend_defaultRadioLibrary(void *a1, const char *a2, ...)
{
  return _[a1 defaultRadioLibrary];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_effectiveAlbumArtist(void *a1, const char *a2, ...)
{
  return _[a1 effectiveAlbumArtist];
}

id objc_msgSend_encodings(void *a1, const char *a2, ...)
{
  return _[a1 encodings];
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 endGeneratingLibraryChangeNotifications];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return _[a1 endTransaction];
}

id objc_msgSend_enumerateAttributeIDs_(void *a1, const char *a2, ...)
{
  return [a1 enumerateAttributeIDs:];
}

id objc_msgSend_fetchRecentStations_(void *a1, const char *a2, ...)
{
  return [a1 fetchRecentStations:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_folderNameForUid_(void *a1, const char *a2, ...)
{
  return [a1 folderNameForUid:];
}

id objc_msgSend_folderTypeForUid_(void *a1, const char *a2, ...)
{
  return [a1 folderTypeForUid:];
}

id objc_msgSend_genresQuery(void *a1, const char *a2, ...)
{
  return _[a1 genresQuery];
}

id objc_msgSend_getCurrentPath_(void *a1, const char *a2, ...)
{
  return [a1 getCurrentPath:];
}

id objc_msgSend_getMediaPlayersFromStart_toEnd_replyBlock_(void *a1, const char *a2, ...)
{
  return [a1 getMediaPlayersFromStart:toEnd:replyBlock:];
}

id objc_msgSend_getNowPlayingAttributeIDs_reply_(void *a1, const char *a2, ...)
{
  return [a1 getNowPlayingAttributeIDs:reply:];
}

id objc_msgSend_getNowPlayingItemWithUid_attributeIDs_reply_(void *a1, const char *a2, ...)
{
  return [a1 getNowPlayingItemWithUid:attributeIDs:reply:];
}

id objc_msgSend_getNowPlayingItemsCount(void *a1, const char *a2, ...)
{
  return _[a1 getNowPlayingItemsCount];
}

id objc_msgSend_getNowPlayingItemsFromStart_toEnd_attributeIDs_replyBlock_(void *a1, const char *a2, ...)
{
  return [a1 getNowPlayingItemsFromStart:toEnd:attributeIDs:replyBlock:];
}

id objc_msgSend_getRecentStationGroupsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getRecentStationGroupsWithCompletionHandler:");
}

id objc_msgSend_getSearchItemWithUid_attributeIDs_reply_(void *a1, const char *a2, ...)
{
  return [a1 getSearchItemWithUid:attributeIDs:reply:];
}

id objc_msgSend_getSearchItemsCount(void *a1, const char *a2, ...)
{
  return _[a1 getSearchItemsCount];
}

id objc_msgSend_getSearchItemsFromStart_toEnd_attributeIDs_replyBlock_(void *a1, const char *a2, ...)
{
  return [a1 getSearchItemsFromStart:toEnd:attributeIDs:replyBlock:];
}

id objc_msgSend_getVFSItemWithUid_attributeIDs_reply_(void *a1, const char *a2, ...)
{
  return [a1 getVFSItemWithUid:attributeIDs:reply:];
}

id objc_msgSend_getVFSItemsCount(void *a1, const char *a2, ...)
{
  return _[a1 getVFSItemsCount];
}

id objc_msgSend_getVFSItemsFromStart_toEnd_attributeIDs_replyBlock_(void *a1, const char *a2, ...)
{
  return [a1 getVFSItemsFromStart:toEnd:attributeIDs:replyBlock:];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return [a1 handleMsg:];
}

id objc_msgSend_hasAlbums(void *a1, const char *a2, ...)
{
  return _[a1 hasAlbums];
}

id objc_msgSend_hasArtists(void *a1, const char *a2, ...)
{
  return _[a1 hasArtists];
}

id objc_msgSend_hasAudiobooks(void *a1, const char *a2, ...)
{
  return _[a1 hasAudiobooks];
}

id objc_msgSend_hasCompilations(void *a1, const char *a2, ...)
{
  return _[a1 hasCompilations];
}

id objc_msgSend_hasComposers(void *a1, const char *a2, ...)
{
  return _[a1 hasComposers];
}

id objc_msgSend_hasGenres(void *a1, const char *a2, ...)
{
  return _[a1 hasGenres];
}

id objc_msgSend_hasMedia(void *a1, const char *a2, ...)
{
  return _[a1 hasMedia];
}

id objc_msgSend_hasPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 hasPlaylists];
}

id objc_msgSend_hasPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 hasPodcasts];
}

id objc_msgSend_hasSongs(void *a1, const char *a2, ...)
{
  return _[a1 hasSongs];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heights(void *a1, const char *a2, ...)
{
  return _[a1 heights];
}

id objc_msgSend_indexOfNowPlayingItem(void *a1, const char *a2, ...)
{
  return _[a1 indexOfNowPlayingItem];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithName_sessionClass_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:sessionClass:];
}

id objc_msgSend_initWithName_uid_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:uid:];
}

id objc_msgSend_initWithName_uid_isRecentlyAdded_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 uid:x1 isRecentlyAdded:x2];
}

id objc_msgSend_initWithName_uid_parentPlaylistID_isRecentlyAdded_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 uid:x1 parentPlaylistID:x2 isRecentlyAdded:x3];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isBrowsablePlayer(void *a1, const char *a2, ...)
{
  return _[a1 isBrowsablePlayer];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isForwarding(void *a1, const char *a2, ...)
{
  return _[a1 isForwarding];
}

id objc_msgSend_isLocalOrigin(void *a1, const char *a2, ...)
{
  return _[a1 isLocalOrigin];
}

id objc_msgSend_isMusicApp(void *a1, const char *a2, ...)
{
  return _[a1 isMusicApp];
}

id objc_msgSend_isRecentlyAdded(void *a1, const char *a2, ...)
{
  return _[a1 isRecentlyAdded];
}

id objc_msgSend_isRewinding(void *a1, const char *a2, ...)
{
  return _[a1 isRewinding];
}

id objc_msgSend_isTransacting(void *a1, const char *a2, ...)
{
  return _[a1 isTransacting];
}

id objc_msgSend_itemAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 itemAtIndex:];
}

id objc_msgSend_itemWithUid_(void *a1, const char *a2, ...)
{
  return [a1 itemWithUid:];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lazyLibrary(void *a1, const char *a2, ...)
{
  return _[a1 lazyLibrary];
}

id objc_msgSend_lazyNowPlayingInfo(void *a1, const char *a2, ...)
{
  return _[a1 lazyNowPlayingInfo];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_libraryDidChange(void *a1, const char *a2, ...)
{
  return _[a1 libraryDidChange];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:x0 value:x1 table:x2];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_mobileBluetoothBundle(void *a1, const char *a2, ...)
{
  return _[a1 mobileBluetoothBundle];
}

id objc_msgSend_mrActiveOrigin(void *a1, const char *a2, ...)
{
  return _[a1 mrActiveOrigin];
}

id objc_msgSend_mrAppIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mrAppIdentifier];
}

id objc_msgSend_mrAppIsPlaying(void *a1, const char *a2, ...)
{
  return _[a1 mrAppIsPlaying];
}

id objc_msgSend_mrInfo(void *a1, const char *a2, ...)
{
  return _[a1 mrInfo];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nowPlayingInfo(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingInfo];
}

id objc_msgSend_nowPlayingItem(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingItem];
}

id objc_msgSend_nowPlayingItemAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingItemAtIndex:];
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItems];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_parentPlaylistID(void *a1, const char *a2, ...)
{
  return _[a1 parentPlaylistID];
}

id objc_msgSend_pendingSwitchers(void *a1, const char *a2, ...)
{
  return _[a1 pendingSwitchers];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_playItemWithUid_(void *a1, const char *a2, ...)
{
  return [a1 playItemWithUid:];
}

id objc_msgSend_playNowPlayingItemWithUid_(void *a1, const char *a2, ...)
{
  return [a1 playNowPlayingItemWithUid:];
}

id objc_msgSend_playSearchItemWithUid_(void *a1, const char *a2, ...)
{
  return [a1 playSearchItemWithUid:];
}

id objc_msgSend_playVFSItemWithUid_(void *a1, const char *a2, ...)
{
  return [a1 playVFSItemWithUid:];
}

id objc_msgSend_playbackQueueDidChange(void *a1, const char *a2, ...)
{
  return _[a1 playbackQueueDidChange];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _[a1 playbackState];
}

id objc_msgSend_playbackStateDidChange_(void *a1, const char *a2, ...)
{
  return [a1 playbackStateDidChange:];
}

id objc_msgSend_playerDidChange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "playerDidChange:");
}

id objc_msgSend_playerId(void *a1, const char *a2, ...)
{
  return _[a1 playerId];
}

id objc_msgSend_playerName(void *a1, const char *a2, ...)
{
  return _[a1 playerName];
}

id objc_msgSend_playlistIsFolder_(void *a1, const char *a2, ...)
{
  return [a1 playlistIsFolder:];
}

id objc_msgSend_playlistsQuery(void *a1, const char *a2, ...)
{
  return _[a1 playlistsQuery];
}

id objc_msgSend_playlistsRecentlyAddedQuery(void *a1, const char *a2, ...)
{
  return _[a1 playlistsRecentlyAddedQuery];
}

id objc_msgSend_predicateForProperty_(void *a1, const char *a2, ...)
{
  return [a1 predicateForProperty:];
}

id objc_msgSend_predicateWithSearchString_forProperties_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithSearchString:x0 forProperties:x1];
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithValue:forProperty:];
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _[a1 predicates];
}

id objc_msgSend_propertiesForUid(void *a1, const char *a2, ...)
{
  return _[a1 propertiesForUid];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:x0, x1];
}

id objc_msgSend_recentStations(void *a1, const char *a2, ...)
{
  return _[a1 recentStations];
}

id objc_msgSend_recentlyAddedFolderName(void *a1, const char *a2, ...)
{
  return _[a1 recentlyAddedFolderName];
}

id objc_msgSend_refreshActiveCategories(void *a1, const char *a2, ...)
{
  return _[a1 refreshActiveCategories];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_replyAttributesForIDs_(void *a1, const char *a2, ...)
{
  return [a1 replyAttributesForIDs:];
}

id objc_msgSend_replyAttributesForUid_attributeIDs_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "replyAttributesForUid:attributeIDs:");
}

id objc_msgSend_replyFolderWithType_uid_name_(void *a1, const char *a2, ...)
{
  return [a1 replyFolderWithType:uid:name:];
}

id objc_msgSend_replyItemAtIndex_attributeIDs_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "replyItemAtIndex:attributeIDs:");
}

id objc_msgSend_replyItemWithAttributeIDs_(void *a1, const char *a2, ...)
{
  return [a1 replyItemWithAttributeIDs:];
}

id objc_msgSend_replyItemWithUid_name_attributes_(void *a1, const char *a2, ...)
{
  return [a1 replyItemWithUid:name:attributes:];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return _[a1 representativeItem];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_search_replyBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "search:replyBlock:");
}

id objc_msgSend_sendMsg_(void *a1, const char *a2, ...)
{
  return [a1 sendMsg:];
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return [a1 sendMsg:args:];
}

id objc_msgSend_sendReply_(void *a1, const char *a2, ...)
{
  return [a1 sendReply:];
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _[a1 sessionClass];
}

id objc_msgSend_setActiveCategories_(void *a1, const char *a2, ...)
{
  return [a1 setActiveCategories:];
}

id objc_msgSend_setBuiltQuery_(void *a1, const char *a2, ...)
{
  return [a1 setBuiltQuery:];
}

id objc_msgSend_setCloudFilteringType_(void *a1, const char *a2, ...)
{
  return [a1 setCloudFilteringType:];
}

id objc_msgSend_setCurrentPlaybackState_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPlaybackState:];
}

id objc_msgSend_setCurrentSearchQuery_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSearchQuery:];
}

id objc_msgSend_setCurrentSettings_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSettings:];
}

id objc_msgSend_setCurrentTrackHash_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTrackHash:];
}

id objc_msgSend_setCurrentVFSPath_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentVFSPath:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setFilteringDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setFilteringDisabled:];
}

id objc_msgSend_setGroupingType_(void *a1, const char *a2, ...)
{
  return [a1 setGroupingType:];
}

id objc_msgSend_setIsForwarding_(void *a1, const char *a2, ...)
{
  return [a1 setIsForwarding:];
}

id objc_msgSend_setIsRewinding_(void *a1, const char *a2, ...)
{
  return [a1 setIsRewinding:];
}

id objc_msgSend_setIsTransacting_(void *a1, const char *a2, ...)
{
  return [a1 setIsTransacting:];
}

id objc_msgSend_setLazyLibrary_(void *a1, const char *a2, ...)
{
  return [a1 setLazyLibrary:];
}

id objc_msgSend_setLazyNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return [a1 setLazyNowPlayingInfo:];
}

id objc_msgSend_setMrActiveOrigin_(void *a1, const char *a2, ...)
{
  return [a1 setMrActiveOrigin:];
}

id objc_msgSend_setMrAppIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setMrAppIdentifier:];
}

id objc_msgSend_setMrAppIsPlaying_(void *a1, const char *a2, ...)
{
  return [a1 setMrAppIsPlaying:];
}

id objc_msgSend_setMrInfo_(void *a1, const char *a2, ...)
{
  return [a1 setMrInfo:];
}

id objc_msgSend_setNowPlayingItem_(void *a1, const char *a2, ...)
{
  return [a1 setNowPlayingItem:];
}

id objc_msgSend_setPendingSwitchers_(void *a1, const char *a2, ...)
{
  return [a1 setPendingSwitchers:];
}

id objc_msgSend_setQueueWithQuery_firstItem_(void *a1, const char *a2, ...)
{
  return [a1 setQueueWithQuery:firstItem:];
}

id objc_msgSend_setQueueWithRadioStation_(void *a1, const char *a2, ...)
{
  return [a1 setQueueWithRadioStation:];
}

id objc_msgSend_setShouldIncludeNonLibraryEntities_(void *a1, const char *a2, ...)
{
  return [a1 setShouldIncludeNonLibraryEntities:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTimerTransactionCount_(void *a1, const char *a2, ...)
{
  return [a1 setTimerTransactionCount:];
}

id objc_msgSend_setTransactionCount_(void *a1, const char *a2, ...)
{
  return [a1 setTransactionCount:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsDidChange_(void *a1, const char *a2, ...)
{
  return [a1 settingsDidChange:];
}

id objc_msgSend_showRecentlyAddedFolder(void *a1, const char *a2, ...)
{
  return _[a1 showRecentlyAddedFolder];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_stationWithUid_(void *a1, const char *a2, ...)
{
  return [a1 stationWithUid:];
}

id objc_msgSend_stations(void *a1, const char *a2, ...)
{
  return _[a1 stations];
}

id objc_msgSend_storePredicate_(void *a1, const char *a2, ...)
{
  return [a1 storePredicate:];
}

id objc_msgSend_storePredicates_(void *a1, const char *a2, ...)
{
  return [a1 storePredicates:];
}

id objc_msgSend_storedPredicates(void *a1, const char *a2, ...)
{
  return _[a1 storedPredicates];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_systemMusicPlayer(void *a1, const char *a2, ...)
{
  return _[a1 systemMusicPlayer];
}

id objc_msgSend_targetApp(void *a1, const char *a2, ...)
{
  return _[a1 targetApp];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:x0];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timerTransactionCount(void *a1, const char *a2, ...)
{
  return _[a1 timerTransactionCount];
}

id objc_msgSend_trackAlbum(void *a1, const char *a2, ...)
{
  return _[a1 trackAlbum];
}

id objc_msgSend_trackArtist(void *a1, const char *a2, ...)
{
  return _[a1 trackArtist];
}

id objc_msgSend_trackDidChange_(void *a1, const char *a2, ...)
{
  return [a1 trackDidChange:];
}

id objc_msgSend_trackDuration(void *a1, const char *a2, ...)
{
  return _[a1 trackDuration];
}

id objc_msgSend_trackGenre(void *a1, const char *a2, ...)
{
  return _[a1 trackGenre];
}

id objc_msgSend_trackId(void *a1, const char *a2, ...)
{
  return _[a1 trackId];
}

id objc_msgSend_trackImageHandle(void *a1, const char *a2, ...)
{
  return _[a1 trackImageHandle];
}

id objc_msgSend_trackPosition(void *a1, const char *a2, ...)
{
  return _[a1 trackPosition];
}

id objc_msgSend_trackQueueCount(void *a1, const char *a2, ...)
{
  return _[a1 trackQueueCount];
}

id objc_msgSend_trackQueueIndex(void *a1, const char *a2, ...)
{
  return _[a1 trackQueueIndex];
}

id objc_msgSend_trackTitle(void *a1, const char *a2, ...)
{
  return _[a1 trackTitle];
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return _[a1 transactionCount];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _[a1 uid];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unplayedEpisodesFolderName(void *a1, const char *a2, ...)
{
  return _[a1 unplayedEpisodesFolderName];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}

id objc_msgSend_wait_(void *a1, const char *a2, ...)
{
  return [a1 wait:];
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return [a1 waitUntilDate:];
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return _[a1 watchdog];
}

id objc_msgSend_widths(void *a1, const char *a2, ...)
{
  return _[a1 widths];
}