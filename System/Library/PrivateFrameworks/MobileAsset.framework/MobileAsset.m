uint64_t ___preferencesDomainProtectionDispatchQueue_block_invoke()
{
  uint64_t vars8;

  _preferencesDomainProtectionDispatchQueue_preferencesDomainQueue = (uint64_t)dispatch_queue_create("com.apple.MobileAsset.preferencesDomain", 0);
  return MEMORY[0x1F41817F8]();
}

void ___getClientCallbackQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileAsset.client.callback", v2);
  v1 = (void *)_getClientCallbackQueue_queue;
  _getClientCallbackQueue_queue = (uint64_t)v0;
}

void sub_1B275D640(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id getPlistString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  v5 = getPlistEntryOfClass(v4, v3);

  return v5;
}

id getPlistNumber(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  v5 = getPlistEntryOfClass(v4, v3);

  return v5;
}

id getPlistData(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  v5 = getPlistEntryOfClass(v4, v3);

  return v5;
}

id plistDecodeClasses()
{
  if (plistDecodeClasses_once != -1) {
    dispatch_once(&plistDecodeClasses_once, &__block_literal_global_1);
  }
  dispatch_queue_t v0 = (void *)plistDecodeClasses__plistDecodeClasses;
  return v0;
}

id getPlistDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9 = v4;
  if (v3 && v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v14 = getPlistEntryOfClass(v3, v9);
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"getPlistDictionary", @"%s: Unable to extract plist object for key %@ from dict", v10, v11, v12, v13, (uint64_t)"getPlistDictionary");
    }
    _MobileAssetLog(0, 3, (uint64_t)"getPlistDictionary", @"%s: Extracted object for key %@ is invalid/not a dictionary", v15, v16, v17, v18, (uint64_t)"getPlistDictionary");
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"getPlistDictionary", @"%s: Invalid options", v5, v6, v7, v8, (uint64_t)"getPlistDictionary");
  }
  v14 = 0;
LABEL_9:

  return v14;
}

uint64_t getPlistNumberAsBool(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = getPlistEntryOfClass(v4, v3);

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

id getPlistEntryOfClass(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = 0;
  if (!v4 || (isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v6 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = [v3 objectForKey:v4];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }

LABEL_11:
  return v6;
}

void _MobileAssetLog(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  if (gForceNSLog | gForceStdOut)
  {
    *(void *)buf = &a9;
    uint64_t v12 = [[NSString alloc] initWithFormat:v11 arguments:&a9];
    uint64_t v13 = (void *)v12;
    v14 = @"Unable to allocate log message";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    uint64_t v15 = v14;

    if (gForceNSLog) {
      NSLog(&stru_1F0A7A1B0.isa, v15);
    }
    if (gForceStdOut)
    {
      uint64_t v16 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
      uint64_t v17 = [(__CFString *)v15 dataUsingEncoding:2];
      [v16 writeData:v17];

      uint64_t v18 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
      v19 = [@"\n" dataUsingEncoding:2];
      [v18 writeData:v19];
    }
  }
  if (!gExclusivelyNSLog)
  {
    if (a2 == 7)
    {
      v24 = logDebug();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

      if (v25)
      {
        *(void *)buf = &a9;
        v22 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
        v23 = logDebug();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          _MobileAssetLog_cold_2();
        }
        goto LABEL_21;
      }
    }
    else if (a2 == 3)
    {
      v20 = logError();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (v21)
      {
        *(void *)buf = &a9;
        v22 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
        v23 = logError();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          _MobileAssetLog_cold_1();
        }
LABEL_21:
      }
    }
    else
    {
      v26 = logInfo();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        v22 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
        v23 = logInfo();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = a3;
          __int16 v29 = 2114;
          v30 = v22;
          _os_log_impl(&dword_1B275B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
  }
}

id logInfo()
{
  if (logInfo_logInfoOnce != -1) {
    dispatch_once(&logInfo_logInfoOnce, &__block_literal_global_13);
  }
  dispatch_queue_t v0 = (void *)logInfo_infoLog;
  return v0;
}

id _getCommsManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (_getCommsManager_commsOnce != -1) {
    dispatch_once(&_getCommsManager_commsOnce, &__block_literal_global_907);
  }
  uint64_t v8 = (void *)_getCommsManager_commsManager;
  if (!_getCommsManager_commsManager)
  {
    _MobileAssetLog(0, 6, (uint64_t)"_getCommsManager", @"commsManager is nil, all xpc communication will fail", a5, a6, a7, a8, v10);
    uint64_t v8 = (void *)_getCommsManager_commsManager;
  }
  return v8;
}

void sub_1B275FBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id logError()
{
  if (logError_logErrorOnce != -1) {
    dispatch_once(&logError_logErrorOnce, &__block_literal_global_269);
  }
  dispatch_queue_t v0 = (void *)logError_infoError;
  return v0;
}

void _MobileAssetLog_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B275B000, v0, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", v1, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id stringWithoutNewlines(uint64_t a1)
{
  uint64_t v1 = [NSString stringWithFormat:@"%@", a1];
  uint64_t v2 = [v1 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  return v2;
}

__CFString *stringForMAQueryResult(unint64_t a1)
{
  if (a1 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAQueryResult%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6004448[a1];
  }
  return v1;
}

id getRepositoryPath(void *a1)
{
  id v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"getRepositoryPath", @"ERROR: Invalid string passed to %s", v1, v2, v3, v4, (uint64_t)"getRepositoryPath");
    id v6 = 0;
  }

  return v6;
}

void sub_1B2765CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B2765E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _MAsendDownloadMetaData(void *a1, void *a2, void *a3)
{
  id v15 = a1;
  id v5 = a2;
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    if (v15)
    {
      id v8 = v15;
      xpc_dictionary_set_string(v7, "AssetType", (const char *)[v8 UTF8String]);
      xpc_dictionary_set_uint64(v7, "messageAction", 2uLL);
      v9 = [v5 encodeAsPlist];
      if (addObjectToMessage(v9, v7, "downloadOptionsLength", "downloadOptions"))
      {
        int64_t v14 = 32;
      }
      else
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadMetaData", @"Bad options for asset type: %@ not sending message", v10, v11, v12, v13, (uint64_t)v8);
        int64_t v14 = 22;
      }
    }
    else
    {
      v9 = 0;
      int64_t v14 = 19;
    }
  }
  else
  {
    v9 = 0;
    int64_t v14 = 24;
  }
  sendIfNecessary(v14, v7, 0, v6);
}

uint64_t addObjectToMessage(void *a1, void *a2, const char *a3, const char *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v13 = v8;
  if (!v7 || !v8 || !a3 || !a4)
  {
    _MobileAssetLog(0, 6, (uint64_t)"addObjectToMessage", @"MobileAsset addObjectToMessage has nil parameter", v9, v10, v11, v12, v21);
    id v16 = 0;
    id v15 = 0;
LABEL_11:
    uint64_t v19 = 0;
    goto LABEL_12;
  }
  int64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  id v15 = v14;
  if (!v14)
  {
    id v16 = 0;
    goto LABEL_11;
  }
  [v14 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];
  id v16 = [v15 encodedData];

  if (!v16) {
    goto LABEL_11;
  }
  uint64_t v17 = [v15 encodedData];
  id v16 = v17;
  if (!v17) {
    goto LABEL_11;
  }
  size_t v18 = [v17 length];
  id v16 = v16;
  xpc_dictionary_set_data(v13, a4, (const void *)[v16 bytes], v18);
  xpc_dictionary_set_double(v13, a3, (double)v18);
  uint64_t v19 = 1;
LABEL_12:

  return v19;
}

void sendIfNecessary(int64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = v9;
  if (!v7)
  {
    uint64_t v19 = _getClientCallbackQueue();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __sendIfNecessary_block_invoke_2;
    v22[3] = &unk_1E60042B8;
    id v23 = 0;
    id v24 = v17;
    dispatch_async(v19, v22);

    v20 = v24;
LABEL_6:

    goto LABEL_7;
  }
  if (a1 != 32)
  {
    xpc_dictionary_set_int64(v7, "Result", a1);
    uint64_t v21 = _getClientCallbackQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __sendIfNecessary_block_invoke;
    block[3] = &unk_1E60042B8;
    id v27 = v17;
    id v26 = v7;
    dispatch_async(v21, block);

    v20 = v27;
    goto LABEL_6;
  }
  size_t v18 = _getCommsManager((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  [v18 sendAsync:v7 clientHandler:v17 taskDescriptor:v8];

LABEL_7:
}

void _MAsendQueryMetaData(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    id v9 = 0;
    int64_t v18 = 6;
LABEL_17:
    xpc_dictionary_set_int64(v8, "Result", v18);
    v30 = _getClientCallbackQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___MAsendQueryMetaData_block_invoke;
    block[3] = &unk_1E60042B8;
    id v33 = v7;
    id v32 = v8;
    dispatch_async(v30, block);

    __int16 v29 = v33;
    goto LABEL_18;
  }
  if (v6)
  {
    id v9 = [v6 queryParams];

    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28DB0];
      uint64_t v11 = [v6 queryParams];
      id v34 = 0;
      id v9 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v34];
      id v12 = v34;

      if (!v9 || v12)
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendQueryMetaData", @"could not encode query params: %@", v13, v14, v15, v16, (uint64_t)v12);

        int64_t v18 = 8;
        goto LABEL_17;
      }
      uint64_t v17 = (const char *)[@"QueryParams" UTF8String];
      id v9 = v9;
      xpc_dictionary_set_data(v8, v17, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    }
    if (!v5) {
      goto LABEL_15;
    }
  }
  else
  {
    id v9 = 0;
    if (!v5)
    {
LABEL_15:
      int64_t v18 = 7;
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v19 = [v6 purpose];

  if (v19)
  {
    id v20 = [v6 purpose];
    xpc_dictionary_set_string(v8, "Purpose", (const char *)[v20 UTF8String]);
  }
  xpc_dictionary_set_string(v8, "AssetType", (const char *)[v5 UTF8String]);
  xpc_dictionary_set_uint64(v8, "returnAssetTypes", [v6 returnTypes]);
  xpc_dictionary_set_uint64(v8, "messageAction", 1uLL);
  xpc_dictionary_set_BOOL(v8, "doNotBlockBeforeFirstUnlock", [v6 doNotBlockBeforeFirstUnlock]);
  __int16 v29 = _getCommsManager(v21, v22, v23, v24, v25, v26, v27, v28);
  [v29 sendAsync:v8 clientHandler:v7 taskDescriptor:0];
LABEL_18:
}

void sub_1B27667C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B2767584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2767708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1B3EAAEB0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
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

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __logInfo_block_invoke()
{
  logInfo_infoLog = (uint64_t)os_log_create("com.apple.mobileassetd", "Notice");
  return MEMORY[0x1F41817F8]();
}

void *ASServerURLForAssetType(uint64_t a1, void *a2)
{
  id v14 = 0;
  uint64_t v3 = MAGetServerUrl(a1, &v14);
  id v4 = v14;
  id v5 = v4;
  if (v3)
  {
    if (!a2) {
      goto LABEL_7;
    }
    id v6 = stringForMAOperationResult(v3);
    id v12 = MAError(@"com.apple.MobileAssetError", v3, @"%@", v7, v8, v9, v10, v11, (uint64_t)v6);
    _ASErrorForMAError(v12);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    a2 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    goto LABEL_7;
  }
  a2 = 0;
LABEL_7:

  return a2;
}

id _MAsendUpdateClientAccessGetPathWithPurposeSync(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  if (v14)
  {
    id v15 = v7;
    xpc_dictionary_set_string(v14, "AssetType", (const char *)[v15 UTF8String]);
    xpc_dictionary_set_string(v14, "AssetId", (const char *)[v8 UTF8String]);
    xpc_dictionary_set_string(v14, "localAssetPath", (const char *)[@"true" UTF8String]);
    xpc_dictionary_set_uint64(v14, "assetState", a3);
    xpc_dictionary_set_uint64(v14, "messageAction", 0x15uLL);
    if (v9) {
      xpc_dictionary_set_string(v14, "Purpose", (const char *)[v9 UTF8String]);
    }
    unint64_t v44 = 4;
    uint64_t v24 = _getCommsManager(v16, v17, v18, v19, v20, v21, v22, v23);
    uint64_t v25 = [NSString stringWithUTF8String:"_MAsendUpdateClientAccessGetPathWithPurposeSync"];
    uint64_t v26 = [v24 sendSync:v14 gettingResponseCode:&v44 codeForXpcError:1 loggingName:v25];

    if (v26)
    {
      unint64_t v27 = v44;
      uint64_t v43 = (uint64_t)v15;
      if (v44)
      {
        uint64_t v28 = NSString;
        __int16 v29 = stringForMAOperationResult(v44);
        v30 = [v28 stringWithFormat:@", unable to update last access time %ld (%@)", v27, v29];
      }
      else
      {
        v30 = &stru_1F0A75970;
      }
      xpc_dictionary_get_int64(v26, "assetDataExistsPosNeg");
      string = xpc_dictionary_get_string(v26, "localAssetPath");
      if (string)
      {
        uint64_t v31 = [NSString stringWithUTF8String:string];
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendUpdateClientAccessGetPathWithPurposeSync", @"getLocalPath asset %@ %@ local path is '%@'%@%@", v37, v38, v39, v40, v43);
        if (usingCentralizedCachedelete()) {
          markAssetPurgeable(v31);
        }
      }
      else
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendUpdateClientAccessGetPathWithPurposeSync", @"getLocalPath asset %@ %@%@%@", v33, v34, v35, v36, v43);
        uint64_t v31 = 0;
      }
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendUpdateClientAccessGetPathWithPurposeSync", @"getLocalPath Could not create xpc message", v10, v11, v12, v13, v42);
    uint64_t v31 = 0;
  }

  return v31;
}

uint64_t usingCentralizedCachedelete()
{
  if (usingCentralizedCachedelete_onceToken != -1) {
    dispatch_once(&usingCentralizedCachedelete_onceToken, &__block_literal_global_1224);
  }
  return usingCentralizedCachedelete_eapfsEnabled;
}

unint64_t _MAclientSendGetServerUrl(void *a1, void *a2)
{
  id v7 = a1;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", @"MobileAsset _MAclientSendGetServerUrl passed invalid assetType (must be non-nil NSString)", v3, v4, v5, v6, v40);
    uint64_t v28 = 0;
    unint64_t v42 = 2;
    if (!a2) {
      goto LABEL_9;
    }
LABEL_8:
    *a2 = v28;
    goto LABEL_9;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = (const char *)[v7 UTF8String];
  if (v9)
  {
    xpc_dictionary_set_string(v8, "AssetType", v9);
    xpc_dictionary_set_uint64(v8, "messageAction", 0x24uLL);
    unint64_t v42 = 4;
    uint64_t v22 = _getCommsManager(v14, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v23 = [v22 sendSync:v8 gettingResponseCode:&v42 codeForXpcError:1 loggingName:@"MAGetServerUrl"];

    if (v42)
    {
      uint64_t v28 = 0;
    }
    else if (v23)
    {
      string = xpc_dictionary_get_string(v23, "BaseUrlKey");
      if (string)
      {
        uint64_t v28 = [NSString stringWithUTF8String:string];
      }
      else
      {
        _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", @"MobileAsset _MAclientSendGetServerUrl found a null cstring for MA_BASE_URL_KEY", v36, v37, v38, v39, v40);
        uint64_t v28 = 0;
        unint64_t v42 = 2;
      }
    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", @"MAGetServerUrl returned nil reply with MAOperationSuccessful. Setting serverUrl to empty string.", v24, v25, v26, v27, v40);
      uint64_t v28 = &stru_1F0A75970;
    }
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", @"MobileAsset _MAclientSendGetServerUrl could not read the assetType string", v10, v11, v12, v13, v40);
    uint64_t v28 = 0;
    unint64_t v42 = 2;
  }

  if (a2) {
    goto LABEL_8;
  }
LABEL_9:
  v41 = stringForMAOperationResult(v42);
  _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendGetServerUrl", @"MobileAsset _MAclientSendGetServerUrl for %@ response %lld (%@) -- Base URL: %@", v29, v30, v31, v32, (uint64_t)v7);

  unint64_t v33 = v42;
  return v33;
}

void ___getCommsManager_block_invoke()
{
  id v4 = [NSString stringWithUTF8String:"com.apple.mobileassetd.v2"];
  os_log_t v0 = [MAXpcManager alloc];
  uint64_t v1 = _getClientCallbackQueue();
  uint64_t v2 = [(MAXpcManager *)v0 initWithServiceName:v4 callbackQueue:v1];
  uint64_t v3 = (void *)_getCommsManager_commsManager;
  _getCommsManager_commsManager = v2;
}

id _getClientCallbackQueue()
{
  if (_getClientCallbackQueue_once != -1) {
    dispatch_once(&_getClientCallbackQueue_once, &__block_literal_global_959);
  }
  os_log_t v0 = (void *)_getClientCallbackQueue_queue;
  return v0;
}

__CFString *stringForMAOperationResult(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAOperationResult%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60046F0[a1];
  }
  return v1;
}

__CFString *stringForMADownloadResult(unint64_t a1)
{
  if (a1 >= 0x56)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MADownloadResult%llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6004720[a1];
  }
  return v1;
}

BOOL isDownloadResultFailure(uint64_t a1)
{
  if (a1) {
    BOOL v1 = a1 == 14;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

__CFString *errorStringForMADownloadResult(unint64_t a1)
{
  if (a1 >= 0x56)
  {
    uint64_t v3 = NSString;
    id v4 = stringForMADownloadResult(a1);
    uint64_t v2 = [v3 stringWithFormat:@"Download failed due to Error %lld (%@).", a1, v4];
  }
  else
  {
    uint64_t v2 = off_1E6004B88[a1];
  }
  return v2;
}

id MAErrorForDownloadResultWithUnderlying(unint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a2;
  id v12 = a3;
  if (v12)
  {
    uint64_t v13 = [[NSString alloc] initWithFormat:v12 arguments:&a9];
  }
  else
  {
    uint64_t v13 = errorStringForMADownloadResult(a1);
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = objc_opt_new();
  uint64_t v16 = v15;
  if ((uint64_t)a1 <= 27)
  {
    if (a1 - 14 < 2 || !a1 || a1 == 10)
    {
LABEL_10:
      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"usableDownload"];
      if (a1 == 10 || a1 == 28)
      {
LABEL_12:
        [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"requeryIsHelpful"];
        if (a1 <= 0x2D && ((1 << a1) & 0x260000000000) != 0) {
LABEL_14:
        }
          [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"checkServer"];
      }
    }
LABEL_15:
    if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 0x50) {
      [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"timeoutWithDetail"];
    }
    uint64_t v17 = @"checkFilesystemState";
    uint64_t v18 = @"checkNetwork";
    switch(a1)
    {
      case 4uLL:
      case 7uLL:
      case 0x21uLL:
      case 0x26uLL:
      case 0x4CuLL:
        goto LABEL_25;
      case 0xBuLL:
      case 0xCuLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x27uLL:
      case 0x4AuLL:
        goto LABEL_18;
      case 0x33uLL:
      case 0x34uLL:
      case 0x35uLL:
      case 0x37uLL:
      case 0x38uLL:
      case 0x50uLL:
      case 0x51uLL:
      case 0x52uLL:
      case 0x53uLL:
        [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"checkTimeoutConditions"];
        char v19 = a1 - 33;
        if (a1 - 33 > 0x2B) {
          goto LABEL_26;
        }
        if (((1 << v19) & 0xDB9200000) != 0)
        {
          uint64_t v18 = @"checkNetwork";
        }
        else
        {
          if (((1 << v19) & 0x80000000021) != 0) {
            goto LABEL_24;
          }
          if (a1 != 74) {
            goto LABEL_26;
          }
LABEL_18:
          uint64_t v18 = @"checkClient";
        }
LABEL_22:
        [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v18];
        if (a1 - 33 > 0x2B || ((1 << (a1 - 33)) & 0x80000000021) == 0) {
          goto LABEL_26;
        }
LABEL_24:
        uint64_t v17 = @"checkFilesystemState";
        goto LABEL_25;
      case 0x36uLL:
      case 0x39uLL:
      case 0x3CuLL:
      case 0x3DuLL:
      case 0x3EuLL:
      case 0x40uLL:
      case 0x41uLL:
      case 0x43uLL:
      case 0x44uLL:
        goto LABEL_22;
      default:
        goto LABEL_26;
    }
  }
  switch(a1)
  {
    case 0x1CuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x24uLL:
    case 0x30uLL:
      goto LABEL_12;
    case 0x1DuLL:
      goto LABEL_10;
    case 0x1EuLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2EuLL:
    case 0x2FuLL:
      goto LABEL_15;
    case 0x25uLL:
      uint64_t v17 = @"checkSpaceNeeded";
      goto LABEL_25;
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2DuLL:
      goto LABEL_14;
    default:
      if (a1 != 70) {
        goto LABEL_15;
      }
      uint64_t v17 = @"checkClockAndCerts";
LABEL_25:
      [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v17];
      break;
  }
LABEL_26:
  if (isDownloadResultSuggestingTryAgainLater(a1)) {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"tryAgainLater"];
  }
  if (a1 <= 0x18 && ((1 << a1) & 0x1002306) != 0) {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"retryWithBackoff"];
  }
  if (isDownloadResultSuggestingCheckConfiguration(a1)) {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"checkConfiguration"];
  }
  if (a1 <= 0x23)
  {
    if (((1 << a1) & 0x900000108) != 0)
    {
      uint64_t v20 = @"generic";
      goto LABEL_40;
    }
    if (a1 == 18)
    {
      uint64_t v20 = @"pallasNoPMVMatchFound";
      goto LABEL_40;
    }
  }
  if (a1 != 75) {
    goto LABEL_41;
  }
  uint64_t v20 = @"checkSSO";
LABEL_40:
  [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v20];
LABEL_41:
  uint64_t v21 = MAErrorWithUnderlyingUserInfoAndString(@"com.apple.MobileAssetError.Download", a1, v11, v16, v14);

  return v21;
}

BOOL isDownloadResultSuggestingTryAgainLater(uint64_t a1)
{
  BOOL result = 1;
  if ((unint64_t)(a1 - 16) > 0x37 || ((1 << (a1 - 16)) & 0x800000800C4007) == 0) {
    return a1 == 3;
  }
  return result;
}

BOOL isDownloadResultSuggestingCheckConfiguration(uint64_t a1)
{
  BOOL result = 1;
  if ((unint64_t)(a1 - 25) > 0x34 || ((1 << (a1 - 25)) & 0x158246032C8007) == 0) {
    return (unint64_t)(a1 - 5) < 2;
  }
  return result;
}

id MAErrorWithUnderlyingUserInfoAndString(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = v13;
  if (v12) {
    [v13 setObject:v12 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v10) {
    [v14 setObject:v10 forKey:*MEMORY[0x1E4F28A50]];
  }
  if (v11)
  {
    uint64_t v25 = a2;
    id v26 = v10;
    id v27 = v9;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v21 = (void *)MEMORY[0x1B3EAACB0]();
          uint64_t v22 = [v15 objectForKey:v20];
          [v14 setObject:v22 forKey:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }

    id v10 = v26;
    id v9 = v27;
    a2 = v25;
  }
  uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:a2 userInfo:v14];

  return v23;
}

uint64_t isQueryResultFailure(unint64_t a1)
{
  return (a1 > 0xE) | (0x3FFAu >> a1) & 1;
}

uint64_t __usingCentralizedCachedelete_block_invoke()
{
  uint64_t result = _MAPreferencesIsCentralizedCacheDeleteEnabled();
  if (result)
  {
    uint64_t result = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/filesystems");
    if (result)
    {
      io_object_t v1 = result;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(result, @"e-apfs", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      if (CFProperty)
      {
        CFRelease(CFProperty);
        usingCentralizedCachedelete_eapfsEnabled = 1;
      }
      return IOObjectRelease(v1);
    }
  }
  else
  {
    usingCentralizedCachedelete_eapfsEnabled = 0;
  }
  return result;
}

uint64_t _MAPreferencesIsCentralizedCacheDeleteEnabled()
{
  if (_MAPreferencesIsCentralizedCacheDeleteEnabled_onceToken != -1) {
    dispatch_once(&_MAPreferencesIsCentralizedCacheDeleteEnabled_onceToken, &__block_literal_global_1175);
  }
  return _MAPreferencesIsCentralizedCacheDeleteEnabled__centralizedCacheDeleteEnabled;
}

uint64_t _MAPreferencesGetAppBooleanValue(void *a1, unsigned char *a2)
{
  uint64_t v3 = _MAPreferencesCopyValue(a1);
  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v5 = isKindOfClass ^ 1;
    char v6 = isKindOfClass & 1;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v6 = 0;
  char v5 = 1;
  if (a2) {
LABEL_3:
  }
    *a2 = v6;
LABEL_4:
  if (v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v3 BOOLValue];
  }

  return v7;
}

id _MAPreferencesCopyValue(void *a1)
{
  id v1 = a1;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__1;
  id v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  if (v1)
  {
    uint64_t v2 = _preferencesDomainProtectionDispatchQueue();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___MAPreferencesCopyValue_block_invoke;
    v5[3] = &unk_1E6004F80;
    uint64_t v7 = &v8;
    id v6 = v1;
    dispatch_sync(v2, v5);

    id v3 = (id)v9[5];
  }
  else
  {
    id v3 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v3;
}

id _preferencesDomainProtectionDispatchQueue()
{
  if (_preferencesDomainProtectionDispatchQueue_preferencesDomainQueueOnce != -1) {
    dispatch_once(&_preferencesDomainProtectionDispatchQueue_preferencesDomainQueueOnce, &__block_literal_global_6);
  }
  os_log_t v0 = (void *)_preferencesDomainProtectionDispatchQueue_preferencesDomainQueue;
  return v0;
}

void sub_1B276B4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1B276BE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B276C834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B276D1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B276DB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B276E53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B276EEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  return a2;
}

id _getClientInternalStateQueue()
{
  if (_getClientInternalStateQueue_stateOnce != -1) {
    dispatch_once(&_getClientInternalStateQueue_stateOnce, &__block_literal_global_0);
  }
  os_log_t v0 = (void *)_getClientInternalStateQueue_stateQueue;
  return v0;
}

void ___getClientInternalStateQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileAsset.client.state", v2);
  id v1 = (void *)_getClientInternalStateQueue_stateQueue;
  _getClientInternalStateQueue_stateQueue = (uint64_t)v0;
}

uint64_t isValidObjectForAssetTypesArray(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v12 = v7;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v6);
          }
          if (*(void *)(*((void *)&v17 + 1) + 8 * i))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              continue;
            }
          }
          _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForAssetTypesArray", @"Asset type in array is not a string", v8, v9, v10, v11, v17);
          uint64_t v15 = 0;
          goto LABEL_16;
        }
        uint64_t v12 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v15 = 1;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v15 = 1;
    }
LABEL_16:
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForAssetTypesArray", @"Asset types is not an array", v1, v2, v3, v4, v17);
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t isValidObjectForPreservedIdsDict(void *a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", @"Preserved IDs type is not an dictionary", v1, v2, v3, v4, v33);
    uint64_t v31 = 0;
    goto LABEL_29;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v7)
  {
    uint64_t v31 = 1;
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v42;
  while (2)
  {
    uint64_t v10 = 0;
    uint64_t v35 = v8;
    do
    {
      if (*(void *)v42 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8 * v10);
      uint64_t v16 = (void *)MEMORY[0x1B3EAACB0]();
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", @"Preserved IDs key is not a string", v12, v13, v14, v15, v33);
LABEL_26:
        uint64_t v31 = 0;
        goto LABEL_28;
      }
      uint64_t v21 = [v6 objectForKey:v11];
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", @"Preserved IDs value is not an array for: %@", v17, v18, v19, v20, v11);

        goto LABEL_26;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v23)
      {
        uint64_t v28 = v23;
        uint64_t v29 = *(void *)v38;
        id v36 = v6;
        uint64_t v34 = v9;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(v22);
            }
            if (*(void *)(*((void *)&v37 + 1) + 8 * i))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                continue;
              }
            }
            _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", @"Preserved ID is not a string: %@ %@", v24, v25, v26, v27, v11);

            id v6 = v36;
            goto LABEL_26;
          }
          uint64_t v28 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
          id v6 = v36;
          uint64_t v9 = v34;
          if (v28) {
            continue;
          }
          break;
        }
      }

      ++v10;
    }
    while (v10 != v35);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    uint64_t v31 = 1;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_28:

LABEL_29:
  return v31;
}

id getLoadClassFromMessage(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v10 = a2;
  size_t length = 0;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v10 length])
  {
    _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", @"load key is invalid skipping: %@", v6, v7, v8, v9, (uint64_t)v10);
LABEL_10:
    uint64_t v23 = 0;
    id v22 = 0;
    uint64_t v21 = 0;
    goto LABEL_11;
  }
  id v11 = v10;
  data = xpc_dictionary_get_data(v5, (const char *)[v11 UTF8String], &length);
  if (!data)
  {
    _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", @"load rawData is null skipping: %@", v13, v14, v15, v16, (uint64_t)v11);
    goto LABEL_10;
  }
  uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  if (v21)
  {
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v21 error:0];
    uint64_t v23 = [v22 decodePropertyListForKey:*MEMORY[0x1E4F284E8]];
    [v22 finishDecoding];
    if (v23)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", @"load object is not a %@: %@", v28, v29, v30, v31, a3);

        uint64_t v23 = 0;
      }
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", @"load object is null skipping: %@", v24, v25, v26, v27, (uint64_t)v11);
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", @"load data is null skipping: %@", v17, v18, v19, v20, (uint64_t)v11);
    uint64_t v23 = 0;
    id v22 = 0;
  }
LABEL_11:
  id v32 = v23;

  return v32;
}

id getLoadDictionaryFromMessage(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = getLoadClassFromMessage(v4, v3, v5);

  return v6;
}

uint64_t sendOperationSync(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v31 = 4;
  uint64_t v7 = (void *)MEMORY[0x1B3EAACB0]();
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  if (v12)
  {
    if (!v5)
    {
LABEL_5:
      xpc_dictionary_set_uint64(v12, "messageAction", a2);
      uint64_t v21 = _getCommsManager(v13, v14, v15, v16, v17, v18, v19, v20);
      id v22 = (id)[v21 sendSync:v12 gettingResponseCode:&v31 codeForXpcError:1 loggingName:v6];

      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      xpc_dictionary_set_string(v12, "AssetType", (const char *)[v5 UTF8String]);
      goto LABEL_5;
    }
    uint64_t v30 = stringForMAXpcCommand(a2);
    _MobileAssetLog(0, 6, (uint64_t)"sendOperationSync", @"MobileAsset %@ sendOperationSync %lld (%@) given a non-NSString assetType", v23, v24, v25, v26, (uint64_t)v6);

    uint64_t v31 = 2;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"sendOperationSync", @"Could not create xpc dictionary, returning MAOperationXpcError", v8, v9, v10, v11, v29);
  }
LABEL_8:

  if (v12) {
    uint64_t v27 = v31;
  }
  else {
    uint64_t v27 = 1;
  }

  return v27;
}

void _MAPurgeAll(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    int64_t v21 = 9;
    goto LABEL_12;
  }
  if (!isValidObjectForAssetTypesArray(v7)
    || !addObjectToMessage(v7, v11, "purgeAssetTypeListLength", "purgeAssetTypeList")
    || v9
    && (!isValidObjectForPreservedIdsDict(v9)
     || !addObjectToMessage(v9, v11, "purgeAssetTypePreservingListLength", "purgeAssetTypePreservingList")))
  {
    int64_t v21 = 10;
LABEL_12:
    xpc_dictionary_set_int64(v11, "Result", v21);
    id v22 = _getClientCallbackQueue();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___MAPurgeAll_block_invoke;
    v23[3] = &unk_1E60042B8;
    id v25 = v10;
    id v24 = v11;
    dispatch_async(v22, v23);

    goto LABEL_13;
  }
  xpc_dictionary_set_uint64(v11, "messageAction", 0x18uLL);
  if (v8) {
    xpc_dictionary_set_string(v11, "Purpose", (const char *)[v8 UTF8String]);
  }
  uint64_t v20 = _getCommsManager(v12, v13, v14, v15, v16, v17, v18, v19);
  [v20 sendAsync:v11 clientHandler:v10 taskDescriptor:0];

LABEL_13:
}

void _MAPurgeCatalogs(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    int64_t v18 = 9;
LABEL_8:
    xpc_dictionary_set_int64(v8, "Result", v18);
    uint64_t v19 = _getClientCallbackQueue();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ___MAPurgeCatalogs_block_invoke;
    v20[3] = &unk_1E60042B8;
    id v22 = v7;
    id v21 = v8;
    dispatch_async(v19, v20);

    goto LABEL_9;
  }
  if (!addObjectToMessage(v5, v8, "purgeAssetTypeListLength", "purgeAssetTypeList"))
  {
    int64_t v18 = 10;
    goto LABEL_8;
  }
  xpc_dictionary_set_uint64(v8, "messageAction", 0x1AuLL);
  if (v6) {
    xpc_dictionary_set_string(v8, "Purpose", (const char *)[v6 UTF8String]);
  }
  uint64_t v17 = _getCommsManager(v9, v10, v11, v12, v13, v14, v15, v16);
  [v17 sendAsync:v8 clientHandler:v7 taskDescriptor:0];

LABEL_9:
}

void _MAsendCancelDownloadMetaData(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  id v7 = v6;
  if (!v4 || !v6)
  {
    if (!v6)
    {
LABEL_7:
      uint64_t v17 = _getClientCallbackQueue();
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = ___MAsendCancelDownloadMetaData_block_invoke;
      v18[3] = &unk_1E60042B8;
      id v20 = v5;
      id v19 = v7;
      dispatch_async(v17, v18);

      goto LABEL_8;
    }
LABEL_6:
    xpc_dictionary_set_int64(v7, "Result", 4);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  xpc_dictionary_set_string(v7, "AssetType", (const char *)[v4 UTF8String]);
  xpc_dictionary_set_uint64(v7, "messageAction", 0x1CuLL);
  uint64_t v16 = _getCommsManager(v8, v9, v10, v11, v12, v13, v14, v15);
  [v16 sendAsync:v7 clientHandler:v5 taskDescriptor:0];

LABEL_8:
}

uint64_t _MAsendSetPallasEnabled(void *a1, BOOL a2)
{
  id v3 = a1;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xpc_dictionary_set_string(v4, "AssetType", (const char *)[v3 UTF8String]);
    }
    xpc_dictionary_set_BOOL(v4, "pallasEnabled", a2);
    xpc_dictionary_set_uint64(v4, "messageAction", 0x21uLL);
    uint64_t v17 = 4;
    uint64_t v13 = _getCommsManager(v5, v6, v7, v8, v9, v10, v11, v12);
    id v14 = (id)[v13 sendSync:v4 gettingResponseCode:&v17 codeForXpcError:1 loggingName:@"MASetPallasEnabled"];

    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v15 = 1;
    uint64_t v17 = 1;
  }

  return v15;
}

uint64_t _MAsendGetPallasEnabled(void *a1, BOOL *a2)
{
  id v3 = a1;
  uint64_t v18 = 4;
  if (a2) {
    *a2 = 0;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xpc_dictionary_set_string(v4, "AssetType", (const char *)[v3 UTF8String]);
    }
    xpc_dictionary_set_uint64(v4, "messageAction", 0x20uLL);
    uint64_t v13 = _getCommsManager(v5, v6, v7, v8, v9, v10, v11, v12);
    id v14 = [v13 sendSync:v4 gettingResponseCode:&v18 codeForXpcError:1 loggingName:@"MAGetPallasEnabled"];

    if (!v18)
    {
      BOOL v15 = xpc_dictionary_get_BOOL(v14, "pallasEnabled");
      if (a2) {
        *a2 = v15;
      }
    }
  }
  else
  {
    id v14 = 0;
    uint64_t v18 = 1;
  }
  uint64_t v16 = v18;

  return v16;
}

uint64_t _MAsendSetPallasAudience(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v18 = 4;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5) {
    goto LABEL_8;
  }
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      xpc_dictionary_set_string(v5, "pallasAudience", (const char *)[v3 UTF8String]);
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v16 = 1;
    uint64_t v18 = 1;
    goto LABEL_9;
  }
LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    xpc_dictionary_set_string(v5, "AssetType", (const char *)[v4 UTF8String]);
  }
  xpc_dictionary_set_uint64(v5, "messageAction", 0xAuLL);
  id v14 = _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
  id v15 = (id)[v14 sendSync:v5 gettingResponseCode:&v18 codeForXpcError:1 loggingName:@"MASetPallasAudience"];

  uint64_t v16 = v18;
LABEL_9:

  return v16;
}

__CFString *_MAsendGetPallasAudience(void *a1)
{
  id v1 = a1;
  uint64_t v21 = 4;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xpc_dictionary_set_string(v6, "AssetType", (const char *)[v1 UTF8String]);
    }
    xpc_dictionary_set_uint64(v6, "messageAction", 0x14uLL);
    id v15 = _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v16 = [v15 sendSync:v6 gettingResponseCode:&v21 codeForXpcError:1 loggingName:@"MAGetPallasAudience"];

    if (v21)
    {
      string = 0;
    }
    else
    {
      string = (void *)xpc_dictionary_get_string(v16, "pallasAudience");
      if (string)
      {
        string = [NSString stringWithUTF8String:string];
      }
    }
    uint64_t v18 = string;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendGetPallasAudience", @"Could not create xpc dictionary, returning empty string", v2, v3, v4, v5, v20);
    uint64_t v18 = &stru_1F0A75970;
  }

  return v18;
}

uint64_t _MAsendSetPallasUrl(void *a1)
{
  return _MAsendSetPallasUrlForType(a1, 0);
}

uint64_t _MAsendSetPallasUrlForType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xpc_dictionary_set_string(v9, "AssetType", (const char *)[v4 UTF8String]);
    }
  }
  if (v9)
  {
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        _MobileAssetLog(0, 3, (uint64_t)"_MAsendSetPallasUrlForType", @"Cannot set Pallas URL to a class that is not NSURL (was given an %@), returning MAOperationInvalid.", v24, v25, v26, v27, (uint64_t)v23);

        uint64_t v11 = 5;
        goto LABEL_12;
      }
      id v10 = [v3 absoluteString];
      xpc_dictionary_set_string(v9, "pallasUrl", (const char *)[v10 UTF8String]);
    }
    else
    {
      xpc_dictionary_set_BOOL(v9, "serverOverrideClear", 1);
    }
    xpc_dictionary_set_uint64(v9, "messageAction", 9uLL);
    uint64_t v30 = 4;
    uint64_t v20 = _getCommsManager(v12, v13, v14, v15, v16, v17, v18, v19);
    id v21 = (id)[v20 sendSync:v9 gettingResponseCode:&v30 codeForXpcError:1 loggingName:@"MASetPallasUrl"];

    uint64_t v11 = v30;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendSetPallasUrlForType", @"Could not create xpc dictionary, returning MAOperationXpcError", v5, v6, v7, v8, v29);
    uint64_t v11 = 1;
  }
LABEL_12:

  return v11;
}

id _MAsendGetPallasUrl()
{
  return _MAsendGetPallasUrlForType(0);
}

id _MAsendGetPallasUrlForType(void *a1)
{
  id v1 = a1;
  uint64_t v24 = 4;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xpc_dictionary_set_string(v6, "AssetType", (const char *)[v1 UTF8String]);
    }
  }
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "messageAction", 0x2CuLL);
    uint64_t v15 = _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v16 = [v15 sendSync:v6 gettingResponseCode:&v24 codeForXpcError:1 loggingName:@"MAGetPallasUrl"];

    if (v24 || (string = xpc_dictionary_get_string(v16, "pallasUrl")) == 0)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F1CB10];
      id v21 = [NSString stringWithUTF8String:string];
      uint64_t v17 = [v20 URLWithString:v21];
    }
    id v18 = v17;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendGetPallasUrlForType", @"Could not create xpc dictionary, returning MAOperationXpcError", v2, v3, v4, v5, v23);
    id v18 = 0;
  }

  return v18;
}

uint64_t _MASetDawTokenValue(void *a1)
{
  id v1 = a1;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        xpc_dictionary_set_string(v6, "tokenValue", (const char *)[v1 UTF8String]);
      }
    }
    xpc_dictionary_set_uint64(v6, "messageAction", 0x2BuLL);
    uint64_t v26 = 4;
    uint64_t v15 = _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    id v16 = (id)[v15 sendSync:v6 gettingResponseCode:&v26 codeForXpcError:1 loggingName:@"MASetDawTokenValue"];

    uint64_t v17 = v26;
    uint64_t v25 = MAStringForMAOperationResult(v26);
    _MobileAssetLog(0, 6, (uint64_t)"_MASetDawTokenValue", @"Result of setDawTokenValue is %lld (%@)", v18, v19, v20, v21, v17);

    uint64_t v22 = v26;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MASetDawTokenValue", @"Could not create xpc dictionary, returning MAOperationXpcError", v2, v3, v4, v5, v24);
    uint64_t v22 = 1;
  }

  return v22;
}

uint64_t _MASetDawTokenPath(void *a1)
{
  id v1 = a1;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        xpc_dictionary_set_string(v6, "tokenPath", (const char *)[v1 UTF8String]);
      }
    }
    xpc_dictionary_set_uint64(v6, "messageAction", 0x22uLL);
    uint64_t v26 = 4;
    uint64_t v15 = _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    id v16 = (id)[v15 sendSync:v6 gettingResponseCode:&v26 codeForXpcError:1 loggingName:@"MASetDawTokenPath"];

    uint64_t v17 = v26;
    uint64_t v25 = MAStringForMAOperationResult(v26);
    _MobileAssetLog(0, 6, (uint64_t)"_MASetDawTokenPath", @"Result of setDawTokenPath is %lld (%@)", v18, v19, v20, v21, v17);

    uint64_t v22 = v26;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MASetDawTokenPath", @"Could not create xpc dictionary, returning MAOperationXpcError", v2, v3, v4, v5, v24);
    uint64_t v22 = 1;
  }

  return v22;
}

uint64_t _MAsendSetPreferences(void *a1)
{
  id v1 = a1;
  uint64_t v37 = 4;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    id v36 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v36];
    id v8 = v36;
    uint64_t v13 = v8;
    if (v8) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v7 == 0;
    }
    if (v14)
    {
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendSetPreferences", @"{_MAsendSetPreferences} Encoding error: %@", v9, v10, v11, v12, (uint64_t)v8);
      uint64_t v32 = 5;
    }
    else
    {
      uint64_t v15 = (const char *)[@"MAPreferences" UTF8String];
      id v16 = v7;
      xpc_dictionary_set_data(v6, v15, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
      xpc_dictionary_set_uint64(v6, "messageAction", 0x2EuLL);
      uint64_t v25 = _getCommsManager(v17, v18, v19, v20, v21, v22, v23, v24);
      id v26 = (id)[v25 sendSync:v6 gettingResponseCode:&v37 codeForXpcError:1 loggingName:@"MASetPreferences"];

      uint64_t v27 = v37;
      uint64_t v35 = MAStringForMAOperationResult(v37);
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendSetPreferences", @"Result of setPreferences is %lld (%@)", v28, v29, v30, v31, v27);

      uint64_t v32 = v37;
    }
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendSetPreferences", @"Error creating xpc dictionary", v2, v3, v4, v5, v34);
    uint64_t v32 = 1;
  }

  return v32;
}

void sendAssetSpecificWithMessage(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  id v11 = a4;
  id v12 = a2;
  xpc_dictionary_set_string(v11, "AssetType", (const char *)[v9 UTF8String]);
  id v13 = v12;
  BOOL v14 = (const char *)[v13 UTF8String];

  xpc_dictionary_set_string(v11, "AssetId", v14);
  xpc_dictionary_set_uint64(v11, "messageAction", a3);
  _getCommsManager(v15, v16, v17, v18, v19, v20, v21, v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  [v23 sendAsync:v11 clientHandler:v10 taskDescriptor:0];
}

void sendAssetSpecificMessageWithPurpose(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v13 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  if (v10) {
    xpc_dictionary_set_string(v12, "Purpose", (const char *)[v10 UTF8String]);
  }
  sendAssetSpecificWithMessage(v13, v9, a4, v12, v11);
}

void _MAsendPurgeAsset(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a1;
  id v7 = a2;
  id v8 = a4;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  id v10 = v9;
  if (v9) {
    xpc_dictionary_set_uint64(v9, "assetState", a3);
  }
  sendAssetSpecificWithMessage(v11, v7, 5uLL, v10, v8);
}

void _MAsendConfigDownload(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a2;
  id v12 = a1;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  if (v15 && isWellFormedPurpose(v15)) {
    xpc_dictionary_set_string(v13, "Purpose", (const char *)[v15 UTF8String]);
  }
  BOOL v14 = [v9 encodeAsPlist];
  addObjectToMessage(v14, v13, "downloadConfigLength", "downloadConfig");
  sendAssetSpecificWithMessage(v12, v11, 0x13uLL, v13, v10);
}

void _MAsendCancelDownload(void *a1, void *a2, void *a3, void *a4)
{
}

id _MAsendUpdateClientAccessGetPathSync(void *a1, void *a2, uint64_t a3)
{
  return _MAsendUpdateClientAccessGetPathWithPurposeSync(a1, a2, a3, 0);
}

void _MAsendDumpClientAccessWithPurpose(void *a1, void *a2, void *a3, void *a4)
{
}

void _MAsendDumpClientAccess(void *a1, void *a2, void *a3)
{
}

BOOL _MAsendGarbageCollect()
{
  return sendOperationSync(0, 0x17uLL, @"MAGarbageCollect") != 0;
}

uint64_t _MAsendInstallAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v41 = 4;
  uint64_t v5 = (void *)MEMORY[0x1B3EAACB0]();
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6)
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendInstallAsset", @"Could not create xpc dictionary, returning MAOperationXpcError", v7, v8, v9, v10, v38);
LABEL_16:
    uint64_t v36 = 1;
    goto LABEL_17;
  }
  id v11 = v6;
  if (!v3)
  {
LABEL_5:
    int v12 = 1;
    if (!v4) {
      goto LABEL_6;
    }
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v40 = stringForMAXpcCommand(0x2Au);
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendInstallAsset", @"MobileAsset %@ sendOperationSync %lld (%@) given a non-NSString pathToAsset", v27, v28, v29, v30, @"MAInstallAsset");

      unint64_t v41 = 2;
      goto LABEL_14;
    }
    xpc_dictionary_set_string(v11, "MobileAssetInstallAssetPath", (const char *)[v4 UTF8String]);
    if (!v12) {
      goto LABEL_14;
    }
LABEL_12:
    xpc_dictionary_set_uint64(v11, "messageAction", 0x2AuLL);
    uint64_t v25 = _getCommsManager(v17, v18, v19, v20, v21, v22, v23, v24);
    id v26 = (id)[v25 sendSync:v11 gettingResponseCode:&v41 codeForXpcError:1 loggingName:@"MAInstallAsset"];

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_dictionary_set_string(v11, "AssetType", (const char *)[v3 UTF8String]);
    goto LABEL_5;
  }
  long long v39 = stringForMAXpcCommand(0x2Au);
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendInstallAsset", @"MobileAsset %@ sendOperationSync %lld (%@) given a non-NSString assetType", v13, v14, v15, v16, @"MAInstallAsset");

  int v12 = 0;
  unint64_t v41 = 2;
  if (v4) {
    goto LABEL_10;
  }
LABEL_6:
  if (v12) {
    goto LABEL_12;
  }
LABEL_14:

  if (!v41) {
    goto LABEL_16;
  }
  uint64_t v31 = stringForMAOperationResult(v41);
  _MobileAssetLog(0, 3, (uint64_t)"_MAsendInstallAsset", @"MobileAsset Install Asset failed with error: %@", v32, v33, v34, v35, (uint64_t)v31);

  uint64_t v36 = 0;
LABEL_17:

  return v36;
}

uint64_t __sendIfNecessary_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __sendIfNecessary_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void _MAsendDownloadAsset(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9, void *a10)
{
  id v77 = a1;
  id v16 = a2;
  id v79 = a3;
  id v76 = a5;
  id v17 = a6;
  id v73 = a8;
  id v78 = a9;
  id v18 = a10;
  xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__0;
  v96 = __Block_byref_object_dispose__0;
  id v97 = 0;
  id v75 = v17;
  v71 = v18;
  if (v23)
  {
    if (v16 && v79 && v17)
    {
      id v24 = v16;
      xpc_dictionary_set_string(v23, "AssetType", (const char *)[v24 UTF8String]);
      id v25 = v79;
      xpc_dictionary_set_string(v23, "AssetId", (const char *)[v25 UTF8String]);
      if (v76) {
        xpc_dictionary_set_string(v23, "BaseUrlKey", (const char *)[v76 UTF8String]);
      }
      xpc_dictionary_set_string(v23, "RelativeUrlKey", (const char *)[v17 UTF8String]);
      v74 = [v77 encodeAsPlist];
      if (addObjectToMessage(v74, v23, "downloadOptionsLength", "downloadOptions"))
      {
        if (v78) {
          xpc_dictionary_set_string(v23, "Purpose", (const char *)[v78 UTF8String]);
        }
        if (v73)
        {
          v72 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
          [v72 encodeObject:v73 forKey:*MEMORY[0x1E4F284E8]];
          uint64_t v30 = [v72 encodedData];
          size_t v31 = [v30 length];
          id v70 = v30;
          xpc_dictionary_set_data(v23, "stExtractor", (const void *)[v70 bytes], v31);
          xpc_dictionary_set_double(v23, "stExtractorLength", (double)v31);
        }
        else
        {
          _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", @"No extractor specified", v26, v27, v28, v29, v68);
          id v70 = 0;
          v72 = 0;
        }
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", @"The download size is: %lld", v32, v33, v34, v35, a4);
        xpc_dictionary_set_int64(v23, "downloadSize", a4);
        xpc_dictionary_set_uint64(v23, "notificationInterval", a7);
        xpc_dictionary_set_uint64(v23, "messageAction", 3uLL);
        uint64_t v36 = normalizedAssetType((uint64_t)v24, v39, v40, v41, v42, v43, v44, v45);
        uint64_t v37 = assembleTaskDescriptorWithPurpose((uint64_t)v36, (uint64_t)v25, v78);
        int64_t v38 = 32;
      }
      else
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", @"Bad options for asset type: %@ not sending message", v26, v27, v28, v29, (uint64_t)v24);
        id v70 = 0;
        uint64_t v36 = 0;
        v72 = 0;
        uint64_t v37 = 0;
        int64_t v38 = 22;
      }
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", @"Bad asset meta data, cannot download: %@ %@ %@ %@", v19, v20, v21, v22, (uint64_t)v16);
      id v70 = 0;
      uint64_t v36 = 0;
      v74 = 0;
      v72 = 0;
      uint64_t v37 = 0;
      int64_t v38 = 23;
    }
  }
  else
  {
    id v70 = 0;
    uint64_t v36 = 0;
    v74 = 0;
    v72 = 0;
    uint64_t v37 = 0;
    int64_t v38 = 24;
  }
  dispatch_time_t v53 = dispatch_time(0, 0);
  uint64_t v54 = (uint64_t)v77;
  if (v77)
  {
    uint64_t v54 = [v77 allowDaemonConnectionRetries];
    char v55 = v54;
  }
  else
  {
    char v55 = 0;
  }
  v56 = _getCommsManager(v54, v46, v47, v48, v49, v50, v51, v52);
  v57 = [v56 progressCallbacksForAssetType:v16 assetId:v79 withPurpose:v78];
  v58 = (void *)[v57 copy];

  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = ___MAsendDownloadAsset_block_invoke;
  v80[3] = &unk_1E6004308;
  char v91 = v55;
  dispatch_time_t v89 = v53;
  id v59 = v16;
  id v81 = v59;
  id v60 = v79;
  id v82 = v60;
  id v61 = v58;
  id v83 = v61;
  id v62 = v78;
  id v84 = v62;
  int64_t v90 = v38;
  id v63 = v23;
  id v85 = v63;
  id v64 = v37;
  id v86 = v64;
  v88 = &v92;
  id v65 = v71;
  id v87 = v65;
  uint64_t v66 = MEMORY[0x1B3EAAEB0](v80);
  v67 = (void *)v93[5];
  v93[5] = v66;

  sendIfNecessary(v38, v63, v64, (void *)v93[5]);
  _Block_object_dispose(&v92, 8);
}

void sub_1B2773CE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id getRetryXpcDelayQueue()
{
  if (getRetryXpcDelayQueue_onceToken != -1) {
    dispatch_once(&getRetryXpcDelayQueue_onceToken, &__block_literal_global_1368);
  }
  dispatch_queue_t v0 = (void *)getRetryXpcDelayQueue_retryQueue;
  return v0;
}

id _getSandboxExtensions()
{
  if (_getSandboxExtensions_once != -1) {
    dispatch_once(&_getSandboxExtensions_once, &__block_literal_global_1102);
  }
  dispatch_queue_t v0 = (void *)_getSandboxExtensions_extensions;
  return v0;
}

uint64_t ___getSandboxExtensions_block_invoke()
{
  _getSandboxExtensions_extensions = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void _MAsendPMVDownload(void *a1, char a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    uint64_t v10 = [v8 encodeAsPlist];
    if (addObjectToMessage(v10, v9, "downloadOptionsLength", "downloadOptions"))
    {
      xpc_dictionary_set_uint64(v9, "messageAction", 0x1EuLL);
      int64_t v15 = 32;
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVDownload", @"Bad options for PMV download: not sending message", v11, v12, v13, v14, v18);
      int64_t v15 = 22;
    }
  }
  else
  {
    int64_t v15 = 1;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = ___MAsendPMVDownload_block_invoke;
  v19[3] = &unk_1E6004358;
  char v22 = a2;
  id v20 = v8;
  id v21 = v6;
  id v16 = v6;
  id v17 = v8;
  sendIfNecessary(v15, v9, 0, v19);
}

void _MAsendPMVCancelDownload(void *a1)
{
  id v1 = a1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 4;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  id v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "messageAction", 0x1DuLL);
    uint64_t v12 = _getCommsManager(v4, v5, v6, v7, v8, v9, v10, v11);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___MAsendPMVCancelDownload_block_invoke;
    v16[3] = &unk_1E60043A8;
    v17[1] = v18;
    v17[0] = v1;
    [v12 sendAsync:v3 clientHandler:v16 taskDescriptor:0];
    uint64_t v13 = (id *)v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v1)
  {
    uint64_t v12 = _getClientCallbackQueue();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___MAsendPMVCancelDownload_block_invoke_3;
    v14[3] = &unk_1E6004380;
    v15[1] = v18;
    uint64_t v13 = (id *)v15;
    v15[0] = v1;
    dispatch_async(v12, v14);
    goto LABEL_5;
  }
LABEL_6:

  _Block_object_dispose(v18, 8);
}

void sub_1B27746BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id _MAsendPMVQuerySync(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  unint64_t v16 = a5;
  unint64_t v17 = a6;
  uint64_t v18 = MEMORY[0x1B3EAACB0]();
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  v114 = (void *)v16;
  v115 = a7;
  context = (void *)v18;
  v113 = (void *)v17;
  if (!xdict)
  {
    unint64_t v38 = 6;
    uint64_t v39 = errorStringForMAQueryResult(6uLL);
    uint64_t v45 = MAError(@"com.apple.MobileAssetError.Query", 6, @"Query for software lookup failed: %@", v40, v41, v42, v43, v44, (uint64_t)v39);

    v108 = 0;
    v110 = 0;
    v119 = 0;
LABEL_32:
    uint64_t v68 = 0;
    id v69 = 0;
    v111 = 0;
    goto LABEL_33;
  }
  uint64_t v19 = objc_opt_new();
  if (a1) {
    uint64_t v20 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v20 = MEMORY[0x1E4F1CC28];
  }
  v119 = v19;
  [v19 setValue:v20 forKey:@"includeSupervised"];
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Setting include includeSupervised: %@", v21, v22, v23, v24, (uint64_t)"_MAsendPMVQuerySync");
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v46 = @"Query for software lookup failed as the filter for platform match was not a string.";
LABEL_31:
      unint64_t v38 = 8;
      uint64_t v45 = MAError(@"com.apple.MobileAssetError.Query", 8, v46, v25, v26, v27, v28, v29, v103);
      v108 = 0;
      v110 = 0;
      goto LABEL_32;
    }
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Setting platformExactMatch: %@", v26, v27, v28, v29, (uint64_t)"_MAsendPMVQuerySync");
    [v119 setValue:v13 forKey:@"platformExactMatch"];
  }
  if (!v14) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v46 = @"Query for software lookup failed as the filter for ProductVersion match was not a string.";
    goto LABEL_31;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Setting versionPrefix: %@", v26, v27, v28, v29, (uint64_t)"_MAsendPMVQuerySync");
  [v119 setValue:v14 forKey:@"versionPrefix"];
LABEL_11:
  if (!v15) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v46 = @"Query for software lookup failed as the filter for SupportedDevices match was not a string.";
    goto LABEL_31;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Setting supportedDevicePrefix: %@", v26, v27, v28, v29, (uint64_t)"_MAsendPMVQuerySync");
  [v119 setValue:v15 forKey:@"supportedDevicePrefix"];
LABEL_14:
  if (!(v16 | v17))
  {
    v117 = 0;
    uint64_t v30 = 0;
LABEL_23:
    v109 = 0;
    goto LABEL_24;
  }
  uint64_t v30 = objc_opt_new();
  [v30 setDateFormat:@"yyyy-MM-dd"];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v36 = [v30 stringFromDate:v16];
      if (v36)
      {
        uint64_t v116 = v36;
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Setting postedBeforeString: %@", v32, v33, v34, v35, (uint64_t)"_MAsendPMVQuerySync");
        [v119 setValue:v116 forKey:@"postedBefore"];
        uint64_t v37 = (void *)v116;
        goto LABEL_52;
      }
      v111 = v30;
      v102 = @"Query for software lookup failed as the filter for PostingDate limit could not be formatted as yyyy-MM-dd.";
    }
    else
    {
      v111 = v30;
      v102 = @"Query for software lookup failed as the filter for PostingDate limit was not a date.";
    }
    unint64_t v38 = 8;
    uint64_t v45 = MAError(@"com.apple.MobileAssetError.Query", 8, v102, v31, v32, v33, v34, v35, v103);
    v108 = 0;
    v110 = 0;
    uint64_t v68 = 0;
    id v69 = 0;
LABEL_33:
    v117 = 0;
LABEL_34:
    v109 = 0;
    dispatch_time_t v53 = 0;
LABEL_35:
    id v65 = 0;
LABEL_36:
    id v70 = 0;
    goto LABEL_37;
  }
  uint64_t v37 = 0;
LABEL_52:
  v117 = v37;
  if (!v17) {
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v111 = v30;
    unint64_t v38 = 8;
    uint64_t v45 = MAError(@"com.apple.MobileAssetError.Query", 8, @"Query for software lookup failed as the filter for ExpirationDate limit was not a date.", v86, v87, v88, v89, v90, v103);
    v108 = 0;
    v110 = 0;
    uint64_t v68 = 0;
    id v69 = 0;
    goto LABEL_34;
  }
  id v70 = [v30 stringFromDate:v17];
  if (!v70)
  {
    v111 = v30;
    unint64_t v38 = 8;
    uint64_t v45 = MAError(@"com.apple.MobileAssetError.Query", 8, @"Query for software lookup failed as the filter for ExpirationDate limit could not be formatted as yyyy-MM-dd.", v91, v92, v93, v94, v95, v103);
    v108 = 0;
    v109 = 0;
    v110 = 0;
    uint64_t v68 = 0;
    id v69 = 0;
    dispatch_time_t v53 = 0;
    id v65 = 0;
    goto LABEL_37;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Setting notExpiredBeforeString: %@", v92, v93, v94, v95, (uint64_t)"_MAsendPMVQuerySync");
  v109 = v70;
  [v119 setValue:v70 forKey:@"notExpiredBefore"];
LABEL_24:
  v111 = v30;
  id v125 = 0;
  uint64_t v47 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v119 requiringSecureCoding:1 error:&v125];
  id v48 = v125;
  dispatch_time_t v53 = v48;
  if (!v47 || v48)
  {
    v110 = v47;
    unint64_t v38 = 8;
    uint64_t v45 = MAErrorWithUnderlying(@"com.apple.MobileAssetError.Query", 8, v48, @"Query for software lookup failed as the filter could not be encoded.", v49, v50, v51, v52, v103);
    v108 = 0;
    uint64_t v68 = 0;
    id v69 = 0;
    goto LABEL_35;
  }
  uint64_t v54 = (const char *)[@"QueryParams" UTF8String];
  id v55 = v47;
  xpc_dictionary_set_data(xdict, v54, (const void *)[v55 bytes], objc_msgSend(v55, "length"));
  xpc_dictionary_set_uint64(xdict, "messageAction", 0x1FuLL);
  v56 = NSString;
  v104 = getprogname();
  v57 = [v56 stringWithFormat:@"%s"];
  id v65 = v57;
  if (v57) {
    xpc_dictionary_set_string(xdict, "clientName", (const char *)[v57 UTF8String]);
  }
  unint64_t v124 = 12;
  uint64_t v66 = _getCommsManager((uint64_t)v57, v58, v59, v60, v61, v62, v63, v64);
  v67 = [NSString stringWithUTF8String:"_MAsendPMVQuerySync"];
  dispatch_time_t v53 = [v66 sendSync:xdict gettingResponseCode:&v124 codeForXpcError:1 loggingName:v67];

  unint64_t v38 = v124;
  v110 = v55;
  if (isQueryResultFailure(v124))
  {
    v108 = v53;
    uint64_t v68 = 0;
    id v69 = 0;
    dispatch_time_t v53 = 0;
LABEL_74:
    uint64_t v45 = 0;
    goto LABEL_36;
  }
  if (!v53)
  {
    v108 = 0;
    uint64_t v68 = 0;
    id v69 = 0;
    goto LABEL_74;
  }
  v96 = plistDecodeClasses();
  uint64_t v68 = getObjectFromMessage(v53, "productMarketingVersionsListLength", "productMarketingVersionsList", v96);

  id v70 = objc_opt_new();
  v108 = v53;
  if (!v68)
  {
    id v69 = 0;
    dispatch_time_t v53 = 0;
    uint64_t v45 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v69 = 0;
LABEL_80:
    dispatch_time_t v53 = 0;
    uint64_t v45 = 0;
    goto LABEL_37;
  }
  id v69 = [v68 objectForKey:@"pmvEntriesToFrameWork"];
  if (!v69) {
    goto LABEL_80;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_80;
  }
  id v106 = v15;
  id v107 = v13;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v69 = v69;
  uint64_t v97 = [v69 countByEnumeratingWithState:&v120 objects:v126 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v98; ++i)
      {
        if (*(void *)v121 != v99) {
          objc_enumerationMutation(v69);
        }
        uint64_t v101 = *(void *)(*((void *)&v120 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v70 addObject:v101];
        }
      }
      uint64_t v98 = [v69 countByEnumeratingWithState:&v120 objects:v126 count:16];
    }
    while (v98);
  }

  dispatch_time_t v53 = 0;
  uint64_t v45 = 0;
  id v13 = v107;
  id v15 = v106;
LABEL_37:
  if (!isQueryResultFailure(v38))
  {
    if (!v45) {
      goto LABEL_44;
    }
    uint64_t v75 = MAErrorWithUnderlying(@"com.apple.MobileAssetError.Query", 12, v45, @"During software lookup had unexpected error", v71, v72, v73, v74, (uint64_t)v104);
LABEL_43:

    uint64_t v45 = (void *)v75;
    goto LABEL_44;
  }

  if (!v45)
  {
    uint64_t v45 = errorStringForMAQueryResult(v38);
    uint64_t v75 = MAError(@"com.apple.MobileAssetError.Query", v38, @"During software lookup: %@", v76, v77, v78, v79, v80, (uint64_t)v45);
    id v70 = 0;
    goto LABEL_43;
  }
  id v70 = 0;
LABEL_44:

  if (v45)
  {
    v105 = [v45 description];
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendPMVQuerySync", @"[%s] Failed to query PMV with error: %@", v81, v82, v83, v84, (uint64_t)"_MAsendPMVQuerySync");

    if (v115) {
      void *v115 = v45;
    }
  }

  return v70;
}

void _MAensureExtension(void *a1)
{
  id v1 = a1;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__1224;
  v46[4] = __Block_byref_object_dispose__1225;
  id v47 = 0;
  string = 0;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (!v1)
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAensureExtension", @"Attempting to get sandbox extension for a nil asset type", v2, v3, v4, v5, v33);
    id v9 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = _getSandboxExtensions();
  uint64_t v8 = _getClientInternalStateQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MAensureExtension_block_invoke;
  block[3] = &unk_1E60043D0;
  uint64_t v43 = v46;
  id v9 = v7;
  id v41 = v9;
  id v10 = v1;
  id v42 = v10;
  uint64_t v44 = &v48;
  dispatch_sync(v8, block);

  if (*((unsigned char *)v49 + 24))
  {
LABEL_8:
    uint64_t v23 = 0;
    id v13 = 0;
    goto LABEL_9;
  }
  id v11 = v10;
  xpc_dictionary_set_string(v6, "AssetType", (const char *)[v11 UTF8String]);
  xpc_dictionary_set_uint64(v6, "messageAction", 7uLL);
  uint64_t v12 = NSString;
  uint64_t v34 = getprogname();
  id v13 = [v12 stringWithFormat:@"%s"];
  xpc_dictionary_set_string(v6, "clientName", (const char *)[v13 UTF8String]);
  uint64_t v39 = 4;
  uint64_t v22 = _getCommsManager(v14, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v23 = [v22 sendSync:v6 gettingResponseCode:&v39 codeForXpcError:1 loggingName:@"getLocalUrl"];

  if (v39)
  {
    uint64_t v28 = @"Extension failure server side";
LABEL_5:
    int v29 = 6;
LABEL_6:
    _MobileAssetLog(0, v29, (uint64_t)"_MAensureExtension", v28, v24, v25, v26, v27, (uint64_t)v34);
    goto LABEL_9;
  }
  string = xpc_dictionary_get_string(v23, (const char *)[@"sandboxExtensionKey" UTF8String]);
  if (!string)
  {
    uint64_t v28 = @"extension present";
    goto LABEL_5;
  }
  if (sandbox_extension_consume() == -1)
  {
    uint64_t v28 = @"unable to consume sandbox extension";
    int v29 = 3;
    goto LABEL_6;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAensureExtension", @"Consumed extension", v24, v25, v26, v27, (uint64_t)v34);
  uint64_t v30 = [MEMORY[0x1E4F29238] valueWithBytes:&string objCType:"^*"];
  if (v30)
  {
    uint64_t v31 = _getClientInternalStateQueue();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = ___MAensureExtension_block_invoke_2;
    v35[3] = &unk_1E60043F8;
    id v9 = v9;
    id v36 = v9;
    id v37 = v30;
    id v38 = v11;
    id v32 = v30;
    dispatch_sync(v31, v35);
  }
LABEL_9:

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);
}

void sub_1B27756E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1224(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1225(uint64_t a1)
{
}

void _MAclientSendQueryNSUrlState(BOOL a1)
{
  uint64_t v14 = 4;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "NSUrlState", a1);
  xpc_dictionary_set_uint64(v2, "messageAction", 4uLL);
  id v11 = _getCommsManager(v3, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v12 = [NSString stringWithUTF8String:"_MAclientSendQueryNSUrlState"];
  id v13 = (id)[v11 sendSync:v2 gettingResponseCode:&v14 codeForXpcError:1 loggingName:v12];
}

uint64_t _MAclientSendRepairStateSync()
{
  dispatch_queue_t v0 = [NSString stringWithUTF8String:"_MAclientSendRepairStateSync"];
  uint64_t v1 = sendOperationSync(0, 0xEuLL, v0);

  return v1;
}

void _MAClientSendRepairState(void *a1)
{
  id v1 = a1;
  id v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "messageAction", 0xEuLL);
  uint64_t v10 = _getCommsManager(v2, v3, v4, v5, v6, v7, v8, v9);
  [v10 sendAsync:v11 clientHandler:v1 taskDescriptor:0];
}

BOOL _MAclientSendDataMigrator(BOOL a1, BOOL a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, "blockClient", a1);
  xpc_dictionary_set_BOOL(v4, "forceMigration", a2);
  xpc_dictionary_set_uint64(v4, "messageAction", 0x27uLL);
  uint64_t v18 = 4;
  id v13 = _getCommsManager(v5, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v14 = [NSString stringWithUTF8String:"_MAclientSendDataMigrator"];
  id v15 = (id)[v13 sendSync:v4 gettingResponseCode:&v18 codeForXpcError:1 loggingName:v14];

  BOOL v16 = v18 == 0;
  return v16;
}

uint64_t _MAclientSendEnsureDataVault(void *a1, void *a2)
{
  id v3 = a1;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      if (v4)
      {
        id v5 = v3;
        xpc_dictionary_set_string(v4, "AssetType", (const char *)[v5 UTF8String]);
        xpc_dictionary_set_uint64(v4, "messageAction", 0x26uLL);
        unint64_t v47 = 4;
        uint64_t v14 = _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
        id v15 = (id)[v14 sendSync:v4 gettingResponseCode:&v47 codeForXpcError:1 loggingName:@"MAEnsureDataVault"];

        uint64_t v20 = v47;
        if (!v47)
        {
          _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendEnsureDataVault", @"Confirmed data vault for %@", v16, v17, v18, v19, (uint64_t)v5);
          uint64_t v26 = 0;
          uint64_t v33 = 1;
LABEL_11:

          if (!a2) {
            goto LABEL_14;
          }
          goto LABEL_12;
        }
        uint64_t v46 = stringForMAOperationResult(v47);
        uint64_t v26 = MAError(@"com.apple.MobileAssetError", v20, @"The asset type %@ could not be confirmed to be a data vault: %@", v21, v22, v23, v24, v25, (uint64_t)v5);
      }
      else
      {
        unint64_t v47 = 1;
        uint64_t v34 = stringForMAOperationResult(1uLL);
        uint64_t v26 = MAError(@"com.apple.MobileAssetError.Xpc", 1, @"Failed to create xpc dictionary: %@", v35, v36, v37, v38, v39, (uint64_t)v34);
      }
      uint64_t v33 = 0;
      goto LABEL_11;
    }
  }
  unint64_t v47 = 3;
  uint64_t v27 = stringForMAOperationResult(3uLL);
  uint64_t v26 = MAError(@"com.apple.MobileAssetError", 3, @"The assetType is not a valid string: %@", v28, v29, v30, v31, v32, (uint64_t)v27);

  uint64_t v33 = 0;
  if (!a2) {
    goto LABEL_14;
  }
LABEL_12:
  id v40 = v26;
  *a2 = v40;
  if (v40) {
    _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendEnsureDataVault", @"Error: %@", v41, v42, v43, v44, (uint64_t)v40);
  }
LABEL_14:

  return v33;
}

BOOL _MAclientSendGetNonUserInitiatedDownloadsAllowed()
{
  return _MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType(0);
}

BOOL _MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType(void *a1)
{
  id v1 = a1;
  uint64_t v15 = 4;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "messageAction", 0x25uLL);
  BOOL v3 = isWellFormedAssetType(v1);
  if (v3) {
    xpc_dictionary_set_string(v2, "AssetType", (const char *)[v1 UTF8String]);
  }
  uint64_t v11 = _getCommsManager(v3, v4, v5, v6, v7, v8, v9, v10);
  BOOL v12 = 1;
  uint64_t v13 = [v11 sendSync:v2 gettingResponseCode:&v15 codeForXpcError:1 loggingName:@"_MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType"];

  if (!v15) {
    BOOL v12 = xpc_dictionary_get_BOOL(v13, "allowNonUserInitiated");
  }

  return v12;
}

uint64_t _MAclientSendServerUrlOverride(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v24 = 4;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendServerUrlOverride", @"MobileAsset _MAclientSendServerUrlOverride passed invalid NSString", v5, v6, v7, v8, v23);
    uint64_t v10 = 2;
  }
  else
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (v3) {
      xpc_dictionary_set_string(v9, "AssetType", (const char *)[v3 UTF8String]);
    }
    if (v4) {
      xpc_dictionary_set_string(v9, "serverUrlOverride", (const char *)[v4 UTF8String]);
    }
    else {
      xpc_dictionary_set_BOOL(v9, "serverOverrideClear", 1);
    }
    xpc_dictionary_set_BOOL(v9, "serverUrlDefault", 0);
    xpc_dictionary_set_uint64(v9, "messageAction", 0xDuLL);
    uint64_t v19 = _getCommsManager(v11, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v20 = [NSString stringWithUTF8String:"_MAclientSendServerUrlOverride"];
    id v21 = (id)[v19 sendSync:v9 gettingResponseCode:&v24 codeForXpcError:1 loggingName:v20];

    uint64_t v10 = v24;
  }

  return v10;
}

uint64_t _MAclientSendServerUrlFallbackDefault(void *a1, void *a2)
{
  id v3 = a1;
  id v8 = a2;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "AssetType", (const char *)[v3 UTF8String]);
    if (v8) {
      xpc_dictionary_set_string(v9, "serverUrlOverride", (const char *)[v8 UTF8String]);
    }
    else {
      xpc_dictionary_set_BOOL(v9, "serverOverrideClear", 1);
    }
    xpc_dictionary_set_BOOL(v9, "serverUrlDefault", 1);
    xpc_dictionary_set_uint64(v9, "messageAction", 0xDuLL);
    uint64_t v24 = 4;
    uint64_t v19 = _getCommsManager(v11, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v20 = [NSString stringWithUTF8String:"_MAclientSendServerUrlFallbackDefault"];
    id v21 = (id)[v19 sendSync:v9 gettingResponseCode:&v24 codeForXpcError:1 loggingName:v20];

    uint64_t v10 = v24;
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendServerUrlFallbackDefault", @"MobileAsset _MAclientSendServerUrlFallbackDefault passed invalid NSString", v4, v5, v6, v7, v23);
    uint64_t v10 = 2;
  }

  return v10;
}

uint64_t _MAMigrateAssets(void *a1)
{
  return sendOperationSync(a1, 0xFuLL, @"MAMigrateAssets");
}

uint64_t _MACleanV1Repository(void *a1)
{
  return sendOperationSync(a1, 0x10uLL, @"MACleanV1Repository");
}

uint64_t _MAclientSendReportingRequest(int64_t a1, BOOL a2, BOOL a3)
{
  uint64_t v20 = 4;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "reportingChange", a1);
  xpc_dictionary_set_BOOL(v6, "reportingSend", a2);
  xpc_dictionary_set_BOOL(v6, "reportingClear", a3);
  xpc_dictionary_set_uint64(v6, "messageAction", 0x23uLL);
  uint64_t v15 = _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v16 = [NSString stringWithUTF8String:"_MAclientSendReportingRequest"];
  id v17 = (id)[v15 sendSync:v6 gettingResponseCode:&v20 codeForXpcError:1 loggingName:v16];

  uint64_t v18 = v20;
  return v18;
}

uint64_t _MAclientSendGetMABrainInfo(void *a1)
{
  uint64_t v18 = 4;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "messageAction", 0x28uLL);
  uint64_t v11 = _getCommsManager(v3, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v12 = [NSString stringWithUTF8String:"_MAclientSendGetMABrainInfo"];
  uint64_t v13 = [v11 sendSync:v2 gettingResponseCode:&v18 codeForXpcError:1 loggingName:v12];

  uint64_t v14 = 0;
  if (v18)
  {
    if (a1) {
LABEL_3:
    }
      *a1 = v14;
  }
  else
  {
    uint64_t v17 = getLoadDictionaryFromMessage(v13, @"MobileAssetBrainInfo");
    if (v17) {
      uint64_t v14 = (void *)v17;
    }
    else {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
    }
    if (a1) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = v18;

  return v15;
}

uint64_t _MAclientSendUpdateMABrain(void *a1, void *a2)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 4;
  id v3 = a1;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"MobileAssetBrainUpdateOptionSSO"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"MobileAssetBrainUpdateOptionDAW"];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"MobileAssetBrainUpdateOptionNonBlocking"];
  uint64_t v7 = [v3 objectForKeyedSubscript:@"MobileAssetBrainUpdateOptionDiscretionary"];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"MobileAssetBrainUpdateOptionRelaunch"];
  uint64_t v27 = [v3 objectForKeyedSubscript:@"MobileAssetBrainUpdateOptionPurgeOnly"];

  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "messageAction", 0x29uLL);
  if (v4)
  {
    id v18 = v4;
    xpc_dictionary_set_data(v9, "MobileAssetBrainUpdateOptionSSO", (const void *)[v18 bytes], objc_msgSend(v18, "length"));
  }
  if (v5) {
    xpc_dictionary_set_string(v9, "MobileAssetBrainUpdateOptionDAW", (const char *)[v5 UTF8String]);
  }
  if (v6) {
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionNonBlocking", [v6 BOOLValue]);
  }
  if (v7) {
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionDiscretionary", [v7 BOOLValue]);
  }
  if (v8) {
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionRelaunch", [v8 BOOLValue]);
  }
  if (v27) {
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionPurgeOnly", 1);
  }
  uint64_t v19 = _getCommsManager(v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v20 = [NSString stringWithUTF8String:"_MAclientSendUpdateMABrain"];
  id v21 = [v19 sendSync:v9 gettingResponseCode:&v28 codeForXpcError:1 loggingName:v20];

  if (v28)
  {
    createErrorFromMessage(v21);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      v29[0] = *MEMORY[0x1E4F28228];
      v29[1] = @"reply";
      v30[0] = @"Unable to decode error reply";
      v30[1] = v21;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
      id v22 = [v23 errorWithDomain:@"MobileAssetBrainErrorDomain" code:900 userInfo:v24];
    }
    if (a2 && v22)
    {
      id v22 = v22;
      *a2 = v22;
    }
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v25 = v28;

  return v25;
}

uint64_t _MAclientSendSecureMABundleCommand(uint64_t a1, void *a2, void *a3)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 4;
  id v5 = a2;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SecureMobileAssetBundleOptionPath"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"SecureMobileAssetBundleOptionSSO"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"SecureMobileAssetBundleOptionScpParametersOverride"];
  xpc_object_t v9 = [v5 objectForKeyedSubscript:@"SecureMobileAssetBundleOptionStageManifest"];
  uint64_t v10 = [v5 objectForKeyedSubscript:@"SecureMobileAssetBundleOptionSelectors"];
  uint64_t v11 = [v5 objectForKeyedSubscript:@"SecureMobileAssetBundleOptionDarwinOnly"];

  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "messageAction", 0x2DuLL);
  xpc_dictionary_set_uint64(v12, "SecureMobileAssetBundleCommand", a1);
  if (v6) {
    xpc_dictionary_set_string(v12, "SecureMobileAssetBundleOptionPath", (const char *)[v6 UTF8String]);
  }
  if (v8)
  {
    id v21 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v21) {
      xpc_dictionary_set_value(v12, "SecureMobileAssetBundleOptionScpParametersOverride", v21);
    }
  }
  if (v9) {
    xpc_dictionary_set_BOOL(v12, "SecureMobileAssetBundleOptionStageManifest", [v9 BOOLValue]);
  }
  if (v10)
  {
    id v22 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v22) {
      xpc_dictionary_set_value(v12, "SecureMobileAssetBundleOptionSelectors", v22);
    }
  }
  uint64_t v34 = v6;
  uint64_t v23 = (void *)v11;
  if (v11) {
    xpc_dictionary_set_BOOL(v12, "SecureMobileAssetBundleOptionDarwinOnly", 1);
  }
  uint64_t v24 = a3;
  if (v7)
  {
    id v25 = v7;
    xpc_dictionary_set_data(v12, "SecureMobileAssetBundleOptionSSO", (const void *)[v25 bytes], objc_msgSend(v25, "length"));
  }
  uint64_t v26 = _getCommsManager(v13, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v27 = [NSString stringWithUTF8String:"_MAclientSendSecureMABundleCommand"];
  uint64_t v28 = [v26 sendSync:v12 gettingResponseCode:&v35 codeForXpcError:1 loggingName:v27];

  if (v35)
  {
    createErrorFromMessage(v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      v36[0] = *MEMORY[0x1E4F28228];
      v36[1] = @"reply";
      v37[0] = @"Unable to decode error reply";
      v37[1] = v28;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
      id v29 = [v30 errorWithDomain:@"MobileAssetBrainErrorDomain" code:900 userInfo:v31];
    }
    if (v24 && v29)
    {
      id v29 = v29;
      void *v24 = v29;
    }
  }
  else
  {
    id v29 = 0;
  }
  uint64_t v32 = v35;

  return v32;
}

void __getRetryXpcDelayQueue_block_invoke()
{
  xpc_object_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileAsset.retryClientCommsXpcDelay", v2);
  id v1 = (void *)getRetryXpcDelayQueue_retryQueue;
  getRetryXpcDelayQueue_retryQueue = (uint64_t)v0;
}

void __plistDecodeClasses_block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)plistDecodeClasses__plistDecodeClasses;
  plistDecodeClasses__plistDecodeClasses = v2;
}

id suAssetTypes()
{
  if (suAssetTypes_once != -1) {
    dispatch_once(&suAssetTypes_once, &__block_literal_global_918);
  }
  id v0 = (void *)suAssetTypes_suAssetTypes;
  return v0;
}

uint64_t __suAssetTypes_block_invoke()
{
  suAssetTypes_suAssetTypes = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F0A8D658];
  return MEMORY[0x1F41817F8]();
}

id assetIdDisallowedCharacterSet()
{
  if (assetIdDisallowedCharacterSet_once != -1) {
    dispatch_once(&assetIdDisallowedCharacterSet_once, &__block_literal_global_953);
  }
  id v0 = (void *)assetIdDisallowedCharacterSet_disallowedSet;
  return v0;
}

void __assetIdDisallowedCharacterSet_block_invoke()
{
  id v0 = (void *)MEMORY[0x1B3EAACB0]();
  id v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789abcdefABCDEF"];
  uint64_t v2 = [v1 invertedSet];
  id v3 = (void *)assetIdDisallowedCharacterSet_disallowedSet;
  assetIdDisallowedCharacterSet_disallowedSet = v2;
}

id assetTypeDisallowedCharacterSet()
{
  if (assetTypeDisallowedCharacterSet_once != -1) {
    dispatch_once(&assetTypeDisallowedCharacterSet_once, &__block_literal_global_959_0);
  }
  id v0 = (void *)assetTypeDisallowedCharacterSet_disallowedSet;
  return v0;
}

void __assetTypeDisallowedCharacterSet_block_invoke()
{
  id v0 = (void *)MEMORY[0x1B3EAACB0]();
  id v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-"];
  uint64_t v2 = [v1 invertedSet];
  id v3 = (void *)assetTypeDisallowedCharacterSet_disallowedSet;
  assetTypeDisallowedCharacterSet_disallowedSet = v2;
}

id purposeDisallowedCharacterSet()
{
  if (purposeDisallowedCharacterSet_once != -1) {
    dispatch_once(&purposeDisallowedCharacterSet_once, &__block_literal_global_969);
  }
  id v0 = (void *)purposeDisallowedCharacterSet_disallowedSet;
  return v0;
}

void __purposeDisallowedCharacterSet_block_invoke()
{
  id v0 = (void *)MEMORY[0x1B3EAACB0]();
  id v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  uint64_t v2 = [v1 invertedSet];
  id v3 = (void *)purposeDisallowedCharacterSet_disallowedSet;
  purposeDisallowedCharacterSet_disallowedSet = v2;
}

id purposeIgnoredCharacterSet()
{
  if (purposeIgnoredCharacterSet_once != -1) {
    dispatch_once(&purposeIgnoredCharacterSet_once, &__block_literal_global_974);
  }
  id v0 = (void *)purposeIgnoredCharacterSet_ignoredSet;
  return v0;
}

void __purposeIgnoredCharacterSet_block_invoke()
{
  id v0 = (void *)MEMORY[0x1B3EAACB0]();
  uint64_t v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@";'\"\\/@?%*|<>.{}"];
  uint64_t v2 = (void *)purposeIgnoredCharacterSet_ignoredSet;
  purposeIgnoredCharacterSet_ignoredSet = v1;
}

id getObjectFromMessageLogIfDesired(void *a1, const char *a2, const char *a3, void *a4, int a5)
{
  id v9 = a1;
  id v10 = a4;
  size_t length = (unint64_t)xpc_dictionary_get_double(v9, a2);
  if (!length) {
    goto LABEL_10;
  }
  data = xpc_dictionary_get_data(v9, a3, &length);
  if (!data)
  {
    _MobileAssetLog(0, 6, (uint64_t)"getObjectFromMessageLogIfDesired", @"Failed to get key: %s due to not beinng present", v12, v13, v14, v15, (uint64_t)a3);
LABEL_10:
    uint64_t v28 = 0;
    id v21 = 0;
    goto LABEL_15;
  }
  uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
  if (!v16)
  {
    if (a5) {
      _MobileAssetLog(0, 6, (uint64_t)"getObjectFromMessageLogIfDesired", @"Failed to get key: %s", v17, v18, v19, v20, (uint64_t)a3);
    }
    goto LABEL_10;
  }
  id v21 = (void *)v16;
  id v30 = 0;
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v16 error:&v30];
  id v27 = v30;
  if (v27 || !v22)
  {
    if (a5) {
      _MobileAssetLog(0, 6, (uint64_t)"getObjectFromMessageLogIfDesired", @"getObjectFromMessage: could not decode object for key: %s error: %@", v23, v24, v25, v26, (uint64_t)a3);
    }
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = [v22 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F284E8]];
  }
  [v22 finishDecoding];

LABEL_15:
  return v28;
}

id getObjectFromMessage(void *a1, const char *a2, const char *a3, void *a4)
{
  return getObjectFromMessageLogIfDesired(a1, a2, a3, a4, 1);
}

uint64_t calculateTimeout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (((unint64_t)a1 >> 10) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  if (a1 > 0x102661BFFLL) {
    uint64_t v8 = 604800;
  }
  if (a1 >= 6451200) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 900;
  }
  _MobileAssetLog(0, 6, (uint64_t)"calculateTimeout", @"Calculated the download timeout to be %ld hrs %ld mins %ld secs (%ld) for size %lld", a5, a6, a7, a8, ((unint64_t)v9 * (unsigned __int128)0x123456789ABCE0uLL) >> 64);
  return v9;
}

BOOL determineUnarchiveSizeFromAttributes(void *a1, void *a2)
{
  id v3 = [a1 objectForKey:@"_UnarchivedSize"];
  uint64_t v4 = v3;
  if (v3) {
    *a2 = [v3 longLongValue];
  }

  return v4 != 0;
}

__CFString *normalizePurpose(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1;
  if (v1 && !isWellFormedPurpose(v1))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = purposeIgnoredCharacterSet();
      [(__CFString *)v2 rangeOfCharacterFromSet:v3];
      uint64_t v5 = v4;

      if (v5)
      {
        uint64_t v6 = purposeIgnoredCharacterSet();
        uint64_t v7 = [(__CFString *)v2 componentsSeparatedByCharactersInSet:v6];
        uint64_t v8 = [v7 componentsJoinedByString:&stru_1F0A75970];

        uint64_t v2 = (__CFString *)v8;
      }
    }
    if (!isWellFormedPurpose(v2))
    {

      uint64_t v2 = &stru_1F0A75970;
    }
  }
  return v2;
}

BOOL isWellFormedAssetType(void *a1)
{
  id v1 = a1;
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v1 hasPrefix:@"com.apple.MobileAsset."]
    && (unint64_t v2 = [v1 length], v2 > objc_msgSend(@"com.apple.MobileAsset.", "length"))
    && ([v1 containsString:@".."] & 1) == 0)
  {
    uint64_t v5 = assetTypeDisallowedCharacterSet();
    BOOL v3 = [v1 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

id normalizedAssetType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E78] stringWithString:a1];
    objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @".", @"_", 2, 0, objc_msgSend(v8, "length"));
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"normalizedAssetType", @"Could not create normalized asset type", a5, a6, a7, a8, v10);
    uint64_t v8 = 0;
  }
  return v8;
}

id assembleTaskDescriptorWithPurpose(uint64_t a1, uint64_t a2, void *a3)
{
  return assembleTaskDescriptorWithPurposeAndAutoAssetJobID(a1, a2, a3, 0);
}

id assembleTaskDescriptorWithPurposeAndAutoAssetJobID(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [NSString stringWithFormat:@"%@%@%@", a1, @".", a2];
  if (v7)
  {
    uint64_t v10 = normalizePurpose(v7);

    uint64_t v11 = [v9 stringByAppendingFormat:@"%@%@", @".", v10];

    uint64_t v9 = (void *)v11;
  }
  if (v8)
  {
    if ([v8 containsString:@"."])
    {
      _MobileAssetLog(0, 3, (uint64_t)"assembleTaskDescriptorWithPurposeAndAutoAssetJobID", @"{assembleTaskDescriptorWithPurposeAndAutoAssetJobID} invalid autoAssetJobID(ignored):%@", v12, v13, v14, v15, (uint64_t)v8);
    }
    else
    {
      uint64_t v16 = [v9 stringByAppendingFormat:@"%@%@", @".", v8];

      uint64_t v9 = (void *)v16;
    }
  }

  return v9;
}

id purposeDirectoryName(void *a1)
{
  if (a1)
  {
    id v1 = NSString;
    unint64_t v2 = normalizePurpose(a1);
    BOOL v3 = [v1 stringWithFormat:@"purpose_%@", v2];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

BOOL isWellFormedAssetId(void *a1)
{
  id v1 = a1;
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v1 length] >= 0x14
    && (unint64_t)[v1 length] <= 0x3C)
  {
    uint64_t v4 = assetIdDisallowedCharacterSet();
    BOOL v2 = [v1 rangeOfCharacterFromSet:v4] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

BOOL isWellFormedPurpose(void *a1)
{
  id v1 = a1;
  BOOL v5 = 1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![v1 length]
      || (unint64_t)[v1 length] > 0x3C
      || (purposeDisallowedCharacterSet(),
          BOOL v2 = objc_claimAutoreleasedReturnValue(),
          [v1 rangeOfCharacterFromSet:v2],
          uint64_t v4 = v3,
          v2,
          v4))
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

BOOL isDirStatsEnabledForDirectory(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 0, sizeof(v12));
  id v1 = a1;
  int v2 = fsctl((const char *)[v1 UTF8String], 0xC1104A71uLL, v12, 0);
  if (v2)
  {
    __error();
    _MobileAssetLog(0, 3, (uint64_t)"isDirStatsEnabledForDirectory", @"Unable to check dirstats for directory %@, error %i", v3, v4, v5, v6, (uint64_t)v1);
  }
  else if (_MAPreferencesIsVerboseLoggingEnabled())
  {
    _MobileAssetLog(0, 6, (uint64_t)"isDirStatsEnabledForDirectory", @"%@:\ndescendants: %llu\nphysical size: %llu\ngen-count: %llu\n", v7, v8, v9, v10, (uint64_t)v1);
  }

  return v2 == 0;
}

BOOL markItemPurgeableWithFlagsAndStartTime(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v6 fileExistsAtPath:@"/private/var/MobileSoftwareUpdate/.MAAMigrated.plist"])
  {

    goto LABEL_6;
  }
  BOOL v7 = isDirStatsEnabledForDirectory(v5);

  if (!v7)
  {
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_7;
  }
  uint64_t v27 = 0;
  id v8 = v5;
  if (fsctl((const char *)[v8 UTF8String], 0xC0084A44uLL, &v27, 0))
  {
    uint64_t v9 = __error();
    _MobileAssetLog(0, 3, (uint64_t)"markItemPurgeableWithFlagsAndStartTime", @"Failed to clear purgability, errno:%d", v10, v11, v12, v13, *v9);
    goto LABEL_6;
  }
  uint64_t v22 = a2;
  long long v23 = xmmword_1B27E34B0;
  uint64_t v24 = 0;
  uint64_t v25 = a3;
  uint64_t v26 = 0;
  int v16 = fsctl((const char *)[v8 UTF8String], 0xC0304A6FuLL, &v22, 0);
  BOOL v14 = v16 == 0;
  if (v16)
  {
    uint64_t v17 = __error();
    _MobileAssetLog(0, 3, (uint64_t)"markItemPurgeableWithFlagsAndStartTime", @"Failed to mark purgeable with label, errno:%d", v18, v19, v20, v21, *v17);
  }
LABEL_7:

  return v14;
}

BOOL markItemPurgeableWithUrgencyAndGarbageCollectionPolicy(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  BOOL v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (![v6 isEqualToString:@"NeverCollected"])
  {
    if ([v7 isEqualToString:@"Precious"])
    {
      uint64_t v13 = 2678400000000000;
LABEL_7:
      __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_REALTIME);
      BOOL started = markItemPurgeableWithFlagsAndStartTime(v5, a2 | 0x10000, v14 + v13);
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v13 = 1296000000000000;
    goto LABEL_7;
  }
  _MobileAssetLog(0, 3, (uint64_t)"markItemPurgeableWithUrgencyAndGarbageCollectionPolicy", @"API MISUSE: markItemPurgeableWithUrgencyAndGarbageCollectionPolicy called with NeverCollected policy", v8, v9, v10, v11, v16);
  BOOL started = 0;
LABEL_8:

  return started;
}

BOOL markAssetPurgeable(void *a1)
{
  return markItemPurgeableWithUrgencyAndGarbageCollectionPolicy(a1, 512, @"Default");
}

id getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v19 = a5;
  if (!v9)
  {
    uint64_t v27 = @"Attempting to get local url with nil asset type";
LABEL_9:
    _MobileAssetLog(0, 3, (uint64_t)"getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose", v27, v15, v16, v17, v18, v41);
    uint64_t v28 = 0;
    uint64_t v24 = 0;
LABEL_12:
    id v30 = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v27 = @"Attempting to get local url with nil asset id";
    goto LABEL_9;
  }
  uint64_t v24 = normalizedAssetType((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
  if (!v24)
  {
    id v29 = @"Attempting to get local URL with asset-type that could not be normalized";
LABEL_11:
    _MobileAssetLog(0, 3, (uint64_t)"getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose", v29, v20, v21, v22, v23, v41);
    uint64_t v28 = 0;
    goto LABEL_12;
  }
  if (a3 == 5)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v26 = @"/System/Library/PreinstalledAssetsV2/RequiredByOs";
    goto LABEL_15;
  }
  if (a3 != 6)
  {
    if (v11)
    {
      uint64_t v34 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
      goto LABEL_18;
    }
    id v29 = @"Attempting to get local url with nil default repo for a non preinstalled asset";
    goto LABEL_11;
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v26 = @"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs";
LABEL_15:
  uint64_t v33 = getRepositoryPath(v26);
  uint64_t v34 = [v25 URLWithString:v33];

LABEL_18:
  uint64_t v35 = [v34 URLByAppendingPathComponent:v24];

  if (v19)
  {
    uint64_t v36 = purposeDirectoryName(v19);
    uint64_t v37 = [v35 URLByAppendingPathComponent:v36];

    uint64_t v35 = (void *)v37;
  }
  uint64_t v38 = [NSString stringWithFormat:@"%@.%@", v10, @"asset"];
  id v30 = [v38 stringByAppendingPathComponent:@"AssetData"];

  uint64_t v28 = [v35 URLByAppendingPathComponent:v30];

  if (v19)
  {
    uint64_t v39 = purposeDirectoryName(v19);
    uint64_t v40 = [v28 URLByAppendingPathComponent:v39];

    uint64_t v28 = (void *)v40;
  }
LABEL_13:
  id v31 = v28;

  return v31;
}

__CFString *stringForMAQueryReturnTypes(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAQueryReturnTypes%llu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E60044C0[a1];
  }
  return v1;
}

__CFString *stringForMAAssetState(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAAssetState%llu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E60044F8[a1];
  }
  return v1;
}

__CFString *stringForMAXpcCommand(unsigned int a1)
{
  if (a1 >= 0x2F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAXpcCommand%llu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6004530[a1];
  }
  return v1;
}

__CFString *stringForMAXpcError(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAXpcError%llu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E60046A8[a1];
  }
  return v1;
}

__CFString *stringForMACancelDownloadResult(unint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MACancelDownloadResult%llu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E60049D0[a1];
  }
  return v1;
}

__CFString *stringForMAPurgeResult(unint64_t a1)
{
  if (a1 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"MAPurgeResult%llu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6004A10[a1];
  }
  return v1;
}

__CFString *errorStringForMAPurgeResult(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0xB && ((0x4EDu >> v1))
  {
    int v2 = off_1E6004A78[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Purge failed due to error %llu", a1);
    int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *errorStringForMAQueryResult(unint64_t a1)
{
  if (a1 >= 0xF)
  {
    uint64_t v3 = NSString;
    uint64_t v4 = stringForMAQueryResult(a1);
    int v2 = [v3 stringWithFormat:@"Query failed due to Error %lld (%@).", a1, v4];
  }
  else
  {
    int v2 = off_1E6004AD0[a1];
  }
  return v2;
}

__CFString *errorStringForMACancelDownloadResult(unint64_t a1)
{
  if (a1 >= 8)
  {
    uint64_t v3 = NSString;
    uint64_t v4 = stringForMACancelDownloadResult(a1);
    int v2 = [v3 stringWithFormat:@"Download failed due to Error %lld (%@).", a1, v4];
  }
  else
  {
    int v2 = off_1E6004B48[a1];
  }
  return v2;
}

id MAError(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = (objc_class *)NSString;
  id v12 = a3;
  id v13 = a1;
  uint64_t v14 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

  uint64_t v15 = MAErrorWithUnderlyingUserInfoAndString(v13, a2, 0, 0, v14);

  return v15;
}

id MAErrorWithUnderlying(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = (objc_class *)NSString;
  id v13 = a4;
  id v14 = a3;
  id v15 = a1;
  uint64_t v16 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  uint64_t v17 = MAErrorWithUnderlyingUserInfoAndString(v15, a2, v14, 0, v16);

  return v17;
}

uint64_t isCancelDownloadResultFailure(unint64_t a1)
{
  if (a1 < 8) {
    return (0x36u >> a1) & 1;
  }
  BOOL v7 = stringForMACancelDownloadResult(a1);
  _MobileAssetLog(0, 3, (uint64_t)"isCancelDownloadResultFailure", @"Unknown MACancelDownloadResult: %ld (%@)", v3, v4, v5, v6, a1);

  return 1;
}

id MAErrorForCancelDownloadResultWithUnderlying(unint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (v11)
  {
    id v12 = (objc_class *)NSString;
    id v13 = a2;
    id v14 = (void *)[[v12 alloc] initWithFormat:v11 arguments:&a9];
  }
  else
  {
    id v15 = a2;
    id v14 = errorStringForMACancelDownloadResult(a1);
  }
  uint64_t v16 = v14;
  uint64_t v17 = MAErrorWithUnderlyingUserInfoAndString(@"com.apple.MobileAssetError.CancelDownload", a1, a2, 0, v14);

  return v17;
}

uint64_t isAttributePartOfAssetIdHash(void *a1)
{
  id v1 = a1;
  if (![v1 hasPrefix:@"_"]
    || ([v1 isEqualToString:@"_ContentVersion"] & 1) != 0
    || ([v1 isEqualToString:@"_CompatibilityVersion"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"_MasteredVersion"];
  }

  return v2;
}

__CFString *getAssetIdFromDict(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v6 = [v4 keyEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    do
    {
      if (isAttributePartOfAssetIdHash(v8))
      {
        id v9 = [v4 objectForKey:v8];
        [(__CFString *)v5 setObject:v9 forKey:v8];
      }
      uint64_t v10 = [v6 nextObject];

      uint64_t v8 = (void *)v10;
    }
    while (v10);
  }
  id v11 = (__CFString *)_MobileAssetHashAssetData(*MEMORY[0x1E4F1CF80], v3, v5);

  return v11;
}

__CFString *getHashFromAttributesInSet(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    id v9 = [(__CFString *)v6 keyEnumerator];
    uint64_t v10 = [v9 nextObject];
    if (v10)
    {
      id v11 = (void *)v10;
      do
      {
        if ([v7 containsObject:v11])
        {
          id v12 = [(__CFString *)v6 objectForKey:v11];
          [(__CFString *)v8 setObject:v12 forKey:v11];
        }
        uint64_t v13 = [v9 nextObject];

        id v11 = (void *)v13;
      }
      while (v13);
    }
    id v14 = (__CFString *)_MobileAssetHashAssetDataNoLegacy(*MEMORY[0x1E4F1CF80], v5, v8);
  }
  else
  {
    id v14 = (__CFString *)_MobileAssetHashAssetDataNoLegacy(*MEMORY[0x1E4F1CF80], v5, v6);
  }

  return v14;
}

id getHashFromAssetIdAttributes(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [v4 keyEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    do
    {
      if (isAttributePartOfAssetIdHash(v8)) {
        [v5 addObject:v8];
      }
      uint64_t v9 = [v6 nextObject];

      uint64_t v8 = (void *)v9;
    }
    while (v9);
  }
  uint64_t v10 = getHashFromAttributesInSet(v3, v4, v5);

  return v10;
}

id getHashFromNonAssetIdAttributes(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [v4 keyEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    do
    {
      if ((isAttributePartOfAssetIdHash(v8) & 1) == 0) {
        [v5 addObject:v8];
      }
      uint64_t v9 = [v6 nextObject];

      uint64_t v8 = (void *)v9;
    }
    while (v9);
  }
  uint64_t v10 = getHashFromAttributesInSet(v3, v4, v5);

  return v10;
}

id attributesInPallasDynamicAssetId()
{
  if (attributesInPallasDynamicAssetId_once != -1) {
    dispatch_once(&attributesInPallasDynamicAssetId_once, &__block_literal_global_2664);
  }
  id v0 = (void *)attributesInPallasDynamicAssetId__pallasDynamicAssetIdAttributes;
  return v0;
}

void __attributesInPallasDynamicAssetId_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"AssetType";
  v4[1] = @"Ramp";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)attributesInPallasDynamicAssetId__pallasDynamicAssetIdAttributes;
  attributesInPallasDynamicAssetId__pallasDynamicAssetIdAttributes = v2;
}

id attributesInDownloadContent()
{
  if (attributesInDownloadContent_once != -1) {
    dispatch_once(&attributesInDownloadContent_once, &__block_literal_global_2666);
  }
  id v0 = (void *)attributesInDownloadContent__downloadContentAttributes;
  return v0;
}

void __attributesInDownloadContent_block_invoke()
{
  void v4[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"_DownloadSize";
  v4[1] = @"_Measurement";
  v4[2] = @"_MeasurementAlgorithmn";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)attributesInDownloadContent__downloadContentAttributes;
  attributesInDownloadContent__downloadContentAttributes = v2;
}

id attributesInDownloadUrl()
{
  if (attributesInDownloadUrl_once != -1) {
    dispatch_once(&attributesInDownloadUrl_once, &__block_literal_global_2668);
  }
  id v0 = (void *)attributesInDownloadUrl__downloadUrlAttributes;
  return v0;
}

void __attributesInDownloadUrl_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"__BaseURL";
  v4[1] = @"__RelativePath";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)attributesInDownloadUrl__downloadUrlAttributes;
  attributesInDownloadUrl__downloadUrlAttributes = v2;
}

id attributesInDownloadPolicy()
{
  if (attributesInDownloadPolicy_once != -1) {
    dispatch_once(&attributesInDownloadPolicy_once, &__block_literal_global_2670);
  }
  id v0 = (void *)attributesInDownloadPolicy__downloadPolicyAttributes;
  return v0;
}

void __attributesInDownloadPolicy_block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"__CanUseLocalCacheServer";
  v4[1] = @"_CompressionAlgorithm";
  v4[2] = @"_IsZipStreamable";
  void v4[3] = @"_UnarchivedSize";
  void v4[4] = @"__AssetDefaultGarbageCollectionBehavior";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)attributesInDownloadPolicy__downloadPolicyAttributes;
  attributesInDownloadPolicy__downloadPolicyAttributes = v2;
}

uint64_t categoryClean(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t categoryInverse(int a1)
{
  return ~a1 & 0x1FFLL;
}

uint64_t categoryUnion(unsigned int a1, int a2)
{
  return (a2 | a1) & 0x1FFLL;
}

uint64_t categoryIntersection(int a1, unsigned int a2)
{
  return a1 & a2 & 0x1FFLL;
}

BOOL isCategoryNone(__int16 a1)
{
  return (a1 & 0x1FF) == 0;
}

BOOL isCategoryIn(int a1, int a2)
{
  return (a1 & ~a2 & 0x1FFLL) == 0;
}

id categorySimpleName(unint64_t a1)
{
  unint64_t v1 = a1 & 0x1FF;
  if (v1 == 511)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_All;
LABEL_25:
    id v3 = v2;
    goto LABEL_26;
  }
  if ((a1 & 1) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_AssetType;
    goto LABEL_25;
  }
  if ((a1 & 2) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_AssetId;
    goto LABEL_25;
  }
  if ((a1 & 0x20) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_DownloadContent;
    goto LABEL_25;
  }
  if ((a1 & 0x40) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_DownloadUrl;
    goto LABEL_25;
  }
  if ((a1 & 0x80) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_DownloadPolicy;
    goto LABEL_25;
  }
  if ((a1 & 0x100) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_PallasDynamicAssetId;
    goto LABEL_25;
  }
  if ((a1 & 0x10) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_NonAssetId;
    goto LABEL_25;
  }
  if ((a1 & 8) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_AssetIdAttributes;
    goto LABEL_25;
  }
  if ((a1 & 4) == v1)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_AnyAttribute;
    goto LABEL_25;
  }
  if ((a1 & 0x1FF) == 0)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_None;
    goto LABEL_25;
  }
  if (a1 <= 0x1FF)
  {
    uint64_t v2 = (void *)kMADiffCategoryName_Some;
    goto LABEL_25;
  }
  id v3 = [NSString stringWithFormat:@"%@%ld", kMADiffCategoryName_Unknown, a1];
LABEL_26:
  return v3;
}

id categoryCompoundName(unint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
  if (kMADiffCategory_BaseCount)
  {
    unint64_t v3 = 0;
    unsigned __int16 v4 = 0;
    unint64_t v5 = a1;
    do
    {
      uint64_t v6 = (void *)MEMORY[0x1B3EAACB0]();
      unint64_t v7 = kMADiffCategory_Bases[v3];
      if ((~a1 & v7 & 0x1FF) == 0)
      {
        if ([v2 length]) {
          [v2 appendString:@" "];
        }
        unsigned __int16 v4 = (v7 | v4) & 0x1FF;
        v5 &= v7 & 0x1FF ^ 0x1FF;
        uint64_t v8 = categorySimpleName(v7);
        [v2 appendString:v8];
      }
      ++v3;
    }
    while (kMADiffCategory_BaseCount > v3);
  }
  else
  {
    unsigned __int16 v4 = 0;
    unint64_t v5 = a1;
  }
  if ((v5 & 0x1FF) != 0)
  {
    if ([v2 length]) {
      [v2 appendString:@" "];
    }
    v5 &= ~((unsigned __int16)v5 | v4) | 0xFFFFFFFFFFFFFE00;
    [v2 appendString:kMADiffCategoryName_Some];
  }
  if (v5 >= 0x200)
  {
    if ([v2 length]) {
      [v2 appendString:@" "];
    }
    [v2 appendString:kMADiffCategoryName_Unknown];
  }
  [v2 appendString:@""]);
  return v2;
}

id categoryAssessDiffAndMask(unint64_t a1, unint64_t a2)
{
  unsigned __int16 v4 = @"(from newer)";
  unint64_t v5 = @"(from newer, subset)";
  if (a2 < 0x200)
  {
    unsigned __int16 v4 = &stru_1F0A75970;
    unint64_t v5 = @"(from older)";
  }
  uint64_t v6 = NSString;
  if ((~(_WORD)a2 & 0x1FF) != 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v4;
  }
  uint64_t v8 = categoryCompoundName(a1);
  uint64_t v9 = (void *)v8;
  uint64_t v10 = @"+";
  if (a1 < 0x200) {
    uint64_t v10 = &stru_1F0A75970;
  }
  id v11 = [v6 stringWithFormat:@"%0lx/%0lx %@%@%@", a1, a2, v8, v10, v7];

  return v11;
}

void __getRetryXpcDelayQueue_block_invoke_0()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileAsset.retryXpcDelay", v2);
  unint64_t v1 = (void *)getRetryXpcDelayQueue_retryQueue_0;
  getRetryXpcDelayQueue_retryQueue_0 = (uint64_t)v0;
}

id queryDecodeClasses()
{
  if (queryDecodeClasses_once != -1) {
    dispatch_once(&queryDecodeClasses_once, &__block_literal_global_5);
  }
  dispatch_queue_t v0 = (void *)queryDecodeClasses__queryDecodeClasses;
  return v0;
}

void __queryDecodeClasses_block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  unint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:11];
  uint64_t v2 = objc_msgSend(v0, "initWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  unint64_t v3 = (void *)queryDecodeClasses__queryDecodeClasses;
  queryDecodeClasses__queryDecodeClasses = v2;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t _MAPreferencesIsVerboseLoggingEnabled()
{
  if (_MAPreferencesIsVerboseLoggingEnabled_onceToken != -1) {
    dispatch_once(&_MAPreferencesIsVerboseLoggingEnabled_onceToken, &__block_literal_global_1173);
  }
  return _MAPreferencesIsVerboseLoggingEnabled__verboseLoggingEnabled;
}

id progressDictionaryForAssetIdAndState(void *a1, unint64_t a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2 <= 6 && ((1 << a2) & 0x6C) != 0)
  {
    id v13 = v3;
    uint64_t v5 = [NSNumber numberWithInteger:1];
    v14[0] = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = (void **)v14;
    uint64_t v8 = &v13;
  }
  else
  {
    id v11 = v3;
    uint64_t v5 = [NSNumber numberWithInteger:0];
    uint64_t v12 = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = &v12;
    uint64_t v8 = &v11;
  }
  uint64_t v9 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:1];

  return v9;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1B278F634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ASSetAssetServerURL(void *a1)
{
}

void ASSetAssetServerURLForAssetType(void *a1, void *a2)
{
  id v11 = a1;
  id v3 = a2;
  uint64_t v4 = [v11 absoluteString];
  uint64_t v5 = MASetServerUrlOverride(v3, v4);

  if (v5)
  {
    uint64_t v10 = MAStringForMAOperationResult(v5);
    _MobileAssetLog(0, 3, (uint64_t)"ASSetAssetServerURLForAssetType", @"Could not set server URL in daemon: %lld %@ for url: %@", v6, v7, v8, v9, v5);
  }
}

void ASSetDefaultAssetServerURLForAssetType(void *a1, void *a2)
{
  id v11 = a1;
  id v3 = a2;
  uint64_t v4 = [v11 absoluteString];
  uint64_t v5 = MASetServerUrlFallbackDefault(v3, v4);

  if (v5)
  {
    uint64_t v10 = MAStringForMAOperationResult(v5);
    _MobileAssetLog(0, 3, (uint64_t)"ASSetDefaultAssetServerURLForAssetType", @"Could not set server URL in daemon: %lld %@ for url: %@", v6, v7, v8, v9, v5);
  }
}

uint64_t __ForceMigration(uint64_t a1)
{
  return _MASendDataMigrator(a1, 1);
}

uint64_t ASNonUserInitiatedDownloadsAllowed(void *a1)
{
  return ASNonUserInitiatedDownloadsAllowedForAssetType(0, a1);
}

uint64_t ASNonUserInitiatedDownloadsAllowedForAssetType(uint64_t a1, void *a2)
{
  id v8 = 0;
  uint64_t v3 = MANonUserInitiatedDownloadsAllowedForAssetType(a1, &v8);
  id v4 = v8;
  uint64_t v5 = v4;
  if (a2)
  {
    if (v4)
    {
      _ASErrorForMAError(v4);
      id v6 = objc_claimAutoreleasedReturnValue();
      *a2 = v6;
    }
    else
    {
      *a2 = 0;
    }
  }

  return v3;
}

void ASEnsureDataVault(void *a1, void *a2)
{
  id v7 = a1;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v26 = 0;
    char v8 = MAEnsureDataVault(v7, &v26);
    id v13 = v26;
    if ((v8 & 1) == 0)
    {
      uint64_t v14 = _ASCreateError(@"MobileAssetError", 32, 0, @"Cannot confirm that data vault exists", v9, v10, v11, v12, v23);

      uint64_t v24 = [NSString stringWithFormat:@"Cannot confirm that data vault exists"];
      _MobileAssetLog(0, 6, (uint64_t)"ASEnsureDataVault", @"[%@:%d] %@", v15, v16, v17, v18, @"MobileAssetError");

      id v13 = (id)v14;
    }
  }
  else
  {
    _ASCreateError(@"MobileAssetError", 32, 0, @"Cannot create data vault for an invalid asset type", v3, v4, v5, v6, v23);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [NSString stringWithFormat:@"Cannot create data vault for an invalid asset type"];
    _MobileAssetLog(0, 6, (uint64_t)"ASEnsureDataVault", @"[%@:%d] %@", v19, v20, v21, v22, @"MobileAssetError");
  }
  if (a2) {
    *a2 = v13;
  }
}

uint64_t MobileAssetQueryGetTypeID()
{
  return _MobileAssetQueryTypeID;
}

uint64_t MobileAssetQueryCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t MobileAssetQueryCreateArrayOfKnownAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t MobileAssetQueryRefreshKnownAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t MobileAssetQueryGetMatchingAsset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t MobileAssetQueryRefreshAssetsAgainstLocalCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

void sub_1B2792E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1B2793198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1B27933D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2796D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B279783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B27982FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B2798C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B2799910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v50 - 232), 8);
  _Block_object_dispose((const void *)(v50 - 184), 8);
  _Block_object_dispose((const void *)(v50 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B279A3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B279AD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B279B620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B279BCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B279C57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__634(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__635(uint64_t a1)
{
}

void sub_1B279C884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1B27A3D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A48E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A5744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A6168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A6BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A7610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A87A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27A95E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Block_object_dispose((const void *)(v37 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27AA2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B27AB670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B27AC3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B27ACEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27AD960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27AE3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1B27B1C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1B27B25C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B2AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B3858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B41D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B4B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B54D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B5DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B65E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B6DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B7638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B7E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B87D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B27B90F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

MAAssetDiff *allowableDiffFromCategories(__int16 a1)
{
  uint64_t v1 = categoryClean(a1);
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:v1];
  [v2 encodeObject:v3 forKey:@"diffBits"];

  uint64_t v4 = [NSNumber numberWithUnsignedInteger:511];
  [v2 encodeObject:v4 forKey:@"diffMask"];

  [v2 finishEncoding];
  uint64_t v5 = [v2 encodedData];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
  id v7 = [[MAAssetDiff alloc] initWithCoder:v6];

  return v7;
}

uint64_t MAGetPallasEnabled(void *a1, char *a2)
{
  char v4 = 1;
  uint64_t result = _MAsendGetPallasEnabled(a1, (BOOL *)&v4);
  if (a2) {
    *a2 = v4;
  }
  return result;
}

uint64_t MASetPallasAudience(void *a1)
{
  return _MAsendSetPallasAudience(a1, 0);
}

BOOL MANonUserInitiatedDownloadsAllowed()
{
  return _MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType(0);
}

void MAPurgeAll(void *a1, void *a2)
{
}

void MAPurgeAllWithPurposeExceptGivenIds(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __MAPurgeAllWithPurposeExceptGivenIds_block_invoke;
  v9[3] = &unk_1E6005B08;
  id v10 = v7;
  id v8 = v7;
  _MAPurgeAll(a1, a2, a3, v9);
}

void MAPurgeAllExceptGivenIds(void *a1, void *a2, void *a3)
{
}

void MAPurgeAllWithPurpose(void *a1, void *a2, void *a3)
{
}

void __MAPurgeAllWithPurposeExceptGivenIds_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v11 = errorStringForMAPurgeResult(1);
    char v4 = MAError(@"com.apple.MobileAssetError.Purge", 1, @"%@ due to XPC_TYPE_ERROR", v12, v13, v14, v15, v16, (uint64_t)v11);

    _MobileAssetLog(0, 6, (uint64_t)"MAPurgeAllWithPurposeExceptGivenIds_block_invoke", @"Asset purge all with exceptions failed due to XPC", v17, v18, v19, v20, v22);
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
    char v4 = (void *)int64;
    if (int64)
    {
      uint64_t v5 = errorStringForPurgeResult(int64);
      char v4 = MAError(@"com.apple.MobileAssetError.Purge", (uint64_t)v4, @"%@", v6, v7, v8, v9, v10, (uint64_t)v5);
    }
  }
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v4);
  }
}

void MAPurgeCatalogs(void *a1, void *a2)
{
}

void MAPurgeCatalogsWithPurpose(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MAPurgeCatalogsWithPurpose_block_invoke;
  v7[3] = &unk_1E6005B08;
  id v8 = v5;
  id v6 = v5;
  _MAPurgeCatalogs(a1, a2, v7);
}

void __MAPurgeCatalogsWithPurpose_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1B3EAB1B0]() == MEMORY[0x1E4F145A8])
  {
    uint64_t v11 = errorStringForMAPurgeResult(1);
    char v4 = MAError(@"com.apple.MobileAssetError.Purge", 1, @"%@ due to XPC_TYPE_ERROR", v12, v13, v14, v15, v16, (uint64_t)v11);

    _MobileAssetLog(0, 6, (uint64_t)"MAPurgeCatalogsWithPurpose_block_invoke", @"Asset purge catalogs failed due to XPC", v17, v18, v19, v20, v22);
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
    char v4 = (void *)int64;
    if (int64)
    {
      id v5 = errorStringForPurgeResult(int64);
      char v4 = MAError(@"com.apple.MobileAssetError.Purge", (uint64_t)v4, @"%@", v6, v7, v8, v9, v10, (uint64_t)v5);
    }
  }
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v4);
  }
}

void MASoftwareLookupStartDownload(void *a1, void *a2)
{
}

id MASoftwareLookupQuery(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12 = 0;
  uint64_t v8 = _MAsendPMVQuerySync(a1, a2, a3, a4, a5, a6, &v12);
  id v9 = v12;
  uint64_t v10 = v9;
  if (a7 && v9) {
    *a7 = v9;
  }

  return v8;
}

id MASoftwareLookupQueryVersionsOnly(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v38 = 0;
  uint64_t v33 = v15;
  id v31 = a6;
  uint64_t v32 = v16;
  uint64_t v17 = MASoftwareLookupQuery(a1, v13, v14, v15, v16, v31, &v38);
  id v18 = v38;
  id v19 = v18;
  if (a7 && v18) {
    *a7 = v18;
  }
  uint64_t v30 = v19;
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v17;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v27 = (void *)MEMORY[0x1B3EAACB0]();
        uint64_t v28 = [v26 objectForKey:@"ProductVersion"];
        if (v28)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (!v14 || [v28 hasPrefix:v14])
            && ([v20 containsObject:v28] & 1) == 0)
          {
            [v20 addObject:v28];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v23);
  }

  [v20 sortUsingComparator:&__block_literal_global_11];
  return v20;
}

uint64_t __MASoftwareLookupQueryVersionsOnly_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = [a2 compare:a3 options:64];
  if (v3 == 1) {
    return -1;
  }
  else {
    return v3 == -1;
  }
}

uint64_t MALogClientWithNSLogOSLog(uint64_t a1, char a2)
{
  return MobileAssetForceNSLog(a1, a2 ^ 1u);
}

uint64_t MALogClientWithNSLogOSLogStdOut(uint64_t a1, char a2)
{
  return MobileAssetForceNSLog(a1, a2 ^ 1u);
}

id _MABrainGetInfo()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"Error";
  id v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28228];
  uint64_t v8 = @"Error getting MobileAssetBrain info";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  uint64_t v2 = [v0 errorWithDomain:@"MobileAssetBrainErrorDomain" code:901 userInfo:v1];
  v10[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v6 = v3;
  _MAclientSendGetMABrainInfo(&v6);
  id v4 = v6;

  return v4;
}

id _MABrainUpdate(void *a1)
{
  id v3 = 0;
  _MAclientSendUpdateMABrain(a1, &v3);
  id v1 = v3;
  return v1;
}

id _SecureMABundleCommand(uint64_t a1, void *a2)
{
  id v4 = 0;
  _MAclientSendSecureMABundleCommand(a1, a2, &v4);
  id v2 = v4;
  return v2;
}

void sub_1B27BE81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B27BED58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1B27BEEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __logError_block_invoke()
{
  logError_infoError = (uint64_t)os_log_create("com.apple.mobileassetd", "Error");
  return MEMORY[0x1F41817F8]();
}

id logDebug()
{
  if (logDebug_logDebugOnce != -1) {
    dispatch_once(&logDebug_logDebugOnce, &__block_literal_global_272);
  }
  id v0 = (void *)logDebug_infoDebug;
  return v0;
}

uint64_t __logDebug_block_invoke()
{
  logDebug_infoDebug = (uint64_t)os_log_create("com.apple.mobileassetd", "Debug");
  return MEMORY[0x1F41817F8]();
}

id logFault()
{
  if (logFault_logFaultOnce != -1) {
    dispatch_once(&logFault_logFaultOnce, &__block_literal_global_275);
  }
  id v0 = (void *)logFault_infoFault;
  return v0;
}

uint64_t __logFault_block_invoke()
{
  logFault_infoFault = (uint64_t)os_log_create("com.apple.mobileassetd", "Fault");
  return MEMORY[0x1F41817F8]();
}

void _MobileAssetFault(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = (objc_class *)NSString;
  id v10 = a2;
  uint64_t v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  id v12 = logFault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    _MobileAssetFault_cold_1();
  }
}

uint64_t MobileAssetForceNSLog(uint64_t result, char a2)
{
  gForceNSLog = result;
  gExclusivelyNSLog = a2;
  return result;
}

id _getV1DecodeClasses()
{
  if (_getV1DecodeClasses_once != -1) {
    dispatch_once(&_getV1DecodeClasses_once, &__block_literal_global_14);
  }
  id v0 = (void *)_getV1DecodeClasses_v1DecodeClasses;
  return v0;
}

void ___getV1DecodeClasses_block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:15];
  uint64_t v2 = objc_msgSend(v0, "initWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  id v3 = (void *)_getV1DecodeClasses_v1DecodeClasses;
  _getV1DecodeClasses_v1DecodeClasses = v2;
}

id createErrorFromMessage(void *a1)
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a1, "Error", &length);
  if (data)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
    if (v10)
    {
      id v32 = 0;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:&v32];
      id v12 = v32;
      if (v11) {
        BOOL v17 = v12 == 0;
      }
      else {
        BOOL v17 = 0;
      }
      if (v17)
      {
        uint64_t v20 = _getV1DecodeClasses();
        uint64_t v19 = [v11 decodeObjectOfClasses:v20 forKey:*MEMORY[0x1E4F284E8]];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", @"createErrorFromMessage: Successfully created error: %@", v21, v22, v23, v24, (uint64_t)v19);
        }
        else
        {

          _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", @"createErrorFromMessage: created object was not an error", v25, v26, v27, v28, v31);
          uint64_t v19 = 0;
        }
        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v18 = v12;
        _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", @"createErrorFromMessage: unarchiver cannot be created: %@", v13, v14, v15, v16, (uint64_t)v12);
        uint64_t v19 = 0;
      }
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", @"createErrorFromMessage: errorInMessage is nil ", v6, v7, v8, v9, v31);
      uint64_t v19 = 0;
      uint64_t v18 = 0;
      uint64_t v11 = 0;
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", @"createErrorFromMessage: data is nil ", v2, v3, v4, v5, v31);
    uint64_t v19 = 0;
    uint64_t v18 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }
  [v11 finishDecoding];
  id v29 = v19;

  return v29;
}

void sub_1B27C722C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1B27C7C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27C866C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose((const void *)(v48 - 248), 8);
  _Block_object_dispose((const void *)(v48 - 200), 8);
  _Block_object_dispose((const void *)(v48 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B27C94B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Block_object_dispose((const void *)(v40 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CA294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CAEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CB900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CC178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CCAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CD510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 160), 8);
  _Block_object_dispose((const void *)(v34 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CECE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B27CF8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__747(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__748(uint64_t a1)
{
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id _ASCreateError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
  id v15 = a1;
  uint64_t v16 = [v14 dictionary];
  if (v13)
  {
    BOOL v17 = (void *)[[NSString alloc] initWithFormat:v13 arguments:&a9];
    if (v17) {
      [v16 setObject:v17 forKey:*MEMORY[0x1E4F1D140]];
    }
  }
  if (v12) {
    [v16 setObject:v12 forKey:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  if ([v16 count]) {
    uint64_t v19 = v16;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [v18 errorWithDomain:v15 code:a2 userInfo:v19];

  return v20;
}

__CFString *_ASStateForMobileAssetState(void *a1)
{
  id v1 = a1;
  if ([(__CFString *)v1 isEqualToString:@"WaitingToDownload"])
  {
    uint64_t v2 = ASOperationWaitingToDownload;
LABEL_13:
    uint64_t v3 = *v2;
    goto LABEL_14;
  }
  if ([(__CFString *)v1 isEqualToString:@"DownloadStalled"])
  {
    uint64_t v2 = ASOperationStalled;
    goto LABEL_13;
  }
  if ([(__CFString *)v1 isEqualToString:@"DownloadingAsset"])
  {
    uint64_t v2 = ASOperationDownloadingAsset;
    goto LABEL_13;
  }
  if ([(__CFString *)v1 isEqualToString:@"DownloadPaused"])
  {
    uint64_t v2 = ASOperationDownloadPaused;
    goto LABEL_13;
  }
  if ([(__CFString *)v1 isEqualToString:@"VerifyingAsset"])
  {
    uint64_t v2 = ASOperationVerifyingAsset;
    goto LABEL_13;
  }
  if ([(__CFString *)v1 isEqualToString:@"UnarchivingAsset"])
  {
    uint64_t v2 = ASOperationUnarchivingAsset;
    goto LABEL_13;
  }
  int v6 = [(__CFString *)v1 isEqualToString:@"OperationCompleted"];
  uint64_t v3 = @"OperationCompleted";
  if (!v6) {
    uint64_t v3 = v1;
  }
LABEL_14:
  uint64_t v4 = v3;

  return v4;
}

uint64_t _ASErrorCodeForMobileAssetErrorCode(unint64_t a1)
{
  if (a1 > 0x21) {
    return -1;
  }
  else {
    return qword_1B27E3578[a1];
  }
}

id _ASErrorForV1Deprecation(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  uint64_t v3 = [v1 dictionary];
  uint64_t v4 = [NSString stringWithFormat:@"Deprecated ASAsset API is no longer supported: '%@'", v2];

  [v3 setValue:v4 forKey:*MEMORY[0x1E4F28568]];
  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASError" code:33 userInfo:v3];

  return v5;
}

id _ASErrorForMAError(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 userInfo];
    if (v3)
    {
      id v15 = v2;
      uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id obj = [v3 keyEnumerator];
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v10 = (void *)MEMORY[0x1B3EAACB0]();
            if ([v9 isEqualToString:@"Operation"])
            {
              uint64_t v11 = [v3 objectForKey:@"Operation"];
              id v12 = _ASStateForMobileAssetState(v11);
              [v4 setObject:v12 forKey:@"Operation"];
            }
            else
            {
              uint64_t v11 = [v3 objectForKey:v9];
              [v4 setObject:v11 forKey:v9];
            }
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v6);
      }

      id v2 = v15;
    }
    else
    {
      uint64_t v4 = 0;
    }
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ASError", _ASErrorCodeForMobileAssetErrorCode(objc_msgSend(v2, "code")), v4);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id MAPushServiceInterface()
{
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A9F7A8];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_subscribedChannelIDsWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_triggerPushNotificationWithPayload_ argumentIndex:0 ofReply:0];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v0 setClasses:v13 forSelector:sel_pushJobsAwaitingTriggerWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t MAServiceClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A9A840];
}

unsigned __int8 *_hashCFStringOfLength(const __CFString *a1, CFIndex length, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (length >= 0x7FFFFFFF) {
    _hashCFStringOfLength_cold_1((uint64_t)a1, length, a3, a4, a5, a6, a7, a8);
  }
  char v8 = a3;
  if ((a3 & 1) == 0)
  {
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(length, 0x8000100u);
    size_t length = MaximumSizeForEncoding;
    if (MaximumSizeForEncoding >= 0x7FFFFFFF) {
      _hashCFStringOfLength_cold_3(MaximumSizeForEncoding, MaximumSizeForEncoding, v11, v12, v13, v14, v15, v16);
    }
  }
  CFIndex v17 = length + 1;
  long long v18 = (char *)malloc_type_calloc(1uLL, length + 1, 0xB8C7522CuLL);
  uint64_t CString = CFStringGetCString(a1, v18, v17, 0x8000100u);
  if (!CString && (v8 & 1) == 0) {
    _hashCFStringOfLength_cold_2(CString, v20, v21, v22, v23, v24, v25, v26);
  }
  uint64_t v27 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xD3FF0C7CuLL);
  CC_SHA1(v18, v17, v27);
  free(v18);
  return v27;
}

unsigned __int8 *_hashCFDataOfLength(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 0x80000000) {
    _hashCFDataOfLength_cold_1((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  }
  CC_LONG v8 = a2;
  uint64_t v10 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xCCA769C6uLL);
  BytePtr = CFDataGetBytePtr(a1);
  CC_SHA1(BytePtr, v8, v10);
  return v10;
}

void *_hashCFDictionary(const __CFDictionary *a1, uint64_t a2)
{
  if (CFDictionaryGetCount(a1) || (a2 & 1) == 0)
  {
    memset(&c, 0, sizeof(c));
    uint64_t v5 = (void *)_hashCFType(@"dictionary", a2);
    CFIndex Count = CFDictionaryGetCount(a1);
    CFIndex valuePtr = Count;
    uint64_t v7 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
    if (!v7)
    {
      if (v5) {
        free(v5);
      }
      return 0;
    }
    CC_LONG v8 = v7;
    CFDictionaryGetKeysAndValues(a1, v7, 0);
    if (Count < 1)
    {
LABEL_16:
      if (a2)
      {
        uint64_t v4 = v5;
LABEL_33:
        free(v8);
        return v4;
      }
      CFNumberRef v17 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
      long long v18 = _hashCFNumber(v17);
      if (v17) {
        CFRelease(v17);
      }
      if (v5 && v18)
      {
        memset(&v23, 0, sizeof(v23));
        CC_SHA1_Init(&v23);
        CC_SHA1_Update(&v23, v5, 0x14u);
        CC_SHA1_Update(&v23, v18, 0x14u);
        CC_SHA1_Final((unsigned __int8 *)v5, &v23);
        long long v19 = v5;
      }
      else
      {
        long long v19 = v5;
        uint64_t v4 = v5;
        if (!v18) {
          goto LABEL_33;
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = (void *)_hashCFType(v8[v9], a2);
        Value = CFDictionaryGetValue(a1, v8[v9]);
        uint64_t v12 = (void *)_hashCFType(Value, a2);
        uint64_t v13 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xC35AC6E0uLL);
        uint64_t v14 = v13;
        if (!v13) {
          break;
        }
        if (!v10 || v12 == 0) {
          break;
        }
        CC_SHA1_Init(&c);
        CC_SHA1_Update(&c, v10, 0x14u);
        CC_SHA1_Update(&c, v12, 0x14u);
        CC_SHA1_Final(v14, &c);
        if (v5)
        {
          for (uint64_t i = 0; i != 20; ++i)
            *((unsigned char *)v5 + i) ^= v14[i];
        }
        free(v14);
        free(v10);
        free(v12);
        if (Count <= ++v9) {
          goto LABEL_16;
        }
      }
      if (v13) {
        free(v13);
      }
      if (v10) {
        free(v10);
      }
      if (v12) {
        free(v12);
      }
      long long v19 = 0;
      uint64_t v4 = 0;
      long long v18 = (unsigned __int8 *)v5;
      if (!v5) {
        goto LABEL_33;
      }
    }
    free(v18);
    uint64_t v4 = v19;
    goto LABEL_33;
  }
  return 0;
}

unsigned __int8 *_hashCFType(const __CFString *a1, uint64_t a2)
{
  if (!a1)
  {
    if ((a2 & 1) == 0)
    {
      CFIndex Length = CFStringGetLength(@"NULL");
      CFStringRef v14 = @"NULL";
      uint64_t v15 = 0;
      goto LABEL_9;
    }
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFBooleanGetTypeID())
  {
    uint64_t v5 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6DDBB9C1uLL);
    Boolean Value = CFBooleanGetValue((CFBooleanRef)a1);
    p_Boolean Value = &Value;
    CC_LONG v7 = 1;
LABEL_14:
    CC_SHA1(p_Value, v7, v5);
    return v5;
  }
  if (v4 == CFStringGetTypeID())
  {
    CFIndex Length = CFStringGetLength(a1);
    CFStringRef v14 = a1;
    uint64_t v15 = a2;
LABEL_9:
    return _hashCFStringOfLength(v14, Length, v15, v9, v10, v11, v12, v13);
  }
  if (v4 == CFDateGetTypeID())
  {
    uint64_t v5 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xD609C58EuLL);
    double data = MEMORY[0x1B3EAA8E0](a1);
    p_Boolean Value = (Boolean *)&data;
    CC_LONG v7 = 8;
    goto LABEL_14;
  }
  if (v4 == CFDataGetTypeID())
  {
    CFIndex v17 = CFDataGetLength((CFDataRef)a1);
    return _hashCFDataOfLength((const __CFData *)a1, v17, v18, v19, v20, v21, v22, v23);
  }
  if (v4 == CFArrayGetTypeID())
  {
    if (a2)
    {
      return _hashCFArrayLegacy((const __CFArray *)a1);
    }
    else
    {
      return _hashCFArrayNoLegacy((const __CFArray *)a1);
    }
  }
  if (v4 == CFDictionaryGetTypeID())
  {
    return (unsigned __int8 *)_hashCFDictionary((const __CFDictionary *)a1, a2);
  }
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  return _hashCFNumber((const __CFNumber *)a1);
}

unsigned __int8 *_hashCFNumber(const __CFNumber *a1)
{
  uint64_t v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x24FC56B0uLL);
  uint64_t valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE) {
    size_t v3 = 8;
  }
  else {
    size_t v3 = 4;
  }
  if ((unint64_t)(valuePtr + 1) < 0xE) {
    CFNumberType v4 = kCFNumberSInt32Type;
  }
  else {
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  uint64_t v5 = malloc_type_calloc(1uLL, v3, 0x8DF0DFD0uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

CFStringRef _hashToCFString(unsigned __int8 *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], __str, 0x8000100u);
}

CFStringRef _MobileAssetHashAssetDataOptCompatibility(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4)
{
  uint64_t v6 = _hashCFType(a2, a4);
  if (!v6)
  {
    CC_LONG v8 = 0;
    goto LABEL_7;
  }
  CC_LONG v7 = _hashCFType(a3, a4);
  CC_LONG v8 = v7;
  if (!v7)
  {
LABEL_7:
    CFStringRef v10 = 0;
    goto LABEL_8;
  }
  for (uint64_t i = 0; i != 20; ++i)
    v6[i] ^= v7[i];
  CFStringRef v10 = _hashToCFString(v6);
LABEL_8:
  free(v6);
  free(v8);
  return v10;
}

CFStringRef _MobileAssetHashAssetData(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return _MobileAssetHashAssetDataOptCompatibility(a1, a2, a3, 1);
}

CFStringRef _MobileAssetHashAssetDataNoLegacy(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return _MobileAssetHashAssetDataOptCompatibility(a1, a2, a3, 0);
}

unsigned char *_hashCFArrayLegacy(const __CFArray *a1)
{
  if (!CFArrayGetCount(a1)) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v3 = Count;
    CFIndex v4 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      v17.location = 0;
      v17.size_t length = v3;
      if (CFArrayGetCountOfValue(a1, v17, ValueAtIndex) >= 2) {
        break;
      }
      if (v3 == ++v4) {
        goto LABEL_6;
      }
    }
    _MobileAssetLog(0, 6, (uint64_t)"_hashCFArrayLegacy", @"Failing to hash due to duplicate array entries", v6, v7, v8, v9, v16);
    return 0;
  }
LABEL_6:
  CFStringRef v10 = (unsigned char *)_hashCFType(@"array", 1);
  if (CFArrayGetCount(a1) >= 1)
  {
    CFIndex v11 = 0;
    while (1)
    {
      uint64_t v12 = CFArrayGetValueAtIndex(a1, v11);
      uint64_t v13 = (unsigned char *)_hashCFType(v12, 1);
      if (!v13) {
        break;
      }
      if (v10)
      {
        for (uint64_t i = 0; i != 20; ++i)
          v10[i] ^= v13[i];
      }
      free(v13);
      if (CFArrayGetCount(a1) <= ++v11) {
        return v10;
      }
    }
    free(v10);
    return 0;
  }
  return v10;
}

unsigned __int8 *_hashCFArrayNoLegacy(const __CFArray *a1)
{
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  uint64_t v2 = (void *)_hashCFType(@"array", 0);
  CC_SHA1_Update(&c, v2, 0x14u);
  if (v2) {
    free(v2);
  }
  uint64_t valuePtr = CFArrayGetCount(a1);
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFIndex v4 = _hashCFNumber(v3);
  CC_SHA1_Update(&c, v4, 0x14u);
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    free(v4);
  }
  CFIndex idx = 0;
  if (valuePtr >= 1)
  {
    do
    {
      CFNumberRef v5 = CFNumberCreate(0, kCFNumberCFIndexType, &idx);
      uint64_t v6 = _hashCFNumber(v5);
      CC_SHA1_Update(&c, v6, 0x14u);
      if (v5) {
        CFRelease(v5);
      }
      if (v6) {
        free(v6);
      }
      ValueAtIndex = CFArrayGetValueAtIndex(a1, idx);
      uint64_t v8 = (void *)_hashCFType(ValueAtIndex, 0);
      CC_SHA1_Update(&c, v8, 0x14u);
      if (v8) {
        free(v8);
      }
      ++idx;
    }
    while (idx < valuePtr);
  }
  uint64_t v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xA29F39CuLL);
  CC_SHA1_Final(v9, &c);
  return v9;
}

void OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _MobileAssetLog(0, 6, a3, a4, a5, a6, a7, a8, a9);
}

void _MobileAssetLog_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B275B000, v0, OS_LOG_TYPE_DEBUG, "%{public}s: %{public}@", v1, 0x16u);
}

void _MobileAssetFault_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1B275B000, v0, OS_LOG_TYPE_FAULT, "MobileAsset Simulated %{public}s: %{public}@", v1, 0x16u);
}

void _hashCFStringOfLength_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFStringOfLength", @"Received a request to hash a value that is too large, possible malicious behavior - aborting", a5, a6, a7, a8, vars0);
  abort();
}

void _hashCFStringOfLength_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFStringOfLength", @"Received a request to hash a value but could not get a C string. Possible malicious behavior - aborting", a5, a6, a7, a8, vars0);
  abort();
}

void _hashCFStringOfLength_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFStringOfLength", @"Received a request to hash a multibyte value that is too large, possible malicious behavior - aborting", a5, a6, a7, a8, vars0);
  abort();
}

void _hashCFDataOfLength_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFDataOfLength", @"Received a request to hash a value that is too large, possible malicious behavior - aborting", a5, a6, a7, a8, vars0);
  abort();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
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

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C0](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_moveWeak(id *to, id *from)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}