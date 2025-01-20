void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t PBIsPasteboardNameGeneralPasteboard(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.UIKit.pboard.general"];
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id PBCannotUnserializePasteboardError(uint64_t a1, void *a2)
{
  v3 = NSString;
  id v4 = a2;
  v5 = [v3 stringWithFormat:@"Cannot unserialize pasteboard at URL %@", a1];
  v6 = PBErrorMake(8, v5, v4);

  return v6;
}

id PBErrorMake(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = v7;
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PBErrorDomain" code:a1 userInfo:v8];

  return v9;
}

id PBStorageRootURL()
{
  if (qword_1EB3B8610 != -1) {
    dispatch_once(&qword_1EB3B8610, &__block_literal_global_43);
  }
  v0 = (void *)qword_1EB3B8608;
  return v0;
}

uint64_t ___notificationQueue_block_invoke()
{
  qword_1EB3B8578 = (uint64_t)dispatch_queue_create("com.apple.Pasteboard.notification-queue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __PBItemQueue_block_invoke()
{
  _MergedGlobals_6 = (uint64_t)dispatch_queue_create("com.apple.pasteboard.PBItemQueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __PBAllowedMetadataClasses_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  _MergedGlobals_5 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t PBPreferencesBoolValue(void *a1, char a2)
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PBPreferencesBoolValue_block_invoke;
  v4[3] = &unk_1E5556470;
  v4[4] = &v6;
  char v5 = a2;
  _readPasteboardPreferenceCached(a1, v4);
  uint64_t v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void _readPasteboardPreferenceCached(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = _preferencesCacheQueue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___readPasteboardPreferenceCached_block_invoke;
  v8[3] = &unk_1E5555EE0;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

id _preferencesCacheQueue()
{
  if (qword_1EB3B8640 != -1) {
    dispatch_once(&qword_1EB3B8640, &__block_literal_global_87);
  }
  v0 = (void *)qword_1EB3B8638;
  return v0;
}

void PBDispatchAsyncCallback(void *a1)
{
  id v1 = a1;
  uint64_t v2 = callbackQueue();
  dispatch_async(v2, v1);
}

id callbackQueue()
{
  if (qword_1EB3B8630 != -1) {
    dispatch_once(&qword_1EB3B8630, &__block_literal_global_84);
  }
  v0 = (void *)qword_1EB3B8628;
  return v0;
}

void ___readPasteboardPreferenceCached_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _preferencesCacheQueue_KeyToValueMap();
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v3)
  {
    id v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.Pasteboard", *(void *)(a1 + 32)];
    char v5 = _PBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18D208000, v5, OS_LOG_TYPE_INFO, "Registering for pasteboard preferences notification: %@", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    id v6 = v4;
    id v7 = (const char *)[v6 UTF8String];
    uint64_t v8 = _preferencesCacheQueue();
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = ___readPasteboardPreferenceCached_block_invoke_38;
    handler[3] = &unk_1E5556448;
    id v13 = *(id *)(a1 + 32);
    notify_register_dispatch(v7, (int *)buf, v8, handler);

    id v3 = _readPasteboardPreference(*(void **)(a1 + 32));
    if (v3)
    {
      id v9 = _preferencesCacheQueue_KeyToValueMap();
      [v9 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
      id v10 = _preferencesCacheQueue_KeyToValueMap();
      [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  v11 = [MEMORY[0x1E4F1CA98] null];

  if (v3 != v11)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id _preferencesCacheQueue_KeyToValueMap()
{
  if (qword_1EB3B8650 != -1) {
    dispatch_once(&qword_1EB3B8650, &__block_literal_global_90);
  }
  v0 = (void *)qword_1EB3B8648;
  return v0;
}

uint64_t __PBPreferencesBoolValue_block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t result = [a2 BOOLValue];
  }
  else {
    uint64_t result = *(unsigned char *)(a1 + 40) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id PBAllowedMetadataClasses()
{
  if (qword_1EB3B85F0 != -1) {
    dispatch_once(&qword_1EB3B85F0, &__block_literal_global_22);
  }
  v0 = (void *)_MergedGlobals_5;
  return v0;
}

id PBNewClientToServerXPCInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDBE36D8];
  id v1 = +[PBItemCollection allowedClassesForSecureCoding];
  [v0 setClasses:v1 forSelector:sel_pasteboardWithName_createIfNeeded_completionBlock_ argumentIndex:0 ofReply:1];

  uint64_t v2 = +[PBItemCollection allowedClassesForSecureCoding];
  [v0 setClasses:v2 forSelector:sel_savePasteboard_dataProviderEndpoint_completionBlock_ argumentIndex:0 ofReply:0];

  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v3 forSelector:sel_savePasteboard_dataProviderEndpoint_completionBlock_ argumentIndex:1 ofReply:0];

  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v4 forSelector:sel_didPasteContentsFromPasteboardWithName_UUID_completionBlock_ argumentIndex:0 ofReply:0];

  char v5 = +[PBItemCollection allowedClassesForSecureCoding];
  [v0 setClasses:v5 forSelector:sel_getAllPasteboardsCompletionBlock_ argumentIndex:0 ofReply:1];

  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v6 forSelector:sel_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock_ argumentIndex:1 ofReply:1];

  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v7 forSelector:sel_requestItemFromPasteboardWithName_UUID_authenticationMessage_itemIndex_typeIdentifier_dataOwner_loadContext_completionBlock_ argumentIndex:2 ofReply:1];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v0 setClasses:v11 forSelector:sel_requestPatternDetectionsFromPasteboardWithName_UUID_authenticationMessage_itemIndex_patterns_needValues_dataOwner_completionBlock_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_18D20BA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 184), 8);
  _Block_object_dispose((const void *)(v70 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18D20BCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

id _notificationQueue()
{
  if (qword_1EB3B8580 != -1) {
    dispatch_once(&qword_1EB3B8580, &__block_literal_global_100);
  }
  v0 = (void *)qword_1EB3B8578;
  return v0;
}

void sub_18D20C46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id _PBLog()
{
  if (_PBLog_onceToken != -1) {
    dispatch_once(&_PBLog_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)_PBLog_log;
  return v0;
}

id _loggingErrorHandler(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___loggingErrorHandler_block_invoke;
  v7[3] = &unk_1E5555E98;
  id v8 = v3;
  uint64_t v9 = a1;
  id v4 = v3;
  char v5 = (void *)MEMORY[0x192F9AA30](v7);

  return v5;
}

void sub_18D20C868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *PBSHA1HashOfString(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = (char *)[a1 UTF8String];
  if (v1)
  {
    uint64_t v2 = v1;
    memset(&v8, 0, sizeof(v8));
    CC_SHA1_Init(&v8);
    CC_LONG v3 = strlen(v2);
    CC_SHA1_Update(&v8, v2, v3);
    CC_SHA1_Final(md, &v8);
    uint64_t v4 = 0;
    char v5 = v9;
    do
    {
      unint64_t v6 = md[v4];
      unsigned __int8 *v5 = PBSHA1HashOfString_hexNibble[v6 >> 4];
      v5[1] = PBSHA1HashOfString_hexNibble[v6 & 0xF];
      v5 += 2;
      ++v4;
    }
    while (v4 != 20);
    unsigned __int8 *v5 = 0;
    id v1 = (char *)[[NSString alloc] initWithBytes:v9 length:40 encoding:4];
  }
  return v1;
}

id PBItemQueue()
{
  if (qword_1EB3B8670 != -1) {
    dispatch_once(&qword_1EB3B8670, &__block_literal_global_7);
  }
  v0 = (void *)_MergedGlobals_6;
  return v0;
}

uint64_t _notificationQueue_getState()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(_notificationQueue_token, &state64);
  if (!state) {
    return state64;
  }
  uint32_t v1 = state;
  uint64_t v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    uint32_t v6 = v1;
    _os_log_fault_impl(&dword_18D208000, v2, OS_LOG_TYPE_FAULT, "Cannot get notification state. Error: %d", buf, 8u);
  }

  return 0;
}

void sub_18D20D2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PBIsPasteboardNameAllowed(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 length];
  uint64_t v5 = v4;
  if (a2 && !v4)
  {
    PBPasteboardNameInvalidError((uint64_t)v3, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5 != 0;
}

__CFString *PBPasteboardPersistenceName(void *a1, void *a2, void *a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v7 isEqualToString:@"com.apple.UIKit.pboard.general"])
  {
    if (a4)
    {
      uint64_t v10 = @"com.apple.UIKit.pboard.general.locked";
      goto LABEL_12;
    }
    uint64_t v14 = @"com.apple.UIKit.pboard.general";
    goto LABEL_10;
  }
  if ([v7 length])
  {
    uint64_t v11 = [v9 length];
    id v12 = v9;
    if (v11 || (uint64_t v13 = [v8 length], v12 = v8, v13))
    {
      uint64_t v10 = [NSString stringWithFormat:@"%@.%@", v12, v7];
      if (v10) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = [NSString stringWithFormat:@"UnknownApp.%@", v7];
LABEL_10:
    uint64_t v10 = v14;
    goto LABEL_12;
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

void sub_18D210C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18D211204(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x192F9AA30](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_18D212464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void *_bestReadOnlySandboxExtensionTypeForURL(void *result)
{
  if (result)
  {
    id v1 = result;
    getpid();
    uint64_t v2 = [v1 path];

    id v3 = v2;
    [v3 fileSystemRepresentation];
    int v4 = sandbox_check();

    if (v4) {
      return 0;
    }
    else {
      return (void *)*MEMORY[0x1E4F14000];
    }
  }
  return result;
}

id _issueSandboxExtension(void *a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = [v5 path];
  [v6 fileSystemRepresentation];
  id v7 = (const char *)sandbox_extension_issue_file();

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:strlen(v7) + 1 freeWhenDone:1];
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28798];
    uint64_t v12 = *__error();
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v13 = NSString;
    uint64_t v14 = [v5 path];
    uint64_t v15 = __error();
    uint64_t v16 = [v13 stringWithFormat:@"Could not create sandbox extension of type %s for URL %@. Error: %s", a2, v14, strerror(*v15)];
    v20[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v9 = [v10 errorWithDomain:v11 code:v12 userInfo:v17];

    id v8 = 0;
    if (a3 && v9)
    {
      id v9 = v9;
      id v8 = 0;
      *a3 = v9;
    }
  }

  return v8;
}

void *initFPIsFileProviderBookmark(uint64_t a1, uint64_t a2)
{
  int v4 = FileProviderLibrary();
  id v5 = (uint64_t (*)())dlsym(v4, "FPIsFileProviderBookmark");
  softLinkFPIsFileProviderBookmark = v5;
  if (v5)
  {
    return (void *)((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
  }
  else
  {
    dlerror();
    abort_report_np();
    return FileProviderLibrary();
  }
}

void *FileProviderLibrary()
{
  uint64_t result = (void *)FileProviderLibrary_frameworkLibrary;
  if (!FileProviderLibrary_frameworkLibrary)
  {
    uint64_t result = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
    FileProviderLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      dlerror();
      uint64_t v1 = abort_report_np();
      return (void *)initFPCreateBookmarkableStringFromDocumentURL(v1);
    }
  }
  return result;
}

uint64_t initFPCreateBookmarkableStringFromDocumentURL(uint64_t a1, uint64_t a2)
{
  int v4 = FileProviderLibrary();
  id v5 = (uint64_t (*)())dlsym(v4, "FPCreateBookmarkableStringFromDocumentURL");
  softLinkFPCreateBookmarkableStringFromDocumentURL[0] = v5;
  if (v5)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
  }
  else
  {
    dlerror();
    uint64_t v7 = abort_report_np();
    return initFPCreateDocumentURLFromBookmarkableString(v7);
  }
}

void initFPCreateDocumentURLFromBookmarkableString(uint64_t a1, uint64_t a2)
{
  int v4 = FileProviderLibrary();
  id v5 = (uint64_t (*)())dlsym(v4, "FPCreateDocumentURLFromBookmarkableString");
  softLinkFPCreateDocumentURLFromBookmarkableString[0] = v5;
  if (v5)
  {
    ((void (*)(uint64_t, uint64_t))v5)(a1, a2);
  }
  else
  {
    dlerror();
    id v6 = (void *)abort_report_np();
    +[PBServerConnection simulateCrashReportForAuthorizationWithAuthenticationMessage:v8];
  }
}

void sub_18D216634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18D216ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18D216EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18D2172AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18D21778C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void ___loggingErrorHandler_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 136315394;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_18D208000, v4, OS_LOG_TYPE_ERROR, "%s failed with error: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

double _PBDefaultMaxGeneralPasteboardAgeForLockState(int a1)
{
  uint64_t v2 = _defaults();
  [v2 doubleForKey:@"GeneralPasteboardAge"];
  double v4 = v3;

  if (a1)
  {
    uint64_t v5 = _defaults();
    [v5 doubleForKey:@"GeneralLockedPasteboardAge"];
    double v7 = v6;

    if (v4 >= v7) {
      return v7;
    }
  }
  return v4;
}

id _defaults()
{
  if (qword_1EB3B8590 != -1) {
    dispatch_once(&qword_1EB3B8590, &__block_literal_global_1);
  }
  v0 = (void *)_MergedGlobals_1;
  return v0;
}

void ___defaults_block_invoke()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Pasteboard"];
  uint64_t v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

  uint64_t v2 = (void *)_MergedGlobals_1;
  uint64_t v8 = @"GeneralPasteboardAge";
  v9[0] = &unk_1EDBDB9D8;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 registerDefaults:v3];

  double v4 = (void *)_MergedGlobals_1;
  double v6 = @"GeneralLockedPasteboardAge";
  double v7 = &unk_1EDBDB9E8;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v4 registerDefaults:v5];
}

id PBNSIPTopLevelMetadataKeys()
{
  if (qword_1EB3B85A0 != -1) {
    dispatch_once(&qword_1EB3B85A0, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)_MergedGlobals_2;
  return v0;
}

void __PBNSIPTopLevelMetadataKeys_block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.Pasteboard.teamData";
  v2[1] = @"com.apple.Pasteboard.estimatedDisplayedSize";
  v2[2] = @"com.apple.Pasteboard.preferredPresentationStyle";
  v2[3] = @"com.apple.Pasteboard.teamData";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = v0;
}

void sub_18D2181A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D2183C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D2185E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D218800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D218984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D218BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D2192F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21990C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id location)
{
}

void sub_18D21A534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21C3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21C528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21C684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21C7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21CA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21CCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21CF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21D118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18D21D680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_18D21E600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18D21EA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21FB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D21FF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D2203A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D2205B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x192F9AA30](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

id _cleanupQueue()
{
  if (qword_1EB3B85B0 != -1) {
    dispatch_once(&qword_1EB3B85B0, &__block_literal_global_80);
  }
  uint64_t v0 = (void *)_MergedGlobals_3;
  return v0;
}

uint64_t ___cleanupQueue_block_invoke()
{
  _MergedGlobals_3 = (uint64_t)dispatch_queue_create("com.apple.Pasteboard.cleanupQueue", 0);
  return MEMORY[0x1F41817F8]();
}

void PBAssertIsOnCallbackQueue()
{
  uint64_t v0 = callbackQueue();
  dispatch_assert_queue_V2(v0);
}

id PBBestMatchConformingToType(void *a1, void *a2)
{
  return _bestMatchType(a1, a2, &__block_literal_global_6);
}

id _bestMatchType(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  double v7 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      if ([v13 isEqualToString:v5]) {
        goto LABEL_18;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
LABEL_11:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * v18);
      if (v7[2](v7, v5, v13)) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        id v19 = 0;
        if (v16) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    id v19 = v13;
    goto LABEL_19;
  }
  id v19 = 0;
LABEL_19:

  return v19;
}

BOOL __PBBestMatchConformingToType_block_invoke(int a1, const __CFString *a2, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, a2) != 0;
}

id PBBestMatchToConformingType(void *a1, void *a2)
{
  return _bestMatchType(a1, a2, &__block_literal_global_15);
}

BOOL __PBBestMatchToConformingType_block_invoke(int a1, CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return UTTypeConformsTo(inUTI, inConformsToUTI) != 0;
}

id PBBestMatchConformingToTypes(void *a1, void *a2)
{
  return _bestMatchTypes(a1, a2, &__block_literal_global_17_0);
}

id _bestMatchTypes(void *a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  double v7 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v56 count:16];
  v36 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v50;
    uint64_t v34 = *(void *)v50;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * v12);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v14 = v6;
        id v15 = v6;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v46 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              if ([v20 isEqualToString:v13])
              {
LABEL_32:
                id v30 = v20;
                id v6 = v14;

                goto LABEL_33;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        ++v12;
        id v6 = v14;
        uint64_t v11 = v34;
        id v8 = v36;
      }
      while (v12 != v10);
      uint64_t v10 = [v36 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v10);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v21 = v8;
  uint64_t v35 = [v21 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v35)
  {
    uint64_t v22 = *(void *)v42;
    uint64_t v32 = *(void *)v42;
    uint64_t v33 = v21;
    while (2)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v21);
        }
        uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * v23);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v14 = v6;
        id v25 = v6;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v38;
LABEL_23:
          uint64_t v29 = 0;
          while (1)
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v25);
            }
            v20 = *(void **)(*((void *)&v37 + 1) + 8 * v29);
            if (v7[2](v7, v24, v20)) {
              goto LABEL_32;
            }
            if (v27 == ++v29)
            {
              uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v53 count:16];
              if (v27) {
                goto LABEL_23;
              }
              break;
            }
          }
        }

        ++v23;
        id v6 = v14;
        uint64_t v22 = v32;
        id v21 = v33;
      }
      while (v23 != v35);
      id v30 = 0;
      uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v30 = 0;
  }
LABEL_33:

  return v30;
}

BOOL __PBBestMatchConformingToTypes_block_invoke(int a1, const __CFString *a2, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, a2) != 0;
}

id PBBestMatchToConformingTypes(void *a1, void *a2)
{
  return _bestMatchTypes(a1, a2, &__block_literal_global_19);
}

BOOL __PBBestMatchToConformingTypes_block_invoke(int a1, CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return UTTypeConformsTo(inUTI, inConformsToUTI) != 0;
}

id PBURLFromURLArchive(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v2 count] < 2) {
    goto LABEL_7;
  }
  double v3 = [v2 objectAtIndexedSubscript:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v2 objectAtIndexedSubscript:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [v2 objectAtIndexedSubscript:1];
      int v7 = [v6 isEqualToString:&stru_1EDBD7C58];

      id v8 = (void *)MEMORY[0x1E4F1CB10];
      double v3 = [v2 objectAtIndexedSubscript:0];
      if (v7)
      {
        uint64_t v9 = [v8 URLWithString:v3];
      }
      else
      {
        uint64_t v11 = [v2 objectAtIndexedSubscript:1];
        uint64_t v9 = [v8 URLWithString:v3 relativeToURL:v11];
      }
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_12:

LABEL_8:
  return v9;
}

id _readPasteboardPreference(void *a1)
{
  uint64_t v1 = qword_1EB3B8600;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1EB3B8600, &__block_literal_global_36);
  }
  double v3 = [(id)qword_1EB3B85F8 objectForKey:v2];

  return v3;
}

uint64_t ___readPasteboardPreference_block_invoke()
{
  qword_1EB3B85F8 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Pasteboard"];
  return MEMORY[0x1F41817F8]();
}

void ___readPasteboardPreferenceCached_block_invoke_38(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = _readPasteboardPreference(*(void **)(a1 + 32));
  double v3 = _PBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v2;
    _os_log_impl(&dword_18D208000, v3, OS_LOG_TYPE_INFO, "Pasteboard preference changed: %@, new value: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v2)
  {
    id v5 = _preferencesCacheQueue_KeyToValueMap();
    [v5 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = _preferencesCacheQueue_KeyToValueMap();
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

double PBPreferencesDoubleValue(void *a1, double a2)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PBPreferencesDoubleValue_block_invoke;
  v4[3] = &unk_1E5556498;
  v4[4] = &v5;
  *(double *)&void v4[5] = a2;
  _readPasteboardPreferenceCached(a1, v4);
  double v2 = (double)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __PBPreferencesDoubleValue_block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = result;
  if (a2) {
    uint64_t result = [a2 doubleValue];
  }
  else {
    double v3 = *(double *)(result + 40);
  }
  *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = (uint64_t)v3;
  return result;
}

void __PBStorageRootURL_block_invoke()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() pathComponents];
  id v3 = (id)[v0 mutableCopy];

  [v3 addObjectsFromArray:&unk_1EDBDB9F8];
  uint64_t v1 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v3];
  uint64_t v2 = (void *)qword_1EB3B8608;
  qword_1EB3B8608 = v1;
}

id PBOldPasteboardStorageRootURL()
{
  if (qword_1EB3B8620 != -1) {
    dispatch_once(&qword_1EB3B8620, &__block_literal_global_54);
  }
  uint64_t v0 = (void *)qword_1EB3B8618;
  return v0;
}

void __PBOldPasteboardStorageRootURL_block_invoke()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() pathComponents];
  id v3 = (id)[v0 mutableCopy];

  [v3 addObjectsFromArray:&unk_1EDBDBA10];
  uint64_t v1 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v3];
  uint64_t v2 = (void *)qword_1EB3B8618;
  qword_1EB3B8618 = v1;
}

id PBSchemaFileContentsWithVersion(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = @"schemaVersion";
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  v11[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  id v7 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    uint64_t v5 = _PBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_fault_impl(&dword_18D208000, v5, OS_LOG_TYPE_FAULT, "Could not create new schema file. Error: %@", buf, 0xCu);
    }
  }
  return v3;
}

id PBCoordinatedRead(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28C98];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 readingIntentWithURL:v5 options:1];
  id v7 = _coordinatedFileAccess(v6, v5, v4);

  return v7;
}

id _coordinatedFileAccess(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  id v9 = _coordinationQueue();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___coordinatedFileAccess_block_invoke;
  v17[3] = &unk_1E55564F8;
  id v18 = v6;
  id v19 = v5;
  id v10 = v8;
  id v20 = v10;
  id v21 = v7;
  id v11 = v7;
  id v12 = v5;
  id v13 = v6;
  [v9 addOperationWithBlock:v17];

  id v14 = v21;
  id v15 = v10;

  return v15;
}

id PBCoordinatedReadForUploading(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28C98];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 readingIntentWithURL:v5 options:8];
  id v7 = _coordinatedFileAccess(v6, v5, v4);

  return v7;
}

uint64_t PBIsBundleIDAllowedToPromiseFileProviderFolders(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"com.apple."];
}

id PBCloneFileToTemporaryDir(void *a1, void *a2)
{
  if (([a1 fileDescriptor] & 0x80000000) != 0)
  {
    id v5 = PBCannotCopyFileError(0, 0, 0);
    if (!a2) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  int to_fd = -1;
  id v3 = CPTemporaryFileWithUniqueName();
  if (v3)
  {
    id v5 = 0;
  }
  else
  {
    id v4 = _PBLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18D208000, v4, OS_LOG_TYPE_FAULT, "Cannot cerate temporary file.", buf, 2u);
    }

    id v5 = PBCannotCopyFileError(0, 0, 0);
  }

  if (a2)
  {
LABEL_10:
    if (v5) {
      *a2 = v5;
    }
  }
LABEL_12:

  return 0;
}

id PBCloneToTemporaryDir(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v17 = 0;
  uint64_t v6 = PBTemporaryFileName(a2, &v17);
  unint64_t v7 = (unint64_t)v17;
  id v8 = (id)v7;
  if (!v6 || v7)
  {
    if (!(v6 | v7))
    {
      PBCannotCopyFileError(v5, 0, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v9 = [v5 path];
    id v10 = (const char *)[v9 fileSystemRepresentation];
    id v11 = [(id)v6 path];
    LODWORD(v10) = copyfile(v10, (const char *)[v11 fileSystemRepresentation], 0, 0x10C800Fu);

    if (!v10)
    {
      id v15 = (id)v6;
      id v8 = 0;
      goto LABEL_11;
    }
    id v12 = NSString;
    id v13 = __error();
    id v14 = objc_msgSend(v12, "stringWithFormat:", @"%s", strerror(*v13));
    PBCannotCopyFileError(v5, v14, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = 0;
  if (a3 && v8)
  {
    id v8 = v8;
    id v15 = 0;
    *a3 = v8;
  }
LABEL_11:

  return v15;
}

id PBTemporaryFileName(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = a1;
  id v4 = (__CFString *)v3;
  if (!v3 || (id v5 = (__CFString *)UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x1E4F224F8])) == 0) {
    id v5 = @"tmp";
  }
  uint64_t v6 = NSTemporaryDirectory();
  unint64_t v7 = [NSString stringWithFormat:@".%@.XXXXXX", @"com.apple.Pasteboard"];
  id v8 = [v6 stringByAppendingPathComponent:v7];

  id v9 = v8;
  [v9 UTF8String];
  __strlcpy_chk();
  id v10 = mktemp(v20);
  id v11 = NSString;
  if (v10)
  {
    id v12 = [NSString stringWithUTF8String:v20];
    id v13 = v12;
    if (v5)
    {
      uint64_t v14 = [v12 stringByAppendingPathExtension:v5];

      id v13 = (void *)v14;
    }
    id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0 relativeToURL:0];

    id v16 = 0;
  }
  else
  {
    id v17 = __error();
    id v18 = objc_msgSend(v11, "stringWithFormat:", @"%s", strerror(*v17));
    PBCannotCreateTemporaryFile((uint64_t)v18, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    id v15 = 0;
    if (a2 && v16)
    {
      id v16 = v16;
      id v15 = 0;
      *a2 = v16;
    }
  }

  return v15;
}

id PBFilenameWithProperExtension(void *a1, void *a2)
{
  CFStringRef v3 = a2;
  id v4 = (__CFString *)[a1 copy];
  if (![(__CFString *)v4 length])
  {
    CFStringRef v5 = UTTypeCopyDescription(v3);

    id v4 = (__CFString *)v5;
  }
  if (![(__CFString *)v4 length])
  {
    CFStringRef v6 = UTTypeCopyDescription((CFStringRef)*MEMORY[0x1E4F22608]);

    id v4 = (__CFString *)v6;
  }
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();

  return SuggestedFilename;
}

id PBCloneURLToTemporaryFolder(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  id v11 = a4;
  id v12 = a3;
  id v13 = [NSString stringWithFormat:@".%@.XXXXXX", a2];
  uint64_t v14 = NSTemporaryDirectory();
  id v15 = [v14 stringByAppendingPathComponent:v13];

  [v15 getFileSystemRepresentation:v37 maxLength:1024];
  if (mkdtemp(v37))
  {
    id v16 = [NSString stringWithUTF8String:v37];
    id v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:1];
  }
  else
  {
    id v17 = 0;
  }

  uint64_t v35 = a6;
  if ([v11 length])
  {
    id v18 = v11;
  }
  else
  {
    id v18 = [v10 lastPathComponent];
  }
  id v19 = v18;
  id v20 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v20 setSuggestedName:v19];
  uint64_t v21 = [v20 _sanitizedSuggestedName];

  uint64_t v22 = PBFilenameWithProperExtension(v21, v12);

  id v23 = [v17 URLByAppendingPathComponent:v22];
  v36 = v10;
  id v24 = [v10 path];
  id v25 = (const char *)[v24 fileSystemRepresentation];
  uint64_t v26 = [v23 path];

  id v27 = v26;
  int v28 = copyfile(v25, (const char *)[v27 fileSystemRepresentation], 0, 0x10C800Fu);

  if (v28)
  {
    uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v29 removeItemAtURL:v17 error:0];

    id v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s", strerror(v28));
    PBCannotCreateTemporaryFile((uint64_t)v30, 0);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    id v32 = 0;
    if (v35 && v31)
    {
      id v31 = v31;
      id v32 = 0;
      *uint64_t v35 = v31;
    }
  }
  else
  {
    if (a5) {
      *a5 = v17;
    }
    id v32 = v23;
    id v31 = 0;
  }

  return v32;
}

BOOL PBNSPreferredRepresentationFromPB(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

BOOL PBPreferredRepresentationFromNS(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

uint64_t __callbackQueue_block_invoke()
{
  qword_1EB3B8628 = (uint64_t)dispatch_queue_create("com.apple.Pasteboard.callback-queue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t ___preferencesCacheQueue_block_invoke()
{
  qword_1EB3B8638 = (uint64_t)dispatch_queue_create("com.apple.pasteboard.preferencesCacheQueue", 0);
  return MEMORY[0x1F41817F8]();
}

void ___coordinatedFileAccess_block_invoke(id *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  char v2 = [a1[4] startAccessingSecurityScopedResource];
  CFStringRef v3 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  v12[0] = a1[5];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  CFStringRef v5 = _coordinationQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___coordinatedFileAccess_block_invoke_2;
  v6[3] = &unk_1E55564D0;
  id v7 = a1[6];
  id v10 = a1[7];
  id v8 = a1[5];
  char v11 = v2;
  id v9 = a1[4];
  [v3 coordinateAccessWithIntents:v4 queue:v5 byAccessor:v6];
}

void ___coordinatedFileAccess_block_invoke_2(uint64_t a1, void *a2)
{
  CFStringRef v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  uint64_t v5 = *(void *)(a1 + 56);
  CFStringRef v6 = [*(id *)(a1 + 40) URL];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v4);

  if (*(unsigned char *)(a1 + 64))
  {
    id v7 = *(void **)(a1 + 48);
    [v7 stopAccessingSecurityScopedResource];
  }
}

id _coordinationQueue()
{
  if (qword_1EB3B8660 != -1) {
    dispatch_once(&qword_1EB3B8660, &__block_literal_global_96);
  }
  uint64_t v0 = (void *)qword_1EB3B8658;
  return v0;
}

uint64_t ___coordinationQueue_block_invoke()
{
  qword_1EB3B8658 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28F08]);
  return MEMORY[0x1F41817F8]();
}

id PBTypeNotFoundError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v3 stringWithFormat:@"The item cannot be represented as type %@", a1];
  CFStringRef v6 = PBErrorMake(0, v5, v4);

  return v6;
}

id PBCannotInstantiateObjectOfClassError(objc_class *a1, void *a2, void *a3)
{
  id v5 = a2;
  CFStringRef v6 = NSString;
  id v7 = a3;
  uint64_t v8 = NSStringFromClass(a1);
  id v9 = (void *)v8;
  if (v5) {
    [v6 stringWithFormat:@"Cannot instantiate object of class %@ from representation of type %@", v8, v5];
  }
  else {
  id v10 = [v6 stringWithFormat:@"Cannot instantiate object of class %@", v8, v13];
  }
  char v11 = PBErrorMake(1, v10, v7);

  return v11;
}

id PBCannotLoadRepresentationError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"Cannot load representation of type %@", a1];
  CFStringRef v6 = PBErrorMake(0, v5, v4);

  return v6;
}

id PBCannotCreateRepresentationError(void *a1, objc_class *a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = a1;
  uint64_t v8 = NSStringFromClass(a2);
  id v9 = [v5 stringWithFormat:@"Cannot represent object of class %@ as representation of type %@", v8, v7];

  id v10 = PBErrorMake(2, v9, v6);

  return v10;
}

id PBCannotCoerceObjectOfClassToObjectOfClassError(objc_class *a1, objc_class *a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = NSStringFromClass(a1);
  uint64_t v8 = NSStringFromClass(a2);
  id v9 = [v5 stringWithFormat:@"Cannot coerce object of class %@ to object of class %@", v7, v8];
  id v10 = PBErrorMake(3, v9, v6);

  return v10;
}

id PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"Cannot coerce representation of type %@ to representation of type %@", a1, a2];
  uint64_t v8 = PBErrorMake(21, v7, v6);

  return v8;
}

id PBIndexOutOfRangeError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "stringWithFormat:", @"Item index %d is out of range.", a1);
  id v6 = PBErrorMake(4, v5, v4);

  return v6;
}

id PBCannotUnarchiveItemCollectionError(void *a1)
{
  return PBErrorMake(5, @"Cannot unarchive item collection.", a1);
}

id PBCannotCopyFileError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    if (v5) {
      [NSString stringWithFormat:@"Cannot copy file at URL %@. Error: %@", v5, v6];
    }
    else {
      [NSString stringWithFormat:@"Cannot copy file. Error: %@", v6, v11];
    }
    goto LABEL_7;
  }
  if (v5)
  {
    [NSString stringWithFormat:@"Cannot copy file at URL %@.", v5, v11];
    uint64_t v8 = LABEL_7:;
    id v9 = PBErrorMake(6, v8, v7);

    goto LABEL_8;
  }
  id v9 = PBErrorMake(6, @"Cannot copy file.", v7);
LABEL_8:

  return v9;
}

id PBCannotConnectToServerError(void *a1)
{
  return PBErrorMake(7, @"Cannot connect to pasteboard server.", a1);
}

id PBCannotUnserializePasteboardNameError(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"Cannot unserialize pasteboard “%@” at URL %@", a1, a2];
  uint64_t v8 = PBErrorMake(8, v7, v6);

  return v8;
}

id PBCannotSerializePasteboardError(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    id v5 = NSString;
    id v6 = a3;
    id v7 = [v5 stringWithFormat:@"Cannot serialize pasteboard “%@” at URL %@", a1, a2];
    uint64_t v8 = PBErrorMake(9, v7, v6);
  }
  else
  {
    id v7 = a3;
    uint64_t v8 = PBErrorMake(9, @"Cannot serialize a pasteboard with no name.", v7);
  }

  return v8;
}

id PBPasteboardNotAvailableError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"Pasteboard UUID %@ is no longer available.", a1];
  id v6 = PBErrorMake(10, v5, v4);

  return v6;
}

id PBPasteboardNameNotAvailableError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"Pasteboard %@ is not available at this time.", a1];
  id v6 = PBErrorMake(10, v5, v4);

  return v6;
}

id PBPasteboardNameInvalidError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"The pasteboard name %@ is not valid.", a1];
  id v6 = PBErrorMake(11, v5, v4);

  return v6;
}

id PBCannotLoadRemotePasteboardError(void *a1)
{
  return PBErrorMake(12, @"Cannot load remote pasteboard contents.", a1);
}

id PBNotAuthorizedError(void *a1)
{
  return PBErrorMake(13, @"Operation not authorized.", a1);
}

id PBDataTransferCancelledError(void *a1)
{
  return PBErrorMake(14, @"Data transfer has been cancelled.", a1);
}

id PBNoLoaderAvailableError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"No loader block available for type %@.", a1];
  id v6 = PBErrorMake(15, v5, v4);

  return v6;
}

id PBCannotOpenInPlaceError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"Cannot open in place file at URL %@", a1];
  id v6 = PBErrorMake(16, v5, v4);

  return v6;
}

id PBCannotCreateTemporaryFile(uint64_t a1, void *a2)
{
  if (a1)
  {
    CFStringRef v3 = NSString;
    id v4 = a2;
    id v5 = [v3 stringWithFormat:@"Cannot create a temporary file. Error: %@", a1];
    id v6 = PBErrorMake(17, v5, v4);
  }
  else
  {
    id v5 = a2;
    id v6 = PBErrorMake(17, @"Cannot create a temporary file.", v5);
  }

  return v6;
}

id PBNotFileURLError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"The URL %@ does not point to a file.", a1];
  id v6 = PBErrorMake(18, v5, v4);

  return v6;
}

id PBCannotDeleteURLError(uint64_t a1, void *a2)
{
  CFStringRef v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"Cannot delete file at URL %@", a1];
  id v6 = PBErrorMake(19, v5, v4);

  return v6;
}

id PBPasteNotAllowedError(void *a1)
{
  return PBErrorMake(20, @"Paste not allowed.", a1);
}

void sub_18D22527C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

void sub_18D225DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D226268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D227F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D2298F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D229A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D229CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D229F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D22A228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D22A750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__47(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x192F9AA30](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
}

void sub_18D22B934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D22D408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D22DE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D22E434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id _transferQueue()
{
  if (qword_1EB3B8690 != -1) {
    dispatch_once(&qword_1EB3B8690, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)_MergedGlobals_8;
  return v0;
}

uint64_t ___transferQueue_block_invoke()
{
  _MergedGlobals_8 = (uint64_t)dispatch_queue_create("com.apple.Pasteboard.transferQueue", 0);
  return MEMORY[0x1F41817F8]();
}

id PBNewDataProviderXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDBDFA68];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_loadRepresentationForItemAtIndex_type_completionBlock_ argumentIndex:1 ofReply:1];

  return v0;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

void CFRelease(CFTypeRef cf)
{
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A0](gray, alpha);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1F40D9A08](colorName);
}

void CGColorRelease(CGColorRef color)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CPTemporaryFileWithUniqueName()
{
  return MEMORY[0x1F4109908]();
}

uint64_t FPURLMightBeInFileProvider()
{
  return MEMORY[0x1F40E0C08]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t UISColorLuminance()
{
  return MEMORY[0x1F4167148]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE40](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1F40D9380]();
}

uint64_t _UTTypeCreateSuggestedFilename()
{
  return MEMORY[0x1F40DEF10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CC060](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCE28](a1);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}