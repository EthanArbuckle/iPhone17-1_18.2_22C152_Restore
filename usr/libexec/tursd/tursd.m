uint64_t sub_100001210()
{
  void *v0;
  uint64_t v1;

  v0 = [sub_100001268() sharedUtilityProvider];
  if ([v0 currentPreferredTransportMethod])
  {
    if ([sub_100001268() relayIsSupported]) {
      v1 = 2;
    }
    else {
      v1 = 1;
    }
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

id sub_100001268()
{
  if (qword_100016E28 != -1) {
    dispatch_once(&qword_100016E28, &stru_100010438);
  }
  v0 = (void *)qword_100016E20;

  return v0;
}

void sub_1000012BC(id a1)
{
  qword_100016E20 = CUTWeakLinkClass();
  if (!qword_100016E20)
  {
    v1 = sub_100001854();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000083FC(v1);
    }
  }
}

uint64_t start()
{
  NPHDeriveProgramName();
  NPHSetTmpDirPrefix();
  id v1 = objc_alloc_init((Class)VoicemailCompanionReplication);
  id v2 = objc_alloc((Class)TCSSuggestions);
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  id v5 = [v2 initWithContactStore:v3 contacts:v4];

  [v5 setGenerationTimerEnabled:1];
  [v5 generateNewSuggestionsIfNecessary];
  v37[0] = v1;
  v37[1] = v5;
  v6 = +[NPHCarrierInfoCompanionReplication sharedInstance];
  v37[2] = v6;
  v7 = objc_opt_new();
  v37[3] = v7;
  v8 = objc_opt_new();
  v37[4] = v8;
  v9 = objc_opt_new();
  v37[5] = v9;
  v10 = +[NSArray arrayWithObjects:v37 count:6];
  v11 = +[NSMutableArray arrayWithArray:v10];

  v12 = +[NSUserDefaults standardUserDefaults];
  LODWORD(v7) = [v12 BOOLForKey:@"NPHMagicRingbackAutomaton"];

  if (v7)
  {
    v13 = objc_opt_new();
    [v11 addObject:v13];
  }
  uint64_t v14 = +[NSArray arrayWithArray:v11];
  v15 = (void *)qword_100016E30;
  qword_100016E30 = v14;

  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v16, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v16, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v16, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_8_HOURS);
  xpc_dictionary_set_string(v16, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001774;
  handler[3] = &unk_100010460;
  id v34 = v5;
  id v17 = v5;
  xpc_activity_register("com.apple.tincan.generate-suggestions", v16, handler);
  if (signal(15, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1)
  {
    v18 = sub_100001854();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = __error();
      v20 = strerror(*v19);
      *(_DWORD *)buf = 136315138;
      v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to ignore default SIGTERM handler; error:%s",
        buf,
        0xCu);
    }
  }
  v21 = dispatch_queue_create("com.apple.mobilephone.VoicemailCompanionReplication.sigterm", 0);
  dispatch_source_t v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v21);
  v23 = (void *)qword_100016E38;
  qword_100016E38 = (uint64_t)v22;

  v24 = qword_100016E38;
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  v30 = sub_1000017E8;
  v31 = &unk_100010488;
  id v32 = v1;
  id v25 = v1;
  dispatch_source_set_event_handler(v24, &v28);
  dispatch_resume((dispatch_object_t)qword_100016E38);

  v26 = +[NSRunLoop currentRunLoop];
  [v26 run];

  return 0;
}

id sub_100001774(uint64_t a1)
{
  id v2 = sub_100001854();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC Activity checked-in and it's time to update WalkieTalkie suggestions", v4, 2u);
  }

  return [*(id *)(a1 + 32) generateNewSuggestionsIfNecessary];
}

void sub_1000017E8(uint64_t a1)
{
  id v2 = sub_100001854();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling SIGTERM", v3, 2u);
  }

  [*(id *)(a1 + 32) handleSIGTERM];
  exit(0);
}

id sub_100001854()
{
  if (qword_100016E48 != -1) {
    dispatch_once(&qword_100016E48, &stru_1000104A8);
  }
  v0 = (void *)qword_100016E40;

  return v0;
}

void sub_1000018A8(id a1)
{
  qword_100016E40 = (uint64_t)os_log_create("com.apple.NanoPhone", "general");

  _objc_release_x1();
}

int64_t sub_100001EE0(id a1, id a2, id a3)
{
  int64_t v3 = -1;
  if (a2 >= a3) {
    int64_t v3 = 1;
  }
  if (a2 == a3) {
    return 0;
  }
  else {
    return v3;
  }
}

BOOL sub_100002048(id a1, TUCall *a2)
{
  return [(TUCall *)a2 isConferenced];
}

BOOL sub_100002050(id a1, TUCall *a2)
{
  return [(TUCall *)a2 isConferenced] ^ 1;
}

NPHCall *__cdecl sub_100002070(id a1, TUCall *a2)
{
  id v2 = a2;
  int64_t v3 = [[NPHCall alloc] initWithTUCall:v2];

  return v3;
}

BOOL sub_1000020D8(id a1, NPHCall *a2, NPHCall *a3)
{
  v4 = a3;
  unsigned int v5 = [(NPHCall *)a2 status];
  if (v5 > 5) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = qword_10000B968[v5];
  }
  unsigned int v7 = [(NPHCall *)v4 status];

  if (v7 > 5) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = qword_10000B968[v7];
  }
  return v6 > v8;
}

uint64_t sub_1000024E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEmergency])
  {
    uint64_t v4 = 1;
  }
  else if (*(unsigned char *)(a1 + 40) && *(void *)(a1 + 32))
  {
    unsigned int v5 = [v3 handle];
    unint64_t v6 = [v5 value];
    uint64_t v4 = (uint64_t)[v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_100002650(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSOS])
  {
    uint64_t v4 = 1;
  }
  else if (*(unsigned char *)(a1 + 40) && *(void *)(a1 + 32))
  {
    unsigned int v5 = [v3 handle];
    unint64_t v6 = [v5 value];
    uint64_t v4 = (uint64_t)[v6 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL sub_100002720(id a1, TUCall *a2)
{
  return [(TUCall *)a2 nph_isTinCanCall];
}

BOOL sub_100002768(id a1, TUCall *a2)
{
  return [(TUCall *)a2 originatingUIType] == 6;
}

BOOL sub_1000027CC(id a1, TUCall *a2)
{
  return [(TUCall *)a2 originatingUIType] == 10;
}

BOOL sub_100002A04(id a1, TUCall *a2)
{
  id v2 = a2;
  id v3 = [(TUCall *)v2 provider];
  if ([v3 isFaceTimeProvider]
    && [(TUCall *)v2 isVideo]
    && (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls] & 1) == 0)
  {
    unsigned __int8 v4 = +[NPHSharedUtilities isActiveDeviceTinker];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

BOOL sub_100002BF0(id a1, TUCall *a2, TUCall *a3)
{
  unsigned __int8 v4 = a3;
  [(TUCall *)a2 callDuration];
  double v6 = v5;
  [(TUCall *)v4 callDuration];
  double v8 = v7;

  return v6 > v8;
}

void sub_100004444(uint64_t a1)
{
  double v5 = -[NPHCallConfigurationChangeSource initWithUTF8String:]([NPHCallConfigurationChangeSource alloc], "initWithUTF8String:", "-[NPHStateManager initWithDelegate:]_block_invoke");
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned __int8 v4 = +[NPHStateManager currentCallConfigurationWithSource:v5];
  [v2 stateManager:v3 callConfigurationUpdated:v4];
}

void sub_100004780(id a1)
{
  id v1 = sub_100001854();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    double v7 = "+[NPHStateManager updateSharedCallCenter]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: disabling call notifications while suspended", (uint8_t *)&v6, 0xCu);
  }

  id v2 = +[TUCallCenter sharedInstance];
  uint64_t v3 = [v2 callServicesClientCapabilities];
  [v3 setWantsCallNotificationsDisabledWhileSuspended:1];

  unsigned __int8 v4 = +[TUCallCenter sharedInstance];
  double v5 = [v4 callServicesClientCapabilities];
  [v5 save];
}

void sub_100004918(uint64_t a1)
{
  double v5 = [[NPHCallConfigurationChangeSource alloc] initWithPayload:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  unsigned __int8 v4 = +[NPHStateManager currentCallConfigurationWithSource:v5];
  [v2 stateManager:v3 callConfigurationUpdated:v4];
}

BOOL sub_100004B30(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] == 5;
}

BOOL sub_100004B54(id a1, NPHCall *a2)
{
  id v2 = a2;
  if ([(NPHCall *)v2 status] == 6) {
    unsigned int v3 = ![(NPHCall *)v2 hasFailed];
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

BOOL sub_100004DB8(id a1, NPHCall *a2)
{
  return ![(NPHCall *)a2 wasDeclined];
}

BOOL sub_100004E2C(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] == 4;
}

BOOL sub_100004EA4(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] == 1;
}

BOOL sub_100004F1C(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] == 3;
}

BOOL sub_10000505C(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] == 4;
}

BOOL sub_100005080(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] == 1;
}

BOOL sub_1000050F8(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 wantsHoldMusic];
}

BOOL sub_100005154(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 hasFailed];
}

BOOL sub_1000051B0(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 disconnectedReason] == 38;
}

BOOL sub_100005354(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 isEmergencyCall];
}

BOOL sub_10000539C(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 isEmergencySOSCall];
}

BOOL sub_1000053E4(id a1, NPHCall *a2)
{
  id v2 = a2;
  if ([(NPHCall *)v2 isEmergencySOSCall]) {
    BOOL v3 = [(NPHCall *)v2 status] == 6;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

BOOL sub_100005470(id a1, NPHCall *a2)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NPHCall *)a2 TUCalls];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isHostedOnCurrentDevice])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

BOOL sub_1000056B8(id a1, NPHCall *a2)
{
  return [(NPHCall *)a2 status] != 5;
}

BOOL sub_1000058FC(id a1, NPHCall *a2)
{
  id v2 = a2;
  BOOL v3 = ![(NPHCall *)v2 isEmergencyCall] && [(NPHCall *)v2 status] != 5;

  return v3;
}

void sub_10000729C(uint64_t a1)
{
  id v2 = +[TUCallCenter sharedInstance];
  id v4 = [v2 dialWithRequest:*(void *)(a1 + 32)];

  if (v4)
  {
    BOOL v3 = [[NPHCall alloc] initWithTUCall:v4];
    [*(id *)(a1 + 40) setCurrentOutgoingCallResponse:v3];
  }
  else
  {
    [*(id *)(a1 + 40) setCurrentOutgoingCallResponse:0];
  }
}

id sub_100007490(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flipMuteForCall:*(void *)(a1 + 40)];
}

id sub_1000075EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flipMuteForCall:*(void *)(a1 + 40)];
}

void sub_1000076A4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v1 = *(void **)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007734;
  v3[3] = &unk_100010748;
  v3[4] = v2;
  id v4 = v1;
  [v2 _flipMuteForCall:v4 and:v3];
}

void sub_100007734(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v1 = *(void **)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000077C4;
  v3[3] = &unk_100010748;
  v3[4] = v2;
  id v4 = v1;
  [v2 _flipMuteForCall:v4 and:v3];
}

id sub_1000077C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flipMuteForCall:*(void *)(a1 + 40) and:0];
}

uint64_t sub_1000078DC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000083FC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find class RTTUIUtilities; RTTUI.framework may have failed to link.",
    v1,
    2u);
}

void sub_100008440(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[NPHCall onlyTUCall]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: NPHCall has > 1 TUCalls; expected 1",
    (uint8_t *)&v1,
    0xCu);
}

void sub_1000084C4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "provider was nil", v1, 2u);
}

void sub_100008508(void *a1, NSObject *a2)
{
  BOOL v3 = [a1 handle];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "no title for handle: %@", (uint8_t *)&v4, 0xCu);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CUTWeakLinkClass()
{
  return _CUTWeakLinkClass();
}

uint64_t NPHDeriveProgramName()
{
  return _NPHDeriveProgramName();
}

uint64_t NPHDeviceOSIsInternalInstall()
{
  return _NPHDeviceOSIsInternalInstall();
}

uint64_t NPHSetTmpDirPrefix()
{
  return _NPHSetTmpDirPrefix();
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

uint64_t TUHomeCountryCode()
{
  return _TUHomeCountryCode();
}

uint64_t TUNetworkCountryCode()
{
  return _TUNetworkCountryCode();
}

int *__error(void)
{
  return ___error();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t nph_ensure_on_main_queue()
{
  return _nph_ensure_on_main_queue();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

id objc_msgSend_TUCalls(void *a1, const char *a2, ...)
{
  return [a1 TUCalls];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__firstTUCall(void *a1, const char *a2, ...)
{
  return [a1 _firstTUCall];
}

id objc_msgSend__log(void *a1, const char *a2, ...)
{
  return [a1 _log];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return [a1 callCenter];
}

id objc_msgSend_callDuration(void *a1, const char *a2, ...)
{
  return [a1 callDuration];
}

id objc_msgSend_callDurationString(void *a1, const char *a2, ...)
{
  return [a1 callDurationString];
}

id objc_msgSend_callEnded(void *a1, const char *a2, ...)
{
  return [a1 callEnded];
}

id objc_msgSend_callHandingOff(void *a1, const char *a2, ...)
{
  return [a1 callHandingOff];
}

id objc_msgSend_callHandingOffToWatch(void *a1, const char *a2, ...)
{
  return [a1 callHandingOffToWatch];
}

id objc_msgSend_callServicesClientCapabilities(void *a1, const char *a2, ...)
{
  return [a1 callServicesClientCapabilities];
}

id objc_msgSend_callToAnswerOnPhone(void *a1, const char *a2, ...)
{
  return [a1 callToAnswerOnPhone];
}

id objc_msgSend_calls(void *a1, const char *a2, ...)
{
  return [a1 calls];
}

id objc_msgSend_callsOnDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 callsOnDefaultPairedDevice];
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return [a1 contactLabel];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return [a1 conversation];
}

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return [a1 conversationManager];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAudioAndVideoCalls(void *a1, const char *a2, ...)
{
  return [a1 currentAudioAndVideoCalls];
}

id objc_msgSend_currentIncomingCallRequest(void *a1, const char *a2, ...)
{
  return [a1 currentIncomingCallRequest];
}

id objc_msgSend_currentOutgoingCallResponse(void *a1, const char *a2, ...)
{
  return [a1 currentOutgoingCallResponse];
}

id objc_msgSend_currentPreferredTransportMethod(void *a1, const char *a2, ...)
{
  return [a1 currentPreferredTransportMethod];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dialPrompt(void *a1, const char *a2, ...)
{
  return [a1 dialPrompt];
}

id objc_msgSend_dialRequestForRedial(void *a1, const char *a2, ...)
{
  return [a1 dialRequestForRedial];
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return [a1 dialType];
}

id objc_msgSend_disconnectedReason(void *a1, const char *a2, ...)
{
  return [a1 disconnectedReason];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_faceTimeAudioCallSupport(void *a1, const char *a2, ...)
{
  return [a1 faceTimeAudioCallSupport];
}

id objc_msgSend_fetchCurrentCalls(void *a1, const char *a2, ...)
{
  return [a1 fetchCurrentCalls];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generateNewSuggestionsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 generateNewSuggestionsIfNecessary];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_handleSIGTERM(void *a1, const char *a2, ...)
{
  return [a1 handleSIGTERM];
}

id objc_msgSend_hasFailed(void *a1, const char *a2, ...)
{
  return [a1 hasFailed];
}

id objc_msgSend_incomingCall(void *a1, const char *a2, ...)
{
  return [a1 incomingCall];
}

id objc_msgSend_isActiveDeviceTinker(void *a1, const char *a2, ...)
{
  return [a1 isActiveDeviceTinker];
}

id objc_msgSend_isConferenced(void *a1, const char *a2, ...)
{
  return [a1 isConferenced];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return [a1 isConnecting];
}

id objc_msgSend_isConversation(void *a1, const char *a2, ...)
{
  return [a1 isConversation];
}

id objc_msgSend_isEmergency(void *a1, const char *a2, ...)
{
  return [a1 isEmergency];
}

id objc_msgSend_isEmergencyCall(void *a1, const char *a2, ...)
{
  return [a1 isEmergencyCall];
}

id objc_msgSend_isEmergencySOSCall(void *a1, const char *a2, ...)
{
  return [a1 isEmergencySOSCall];
}

id objc_msgSend_isEndpointOnCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 isEndpointOnCurrentDevice];
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return [a1 isFaceTimeProvider];
}

id objc_msgSend_isHostedOnCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 isHostedOnCurrentDevice];
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return [a1 isIncoming];
}

id objc_msgSend_isNewtonOriginatedCall(void *a1, const char *a2, ...)
{
  return [a1 isNewtonOriginatedCall];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return [a1 isOutgoing];
}

id objc_msgSend_isSOS(void *a1, const char *a2, ...)
{
  return [a1 isSOS];
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return [a1 isSystemProvider];
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return [a1 isTelephonyProvider];
}

id objc_msgSend_isTinCanProvider(void *a1, const char *a2, ...)
{
  return [a1 isTinCanProvider];
}

id objc_msgSend_isUplinkMuted(void *a1, const char *a2, ...)
{
  return [a1 isUplinkMuted];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return [a1 isVideo];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return [a1 localizedLabel];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedProviderName(void *a1, const char *a2, ...)
{
  return [a1 localizedProviderName];
}

id objc_msgSend_mockDialRequestForRedial(void *a1, const char *a2, ...)
{
  return [a1 mockDialRequestForRedial];
}

id objc_msgSend_mockDisconnectedReason(void *a1, const char *a2, ...)
{
  return [a1 mockDisconnectedReason];
}

id objc_msgSend_mockDisplayName(void *a1, const char *a2, ...)
{
  return [a1 mockDisplayName];
}

id objc_msgSend_mockIsOutgoing(void *a1, const char *a2, ...)
{
  return [a1 mockIsOutgoing];
}

id objc_msgSend_mockIsSOS(void *a1, const char *a2, ...)
{
  return [a1 mockIsSOS];
}

id objc_msgSend_mockLocalSenderIdentity(void *a1, const char *a2, ...)
{
  return [a1 mockLocalSenderIdentity];
}

id objc_msgSend_mockLocalizedLabel(void *a1, const char *a2, ...)
{
  return [a1 mockLocalizedLabel];
}

id objc_msgSend_mockProvider(void *a1, const char *a2, ...)
{
  return [a1 mockProvider];
}

id objc_msgSend_mockService(void *a1, const char *a2, ...)
{
  return [a1 mockService];
}

id objc_msgSend_mockStatus(void *a1, const char *a2, ...)
{
  return [a1 mockStatus];
}

id objc_msgSend_needsManualInCallSounds(void *a1, const char *a2, ...)
{
  return [a1 needsManualInCallSounds];
}

id objc_msgSend_onlyTUCall(void *a1, const char *a2, ...)
{
  return [a1 onlyTUCall];
}

id objc_msgSend_originatingUIType(void *a1, const char *a2, ...)
{
  return [a1 originatingUIType];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_providerManager(void *a1, const char *a2, ...)
{
  return [a1 providerManager];
}

id objc_msgSend_redialPrompt(void *a1, const char *a2, ...)
{
  return [a1 redialPrompt];
}

id objc_msgSend_rejoinPrompt(void *a1, const char *a2, ...)
{
  return [a1 rejoinPrompt];
}

id objc_msgSend_relayIsSupported(void *a1, const char *a2, ...)
{
  return [a1 relayIsSupported];
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return [a1 remoteParticipantHandles];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedUtilityProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedUtilityProvider];
}

id objc_msgSend_shouldNotFlipMute(void *a1, const char *a2, ...)
{
  return [a1 shouldNotFlipMute];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_subTitle(void *a1, const char *a2, ...)
{
  return [a1 subTitle];
}

id objc_msgSend_supportsDisplayingFaceTimeAudioCalls(void *a1, const char *a2, ...)
{
  return [a1 supportsDisplayingFaceTimeAudioCalls];
}

id objc_msgSend_telephonyCallSupport(void *a1, const char *a2, ...)
{
  return [a1 telephonyCallSupport];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return [a1 telephonyProvider];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return [a1 ttyType];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_wantsHoldMusic(void *a1, const char *a2, ...)
{
  return [a1 wantsHoldMusic];
}

id objc_msgSend_wasDeclined(void *a1, const char *a2, ...)
{
  return [a1 wasDeclined];
}