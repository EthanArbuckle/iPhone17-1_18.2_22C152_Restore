void _CACAssertionFailed(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
  void v31[4];
  dispatch_semaphore_t v32;
  uint64_t *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x263EF8340];
  v13 = a4;
  v33 = &a9;
  v14 = (objc_class *)NSString;
  v15 = a5;
  v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&a9];

  v17 = (void *)[[NSString alloc] initWithUTF8String:a1];
  v18 = [NSNumber numberWithUnsignedLong:a2];
  v19 = CACLogBugReporter();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136316162;
    v35 = a3;
    v36 = 2112;
    v37 = v17;
    v38 = 2112;
    v39 = v18;
    v40 = 2112;
    v41 = v16;
    v42 = 2112;
    v43 = v13;
    _os_log_fault_impl(&dword_238377000, v19, OS_LOG_TYPE_FAULT, "*** Assertion failure in %s, %@:%@.\n\n%@\n%@", buf, 0x34u);
  }

  v20 = dispatch_semaphore_create(0);
  v21 = [v17 lastPathComponent];
  v22 = +[CACBugReporter sharedReporter];
  v23 = a3;
  v24 = v13;
  v25 = (void *)v22;
  v26 = CACBugReporterTypeAssertion;
  v27 = CACBugReporterSubtypeFault;
  v28 = [NSString stringWithFormat:@"%@, %s, %@", v21, v23, v16];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = ___CACAssertionFailed_block_invoke;
  v31[3] = &unk_264D115D0;
  v32 = v20;
  v29 = v20;
  [v25 reportIssue:v26 subtype:v27 description:v28 completionBlock:v31];

  v30 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v29, v30);
}

void sub_23837B778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_23837EA28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const void *CACRecognizeCommandIdentifier(const void *a1, const void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_264D11898;
  v13[0] = a1;
  v13[1] = a2;
  CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, v13, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v2) {
    return 0;
  }
  v3 = CACCreateSerializedGenericActionDictionary((uint64_t)v2);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_0);
  xpc_connection_resume(mach_service);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "msg", 101);
  xpc_dictionary_set_value(v6, "pld", v4);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  CFDictionaryRef v8 = (const __CFDictionary *)CACCreateDeserializedObject((uint64_t)v7);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    Value = CFDictionaryGetValue(v8, @"replyObject");
    v11 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

const void *CACRecognizeString(const void *a1, const void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_264D118C8;
  v13[0] = a1;
  v13[1] = a2;
  CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, v13, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v2) {
    return 0;
  }
  v3 = CACCreateSerializedGenericActionDictionary((uint64_t)v2);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_18);
  xpc_connection_resume(mach_service);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "msg", 101);
  xpc_dictionary_set_value(v6, "pld", v4);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  CFDictionaryRef v8 = (const __CFDictionary *)CACCreateDeserializedObject((uint64_t)v7);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    Value = CFDictionaryGetValue(v8, @"replyObject");
    v11 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

const void *CACRequestInformationWithLocaleAndParams(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_264D118D8;
  uint64_t v15 = @"timeout";
  values[0] = a1;
  values[1] = a2;
  values[2] = a3;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v3) {
    return 0;
  }
  v4 = CACCreateSerializedGenericActionDictionary((uint64_t)v3);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_23);
  xpc_connection_resume(mach_service);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "msg", 102);
  xpc_dictionary_set_value(v7, "pld", v5);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(mach_service, v7);
  CFDictionaryRef v9 = (const __CFDictionary *)CACCreateDeserializedObject((uint64_t)v8);
  if (v9)
  {
    CFDictionaryRef v10 = v9;
    Value = CFDictionaryGetValue(v9, @"replyObject");
    CFRetain(Value);
    CFRelease(v10);
  }
  else
  {
    Value = 0;
  }

  return Value;
}

void sub_238382304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_238383490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_238383C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_238383F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void CACGetDeviceSupportsUserAttentionDetection(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if (CACGetDeviceSupportsUserAttentionDetection_onceToken != -1) {
      dispatch_once(&CACGetDeviceSupportsUserAttentionDetection_onceToken, &__block_literal_global_3);
    }
    xpc_object_t v6 = CACGetDeviceSupportsUserAttentionDetection_serialUserAttentionSupportQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __CACGetDeviceSupportsUserAttentionDetection_block_invoke_2;
    v7[3] = &unk_264D116E0;
    id v8 = v3;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

uint64_t __CACGetDeviceSupportsUserAttentionDetection_block_invoke()
{
  CACGetDeviceSupportsUserAttentionDetection_serialUserAttentionSupportQueue = (uint64_t)dispatch_queue_create("com.apple.SpeechRecognitionCore.SerialUserAttentionSupportQueue", 0);
  return MEMORY[0x270F9A758]();
}

void __CACGetDeviceSupportsUserAttentionDetection_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F28870] supportedEvents];
  char v3 = [MEMORY[0x263F017D0] isWakeGestureAvailable];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CACGetDeviceSupportsUserAttentionDetection_block_invoke_3;
  block[3] = &unk_264D11A40;
  id v4 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = v2;
  char v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __CACGetDeviceSupportsUserAttentionDetection_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void sub_2383880C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23838870C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23838A808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_23838BC98(void *a1)
{
}

void sub_23838C688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23838C728(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23838DA64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23838DD7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23838ED80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NumberWithLog2BucketForIntegerValue(uint64_t a1)
{
  if (a1 < 1)
  {
    char v3 = &unk_26EB4CD68;
  }
  else if (a1 == 1)
  {
    char v3 = &unk_26EB4CD80;
  }
  else
  {
    char v3 = [NSNumber numberWithLong:llround(log2((double)a1))];
  }
  return v3;
}

void sub_23839031C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23839049C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383913A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238391400(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383916D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23839187C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238391AF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238391C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238391D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383934B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23839387C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238393B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_238394228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_238394A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_23839CE80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23839D034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void _NotificationLanguageSettingsChanged()
{
}

void _NotificationAlwaysShowOverlayTypeSettingsChanged()
{
}

void _NotificationOverlayOptionsSettingsChanged()
{
  v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v1 = [v0 isActiveOverlayType:@"NumberedGrid"];

  if (v1)
  {
    uint64_t v2 = MEMORY[0x263EF83A0];
    dispatch_async(v2, &__block_literal_global_1612);
  }
}

void _NotificationCommandsSettingsChanged()
{
}

void _NotificationUserHintsSettingsChanged()
{
  id v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 synchronizeRecognizersWithReason:kSRUISyncReasonRecognizersChanged];
}

void _NotificationAttentionBasedSettingsChanged()
{
}

void _NotificationLiveMicrophoneDidTurnOnAfterInterruption()
{
  id v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 _microphoneTurnedOnAfterInteruption];

  int v1 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if ([v1 telephonyInterruptedListening])
  {
    uint64_t v2 = +[CACDisplayManager sharedManager];
    int v3 = [v2 carPlayConnected];

    if (!v3)
    {
      id v4 = &__block_literal_global_1619;
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v6 = [v5 _attentionIsLostWithListeningOffAction];

  if (v6) {
    goto LABEL_8;
  }
  id v4 = &__block_literal_global_1645;
LABEL_7:
  dispatch_async(MEMORY[0x263EF83A0], v4);
LABEL_8:
  id v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v7 setTelephonyInterruptedListening:0];
}

void _NotificationLiveMicrophoneDidTurnOffAfterInterruption()
{
  id v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 _microphoneTurnedOffAfterInteruption];
}

void _NotificationLiveMicrophoneDidTurnOn()
{
  id v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 _microphoneTurnedOn];
}

void _NotificationLiveMicrophoneDidTurnOff()
{
  id v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 _microphoneTurnedOff];
}

void sub_2383A3458(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A37E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A3928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383A39C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A3A4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A3E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_2383A3F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383A6940(_Unwind_Exception *a1)
{
}

void sub_2383A6DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A6F90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A71FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A7284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383A8BE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A8E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383A8F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383A9020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A9AB0(_Unwind_Exception *exception_object)
{
}

void sub_2383A9C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383A9FDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AA110(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AA7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_2383AA8BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AA994(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AB480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AC738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383ACA2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AD36C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383AD9D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383ADC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_2383ADFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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
}

void sub_2383AE684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_2383B0B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_2383B2064(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B2C80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B7CD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B813C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B8220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void RXRelease(const void *a1)
{
  if (a1)
  {
    label = dispatch_queue_get_label(0);
    if (label && !strncmp(label, "com.apple.speech.RXAPIDispatchQueue", 0x23uLL))
    {
      CFRelease(a1);
    }
    else
    {
      CFRetain(a1);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __RXRelease_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      void block[4] = a1;
      dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
    }
  }
}

void sub_2383B910C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B9204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B9448(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B9540(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383B9828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383B9D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __RXRelease_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
  uint64_t v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void sub_2383BA448(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383BBCA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383BBD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383BBE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383BC2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383BE4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_2383BF980(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *CACStringForUserAttentionGainEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"CACUserAttentionGainEventUndefined";
  }
  else {
    return off_264D123C0[a1 - 1];
  }
}

__CFString *CACStringForUserAttentionLossEvent(uint64_t a1)
{
  int v1 = @"CACUserAttentionLossEventUndefined";
  if (a1 == 1) {
    int v1 = @"CACUserAttentionLossEventFaceDetection";
  }
  if (a1 == 2) {
    return @"CACUserAttentionLossEventLowerDeviceGesture";
  }
  else {
    return v1;
  }
}

void sub_2383C4FA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2383C5174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _handleNotification(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 isEqualToString:@"CACNotificationLanguageChanged"])
  {
    uint64_t v3 = MEMORY[0x263EF83A0];
    dispatch_async(v3, &__block_literal_global_749);
  }
}

void sub_2383CD7C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383CD848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void ___handleNotification_block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  [v0 _handleLanguageChanged];
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

BOOL utility_tool_connection_entitled()
{
  id v0 = (void *)xpc_connection_copy_entitlement_value();
  int v1 = v0;
  if (v0) {
    BOOL value = xpc_BOOL_get_value(v0);
  }
  else {
    BOOL value = 0;
  }

  return value;
}

void __utility_tool_event_handler_block_invoke(uint64_t a1, void *a2)
{
  v122[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x23EC8EF90]();
  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  if (v6 == (id)MEMORY[0x263EF86A8])
  {
    id v19 = v5;
    if (v19)
    {
      v20 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      v21 = [v20 commandsToIgnore];

      if (v21)
      {
        v22 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        v23 = [v22 commandsToIgnore];
        [v23 removeAllObjects];

        v24 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        [v24 setCommandsToIgnore:0];

        v25 = +[CACDisplayManager sharedManager];
        [v25 setShouldShowTextEditingOverlayInTutorial:1];
      }
      barrier = (__CFString *)MEMORY[0x263EF8330];
      uint64_t v116 = 3221225472;
      v117 = __utility_tool_client_tearDown_block_invoke;
      v118 = &unk_264D115D0;
      v119 = (_xpc_connection_s *)v19;
      xpc_connection_send_barrier(v119, &barrier);
    }
    v26 = +[CACUtilityToolServer sharedInstance];
    [v26 removeClient:v19];
  }
  else
  {
    if (!utility_tool_connection_entitled())
    {
      uint64_t v9 = (void *)CACCreateSerializedObject(objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Unsupported client", @"ErrorString", 0));
      reply_to_event_with_object(v5, v6, v9);
      goto LABEL_16;
    }
    if (MEMORY[0x23EC8F590](v6) == MEMORY[0x263EF8708])
    {
      int64_t int64 = xpc_dictionary_get_int64(v6, "msg");
      char v8 = xpc_dictionary_get_value(v6, "pld");
      uint64_t v9 = v8;
      if (int64 != 102)
      {
        if (int64 != 101) {
          goto LABEL_16;
        }
        uint64_t v10 = (void *)CACCreateDeserializedGenericActionDictionary(v8);
        if (!v10) {
          goto LABEL_16;
        }
        v11 = v10;
        v12 = [v10 objectForKey:@"timeout"];
        v13 = [v11 objectForKey:@"cmTX"];
        v14 = [v11 objectForKey:@"cxID"];
        uint64_t v15 = [v11 objectForKey:@"ignoreCommand"];
        uint64_t v16 = [v11 objectForKey:@"getCorrections"];
        v108 = [v11 objectForKey:@"showTextEditingOverlay"];
        v111 = v15;
        v106 = v16;
        if (v13)
        {
          v17 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          if (v12) {
            [v12 doubleValue];
          }
          else {
            double v18 = 10.0;
          }
          v59 = [v17 synchronousRecognitionOfString:v13 timeoutInterval:v18];
        }
        else
        {
          if ([v14 length])
          {
            int v57 = [v14 isEqualToString:@"ResetRecognizedCommandIdentifier"];
            v58 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
            v59 = v58;
            if (v57)
            {
              [v58 setRecognizedCommandIdentifier:@"ResetRecognizedCommandIdentifier"];
            }
            else
            {
              [v58 handleCommandWithIdentifier:v14];

              v59 = xpc_string_create("success");
              reply_to_event_with_object(v5, v6, v59);
            }
            goto LABEL_44;
          }
          if ([v15 length])
          {
            int v102 = [v15 isEqualToString:@"ResetIgnoredCommands"];
            v63 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
            v64 = [v63 commandsToIgnore];
            v65 = v64;
            if (v102)
            {

              if (!v65) {
                goto LABEL_45;
              }
              v59 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
              v62 = [v59 commandsToIgnore];
              [v62 removeAllObjects];
            }
            else
            {

              if (!v65)
              {
                v71 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v71 setCommandsToIgnore:v72];
              }
              v59 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
              v62 = [v59 commandsToIgnore];
              [v62 addObject:v111];
            }
            goto LABEL_43;
          }
          if ([v16 length])
          {
            v103 = +[CACPreferences sharedPreferences];
            v68 = [v103 bestLocaleIdentifier];
            v59 = +[CACCorrectionUtilities alternativesForString:v16 languageIdentifier:v68];

            if ([v59 count])
            {
              v69 = +[CACUtilityToolServer sharedInstance];
              [v69 setPhoneticAlternative:0];

              v104 = +[CACUtilityToolServer sharedInstance];
              v70 = [v59 objectAtIndexedSubscript:0];
              [v104 setPhoneticAlternative:v70];
            }
            goto LABEL_44;
          }
          if ([v108 length])
          {
            if ([v108 isEqualToString:@"DisableTextEditingOverlay"])
            {
              v77 = +[CACDisplayManager sharedManager];
              v59 = v77;
              uint64_t v78 = 0;
            }
            else
            {
              if (![v108 isEqualToString:@"ResetTextEditingOverlay"]) {
                goto LABEL_45;
              }
              v77 = +[CACDisplayManager sharedManager];
              v59 = v77;
              uint64_t v78 = 1;
            }
            [v77 setShouldShowTextEditingOverlayInTutorial:v78];
            goto LABEL_44;
          }
          v105 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          v99 = [v11 objectForKey:@"cmID"];
          v97 = [v11 objectForKey:@"params"];
          if (v12) {
            [v12 doubleValue];
          }
          else {
            double v83 = 10.0;
          }
          v59 = [v105 synchronousRecognitionUsingCommandIdentifier:v99 parameters:v97 timeoutInterval:v83];
        }
        v62 = (void *)CACCreateSerializedObject((uint64_t)v59);
        reply_to_event_with_object(v5, v6, v62);
LABEL_43:

LABEL_44:
LABEL_45:
        CFRelease(v11);

        goto LABEL_16;
      }
      v27 = (void *)CACCreateDeserializedGenericActionDictionary(v8);
      if (v27)
      {
        v28 = v27;
        v29 = [v27 objectForKey:@"localeID"];
        v30 = [v28 objectForKey:@"params"];
        v31 = [v30 firstObject];
        uint64_t v32 = [v31 caseInsensitiveCompare:@"allCommands"];

        if (v32)
        {
          v33 = [v30 firstObject];
          uint64_t v34 = [v33 caseInsensitiveCompare:@"activeCommands"];

          if (v34)
          {
            v35 = [v30 firstObject];
            uint64_t v36 = [v35 caseInsensitiveCompare:@"groupedCommands"];

            if (v36)
            {
              v37 = [v30 firstObject];
              uint64_t v38 = [v37 caseInsensitiveCompare:@"contextSummary"];

              if (v38)
              {
                v39 = [v30 firstObject];
                uint64_t v40 = [v39 caseInsensitiveCompare:@"customCommands"];

                if (v40)
                {
                  v41 = [v30 firstObject];
                  uint64_t v42 = [v41 caseInsensitiveCompare:@"listeningStatus"];

                  if (v42)
                  {
                    v43 = [v30 firstObject];
                    uint64_t v44 = [v43 caseInsensitiveCompare:@"overlayStatus"];

                    if (v44)
                    {
                      v45 = [v30 firstObject];
                      uint64_t v46 = [v45 caseInsensitiveCompare:@"dictationStatus"];

                      if (v46)
                      {
                        v47 = [v30 firstObject];
                        uint64_t v48 = [v47 caseInsensitiveCompare:@"ComputeGridPath"];

                        if (!v48)
                        {
                          if ((unint64_t)[v30 count] < 5) {
                            goto LABEL_86;
                          }
                          v49 = [v30 objectAtIndexedSubscript:1];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v50 = [v30 objectAtIndexedSubscript:2];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v51 = [v30 objectAtIndexedSubscript:3];
                              objc_opt_class();
                              v112 = v51;
                              if (objc_opt_isKindOfClass())
                              {
                                v52 = [v30 objectAtIndexedSubscript:4];
                                objc_opt_class();
                                char isKindOfClass = objc_opt_isKindOfClass();

                                if (isKindOfClass)
                                {
                                  v113 = [v30 objectAtIndexedSubscript:1];
                                  v110 = [v30 objectAtIndexedSubscript:2];
                                  v107 = [v30 objectAtIndexedSubscript:3];
                                  v101 = [v30 objectAtIndexedSubscript:4];
                                  if ((unint64_t)[v30 count] >= 6
                                    && ([v30 objectAtIndexedSubscript:5],
                                        v53 = objc_claimAutoreleasedReturnValue(),
                                        objc_opt_class(),
                                        char v54 = objc_opt_isKindOfClass(),
                                        v53,
                                        (v54 & 1) != 0))
                                  {
                                    v55 = [v30 objectAtIndexedSubscript:5];
                                    uint64_t v56 = [v55 unsignedIntValue];
                                  }
                                  else
                                  {
                                    uint64_t v56 = 0;
                                  }
                                  [(__CFString *)v113 doubleValue];
                                  double v85 = v84;
                                  [v110 doubleValue];
                                  double v87 = v86;
                                  [v107 doubleValue];
                                  double v89 = v88;
                                  [v101 doubleValue];
                                  double v91 = v90;
                                  v92 = +[CACUtilityToolServer sharedInstance];
                                  v93 = objc_msgSend(v92, "gridNumberToHitRect:displayID:", v56, v85, v87, v89, v91);

                                  v98 = v93;
                                  v100 = [v93 objectForKey:@"error"];
                                  if (v100)
                                  {
                                    v114[0] = @"ComputeGridPathResult";
                                    v121 = @"error";
                                    v122[0] = v100;
                                    v94 = [NSDictionary dictionaryWithObjects:v122 forKeys:&v121 count:1];
                                    barrier = (__CFString *)v94;
                                    v74 = [NSDictionary dictionaryWithObjects:&barrier forKeys:v114 count:1];
                                  }
                                  else
                                  {
                                    v121 = @"ComputeGridPathResult";
                                    v114[0] = @"PointX";
                                    v114[1] = @"PointY";
                                    barrier = v113;
                                    uint64_t v116 = (uint64_t)v110;
                                    v114[2] = @"Width";
                                    v114[3] = @"Height";
                                    v117 = (void (*)(uint64_t))v107;
                                    v118 = v101;
                                    v114[4] = @"Path";
                                    v94 = [v93 objectForKey:@"number"];
                                    v119 = v94;
                                    v114[5] = @"IsFinal";
                                    v96 = [v93 objectForKey:@"isFinal"];
                                    v120 = v96;
                                    v95 = [NSDictionary dictionaryWithObjects:&barrier forKeys:v114 count:6];
                                    v122[0] = v95;
                                    v74 = [NSDictionary dictionaryWithObjects:v122 forKeys:&v121 count:1];
                                  }
                                  goto LABEL_87;
                                }
LABEL_86:
                                v74 = (__CFString *)&unk_26EB4D1E8;
LABEL_87:
                                uint64_t v81 = (uint64_t)v74;
LABEL_73:
                                v82 = (void *)CACCreateSerializedObject(v81);
                                if (v82) {
                                  reply_to_event_with_object(v5, v6, v82);
                                }

                                goto LABEL_56;
                              }
                            }
                          }

                          goto LABEL_86;
                        }
LABEL_56:
                        CFRelease(v28);

                        goto LABEL_16;
                      }
                      v79 = +[CACUtilityToolServer sharedInstance];
                      v74 = [v79 dictationStatus];

                      v75 = @"DictationStatusString";
                    }
                    else
                    {
                      v76 = +[CACUtilityToolServer sharedInstance];
                      v74 = [v76 overlayStatus];

                      v75 = @"OverlayStatusString";
                    }
                  }
                  else
                  {
                    v73 = +[CACUtilityToolServer sharedInstance];
                    v74 = [v73 listeningStatus];

                    v75 = @"ListeningStatusString";
                  }
                  v114[0] = v75;
                  if (v74) {
                    v80 = v74;
                  }
                  else {
                    v80 = &stru_26EB332F0;
                  }
                  barrier = v80;
                  uint64_t v81 = [NSDictionary dictionaryWithObjects:&barrier forKeys:v114 count:1];
                  goto LABEL_73;
                }
                v60 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                uint64_t v61 = [v60 allCustomCommandsDetail];
              }
              else
              {
                v60 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                uint64_t v61 = [v60 contextSummary];
              }
            }
            else
            {
              v60 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
              uint64_t v61 = [v60 groupedCommandsForLocaleIdentifier:v29];
            }
          }
          else
          {
            v60 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
            uint64_t v61 = [v60 activeCommandsForLocaleIdentifier:v29];
          }
        }
        else
        {
          v60 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          uint64_t v61 = [v60 allCommandsForLocaleIdentifier:v29];
        }
        v66 = (void *)v61;

        v67 = (void *)CACCreateSerializedObject((uint64_t)v66);
        reply_to_event_with_object(v5, v6, v67);

        goto LABEL_56;
      }
LABEL_16:
    }
  }
}

void reply_to_event_with_object(void *a1, void *a2, void *a3)
{
  connection = a1;
  id v5 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    id v7 = (void *)os_transaction_create();
    xpc_dictionary_set_value(reply, "replyObject", v5);
    xpc_connection_send_message(connection, reply);
  }
}

void __utility_tool_client_tearDown_block_invoke(uint64_t a1)
{
}

void sub_2383D170C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CACLogAccessibility()
{
  if (CACLogAccessibility_onceToken != -1) {
    dispatch_once(&CACLogAccessibility_onceToken, &__block_literal_global_30);
  }
  id v0 = (void *)CACLogAccessibility_sLogAccessibility;
  return v0;
}

uint64_t __CACLogAccessibility_block_invoke()
{
  CACLogAccessibility_sLogAccessibility = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Accessibility");
  return MEMORY[0x270F9A758]();
}

id CACLogAudio()
{
  if (CACLogAudio_onceToken != -1) {
    dispatch_once(&CACLogAudio_onceToken, &__block_literal_global_2_0);
  }
  id v0 = (void *)CACLogAudio_sLogAudio;
  return v0;
}

uint64_t __CACLogAudio_block_invoke()
{
  CACLogAudio_sLogAudio = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Audio");
  return MEMORY[0x270F9A758]();
}

id CACLogContext()
{
  if (CACLogContext_onceToken != -1) {
    dispatch_once(&CACLogContext_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)CACLogContext_sLogContext;
  return v0;
}

uint64_t __CACLogContext_block_invoke()
{
  CACLogContext_sLogContext = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Context");
  return MEMORY[0x270F9A758]();
}

id CACLogDictationCommands()
{
  if (CACLogDictationCommands_onceToken != -1) {
    dispatch_once(&CACLogDictationCommands_onceToken, &__block_literal_global_6);
  }
  id v0 = (void *)CACLogDictationCommands_sLogDictationCommands;
  return v0;
}

uint64_t __CACLogDictationCommands_block_invoke()
{
  CACLogDictationCommands_sLogDictationCommands = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "DictationCommands");
  return MEMORY[0x270F9A758]();
}

id CACLogElementCollection()
{
  if (CACLogElementCollection_onceToken != -1) {
    dispatch_once(&CACLogElementCollection_onceToken, &__block_literal_global_8);
  }
  id v0 = (void *)CACLogElementCollection_sLogElementCollection;
  return v0;
}

uint64_t __CACLogElementCollection_block_invoke()
{
  CACLogElementCollection_sLogElementCollection = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "ElementCollection");
  return MEMORY[0x270F9A758]();
}

id CACLogElementEvaluation()
{
  if (CACLogElementEvaluation_onceToken != -1) {
    dispatch_once(&CACLogElementEvaluation_onceToken, &__block_literal_global_10_0);
  }
  id v0 = (void *)CACLogElementEvaluation_sLogElementEvaluation;
  return v0;
}

uint64_t __CACLogElementEvaluation_block_invoke()
{
  CACLogElementEvaluation_sLogElementEvaluation = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "ElementEvaluation");
  return MEMORY[0x270F9A758]();
}

id CACLogFindAndSelect()
{
  if (CACLogFindAndSelect_onceToken != -1) {
    dispatch_once(&CACLogFindAndSelect_onceToken, &__block_literal_global_12);
  }
  id v0 = (void *)CACLogFindAndSelect_sLogFindAndSelect;
  return v0;
}

uint64_t __CACLogFindAndSelect_block_invoke()
{
  CACLogFindAndSelect_sLogFindAndSelect = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "FindAndSelect");
  return MEMORY[0x270F9A758]();
}

id CACLogGeneral()
{
  if (CACLogGeneral_onceToken != -1) {
    dispatch_once(&CACLogGeneral_onceToken, &__block_literal_global_14);
  }
  id v0 = (void *)CACLogGeneral_sLogGeneral;
  return v0;
}

uint64_t __CACLogGeneral_block_invoke()
{
  CACLogGeneral_sLogGeneral = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "General");
  return MEMORY[0x270F9A758]();
}

id CACLogPreferences()
{
  if (CACLogPreferences_onceToken != -1) {
    dispatch_once(&CACLogPreferences_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)CACLogPreferences_sLogPreferences;
  return v0;
}

uint64_t __CACLogPreferences_block_invoke()
{
  CACLogPreferences_sLogPreferences = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Preferences");
  return MEMORY[0x270F9A758]();
}

id CACLogRecognition()
{
  if (CACLogRecognition_onceToken != -1) {
    dispatch_once(&CACLogRecognition_onceToken, &__block_literal_global_18_0);
  }
  id v0 = (void *)CACLogRecognition_sLogRecognition;
  return v0;
}

uint64_t __CACLogRecognition_block_invoke()
{
  CACLogRecognition_sLogRecognition = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Recognition");
  return MEMORY[0x270F9A758]();
}

id CACLogWordParse()
{
  if (CACLogWordParse_onceToken != -1) {
    dispatch_once(&CACLogWordParse_onceToken, &__block_literal_global_20);
  }
  id v0 = (void *)CACLogWordParse_sLogWordParse;
  return v0;
}

uint64_t __CACLogWordParse_block_invoke()
{
  CACLogWordParse_sLogWordParse = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "WordParse");
  return MEMORY[0x270F9A758]();
}

id CACLogBugReporter()
{
  if (CACLogBugReporter_onceToken != -1) {
    dispatch_once(&CACLogBugReporter_onceToken, &__block_literal_global_22);
  }
  id v0 = (void *)CACLogBugReporter_sLogBugReporter;
  return v0;
}

uint64_t __CACLogBugReporter_block_invoke()
{
  CACLogBugReporter_sLogBugReporter = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "BugReporter");
  return MEMORY[0x270F9A758]();
}

id CACLogAttentionAware()
{
  if (CACLogAttentionAware_onceToken != -1) {
    dispatch_once(&CACLogAttentionAware_onceToken, &__block_literal_global_24);
  }
  id v0 = (void *)CACLogAttentionAware_sLogAttentionAware;
  return v0;
}

uint64_t __CACLogAttentionAware_block_invoke()
{
  CACLogAttentionAware_sLogAttentionAware = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "AttentionAware");
  return MEMORY[0x270F9A758]();
}

id CACLogShortcuts()
{
  if (CACLogShortcuts_onceToken != -1) {
    dispatch_once(&CACLogShortcuts_onceToken, &__block_literal_global_26_0);
  }
  id v0 = (void *)CACLogShortcuts_sLogShortcuts;
  return v0;
}

uint64_t __CACLogShortcuts_block_invoke()
{
  CACLogShortcuts_sLogShortcuts = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "SiriShortcuts");
  return MEMORY[0x270F9A758]();
}

id CACLogCorrections()
{
  if (CACLogCorrections_onceToken != -1) {
    dispatch_once(&CACLogCorrections_onceToken, &__block_literal_global_28);
  }
  id v0 = (void *)CACLogCorrections_sLogCorrections;
  return v0;
}

uint64_t __CACLogCorrections_block_invoke()
{
  CACLogCorrections_sLogCorrections = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Corrections");
  return MEMORY[0x270F9A758]();
}

id CACLogGrid()
{
  if (CACLogGrid_onceToken != -1) {
    dispatch_once(&CACLogGrid_onceToken, &__block_literal_global_30);
  }
  id v0 = (void *)CACLogGrid_sLogGrid;
  return v0;
}

uint64_t __CACLogGrid_block_invoke()
{
  CACLogGrid_sLogGrid = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Grid");
  return MEMORY[0x270F9A758]();
}

id CACLogAssetDownload()
{
  if (CACLogAssetDownload_onceToken != -1) {
    dispatch_once(&CACLogAssetDownload_onceToken, &__block_literal_global_32);
  }
  id v0 = (void *)CACLogAssetDownload_sLogAssetDownload;
  return v0;
}

uint64_t __CACLogAssetDownload_block_invoke()
{
  CACLogAssetDownload_sLogAssetDownload = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "AssetDownload");
  return MEMORY[0x270F9A758]();
}

id CACLogGestureRecording()
{
  if (CACLogGestureRecording_onceToken != -1) {
    dispatch_once(&CACLogGestureRecording_onceToken, &__block_literal_global_34);
  }
  id v0 = (void *)CACLogGestureRecording_sLogGestureRecording;
  return v0;
}

uint64_t __CACLogGestureRecording_block_invoke()
{
  CACLogGestureRecording_sLogGestureRecording = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "GestureRecording");
  return MEMORY[0x270F9A758]();
}

id CACLogAdditionalLogging()
{
  if (CACLogAdditionalLogging_onceToken != -1) {
    dispatch_once(&CACLogAdditionalLogging_onceToken, &__block_literal_global_36);
  }
  id v0 = (void *)CACLogAdditionalLogging_sLogAdditionalLogging;
  return v0;
}

uint64_t __CACLogAdditionalLogging_block_invoke()
{
  CACLogAdditionalLogging_sLogAdditionalLogging = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "AdditionalLogging");
  return MEMORY[0x270F9A758]();
}

id AXMRLogVoiceControl()
{
  if (AXMRLogVoiceControl_onceToken != -1) {
    dispatch_once(&AXMRLogVoiceControl_onceToken, &__block_literal_global_38);
  }
  id v0 = (void *)AXMRLogVoiceControl_sMRLogVoiceControl;
  return v0;
}

uint64_t __AXMRLogVoiceControl_block_invoke()
{
  AXMRLogVoiceControl_sMRLogVoiceControl = (uint64_t)os_log_create("com.apple.Accessibility", "AXMRVoiceControl");
  return MEMORY[0x270F9A758]();
}

uint64_t CACZWLensInnerColor()
{
  return [MEMORY[0x263F825C8] colorWithRed:0.564705882 green:0.564705882 blue:0.619607843 alpha:1.0];
}

uint64_t CACZWLensOuterColor()
{
  return [MEMORY[0x263F825C8] colorWithRed:0.494117647 green:0.494117647 blue:0.552941176 alpha:1.0];
}

double CACZWZoomLensBorderThicknessForTouches()
{
  return 30.0;
}

double CACZWDefaultFadeAnimationDuration()
{
  return 0.2;
}

double CACZWDefaultZoomAnimationDuration()
{
  return 0.2;
}

double CACZWLensInnerBorderWidth()
{
  return 2.0;
}

double CACZWLensOuterBorderWidth()
{
  return 2.0;
}

double CACZWLensCornerRadius()
{
  return 10.0;
}

double CACZWZoomEdgeSlackAmount()
{
  return 10.0;
}

double CACZOTMainScreenSize()
{
  if (CACZOTMainScreenSize_onceToken != -1) {
    dispatch_once(&CACZOTMainScreenSize_onceToken, &__block_literal_global_31);
  }
  return *(double *)&CACZOTMainScreenSize_ScreenSize_0;
}

void __CACZOTMainScreenSize_block_invoke()
{
  id v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 nativeBounds];
  CACZOTMainScreenSize_ScreenSize_0 = v0;
  CACZOTMainScreenSize_ScreenSize_1 = v1;
}

double CACZOTMainScreenRect()
{
  return 0.0;
}

id CACZWInnerLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = objc_alloc_init(MEMORY[0x263F824C0]);
  v11 = v10;
  if (a1)
  {
    id v12 = v10;
    v34.origin.x = a2;
    v34.origin.y = a3;
    v34.size.width = a4;
    v34.size.height = a5;
    double MinX = CGRectGetMinX(v34);
    v35.origin.x = a2;
    v35.origin.y = a3;
    v35.size.width = a4;
    v35.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MinX, CGRectGetMinY(v35), 13.0, 1.44079633, 0.13);
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = a4;
    v36.size.height = a5;
    double MidX = CGRectGetMidX(v36);
    v37.origin.x = a2;
    v37.origin.y = a3;
    v37.size.width = a4;
    v37.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, CGRectGetMinY(v37), 13.0, -3.27159265, 0.13);
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    double MaxX = CGRectGetMaxX(v38);
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MaxX, CGRectGetMinY(v39), 13.0, -3.27159265, 1.70079633);
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    double v16 = CGRectGetMaxX(v40);
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16, CGRectGetMidY(v41), 13.0, -1.70079633, 1.70079633);
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    double v17 = CGRectGetMaxX(v42);
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, CGRectGetMaxY(v43), 13.0, -1.70079633, -3.01159265);
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    double v18 = CGRectGetMidX(v44);
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18, CGRectGetMaxY(v45), 13.0, -0.13, -3.01159265);
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    double v19 = CGRectGetMinX(v46);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v19, CGRectGetMaxY(v47), 13.0, -0.13, -1.44079633);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    double v20 = CGRectGetMinX(v48);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20, CGRectGetMidY(v49), 13.0, 1.44079633, -1.44079633);
    [v12 closePath];
  }
  else
  {
    CGFloat v21 = a5 + -4.0;
    CGFloat v22 = a4 + -4.0;
    CGFloat v23 = a3 + 2.0;
    CGFloat v24 = a2 + 2.0;
    v25 = (void *)MEMORY[0x263F824C0];
    v50.origin.x = v24;
    v50.origin.y = v23;
    v50.size.width = v22;
    v50.size.height = v21;
    CGFloat v26 = CGRectGetMinX(v50) + 9.0;
    v51.origin.x = v24;
    v51.origin.y = v23;
    v51.size.width = v22;
    v51.size.height = v21;
    objc_msgSend(v25, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v26, CGRectGetMinY(v51) + 9.0, 9.0, -3.14159265, -1.57079633);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    v52.origin.x = v24;
    v52.origin.y = v23;
    v52.size.width = v22;
    v52.size.height = v21;
    CGFloat v27 = CGRectGetMaxX(v52) + -9.0;
    v53.origin.x = v24;
    v53.origin.y = v23;
    v53.size.width = v22;
    v53.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, CGRectGetMinY(v53) + 9.0, 9.0, -1.57079633, 0.0);
    v54.origin.x = v24;
    v54.origin.y = v23;
    v54.size.width = v22;
    v54.size.height = v21;
    CGFloat v28 = CGRectGetMaxX(v54) + -9.0;
    v55.origin.x = v24;
    v55.origin.y = v23;
    v55.size.width = v22;
    v55.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, CGRectGetMaxY(v55) + -9.0, 9.0, 0.0, 1.57079633);
    v56.origin.x = v24;
    v56.origin.y = v23;
    v56.size.width = v22;
    v56.size.height = v21;
    CGFloat v29 = CGRectGetMinX(v56) + 9.0;
    v57.origin.x = v24;
    v57.origin.y = v23;
    v57.size.width = v22;
    v57.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v29, CGRectGetMaxY(v57));
    v58.origin.x = v24;
    v58.origin.y = v23;
    v58.size.width = v22;
    v58.size.height = v21;
    CGFloat v30 = CGRectGetMinX(v58) + 9.0;
    v59.origin.x = v24;
    v59.origin.y = v23;
    v59.size.width = v22;
    v59.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v30, CGRectGetMaxY(v59) + -9.0, 9.0, 1.57079633, 3.14159265);
    v60.origin.x = v24;
    v60.origin.y = v23;
    v60.size.width = v22;
    v60.size.height = v21;
    double v31 = CGRectGetMinX(v60);
    v61.origin.x = v24;
    v61.origin.y = v23;
    v61.size.width = v22;
    v61.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v31, CGRectGetMinY(v61) + 9.0);
  }
  return v12;
}

id CACZWOuterLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = [MEMORY[0x263F824C0] bezierPath];
  v38.origin.x = a2;
  v38.origin.y = a3;
  v38.size.width = a4;
  v38.size.height = a5;
  double MinX = CGRectGetMinX(v38);
  CGFloat v12 = a2;
  CGFloat v13 = a3;
  CGFloat v14 = a4;
  CGFloat v15 = a5;
  if (a1)
  {
    [v10 addArcWithCenter:1 radius:MinX startAngle:CGRectGetMinY(*(CGRect *)&v12) endAngle:11.0 clockwise:0.0];
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    CGFloat v16 = CGRectGetMinX(v39) + 11.0;
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v16, CGRectGetMinY(v40));
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    double MidX = CGRectGetMidX(v41);
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMinY(v42), 11.0, -3.14159265, 3.14159265);
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    CGFloat v18 = CGRectGetMidX(v43) + 11.0;
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v18, CGRectGetMinY(v44));
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    double MaxX = CGRectGetMaxX(v45);
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMinY(v46), 11.0, -3.14159265, 3.14159265);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    double v20 = CGRectGetMaxX(v47);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v20, CGRectGetMinY(v48) + 11.0);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    double v21 = CGRectGetMaxX(v49);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMidY(v50), 11.0, -1.57079633, 4.71238898);
    v51.origin.x = a2;
    v51.origin.y = a3;
    v51.size.width = a4;
    v51.size.height = a5;
    double v22 = CGRectGetMaxX(v51);
    v52.origin.x = a2;
    v52.origin.y = a3;
    v52.size.width = a4;
    v52.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v22, CGRectGetMidY(v52) + 11.0);
    v53.origin.x = a2;
    v53.origin.y = a3;
    v53.size.width = a4;
    v53.size.height = a5;
    double v23 = CGRectGetMaxX(v53);
    v54.origin.x = a2;
    v54.origin.y = a3;
    v54.size.width = a4;
    v54.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v23, CGRectGetMaxY(v54), 11.0, -1.57079633, 4.71238898);
    v55.origin.x = a2;
    v55.origin.y = a3;
    v55.size.width = a4;
    v55.size.height = a5;
    CGFloat v24 = CGRectGetMaxX(v55) + -11.0;
    v56.origin.x = a2;
    v56.origin.y = a3;
    v56.size.width = a4;
    v56.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v24, CGRectGetMaxY(v56));
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    double v25 = CGRectGetMidX(v57);
    v58.origin.x = a2;
    v58.origin.y = a3;
    v58.size.width = a4;
    v58.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMaxY(v58), 11.0, 0.0, 6.28318531);
    v59.origin.x = a2;
    v59.origin.y = a3;
    v59.size.width = a4;
    v59.size.height = a5;
    CGFloat v26 = CGRectGetMidX(v59) + -11.0;
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v26, CGRectGetMaxY(v60));
    v61.origin.x = a2;
    v61.origin.y = a3;
    v61.size.width = a4;
    v61.size.height = a5;
    double v27 = CGRectGetMinX(v61);
    v62.origin.x = a2;
    v62.origin.y = a3;
    v62.size.width = a4;
    v62.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, CGRectGetMaxY(v62), 11.0, 0.0, 6.28318531);
    v63.origin.x = a2;
    v63.origin.y = a3;
    v63.size.width = a4;
    v63.size.height = a5;
    double v28 = CGRectGetMinX(v63);
    v64.origin.x = a2;
    v64.origin.y = a3;
    v64.size.width = a4;
    v64.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v28, CGRectGetMaxY(v64) + -11.0);
    v65.origin.x = a2;
    v65.origin.y = a3;
    v65.size.width = a4;
    v65.size.height = a5;
    double v29 = CGRectGetMinX(v65);
    v66.origin.x = a2;
    v66.origin.y = a3;
    v66.size.width = a4;
    v66.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v29, CGRectGetMidY(v66), 11.0, 1.57079633, 7.85398163);
    v67.origin.x = a2;
    v67.origin.y = a3;
    v67.size.width = a4;
    v67.size.height = a5;
    double v30 = CGRectGetMinX(v67);
    v68.origin.x = a2;
    v68.origin.y = a3;
    v68.size.width = a4;
    v68.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v30, CGRectGetMidY(v68) + -11.0);
  }
  else
  {
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX + 11.0, CGRectGetMinY(*(CGRect *)&v12) + 11.0, 11.0, -3.14159265, -1.57079633);
    v69.origin.x = a2;
    v69.origin.y = a3;
    v69.size.width = a4;
    v69.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, CGRectGetMaxX(v69) + -11.0, 11.0, 11.0, -1.57079633, 0.0);
    v70.origin.x = a2;
    v70.origin.y = a3;
    v70.size.width = a4;
    v70.size.height = a5;
    CGFloat v31 = CGRectGetMaxX(v70) + -11.0;
    v71.origin.x = a2;
    v71.origin.y = a3;
    v71.size.width = a4;
    v71.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v31, CGRectGetMaxY(v71) + -11.0, 11.0, 0.0, 1.57079633);
    v72.origin.x = a2;
    v72.origin.y = a3;
    v72.size.width = a4;
    v72.size.height = a5;
    CGFloat v32 = CGRectGetMidX(v72) + 25.0 + -1.0;
    v73.origin.x = a2;
    v73.origin.y = a3;
    v73.size.width = a4;
    v73.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v32, CGRectGetMaxY(v73), 0.0, 0.0, -1.57079633);
    v74.origin.x = a2;
    v74.origin.y = a3;
    v74.size.width = a4;
    v74.size.height = a5;
    CGFloat v33 = CGRectGetMinX(v74) + 11.0;
    v75.origin.x = a2;
    v75.origin.y = a3;
    v75.size.width = a4;
    v75.size.height = a5;
    objc_msgSend(v10, "addLineToPoint:", v33, CGRectGetMaxY(v75));
    v76.origin.x = a2;
    v76.origin.y = a3;
    v76.size.width = a4;
    v76.size.height = a5;
    CGFloat v34 = CGRectGetMinX(v76) + 11.0;
    v77.origin.x = a2;
    v77.origin.y = a3;
    v77.size.width = a4;
    v77.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v34, CGRectGetMaxY(v77) + -11.0, 11.0, 1.57079633, 3.14159265);
  }
  v78.origin.x = a2;
  v78.origin.y = a3;
  v78.size.width = a4;
  v78.size.height = a5;
  double v35 = CGRectGetMinX(v78);
  v79.origin.x = a2;
  v79.origin.y = a3;
  v79.size.width = a4;
  v79.size.height = a5;
  objc_msgSend(v10, "addLineToPoint:", v35, CGRectGetMinY(v79) + 11.0);
  return v10;
}

id CACZWResizeGrabberPath(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8 = objc_alloc_init(MEMORY[0x263F824C0]);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  double MinX = CGRectGetMinX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX, CGRectGetMinY(v20), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  double MidX = CGRectGetMidX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMinY(v22), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMinY(v24), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  double v12 = CGRectGetMinX(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v12, CGRectGetMidY(v26), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  double v13 = CGRectGetMaxX(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v13, CGRectGetMidY(v28), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  double v14 = CGRectGetMinX(v29);
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, CGRectGetMaxY(v30), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  double v15 = CGRectGetMidX(v31);
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v15, CGRectGetMaxY(v32), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  double v16 = CGRectGetMaxX(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16, CGRectGetMaxY(v34), 10.0, -3.14159265, 3.14159265);
  [v8 closePath];
  return v8;
}

uint64_t NSStringFromCATransform3D(void *a1)
{
  return [NSString stringWithFormat:@"\n[%f, %f, %f, %f,\n %f, %f, %f, %f,\n %f, %f, %f, %f,\n %f, %f, %f, %f]", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]];
}

void sub_2383D62A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D66C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D68A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D6A08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D6B4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D6CA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D6E1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D6F7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D70D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383D7224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383DCBEC(_Unwind_Exception *a1)
{
}

void sub_2383E1D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2383E1EBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2383E3790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
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
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2383E87D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *CACNonNilStringWithinLengthLimit(void *a1, uint64_t a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = &stru_26EB332F0;
  }
  if ([(__CFString *)v7 length] >= a3)
  {
    id v8 = [MEMORY[0x263F089D8] string];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3010000000;
    v19[4] = 0;
    v19[5] = 0;
    v19[3] = &unk_238423B1B;
    uint64_t v9 = [(__CFString *)v7 length];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __CACNonNilStringWithinLengthLimit_block_invoke;
    v13[3] = &unk_264D12940;
    double v16 = v20;
    id v10 = v8;
    id v14 = v10;
    v11 = v7;
    double v15 = v11;
    double v17 = v19;
    uint64_t v18 = a2;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 3, v13);
    id v7 = (__CFString *)v10;

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }

  return v7;
}

void sub_2383E94D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void __CACNonNilStringWithinLengthLimit_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  double v13 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v12, a3 + a4 - v12);
  [v11 appendString:v13];

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v14 + 32) = a3;
  *(void *)(v14 + 40) = a4;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(a1 + 64)) {
    *a7 = 1;
  }
}

void sub_2383E9AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383E9E04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383EA7B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383EA840(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383EC1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2383EF058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2383F7754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_2383FCA94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383FCB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2383FCBE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2383FFFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_238400094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400448(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400580(_Unwind_Exception *exception_object)
{
}

void sub_238400610(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2384008B0(_Unwind_Exception *exception_object)
{
}

void sub_238400A30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400AB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400B64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400CD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_238400D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23840116C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void *CACCreateSerializedGenericActionDictionary(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!xpc_dictionary_get_count(v1))
  {

    return 0;
  }
  return v1;
}

uint64_t CACCreateDeserializedGenericActionDictionary(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && MEMORY[0x23EC8F590](v1) == MEMORY[0x263EF8708]) {
    uint64_t v3 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t CACCreateSerializedObject(uint64_t result)
{
  if (result) {
    return _CFXPCCreateXPCObjectFromCFObject();
  }
  return result;
}

uint64_t CACCreateDeserializedObject(uint64_t result)
{
  if (result) {
    return _CFXPCCreateCFObjectFromXPCObject();
  }
  return result;
}

void _languageChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = ___languageChanged_block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a3;
  v3[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t ___languageChanged_block_invoke(uint64_t a1)
{
  id v2 = CACLogAssetDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___languageChanged_block_invoke_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 40) languageDidChange];
}

id CACMakeErrorWithArgs(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (objc_class *)NSString;
  id v11 = a2;
  uint64_t v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  double v13 = CACMakeError(a1, v12);

  return v13;
}

id CACMakeError(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[CACBugReporter sharedReporter];
  id v5 = CACBugReporterTypeGenericError;
  id v6 = CACErrorCodeToString(a1);
  [v4 reportIssue:v5 subtype:v6 description:v3];

  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = v3;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v7 errorWithDomain:@"CACErrorDomain" code:a1 userInfo:v8];

  return v9;
}

__CFString *CACErrorCodeToString(uint64_t a1)
{
  switch(a1)
  {
    case 3000:
      id v2 = @"Cancelled by user";
      break;
    case 3001:
      id v2 = @"Interrupted by command";
      break;
    case 3002:
      id v2 = @"Command cannot be executed in this context";
      break;
    case 3003:
      id v2 = @"Command playback found unexpected disambiguation";
      break;
    case 3004:
      id v2 = @"Command target cannot be found missing name";
      break;
    case 3005:
      id v2 = @"Command target cannot be found missing number";
      break;
    case 3006:
      id v2 = @"User action unsupported type";
      break;
    default:
      if (a1)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
        id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v2 = @"Success";
      }
      break;
  }
  return v2;
}

uint64_t CACMakeSuccessError()
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"CACErrorDomain" code:0 userInfo:0];
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double CACViewRectFromPortraitUpRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  uint64_t v10 = _CACFixedCoordinateSpaceForView(v9);
  uint64_t v11 = _CACCoordinateSpaceForView(v9);

  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, a2, a3, a4, a5);
  double v13 = v12;

  return v13;
}

id _CACFixedCoordinateSpaceForView(void *a1)
{
  id v1 = a1;
  id v2 = [v1 window];
  if (v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (id v2 = v1) != 0)
  {
    id v3 = [v2 screen];
    uint64_t v4 = [v3 fixedCoordinateSpace];
  }
  else
  {
    id v2 = [MEMORY[0x263F82B60] mainScreen];
    uint64_t v4 = [v2 fixedCoordinateSpace];
  }

  return v4;
}

id _CACCoordinateSpaceForView(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
    id v3 = [v4 coordinateSpace];
  }
  return v3;
}

double CACPortraitUpRectFromViewRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  uint64_t v10 = _CACFixedCoordinateSpaceForView(v9);
  uint64_t v11 = _CACCoordinateSpaceForView(v9);

  objc_msgSend(v10, "convertRect:fromCoordinateSpace:", v11, a2, a3, a4, a5);
  double v13 = v12;

  return v13;
}

double CACViewPointFromPortraitUpPoint(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = _CACFixedCoordinateSpaceForView(v5);
  id v7 = _CACCoordinateSpaceForView(v5);

  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v7, a2, a3);
  double v9 = v8;

  return v9;
}

double CACPortraitUpPointFromViewPoint(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = _CACFixedCoordinateSpaceForView(v5);
  id v7 = _CACCoordinateSpaceForView(v5);

  objc_msgSend(v6, "convertPoint:fromCoordinateSpace:", v7, a2, a3);
  double v9 = v8;

  return v9;
}

double CACScreenOrientedRectFromPortraitUpRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  uint64_t v10 = [v9 fixedCoordinateSpace];
  uint64_t v11 = [v9 coordinateSpace];

  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, a2, a3, a4, a5);
  double v13 = v12;

  return v13;
}

void CACLayerize(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = a1;
  [v6 setBorderWidth:3.0];
  id v4 = v3;
  id v5 = (CGColor *)[v4 CGColor];

  objc_msgSend(v6, "setBorderColor:", CGColorCreateCopyWithAlpha(v5, 0.3));
}

void CACLayercake(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v11 = (objc_class *)MEMORY[0x263F82E00];
  id v12 = a2;
  id v13 = a1;
  id v15 = (id)objc_msgSend([v11 alloc], "initWithFrame:", a3, a4, a5, a6);
  uint64_t v14 = [v15 layer];
  CACLayerize(v14, v12);

  [v13 addSubview:v15];
}

__CFString *CACAdaptiveBackdropGroupName()
{
  return @"CACAdaptiveBackdropView";
}

__CFString *CACAdaptiveBackdropContrastedGroupName()
{
  return @"CACContrastedAdaptiveBackdropView";
}

double CACAdaptiveBackdropScale()
{
  return 0.25;
}

double CACCGRectIncreasedByPercentage(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  double v11 = CGRectGetHeight(v18) * a5 * -0.5;
  CGFloat v12 = a1;
  CGFloat v13 = a2;
  CGFloat v14 = a3;
  CGFloat v15 = a4;
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v12, Width * a5 * -0.5, v11);
  return result;
}

double CACCGPointDistance(double a1, double a2, double a3, double a4)
{
  return hypot(a3 - a1, a4 - a2);
}

BOOL CACIsInDarkMode()
{
  uint64_t v0 = [MEMORY[0x263F82DA0] currentTraitCollection];
  BOOL v1 = [v0 userInterfaceStyle] == 2;

  return v1;
}

void sub_238404EEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _languageChanged_0(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___languageChanged_block_invoke_0;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t ___languageChanged_block_invoke_0(uint64_t a1)
{
  return [*(id *)(a1 + 32) languageDidChange];
}

void sub_238406C44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _accessibilityNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "_didObserveNotification:notificationData:");
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

objc_class *one-time initialization function for resourceBundle()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  double result = (objc_class *)objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.isa = result;
  return result;
}

uint64_t one-time initialization function for badgePlatterBordered(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterBordered, 0xD000000000000016, 0x800000023841F450);
}

uint64_t ImageResource.badgePlatterBordered.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterBordered, (uint64_t)static ImageResource.badgePlatterBordered);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static ImageResource.badgePlatterBordered.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterBordered, (uint64_t)static ImageResource.badgePlatterBordered, a1);
}

uint64_t one-time initialization function for badgePlatterDoubleTailRight(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterDoubleTailRight, 0xD00000000000001FLL, 0x800000023841F430);
}

uint64_t ImageResource.badgePlatterDoubleTailRight.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterDoubleTailRight, (uint64_t)static ImageResource.badgePlatterDoubleTailRight);
}

uint64_t static ImageResource.badgePlatterDoubleTailRight.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterDoubleTailRight, (uint64_t)static ImageResource.badgePlatterDoubleTailRight, a1);
}

uint64_t one-time initialization function for badgePlatterSingleTailDown(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterSingleTailDown, 0xD00000000000001ELL, 0x800000023841F410);
}

uint64_t ImageResource.badgePlatterSingleTailDown.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterSingleTailDown, (uint64_t)static ImageResource.badgePlatterSingleTailDown);
}

uint64_t static ImageResource.badgePlatterSingleTailDown.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterSingleTailDown, (uint64_t)static ImageResource.badgePlatterSingleTailDown, a1);
}

uint64_t one-time initialization function for badgePlatterSingleTailRight(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterSingleTailRight, 0xD00000000000001FLL, 0x800000023841F3F0);
}

uint64_t ImageResource.badgePlatterSingleTailRight.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterSingleTailRight, (uint64_t)static ImageResource.badgePlatterSingleTailRight);
}

uint64_t static ImageResource.badgePlatterSingleTailRight.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterSingleTailRight, (uint64_t)static ImageResource.badgePlatterSingleTailRight, a1);
}

uint64_t one-time initialization function for badgePlatterTailNone(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterTailNone, 0xD000000000000017, 0x800000023841F3D0);
}

uint64_t ImageResource.badgePlatterTailNone.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterTailNone, (uint64_t)static ImageResource.badgePlatterTailNone);
}

uint64_t static ImageResource.badgePlatterTailNone.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterTailNone, (uint64_t)static ImageResource.badgePlatterTailNone, a1);
}

uint64_t one-time initialization function for dicationModeAlphabetical(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.dicationModeAlphabetical, 0xD00000000000001ALL, 0x800000023841F3B0);
}

uint64_t ImageResource.dicationModeAlphabetical.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for dicationModeAlphabetical, (uint64_t)static ImageResource.dicationModeAlphabetical);
}

uint64_t static ImageResource.dicationModeAlphabetical.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for dicationModeAlphabetical, (uint64_t)static ImageResource.dicationModeAlphabetical, a1);
}

uint64_t one-time initialization function for dicationModeCommandsonly(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.dicationModeCommandsonly, 0xD00000000000001ALL, 0x800000023841F390);
}

uint64_t ImageResource.dicationModeCommandsonly.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for dicationModeCommandsonly, (uint64_t)static ImageResource.dicationModeCommandsonly);
}

uint64_t static ImageResource.dicationModeCommandsonly.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for dicationModeCommandsonly, (uint64_t)static ImageResource.dicationModeCommandsonly, a1);
}

uint64_t one-time initialization function for dicationModeNumerical(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.dicationModeNumerical, 0xD000000000000017, 0x800000023841F370);
}

uint64_t ImageResource.dicationModeNumerical.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for dicationModeNumerical, (uint64_t)static ImageResource.dicationModeNumerical);
}

uint64_t static ImageResource.dicationModeNumerical.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for dicationModeNumerical, (uint64_t)static ImageResource.dicationModeNumerical, a1);
}

uint64_t one-time initialization function for luminance(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.luminance, 0x636E616E696D756CLL, 0xE900000000000065);
}

uint64_t ImageResource.luminance.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for luminance, (uint64_t)static ImageResource.luminance);
}

uint64_t static ImageResource.luminance.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for luminance, (uint64_t)static ImageResource.luminance, a1);
}

uint64_t one-time initialization function for menuMicOff(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.menuMicOff, 0x63696D2D756E656DLL, 0xEC00000066666F2DLL);
}

uint64_t ImageResource.menuMicOff.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for menuMicOff, (uint64_t)static ImageResource.menuMicOff);
}

uint64_t static ImageResource.menuMicOff.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for menuMicOff, (uint64_t)static ImageResource.menuMicOff, a1);
}

uint64_t one-time initialization function for menuMicOn(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.menuMicOn, 0x63696D2D756E656DLL, 0xEB000000006E6F2DLL);
}

uint64_t ImageResource.menuMicOn.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for menuMicOn, (uint64_t)static ImageResource.menuMicOn);
}

uint64_t static ImageResource.menuMicOn.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for menuMicOn, (uint64_t)static ImageResource.menuMicOn, a1);
}

uint64_t one-time initialization function for onboardingGestures(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.onboardingGestures, 0xD000000000000013, 0x800000023841F350);
}

uint64_t ImageResource.onboardingGestures.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for onboardingGestures, (uint64_t)static ImageResource.onboardingGestures);
}

uint64_t static ImageResource.onboardingGestures.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for onboardingGestures, (uint64_t)static ImageResource.onboardingGestures, a1);
}

uint64_t one-time initialization function for statusMicOff(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.statusMicOff, 0x6D2D737574617473, 0xEE0066666F2D6369);
}

uint64_t ImageResource.statusMicOff.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for statusMicOff, (uint64_t)static ImageResource.statusMicOff);
}

uint64_t static ImageResource.statusMicOff.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for statusMicOff, (uint64_t)static ImageResource.statusMicOff, a1);
}

uint64_t one-time initialization function for statusMicOn(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.statusMicOn, 0x6D2D737574617473, 0xED00006E6F2D6369);
}

uint64_t one-time initialization function for badgePlatterBordered(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1) {
    swift_once();
  }
  return MEMORY[0x23EC8DFF0](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.statusMicOn.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for statusMicOn, (uint64_t)static ImageResource.statusMicOn);
}

uint64_t ImageResource.badgePlatterBordered.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.statusMicOn.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for statusMicOn, (uint64_t)static ImageResource.statusMicOn, a1);
}

uint64_t static ImageResource.badgePlatterBordered.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void ___languageChanged_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "Recieved Language Change notification: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x270EEB1E8]();
}

uint64_t AXDeviceCanArmApplePay()
{
  return MEMORY[0x270F09F68]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x270F09F78]();
}

uint64_t AXDeviceHas3DTouch()
{
  return MEMORY[0x270F09F98]();
}

uint64_t AXDeviceHasLongPress3dTouch()
{
  return MEMORY[0x270F09FC0]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x270F091E8]();
}

uint64_t AXDeviceIsRealityDevice()
{
  return MEMORY[0x270F09200]();
}

uint64_t AXDeviceIsRingerSwitchAvailable()
{
  return MEMORY[0x270F09FF8]();
}

uint64_t AXDeviceIsSiriAvailable()
{
  return MEMORY[0x270F0A000]();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return MEMORY[0x270F0A030]();
}

uint64_t AXDeviceSupportsSideApp()
{
  return MEMORY[0x270F0A090]();
}

uint64_t AXForceTouchThresholdPeek()
{
  return MEMORY[0x270F0A0E0]();
}

uint64_t AXForceTouchThresholdPop()
{
  return MEMORY[0x270F0A0E8]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x270F09818](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x270F09820](*(void *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F09828](observer);
}

uint64_t AXUIKeyboardIsOOP()
{
  return MEMORY[0x270F09D88]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x270F098E8](*(void *)&theType, valuePtr);
}

AXValueType AXValueGetType(AXValueRef value)
{
  return MEMORY[0x270F098F0](value);
}

CFTypeID AXValueGetTypeID(void)
{
  return MEMORY[0x270F098F8]();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return MEMORY[0x270F09900](value, *(void *)&theType, valuePtr);
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x270F0A378]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3B0]();
}

uint64_t AX_CGRectToOrientation()
{
  return MEMORY[0x270F0A3B8]();
}

uint64_t AllValidCommandParameterIdentifiers()
{
  return MEMORY[0x270F76C58]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AudioServicesCreateSystemSoundIDWithOptions()
{
  return MEMORY[0x270EE2208]();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x270EFB770]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x270EE47A0]();
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4AC0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x270EE4CB0](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x270EE4CB8](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x270EE52A8](tokenizer, index);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x270EE5E30]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x270EE63E8]();
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x270EE6768](image, mask);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x270EE6888](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x270F82BA0](string);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CRVehicleIdentifierForCertificateSerial()
{
  return MEMORY[0x270F15208]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return MEMORY[0x270EE9DB8](line);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x270EF2B88]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t RXAdLibCreate()
{
  return MEMORY[0x270F76C60]();
}

uint64_t RXGetSupportedQuasarLocaleIdentifiers()
{
  return MEMORY[0x270F76C70]();
}

uint64_t RXGlobalSetDownloadProgressCallback()
{
  return MEMORY[0x270F76C78]();
}

uint64_t RXIsLocaleWithNoSpaceInPostITN()
{
  return MEMORY[0x270F76C80]();
}

uint64_t RXLanguageModelCreate()
{
  return MEMORY[0x270F76C88]();
}

uint64_t RXLanguageObjectAddObject()
{
  return MEMORY[0x270F76C90]();
}

uint64_t RXLanguageObjectAddPhraseAndAlternatives()
{
  return MEMORY[0x270F76C98]();
}

uint64_t RXLanguageObjectGetCount()
{
  return MEMORY[0x270F76CA0]();
}

uint64_t RXLanguageObjectGetObjectAtIndex()
{
  return MEMORY[0x270F76CA8]();
}

uint64_t RXLanguageObjectGetType()
{
  return MEMORY[0x270F76CB0]();
}

uint64_t RXLanguageObjectSetObjectAtIndex()
{
  return MEMORY[0x270F76CB8]();
}

uint64_t RXLocalesSupportingSpellingMode()
{
  return MEMORY[0x270F76CC0]();
}

uint64_t RXObjectCopyProperty()
{
  return MEMORY[0x270F76CC8]();
}

uint64_t RXObjectCopyPropertyWithLocale()
{
  return MEMORY[0x270F76CD0]();
}

uint64_t RXObjectSetProperty()
{
  return MEMORY[0x270F76CE0]();
}

uint64_t RXPathCreate()
{
  return MEMORY[0x270F76CE8]();
}

uint64_t RXRecognitionSystemCopyPhoneticNeighborsForText()
{
  return MEMORY[0x270F76D00]();
}

uint64_t RXRecognitionSystemCreate()
{
  return MEMORY[0x270F76D08]();
}

uint64_t RXRecognizerCreate()
{
  return MEMORY[0x270F76D28]();
}

uint64_t RXSignpostLog()
{
  return MEMORY[0x270F76D30]();
}

uint64_t RXVocabularyCreateWithLocale()
{
  return MEMORY[0x270F76D38]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F82BF8]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x270F82C60]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIKBGetNamedColor()
{
  return MEMORY[0x270F82DF0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x270F09930]();
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return MEMORY[0x270F90540]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x270F90580]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return MEMORY[0x270F905C0]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x270F90650]();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return MEMORY[0x270F906B0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSDisplayFilterColorEnabled()
{
  return MEMORY[0x270F90720]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x270F90880]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x270F909A0]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x270F90B30]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x270F90B80]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x270F90BB8]();
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  return MEMORY[0x270F90BE0]();
}

uint64_t _AXSWatchControlEnabled()
{
  return MEMORY[0x270F90BE8]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

uint64_t _AXTraitsAsString()
{
  return MEMORY[0x270F09958]();
}

uint64_t _AXTraitsAsStringInternal()
{
  return MEMORY[0x270F09960]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x270EE56A8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x270F80A90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x270EDBE30]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}