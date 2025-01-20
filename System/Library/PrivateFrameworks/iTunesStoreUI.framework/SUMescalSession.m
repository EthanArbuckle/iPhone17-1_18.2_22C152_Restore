@interface SUMescalSession
- (BOOL)isComplete;
- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4;
- (SUMescalSession)init;
- (id)_newDataWithBytes:(char *)a3 length:(unsigned int)a4;
- (id)exchangeData:(id)a3 error:(id *)a4;
- (id)primeForAccountCreationWithData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (void)_teardownSession;
- (void)dealloc;
@end

@implementation SUMescalSession

- (SUMescalSession)init
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)SUMescalSession;
  v2 = [(SUMescalSession *)&v22 init];
  if (v2)
  {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.SUMescalSession.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);

    uint64_t v4 = MGCopyAnswer();
    if (v4)
    {
      CFStringRef v5 = (const __CFString *)v4;
      CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v5, SystemEncoding, 0);
      if (ExternalRepresentation)
      {
        CFDataRef v8 = ExternalRepresentation;
        BytePtr = CFDataGetBytePtr(ExternalRepresentation);
        CFIndex Length = CFDataGetLength(v8);
        zxcm2Qme0x((uint64_t)BytePtr, Length, (uint64_t)&v2->_hardwareInfo);
        CFRelease(v8);
      }
      else
      {
        zxcm2Qme0x(0, 0, (uint64_t)&v2->_hardwareInfo);
      }
      CFRelease(v5);
    }
    cp2g1b9ro((uint64_t)&v2->_session, (uint64_t)&v2->_hardwareInfo);
    if (v11)
    {
      cp2g1b9ro((uint64_t)&v2->_session, (uint64_t)&v2->_hardwareInfo);
      if (v12)
      {
        int v13 = v12;
        v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v15 = [v14 shouldLog];
        if ([v14 shouldLogToDisk]) {
          int v16 = v15 | 2;
        }
        else {
          int v16 = v15;
        }
        if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v16 &= 2u;
        }
        if (v16)
        {
          uint64_t v17 = objc_opt_class();
          int v23 = 138412546;
          uint64_t v24 = v17;
          __int16 v25 = 2048;
          uint64_t v26 = v13;
          LODWORD(v21) = 22;
          uint64_t v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v23, v21);
            free(v19);
            SSFileLog();
          }
        }

        return 0;
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  session = self->_session;
  if (session)
  {
    IPaI1oem5iL((uint64_t)session);
    self->_session = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)SUMescalSession;
  [(SUMescalSession *)&v5 dealloc];
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__53;
  objc_super v22 = __Block_byref_object_dispose__53;
  uint64_t v23 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3052000000;
  int v15 = __Block_byref_object_copy__53;
  int v16 = __Block_byref_object_dispose__53;
  uint64_t v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__SUMescalSession_exchangeData_error___block_invoke;
  v11[3] = &unk_264815198;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  id v6 = (id)v13[5];
  v7 = v19;
  CFDataRef v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id)v13[5];
    CFDataRef v8 = (void *)v7[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __38__SUMescalSession_exchangeData_error___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  if (v3)
  {
    uint64_t v18 = 0;
    unsigned int v17 = 0;
    char v16 = -1;
    Mib5yocT(210, v2 + 20, v3, [*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
    if (v4)
    {
      LODWORD(v5) = v4;
      id v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        int v9 = v8;
      }
      else {
        int v9 = v8 & 2;
      }
      if (v9)
      {
        uint64_t v5 = (int)v5;
        int v19 = 134217984;
        uint64_t v20 = (int)v5;
        LODWORD(v15) = 12;
        uint64_t v14 = &v19;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          int v11 = (void *)v10;
          uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v19, v15);
          free(v11);
          uint64_t v14 = (int *)v12;
          SSFileLog();
        }
      }
      else
      {
        uint64_t v5 = (int)v5;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SUFairPlayErrorDomain", v5, 0, v14);
      [*(id *)(a1 + 32) _teardownSession];
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _newDataWithBytes:v18 length:v17];
      *(unsigned char *)(*(void *)(a1 + 32) + 16) = v16 == 0;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:15 userInfo:0];
  }
  return *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
}

- (BOOL)isComplete
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__SUMescalSession_isComplete__block_invoke;
  v5[3] = &unk_264812E70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__SUMescalSession_isComplete__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (id)primeForAccountCreationWithData:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__53;
  objc_super v22 = __Block_byref_object_dispose__53;
  uint64_t v23 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__53;
  char v16 = __Block_byref_object_dispose__53;
  uint64_t v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__SUMescalSession_primeForAccountCreationWithData_error___block_invoke;
  v11[3] = &unk_264815198;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  id v6 = (id)v13[5];
  int v7 = v19;
  uint64_t v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id)v13[5];
    uint64_t v8 = (void *)v7[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __57__SUMescalSession_primeForAccountCreationWithData_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    int v13 = (__CFString *)*MEMORY[0x263F7B758];
    uint64_t v14 = 15;
LABEL_15:
    uint64_t v15 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, 0, v18);
    uint64_t v16 = *(void *)(a1 + 48);
    goto LABEL_16;
  }
  uint64_t v21 = 0;
  unsigned int v20 = 0;
  jfkdDAjba3jd(v2, 100, [*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"), &v21, &v20);
  if (v3)
  {
    LODWORD(v4) = v3;
    uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v4 = (int)v4;
      int v22 = 138412546;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = (int)v4;
      LODWORD(v19) = 22;
      uint64_t v18 = &v22;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v22, v19);
        free(v10);
        uint64_t v18 = (int *)v11;
        SSFileLog();
      }
    }
    else
    {
      uint64_t v4 = (int)v4;
    }
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    int v13 = @"SUFairPlayErrorDomain";
    uint64_t v14 = v4;
    goto LABEL_15;
  }
  uint64_t v15 = [*(id *)(a1 + 32) _newDataWithBytes:v21 length:v20];
  uint64_t v16 = *(void *)(a1 + 56);
LABEL_16:
  *(void *)(*(void *)(v16 + 8) + 40) = v15;
  return *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__53;
  int v22 = __Block_byref_object_dispose__53;
  uint64_t v23 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__53;
  uint64_t v16 = __Block_byref_object_dispose__53;
  uint64_t v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__SUMescalSession_signData_error___block_invoke;
  v11[3] = &unk_264815198;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  id v6 = (id)v13[5];
  int v7 = v19;
  uint64_t v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id)v13[5];
    uint64_t v8 = (void *)v7[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __34__SUMescalSession_signData_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:15 userInfo:0];
    uint64_t v13 = *(void *)(a1 + 48);
LABEL_13:
    *(void *)(*(void *)(v13 + 8) + 40) = v12;
    return *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  uint64_t v18 = 0;
  unsigned int v17 = 0;
  Fc3vhtJDvr(v2, [*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)&v18, (uint64_t)&v17);
  if (!v3)
  {
    uint64_t v12 = [*(id *)(a1 + 32) _newDataWithBytes:v18 length:v17];
    uint64_t v13 = *(void *)(a1 + 56);
    goto LABEL_13;
  }
  LODWORD(v4) = v3;
  uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v4 = (int)v4;
    int v19 = 138412546;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = (int)v4;
    LODWORD(v16) = 22;
    uint64_t v15 = &v19;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v19, v16);
      free(v10);
      uint64_t v15 = (int *)v11;
      SSFileLog();
    }
  }
  else
  {
    uint64_t v4 = (int)v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SUFairPlayErrorDomain", v4, 0, v15);
  [*(id *)(a1 + 32) _teardownSession];
  return *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__53;
  uint64_t v16 = __Block_byref_object_dispose__53;
  uint64_t v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__SUMescalSession_verifyPrimeSignature_error___block_invoke;
  v11[3] = &unk_264815198;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  id v6 = (id)v13[5];
  int v7 = v19;
  int v8 = *((unsigned __int8 *)v19 + 24);
  if (a4 && !*((unsigned char *)v19 + 24))
  {
    *a4 = (id)v13[5];
    int v8 = *((unsigned __int8 *)v7 + 24);
  }
  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __46__SUMescalSession_verifyPrimeSignature_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    [*(id *)(a1 + 40) bytes];
    [*(id *)(a1 + 40) length];
    gLg1CWr7p();
    if (v2)
    {
      LODWORD(v3) = v2;
      uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v5 = [v4 shouldLog];
      if ([v4 shouldLogToDisk]) {
        int v6 = v5 | 2;
      }
      else {
        int v6 = v5;
      }
      if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v6 &= 2u;
      }
      if (v6)
      {
        uint64_t v3 = (int)v3;
        int v13 = 138412546;
        uint64_t v14 = objc_opt_class();
        __int16 v15 = 2048;
        uint64_t v16 = (int)v3;
        LODWORD(v12) = 22;
        uint64_t v11 = &v13;
        uint64_t v7 = _os_log_send_and_compose_impl();
        if (v7)
        {
          int v8 = (void *)v7;
          uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v13, v12);
          free(v8);
          uint64_t v11 = (int *)v9;
          SSFileLog();
        }
      }
      else
      {
        uint64_t v3 = (int)v3;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SUFairPlayErrorDomain", v3, 0, v11);
      [*(id *)(a1 + 32) _teardownSession];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:15 userInfo:0];
  }
  return *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
}

- (id)_newDataWithBytes:(char *)a3 length:(unsigned int)a4
{
  CFAllocatorContext v9 = *(CFAllocatorContext *)byte_26DB861B8;
  CFAllocatorRef v6 = CFAllocatorCreate(0, &v9);
  CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)a3, a4, v6);
  CFRelease(v6);
  return v7;
}

- (void)_teardownSession
{
  session = self->_session;
  if (session)
  {
    IPaI1oem5iL((uint64_t)session);
    self->_session = 0;
  }
  self->_complete = 0;
}

@end