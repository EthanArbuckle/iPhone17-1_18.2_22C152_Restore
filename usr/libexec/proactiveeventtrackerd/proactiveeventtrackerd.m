int main(int argc, const char **argv, const char **envp)
{
  NSObject *v3;
  id v4;
  void *v5;
  void handler[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PET daemon has launched", buf, 2u);
  }
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_source_set_event_handler(v3, &stru_10000C398);
  dispatch_resume(v3);
  _set_user_dir_suffix();
  v4 = NSTemporaryDirectory();
  v5 = objc_opt_new();
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to initialize PET service. Exiting...", buf, 2u);
    }
    exit(1);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003CD4;
  handler[3] = &unk_10000C3C0;
  handler[4] = v5;
  xpc_activity_register("com.apple.proactiveeventtrackerd.sendDaily", XPC_ACTIVITY_CHECK_IN, handler);
  xpc_activity_register("com.apple.proactiveeventtrackerd.updateAssetMetadata", XPC_ACTIVITY_CHECK_IN, &stru_10000C400);
  dispatch_main();
}

void sub_100003CD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running sendDaily", buf, 2u);
    }
    sub_100003E4C(v3);
    [*(id *)(a1 + 32) upload];
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DONE", v4, 2u);
    }
  }
}

void sub_100003DB8(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running updateAssetMetadata", v3, 2u);
    }
    +[PETService updateMobileAssetMetadataWithXPCActivity:v2];
    sub_100003E4C(v2);
  }
}

void sub_100003E4C(void *a1)
{
  id v1 = a1;
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  id v3 = dispatch_queue_create("com.apple.proactiveeventtrackerd.xpcMonitor", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003F18;
  block[3] = &unk_10000C428;
  id v6 = v1;
  id v4 = v1;
  dispatch_after(v2, v3, block);
}

void sub_100003F18(uint64_t a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking defer for XPC activity", buf, 2u);
  }
  while (state == 4 || state == 2)
  {
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting XPC activity state to DEFER", v5, 2u);
      }
      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v4 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DEFER", v4, 2u);
      }
      break;
    }
    +[NSThread sleepForTimeInterval:0.100000001];
    xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Finished checking defer for XPC activity", v3, 2u);
  }
}

void sub_1000040B4(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received SIGTERM. Exiting...", v1, 2u);
  }
  exit(0);
}

void sub_100004724(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@ to report data to FBFv2. Error: %@", buf, 0x16u);
    }
    v12[0] = @"reason";
    id v4 = +[NSString stringWithFormat:@"PFA__%@", v3];
    v12[1] = @"group";
    v13[0] = v4;
    v13[1] = *(void *)(a1 + 32);
    v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) length];
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2048;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ has been sent to FBFv2. Size: %lu", buf, 0x16u);
    }
    v8 = *(void **)(a1 + 40);
    v11[0] = *(void *)(a1 + 32);
    v10[0] = @"message_group";
    v10[1] = @"compressed_size";
    id v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 length]);
    v10[2] = @"upload_service";
    v11[1] = v4;
    v11[2] = @"PFA";
    v5 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  AnalyticsSendEvent();
}

void sub_1000052F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class sub_100005314(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100010A10)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_100005760;
    v6[4] = &unk_10000C528;
    v6[5] = v6;
    long long v7 = off_10000C510;
    uint64_t v8 = 0;
    qword_100010A10 = _sl_dlopen();
  }
  if (!qword_100010A10)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:"void *SearchFoundationLibrary(void)"];
    [v3 handleFailureInFunction:v4 file:@"PETService.m" lineNumber:37 description:@"%s" v6[0]];

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SFCustomFeedback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    v5 = +[NSString stringWithUTF8String:"Class getSFCustomFeedbackClass(void)_block_invoke"];
    [v3 handleFailureInFunction:v5 file:@"PETService.m" lineNumber:39 description:@"Unable to find class %s", "SFCustomFeedback"];

LABEL_10:
    __break(1u);
  }
  qword_100010A08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100005500(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100010A20)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_1000056EC;
    v6[4] = &unk_10000C528;
    v6[5] = v6;
    long long v7 = off_10000C548;
    uint64_t v8 = 0;
    qword_100010A20 = _sl_dlopen();
  }
  if (!qword_100010A20)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:"void *CoreParsecLibrary(void)"];
    [v3 handleFailureInFunction:v4 file:@"PETService.m" lineNumber:36 description:@"%s" v6[0]];

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PARSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    v5 = +[NSString stringWithUTF8String:"Class getPARSessionClass(void)_block_invoke"];
    [v3 handleFailureInFunction:v5 file:@"PETService.m" lineNumber:38 description:@"Unable to find class %s", "PARSession"];

LABEL_10:
    __break(1u);
  }
  qword_100010A18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000056EC()
{
  uint64_t result = _sl_dlopen();
  qword_100010A20 = result;
  return result;
}

uint64_t sub_100005760()
{
  uint64_t result = _sl_dlopen();
  qword_100010A10 = result;
  return result;
}

void sub_100005954(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v21[0] = @"reason";
    id v4 = +[NSString stringWithFormat:@"fbfv2__%@", v3];
    v22[0] = v4;
    v21[1] = @"group";
    v5 = [*(id *)(a1 + 32) metadata];
    id v6 = [v5 messageGroup];
    v22[1] = v6;
    long long v7 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    AnalyticsSendEvent();

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to report data to FBFv2. Error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) metadata];
      v9 = [v8 messageGroup];
      id v10 = [*(id *)(a1 + 40) length];
      *(_DWORD *)buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2048;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Upload data has been sent to FBFv2. messageGroup: %@; size: %lu",
        buf,
        0x16u);
    }
    v15[0] = @"message_group";
    v11 = [*(id *)(a1 + 32) metadata];
    v12 = [v11 messageGroup];
    v16[0] = v12;
    v15[1] = @"compressed_size";
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) length]);
    v15[2] = @"upload_service";
    v16[1] = v13;
    v16[2] = @"fbfv2";
    v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    AnalyticsSendEvent();
  }
}

void sub_100006058(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 sortUsingSelector:"compare:"];
  [*(id *)(a1 + 32) _pas_componentsJoinedByString:@"\n"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v6 dataUsingEncoding:4];
  [v4 writeData:v5];
}

void sub_1000060F8(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 _pas_componentsJoinedByString:@"\n"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 dataUsingEncoding:4];
  [v3 writeData:v4];
}

uint64_t sub_1000062B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) assembleUnaggregatedUploadWithTracker:*(void *)(*(void *)(a1 + 40) + 8) messageGroup:a2];
  if (v3) {
    [*(id *)(a1 + 40) _uploadWithUploadPackage:v3];
  }

  return _objc_release_x1();
}

void sub_100006650(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MobileAsset metadata has been downloaded successfully.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error downloading mobileasset metadata", v4, 2u);
    }
    AnalyticsSendEvent();
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DONE", v3, 2u);
  }
}

void sub_100006F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006F6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) compressedMessages];
  id v5 = [v4 length];

  if ((unint64_t)v5 <= 0x1F8000)
  {
    if (v3)
    {
      id v6 = *(unsigned char **)(a1 + 40);
      if (!v6[8])
      {
LABEL_9:
        [*(id *)(a1 + 32) addMessage:v3];
        [*(id *)(a1 + 56) addUnaggregatedMessages:v3];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        goto LABEL_13;
      }
      if ([v6 _canLog:v3 messageGroup:*(void *)(a1 + 48) isInternal:*(unsigned __int8 *)(a1 + 72)])
      {
        long long v7 = [*(id *)(a1 + 40) petConfig];
        uint64_t v8 = [v3 name];
        unsigned __int8 v9 = [v7 isAggregatedForMessageName:v8];

        if ((v9 & 1) == 0)
        {
          id v10 = *(void **)(a1 + 40);
          v11 = [v3 name];
          LODWORD(v10) = [v10 _checkMessageSampling:v11];

          if (v10)
          {
            v12 = [*(id *)(a1 + 40) petConfig];
            v13 = [v3 name];
            v14 = [v12 whitelistForMessageName:v13];

            if (v14)
            {
              id v15 = [v3 rawBytes];
              __int16 v16 = +[PETProtobufRawDecoder filterProtobufData:v15 withWhitelist:v14];
              [v3 setRawBytes:v16];

              goto LABEL_9;
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected nil message when enumerating log store: %@", buf, 0xCu);
      }
      v20[0] = @"reason";
      v20[1] = @"msg_group";
      uint64_t v17 = *(void *)(a1 + 48);
      v21[0] = @"nil_message";
      v21[1] = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      AnalyticsSendEvent();
    }
  }
LABEL_13:
}

void sub_100007644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007668(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) compressedMessages];
  id v5 = [v4 length];

  if ((unint64_t)v5 <= 0x1F8000)
  {
    if (v3)
    {
      id v6 = [v3 key];
      long long v7 = [v6 rawMessage];

      if (*(unsigned char *)(*(void *)(a1 + 40) + 8))
      {
        uint64_t v8 = [v7 name];
        unsigned int v9 = [v8 isEqualToString:@"PET1Key"];

        if (v9)
        {
          id v10 = objc_alloc((Class)PET1Key);
          uint64_t v11 = [v7 rawBytes];
          id v12 = [v10 initWithData:v11];

          LOBYTE(v11) = [*(id *)(a1 + 40) _canLogPET1Key:v12];
          if ((v11 & 1) == 0) {
            goto LABEL_14;
          }
        }
        else
        {
          if (![*(id *)(a1 + 40) _canLog:v7 messageGroup:@"_aggregated" isInternal:*(unsigned __int8 *)(a1 + 56)])goto LABEL_14; {
          v13 = [*(id *)(a1 + 40) petConfig];
          }
          v14 = [v7 name];
          id v15 = [v13 whitelistForMessageName:v14];

          if (!v15) {
            goto LABEL_14;
          }
          __int16 v16 = [v7 rawBytes];
          uint64_t v17 = +[PETProtobufRawDecoder filterProtobufData:v16 withWhitelist:v15];
          [v7 setRawBytes:v17];
        }
      }
      [*(id *)(a1 + 32) addMessage:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_14:

      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v18 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected nil message when enumerating aggregated state", v18, 2u);
    }
    AnalyticsSendEvent();
  }
LABEL_15:
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_MD5(data, len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t COMAPPLEPROACTIVEGMSGMSUberEventReadFrom()
{
  return _COMAPPLEPROACTIVEGMSGMSUberEventReadFrom();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OSAWriteLogForSubmission()
{
  return _OSAWriteLogForSubmission();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return _PBDataWriterWriteBareVarint();
}

uint64_t PBReaderReadVarIntBuf()
{
  return _PBReaderReadVarIntBuf();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int uname(utsname *a1)
{
  return _uname(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
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

id objc_msgSend__errorClose(void *a1, const char *a2, ...)
{
  return [a1 _errorClose];
}

id objc_msgSend__flushBuffer(void *a1, const char *a2, ...)
{
  return [a1 _flushBuffer];
}

id objc_msgSend_aggregateState(void *a1, const char *a2, ...)
{
  return [a1 aggregateState];
}

id objc_msgSend_aggregatedMessages(void *a1, const char *a2, ...)
{
  return [a1 aggregatedMessages];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_checkIntegrity(void *a1, const char *a2, ...)
{
  return [a1 checkIntegrity];
}

id objc_msgSend_clearAggregatedMessages(void *a1, const char *a2, ...)
{
  return [a1 clearAggregatedMessages];
}

id objc_msgSend_clearLogStores(void *a1, const char *a2, ...)
{
  return [a1 clearLogStores];
}

id objc_msgSend_clearUnaggregatedMessages(void *a1, const char *a2, ...)
{
  return [a1 clearUnaggregatedMessages];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_compressedMessages(void *a1, const char *a2, ...)
{
  return [a1 compressedMessages];
}

id objc_msgSend_configVersion(void *a1, const char *a2, ...)
{
  return [a1 configVersion];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentOsBuild(void *a1, const char *a2, ...)
{
  return [a1 currentOsBuild];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return [a1 deviceId];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getCountryCode(void *a1, const char *a2, ...)
{
  return [a1 getCountryCode];
}

id objc_msgSend_isConfigEnabled(void *a1, const char *a2, ...)
{
  return [a1 isConfigEnabled];
}

id objc_msgSend_isDNUEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDNUEnabled];
}

id objc_msgSend_isGm(void *a1, const char *a2, ...)
{
  return [a1 isGm];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return [a1 isInternal];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isInternalCarry(void *a1, const char *a2, ...)
{
  return [a1 isInternalCarry];
}

id objc_msgSend_isSeed(void *a1, const char *a2, ...)
{
  return [a1 isSeed];
}

id objc_msgSend_isTesting(void *a1, const char *a2, ...)
{
  return [a1 isTesting];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadPET1Config(void *a1, const char *a2, ...)
{
  return [a1 loadPET1Config];
}

id objc_msgSend_loadPETConfig(void *a1, const char *a2, ...)
{
  return [a1 loadPETConfig];
}

id objc_msgSend_messageGroup(void *a1, const char *a2, ...)
{
  return [a1 messageGroup];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pet1Config(void *a1, const char *a2, ...)
{
  return [a1 pet1Config];
}

id objc_msgSend_petConfig(void *a1, const char *a2, ...)
{
  return [a1 petConfig];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_rawBytes(void *a1, const char *a2, ...)
{
  return [a1 rawBytes];
}

id objc_msgSend_rawMessage(void *a1, const char *a2, ...)
{
  return [a1 rawMessage];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_rootDir(void *a1, const char *a2, ...)
{
  return [a1 rootDir];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_shouldUploadToFBFv2(void *a1, const char *a2, ...)
{
  return [a1 shouldUploadToFBFv2];
}

id objc_msgSend_shouldUploadToFBFv2ForCarryAndSeed(void *a1, const char *a2, ...)
{
  return [a1 shouldUploadToFBFv2ForCarryAndSeed];
}

id objc_msgSend_shouldUploadToParsec(void *a1, const char *a2, ...)
{
  return [a1 shouldUploadToParsec];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_typeId(void *a1, const char *a2, ...)
{
  return [a1 typeId];
}

id objc_msgSend_unaggregatedMessages(void *a1, const char *a2, ...)
{
  return [a1 unaggregatedMessages];
}

id objc_msgSend_upload(void *a1, const char *a2, ...)
{
  return [a1 upload];
}

id objc_msgSend_uploadTime(void *a1, const char *a2, ...)
{
  return [a1 uploadTime];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_wrapAsAnyEvent(void *a1, const char *a2, ...)
{
  return [a1 wrapAsAnyEvent];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return [a1 writeData:];
}