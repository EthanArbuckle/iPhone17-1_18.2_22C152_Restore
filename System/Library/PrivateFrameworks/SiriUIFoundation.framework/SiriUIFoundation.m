void SRUIFSetLanguageCode(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x263EF8340];
  v1 = a1;
  if (([v1 isEqualToString:__currentLanguageCode] & 1) == 0)
  {
    v2 = [v1 copy];
    v3 = (void *)__currentLanguageCode;
    __currentLanguageCode = v2;

    v4 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:__currentLanguageCode];
    v5 = (void *)__currentLocale;
    __currentLocale = v4;

    v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "SRUIFSetLanguageCode";
      v10 = 2112;
      v11 = __currentLanguageCode;
      _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s Updated language code: %@", (uint8_t *)&v8, 0x16u);
    }
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"com.apple.siri.ui.foundation.LanguageCodeDidChangeNotification" object:0];
    [v7 postNotificationName:@"com.apple.siri.assistantUI.LanguageCodeDidChangeNotification" object:0];
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_225FBDB10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_225FBDC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FBDDB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_225FBDF18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_225FBE514(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_225FBE770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FBEBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FBEEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FBFF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225FC1000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_225FC29FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FC2F14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SRUIFStringForUserAttentionType(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = v2;
  if (a1)
  {
    [v2 addObject:@"face"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"touch"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  [v3 addObject:@"raise gesture"];
  if ((a1 & 8) != 0) {
LABEL_5:
  }
    [v3 addObject:@"button press"];
LABEL_6:
  id v4 = [NSString alloc];
  v5 = &stru_26D9AE000;
  if (a1 == 7) {
    v5 = @" (all)";
  }
  v6 = (void *)[v4 initWithFormat:@"%@%@", v3, v5];

  return v6;
}

__CFString *SRUIFStringForUserAttentionGainEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"SRUIFUserAttentionGainEventUndefined";
  }
  else {
    return off_264785CB8[a1 - 1];
  }
}

__CFString *SRUIFStringForUserAttentionLossEvent(uint64_t a1)
{
  v1 = @"SRUIFUserAttentionLossEventUndefined";
  if (a1 == 1) {
    v1 = @"SRUIFUserAttentionLossEventFaceDetection";
  }
  if (a1 == 2) {
    return @"SRUIFUserAttentionLossEventLowerDeviceGesture";
  }
  else {
    return v1;
  }
}

void sub_225FC3B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

uint64_t SRUIFShouldInstrumentLaunchContextForAceCommand(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
      v3 = objc_msgSend(v1, "commands", 0, 0);
      uint64_t v2 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2)
      {
        uint64_t v4 = *(void *)v8;
        while (2)
        {
          for (uint64_t i = 0; i != v2; ++i)
          {
            if (*(void *)v8 != v4) {
              objc_enumerationMutation(v3);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v2 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v2 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
          if (v2) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

id SRUIFConstructLaunchContextForLaunchStarted()
{
  id v0 = objc_alloc_init(MEMORY[0x263F6EE58]);
  [v0 setExists:1];
  id v1 = objc_alloc_init(MEMORY[0x263F6EE48]);
  [v1 setStartedOrChanged:v0];

  return v1;
}

id SRUIFConstructLaunchContextForLaunchEnded()
{
  id v0 = objc_alloc_init(MEMORY[0x263F6EE50]);
  [v0 setExists:1];
  id v1 = objc_alloc_init(MEMORY[0x263F6EE48]);
  [v1 setEnded:v0];

  return v1;
}

void SRUIFPopulateSendCommandWithInstrumentationTurn(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = objc_msgSend(v3, "commands", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 setTurnId:v4];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

uint64_t SRUIFResponseModeToSISchemaResponseMode(void *a1)
{
  id v1 = [a1 lowercaseString];
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 isEqualToString:@"displayonly"])
    {
      uint64_t v3 = 4;
    }
    else if ([v2 isEqualToString:@"displayforward"])
    {
      uint64_t v3 = 5;
    }
    else if ([v2 isEqualToString:@"voiceonly"])
    {
      uint64_t v3 = 7;
    }
    else if ([v2 isEqualToString:@"voiceforward"])
    {
      uint64_t v3 = 6;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void SRUIFInstrumentVoiceLaunchSignpost(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id)*MEMORY[0x263F28378];
  id v3 = a1;
  os_signpost_id_t v4 = os_signpost_id_generate(v2);
  v5 = [v3 voiceTriggerEventInfo];

  uint64_t v6 = [v5 objectForKey:@"triggerEndMachTime"];

  uint64_t v7 = [v6 unsignedLongLongValue];
  *(void *)buf = 0;
  mach_get_times();
  uint64_t v8 = v2;
  uint64_t v9 = v8;
  if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    long long v11 = v9;
  }
  else
  {
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = v7;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v4, "voiceUILaunch", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    long long v10 = v9;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v10, OS_SIGNPOST_INTERVAL_END, v4, "voiceUILaunch", "", buf, 2u);
    }
  }
}

uint64_t SRUIFMachAbsoluteTimeToMachContinuousTime(uint64_t a1)
{
  return a1;
}

void SRUIFInstrumentButtonLaunchSignpost(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  *(void *)buf = 0;
  mach_get_times();
  os_signpost_id_t v4 = v2;
  v5 = v4;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    uint64_t v7 = v5;
  }
  else
  {
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = a1;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "buttonLaunch", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    uint64_t v6 = v5;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v6, OS_SIGNPOST_INTERVAL_END, v3, "buttonLaunch", "", buf, 2u);
    }
  }
}

void SRUIFInstrumentQuickTypeGestureLaunchSignpost(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  *(void *)buf = 0;
  mach_get_times();
  os_signpost_id_t v4 = v2;
  v5 = v4;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    uint64_t v7 = v5;
  }
  else
  {
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = a1;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "quickTypeLaunch", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    uint64_t v6 = v5;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v6, OS_SIGNPOST_INTERVAL_END, v3, "quickTypeLaunch", "", buf, 2u);
    }
  }
}

void SRUIFInstrumentQuickTypeTamaleLaunchSignpost(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  *(void *)buf = 0;
  mach_get_times();
  os_signpost_id_t v4 = v2;
  v5 = v4;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    uint64_t v7 = v5;
  }
  else
  {
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = a1;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "quickTypeTamaleLaunch", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    uint64_t v6 = v5;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v6, OS_SIGNPOST_INTERVAL_END, v3, "quickTypeTamaleLaunch", "", buf, 2u);
    }
  }
}

os_signpost_id_t SRUIFInstrumentQuickTypeFaceDetectionPollingStartSignpost()
{
  id v0 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v1 = os_signpost_id_generate(v0);
  uint64_t v2 = v0;
  os_signpost_id_t v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_225FBA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "quickTypeFaceDetectionPolling", "", v5, 2u);
  }

  return v1;
}

void SRUIFInstrumentQuickTypeFaceDetectionPollingEndSignpost(os_signpost_id_t a1)
{
  uint64_t v2 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v3 = v2;
  if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_225FBA000, v3, OS_SIGNPOST_INTERVAL_END, a1, "quickTypeFaceDetectionPolling", "", v4, 2u);
  }
}

os_signpost_id_t SRUIFInstrumentQuickTypeFaceDetectionGateStartSignpost()
{
  id v0 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v1 = os_signpost_id_generate(v0);
  uint64_t v2 = v0;
  os_signpost_id_t v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_225FBA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "quickTypeFaceDetectionGate", "", v5, 2u);
  }

  return v1;
}

void SRUIFInstrumentQuickTypeFaceDetectionGateEndSignpost(os_signpost_id_t a1)
{
  uint64_t v2 = (id)*MEMORY[0x263F28378];
  os_signpost_id_t v3 = v2;
  if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_225FBA000, v3, OS_SIGNPOST_INTERVAL_END, a1, "quickTypeFaceDetectionGate", "", v4, 2u);
  }
}

void sub_225FC5158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_225FC6E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FC6FAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_225FC7D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_225FCB198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FCBB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 256));
  _Unwind_Resume(a1);
}

void sub_225FCC4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_225FCD3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *location)
{
}

void sub_225FCD5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225FCDBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_225FCEAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_225FD175C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225FD1994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225FD2194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225FD230C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ASBDForSAUIAD(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 sampleRate];
  [v4 doubleValue];
  *(void *)a2 = v5;

  uint64_t v6 = [v3 formatID];
  *(_DWORD *)(a2 + 8) = [v6 unsignedIntValue];

  uint64_t v7 = [v3 formatFlags];
  *(_DWORD *)(a2 + 12) = [v7 unsignedIntValue];

  uint64_t v8 = [v3 bytesPerPacket];
  *(_DWORD *)(a2 + 16) = [v8 unsignedIntValue];

  uint64_t v9 = [v3 framesPerPacket];
  *(_DWORD *)(a2 + 20) = [v9 unsignedIntValue];

  uint64_t v10 = [v3 bytesPerFrame];
  *(_DWORD *)(a2 + 24) = [v10 unsignedIntValue];

  long long v11 = [v3 channelsPerFrame];
  *(_DWORD *)(a2 + 28) = [v11 unsignedIntValue];

  long long v12 = [v3 bitsPerChannel];
  *(_DWORD *)(a2 + 32) = [v12 unsignedIntValue];

  id v13 = [v3 reserved];

  *(_DWORD *)(a2 + 36) = [v13 unsignedIntValue];
}

void sub_225FD52BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id SRUIFFileURLForConversationWithIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CPSharedResourcesDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"Library"];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"Assistant"];

  uint64_t v5 = [NSURL fileURLWithPath:v4 isDirectory:1];

  uint64_t v6 = [v5 URLByAppendingPathComponent:v1 isDirectory:0];

  return v6;
}

void sub_225FD6A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FD6C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225FD6F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SRUIFGetLanguageCode()
{
  return (id)__currentLanguageCode;
}

id SRUIFGetLocale()
{
  return (id)__currentLocale;
}

void SRUIFInvokeOnMainQueue(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x263F08B88] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    id v1 = block;
  }
}

uint64_t SRUIFShouldUseSAE()
{
  return MEMORY[0x270F0ECF0]();
}

uint64_t SRUIFMaxIntervalForDisplayingPreviousConversation()
{
  if (SRUIFMaxIntervalForDisplayingPreviousConversation_onceToken != -1) {
    dispatch_once(&SRUIFMaxIntervalForDisplayingPreviousConversation_onceToken, &__block_literal_global_3);
  }
  return SRUIFMaxIntervalForDisplayingPreviousConversation_maxInterval;
}

void __SRUIFMaxIntervalForDisplayingPreviousConversation_block_invoke()
{
  uint64_t v2 = [[SRUIFPreferences alloc] initWithSuiteName:@"com.apple.SiriViewService"];
  uint64_t v0 = [(SRUIFPreferences *)v2 integerForKey:@"MaxIntervalForDisplayingPreviousConversation"];
  uint64_t v1 = 30;
  if (v0 > 0) {
    uint64_t v1 = v0;
  }
  if (v0 == -1) {
    uint64_t v1 = -1;
  }
  SRUIFMaxIntervalForDisplayingPreviousConversation_maxInterval = v1;
}

void sub_225FDA150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_225FDAA9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_225FDBB20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_225FDCA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

__CFString *SRUIFSiriSessionStateGetDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"SRUIFSiriSessionStateIdle";
  }
  else {
    return off_264786820[a1 - 1];
  }
}

__CFString *SRUIFSiriSessionEventGetDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF) {
    return @"SRUIFSiriSessionEventDirectRequestBegan";
  }
  else {
    return off_264786840[a1 - 1];
  }
}

void sub_225FDE968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_225FE00CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FirstCharacterOfStringIsInCharacterSetInString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  uint64_t v6 = [v3 rangeOfCharacterFromSet:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v7 = v6,
        [MEMORY[0x263F08708] characterSetWithCharactersInString:v4],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = 1,
        uint64_t v10 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v8, 1, v7, 1),
        v8,
        v10 != v7))
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_225FE1808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SRUIFSpeechSynthesisResultGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"SRUIFSpeechSynthesisResultUnknown";
  }
  else {
    return off_264786A58[a1 - 1];
  }
}

void sub_225FE3534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_225FE37B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 72));
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
}

void sub_225FE3E78(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE3FE8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE4A0C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE4C4C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE4DF4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE4F9C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE5370(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE5968(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225FE5B74(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_225FE6524(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_225FE79FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__91(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x22A643DA0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__92(uint64_t a1)
{
}

BOOL sub_225FE9A98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_225FE9AAC()
{
  return sub_225FEC638();
}

uint64_t sub_225FE9AF4()
{
  return sub_225FEC628();
}

uint64_t sub_225FE9B20()
{
  return sub_225FEC638();
}

uint64_t *sub_225FE9B64@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_225FE9B7C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_225FE9B88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_225FE9B9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_225FE9BB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_225FE9BC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

id sub_225FE9BD8()
{
  float v1 = *(float *)(v0 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencyProgress);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummary + 8);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentTaskIdentifier + 8);
  if (!v2)
  {
    swift_bridgeObjectRetain();
    id v4 = 0;
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = (void *)sub_225FEC5D8();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = (void *)sub_225FEC5D8();
  swift_bridgeObjectRelease();
LABEL_6:
  id v6 = objc_msgSend(objc_allocWithZone((Class)SRUIFLatencyInformation), sel_initWithLatencySummary_taskIdentifier_shouldShow_, v4, v5, v1 >= 0.6);

  return v6;
}

uint64_t sub_225FE9D20(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentTaskIdentifier);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentTaskIdentifier + 8);
  if (!v6 || (*v5 == a1 ? (BOOL v7 = v6 == a2) : (BOOL v7 = 0), !v7 && (sub_225FEC608() & 1) == 0))
  {
    uint64_t v8 = (void *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummary);
    *uint64_t v8 = 0;
    v8[1] = 0;
    swift_bridgeObjectRelease();
    *(unsigned char *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummaryType) = 0;
    *(_DWORD *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencyProgress) = 0;
  }
  void *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_225FE9DF0(uint64_t result, uint64_t a2)
{
  uint64_t v3 = OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummaryType;
  if (*(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummaryType) <= 1u)
  {
    id v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummary);
    *id v4 = result;
    v4[1] = a2;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    *(unsigned char *)(v2 + v3) = 1;
  }
  return result;
}

uint64_t sub_225FE9E6C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_225FEC5E8();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

id sub_225FE9ED8(void *a1)
{
  id result = objc_msgSend(a1, sel_progress);
  if (v4 > 0.0)
  {
    objc_msgSend(a1, sel_progress);
    *(_DWORD *)(v1 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencyProgress) = v5;
    id result = objc_msgSend(a1, sel_progressDescription);
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = sub_225FEC5E8();
      uint64_t v9 = v8;

      uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummary);
      *uint64_t v10 = v7;
      v10[1] = v9;
      id result = (id)swift_bridgeObjectRelease();
      *(unsigned char *)(v1 + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummaryType) = 2;
    }
  }
  return result;
}

id SRUIFLatencyStateManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SRUIFLatencyStateManager.init()()
{
  id v1 = &v0[OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentTaskIdentifier];
  void *v1 = 0;
  v1[1] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummary];
  *uint64_t v2 = 0;
  v2[1] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencyProgress] = 0;
  v0[OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummaryType] = 0;
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for SRUIFLatencyStateManager();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for SRUIFLatencyStateManager()
{
  return self;
}

id SRUIFLatencyStateManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRUIFLatencyStateManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SRUIFLatencyStateManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SRUIFLatencyStateManager);
}

uint64_t dispatch thunk of SRUIFLatencyStateManager.getLatestLatencyInformation()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SRUIFLatencyStateManager.processTaskReceived(withIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SRUIFLatencyStateManager.processParameterSummary(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SRUIFLatencyStateManager.processLatencyProgressUpdate(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LatencySummaryType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LatencySummaryType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *id result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x225FEA404);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_225FEA42C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_225FEA438(unsigned char *result, char a2)
{
  *id result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LatencySummaryType()
{
  return &type metadata for LatencySummaryType;
}

unint64_t sub_225FEA454()
{
  unint64_t result = qword_26811E330;
  if (!qword_26811E330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811E330);
  }
  return result;
}

uint64_t static VRXFeedbackConverter.SFCommandEngagementFeedbackToVRX(feedback:)()
{
  return _sSo27SFCommandEngagementFeedbackC16SiriUIFoundationE10asVRXEventSo23VRXInstrumentationEventCyF_0();
}

id VRXFeedbackConverter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id VRXFeedbackConverter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VRXFeedbackConverter();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for VRXFeedbackConverter()
{
  return self;
}

id VRXFeedbackConverter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VRXFeedbackConverter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_225FEC5D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_225FEC5E8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t _sSo27SFCommandEngagementFeedbackC16SiriUIFoundationE10asVRXEventSo23VRXInstrumentationEventCyF_0()
{
  return MEMORY[0x270F762A0]();
}

uint64_t sub_225FEC608()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_225FEC618()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_225FEC628()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_225FEC638()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x270F0EC10]();
}

uint64_t AFAnalyticsEventTypeGetName()
{
  return MEMORY[0x270F0EC20]();
}

uint64_t AFDeviceSupportsTTS()
{
  return MEMORY[0x270F0ECF8]();
}

uint64_t AFIsFileNotFoundError()
{
  return MEMORY[0x270F0EDB8]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x270F0EDE0]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x270F0EE20]();
}

uint64_t AFMediaPlaybackStateGetName()
{
  return MEMORY[0x270F0EE30]();
}

uint64_t AFPreferencesStreamingDictationEnabled()
{
  return MEMORY[0x270F0EEB0]();
}

uint64_t AFSoundIDGetFromName()
{
  return MEMORY[0x270F0EF78]();
}

uint64_t AFSoundIDGetIsValidAndSpecified()
{
  return MEMORY[0x270F0EF80]();
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x270F9C6A0](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}