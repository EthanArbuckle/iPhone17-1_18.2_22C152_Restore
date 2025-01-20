void sub_100004C00(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t vars8;

  v2 = +[TITypingAssertion sharedTypingAssertion];
  [v2 restResetTouches];

  v3 = +[TITransientLexiconManager sharedInstance];
  v4 = [v3 supplementalLexicons];
  [v4 clearActiveLexicon];

  v5 = +[TIKeyboardInputManagerLoader sharedLoader];
  v6 = [v5 interactingConnection];
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    v8 = +[TIKeyboardInputManagerLoader sharedLoader];
    [v8 setInteractingConnection:0];
  }
}

BOOL sub_10000517C(id a1, NSURL *a2, NSError *a3)
{
  v4 = a2;
  v5 = a3;
  v6 = TYALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100010878(v4, (uint64_t)v5, v6);
  }

  return 1;
}

uint64_t _isTypologyURL(void *a1)
{
  id v1 = a1;
  id v12 = 0;
  unsigned int v2 = [v1 getResourceValue:&v12 forKey:NSURLIsDirectoryKey error:0];
  id v3 = v12;
  unsigned int v4 = [v1 isFileURL];
  if (v2) {
    unsigned int v5 = [v3 BOOLValue] ^ 1;
  }
  else {
    unsigned int v5 = 1;
  }
  v6 = [v1 lastPathComponent];
  unsigned int v7 = [v6 hasPrefix:@"typology"];

  v8 = [v1 pathExtension];
  if ([v8 isEqualToString:@"log"])
  {
    unsigned int v9 = 1;
  }
  else
  {
    v10 = [v1 pathExtension];
    unsigned int v9 = [v10 isEqualToString:@"plist"];
  }
  return v4 & v2 & v5 & v7 & v9;
}

void sub_100005ED8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id IXATestAppRelayLog()
{
  if (qword_100026DB0 != -1) {
    dispatch_once(&qword_100026DB0, &stru_10001C780);
  }
  v0 = (void *)qword_100026DA8;
  return v0;
}

void sub_100005F54(id a1)
{
  qword_100026DA8 = (uint64_t)os_log_create("com.apple.inputanalytics", "testAppRelay");
  _objc_release_x1();
}

void sub_100005FEC(id a1)
{
  qword_100026DB8 = objc_alloc_init(IXATestAppRelayServer);
  _objc_release_x1();
}

void sub_100006BAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006C28(id a1)
{
  qword_100026DC8 = objc_alloc_init(TIDiagnosticHelper);
  _objc_release_x1();
}

uint64_t sub_1000070FC(mach_msg_id_t a1)
{
  msg.msgh_remote_port = dword_100026DD8;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_bits = 0x1800000015;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = a1;
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint64_t sub_1000072FC(uint64_t a1)
{
  qword_100026DE0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_100007654(uint64_t a1)
{
  id v2 = +[TIKeyboardInputManagerLoader sharedLoader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 hasActiveInputManagers];
}

void sub_100007824(uint64_t a1)
{
  id v2 = +[TIKeyboardInputManagerLoader sharedLoader];
  id v3 = [v2 activeInputModeIdentifiers];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  unsigned int v5 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = TIInputModeGetSWLayout();
        if (v9 && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v9, v10))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_12;
        }
      }
      v6 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

void sub_100007C2C(id a1)
{
  qword_100026DF0 = objc_alloc_init(TITypologyLogTransferServer);
  _objc_release_x1();
}

BOOL sub_1000083A0(id a1, IDSDevice *a2, unint64_t a3, BOOL *a4)
{
  return [(IDSDevice *)a2 isDefaultPairedDevice];
}

void sub_1000087F8(id a1)
{
  qword_100026E00 = objc_alloc_init(TIEmojiAlternativesServer);
  _objc_release_x1();
}

void sub_100008AA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (*(void *)(a1 + 32))
  {
    v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13), "candidate", (void)v15);
          [v8 addObject:v14];

          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100008D00()
{
  qword_100026E10 = objc_opt_new();
  return _objc_release_x1();
}

uint64_t sub_10000915C(uint64_t a1)
{
  id v2 = +[TIAppAutofillManager sharedInstance];
  [v2 obtainCredential:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  kdebug_trace();
  id v4 = kac_get_log();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0x3E8uLL, "kbdStartup.entryPoint", (const char *)&unk_10001B5F7, buf, 2u);
  }

  pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE, 0);
  id v5 = +[TIDiagnosticHelper sharedInstance];
  id v6 = [v5 registerForSignal:30 withBlock:&stru_10001C950];

  uint64_t v7 = +[NSOperationQueue mainQueue];
  [v7 addOperationWithBlock:&stru_10001C970];

  +[TICoreAnalyticsEventController registerScheduledEventsActivity];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10001C9B0);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10001C9D0);

  int out_token = 0;
  notify_register_dispatch("com.apple.language.changed", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_10001C9F0);

  kdebug_trace();
  v8 = kac_get_log();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0x3E8uLL, "kbdStartup.entryPoint", (const char *)&unk_10001B5F7, v12, 2u);
  }

  id v9 = +[DDSServer sharedInstance];
  id v10 = +[NSRunLoop mainRunLoop];
  [v10 run];

  return 0;
}

void sub_1000093D8(id a1, int a2)
{
  if (TICanLogMessageAtLevel())
  {
    id v2 = TIOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100010F20();
    }
  }
  +[TILanguageModelLoaderManager performMaintenance];
}

void sub_100009434(id a1)
{
  kdebug_trace();
  id v1 = kac_get_log();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_INTERVAL_BEGIN, 0x3E9uLL, "kbdStartup.dirCreate", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v2 = +[NSFileManager defaultManager];
  id v3 = +[TIKeyboardInputManager keyboardUserDirectory];
  id v45 = 0;
  unsigned __int8 v4 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v45];
  id v5 = v45;

  if ((v4 & 1) == 0 && TICanLogMessageAtLevel())
  {
    id v6 = TIOSLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100010FC4((uint64_t)v5);
    }
  }
  kdebug_trace();
  uint64_t v7 = kac_get_log();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0x3E9uLL, "kbdStartup.dirCreate", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v8 = kac_get_log();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0x3EAuLL, "kbdStartup.assetManager", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v9 = +[TIAssetManager sharedAssetManager];
  kdebug_trace();
  id v10 = kac_get_log();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0x3EAuLL, "kbdStartup.assetManager", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  id v11 = kac_get_log();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0x3EBuLL, "kbdStartup.inputManagerServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v12 = +[TIKeyboardInputManagerServer sharedKeyboardInputManagerServer];
  kdebug_trace();
  long long v13 = kac_get_log();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0x3EBuLL, "kbdStartup.inputManagerServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v14 = kac_get_log();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0x3ECuLL, "kbdStartup.remoteDataServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v15 = +[TIRemoteDataServer sharedRemoteDataServer];
  kdebug_trace();
  long long v16 = kac_get_log();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0x3ECuLL, "kbdStartup.remoteDataServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  long long v17 = kac_get_log();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0x3EDuLL, "kbdStartup.typingAssertion", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v18 = +[TITypingAssertion sharedTypingAssertion];
  kdebug_trace();
  v19 = kac_get_log();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0x3EDuLL, "kbdStartup.typingAssertion", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v20 = kac_get_log();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0x3EEuLL, "kbdStartup.userDictionaryServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  v21 = +[TIUserDictionaryServer sharedInstance];
  [v21 startServer];

  kdebug_trace();
  v22 = kac_get_log();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0x3EEuLL, "kbdStartup.userDictionaryServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v23 = kac_get_log();
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0x3EFuLL, "kbdStartup.lexiconServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v24 = +[TILexiconServer sharedLexiconServer];
  kdebug_trace();
  v25 = kac_get_log();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0x3EFuLL, "kbdStartup.lexiconServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v26 = kac_get_log();
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0x3F0uLL, "kbdStartup.emojiPreferencesService", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v27 = +[EMFEmojiPreferencesService sharedServiceWithMachName:0];
  kdebug_trace();
  v28 = kac_get_log();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0x3F0uLL, "kbdStartup.emojiPreferencesService", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v29 = kac_get_log();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0x3F1uLL, "kbdStartup.accessibilityServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v30 = +[TIAccessibilityServer sharedAccessibilityServer];
  kdebug_trace();
  v31 = kac_get_log();
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0x3F1uLL, "kbdStartup.accessibilityServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v32 = kac_get_log();
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, 0x3F2uLL, "kbdStartup.imageCacheServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v33 = +[TIImageCacheServer sharedInstance];
  kdebug_trace();
  v34 = kac_get_log();
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0x3F2uLL, "kbdStartup.imageCacheServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v35 = kac_get_log();
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0x3F3uLL, "kbdStartup.preferencesControllerService", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v36 = +[TIPreferencesControllerService sharedPreferencesController];
  kdebug_trace();
  v37 = kac_get_log();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0x3F3uLL, "kbdStartup.preferencesControllerService", (const char *)&unk_10001B5F7, buf, 2u);
  }

  kdebug_trace();
  v38 = kac_get_log();
  if (os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0x3F4uLL, "kbdStartup.autofillServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  id v39 = +[TIAutofillServer sharedAutofillServer];
  kdebug_trace();
  v40 = kac_get_log();
  if (os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0x3F4uLL, "kbdStartup.autofillServer", (const char *)&unk_10001B5F7, buf, 2u);
  }

  v41 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v41 registerMaintenanceActivity];

  id v42 = +[TITypologyLogTransferServer sharedServer];
  id v43 = +[TYATypologyAccessServer sharedServer];
  id v44 = +[IXATestAppRelayServer sharedServer];
}

void sub_100009FDC(id a1, OS_xpc_object *a2)
{
  xdict = a2;
  BOOL v2 = xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary;
  id v3 = xdict;
  if (v2)
  {
    unsigned __int8 v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
    if ([@"AppleKeyboardsPreferencesChangedNotification" isEqualToString:v4])
    {
      id v5 = +[NSNotificationCenter defaultCenter];
      [v5 postNotificationName:TIAppleKeyboardsPreferencesChangedNotification_Private object:0];
    }
    id v3 = xdict;
  }
}

void sub_10000A0A4(id a1, OS_xpc_object *a2)
{
  xdict = a2;
  BOOL v2 = xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary;
  id v3 = xdict;
  if (v2)
  {
    unsigned __int8 v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
    if ([@"com.apple.LaunchServices.applicationUnregistered" isEqualToString:v4])
    {
      id v5 = xpc_dictionary_get_value(xdict, "UserInfo");
      if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
      {
        id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        uint64_t v7 = +[NSNotificationCenter defaultCenter];
        uint64_t v8 = TIApplicationUnregisteredNotification_Private;
        id v9 = [v6 objectForKeyedSubscript:@"bundleIDs"];
        [v7 postNotificationName:v8 object:v9];
      }
    }

    id v3 = xdict;
  }
}

void sub_10000A1D8(id a1, int a2)
{
}

void sub_10000A1EC(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

uint64_t sub_10000A2AC()
{
  qword_100026E20 = objc_opt_new();
  return _objc_release_x1();
}

uint64_t sub_10000AB50()
{
  qword_100026E30 = objc_opt_new();
  return _objc_release_x1();
}

uint64_t sub_10000B040()
{
  qword_100026E40 = objc_opt_new();
  return _objc_release_x1();
}

void sub_10000B6C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = +[TILexiconEntry entryWithDocumentText:a2 userInput:0];
  [v2 addObject:v3];
}

uint64_t sub_10000B874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B884(uint64_t a1)
{
}

void sub_10000B88C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)TIWordTokenizer);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v9)];
        [*(id *)(a1 + 32) addContact:v10 toEntries:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) usingTokenizer:v4];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v11 = +[TIUserDictionaryServer sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000BA5C;
  v14[3] = &unk_10001CA68;
  v14[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 40);
  id v12 = (id)v13;
  long long v15 = v13;
  [v11 getPhraseShortcutPairs:v14];
}

void sub_10000BA5C(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 count];
  if (v3)
  {
    unint64_t v4 = (unint64_t)v3;
    for (unint64_t i = 0; i < v4; i += 2)
    {
      id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v7 = [v10 objectAtIndex:i];
      uint64_t v8 = [v10 objectAtIndex:i + 1];
      id v9 = +[TILexiconEntry entryWithDocumentText:v7 userInput:v8];
      [v6 addObject:v9];
    }
  }
  [*(id *)(a1 + 32) finishRequestWithEntries:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completion:*(void *)(a1 + 40)];
}

void sub_10000C2A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if (v10)
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    NSLog(@"%@: Account query failed with error: %@", v6, v10);

    id v7 = [*(id *)(a1 + 32) cond];
    [v7 lock];

    [*(id *)(a1 + 32) setValid:0];
    uint64_t v8 = [*(id *)(a1 + 32) cond];
    [v8 broadcast];

    id v9 = [*(id *)(a1 + 32) cond];
    [v9 unlock];
  }
  else
  {
    [*(id *)(a1 + 32) searchAccounts:a2];
  }
}

void sub_10000CD84(id a1)
{
  qword_100026E50 = objc_alloc_init(TYATypologyAccessServer);
  _objc_release_x1();
}

id TYALog()
{
  if (qword_100026E68 != -1) {
    dispatch_once(&qword_100026E68, &stru_10001CAF8);
  }
  v0 = (void *)qword_100026E60;
  return v0;
}

void sub_10000D408(id a1)
{
  qword_100026E60 = (uint64_t)os_log_create("com.apple.TextInput", "typologyAccess");
  _objc_release_x1();
}

void sub_10000D5BC(id a1)
{
  qword_100026E70 = objc_alloc_init(TILinguisticAssetDownloadServer);
  _objc_release_x1();
}

void sub_10000D64C(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TextInput.linguistic-asset-download-server", v3);
  BOOL v2 = (void *)qword_100026E80;
  qword_100026E80 = (uint64_t)v1;
}

uint64_t sub_10000D744(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

uint64_t sub_10000D7E4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

void sub_10000D8DC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isStarted])
  {
    BOOL v2 = +[TIAssetManager sharedAssetManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000D9D0;
    v5[3] = &unk_10001CB68;
    uint64_t v3 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    [v2 requestAssetDownloadForLanguage:v3 completion:v5];
  }
  else
  {
    unint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

uint64_t sub_10000D9D0(uint64_t a1, uint64_t a2)
{
  +[TILinguisticAssetDownloadServer serverResultForAssetManagerResult:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

Class sub_10000DD0C(uint64_t a1)
{
  if (!dlopen((const char *)[@"/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices" UTF8String], 1))
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"TIRemoteDataServer.m" lineNumber:238 description:@"Could not load AssistantServices.framework"];
  }
  Class result = objc_getClass("AFPreferences");
  qword_100026EA0 = (uint64_t)result;
  return result;
}

uint64_t sub_10000DE30(uint64_t a1)
{
  [*(id *)(a1 + 32) resolveAssistantFrameworkClasses];
  qword_100026EA8 = objc_opt_new();
  return _objc_release_x1();
}

void sub_10000E604(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (v3)
  {
    id v11 = v3;
    id v5 = +[NSArray arrayWithObjects:&v11 count:1];
    id v6 = +[CNContactVCardSerialization dataWithContacts:v5 error:0];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = +[TIRemoteDataServer sharedRemoteDataServer];
  uint64_t v8 = [v7 dispatchQueue];
  id v10 = *(id *)(a1 + 32);
  id v9 = v6;
  TIDispatchAsync();
}

uint64_t sub_10000E764(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000E8A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = +[TIRemoteDataServer sharedRemoteDataServer];
  id v5 = [v4 dispatchQueue];
  id v7 = *(id *)(a1 + 32);
  id v6 = v3;
  TIDispatchAsync();
}

uint64_t sub_10000E980(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000E9A4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [NSClassFromString(@"LSApplicationWorkspace") defaultWorkspace];
  id v6 = +[NSURL URLWithString:v4];

  id v8 = 0;
  LOBYTE(v4) = [v5 openSensitiveURL:v6 withOptions:v3 error:&v8];

  id v7 = v8;
  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100011620();
  }
}

void sub_10000EC20(uint64_t a1)
{
  if (qword_100026EB8)
  {
    BOOL v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    SInt32 error = 0;
    CFDictionaryRef v3 = [*(id *)(a1 + 32) notificationDetailsForType:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 48) == 2) {
      CFOptionFlags v4 = 35;
    }
    else {
      CFOptionFlags v4 = 0;
    }
    qword_100026EB8 = (uint64_t)CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v4, &error, v3);
    id v5 = *(void (***)(void, void))(a1 + 40);
    qword_100026EC0 = *(void *)(a1 + 48);
    if (error)
    {
      v5[2](v5, 0);
    }
    else
    {
      id v6 = [v5 copy];
      id v7 = (void *)qword_100026E90;
      qword_100026E90 = (uint64_t)v6;

      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, (CFUserNotificationRef)qword_100026EB8, (CFUserNotificationCallBack)sub_10000ED94, 0);
      if (RunLoopSource)
      {
        id v9 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v9, kCFRunLoopCommonModes);
        CFRelease(v9);
      }
      else
      {
        (*(void (**)(uint64_t, void))(qword_100026E90 + 16))(qword_100026E90, 0);
        if (qword_100026EB8)
        {
          CFUserNotificationCancel((CFUserNotificationRef)qword_100026EB8);
          CFRelease((CFTypeRef)qword_100026EB8);
          qword_100026EB8 = 0;
        }
      }
    }
  }
}

void sub_10000ED94(uint64_t a1, uint64_t a2)
{
  if (qword_100026EB8 != a1)
  {
    NSLog(@"Unexpected notification response received");
    return;
  }
  if (!qword_100026E90)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:"void _HandleUserNotificationCallBack(CFUserNotificationRef, CFOptionFlags)"];
    [v10 handleFailureInFunction:v11 file:@"TIRemoteDataServer.m" lineNumber:150 description:@"Required completion handler is missing"];
  }
  if (a2)
  {
    if (a2 != 2)
    {
      if (a2 != 1)
      {
        uint64_t v4 = 0;
        goto LABEL_14;
      }
      uint64_t v3 = qword_100026EC0;
      if (!qword_100026EC0)
      {
        id v9 = [(id)qword_100026EA0 sharedPreferences];
        uint64_t v4 = 1;
        [v9 setDictationIsEnabled:1];

        goto LABEL_14;
      }
      if (qword_100026EC0 == 1)
      {
        sub_10000E9A4(@"prefs:root=General&path=Keyboard/KEYBOARDS/AddNewKeyboard", 0);
        uint64_t v4 = 1;
        goto LABEL_14;
      }
      if (qword_100026EC0 != 2)
      {
        uint64_t v4 = 1;
        goto LABEL_15;
      }
    }
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = 2;
  }
LABEL_14:
  uint64_t v3 = qword_100026EC0;
LABEL_15:
  if (v3 == 3)
  {
    id v7 = [(id)qword_100026EA0 sharedPreferences];
    [v7 setSiriDataSharingOptInAlertPresented:1 completion:0];
  }
  else if (v3 == 2)
  {
    if (v4 == 3)
    {
      id v5 = [(id)qword_100026EA0 sharedPreferences];
      [v5 setSiriDataSharingOptInAlertPresented:1 completion:0];

      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }
    sub_10000F7BC(v6);
  }
  (*(void (**)(uint64_t, uint64_t))(qword_100026E90 + 16))(qword_100026E90, v4);
  if (qword_100026EB8)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_100026EB8);
    CFRelease((CFTypeRef)qword_100026EB8);
    qword_100026EB8 = 0;
  }
  id v8 = (void *)qword_100026E90;
  qword_100026E90 = 0;
}

id sub_10000F4F8()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100026EE8;
  uint64_t v7 = qword_100026EE8;
  if (!qword_100026EE8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100010674;
    v3[3] = &unk_10001C810;
    v3[4] = &v4;
    sub_100010674((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_10000F658(uint64_t a1)
{
  BOOL v2 = (__CFUserNotification *)qword_100026EB8;
  if (qword_100026EB8)
  {
    if (!qword_100026E90)
    {
      uint64_t v6 = +[NSAssertionHandler currentHandler];
      uint64_t v7 = +[NSString stringWithUTF8String:"void _DismissUserNotification(void)"];
      [v6 handleFailureInFunction:v7 file:@"TIRemoteDataServer.m" lineNumber:214 description:@"Required completion handler is missing"];

      BOOL v2 = (__CFUserNotification *)qword_100026EB8;
    }
    CFUserNotificationCancel(v2);
    CFRelease((CFTypeRef)qword_100026EB8);
    qword_100026EB8 = 0;
    (*(void (**)(uint64_t, void))(qword_100026E90 + 16))(qword_100026E90, 0);
    uint64_t v3 = (void *)qword_100026E90;
    qword_100026E90 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

void sub_10000F7BC(uint64_t a1)
{
  BOOL v2 = [(id)qword_100026EA0 sharedPreferences];
  char v3 = objc_opt_respondsToSelector();

  uint64_t v4 = [(id)qword_100026EA0 sharedPreferences];
  id v5 = v4;
  if (v3) {
    [v4 setSiriDataSharingOptInStatus:a1 propagateToHomeAccessories:0 source:10 reason:@"Keyboard Dictation Onboarding Alerts" completion:0];
  }
  else {
    [v4 setSiriDataSharingOptInStatus:a1 completion:0];
  }
}

void sub_10000F940(uint64_t a1)
{
  +[TIKeyboardInputManagerLoaderSyncHelper deleteCloudKitBackup];
  +[TIKeyboardInputManager removeAllDynamicDictionaries];
  BOOL v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:TIKeyboardInputManagerDynamicDictionariesRemovedNotification object:*(void *)(a1 + 32)];

  char v3 = +[TIKeyboardInputManager keyboardUserDirectory];
  +[TILanguageModelLoaderManager clearDynamicResourcesAtPath:v3];

  uint64_t v4 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent];
  [v4 handleRemovalOfLearnedModels];

  +[TIKeyboardInputManager resetResponseKit];
  id v5 = +[EMFEmojiPreferencesService sharedServiceWithMachName:0];
  id v7 = [v5 preferences];

  [v7 resetEmojiDefaults];
  [v7 writeEmojiDefaults];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleEmojiKeyboardPreferencesChangedNotification", 0, 0, 1u);
  notify_post((const char *)[TIKeyboardInputManagerDynamicDictionariesRemovedDarwinNotificationName UTF8String]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100010090(uint64_t a1)
{
  id v2 = +[TIEmojiAlternativesServer sharedInstance];
  [v2 updateForActiveLocaleIdentifiers:*(void *)(a1 + 32)];
}

void sub_100010180(uint64_t a1)
{
  id v2 = +[TIEmojiAlternativesServer sharedInstance];
  [v2 updateKeyboardType:*(void *)(a1 + 40) appIdentifier:*(void *)(a1 + 32)];
}

void sub_10001028C(uint64_t a1)
{
  id v2 = +[TIEmojiAlternativesServer sharedInstance];
  [v2 alternativesForText:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

void *sub_100010338(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100026ED0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100010460;
    v4[4] = &unk_10001C7E8;
    v4[5] = v4;
    long long v5 = off_10001CC98;
    uint64_t v6 = 0;
    qword_100026ED0 = _sl_dlopen();
  }
  id v2 = (void *)qword_100026ED0;
  if (!qword_100026ED0) {
    sub_100011A68(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "AFDeviceHighestLanguageModelCapabilityIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100026EC8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100010460()
{
  uint64_t result = _sl_dlopen();
  qword_100026ED0 = result;
  return result;
}

Class sub_1000104D4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100026EE0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100010600;
    v3[4] = &unk_10001C7E8;
    void v3[5] = v3;
    long long v4 = off_10001CCB0;
    uint64_t v5 = 0;
    qword_100026EE0 = _sl_dlopen();
  }
  if (!qword_100026EE0) {
    sub_100011AE8(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("OBBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100011B68();
  }
  qword_100026ED8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100010600()
{
  uint64_t result = _sl_dlopen();
  qword_100026EE0 = result;
  return result;
}

Class sub_100010674(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100026EF0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000107A0;
    v3[4] = &unk_10001C7E8;
    void v3[5] = v3;
    long long v4 = off_10001CCC8;
    uint64_t v5 = 0;
    qword_100026EF0 = _sl_dlopen();
  }
  if (!qword_100026EF0) {
    sub_100011BE4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VTUIDictationDataSharingOptInPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100011C64();
  }
  qword_100026EE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000107A0()
{
  uint64_t result = _sl_dlopen();
  qword_100026EF0 = result;
  return result;
}

void sub_100010834(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempt to access typology logs while typology logging profile is not installed.", v1, 2u);
}

void sub_100010878(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 relativePath];
  sub_100005EF4();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to enumerate typology url at path=%@ (error=%@)", v6, 0x16u);
}

void sub_100010924(void *a1, NSObject *a2)
{
  id v3 = [a1 lastPathComponent];
  [v3 UTF8String];
  sub_100005EF4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for typology url with name %{private}s", v4, 0xCu);
}

void sub_1000109C0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to allocate string for sandbox extension token.", v1, 2u);
}

void sub_100010A04()
{
  sub_100005EF4();
  sub_100005ED8((void *)&_mh_execute_header, v0, v1, "Unsafe name: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100010A6C()
{
  sub_100005EF4();
  sub_100005ED8((void *)&_mh_execute_header, v0, v1, "Failed to remove typology file: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100010AD4()
{
  sub_100005EF4();
  sub_100005ED8((void *)&_mh_execute_header, v0, v1, "Failed to write data to typology file: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100010B3C()
{
  sub_100006BC8();
  sub_100006BAC((void *)&_mh_execute_header, v0, v1, "Unable to accept connection because client does not have entitlement.", v2, v3, v4, v5, v6);
}

void sub_100010B70()
{
  sub_100006BC8();
  sub_100006BAC((void *)&_mh_execute_header, v0, v1, "This service is supported only on internal builds.", v2, v3, v4, v5, v6);
}

void sub_100010BA4()
{
  sub_100006BC8();
  sub_100006BAC((void *)&_mh_execute_header, v0, v1, "Unable to register the listener endpoint because of invalid arguments.", v2, v3, v4, v5, v6);
}

void sub_100010BD8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010C44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010CB0()
{
  sub_100006BC8();
  sub_100006BAC((void *)&_mh_execute_header, v0, v1, "Unable to handle the request because the client does not have entitlement.", v2, v3, v4, v5, v6);
}

void sub_100010CE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010D54()
{
  int v0 = 136315138;
  uint64_t v1 = "-[TITypologyLogTransferServer syncTypologyLogs]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s  Couldn't find a paired device, failing to sync typology logs", (uint8_t *)&v0, 0xCu);
}

void sub_100010DDC()
{
  int v0 = 136315138;
  uint64_t v1 = "-[TITypologyLogTransferServer service:account:incomingResourceAtURL:fromID:context:]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s  Incoming URL path is bad, not saving file", (uint8_t *)&v0, 0xCu);
}

void sub_100010E64(void *a1, NSObject *a2)
{
  uint64_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s Could not read entitlement: %@", "-[TIAutofillServer checkEntitlementForAddEntryStringWithAuditToken:]", *a1);
  *(_DWORD *)buf = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_100010F20()
{
  int v0 = +[NSString stringWithFormat:@"%s Manually saving language models"];
  sub_10000A1EC((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"main_block_invoke", v7, 2u);
}

void sub_100010FC4(uint64_t a1)
{
  int v1 = +[NSString stringWithFormat:@"%s Couldn't create keyboard user directory: %@"];
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"main_block_invoke", a1, 2u);
}

void sub_10001106C(void *a1)
{
  id v8 = [a1 processIdentifier];
  int v1 = +[NSString stringWithFormat:@"%s Allowing connection from pid %d to kbd accessibility server"];
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TIAccessibilityServer listener:shouldAcceptNewConnection:]", (uint64_t)v8, 2u);
}

void sub_100011118(void *a1)
{
  id v8 = [a1 processIdentifier];
  int v1 = +[NSString stringWithFormat:@"%s process %d tried to connect to the kbd accessibility server, but it was not entitled!"];
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TIAccessibilityServer listener:shouldAcceptNewConnection:]", (uint64_t)v8, 2u);
}

void sub_1000111C4(void *a1, NSObject *a2)
{
  int v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s Could not read entitlement: %@", "-[TILexiconDataHandler checkEntitlementForAddEntryStringWithAuditToken:]", *a1);
  *(_DWORD *)buf = 138412290;
  int v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_100011280(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to acccept new connection: client does not have entitlement.", v1, 2u);
}

void sub_1000112C4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not read entitlement: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100011340(void *a1)
{
  id v8 = [a1 processIdentifier];
  int v1 = +[NSString stringWithFormat:@"%s Establishing connection with PID %d"];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TIRemoteDataServer listener:shouldAcceptNewConnection:]", (uint64_t)v8, v9);
}

void sub_1000113E8(uint64_t *a1)
{
  uint64_t v8 = *a1;
  int v1 = +[NSString stringWithFormat:@"%s Could not read entitlement: %@"];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"+[TIRemoteDataHandle shouldAcceptRequestForMeCardWithAuditToken:]", v8, v9);
}

void sub_100011490()
{
  int v0 = +[NSXPCConnection currentConnection];
  id v8 = [v0 processIdentifier];
  int v1 = +[NSString stringWithFormat:@"%s Rejecting request for me card from PID %d"];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TIRemoteDataHandle requestMeCardWithCompletionHandler:]", (uint64_t)v8, v9);
}

void sub_100011558()
{
  int v0 = +[NSXPCConnection currentConnection];
  id v8 = [v0 processIdentifier];
  int v1 = +[NSString stringWithFormat:@"%s Rejecting request for me card from PID %d"];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TIRemoteDataHandle requestMeContactWithCompletionHandler:]", (uint64_t)v8, v9);
}

void sub_100011620()
{
  v0[0] = 136315394;
  sub_100010820();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s  Unable to launch Keyboard Settings (error: %@)", (uint8_t *)v0, 0x16u);
}

void sub_1000116A8()
{
  int v0 = +[NSAssertionHandler currentHandler];
  int v1 = +[NSString stringWithUTF8String:"NSInteger _AFDeviceHighestLanguageModelCapabilityIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TIRemoteDataServer.m", 48, @"%s", dlerror());

  __break(1u);
}

void sub_100011720()
{
  int v0 = +[NSString stringWithFormat:@"%s Received request to delete all learned keyboard dictionaries."];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[TIRemoteDataHandle removeAllDynamicDictionariesWithCompletionHandler:]", v7, v8);
}

void sub_1000117C0(char a1, uint64_t a2, NSObject *a3)
{
  int v4 = "NO";
  if (a1) {
    int v4 = "YES";
  }
  int v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s Responding with isExempt = %s for string %@", "-[TIRemoteDataHandle string:isExemptFromTextCheckerWithCompletionHandler:]", v4, a2);
  *(_DWORD *)buf = 138412290;
  uint64_t v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_100011894()
{
  int v0 = +[NSString stringWithFormat:@"%s Reading UITextChecker local dictionary"];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[TIRemoteDataHandle requestTextCheckerLocalDictionaryWithCompletionHandler:]", v7, v8);
}

void sub_100011934(uint64_t a1)
{
  int v1 = +[NSString stringWithFormat:@"%s Appending %@ to UITextChecker local dictionary"];
  sub_100010814();
  sub_10000A1EC((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TIRemoteDataHandle appendWordToTextCheckerLocalDictionary:]", a1, v9);
}

void sub_1000119D8()
{
  v2[0] = 136315650;
  sub_100010820();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s  Called ingestion pipeline for parsed phrases for inline completions personalization with:\n sentence: %@ \n for language: %@", (uint8_t *)v2, 0x20u);
}

void sub_100011A68(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  __int16 v3 = +[NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TIRemoteDataServer.m", 47, @"%s", *a1);

  __break(1u);
}

void sub_100011AE8(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  __int16 v3 = +[NSString stringWithUTF8String:"void *OnBoardingKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TIRemoteDataServer.m", 53, @"%s", *a1);

  __break(1u);
}

void sub_100011B68()
{
  __int16 v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getOBBundleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TIRemoteDataServer.m", 54, @"Unable to find class %s", "OBBundle");

  __break(1u);
}

void sub_100011BE4(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  __int16 v3 = +[NSString stringWithUTF8String:"void *VoiceTriggerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TIRemoteDataServer.m", 80, @"%s", *a1);

  __break(1u);
}

void sub_100011C64()
{
  __int16 v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getVTUIDictationDataSharingOptInPresenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TIRemoteDataServer.m", 81, @"Unable to find class %s", "VTUIDictationDataSharingOptInPresenter");

  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TICanLogMessageAtLevel()
{
  return _TICanLogMessageAtLevel();
}

uint64_t TIDispatchAsync()
{
  return _TIDispatchAsync();
}

uint64_t TIDispatchSync()
{
  return _TIDispatchSync();
}

uint64_t TIGetMeCardAsync()
{
  return _TIGetMeCardAsync();
}

uint64_t TIInputModeGetSWLayout()
{
  return _TIInputModeGetSWLayout();
}

uint64_t TIOSLogFacility()
{
  return _TIOSLogFacility();
}

uint64_t TI_IS_INTERNAL_INSTALL()
{
  return _TI_IS_INTERNAL_INSTALL();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return _fsync(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t kac_get_log()
{
  return _kac_get_log();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t xpc_connection_copy_bundle_id()
{
  return _xpc_connection_copy_bundle_id();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createImageCacheIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _createImageCacheIfNecessary];
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return [a1 _deviceLanguage];
}

id objc_msgSend__dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 _dispatchQueue];
}

id objc_msgSend__initializeEnumerator(void *a1, const char *a2, ...)
{
  return [a1 _initializeEnumerator];
}

id objc_msgSend__logInvalidConnection(void *a1, const char *a2, ...)
{
  return [a1 _logInvalidConnection];
}

id objc_msgSend__looksLikeNumberInput(void *a1, const char *a2, ...)
{
  return [a1 _looksLikeNumberInput];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_activeInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 activeInputModeIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allRenderers(void *a1, const char *a2, ...)
{
  return [a1 allRenderers];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_canReplace(void *a1, const char *a2, ...)
{
  return [a1 canReplace];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_candidate(void *a1, const char *a2, ...)
{
  return [a1 candidate];
}

id objc_msgSend_checkAndFlushDynamicCaches(void *a1, const char *a2, ...)
{
  return [a1 checkAndFlushDynamicCaches];
}

id objc_msgSend_clearActiveLexicon(void *a1, const char *a2, ...)
{
  return [a1 clearActiveLexicon];
}

id objc_msgSend_cond(void *a1, const char *a2, ...)
{
  return [a1 cond];
}

id objc_msgSend_confirmationButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 confirmationButtonTitle];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLoadedInputModes(void *a1, const char *a2, ...)
{
  return [a1 currentLoadedInputModes];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
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

id objc_msgSend_deleteCloudKitBackup(void *a1, const char *a2, ...)
{
  return [a1 deleteCloudKitBackup];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictationDataSharingOptInAlertViewModel(void *a1, const char *a2, ...)
{
  return [a1 dictationDataSharingOptInAlertViewModel];
}

id objc_msgSend_dictationDataSharingOptInReminderViewModel(void *a1, const char *a2, ...)
{
  return [a1 dictationDataSharingOptInReminderViewModel];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directoryEnumerator(void *a1, const char *a2, ...)
{
  return [a1 directoryEnumerator];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return [a1 entitlement];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flatten(void *a1, const char *a2, ...)
{
  return [a1 flatten];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flushDynamicLearningCaches(void *a1, const char *a2, ...)
{
  return [a1 flushDynamicLearningCaches];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_fromState(void *a1, const char *a2, ...)
{
  return [a1 fromState];
}

id objc_msgSend_handleRemovalOfLearnedModels(void *a1, const char *a2, ...)
{
  return [a1 handleRemovalOfLearnedModels];
}

id objc_msgSend_hasActiveInputManagers(void *a1, const char *a2, ...)
{
  return [a1 hasActiveInputManagers];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initializeSearchIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 initializeSearchIfNecessary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interactingConnection(void *a1, const char *a2, ...)
{
  return [a1 interactingConnection];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return [a1 isStarted];
}

id objc_msgSend_isTypologyInDatavault(void *a1, const char *a2, ...)
{
  return [a1 isTypologyInDatavault];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_keyboardUserDirectory(void *a1, const char *a2, ...)
{
  return [a1 keyboardUserDirectory];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localDictionaryPath(void *a1, const char *a2, ...)
{
  return [a1 localDictionaryPath];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return [a1 machPort];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_optInButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 optInButtonTitle];
}

id objc_msgSend_optOutButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 optOutButtonTitle];
}

id objc_msgSend_outgoingMessages(void *a1, const char *a2, ...)
{
  return [a1 outgoingMessages];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_performMaintenance(void *a1, const char *a2, ...)
{
  return [a1 performMaintenance];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return [a1 preferences];
}

id objc_msgSend_prepareForActivity(void *a1, const char *a2, ...)
{
  return [a1 prepareForActivity];
}

id objc_msgSend_prepareForInactivity(void *a1, const char *a2, ...)
{
  return [a1 prepareForInactivity];
}

id objc_msgSend_prepareForKeyboardActivity(void *a1, const char *a2, ...)
{
  return [a1 prepareForKeyboardActivity];
}

id objc_msgSend_prepareForKeyboardInactivity(void *a1, const char *a2, ...)
{
  return [a1 prepareForKeyboardInactivity];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return [a1 privacyFlow];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_registerMaintenanceActivity(void *a1, const char *a2, ...)
{
  return [a1 registerMaintenanceActivity];
}

id objc_msgSend_registerScheduledEventsActivity(void *a1, const char *a2, ...)
{
  return [a1 registerScheduledEventsActivity];
}

id objc_msgSend_registrations(void *a1, const char *a2, ...)
{
  return [a1 registrations];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_releaseAllInputManagers(void *a1, const char *a2, ...)
{
  return [a1 releaseAllInputManagers];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllDynamicDictionaries(void *a1, const char *a2, ...)
{
  return [a1 removeAllDynamicDictionaries];
}

id objc_msgSend_resetEmojiDefaults(void *a1, const char *a2, ...)
{
  return [a1 resetEmojiDefaults];
}

id objc_msgSend_resetResponseKit(void *a1, const char *a2, ...)
{
  return [a1 resetResponseKit];
}

id objc_msgSend_resolveAssistantFrameworkClasses(void *a1, const char *a2, ...)
{
  return [a1 resolveAssistantFrameworkClasses];
}

id objc_msgSend_restResetTouches(void *a1, const char *a2, ...)
{
  return [a1 restResetTouches];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_search(void *a1, const char *a2, ...)
{
  return [a1 search];
}

id objc_msgSend_searchResult(void *a1, const char *a2, ...)
{
  return [a1 searchResult];
}

id objc_msgSend_serverInterface(void *a1, const char *a2, ...)
{
  return [a1 serverInterface];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sharedAccessibilityServer(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessibilityServer];
}

id objc_msgSend_sharedAssetManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAssetManager];
}

id objc_msgSend_sharedAutofillServer(void *a1, const char *a2, ...)
{
  return [a1 sharedAutofillServer];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedKeyboardInputManagerServer(void *a1, const char *a2, ...)
{
  return [a1 sharedKeyboardInputManagerServer];
}

id objc_msgSend_sharedLearningAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedLearningAgent];
}

id objc_msgSend_sharedLexiconServer(void *a1, const char *a2, ...)
{
  return [a1 sharedLexiconServer];
}

id objc_msgSend_sharedLoader(void *a1, const char *a2, ...)
{
  return [a1 sharedLoader];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesController];
}

id objc_msgSend_sharedRemoteDataServer(void *a1, const char *a2, ...)
{
  return [a1 sharedRemoteDataServer];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_sharedTrainer(void *a1, const char *a2, ...)
{
  return [a1 sharedTrainer];
}

id objc_msgSend_sharedTypingAssertion(void *a1, const char *a2, ...)
{
  return [a1 sharedTypingAssertion];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return [a1 startServer];
}

id objc_msgSend_startSyncHelper(void *a1, const char *a2, ...)
{
  return [a1 startSyncHelper];
}

id objc_msgSend_supplementalLexicons(void *a1, const char *a2, ...)
{
  return [a1 supplementalLexicons];
}

id objc_msgSend_textCheckerExemptions(void *a1, const char *a2, ...)
{
  return [a1 textCheckerExemptions];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toState(void *a1, const char *a2, ...)
{
  return [a1 toState];
}

id objc_msgSend_typologyDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 typologyDirectoryURL];
}

id objc_msgSend_typologyLoggingEnabledByProfile(void *a1, const char *a2, ...)
{
  return [a1 typologyLoggingEnabledByProfile];
}

id objc_msgSend_typologyLogsFolder(void *a1, const char *a2, ...)
{
  return [a1 typologyLogsFolder];
}

id objc_msgSend_typologyPreferences(void *a1, const char *a2, ...)
{
  return [a1 typologyPreferences];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_wireAllLanguageModelMemory(void *a1, const char *a2, ...)
{
  return [a1 wireAllLanguageModelMemory];
}

id objc_msgSend_writeEmojiDefaults(void *a1, const char *a2, ...)
{
  return [a1 writeEmojiDefaults];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}