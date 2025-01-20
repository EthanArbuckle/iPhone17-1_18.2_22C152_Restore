uint64_t mailboxHasExtraAttribute(void *a1, uint64_t a2)
{
  void *v3;
  uint64_t vars8;

  v3 = (void *)[a1 extraAttributes];
  return [v3 containsObject:a2];
}

void sub_1CFD02114(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,long long buf)
{
  if (a2 == 1)
  {
    id v33 = objc_begin_catch(a1);
    v34 = MFLogGeneral();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl(&dword_1CFCFE000, v34, OS_LOG_TYPE_INFO, "Exception while getting all email addresses: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1CFD020BCLL);
  }
  _Unwind_Resume(a1);
}

void sub_1CFD021AC()
{
}

id _stringByAppendingPathComponentsUsingSpecialDisplayNames(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, int a7)
{
  uint64_t v11 = a3;
  if (!a3) {
    uint64_t v11 = [a1 topMailbox];
  }
  if ((void *)v11 == a1 || !a1) {
    return a4;
  }
  CFIndex v14 = 0;
  v15 = a1;
  do
  {
    ++v14;
    v15 = (void *)[v15 parent];
  }
  while ((void *)v11 != v15 && v15);
  if (a4) {
    id v16 = (id)[a4 mutableCopyWithZone:0];
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  v18 = v16;
  Mutable = CFArrayCreateMutable(0, v14, MEMORY[0x1E4F1D510]);
  if (a2)
  {
    int v20 = [a1 type];
    if (a5)
    {
      if (v20 != 7 && [a5 length] && (objc_msgSend(a1, "isShared") & 1) == 0)
      {
        if (a4 && [a4 length]) {
          [v18 appendString:@"/"];
        }
        [v18 appendString:a5];
      }
    }
  }
  if ((void *)v11 != a1)
  {
    v21 = a1;
    while (1)
    {
      v22 = (void *)[a2 persistentNameForMailbox:v21];
      if (!v22) {
        break;
      }
      if (a2) {
        goto LABEL_25;
      }
LABEL_26:
      if (v22) {
        CFArrayAppendValue(Mutable, (const void *)[v22 stringByReplacingOccurrencesOfString:@"/" withString:@"_"]);
      }
      v21 = (void *)[v21 parent];
      if (v21 == (void *)v11) {
        goto LABEL_35;
      }
    }
    if (a7) {
      uint64_t v23 = objc_msgSend(v21, "displayNameUsingSpecialNames", 0);
    }
    else {
      uint64_t v23 = objc_msgSend(v21, "name", 0);
    }
    v22 = (void *)v23;
    if (!a2) {
      goto LABEL_26;
    }
LABEL_25:
    v22 = (void *)[a2 _pathComponentForUidName:v22];
    goto LABEL_26;
  }
LABEL_35:
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count)
  {
    CFIndex v25 = Count - 1;
    do
    {
      if ([v18 length]) {
        [v18 appendString:@"/"];
      }
      objc_msgSend(v18, "appendString:", CFArrayGetValueAtIndex(Mutable, v25--));
    }
    while (v25 != -1);
  }

  if (a6 && [a1 isStore])
  {
    [v18 appendString:@"."];
    [v18 appendString:a6];
  }
  return v18;
}

uint64_t _MFDescendantWithPredicate(void *a1, unsigned int (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  objc_msgSend(a1, "mf_lock");
  v6 = (void *)[a1 depthFirstEnumerator];
  do
  {
    uint64_t v7 = [v6 nextObject];
    uint64_t v8 = v7;
  }
  while (v7 && !a2(v7, a3));
  objc_msgSend(a1, "mf_unlock");
  return v8;
}

uint64_t _configureMailboxCache(uint64_t a1)
{
  error[4] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  if ([(id)a1 _shouldConfigureMailboxCache])
  {
    objc_msgSend((id)a1, "mf_lock");
    if (!*(void *)(a1 + 56))
    {
      v2 = (void *)[(id)a1 _copyMailboxWithParent:0 name:0 attributes:18 dictionary:0];
      *(void *)(a1 + 56) = v2;
      if ([v2 type] != 8) {
        [*(id *)(a1 + 56) setType:8];
      }
    }
    int v3 = *(_DWORD *)(a1 + 64);
    if ((v3 & 0x20000) == 0)
    {
      *(_DWORD *)(a1 + 64) = v3 | 0x20000;
      uint64_t v4 = [(id)a1 mailboxCachePath];
      CFDataRef v5 = (const __CFData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:1 error:0];
      if (!*(void *)(a1 + 56)) {
        _configureMailboxCache_cold_1();
      }
      CFDataRef v6 = v5;
      if (v5)
      {
        error[0] = 0;
        CFDictionaryRef v7 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v5, 1uLL, 0, error);
        if (error[0])
        {
          v10 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v11 = [NSString stringWithUTF8String:"BOOL _readMailboxCache(MailAccount *)"];
          [v10 handleFailureInFunction:v11, @"MailAccount.m", 3461, @"%@", -[__CFError localizedDescription](error[0], "localizedDescription") file lineNumber description];
        }
        Value = CFDictionaryGetValue(v7, @"mboxes");
        [(id)a1 _readCustomInfoFromMailboxCache:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(id)a1 _loadMailboxListingIntoCache:0 attributes:0 children:Value parent:*(void *)(a1 + 56)];
        }
        if (error[0]) {

        }
        if (v7) {
      }
        }
    }
    return objc_msgSend((id)a1, "mf_unlock");
  }
  else
  {
    return _invalidateMailboxCache(a1);
  }
}

void sub_1CFD08530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MFSocketNetworkThread(void *a1)
{
  [a1 lockWhenCondition:0];
  v2 = CFRunLoopTimerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1.79769313e308, 60.0, 0, 0, (CFRunLoopTimerCallBack)_DoNothingTimerCallBack, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v2, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  NetworkThread = [MEMORY[0x1E4F29060] currentThread];
  [a1 unlockWithCondition:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop"), "run");
  CFRelease(v2);
}

void sub_1CFD0A874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFD0BB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2048;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  *(_WORD *)(a3 + 32) = 2048;
  return result;
}

uint64_t OUTLINED_FUNCTION_8@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return [a1 domain];
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x2Au);
}

void *_openConnectionForAccount(void *a1, int a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2) {
    uint64_t v4 = [a1 secureConnectionSettings];
  }
  else {
    uint64_t v4 = [a1 insecureConnectionSettings];
  }
  id obj = (id)v4;
  int v5 = objc_msgSend(a1, "defaultPortNumber", a3);
  int v6 = [a1 defaultSecurePortNumber];
  int v7 = [a1 usesSSL];
  int v8 = [a1 portNumber];
  if (v7) {
    int v9 = v6;
  }
  else {
    int v9 = v5;
  }
  if (v8)
  {
    int v10 = v8;
    if (v9 != v8)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v11)
      {
        id v12 = 0;
        uint64_t v13 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            int v16 = [v15 usesSSL];
            if (v16) {
              int v17 = v6;
            }
            else {
              int v17 = v5;
            }
            if (v10 != v17)
            {
              objc_msgSend(v15, "setPortNumber:", objc_msgSend(a1, "portNumber"));
              if (v16)
              {
                v18 = (void *)[v15 copy];
                objc_msgSend(v18, "setTryDirectSSL:", objc_msgSend(v15, "tryDirectSSL") ^ 1);
                if (!v12) {
                  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                [v12 addObject:v18];
              }
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v11);
        if (v12)
        {
          id obj = (id)[obj arrayByAddingObjectsFromArray:v12];
        }
      }
    }
  }
  id v19 = +[MFActivityMonitor currentMonitor];
  unint64_t v20 = [obj count];
  v21 = 0;
  unint64_t v22 = 0;
LABEL_33:
  if (v22 >= v20)
  {
LABEL_40:

    return 0;
  }
  while (1)
  {
    uint64_t v25 = [obj objectAtIndex:v22];
    [a1 applySettingsAsDefault:v25];
    v26 = (void *)[a1 _newConnection];
    [v26 setAllowsFallbacks:0];
    char v27 = [v26 connectUsingAccount:a1];
    char v28 = v27 ^ 1;
    if (!v32) {
      char v28 = 1;
    }
    if ((v28 & 1) == 0) {
      break;
    }
    uint64_t v29 = [v19 error];
    if (v27) {
      return v26;
    }
    ++v22;
    v21 = v26;
    if (!v29) {
      goto LABEL_33;
    }
    BOOL v23 = +[MFConnection shouldTryFallbacksAfterError:](MFConnection, "shouldTryFallbacksAfterError:");
    if (v22 >= v20 || !v23) {
      goto LABEL_40;
    }
  }
  uint64_t *v32 = v25;
  [v19 error];
  return v26;
}

uint64_t _closeConnection(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [a1 quit];
  }
  else
  {
    return [a1 disconnect];
  }
}

void _logEvent(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = MEMORY[0x1D25DDB40]();
  [(id)_LogLock lock];
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA58] data];
  CFIndex v14 = v13;
  context = (void *)v12;
  if (!a3 || !a4 || a5 == 0x7FFFFFFFFFFFFFFFLL || a5 >= a4 || !a6)
  {
    uint64_t v15 = a3;
    uint64_t v16 = a4;
LABEL_5:
    [v13 appendBytes:v15 length:v16];
    goto LABEL_6;
  }
  [v13 appendBytes:a3 length:a5];
  [v14 appendBytes:"[Omitted]" length:9];
  uint64_t v16 = a4 - (a6 + a5);
  if (a4 != a6 + a5)
  {
    uint64_t v15 = a3 + a6 + a5;
    uint64_t v13 = v14;
    goto LABEL_5;
  }
LABEL_6:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v17 = (void *)_LogClasses;
  uint64_t v18 = [(id)_LogClasses countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        unint64_t v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (class_getClassMethod((Class)v22, sel_logConnection_type_data_)) {
          [v22 logConnection:a1 type:a2 data:v14];
        }
        else {
          objc_msgSend(v22, "logBytes:length:", objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
        }
        [v22 flushLog];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }
  [(id)_LogLock unlock];
}

void sub_1CFD14AF8(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithException:](MFError, "errorWithException:", objc_begin_catch(exception_object)));
    objc_end_catch();
    JUMPOUT(0x1CFD14A80);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _fillBuffer(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    [v2 encryptionBufferSize];
    unsigned int v24 = 0;
    if (_readBytesFromSocket(a1, (uint64_t)&v24, 4, 1) != 4)
    {
LABEL_20:
      uint64_t v11 = 0;
      *(void *)(a1 + 56) = 0;
      return v11;
    }
    __int16 v3 = v24;
    size_t v4 = bswap32(v24) >> 16;
    if (*(void *)(a1 + 64) != v4)
    {
      int v5 = *(void **)(a1 + 40);
      if (v5) {
        int v6 = malloc_type_realloc(v5, v4, 0x23852C21uLL);
      }
      else {
        int v6 = malloc_type_malloc(v4, 0x23938AF0uLL);
      }
      *(void *)(a1 + 40) = v6;
      *(void *)(a1 + 64) = v4;
    }
    if (v3 && _readBytesFromSocket(a1, *(void *)(a1 + 40), v4, 1) >= 1)
    {
      int v10 = (void *)[*(id *)(a1 + 8) createDecryptedDataForBytes:*(void *)(a1 + 40) length:v4];
      if (!v10) {
        goto LABEL_20;
      }
    }
    else
    {
      int v10 = 0;
    }
    uint64_t v12 = [v10 length];
    size_t v13 = *(void *)(a1 + 64);
    CFIndex v14 = *(void **)(a1 + 40);
    if (v12 != v13)
    {
      CFIndex v14 = malloc_type_realloc(*(void **)(a1 + 40), v13, 0xE224AC59uLL);
      *(void *)(a1 + 40) = v14;
      uint64_t v12 = *(void *)(a1 + 64);
    }
    [v10 getBytes:v14 length:v12];
    *(void *)(a1 + 48) = *(void *)(a1 + 64);
    *(void *)(a1 + 56) = 0;
  }
  else
  {
    size_t v7 = *(void *)(a1 + 72);
    if (!v7)
    {
      size_t v7 = 0x8000;
      *(void *)(a1 + 72) = 0x8000;
    }
    int v8 = *(void **)(a1 + 40);
    if (v7 != *(void *)(a1 + 64))
    {
      if (v8) {
        int v8 = malloc_type_realloc(*(void **)(a1 + 40), v7, 0x91FF8455uLL);
      }
      else {
        int v8 = malloc_type_malloc(v7, 0x920AFFFBuLL);
      }
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 64) = v7;
    }
    uint64_t BytesFromSocket = _readBytesFromSocket(a1, (uint64_t)v8, v7, 0);
    *(void *)(a1 + 48) = BytesFromSocket & ~(BytesFromSocket >> 63);
    if (BytesFromSocket < 1) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)(a1 + 108) & 4) != 0)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F73540]);
    uint64_t v16 = *(z_stream **)(a1 + 88);
    int v17 = *(Bytef **)(a1 + 40);
    v16->avail_in = *(void *)(a1 + 48);
    v16->next_in = v17;
    do
    {
      v16->avail_out = NSPageSize();
      v16->next_out = *(Bytef **)(a1 + 96);
      if (inflate(v16, 0) == -2) {
        __assert_rtn("_fillBuffer", "Connection.m", 903, "Z_STREAM_ERROR != err");
      }
      [v15 appendBytes:*(void *)(a1 + 96) length:NSPageSize() - v16->avail_out];
    }
    while (!v16->avail_out);
    size_t v18 = [v15 length];
    if (v18)
    {
      *(void *)(a1 + 64) = v18;
      *(void *)(a1 + 48) = v18;
      uint64_t v19 = malloc_type_realloc(*(void **)(a1 + 40), v18, 0x876A723AuLL);
      *(void *)(a1 + 40) = v19;
      memcpy(v19, (const void *)[v15 bytes], *(void *)(a1 + 64));
      uint64_t v20 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v20 = 0;
      *(void *)(a1 + 48) = 0;
    }

    *(void *)(a1 + 56) = 0;
    if (v20 < 1) {
      return 0;
    }
  }
  else
  {
    *(void *)(a1 + 56) = 0;
  }
  if (*(uint64_t *)(a1 + 48) < 1
    || ((uint64_t v11 = 1, ![*(id *)(a1 + 8) encryptionBufferSize]) ? (v21 = 1) : (v21 = 2),
        _logEvent(a1, v21, *(void *)(a1 + 40), *(void *)(a1 + 48), 0x7FFFFFFFFFFFFFFFuLL, 0),
        *(uint64_t *)(a1 + 48) < 1))
  {
    unint64_t v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _fillBuffer(MFConnection *)"), @"Connection.m", 938, @"Result conflicts with bufferRemainingBytes");
    return 1;
  }
  return v11;
}

void sub_1CFD150AC(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    *(void *)(v2 + 48) = 0;
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithException:](MFError, "errorWithException:", v3));
    [v3 raise];
    objc_end_catch();
    JUMPOUT(0x1CFD14EA8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _setupSSLDomainError(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = [a1 code];
  switch(v6)
  {
    case -9814:
      size_t v7 = @"SSL_CERT_EXPIRED_FORMAT";
      int v8 = @"The certificate for this server has expired.";
      goto LABEL_11;
    case -9813:
      size_t v7 = @"SSL_NO_ROOT_CERT_FORMAT";
      int v8 = @"There is no root certificate for this server.";
      goto LABEL_11;
    case -9812:
      size_t v7 = @"SSL_UNKNOWN_ROOT_CERT_FORMAT";
      int v8 = @"The root certificate for this server could not be verified.";
      goto LABEL_11;
    case -9811:
    case -9810:
    case -9809:
      goto LABEL_5;
    case -9808:
      size_t v7 = @"SSL_BAD_CERT_FORMAT";
      int v8 = @"The format of the certificate for the server is bad.";
      goto LABEL_11;
    case -9807:
      size_t v7 = @"SSL_CERT_CHAIN_INVALID_FORMAT";
      int v8 = @"The certificate for the server is invalid.";
LABEL_11:
      uint64_t v12 = MFLookupLocalizedString((uint64_t)v7, (uint64_t)v8, @"Delayed");
      break;
    default:
      if (v6 == -9843)
      {
        int v9 = NSString;
        int v10 = @"SSL_HOST_MISMATCH_MESSAGE";
        uint64_t v11 = @"The certificate hostname does not match “%@”.";
      }
      else
      {
LABEL_5:
        int v9 = NSString;
        int v10 = @"SSL_GENERIC_READ_ERROR";
        uint64_t v11 = @"An SSL error occurred while trying to read data from the server “%@”. Verify that this server supports SSL and that your account settings are correct.";
      }
      uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", MFLookupLocalizedString((uint64_t)v10, (uint64_t)v11, @"Delayed"), a2);
      break;
  }
  uint64_t v13 = v12;
  if ([a3 count]) {
    [a1 setUserInfoObject:a3 forKey:@"MFSSLErrorCertificateKey"];
  }
  [a1 setLocalizedDescription:v13];
  uint64_t v14 = [NSString stringWithFormat:MFLookupLocalizedString(@"SSL_ALERT_TITLE_FORMAT", @"Unable to verify SSL server %@", @"Delayed", a2];
  return [a1 setShortDescription:v14];
}

uint64_t _readBytesFromSocket(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a3)
  {
    uint64_t v5 = a3;
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = [*(id *)(a1 + 24) readBytes:a2 length:v5];
      if (v9 < 0 || (uint64_t v10 = v9, *(CFAbsoluteTime *)(a1 + 32) = CFAbsoluteTimeGetCurrent(), !v10))
      {
        uint64_t v8 = -1;
        goto LABEL_10;
      }
      v8 += v10;
      objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "recordBytesRead:", v10);
      v5 -= v10;
      if (!v5) {
        break;
      }
      a2 += v10;
    }
    while ((a4 & 1) != 0);
    if ((v8 & 0x8000000000000000) == 0) {
      return v8;
    }
LABEL_10:
    id v11 = +[MFActivityMonitor currentMonitor];
    uint64_t v12 = *(void **)(a1 + 24);
    uint64_t v13 = (MFError *)[v11 error];
    uint64_t v14 = [v12 remoteHostname];
    if (!v13)
    {
      uint64_t v13 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1045 localizedDescription:0];
      [v11 setError:v13];
      if (!v13 || [(NSError *)v13 mf_isUserCancelledError]) {
        goto LABEL_28;
      }
      goto LABEL_26;
    }
    if (objc_msgSend((id)*MEMORY[0x1E4F28798], "isEqualToString:", -[MFError domain](v13, "domain")))
    {
      if ([(MFError *)v13 code] == 60)
      {
        uint64_t v15 = [NSString stringWithFormat:MFLookupLocalizedString(@"CONNECTION_TIMED_OUT", @"The connection to the server “%@” on port %d timed out.", @"Delayed", v14, objc_msgSend(v12, "remotePortNumber")];
LABEL_22:
        uint64_t v17 = v15;
        goto LABEL_24;
      }
    }
    else if (objc_msgSend((id)*MEMORY[0x1E4F288C8], "isEqualToString:", -[MFError domain](v13, "domain")))
    {
      _setupSSLDomainError(v13, v14, (void *)[v12 serverCertificates]);
      uint64_t v16 = [(MFError *)v13 localizedDescription];
      if (!v16 || (uint64_t v17 = v16, [&stru_1F265CF90 isEqualToString:v16]))
      {
        uint64_t v15 = [NSString stringWithFormat:MFLookupLocalizedString(@"SSL_GENERIC_READ_ERROR", @"An SSL error occurred while trying to read data from the server “%@”. Verify that this server supports SSL and that your account settings are correct.", @"Delayed", v14, v19];
        goto LABEL_22;
      }
LABEL_24:
      if ([(NSError *)v13 mf_isUserCancelledError])
      {
LABEL_28:
        [*(id *)(a1 + 24) abort];
        return v8;
      }
      if (v17)
      {
LABEL_27:
        [(MFError *)v13 setLocalizedDescription:v17];
        goto LABEL_28;
      }
LABEL_26:
      uint64_t v17 = [NSString stringWithFormat:MFLookupLocalizedString(@"CONNECTION_FAILED", @"The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings.", @"Delayed", v14];
      goto LABEL_27;
    }
    uint64_t v17 = 0;
    goto LABEL_24;
  }
  return 0;
}

uint64_t getDeliveryAccounts()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (!_deliveryAccounts)
  {
    id v0 = +[MFAccountStore sharedAccountStore];
    v4[0] = *MEMORY[0x1E4F17850];
    v1 = objc_msgSend((id)objc_msgSend(v0, "accountsWithTypeIdentifiers:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1), 0), "mutableCopy");
    _deliveryAccounts = (uint64_t)v1;
    if (!v1 || ![v1 count])
    {
      id v2 = +[SMTPAccount newDefaultInstance];

      _deliveryAccounts = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v2, 0);
    }
  }
  return _deliveryAccounts;
}

uint64_t _appendQuotedString(void *a1, uint64_t a2, void *a3)
{
  if ([a1 length]) {
    [a1 appendBytes:"," length:1];
  }
  objc_msgSend(a1, "mf_appendCString:", a2);
  char v14 = 61;
  [a1 appendBytes:&v14 length:1];
  char v15 = 34;
  [a1 appendBytes:&v15 length:1];
  unint64_t v6 = [a3 bytes];
  uint64_t v7 = [a3 length];
  if (v7 >= 1)
  {
    unint64_t v8 = v6 + v7;
    uint64_t v9 = (char *)v6;
    while (1)
    {
      int v10 = *v9;
      if (v10 == 34 || v10 == 92) {
        break;
      }
      if ((unint64_t)++v9 >= v8)
      {
        int v11 = 0;
LABEL_10:
        if ((unint64_t)v9 > v6) {
          [a1 appendBytes:v6 length:&v9[-v6]];
        }
        if (v11)
        {
          char v16 = 92;
          [a1 appendBytes:&v16 length:1];
          char v12 = *v9++;
          char v17 = v12;
          [a1 appendBytes:&v17 length:1];
        }
        unint64_t v6 = (unint64_t)v9;
        if ((unint64_t)v9 >= v8) {
          goto LABEL_15;
        }
      }
    }
    int v11 = 1;
    goto LABEL_10;
  }
LABEL_15:
  char v18 = 34;
  return [a1 appendBytes:&v18 length:1];
}

uint64_t _appendValue(void *a1, uint64_t a2, uint64_t a3)
{
  if ([a1 length]) {
    [a1 appendBytes:"," length:1];
  }
  objc_msgSend(a1, "mf_appendCString:", a2);
  char v7 = 61;
  [a1 appendBytes:&v7 length:1];
  return [a1 appendData:a3];
}

CFStringRef copyToken(const UInt8 **a1)
{
  v1 = *a1;
  id v2 = a1[1];
  if (*a1 >= v2) {
    UInt8 v3 = 0;
  }
  else {
LABEL_2:
  }
    UInt8 v3 = *v1;
  int64_t v4 = v2 - v1;
  do
  {
    while (1)
    {
      do
      {
        UInt8 v5 = v3;
        UInt8 v3 = 0;
      }
      while (v5 > 0x20u);
      if (((1 << v5) & 0x100002600) == 0) {
        break;
      }
      UInt8 v3 = 0;
      *a1 = ++v1;
      --v4;
      if (v1 < v2) {
        goto LABEL_2;
      }
    }
  }
  while (v5);
  unint64_t v6 = v1;
  if (v1 < v2)
  {
    unint64_t v6 = v1;
    while (1)
    {
      int v7 = *v6;
      if ((v7 - 33) > 0x5D) {
        break;
      }
      BOOL v8 = (v7 - 34) > 0x3B || ((1 << (v7 - 34)) & 0xE0000007F0024C1) == 0;
      if (!v8 || v7 == 123 || v7 == 125) {
        break;
      }
      *a1 = ++v6;
      if (!--v4)
      {
        unint64_t v6 = v2;
        break;
      }
    }
  }
  if (v1 >= v6) {
    return 0;
  }
  else {
    return CFStringCreateWithBytesNoCopy(0, v1, v6 - v1, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  }
}

CFDataRef quoted_string(const UInt8 **a1)
{
  id v2 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if ((unint64_t)*a1 < v3)
  {
LABEL_2:
    UInt8 v4 = *v2;
    goto LABEL_4;
  }
  UInt8 v4 = 0;
  do
  {
    while (1)
    {
      do
      {
LABEL_4:
        UInt8 v5 = v4;
        UInt8 v4 = 0;
      }
      while (v5 > 0x20u);
      if (((1 << v5) & 0x100002600) == 0) {
        break;
      }
      UInt8 v4 = 0;
      *a1 = ++v2;
      if ((unint64_t)v2 < v3) {
        goto LABEL_2;
      }
    }
  }
  while (v5);
  if ((unint64_t)v2 >= v3 || *v2 != 34) {
    return 0;
  }
  unint64_t v6 = v2 + 1;
  *a1 = v6;
  int v7 = (const __CFAllocator **)MEMORY[0x1E4F1CFA0];
  if ((unint64_t)v6 >= v3)
  {
    int v10 = v6;
    goto LABEL_31;
  }
  CFDataRef v8 = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  int v10 = v6;
  while (1)
  {
    int v11 = *v6;
    if (v11 == 92)
    {
      if (!v8)
      {
        CFDataRef v8 = (CFDataRef)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) init];
        unint64_t v6 = *a1;
      }
      unint64_t v12 = (unint64_t)a1[1];
      if (v10 < v6)
      {
        [(__CFData *)v8 appendBytes:v10 length:v12 - (void)v10];
        unint64_t v6 = *a1;
        unint64_t v12 = (unint64_t)a1[1];
      }
      if ((unint64_t)(v6 + 1) < v12)
      {
        *a1 = v6 + 1;
        -[__CFData appendBytes:length:](v8, "appendBytes:length:");
        unint64_t v6 = *a1;
      }
      int v10 = v6;
      goto LABEL_24;
    }
    if (v11 == 34) {
      break;
    }
LABEL_24:
    *a1 = ++v6;
    if (v6 >= a1[1])
    {
      if (!v8) {
        goto LABEL_31;
      }
      if (v10 < v6) {
        goto LABEL_36;
      }
      return v8;
    }
  }
  if (v8)
  {
    [(__CFData *)v8 appendBytes:v10 length:v6 - v10];
    int v10 = *a1;
    unint64_t v6 = *a1 + 1;
    *a1 = v6;
LABEL_36:
    [(__CFData *)v8 appendBytes:v10 length:v6 - v10];
    return v8;
  }
  CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, v10, v6 - v10, v9);
  int v10 = *a1;
  unint64_t v6 = *a1 + 1;
  *a1 = v6;
  if (v8) {
    return v8;
  }
LABEL_31:
  CFAllocatorRef v14 = *v7;
  return CFDataCreateWithBytesNoCopy(0, v10, v6 - v10, v14);
}

void *copyQuotedTokenList(const UInt8 **a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*a1 >= a1[1] || **a1 != 34) {
    return 0;
  }
  id v2 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  unint64_t v3 = (unsigned __int8 *)a1[1];
  unint64_t v4 = (unint64_t)(*a1 + 1);
  *a1 = (const UInt8 *)v4;
  if (v4 < (unint64_t)v3)
  {
    while (1)
    {
      CFStringRef v5 = copyToken(a1);
      if (!v5) {
        break;
      }
      unint64_t v6 = (__CFString *)v5;
      [v2 addObject:v5];

      int v7 = 0;
      CFDataRef v8 = *a1;
LABEL_15:
      if (v8 >= a1[1] || v7 != 0) {
        return v2;
      }
    }
    if (*a1 >= a1[1])
    {
      int v9 = 0;
    }
    else
    {
      int v9 = **a1;
      if (v9 == 44)
      {
LABEL_13:
        int v7 = 0;
        goto LABEL_14;
      }
      if (v9 == 34)
      {
        int v7 = 1;
LABEL_14:
        CFDataRef v8 = *a1 + 1;
        *a1 = v8;
        goto LABEL_15;
      }
    }
    int v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_INFO, "*** Parse failure(unexpected character '%c'). Ignoring", buf, 8u);
    }
    goto LABEL_13;
  }
  return v2;
}

void *_createResponseData(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char data = 58;
  memset(&c, 0, sizeof(c));
  CFDataRef v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:32];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:32];
  CC_MD5_Init(&c);
  if (a4) {
    CC_MD5_Update(&c, "AUTHENTICATE", 0xCu);
  }
  CC_MD5_Update(&c, &data, 1u);
  int v10 = *(void **)(a3 + 40);
  if (v10) {
    CC_MD5_Update(&c, (const void *)[*(id *)(a3 + 40) bytes], objc_msgSend(v10, "length"));
  }
  if ((*(unsigned char *)(a1 + 38) & 2) != 0) {
    CC_MD5_Update(&c, ":00000000000000000000000000000000", 0x21u);
  }
  CC_MD5_Final((unsigned __int8 *)md, &c);
  uint64_t v11 = 0;
  do
  {
    uint64_t v12 = v11 + 1;
    snprintf(__str, 3uLL, "%02x", md[v11]);
    [v9 appendBytes:__str length:2];
    uint64_t v11 = v12;
  }
  while (v12 != 16);
  CC_MD5_Init(&c);
  uint64_t v13 = *(void **)(a3 + 24);
  if (v13) {
    CC_MD5_Update(&c, (const void *)[*(id *)(a3 + 24) bytes], objc_msgSend(v13, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  int v14 = *(void **)(a3 + 48);
  if (v14) {
    CC_MD5_Update(&c, (const void *)[*(id *)(a3 + 48) bytes], objc_msgSend(v14, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  uint64_t v15 = *(void **)(a3 + 32);
  if (v15) {
    CC_MD5_Update(&c, (const void *)[*(id *)(a3 + 32) bytes], objc_msgSend(v15, "length"));
  }
  CC_MD5_Final((unsigned __int8 *)__str, &c);
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, __str, 0x10u);
  CC_MD5_Update(&c, &data, 1u);
  char v16 = *(void **)(a2 + 8);
  if (v16) {
    CC_MD5_Update(&c, (const void *)[*(id *)(a2 + 8) bytes], objc_msgSend(v16, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  if (*(void *)a3) {
    CC_MD5_Update(&c, (const void *)[*(id *)a3 bytes], objc_msgSend(*(id *)a3, "length"));
  }
  if ((*(unsigned char *)(a1 + 38) & 2) != 0)
  {
    CC_MD5_Final((unsigned __int8 *)(a3 + 64), &c);
    uint64_t v19 = 0;
    do
    {
      uint64_t v20 = v19 + 1;
      snprintf(md, 3uLL, "%02x", *(unsigned __int8 *)(a3 + 64 + v19));
      [v8 appendBytes:md length:2];
      uint64_t v19 = v20;
    }
    while (v20 != 16);
  }
  else
  {
    CC_MD5_Final((unsigned __int8 *)md, &c);
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = v17 + 1;
      snprintf(v30, 3uLL, "%02x", md[v17]);
      [v8 appendBytes:v30 length:2];
      uint64_t v17 = v18;
    }
    while (v18 != 16);
  }
  CC_MD5_Init(&c);
  if (v8) {
    CC_MD5_Update(&c, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  uint64_t v21 = *(void **)(a2 + 8);
  if (v21) {
    CC_MD5_Update(&c, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  unint64_t v22 = *(void **)(a3 + 8);
  if (v22) {
    CC_MD5_Update(&c, (const void *)[*(id *)(a3 + 8) bytes], objc_msgSend(v22, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  if (*(void *)a3) {
    CC_MD5_Update(&c, (const void *)[*(id *)a3 bytes], objc_msgSend(*(id *)a3, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  BOOL v23 = *(void **)(a3 + 16);
  if (v23) {
    CC_MD5_Update(&c, (const void *)[v23 bytes], objc_msgSend(v23, "length"));
  }
  CC_MD5_Update(&c, &data, 1u);
  if (v9) {
    CC_MD5_Update(&c, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
  }
  unsigned int v24 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) initWithCapacity:32];
  CC_MD5_Final((unsigned __int8 *)md, &c);
  uint64_t v25 = 0;
  do
  {
    uint64_t v26 = v25 + 1;
    snprintf(v30, 3uLL, "%02x", md[v25]);
    [v24 appendBytes:v30 length:2];
    uint64_t v25 = v26;
  }
  while (v26 != 16);

  return v24;
}

void _appendParagraphToOutput(__CFString *a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a2)
  {
    uint64_t v7 = a3;
    if (a3 > 0) {
      int v10 = a5;
    }
    else {
      int v10 = 0;
    }
    if (v10 == 1)
    {
      uint64_t v11 = a3;
      do
      {
        [(__CFString *)a1 appendString:@"<BLOCKQUOTE type=\"cite\">"];
        --v11;
      }
      while (v11);
    }
    if (a5)
    {
      [(__CFString *)a1 appendString:@"<SPAN>"];
      uint64_t v12 = [a2 length];
      if (v12)
      {
        unint64_t v13 = v12;
        int v14 = malloc_type_malloc(2 * v12 + 2, 0x1000040BDFB0063uLL);
        if (v14)
        {
          uint64_t v15 = v14;
          [a2 getCharacters:v14];
          uint64_t v16 = 0;
          unsigned int v17 = 1;
          do
          {
            int v18 = (unsigned __int16)v15[v16];
            UniChar chars = v18;
            if (v18 == 9) {
              uint64_t v19 = @" &nbsp; &nbsp;";
            }
            else {
              uint64_t v19 = 0;
            }
            if (v17 != 1 && v18 == 32 && v15[v17 - 2] == 32) {
              uint64_t v19 = @"&nbsp;";
            }
            if (v18 == 60) {
              uint64_t v19 = @"&lt;";
            }
            if (v18 == 62) {
              uint64_t v19 = @"&gt;";
            }
            if (v18 == 38) {
              uint64_t v20 = @"&amp;";
            }
            else {
              uint64_t v20 = v19;
            }
            if (v20) {
              -[__CFString appendString:](a1, "appendString:");
            }
            else {
              CFStringAppendCharacters(a1, &chars, 1);
            }
            uint64_t v16 = v17;
          }
          while (v13 > v17++);
          free(v15);
        }
      }
      if (a4) {
        [(__CFString *)a1 appendString:@"</SPAN><BR>"];
      }
      if (v10)
      {
        do
        {
          [(__CFString *)a1 appendString:@"</BLOCKQUOTE>"];
          --v7;
        }
        while (v7);
      }
    }
    else
    {
      [(__CFString *)a1 appendString:a2];
      if (a4)
      {
        [(__CFString *)a1 appendString:a4];
      }
    }
  }
}

uint64_t _GetTextBreakLocale()
{
  id v0 = (id)_GetTextBreakLocale___TextBreakLocale;
  if (!_GetTextBreakLocale___TextBreakLocale)
  {
    v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"AppleTextBreakLocale"), "objectAtIndex:", 0);
    if (!v1) {
      v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), "localeIdentifier");
    }
    id v0 = v1;
    _GetTextBreakLocale___TextBreakLocale = (uint64_t)v0;
  }
  return [v0 UTF8String];
}

void ___weakDDURLifierClass_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v0 = (const char *)objc_msgSend((id)objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", @"System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore"), "fileSystemRepresentation");
  if (!dlopen(v0, 1))
  {
    CFStringRef v5 = MFLogGeneral();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v6 = 136315138;
    uint64_t v7 = dlerror();
    id v2 = "#Warning Failed to load DataDetectorsCore.framework (%s)";
    unint64_t v3 = v5;
    uint32_t v4 = 12;
    goto LABEL_7;
  }
  _weakDDURLifierClass_sDDURLifierClass = (uint64_t)NSClassFromString(&cfstr_Ddurlifier.isa);
  if (!_weakDDURLifierClass_sDDURLifierClass)
  {
    v1 = MFLogGeneral();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      id v2 = "#Warning NSClassFromString(@\"DDURLifier\") returned Nil";
      unint64_t v3 = v1;
      uint32_t v4 = 2;
LABEL_7:
      _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_DEFAULT, v2, (uint8_t *)&v6, v4);
    }
  }
}

void _dispatch_sync(void *a1)
{
  if (_dispatch_sync_token != -1) {
    dispatch_once(&_dispatch_sync_token, &__block_literal_global_180);
  }
  id v2 = dispatch_group_create();
  dispatch_group_async(v2, (dispatch_queue_t)_dispatch_sync__queue, a1);
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
}

dispatch_queue_t ___dispatch_sync_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.message.InvocationQueueState", 0);
  _dispatch_sync__queue = (uint64_t)result;
  return result;
}

uint64_t partDataFromFullBodyData(void *a1, uint64_t a2, void *a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  char v13 = 0;
  uint64_t v8 = (void *)[a1 fullBodyDataForMessage:a2 andHeaderDataIfReadilyAvailable:0 isComplete:&v13 downloadIfNecessary:a5 usePartDatas:0 didDownload:a6];
  uint64_t result = 0;
  if (v8 && v13)
  {
    uint64_t v10 = [a3 range];
    uint64_t v12 = v11;
    if (v10 + v11 <= (unint64_t)[v8 length])
    {
      uint64_t result = objc_msgSend(v8, "mf_subdataWithRange:", v10, v12);
      if (a4) {
        *a4 = 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

MFLibraryStore *initializeSharedInstance()
{
  uint64_t result = objc_alloc_init(MFLibraryStore);
  _sharedInstance = (uint64_t)result;
  return result;
}

uint64_t initCSAccountTypeLocal()
{
  if (LoadCoreSpotlight_loadPredicate != -1) {
    dispatch_once(&LoadCoreSpotlight_loadPredicate, &__block_literal_global_5);
  }
  uint64_t result = *(void *)dlsym((void *)LoadCoreSpotlight_frameworkLibrary, "CSAccountTypeLocal");
  constantCSAccountTypeLocal = result;
  getCSAccountTypeLocal = CSAccountTypeLocalFunction;
  return result;
}

uint64_t CSAccountTypeLocalFunction()
{
  return constantCSAccountTypeLocal;
}

void __LoadCoreSpotlight_block_invoke()
{
  LoadCoreSpotlight_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  if (!LoadCoreSpotlight_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

__CFString *MailAccountCachePolicyStringForEnumValue(int a1)
{
  return _cachePolicyNames[a1];
}

void *_allEmailAddressesIncludingFullName(int a1, int a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  +[MailAccount mf_lock];
  id v2 = &OBJC_IVAR___MFMessageLibrary__path;
  if (_allEmailAddresses) {
    BOOL v3 = _allEmailAddressesWithFullUserName == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || _allReceiveEmailAliasAddresses == 0 || _allReceiveEmailAliasAddressesWithFullUserName == 0)
  {
    +[MailAccount mf_unlock];
    id obj = +[MailAccount mailAccounts];
    +[MailAccount mf_lock];
    if (!_allEmailAddresses
      || !_allEmailAddressesWithFullUserName
      || !_allReceiveEmailAliasAddresses
      || !_allReceiveEmailAliasAddressesWithFullUserName)
    {

      _allEmailAddresses = 0;
      _allEmailAddressesWithFullUserName = 0;

      _allReceiveEmailAliasAddresses = 0;
      _allReceiveEmailAliasAddressesWithFullUserName = 0;
      _allEmailAddresses = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      _allEmailAddressesWithFullUserName = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      _allReceiveEmailAliasAddresses = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      _allReceiveEmailAliasAddressesWithFullUserName = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v6)
      {
        uint64_t v43 = *(void *)v55;
        do
        {
          uint64_t v7 = 0;
          uint64_t v42 = v6;
          do
          {
            if (*(void *)v55 != v43) {
              objc_enumerationMutation(obj);
            }
            v46 = *(void **)(*((void *)&v54 + 1) + 8 * v7);
            uint64_t v44 = v7;
            if ([v46 isActive])
            {
              char v8 = 1;
              do
              {
                char v45 = v8;
                BOOL v9 = (v8 & 1) == 0;
                uint64_t v10 = &_allEmailAddressesWithFullUserName;
                if (v9) {
                  uint64_t v10 = &_allReceiveEmailAliasAddressesWithFullUserName;
                }
                v48 = (void *)*v10;
                uint64_t v11 = &_allEmailAddresses;
                if (v9) {
                  uint64_t v11 = &_allReceiveEmailAliasAddresses;
                }
                v49 = (void *)*v11;
                uint64_t v12 = &selRef_emailAddresses;
                if (v9) {
                  uint64_t v12 = &selRef_receiveEmailAliasAddressesList;
                }
                CFAllocatorRef v13 = (CFAllocatorRef)[v46 performSelector:*v12];
                unint64_t v14 = [(__CFAllocator *)v13 count];
                if (v14)
                {
                  CFAllocatorRef allocator = 0;
                  CFIndex v15 = 0;
                  do
                  {
                    CFIndex v16 = v15;
                    uint64_t v17 = [(__CFAllocator *)v13 objectAtIndex:v15++];
                    if (v16 + 1 < v14)
                    {
                      uint64_t v18 = v17;
                      CFIndex v19 = v16 + 1;
                      while (1)
                      {
                        uint64_t v20 = (void *)[(__CFAllocator *)v13 objectAtIndex:v19];
                        uint64_t v22 = [v20 rangeOfString:v18 options:8];
                        if (v22 != 0x7FFFFFFFFFFFFFFFLL
                          && [v20 length] > (unint64_t)(v22 + v21)
                          && objc_msgSend(v20, "characterAtIndex:") == 64)
                        {
                          break;
                        }
                        if (v14 == ++v19) {
                          goto LABEL_44;
                        }
                      }
                      MutableCopy = allocator;
                      if (!allocator) {
                        MutableCopy = CFArrayCreateMutableCopy(0, v14, v13);
                      }
                      CFAllocatorRef allocator = MutableCopy;
                      CFArrayExchangeValuesAtIndices(MutableCopy, v16, v19);
                    }
LABEL_44:
                    ;
                  }
                  while (v15 != v14);
                  if (allocator) {
                    CFAllocatorRef v13 = allocator;
                  }
                }
                unsigned int v24 = (void *)[v46 fullUserName];
                uint64_t v25 = v24;
                if (v24
                  && [v24 rangeOfString:@","] != 0x7FFFFFFFFFFFFFFFLL
                  && [v25 rangeOfString:@"\""] == 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v25 = (void *)[NSString stringWithFormat:@"\"%@\"", v25];
                }
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                uint64_t v26 = [(__CFAllocator *)v13 countByEnumeratingWithState:&v50 objects:v58 count:16];
                if (v26)
                {
                  uint64_t v27 = *(void *)v51;
                  do
                  {
                    for (uint64_t i = 0; i != v26; ++i)
                    {
                      if (*(void *)v51 != v27) {
                        objc_enumerationMutation(v13);
                      }
                      uint64_t v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                      if (v29
                        && ([*(id *)(*((void *)&v50 + 1) + 8 * i) isEqualToString:&stru_1F265CF90] & 1) == 0)
                      {
                        if (v25 && ([v25 isEqualToString:&stru_1F265CF90] & 1) == 0) {
                          id v30 = (id)objc_msgSend(NSString, "mf_formattedAddressWithName:email:useQuotes:", v25, v29, 1);
                        }
                        else {
                          id v30 = v29;
                        }
                        v31 = v30;
                        if (v30 && [v48 indexOfObject:v30] == 0x7FFFFFFFFFFFFFFFLL) {
                          [v48 addObject:v31];
                        }
                        if ([v49 indexOfObject:v29] == 0x7FFFFFFFFFFFFFFFLL) {
                          [v49 addObject:v29];
                        }
                      }
                    }
                    uint64_t v26 = [(__CFAllocator *)v13 countByEnumeratingWithState:&v50 objects:v58 count:16];
                  }
                  while (v26);
                }
                char v8 = 0;
              }
              while ((v45 & 1) != 0);
            }
            ++v7;
          }
          while (v44 + 1 != v42);
          uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
          id v2 = &OBJC_IVAR___MFMessageLibrary__path;
        }
        while (v6);
      }
    }
  }
  v32 = v2;
  uint64_t v33 = (void *)_allEmailAddressesWithFullUserName;
  long long v34 = (void *)_allEmailAddresses;
  if (a2)
  {
    if (a1)
    {
      if (![(id)_allReceiveEmailAliasAddressesWithFullUserName count])
      {
        long long v34 = v33;
        goto LABEL_84;
      }
      uint64_t v35 = [v33 arrayByAddingObjectsFromArray:_allReceiveEmailAliasAddressesWithFullUserName];
      goto LABEL_82;
    }
    long long v37 = v32;
    if ([*((id *)v32 + 406) count])
    {
      uint64_t v35 = [v34 arrayByAddingObjectsFromArray:*((void *)v37 + 406)];
LABEL_82:
      long long v34 = (void *)v35;
    }
  }
  else
  {
    if (a1) {
      long long v34 = (void *)_allEmailAddressesWithFullUserName;
    }
    id v36 = v34;
  }
LABEL_84:
  +[MailAccount mf_unlock];
  return v34;
}

void sub_1CFD224B0(_Unwind_Exception *a1)
{
}

uint64_t _resetAllEmailAddresses()
{
  +[MailAccount mf_lock];

  _allEmailAddresses = 0;
  _allEmailAddressesWithFullUserName = 0;

  _allReceiveEmailAliasAddresses = 0;
  _allReceiveEmailAliasAddressesWithFullUserName = 0;
  return +[MailAccount mf_unlock];
}

uint64_t _invalidateMailboxCache(uint64_t a1)
{
  *(_DWORD *)(a1 + 64) &= ~0x20000u;
  [*(id *)(a1 + 56) invalidate];
  objc_msgSend((id)a1, "mf_lock");
  id v2 = *(id *)(a1 + 56);
  *(void *)(a1 + 56) = 0;
  return objc_msgSend((id)a1, "mf_unlock");
}

uint64_t _recurseIntoFileSystem(void *a1, id *a2)
{
  uint64_t v4 = [a1 objectForKey:@"MailboxName"];
  uint64_t result = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"MailboxAttributes"), "unsignedIntValue");
  if ((result & 1) == 0)
  {
    uint64_t v6 = result;
    uint64_t v7 = [a2[1] length];
    char v8 = (void *)[a2[2] childWithName:v4];
    if (v8)
    {
      BOOL v9 = v8;
      id v10 = v8;
    }
    else
    {
      BOOL v9 = (void *)[*a2 _copyMailboxWithParent:a2[2] name:v4 attributes:v6 dictionary:0];
    }
    [a2[1] appendString:@"/"];
    [a2[1] appendString:v4];
    [*a2 _loadEntriesFromFileSystemPath:a2[1] parent:v9];

    id v11 = a2[1];
    uint64_t v12 = [v11 length] - v7;
    return objc_msgSend(v11, "deleteCharactersInRange:", v7, v12);
  }
  return result;
}

void sub_1CFD27E28(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1CFD27DD0);
  }
  _Unwind_Resume(a1);
}

void *encodedURLComponent(void *result)
{
  v1 = result;
  if (result) {
    uint64_t result = objc_msgSend(result, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet"));
  }
  if (!result) {
    return v1;
  }
  return result;
}

CFComparisonResult _MFCompareMailboxDictionariesByName(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v3 = [a1 objectForKey:@"MailboxName"];
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = (const __CFString *)v3;
  CFStringRef v5 = (const __CFString *)[a2 objectForKey:@"MailboxName"];
  if (!v5) {
    return 0;
  }
  return CFStringCompare(v4, v5, 0);
}

CFComparisonResult _compareNameWithMailboxDictionary(__CFString *a1, __CFString *a2, __CFString *a3)
{
  CFStringRef v3 = a2;
  CFStringRef v4 = a1;
  if (a1 == a3)
  {
    CFStringRef v3 = (const __CFString *)[(__CFString *)a2 objectForKey:@"MailboxName"];
    if (!v4) {
      return 0;
    }
  }
  else
  {
    CFStringRef v4 = (const __CFString *)[(__CFString *)a1 objectForKey:@"MailboxName"];
    if (!v4) {
      return 0;
    }
  }
  if (!v3) {
    return 0;
  }
  return CFStringCompare(v4, v3, 0);
}

uint64_t initCSAccountTypeUnknown()
{
  if (LoadCoreSpotlight_loadPredicate_0 != -1) {
    dispatch_once(&LoadCoreSpotlight_loadPredicate_0, &__block_literal_global_769);
  }
  uint64_t result = *(void *)dlsym((void *)LoadCoreSpotlight_frameworkLibrary_0, "CSAccountTypeUnknown");
  constantCSAccountTypeUnknown = result;
  getCSAccountTypeUnknown = CSAccountTypeUnknownFunction;
  return result;
}

uint64_t CSAccountTypeUnknownFunction()
{
  return constantCSAccountTypeUnknown;
}

void __LoadCoreSpotlight_block_invoke_0()
{
  LoadCoreSpotlight_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  if (!LoadCoreSpotlight_frameworkLibrary_0) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

__CFString *NSStringFromMailboxUidType(int a1)
{
  if (a1 > 99)
  {
    switch(a1)
    {
      case 'd':
        uint64_t result = @"INBOXSpecialMailboxUid";
        break;
      case 'e':
        uint64_t result = @"JunkSpecialMailboxUid";
        break;
      case 'f':
        uint64_t result = @"ArchiveSpecialMailboxUid";
        break;
      case 'g':
        uint64_t result = @"TrashSpecialMailboxUid";
        break;
      case 'h':
        uint64_t result = @"SentMessagesSpecialMailboxUid";
        break;
      case 'i':
        uint64_t result = @"DraftsSpecialMailboxUid";
        break;
      case 'j':
        uint64_t result = @"OutboxSpecialMailboxUid";
        break;
      default:
        uint64_t result = 0;
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        uint64_t result = @"GenericMailboxUid";
        break;
      case 1:
        uint64_t result = @"JunkMailboxUid";
        break;
      case 2:
        uint64_t result = @"ArchiveMailboxUid";
        break;
      case 3:
        uint64_t result = @"TrashMailboxUid";
        break;
      case 4:
        uint64_t result = @"SentMessagesUid";
        break;
      case 5:
        uint64_t result = @"DraftsMailboxUid";
        break;
      case 6:
        uint64_t result = @"OutboxUid";
        break;
      case 7:
        uint64_t result = @"InboxUid";
        break;
      case 8:
        uint64_t result = @"RootMailboxUid";
        break;
      default:
        id v2 = @"RootlessMailboxUid";
        if (a1 != -100) {
          id v2 = 0;
        }
        if (a1 == -500) {
          uint64_t result = @"InvalidMailboxUidType";
        }
        else {
          uint64_t result = v2;
        }
        break;
    }
  }
  return result;
}

uint64_t _MFChildWithPredicate(void *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "mf_lock");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = (void *)a1[7];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      if (a2(v11, a3)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v11 = 0;
  }
  objc_msgSend(a1, "mf_unlock");
  return v11;
}

BOOL mailboxHasName(id *a1, uint64_t a2)
{
  objc_msgSend(a1, "mf_lock");
  BOOL v4 = [a1[4] compare:a2] == 0;
  objc_msgSend(a1, "mf_unlock");
  return v4;
}

CFComparisonResult _MFCompareMailboxUidsWithResultCodes(uint64_t a1, uint64_t a2, void *a3, CFComparisonResult a4, uint64_t a5, CFComparisonResult a6)
{
  if (a1 == a2) {
    return a5;
  }
  if (!a1) {
    return a6;
  }
  if (!a2) {
    return a4;
  }
  int v12 = *(_DWORD *)(a1 + 112);
  int v13 = *(_DWORD *)(a2 + 112);
  if (v12 && !v13) {
    return a6;
  }
  if (!v12 && v13) {
    return a4;
  }
  if (v12 < v13) {
    return a6;
  }
  if (v12 > v13) {
    return a4;
  }
  if (a3 && (*(unsigned char *)(a1 + 40) & 0x10) == 0 && (*(unsigned char *)(a2 + 40) & 0x10) == 0)
  {
    CFStringRef v14 = (const __CFString *)[a3 _pathComponentForUidName:*(void *)(a1 + 32)];
    uint64_t v15 = [a3 _pathComponentForUidName:*(void *)(a2 + 32)];
LABEL_20:
    CFStringRef v16 = (const __CFString *)v15;
    goto LABEL_22;
  }
  if ([(id)a1 account]) {
    CFStringRef v14 = (const __CFString *)[(id)a1 displayName];
  }
  else {
    CFStringRef v14 = *(const __CFString **)(a1 + 32);
  }
  if ([(id)a2 account])
  {
    uint64_t v15 = [(id)a2 displayName];
    goto LABEL_20;
  }
  CFStringRef v16 = *(const __CFString **)(a2 + 32);
LABEL_22:
  if (v14 == v16) {
    return a5;
  }
  if (v14)
  {
    a6 = a4;
    if (v16)
    {
      a6 = CFStringCompare(v14, v16, 0x61uLL);
      if (a6 == a5) {
        return CFStringCompare(v14, v16, 0x60uLL);
      }
    }
  }
  return a6;
}

uint64_t _MFCompareMailboxUids(uint64_t a1, uint64_t a2, void *a3)
{
  return (int)_MFCompareMailboxUidsWithResultCodes(a1, a2, a3, (CFComparisonResult)0xFFFFFFFFLL, 0, kCFCompareGreaterThan);
}

uint64_t _MFCompareMailboxUidsNS(uint64_t a1, uint64_t a2, void *a3)
{
  return (int)_MFCompareMailboxUidsWithResultCodes(a1, a2, a3, (CFComparisonResult)0xFFFFFFFFLL, 0, kCFCompareGreaterThan);
}

uint64_t bindParentAndChild(void *a1, id *a2)
{
  uint64_t result = [MEMORY[0x1E4F73598] weakReferenceWithObject:a1];
  if ((id)result != a2[6])
  {
    CFStringRef v5 = (void *)result;
    objc_msgSend(a2, "mf_lock");

    a2[6] = v5;
    uint64_t result = objc_msgSend(a2, "mf_unlock");
  }
  if (a1)
  {
    objc_msgSend(a1, "mf_lock");
    id v6 = (id)a1[7];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      a1[7] = v6;
    }
    [v6 addObject:a2];
    return objc_msgSend(a1, "mf_unlock");
  }
  return result;
}

unint64_t _MFFlagsBySettingValueForKey(unint64_t a1, void *a2, unsigned int a3)
{
  if ([a2 isEqual:@"MessageIsRead"])
  {
    if ((a1 & 1) != a3) {
      return a1 & 0xFFFFFFFFFFFFFFFELL | a3;
    }
    return a1;
  }
  if ([a2 isEqual:@"MessageIsDeleted"])
  {
    uint64_t v6 = (a1 >> 1) & 1;
    unint64_t v7 = a1 & 0xFFFFFFFFFFFFFFFDLL;
    BOOL v8 = a3 == 0;
    uint64_t v9 = 2;
LABEL_13:
    if (v8) {
      uint64_t v9 = 0;
    }
    unint64_t v10 = v9 | v7;
    if (v6 != a3) {
      return v10;
    }
    return a1;
  }
  if ([a2 isEqualToString:@"MessageWasRepliedTo"])
  {
    uint64_t v6 = (a1 >> 2) & 1;
    unint64_t v7 = a1 & 0xFFFFFFFFFFFFFCFBLL;
    BOOL v8 = a3 == 0;
    uint64_t v9 = 4;
    goto LABEL_13;
  }
  if ([a2 isEqualToString:@"MessageWasForwarded"])
  {
    uint64_t v6 = (a1 >> 8) & 1;
    unint64_t v7 = a1 & 0xFFFFFFFFFFFFFCFBLL;
    BOOL v8 = a3 == 0;
    uint64_t v9 = 256;
    goto LABEL_13;
  }
  if ([a2 isEqualToString:@"MessageWasRedirected"])
  {
    uint64_t v6 = (a1 >> 9) & 1;
    unint64_t v7 = a1 & 0xFFFFFFFFFFFFFCFBLL;
    BOOL v8 = a3 == 0;
    uint64_t v9 = 512;
    goto LABEL_13;
  }
  if ([a2 isEqualToString:@"MessageIsJunk"])
  {
    if (((a1 >> 21) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFF7FDFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x200000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageIsNotJunk"])
  {
    if (((a1 & 0x80000000) != 0) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFF7FDFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x80000000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageIsFlagged"])
  {
    if (((a1 >> 4) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFFFFFFFFEFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 16;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageIsServerSearchResult"])
  {
    if (((a1 >> 7) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFFFFFFFF7FLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 128;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageIsThreadSearchResult"])
  {
    if (((a1 >> 20) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFFFFEFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x100000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageSenderIsVIP"])
  {
    if (((a1 >> 24) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFFFEFFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x1000000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageDeliveryInProgress"])
  {
    if (((a1 >> 37) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFDFFFFFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x2000000000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageQueuedForDelivery"])
  {
    if (((a1 >> 38) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFBFFFFFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x4000000000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageNeedsSyncConfirmation"])
  {
    if (((a1 >> 22) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFFFFFFBFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x400000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageToContainsAccountAddress"])
  {
    if (((a1 >> 39) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFF7FFFFFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x8000000000;
    goto LABEL_52;
  }
  if ([a2 isEqualToString:@"MessageCcContainsAccountAddress"])
  {
    if (((a1 >> 40) & 1) == a3) {
      return a1;
    }
    unint64_t v12 = a1 & 0xFFFFFEFFFFFFFFFFLL;
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x10000000000;
LABEL_52:
    if (v13) {
      uint64_t v14 = 0;
    }
    return v14 | v12;
  }
  if ([a2 isEqualToString:@"MessageToOrCcContainsAccountAddress"])
  {
    uint64_t v15 = 0x8000000000;
    if (!a3) {
      uint64_t v15 = 0;
    }
    unint64_t v16 = v15 | a1 & 0xFFFFFE7FFFFFFFFFLL;
    uint64_t v17 = 0x10000000000;
    if (!a3) {
      uint64_t v17 = 0;
    }
    return v16 | v17;
  }
  else if (([a2 isEqualToString:@"_Encoding"] & 1) == 0)
  {
    uint64_t v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      _MFFlagsBySettingValueForKey_cold_1((uint64_t)a2, v18);
    }
  }
  return a1;
}

unint64_t MFMessageFlagsByApplyingDictionary(unint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = objc_msgSend(a2, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        a1 = _MFFlagsBySettingValueForKey(a1, *(void **)(*((void *)&v10 + 1) + 8 * v8), objc_msgSend(a2, "mf_BOOLForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8)));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return a1;
}

unint64_t _MFFlagsBySettingNumberOfAttachments(uint64_t a1, unsigned int a2, int a3, int a4)
{
  if (a2) {
    char v4 = a2;
  }
  else {
    char v4 = 63;
  }
  if (a2 > 0x3E) {
    char v4 = 62;
  }
  uint64_t v5 = 8;
  if (!a4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0x800000;
  if (!a3) {
    uint64_t v6 = 0;
  }
  return v6 & 0xFFFFFFFFFFFF03FFLL | a1 & 0xFFFFFFFFFF7F03F7 | v5 & 0xFFFFFFFFFFFF03FFLL | ((unint64_t)(v4 & 0x3F) << 10);
}

void sub_1CFD2F08C(_Unwind_Exception *a1)
{
}

void sub_1CFD2F0AC(void *a1)
{
}

uint64_t _formatFlowedOptions(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a1, "bodyParameterForKey:", @"format"), "isEqualToString:", @"flowed");
  if (result)
  {
    CFStringRef v3 = (void *)[a1 bodyParameterForKey:@"delsp"];
    if (!v3) {
      return 1;
    }
    char v4 = v3;
    if ([v3 caseInsensitiveCompare:@"yes"]
      && [v4 caseInsensitiveCompare:@"y"])
    {
      return 1;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

void *MFDescriptionForMessageFlags(uint64_t a1)
{
  id v2 = "read";
  if ((a1 & 1) == 0) {
    id v2 = "unread";
  }
  CFStringRef v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"0x%llx (%s"), a1, v2;
  char v4 = v3;
  if ((a1 & 0x200000) != 0)
  {
    [v3 appendFormat:@", junk"];
    if ((a1 & 0x80000000) == 0)
    {
LABEL_5:
      if ((a1 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_28;
    }
  }
  else if ((a1 & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  [v4 appendFormat:@", not-junk"];
  if ((a1 & 2) == 0)
  {
LABEL_6:
    if ((a1 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v4 appendFormat:@", deleted"];
  if ((a1 & 4) == 0)
  {
LABEL_7:
    if ((a1 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v4 appendFormat:@", answered"];
  if ((a1 & 0x100) == 0)
  {
LABEL_8:
    if ((a1 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v4 appendFormat:@", forwarded"];
  if ((a1 & 0x200) == 0)
  {
LABEL_9:
    if ((a1 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v4 appendFormat:@", redirected"];
  if ((a1 & 0x10) == 0)
  {
LABEL_10:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v4 appendFormat:@", flagged"];
  if ((a1 & 0x1000000) == 0)
  {
LABEL_11:
    if ((a1 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v4 appendFormat:@", VIP"];
  if ((a1 & 8) == 0)
  {
LABEL_12:
    if ((a1 & 0x800000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v4 appendFormat:@", encrypted"];
  if ((a1 & 0x800000) == 0)
  {
LABEL_13:
    if ((a1 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v4 appendFormat:@", signed"];
  if ((a1 & 0x20) == 0)
  {
LABEL_14:
    if ((a1 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v4 appendFormat:@", recent"];
  if ((a1 & 0x40) == 0)
  {
LABEL_15:
    if ((a1 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v4 appendFormat:@", draft"];
  if ((a1 & 0x80) == 0)
  {
LABEL_16:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v4 appendFormat:@", server search result"];
  if ((a1 & 0x100000) == 0)
  {
LABEL_17:
    if ((a1 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  [v4 appendFormat:@", thread search result"];
  if ((a1 & 0x400000) != 0) {
LABEL_18:
  }
    [v4 appendFormat:@", needs sync"];
LABEL_19:
  if ((WORD1(a1) & 7) == 3)
  {
    if ((a1 & 0x400000000) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    [v4 appendFormat:@", priority=%x", WORD1(a1) & 7];
    if ((a1 & 0x400000000) == 0)
    {
LABEL_21:
      if ((a1 & 0x2000000000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_43;
    }
  }
  [v4 appendFormat:@", partial"];
  if ((a1 & 0x2000000000) == 0)
  {
LABEL_22:
    if ((a1 & 0x100000000) == 0) {
      goto LABEL_23;
    }
LABEL_44:
    [v4 appendFormat:@", temp UID"];
    if ((a1 & 0x200000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_43:
  [v4 appendFormat:@", delivery"];
  if ((a1 & 0x100000000) != 0) {
    goto LABEL_44;
  }
LABEL_23:
  if ((a1 & 0x200000000) != 0) {
LABEL_24:
  }
    [v4 appendString:@", indexed message body"];
LABEL_25:
  [v4 appendFormat:@""]);
  return v4;
}

uint64_t MFMailDirectory()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!MFMailDirectory___MailDir)
  {
    MFMailDirectory___MailDir = (uint64_t)(id)objc_msgSend((id)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", @"Library"), "stringByAppendingPathComponent:", @"Mail");
    id v0 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (([v0 fileExistsAtPath:MFMailDirectory___MailDir] & 1) == 0)
    {
      if (objc_msgSend(v0, "mf_makeCompletePath:mode:", MFMailDirectory___MailDir, 448))
      {
        int v1 = open((const char *)[(id)MFMailDirectory___MailDir fileSystemRepresentation], 0);
        if (v1 < 0)
        {
          char v4 = MFLogGeneral();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v7 = MFMailDirectory___MailDir;
            _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Could not open fd for %@", buf, 0xCu);
          }
        }
        else
        {
          int v2 = v1;
          if (fcntl(v1, 64, 4))
          {
            CFStringRef v3 = MFLogGeneral();
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v7 = MFMailDirectory___MailDir;
              _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_DEFAULT, "#Warning Could not set protection class on %@", buf, 0xCu);
            }
          }
          close(v2);
        }
      }
    }
  }
  return MFMailDirectory___MailDir;
}

uint64_t MFMailDirectoryURL()
{
  if (MFMailDirectoryURL_onceToken != -1) {
    dispatch_once(&MFMailDirectoryURL_onceToken, &__block_literal_global_8);
  }
  return MFMailDirectoryURL___MailDirURL;
}

uint64_t __MFMailDirectoryURL_block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:MFMailDirectory()];
  MFMailDirectoryURL___MailDirURL = result;
  return result;
}

id MFSetUserAgent(id result)
{
  if ((id)_userAgent != result)
  {
    int v1 = result;

    uint64_t result = v1;
    _userAgent = (uint64_t)result;
  }
  return result;
}

uint64_t MFUserAgent()
{
  return _userAgent;
}

uint64_t MFReadLoggingDefaults()
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "synchronize");
  return +[MFConnection readLoggingDefaults];
}

id MFMessageFrameworkBundle()
{
  id result = (id)messageFrameworkBundle;
  if (!messageFrameworkBundle)
  {
    id result = (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MessageLegacy"];
    messageFrameworkBundle = (uint64_t)result;
  }
  return result;
}

uint64_t MFLookupLocalizedString(uint64_t a1, uint64_t a2, __CFString *a3)
{
  if (a3) {
    char v4 = a3;
  }
  else {
    char v4 = @"Message";
  }
  id v5 = MFMessageFrameworkBundle();
  return [v5 localizedStringForKey:a1 value:&stru_1F265CF90 table:v4];
}

uint64_t (*MFComparatorFunctionForSortOrder(uint64_t a1))()
{
  if ([@"readstatus" isEqualToString:a1])
  {
    int v2 = _compareMsgsByReadStatus;
  }
  else
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = v3 + 16;
      if (v3 == 64) {
        break;
      }
      int v5 = [*(id *)((char *)&comparators + v3 + 16) isEqualToString:a1];
      uint64_t v3 = v4;
      if (v5)
      {
        int v2 = *(uint64_t (**)(void *, void *, unsigned __int8 *))((char *)&comparators + v4 + 8);
        goto LABEL_8;
      }
    }
    int v2 = 0;
  }
LABEL_8:
  if (v2) {
    return (uint64_t (*)())v2;
  }
  else {
    return _compareMsgsByDateReceived;
  }
}

uint64_t _compareMsgsByReadStatus(void *a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v6 = [a1 messageFlags];
  uint64_t v7 = [a2 messageFlags];
  if (v6 == v7)
  {
LABEL_2:
    return _compareMsgsByDate(a1, a2, a3);
  }
  int v9 = *a3;
  if ((v6 & 1) != 0 && (v7 & 1) == 0) {
    goto LABEL_7;
  }
  if ((v7 & 1) != 0 && (v6 & 1) == 0) {
    goto LABEL_12;
  }
  char v12 = [a1 messageFlags];
  char v13 = [a2 messageFlags];
  if ((v12 & 4) != 0 && (v13 & 4) == 0) {
    goto LABEL_12;
  }
  if ((v13 & 4) != 0 && (v12 & 4) == 0) {
    goto LABEL_7;
  }
  if ((v12 & 4) != 0) {
    goto LABEL_2;
  }
  __int16 v14 = [a1 messageFlags];
  __int16 v15 = [a2 messageFlags];
  if ((v14 & 0x100) != 0 && (v15 & 0x100) == 0) {
    goto LABEL_12;
  }
  if ((v15 & 0x100) != 0 && (v14 & 0x100) == 0)
  {
LABEL_7:
    BOOL v10 = v9 == 0;
    uint64_t v11 = 1;
    goto LABEL_13;
  }
  if ((v14 & 0x100) != 0) {
    goto LABEL_2;
  }
  __int16 v16 = [a1 messageFlags];
  __int16 v17 = [a2 messageFlags];
  if ((v16 & 0x200) != 0 && (v17 & 0x200) == 0)
  {
LABEL_12:
    BOOL v10 = v9 == 0;
    uint64_t v11 = -1;
LABEL_13:
    if (v10) {
      return v11;
    }
    else {
      return -v11;
    }
  }
  if ((v17 & 0x200) == 0) {
    goto LABEL_2;
  }
  uint64_t result = v9 ? -1 : 1;
  if ((v16 & 0x200) != 0) {
    goto LABEL_2;
  }
  return result;
}

uint64_t _compareMsgsBySender(void *a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v6 = [a1 senderAddressComment];
  uint64_t v7 = (void *)[a2 senderAddressComment];
  if ((void *)v6 == v7) {
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    if (*a3) {
      uint64_t v7 = (void *)v6;
    }
    else {
      uint64_t v8 = (void *)v6;
    }
    uint64_t result = [v7 localizedCaseInsensitiveCompare:v8];
    if (result) {
      return result;
    }
LABEL_23:
    return _compareMsgsByDate(a1, a2, a3);
  }
  uint64_t v9 = 1;
  if (*a3) {
    uint64_t v9 = -1;
  }
  uint64_t v10 = -1;
  if (*a3) {
    uint64_t v10 = 1;
  }
  if (v7) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v6 == 0;
  }
  if (v11) {
    uint64_t v10 = 0;
  }
  if (v6) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v7 == 0;
  }
  if (v12) {
    uint64_t result = v10;
  }
  else {
    uint64_t result = v9;
  }
  if (!result) {
    goto LABEL_23;
  }
  return result;
}

uint64_t _compareMsgsByFlags(void *a1, void *a2, unsigned __int8 *a3)
{
  char v6 = [a1 messageFlags];
  char v7 = [a2 messageFlags];
  int v8 = *a3;
  if ((v6 & 0x10) == 0 && (v7 & 0x10) != 0)
  {
    if (*a3) {
      return -1;
    }
    else {
      return 1;
    }
  }
  if (*a3) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
  if ((v7 & 0x10) == 0 && (v6 & 0x10) != 0) {
    return v9;
  }
  int v10 = [a1 priority];
  int v11 = [a2 priority];
  uint64_t v12 = 1;
  if (v8) {
    uint64_t v12 = -1;
  }
  uint64_t v13 = v11 <= v10 ? 0 : v9;
  uint64_t v9 = v11 >= v10 ? v13 : v12;
  if (v9) {
    return v9;
  }
  return _compareMsgsByDate(a1, a2, a3);
}

uint64_t _compareMsgsByDate(void *a1, void *a2, unsigned __int8 *a3)
{
  int v5 = *a3;
  if (a3[1])
  {
    [a1 dateReceivedAsTimeIntervalSince1970];
    double v7 = v6;
    [a2 dateReceivedAsTimeIntervalSince1970];
  }
  else
  {
    [a1 dateSentAsTimeIntervalSince1970];
    double v7 = v9;
    [a2 dateSentAsTimeIntervalSince1970];
  }
  if (v7 < v8)
  {
    BOOL v10 = v5 == 0;
    uint64_t v11 = 1;
    goto LABEL_8;
  }
  if (v7 > v8)
  {
    BOOL v10 = v5 == 0;
    uint64_t v11 = -1;
LABEL_8:
    if (v10) {
      return v11;
    }
    else {
      return -v11;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  unsigned int v13 = [a1 libraryID];
  unsigned int v14 = [a2 libraryID];
  uint64_t v15 = -1;
  if (v5) {
    uint64_t v15 = 1;
  }
  if (v13 <= v14) {
    uint64_t v15 = 0;
  }
  uint64_t v16 = 1;
  if (v5) {
    uint64_t v16 = -1;
  }
  if (v13 < v14) {
    return v16;
  }
  else {
    return v15;
  }
}

void _appendPartHeadersToConsumer(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  id v10 = (id)[objc_allocWithZone(MEMORY[0x1E4F73550]) init];
  Value = (void *)CFDictionaryGetValue(a3, a2);
  if ((objc_msgSend(@"multipart", "isEqualToString:", objc_msgSend(a2, "type")) & 1) == 0
    && ![Value length])
  {
    [a2 range];
    if (v7)
    {
      [a2 range];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v9 = @"unknown";
      }
      else
      {
        [a2 range];
        double v9 = (__CFString *)EFStringWithUnsignedInteger();
      }
      [v10 setHeader:v9 forKey:@"x-apple-content-length"];
    }
  }
  _appendHeadersToMessageHeaders(a1, a2, v10);
  if (objc_msgSend((id)objc_msgSend(v10, "encodedHeaders"), "length")) {
    MFDataConsumerConsumeCompleteData();
  }
}

void _appendPartDataToConsumer(uint64_t a1, const void *a2, uint64_t a3, const __CFDictionary *a4, uint64_t a5)
{
  Value = (void *)CFDictionaryGetValue(a4, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = (void *)CFDictionaryGetValue(a4, Value);
    if (!v11) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = Value;
    Value = (void *)a2;
    if (!v11) {
      goto LABEL_9;
    }
  }
  if ([v11 length])
  {
    if (objc_msgSend((id)objc_msgSend(Value, "contentTransferEncoding"), "isEqualToString:", @"base64"))
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F73490]) initWithConsumer:a3];
      [v12 setStandardLineBreak];
      [v12 setAllowSlash:1];
      [v12 setPadChar:61];
      MFDataConsumerConsumeCompleteData();
      [v12 done];
    }
    else
    {
      MFDataConsumerConsumeCompleteData();
    }
  }
LABEL_9:
  int v13 = objc_msgSend(@"multipart", "isEqualToString:", objc_msgSend(Value, "type"));
  uint64_t v14 = [Value firstChildPart];
  uint64_t v15 = (void *)v14;
  int v27 = v13;
  if ((v13 & 1) == 0 && !v14) {
    return;
  }
  if (v13
    && (uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend(Value, "bodyParameterForKey:", @"boundary"), "ef_lossyDefaultCStringBytes")) != 0)
  {
    __int16 v17 = v16;
    size_t v26 = strlen(v16);
    if (!v15)
    {
LABEL_34:
      id v28 = objc_alloc_init(MEMORY[0x1E4F73540]);
      objc_msgSend(v28, "mf_appendCString:", "\n--");
      [v28 appendBytes:v17 length:v26];
      objc_msgSend(v28, "mf_appendCString:", "--\n");
      MFDataConsumerConsumeCompleteData();

      return;
    }
    unsigned int v24 = Value;
    uint64_t v25 = v17;
    int v18 = 0;
  }
  else
  {
    if (!v15) {
      return;
    }
    unsigned int v24 = Value;
    uint64_t v25 = 0;
    size_t v26 = 0;
    int v18 = 1;
  }
  uint64_t v23 = *MEMORY[0x1E4F73430];
  while (1)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v20 = (void *)CFDictionaryGetValue(a4, v15);
    if (!v20 || (uint64_t v21 = v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      uint64_t v21 = v15;
    }
    if ((a5 & 1) != 0
      || v27 && (objc_msgSend(@"signed", "isEqualToString:", objc_msgSend(v24, "subtype")) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(v21, "type"), "isEqual:", @"multipart") & 1) != 0
      || objc_msgSend((id)CFDictionaryGetValue(a4, v21), "length")
      || [v21 bodyParameterForKey:v23])
    {
      if ((v18 & 1) == 0)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F73540]);
        objc_msgSend(v22, "mf_appendCString:", "\n--");
        [v22 appendBytes:v25 length:v26];
        [v22 appendBytes:"\n" length:1];
        MFDataConsumerConsumeCompleteData();

        _appendPartHeadersToConsumer(a1, v21, a4);
      }
      _appendPartDataToConsumer(a1, v21, a3, a4, a5);
    }
    if (v18) {
      break;
    }
    uint64_t v15 = (void *)[v15 nextSiblingPart];
    [v19 drain];
    if (!v15)
    {
      __int16 v17 = v25;
      goto LABEL_34;
    }
  }
  [v19 drain];
}

void sub_1CFD35DA0(_Unwind_Exception *exception_object)
{
}

id _createPartAndDataForString(void *a1, void *a2, void *a3, __CFDictionary *a4)
{
  id v4 = a1;
  if (a1)
  {
    int v8 = [a3 isEqualToString:@"html"];
    if (v8 && [v4 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL) {
      id v4 = (id)[v4 stringByReplacingOccurrencesOfString:@" " withString:@"&nbsp;"];
    }
    if (a2)
    {
      [a2 cfStringEncoding];
      double v9 = (void *)MFCreateDataWithString();
    }
    else
    {
      double v9 = 0;
    }
    if (v9) {
      char v10 = 1;
    }
    else {
      char v10 = v8;
    }
    if ((v10 & 1) == 0)
    {
      a2 = (void *)[MEMORY[0x1E4F73528] charsetForEncoding:1536];
      [a2 cfStringEncoding];
      double v9 = (void *)MFCreateDataWithString();
    }
    if (!v9)
    {
      if ((v8 & 1) == 0 && v4 && [v4 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL) {
        id v4 = (id)[v4 stringByReplacingOccurrencesOfString:@" " withString:@" "];
      }
      a2 = objc_msgSend(v4, "mf_bestMimeCharsetForMessageDeliveryUsingSubtype:", a3);
      [a2 cfStringEncoding];
      uint64_t v11 = MFCreateDataWithString();
      if (!v11) {
        return 0;
      }
      double v9 = (void *)v11;
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F73530]);
    [v4 setType:@"text"];
    [v4 setSubtype:a3];
    objc_msgSend(v4, "setBodyParameter:forKey:", objc_msgSend(a2, "charsetName"), @"charset");
    CFDictionarySetValue(a4, v4, v9);
  }
  return v4;
}

id _createOutgoingMessageFromTopLevelMimePart(uint64_t a1, id a2, void *a3, const __CFDictionary *a4)
{
  id v8 = a3;
  if (!a3) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F73550]);
  }
  OutgoingMessageBody = _makeOutgoingMessageBody(a1);
  id v9 = [(MFMessageBody *)OutgoingMessageBody message];
  id v10 = +[MFActivityMonitor currentMonitor];
  [v9 setMessageFlags:1];
  [v9 setMutableHeaders:v8];
  uint64_t v11 = (void *)[a3 copyAddressListForResentFrom];
  if (![v11 count])
  {

    uint64_t v11 = (void *)[a3 copyAddressListForSender];
  }
  if ([v11 count])
  {
    uint64_t v12 = (__CFString *)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "mf_uncommentedAddress");
    if (!a3) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v12 = &stru_1F265CF90;
    if (!a3) {
      goto LABEL_20;
    }
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"ShouldSign"), "intValue"))
  {
    id MimePartData = _createMimePartData(a1, a2, a4);
    if (MimePartData && ([v10 shouldCancel] & 1) == 0)
    {
      id v34 = v10;
      value = 0;
      uint64_t v14 = (void *)[a2 newSignedPartWithData:MimePartData sender:v12 compositionSpecification:*(void *)(a1 + 32) signatureData:&value];
      uint64_t v15 = (const void *)objc_msgSend((id)objc_msgSend(v14, "firstChildPart"), "nextSiblingPart");
      if (value && v15) {
        CFDictionarySetValue(a4, v15, value);
      }
      a2 = v14;
      if (!a2)
      {

        id v9 = 0;
      }
      id v10 = v34;
    }
    else
    {

      id v9 = 0;
    }
  }
LABEL_20:
  if (!v9)
  {

    return v9;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"ShouldEncrypt"), "intValue"))
  {
    id v16 = _createMimePartData(a1, a2, a4);
    if (v16 && ([v10 shouldCancel] & 1) == 0)
    {
      id v35 = v10;
      __int16 v17 = (void *)[MEMORY[0x1E4F1CA48] array];
      value = 0;
      [v8 appendHeaderData:0 andRecipients:v17];
      int v18 = (void *)[v17 arrayByApplyingSelector:sel_mf_uncommentedAddress];
      if (v11 && [v18 indexOfObject:v12] == 0x7FFFFFFFFFFFFFFFLL) {
        [v17 addObjectsFromArray:v11];
      }
      id v19 = (void *)[a2 newEncryptedPartWithData:v16 compositionSpecification:*(void *)(a1 + 32) encryptedData:&value];
      a2 = v19;
      if (value && v19)
      {
        CFDictionarySetValue(a4, v19, value);
      }
      else
      {

        id v9 = 0;
      }
      id v10 = v35;
    }
    else
    {

      id v9 = 0;
    }
  }
  if (!a3 || !v9)
  {
    if (!v9) {
      return v9;
    }
    goto LABEL_57;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v21 = (void *)[a3 copyAddressListForResentFrom];
  uint64_t v22 = [v21 count];
  if (!v22)
  {

    uint64_t v21 = (void *)[a3 copyAddressListForSender];
  }
  id v36 = v10;
  if ([v21 count])
  {
    uint64_t v23 = (__CFString *)objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", 0), "mf_uncommentedAddress");

    if (!v23) {
      goto LABEL_46;
    }
  }
  else
  {

    uint64_t v23 = &stru_1F265CF90;
  }
  uint64_t v24 = [(__CFString *)v23 rangeOfString:@"@" options:4];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_46:
    uint64_t v26 = 0;
    goto LABEL_48;
  }
  uint64_t v26 = [(__CFString *)v23 substringFromIndex:v24 + v25];
LABEL_48:
  int v27 = objc_msgSend(NSString, "mf_messageIDStringWithDomainHint:", v26);
  if (v27)
  {
    id v28 = v27;
    if ([v27 length])
    {
      uint64_t v29 = *MEMORY[0x1E4F606F0];
      if (v22 && objc_msgSend((id)objc_msgSend(v8, "firstHeaderForKey:", *MEMORY[0x1E4F606F0]), "length")) {
        uint64_t v29 = *MEMORY[0x1E4F60728];
      }
      [v8 setHeader:v28 forKey:v29];
    }
  }
  uint64_t v30 = *MEMORY[0x1E4F606E8];
  if (![a3 firstHeaderForKey:*MEMORY[0x1E4F606E8]]) {
    objc_msgSend(a3, "setHeader:forKey:", objc_msgSend(MEMORY[0x1E4F73520], "versionString"), v30);
  }
  [v20 drain];
  id v10 = v36;
LABEL_57:
  id v31 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (_makeMimeHeadersConsistent(a1, a2, a4) && ([v10 shouldCancel] & 1) == 0)
  {
    _appendHeadersToMessageHeaders(a1, a2, v8);
    _appendPartDataToConsumer(a1, a2, (uint64_t)OutgoingMessageBody, a4, 0);
    if ((![(_MFOutgoingMessageBody *)OutgoingMessageBody count]
       || ![(_MFOutgoingMessageBody *)OutgoingMessageBody isLastCharacterNewLine])
      && (*(unsigned char *)(a1 + 16) & 2) == 0)
    {
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:"\n" length:1 freeWhenDone:0];
      MFDataConsumerConsumeCompleteData();
    }
    [(_MFOutgoingMessageBody *)OutgoingMessageBody done];
  }
  else
  {

    id v9 = 0;
  }
  [v31 drain];
  return v9;
}

void sub_1CFD36834(_Unwind_Exception *a1)
{
}

id _createPlainTextPart(void *a1, __CFDictionary *a2)
{
  id PartAndDataForString = (id)objc_msgSend((id)objc_msgSend(a1, "string"), "mf_bestMimeCharsetUsingHint:", 0xFFFFFFFFLL);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"UseFormatFlowedForWrapping"))
  {
    id v9 = 0;
    char v8 = 0;
    objc_msgSend(a1, "getFormatFlowedString:insertedTrailingSpaces:encoding:", &v9, &v8, objc_msgSend(PartAndDataForString, "cfStringEncoding"));
    if (v9)
    {
      id PartAndDataForString = _createPartAndDataForString(v9, PartAndDataForString, @"plain", a2);
      [PartAndDataForString setBodyParameter:@"flowed" forKey:@"format"];
      if (v8) {
        [PartAndDataForString setBodyParameter:@"yes" forKey:@"delsp"];
      }
    }
    else if (PartAndDataForString)
    {
      uint64_t v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1038, [NSString stringWithFormat:MFLookupLocalizedString(@"BAD_CHARSET_FORMAT", @"Some characters in your message could not be converted to the “%@” text encoding. Please choose a different entry from the “Text Encoding” menu.", @"Delayed", objc_msgSend(PartAndDataForString, "displayName")]);
      [(MFError *)v7 setShortDescription:MFLookupLocalizedString(@"BAD_CHARSET_TITLE", @"Invalid Text Encoding", @"Delayed")];
      objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v7);
      return 0;
    }
    return PartAndDataForString;
  }
  else
  {
    int v5 = objc_msgSend(a1, "quotedString:", objc_msgSend(PartAndDataForString, "cfStringEncoding"));
    return _createPartAndDataForString(v5, PartAndDataForString, @"plain", a2);
  }
}

void *_createPartForMFAttachment(unsigned char *a1, void *a2, int a3, __CFDictionary *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v8 = @"inline";
  if (([a2 isImageFile] & 1) == 0
    && !objc_msgSend((id)objc_msgSend(a2, "metadataValueForKey:", @"MFAttachmentIsSinglePagePDFKey"), "BOOLValue"))
  {
    char v8 = @"attachment";
  }
  uint64_t v9 = [a2 fileName];
  if (v9)
  {
    if ((MFStringCanBeConvertedLosslessly() & 1) == 0)
    {
      uint64_t v10 = MFCreateDataWithString();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = (void *)[[NSString alloc] initWithData:v10 encoding:1];
        uint64_t v9 = [v12 stringByReplacingOccurrencesOfString:@"?" withString:@"_"];
      }
    }
  }
  int v13 = (void *)[objc_allocWithZone(MEMORY[0x1E4F73530]) init];
  objc_msgSend(v13, "setDispositionParameter:forKey:", objc_msgSend(a2, "fileName"), @"filename");
  [v13 setDisposition:v8];
  if ([a1 shouldWriteAttachmentPlaceholders]
    && [a2 isPlaceholder])
  {
    uint64_t v14 = (void *)[a2 fetchPlaceholderData];
  }
  else
  {
    uint64_t v14 = (void *)[a2 fetchDataSynchronously:0 stripPrivateMetadata:1];
  }
  uint64_t v15 = v14;
  if ([v14 length])
  {
    if ((a1[16] & 4) != 0)
    {
      id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", objc_msgSend(v15, "length"));
      [v13 setDispositionParameter:v16 forKey:@"size"];
    }
    __int16 v17 = (void *)[a2 fileAttributes];
    int v18 = (void *)[v17 objectForKey:*MEMORY[0x1E4F28330]];
    CFDictionarySetValue(a4, v13, v15);
    id v19 = (void *)[a2 fileName];
    id v20 = objc_alloc_init(MEMORY[0x1E4F73588]);
    objc_msgSend(v20, "setMimeType:", objc_msgSend(a2, "mimeType"));
    objc_msgSend(v20, "setPathExtension:", objc_msgSend(v19, "pathExtension"));
    [v20 setFilename:v19];
    if ([v20 osType] == 1061109567) {
      [v20 setOsType:0];
    }
    uint64_t v21 = [v20 mimeType];
    if (objc_msgSend(&stru_1F265CF90, "isEqualToString:", objc_msgSend(v20, "pathExtension"))) {
      [v20 setPathExtension:0];
    }
    uint64_t v22 = [v20 pathExtension];
    if (v22) {
      int v23 = v21 == 0;
    }
    else {
      int v23 = (v21 == 0) | 2;
    }
    if (v23)
    {
      uint64_t v24 = v22;
      MFGetTypeInfo();
      if (!v24 || v21)
      {
        if ([v20 pathExtension]) {
          objc_msgSend(a2, "setFileName:", objc_msgSend(v19, "stringByAppendingPathExtension:", objc_msgSend(v20, "pathExtension")));
        }
      }
    }
    uint64_t v25 = (__CFString *)[v20 mimeType];
    if (v25
      && (uint64_t v25 = (__CFString *)objc_msgSend((id)objc_msgSend(v20, "mimeType"), "componentsSeparatedByString:", @"/")) != 0)
    {
      uint64_t v26 = v25;
      if ([(__CFString *)v25 count] == 2)
      {
        uint64_t v27 = [(__CFString *)v26 objectAtIndex:0];
        uint64_t v25 = (__CFString *)[(__CFString *)v26 objectAtIndex:1];
      }
      else
      {
        uint64_t v27 = 0;
        uint64_t v25 = 0;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    if (v27) {
      uint64_t v29 = (__CFString *)v27;
    }
    else {
      uint64_t v29 = @"application";
    }
    if (v27) {
      uint64_t v30 = v25;
    }
    else {
      uint64_t v30 = @"octet-stream";
    }
    [v13 setType:v29];
    [v13 setSubtype:v30];

    if (v18) {
      [v13 setBodyParameter:objc_msgSend(NSString, "stringWithFormat:", @"%#o", objc_msgSend(v18, "intValue")), @"x-unix-mode" forKey];
    }
    uint64_t v31 = [a2 contentID];
    if (v31) {
      [v13 setBodyParameter:v31 forKey:*MEMORY[0x1E4F73430]];
    }
    [v13 setBodyParameter:v9 forKey:@"name"];
    if (v13)
    {
LABEL_48:
      if (a3 && (objc_msgSend((id)objc_msgSend(v13, "type"), "isEqualToString:", @"multipart") & 1) == 0) {
        objc_msgSend(v13, "setContentID:", objc_msgSend(a2, "contentID"));
      }
    }
  }
  else
  {
    id v28 = MFLogGeneral();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = [a2 fileName];
      _os_log_impl(&dword_1CFCFE000, v28, OS_LOG_TYPE_INFO, "Unable to encode %@ as a MIME attachment", buf, 0xCu);
    }
    CFDictionarySetValue(a4, v13, (const void *)[MEMORY[0x1E4F1C9B8] data]);
    if (v13) {
      goto LABEL_48;
    }
  }
  return v13;
}

void sub_1CFD377C8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    int v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v17 reason];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1CFCFE000, v18, OS_LOG_TYPE_INFO, "Exception raised during message encoding: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1CFD37788);
  }
  _Unwind_Resume(a1);
}

void *_createPartForFileWrapper(uint64_t a1, void *a2, __CFDictionary *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)[a2 preferredFilename];
  id v25 = v6;
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if ([a2 isImageFile]) {
    char v8 = @"inline";
  }
  else {
    char v8 = @"attachment";
  }
  uint64_t v9 = (uint64_t)v7;
  if ((MFStringCanBeConvertedLosslessly() & 1) == 0)
  {
    uint64_t v10 = MFCreateDataWithString();
    uint64_t v9 = (uint64_t)v7;
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = (void *)[[NSString alloc] initWithData:v10 encoding:1];
      uint64_t v9 = [v12 stringByReplacingOccurrencesOfString:@"?" withString:@"_"];
    }
  }
  int v13 = (void *)[objc_allocWithZone(MEMORY[0x1E4F73530]) init];
  [v13 setDispositionParameter:v7 forKey:@"filename"];
  [v13 setDisposition:v8];
  if ([a2 isSymbolicLink])
  {
    uint64_t v14 = (void *)[objc_allocWithZone(MEMORY[0x1E4F73530]) init];
    uint64_t v15 = objc_opt_new();
    _setMimeTypeFromWrapper(v14, &v25, a2);
    _appendHeadersToMessageHeaders(a1, v14, v15);
    CFDictionarySetValue(a3, v13, (const void *)[v15 encodedHeaders]);

    [v13 setType:@"message"];
    [v13 setSubtype:@"external-body"];
    [v13 setBodyParameter:@"local-file" forKey:@"access-type"];
    uint64_t v16 = [a2 symbolicLinkDestination];
    id v17 = v13;
LABEL_21:
    [v17 setBodyParameter:v16 forKey:@"name"];
    return v13;
  }
  if ([a2 isRegularFile])
  {
    int v18 = (void *)[a2 regularFileContents];
    if (!v18) {
      int v18 = (void *)[MEMORY[0x1E4F1C9B8] data];
    }
    if ((*(unsigned char *)(a1 + 16) & 4) != 0)
    {
      uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", objc_msgSend(v18, "length"), v25);
      [v13 setDispositionParameter:v19 forKey:@"size"];
    }
    id v20 = (void *)[a2 fileAttributes];
    uint64_t v21 = (void *)[v20 objectForKey:*MEMORY[0x1E4F28330]];
    CFDictionarySetValue(a3, v13, v18);
    _setMimeTypeFromWrapper(v13, &v25, a2);
    if (v21) {
      [v13 setBodyParameter:objc_msgSend(NSString, "stringWithFormat:", @"%#o", objc_msgSend(v21, "intValue")), @"x-unix-mode" forKey];
    }
    uint64_t v22 = [a2 URL];
    if (v22) {
      [v13 setBodyParameter:v22 forKey:*MEMORY[0x1E4F73430]];
    }
    id v17 = v13;
    uint64_t v16 = v9;
    goto LABEL_21;
  }
  int v23 = MFLogGeneral();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1CFCFE000, v23, OS_LOG_TYPE_INFO, "Unable to encode %@ as a MIME attachment", buf, 0xCu);
  }
  CFDictionarySetValue(a3, v13, (const void *)[MEMORY[0x1E4F1C9B8] data]);
  return v13;
}

void _setMimeTypeFromWrapper(void *a1, id *a2, void *a3)
{
  id v6 = *a2;
  id v17 = objc_alloc_init(MEMORY[0x1E4F73588]);
  objc_msgSend(v17, "setMimeType:", objc_msgSend(a3, "mimeType"));
  objc_msgSend(v17, "setPathExtension:", objc_msgSend(v6, "pathExtension"));
  [v17 setFilename:v6];
  if ([v17 osType] == 1061109567) {
    [v17 setOsType:0];
  }
  uint64_t v7 = [v17 mimeType];
  if (objc_msgSend(&stru_1F265CF90, "isEqualToString:", objc_msgSend(v17, "pathExtension"))) {
    [v17 setPathExtension:0];
  }
  uint64_t v8 = [v17 pathExtension];
  if (v8) {
    int v9 = v7 == 0;
  }
  else {
    int v9 = (v7 == 0) | 2;
  }
  if (v9)
  {
    uint64_t v10 = v8;
    MFGetTypeInfo();
    if (!v10 || v7)
    {
      if ([v17 pathExtension])
      {
        uint64_t v11 = objc_msgSend(*a2, "stringByAppendingPathExtension:", objc_msgSend(v17, "pathExtension"));
        *a2 = (id)v11;
        [a3 setPreferredFilename:v11];
        [a3 setFilename:*a2];
      }
    }
  }
  uint64_t v12 = (__CFString *)[v17 mimeType];
  if (v12)
  {
    uint64_t v12 = (__CFString *)objc_msgSend((id)objc_msgSend(v17, "mimeType"), "componentsSeparatedByString:", @"/");
    if (v12)
    {
      int v13 = v12;
      if ([(__CFString *)v12 count] == 2)
      {
        uint64_t v14 = [(__CFString *)v13 objectAtIndex:0];
        uint64_t v12 = (__CFString *)[(__CFString *)v13 objectAtIndex:1];
        goto LABEL_19;
      }
      uint64_t v12 = 0;
    }
  }
  uint64_t v14 = 0;
LABEL_19:
  if (v14) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = @"octet-stream";
  }
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = @"application";
  }
  [a1 setType:v16];
  [a1 setSubtype:v15];
}

uint64_t _appendHeadersToMessageHeaders(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 24) messageWriter:a1 willGenerateHeadersForMimePart:a2];
  }
  if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", @"multipart")
    && ![a2 bodyParameterForKey:@"boundary"])
  {
    id v6 = (void *)[MEMORY[0x1E4F73520] copyNewMimeBoundary];
    [a2 setBodyParameter:v6 forKey:@"boundary"];
  }
  uint64_t v7 = [a2 type];
  uint64_t v8 = [a2 subtype];
  id v9 = objc_allocWithZone(NSString);
  uint64_t v10 = &stru_1F265CF90;
  if (v7) {
    uint64_t v11 = (__CFString *)v7;
  }
  else {
    uint64_t v11 = &stru_1F265CF90;
  }
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  uint64_t v12 = (void *)[v9 initWithFormat:@"%@/%@", v11, v10];
  int v13 = (void *)[a2 dispositionParameterForKey:@"filename"];
  if (v13)
  {
    if ([a2 bodyParameterForKey:@"name"])
    {
LABEL_13:
      int v13 = 0;
      goto LABEL_19;
    }
    uint64_t v14 = (void *)[v13 mutableCopyWithZone:0];
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v14, "length"));
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", @"\"", @"\\\"", 0, 0, objc_msgSend(v14, "length"));
    [v14 insertString:@"\"" atIndex:0];
    [v14 appendString:@"\""];
    uint64_t v15 = (void *)MFCreateDataWithString();
    if (v15
      || (uint64_t v15 = (void *)MFCreateDataWithString()) != 0
      || (CFStringGetSystemEncoding(), (uint64_t v15 = (void *)MFCreateDataWithString()) != 0))
    {
    }
    else
    {
      CFStringGetSystemEncoding();
      uint64_t v15 = (void *)MFCreateDataWithString();

      if (!v15) {
        goto LABEL_13;
      }
    }
    strcpy(v50, ";\n\tname=");
    int v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v15, "length") + 8);
    [v13 appendBytes:v50 length:8];
    [v13 appendData:v15];
  }
LABEL_19:
  uint64_t v16 = (void *)[a2 bodyParameterKeys];
  uint64_t v17 = [v16 count];
  if (v13 || v17)
  {
    int v18 = objc_msgSend((id)objc_msgSend(v12, "dataUsingEncoding:allowLossyConversion:", 1, 1), "mutableCopyWithZone:", 0);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v19 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v18, "mf_appendRFC2231CompliantValue:forKey:", objc_msgSend(a2, "bodyParameterForKey:", *(void *)(*((void *)&v44 + 1) + 8 * i)), *(void *)(*((void *)&v44 + 1) + 8 * i));
        }
        uint64_t v20 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v20);
    }
    if (v13)
    {
      [v18 appendData:v13];
    }
    [a3 setHeader:v18 forKey:*MEMORY[0x1E4F60698]];
  }
  else
  {
    [a3 setHeader:v12 forKey:*MEMORY[0x1E4F60698]];
  }

  int v23 = (void *)[a2 disposition];
  uint64_t v24 = (void *)[a2 dispositionParameterKeys];
  uint64_t v25 = [v24 count];
  if (v23 || v25)
  {
    if (v25)
    {
      uint64_t v26 = (void *)[objc_allocWithZone(MEMORY[0x1E4F73540]) init];
      if ([v23 length]) {
        objc_msgSend(v26, "appendData:", objc_msgSend(v23, "dataUsingEncoding:allowLossyConversion:", 1, 1));
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v27 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v41 != v29) {
              objc_enumerationMutation(v24);
            }
            objc_msgSend(v26, "mf_appendRFC2231CompliantValue:forKey:", objc_msgSend(a2, "dispositionParameterForKey:", *(void *)(*((void *)&v40 + 1) + 8 * j)), *(void *)(*((void *)&v40 + 1) + 8 * j));
          }
          uint64_t v28 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v28);
      }
      [a3 setHeader:v26 forKey:*MEMORY[0x1E4F60670]];
    }
    else
    {
      [a3 setHeader:v23 forKey:*MEMORY[0x1E4F60670]];
    }
  }
  uint64_t v31 = [a2 contentTransferEncoding];
  if (v31) {
    [a3 setHeader:v31 forKey:*MEMORY[0x1E4F60690]];
  }
  uint64_t v32 = [a2 contentDescription];
  if (v32) {
    [a3 setHeader:v32 forKey:*MEMORY[0x1E4F60668]];
  }
  uint64_t v33 = (void *)[a2 contentID];
  if (v33)
  {
    uint64_t v34 = (void *)[v33 mutableCopyWithZone:0];
    [a3 setHeader:v34 forKey:*MEMORY[0x1E4F60678]];
  }
  uint64_t v35 = (void *)[a2 languages];
  if (v35)
  {
    id v36 = v35;
    if ([v35 count])
    {
      uint64_t v37 = [v36 componentsJoinedByString:@" "];
      [a3 setHeader:v37 forKey:*MEMORY[0x1E4F60680]];
    }
  }
  uint64_t v38 = [a2 contentLocation];
  if (v38) {
    [a3 setHeader:v38 forKey:*MEMORY[0x1E4F60688]];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [*(id *)(a1 + 24) messageWriter:a1 willEncodeHeaders:a3 forMimePart:a2];
  }
  return result;
}

_MFOutgoingMessageBody *_makeOutgoingMessageBody(uint64_t a1)
{
  int v2 = objc_alloc_init(_MFOutgoingMessageBody);
  id v3 = objc_alloc_init(*(Class *)(a1 + 8));
  [(MFMessageBody *)v2 setMessage:v3];
  [v3 setMessageBody:v2];
  return v2;
}

id _createMimePartData(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  OutgoingMessageBody = _makeOutgoingMessageBody(a1);
  id v7 = [(MFMessageBody *)OutgoingMessageBody message];
  id v8 = objc_alloc_init(MEMORY[0x1E4F73550]);
  id v9 = +[MFActivityMonitor currentMonitor];
  [v7 setMutableHeaders:v8];
  if (_makeMimeHeadersConsistent(a1, a2, a3) && ([v9 shouldCancel] & 1) == 0)
  {
    _appendHeadersToMessageHeaders(a1, a2, v8);
    _appendPartDataToConsumer(a1, a2, (uint64_t)OutgoingMessageBody, a3, 0);
    [(_MFOutgoingMessageBody *)OutgoingMessageBody done];
    id v10 = (id)[v7 messageData];
  }
  else
  {
    id v10 = 0;
  }

  [v7 setMessageBody:0];
  return v10;
}

uint64_t _makeMimeHeadersConsistent(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  Value = (void *)CFDictionaryGetValue(a3, a2);
  id v6 = (void *)[a2 type];
  if ([@"multipart" isEqualToString:v6])
  {
    v61 = a2;
    id v7 = (void *)[a2 subparts];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v65;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        int v13 = v10;
        if (*(void *)v65 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v64 + 1) + 8 * v12);
        uint64_t result = _makeMimeHeadersConsistent(a1, v14, a3);
        if (!result) {
          return result;
        }
        uint64_t v16 = (void *)[v14 contentTransferEncoding];
        id v10 = @"binary";
        if (([v16 isEqualToString:@"binary"] & 1) == 0)
        {
          if ([v16 isEqualToString:@"8bit"])
          {
            if ([(__CFString *)v13 isEqualToString:@"binary"]) {
              id v10 = v13;
            }
            else {
              id v10 = @"8bit";
            }
          }
          else
          {
            id v10 = v13;
          }
        }
        if (v9 == ++v12)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_25;
        }
      }
    }
    id v10 = 0;
LABEL_25:
    if (v10) {
      uint64_t v22 = v10;
    }
    else {
      uint64_t v22 = @"7bit";
    }
    int v23 = v61;
LABEL_30:
    [v23 setContentTransferEncoding:v22];
    return 1;
  }
  if (!Value)
  {
    uint64_t v22 = @"7bit";
    int v23 = a2;
    goto LABEL_30;
  }
  if ([a2 contentTransferEncoding]) {
    return 1;
  }
  int v17 = [a2 isReadableText];
  uint64_t v18 = [Value length];
  BOOL v60 = v17;
  if (v17) {
    int v19 = 2;
  }
  else {
    int v19 = 6;
  }
  int v58 = v19;
  unint64_t v20 = [Value bytes];
  if ([v6 isEqualToString:@"message"]) {
    LOBYTE(v21) = 1;
  }
  else {
    int v21 = (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
  }
  id v24 = +[MFActivityMonitor currentMonitor];
  if ([v24 canBeCancelled]) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  v62 = v25;
  if (v18 < 1)
  {
    uint64_t v43 = 0;
    goto LABEL_104;
  }
  long long v57 = v6;
  long long v54 = Value;
  unint64_t v55 = v18;
  unsigned int v59 = 0;
  uint64_t v26 = 0;
  char v56 = 0;
  unint64_t v27 = v20 + v18;
  char v28 = 1;
  char v29 = 1;
  uint64_t v30 = (unsigned __int8 *)v20;
  do
  {
    unsigned int v31 = *v30;
    if (v31 <= 0xD && ((1 << v31) & 0x2401) != 0) {
      char v29 = 0;
    }
    if (v31 == 10)
    {
      uint64_t v33 = 0;
      uint64_t v34 = &v30[~v20];
      if (v26 > (uint64_t)v34) {
        uint64_t v34 = (unsigned __int8 *)v26;
      }
      if ((unint64_t)v30 > v20) {
        uint64_t v26 = (uint64_t)v34;
      }
      unint64_t v20 = (unint64_t)(v30 + 1);
    }
    else
    {
      BOOL v35 = v60;
      if (v31 != 27) {
        BOOL v35 = 0;
      }
      if (v31 == 9 || v31 > 0x1F) {
        BOOL v37 = (v31 & 0x80u) == 0;
      }
      else {
        BOOL v37 = v35;
      }
      if (v37)
      {
        uint64_t v33 = 0;
        if (v30 == (unsigned __int8 *)v20 && (unint64_t)(v30 + 5) < v27)
        {
          if (!strncmp("From ", (const char *)v20, 5uLL))
          {
            LOBYTE(v21) = 0;
            uint64_t v33 = 0;
            char v56 = 1;
            uint64_t v26 = 998;
          }
          else
          {
            uint64_t v33 = 0;
          }
          uint64_t v25 = v62;
        }
      }
      else
      {
        unsigned int v38 = v59 + v58;
        unsigned int v39 = *(unsigned __int8 *)(a1 + 16);
        v59 += v58;
        if ((v39 & 3) != 0)
        {
          uint64_t v33 = 0;
        }
        else
        {
          if (v21)
          {
            uint64_t v33 = 0;
            ++v30;
            LOBYTE(v21) = 1;
            goto LABEL_81;
          }
          LOBYTE(v21) = 0;
          if (((v55 > v38) & (v39 >> 3)) != 0) {
            uint64_t v33 = 0;
          }
          else {
            uint64_t v33 = @"base64";
          }
        }
      }
    }
    BOOL v40 = (uint64_t)&(++v30)[-v20] < 999 && v26 < 999;
    if (!v40 && (v21 & 1) == 0)
    {
      if ((*(unsigned char *)(a1 + 16) & 8) != 0
        && (v41 = [v57 isEqualToString:@"text"], uint64_t v25 = v62, (v41 & 1) != 0))
      {
        LOBYTE(v21) = 0;
      }
      else
      {
        LOBYTE(v21) = 0;
        uint64_t v33 = @"base64";
      }
    }
LABEL_81:
    if (v25)
    {
      int v42 = [v25 shouldCancel];
      uint64_t v25 = v62;
      if (v42) {
        char v28 = 0;
      }
    }
  }
  while (!v33 && (unint64_t)v30 < v27 && (v28 & 1) != 0);
  if ((v28 & 1) == 0) {
    return 0;
  }
  uint64_t v43 = ~v20 + v27;
  if (v26 > v43) {
    uint64_t v43 = v26;
  }
  if (v27 <= v20) {
    uint64_t v43 = v26;
  }
  Value = v54;
  if (v33) {
    goto LABEL_109;
  }
  if (v56 & 1 | (v43 > 997)) {
    goto LABEL_99;
  }
  if (!v59)
  {
LABEL_104:
    if (v43 >= 77
      && objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", @"text")
      && objc_msgSend((id)objc_msgSend(a2, "subtype"), "isEqualToString:", @"plain")
      && !objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"UseFormatFlowedForWrapping"))
    {
      goto LABEL_128;
    }
    uint64_t v33 = @"7bit";
    goto LABEL_109;
  }
  if (v29) {
    uint64_t v33 = @"8bit";
  }
  else {
    uint64_t v33 = 0;
  }
  if ((v29 & 1 & ((*(unsigned char *)(a1 + 16) & 3) != 0)) == 0)
  {
LABEL_99:
    if (v56 & 1 | ((v21 & 1) == 0))
    {
      if ((*(unsigned char *)(a1 + 16) & 8) == 0 || [v54 length] <= (unint64_t)v59)
      {
        uint64_t v33 = @"base64";
        goto LABEL_109;
      }
LABEL_128:
      uint64_t v33 = @"quoted-printable";
    }
    else
    {
      uint64_t v33 = @"binary";
    }
  }
LABEL_109:
  objc_msgSend(a2, "setContentTransferEncoding:", v33, v54);
  if ([@"base64" isEqualToString:v33])
  {
    if (v60
      && (objc_msgSend((id)objc_msgSend(a2, "disposition"), "isEqual:", @"attachment") & 1) == 0
      && [Value length])
    {
      long long v44 = (const void *)objc_msgSend(Value, "mf_dataByConvertingUnixNewlinesToNetwork");
      goto LABEL_122;
    }
LABEL_121:
    long long v44 = 0;
    goto LABEL_122;
  }
  if (![@"quoted-printable" isEqualToString:v33]) {
    goto LABEL_121;
  }
  id v45 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  long long v46 = (void *)[objc_alloc(MEMORY[0x1E4F73570]) initWithConsumer:v45];
  [v46 setForTextPart:v60];
  uint64_t v47 = [Value length];
  uint64_t v48 = [Value bytes];
  uint64_t v49 = 0;
  BOOL v50 = 0;
  do
  {
    if (v62 && ([v62 shouldCancel] & 1) != 0) {
      break;
    }
    uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v48 + v49 length:v47 - v49 freeWhenDone:0];
    uint64_t v52 = [v46 appendData:v51];

    if (v52 < 0) {
      break;
    }
    int v53 = v50 && v52 == 0;
    v49 += v52;
    BOOL v50 = v52 == 0;
  }
  while (v53 != 1);
  [v46 done];
  [v45 done];
  long long v44 = (const void *)[v45 data];

LABEL_122:
  if (v62 && ([v62 shouldCancel] & 1) != 0) {
    return 0;
  }
  if (v44) {
    CFDictionarySetValue(a3, a2, v44);
  }
  return 1;
}

void sub_1CFD39598(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1CFD3A38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_BKSApplicationStateGetDescription(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      uint64_t result = @"Unknown";
      break;
    case 1:
      uint64_t result = @"Terminated";
      break;
    case 2:
      uint64_t result = @"Background Task Suspended";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      uint64_t result = @"Background Running";
      break;
    case 8:
      uint64_t result = @"Foreground Running";
      break;
    default:
      id v4 = @"Foreground Running Obscured";
      if (a1 != 32) {
        id v4 = 0;
      }
      if (a1 == 16) {
        uint64_t result = @"Process Server";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }
  return result;
}

id EFPromiseAttachmentDataHandler(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __EFPromiseAttachmentDataHandler_block_invoke;
  v3[3] = &unk_1E6866EA8;
  v3[4] = a2;
  v3[5] = a1;
  return (id)[v3 copy];
}

CFDataRef _stripPrivateFileMetadata(const __CFData *a1)
{
  CFDataRef v1 = a1;
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  int v2 = CGImageSourceCreateWithData(a1, 0);
  if (v2)
  {
    id v3 = v2;
    id v4 = CGImageSourceCopyMetadataAtIndex(v2, 0, 0);
    if (v4)
    {
      int v5 = v4;
      CGMutableImageMetadataRef MutableCopy = CGImageMetadataCreateMutableCopy(v4);
      if (MutableCopy)
      {
        CGMutableImageMetadataRef v7 = MutableCopy;
        uint64_t v15 = 0;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x2020000000;
        char v18 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = ___stripPrivateFileMetadata_block_invoke;
        v14[3] = &unk_1E6866ED0;
        v14[5] = &v15;
        v14[6] = MutableCopy;
        v14[4] = &unk_1F2675508;
        CGImageMetadataEnumerateTagsUsingBlock(v5, 0, 0, v14);
        if (*((unsigned char *)v16 + 24))
        {
          uint64_t v8 = (__CFData *)[MEMORY[0x1E4F1CA58] data];
          CFStringRef Type = CGImageSourceGetType(v3);
          size_t Count = CGImageSourceGetCount(v3);
          uint64_t v11 = CGImageDestinationCreateWithData(v8, Type, Count, 0);
          if (v11)
          {
            keys[0] = *(void **)MEMORY[0x1E4F2F448];
            values = v7;
            CFDictionaryRef v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
            if (v12)
            {
              if (CGImageDestinationCopyImageSource(v11, v3, v12, 0)) {
                CFDataRef v1 = v8;
              }
              CFRelease(v12);
            }
            CFRelease(v11);
          }
        }
        CFRelease(v7);
        _Block_object_dispose(&v15, 8);
      }
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  return v1;
}

void sub_1CFD3B344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __EFPromiseAttachmentDataHandler_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) data];
    id v4 = *(void **)(a1 + 40);
    return [v4 finishWithResult:v3];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    return objc_msgSend(v6, "finishWithError:");
  }
}

uint64_t ___stripPrivateFileMetadata_block_invoke(uint64_t a1, const __CFString *a2, CGImageMetadataTagRef tag)
{
  CFStringRef v6 = CGImageMetadataTagCopyPrefix(tag);
  if (v6)
  {
    CFStringRef v7 = v6;
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      CFStringRef v10 = CGImageMetadataTagCopyName(tag);
      if (v10)
      {
        CFStringRef v11 = v10;
        if ([v9 containsObject:v10])
        {
          CGImageMetadataRemoveTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 48), 0, a2);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
        CFRelease(v11);
      }
    }
    CFRelease(v7);
  }
  return 1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1CFD3D780(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1CFD3DE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1CFD40B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1CFD42824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void MFRegisterContentProtectionObserver(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    MFRegisterContentProtectionObserver_cold_1();
  }
  if (!a2) {
    MFRegisterContentProtectionObserver_cold_2();
  }
  if (_observationQueue == a2) {
    MFRegisterContentProtectionObserver_cold_3();
  }
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __MFRegisterContentProtectionObserver_block_invoke;
  v2[3] = &unk_1E68661E0;
  v2[4] = a1;
  v2[5] = a2;
  _InitAndPerformSync(v2);
}

void _InitAndPerformSync(dispatch_block_t block)
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_12);
  }
  int v2 = _observationQueue;
  dispatch_sync(v2, block);
}

void __MFRegisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  int v2 = [[_MFContentProtectionObserverWrapper alloc] initWithObserver:*(void *)(a1 + 32) queue:*(void *)(a1 + 40)];
  Mutable = (__CFDictionary *)_observers;
  value = v2;
  if (!_observers)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    int v2 = value;
    _observers = (uint64_t)Mutable;
  }
  CFDictionaryAddValue(Mutable, *(const void **)(a1 + 32), v2);
}

void MFUnregisterContentProtectionObserver(uint64_t a1)
{
  if (!a1) {
    MFUnregisterContentProtectionObserver_cold_1();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MFUnregisterContentProtectionObserver_block_invoke;
  block[3] = &unk_1E68661B8;
  block[4] = a1;
  _InitAndPerformSync(block);
}

void __MFUnregisterContentProtectionObserver_block_invoke(uint64_t a1)
{
  if (_observers) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)_observers, *(const void **)(a1 + 32));
  }
}

uint64_t MFContentProtectionGetObservedState()
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_12);
  }
  return _contentProtectionState;
}

BOOL MFProtectedDataAvailable()
{
  if (_InitObservation_sOnceToken != -1) {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_12);
  }
  return _contentProtectionState == 3 || _contentProtectionState == 0;
}

BOOL MFDeviceUnlockedSinceBoot()
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

void MFContentProtectionSimulateState(int a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MFContentProtectionSimulateState_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v2 = a1;
  _InitAndPerformSync(block);
}

void __MFContentProtectionSimulateState_block_invoke(uint64_t a1)
{
}

void _NotifyObserversWithContentProtectionState(unsigned int a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)_observationQueue);
  if (a1 == -1) {
    _NotifyObserversWithContentProtectionState_cold_1();
  }
  unsigned int v2 = _contentProtectionState;
  if (_contentProtectionState == -1) {
    _NotifyObserversWithContentProtectionState_cold_2();
  }
  uint64_t v3 = MFLogGeneral();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == a1)
  {
    if (v4)
    {
      uint64_t v5 = @"disabled";
      switch(a1)
      {
        case 0u:
          uint64_t v5 = @"unlocked";
          break;
        case 1u:
          uint64_t v5 = @"locked";
          break;
        case 2u:
          uint64_t v5 = @"locking";
          break;
        case 3u:
          break;
        default:
          uint64_t v5 = @"unknown";
          break;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v5;
      __int16 v27 = 2112;
      char v28 = v5;
      _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring lock state change from %@ to %@", buf, 0x16u);
    }
  }
  else
  {
    if (v4)
    {
      if (v2 > 3) {
        CFStringRef v6 = @"unknown";
      }
      else {
        CFStringRef v6 = off_1E6867238[v2];
      }
      if (a1 > 3) {
        CFStringRef v7 = @"unknown";
      }
      else {
        CFStringRef v7 = off_1E6867238[a1];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v6;
      __int16 v27 = 2112;
      char v28 = v7;
      _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_DEFAULT, "Keybag transitioning from %@ to %@", buf, 0x16u);
    }
    if (a1 == 1 && !v2)
    {
      uint64_t v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFCFE000, v8, OS_LOG_TYPE_DEFAULT, "Brace for impact, keybag was locked without grace period!", buf, 2u);
      }
    }
    unsigned int v9 = v2;
    atomic_compare_exchange_strong(&_contentProtectionState, &v9, a1);
    if (v9 == v2)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v10 = (void *)[(id)_observers allValues];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v16 = [v15 queue];
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = ___NotifyObserversWithContentProtectionState_block_invoke;
            v17[3] = &unk_1E6866FC0;
            v17[4] = v15;
            unsigned int v18 = a1;
            unsigned int v19 = v2;
            dispatch_async(v16, v17);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }
    }
  }
}

uint64_t MFContentProtectionDumpDiagnosticState()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n==== MFContentProtectionObserver ====\n"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MFContentProtectionDumpDiagnosticState_block_invoke;
  block[3] = &unk_1E68661B8;
  void block[4] = v0;
  _InitAndPerformSync(block);
  return v0;
}

uint64_t __MFContentProtectionDumpDiagnosticState_block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *(void **)(a1 + 32);
  if ((_contentProtectionState + 1) > 4) {
    uint64_t v3 = @"unknown";
  }
  else {
    uint64_t v3 = off_1E6867258[_contentProtectionState + 1];
  }
  [v2 appendFormat:@"Recorded state: %@\n", v3];
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = (int)_KeyBagLockState() + 1;
  if (v5 > 4) {
    CFStringRef v6 = @"unknown";
  }
  else {
    CFStringRef v6 = off_1E6867258[v5];
  }
  [v4 appendFormat:@"System state: %@\n", v6];
  CFStringRef v7 = *(void **)(a1 + 32);
  int v8 = MKBDeviceUnlockedSinceBoot();
  unsigned int v9 = "YES";
  if (!v8) {
    unsigned int v9 = "NO";
  }
  objc_msgSend(v7, "appendFormat:", @"Unlocked since boot: %s\n", v9);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v10 setTimeStyle:1];
  [v10 setDateStyle:2];
  if (*(double *)&_lastNotificationTime == 0.0) {
    uint64_t v11 = @"never";
  }
  else {
    uint64_t v11 = (__CFString *)objc_msgSend(v10, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_lastNotificationTime));
  }
  if (*(double *)&_beganObservingTime == 0.0) {
    uint64_t v12 = @"never";
  }
  else {
    uint64_t v12 = (__CFString *)objc_msgSend(v10, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_beganObservingTime));
  }
  [*(id *)(a1 + 32) appendFormat:@"Last lock_status notification: %@ (began observing %@)\n", v11, v12];
  uint64_t result = [(id)_observers count];
  if (result)
  {
    [*(id *)(a1 + 32) appendFormat:@"Observers:\n"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = (void *)[(id)_observers allValues];
    uint64_t result = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (result)
    {
      uint64_t v15 = result;
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v14);
          }
          unsigned int v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          uint64_t v19 = [v18 observer];
          long long v20 = [v18 queue];
          long long v21 = *(void **)(a1 + 32);
          long long v22 = (objc_class *)objc_opt_class();
          long long v23 = NSStringFromClass(v22);
          [v21 appendFormat:@"\t<%@:%p> (%s)\n", v23, v19, dispatch_queue_get_label(v20)];
          ++v17;
        }
        while (v15 != v17);
        uint64_t result = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v15 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t _KeyBagLockState()
{
  LODWORD(result) = MKBGetDeviceLockState();
  if (result >= 4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return result;
  }
}

__CFString *MFMessageDeliveryStatusString(unint64_t a1)
{
  if (a1 > 8) {
    return @"MessageDeliveryFatalError";
  }
  else {
    return off_1E68672B0[a1];
  }
}

void *_setUserInfoObjectForKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void **)(a1 + 40);
  if (a2)
  {
    if (!result)
    {
      uint64_t result = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
      *(void *)(a1 + 40) = result;
    }
    return (void *)[result setObject:a2 forKey:a3];
  }
  else if (result)
  {
    return objc_msgSend(result, "removeObjectForKey:");
  }
  return result;
}

uint64_t sanitizeStringForMarkup(void *a1)
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    2,
    0,
    [a1 length]);
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    2,
    0,
    [a1 length]);
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"  ", @"&nbsp; ",
    2,
    0,
    [a1 length]);
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"<BR>", 2, 0, v2);
}

void sub_1CFD46CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFD47ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MessageInfoComparator(_DWORD *a1, _DWORD *a2)
{
  unsigned int v2 = a1[8];
  unsigned int v3 = a2[8];
  if (v2 < v3) {
    return 1;
  }
  if (v2 > v3) {
    return -1;
  }
  unsigned int v4 = a1[7];
  unsigned int v5 = a2[7];
  if (v4 < v5) {
    return 1;
  }
  if (v4 > v5) {
    return -1;
  }
  unsigned int v7 = a1[5];
  unsigned int v8 = a2[5];
  BOOL v9 = v7 >= v8;
  if (v7 <= v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = -1;
  }
  if (v9) {
    return v10;
  }
  else {
    return 1;
  }
}

uint64_t MessageInfoSentDateComparator(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 12);
  unsigned int v3 = *(_DWORD *)(a2 + 12);
  unsigned int v4 = *(_DWORD *)(a1 + 20);
  unsigned int v5 = *(_DWORD *)(a2 + 20);
  BOOL v6 = v4 >= v5;
  if (v4 <= v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (!v6) {
    uint64_t v7 = 1;
  }
  BOOL v8 = v2 >= v3;
  if (v2 <= v3) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v8) {
    return v9;
  }
  else {
    return 1;
  }
}

uint64_t MFMessageInfoSentDateComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 dateSentInterval];
  unsigned int v6 = [a3 dateSentInterval];
  if (v5 < v6) {
    uint64_t result = -1;
  }
  else {
    uint64_t result = v5 > v6;
  }
  if (!result)
  {
    unsigned int v8 = [a2 uid];
    unsigned int v9 = [a3 uid];
    if (v8 < v9) {
      return -1;
    }
    else {
      return v8 > v9;
    }
  }
  return result;
}

uint64_t MFBeginDisallowingNetworkActivity()
{
  return _IncrementThreadLocalCounterForKey(@"_MFDisallowNetworkActivityAssertionKey");
}

uint64_t _IncrementThreadLocalCounterForKey(uint64_t a1)
{
  unsigned int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v3 = [v2 objectForKey:a1];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _IncrementThreadLocalCounterForKey_cold_2();
    }
    uint64_t v3 = [v4 unsignedIntegerValue];
    if (v3 == -1) {
      _IncrementThreadLocalCounterForKey_cold_1();
    }
  }
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:v3 + 1];
  return [v2 setObject:v5 forKey:a1];
}

uint64_t MFEndDisallowingNetworkActivity()
{
  return _DecrementThreadLocalCounterForKey(@"_MFDisallowNetworkActivityAssertionKey");
}

uint64_t _DecrementThreadLocalCounterForKey(uint64_t a1)
{
  unsigned int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  uint64_t v3 = [v2 objectForKey:a1];
  if (!v3) {
    goto LABEL_12;
  }
  unsigned int v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _DecrementThreadLocalCounterForKey_cold_2();
  }
  uint64_t v5 = [v4 unsignedIntegerValue];
  if (v5 == 1)
  {
    return [v2 removeObjectForKey:a1];
  }
  if (!v5) {
LABEL_12:
  }
    _DecrementThreadLocalCounterForKey_cold_1();
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5 - 1];
  return [v2 setObject:v7 forKey:a1];
}

uint64_t MFAssertNetworkActivityAllowed()
{
  if ([MEMORY[0x1E4F29060] isMainThread]
    && (_ThreadLocalAssertionForKey(@"_MFMainThreadNetworkingAllowedAssertionKey") & 1) == 0
    && ((EFIsSeedBuild() & 1) != 0
     || objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal")))
  {
    MFAssertNetworkActivityAllowed_cold_2();
  }
  uint64_t result = _ThreadLocalAssertionForKey(@"_MFDisallowNetworkActivityAssertionKey");
  if (result)
  {
    if ((EFIsSeedBuild() & 1) != 0
      || (uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal"), result))
    {
      MFAssertNetworkActivityAllowed_cold_1();
    }
  }
  return result;
}

uint64_t _ThreadLocalAssertionForKey(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary"), "objectForKey:", a1);
  if (result)
  {
    unsigned int v2 = (void *)result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _ThreadLocalAssertionForKey_cold_1();
    }
    return [v2 unsignedIntegerValue] != 0;
  }
  return result;
}

uint64_t _MFBeginAllowingMainThreadNetworking()
{
  return _IncrementThreadLocalCounterForKey(@"_MFMainThreadNetworkingAllowedAssertionKey");
}

uint64_t _MFEndAllowingMainThreadNetworking()
{
  return _DecrementThreadLocalCounterForKey(@"_MFMainThreadNetworkingAllowedAssertionKey");
}

uint64_t MFErrorCodeWithDataStatus(int a1)
{
  if ((a1 - 1) > 5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return dword_1CFD6F760[a1 - 1];
  }
}

uint64_t _NetworkReachabilityCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _setFlags:a2 forReachability:a1];
}

uint64_t _DynamicStoreCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _checkKeys:a2 forStore:a1];
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _handleWiFiNotification:a2];
}

BOOL _IsWiFiEnabled(const __SCPreferences *a1)
{
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"AllowEnable");
  if (Value && (CFTypeID TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(Value))) {
    BOOL v4 = CFBooleanGetValue(Value) != 0;
  }
  else {
    BOOL v4 = *MEMORY[0x1E4F1CFD0] == (void)Value;
  }
  SCPreferencesSynchronize(a1);
  return v4;
}

void sub_1CFD49CA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _powerChanged(uint64_t a1, uint64_t a2, uint64_t a3, intptr_t a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HIDWORD(v8) = a3;
    LODWORD(v8) = a3 + 536870288;
    unsigned int v7 = v8 >> 4;
    if (v7 < 0xC && ((0xA07u >> v7) & 1) != 0)
    {
      unsigned int v9 = off_1E68677A8[v7];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
      unsigned int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "power changed: %@", buf, 0xCu);
  }
  switch(a3)
  {
    case 0xE0000300:
      [(id)_observers_0 makeObjectsPerformSelector:sel_systemDidWake];
      return;
    case 0xE0000280:
      [(id)_observers_0 makeObjectsPerformSelector:sel_systemWillSleep];
      goto LABEL_13;
    case 0xE0000270:
LABEL_13:
      IOAllowPowerChange(__RootDomainConnect, a4);
      break;
  }
}

void MFRegisterPowerObserver(void *a1)
{
  id v1 = a1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __MFRegisterPowerObserver_block_invoke;
  v6[3] = &unk_1E68675C0;
  id v7 = v1;
  unsigned int v2 = v6;
  uint64_t v3 = (void *)MEMORY[0x1E4F60F28];
  id v4 = v1;
  uint64_t v5 = [v3 mainThreadScheduler];
  [v5 performBlock:v2];
}

uint64_t __MFRegisterPowerObserver_block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)_observers_0;
  if (!_observers_0)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = (void *)_observers_0;
    _observers_0 = (uint64_t)v3;

    unsigned int v2 = (void *)_observers_0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  return [v2 addObject:v5];
}

void MFUnregisterPowerObserver(void *a1)
{
  id v1 = a1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __MFUnregisterPowerObserver_block_invoke;
  v6[3] = &unk_1E68675C0;
  id v7 = v1;
  unsigned int v2 = v6;
  id v3 = (void *)MEMORY[0x1E4F60F28];
  id v4 = v1;
  uint64_t v5 = [v3 mainThreadScheduler];
  [v5 performBlock:v2];
}

uint64_t __MFUnregisterPowerObserver_block_invoke(uint64_t a1)
{
  return [(id)_observers_0 removeObject:*(void *)(a1 + 32)];
}

uint64_t initPLShouldLogRegisteredEvent(uint64_t a1, uint64_t a2)
{
  if (LoadPowerLog_loadPredicate != -1) {
    dispatch_once(&LoadPowerLog_loadPredicate, &__block_literal_global_209);
  }
  id v4 = (uint64_t (*)())dlsym((void *)LoadPowerLog_frameworkLibrary, "PLShouldLogRegisteredEvent");
  softLinkPLShouldLogRegisteredEvent = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void __LoadPowerLog_block_invoke()
{
  LoadPowerLog_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
  if (!LoadPowerLog_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_0.isa);
  }
}

uint64_t initPLLogRegisteredEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (LoadPowerLog_loadPredicate != -1) {
    dispatch_once(&LoadPowerLog_loadPredicate, &__block_literal_global_209);
  }
  unint64_t v8 = (uint64_t (*)())dlsym((void *)LoadPowerLog_frameworkLibrary, "PLLogRegisteredEvent");
  softLinkPLLogRegisteredEvent = v8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

MFError *checkCertificateExpiration(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  SecCertificateNotValidBefore();
  double v6 = v5;
  SecCertificateNotValidAfter();
  if (Current >= v6)
  {
    double v9 = v7;
    if (Current <= v7) {
      return 0;
    }
    unint64_t v8 = (MFError *)MFLookupLocalizedString(@"MF_SMIME_CERTIFICATE_EXPIRED_FORMAT", @"The certificate for the address “%@” expired on %@.", @"Delayed");
    double v6 = v9;
  }
  else
  {
    unint64_t v8 = (MFError *)MFLookupLocalizedString(@"MF_SMIME_CERTIFICATE_NOT_YET_VALID_FORMAT", @"The certificate for the address “%@” is not valid until %@.", @"Delayed");
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
  if (v8)
  {
    uint64_t v11 = v10;
    if (!v10) {
      checkCertificateExpiration_cold_1();
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v12 setDateStyle:3];
    [v12 setTimeStyle:3];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", v8, a2, objc_msgSend(v12, "stringFromDate:", v11));

    unint64_t v8 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v13];
    uint64_t v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      uint64_t v19 = a2;
      __int16 v20 = 2114;
      uint64_t v21 = [(MFError *)v8 ef_publicDescription];
      _os_log_impl(&dword_1CFCFE000, v14, OS_LOG_TYPE_INFO, "#SMIMEErrors Certificate %@ for address %@ is not currently valid: %{public}@", buf, 0x20u);
    }
  }
  return v8;
}

uint64_t MFHasAccountsEntitlement()
{
  if (MFHasAccountsEntitlement_once != -1) {
    dispatch_once(&MFHasAccountsEntitlement_once, &__block_literal_global_18);
  }
  return MFHasAccountsEntitlement___hasAccountsEntitlement;
}

void sub_1CFD50914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _releaseTopStackEntry(uint64_t a1)
{
  unsigned int v2 = (id **)_peekCommandStackEntry(a1);
  id v3 = v2;
  if (v2)
  {
    if ([**v2 isEqualToString:@"nofill"]) {
      *(_DWORD *)(a1 + 208) = *(_DWORD *)(a1 + 208) & 0xC0000000 | (*(_DWORD *)(a1 + 208) - 1) & 0x3FFFFFFF;
    }
    CFArrayRef v4 = *(const __CFArray **)(a1 + 224);
    CFIndex Count = CFArrayGetCount(v4);
    CFArrayRemoveValueAtIndex(v4, Count - 1);
    double v6 = v3[1];
    if (v6) {

    }
    free(v3);
  }
  return v3 != 0;
}

CFIndex _currentAttributeOfType(uint64_t a1, int a2)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(a1 + 224));
  if (result)
  {
    CFIndex v5 = result - 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 224), v5);
      if (((*(unsigned __int8 *)(*ValueAtIndex + 8) >> 3) & 3) == a2) {
        CFIndex result = ValueAtIndex[1];
      }
      else {
        CFIndex result = 0;
      }
      BOOL v7 = v5-- != 0;
    }
    while (v7 && !result);
  }
  return result;
}

CFStringRef _copyNextToken(uint64_t a1, CFCharacterSetRef theSet)
{
  CFIndex v5 = *(void *)(a1 + 192);
  CFIndex v4 = *(void *)(a1 + 200);
  if (v5 < v4)
  {
    uint64_t v6 = a1 + 8;
    if (v5 < 0 || (CFIndex v7 = *(void *)(a1 + 168), v7 <= v5))
    {
      UniChar v9 = 0;
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 144);
      if (v8)
      {
        UniChar v9 = *(_WORD *)(v8 + 2 * (*(void *)(a1 + 160) + v5));
      }
      else
      {
        uint64_t v28 = *(void *)(a1 + 152);
        if (v28)
        {
          UniChar v9 = *(char *)(v28 + *(void *)(a1 + 160) + v5);
        }
        else
        {
          if (*(void *)(a1 + 184) <= v5 || (CFIndex v30 = *(void *)(a1 + 176), v30 > v5))
          {
            CFIndex v31 = v5 - 4;
            if ((unint64_t)v5 < 4) {
              CFIndex v31 = 0;
            }
            if (v31 + 64 < v7) {
              CFIndex v7 = v31 + 64;
            }
            *(void *)(a1 + 176) = v31;
            *(void *)(a1 + 184) = v7;
            v36.location = *(void *)(a1 + 160) + v31;
            v36.length = v7 - v31;
            CFStringGetCharacters(*(CFStringRef *)(a1 + 136), v36, (UniChar *)(a1 + 8));
            CFIndex v30 = *(void *)(a1 + 176);
          }
          UniChar v9 = *(_WORD *)(v6 + 2 * (v5 - v30));
        }
      }
    }
    if (CFCharacterSetIsCharacterMember(theSet, v9))
    {
      if (v5 < 0 || (CFIndex v10 = *(void *)(a1 + 168), v10 <= v5))
      {
        UniChar v12 = 0;
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 144);
        if (v11)
        {
          UniChar v12 = *(_WORD *)(v11 + 2 * (*(void *)(a1 + 160) + v5));
        }
        else
        {
          uint64_t v29 = *(void *)(a1 + 152);
          if (v29)
          {
            UniChar v12 = *(char *)(v29 + *(void *)(a1 + 160) + v5);
          }
          else
          {
            if (*(void *)(a1 + 184) <= v5 || (CFIndex v32 = *(void *)(a1 + 176), v32 > v5))
            {
              CFIndex v33 = v5 - 4;
              if ((unint64_t)v5 < 4) {
                CFIndex v33 = 0;
              }
              if (v33 + 64 < v10) {
                CFIndex v10 = v33 + 64;
              }
              *(void *)(a1 + 176) = v33;
              *(void *)(a1 + 184) = v10;
              v37.location = *(void *)(a1 + 160) + v33;
              v37.length = v10 - v33;
              CFStringGetCharacters(*(CFStringRef *)(a1 + 136), v37, (UniChar *)(a1 + 8));
              CFIndex v32 = *(void *)(a1 + 176);
            }
            UniChar v12 = *(_WORD *)(v6 + 2 * (v5 - v32));
          }
        }
      }
      UniChar chars = v12;
      CFStringRef result = CFStringCreateWithCharacters(0, &chars, 1);
      ++v5;
      goto LABEL_43;
    }
    CFIndex v4 = *(void *)(a1 + 200);
  }
  if (v5 >= v4)
  {
    CFStringRef result = 0;
  }
  else
  {
    CFIndex v14 = -v5;
    CFIndex v15 = v5 + 64;
    int64_t v16 = v5;
    do
    {
      if ((unint64_t)v16 >= 4) {
        uint64_t v17 = 4;
      }
      else {
        uint64_t v17 = v16;
      }
      if (v16 < 0 || (int64_t v18 = *(void *)(a1 + 168), v18 <= v16))
      {
        UniChar v20 = 0;
      }
      else
      {
        uint64_t v19 = *(void *)(a1 + 144);
        if (v19)
        {
          UniChar v20 = *(_WORD *)(v19 + 2 * (v16 + *(void *)(a1 + 160)));
        }
        else
        {
          uint64_t v21 = *(void *)(a1 + 152);
          if (v21)
          {
            UniChar v20 = *(char *)(v21 + *(void *)(a1 + 160) + v16);
          }
          else
          {
            if (*(void *)(a1 + 184) <= v16 || (int64_t v22 = *(void *)(a1 + 176), v22 > v16))
            {
              uint64_t v23 = -v17;
              uint64_t v24 = v17 + v14;
              int64_t v25 = v15 - v17;
              int64_t v26 = v16 + v23;
              int64_t v27 = v26 + 64;
              if (v26 + 64 >= v18) {
                int64_t v27 = *(void *)(a1 + 168);
              }
              *(void *)(a1 + 176) = v26;
              *(void *)(a1 + 184) = v27;
              if (v18 >= v25) {
                int64_t v18 = v25;
              }
              v35.length = v18 + v24;
              v35.location = v26 + *(void *)(a1 + 160);
              CFStringGetCharacters(*(CFStringRef *)(a1 + 136), v35, (UniChar *)(a1 + 8));
              int64_t v22 = *(void *)(a1 + 176);
            }
            UniChar v20 = *(_WORD *)(a1 + 8 - 2 * v22 + 2 * v16);
          }
        }
      }
      if (CFCharacterSetIsCharacterMember(theSet, v20)) {
        break;
      }
      ++v16;
      --v14;
      ++v15;
    }
    while (v16 < *(void *)(a1 + 200));
    if (v16 <= v5)
    {
      CFStringRef result = 0;
    }
    else
    {
      v38.location = v5;
      v38.length = v16 - v5;
      CFStringRef result = CFStringCreateWithSubstring(0, *(CFStringRef *)(a1 + 136), v38);
    }
    CFIndex v5 = v16;
  }
LABEL_43:
  *(void *)(a1 + 192) = v5;
  return result;
}

const void *_peekCommandStackEntry(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 224));
  CFIndex v3 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  CFArrayRef v4 = *(const __CFArray **)(a1 + 224);
  return CFArrayGetValueAtIndex(v4, v3);
}

uint64_t MFMimeDataGetRangeOfHeader()
{
  return MEMORY[0x1F4117878]();
}

uint64_t MFMimeDataCreateStringFromHeaderBytes()
{
  return MEMORY[0x1F412C170]();
}

void _MFFlushCurrentInvocation()
{
  CFStringRef v0 = (const __CFString *)*MEMORY[0x1E4F1D418];
  if (CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E4F1D418], 0.0, 0) == kCFRunLoopRunTimedOut)
  {
    double Current = CFRunLoopGetCurrent();
    if (CFRunLoopGetNextTimerFireDate(Current, v0) > 1.17549435e-38)
    {
      double v2 = 0.001;
      do
      {
        if (CFRunLoopRunInMode(v0, v2, 0) != kCFRunLoopRunTimedOut) {
          break;
        }
        double v2 = v2 + v2;
        CFIndex v3 = CFRunLoopGetCurrent();
      }
      while (CFRunLoopGetNextTimerFireDate(v3, v0) > 1.17549435e-38 && v2 < 10.0);
    }
  }
}

void sub_1CFD54A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFD54C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFD560C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

__CFString *MFCreateStringByCondensingWhitespace(__CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)MFGetMappedAllocator();
  Mutable = CFStringCreateMutable(v2, 0);
  uint64_t v4 = [(__CFString *)a1 length];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v28 = 0u;
  CFRange v35 = a1;
  uint64_t v38 = 0;
  int64_t v39 = v4;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  CFRange v36 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  CFRange v37 = CStringPtr;
  int64_t v40 = 0;
  int64_t v41 = 0;
  if (v4)
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = 64;
    do
    {
      if ((unint64_t)v9 >= 4) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = v9;
      }
      UniChar chars = 0;
      if (v9 < 0 || (uint64_t v12 = v39, v39 <= v9))
      {
        BOOL v14 = 0;
      }
      else
      {
        if (v36)
        {
          UniChar v13 = v36[v9 + v38];
        }
        else if (v37)
        {
          UniChar v13 = v37[v38 + v9];
        }
        else
        {
          if (v41 <= v9 || (int64_t v15 = v40, v40 > v9))
          {
            uint64_t v16 = -v11;
            uint64_t v17 = v11 + v7;
            uint64_t v18 = v10 - v11;
            int64_t v19 = v9 + v16;
            int64_t v20 = v19 + 64;
            if (v19 + 64 >= v39) {
              int64_t v20 = v39;
            }
            int64_t v40 = v19;
            int64_t v41 = v20;
            if (v39 >= v18) {
              uint64_t v12 = v18;
            }
            v42.length = v12 + v17;
            v42.location = v19 + v38;
            CFStringGetCharacters(v35, v42, buffer);
            int64_t v15 = v40;
          }
          UniChar v13 = buffer[v9 - v15];
        }
        unsigned int v21 = v13;
        BOOL v14 = v13 == 13 || (unsigned __int16)(v13 - 9) < 2u || v13 == 32;
        UniChar chars = v13;
        uint64_t v23 = (1 << v13) & 0x100002600;
        if (v21 <= 0x20 && v23 != 0)
        {
          if (v9 != 0 && !v8) {
            CFStringAppend(Mutable, @" ");
          }
          goto LABEL_15;
        }
      }
      CFStringAppendCharacters(Mutable, &chars, 1);
LABEL_15:
      ++v9;
      --v7;
      ++v10;
      BOOL v8 = v14;
    }
    while (v4 != v9);
  }
  return Mutable;
}

id MFCopyResponseDataForURLRequest(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = objc_alloc_init(MFMessageURLConnectionDelegate);
  uint64_t v7 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  BOOL v8 = (void *)[MEMORY[0x1E4F18DC0] sessionWithConfiguration:v7 delegate:v6 delegateQueue:0];
  int64_t v9 = (void *)[v8 dataTaskWithRequest:a1];
  if (!v9) {
    return 0;
  }
  [v9 resume];
  id v10 = (id)[(EFFuture *)[(MFMessageURLConnectionDelegate *)v6 future] resultWithTimeout:a3 error:60.0];
  if (a2) {
    *a2 = [(MFMessageURLConnectionDelegate *)v6 response];
  }
  [v8 invalidateAndCancel];
  return v10;
}

void sub_1CFD59564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    id v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_DEFAULT, "#Warning Exception raised while processing requests: %@", (uint8_t *)&a9, 0xCu);
    }
    uint64_t v11 = NSGetUncaughtExceptionHandler();
    ((void (*)(id))v11)(v9);
    objc_end_catch();
    JUMPOUT(0x1CFD59538);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ExtractContentWithTag(uint64_t a1, int a2)
{
  int v3 = SecCmsMessageContentLevelCount();
  if (v3 < 1) {
    return 0;
  }
  int v4 = v3;
  int v5 = 0;
  while (1)
  {
    SecCmsMessageContentLevel();
    if (SecCmsContentInfoGetContentTypeTag() == a2)
    {
      uint64_t result = SecCmsContentInfoGetContent();
      if (result) {
        break;
      }
    }
    if (v4 == ++v5) {
      return 0;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_6_0(void **a1)
{
  CFAllocatorRef v2 = *a1;
  return objc_msgSend(v2, "ef_publicDescription");
}

void sub_1CFD5E0E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CFD5E458(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *_createParameterStringFromBytes(const UInt8 **a1, unint64_t a2)
{
  unint64_t v4 = (unint64_t)*a1;
  uint64_t v5 = MEMORY[0x1E4F14390];
  if ((unint64_t)*a1 < a2)
  {
    unint64_t v6 = a2 - v4;
    uint64_t v7 = (const UInt8 *)(v4 + 1);
    while (1)
    {
      unsigned int v8 = *((char *)v7 - 1);
      if ((v8 & 0x80000000) != 0)
      {
        if (!__maskrune(v8, 0x4000uLL))
        {
LABEL_9:
          unint64_t v4 = (unint64_t)*a1;
          break;
        }
      }
      else if ((*(_DWORD *)(v5 + 4 * v8 + 60) & 0x4000) == 0)
      {
        goto LABEL_9;
      }
      *a1 = v7++;
      if (!--v6)
      {
        unint64_t v4 = a2;
        break;
      }
    }
  }
  uint64_t v9 = (const UInt8 *)(v4 + 1);
  if (v4 + 1 >= a2)
  {
    BOOL v10 = 0;
    uint64_t v9 = (const UInt8 *)a2;
  }
  else
  {
    BOOL v10 = 0;
    unint64_t v11 = ~v4 + a2;
    do
    {
      unsigned int v12 = *(char *)v9;
      if ((v12 & 0x80000000) != 0)
      {
        if (__maskrune(*(char *)v9, 0x4000uLL)) {
          goto LABEL_24;
        }
      }
      else if ((*(_DWORD *)(v5 + 4 * v12 + 60) & 0x4000) != 0)
      {
        goto LABEL_24;
      }
      if (v10)
      {
        BOOL v10 = 1;
      }
      else
      {
        if ((v12 & 0x80000000) != 0) {
          int v13 = __maskrune(v12, 0x1000uLL);
        }
        else {
          int v13 = *(_DWORD *)(v5 + 4 * v12 + 60) & 0x1000;
        }
        BOOL v10 = v13 != 0;
      }
      ++v9;
      --v11;
    }
    while (v11);
    uint64_t v9 = (const UInt8 *)a2;
LABEL_24:
    unint64_t v4 = (unint64_t)*a1;
  }
  if (v4 >= (unint64_t)v9)
  {
    int64_t v15 = 0;
  }
  else
  {
    CFStringRef v14 = CFStringCreateWithBytes(0, (const UInt8 *)v4, (CFIndex)&v9[-v4], 0x600u, 0);
    int64_t v15 = (__CFString *)v14;
    if (v14 != 0 && v10)
    {
      CFIndex Length = CFStringGetLength(v14);
      CGMutableImageMetadataRef MutableCopy = CFStringCreateMutableCopy(0, Length, v15);
      CFStringUppercase(MutableCopy, 0);

      int64_t v15 = MutableCopy;
    }
  }
  if ((unint64_t)(v9 + 1) < a2) {
    uint64_t v18 = v9 + 1;
  }
  else {
    uint64_t v18 = (const UInt8 *)a2;
  }
  *a1 = v18;
  return v15;
}

__CFString *MFSMTPFailureReasonString(unsigned int a1)
{
  if (a1 > 7) {
    return @"SMTPFailureReasonUnknown";
  }
  else {
    return off_1E6867CE0[a1];
  }
}

uint64_t MFCreateURLForContentID(__CFString *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [(__CFString *)a1 rangeOfString:@"<"];
  uint64_t v4 = v3;
  unint64_t v5 = [(__CFString *)a1 rangeOfString:@">"];
  BOOL v6 = v2 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0x7FFFFFFFFFFFFFFFLL;
  v7.location = v2 + v4;
  if (!v6 && v5 > v7.location)
  {
    v7.length = v5 - v7.location;
    uint64_t v9 = (__CFString *)CFStringCreateWithSubstring(0, a1, v7);
  }
  else
  {
    uint64_t v9 = a1;
  }
  unint64_t v11 = v9;
  uint64_t v12 = -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v9, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet"));
  if (v12)
  {
    uint64_t v13 = [@"cid" stringByAppendingFormat:@":%@", v12];
    uint64_t v10 = [objc_allocWithZone(MEMORY[0x1E4F1CB10]) initWithString:v13];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t _SortWebAttachmentSources()
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v1 = isKindOfClass ^ objc_opt_isKindOfClass();
  uint64_t v2 = -1;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v2 = 1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

void _configureMailboxCache_cold_1()
{
}

void _MFFlagsBySettingValueForKey_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_DEBUG, "Unexpected flag key \"%@\"", (uint8_t *)&v2, 0xCu);
}

void MFRegisterContentProtectionObserver_cold_1()
{
  __assert_rtn("MFRegisterContentProtectionObserver", "MFContentProtectionObserver.m", 186, "nil != observer");
}

void MFRegisterContentProtectionObserver_cold_2()
{
  __assert_rtn("MFRegisterContentProtectionObserver", "MFContentProtectionObserver.m", 187, "NULL != queue");
}

void MFRegisterContentProtectionObserver_cold_3()
{
  __assert_rtn("MFRegisterContentProtectionObserver", "MFContentProtectionObserver.m", 188, "_observationQueue != queue");
}

void MFUnregisterContentProtectionObserver_cold_1()
{
  __assert_rtn("MFUnregisterContentProtectionObserver", "MFContentProtectionObserver.m", 208, "nil != observer");
}

void _NotifyObserversWithContentProtectionState_cold_1()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "MFContentProtectionObserver.m", 79, "kMFContentProtectionStateInvalid != state");
}

void _NotifyObserversWithContentProtectionState_cold_2()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "MFContentProtectionObserver.m", 80, "kMFContentProtectionStateInvalid != _contentProtectionState");
}

void _IncrementThreadLocalCounterForKey_cold_1()
{
}

void _IncrementThreadLocalCounterForKey_cold_2()
{
}

void _DecrementThreadLocalCounterForKey_cold_1()
{
}

void _DecrementThreadLocalCounterForKey_cold_2()
{
}

void MFAssertNetworkActivityAllowed_cold_1()
{
}

void MFAssertNetworkActivityAllowed_cold_2()
{
}

void _ThreadLocalAssertionForKey_cold_1()
{
}

void checkCertificateExpiration_cold_1()
{
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

void CFArrayExchangeValuesAtIndices(CFMutableArrayRef theArray, CFIndex idx1, CFIndex idx2)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFRunLoopMode mode)
{
  MEMORY[0x1F40D80C8](rl, mode);
  return result;
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D83A0](*(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1F40E9728](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97D0](metadata);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x1F40E9818](metadata, parent, path);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9838](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1F40E9848](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1F40E9918](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x1F41093B8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x1F40DEF58]();
}

uint64_t EFFrameworkVersion()
{
  return MEMORY[0x1F4117AB8]();
}

uint64_t EFIsSeedBuild()
{
  return MEMORY[0x1F4117AD0]();
}

uint64_t EFProductName()
{
  return MEMORY[0x1F4117B10]();
}

uint64_t EFStringWithInt()
{
  return MEMORY[0x1F4117B48]();
}

uint64_t EFStringWithUnsignedInteger()
{
  return MEMORY[0x1F4117B60]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

uint64_t MFCharsetForEncoding()
{
  return MEMORY[0x1F412C0A0]();
}

uint64_t MFCreateDataWithString()
{
  return MEMORY[0x1F412C0A8]();
}

uint64_t MFCreateStringWithData()
{
  return MEMORY[0x1F412C0B8]();
}

uint64_t MFDataConsumerConsumeCompleteData()
{
  return MEMORY[0x1F412C0C8]();
}

uint64_t MFGetMappedAllocator()
{
  return MEMORY[0x1F412C0D8]();
}

uint64_t MFGetRandomBytes()
{
  return MEMORY[0x1F412C0E0]();
}

uint64_t MFGetTypeInfo()
{
  return MEMORY[0x1F412C0E8]();
}

uint64_t MFGuessEncodingForBytes()
{
  return MEMORY[0x1F412C0F0]();
}

uint64_t MFIsMobileMail()
{
  return MEMORY[0x1F412EFB0]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1F412EFB8]();
}

uint64_t MFLogNetwork()
{
  return MEMORY[0x1F412EFC0]();
}

uint64_t MFMimePartParseContentDispositionHeader()
{
  return MEMORY[0x1F412C100]();
}

uint64_t MFMimePartParseContentTypeHeader()
{
  return MEMORY[0x1F412C108]();
}

uint64_t MFMimePartSetValueForPreservedHeader()
{
  return MEMORY[0x1F412C110]();
}

uint64_t MFMobileMailContainerPath()
{
  return MEMORY[0x1F412EFD8]();
}

uint64_t MFMobileMailPreferenceDomain()
{
  return MEMORY[0x1F412EFE0]();
}

uint64_t MFRemoveItemAtPath()
{
  return MEMORY[0x1F412C118]();
}

uint64_t MFStringCanBeConvertedLosslessly()
{
  return MEMORY[0x1F412C128]();
}

uint64_t MFStringGetBytes()
{
  return MEMORY[0x1F412C130]();
}

uint64_t MFStringHashForMessageIDHeader()
{
  return MEMORY[0x1F412C140]();
}

uint64_t MF_MD5HMAC_Init()
{
  return MEMORY[0x1F412C150]();
}

uint64_t MF_MD5HMAC_InputBytes()
{
  return MEMORY[0x1F412C158]();
}

uint64_t MF_MD5HMAC_Output()
{
  return MEMORY[0x1F412C160]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t NSBOOLFromString()
{
  return MEMORY[0x1F40E7000]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSUncaughtExceptionHandler *NSGetUncaughtExceptionHandler(void)
{
  return (NSUncaughtExceptionHandler *)MEMORY[0x1F40E70E0]();
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1F40E72F8](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7310](zone, size);
}

uint64_t NtlmCreateClientRequest()
{
  return MEMORY[0x1F40F67F8]();
}

uint64_t NtlmCreateClientResponse()
{
  return MEMORY[0x1F40F6800]();
}

uint64_t NtlmGeneratorCreate()
{
  return MEMORY[0x1F40F6810]();
}

uint64_t NtlmGeneratorRelease()
{
  return MEMORY[0x1F40F6818]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F4101DB8](allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F18](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F30](target, runLoop, runLoopMode);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4102010](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102028](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1F4102030](prefs, callout, context);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102070](prefs, runLoop, runLoopMode);
}

OSStatus SSLGetNegotiatedProtocolVersion(SSLContextRef context, SSLProtocol *protocol)
{
  return MEMORY[0x1F40F6900](context, protocol);
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x1F40F6AC0]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1F40F6B30]();
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1F40F6B38]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1F40F6B98]();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x1F40F6BA8]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1F40F6BD8]();
}

uint64_t SecCmsContentInfoGetContent()
{
  return MEMORY[0x1F40F6BE0]();
}

uint64_t SecCmsContentInfoGetContentTypeTag()
{
  return MEMORY[0x1F40F6BE8]();
}

uint64_t SecCmsContentInfoGetInnerContent()
{
  return MEMORY[0x1F40F6BF0]();
}

uint64_t SecCmsContentInfoSetContentData()
{
  return MEMORY[0x1F40F6BF8]();
}

uint64_t SecCmsContentInfoSetContentEnvelopedData()
{
  return MEMORY[0x1F40F6C00]();
}

uint64_t SecCmsContentInfoSetContentSignedData()
{
  return MEMORY[0x1F40F6C08]();
}

uint64_t SecCmsDecoderCreate()
{
  return MEMORY[0x1F40F6C10]();
}

uint64_t SecCmsDecoderDestroy()
{
  return MEMORY[0x1F40F6C18]();
}

uint64_t SecCmsDecoderFinish()
{
  return MEMORY[0x1F40F6C20]();
}

uint64_t SecCmsDecoderUpdate()
{
  return MEMORY[0x1F40F6C28]();
}

uint64_t SecCmsDigestContextDestroy()
{
  return MEMORY[0x1F40F6C30]();
}

uint64_t SecCmsDigestContextStartMultiple()
{
  return MEMORY[0x1F40F6C38]();
}

uint64_t SecCmsDigestContextUpdate()
{
  return MEMORY[0x1F40F6C40]();
}

uint64_t SecCmsEncoderDestroy()
{
  return MEMORY[0x1F40F6C48]();
}

uint64_t SecCmsEncoderFinish()
{
  return MEMORY[0x1F40F6C50]();
}

uint64_t SecCmsEnvelopedDataCreate()
{
  return MEMORY[0x1F40F6C58]();
}

uint64_t SecCmsEnvelopedDataGetContentInfo()
{
  return MEMORY[0x1F40F6C60]();
}

uint64_t SecCmsMessageContentLevel()
{
  return MEMORY[0x1F40F6C68]();
}

uint64_t SecCmsMessageContentLevelCount()
{
  return MEMORY[0x1F40F6C70]();
}

uint64_t SecCmsMessageCreate()
{
  return MEMORY[0x1F40F6C78]();
}

uint64_t SecCmsMessageDestroy()
{
  return MEMORY[0x1F40F6C80]();
}

uint64_t SecCmsMessageEncode()
{
  return MEMORY[0x1F40F6C88]();
}

uint64_t SecCmsMessageGetContentInfo()
{
  return MEMORY[0x1F40F6C98]();
}

uint64_t SecCmsMessageIsEncrypted()
{
  return MEMORY[0x1F40F6CA0]();
}

uint64_t SecCmsRecipientInfoCreate()
{
  return MEMORY[0x1F40F6CA8]();
}

uint64_t SecCmsSignedDataAddCertChain()
{
  return MEMORY[0x1F40F6CB0]();
}

uint64_t SecCmsSignedDataCreate()
{
  return MEMORY[0x1F40F6CB8]();
}

uint64_t SecCmsSignedDataGetContentInfo()
{
  return MEMORY[0x1F40F6CC8]();
}

uint64_t SecCmsSignedDataGetDigestAlgs()
{
  return MEMORY[0x1F40F6CD0]();
}

uint64_t SecCmsSignedDataGetSignerInfo()
{
  return MEMORY[0x1F40F6CD8]();
}

uint64_t SecCmsSignedDataHasDigests()
{
  return MEMORY[0x1F40F6CE0]();
}

uint64_t SecCmsSignedDataSetDigestContext()
{
  return MEMORY[0x1F40F6CE8]();
}

uint64_t SecCmsSignedDataSignerInfoCount()
{
  return MEMORY[0x1F40F6CF0]();
}

uint64_t SecCmsSignedDataVerifySignerInfo()
{
  return MEMORY[0x1F40F6CF8]();
}

uint64_t SecCmsSignerInfoAddMSSMIMEEncKeyPrefs()
{
  return MEMORY[0x1F40F6D00]();
}

uint64_t SecCmsSignerInfoAddSMIMEEncKeyPrefs()
{
  return MEMORY[0x1F40F6D08]();
}

uint64_t SecCmsSignerInfoAddSigningTime()
{
  return MEMORY[0x1F40F6D10]();
}

uint64_t SecCmsSignerInfoCopyCertFromEncryptionKeyPreference()
{
  return MEMORY[0x1F40F6D18]();
}

uint64_t SecCmsSignerInfoCreate()
{
  return MEMORY[0x1F40F6D20]();
}

uint64_t SecCmsSignerInfoGetSignerEmailAddress()
{
  return MEMORY[0x1F40F6D28]();
}

uint64_t SecCmsSignerInfoGetVerificationStatus()
{
  return MEMORY[0x1F40F6D30]();
}

uint64_t SecCmsSignerInfoIncludeCerts()
{
  return MEMORY[0x1F40F6D38]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1F40F6DD0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1F40F7078](revocationFlags);
}

uint64_t SecPolicyCreateSMIME()
{
  return MEMORY[0x1F40F7080]();
}

uint64_t SecSMIMEFindBulkAlgForRecipients()
{
  return MEMORY[0x1F40F7108]();
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

OSStatus SecTrustCopyPolicies(SecTrustRef trust, CFArrayRef *policies)
{
  return MEMORY[0x1F40F71C0](trust, policies);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F71F0](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1F40F7220](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1F40DEE78](inUTI);
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x1F412FED8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1F40D8FD0]();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return MEMORY[0x1F40D8FD8]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CTServerConnectionAddToRunLoop()
{
  return MEMORY[0x1F40DEFF0]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0E0]();
}

uint64_t _CTServerConnectionPacketContextAssertionCreate()
{
  return MEMORY[0x1F40DF1C0]();
}

uint64_t _MFCopyDecodeText()
{
  return MEMORY[0x1F412C168]();
}

uint64_t _MFDecodeText()
{
  return MEMORY[0x1F412C178]();
}

uint64_t _MFLockGlobalLock()
{
  return MEMORY[0x1F412C180]();
}

uint64_t _MFOffsetFromThreadDictionary()
{
  return MEMORY[0x1F412C188]();
}

uint64_t _MFUnlockGlobalLock()
{
  return MEMORY[0x1F412C198]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
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

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1F40CA578](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  return (servent *)MEMORY[0x1F40CC540](a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC558](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40CC560](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

void objc_exception_rethrow(void)
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x1F40CD9F8](__pthread, __qos_class, __relative_priority);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  return MEMORY[0x1F40CDAD0](__override);
}

pthread_override_t pthread_override_qos_class_start_np(pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  return (pthread_override_t)MEMORY[0x1F40CDAD8](__pthread, *(void *)&__qos_class, *(void *)&__relative_priority);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1F40CDB48](*(void *)&__qos_class, *(void *)&__relative_priority);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F760](*(void *)&c, *(void *)&which);
}

uint64_t ubrk_close()
{
  return MEMORY[0x1F417FA30]();
}

uint64_t ubrk_following()
{
  return MEMORY[0x1F417FA50]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1F417FA80]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1F417FA88]();
}