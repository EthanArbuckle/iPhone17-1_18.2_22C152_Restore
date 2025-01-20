void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_227040ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2270435EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_227043FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_227044428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t parseSuperBinaryHeader(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a3 && a1 && a2 >= 0x10)
  {
    *(unsigned char *)a3 = *(unsigned char *)a1;
    *(unsigned char *)(a3 + 1) = *(unsigned char *)(a1 + 1);
    *(_WORD *)(a3 + 2) = *(_WORD *)(a1 + 2);
    *(_DWORD *)(a3 + 4) = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a3 + 12) = *(_DWORD *)(a1 + 12);
    *(_WORD *)(a3 + 16) = 0;
    return 1;
  }
  return v3;
}

char *parseSuperBinaryAndPayloadHeaders(char *a1, unint64_t a2)
{
  result = 0;
  if (a1 && a2 >= 0x10)
  {
    unsigned int v4 = *((_DWORD *)a1 + 2);
    if (v4 < 0x24) {
      return 0;
    }
    unsigned int v5 = (v4 - 16) / 0x14;
    if ((v4 - 16) % 0x14) {
      return 0;
    }
    result = 0;
    unsigned int v6 = *((_DWORD *)a1 + 3);
    if (v6 > v4 && *((_DWORD *)a1 + 1) == 16)
    {
      char v7 = *a1;
      char v8 = a1[1];
      __int16 v9 = *((_WORD *)a1 + 1);
      result = (char *)malloc_type_malloc(20 * (v5 - 1) + 40, 0x2C042710uLL);
      if (result)
      {
        unsigned __int16 v10 = 0;
        char *result = v7;
        result[1] = v8;
        *((_WORD *)result + 1) = v9;
        *((_DWORD *)result + 1) = 16;
        *((_DWORD *)result + 2) = v4;
        *((_DWORD *)result + 3) = v6;
        *((_OWORD *)result + 1) = 0uLL;
        *((void *)result + 4) = 0;
        unsigned int v11 = 20;
        *((_WORD *)result + 8) = v5;
        while (1)
        {
          v12 = &result[20 * v10];
          *((_DWORD *)v12 + 5) = *(_DWORD *)&a1[v11 - 4];
          *((_DWORD *)v12 + 6) = a1[v11] | (a1[v11 + 1] << 8) | (a1[v11 + 2] << 16) | (a1[v11 + 3] << 24);
          v12[28] = a1[v11 + 4];
          v12[29] = a1[v11 + 5];
          *((_WORD *)v12 + 15) = a1[v11 + 6] | (a1[v11 + 7] << 8);
          unsigned int v13 = a1[v11 + 8] | (a1[v11 + 9] << 8) | (a1[v11 + 10] << 16) | (a1[v11 + 11] << 24);
          *((_DWORD *)v12 + 8) = v13;
          unsigned int v14 = a1[v11 + 12] | (a1[v11 + 13] << 8) | (a1[v11 + 14] << 16) | (a1[v11 + 15] << 24);
          *((_DWORD *)v12 + 9) = v14;
          LODWORD(v12) = *((_DWORD *)result + 3);
          BOOL v15 = v12 >= v14;
          unsigned int v16 = v12 - v14;
          if (v16 == 0 || !v15 || v16 < v13 || v13 < v4) {
            break;
          }
          unsigned int v4 = v14 + v13;
          ++v10;
          v11 += 20;
          if (v5 <= v10) {
            return result;
          }
        }
        free(result);
        return 0;
      }
    }
  }
  return result;
}

uint64_t updateSuperBinaryPayload(uint64_t a1, unint64_t a2, uint64_t a3, void *__src, size_t __n)
{
  uint64_t v5 = 0;
  if (a1)
  {
    if (a3)
    {
      uint64_t v5 = 0;
      if (a2 >= 0x10)
      {
        int v6 = __n;
        uint64_t v7 = *(unsigned int *)(a3 + 12);
        if (v7 + __n <= a2)
        {
          unsigned int v8 = *(_DWORD *)(a1 + 4);
          unsigned int v9 = *(_DWORD *)(a1 + 8) - v8;
          if (v9 >= 0x14)
          {
            int v10 = 0;
            unsigned int v11 = v9 / 0x14;
            while (v8 + 20 < a2)
            {
              uint64_t v12 = a1 + v8;
              if (*(_DWORD *)(v12 + 12) == v7)
              {
                if (*(unsigned int *)(v12 + 16) < __n) {
                  return 0;
                }
                memcpy((void *)(a1 + v7), __src, __n);
                *(_DWORD *)(v12 + 16) = v6;
                return 1;
              }
              ++v10;
              v8 += 20;
              if (v11 <= (unsigned __int16)v10) {
                return 0;
              }
            }
          }
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t printSuperBinaryHeader(FILE *a1, unsigned __int8 *a2)
{
  uint64_t result = fprintf(a1, "SuperBinaryHeader\n\tVersion = %d.%d.%d\n\tHdrOff  = %08x\n\tHdrLen  = %d\n\tLength  = %d\n\tPloads  = %d\n\n", *a2, a2[1], *((unsigned __int16 *)a2 + 1), *((_DWORD *)a2 + 1), *((_DWORD *)a2 + 2), *((_DWORD *)a2 + 3), *((unsigned __int16 *)a2 + 8));
  if (*((_WORD *)a2 + 8))
  {
    unint64_t v5 = 0;
    int v6 = (char *)(a2 + 20);
    do
    {
      uint64_t result = fprintf(a1, "\tPayloadHeader\n\t\tTag     = %c%c%c%c\n\t\tVersion = %d.%d.%d\n\t\tFlags   = %08x\n\t\tOff     = %08x\n\t\tLen     = %d\n", *v6, v6[1], v6[2], v6[3], v6[8], v6[9], *((unsigned __int16 *)v6 + 5), *((_DWORD *)v6 + 1), *((_DWORD *)v6 + 3), *((_DWORD *)v6 + 4));
      ++v5;
      v6 += 20;
    }
    while (v5 < *((unsigned __int16 *)a2 + 8));
  }
  return result;
}

uint64_t metadataTLVGetNext(_DWORD *a1, unint64_t a2, _DWORD *a3, unsigned int *a4, void *a5, void *a6)
{
  uint64_t result = 0;
  if (a1)
  {
    if ((unint64_t)a1 < a2)
    {
      uint64_t result = 0;
      if (a6)
      {
        if (a3 && a4 && a5)
        {
          if (((a2 - (void)a1) & 0xFFFFFFF8) != 0
            && (*a3 = *a1, v8 = a1[1], *a4 = v8, unsigned int v9 = a2 - a1 - 8, v9 >= v8))
          {
            int v10 = a1 + 2;
            if (v8) {
              unsigned int v11 = v10;
            }
            else {
              unsigned int v11 = 0;
            }
            *a5 = v11;
            uint64_t v12 = (char *)v10 + v8;
            if (v9 == v8) {
              uint64_t v12 = 0;
            }
            *a6 = v12;
            return 1;
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a1) {
    v1 = a1;
  }
  else {
    v1 = MEMORY[0x263EF8438];
  }
  bzero(v3, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      AUSandboxPlatformInitWithBundleIdentifier_cold_2();
    }
    return 1;
  }
  if (!confstr(65537, v3, 0x400uLL))
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      AUSandboxPlatformInitWithBundleIdentifier_cold_1();
    }
    return 1;
  }
  return 0;
}

uint64_t MAUError(int a1, uint64_t a2)
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  unint64_t v5 = v4;
  if (a2) {
    [v4 setObject:a2 forKey:*MEMORY[0x263F08320]];
  }
  int v6 = (void *)MEMORY[0x263F087E8];
  return [v6 errorWithDomain:@"com.apple.MobileAccessoryUpdater" code:a1 userInfo:v5];
}

uint64_t archivedKeyedData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  objc_msgSend(v4, "encodeObject:forKey:", a2, objc_msgSend(NSString, "stringWithUTF8String:", a1));
  uint64_t v5 = [v4 encodedData];

  return v5;
}

uint64_t unarchivedKeyedObject(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = 0;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:a2 error:&v21];
  [v3 setDecodingFailurePolicy:0];
  if (v3) {
    BOOL v10 = v21 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0), objc_msgSend(NSString, "stringWithUTF8String:", a1));
    [v3 finishDecoding];
  }
  else
  {
    FudLog(3, @"Failed to create unarchiver object", v4, v5, v6, v7, v8, v9, v20);
    return 0;
  }
  return v11;
}

#error "2270451D0: call analysis failed (funcsize=17)"

uint64_t objectFromXpcDictionary(void *a1, const char *a2)
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a1, a2, &length);
  if (!data) {
    return 0;
  }
  uint64_t v4 = data;
  id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v6 = (void *)[v5 initWithBytes:v4 length:length];
  uint64_t v7 = unarchivedKeyedObject((uint64_t)a2, (uint64_t)v6);

  return v7;
}

void dumpXPCObject()
{
  uint64_t v0 = MEMORY[0x22A671AE0]();
  if (v0)
  {
    uint64_t v7 = (void *)v0;
    FudLog(7, @"Dumping xpc object: %s", v1, v2, v3, v4, v5, v6, v0);
    free(v7);
  }
}

uint64_t FUDError(int a1, uint64_t a2)
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = v4;
  if (a2) {
    [v4 setObject:a2 forKey:*MEMORY[0x263F08320]];
  }
  uint64_t v6 = (void *)MEMORY[0x263F087E8];
  return [v6 errorWithDomain:@"com.apple.MobileAccessoryUpdater.fud" code:a1 userInfo:v5];
}

void addObjectToXpcDictionary(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = (void *)archivedKeyedData((uint64_t)a2, a3);
    uint64_t v6 = (const void *)[v5 bytes];
    size_t v7 = [v5 length];
    xpc_dictionary_set_data(a1, a2, v6, v7);
  }
}

void objectFinalizer(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    FudLog(5, @"Releasing xpc context:%@", a3, a4, a5, a6, a7, a8, (uint64_t)a1);
  }
}

FudProgressWeights *getProgressWeightsFromPluginInfo(FudProgressWeights *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = (void *)[(FudProgressWeights *)a1 objectForKey:@"PrepareWeight"];
    if (v2
      && ([v2 floatValue],
          int v4 = v3,
          (uint64_t v5 = (void *)[(FudProgressWeights *)v1 objectForKey:@"ApplyWeight"]) != 0)
      && ([v5 floatValue],
          int v7 = v6,
          (uint64_t v8 = (void *)[(FudProgressWeights *)v1 objectForKey:@"FinishWeight"]) != 0))
    {
      [v8 floatValue];
      int v10 = v9;
      uint64_t v11 = [FudProgressWeights alloc];
      LODWORD(v12) = v4;
      LODWORD(v13) = v7;
      LODWORD(v14) = v10;
      uint64_t v15 = [(FudProgressWeights *)v11 initWithPrepareWeight:v12 applyWeight:v13 finishWeight:v14];
      uint64_t v1 = v15;
      if (v15) {
        v22 = v15;
      }
      else {
        FudLog(3, @"Failed to create progress weights with input weights", v16, v17, v18, v19, v20, v21, v24);
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

__CFString *getOperationNameFromCode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a1 - 100;
  uint64_t result = @"Session";
  switch(v9)
  {
    case 0:
      return @"Accessory Attached";
    case 1:
      return @"Accessory Detached";
    case 7:
      return result;
    case 8:
      uint64_t v11 = kMAU_STEP_BOOTSTRAP;
      goto LABEL_15;
    case 9:
      uint64_t v11 = kMAU_STEP_FIND;
      goto LABEL_15;
    case 10:
      uint64_t v11 = kMAU_STEP_DOWNLOAD;
      goto LABEL_15;
    case 11:
      uint64_t v11 = kMAU_STEP_PREPARE;
      goto LABEL_15;
    case 12:
      uint64_t v11 = kMAU_STEP_APPLY;
      goto LABEL_15;
    case 13:
      uint64_t v11 = kMAU_STEP_FINISH;
      goto LABEL_15;
    case 14:
      uint64_t v11 = kMAU_STEP_CONTINUE;
      goto LABEL_15;
    case 15:
      uint64_t v11 = kMAU_STEP_END;
      goto LABEL_15;
    case 18:
      uint64_t v11 = kMAU_STEP_DONE;
      goto LABEL_15;
    case 19:
      uint64_t v11 = kMAU_STEP_AU_NOTIFICATION;
LABEL_15:
      uint64_t result = *v11;
      break;
    default:
      FudLog(3, @"Unknown operation: %d", a3, a4, a5, a6, a7, a8, a1);
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sendReplyMessageToClient(void *a1, xpc_object_t xdict, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    uint64_t v17 = @"Can't send NULL xpc message";
LABEL_12:
    FudLog(3, (uint64_t)v17, a3, a4, a5, a6, a7, a8, v18);
    return 0;
  }
  if (!xdict)
  {
    uint64_t v17 = @"Can't reply to NULL message";
    goto LABEL_12;
  }
  if (xpc_dictionary_get_BOOL(xdict, "InternalClient"))
  {
    return sendReplyMessageToInternalClient(a1, xdict, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    return sendReplyMessageToExternalClient(a1, xdict, v10, v11, v12, v13, v14, v15);
  }
}

uint64_t sendReplyMessageToInternalClient(void *a1, xpc_object_t xdict, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    uint64_t v20 = @"Can't send NULL message";
LABEL_12:
    FudLog(3, (uint64_t)v20, a3, a4, a5, a6, a7, a8, v21);
    return 0;
  }
  if (!xdict)
  {
    uint64_t v20 = @"Can't send message in reply to NULL original message";
    goto LABEL_12;
  }
  int64_t int64 = xpc_dictionary_get_int64(xdict, "MessageID");
  if (!int64)
  {
    uint64_t v20 = @"Can't respond without message ID";
    goto LABEL_12;
  }
  xpc_dictionary_set_int64(a1, "MessageID", int64);
  string = xpc_dictionary_get_string(xdict, "ClientIdentifier");
  if (!string)
  {
    uint64_t v20 = @"Can't send reply message without client identifier";
    goto LABEL_12;
  }
  xpc_dictionary_set_string(a1, "ClientIdentifier", string);
  return sendMessageToInternalClient(a1, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t sendReplyMessageToExternalClient(void *a1, xpc_object_t xdict, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (xdict)
    {
      remote_connection = xpc_dictionary_get_remote_connection(xdict);
      if (remote_connection)
      {
        xpc_connection_send_message(remote_connection, a1);
        return 1;
      }
      uint64_t v11 = @"Failed to get xpc connection from replyTo dict";
    }
    else
    {
      uint64_t v11 = @"Can't reply to NULL message";
    }
  }
  else
  {
    uint64_t v11 = @"Can't send NULL xpc message";
  }
  FudLog(3, (uint64_t)v11, a3, a4, a5, a6, a7, a8, v12);
  return 0;
}

uint64_t sendMessageToExternalClient(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    int v9 = @"Can't send message to NULL connection";
LABEL_7:
    FudLog(3, (uint64_t)v9, a3, a4, a5, a6, a7, a8, vars0);
    return 0;
  }
  if (!a2)
  {
    int v9 = @"Can't send NULL message";
    goto LABEL_7;
  }
  xpc_connection_send_message(a1, a2);
  return 1;
}

uint64_t sendMessageToInternalClient(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1;
  if (!a1)
  {
    uint64_t v17 = @"Can't send NULL message";
LABEL_9:
    FudLog(3, (uint64_t)v17, a3, a4, a5, a6, a7, a8, v18);
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  if (!v15)
  {
    FudLog(3, @"Failed to allocate user info dict", v9, v10, v11, v12, v13, v14, v18);
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v8)
  {
    uint64_t v17 = @"Failed to convert xpc msg to CF";
    goto LABEL_9;
  }
  [(id)v15 setObject:v8 forKey:@"InternalMessage"];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"MAUInternalMessageClientNotification", 0, v15);
  uint64_t v15 = 1;
LABEL_5:

  return v15;
}

BOOL clientHasEntitlement(const __CFString *a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FudLog(7, @"Checking for entitlement %@", a3, a4, a5, a6, a7, a8, (uint64_t)a1);
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v11 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v11;
  SecTaskRef v12 = SecTaskCreateWithAuditToken(v10, &token);
  if (!v12)
  {
    FudLog(3, @"Failed to get task for audit token", v13, v14, v15, v16, v17, v18, v37);
    return 0;
  }
  uint64_t v19 = v12;
  FudLog(7, @"Got SecTaskRef task, copying entitlementValue", v13, v14, v15, v16, v17, v18, v37);
  *(void *)token.val = 0;
  CFTypeRef v20 = SecTaskCopyValueForEntitlement(v19, a1, (CFErrorRef *)&token);
  if (*(void *)token.val)
  {
    FudLog(3, @"Failed to copy value for entitlement %@: Error: %@", v21, v22, v23, v24, v25, v26, (uint64_t)a1);
    CFRelease(*(CFTypeRef *)token.val);
    CFRelease(v19);
    return 0;
  }
  v28 = v20;
  FudLog(7, @"Checking isEntitled", v21, v22, v23, v24, v25, v26, v38);
  if (v28)
  {
    CFTypeID v29 = CFGetTypeID(v28);
    BOOL v27 = v29 == CFBooleanGetTypeID() && CFEqual(v28, (CFTypeRef)*MEMORY[0x263EFFB40]) != 0;
    CFRelease(v28);
  }
  else
  {
    BOOL v27 = 0;
  }
  CFRelease(v19);
  FudLog(7, @"isEntitled = %d", v30, v31, v32, v33, v34, v35, v27);
  return v27;
}

uint64_t FudLogger()
{
  if (FudLogger_onceToken != -1) {
    dispatch_once(&FudLogger_onceToken, &__block_literal_global_1);
  }
  return __osl;
}

os_log_t __FudLogger_block_invoke()
{
  os_log_t result = os_log_create("com.apple.mobileaccessoryupdater", "default");
  __osl = (uint64_t)result;
  return result;
}

void FudLog(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void FudLogv(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = (const char *)objc_msgSend((id)objc_msgSend([NSString alloc], "initWithFormat:arguments:", a2, a3), "cStringUsingEncoding:", 4);
  if (a1 <= 7 && __earlyBootMode)
  {
    uint64_t v5 = getprogname();
    printf("%s: %s\n", v5, v4);
  }
  else if (a1 == 7)
  {
    if (FudLogger_onceToken != -1) {
      dispatch_once(&FudLogger_onceToken, &__block_literal_global_1);
    }
    int v6 = __osl;
    if (os_log_type_enabled((os_log_t)__osl, OS_LOG_TYPE_DEBUG)) {
      FudLogv_cold_1((uint64_t)v4, v6);
    }
  }
  else if (a1 < 4)
  {
    if (a1 == 3)
    {
      if (FudLogger_onceToken != -1) {
        dispatch_once(&FudLogger_onceToken, &__block_literal_global_1);
      }
      uint64_t v8 = __osl;
      if (os_log_type_enabled((os_log_t)__osl, OS_LOG_TYPE_ERROR)) {
        FudLogv_cold_2((uint64_t)v4, v8);
      }
    }
    else
    {
      if (FudLogger_onceToken != -1) {
        dispatch_once(&FudLogger_onceToken, &__block_literal_global_1);
      }
      uint64_t v9 = __osl;
      if (os_log_type_enabled((os_log_t)__osl, OS_LOG_TYPE_FAULT)) {
        FudLogv_cold_3((uint64_t)v4, v9);
      }
    }
  }
  else
  {
    if (FudLogger_onceToken != -1) {
      dispatch_once(&FudLogger_onceToken, &__block_literal_global_1);
    }
    int v7 = __osl;
    if (os_log_type_enabled((os_log_t)__osl, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v11 = v4;
      _os_log_impl(&dword_22703F000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
}

uint64_t FudLogSetMode(uint64_t result)
{
  __earlyBootMode = result;
  return result;
}

void *FudLogCopyMessages()
{
  uint64_t v0 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v0 appendFormat:@"SORRY... NO LONGER SUPPORTED\n"];
  return v0;
}

void AUSandboxPlatformInitWithBundleIdentifier_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0(&dword_22703F000, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void AUSandboxPlatformInitWithBundleIdentifier_cold_2()
{
  __error();
  OUTLINED_FUNCTION_0(&dword_22703F000, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

void FudLogv_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22703F000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
}

void FudLogv_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22703F000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
}

void FudLogv_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22703F000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v2, 0xCu);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

void NSLog(NSString *format, ...)
{
}

void NSLogv(NSString *format, va_list args)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}