id SVXClientServiceCreateXPCInterface()
{
  void *v0;
  uint64_t vars8;

  if (SVXClientServiceCreateXPCInterface_onceToken != -1) {
    dispatch_once(&SVXClientServiceCreateXPCInterface_onceToken, &__block_literal_global);
  }
  v0 = (void *)SVXClientServiceCreateXPCInterface_sharedInterface;

  return v0;
}

uint64_t __SVXClientServiceCreateXPCInterface_block_invoke()
{
  SVXClientServiceCreateXPCInterface_sharedInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1FF910];

  return MEMORY[0x270F9A758]();
}

id SVXClientServiceDelegateCreateXPCInterface()
{
  if (SVXClientServiceDelegateCreateXPCInterface_onceToken != -1) {
    dispatch_once(&SVXClientServiceDelegateCreateXPCInterface_onceToken, &__block_literal_global_80);
  }
  v0 = (void *)SVXClientServiceDelegateCreateXPCInterface_sharedInterface;

  return v0;
}

uint64_t __SVXClientServiceDelegateCreateXPCInterface_block_invoke()
{
  SVXClientServiceDelegateCreateXPCInterface_sharedInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1FFDC8];

  return MEMORY[0x270F9A758]();
}

void sub_220068194(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id SVXLocalizationGetAllTables()
{
  if (SVXLocalizationGetAllTables_onceToken != -1) {
    dispatch_once(&SVXLocalizationGetAllTables_onceToken, &__block_literal_global_1092);
  }
  v0 = (void *)SVXLocalizationGetAllTables_tables;

  return v0;
}

void __SVXLocalizationGetAllTables_block_invoke()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = @"Localizable";
  v2[1] = @"Clock";
  v2[2] = @"DeviceSetup";
  v2[3] = @"Errors";
  v2[4] = @"Interstitials";
  v2[5] = @"StoreDemo";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  v1 = (void *)SVXLocalizationGetAllTables_tables;
  SVXLocalizationGetAllTables_tables = v0;
}

id SVXLocalizationGetKeysInTable(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v13 = +[SVXBundleUtils sharedInstance];
  v2 = [v13 getSiriVOXFramework];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CFArrayRef v3 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)[v2 localizations], (CFArrayRef)&unk_26D1FC5D0);
  uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [v2 URLForResource:v1 withExtension:@"strings" subdirectory:0 localization:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (v8) {
          v9 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v8];
        }
        else {
          v9 = 0;
        }
        if ([v9 count])
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __SVXLocalizationGetKeysInTable_block_invoke;
          v15[3] = &unk_264551FB8;
          id v16 = v14;
          [v9 enumerateKeysAndObjectsUsingBlock:v15];
        }
      }
      uint64_t v5 = [(__CFArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  v10 = [v14 allObjects];
  v11 = [v10 sortedArrayUsingSelector:sel_compare_];

  return v11;
}

void __SVXLocalizationGetKeysInTable_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 hasSuffix:@"_FEMALE"])
  {
    CFArrayRef v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v8 length];
    uint64_t v5 = @"_FEMALE";
LABEL_5:
    v7 = objc_msgSend(v8, "substringToIndex:", v4 - -[__CFString length](v5, "length"));
    [v3 addObject:v7];

    goto LABEL_7;
  }
  int v6 = [v8 hasSuffix:@"_MALE"];
  CFArrayRef v3 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v4 = [v8 length];
    uint64_t v5 = @"_MALE";
    goto LABEL_5;
  }
  [v3 addObject:v8];
LABEL_7:
}

id SVXLocalizationGetLocalizedString(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  v7 = +[SVXBundleUtils sharedInstance];
  id v8 = [v7 getLocalizedStringWithBundle:0 table:0 key:v5 languageCode:v6 gender:a2];

  return v8;
}

BOOL SVXBooleanGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SVXBooleanGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SVXBooleanGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_264551FD8[a1];
  }
}

uint64_t SVXBooleanGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXBooleanGetFromName_onceToken != -1) {
      dispatch_once(&SVXBooleanGetFromName_onceToken, &__block_literal_global_1116);
    }
    v2 = [(id)SVXBooleanGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXBooleanGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXBooleanGetFromName_map;
  SVXBooleanGetFromName_map = (uint64_t)&unk_26D1FD458;
}

void sub_220070F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SVXDeactivationSourceGetIsValid(unint64_t a1)
{
  return a1 < 6;
}

BOOL SVXDeactivationSourceGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 5;
}

__CFString *SVXDeactivationSourceGetName(unint64_t a1)
{
  if (a1 > 5) {
    return @"(unknown)";
  }
  else {
    return off_264552090[a1];
  }
}

uint64_t SVXDeactivationSourceGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXDeactivationSourceGetFromName_onceToken != -1) {
      dispatch_once(&SVXDeactivationSourceGetFromName_onceToken, &__block_literal_global_1858);
    }
    v2 = [(id)SVXDeactivationSourceGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXDeactivationSourceGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXDeactivationSourceGetFromName_map;
  SVXDeactivationSourceGetFromName_map = (uint64_t)&unk_26D1FD480;
}

BOOL SVXStoreDemoTranscriptIDGetIsValid(unint64_t a1)
{
  return a1 < 0x16;
}

BOOL SVXStoreDemoTranscriptIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0x15;
}

__CFString *SVXStoreDemoTranscriptIDGetName(unint64_t a1)
{
  if (a1 > 0x15) {
    return @"(unknown)";
  }
  else {
    return off_2645520E8[a1];
  }
}

uint64_t SVXStoreDemoTranscriptIDGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXStoreDemoTranscriptIDGetFromName_onceToken != -1) {
      dispatch_once(&SVXStoreDemoTranscriptIDGetFromName_onceToken, &__block_literal_global_1958);
    }
    v2 = [(id)SVXStoreDemoTranscriptIDGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXStoreDemoTranscriptIDGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXStoreDemoTranscriptIDGetFromName_map;
  SVXStoreDemoTranscriptIDGetFromName_map = (uint64_t)&unk_26D1FD4A8;
}

CFDictionaryRef _SVXAnnouncerCreateInstanceMethodSignatureMap(Protocol *a1, BOOL a2)
{
  unsigned int outCount = 0;
  v2 = protocol_copyMethodDescriptionList(a1, a2, 1, &outCount);
  Mutable = CFDictionaryCreateMutable(0, outCount, 0, MEMORY[0x263EFFF90]);
  if (v2 && outCount)
  {
    unint64_t v4 = 0;
    p_types = &v2->types;
    do
    {
      id v6 = *(p_types - 1);
      v7 = [MEMORY[0x263EFF970] signatureWithObjCTypes:*p_types];
      CFDictionarySetValue(Mutable, v6, v7);

      ++v4;
      p_types += 2;
    }
    while (v4 < outCount);
  }
  free(v2);
  CFDictionaryRef Copy = CFDictionaryCreateCopy(0, Mutable);
  CFRelease(Mutable);
  return Copy;
}

void sub_220077B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id a62)
{
  objc_destroyWeak(v62);
  objc_destroyWeak(v64);
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(v63);
  objc_destroyWeak(&a62);
  _Block_object_dispose((const void *)(v65 - 176), 8);
  objc_destroyWeak((id *)(v65 - 232));
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

void sub_220078B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location,id a32)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(v32);
  objc_destroyWeak(v33);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_220079D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22007A3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SVXSpeechSynthesisOptionsValidate(char a1)
{
  return a1 & 3;
}

id SVXSpeechSynthesisOptionsGetNames(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v3 = v2;
    if (v1) {
      [v2 addObject:@"allowsSynthesizingOnServer"];
    }
    if ((v1 & 2) != 0) {
      [v3 addObject:@"disableDeviceRacing"];
    }
    unint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    unint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

uint64_t SVXSpeechSynthesisOptionsGetFromNames(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v12 = v1;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(id *)(*((void *)&v13 + 1) + 8 * v7);
          if ([v8 length])
          {
            if (_SVXSpeechSynthesisOptionsGetFromName_onceToken != -1) {
              dispatch_once(&_SVXSpeechSynthesisOptionsGetFromName_onceToken, &__block_literal_global_2507);
            }
            v9 = [(id)_SVXSpeechSynthesisOptionsGetFromName_map objectForKey:v8];
            uint64_t v10 = [v9 unsignedIntegerValue];
          }
          else
          {
            uint64_t v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }

    id v1 = v12;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL SVXSpeechSynthesisGenderGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SVXSpeechSynthesisGenderGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *SVXSpeechSynthesisGenderGetName(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_264552568[a1];
  }
}

uint64_t SVXSpeechSynthesisGenderGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXSpeechSynthesisGenderGetFromName_onceToken != -1) {
      dispatch_once(&SVXSpeechSynthesisGenderGetFromName_onceToken, &__block_literal_global_2862);
    }
    id v2 = [(id)SVXSpeechSynthesisGenderGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXSpeechSynthesisGenderGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXSpeechSynthesisGenderGetFromName_map;
  SVXSpeechSynthesisGenderGetFromName_map = (uint64_t)&unk_26D1FD4F8;
}

void sub_220083BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SVXTaskOriginGetIsValid(unint64_t a1)
{
  return a1 < 0xD;
}

BOOL SVXTaskOriginGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xC;
}

__CFString *SVXTaskOriginGetName(unint64_t a1)
{
  if (a1 > 0xC) {
    return @"(unknown)";
  }
  else {
    return off_264552770[a1];
  }
}

uint64_t SVXTaskOriginGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXTaskOriginGetFromName_onceToken != -1) {
      dispatch_once(&SVXTaskOriginGetFromName_onceToken, &__block_literal_global_3978);
    }
    id v2 = [(id)SVXTaskOriginGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXTaskOriginGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXTaskOriginGetFromName_map;
  SVXTaskOriginGetFromName_map = (uint64_t)&unk_26D1FD520;
}

BOOL SVXDeviceSetupFlowDisplayKeyFrameIDGetIsValid(unint64_t a1)
{
  return a1 < 0xC;
}

BOOL SVXDeviceSetupFlowDisplayKeyFrameIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xB;
}

__CFString *SVXDeviceSetupFlowDisplayKeyFrameIDGetName(unint64_t a1)
{
  if (a1 > 0xB) {
    return @"(unknown)";
  }
  else {
    return off_264552800[a1];
  }
}

uint64_t SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_onceToken != -1) {
      dispatch_once(&SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_onceToken, &__block_literal_global_4445);
    }
    id v2 = [(id)SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_map;
  SVXDeviceSetupFlowDisplayKeyFrameIDGetFromName_map = (uint64_t)&unk_26D1FD548;
}

uint64_t _getSchemaInvocationSourceForVoiceTrigger(void *a1)
{
  uint64_t v1 = 17;
  if (a1)
  {
    id v2 = [a1 objectForKey:@"triggeredPhraseId"];
    uint64_t v3 = [v2 unsignedLongValue];

    if (v3 == 1) {
      return 80;
    }
    else {
      return 17;
    }
  }
  return v1;
}

uint64_t SVXInstrumentationEmitUIStateTransition(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = (NSObject **)MEMORY[0x263F28348];
  if (a2 == 1 && a3 == 2) {
    goto LABEL_15;
  }
  switch(a2)
  {
    case 4:
      if (a3 == 2) {
        goto LABEL_15;
      }
      goto LABEL_11;
    case 3:
      if (a3 == 4)
      {
        a3 = 5;
        goto LABEL_15;
      }
LABEL_11:
      if (a3 == 1) {
        goto LABEL_15;
      }
      break;
    case 2:
      if (a3 == 3) {
        goto LABEL_15;
      }
      goto LABEL_11;
  }
  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    uint64_t v18 = "SVXInstrumentationEmitUIStateTransition";
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s Emitting unknown UIStateTransition; this implies there are unaccounted session state transitions, add them here",
      (uint8_t *)&v17,
      0xCu);
  }
  a3 = 0;
LABEL_15:
  id v10 = objc_alloc_init(MEMORY[0x263F6EE90]);
  [v10 setPresentationType:6];
  id v11 = objc_alloc_init(MEMORY[0x263F6EE98]);
  [v11 setPresenting:v10];
  [v11 setPreviousState:a4];
  [v11 setCurrentState:a3];
  id v12 = *v8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if ((a4 - 1) > 4) {
      long long v13 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
    }
    else {
      long long v13 = off_264552B00[(a4 - 1)];
    }
    if ((a3 - 1) > 4) {
      long long v14 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
    }
    else {
      long long v14 = off_264552B00[(a3 - 1)];
    }
    int v17 = 136315650;
    uint64_t v18 = "SVXInstrumentationEmitUIStateTransition";
    __int16 v19 = 2112;
    long long v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    long long v15 = v12;
    _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit state transition event (current: %@, next: %@)", (uint8_t *)&v17, 0x20u);
  }
  [v7 emitInstrumentation:v11];

  return a3;
}

void SVXInstrumentationEmitViewAppearContextEnd(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263F6EE10];
  id v2 = a1;
  id v4 = objc_alloc_init(v1);
  id v3 = objc_alloc_init(MEMORY[0x263F6EE18]);
  [v3 setExists:1];
  [v4 setEnded:v3];
  [v2 emitInstrumentation:v4];
}

uint64_t SVXAudioSessionIsNoRoutesAvailableError(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    uint64_t IsNoRoutesAvailableError = 0;
    goto LABEL_8;
  }
  id v3 = [v1 domain];
  if (![v3 isEqualToString:*MEMORY[0x263F08410]])
  {

    goto LABEL_7;
  }
  uint64_t v4 = [v2 code];

  if (v4 != -11784)
  {
LABEL_7:
    uint64_t v6 = [v2 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x263F08608]];

    uint64_t IsNoRoutesAvailableError = SVXAudioSessionIsNoRoutesAvailableError(v7);
    goto LABEL_8;
  }
  uint64_t IsNoRoutesAvailableError = 1;
LABEL_8:

  return IsNoRoutesAvailableError;
}

void __SVXDispatchRootQueueGetHighPriority_block_invoke()
{
  inactive = dispatch_workloop_create_inactive("com.apple.SiriVOXService.root.high-priority");
  dispatch_workloop_set_scheduler_priority();
  dispatch_activate(inactive);
  id v1 = (void *)SVXDispatchRootQueueGetHighPriority_queue;
  SVXDispatchRootQueueGetHighPriority_queue = (uint64_t)inactive;
}

BOOL SVXAudioPowerTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SVXAudioPowerTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SVXAudioPowerTypeGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_264552C98[a1];
  }
}

uint64_t SVXAudioPowerTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXAudioPowerTypeGetFromName_onceToken != -1) {
      dispatch_once(&SVXAudioPowerTypeGetFromName_onceToken, &__block_literal_global_5114);
    }
    id v2 = [(id)SVXAudioPowerTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXAudioPowerTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXAudioPowerTypeGetFromName_map;
  SVXAudioPowerTypeGetFromName_map = (uint64_t)&unk_26D1FD570;
}

BOOL SVXSpeechSynthesisPriorityGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SVXSpeechSynthesisPriorityGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *SVXSpeechSynthesisPriorityGetName(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_264552D00[a1];
  }
}

uint64_t SVXSpeechSynthesisPriorityGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXSpeechSynthesisPriorityGetFromName_onceToken != -1) {
      dispatch_once(&SVXSpeechSynthesisPriorityGetFromName_onceToken, &__block_literal_global_5398);
    }
    id v2 = [(id)SVXSpeechSynthesisPriorityGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXSpeechSynthesisPriorityGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXSpeechSynthesisPriorityGetFromName_map;
  SVXSpeechSynthesisPriorityGetFromName_map = (uint64_t)&unk_26D1FD598;
}

id SVXSessionResignActiveOptionsGetNames(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v3 = v2;
    if (v1) {
      [v2 addObject:@"playsSound"];
    }
    uint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

void sub_2200912E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRadarDraftClass_block_invoke(uint64_t a1)
{
  TapToRadarKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RadarDraft");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRadarDraftClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getRadarDraftClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SVXRadarDraftFactory.m", 16, @"Unable to find class %s", "RadarDraft");

    __break(1u);
  }
}

void __getRadarComponentClass_block_invoke(uint64_t a1)
{
  TapToRadarKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RadarComponent");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRadarComponentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getRadarComponentClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SVXRadarDraftFactory.m", 17, @"Unable to find class %s", "RadarComponent");

    __break(1u);
  }
}

void TapToRadarKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!TapToRadarKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __TapToRadarKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264552DB8;
    uint64_t v5 = 0;
    TapToRadarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TapToRadarKitLibraryCore_frameworkLibrary)
  {
    char v1 = [MEMORY[0x263F08690] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *TapToRadarKitLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"SVXRadarDraftFactory.m", 15, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __TapToRadarKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TapToRadarKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_220093CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__6222(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6223(uint64_t a1)
{
}

void sub_220094174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t _SVXClientActivationServiceValidateSystemEventForActivation(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v1 = a1;
  id v2 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v25 = 136315394;
    v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
    __int16 v27 = 2112;
    v28 = v1;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s Validating system event %@ for activation...", (uint8_t *)&v25, 0x16u);
  }
  if (v1)
  {
    uint64_t v4 = 1;
    switch([(__CFString *)v1 type])
    {
      case 1:
      case 2:
      case 3:
      case 12:
        goto LABEL_21;
      case 7:
        uint64_t v5 = [(__CFString *)v1 deviceSetupFlowScene];

        if (v5) {
          goto LABEL_20;
        }
        os_log_t v6 = *v2;
        if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
          break;
        }
        id v7 = v6;
        unint64_t v8 = [(__CFString *)v1 type];
        if (v8 > 0xD) {
          v9 = @"(unknown)";
        }
        else {
          v9 = off_264553920[v8];
        }
        uint64_t v23 = v9;
        int v25 = 136315394;
        v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
        __int16 v27 = 2112;
        v28 = v23;
        v24 = "%s Rejected system event for activation because the type is %@, but the deviceSetupFlowScene is nil.";
        goto LABEL_33;
      case 8:
        long long v14 = [(__CFString *)v1 storeDemo];

        if (v14) {
          goto LABEL_20;
        }
        os_log_t v15 = *v2;
        if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
          break;
        }
        id v7 = v15;
        unint64_t v16 = [(__CFString *)v1 type];
        if (v16 > 0xD) {
          int v17 = @"(unknown)";
        }
        else {
          int v17 = off_264553920[v16];
        }
        uint64_t v23 = v17;
        int v25 = 136315394;
        v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
        __int16 v27 = 2112;
        v28 = v23;
        v24 = "%s Rejected system event for activation because the type is %@, but the storeDemo is nil.";
        goto LABEL_33;
      case 13:
        uint64_t v18 = [(__CFString *)v1 speechSynthesisRequest];

        if (v18)
        {
LABEL_20:
          uint64_t v4 = 1;
          goto LABEL_21;
        }
        os_log_t v20 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        {
          id v7 = v20;
          unint64_t v21 = [(__CFString *)v1 type];
          if (v21 > 0xD) {
            uint64_t v22 = @"(unknown)";
          }
          else {
            uint64_t v22 = off_264553920[v21];
          }
          uint64_t v23 = v22;
          int v25 = 136315394;
          v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
          __int16 v27 = 2112;
          v28 = v23;
          v24 = "%s Rejected system event for activation because the type is %@, but speechSynthesisRequest is nil.";
LABEL_33:
          _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v25, 0x16u);
        }
        break;
      default:
        os_log_t v11 = *v2;
        if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
          break;
        }
        id v7 = v11;
        unint64_t v12 = [(__CFString *)v1 type];
        if (v12 > 0xD) {
          long long v13 = @"(unknown)";
        }
        else {
          long long v13 = off_264553920[v12];
        }
        uint64_t v23 = v13;
        int v25 = 136315394;
        v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
        __int16 v27 = 2112;
        v28 = v23;
        v24 = "%s Rejected system event for activation because the type is %@.";
        goto LABEL_33;
    }
  }
  else
  {
    id v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315138;
      v26 = "_SVXClientActivationServiceValidateSystemEventForActivation";
      _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s Rejected system event for activation because it is nil.", (uint8_t *)&v25, 0xCu);
    }
  }
  uint64_t v4 = 0;
LABEL_21:

  return v4;
}

uint64_t SVXAlarmAndTimerFiringContextGetIsSpeakable(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(SVXAlarmAndTimerUtilities);
  uint64_t v3 = [(SVXAlarmAndTimerUtilities *)v2 getIsSpeakable:v1];

  return v3;
}

id SVXAlarmAndTimerFiringContextCreateSpeechSynthesisRequest(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_alloc_init(SVXAlarmAndTimerUtilities);
  os_log_t v6 = [(SVXAlarmAndTimerUtilities *)v5 createSpeechSynthesisRequestWithContext:v4 instanceContext:v3];

  return v6;
}

id SVXClientInfoGetCurrent()
{
  if (SVXClientInfoGetCurrent_onceToken != -1) {
    dispatch_once(&SVXClientInfoGetCurrent_onceToken, &__block_literal_global_6404);
  }
  uint64_t v0 = (void *)SVXClientInfoGetCurrent_clientInfo;

  return v0;
}

void __SVXClientInfoGetCurrent_block_invoke()
{
  id v5 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v0 = [SVXClientInfo alloc];
  uint64_t v1 = [v5 processIdentifier];
  id v2 = [v5 processName];
  uint64_t v3 = [(SVXClientInfo *)v0 initWithProcessIdentifier:v1 processName:v2];
  id v4 = (void *)SVXClientInfoGetCurrent_clientInfo;
  SVXClientInfoGetCurrent_clientInfo = v3;
}

uint64_t SVXClientInfoIsCurrent(void *a1)
{
  id v1 = a1;
  id v2 = SVXClientInfoGetCurrent();
  uint64_t v3 = [v2 isEqual:v1];

  return v3;
}

BOOL SVXPlatformDependencyTypeGetIsValid(unint64_t a1)
{
  return a1 < 0xD;
}

BOOL SVXPlatformDependencyTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xC;
}

__CFString *SVXPlatformDependencyTypeGetName(unint64_t a1)
{
  if (a1 > 0xC) {
    return @"(unknown)";
  }
  else {
    return off_264552ED8[a1];
  }
}

uint64_t SVXPlatformDependencyTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXPlatformDependencyTypeGetFromName_onceToken != -1) {
      dispatch_once(&SVXPlatformDependencyTypeGetFromName_onceToken, &__block_literal_global_6636);
    }
    id v2 = [(id)SVXPlatformDependencyTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXPlatformDependencyTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXPlatformDependencyTypeGetFromName_map;
  SVXPlatformDependencyTypeGetFromName_map = (uint64_t)&unk_26D1FD5C0;
}

id getTapToRadarServiceClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getTapToRadarServiceClass_softClass;
  uint64_t v7 = getTapToRadarServiceClass_softClass;
  if (!getTapToRadarServiceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getTapToRadarServiceClass_block_invoke;
    v3[3] = &unk_264553078;
    v3[4] = &v4;
    __getTapToRadarServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22009CE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTapToRadarServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!TapToRadarKitLibraryCore_frameworkLibrary_7990)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __TapToRadarKitLibraryCore_block_invoke_7991;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264553098;
    uint64_t v8 = 0;
    TapToRadarKitLibraryCore_frameworkLibrary_7990 = _sl_dlopen();
  }
  if (!TapToRadarKitLibraryCore_frameworkLibrary_7990)
  {
    uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *TapToRadarKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"SVXRadarFiler.m", 13, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("TapToRadarService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getTapToRadarServiceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"SVXRadarFiler.m", 14, @"Unable to find class %s", "TapToRadarService");

LABEL_10:
    __break(1u);
  }
  getTapToRadarServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TapToRadarKitLibraryCore_block_invoke_7991()
{
  uint64_t result = _sl_dlopen();
  TapToRadarKitLibraryCore_frameworkLibrary_7990 = result;
  return result;
}

BOOL SVXSoundIDGetIsValid(unint64_t a1)
{
  return a1 < 7;
}

BOOL SVXSoundIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 6;
}

__CFString *SVXSoundIDGetName(unint64_t a1)
{
  if (a1 > 6) {
    return @"(unknown)";
  }
  else {
    return off_2645530B0[a1];
  }
}

uint64_t SVXSoundIDGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXSoundIDGetFromName_onceToken != -1) {
      dispatch_once(&SVXSoundIDGetFromName_onceToken, &__block_literal_global_8189);
    }
    id v2 = [(id)SVXSoundIDGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXSoundIDGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXSoundIDGetFromName_map;
  SVXSoundIDGetFromName_map = (uint64_t)&unk_26D1FD5E8;
}

BOOL SVXSpeechSynthesisResultTypeGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SVXSpeechSynthesisResultTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

__CFString *SVXSpeechSynthesisResultTypeGetName(unint64_t a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_264553160[a1];
  }
}

uint64_t SVXSpeechSynthesisResultTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXSpeechSynthesisResultTypeGetFromName_onceToken != -1) {
      dispatch_once(&SVXSpeechSynthesisResultTypeGetFromName_onceToken, &__block_literal_global_8470);
    }
    id v2 = [(id)SVXSpeechSynthesisResultTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXSpeechSynthesisResultTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXSpeechSynthesisResultTypeGetFromName_map;
  SVXSpeechSynthesisResultTypeGetFromName_map = (uint64_t)&unk_26D1FD610;
}

void sub_2200A2ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9060(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9061(uint64_t a1)
{
}

void sub_2200A3320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_2200A34CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _recordStartEndBiomeEvent(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = (void *)MEMORY[0x263EFF910];
  uint64_t v8 = a1;
  uint64_t v9 = [v7 date];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___recordStartEndBiomeEvent_block_invoke;
  block[3] = &unk_2645547B0;
  id v14 = v5;
  id v15 = v6;
  id v16 = v9;
  id v10 = v9;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v8, block);
}

void ___recordStartEndBiomeEvent_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = BiomeLibrary();
  uint64_t v3 = [v2 Siri];
  uint64_t v4 = [v3 UI];

  id v5 = [v4 source];
  id v6 = &stru_26D1E1D80;
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.siri.ui.end"])
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"DISMISSAL_REASON"];
    uint64_t v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    else {
      uint64_t v9 = &stru_26D1E1D80;
    }
    id v6 = v9;

    uint64_t v10 = MEMORY[0x263EFFA80];
  }
  else
  {
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  id v11 = objc_alloc(MEMORY[0x263F2A508]);
  id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"sessionUUID"];
  long long v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"activityUUID"];
  id v14 = [&unk_26D1FCEA0 stringValue];
  id v15 = (void *)[v11 initWithSessionID:v12 uuid:v13 viewMode:v14 dismissalReason:v6 starting:v10 absoluteTimestamp:*(void *)(a1 + 48)];

  if (v15)
  {
    id v16 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      uint64_t v18 = "_recordStartEndBiomeEvent_block_invoke";
      _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s Donating biome event from SVXSession Manager", (uint8_t *)&v17, 0xCu);
    }
    [v5 sendEvent:v15];
  }
}

void sub_2200A8198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200A831C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2200A83EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _myriadStereoPartnerDataChanged(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___myriadStereoPartnerDataChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t ___myriadStereoPartnerDataChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _myriadStereoPartnerDataChanged];
}

uint64_t SVXPerformingOptionsValidate(char a1)
{
  return a1 & 3;
}

id SVXPerformingOptionsGetNames(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v3 = v2;
    if (v1) {
      [v2 addObject:@"waitsUntilDone"];
    }
    if ((v1 & 2) != 0) {
      [v3 addObject:@"allowsFastPath"];
    }
    uint64_t v4 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

uint64_t SVXPerformingOptionsGetFromNames(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v12 = v1;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(id *)(*((void *)&v13 + 1) + 8 * v7);
          if ([v8 length])
          {
            if (_SVXPerformingOptionsGetFromName_onceToken != -1) {
              dispatch_once(&_SVXPerformingOptionsGetFromName_onceToken, &__block_literal_global_9340);
            }
            uint64_t v9 = [(id)_SVXPerformingOptionsGetFromName_map objectForKey:v8];
            uint64_t v10 = [v9 unsignedIntegerValue];
          }
          else
          {
            uint64_t v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }

    id v1 = v12;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id initSBSDebugInterface()
{
  if (initSBSDebugInterface_sOnce != -1) {
    dispatch_once(&initSBSDebugInterface_sOnce, &__block_literal_global_9719);
  }
  uint64_t v0 = (void *)classSBSDebugInterface;

  return v0;
}

Class __initSBSDebugInterface_block_invoke()
{
  if (SoundBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&SoundBoardServicesLibrary_sOnce, &__block_literal_global_123);
  }
  Class result = objc_getClass("SBSDebugInterface");
  classSBSDebugInterface = (uint64_t)result;
  getSBSDebugInterfaceClass = SBSDebugInterfaceFunction;
  return result;
}

id SBSDebugInterfaceFunction()
{
  return (id)classSBSDebugInterface;
}

void *__SoundBoardServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SoundBoardServices.framework/SoundBoardServices", 2);
  SoundBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_2200ABE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

BOOL SVXActivationSourceGetIsValid(unint64_t a1)
{
  return a1 < 0xA;
}

BOOL SVXActivationSourceGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 9;
}

__CFString *SVXActivationSourceGetName(unint64_t a1)
{
  if (a1 > 9) {
    return @"(unknown)";
  }
  else {
    return off_264553510[a1];
  }
}

uint64_t SVXActivationSourceGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXActivationSourceGetFromName_onceToken != -1) {
      dispatch_once(&SVXActivationSourceGetFromName_onceToken, &__block_literal_global_9911);
    }
    id v2 = [(id)SVXActivationSourceGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXActivationSourceGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXActivationSourceGetFromName_map;
  SVXActivationSourceGetFromName_map = (uint64_t)&unk_26D1FD660;
}

__CFString *SVXStoreDemoGetLocalizationKey(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "SVXStoreDemoGetLocalizationKey";
    __int16 v12 = 2048;
    uint64_t v13 = a1;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_DEFAULT, "%s SVXStoreDemoTranscriptID = %lu", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v3 = 0;
  uint64_t v4 = MGGetProductType();
  if (v4 > 3348380075)
  {
    if (v4 != 3348380076)
    {
      uint64_t v5 = 4240173202;
      goto LABEL_8;
    }
    uint64_t v7 = a1 - 10;
    if ((unint64_t)(a1 - 10) <= 5)
    {
      id v8 = off_264553770;
      goto LABEL_14;
    }
  }
  else
  {
    if (v4 != 1540760353)
    {
      uint64_t v5 = 2702125347;
LABEL_8:
      if (v4 != v5) {
        goto LABEL_17;
      }
      _SVXStoreDemoGetLocalizationKeyForStyle1(a1);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    uint64_t v7 = a1 - 16;
    if ((unint64_t)(a1 - 16) <= 5)
    {
      id v8 = off_2645537A0;
LABEL_14:
      uint64_t v6 = *v8[v7];
LABEL_15:
      uint64_t v3 = v6;
      goto LABEL_17;
    }
  }
  uint64_t v3 = 0;
LABEL_17:

  return v3;
}

__CFString *_SVXStoreDemoGetLocalizationKeyForStyle1(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = *off_2645537D0[a1 - 1];
  }
  return v2;
}

SVXAudioStreamBasicDescription *SVXAudioStreamBasicDescriptionCreateFromUIAudioDescription(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v19 = [SVXAudioStreamBasicDescription alloc];
    uint64_t v22 = [v1 sampleRate];
    [v22 doubleValue];
    double v3 = v2;
    unint64_t v21 = [v1 formatID];
    unsigned int v17 = [v21 unsignedIntValue];
    os_log_t v20 = [v1 formatFlags];
    unsigned int v16 = [v20 unsignedIntValue];
    uint64_t v18 = [v1 bytesPerPacket];
    unsigned int v15 = [v18 unsignedIntValue];
    uint64_t v4 = [v1 framesPerPacket];
    uint64_t v5 = [v4 unsignedIntValue];
    uint64_t v6 = [v1 bytesPerFrame];
    uint64_t v7 = [v6 unsignedIntValue];
    id v8 = [v1 channelsPerFrame];
    uint64_t v9 = [v8 unsignedIntValue];
    int v10 = [v1 bitsPerChannel];
    unsigned int v11 = [v10 unsignedIntValue];
    __int16 v12 = [v1 reserved];

    uint64_t v13 = -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:](v19, "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", v17, v16, v15, v5, v7, v9, v3, __PAIR64__([v12 unsignedIntValue], v11));
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t SVXSessionIsSpeechRecordingAllowed(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 source];
  uint64_t v3 = 0;
  if (v2 <= 8)
  {
    if (((1 << v2) & 0x156) != 0)
    {
      uint64_t v3 = 1;
    }
    else if (v2 == 7)
    {
      uint64_t v5 = [v1 requestInfo];
      uint64_t v3 = [v5 isSpeechRequest];
    }
  }

  return v3;
}

BOOL SVXButtonEventTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SVXButtonEventTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SVXButtonEventTypeGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_264553908[a1];
  }
}

uint64_t SVXButtonEventTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXButtonEventTypeGetFromName_onceToken != -1) {
      dispatch_once(&SVXButtonEventTypeGetFromName_onceToken, &__block_literal_global_11595);
    }
    unint64_t v2 = [(id)SVXButtonEventTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXButtonEventTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXButtonEventTypeGetFromName_map;
  SVXButtonEventTypeGetFromName_map = (uint64_t)&unk_26D1FD688;
}

BOOL SVXSystemEventTypeGetIsValid(unint64_t a1)
{
  return a1 < 0xE;
}

BOOL SVXSystemEventTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xD;
}

__CFString *SVXSystemEventTypeGetName(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"(unknown)";
  }
  else {
    return off_264553920[a1];
  }
}

uint64_t SVXSystemEventTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXSystemEventTypeGetFromName_onceToken != -1) {
      dispatch_once(&SVXSystemEventTypeGetFromName_onceToken, &__block_literal_global_11664);
    }
    unint64_t v2 = [(id)SVXSystemEventTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXSystemEventTypeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXSystemEventTypeGetFromName_map;
  SVXSystemEventTypeGetFromName_map = (uint64_t)&unk_26D1FD6B0;
}

void sub_2200B8400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200B9E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200BADBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200BAEAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _SVXSessionCreateSetApplicationContext(void *a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F64CB0]);
  id v3 = objc_alloc_init(MEMORY[0x263F64798]);
  [v3 setAppName:@"SiriVOXService"];
  id v4 = objc_alloc_init(MEMORY[0x263F64E58]);
  [v4 setBundleId:@"com.apple.SiriVOXService"];
  [v3 setAppIdentifyingInfo:v4];
  uint64_t v5 = [v1 beginDate];
  uint64_t v6 = [v1 endDate];
  int IsActive = AFDeviceSetupIsActive();

  if (IsActive)
  {
    id v8 = [v1 flowScene];
    uint64_t v9 = [v8 sceneID];

    if (v9 == 5) {
      id v10 = (id)*MEMORY[0x263F651C8];
    }
    else {
      id v10 = 0;
    }
    id v11 = objc_alloc_init(MEMORY[0x263F64870]);
    [v11 setSetupSceneId:v10];
    __int16 v12 = [v3 dictionary];
    v19[0] = v12;
    uint64_t v13 = [v11 dictionary];
    v19[1] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v20[0] = v14;
    unsigned int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [v2 setOrderedContext:v15];
  }
  else
  {
    id v10 = [v3 dictionary];
    id v17 = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    id v18 = v11;
    __int16 v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v2 setOrderedContext:v12];
  }

  return v2;
}

void sub_2200C69B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200C6BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200C6F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SiriVOXErrorCodeGetIsValid(unint64_t a1)
{
  return a1 < 0xE;
}

BOOL SiriVOXErrorCodeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xD;
}

__CFString *SiriVOXErrorCodeGetName(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"(unknown)";
  }
  else {
    return off_264554238[a1];
  }
}

uint64_t SiriVOXErrorCodeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SiriVOXErrorCodeGetFromName_onceToken != -1) {
      dispatch_once(&SiriVOXErrorCodeGetFromName_onceToken, &__block_literal_global_12337);
    }
    id v2 = [(id)SiriVOXErrorCodeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SiriVOXErrorCodeGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SiriVOXErrorCodeGetFromName_map;
  SiriVOXErrorCodeGetFromName_map = (uint64_t)&unk_26D1FD700;
}

BOOL SVXDeviceSetupFlowSceneIDGetIsValid(unint64_t a1)
{
  return a1 < 0xA;
}

BOOL SVXDeviceSetupFlowSceneIDGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 9;
}

__CFString *SVXDeviceSetupFlowSceneIDGetName(unint64_t a1)
{
  if (a1 > 9) {
    return @"(unknown)";
  }
  else {
    return off_2645542A8[a1];
  }
}

uint64_t SVXDeviceSetupFlowSceneIDGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXDeviceSetupFlowSceneIDGetFromName_onceToken != -1) {
      dispatch_once(&SVXDeviceSetupFlowSceneIDGetFromName_onceToken, &__block_literal_global_12552);
    }
    id v2 = [(id)SVXDeviceSetupFlowSceneIDGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXDeviceSetupFlowSceneIDGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXDeviceSetupFlowSceneIDGetFromName_map;
  SVXDeviceSetupFlowSceneIDGetFromName_map = (uint64_t)&unk_26D1FD728;
}

BOOL SVXSessionStateGetIsValid(unint64_t a1)
{
  return a1 < 5;
}

BOOL SVXSessionStateGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

__CFString *SVXSessionStateGetName(unint64_t a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_2645542F8[a1];
  }
}

uint64_t SVXSessionStateGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXSessionStateGetFromName_onceToken != -1) {
      dispatch_once(&SVXSessionStateGetFromName_onceToken, &__block_literal_global_12722);
    }
    id v2 = [(id)SVXSessionStateGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXSessionStateGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXSessionStateGetFromName_map;
  SVXSessionStateGetFromName_map = (uint64_t)&unk_26D1FD750;
}

BOOL SVXAudioPowerUpdateFrequencyGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SVXAudioPowerUpdateFrequencyGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *SVXAudioPowerUpdateFrequencyGetName(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_264554340[a1];
  }
}

uint64_t SVXAudioPowerUpdateFrequencyGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SVXAudioPowerUpdateFrequencyGetFromName_onceToken != -1) {
      dispatch_once(&SVXAudioPowerUpdateFrequencyGetFromName_onceToken, &__block_literal_global_12754);
    }
    id v2 = [(id)SVXAudioPowerUpdateFrequencyGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SVXAudioPowerUpdateFrequencyGetFromName_block_invoke()
{
  uint64_t v0 = (void *)SVXAudioPowerUpdateFrequencyGetFromName_map;
  SVXAudioPowerUpdateFrequencyGetFromName_map = (uint64_t)&unk_26D1FD778;
}

uint64_t _audioFileReadData(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int *a5)
{
  id v9 = a1;
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 length];
    if (a2 < 0)
    {
      a3 = 0;
      uint64_t v12 = 4294967256;
    }
    else if (v11 <= a2)
    {
      a3 = 0;
      uint64_t v12 = 4294967257;
    }
    else
    {
      if (v11 - a2 < a3) {
        a3 = v11 - a2;
      }
      objc_msgSend(v10, "getBytes:range:", a4, a2, a3);
      uint64_t v12 = 0;
    }
  }
  else
  {
    a3 = 0;
    uint64_t v12 = 4294967246;
  }
  *a5 = a3;

  return v12;
}

void sub_2200D63AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13005(uint64_t a1)
{
}

void sub_2200DF484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2200E13B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13813(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13814(uint64_t a1)
{
}

SVXSpeechSynthesisRequest *SVXDeviceSetupCreateSpeechSynthesisRequestForSceneWithID(uint64_t a1)
{
  if (a1 == 5)
  {
    id v2 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:3 options:0 speakableText:0 speakableContext:0 localizationKey:0 presynthesizedAudio:0 streamID:0];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id SVXDeviceSetupCreateOptionsArray(void *a1)
{
  v83[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 languageCode];

  id v34 = v1;
  if (v2)
  {
    id v3 = [v1 languageCode];
    v83[0] = v3;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:1];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    AFPreferencesSupportedLanguages();
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v74 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v10 = objc_msgSend(MEMORY[0x263F286E0], "allVoicesForSiriSessionLanguage:", v9, v34);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v69 objects:v81 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v70 != v13) {
                  objc_enumerationMutation(v10);
                }
                unsigned int v15 = [*(id *)(*((void *)&v69 + 1) + 8 * j) languageCode];
                [v3 addObject:v15];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v69 objects:v81 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v6);
    }

    id v4 = [v3 array];
    id v1 = v34;
  }

  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v1 gender] == 2)
  {
    unsigned int v16 = &unk_26D1FD410;
  }
  else if ([v1 gender] == 1)
  {
    unsigned int v16 = &unk_26D1FD428;
  }
  else
  {
    if ([v1 gender] != 3)
    {
      [v38 addObject:&unk_26D1FD410];
      [v38 addObject:&unk_26D1FD428];
    }
    unsigned int v16 = &unk_26D1FD440;
  }
  objc_msgSend(v38, "addObject:", v16, v34);
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v1 hasActiveAccount] == 2)
  {
    id v17 = &unk_26D1FD410;
  }
  else
  {
    if ([v1 hasActiveAccount] != 1) {
      [v42 addObject:&unk_26D1FD410];
    }
    id v17 = &unk_26D1FD428;
  }
  [v42 addObject:v17];
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v1 isNewsRestricted] == 2)
  {
    id v18 = &unk_26D1FD410;
  }
  else
  {
    if ([v1 isNewsRestricted] != 1) {
      [v47 addObject:&unk_26D1FD410];
    }
    id v18 = &unk_26D1FD428;
  }
  [v47 addObject:v18];
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v36 = v4;
  uint64_t v39 = [v36 countByEnumeratingWithState:&v65 objects:v80 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v66;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v66 != v37) {
          objc_enumerationMutation(v36);
        }
        uint64_t v40 = v20;
        uint64_t v21 = *(void *)(*((void *)&v65 + 1) + 8 * v20);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v41 = v38;
        uint64_t v44 = [v41 countByEnumeratingWithState:&v61 objects:v79 count:16];
        if (v44)
        {
          uint64_t v43 = *(void *)v62;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v62 != v43) {
                objc_enumerationMutation(v41);
              }
              uint64_t v45 = v22;
              uint64_t v23 = *(void *)(*((void *)&v61 + 1) + 8 * v22);
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v46 = v42;
              uint64_t v49 = [v46 countByEnumeratingWithState:&v57 objects:v78 count:16];
              if (v49)
              {
                uint64_t v48 = *(void *)v58;
                do
                {
                  v24 = 0;
                  do
                  {
                    if (*(void *)v58 != v48) {
                      objc_enumerationMutation(v46);
                    }
                    obja = v24;
                    uint64_t v25 = *(void *)(*((void *)&v57 + 1) + 8 * (void)v24);
                    long long v53 = 0u;
                    long long v54 = 0u;
                    long long v55 = 0u;
                    long long v56 = 0u;
                    id v26 = v47;
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v77 count:16];
                    if (v27)
                    {
                      uint64_t v28 = v27;
                      uint64_t v29 = *(void *)v54;
                      do
                      {
                        for (uint64_t k = 0; k != v28; ++k)
                        {
                          if (*(void *)v54 != v29) {
                            objc_enumerationMutation(v26);
                          }
                          uint64_t v31 = *(void *)(*((void *)&v53 + 1) + 8 * k);
                          v52[0] = MEMORY[0x263EF8330];
                          v52[1] = 3221225472;
                          v52[2] = __SVXDeviceSetupCreateOptionsArray_block_invoke;
                          v52[3] = &unk_264554878;
                          v52[4] = v21;
                          v52[5] = v23;
                          v52[6] = v25;
                          v52[7] = v31;
                          id v32 = +[SVXDeviceSetupOptions newWithBuilder:v52];
                          [v19 addObject:v32];
                        }
                        uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v77 count:16];
                      }
                      while (v28);
                    }

                    v24 = obja + 1;
                  }
                  while (obja + 1 != (char *)v49);
                  uint64_t v49 = [v46 countByEnumeratingWithState:&v57 objects:v78 count:16];
                }
                while (v49);
              }

              uint64_t v22 = v45 + 1;
            }
            while (v45 + 1 != v44);
            uint64_t v44 = [v41 countByEnumeratingWithState:&v61 objects:v79 count:16];
          }
          while (v44);
        }

        uint64_t v20 = v40 + 1;
      }
      while (v40 + 1 != v39);
      uint64_t v39 = [v36 countByEnumeratingWithState:&v65 objects:v80 count:16];
    }
    while (v39);
  }

  return v19;
}

void __SVXDeviceSetupCreateOptionsArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLanguageCode:v3];
  objc_msgSend(v4, "setGender:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  objc_msgSend(v4, "setHasActiveAccount:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
  objc_msgSend(v4, "setIsNewsRestricted:", objc_msgSend(*(id *)(a1 + 56), "integerValue"));
}

void sub_2200E3D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_2200E3EDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2200E4658(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_2200E47F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x270F0EBF8]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x270F0EC10]();
}

uint64_t AFAudioSessionAssertionGetCurrentAcquisitionService()
{
  return MEMORY[0x270F0EC40]();
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x270F0EC50]();
}

uint64_t AFDeviceSetupIsActive()
{
  return MEMORY[0x270F0EC98]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x270F0ECE0]();
}

uint64_t AFDispatchScheduleWithDelay()
{
  return MEMORY[0x270F0ED20]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x270F0EDC0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x270F0EE20]();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return MEMORY[0x270F0EE78]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x270F0EEB8]();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x270F0EED0]();
}

uint64_t AFRecordCoreDuetEvent()
{
  return MEMORY[0x270F0EEF8]();
}

uint64_t AFSiriDeactivationOptionsGetNames()
{
  return MEMORY[0x270F0EF68]();
}

uint64_t AFSiriDeactivationReasonGetName()
{
  return MEMORY[0x270F0EF70]();
}

uint64_t AFSpeechEndpointerOperationModeGetName()
{
  return MEMORY[0x270F0EF88]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x270F0EF90]();
}

uint64_t AFSupportsWAPI()
{
  return MEMORY[0x270F0EFB8]();
}

uint64_t AFTurnIdentifierGenerate()
{
  return MEMORY[0x270F0EFC8]();
}

uint64_t AFTurnIdentifierGetBytes()
{
  return MEMORY[0x270F0EFD0]();
}

uint64_t AFTurnIdentifierGetString()
{
  return MEMORY[0x270F0EFD8]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x270EE20D8](inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x270EE20F0](inAudioFile, *(void *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenWithCallbacks(void *inClientData, AudioFile_ReadProc inReadFunc, AudioFile_WriteProc inWriteFunc, AudioFile_GetSizeProc inGetSizeFunc, AudioFile_SetSizeProc inSetSizeFunc, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x270EE2128](inClientData, inReadFunc, inWriteFunc, inGetSizeFunc, inSetSizeFunc, *(void *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270EE2238](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, *(void *)&inPropertyDataSize, inPropertyData);
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MDModeGetName()
{
  return MEMORY[0x270F6A1C8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SRUIFSiriSessionEventGetDescription()
{
  return MEMORY[0x270F72880]();
}

uint64_t _AFPreferencesBoolFromValueWithDefault()
{
  return MEMORY[0x270F0F018]();
}

uint64_t _AFPreferencesValueForKey()
{
  return MEMORY[0x270F0F068]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_activate(dispatch_object_t object)
{
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x270ED9600]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}